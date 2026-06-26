require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("async.lua");
require("plugins.lua");
local Internet = require("internet.lua");
local Locale = require("locale.lua");
local NDB = require("ndb.lua");

local PLUGINS_XML_URL = "https://sdk3.firecast.app/Plugins/plugins.xml";

function getConfigWindow()
	local cfgForm = GUI.newForm("autoupdaterPopup");
	cfgForm.title = "Auto Updater";
	return cfgForm;
end

-- Percorre a tabela de nodes, vendo os filhos. 
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
        
local function write(str, chat)	
	if chat == nil then 
		-- showMessage(str) 
		return
	end
    if str then
        chat:escrever(str);
    else
        chat:escrever("String nula");
    end;
end;

local function isNewVersion(installed, downloaded)
    local installedVersion = {};
    local installedIndex = 0;
    for i in string.gmatch(installed, "[^%.]+") do
        installedIndex = installedIndex +1;
        installedVersion[installedIndex] = i;
    end

    local downloadedVersion = {};
    local downloadedIndex = 0;
    for i in string.gmatch(downloaded, "[^%.]+") do
        downloadedIndex = downloadedIndex +1;
        downloadedVersion[downloadedIndex] = i;
    end

    for i=1, math.min(installedIndex, downloadedIndex), 1 do 
        if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
            return false;
        elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
            return true;
        end;
    end;

    if downloadedIndex > installedIndex then
        return true;
    else
        return false;
    end;
end;

local function tryTranslate(text)
    local trans = Locale.tryLang(text);
    if trans == nil then trans = text end;
    return trans;
end

local function downloadID(url, id, chat)
	local install
	Internet.download(url,
        function(stream, contentType)
        	if stream ~= nil then
				install = Firecast.Plugins.installPlugin(stream, true);
			end;
			if install == false or stream == nil then
				GUI.openInBrowser(url);
            else
                write(tryTranslate("download.status.success") .. " " .. tryTranslate("download.status.installing") .. " " .. (id or ""), chat);
			end;
        end,       
        function (errorMsg)
            write(tryTranslate("download.status.error") .. " " .. tryTranslate("download.status.installing") .. " " .. (errorMsg or ""), chat);
        end,       
        function (downloaded, total)
            -- esta função será chamada constantemente.
            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
        end,
        "checkForModification");
end

local function findDataType(plugin, id)
	local dataTypes = NDB.getChildNodes(plugin.dataTypes);

	for i=1, #dataTypes, 1 do
		if lowercase(dataTypes[i].id) == lowercase(id) or lowercase(dataTypes[i].title) == lowercase(id) then
			return true;
		end;
	end

	return false;
end

local function tryInstall(id, chat)
	-- try to download
	Internet.download(PLUGINS_XML_URL,
        function(stream, contentType)
            if VHD.fileExists("plugins.xml") then
                VHD.deleteFile("plugins.xml");
            end;
            local file = VHD.openFile("plugins.xml", "w");
            file:copyFrom(stream, stream.size);
            setTimeout(
                function ()
                    file:close();
                    local import = NDB.load("plugins.xml");
                    local updaterSheet = NDB.load("config.xml");

                    local list = NDB.getChildNodes(import);

                    updaterSheet.loaded = 0;
                    updaterSheet.toLoad = #list;
                    updaterSheet.loading = tryTranslate("loading") .. "0/" .. updaterSheet.toLoad;

                    for i=1, #list, 1 do
                        -- Verifica se tem updates em cada plugin
                        if lowercase(list[i].id) == lowercase(id) or lowercase(list[i].name) == lowercase(id) or findDataType(list[i], id) then
                        	downloadID(list[i].url, id, chat);
                        	return;
                    	end;
                    end;

                    -- Avisa que não achou
                    chat:escrever((id or "") .. " " .. tryTranslate("notFound"));
                end, 
                1000
            );
        end,
        function (errorMsg)
            -- esta função será chamada quando ocorrer algum erro no download.
            -- errorMsg possui a msg de erro
            showMessage(tryTranslate("error.load").."\n" .. errorMsg);
        end,       
        function (downloaded, total)
            -- esta função será chamada constantemente.
            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
        end,
        "alwaysDownload");
end;

local function loadPluginsXMLAsNode()
	local xmlStream = await(Internet.asyncDownload(PLUGINS_XML_URL, "checkForModification"));	
	return NDB.newMemNodeDatabase(xmlStream);
end;

local function findDataTypeNodeInsideDataTypesArrayNode(dataTypesArrayNode, dataType, formType)
	assert(dataTypesArrayNode ~= nil);
	dataTypesArray = NDB.getChildNodes(dataTypesArrayNode);
	
	for i = 1, #dataTypesArray, 1 do
		local dataTypeNode = dataTypesArray[i];
		assert(dataTypeNode ~= nil);
		
		if (lowercase(dataTypeNode.id) == lowercase(dataType)) and 
		   (lowercase(dataTypeNode.formType) == lowercase(formType)) then
			return dataTypeNode;
		end;
	end			
	
	return nil;
end;

local function findDataTypeNodeInsidePluginNode(pluginNode, dataType, formType)
	assert(pluginNode ~= nil);
	local dataTypesArrayNodes = pluginNode.dataTypes;
	
	if dataTypesArrayNodes ~= nil then
		return findDataTypeNodeInsideDataTypesArrayNode(dataTypesArrayNodes, dataType, formType);
	else
		return nil;
	end;
end;

local function findDataTypeNodeInsideDocRoot(docRootNode, dataType, formType)
	assert(docRootNode ~= nil);
	local pluginNodeArray = NDB.getChildNodes(docRootNode);

	for i = 1, #pluginNodeArray, 1 do
		local pluginNode = pluginNodeArray[i];
		assert(pluginNode ~= nil);
		
		local dataTypeNode = findDataTypeNodeInsidePluginNode(pluginNode, dataType, formType);
		
		if dataTypeNode ~= nil then
			return dataTypeNode, pluginNode;
		end;
	end;
	
	return nil, nil;
end;

local function loadLocalizedTextsFromInfoNode(infoNode, destLocalizedTexts)
	assert((infoNode ~= nil) and (destLocalizedTexts ~= nil));
		
	local localeId = infoNode.lang;
	local attributes = NDB.getAttributes(infoNode);
	
	for k, v in pairs(attributes) do
		if k ~= "lang" then
			destLocalizedTexts:addText(localeId, k, v);
		end;
	end;
end;

local function scanAndLoadLocalizedTextsFromInfoNodesInside(parentNode, destLocalizedTexts)
	assert((parentNode ~= nil) and (destLocalizedTexts ~= nil));	

	local childNodes = NDB.getChildNodes(parentNode);
	
	for i = 1, #childNodes, 1 do
		if NDB.getNodeName(childNodes[i]) == "info" then
			loadLocalizedTextsFromInfoNode(childNodes[i], destLocalizedTexts);
		end;
	end;	
end;

local function dataTypeNodeToLocalizedTable(dataTypeNode)
	assert(dataTypeNode ~= nil);
	
	local texts = Locale.newLocalizedTexts();
	texts:addText("", "title", dataTypeNode.title);	
	
	scanAndLoadLocalizedTextsFromInfoNodesInside(dataTypeNode, texts);
		
	return {id = dataTypeNode.id,
			formType = dataTypeNode.formType, 
	        title = texts:tryLang("title"),
			description = texts:tryLang("description")};
end;

local function pluginNodeToLocalizedTable(pluginNode)
	assert(pluginNode ~= nil);
	
	local texts = Locale.newLocalizedTexts();
	texts:addText("", "name", pluginNode.name);	
	texts:addText("", "author", pluginNode.author);	
	texts:addText("", "description", pluginNode.description);
	texts:addText("", "version", pluginNode.version);
	texts:addText("", "site", pluginNode.site);
	texts:addText("", "contact", pluginNode.contact);
	
	scanAndLoadLocalizedTextsFromInfoNodesInside(pluginNode, texts);
		
	return {id = pluginNode.id,
			url = pluginNode.url,
			fileName = pluginNode.fileName,
			repositoryPath = pluginNode.repositoryPath,
			compilationDate = pluginNode.compilationDate,
			compilationDigest = pluginNode.compilationDigest,			
			name = texts:tryLang("name"),
			author = texts:tryLang("author"),
	        description = texts:tryLang("description"),
			version = texts:tryLang("version"),
			site = texts:tryLang("site"),
			contact = texts:tryLang("contact")};		
end;

-- Functions exported to the Firecast Client Executable

function AutoUpdater_asyncFindDataTypeNode(dataType, formType)
	local docNode = loadPluginsXMLAsNode();
	assert(docNode ~= nil);
	
	local dataTypeNode, pluginNode = findDataTypeNodeInsideDocRoot(docNode, dataType, formType);				
	
	if (dataTypeNode ~= nil) and (pluginNode ~= nil) then	
		local dataTypeAsInfoTable = dataTypeNodeToLocalizedTable(dataTypeNode);
		local pluginAsInfoTable = pluginNodeToLocalizedTable(pluginNode);	
		
		return true, dataTypeAsInfoTable, pluginAsInfoTable;
	else	
		return false;
	end;
end;

function AutoUpdater_showAvailablePlugins()
	local cfgForm = getConfigWindow();
	assert(cfgForm ~= nil);

	cfgForm.tabAvailable:activate();
	cfgForm:show();	
end;

-- Implementação dos comandos
Firecast.Messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "autoupdater" then
			local args = {};
			local index = 0;
						
			for i in string.gmatch(message.parametro, "%S+") do
				index = index + 1;
				args[index] = i;
			end

			if index == 0 then
				local cfgForm = getConfigWindow();

				if (cfgForm) then
					cfgForm:show();
				end;
			else
				-- search for the plugin and download
				tryInstall(message.parametro, message.chat);
			end;		

			message.response = {handled = true};
		end
	end);

Firecast.Messaging.listen("ListChatCommands",
		function(message)
				message.response = {{comando="/autoupdater", descricao=tryTranslate("help.desc")},
									{comando="/autoupdater <id|nome>", descricao=tryTranslate("help.download")}};
		end);

-- Automatically Update

local installed = Firecast.Plugins.getInstalledPlugins()
local promise = Async.execute(loadPluginsXMLAsNode)
promise:thenDo(
	function(node)
		local available = NDB.getChildNodes(node)

		for i=1, #installed, 1 do
			for j=1, #available, 1 do
				if installed[i].moduleId == available[j].id and isNewVersion(installed[i].version, available[j].version) then 
					downloadID(available[j].url, available[j].id, nil)
					break
				end
			end
		end
	end)