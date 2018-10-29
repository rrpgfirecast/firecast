objs = {}
rrpgObjs = objs;

local weakHandlerMetatable = {
  __mode = "v"
}

local objHandlers = {};
setmetatable(objHandlers, weakHandlerMetatable);

objs.events = {};
objs.events.handlers = {};
objs.events.selfParams = {};
objs.events.eventsOfObjects = {};
objs.events.idGenerator = 1;
objs.events.eventsOfObjectsObjRef = {};

objs.weakMetatable = weakHandlerMetatable;

local localObjs = objs;

setmetatable(objs.events.selfParams, weakHandlerMetatable);
setmetatable(objs.events.handlers, weakHandlerMetatable);
setmetatable(objs.events.eventsOfObjects, weakHandlerMetatable);
setmetatable(objs.events.eventsOfObjectsObjRef, {__mode="k"});

function objs.addEventListener(object, eventName, funcCallback, parameterSelf)
	local objectHandle;
	
    if type(object) == 'table' then
   		objectHandle = object.handle;
   	else
   		objectHandle = nil;	
    end;

	if type(funcCallback) ~= "function"  then
		error("Ops, a function is needed to listen an event");
	end;
	
	if (funcCallback == nil) or (objectHandle == nil) then
		return 0;
	end;	

	local eveItem = {};
	eveItem.objectHandle = objectHandle;
	eveItem.eventName = eventName;
	eveItem.funcCallback = funcCallback;
	eveItem.hasParameterSelf = ((parameterSelf ~= nil) and (type(parameterSelf) == 'table'));	
	
    local evesOfObject = localObjs.events.eventsOfObjectsObjRef[object];
    
    if evesOfObject == nil then
    	evesOfObject = {};
    	localObjs.events.eventsOfObjects[objectHandle] = evesOfObject;
		localObjs.events.eventsOfObjectsObjRef[object] = evesOfObject;
    end;              
	
	localObjs.events.idGenerator = localObjs.events.idGenerator + 1;
	local esteEventId =  localObjs.events.idGenerator;	
	
	localObjs.events.handlers[esteEventId] = eveItem;
	localObjs.events.selfParams[esteEventId] = parameterSelf;
			
	evesOfObject[esteEventId] = eveItem;
	
	_obj_listenEvent(objectHandle, eventName, esteEventId);	
	return esteEventId; 
end;


function objs.removeEventListenerById(eventId)
	local eventItem = localObjs.events.handlers[eventId];
	
	if eventItem == nil then
		return;
	end;
	
	_obj_stopListeningEvent(eventItem.objectHandle, eventId);	
	
	localObjs.events.selfParams[eventId] = nil;
	localObjs.events.handlers[eventId] = nil;	
	
	local eventsOfObject = localObjs.events.eventsOfObjects[eventItem.objectHandle];
	
	if eventsOfObject ~= nil then
		eventsOfObject[eventId] = nil;
		
		local existeAlgumEventoNoObject = false;
		
		for k, v in pairs(eventsOfObject) do
			if (v ~= nil) then
				existeAlgumEventoNoObject = true;
				break;	
			end;	
		end;	
		
		if not existeAlgumEventoNoObject then
			localObjs.events.eventsOfObjects[eventItem.objectHandle] = nil;			
			local realObj = objs.tryFindFromHandle(eventItem.objectHandle);
			
			if (realObj ~= nil) and (localObjs.events.eventsOfObjectsObjRef[realObj] == eventItem) then
				localObjs.events.eventsOfObjectsObjRef[realObj] = nil;
			end;
		end; 
	end;
end;

--[[ Objeto TObject ]]--

local objectMetaTable = {
	--[[ Comparação padrão entre objetos ]]--
	__eq = function(op1, op2)
		return op1.handle == op2.handle;
	end,
	
	--[[ getter padrão de propriedades dos objetos. Chamado quando tentar gettar uma propriedade que não existe ]]--
	
	__index = function(table, key)
		local v = rawget(table, key);
		
		if (v ~= nil) then
			return v;
		end;
	
		-- Tentalizar localizar uma propriedade com este nome
		local props = rawget(table, "props");
		
		if props ~= nil then
			local propKey = props[key];
			
			if propKey ~= nil then
				local fgetter;
				
				if type(propKey.getter) == "function" then
					fgetter = propKey.getter;
				else
					fgetter = rawget(table, propKey.getter);
				end;
				
				if fgetter ~= nil then
					return fgetter(table);
				elseif propKey.readProp ~= nil then
					return _obj_getProp(rawget(table, 'handle'), propKey.readProp);
				end;
			end	
		end;	
		
		-- Tentar localizar um evento principal com este nome
		local eves = rawget(table, "eves");
		
		if eves ~= nil then
			local eveKey = eves[key];
			
			if eveKey ~= nil then
				-- Existe um evento com este nome.. Vamos retornar o evento principal associado, se existir.
				local mainEves = rawget(table, "__mainEves");
				
				if mainEves ~= nil then
					return mainEves[key];
				end;
			end;
		end;
		
		-- Se chegou até aqui, é porque não localizou nenhum valor especial
		return nil;
	end,
	
	--[[ setter padrão de propriedades dos objetos. Chamado quando tentou settar uma propriedade que não existe ]]--
	
	__newindex = function(table, key, value)
		local fsetter = nil;
		local props = rawget(table, "props");
		
		-- Tentar setar uma propriedade
		if props ~= nil then		
			local propKey = props[key];
			
			if propKey ~= nil then
				if type(propKey.setter) == "function" then
					fsetter = propKey.setter;
				else
					fsetter = rawget(table, propKey.setter);								
				end;
				
				if (fsetter == nil) and (propKey.writeProp ~= nil) then
					return _obj_setProp(rawget(table, 'handle'), propKey.writeProp, value);
				end;
			end;		
		end;
		
		if fsetter ~= nil then
			fsetter(table, value);
			return;
		end;
		
		-- Tentar setar um evento	
		if (value == nil) or (type(value) == "function") then
			local eves = rawget(table, "eves");
			
			if eves ~= nil then
				local eveKey = eves[key];
				
				if eveKey ~= nil then
					-- Existe um evento com este nome.. Vamos setar o evento principal associado, se existir.
					local mainEves = rawget(table, "__mainEves");
					
					if (mainEves == nil) then
						mainEves = {};
						rawset(table, "__mainEves", mainEves)
					end;
					
					local oldListenerId = mainEves["id_" .. key];
					
					if oldListenerId ~= nil then
						objs.removeEventListenerById(oldListenerId);
						mainEves["id_" .. key] = nil;
					end;
					
					mainEves[key] = value;
					
					if value ~= nil then
						mainEves[key] = value;
						mainEves["id_" .. key] = objs.addEventListener(table, key, value);
					end;
					
					return;
				end;
			end;	
		end;
		
		-- Se chegou até aqui, é porque não conseguiu fazer nenhuma atribuição especial.
		-- Vamos fazer uma atribuição padrão
		rawset(table, key, value);
	end,	
	
	
	__gc = function(obj)	
		if obj.destroy ~= nil then
			obj:destroy();				
		end;	
	
		if obj.handle ~= nil then
			_obj_destruir(obj.handle);
			obj.handle = nil;		
		end;			
	end
}

function objs.objectFromHandle(handle)
	local obj = {_calledDestroy = false};
	obj.handle = handle;
	
	setmetatable(obj, objectMetaTable);	
	
	function obj:addEventListener(eventName, funcCallback, optionalSelfParameter)
		return localObjs.addEventListener(obj, eventName, funcCallback, optionalSelfParameter);		
	end;
	
	obj.listen = obj.addEventListener;
	
	function obj:removeEventListener(eventListenerId)
		return localObjs.removeEventListenerById(eventListenerId);		
	end;	
	
	obj.unlisten = obj.removeEventListener;
	
	function obj:removeAllEventListeners()		
		if (self.handle == nil) then
			return;
		end;
	
		local eventsOfThis = localObjs.events.eventsOfObjects[self.handle];
		
		if (eventsOfThis ~= nil) then
			local eventsIds = {};
			local idx = 1;
		
			for k, v in pairs(eventsOfThis) do
				eventsIds[idx] = k;
				idx = idx + 1;
			end;
			
			for i = 1, idx - 1, 1 do
				localObjs.removeEventListenerById(eventsIds[i]);
			end;
			
			localObjs.events.eventsOfObjects[self.handle] = nil;
		end;		
	end;
	
	function obj:destroy() 
		if (not self._calledDestroy) then
			self._calledDestroy = true;			
		    					
			if self.handle ~= nil then	
				if (self.removeAllEventListeners ~= nil) then
					self:removeAllEventListeners();						
				end;	
					
				objHandlers[self.handle] = nil;			
			
				_obj_destruir(self.handle);
				self.handle = nil;
			end;	
		end
	end	
	
	function obj:getClassName()
		return _obj_getClassName(self.handle);
	end;
	
	return obj;
end

function objs.componentFromHandle(handle)
	local obj = objs.objectFromHandle(handle);	
	
	function obj:getName() return _obj_getProp(self.handle, "Name"); end;
	function obj:setName(name) _obj_setProp(self.handle, "Name", name) end;			
	
	obj.props = {}
	obj.props["name"] = {setter = "setName", getter = "getName", tipo = "string"};		
	
	obj.eves = {};
	return obj;
end;

function objs.hierarchyObjectFromHandle(handle)
	local obj = objs.componentFromHandle(handle);	
	obj._parent = nil;
	obj._children = {};	
	
	function obj:getChildren()
		local ret = {};
		local idxDest = 1;
		
		for k, v in pairs(obj._children) do
			ret[idxDest] = v;
			idxDest = idxDest + 1;
		end;
		
		return ret;
	end;	
	
	--[[
	function obj:getChildren__()
		local ret = {};
		local i;
		local childCount = _obj_getProp(self.handle, "ChildrenCount");
		local child;
		local childHandle;
		local idxDest = 1;
			
		for i = 0, childCount - 1, 1 do
			childHandle = _gui_getChild(self.handle, i);
			
			if (childHandle ~= nil) then							
				child = gui.fromHandle(childHandle);
				
				if (type(child) == "table") then							
					ret[idxDest] = child;
					idxDest = idxDest + 1;
				end
			end;	
		end
		
		return ret;
	end;  --]]
	
	function obj:findChildByName(childName, recursive, superficialSearch)
		if recursive == nil then
			recursive = true;
		end;
		
		local child;		
		
		child = self[childName];
		
		if type(child) == "table" and (child.handle ~= nil) and (child.getName ~= nil) and (child:getName() == childName) then
			return child;
		end;
		
		if superficialSearch then
			return nil;
		end;
		
		local childs = self:getChildren();		
		
		for i = 1, #childs, 1 do
			child = childs[i];
			
			if child.getName ~= nil then
		
				if child:getName() == childName then
					return child;
				end;
			end;
		end;
				
		if recursive then
			local retChild;
		
			for i = 1, #childs, 1 do
				child = childs[i];
				retChild = child:findChildByName(childName, recursive);
				
				if retChild ~= nil then
					return retChild;
				end;
			end;			
		end;
		
		return nil;
	end;
	
	function obj:getParent() return gui.fromHandle(_gui_getParent(self.handle)) end
	function obj:setParent(parent) 
		if (self._parent == parent) then
			return;
		end;
		
		if (self._parent ~= nil) then
			self._parent._children[self.handle] = nil;
		end
		
		self._parent = parent;
		
		if (self._parent ~= nil) then
			_gui_setParent(self.handle, parent.handle); 
			self._parent._children[self.handle] = self;
		else
			_gui_setParent(self.handle, nil); 		
		end		
	end;	
	
	obj._oldDestroyHierarchyObject = obj.destroy;
	
	 function obj:destroy()		 
		self:removeAllEventListeners();
	 
	 	if self._children ~= nil then	 		 	
		    for k, v in pairs(self._children) do
		    	if v ~= nil then
		    		v:setParent(nil);
		    	end;
		    end;
		 
			self._children = {};
		end;
		
		if (self._parent ~= nil) then
			
			if (self._parent._children ~= nil) and (self.handle ~= nil) then
				self._parent._children[self.handle] = nil;			
			end;
				
			self._parent = nil;				
		end;			
		
		self:_oldDestroyHierarchyObject();
	end		
	
	return obj;
end;

function objs.__timerFromHandle(handle)
	local timer = objs.hierarchyObjectFromHandle(handle);
	
	function timer:getInterval() return _obj_getProp(timer.handle, "Interval") end;
	function timer:setInterval(v) _obj_setProp(timer.handle, "Interval", v) end;
	
	function timer:getEnabled() return _obj_getProp(timer.handle, "Enabled") end;
	function timer:setEnabled(v) _obj_setProp(timer.handle, "Enabled", v) end;			
	
	function timer:beginUpdate() end;
	function timer:endUpdate() end;	
	
	timer.props["interval"] = {setter = "setInterval", getter = "getInterval", tipo = "int"};	
	timer.props["enabled"] = {setter = "setEnabled", getter = "getEnabled", tipo = "bool"};

	timer.eves["onTimer"] = "";					
	return timer;
end;

function objs.newTimer(interval, callback, optionalSelfParameterForCallback)
	local timer = objs.__timerFromHandle(_obj_newObject("timer"));	

	interval = tonumber(interval);
	
	if (type(interval) ~= "number") or (interval < 1) then
		interval = 1;
	end;
	
	timer:setInterval(interval);
	
	if type(callback) == "function" then
		timer:addEventListener("onTimer", callback, optionalSelfParameterForCallback);
	end;
		
	timer:setEnabled(true);
	return timer;
end;

function objs.beginObjectsLoading()
	_obj_beginObjectsLoading();
end;

function objs.endObjectsLoading()
	_obj_endObjectsLoading();
end;

function objs.tryFindFromHandle(handle)
	return objHandlers[handle] ;
end;

function objs.registerHandle(handle, object)
	objHandlers[handle] = object;
end;

function _rrpgObjs_events_receiver(eventId, ...)
	local eventItem = localObjs.events.handlers[eventId];
	
	if eventItem == nil then		
		return;
	end;
	
	if eventItem.hasParameterSelf then
		local selfParam = localObjs.events.selfParams[eventId];
				
		if selfParam ~= nil then
			return eventItem.funcCallback(selfParam, ...);
		end;
	else		
		return eventItem.funcCallback(...);
	end;
end;

return localObjs;