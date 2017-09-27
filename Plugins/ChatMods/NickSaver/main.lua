require("rrpg.lua");
require("vhd.lua");
require("utils.lua");

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
                message.response = {{comando="/savenick", descricao="Salva o nick para essa mesa. "},
                					 {comando="/savenick <NICK>", descricao="Salva o <NICK> para essa mesa. "},
                					 {comando="/savecolor <0-15>", descricao="Salva a cor para essa mesa. "},
                					 {comando="/savecolor -1", descricao="Apaga a cor salva para essa mesa. "}};
        end);