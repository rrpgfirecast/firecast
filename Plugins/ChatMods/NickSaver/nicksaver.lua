require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("internet.lua");

local config = ndb.load("config.xml");

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

nickdb = ndb.load("nickData.xml");
if nickdb.nicksSaved==nil then
	nickdb.nicksSaved = {};
end;
colordb = ndb.load("colorData.xml");
if colordb.colorsSaved==nil then
	colordb.colorsSaved = {};
end;

-- Implementação dos comandos
rrpg.messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "savenick" then
			if message.parametro == nil or message.parametro == "" then
				local nick = message.mesa.meuJogador.nick;

				if nick ~= nil then
					nickdb.nicksSaved[message.mesa.codigoInterno] = nick;
					message.mesa.chat:escrever("Nick <" .. nick .. "[§K1]> salvo.");
				end;
			else
				nickdb.nicksSaved[message.mesa.codigoInterno] = message.parametro;
				message.mesa.chat:escrever("Nick <" .. message.parametro .. "[§K1][§K1]> salvo.");
			end;

			message.response = {handled = true};
		elseif message.comando == "savecolor" then
			local num;
			if message.parametro ~= nil then
				num = tonumber(message.parametro);
				if num~=nil and num > 15 then
					num = nil;
				end;
			end;

			if message.parametro == nil or message.parametro == "" or num == nil then
				message.mesa.chat:escrever("[§K1]Use /savecolor  <0-15> para salvar uma cor; ou /savecolor -1 para apagar a cor salva.");
			elseif num < 0 then
				colordb.colorsSaved[message.mesa.codigoInterno] = nil;
				message.mesa.chat:escrever("Cor salva apagada.");
			else
				colordb.colorsSaved[message.mesa.codigoInterno] = num;
				message.mesa.chat:escrever("Cor <" .. num .. "> salva.");
			end;

			message.response = {handled = true};
		end
	end);

-- Escuta das mensagens de chat padrão
rrpg.messaging.listen("MesaJoined", 
	function (message)
		if message.eu and nickdb.nicksSaved[message.mesa.codigoInterno]~=nil then

			local nick = message.mesa.meuJogador.nick;

			if nickdb.nicksSaved[message.mesa.codigoInterno] ~= nick then
				message.mesa.chat:enviarMensagem("/nick " .. nickdb.nicksSaved[message.mesa.codigoInterno]);
			end;
		end
	end);

rrpg.listen('HandleChatTextInput',
    function(message)  
    	if colordb.colorsSaved[message.mesa.codigoInterno] ~= nil and message.texto:sub(1, 1) ~= "/" then
    		message.response = {newText = "[§K" .. colordb.colorsSaved[message.mesa.codigoInterno] .. "] " .. message.texto};
    	end;
    end);

rrpg.messaging.listen("ListChatCommands",
        function(message)
                message.response = {{comando="/savenick", descricao="Salva o nick atual para essa mesa. "},
                					 {comando="/savenick <NICK>", descricao="Salva o <NICK> para essa mesa. "},
                					 {comando="/savecolor <0-15>", descricao="Salva a cor para essa mesa. "},
                					 {comando="/savecolor -1", descricao="Apaga a cor salva para essa mesa. "}};
        end);

-- auto-update
internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/NickSaver/output/NickSaver.rpk?raw=true",
            function(stream, contentType)
                local info = rrpg.plugins.getRPKDetails(stream);
                config.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;

                local installed = rrpg.plugins.getInstalledPlugins();
                local myself;
                for i=1, #installed, 1 do
                    if installed[i].moduleId == info.moduleId then
                        myself = installed[i];
                        config.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                    end;
                end;

                if config.noUpdate==true then return end;
                if myself~= nil and isNewVersion(myself.version, info.version) then
                    Dialogs.choose("Há uma nova versão do Nick Saver (".. infor.version .."). Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                        function(selected, selectedIndex, selectedText)
                            if selected and selectedIndex == 1 then
                                gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/NickSaver/output/NickSaver.rpk?raw=true');
                            elseif selected and selectedIndex == 3 then
                                config.noUpdate = true;
                            end;
                        end);
                end;
            end,       
            function (errorMsg)
                --showMessage(errorMsg);
            end,       
            function (downloaded, total)
                -- esta função será chamada constantemente.
                -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
            end);