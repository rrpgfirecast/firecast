local rrpgObjs = require("rrpgObjs.lua");
utils = {};
Utils = utils;

function lowercase(s)
	return string.lower(s);
end;

function uppercase(s)
	return string.upper(s);
end;

function isNumber(v)
	return type(v) == "number";
end;

function isnumber(v)
	return type(v) == "number";
end;

function floor(v)
	return math.floor(v);
end;

function round(v)
	return floor(v + 0.5);
end;

function utils.tryFinally(tryCallback, finallyCallback)
	return _util_tryFinally(tryCallback, finallyCallback);
end;

tryFinally = utils.tryFinally;

function isStrInTable(s, table)
	for k, v in ipairs(table) do
		if (k == s) or (v == s) then
			return true;
		end;
	end;
	
	return false;
end;

function removerAcentos(str)
	return utils.removerAcentos(str);
end;


function strToTable(str)
	return totable(str);
end;

function tableToStr(tabela, pretty)
	local serpent = require("serpent.dlua");

	if pretty then
		return serpent.block(tabela, {comment=false});
	else
		return serpent.line(tabela, {comment=false});
	end;
end;

utils.tableToStr = tableToStr;
utils.strToTable = strToTable;

function utils.removerAcentos(str)
	return _util_removerAcentos(str);
end;

function utils.removerFmtChat(str, removerSmileys)
	if removerSmileys == nil then
		removerSmileys = false;
	end;
	
	return _util_removerTagsDeFormatacaoDeChat(str, not (not removerSmileys));
end;

function utils.compareStringPtBr(strLeft, strRight)
	return _util_compareStringsPtBr(strLeft, strRight);
end;

function utils.sortPtBrArray(array)
	table.sort(array, function(l, r) return utils.compareStringPtBr(l, r) < 0; end);		
end;

local __settedTimers = {};
local __timersGeneratorId = 1;

local function __unsetupTemporizador(timerId, temporizador)
	if temporizador == nil then
		temporizador = __settedTimers[timerId];
	end;
	
	__settedTimers[timerId] = nil;
	
	if (temporizador ~= nil) and (temporizador.timer ~= nil) then
		local timer = temporizador.timer;
		timer.enabled = false;
		--timer:removeEventListener(temporizador.onTimerEventListenerId);
		temporizador.callback = nil;
		temporizador.parametros = nil;
		temporizador.timer = nil; -- liberar para o garbage collector		
		--timer:destroy();
	end;
end;

local function __setupTemporizador(callback, interval, isInterval, ...)
	if (type(callback) ~= "function") or (type(interval) ~= "number") then
		return nil;
	end;
	
	if interval < 1 then
		interval = 1;
	end;
	
	__timersGeneratorId = __timersGeneratorId + 1;	
	
	local temporizador = {};
	local timer = rrpgObjs.newTimer();
	local timerId = __timersGeneratorId;
	

	temporizador.id = timerId; 
	temporizador.timer = timer;
	temporizador.interval = interval;
	temporizador.isInterval = isInterval;
	temporizador.callback = callback;
	temporizador.parametros = table.pack(...);
	
	temporizador.onTimerEventListenerId = timer:addEventListener("onTimer", 
			function ()
				local callbackFunction = temporizador.callback;
				local parametros = temporizador.parametros;
				
				if not temporizador.isInterval then
					__unsetupTemporizador(timerId, temporizador);
				end;
			
				local ret;
				
				if callbackFunction ~= nil then
					if parametros ~= nil then
						ret = callbackFunction(table.unpack(parametros));
					else
						ret = callbackFunction();
					end;
				else
					ret = false;
				end;
				
				if temporizador.isInterval and (ret == false) then
					__unsetupTemporizador(timerId, temporizador);
				end;
			end);
		
	__settedTimers[timerId] = temporizador;
	timer.interval = interval;
	timer.enabled = true;	
	return timerId;
end;

function utils.setTimeout(callback, interval, ...)
	interval = tonumber(interval);
	
	if (interval == nil) or (interval <= 0) then
		callback(...);
		return nil;
	else
		return __setupTemporizador(callback, interval, false, ...);
	end;
end;

function utils.setInterval(callback, interval, ...)
	return __setupTemporizador(callback, interval, true, ...);
end;

function utils.clearInterval(intervalId)
	return __unsetupTemporizador(intervalId);
end;

function utils.clearTimeout(timeoutId)
	return __unsetupTemporizador(timeoutId);
end;

function setTimeout(callback, interval, ...)
	return utils.setTimeout(callback, interval, ...);
end;

function setInterval(callback, interval, ...)
	return utils.setInterval(callback, interval, ...);
end;

function clearInterval(intervalId)
	return utils.clearInterval(intervalId);
end;

function clearTimeout(timeoutId)
	return utils.clearTimeout(timeoutId);
end;

function utils.binaryEncode(destArray, format, value, startIndex)
	if type(destArray) ~= "table" then
		return;
	end;
	
	if type(startIndex) ~= "number" then
		startIndex = 1;
	end;
	
	return _util_binaryEncode(destArray, format, value, startIndex);
end;

function utils.binaryDecode(sourceArray, format, startIndex, length)
	if type(sourceArray) ~= "table" then
		return nil;
	end;
	
	if type(startIndex) ~= "number" then
		startIndex = 1;
	end;
	
	if type(length) ~= "number" then
		length = #sourceArray - startIndex + 1;
	end;
	
	return _util_binaryDecode(sourceArray, format, startIndex, length);
end;

function utils.getBinarySize(format)
	return _util_getBinarySize(format); 
end;

local __streamProps = nil;

function utils.streamFromHandle(handle)
	local stream = rrpgObjs.tryFindFromHandle(handle);
	
	if stream ~= nil then
		return stream;
	end;
	
	stream = rrpgObjs.objectFromHandle(handle);
	
	function stream:getSize() return _obj_getProp(self.handle, "Size"); end;
	function stream:setSize(v) _obj_setProp(self.handle, "Size", v); end;
	
	function stream:getPosition() return _obj_getProp(self.handle, "Position"); end;
	function stream:setPosition(v) _obj_setProp(self.handle, "Position", v); end;	
	
	function stream:read(destArray, qtBytes) return _obj_invokeEx(self.handle, "ReadBytes", destArray, qtBytes); end;
	function stream:write(sourceArray, qtBytes) return _obj_invokeEx(self.handle, "WriteBytes", sourceArray, qtBytes); end;
	
	function stream:getRemainingBytes() 
		local r = self.size - self.position;  
		
		if r < 0 then
			return 0;
		else 
			return r;
		end;
	end;
	
	function stream:close() _obj_invoke(self.handle, "Close"); end;
	
	function stream:writeBinary(format, ...)
		local qt = select("#", ...);
		local qtBytesEscrito = 0;
		local binario = {};
		
		for i = 1, qt, 1 do
			local v = select(i, ...);
			local qtBytesEste = utils.binaryEncode(binario, format, v);
			local qtEscritoNeste = self:write(binario, qtBytesEste);
			qtBytesEscrito = qtBytesEscrito + qtEscritoNeste;
			
			if qtEscritoNeste < qtBytesEste then
				return qtBytesEscrito;
			end;
		end;
		
		return qtBytesEscrito; 
	end;		
	
	function stream:readBinary(format, qt)
		local qtBytesPorItem = utils.getBinarySize(format);
		local qtBytesALer;
			
		if type(qt) ~= "number" then
			qt = 1;
		end;
		
		if qt <= 0 then
			return; 
		end;
			
		if qtBytesPorItem < 0 then
			-- tamanho variável.
			qtBytesALer = self.remainingBytes;		
		else
			qtBytesALer = qt * qtBytesPorItem;
		end;		
		
		local bts = {};
		local bytesLido = self:read(bts, qtBytesALer);
		
		if (qt == 1) or (qtBytesPorItem <= 0) then
			return utils.binaryDecode(bts, format, 1, bytesLido);
		else
			local retornos = {};
			local currentIndex = 1;
			
			for i = 1, qt, 1 do
				local retValue, bytesUsados = utils.binaryDecode(bts, format, currentIndex, qtBytesPorItem);  
				retornos[i] = retValue;
				currentIndex = currentIndex + bytesUsados;
			end;
			
			return table.unpack(retornos);
		end;
	end;
	
	function stream:readAsBase64(qtBytes)
		if qtBytes == nil then
			qtBytes = self.remainingBytes;
		else 
			qtBytes = tonumber(qtBytes);
			
			if qtBytes < 0 then
				qtBytes = 0;
			elseif qtBytes > self.remainingBytes then
				qtBytes = self.remainingBytes;
			end;
		end;
		
		return _obj_invoke(self.handle, "ReadAsBase64", qtBytes);
	end;
	
	function stream:writeBase64(str)
		if str == nil or str == "" then
			return 0;
		end;
		
		return _obj_invoke(self.handle, "WriteBase64", tostring(str));
	end;
	
	function stream:copyFrom(sourceStream, qtBytes)
		qtBytes = tonumber(qtBytes);
	
		if (type(sourceStream) ~= "table") or (sourceStream.handle == nil) or (qtBytes == nil) or (qtBytes <= 0) then
			return 0;
		end;				

		return _obj_invokeEx(self.handle, "CopyFrom", sourceStream.handle, qtBytes);
	end;	
	
	function stream:share() return _obj_invoke(self.handle, "ShareStream"); end;
	
	function stream:getMD5() return _obj_invoke(self.handle, "CalculateMD5"); end;
	function stream:getSHA1() return _obj_invoke(self.handle, "CalculateSHA1"); end;
	
	if __streamProps == nil then
		__streamProps = stream.props or {};
		__streamProps["size"] =  {setter = "setSize", getter = "getSize", tipo = "int"};
		__streamProps["position"] =  {setter = "setPosition", getter = "getPosition", tipo = "int"};
		__streamProps["remainingBytes"] =  {getter = "getRemainingBytes", tipo = "int"};
		__streamProps["md5"] =  {getter = "getMD5", tipo = "string"};		
		__streamProps["sha1"] =  {getter = "getSHA1", tipo = "string"};			
	end;
	
	stream.props = __streamProps;
	
	rrpgObjs.registerHandle(handle, stream);
	return stream;
end;

string.upper = function(str)
	return _util_upperCase(str);
end;

string.lower = function(str)
	return _util_lowerCase(str);
end;

function utils.zlibCompress(sourceStream, destStream, level, qtBytesInSource)		
	if level ~= "none" and level ~= "fastest" and level ~= "default" and level ~= "max" then
		level = "default";
	end;
		
	if qtBytesInSource == nil then
		qtBytesInSource = sourceStream.remainingBytes;
	else
		qtBytesInSource = tonumber(qtBytesInSource);
		
		if qtBytesInSource < 0 then
			qtBytesInSource = 0;
		elseif qtBytesInSource > sourceStream.remainingBytes then
			qtBytesInSource = sourceStream.remainingBytes;
		end;
	end;	
	
	return _util_zlibCompress(sourceStream.handle, destStream.handle, level, qtBytesInSource);
end;

function utils.zlibDecompress(sourceStream, destStream)
	return _util_zlibDecompress(sourceStream.handle, destStream.handle);
end;

function utils.zlibCompressAsync(sourceStream, destStream, level, qtBytesInSource, onFinish, onError)		
	if level ~= "none" and level ~= "fastest" and level ~= "default" and level ~= "max" then
		level = "default";
	end;
		
	if qtBytesInSource == nil then
		qtBytesInSource = sourceStream.remainingBytes;
	else
		qtBytesInSource = tonumber(qtBytesInSource);
		
		if qtBytesInSource < 0 then
			qtBytesInSource = 0;
		elseif qtBytesInSource > sourceStream.remainingBytes then
			qtBytesInSource = sourceStream.remainingBytes;
		end;
	end;	
	
	local compressObject = require("rrpgUtil_async.dlua").newAsyncZLibObject();
	compressObject:zlibCompressAsync(sourceStream, destStream, level, qtBytesInSource, onFinish, onError);
end;

function utils.zlibDecompressAsync(sourceStream, destStream, onFinish, onError)
	local compressObject = require("rrpgUtil_async.dlua").newAsyncZLibObject();
	compressObject:zlibDecompressAsync(sourceStream, destStream, onFinish, onError);	
end;

function utils.newMemoryStream()
	return utils.streamFromHandle(_util_newMemoryStream());
end;

function utils.newTempFileStream()
	return utils.streamFromHandle(_util_newTempFileStream());
end;

function utils.openSharedStream(sharedId)
	return utils.streamFromHandle(_util_openSharedStream(sharedId));
end;

function utils.generateUniqueString()
	return _rrpg_generateUniqueStrID();
end;

utils.colorToRGBA = _gui_colorToRGBA;
utils.RGBAToColor = _gui_RGBAToColor;

colorToRGBA = utils.colorToRGBA;
RGBAToColor = utils.RGBAToColor;

return utils;