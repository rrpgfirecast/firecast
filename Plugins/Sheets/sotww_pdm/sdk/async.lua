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

Promise.withException = Promise.withError;

return Async