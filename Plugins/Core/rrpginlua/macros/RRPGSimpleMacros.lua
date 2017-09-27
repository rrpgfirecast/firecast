require("rrpg.lua");
require("ndb.lua");
require("utils.lua");

globalMacrosInvalido = true;

local macrosPreparado = {};
local _mesasAnexadas = {};  -- macros de mesa (NDB de mesa).. o indice é o objeto mesa
setmetatable(_mesasAnexadas, {__mode="k"});

local _macros = {};

function globalPrepareMacroName(name)
	if type(name) == "string" then
		return string.gsub(name, "([ /.]+)", "");		
	else
		return name;
	end;
end;

function globalPrepareMacroNameForFind(name)
	return string.upper(utils.removerAcentos(name));
end;

local function prepareNodeDeMacrosEm(nodoDeMacros, nodoDestino)
	local macrosInNDB = ndb.getChildNodes(nodoDeMacros);
	
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
		local nodosDeMesas = ndb.getChildNodes(globalSimpleMacrosNDB.mesas);
		
		for i = 1, #nodosDeMesas, 1 do
			local nodoDaMesa = nodosDeMesas[i];
			
			if nodoDaMesa.macros ~= nil then
				local macrosPreparadosDeUmaMesa = {};
				prepareNodeDeMacrosEm(nodoDaMesa.macros, macrosPreparadosDeUmaMesa);
				macrosPreparado.mesas[ndb.getNodeName(nodoDaMesa)] = macrosPreparadosDeUmaMesa;
			end;	
		end;
	end;
end;

function globalFindMacro(comando, mesa)
	if globalMacrosInvalido then
		prepararMacrosParaUso();
	end;
	
	comando = globalPrepareMacroNameForFind(comando or "");
	
	local macroAchado = nil;

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
		local f = macros.compileMacro(macro.acoes, message.chat, "/" .. macro.macro, endCallback)
		f({parametro=message.parametro});		
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

	if executingMacros[macro.macro] ~= nil then
		return;
	end;

	executingMacros[macro.macro] = true;
	-- evitar dependencia circular de macros..
	retorno, msg = pcall(realExecutarMacro, macro, message, endCallback);	
	executingMacros[macro.macro] = nil;
	
	if not retorno then
		local dialogs = require("dialogs.lua");
		dialogs.showMessageDlg(msg, dialogs.DT_ERROR, {dialogs.DB_OK});
		--(msg);
	end	
end;

function globalGerenciarMacros(mesa)
	if globalSimpleMacrosNDB == nil then
		globalSimpleMacrosNDB = ndb.load("simpleMacros.xml");
	end;	
	
	local frm = gui.newForm("frmGerenciarSimpleMacros");
	frm._mesa = mesa;			
	gui.showPopup(frm);	
end;

rrpg.messaging.listen("HandleChatCommand",
	function(message)
		local comando = globalPrepareMacroNameForFind(message.comando or "");
	
		if globalSimpleMacrosNDB == nil then
			globalSimpleMacrosNDB = ndb.load("simpleMacros.xml");
		end;		
	
		if comando == "MACROS" then
			globalGerenciarMacros(message.mesa);			
			message.response = {handled = true};
		else						
			local macro = globalFindMacro(comando, message.mesa);
			
			if macro ~= nil then
				globalExecutarMacro(macro, message);
				message.response = {handled = true};
			end;
		end
	end);	

rrpg.messaging.listen("ListChatCommands",
	function(message)
		message.response = {{comando="/macros", descricao="Abre o gerenciador de Macros do RRPG"}};
	end);

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
								
				local obs = ndb.newObserver(n);				
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

local function desanexarMacrosDaMesa(mesa)
	local o = _mesasAnexadas[mesa];
	
	if o ~= nil then
		if o.observer ~= nil then
			o.enabled = false;
		end;
		
		_mesasAnexadas[mesa] = nil;
	end;	
end;

rrpg.messaging.listen("MesaJoined",
	function(msg)
		local mesa = msg.mesa;
		
		if mesa.podeTablesDock then
			anexarMacrosAMesa(mesa);
		end;
	end, {eu=true})	;
	
rrpg.messaging.listen("MesaParted",
	function(msg)
			desanexarMacrosDaMesa(msg.mesa);
	end, {eu=true});	
	
rrpg.messaging.listen("SessionLost",
	function(msg)
		local mesas = rrpg.getMesas();
		
		for i = 1, #mesas, 1 do
			desanexarMacrosDaMesa(mesas[i]);
		end;		
	end, {eu=true});		
	
	
local function inicializar()
	local mesas = rrpg.getMesas();

	for i = 1, #mesas, 1 do
		anexarMacrosAMesa(mesas[i]);
	end;	
end;

inicializar();