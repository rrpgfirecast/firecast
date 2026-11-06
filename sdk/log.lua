require("system.lua");

Log = {}

function Log.haveNativeBackendSupport()
	return System.checkAPIVersion(87, 3)
end;

function Log.v(tag, msg)
	if Log.haveNativeBackendSupport() then
		return _system_log_v(tag, msg);
	end;
end;

function Log.d(tag, msg)
	if Log.haveNativeBackendSupport() then
		return _system_log_d(tag, msg);
	end;
end;

function Log.i(tag, msg)
	if Log.haveNativeBackendSupport() then
		return _system_log_i(tag, msg);
	end;
end;

function Log.w(tag, msg)
	if Log.haveNativeBackendSupport() then
		return _system_log_w(tag, msg);
	end;
end;

function Log.e(tag, msg)
	if Log.haveNativeBackendSupport() then
		return _system_log_e(tag, msg);
	end;
end;

return Log