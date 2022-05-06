require("firecast.lua");
require("ndb.lua");
require("utils.lua");
require("locale.lua");

globalMacrosInvalido = true;

local macrosPreparado = {};
local _mesasAnexadas = {};  -- macros de mesa (NDB de mesa).. o indice é o objeto mesa
setmetatable(_mesasAnexadas, {__mode="k"});

function globalPrepareMacroName(name)
	if type(name) == "string" then
		return string.gsub(name, "([ /.]+)", "");		
	else
		return name;
	end;
end;

function globalPrepareMacroNameForFind(name)
	return string.upper(Utils.removerAcentos(name));
end;

local function prepareNodeDeMacrosEm(nodoDeMacros, nodoDestino)
	local macrosInNDB = NDB.getChildNodes(nodoDeMacros);
	
	for i = 1, #macrosInNDB, 1 do
		local macroNode = macrosInNDB[i];
		local macroName = globalPrepareMacroNameForFind(globalPrepareMacroName(macroNode.macro));		
		
		if type(macroName) == "string" and macroName ~= "" then
			local macroPreparado = {};
			macroPreparado.macro = macroName;
			macroPreparado.acoes = macroNode.acoes or "";
			macroPreparado.tipoMacro = macroNode.tipoMacro or "S";
			nodoDestino[macroName] = macroPreparado;
		end;
	end;
end;

local function prepararMacrosParaUso()
	globalMacrosInvalido = false;
	
	macrosPreparado = {};
	macrosPreparado.global = {};
	macrosPreparado.mesas = {};
	
	if globalSimpleMacrosNDB.global ~= nil then
		if globalSimpleMacrosNDB.global.macros ~= nil then
			prepareNodeDeMacrosEm(globalSimpleMacrosNDB.global.macros, macrosPreparado.global);
		end;
	end;
	
	if globalSimpleMacrosNDB.mesas ~= nil then	
		local nodosDeMesas = NDB.getChildNodes(globalSimpleMacrosNDB.mesas);
		
		for i = 1, #nodosDeMesas, 1 do
			local nodoDaMesa = nodosDeMesas[i];
			
			if nodoDaMesa.macros ~= nil then
				local macrosPreparadosDeUmaMesa = {};
				prepareNodeDeMacrosEm(nodoDaMesa.macros, macrosPreparadosDeUmaMesa);
				macrosPreparado.mesas[NDB.getNodeName(nodoDaMesa)] = macrosPreparadosDeUmaMesa;
			end;	
		end;
	end;
end;

-- MACROS armazenados no servidor RRPG, refente à mesa

local function anexarMacrosAMesa(mesa)	
	local o = {};
	o.invalid = true;
		
	mesa:abrirNDBDeMesa("RRPG_Macros",
		function(n)
			if n ~= nil then
				-- Abriu!
				o.node = n;
				o.invalid = true;
								
				local obs = NDB.newObserver(n);				
				o.observer = obs;
							
				obs.onDeepChildAdded = function(x)
					o.invalid = true;
				end;
				
				obs.onDeepChildRemoved = function(x)
					o.invalid = true;
				end;
				
				obs.onDeepChanged = function(node, attr, oldV)									
					o.invalid = true;
				end;
				
				obs.onStateChanged = function ()
					o.invalid = true;
				end;
			end;
		end, {criar=true});
	
	function o:needPrepared()
		if o.invalid then						
			if o.node ~= nil and o.node.macros ~= nil then
				local macrosPreparados = {};
				prepareNodeDeMacrosEm(o.node.macros, macrosPreparados);
				o.macrosPreparados = macrosPreparados;				
				o.invalid = false;
			end;			
		end;
	end;
	
	function o:acharMacro(comando)
		o:needPrepared();
		
		if o.macrosPreparados ~= nil then
			return o.macrosPreparados[comando];
		else
			return nil;
		end;
	end;
	
	_mesasAnexadas[mesa] = o;
end;

function globalFindMacro(comando, mesa)
	if globalMacrosInvalido then
		prepararMacrosParaUso();
	end;
	
	comando = globalPrepareMacroNameForFind(comando or "");
	
	local macroAchado;

	if mesa ~= nil then	
		local codigoAsStr = tostring(mesa.codigoInterno);
		
		if codigoAsStr ~= nil then
			local macrosDaMesa = macrosPreparado.mesas[codigoAsStr];
			
			if macrosDaMesa ~= nil then		
				macroAchado = macrosDaMesa[comando];
				
				if macroAchado ~= nil then
					return macroAchado;
				end;
			end;
		end;
	end;
		
	macroAchado = macrosPreparado.global[comando];
	
	if macroAchado == nil and mesa ~= nil then
		-- Pesquisar nas macros para todos da mesa.
		local oM = _mesasAnexadas[mesa];
		
		if oM == nil and mesa.podeTablesDock then
			anexarMacrosAMesa(mesa);	
			oM = _mesasAnexadas[mesa];
		end;
			
		if oM ~= nil then
			macroAchado = oM:acharMacro(comando);
			
			if macroAchado ~= nil then
				return macroAchado;
			end;
		end;
	end;
	
	return macroAchado;	
end;

local executingMacros = {};

local function realExecutarMacro(macro, message, endCallback)
	
	if macro.tipoMacro == "L" then
		local macros = require("/macros/rrpgMacros.dlua");
		local macroBootstrap = macros.compileMacro(macro.acoes, message.chat, macro.macro, endCallback)
		macroBootstrap({parametro=message.parameter or message.parametro});		
	else
		for linha in string.gmatch(macro.acoes, "[^\n\r]+") do
			-- Quebrar a acoes em linhas.
			
			if type(linha) == "string" and linha ~= "" and message.chat ~= nil then				
				message.chat:enviarMensagem(linha);
			end;	
		end;
			
		if endCallback ~= nil then
			endCallback();
		end;
	end;
end;

function globalExecutarMacro(macro, message, endCallback)
	if message == nil then
		message = {};
	end;
	
	local macroIdentifier = macro.macro;

	if executingMacros[macroIdentifier] ~= nil then
		error(string.format("Macro \"%s\" is already executing", macroIdentifier));
		return;
	end;

	-- evitar dependencia circular de macros..
	executingMacros[macroIdentifier] = true;	
	
	retorno, msg = pcall(realExecutarMacro, macro, message, 
						 function(...)
							executingMacros[macroIdentifier] = nil;	
						 
							if endCallback ~= nil then
								endCallback(...)
							end;
						 end);
	
	executingMacros[macroIdentifier] = nil;	

	if not retorno then
		reraise(msg);
	end	
end;

function globalGerenciarMacros(mesa)
	if globalSimpleMacrosNDB == nil then
		globalSimpleMacrosNDB = NDB.load("simpleMacros.xml");
	end;	
	
	local frm = GUI.newForm("frmGerenciarSimpleMacros");
	frm._mesa = mesa;			
	GUI.showPopup(frm);	
end;

Firecast.Messaging.listen("HandleChatCommand",
	function(message)
		local comando = globalPrepareMacroNameForFind(message.command or "");
	
		if globalSimpleMacrosNDB == nil then
			globalSimpleMacrosNDB = NDB.load("simpleMacros.xml");
		end;		
	
		if comando == "MACROS" then
			globalGerenciarMacros(message.room);			
			message.response = {handled = true};
		else						
			local macro = globalFindMacro(comando, message.room);
			
			if macro ~= nil then
				globalExecutarMacro(macro, message);
				message.response = {handled = true};
			end;
		end
	end);	

Firecast.Messaging.listen("ListChatCommands",
	function(message)
		message.response = {{command="/macros", description="@@macros.command.description"}};
	end);

local function desanexarMacrosDaMesa(mesa)
	local o = _mesasAnexadas[mesa];
	
	if o ~= nil then
		if o.observer ~= nil then
			o.enabled = false;
		end;
		
		_mesasAnexadas[mesa] = nil;
	end;	
end;

Firecast.Messaging.listen("MesaJoined",
	function(msg)
		local mesa = msg.mesa;
		
		if mesa.podeTablesDock then
			anexarMacrosAMesa(mesa);
		end;
	end, {eu=true})	;
	
Firecast.Messaging.listen("MesaParted",
	function(msg)
			desanexarMacrosDaMesa(msg.mesa);
	end, {eu=true});	
	
Firecast.Messaging.listen("SessionLost",
	function(msg)
		local mesas = Firecast.getMesas();
		
		for i = 1, #mesas, 1 do
			desanexarMacrosDaMesa(mesas[i]);
		end;		
	end, {eu=true});		
	
	
local function inicializar()
	local mesas = Firecast.getMesas();

	for i = 1, #mesas, 1 do
		anexarMacrosAMesa(mesas[i]);
	end;	
	
	-- Register Chat Tool Button
	
	local macroButton = {};	
	macroButton.hint = "@@macros.ui.manageMacros";
	macroButton.icon = "/macros/icons/scriptIcon.xml";
	macroButton.group = "macros";
	
	macroButton.callback = 
		function (chat)
			globalGerenciarMacros(chat.room);
		end;
		
	Firecast.registerChatToolButton(macroButton);
end;

inicializar();

require("plugins.lua");