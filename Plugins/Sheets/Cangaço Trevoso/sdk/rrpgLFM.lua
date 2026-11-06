require("rrpgUtil.lua");
require("rrpgGUI.lua");

local serpent = nil;
local lfmObjectsStrongRef = {};

function lfm_getObject(ctrlOrHandle)
	if ctrlOrHandle == nil then
		return nil;
	elseif isNumber(ctrlOrHandle) then
		return lfmObjectsStrongRef[ctrlOrHandle];
	else
		return ctrlOrHandle;
	end; 	
end;

function lfm_newObjectHandle(className)
	local obj = gui.fromHandle(_obj_newObject(className));
	lfmObjectsStrongRef[obj.handle] = obj;
	return obj.handle;	
end;

function lfm_destroyObject(ctrlOrHandle)
	local obj = lfm_getObject(ctrlOrHandle);
	
	if obj ~= nil then
		lfmObjectsStrongRef[obj.handle] = nil;
		obj:destroy();
	end
end

function lfm_enumEvents(ctrlOrHandle)
	local obj = lfm_getObject(ctrlOrHandle);
		
	local eves = {};
	local qt = 0;
	local alreadyListedEves = {};
	
	local function processEvent(eventName, eventData)
		if not alreadyListedEves[eventName] then
			alreadyListedEves[eventName] = true;
			
			local eveRec = {name = eventName};
			
			if type(eventData) == "table" then
				eveRec.parameters = eventData.arguments or "";	
			else
				eveRec.parameters = eventData or "";
			end;
			
			qt = qt + 1;					
			eves[qt] = eveRec;
		end;	
	end;
	
	-- Instance Defined Events	
	local definedEves = obj.eves;
	
	if definedEves ~= nil then
		for k, v in pairs(obj.eves) do
			processEvent(k, v);
		end;
	end;
	
	-- Class Defined Events
	local currentClass = rawget(obj, "class");
		
	while currentClass ~= nil do
		definedEves = currentClass.eves;
	
		if definedEves ~= nil then
			for k, v in pairs(definedEves) do
				processEvent(k, v);
			end;	
		end;
	
		currentClass = currentClass.super;
	end;			
		
	return eves;
end;

local function __copyPropTable(propName, prop)
	local tbl = {name = propName, tipo = prop.tipo, values = prop.values, getter = prop.getter, setter = prop.setter};
	
	if (prop.tipo == "obj") and (type(prop.class) == "table") then
		tbl.refClassTagName = prop.class.tagName;
	end;
	
	return tbl;
end;

function lfm_enumProps(ctrlOrHandle)
	local obj = lfm_getObject(ctrlOrHandle);
		
	local props = {};
	local qt = 0;
	local alreadyListedProps = {};
	
	local function processProp(propName, prop)
		if not alreadyListedProps[propName] then
			alreadyListedProps[propName] = true;
			qt = qt + 1;
			props[qt] = __copyPropTable(propName, prop);
		end;
	end;
	
	-- Instance Defined Props		
	local definedProps = obj.props;
	
	if definedProps ~= nil then
		for k, v in pairs(definedProps) do
			processProp(k, v);
		end;	
	end;
	
	-- Class Defined Props	
	local currentClass = rawget(obj, "class");
		
	while currentClass ~= nil do
		definedProps = currentClass.props;
	
		if definedProps ~= nil then
			for k, v in pairs(definedProps) do
				processProp(k, v);
			end;	
		end;
	
		currentClass = currentClass.super;
	end;
		
	return props;
end;

function lfm_enumGridPropsForCompiler()
	local gridClass = require("rrpgGUI_grid.dlua");
		
	local props = {};
	local qt = 0;
	local alreadyListedProps = {};
	
	local function processProp(propName, prop)
		if not alreadyListedProps[propName] then
			alreadyListedProps[propName] = true;
			qt = qt + 1;
			props[qt] = __copyPropTable(propName, prop);
		end;
	end;
	
	-- Class Defined Props	
	local currentClass = gridClass;
		
	while currentClass ~= nil do
		definedProps = currentClass.props;
	
		if definedProps ~= nil then
			for k, v in pairs(definedProps) do
				processProp(k, v);
			end;	
		end;
	
		currentClass = currentClass.super;
	end;
		
	return props;	
end;

function lfm_enumGridEventsForCompiler()
	local gridClass = require("rrpgGUI_grid.dlua");
		
	local eves = {};
	local qt = 0;
	local alreadyListedEves = {};
	
	local function processEvent(eventName, eventData)
		if not alreadyListedEves[eventName] then
			alreadyListedEves[eventName] = true;
			
			local eveRec = {name = eventName};
			
			if type(eventData) == "table" then
				eveRec.parameters = eventData.arguments or "";	
			else
				eveRec.parameters = eventData or "";
			end;
			
			qt = qt + 1;					
			eves[qt] = eveRec;
		end;	
	end;
		
	-- Class Defined Events
	local currentClass = gridClass;
		
	while currentClass ~= nil do
		definedEves = currentClass.eves;
	
		if definedEves ~= nil then
			for k, v in pairs(definedEves) do
				processEvent(k, v);
			end;	
		end;
	
		currentClass = currentClass.super;
	end;			
		
	return eves;	
end;

local function _getStrOfSetTable(value)
	local ret = "";	
	local qt = 0;
	
	for k, v in pairs(value) do
		if qt == 0 then
			ret = tostring(v);
		else
			ret = ret .. " " .. tostring(v);	
		end;
		
		qt = qt + 1;
	end;
	
	return ret;
end;

function lfm_valueToStr(value, tipo, valuesOfTipo)
	tipo = lowercase(tipo);

	if tipo == "bool" then
		if value then
			return "true";
		else
			return "false";
		end;
	elseif (tipo == "int")  then
		return tostring(round(value));
	elseif tipo == "double"	then
		return tostring(value);
	elseif tipo == "enum" then
		return tostring(value);
	elseif (tipo == "string") or (tipo == "color") or (tipo == 'url') then
		return value;
	elseif tipo == "set" then
		return _getStrOfSetTable(value, valuesOfTipo);	
	elseif (tipo == "bounds") or (tipo == "table") then
	
		if serpent == nil then
			serpent = require("serpent.dlua");
		end;
		
		return serpent.line(value, {comment = false});
	else
		return "";
	end;
end;

function lfm_strToValue(value, tipo, valuesOfTipo)
	tipo = lowercase(tipo);

	if tipo == "bool" then
		return value == "true";
	elseif (tipo == "int") or (tipo =="double") then
		return tonumber(value);		
	elseif (tipo == "string") or (tipo == "color") or (tipo == "url") then	
		return value;
	elseif tipo == "enum" then
		if isStrInTable(value, valuesOfTipo) then		
			return value;
		else
			return "";
		end;	
	elseif tipo == "set" then
				
		local objSet = {};		
		
		if type(value) == "string" then
			for k, v in pairs(valuesOfTipo) do
				if string.find(value, v) then
					objSet[#objSet + 1] = v;
				end;		
			end;
		elseif type(value) == "table" then
			objSet = value;
		end;
		
		return objSet;		
	elseif (tipo == "bounds") or (tipo == "table") then
		f, e = load("return " .. value);		
		if e then error(e) end
		return f();
	else
		return nil;
	end;
end;

local function simplificarTable(t)
	local ret = {};	
	
	for k, v in pairs(t) do
		if isNumber(k) or (k == v) then
			ret[#ret + 1] = v;
		else
			ret[k]=v;
		end;		
	end;
	
	return ret;
end

function lfm_valueToStrToUser(value, tipo, valuesOfTipo)
	tipo = lowercase(tipo);

	if tipo == "set" then
		if serpent == nil then
			serpent = require("serpent.dlua");
		end;
		
		return serpent.line(simplificarTable(value), {comment = false});
	else
		return lfm_valueToStr(value, tipo, valuesOfTipo);
	end;
end;

function lfm_getPropAsString(ctrlOrHandle, propName)
	local obj = lfm_getObject(ctrlOrHandle);
	local props = obj.props;
		
	if props == nil then
		return nil;
	end;
	
	local prop = props[propName];
	
	if prop == nil then
		return nil;
	end;
	
	local getter = obj[prop.getter];
	local v = getter(obj);
	
	return lfm_valueToStr(v, prop.tipo, prop.values); 
end;

function lfm_setPropAsString(ctrlOrHandle, propName, vAsStr)
	local obj = lfm_getObject(ctrlOrHandle);
	local prop;
	
	if obj.findPropDef ~= nil then
		prop = obj:findPropDef(propName);
	end;	
	
	if prop == nil then
		local props = obj.props;

		if props ~= nil then
			prop = props[propName];
		end;
	end;
	
	if prop == nil then
		return nil;
	end;
	
	v = lfm_strToValue(vAsStr, prop.tipo, prop.values);
	obj[propName] = v;	
end;

function lfm_getPropAsStringToUser(ctrlOrHandle, propName)
	local obj = lfm_getObject(ctrlOrHandle);
	local props = obj.props;
		
	if props == nil then
		return nil;
	end;
	
	local prop = props[propName];
	
	if prop == nil then
		return nil;
	end;
	
	local getter = obj[prop.getter];
	local v = getter(obj);
	
	return lfm_valueToStrToUser(v, prop.tipo, prop.values); 
end;


function lfm_setParent(ctrlOrHandleFilho, ctrlOrHandlePai)
	local objFilho = lfm_getObject(ctrlOrHandleFilho);
	local objPai = lfm_getObject(ctrlOrHandlePai);
	objFilho:setParent(objPai);
end;

local function walkHierarchyAndGetTagClassName(class)
	local currentClass = class;
	
	while type(currentClass) == "table" do
		local tagName = rawget(currentClass, "tagName");
		
		if type(tagName) == "string" then
			return tagName;
		end;
		
		currentClass = currentClass.super;
	end;
	
	return nil;
end;

function lfm_enumerarClasses()
	local ret = {};
	
	for k, v in pairs(gui.guiClasses) do
		local tagName = rawget(v, "tagName");
		
		assert(k == tagName, string.format('k = %s, tagName = %s', k, tagName));
		assert(ret[tagName] == nil, tagName);
		
		local c = {name = tagName, 
				   parentClassName = walkHierarchyAndGetTagClassName(v.super)};
	
		ret[tagName] = c;
	end;
	
	return ret;
end;