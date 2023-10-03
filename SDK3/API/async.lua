require("system.lua");

Async = {};
Async.Promise = {};

Promise = Async.Promise;

function Async.haveNativeBackendSupport()
	return System.checkAPIVersion(87, 3)
end;

function Promise.__newPromise()
	local p = {}
	
	function p:thenDo(successCallback, errorCallback)
		return Promise.resolved(nil);
	end;
	
	function p:onSuccess(callback)	
		return p:thenDo(callback, nil);
	end
	
	function p:onError(callback)
		return p:thenDo(nil, callback);
	end	
	
	function p:thenResolve(promiseResolution)
		return p:thenDo(
				function(data)
					return promiseResolution:setSuccess(data);
				end,
				
				function(errorMsg)
					return promiseResolution:setFailure(errorMsg);
				end);
	end;
	
	return p;
end;

function Promise.__newStubSuccessPromise(data)
	local p = Promise.__newPromise();
	local previousThenDo = p.thenDo;
	
	function p:thenDo(successCallback, errorCallback)
		if type(successCallback) == "function" then
			successCallback(data);
		end;
		
		return previousThenDo(p, successCallback, errorCallback)
	end;
		
	return p;
end;

function Promise.__newStubFailedPromise(errorMsg)
	local p = Promise.__newPromise();
	local previousThenDo = p.thenDo;
	
	function p:thenDo(successCallback, errorCallback)
		if type(errorCallback) == "function" then
			errorCallback(errorMsg);
		end;
		
		return previousThenDo(p, successCallback, errorCallback)
	end;
		
	return p;
end;

function Promise.wrap(handle)
	local p = Promise.__newPromise();
	p.handle = handle;
	
	function p:thenDo(successCallback, errorCallback)
		local thenDoHandle = _async_promise_thenDo(handle, successCallback, errorCallback);	
		return Promise.wrap(thenDoHandle);
	end;
	
	return p;
end;

function Promise.wrapPromiseResolution(handle) 
	local r = {};
	r.handle = handle;	
	
	function r:setSuccess(data)
		return _async_promiseResolution_setSuccess(handle, data);
	end;
	
	function r:setFailure(errorMsg)
		return _async_promiseResolution_setFailure(handle, errorMsg);
	end;
	
	return r;
end;

function Promise.__newStubPromiseResolution()
	local r = {};
	
	function r:setSuccess(data)
		return false;
	end;
	
	function r:setFailure(errorMsg)
		return false;
	end;
	
	return r;	
end;

-- public API

function Promise.resolved(data)
	if Async.haveNativeBackendSupport() then
		return Promise.wrap(_async_promise_newResolved(data));
	else
		return Promise.__newStubSuccessPromise(data);
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
	if System.checkAPIVersion(87, 4) then
		local promiseHandle, promiseResolutionHandle = _async_promise_newToResolve();
		
		local promise = Promise.wrap(promiseHandle);
		local promiseResolution = Promise.wrapPromiseResolution(promiseResolutionHandle);
	
		return promise, promiseResolution;
	else
		local stubPromise = Promise.__newStubFailedPromise("No API Support");
		local stubPromiseResolution = Promise.__newStubPromiseResolution();
		
		return stubPromise, stubPromiseResolution;	
	end;		
end;

function Promise.toHandle(promise, successCallback, failureCallback)
	assert(promise ~= nil);
	
	local outerPromise, outerResolution = Promise.toResolve();
	
	promise:thenDo(
		function (originalData)
			if successCallback ~= nil then
				local r, newData = pcall(successCallback, originalData);
				
				if r then
					outerResolution:setSuccess(newData);
				else
					outerResolution:setFailure(newData);
				end;
			else
				outerResolution:setSuccess(originalData);
			end;
		end,
		
		function (originalErrorMsg)
			if failureCallback ~= nil then
				local r, newData = pcall(failureCallback, originalErrorMsg);
				
				if r then
					outerResolution:setSuccess(newData);
				else
					outerResolution:setFailure(newData);
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
		   (value.onError ~= nil);
end;

Promise.withException = Promise.withError;
Promise.failed = Promise.withError;
Promise.pending = Promise.toResolve;
Promise.succeeded  = Promise.resolved;

return Async