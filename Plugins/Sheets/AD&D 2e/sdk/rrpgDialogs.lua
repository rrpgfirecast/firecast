local objs = require("rrpgObjs.lua");

local lDialogs = {};

local function newDialogObject(className)
	return objs.objectFromHandle(_obj_newObject(className));
end;

lDialogs.DT_INFORMATION = "information";
lDialogs.DT_ERROR = "error";
lDialogs.DT_WARNING = "warning";
lDialogs.DT_CONFIRMATION = "confirmation";

lDialogs.DB_YES = "yes";
lDialogs.DB_NO = "no";
lDialogs.DB_OK = "ok";
lDialogs.DB_CANCEL = "cancel";
lDialogs.DB_ABORT = "abort";
lDialogs.DB_ALL = "all";
lDialogs.DB_RETRY = "retry";
lDialogs.DB_IGNORE = "ignore";
lDialogs.DB_CLOSE = "close";

function lDialogs.newMessageDialog()
	local dlg = newDialogObject('messageDialog');
	
	function dlg:show(message, dialogType, dialogButtons, funcCallback)
		_obj_setProp(dlg.handle, "DialogType", dialogType);
		_obj_setProp(dlg.handle, "DialogButtons", dialogButtons);
		
		if funcCallback ~= nil then
			dlg:addEventListener('OnResult', funcCallback);
		end;
		
		_obj_invoke(dlg.handle, 'Executar', tostring(message));
	end;
	
	return dlg;
end;

local runningMessageDialogs = {};

function lDialogs.showMessageDlg(message, dialogType, dialogButtons, funcCallback)
	local dlg = lDialogs.newMessageDialog();
	runningMessageDialogs[dlg] = true;  -- apenas manter uma referência forte ate o fim do dialogo
	
	dlg:show(message, dialogType, dialogButtons,
		function (...)			
			runningMessageDialogs[dlg] = nil;
			dlg = nil		
		
			if type(funcCallback) == "function" then
				funcCallback(...);
			end;
		end);
end;

function lDialogs.confirmYesNo(question, callback)
	lDialogs.showMessageDlg(question, lDialogs.DT_CONFIRMATION, {lDialogs.DB_YES, lDialogs.DB_NO}, 
							function(modalResult)
								if type(callback) == "function" then
									if modalResult == lDialogs.DB_YES then
										callback(true);
									else
										callback(false);
									end;
								end;
							end);
end;

function lDialogs.confirmOkCancel(question, callback)
	lDialogs.showMessageDlg(question, lDialogs.DT_CONFIRMATION, {lDialogs.DB_OK, lDialogs.DB_CANCEL}, 
							function(modalResult)
								if type(callback) == "function" then
									if modalResult == lDialogs.DB_OK then
										callback(true);
									else
										callback(false);
									end;
								end;
							end);
end;

function lDialogs.showMessage(msg, callback)
	lDialogs.showMessageDlg(msg, lDialogs.DT_INFORMATION, {lDialogs.DB_OK}, 
							function(modalResult)
								if type(callback) == "function" then
									callback();
								end;
							end);
end;

function lDialogs.alert(msg, callback)
	lDialogs.showMessageDlg(msg, lDialogs.DT_WARNING, {lDialogs.DB_OK}, 
							function(modalResult)
								if type(callback) == "function" then
									callback();
								end;
							end);
end;


function lDialogs.newInputQueryDialog()
	local dlg = objs.objectFromHandle(_obj_newObject("TLuaInputQueryDialog"));
	
	function dlg:show(caption, prompt, initialValue, confirmCallback, cancelCallback, allowEmptyString)
		if (confirmCallback ~= nil) then
			dlg:addEventListener("OnConfirm", confirmCallback);
		end;
		
		if (cancelCallback ~= nil) then
			dlg:addEventListener("OnCancel", cancelCallback);
		end;
		
		_obj_invoke(dlg.handle, "Executar", caption or "", prompt or "", initialValue or "", allowEmptyString == true);
	end;
	
	objs.registerHandle(dlg.handle, dlg);
	return dlg;
end;

local runningQueryDialogs = {};

function lDialogs.inputQuery(caption, prompt, initialValue, confirmCallback, cancelCallback, allowEmptyString)
	local dlg = lDialogs.newInputQueryDialog();
	runningQueryDialogs[dlg] = true;  -- apenas manter uma referência forte até o fim do input query
	
	dlg:show(caption, prompt, initialValue,
		function(...)
			runningQueryDialogs[dlg] = nil;
			dlg = nil;		
		
			if confirmCallback ~= nil then
				confirmCallback(...);
			end;	
		end,
		
		function (...)
			runningQueryDialogs[dlg] = nil;
			dlg = nil;				
		
			if cancelCallback ~= nil then
				cancelCallback(...);
			end;
		end, allowEmptyString);
end;

function alert(msg, callback)
	lDialogs.alert(msg, callback);
end;

function showMessage(msg, callback)
  lDialogs.showMessage(msg, callback);
end;

local runningFileQuerys = {};

function _newFileQueryObject()
	local obj = objs.objectFromHandle(_obj_newObject('TLuaFileQueryDialog'));
	
	if obj.eves == nil then	
		obj.eves = {};
	end;
	
	obj.eves["onResult"] = "data";
	obj.eves["onCancel"] = "";
		
	objs.registerHandle(obj.handle, obj);	
	return obj;
end;

function lDialogs.openFile(prompt, accept, multiple, callback, cancelCallback)
	local query = _newFileQueryObject();	
	
	query.onResult = function(files)
						runningFileQuerys[query] = nil;
						local utils = require("utils.lua");
						
						for i = 1, #files, 1 do
							files[i].stream = utils.streamFromHandle(files[i].streamHandle);
							files[i].stream.position = 0;
							files[i].streamHandle = nil;
						end;
						
						if callback ~= nil then
							callback(files or {});
						end;
				  	 end;
					 
	query.onCancel = function()
						runningFileQuerys[query] = nil;
						
						if cancelCallback ~= nil then
							cancelCallback();
						end;
					 end;
	
	_obj_setProp(query.handle, "Accept", tostring(accept or "") or "");
	_obj_setProp(query.handle, "Multiple", not (not multiple));
	_obj_setProp(query.handle, "Prompt", tostring(prompt or "") or "");	
	
	runningFileQuerys[query] = true;
	_obj_invoke(query.handle, "Execute");
end;

function lDialogs.o(prompt, multiple, callback, cancelCallback)
	return lDialogs.openFile(prompt, "image/*", multiple, callback, cancelCallback);
end;

dialogs = lDialogs;
return dialogs;