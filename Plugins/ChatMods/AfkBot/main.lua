require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("ndb.lua");

afkdb = ndb.load("afkData.xml");
if afkdb.afkStatus==nil then
	afkdb.afkStatus = {};
	afkdb.afkMessage = {};
	afkdb.afkBotClock = {};
end;
if afkdb.afkSpectator== nil then
	afkdb.afkSpectator = {};
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
			local mestre = "mestre";

			if message.mesa.meuJogador.isMestre then
				text = text:lower();
				nick = nick:lower();
				login = login:lower();
			else
				message.chat:escrever("Apenas mestres!");
				return;
			end;

			local info = "[§K1]AfkBot: Está é uma mensagem automatica de " .. message.mesa.meuJogador.nick .. "[§K1](" .. message.mesa.meuJogador.login .. ") que está ocupado e não pode responder.";

			local isLogin = string.match(text, login) ~= nil;
			local isNick = string.match(text, nick) ~= nil;
			local isMestre = string.match(text, mestre) ~= nil;

			if isLogin or isNick or isMestre then
				afkdb.afkBotClock[message.mesa.codigoInterno] = os.clock();
				message.chat:enviarNarracao(info);
				message.chat:enviarNarracao(afkdb.afkMessage[message.mesa.codigoInterno]);
				return;
			end;
		end
	end);

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
                            {comando="/afk <Boolean (opcional)>", descricao="Ativa ou desativa o AfkBot v0.5, opcionalmente passando true como parametro o bot avisa cada espectador que entrar na mesa. "}};
    end);