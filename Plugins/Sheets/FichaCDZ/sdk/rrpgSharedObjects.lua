local SharedObjects = {};
local registeredUnpackers = {};

local __SHAREDOBJ_PREFIX = "##RRPGshObj(";
local __SHAREDOBJ_SUFIX = ")##";
local __MATCH_SHARED_OBJ = "##RRPGshObj%((.+)%)##"
local __MATCH_SHARED_OBJ_NOCAPTURE = "##RRPGshObj%([^%(%)#]+%)##"

local __SHAREDARRAYOBJ_PREFIX = "@@RRPGshObjArray(";
local __SHAREDARRAYOBJ_SUFIX = ")@@";
local __SHAREDARRAYOBJ_SEP = ",";
local __MATCH_SHARED_ARRAYOBJ = "@@RRPGshObjArray%((.+)%)@@"

local function sidToString(sid)		
	if type(sid) == "table" then
		if sid.extra ~= nil then
			return _internet_HTTPEncode(sid.objectType) .. "\\" .. 
				   _internet_HTTPEncode(sid.objectID) .. "\\" ..
				   _internet_HTTPEncode(sid.extra);
		else
			return _internet_HTTPEncode(sid.objectType) .. "\\" .. 
				   _internet_HTTPEncode(sid.objectID);
		end;
	else
		return "";
	end;
end;

local __strToSidOrder = {"objectType", "objectID", "extra"}

local function stringToSid(str)		
	local sid = {};
	
	if str ~= nil and type(str) == "string" then	
		local ordem = 1;
		
		for t in string.gmatch(str, "[^\\]+") do
			local k = __strToSidOrder[ordem];
			
			if k ~= nil then
				sid[k] = _internet_HTTPDecode(t);
			end;
			
			ordem = ordem + 1;
		end;
	end;
	
	sid.objectType = sid.objectType or "";
	sid.objectID = sid.objectID or "";
	return sid;
end;

function SharedObjects.tryPack(tabela)
	if type(tabela) ~= "table" then
		return false;
	end;

	local h = rawget(tabela, "handle");
	
	if h ~= nil then
		local so = nil;
		local fnGetShareObjectID = rawget(tabela, "getShareID");					
		
		if (fnGetShareObjectID ~= nil) and (type(fnGetShareObjectID) == "function") then
			local sid = fnGetShareObjectID(tabela);
			so = __SHAREDOBJ_PREFIX .. sidToString(sid) .. __SHAREDOBJ_SUFIX;				
		end;

		return true, so;
	else
		local qtNaTabela = #tabela;
		
		if qtNaTabela > 0 then
			-- Pode ser um array....
			local bStr = __SHAREDARRAYOBJ_PREFIX;
			local qtPacked = 0;
			
			for i = 1, #tabela, 1 do
				local xR, xStr = SharedObjects.tryPack(tabela[i]);
				
				if xR then
					if qtPacked > 0 then
						bStr = bStr .. __SHAREDARRAYOBJ_SEP;
					end;
					
					bStr = bStr .. xStr;
					qtPacked = qtPacked + 1;
				end;
			end;	

			if qtPacked > 0 then
				return true, bStr .. __SHAREDARRAYOBJ_SUFIX; 
			else
				return false;
			end
		else
			return false;
		end
	end;
end;

function SharedObjects.tryUnpack(str)
	if str == nil then
		return false;
	end;

	local arrayContent = string.match(str, __MATCH_SHARED_ARRAYOBJ);		
	
	if arrayContent ~= nil then
		-- Um array de objetos
		local tabela = {};
		
		for sObj in string.gmatch(arrayContent, __MATCH_SHARED_OBJ_NOCAPTURE) do
			local xR, xObj = SharedObjects.tryUnpack(sObj);
			
			if xR then
				tabela[#tabela + 1] = xObj;
			end;
		end;
		
		if #tabela > 0 then
			return true, tabela;
		else
			return false;
		end;
	else
		local strSid = string.match(str, __MATCH_SHARED_OBJ);
		
		if strSid ~= nil then
			local sid = stringToSid(strSid);
			local unpacker = registeredUnpackers[sid.objectType];
			
			if unpacker ~= nil then
				local so = unpacker(sid);
				return true, so; 
			else
				return false;
			end;
		else
			return false;		
		end;	
	end;
end;

function SharedObjects.registerUnpacker(objectType, unpackerCallback)
	registeredUnpackers[objectType] = unpackerCallback;
end;

return SharedObjects;