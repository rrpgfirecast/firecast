local rrpgObjs = require("rrpgObjs.lua");
local messaging = {};

local CANCEL_RECEIVER = false;
messaging.CANCEL = CANCEL_RECEIVER;

local _messageAdapters = {};

function messaging.createReceiver(messageName, callback, filters)
	if (type(callback) ~= "function") or (type(messageName) ~= "string") or (messageName == "") then
		return nil;
	end;		

	if type(filters) ~= "table" then
		filters = nil;
	end;
	
	local obj = rrpgObjs.objectFromHandle(_obj_newObject("TRRPGEventMessageReceiver"));	
	rrpgObjs.registerHandle(obj.handle, obj);
	
	local msgAdapter = _messageAdapters[string.upper(messageName)];
	
	if (msgAdapter ~= nil) and (msgAdapter.prepareFilters ~= nil) and (filters ~= nil) then
		msgAdapter.prepareFilters(filters);
	end;
	
	if filters ~= nil then
		for k, v in pairs(filters) do
			_obj_invokeEx(obj.handle, "AddFilter", k, v);
		end;
	end;	
	
	_obj_setProp(obj.handle, "EventName", messageName);
	
	obj.__callbackEventListenerId = obj:addEventListener("OnMessage",
		function (message)
			if callback ~= nil then
				if (msgAdapter ~= nil) and (msgAdapter.prepareMessage ~= nil) then
					msgAdapter.prepareMessage(message);
				end;
			
				local retorno = callback(message);
				
				if retorno == CANCEL_RECEIVER then
					messaging.disableReceiver(obj);
				end;
				
				local response = message.response;
				
				if (response ~= nil) and (type(response) == "table") then
					if (msgAdapter ~= nil) and (msgAdapter.prepareResponse ~= nil) then
						msgAdapter.prepareResponse(response);
					end;
				
					_obj_invokeEx(obj.handle, "AddResponse", response);					
				end;
			end;
		end);
	
	function obj:disable()
		callback = nil;
		local evtId = obj.__callbackEventListenerId;
		
		if evtId ~= nil then
			_obj_setProp(obj.handle, "EventName", "");		
			obj:removeEventListener(evtId);
			obj.__callbackEventListenerId = nil;
		end;
	end;	
	
	return obj;
end;

function messaging.disableReceiver(receiverId)
	if (type(receiverId) == "table") and (receiverId.disable ~= nil) then
		receiverId:disable();
	end;
end;

local __settedListeners = {};
local __listenersGeneratorId = 1;
local __listenersByName = {};

function messaging.listen(messageName, callback, filters)
	if (type(callback) ~= "function") or (type(messageName) ~= "string") or (messageName == "") then
		return nil;
	end;	
	
	__listenersGeneratorId = __listenersGeneratorId + 1;
	local esteListenerId = __listenersGeneratorId;

	local obj = messaging.createReceiver(messageName, 
		function(message)
			local retorno;
			
			if callback ~= nil then
				retorno = callback(message);
			else
				retorno = nil;
			end;
			
			if retorno == CANCEL_RECEIVER then
				messaging.unlisten(esteListenerId);
				callback = nil;
			end;			
			
			return retorno;
		end, filters);	

	if obj == nil then
		return nil;
	end;
	
	__settedListeners[esteListenerId] = obj;
	
	local preparedMessageName = _util_genCollateWinPtBrString(messageName);
	local lbn = __listenersByName[preparedMessageName];
	
	if lbn == nil then
		lbn = {};
		__listenersByName[preparedMessageName] = lbn;
	end;

	obj.preparedMessageName = preparedMessageName;
	lbn[esteListenerId] = obj;	
	return esteListenerId;
end;

function messaging.unlisten(listenerId)
	if listenerId == nil then
		return;
	end;

	local listenerObj = __settedListeners[listenerId];
	
	if listenerObj ~= nil then
		__settedListeners[listenerId] = nil;
	
		local lbn = __listenersByName[listenerObj.preparedMessageName];
		
		if lbn ~= nil then
			lbn[listenerId] = nil;
			
			if next(lbn, nil) == nil then -- Tabela vazia
				__listenersByName[listenerObj.preparedMessageName] = nil;
			end;
		end;
	
		if listenerObj.disable ~= nil then
			listenerObj:disable();
		end;
	end;
end;

function messaging.listenOnce(messageName, callback, filters)
	local listenerId = messaging.listen(messageName,
		function(message)
			callback(message);
			return CANCEL_RECEIVER;
		end, filters);
		
	return listenerId;
end;

function messaging.groupOnceListeners(...)
	local parametros = table.pack(...);
	local listenersObjs = {};
	local listenersId = {};
	
	for i = 1, #parametros, 1 do
		local obj = __settedListeners[parametros[i]];
				
		if (obj ~= nil) then
			listenersId[#listenersId + 1] = parametros[i];		
			listenersObjs[#listenersObjs + 1] = obj;
		end;
	end;
	
	if #listenersObjs == 0 then
		return;
	end;
	
	local eventListenersId = {};
	
	for i = 1, #listenersObjs, 1 do
		local obj = listenersObjs[i];		
		eventListenersId[#eventListenersId + 1] = obj:addEventListener('OnAfterMessage',
			function()
				-- um dos listeners disparou, vamos cancelar os outros.
				
				for j = 1, #listenersObjs, 1 do
					local otherObj = listenersObjs[j];
					otherObj:removeEventListener(eventListenersId[j]);
					messaging.unlisten(listenersId[j]);
					otherObj:disable();
				end;
			end);
	end;
end;

function messaging.addMessageAdapter(messageName, adapter)
	_messageAdapters[string.upper(messageName)] = adapter;
end;

function messaging.dispatchLocalMessage(messageName, message)
	local lbn = __listenersByName[_util_genCollateWinPtBrString(messageName)];
	
	if lbn == nil then
		return;
	end;

	if type(message) ~= "table" then
		local nm = {};
		nm.data = message;
		message = nm;
	end;
	
	local copyOfLbn = {};
	
	-- Copiar, pois lbn pode mudar ao longo do processo
	for k, v in pairs(lbn) do
		copyOfLbn[k] = v;
	end;
	
	for k, v in pairs(copyOfLbn) do
		_obj_invokeEx(v.handle, "TryDispatchLocalMessage", message);
	end
end;

function __export__dispatchLocalMessage(messageName, message)
	return messaging.dispatchLocalMessage(messageName, message);
end;

return messaging;