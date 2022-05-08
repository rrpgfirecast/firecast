require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("internet.lua");


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
    local mesa = Firecast.getMesaDe(self);
    if str then
        chat:escrever(str);
    else
        chat:escrever("String nula");
    end;
end;

local function tryTranslate(text)
    local trans = Locale.tryLang(text);
    if trans == nil then trans = text end;
    return trans;
end

local function downloadID(url, id, chat)
	local install = true;
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
	Internet.download("https://raw.githubusercontent.com/rrpgfirecast/firecast/master/Plugins/plugins.xml",
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
end

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

			local obj = {parametro=message.parametro, arg=args};

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