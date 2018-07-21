require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("ndb.lua");
require("internet.lua");

afkdb = ndb.load("afkData.xml");
if afkdb.afkStatus==nil then
	afkdb.afkStatus = {};
end;
if afkdb.afkBotClock== nil then
	afkdb.afkBotClock = {};
end;
if afkdb.afkMessage== nil then
	afkdb.afkMessage = {};
end;
if afkdb.afkSpectator== nil then
	afkdb.afkSpectator = {};
end;
if afkdb.diceStatus== nil then
	afkdb.diceStatus = {};
end;
if afkdb.diceTimes== nil then
	afkdb.diceTimes = {};
end;
if afkdb.laughStatus== nil then
	afkdb.laughStatus = {};
end;
if afkdb.laughTimes== nil then
	afkdb.laughTimes = {};
end;

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

-- Implementação dos comandos
rrpg.messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "afk" then
			if afkdb.afkStatus[message.mesa.codigoInterno] == false or afkdb.afkStatus[message.mesa.codigoInterno] == nil then
				afkdb.afkStatus[message.mesa.codigoInterno] = true;
				afkdb.afkBotClock[message.mesa.codigoInterno] = os.clock() - 300;
				if message.parametro == "true" then
					afkdb.afkSpectator[message.mesa.codigoInterno] = true;
					message.chat:escrever("AfkBot habilitado! Espectadores serão automaticamente alertados!");
				else
					afkdb.afkSpectator[message.mesa.codigoInterno] = false;
					message.chat:escrever("AfkBot habilitado! Espectadores não serão automaticamente alertados!");
				end;
			else
				afkdb.afkStatus[message.mesa.codigoInterno] = false;
				afkdb.afkSpectator[message.mesa.codigoInterno] = false;
				message.chat:escrever("AfkBot desabilitado!");
			end		
			
			message.response = {handled = true};
		elseif message.comando == "msg" then
			if message.parametro == "" or message.parametro == nil then
				message.chat:escrever("Sua mensagem salva é: [" .. (afkdb.afkMessage[message.mesa.codigoInterno] or "") .. "].");
			else
				afkdb.afkMessage[message.mesa.codigoInterno] = message.parametro;
				message.chat:escrever("Sua mensagem: [" .. afkdb.afkMessage[message.mesa.codigoInterno] .. "] foi salva.");
			end;
			message.response = {handled = true};
		elseif message.comando == "stopdice" then
			if afkdb.diceStatus[message.mesa.codigoInterno] == false or afkdb.diceStatus[message.mesa.codigoInterno] == nil then
				afkdb.diceStatus[message.mesa.codigoInterno] = true;
				message.chat:escrever("Espectadores serão alertados para não rolarem dados.");

			else
				afkdb.diceStatus[message.mesa.codigoInterno] = false;
				afkdb.afkSpectator[message.mesa.codigoInterno] = false;
				message.chat:escrever("Espectadores não serão alertados para não rolarem dados.");
			end	

			message.response = {handled = true};
		elseif message.comando == "stoplaugh" or message.comando == "semrisada" then
			if afkdb.laughStatus[message.mesa.codigoInterno] == false or afkdb.laughStatus[message.mesa.codigoInterno] == nil then
				afkdb.laughStatus[message.mesa.codigoInterno] = true;
				message.chat:escrever("Espectadores serão alertados para não usarem o comando /rir.");

			else
				afkdb.laughStatus[message.mesa.codigoInterno] = false;
				afkdb.afkSpectator[message.mesa.codigoInterno] = false;
				message.chat:escrever("Espectadores não serão alertados para não usarem o comando /rir.");
			end	

			message.response = {handled = true};
		elseif message.comando == "cleandice" then
			if message.parametro ~= "" and message.parametro ~= nil then
				afkdb.diceTimes[message.parametro] = 0;
				message.chat:escrever("Jogador " .. message.parametro .. " perdoado.");
			else
				message.chat:escrever("Login invalido.");
			end;

			message.response = {handled = true};
		end
	end);

-- Escuta das mensagens de chat padrão
rrpg.messaging.listen("ChatMessage", 
	function (message)
		if afkdb.afkStatus[message.mesa.codigoInterno] == true then
			local time = os.clock();
			if afkdb.afkBotClock[message.mesa.codigoInterno]~=nil and afkdb.afkBotClock[message.mesa.codigoInterno]+300 > time then
				return;
			end;

			local text = utils.removerFmtChat(message.texto, true);
			local login = message.mesa.meuJogador.login;
			local nick = utils.removerFmtChat(message.mesa.meuJogador.nick, true);

			if message.mesa.meuJogador.isMestre then
				text = text:lower();
				nick = nick:lower();
				login = login:lower();
			else
				message.chat:escrever("Apenas mestres!");
				return;
			end;
			
			local isLogin = string.match(text, login) ~= nil;
			local isNick = string.match(text, nick) ~= nil;
			local isMestre = string.match(text, "mestre") ~= nil;
			local isDia = string.match(text, "bom dia") ~= nil;
			local isTarde = string.match(text, "boa tarde") ~= nil;
			local isNoite = string.match(text, "boa noite") ~= nil;

			if isLogin or isNick or isMestre or isDia or isTarde or isNoite then
				local info = "[§K1]AfkBot: Está é uma mensagem automatica de " .. message.mesa.meuJogador.nick .. "[§K1](" .. message.mesa.meuJogador.login .. ") que está ocupado e não pode responder.";

				afkdb.afkBotClock[message.mesa.codigoInterno] = os.clock();
				message.chat:enviarNarracao(info);
				message.chat:enviarNarracao(afkdb.afkMessage[message.mesa.codigoInterno]);
				return;
			end;
		end
	end);

-- Escuta por rolagens de dado
rrpg.messaging.listen("ChatMessage", 
	function (message)
		if afkdb.diceStatus[message.mesa.codigoInterno] == true then

			if message.jogador == nil or message.mesa == nil then
				return;
			end;
			if message.tipo ~= "dados" then
				return;
			end;

			if message.mesa.meuJogador.isMestre and message.jogador.isEspectador then
				afkdb.diceTimes[message.jogador.login] = (afkdb.diceTimes[message.jogador.login] or 0) + 1;

				if afkdb.diceTimes[message.jogador.login] < 4 then
					message.chat:enviarNarracao("Por favor, pare de rolar dados. Ou irá ser expulso da mesa. Se quiser testar algo abra um pvt consigo mesmo. Esse é seu " .. afkdb.diceTimes[message.jogador.login] .. "º aviso. ");
				else
					message.chat:enviarNarracao("Você foi avisado. ");
					message.jogador:requestKick();
				end;
			else
				return;
			end;


		end
	end);

-- Escuta por risadas
rrpg.messaging.listen("ChatMessage", 
	function (message)
		if afkdb.diceStatus[message.mesa.codigoInterno] == true then

			if message.jogador == nil or message.mesa == nil then
				return;
			end;
			if message.tipo ~= "rir" then
				return;
			end;

			if message.mesa.meuJogador.isMestre and message.jogador.isEspectador then
				afkdb.diceTimes[message.jogador.login] = (afkdb.diceTimes[message.jogador.login] or 0) + 1;

				if afkdb.diceTimes[message.jogador.login] < 2 then
					message.chat:enviarNarracao("Por favor, pare de usar/rir na mesa. Ou irá ser expulso da mesa. Se quiser testar algo abra um pvt consigo mesmo. Esse é será seu unico aviso. ");
				else
					message.chat:enviarNarracao("Você foi avisado. ");
					message.jogador:requestKick();
				end;
			else
				return;
			end;
		end
	end);

-- Enviar a mensagem de afk para todos espectadores, se ativo
rrpg.messaging.listen("MesaJoined",
	function(message)
		local time = os.clock();
		if afkdb.afkBotClock[message.mesa.codigoInterno]~=nil and afkdb.afkBotClock[message.mesa.codigoInterno]+300 > time then
			return;
		end;
		if afkdb.afkSpectator[message.mesa.codigoInterno] and message.jogador.isEspectador then
			afkdb.afkBotClock[message.mesa.codigoInterno] = os.clock();

			local info = "[§K1]AfkBot: Está é uma mensagem automatica de " .. message.mesa.meuJogador.nick .. "[§K1](" .. message.mesa.meuJogador.login .. ") que está ocupado e não pode responder.";
			message.mesa.chat:enviarNarracao(info);
			message.mesa.chat:enviarNarracao(afkdb.afkMessage[message.mesa.codigoInterno]);
		end;
	end);

rrpg.messaging.listen("ListChatCommands",
    function(message)
        message.response = {{comando="/msg <Vazio>", descricao="Mostra a mensagem atual salva no AfkBot."},
                            {comando="/msg <Texto>", descricao="Salva <Texto> como a mensagem automatica de resposta no AfkBot. "},
                            {comando="/stopdice", descricao="Avisa a espectadores para pararem de rolar dados e os expulsa na 4ª vez que o fizerem."},
                            {comando="/stoplaugh or /semrisada", descricao="Avisa a espectadores para pararem de usar o comando rir e os expulsa na 2ª vez que o fizerem."},
                            {comando="/cleanwarn <login>", descricao="Limpa o contador de rolagens e risadas de um jogador. "},
                            {comando="/afk <Boolean (opcional)>", descricao="Ativa ou desativa o AfkBot v0.8, opcionalmente passando true como parametro o bot avisa cada espectador que entrar na mesa. "}};
    end);

-- auto-update
internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/AfkBot/output/AfkBot.rpk?raw=true",
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
                    Dialogs.choose("Há uma nova versão do AfkBot (".. infor.version .."). Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                        function(selected, selectedIndex, selectedText)
                            if selected and selectedIndex == 1 then
                                gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/AfkBot/output/AfkBot.rpk?raw=true');
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