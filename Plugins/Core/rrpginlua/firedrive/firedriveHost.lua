local plugins = require("plugins.lua");
local rrpg = require("rrpg.lua");
local host = {drive={}};
local internet = require("internet.lua");
local utils = require("utils.lua");
require("fireDriveGlobals.dlua");
require("locale.lua");

local _DIRTY_NEED_REFRESH = true;
local ITEM_KIND_DIR = "dir";
local ITEM_KIND_PLUGIN = "plugin";
local ITEM_KIND_IMAGE = "image";
local ITEM_KIND_FILE = "file";

function host.setDirty()
	_DIRTY_NEED_REFRESH = true;
	host.drive.itensById = {};
	host.drive.childRelations = {};
	host.drive.childRelations.root = {};
	
	host.drive.childRelationsByName = {};	
	host.drive.childRelationsByName.root = {};	
	
	host.drive.space = {};
	host.drive.space.used = 0;
	host.drive.space.total = 50 * 1024 * 1024;
end;

function host.addChildRelation(parentId, childId, childName)
	local pT;

	-- Relação ParentId-ChildId
	
	if parentId == nil then
		pT = host.drive.childRelations.root;	
	else
		pT = host.drive.childRelations[parentId];
		
		if pT == nil then
			pT = {};
			host.drive.childRelations[parentId] = pT;
		end;
	end;
	
	pT[childId] = childName;
	
	-- Relação ParentId-ChildName
	
	if parentId == nil then
		pT = host.drive.childRelationsByName.root;	
	else
		pT = host.drive.childRelationsByName[parentId];
		
		if pT == nil then
			pT = {};
			host.drive.childRelationsByName[parentId] = pT;
		end;
	end;
	
	local nameToSet = string.upper(utils.removerAcentos(childName));	
	pT[nameToSet] = childId;	
end;

function host.removeChildRelation(parentId, childId, childName)
	local pT;

	-- Relação ParentId-ChildId
	
	if parentId == nil then
		pT = host.drive.childRelations.root;	
	else
		pT = host.drive.childRelations[parentId];
	end;
	
	if pT ~= nil then	
		pT[childId] = nil;
		
		if (parentId ~= nil) and (next(pT) == nil) then
			host.drive.childRelations[parentId] = nil;
		end;
	end;
	
	-- Relação ParentId-ChildName
	
	if parentId == nil then
		pT = host.drive.childRelationsByName.root;	
	else
		pT = host.drive.childRelationsByName[parentId];
	end;
	
	if pT ~= nil then	
		local nameToSet = string.upper(utils.removerAcentos(childName));		
		pT[nameToSet] = nil;
		
		if (parentId ~= nil) and (next(pT) == nil) then
			host.drive.childRelationsByName[parentId] = nil;
		end;
	end;
end;

function host.addKnownFireDriveItem(itemTag)
	local attr = itemTag.attr;
	local id = tonumber(attr["id"]);
	local item;
					
	if id == nil then
		error("Servidor retornou um id inválido para um item do firedrive");
	end;	
	
	item = host.drive.itensById[id];
	
	if item ~= nil then
		host.removeChildRelation(item.parentId, item.id, item.name);
	else
		item = {};
	end;	
	
	item.id = id;
	item.name = attr["name"];
	item.isDir = attr["kind"] == "D";	
	item.parentId = tonumber(attr["parent"]);
	item.size = tonumber(attr["size"]) or 0;
	item.isShared = attr["shared"] == "S";
	item.isMine = attr["mine"] == "S";
	item.keyWords = attr["keywords"];
	item.description = attr["description"];
	item.url = attr["URL"];	
	item.mimeType = attr["mimeType"];
	item.sharedId = tonumber(attr["sharedId"]);
	item.urlThumb64 = attr["thumb64URL"];	
		
	local kind = string.upper(attr["kind"]);
	
	if kind == "D" then
		item.kind = ITEM_KIND_DIR;
	elseif kind == "P" then
		item.kind = ITEM_KIND_PLUGIN;
	elseif kind == "I" then
		item.kind = ITEM_KIND_IMAGE;		
	else
		item.kind = ITEM_KIND_FILE;
	end;
	
	if (item.name == nil) or (item.name == "") then
		error("Servidor retornou um name inválido para um item do firedrive");
	end;	
	
	host.drive.itensById[item.id] = item;
	host.addChildRelation(item.parentId, item.id, item.name);	
	
	return item;
end;

function host.removeKnownFireDriveItem(itemId)
	local item = host.drive.itensById[itemId];
	
	if item ~= nil then
		host.drive.itensById[itemId] = nil;
		host.removeChildRelation(item.parentId, item.id, item.name);		
	end;
end;


function host.interpretQuickUploadResponse(itemTag)
	local attr = itemTag.attr;
	local id = tostring(attr["id"]);
	local item;
					
	if id == nil then
		error("Servidor retornou um id inválido para um item do firedrive");
	end;	
	
	item = {};	
	
	item.id = id;
	item.name = attr["name"];
	item.isDir = attr["kind"] == "D";	
	item.parentId = tonumber(attr["parent"]);
	item.size = tonumber(attr["size"]) or 0;
	item.isShared = attr["shared"] == "S";
	item.isMine = attr["mine"] == "S";
	item.keyWords = attr["keywords"];
	item.description = attr["description"];
	item.url = attr["URL"];	
	item.mimeType = attr["mimeType"];
	item.sharedId = tonumber(attr["sharedId"]);
	item.urlThumb64 = attr["thumb64URL"];	
		
	local kind = string.upper(attr["kind"]);
	
	if kind == "D" then
		item.kind = ITEM_KIND_DIR;
	elseif kind == "P" then
		item.kind = ITEM_KIND_PLUGIN;
	elseif kind == "I" then
		item.kind = ITEM_KIND_IMAGE;		
	else
		item.kind = ITEM_KIND_FILE;
	end;
			
	return item;
end;

function host.breakPathIntoParts(path)
	return breakPathIntoParts(path);
end;

function host.findItemByPath(path)
	local pathParts = host.breakPathIntoParts(path);	
	
	if #pathParts <= 0 then
		return nil;
	end;
		
	local currentRelationPart = host.drive.childRelationsByName.root;

	for i = 1, #pathParts, 1 do
		if currentRelationPart == nil then
			return nil;
		end;
	
		local nameToFind = string.upper(utils.removerAcentos(pathParts[i]));
		local id = currentRelationPart[nameToFind];
		
		if id ~= nil then
			if i == #pathParts then
				return host.drive.itensById[id];
			else
				currentRelationPart = host.drive.childRelationsByName[id];
			end;
		else
			return nil;
		end;
	end;
	
	return nil; -- Se chegar até aqui é porque não encontrou
end;

function host.getFilesInside(dir)
	local ret = {};	
	local relationToLook = nil;	
	local pathParts = host.breakPathIntoParts(dir);	
	
	if #pathParts <= 0 then
		relationToLook = host.drive.childRelations.root;
	else
		local item = host.findItemByPath(dir);
		
		if item ~= nil then
			relationToLook = host.drive.childRelations[item.id] ;
		end;
	end;
		
	if relationToLook ~= nil then
		for k, v in pairs(relationToLook) do
			local item = host.drive.itensById[k];
			
			if item ~= nil then
				ret[#ret + 1] = item;
			end;
		end;
	end;
	
	return ret;
end;


function host.newRequest(action, method)
	if method == nil then
		method = "GET";
	end;

	local req = internet.newHTTPRequest(method, _rrpg_getURLOfFireDriveREST());
	req:setRequestHeader("X-RRPG-FireDrive-SessionToken", _rrpg_getRRPGSessionToken());
	req:setRequestHeader("X-RRPG-FireDrive-Action", action);
	return req;
end;

local function treatErrorMsg(msg)
	local m = msg:match("^HTTP/1%.%d%s+%d+%s+(.+)$");
	
	if m ~= nil and m ~= "" then
		return m;
	else
		return msg;
	end;
end;

local function getXMLResponse(httpRequest)
	local ct = httpRequest:getResponseHeader("Content-Type");	
	local slaxdom = require("slaxdom.dlua");
		
	if ct == "application/x.zlib.xml.utf8" then
		local ms = utils.newMemoryStream();
		utils.zlibDecompress(httpRequest.responseStream, ms);
		ms.position = 0;		
		local str = ms:readBinary("utf8");
		local d = slaxdom:dom(str);
		return d.root;		
	elseif ct == "text/xml" then
		local d = slaxdom:dom(httpRequest.responseText);
		return d.root;
	end;
	
	return slaxdom:dom("<empty/>").root;
end;

function host.treatSpaceResponse(el)	
	host.drive.space.used = tonumber(el.attr["used"]) or 0;
	host.drive.space.total = tonumber(el.attr["total"]) or 0;
end;

local function treatLISTResponse(req)
	local xml = getXMLResponse(req);	
	host.setDirty();	
	
	for i = 1, #xml.el, 1 do
		local el = xml.el[i];
		
		if el.name == "item" then
			host.addKnownFireDriveItem(el);
		elseif el.name == "space" then
			host.treatSpaceResponse(el);
		end;
	end;
		
	_DIRTY_NEED_REFRESH = false;
end;

function host.refreshDrive(callback, failureCallback)
	local req = host.newRequest('list');
	
	req.onResponse = function()				
		local r, r2 = pcall(treatLISTResponse, req);
				
		if r and callback then
			host.raiz = r2;				
			callback();
		elseif not r and failureCallback then
			failureCallback(r2);
		end;
	end;
	
	req.onError = function(msg)
		if failureCallback ~= nil then
			failureCallback(treatErrorMsg(msg));
		end;
	end;
	
	req:send();	
end;

function host.needRefreshedDrive(callback, failureCallback)
	if _DIRTY_NEED_REFRESH then
		host.refreshDrive(callback, failureCallback);
	elseif callback ~= nil then
		callback();	
	end;
end;

local uploads = {};
local uploadsIdGen = 0;

local function unsetupUpload(uploadId)
	local upload = uploads[uploadId];
	
	if upload ~= nil then		
		uploads[uploadId] = nil;
		
		if upload.reqs ~= nil then
			for k, v in pairs(upload.reqs) do
				upload.reqs[k] = nil;
				v:abort();
			end;
		end;
	end;
end;

function host.findBlobs(upload, onSuccess, onFailure)
	if #upload.blobs <= 0 then
		if onSuccess ~= nil then
			onSuccess();
		end;
		
		return;
	end;
	
	local req = upload.newRequest("findBlobs");	
	req:setRequestHeader('X-RRPG-Blob-Count', tostring(#upload.blobs));
	
	for i = 1, #upload.blobs, 1 do
		local stream = upload.blobs[i].stream;
		local mimeType = upload.blobs[i].mimeType or "application/octet-stream";		
		local sha1 = upload.blobs[i].sha1;
		local reqPrefix = 'X-RRPG-Blob-' .. tostring(i - 1) .. "-";
		
		req:setRequestHeader(reqPrefix .. "SHA1", sha1);
		req:setRequestHeader(reqPrefix .. "Content-Type", mimeType);
		req:setRequestHeader(reqPrefix .. "Size", tostring(stream.size));
	end;
		
	req.onResponse = 
		function ()
			upload.freeRequest(req);					
			local xml = getXMLResponse(req);
			
			for i = 1, #xml.el, 1 do
				local el = xml.el[i];
				
				if el.name == "blob" then
					local idx = tonumber(el.attr["index"]);
					local found = el.attr["found"];
					local blobId = el.attr["blobId"];
					local blobUrl = el.attr["blobUrl"];
					local blobSalt = el.attr["blobSalt"];
					
					if (found == "true") and (idx >= 0) and (idx <= #upload.blobs - 1) then
						local b = upload.blobs[idx + 1];
						b.found = true;
						b.blobId = blobId;
						b.blobUrl = blobUrl;
						b.blobSalt = blobSalt; 
					end;
				end;
			end;

			if onSuccess ~= nil then
				onSuccess();
			end;
		end;
		
	req.onError = 	
		function (errorMsg)
			upload.freeRequest(req);	
		
			if onFailure ~= nil then
				onFailure(treatErrorMsg(errorMsg));
			end;		
		end;
	
	req:send();
end;

function host.step2ManageItem(upload, onSuccess, onProgress, onFailure)
	local metadata = upload.metadata;

	local remoteActionStr;
	
	if type(metadata) == "table" and type(metadata.headers) == "table" and 
		(metadata.headers.operation == "quickUpload") then
		remoteActionStr = "manageQuickUploadItem";
	else
		remoteActionStr = "manageItem";
	end;
	
	local req = upload.newRequest(remoteActionStr, 'POST');
	local reqStream = utils.newTempFileStream();
	local buffer = {};
	local buffer2 = {};
	local size = nil;
	local size2 = nil;
	
	-- Montar a requisição
	
	local function bWrite(format, value)
		size = utils.binaryEncode(buffer, format, value);	
		reqStream:write(buffer, size);
	end;
	
	local function bWriteString(str)
		size = utils.binaryEncode(buffer, "utf8", str);
		size2 = utils.binaryEncode(buffer2, "u32", size);			
		reqStream:write(buffer2, size2);
		reqStream:write(buffer, size);
	end;
	
	-- escrever os headers primeiro
	
	if metadata.headers ~= nil then
		for k, v in pairs(metadata.headers) do
			bWrite("u8", 1);  -- 1 == HEADER
			bWriteString(k);
			bWriteString(tostring(v));
		end;
	end;
	
	-- blobs
	if upload.blobs ~= nil then
		for i = 1, #upload.blobs, 1 do
			local blob = upload.blobs[i];
			bWrite("u8", "2"); -- 2 = BLOB
			bWriteString(tostring(blob.name));
			
			if blob.found then
				-- Achou o blob no servidor
				bWrite("u8", 1); -- 1 = LINKAR um blob já existente
				bWriteString(tostring(blob.blobId));
				bWriteString(tostring(blob.blobSalt));			
			else
				-- Não achou o blob no servidor, vamos uploadar o conteudo
				bWrite("u8", 2); -- 2 = UPLOAD de dados
				bWriteString(blob.mimeType or "");
				bWrite("u32", blob.stream.size);
				blob.stream.position = 0;
				reqStream:copyFrom(blob.stream, blob.stream.size);
			end;				
		end;
	end;
	
	-- Enviar a requisicao
		
	if onProgress ~= nil then
		req.onSendProgress = 
			function (currentBytes, maxBytes)
				onProgress(currentBytes, maxBytes);
			end;
	end;
	
	req.onError = 
		function(errorMsg)
			if onFailure ~= nil then
				onFailure(treatErrorMsg(errorMsg));
			end;
		end;
		
	req.onResponse = 
		function()			
			local xml = getXMLResponse(req);
			local resp = nil;
						
			for i = 1, #xml.el, 1 do
				local el = xml.el[i];
				
				if el.name == "item" then					
					local addedItem = host.addKnownFireDriveItem(el);
					resp = addedItem;
				elseif el.name == "deletedItem" then
					host.removeKnownFireDriveItem(tonumber(el.attr["id"]));
				elseif el.name == "space" then
					host.treatSpaceResponse(el);
				elseif el.name == "quickUploadItem" then
					resp = host.interpretQuickUploadResponse(el);
				end;
			end;
					
			if onSuccess ~= nil then
				onSuccess(resp or {});
			end;
		end;
	
	
	reqStream.position = 0;
	local zipedStream = utils.newTempFileStream();
	
	utils.zlibCompressAsync(reqStream, zipedStream, "max", reqStream.size,
		function ()
			zipedStream.position = 0;	
			req:setRequestHeader('Content-Type', 'application/x.rrpg.firedrive.binaryreq.v1');	
			req:send(zipedStream);
			
			zipedStream.size = 0; -- liberar a memória!		
		end,
		
		function(errorMsg)
			if onFailure ~= nil then
				onFailure(treatErrorMsg(errorMsg));
			end;		
		end);	
end;

local _queueManageItens = require("/utils/queuedJobs.dlua").newQueue(3);

function host.queued_step2ManageItem(upload, onSuccess, onProgress, onFailure)
	_queueManageItens:addJob(
		function(job)
			host.step2ManageItem(upload, 
				function(...)
					pcall(onSuccess, ...);
					job:endJob();										
				end, 
				
				onProgress, 
				
				function (...)
					pcall(onFailure, ...);
					job:endJob();				
				end)
		end);
end;

function host.manageItem(destItemName, metadata, onSuccess, onProgress, onFailure)
	uploadsIdGen = uploadsIdGen + 1;

	local upload = {};		
	local uploadId = uploadsIdGen;	
	local requestGenId = 0;
	uploads[uploadId] = upload;
	upload.metadata = metadata or {};
	upload.reqs = {};
	upload.blobs = {};
	upload.uploadId = uploadId;
	upload.itemName = destItemName;
	
	if upload.metadata.headers == nil then
		upload.metadata.headers = {};
	end;
	
	upload.metadata.headers['itemName'] = destItemName; 
	
	function upload.newRequest(action, method)
		requestGenId = requestGenId + 1;
		local req = host.newRequest(action, method);
		local esteReqId = requestGenId;
		upload.reqs[requestGenId] = req;		
		
		rawset(req, "__reqid", esteReqId);		
		return req, esteReqId;
	end;
	
	function upload.freeRequest(req)
		local reqid = rawget(req, "__reqid");
		
		if reqid ~= nil then
			upload.reqs[reqid] = nil;
			rawset(req, "__reqid", nil);
		end;
	end;
	
	if metadata.blobs ~= nil and #metadata.blobs > 0 then
		for i = 1, #metadata.blobs, 1 do
			upload.blobs[#upload.blobs + 1] = metadata.blobs[i];
		end;
	end;
	
	host.findBlobs(upload, 
		function()		
			local functionToUse = host.step2ManageItem;
			
			for i = 1, #upload.blobs, 1 do
				if not upload.blobs[i].found then
					functionToUse = host.queued_step2ManageItem;
				end;
			end;
		
			local r1, r2 = pcall(functionToUse, upload, 
				function (successData)
					unsetupUpload(uploadId);
					
					if onSuccess ~= nil then
						onSuccess(successData);
					end;					
				end, 
				
				onProgress, 
				
				function(errorMsg)
					unsetupUpload(uploadId);
				
					if onFailure ~= nil then
						onFailure(errorMsg);
					end;						
				end);
			
			if (not r1) then
				unsetupUpload(uploadId);
				
				if onFailure ~= nil then
					onFailure(r2);
				end;				
			end;
		end,
		
		function(errorMsg)
			unsetupUpload(uploadId);
			
			if onFailure ~= nil then
				onFailure(errorMsg);
			end;
		end)
end;

function host.langMessage(msg)
	local seekStr = utils.removerAcentos(tostring(msg) or "") or "";
	seekStr = "fireDrive.msg." .. string.gsub(seekStr, "%s", "_");
	
	local translated = tryLang(seekStr);
	
	if translated ~= nil then
		return translated;
	else
		return msg;
	end;
end;

host.setDirty();

----------------- Funções de comunicação com plugins ------------------

plugins.listenPM("fireDrive:refresh",
	function(message)
		plugins.setLatePMReply(message);
		
		host.refreshDrive(
			function()
				plugins.replyPM(message, "Sucesso??");
			end,
			
			function(failure)
				plugins.replyPMFailure(message, failure);
			end);
	end);
	
	
plugins.listenPM("fireDrive:enumerateFiles",
	function(message)
		plugins.setLatePMReply(message);
		
		host.needRefreshedDrive(
			function()
				message.dir = tostring(message.dir) or "";
				local pathParts = host.breakPathIntoParts(message.dir);	
				
				if #pathParts > 0 then
					local item = host.findItemByPath(message.dir);
					
					if item == nil then
						plugins.replyPMFailure(message, "Diretório não existe");
						return;
					elseif not item.isDir then
						plugins.replyPMFailure(message, "Esta operação (Enumerar arquivos) só pode ser feita em diretórios");
						return;
					end;					
				end;
				
				local r = host.getFilesInside(message.dir);
				
				if r ~= nil then
					plugins.replyPM(message, r);
				else
					plugins.replyPMFailure(message, "Diretório inválido");	
				end;
			end,
			
			function(failure)
				plugins.replyPMFailure(message, failure);				
			end);
	end);	
	
plugins.listenPM("fireDrive:getFileInfo",
	function(message)
		plugins.setLatePMReply(message);
		
		host.needRefreshedDrive(
			function()
				local item = host.findItemByPath(message.fileName or "");														
				plugins.replyPM(message, item);
			end,
			
			function(failure)
				plugins.replyPMFailure(message, failure);				
			end);
	end);		
	
plugins.listenPM("fireDrive:getSpaceInfo",
	function(message)
		plugins.setLatePMReply(message);
		
		host.needRefreshedDrive(
			function()
				local retorno = {};
				retorno.used = host.drive.space.used or 0;
				retorno.total = host.drive.space.total or (50 * 1024 * 1024);												
				plugins.replyPM(message, retorno);
			end,
			
			function(failure)
				plugins.replyPMFailure(message, failure);				
			end);
	end);		
	
plugins.listenPM("fireDrive:manageItem",
	function(message)		
		if message.metadata == nil then
			message.metadata = {};			
		end;
		
		local metadata = message.metadata;
		
		if metadata.blobs ~= nil and #metadata.blobs > 0 then	
			for i = 1, #metadata.blobs, 1 do
				local blob = metadata.blobs[i];
				
				if blob.streamSharedId ~= nil then
					blob.stream = utils.openSharedStream(blob.streamSharedId);
					blob.stream.position = 0;
					blob.sha1 = blob.stream.sha1;
					blob.stream.position = 0;
				end;
			end;
		end;
			
		local uploadId = host.manageItem(message.destName, metadata,
			function (successData)
				local m = {};
				m.kind = "end";
				m.successData = successData;			
				plugins.sendPM(message.moduleId, message.pmListener, m);
			end,
			
			function (currentBytes, maxBytes)
				local m = {};
				m.kind = "progress";
				m.currentBytes = currentBytes;
				m.maxBytes = maxBytes;
				plugins.sendPM(message.moduleId, message.pmListener, m);			
			end,
			
			function (errorMsg)
				local m = {};
				m.kind = "error";
				m.errorMsg = errorMsg;
				plugins.sendPM(message.moduleId, message.pmListener, m);				
			end);		

		local msgX = {};
		msgX.kind = "uploadId";
		msgX.uploadId = uploadId;
		plugins.sendPM(message.moduleId, message.pmListener, msgX);				
	end);	

plugins.listenPM("fireDrive:abortOperation",
	function(message)	
		unsetupUpload(message.uploadId);		
	end);
	
rrpg.messaging.listen("SessionLost",  function(message) host.setDirty(); end);		
rrpg.messaging.listen("SessionStarted",  function(message) host.setDirty(); end);		

return host;