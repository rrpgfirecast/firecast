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
if afkdb.config == nil then 
	afkdb.config = {};
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

local function initializeRoom(mesa)
	if afkdb.config[mesa.codigoInterno] == nil then
		afkdb.config[mesa.codigoInterno] = {};
	end;
end
local function initializeClock(mesa)
	if afkdb.config[mesa.codigoInterno].clock == nil then
		local delay = tonumber(afkdb.config[mesa.codigoInterno].delay) or 5;
		afkdb.config[mesa.codigoInterno].clock = os.time() - (delay * 60);
	end;
end
local function sendPersonalMessage(chat, mesa)
	-- dia e hora atual
	local date = os.date("*t");

	-- Ache qual a mensagem para esse dia e hora. 
	local node = afkdb.config[mesa.codigoInterno];
	local messages = ndb.getChildNodes(afkdb.config[mesa.codigoInterno].messagesList);
	local message = "";
	for i=1, #messages, 1 do
		local msg = messages[i];
		local valid = true;
		-- verifica se é do dia da semana certo. 
		valid = valid and msg["d" .. date.wday];
		-- verifica se é a hora certa. 
		valid = valid and (msg.hourStart < date.hour or (msg.hourStart == date.hour and msg.minuteStart <= date.min));
		valid = valid and (msg.hourEnd > date.hour or (msg.hourEnd == date.hour and msg.minuteEnd >= date.min));

		if valid then
			message = message .. msg.message;
		end;
	end;

	-- Se tiver alguma mensagem envie
	if message ~= "" then
		chat:enviarNarracao(message);
	else
		local info = "[§K1]AfkBot: Está é uma mensagem automatica de " .. mesa.meuJogador.nick .. "[§K1](" .. mesa.meuJogador.login .. ") que está ocupado e não pode responder.";
		chat:enviarNarracao(info);
	end;
end
local function addUser(mesa)
	local cfgForm = gui.newForm("afkbotPopup");
	cfgForm:setNodeObject(afkdb.config[mesa.codigoInterno]);
	cfgForm.title = "AfkBot - " .. mesa.nome;

	local rcl = gui.findControlByName("kickList", cfgForm);
	if rcl==nil then return end;

	return rcl:append();
end
local function initializeKickList(mesa)
	local list = ndb.getChildNodes(afkdb.config[mesa.codigoInterno].kickList);
	if #list == 0 then
		local item = addUser(mesa);
		item.login = "Login";
		item.dice = "Rolagens";
		item.laugh = "Risadas";
		item.user = false;
	end;
end
local function findLogin(login, mesa)
	local list = ndb.getChildNodes(afkdb.config[mesa.codigoInterno].kickList);
	local user = nil;
	for i=1, #list, 1 do 
		local item = list[i];
		if item.user and item.login == login then
			user = item;
		end;
	end;
	return user;
end
function getConfigWindow(mesa)
	initializeRoom(mesa);

	local cfgForm = gui.newForm("afkbotPopup");
	cfgForm:setNodeObject(afkdb.config[mesa.codigoInterno]);
	cfgForm.title = "AfkBot - " .. mesa.nome;
	popup = cfgForm;
	
	return cfgForm;
end

-- Implementação dos comandos
rrpg.messaging.listen("HandleChatCommand", 
	function (message)
		initializeRoom(message.mesa);
		if message.comando == "afk" then
			if afkdb.config[message.mesa.codigoInterno].botEnabled == false or afkdb.config[message.mesa.codigoInterno].botEnabled == nil then
				afkdb.config[message.mesa.codigoInterno].botEnabled = true;

				local delay = tonumber(afkdb.config[message.mesa.codigoInterno].delay) or 5;

				afkdb.config[message.mesa.codigoInterno].clock = os.time() - (delay * 60);
				if message.parametro == "true" then
					afkdb.config[message.mesa.codigoInterno].spectator = true;
					message.chat:escrever("AfkBot habilitado! Espectadores serão automaticamente alertados!");
				else
					afkdb.config[message.mesa.codigoInterno].spectator = false;
					message.chat:escrever("AfkBot habilitado! Espectadores não serão automaticamente alertados!");
				end;
			else
				afkdb.config[message.mesa.codigoInterno].botEnabled = false;
				afkdb.config[message.mesa.codigoInterno].spectator = false;
				message.chat:escrever("AfkBot desabilitado!");
			end		
			
			message.response = {handled = true};
		elseif message.comando == "stopdice" then
			if afkdb.config[message.mesa.codigoInterno].stopDice == false or afkdb.config[message.mesa.codigoInterno].stopDice == nil then
				afkdb.config[message.mesa.codigoInterno].stopDice = true;
				message.chat:escrever("Espectadores serão alertados para não rolarem dados.");

			else
				afkdb.config[message.mesa.codigoInterno].stopDice = false;
				message.chat:escrever("Espectadores não serão alertados para não rolarem dados.");
			end	

			message.response = {handled = true};
		elseif message.comando == "stoplaugh" or message.comando == "semrisada" then
			if afkdb.config[message.mesa.codigoInterno].stopLaugh == false or afkdb.config[message.mesa.codigoInterno].stopLaugh == nil then
				afkdb.config[message.mesa.codigoInterno].stopLaugh = true;
				message.chat:escrever("Espectadores serão alertados para não usarem o comando /rir.");

			else
				afkdb.config[message.mesa.codigoInterno].stopLaugh = false;
				message.chat:escrever("Espectadores não serão alertados para não usarem o comando /rir.");
			end	

			message.response = {handled = true};
		elseif message.comando == "cleanwarn" then
			if message.parametro ~= "" and message.parametro ~= nil then
				local user = findLogin(message.parametro, message.mesa);

				if user~=nil then
					user.dice = 0;
					user.laugh = 0;
					user.kicked = false;
					message.chat:escrever("Jogador " .. message.parametro .. " perdoado.");
				else
					message.chat:escrever("Login não encontrado.");
				end;
			else
				message.chat:escrever("Login invalido.");
			end;

			message.response = {handled = true};
		elseif message.comando == "afkbot" then
			local cfgForm = getConfigWindow(message.mesa);

			if (cfgForm) then
				cfgForm:show();
			end;

			message.response = {handled = true};
		end
	end);

-- Escuta das mensagens de chat padrão 
rrpg.messaging.listen("ChatMessage", 
	function (message)
		initializeRoom(message.mesa);
		initializeClock(message.mesa);
		-- se o alerta está ativado
		local alert = afkdb.config[message.mesa.codigoInterno].botEnabled;
		-- ou o auto alerta está ativado e o usuario está ausente]
		alert = alert or (afkdb.config[message.mesa.codigoInterno].autoEnable and message.mesa.meuJogador.isAusente);

		-- e faz mais de X minutos desde o ultimo alerta
		local delay = tonumber(afkdb.config[message.mesa.codigoInterno].delay) or 5;
		alert = alert and not (afkdb.config[message.mesa.codigoInterno].clock + (delay * 60) > os.time());
		-- e o usuario é mestre
		alert = alert and message.mesa.meuJogador.isMestre;
		
		if alert then
			local text = utils.removerFmtChat(message.texto, true);
			local login = message.mesa.meuJogador.login;
			local nick = utils.removerFmtChat(message.mesa.meuJogador.nick, true);

			text = text:lower();
			nick = nick:lower();
			login = login:lower();
			
			local isLogin = string.match(text, login) ~= nil;
			local isNick = string.match(text, nick) ~= nil;
			local isMestre = string.match(text, "mestre") ~= nil;
			local isDia = string.match(text, "bom dia") ~= nil;
			local isTarde = string.match(text, "boa tarde") ~= nil;
			local isNoite = string.match(text, "boa noite") ~= nil;

			if isLogin or isNick or isMestre or isDia or isTarde or isNoite then
				afkdb.config[message.mesa.codigoInterno].clock = os.time();
				sendPersonalMessage(message.chat, message.mesa);
				return;
			end;
		end
	end);

-- Enviar a mensagem de afk para todos espectadores, se ativo
rrpg.messaging.listen("MesaJoined",
	function(message)
		initializeRoom(message.mesa);
		initializeClock(message.mesa);
		-- se o alerta está ativado
		local alert = afkdb.config[message.mesa.codigoInterno].botEnabled;
		-- ou o auto alerta está ativado e o usuario está ausente]
		alert = alert or (afkdb.config[message.mesa.codigoInterno].autoEnable and message.mesa.meuJogador.isAusente);
		-- e faz mais de X minutos desde o ultimo alerta
		local delay = tonumber(afkdb.config[message.mesa.codigoInterno].delay) or 5;
		alert = alert and not (afkdb.config[message.mesa.codigoInterno].clock + (delay * 60) > os.time());
		-- e o usuario é mestre
		alert = alert and message.mesa.meuJogador.isMestre;
		-- e está alerta a espectadores
		alert = alert and afkdb.config[message.mesa.codigoInterno].spectator;
		-- e entrou um espectador
		alert = alert and message.jogador.isEspectador;

		if alert then
			afkdb.config[message.mesa.codigoInterno].clock = os.time();
			sendPersonalMessage(message.chat, message.mesa);
		end;

		-- ver se espectador pode falar na mesa

		local user = findLogin(message.jogador.login, message.mesa);
		-- se noVoice está ativo
		local noVoice = afkdb.config[message.mesa.codigoInterno].noVoice;
		-- e o usuario é mestre
		noVoice = noVoice and message.mesa.meuJogador.isMestre;
		-- e entrou um espectador
		noVoice = noVoice and message.jogador.isEspectador;
		-- E o usuario já foi kickado.
		noVoice = noVoice and user~=nil and user.kicked == true;
		if noVoice then
			message.jogador:requestSetMudo(true);
		end;
	end);

-- Escuta por rolagens de dado
rrpg.messaging.listen("ChatMessage", 
	function (message)
		initializeRoom(message.mesa);
		-- Ve se está ligado o autokick para dados
		local valid = afkdb.config[message.mesa.codigoInterno].stopDice == true;
		-- Ve se a mensagem de chat é de um jogador numa mesa
		valid = valid and message.jogador ~= nil and message.mesa ~= nil;
		-- Ve se é uma rolagem de dados
		valid = valid and message.tipo == "dados";
		-- Ve se o usuario é mestre da mesa
		valid = valid and message.mesa.meuJogador.isMestre;
		-- Ve se quem rolou o dado é espectador
		valid = valid and message.jogador.isEspectador;

		if valid then
			initializeKickList(message.mesa);
			local user = findLogin(message.jogador.login, message.mesa);
			if user == nil then
				user = addUser(message.mesa);
				user.login = message.jogador.login;
				user.dice = 0;
				user.laugh = 0;
				user.user = true;
			end;

			user.dice = (user.dice or 0) + 1;

			if user.dice < (tonumber(afkdb.config[message.mesa.codigoInterno].limitDice) or 4) then
				message.chat:enviarNarracao("Por favor, pare de rolar dados. Ou irá ser expulso da mesa. Se quiser testar algo abra um pvt consigo mesmo. Esse é seu " .. user.dice .. "º aviso. ");
			else
				message.chat:enviarNarracao("Você foi avisado. ");
				message.jogador:requestKick();
				user.kicked = true;
			end;
		end
	end);

-- Escuta por risadas
rrpg.messaging.listen("ChatMessage", 
	function (message)
		initializeRoom(message.mesa);
		-- Ve se está ligado o autokick para risadas
		local valid = afkdb.config[message.mesa.codigoInterno].stopDice == true;
		-- Ve se a mensagem de chat é de um jogador numa mesa
		valid = valid and message.jogador ~= nil and message.mesa ~= nil;
		-- Ve se é uma risada
		valid = valid and message.tipo == "rir";
		-- Ve se o usuario é mestre da mesa
		valid = valid and message.mesa.meuJogador.isMestre;
		-- Ve se quem rolou o dado é espectador
		valid = valid and message.jogador.isEspectador;

		if valid then
			initializeKickList(message.mesa);
			local user = findLogin(message.jogador.login, message.mesa);
			if user == nil then
				user = addUser(message.mesa);
				user.login = message.jogador.login;
				user.dice = 0;
				user.laugh = 0;
				user.user = true;
			end;

			user.laugh = (user.laugh or 0) + 1;

			if user.laugh < (tonumber(afkdb.config[message.mesa.codigoInterno].limitLaugh) or 2) then
				message.chat:enviarNarracao("Por favor, pare de usar /rir na mesa. Ou irá ser expulso da mesa. Se quiser testar algo abra um pvt consigo mesmo. Esse é seu " .. user.laugh .. "º aviso. ");
			else
				message.chat:enviarNarracao("Você foi avisado. ");
				message.jogador:requestKick();
				user.kicked = true;
			end;
		end
	end);

rrpg.messaging.listen("ListChatCommands",
    function(message)
        message.response = {{comando="/afkbot", descricao="Exibe a janela de configuração do afkbot."},
                            {comando="/stopdice", descricao="Avisa a espectadores para pararem de rolar dados e os expulsa na 4ª vez que o fizerem."},
                            {comando="/stoplaugh or /semrisada", descricao="Avisa a espectadores para pararem de usar o comando rir e os expulsa na 2ª vez que o fizerem."},
                            {comando="/cleanwarn <login>", descricao="Limpa o contador de rolagens e risadas de um jogador. "},
                            {comando="/afk <Boolean (opcional)>", descricao="Ativa ou desativa o AfkBot v1.0, opcionalmente passando true como parametro o bot avisa cada espectador que entrar na mesa. "}};
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