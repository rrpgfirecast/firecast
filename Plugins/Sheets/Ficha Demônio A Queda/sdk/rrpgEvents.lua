local ndb = require("ndb.lua");
local objs = require("rrpgObjs.lua");



function _eve_MESA_PVT_ReceberMensagem(mesaID, senderID, msg)
	rrpg.dispatch("MESA_PVT_ReceberMensagem", rrpg.objectFromID(mesaID), rrpg.objectFromID(senderID), msg);
end


--[[ Coisas relacionadas ao Sistema de Forms ]]--

local _LuaForms = {};

--[ Lista de forms que não estao sendo utilizados, e podem ser reusados (antes que o garbage colector faca sua parte) ]--
local _CachedFreeForms = {};  

function _eve_Forms_CriarForm(formName)
  local dtObj = rrpg.forms[formName];
  
  if dtObj ~= nil then
  	local frm = dtObj.newEditor();
	rawset(frm, "__formName", formName);	
	
  	_LuaForms[frm.handle] = frm;
  	return frm.handle;
  else
  	return nil;
  end;
end;

function eve_Forms_ExisteFormName(formName)
	return rrpg.forms[formName] ~= nil;
end;

function _eve_Forms_DestruirForm(formHandle)
  local frm = _LuaForms[formHandle];
  
  if frm ~= nil then
  	_LuaForms[formHandle] = nil;
  	frm:destroy();
  end;
end;

function _eve_Forms_AssignNodeDatabase(formHandle, nodeHandle)
	local nodeDataBase = ndb.openNodeFacade(nodeHandle);
	local formObj = _LuaForms[formHandle];
	
	if (formObj ~= nil) then			
		if formObj.setNodeDatabase ~= nil then
			formObj:setNodeDatabase(nodeDataBase);
		end;
	end;
end;

local _tmrDestroyCachedForms = objs.newTimer(45000);
_tmrDestroyCachedForms:setEnabled(false);

function _eve_Forms_Cached_CriarForm(formName)
	local cache = _CachedFreeForms[formName];
	
	if type(cache) == "table" then
		local objetoEncontrado = nil;
		
		for k, v in pairs(cache) do
			if (type(k) == "table") and (v ~= nil) then
				objetoEncontrado = k;
				break;
			end;
		end;
		
		if objetoEncontrado ~= nil then
			_LuaForms[objetoEncontrado.handle] = objetoEncontrado;
			cache[objetoEncontrado] = nil;
			return objetoEncontrado.handle;
		end;
	end;
	
	-- se chegou até aqui, é porque nao conseguiu usar algum do cache
	return _eve_Forms_CriarForm(formName);
end;

function _eve_Forms_Cached_DestruirForm(formHandle)
	local formObject = _LuaForms[formHandle];
	
	if formObject ~= nil then
		local formName = rawget(formObject, "__formName");	
		
		if formName ~= nil then
			local cache = _CachedFreeForms[formName];
			
			if cache == nil then
				cache = {};
				_CachedFreeForms[formName] = cache;
			end;
			
			cache[formObject] = true; -- adicionar ao cache
			_LuaForms[formObject.handle] = nil;
			
			if formObject.setNodeDatabase ~= nil then
				formObject:setNodeDatabase(nil);
			end;			
			
			formObject:setParent(nil);
						
			_tmrDestroyCachedForms:setEnabled(true); -- ativar o timer de coleta de cache
			return;
		end;
	end;
	
	-- se chegou até aqui, é porque nao conseguiu colocar o form no cache
	return _eve_Forms_DestruirForm(formHandle);
end;

local __strongReferencedObjects = {};

function _eve_Objs_AddStrongReference(objectHandle)
	local objectRecord = __strongReferencedObjects[objectHandle];
	
	if (objectRecord == nil) then
		local objetoEncontrado = objs.tryFindFromHandle(objectHandle);
		
		if (objetoEncontrado == nil) then
			objetoEncontrado = objs.objectFromHandle(objectHandle);
			objs.registerHandle(objetoEncontrado);
		end;
		
		objectRecord = {count = 0, object = objetoEncontrado};	
		__strongReferencedObjects[objectHandle] = objectRecord;
	end;
	
	objectRecord.count = objectRecord.count + 1;
end;

function _eve_Objs_SubtractStrongReference(objectHandle)
	local objectRecord = __strongReferencedObjects[objectHandle];
	
	if (objectRecord ~= nil) then
		objectRecord.count = objectRecord.count - 1;
		
		if (objectRecord.count <= 0) then		
			objectRecord.object = nil;
			__strongReferencedObjects[objectHandle] = nil;
		end;
	end;
end;

function timedCheckAndDestroyCachedForms()
	_tmrDestroyCachedForms:setEnabled(false);

	local oldCachedFreeForms = _CachedFreeForms;
	_CachedFreeForms = {};

	for formName, cache in pairs(oldCachedFreeForms) do
		
		if cache ~= nil then
			for formObj, v in pairs(cache) do
				if (formObj ~= nil) and (formObj.destroy ~= nil) then
					formObj:destroy();
				end;	
			end;
		end;	
	end;		
end;

_tmrDestroyCachedForms:addEventListener("onTimer", timedCheckAndDestroyCachedForms);