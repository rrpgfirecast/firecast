local Async = require("async.lua");

objs = {}
local localObjs = objs;

rrpgObjs = objs;

local weakHandlerMetatable = {
  __mode = "v"
}

objs.weakMetatable = weakHandlerMetatable;

local objHandlers = {};
setmetatable(objHandlers, weakHandlerMetatable);

objs.events = {};

objs.events.eveIdToObject = {};
setmetatable(objs.events.eveIdToObject, {__mode="v"});

objs.events.eventsOfObjects = {};
setmetatable(objs.events.eventsOfObjects, {__mode="k"});

objs.events.idGenerator = 1;

function objs.addEventListener(object, eventName, funcCallback)
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
		
	eveItem.funcCallback = function(...)	
		return Async.execute(funcCallback, ...):unwrap();
	end
		
    local evesOfObject = localObjs.events.eventsOfObjects[object];
    
    if evesOfObject == nil then
    	evesOfObject = {};
    	localObjs.events.eventsOfObjects[object] = evesOfObject;
    end;              
	
	localObjs.events.idGenerator = localObjs.events.idGenerator + 1;
	local esteEventId = localObjs.events.idGenerator;	
	
	evesOfObject[esteEventId] = eveItem;	
	localObjs.events.eveIdToObject[esteEventId] = object;				

	local eveDefFinder = object.findEventDef;
	local eveDef;
	
	if eveDefFinder ~= nil then
		eveDef = eveDefFinder(object, eventName);
	else
		eveDef = nil;
	end;
	
	if (eveDef ~= nil) and (type(eveDef) == "table") and (type(eveDef.setter) == "function") then	
        eveItem.haveCustomSetter = true;
        eveItem.setter = eveDef.setter;
		eveDef.setter(object, eveItem.funcCallback);
	else		
		_obj_listenEvent(objectHandle, eventName, esteEventId);	
	end;
	
	return esteEventId; 
end;

function objs.removeEventListenerById(eventId)
	local obj = localObjs.events.eveIdToObject[eventId]; 

	if obj == nil then
		return;
	end;
	
	localObjs.events.eveIdToObject[eventId] = nil;	
	
	local evesOfObject = localObjs.events.eventsOfObjects[obj];
	
	if evesOfObject == nil then
		return;
	end;

	local eventItem = evesOfObject[eventId];
	
	if eventItem == nil then
		return;
	end;
	
	evesOfObject[eventId] = nil;	
		
	if eventItem.haveCustomSetter then		
		eventItem.setter(obj, nil);				
	else	
		_obj_stopListeningEvent(obj.handle, eventId);	
	end;
end;

--[[ Objeto TObject ]]--

objs.class = {
	_isClass = true,
	
	initialize = function(obj)
	end,

	addEventListener = function (obj, eventName, funcCallback)
		return localObjs.addEventListener(obj, eventName, funcCallback);		
	end,
	
	removeEventListener = function (obj, eventListenerId)
		return localObjs.removeEventListenerById(eventListenerId);		
	end,
	
	removeAllEventListeners = function(obj)
		if (obj.handle == nil) then
			return;
		end;
	
		local eventsOfThis = localObjs.events.eventsOfObjects[obj];
		
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
			
			localObjs.events.eventsOfObjects[obj] = nil;			
		end;	
	end,
	
	destroy = function(obj)
		if not obj._calledDestroy then
			obj._calledDestroy = true;			
		    					
			if obj.handle ~= nil then	
				if (obj.removeAllEventListeners ~= nil) then
					obj:removeAllEventListeners();						
				end;	
					
				if objHandlers[obj.handle] == obj then
					objHandlers[obj.handle] = nil;			
				end;
			
				_obj_destruir(obj.handle);
				obj.handle = nil;
			end;	
		end;
	end,
	
	getClassName = function(obj)
		if obj.handle ~= nil then
			return _obj_getClassName(obj.handle);
		else
			return "";
		end;	
	end,
	
	findPropDef = function(obj, propName)
		-- Instance property		
		local props = rawget(obj, "props");			
		
		if props ~= nil then	
			local propKey = props[propName];
			
			if propKey ~= nil then
				return propKey;
			end;
		end;
		
		-- Class property
		local currentClass = rawget(obj, "class");	
		
		while currentClass ~= nil do
			props = rawget(currentClass, "props");			
		
			if props ~= nil then	
				local propKey = props[propName];
				
				if propKey ~= nil then
					return propKey;
				end;				
			end;	
		
			currentClass = rawget(currentClass, "super");
		end;
		
		return nil;
	end,
	
	findEventDef = function(obj, eventName)
		-- Instance event		
		local eves = rawget(obj, "eves");			
		
		if eves ~= nil then	
			local eveKey = eves[eventName];
			
			if eveKey ~= nil then
				return eveKey;
			end;
		end;
		
		-- Class event
		local currentClass = rawget(obj, "class");	
		
		while currentClass ~= nil do
			eves = rawget(currentClass, "eves");			
		
			if eves ~= nil then	
				local eveKey = eves[eventName];
				
				if eveKey ~= nil then
					return eveKey;
				end;				
			end;	
		
			currentClass = rawget(currentClass, "super");
		end;
		
		return nil;
	end	
};

objs.class.listen = objs.class.addEventListener;
objs.class.unlisten = objs.class.removeEventListener;

local function __readPropertyValue(instance, propKey)
	local fgetter;
	
	if type(propKey.getter) == "function" then
		fgetter = propKey.getter;
	else
		fgetter = instance[propKey.getter];
	end;
	
	if fgetter ~= nil then
		return fgetter(instance);
	elseif propKey.readProp ~= nil then
		return _obj_getProp(rawget(instance, 'handle'), propKey.readProp);
	end;
end;

local function __tryIndexObjWithDefinition(definition, instance, key)
	-- Raw Value
	local v = rawget(definition, key);
			
	if (v ~= nil) then
		return true, v;
	end;
 
	-- Property		
	local props = rawget(definition, "props");			
	
	if props ~= nil then	
		local propKey = props[key];
		
		if propKey ~= nil then
			return true, __readPropertyValue(instance, propKey);
		end;
	end;	

	-- Event		
	local eves = rawget(definition, "eves");
	
	if eves ~= nil then
		local eveKey = eves[key];
		
		if eveKey ~= nil then
			-- Existe um evento com este nome.. Vamos retornar o evento principal associado, se existir.
			local mainEves = rawget(instance, "__mainEves");
			
			if mainEves ~= nil then
				return true, mainEves[key];
			end;
		end;
	end;	
	
	-- Custom object __objindex method
	local objIndexMethod = rawget(definition, "__objindex");
	
	if (objIndexMethod ~= nil) and (type(objIndexMethod) == "function") then
		return objIndexMethod(instance, key);
	else
		return false;
	end;
end;

local function __tryNewIndexObjWithDefinition(definition, instance, key, value)
	-- Tentar setar uma propriedade
	local fsetter = nil;		
	local props = rawget(definition, "props");	
	
	if props ~= nil then		
		local propKey = props[key];
		
		if propKey ~= nil then
			if type(propKey.setter) == "function" then
				fsetter = propKey.setter;
			else
				fsetter = instance[propKey.setter];
			end;
			
			if (fsetter == nil) and (propKey.writeProp ~= nil) then
				_obj_setProp(rawget(instance, 'handle'), propKey.writeProp, value);
				return true;
			end;
		end;		
	end;
	
	if fsetter ~= nil then
		fsetter(instance, value);
		return true;
	end;
		
	-- Tentar setar um evento	
	local eves = rawget(definition, "eves");
	
	if eves ~= nil then
		local eveKey = eves[key];
		
		if eveKey ~= nil then
			-- Existe um evento com este nome.. Vamos setar o evento principal associado, se existir.
			local mainEves = rawget(instance, "__mainEves");
			
			if (mainEves == nil) then
				mainEves = {};
				rawset(instance, "__mainEves", mainEves)
			end;
			
			local oldListenerId = mainEves["id_" .. key];
			
			if oldListenerId ~= nil then
				objs.removeEventListenerById(oldListenerId);
				mainEves["id_" .. key] = nil;
			end;
			
			mainEves[key] = value;
			
			if value ~= nil then
				mainEves[key] = value;
				mainEves["id_" .. key] = objs.addEventListener(instance, key, value);
			end;
			
			return true;
		end;
	end;	
	
	-- Custom object __objnewindex method
	local objNewIndexMethod = rawget(definition, "__objnewindex");
	
	if (objNewIndexMethod ~= nil) and (type(objNewIndexMethod) == "function") then
		return objNewIndexMethod(instance, key, value);
	else
		-- Could not newindex object with supplied definition	
		return false;
	end;	
end;

local objectMetaTable = {
	--[[ Comparação padrão entre objetos ]]--
	__eq = function(op1, op2)
		if op1.handle ~= nil then
			if op2.handle ~= nil then
				return op1.handle == op2.handle;
			else
				return false;
			end;
		else
			if op2.handle ~= nil then
				return false;
			else
				return op1 == op2;
			end;		
		end;
	end,
	
	--[[ getter padrão de propriedades dos objetos. Chamado quando tentar gettar uma propriedade que não existe ]]--
	
	__index = function(table, key)
		local r, v;
		
		r, v = __tryIndexObjWithDefinition(table, table, key);
		
		if r then
			return v;
		end;

		-- Verificar classes		
		local currentClass = rawget(table, "class");	
		
		while currentClass ~= nil do
			r, v = __tryIndexObjWithDefinition(currentClass, table, key);
			
			if r then
				return v;
			end;	
		
			currentClass = rawget(currentClass, "super");
		end;
						
		-- Se chegou até aqui, é porque não localizou nenhum valor especial
		return nil;
	end,
	
	--[[ setter padrão de propriedades dos objetos. Chamado quando tentou settar uma propriedade que não existe ]]--
	
	__newindex = function(table, key, value)	
		local r;
		r = __tryNewIndexObjWithDefinition(table, table, key, value);
		
		if r then
			return;
		end;
		
		-- Verificar classes		
		local currentClass = rawget(table, "class");	
		
		while currentClass ~= nil do
			r = __tryNewIndexObjWithDefinition(currentClass, table, key, value);
			
			if r then
				return;
			end;	
		
			currentClass = rawget(currentClass, "super");
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
};

local classMetatable = {
	__index = function(classTable, key)
		if (key == "eves") or (key == "props") then
			return rawget(classTable, key);
		end;
		
		local currentClass = classTable;
		
		while currentClass ~= nil do
			local v = rawget(currentClass, key);
			
			if v ~= nil then
				return v;
			end;
		
			currentClass = rawget(currentClass, "super");
		end;
						
		-- Se chegou até aqui, é porque não localizou nenhum valor especial
		return nil;
	end,

	__newindex = function(classTable, key, value)	
		rawset(classTable, key, value);
	end;
};

function objs.objectFromHandle(handle)
	local obj = {handle=handle,
				 class=objs.class};		
				 
	setmetatable(obj, objectMetaTable);	
	objs.registerHandleIfNeeded(handle, obj);
	return obj;
end

function objs.newPureLuaObject()
	return objs.objectFromHandle(nil);
end;

function objs.__recursiveRunInitialize(obj, class)
	local superClass = class.super;
	
	if superClass ~= nil then
		objs.__recursiveRunInitialize(obj, superClass);
	end;
	
	local initialize = rawget(class, "initialize");
	
	if initialize ~= nil then
		initialize(obj);
	end;
end;

function objs.__createSubclass(superClass)
	assert(superClass ~= nil);	
	local class = {super = superClass, props = {}, eves = {}, _isClass = true};		
		
	class.new = function()
		local obj = {class=class};							 
		setmetatable(obj, objectMetaTable);		
		objs.__recursiveRunInitialize(obj, class);		
		return obj;		
	end;		
		
	class.fromHandle = function(handle)
		local obj = {handle=handle, class=class};							 
		setmetatable(obj, objectMetaTable);	
		objs.registerHandleIfNeeded(handle, obj);
		objs.__recursiveRunInitialize(obj, class);	
		return obj;		
	end;
	
	class.inherit = function() return objs.__createSubclass(class); end;	
	setmetatable(class, classMetatable);
	return class;	
end;

function objs.newClass()
	return objs.__createSubclass(objs.class);
end;

objs.inherit = objs.newClass;

-- ## Component Class 

objs.Component = objs.newClass();

function objs.Component:initialize()	
	rawset(self, "props", {});
	rawset(self, "eves", {});
end;

function objs.Component:getName() return _obj_getProp(self.handle, "Name"); end;
function objs.Component:setName(name) _obj_setProp(self.handle, "Name", name); end;

objs.Component.props["name"] = {setter = "setName", getter = "getName", tipo = "string"};

function objs.componentFromHandle(handle)
	local obj = objs.Component.fromHandle(handle);	
	return obj;
end;

-- ## HierarchyObject Class

objs.HierarchyObject = objs.Component.inherit();

function objs.HierarchyObject:initialize()
	rawset(self, "_children", {});
end;

function objs.HierarchyObject.getChildren(instance)
	local ret = {};
	local idxDest = 1;
	
	for k, v in pairs(instance._children) do
		ret[idxDest] = v;
		idxDest = idxDest + 1;
	end;
	
	return ret;
end;

function objs.HierarchyObject.findChildByName(instance, childName, recursive, superficialSearch)
	recursive = recursive or true;
	local child;		
	
	child = instance[childName];
	
	if type(child) == "table" and (child.handle ~= nil) and (child.getName ~= nil) and (child:getName() == childName) then
		return child;
	end;
	
	if superficialSearch then
		return nil;
	end;
	
	local childs = instance:getChildren();		
	
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

function objs.HierarchyObject.getParent(instance)
	return GUI.fromHandle(_gui_getParent(instance.handle))
end;

function objs.HierarchyObject.setParent(instance, parent)
	if (instance._parent == parent) then
		return;
	end;
	
	if (instance._parent ~= nil) then
		instance._parent._children[instance.handle] = nil;
	end
	
	instance._parent = parent;
	
	if (instance._parent ~= nil) then
		_gui_setParent(instance.handle, parent.handle); 
		instance._parent._children[instance.handle] = instance;
	else
		_gui_setParent(instance.handle, nil); 		
	end;		
end;

objs.HierarchyObject.__oldDestroyHierarchyObject = objs.HierarchyObject.destroy;

function objs.HierarchyObject.destroy(instance)
	instance:removeAllEventListeners();
 
	if instance._children ~= nil then	 		 	
		for k, v in pairs(instance._children) do
			if v ~= nil then
				v:setParent(nil);
			end;
		end;
	 
		instance._children = {};
	end;
	
	if (instance._parent ~= nil) then
		
		if (instance._parent._children ~= nil) and (instance.handle ~= nil) then
			instance._parent._children[instance.handle] = nil;			
		end;
			
		instance._parent = nil;				
	end;			
	
	objs.HierarchyObject.__oldDestroyHierarchyObject(instance);
end;

function objs.hierarchyObjectFromHandle(handle)
	local obj = objs.HierarchyObject.fromHandle(handle);				
	return obj;
end;

-- ## Timer Class

objs.Timer = objs.HierarchyObject.inherit();

function objs.Timer:getInterval() return _obj_getProp(self.handle, "Interval") end;
function objs.Timer:setInterval(v) _obj_setProp(self.handle, "Interval", v) end;
function objs.Timer:getEnabled() return _obj_getProp(self.handle, "Enabled") end;
function objs.Timer:setEnabled(v) _obj_setProp(self.handle, "Enabled", v) end;			
function objs.Timer:beginUpdate() end;
function objs.Timer:endUpdate() end;	

objs.Timer.props["interval"] = {setter = "setInterval", getter = "getInterval", tipo = "int"};	
objs.Timer.props["enabled"] = {setter = "setEnabled", getter = "getEnabled", tipo = "bool"};

objs.Timer.eves["onTimer"] = "";	

function objs.__timerFromHandle(handle)
	local timer = objs.Timer.fromHandle(handle);				
	return timer;
end;

function objs.newTimer(interval, callback)
	local timer = objs.__timerFromHandle(_obj_newObject("timer"));	

	interval = tonumber(interval);
	
	if (type(interval) ~= "number") or (interval < 1) then
		interval = 1;
	end;
	
	timer:setInterval(interval);
	
	if type(callback) == "function" then
		timer:addEventListener("onTimer", callback);
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
	return objHandlers[handle];
end;

function objs.registerHandle(handle, object)
	objHandlers[handle] = object;
end;

function objs.registerHandleIfNeeded(handle, object)
	if objHandlers[handle] == nil then
		objHandlers[handle] = object;
	end;
end

function _rrpgObjs_events_receiver(eventId, ...)
	local obj = localObjs.events.eveIdToObject[eventId];
	
	if obj == nil then
		return;
	end;
	
	local evesOfObject = localObjs.events.eventsOfObjects[obj];
	
	if evesOfObject == nil then
		return;
	end;
	
	local eventItem = evesOfObject[eventId];
	
	if eventItem == nil then		
		return;
	end;
	
	return eventItem.funcCallback(...);
end;

function __EXPORT__objs_tryFindFromHandle(handle)
	return objs.tryFindFromHandle(handle);
end;

return localObjs;