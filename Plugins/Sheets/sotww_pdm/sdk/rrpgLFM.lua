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
	
	for k, v in pairs(obj.eves) do
		qt = qt + 1;
		eves[qt] = {name = k, parameters = v};
	end;
		
	return eves;
end;

function lfm_enumProps(ctrlOrHandle)
	local obj = lfm_getObject(ctrlOrHandle);
		
	local props = {};
	local qt = 0;
	
	for k, v in pairs(obj.props) do
		qt = qt + 1;
		props[qt] = {name = k, tipo = v.tipo, values = v.values, getter = v.getter, setter = v.setter};
	end;
		
	return props;
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
	local props = obj.props;
		
	if props == nil then
		return nil;
	end;
	
	local prop = props[propName];
	
	if prop == nil then
		return nil;
	end;
	
	v = lfm_strToValue(vAsStr, prop.tipo, prop.values);
	local setterName = prop.setter;
	
	if setterName ~= nil then
		local setter = obj[setterName];
		setter(obj, v);
	else
		local writePropName = prop.writeProp;
		
		if writePropName == nil then
			error(propName .. " is readonly");			
		end;
		
		_obj_setProp(obj.handle, writePropName, v);
	end;	
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

function lfm_enumerarClasses()
	local ret = {};
	
	for k, v in pairs(gui.guiLoaders) do
		ret[#ret + 1]= k;
	end;
	
	return ret;
end;