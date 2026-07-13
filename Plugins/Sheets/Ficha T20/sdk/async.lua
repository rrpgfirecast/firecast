local Log = require("log.lua");

local _ASYNC_EXEC_AWAIT_CO_RET = "_co:await";
local _ASYNC_EXEC_IDLE_COROUTINE_RET = "_co:idle";

Async = {};
Async.Promise = {};

Promise = Async.Promise;

Async._ASYNC_EXEC_AWAIT_CO_RET = _ASYNC_EXEC_AWAIT_CO_RET;

local _asyncExecution = {idleCoroutines = {},
				         idleCoroutinesCount = 0,
					     maxIdleCoroutines = 8};

function Async.haveNativeBackendSupport()
	return true;
end;

--- Base Promise MetaTable

local BasePromiseMetatable = {}
BasePromiseMetatable.__index = BasePromiseMetatable;

function BasePromiseMetatable:thenFinally(callback)
	local wrappedContinuationCallback = 
		function(ignoredParameter)
			if callback ~= nil then
				return callback();
			end;
		end;

	return self:thenDo(wrappedContinuationCallback, wrappedContinuationCallback);				
end;

function BasePromiseMetatable:onSuccess(callback)
	return self:thenDo(callback, nil);
end;

function BasePromiseMetatable:onError(callback)
	return self:thenDo(nil, callback);
end;

function BasePromiseMetatable:thenResolve(promiseResolution)
	return self:thenDo(
		function(...)
			return promiseResolution:setSuccess(...);
		end,
		
		function(errorMsg)
			return promiseResolution:setFailure(errorMsg);
		end);
end;

function BasePromiseMetatable:unwrap()
	local ret = table.pack(self:peek());
			
	if ret[1] then
		if ret[2] then
			return table.unpack(ret, 3);
		else
			reraise(ret[3]);
		end;
	else	
		return self;
	end;
end;

function BasePromiseMetatable:await()
	return Async.await(self);
end;

function BasePromiseMetatable:pawait()
	return Async.pawait(self);
end;

--- Concrete Promise MetaTable

local PromiseMetatable = {};
setmetatable(PromiseMetatable, BasePromiseMetatable);
PromiseMetatable.__index = PromiseMetatable; 

function PromiseMetatable:peek()
	if _async_promise_peek ~= nil then
		return _async_promise_peek(self.handle);
	else
		return false;
	end;
end;

function PromiseMetatable:thenDo(successCallback, errorCallback)
	local thenDoHandle = _async_promise_thenDo(self.handle, successCallback, errorCallback);	
	return Promise.wrap(thenDoHandle);	
end;

-- PromiseResolution Metatable

local PromiseResolutionMetatable = {};
PromiseResolutionMetatable.__index = PromiseResolutionMetatable;
	
function PromiseResolutionMetatable:setSuccess(...)
	return _async_promiseResolution_setSuccess(self.handle, ...);
end;

function PromiseResolutionMetatable:setFailure(...)
	return _async_promiseResolution_setFailure(self.handle, ...);
end;

function PromiseResolutionMetatable:setUserAborted()
	return _async_promiseResolution_setUserAborted(self.handle);
end;	

-- Promises Creation
		
function Promise.__newBaseStubPromise()
	local p = {}
	setmetatable(p, BasePromiseMetatable);	
	return p;
end;

function Promise.__newStubSuccessPromise(data)
	local p = Promise.__newBaseStubPromise();
	local previousThenDo = p.thenDo;
	
	function p:peek()
		return true, true, data;
	end;
	
	function p:thenDo(successCallback, errorCallback)
		if type(successCallback) == "function" then
			successCallback(data);
		end;
		
		return previousThenDo(p, successCallback, errorCallback)
	end;
		
	return p;
end;

function Promise.__newStubFailedPromise(errorMsg)
	local p = Promise.__newBaseStubPromise();
	local previousThenDo = p.thenDo;
	
	function p:peek()
		return true, false, errorMsg;
	end;	
	
	function p:thenDo(successCallback, errorCallback)
		if type(errorCallback) == "function" then
			errorCallback(errorMsg);
		end;
		
		return previousThenDo(p, successCallback, errorCallback)
	end;
		
	return p;
end;

function Promise.__newStubPendingPromise()
	local p = Promise.__newBaseStubPromise();
	
	p.__resolved = false;
	
	-- Promise interface
	
	function p:peek()
		if self.__resolved then
			return true, p.__success, table.unpack(p.__data);
		else	
			return false;
		end;
	end;	
	
	function p:thenDo(successCallback, errorCallback)
		if self.__resolved then
			if self.__success and type(successCallback) == "function" then
				successCallback(table.unpack(self.__data));
			elseif not self.__success and type(errorCallback) == "function" then
				errorCallback(table.unpack(self.__data));
			end;	
		else
			if type(errorCallback) == "function" then
				errorCallback("No API Support");
			end;
		end;
		
		return Async.Promise.failed("No API Support");
	end;
	
	-- PromiseResolution interface
	
	function p:setSuccess(...)
		if not self.__resolved then
			self.__resolved = true;
			self.__success = true;
			self.__data = table.pack(...);
		else
			return false;
		end;
	end;
	
	function p:setFailure(errorMsg)
		if not self.__resolved then
			self.__resolved = true;
			self.__success = false;
			self.__data = {errorMsg};
		else
			return false;
		end;
	end;
	
	function p:setUserAborted()
		return self:setFailure("UserAbortedException");
	end;	
		
	return p;
end;

function Promise.wrap(handle)
	local p = {}	
	setmetatable(p, PromiseMetatable);			
	p.handle = handle;
	return p;
end;

function Promise.wrapPromiseResolution(handle) 
	local r = {};
	setmetatable(r, PromiseResolutionMetatable);
	r.handle = handle;	
		
	return r;
end;

function _asyncExecution.__asyncExecAwaitPromise(co, promise)
	promise:thenDo(
		function (...)
			_asyncExecution.resume(co, true, ...);
		end,
		
		function (errorMsg)
			_asyncExecution.resume(co, false, errorMsg);
		end);
end;

function _asyncExecution.resume(co, ...)
	local retData = table.pack(coroutine.resume(co, ...));
												
	if not retData[1] then
		Log.e("Async.execute", "coroutine execution failure: " .. tostring(retData[2]));
	else
		if retData[2] == _ASYNC_EXEC_IDLE_COROUTINE_RET then	
			_asyncExecution.releaseIdleCoroutine(co); 
		elseif retData[2] == _ASYNC_EXEC_AWAIT_CO_RET then		
			local r, errorMessage = pcall(_asyncExecution.__asyncExecAwaitPromise, co, retData[3]);
			 
			if not r then
				_asyncExecution.resume(co, false, errorMessage);	
			end;
		elseif coroutine.status(co)	== "dead" then	
			Log.e("Async.execute", "Coroutine died before expected");
		else	
			Log.e("Async.execute", "Unhandled coroutine.yield case: " .. tostring(retData[2]));
		end;
	end;
end;

function _asyncExecution.entrypoint(mustExecute, fn, arguments, promiseResolution)
	while mustExecute do
		local ret = table.pack(pcall(fn, table.unpack(arguments)));
		
		if ret[1] then
			promiseResolution:setSuccess(table.unpack(ret, 2));
		else
			promiseResolution:setFailure(ret[2]);
			Log.w("Async.execute", tostring(ret[2]));			
			require("dialogs.lua").showErrorMessage(ret[2]);
		end;
			
		fn, arguments, promiseResolution, ret = nil, nil, nil, nil;	
		
		-- fn, arguments, promiseResolution and ret are used below as parameter just to avoid rdk command line linter warning
		mustExecute, fn, arguments, promiseResolution = coroutine.yield(_ASYNC_EXEC_IDLE_COROUTINE_RET, fn and arguments and promiseResolution and ret); 
	end;
end;

function _asyncExecution.createIdleCoroutine()
	return coroutine.create(_asyncExecution.entrypoint);
end;

function _asyncExecution.acquireIdleCoroutine()
	if _asyncExecution.idleCoroutinesCount > 0 then
		local co = _asyncExecution.idleCoroutines[_asyncExecution.idleCoroutinesCount];
		_asyncExecution.idleCoroutinesCount = _asyncExecution.idleCoroutinesCount - 1;	
		return co;
	else			
		return _asyncExecution.createIdleCoroutine();
	end;
end;

function _asyncExecution.releaseIdleCoroutine(co)
	if _asyncExecution.idleCoroutinesCount < _asyncExecution.maxIdleCoroutines then
		_asyncExecution.idleCoroutinesCount = _asyncExecution.idleCoroutinesCount + 1;
		_asyncExecution.idleCoroutines[_asyncExecution.idleCoroutinesCount] = co;
	else
		coroutine.resume(co, false, nil, nil, nil);
	end;
end;

-- Exported API to the Firecast Executable

function __async_start_execution(fn, ...)
	return Async.execute(fn, ...);
end;

-- Async.Promise public API

function Promise.resolved(...)
	if Async.haveNativeBackendSupport() then
		return Promise.wrap(_async_promise_newResolved(...));
	else
		return Promise.__newStubSuccessPromise(...);
	end;	
end;

function Promise.withError(errorMsg)
	if Async.haveNativeBackendSupport() then
		return Promise.wrap(_async_promise_newWithException(errorMsg));
	else
		return Promise.__newStubFailedPromise(errorMsg);	
	end;		
end;

function Promise.toResolve()
	local promiseHandle, promiseResolutionHandle = _async_promise_newToResolve();
	
	local promise = Promise.wrap(promiseHandle);
	local promiseResolution = Promise.wrapPromiseResolution(promiseResolutionHandle);

	return promise, promiseResolution;
end;

function Promise.toHandle(promise, successCallback, failureCallback)
	assert(promise ~= nil);
	
	local outerPromise, outerResolution = Promise.toResolve();
	
	promise:thenDo(
		function (...)
			if successCallback ~= nil then
				local ret = table.pack(pcall(successCallback, ...));
				
				if ret[1] then
					outerResolution:setSuccess(table.unpack(ret, 2));
				else
					outerResolution:setFailure(ret[2]);
				end;
			else
				outerResolution:setSuccess(...);
			end;
		end,
		
		function (originalErrorMsg)
			if failureCallback ~= nil then
				local ret = table.pack(pcall(failureCallback, originalErrorMsg));
				
				if ret[1] then
					outerResolution:setSuccess(table.unpack(ret, 2));
				else
					outerResolution:setFailure(ret[2]);
				end;			
			else
				outerResolution:setFailure(originalErrorMsg);
			end;		
		end);
		
	return outerPromise;
end;

function Promise.isPromise(value)	
	return (type(value) == "table") and 
	       (value.thenDo ~= nil) and
		   (value.onError ~= nil) and
		   (value.await ~= nil);
end;

function Promise.all(...)
	local normalized = {};
	local argsTable = table.pack(...);
	
	for i = 1, #argsTable, 1 do
		local item = argsTable[i];
		
		if Promise.isPromise(item) then
			normalized[#normalized + 1] = item.handle;
		else
			for j = 1, #item, 1 do
				local subItem = item[j];
				
				if Promise.isPromise(subItem) then
					normalized[#normalized + 1] = subItem.handle;
				end;
			end;
		end;
	end;

	return Promise.wrap(_async_promise_newAll(normalized));	
end;

-- Async library public API

function Async.await(promise)
	if (coroutine.isyieldable ~= nil) and not coroutine.isyieldable() then
		error("Is not possible to await outside a coroutine. Please consider using the Async.execute function");
	end;	

	if not Promise.isPromise(promise) then
		return promise;
	end;
	
	local ret = table.pack(promise:peek());
	
	if ret[1] then
		if ret[2] then	
			if #ret >= 3 then
				return table.unpack(ret, 3);
			else
				return nil;
			end;
		else
			local traceMessage = ret[3] .. "\n" .. debug.traceback(coroutine.running(), nil, 2);	
			reraise(traceMessage);					
		end;
	end;

	ret = table.pack(coroutine.yield(_ASYNC_EXEC_AWAIT_CO_RET, promise));
	
	if ret[1] then
		if #ret >= 2 then
			return table.unpack(ret, 2);
		else	
			return nil;
		end;
	else	
		local traceMessage = ret[2] .. "\n" .. debug.traceback(coroutine.running(), nil, 2);	
		reraise(traceMessage);
	end;
end;

function Async.pawait(promise)
	if (coroutine.isyieldable ~= nil) and not coroutine.isyieldable() then
		error("Is not possible to pawait outside a coroutine. Please consider using the Async.execute function");
	end;	

	if not Promise.isPromise(promise) then
		return true, promise;
	end;
	
	local ret = table.pack(promise:peek());
	
	if ret[1] then
		return table.unpack(ret, 2);
	else
		return coroutine.yield(_ASYNC_EXEC_AWAIT_CO_RET, promise);	
	end;	
end;

function Async.execute(fn, ...)
	local co = _asyncExecution.acquireIdleCoroutine();	
	local promise, resolution = Async.Promise.pending();
	
	_asyncExecution.resume(co, true, fn, table.pack(...), resolution);
	
	return promise;
end;

Promise.withException = Promise.withError;
Promise.failed = Promise.withError;
Promise.pending = Promise.toResolve;
Promise.succeeded  = Promise.resolved;
Promise.resolve = Promise.resolved;
Promise.reject = Promise.withError;
await = Async.await;
pawait = Async.pawait;

return Async