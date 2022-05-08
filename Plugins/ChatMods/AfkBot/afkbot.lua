require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("ndb.lua");
require("internet.lua");
require("rrpgRequests.lua");   

afkdb = NDB.load("afkData.xml");
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

local config = NDB.load("config.xml");

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
	if mesa == nil then return end;
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

local function tryNPC(isMestre, chat, npc, msg)
	if isMestre then
		chat:enviarMensagemNPC(npc, msg);
	else
		chat:enviarMensagem("<" .. npc .. ">: " .. msg);
	end
end

local function sendPersonalMessage(chat, mesa)
	-- dia e hora atual
	local date = os.date("*t");

	-- Ache qual a mensagem para esse dia e hora. 
	local messages = NDB.getChildNodes(afkdb.config[mesa.codigoInterno].messagesList);
	local message = "";
	for i=1, #messages, 1 do
		local msg = messages[i];
		if msg.hourStart == nil then msg.hourStart = 0 end;
		if msg.minuteStart == nil then msg.minuteStart = 0 end;
		if msg.hourEnd == nil then msg.hourEnd = 23 end;
		if msg.minuteEnd == nil then msg.minuteEnd = 59 end;

		local valid = true;
		-- verifica se é do dia da semana certo. 
		valid = valid and msg["d" .. date.wday];
		-- verifica se é a hora certa. 
		valid = valid and (msg.hourStart < date.hour or (msg.hourStart == date.hour and msg.minuteStart <= date.min));
		valid = valid and (msg.hourEnd > date.hour or (msg.hourEnd == date.hour and msg.minuteEnd >= date.min));

		if valid then
			message = message .. (msg.message or "");
		end;
	end;

	-- Se tiver alguma mensagem envie
	if message ~= "" then
		tryNPC(true,chat,"AfkBot",message);
	else
		local info = "[§K1]Está é uma mensagem automatica de " .. mesa.meuJogador.nick .. "[§K1](" .. mesa.meuJogador.login .. ") que está ocupado e não pode responder.";
		tryNPC(true,chat,"AfkBot",info);
	end;
end
local function addUser(mesa)
	local cfgForm = GUI.newForm("afkbotPopup");
	cfgForm:setNodeObject(afkdb.config[mesa.codigoInterno]);
	cfgForm.title = "AfkBot - " .. mesa.nome;

	local rcl = GUI.findControlByName("kickList", cfgForm);
	if rcl==nil then return end;

	return rcl:append();
end
local function initializeKickList(mesa)
	local list = NDB.getChildNodes(afkdb.config[mesa.codigoInterno].kickList);
	if #list == 0 then
		local item = addUser(mesa);
		item.login = "Login";
		item.dice = "Rolagens";
		item.laugh = "Risadas";
		item.user = false;
	end;
end
local function findLogin(login, mesa)
	local list = NDB.getChildNodes(afkdb.config[mesa.codigoInterno].kickList);
	local user = nil;
	for i=1, #list, 1 do 
		local item = list[i];
		if item.user and item.login == login then
			user = item;
		end;
	end;
	return user;
end

local function DFFindBibItem(file, bibItem)
	if bibItem== nil then return nil end;
	if bibItem.nome == file then
		return bibItem.codigoInterno;
	else
		for i=1, #bibItem.filhos do
			local itemID = DFFindBibItem(file, bibItem.filhos[i]);
			if itemID ~= nil then
				return itemID;
			end
		end
	end

	return nil;
end

local function ShowBibItem(message, param)
	if param ~= "" and param ~= nil then
		local itemID = DFFindBibItem(param, message.mesa.biblioteca);

		if itemID == nil then
			tryNPC(message.mesa.meuJogador.isMestre, message.chat,"AfkBot","Arquivo invalido. Passe o nome do arquivo como parametro. ");
		else
			tryNPC(message.mesa.meuJogador.isMestre, message.chat,"AfkBot","firecast:/rooms/"..message.mesa.codigoInterno.."/library/"..itemID .. " [" .. param .. "]");
		end
	else
		tryNPC(message.mesa.meuJogador.isMestre, message.chat,"AfkBot","Arquivo invalido. Passe o nome do arquivo como parametro. ");
	end
end

function getConfigWindow(mesa)
	initializeRoom(mesa);

	local cfgForm = GUI.newForm("afkbotPopup");
	cfgForm:setNodeObject(afkdb.config[mesa.codigoInterno]);
	cfgForm.title = "AfkBot - " .. mesa.nome;
	popup = cfgForm;
	
	return cfgForm;
end

-- Implementação dos comandos
Firecast.Messaging.listen("HandleChatCommand", 
	function (message)
		if message.mesa == nil then return end;
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
		elseif message.comando == "show" then
			ShowBibItem(message, message.parametro);

			message.response = {handled = true};
		end
	end);

-- Escuta das mensagens de chat padrão e decide se deve ou não enviar o alerta por conta dessa mensagem
Firecast.Messaging.listen("ChatMessage", 
	function (message)
		if message.mesa == nil then return end;
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
			local text = Utils.removerFmtChat(message.texto, true);
			local login = message.mesa.meuJogador.login;
			local nick = Utils.removerFmtChat(message.mesa.meuJogador.nick, true);

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

-- Escuta de quem entra na sala
Firecast.Messaging.listen("MesaJoined",
	function(message)
		if message.mesa == nil then return end;
		-- Enviar a mensagem de afk para todos espectadores, se ativo
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
			sendPersonalMessage(message.mesa.chat, message.mesa);
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

		-- Enviar mensagem de bos vindas automatica.
		local list = NDB.getChildNodes(afkdb.config[message.mesa.codigoInterno].welcomeList);
		if (not message.mesa.isModerada) then
			for i=1, #list, 1 do 
				local item = list[i];
				if item.login == message.jogador.login then
					message.mesa.chat:enviarMensagem(item.message);
					if not item.permanent then
						NDB.deleteNode(item);
					end
				end;
			end;
		end;
	end);

-- Escuta por rolagens de dado
Firecast.Messaging.listen("ChatMessage", 
	function (message)
		if message.mesa == nil then return end;
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
		-- Ve se o mestre autorizou rolagens de espectadores preparando a ficha e esse player tem ficha
		valid = valid and not (afkdb.config[message.mesa.codigoInterno].allowNewPlayer == true and message.jogador.personagemPrincipal ~= -1)

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
				tryNPC(message.mesa.meuJogador.isMestre,message.chat,"AfkBot","Por favor, pare de rolar dados. Ou irá ser expulso da mesa. Se quiser testar algo abra um pvt consigo mesmo. Esse é seu " .. user.dice .. "º aviso. ")
			else
				message.chat:enviarNarracao("Você foi avisado. ");
				message.jogador:requestKick();
				user.kicked = true;
			end;
		end
	end);

-- Escuta por risadas
Firecast.Messaging.listen("ChatMessage", 
	function (message)
		if message.mesa == nil then return end;
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
				tryNPC(message.mesa.meuJogador.isMestre,message.chat,"AfkBot","Por favor, pare de usar /rir na mesa. Ou irá ser expulso da mesa. Se quiser testar algo abra um pvt consigo mesmo. Esse é seu " .. user.laugh .. "º aviso. ");
			else
				message.chat:enviarNarracao("Você foi avisado. ");
				message.jogador:requestKick();
				user.kicked = true;
			end;
		end
	end);

-- Escuta por conversa com afkBot
Firecast.Messaging.listen("ChatMessage",
	function (message)
		if message.mesa == nil then return end;
		initializeRoom(message.mesa);
		local txt =  Utils.removerFmtChat(message.texto, true);
		local arg = {};
		for substring in txt:gmatch("%S+") do
   			table.insert(arg, substring)
		end

		if arg[1]=="afkbot" then


			-- give voice to players
			if ((arg[2]=="voz" or arg[2]=="voice") and message.jogador~=nil and message.jogador.isJogador and message.mesa.isModerada and afkdb.config[message.mesa.codigoInterno].giveVoice) then
				message.jogador:requestSetVoz(true);
			elseif ((arg[2]=="ficha" or arg[2]=="sheet") and afkdb.config[message.mesa.codigoInterno].giveSheet and message.jogador~= nil and message.jogador.personagemPrincipal==-1 and afkdb.config[message.mesa.codigoInterno].dataType~=nil) then 
				Firecast.Requests.criarPersonagem(message.mesa.biblioteca, message.jogador.login, afkdb.config[message.mesa.codigoInterno].dataType, false, message.jogador,
					function (sucess)
						-- do nothing
					end,
					function (fail)
						-- showMessage(fail)
					end);
			elseif (arg[2]=="off") then
				-- poe o jogador no off chat
			elseif (arg[2]=="math") then
				-- faz calculo matematico
			elseif (arg[2]==">>" and message.jogador~=nil and message.jogador.isJogador and afkdb.config[message.mesa.codigoInterno].passAction) then
				if Utils.compareStringPtBr(Utils.removerFmtChat(message.jogador.nick), Utils.removerFmtChat(afkdb.config[message.mesa.codigoInterno].actionOwner)) == 0 then
					message.chat:enviarMensagem("/>>");
				else
					tryNPC(true,message.chat,"AfkBot","Não é sua vez \"" .. (Utils.removerFmtChat(message.jogador.nick) or "nil") .. "\", é a vez de \"" .. (afkdb.config[message.mesa.codigoInterno].actionOwner or "nil") .. "\".");
				end
			elseif (arg[2]=="show") then
				local param = ""; 
				if arg[3]~=nil then param = arg[3] end;
				for i=4,#arg do
					if arg[i] ~= nil then param = param .. " " .. arg[i] end;
				end
				ShowBibItem(message, param);
			else
				-- message.chat:enviarMensagem("AfkBot: Não posso. ");
			end;
		elseif message.mine and string.sub(txt,1,string.len(" >> Turno de "))==" >> Turno de " then
			afkdb.config[message.mesa.codigoInterno].actionOwner = string.sub(txt,string.len(" >> Turno de ")+1,-2);
			--message.chat:escrever(string.sub(txt,string.len(" >> Turno de ")+1));
		end;
	end);

Firecast.Messaging.listen("ListChatCommands",
    function(message)
        message.response = {{comando="/afkbot", descricao="Exibe a janela de configuração do afkbot."},
                            {comando="/stopdice", descricao="Avisa a espectadores para pararem de rolar dados e os expulsa na 4ª vez que o fizerem."},
                            {comando="/stoplaugh or /semrisada", descricao="Avisa a espectadores para pararem de usar o comando rir e os expulsa na 2ª vez que o fizerem."},
                            {comando="/cleanwarn <login>", descricao="Limpa o contador de rolagens e risadas de um jogador. "},
                            {comando="/afk <Boolean (opcional)>", descricao="Ativa ou desativa o AfkBot v1.0, opcionalmente passando true como parametro o bot avisa cada espectador que entrar na mesa. "}};
    end);

-- auto-update
Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/AfkBot/output/AfkBot.rpk?raw=true",
            function(stream, contentType)
                local info = Firecast.Plugins.getRPKDetails(stream);
                config.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;

                local installed = Firecast.Plugins.getInstalledPlugins();
                local myself;
                for i=1, #installed, 1 do
                    if installed[i].moduleId == info.moduleId then
                        myself = installed[i];
                        config.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                    end;
                end;

                if config.noUpdate==true then return end;
                if myself~= nil and isNewVersion(myself.version, info.version) then
                    Dialogs.choose("Há uma nova versão do AfkBot (".. info.version .."). Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                        function(selected, selectedIndex, selectedText)
                            if selected and selectedIndex == 1 then
                                GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/ChatMods/AfkBot/output/AfkBot.rpk?raw=true');
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