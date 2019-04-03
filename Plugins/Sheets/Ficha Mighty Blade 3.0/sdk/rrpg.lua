require("rrpgEvents.lua");
local ndb = require("ndb.lua");
local objs = require("rrpgObjs.lua");
local rrpgWrappers = require("rrpgWrappers.lua");

--[[ API do RRPG ]]--

rrpg = objs.objectFromHandle(_obj_newObject("TRRPGMainWrapper"));
RRPG = rrpg;
Firecast = rrpg;

local localRRPG = rrpg;
objs.registerHandle(rrpg.handle);

rawset(rrpg, "listeners", {generator = 0});
rawset(rrpg, "dataTypes", {});
rawset(rrpg, "forms", {});
rawset(rrpg, "props", {});

		
function rrpg.getMesas()
  local hs = _rrpg_GetMesasIDs();	
  local mesas = {};
  local idx = 1;  
  
  for i = 1, #hs, 1 do
	local mesaObj = localRRPG.contextObjectFromID(hs[i]);
  
	if (mesaObj ~= nil) then
		mesas[idx] = mesaObj; 
		idx = idx + 1;
	end;
  end
    
  return mesas;
end;				
		
rrpg.props["mesas"] = {getter="getMesas", tipo="table"};
		
local propsRolagem = {
	possuiAlgumDado = {getter="getPossuiAlgumDado", tipo="bool"},
	isRolado = {getter="getIsRolado", tipo="bool"},
	resultado = {getter="getResultado", tipo="int"},
	asString = {getter="getAsString", tipo="string"},
	tipo = {getter="getTipo", tipo="enum", 
		    values={"direta", "storyteller"}}
};		
		
local function newRolagemObject()
	local rolObj = objs.objectFromHandle(_obj_newObject("TRRPGLuaRolagem"));
	
	function rolObj:getTipo() return _obj_getProp(self.handle, "TipoRolagem"); end;
	
	function rolObj:_readOps()
		local nOps = {};
		local idxAtual = 1;
		local rolado = _obj_getProp(self.handle, "IsRolado");
		
		_obj_invoke(self.handle, "NavigatorBegin");
			
		while (not _obj_getProp(self.handle, "IsNavigatorEOF")) do
			local sOp = {};			
			sOp.tipo = string.lower(_obj_getProp(self.handle, "NavigatorTipoOperacao"));
			
			if sOp.tipo == "dado" then
				sOp.quantidade = _obj_getProp(self.handle, "NavigatorDadosQuantidade");
				local faceStr = _obj_getProp(self.handle, "NavigatorDadosFace");
				local faceAsNumber = tonumber(faceStr);
				
				if faceAsNumber ~= nil then
					sOp.face = faceAsNumber;
				else
					sOp.face = faceStr;
				end;
				
				if rolado then
					sOp.resultados = _obj_getProp(self.handle, "NavigatorGetResultadoDados");
				else
					sOp.resultados = {};
				end;
			elseif sOp.tipo == "comparacao" then
				sOp.comparacao = _obj_getProp(self.handle, "NavigatorComparacao");
			elseif sOp.tipo == "imediato" then
				sOp.valor = _obj_getProp(self.handle, "NavigatorGetImediatoValue");
			end;
			
			nOps[idxAtual] = sOp;
			idxAtual = idxAtual + 1;
			
			_obj_invoke(self.handle, "NavigatorNext");
		end
		
		rawset(self, "ops", nOps);
	end;	
	
	function rolObj:interpretarString(str) local ret = _obj_invoke(self.handle, "InterpretarString", str or ""); self:_readOps(); return ret; end;
	
	function rolObj:getPossuiAlgumDado()
		local lOps = rawget(self, "ops");

		if lOps ~= nil then
			for i, k in pairs(lOps) do				
				if k.tipo == "dado" then
					return true;
				end;
			end;
		end;
		
		return false;
	end;
		
	function rolObj:getIsRolado() return _obj_getProp(self.handle, "IsRolado"); end;
	function rolObj:getResultado() return _obj_getProp(self.handle, "Resultado"); end;
	function rolObj:getAsString() return _obj_getProp(self.handle, "RolagemAsStr"); end;
	
	function rolObj:concatenar(rolDir)
		local rolDirObj;
		
		if type(rolDir) == "string" then
			rolDirObj = localRRPG.interpretarRolagem(rolDir);
		elseif type(rolDir) == "table" then
			rolDirObj = rolDir;
		elseif type(rolDir) == "number" then
			rolDirObj = localRRPG.interpretarRolagem(tostring(rolDir));
		else
			error("Cant concatenate rolls with the type " .. type(rolDir));
		end;		
		
		local ret = _obj_invoke(self.handle, "Concatenar", rolDirObj.handle);
		
		if ret then
			self:_readOps();		
		end;
		
		return self;
	end;	
	
	function rolObj:rolarLocalmente() _obj_invoke(self.handle, "RolarLocalmente"); self:_readOps(); end;
	function rolObj:loadFromBase64EncodedString(str) _obj_invoke(self.handle, "LoadFromBase64EncodedString", str); self:_readOps(); end;		
		
	rolObj.props = propsRolagem;
	objs.registerHandle(rolObj.handle, rolObj);	
	return rolObj;
end;		
		
function rrpg.interpretarRolagem(stringDaRolagem)		
	local rolObj = newRolagemObject();
	rolObj:interpretarString(stringDaRolagem);	
	return rolObj;
end;

function rrpg.loadRolagemFromBase64EncodedString(encodedString)
	local rolObj = newRolagemObject();
	rolObj:loadFromBase64EncodedString(encodedString);	
	return rolObj;
end
		
function rrpg.contextObjectFromID(objectID)
	return rrpgWrappers.contextObjectFromID(objectID);
end;
		
function rrpg.objectFromID(objectID)	
	return localRRPG.contextObjectFromID(objectID);
end;
		
function rrpg.getMesaFromNodeDataBase()		
end;

function rrpg.getMesaFromSheet(sheet)
	return rrpg.getMesaFromNodeDataBase(sheet);
end;

function rrpg.findMesa(codigoInterno)
	local mesas = rrpg.getMesas();
	
	for i = 1, #mesas, 1 do
		local mesa = mesas[i];
		
		if mesa.codigoInterno == codigoInterno then
			return mesa;
		end;
	end;
	
	return nil;
end; 

function rrpg.getMesaDe(object)		
	if type(object) == "number" then
		return rrpg.findMesa(object);
	end;

	if (type(object) ~= "table") then
		return nil;
	end;
		
	local handle = rawget(object, "handle");
	local mesaObjectID;
	
	if handle == nil then
		if ndb.isNodeObject(object) then
			handle = ndb.getNodeHandle(object);
		end;
	end;
	
	if handle ~= nil then
		mesaObjectID = _rrpg_tryGetMesaObjectIDRelatedToHandle(handle);		
		
		if (mesaObjectID ~= nil) then
			mesaObjectID = tonumber(mesaObjectID);
		end;
		
		if mesaObjectID ~= nil then
			return rrpg.objectFromID(mesaObjectID);
		end;
	end;	
	
	return nil;
end;

rrpg.getRoomOf = rrpg.getMesaDe;
	
function rrpg.getBibliotecaItemDe(object)		
	if (type(object) ~= "table") then
		return nil;
	end;
		
	local handle = rawget(object, "handle");
	local bibObjectID;
	
	if handle == nil then
		if ndb.isNodeObject(object) then
			handle = ndb.getNodeHandle(object);
		end;
	end;
	
	if handle ~= nil then
		bibObjectID = _rrpg_tryGetBibItemObjectIDRelatedToHandle(handle);		
		
		if (bibObjectID ~= nil) then
			bibObjectID = tonumber(bibObjectID);
		end;
		
		if bibObjectID ~= nil then
			return rrpg.objectFromID(bibObjectID);
		end;
	end;	
	
	return nil;
end;

function rrpg.getPersonagemDe(object)	
	local ctxObj = localRRPG.getBibliotecaItemDe(object);
	
	if (ctxObj ~= nil) and (ctxObj:isType("personagem")) then
		return ctxObj;
	else
		return nil;
	end;	
end;
	
function rrpg.getCurrentUser()
	return _rrpg_getCurrentUser();
end;	
	
function rrpg.ouvir(eventos)	
	if (eventos == nil)	then
		return;
	end
	
	for k, v in pairs(eventos) do
		if (type(v == "function")) then
			local t = localRRPG.listeners[k];
			
			if (t == nil) then
				t = {};
				localRRPG.listeners[k] = t;
			end;
										
			localRRPG.listeners.generator = localRRPG.listeners.generator + 1;	
			t[localRRPG.listeners.generator] = v;	
			
			_rrpg_KnownEvent(k);		
		end
	end;
end		
			
function rrpg.on(eventName, callbackFunction)	
	local tabela = {};
	tabela[eventName] = callbackFunction;
	rrpg.ouvir(tabela);
end;

function on(eventName, callbackFunction)
	rrpg.on(eventName, callbackFunction);
end;
			
function rrpg.dispatch(eventName, ...)			
	local t = localRRPG.listeners[eventName];
	
	if (t == nil) then
		return;
	end;
	
	for k,v in pairs(t) do
		v(...);
	end;	
end

function rrpg.registrarDataType(dt)
  if type(dt) == 'table' then	
	if ((dt.dataType ~= nil) and (dt.dataType ~= "")) then	
  		localRRPG.dataTypes[dt.dataType] = dt;  
  		_rrpg_DataTypes_Registrar(dt);
  	end;	
  end;
end;

function rrpg.registrarForm(frm)
  if type(frm) == 'table' then	
	if (frm.name ~= nil) then	
  		localRRPG.forms[frm.name] = frm;  
  	end;	
  end;
end;

function rrpg.registrarSpecialForm(frm)
  if (type(frm) == 'table') and (frm.name ~= nil) then		
  		_rrpg_Forms_RegistrarSpecial(frm);  	
  end;
end;
	
local __registeredToolButtons = nil;
	
function rrpg.registerChatToolButton(params)
	if type(params) ~= "table" then
		error("registerChatToolButton: params must be a table");
	end;
	
	local regClass = objs.objectFromHandle(_obj_newObject("TRRPGLuaRegisteredChatToolButton"));
	objs.registerHandle(regClass.handle);	
	
	regClass.eves = {};
	regClass.eves["onCallback"] = "";
	
	_obj_setProp(regClass.handle, "Hint", params.hint);
	_obj_setProp(regClass.handle, "IconURL", params.icon);
	
	local p = tonumber(params.priority);
	
	if p ~= nil then
		_obj_setProp(regClass.handle, "Priority", math.floor(p));
	end;
	
	local group = tostring(params.group) or "";

	if group ~= "" then	
		_obj_setProp(regClass.handle, "Group", tostring(params.group) or "");
		
		p = tonumber(params.groupPriority);
		
		if p ~= nil then
			_obj_setProp(regClass.handle, "GroupPriority", math.floor(p));		
		end;
	end;	
	
	
	if params.callback ~= nil then
		regClass.onCallback = params.callback;		
	end;
	
	_obj_invoke(regClass.handle, "Activate");
	
	if __registeredToolButtons == nil then
		__registeredToolButtons = {};
	end;
	
	__registeredToolButtons[regClass.handle] = regClass; -- strong reference
	return regClass.handle;
end;

function rrpg.unregisterChatToolButton(toolButtonId)
	if __registeredToolButtons ~= nil then
		local regClass = __registeredToolButtons[toolButtonId];
		
		if regClass ~= nil then
			__registeredToolButtons[toolButtonId] = nil;
			_obj_invoke(regClass.handle, "Deactivate");
		end;
	end;
end;
		
rrpg.messaging = require("rrpgEventMessages.lua");

rrpg.listen = rrpg.messaging.listen;
rrpg.listenOnce = rrpg.messaging.listenOnce;
rrpg.unlisten = rrpg.messaging.unlisten;
rrpg.groupOnceListeners = rrpg.messaging.groupOnceListeners;
rrpg.Messaging = rrpg.messaging;
		
RRPG = rrpg;		
		
require("rrpgEventMessagesAdapters.lua");
return rrpg;