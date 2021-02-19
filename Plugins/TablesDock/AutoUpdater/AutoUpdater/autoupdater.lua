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

local function downloadID(url, stream)
	local install = true;
	if stream ~= nil then
		install = Firecast.Plugins.installPlugin(stream, true);
	end;
	if install == false or stream == nil then
		GUI.openInBrowser(url);
	end;
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
                    updaterSheet.loading = "Carregando 0/" .. updaterSheet.toLoad;

                    for i=1, #list, 1 do
                        -- Verifica se tem updates em cada plugin
                        if lowercase(list[i].id) == lowercase(id) or lowercase(list[i].name) == lowercase(id) or findDataType(list[i], id) then
                        	downloadID(list[i].url, nil);
                        	return;
                    	end;
                    end;

                    -- Avisa que não achou
                    chat:escrever((id or "") .. " não foi encontrado.");
                end, 
                1000
            );
        end,
        function (errorMsg)
            -- esta função será chamada quando ocorrer algum erro no download.
            -- errorMsg possui a msg de erro
            showMessage("Não consegui pegar a lista de plugins do githut :/ \n" .. errorMsg);
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
				message.response = {{comando="/autoupdater", descricao="Abre o pop up do Auto Updater. "},
									{comando="/autoupdater <id|nome>", descricao="Procura o plugin com id|nome e o instala/baixa. "}};
		end);