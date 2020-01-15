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

local function _newFileSaveObject()
	local obj = objs.objectFromHandle(_obj_newObject('TLuaFileSaveDialog'));
	
	if obj.eves == nil then	
		obj.eves = {};
	end;
	
	obj.eves["OnCallback"] = "";
	obj.eves["OnCancelCallback"] = "";
		
	objs.registerHandle(obj.handle, obj);	
	return obj;
end;

local runningFileSaveDialogs = {};

function lDialogs.saveFile(prompt, stream, suggestedFileName, mimeType, callback, cancelCallback)
	if (type(stream) ~= "table") or (stream.handle == nil) then
		error("Dialogs.saveFile - 'stream' parameter is not a valid object");
	end;

	local query = _newFileSaveObject();	
	rawset(query, "__tempStream", stream); -- keep reference while running the save dialog
	
	query.OnCallback = function()
						runningFileSaveDialogs[query] = nil;
						
						if callback ~= nil then
							callback();
						end;
				  	 end;
					 
	query.OnCancelCallback = function()
						runningFileSaveDialogs[query] = nil;
						
						if cancelCallback ~= nil then
							cancelCallback();
						end;
					 end;
	
	_obj_setProp(query.handle, "Prompt", tostring(prompt or "") or "");
	_obj_setProp(query.handle, "SuggestedFileName", tostring(suggestedFileName or "") or "");
	_obj_setProp(query.handle, "MimeType", tostring(mimeType or "") or "");	
	
	_obj_invokeEx(query.handle, "SetStream", stream.handle);
	
	runningFileSaveDialogs[query] = true;
	_obj_invoke(query.handle, "Execute");	
end

function lDialogs.o(prompt, multiple, callback, cancelCallback)
	return lDialogs.openFile(prompt, "image/*", multiple, callback, cancelCallback);
end;

local function _newSelectImageURLObject()
	local obj = objs.objectFromHandle(_obj_newObject('TLuaSelectImageURLQuery'));
	
	if obj.eves == nil then	
		obj.eves = {};
	end;
	
	obj.eves["OnCallback"] = "";
	obj.eves["OnCancelCallback"] = "";
		
	objs.registerHandle(obj.handle, obj);	
	return obj;
end;

local runningSelectImageURLDialogs = {};

function lDialogs.selectImageURL(defaultURL, callback, cancelCallback)
	local query = _newSelectImageURLObject();	
		
	query.OnCallback = function()
						runningSelectImageURLDialogs[query] = nil;
						
						if callback ~= nil then
							callback(_obj_getProp(query.handle, "SelectedURL"));
						end;
				  	 end;
					 
	query.OnCancelCallback = function()
						runningSelectImageURLDialogs[query] = nil;
						
						if cancelCallback ~= nil then
							cancelCallback();
						end;
					 end;
	
	_obj_setProp(query.handle, "DefaultURL", tostring(defaultURL or "") or "");
	
	runningSelectImageURLDialogs[query] = true;
	_obj_invoke(query.handle, "Execute");	
end

local function _newChoiceDialogPopup(className)
	local GUI = require("gui.lua");
	local obj = GUI.controlFromHandle(_obj_newObject(className or 'TLuaChoiceDialogPopup'));
	
	if obj.eves == nil then	
		obj.eves = {};
	end;
	
	function obj:addSelectionOption(option)
		_obj_invoke(obj.handle, "AddSelectionOption", tostring(option) or "");
	end;
	
	function obj:setDefaultIndex(defaultIndex)
		_obj_setProp(obj.handle, "DefaultIndex", defaultIndex);
	end;

	function obj:setTitle(title)
		_obj_setProp(obj.handle, "DialogTitle", tostring(title) or "");
	end;	
	
	function obj:buildPanel()
		_obj_invoke(obj.handle, "BuildPanel");
	end;

	function obj:executeAsync()
		_obj_invoke(obj.handle, "ExecuteAsync");
	end;
	
	function obj:acquireFocus()
		_obj_invoke(obj.handle, "AcquireFocus");
	end;	
	
	function obj:getSelectedIndex()
		return _obj_getProp(obj.handle, "LuaSelectedIndex");
	end;
	
	obj.eves["onChoiceSelected"] = "";
	obj.eves["onChoiceCanceled"] = "";
		
	objs.registerHandle(obj.handle, obj);	
	return obj;
end;

local function _newMultipleChoiceDialogPopup()
	local obj = _newChoiceDialogPopup("TLuaMultipleChoiceDialogPopup");
	
	function obj:getSelectedIndexes()
		return _obj_invokeEx(obj.handle, "ReturnLuaArrayOfSelected");
	end;
	
	return obj;
end;

local function _executeChoicePanel(panel, callback)
	local GUI = require("gui.lua");
	require("utils.lua");
		
	local frm = GUI.newPopupForm();
	frm.drawContainer = true;
	frm.cancelable = false;
	frm.resizable = true;
	local haveNotified = false;
	
	local cancelProc = function()
							frm:close();
							
							if not haveNotified then
								haveNotified = true;
								
								setTimeout(
									function()
										callback(false);
									end, 1);									
							end;
						  end;	
	
	frm.onCancelRequest = cancelProc;
	panel.onChoiceCanceled = cancelProc;	
	frm.onHide = cancelProc;
						  
	panel.onChoiceSelected =
		function()
			local mustNotify = not haveNotified;
			haveNotified = true;
		
			frm:close();
						
			if mustNotify then		
					setTimeout(function()
									callback(true);
								end, 1);					
			end;
		end;	
	
	panel.parent = frm;
	panel.align = "client";
	panel.visible = true;
	frm.width = 300;
	frm.height = 300;	
	frm.theme = "dark";
	panel:executeAsync();
	frm:show();
	panel:acquireFocus();
end;

function lDialogs.choose(prompt, options, callback, defaultIndex, shortCircuit)
	if (type(options) ~= "table") or (#options < 1) then
		if callback ~= nil then
			callback(false);
		end;
		
		return;
	end;

	require("gui.lua");
	local choosePanel = _newChoiceDialogPopup();
	
	if type(options) == "table" then						
		for i = 1, #options, 1 do
			choosePanel:addSelectionOption(options[i]);
		end;	

		if shortCircuit and (#options == 1) then
			setTimeout(
				function()
					if callback ~= nil then	
						callback(true, 1, options[1]);
					end;
				end, 1);	
				
			return;
		end;
	end;
	
	if defaultIndex ~= nil then
		choosePanel:setDefaultIndex(defaultIndex - 1);
	end;
	
	choosePanel:setTitle(prompt or "");	
	choosePanel:buildPanel();
	
	_executeChoicePanel(choosePanel,
		function (confirmed)		
			if callback ~= nil then
				if confirmed then
					local idx = choosePanel:getSelectedIndex() + 1;
					callback(true, idx, options[idx]);
				else
					callback(false);
				end;
			end;
		end);
end;

function lDialogs.chooseMultiple(prompt, options, callback)
	require("gui.lua");
	local choosePanel = _newMultipleChoiceDialogPopup();
	
	if type(options) == "table" then		
		for i = 1, #options, 1 do
			choosePanel:addSelectionOption(options[i]);
		end;
	end;
		
	choosePanel:setTitle(prompt or "");	
	choosePanel:buildPanel();
	
	_executeChoicePanel(choosePanel,
		function (confirmed)		
			if callback ~= nil then
				if confirmed then
					local indexes = choosePanel:getSelectedIndexes();
					local values = {};
					
					for i = 1, #indexes, 1 do
						indexes[i] = indexes[i] + 1;
						values[i] = options[indexes[i]];
					end;
					
					callback(true, indexes, values);
				else
					callback(false);
				end;
			end;
		end);
end;


dialogs = lDialogs;
Dialogs = dialogs;
return dialogs;