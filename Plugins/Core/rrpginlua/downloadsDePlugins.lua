require("ndb.lua");
require("internet.lua");

local downloads = {};

local downloadsNDB = nil;
local dIdGenerator = 0;

function downloads.getNDB()
	if downloadsNDB == nil then
		downloadsNDB = ndb.newMemNodeDatabase();
		downloadsNDB.downloads = {};
		downloadsNDB.plugins = {};
	end;
	
	return downloadsNDB;
end;

function downloads.newDownloadIndicator(url)
    dIdGenerator = dIdGenerator + 1;
	local id = dIdGenerator;
	
	local ndb = downloads.getNDB();
	
	ndb.downloads[id] = {progress = 0.0, fileName = url:match( "([^/]+)$")};	
	ndb.downloads[id].url = url;
	ndb.downloads[id].indicatorId = id;
	return id;
end;

function downloads.startDownloadPlugin(url)
	local id = downloads.newDownloadIndicator(url);
	local downloadNDB = downloads.getNDB();
	
	local internetDownloadId = internet.download(url,
		function (stream, contentType)
			downloadNDB.downloads[id].internetDownloadId = nil;
			
			local detalhes = rrpg.plugins.getRPKDetails(stream);
			
			if detalhes == nil then
				downloadNDB.downloads[id].errorMsg = "Ops: Arquivo '.rpk' inválido";
				return;
			end;
			
			local r, msg = rrpg.plugins.installPlugin(stream);
							
			if r then
				downloadNDB.downloads[id] = nil;
			else
				downloadNDB.downloads[id].errorMsg = msg or "Erro na instalação";
			end;
		end,
		
		function (errorMsg)
			downloadNDB.downloads[id].errorMsg = "Falha no download";
			downloadNDB.downloads[id].internetDownloadId = nil;
		end,
		
		function (downloaded, total)		
			if type(total) ~= "number" then
				total = 0;
			end;
			
			if type(downloaded) ~= "number" then
				downloaded = 0;
			end;
			
			if total > 0 then
				downloadNDB.downloads[id].progress = (downloaded / total) * 100;
			end;
		end);
		
	if downloadNDB.downloads[id] ~= nil then
		downloadNDB.downloads[id].internetDownloadId = internetDownloadId;
	end;
end

return downloads;