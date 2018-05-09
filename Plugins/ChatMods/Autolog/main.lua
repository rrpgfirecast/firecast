require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("dialogs.lua");

-- Inicialização da tabela principal
if(autolog == nil) then
	autolog = {};
	autolog.enabled = true;
	autolog.useLoginForPvtName = false;
	autolog.mesas = {};
end

isGold = nil;

-- Variáveis de controle do sendLines
linesSentToChat = 0;
sendingLinesToChatId = nil;

-- Habilita ou desabilita o Autolog para a mesa informada
function toogleAutolog(mesa)
	if autolog.mesas[mesa.nome].enabled ~= false then
		autolog.mesas[mesa.nome].enabled = false;
	else
		autolog.mesas[mesa.nome].enabled = true;
	end	
	
	return autolog.mesas[mesa.nome].enabled;
end

function enableAutolog(mesa, state)
	autolog.mesas[mesa.nome].enabled = state;
end

-- Copia o conteúdo do log da mesa informada para a área de transferência
function readLog(mesa)
	local ret;
	
	local logFile = "/Logs/" .. mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','') .. "/Mesa.log";
		
	if vhd.fileExists(logFile) then
		fileStream = vhd.openFile(logFile, "r");
		local logText = fileStream:readBinary("ansi");
		
		if fileStream == nil then
			mesa.chat:escrever("Falha ao ler Log");
		else
			if system.setClipboardText(logText) then
				mesa.chat:escrever("Log Copiado!");
			else
				mesa.chat:escrever("Falha ao copiar o log para o clipboard!");
			end					
		end
				
		fileStream:close();
	else
		mesa.chat:escrever("Log não encontrado!");
	end
	
	return ret;
end

-- Exporta o arquivo de log da mesa principal para um txt externo
function exportLog(mesa)
	local ret;

	local logFile = "/Logs/" .. mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','') .. "/Mesa.log";

	if vhd.fileExists(logFile) then
		fileStream = vhd.openFile(logFile, "r");

		-- Definimos um callback bem simples, só pra fechar a stream mesmo.
		function closeStream()
			fileStream:close();
		end

		dialogs.saveFile("Exportar Log de " .. mesa.nome, fileStream, mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','') .. ".txt", "text/plain", closeStream, closeStream);

	else
		mesa.chat:escrever("Log não encontrado!");
	end

	return ret;
end

-- Inicializa uma Gui com os parâmetros atuais da mesa
function getConfigWindow(mesa)
	if not isGold then
		dialogs.alert("O Autolog requer uma assinatura Gold, Gold+ ou Ruby do RRPG.");
		return nil;
	end

	local cfgForm = gui.newForm("autologConfigPanel");
	
	cfgForm.mesa = mesa
	cfgForm.enableCheckBox.checked = autolog.mesas[mesa.nome].enabled;
	cfgForm.useLoginForPvtCheckBox.checked = autolog.useLoginForPvtName;
	cfgForm.title = "Autolog - " .. mesa.nome;
	-- aqui vem as inicializações dos itens do painel.
	
	return cfgForm;
end

-- Limpa os arquivos de log da mesa informada
function clearLog(mesa)
	function userInput(escolha)
		if escolha == dialogs.DB_YES then
			local logFile = "/Logs/" .. mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','');
			vhd.deleteDirectory(logFile);
		end;
	end

	dialogs.showMessageDlg("Atenção! Todos os logs da mesa " .. mesa.nome .. " Serão apagados IRREVERSÍVELMENTE. Tem certeza?", dialogs.DT_WARNING, {dialogs.DB_YES, dialogs.DB_NO}, userInput);
end

function sendLastMessages(mesa, qtdLines)
	if(mesa == nil or qtdLines == nil or linesSentToChat ~= 0) then
		return;
	end

	local logFile = "/Logs/" .. mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','') .. "/Mesa.log";
	local logLines;

	if vhd.fileExists(logFile) then
		fileStream = vhd.openFile(logFile, "r");
		if fileStream == nil then
			mesa.chat:escrever("Falha ao ler Log");
			return;

		else
			local logText = fileStream:readBinary("ansi");
			fileStream:close();

			logLines = splitString(logText, "\r\n");

			if logLines == nil then
				mesa.chat:escrever("loglines is null");
			else
				-- registra o id do chat para onde estão indo as linhas, para filtrar e não jogar essas linhas no log.
				sendingLinesToChatId = mesa.activeChat.objectID;

				if qtdLines > logLines.size then
					qtdLines = logLines.size;
				end

				linesSentToChat = qtdLines;

				for i = (logLines.size - qtdLines + 1), logLines.size do
					mesa.activeChat:enviarMensagem(logLines.strings[i]);
				end
			end
		end
	end
end

-- Callback da chamada de comandos
function commandCallback(message)
	if(isGold == nil) then
		isGold = rrpg.getCurrentUser().isGold or rrpg.getCurrentUser().isGoldPlus or rrpg.getCurrentUser().isRuby;
	end

	if autolog.mesas[message.mesa.nome] == nil then
		autolog.mesas[message.mesa.nome] = {};
		autolog.mesas[message.mesa.nome].enabled = true;
	end
	
	if(message.comando == "autolog") then
		local cfgForm = getConfigWindow(message.mesa);

		if(cfgForm) then
			cfgForm:show();
		end

		message.response = {handled = true};
			
	elseif (message.comando == "enablelog" and isGold) then
		if toogleAutolog(message.mesa) then
			message.mesa.chat:escrever("Log habilitado!");
		else
			message.mesa.chat:escrever("Log desabilitado!");
		end

		message.response = {handled = true};
			
	elseif (message.comando == "readlog") then
		readLog(message.mesa);
		message.response = {handled = true};
			
	elseif (message.comando == "clearlog") then
		clearLog(message.mesa);
		message.response = {handled = true};

	elseif (message.comando == "exportlog") then
		exportLog(message.mesa);
		message.response = {handled = true};

	elseif (message.comando == "sendlog") then
		sendLastMessages(message.mesa, tonumber(message.parametro));
		message.response = {handled = true};

	end
end

-- Callback das mensagens de chat
function chatMessageCallback(message)
	if(isGold == nil) then
		isGold = rrpg.getCurrentUser().isGold or rrpg.getCurrentUser().isGoldPlus or rrpg.getCurrentUser().isRuby;
	end

	if autolog.enabled == false then
		return;

	elseif not isGold then
		dialogs.alert("O Autolog requer uma assinatura Gold, Gold+ ou Ruby do RRPG.");
		autolog.enabled = false;
		return;
	end

	if autolog.mesas[message.mesa.nome] == nil then
		autolog.mesas[message.mesa.nome] = {};
	end
		
	if autolog.mesas[message.mesa.nome].enabled ~= false then
		autolog.mesas[message.mesa.nome].enabled = true

		-- Se a mensagem é um envio de linhas do comando /sendlines, ignore
		if (linesSentToChat > 0 and message.chat.objectID == sendingLinesToChatId and message.minha and message.texto:match("%[%d%d/%d%d/%d%d%d%d|%d%d:%d%d%]") ~= nil) then
			linesSentToChat = linesSentToChat - 1;

			if (linesSentToChat == 0) then
				sendingLinesToChatId = nil;
			end

			return;
		end
			
		vhd.forceDirectory("/Logs/" .. message.mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$',''));
			
		--Se o objeto jogadorPVT não é nil, então foi um PVT Privado.
		if(message.jogadorPVT ~= nil) then
			if(autolog.useLoginForPvtName) then
				logFile = "PVT com " .. utils.removerFmtChat(message.jogadorPVT.login) .. ".log";
			else
				logFile = "PVT com " .. utils.removerFmtChat(message.jogadorPVT.nick) .. ".log";
			end

		--Se o objeto jogadorPVT é nil, mas o chat não é o chat principal da mesa, então eh um PVT em grupo.
		elseif(message.chat.objectID ~= message.mesa.chat.objectID) then
			logFile = "Conversa Em Grupo ID " .. message.chat.objectID .. ".log";

		--Se não, é o chat da mesa
		else
			logFile = "Mesa.log";
		end
			
		logFile = "/Logs/" .. message.mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','') .. "/" .. logFile:gsub('[\\/:*?\"<>|]', '_');
			
		local linha = os.date("[%d/%m/%Y|%H:%M] ");
		local fileStream;
		
		if message.tipo == "comoNarrador" then
			linha = linha .. "«!» ";
		elseif message.tipo == "comoNPC" then
			linha = linha .. "<" .. message.npc .. "> ";			
		elseif message.tipo == "acao" then
			linha = linha .. message.jogador.nick .. " ";
		elseif message.tipo == "dados" then
			linha = linha .. message.jogador.nick .. " rolou ";
		else
			linha = linha .. "<" .. message.jogador.nick .. "> ";
		end 
		
		if message.tipo == "dados" then
			linha = linha .. getRolagemAsString(message.rolagem);
		elseif message.tipo == "rir" then
			linha = linha .. "Hohohohoho";
		else
			linha = linha .. message.texto, true;
		end

		linha = utils.removerFmtChat(linha);
	
		if vhd.fileExists(logFile) then
			fileStream = vhd.openFile(logFile, "a");
		else
			fileStream = vhd.openFile(logFile, "w");
		end
		
		if(fileStream == nil) then
			message.mesa.chat:escrever("Falha ao criar arquivo de Log" .. logFile);
		elseif (linha == nil) then
			message.mesa.chat:escrever("...A Linha é null?");
		else
			fileStream:writeBinary("ansi", linha .. "\r\n");
			fileStream:close();
		end
	end
end

-- Callback das mensagens de join
function joinCallback(message)
	if(isGold == nil) then
		isGold = rrpg.getCurrentUser().isGold or rrpg.getCurrentUser().isGoldPlus or rrpg.getCurrentUser().isRuby;
	end

	if autolog.enabled == false then
		return;

	elseif not isGold then
		dialogs.alert("O Autolog requer uma assinatura Gold, Gold+ ou Ruby do RRPG.");
		autolog.enabled = false;
		return;
	end

	if autolog.mesas[message.mesa.nome] == nil then
		autolog.mesas[message.mesa.nome] = {};
	end
	
	if autolog.mesas[message.mesa.nome].enabled ~= false then
		autolog.mesas[message.mesa.nome].enabled = true
		local linha = os.date("[%d/%m/%Y|%H:%M] ") .. utils.removerFmtChat(message.jogador.nick) .. " (" .. message.jogador.login .. ")";
		local logFile = "/Logs/" .. message.mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','');

		linha = linha .. " acabou de entrar";
		
		vhd.forceDirectory(logFile);

		logFile = logFile .. "/Mesa.log";
			
		local fileStream;
			
		if vhd.fileExists(logFile) then
			fileStream = vhd.openFile(logFile, "a");
		else
			fileStream = vhd.openFile(logFile, "w");
		end
			
		if(fileStream == nil) then
			message.mesa.chat:escrever("Falha ao criar arquivo de Log" .. logFile);
		elseif (linha == nil) then
			message.mesa.chat:escrever("...A Linha é null?");
		else
			fileStream:writeBinary("ansi", linha .. "\r\n");
			fileStream:close();
		end
	end
end

-- Callback das mensagens de part
function partCallback(message)
	if(isGold == nil) then
		isGold = rrpg.getCurrentUser().isGold or rrpg.getCurrentUser().isGoldPlus or rrpg.getCurrentUser().isRuby;
	end

	if autolog.enabled == false then
		return;

	elseif not isGold then
		dialogs.alert("O Autolog requer uma assinatura Gold, Gold+ ou Ruby do RRPG.");
		autolog.enabled = false;
		return;
	end

	if autolog.mesas[message.mesa.nome] == nil then
		autolog.mesas[message.mesa.nome] = {};
	end
	
	if autolog.mesas[message.mesa.nome].enabled ~= false then
		autolog.mesas[message.mesa.nome].enabled = true
			
		local linha = os.date("[%d/%m/%Y|%H:%M] ") .. utils.removerFmtChat(message.jogador.nick) .. " (" .. message.jogador.login .. ")";
		local logFile = "/Logs/" .. message.mesa.nome:gsub('[\\/:*?\"<>|]', '_'):gsub('^[%s.]*',''):gsub('[%s.]*$','');

		vhd.forceDirectory(logFile);
			
		--Senão, é o chat main
		if(message.ehKick) then
			linha = linha .. " foi kickado por " .. utils.removerFmtChat(message.responsavel.nick) .. " (" .. message.responsavel.login .. ")";
		else
			linha = linha .. " acabou de sair";
		end

		logFile =  logFile .. "/Mesa.log";
			
		local fileStream;
			
		if vhd.fileExists(logFile) then
			fileStream = vhd.openFile(logFile, "a");
		else
			fileStream = vhd.openFile(logFile, "w");
		end
			
		if(fileStream == nil) then
			message.mesa.chat:escrever("Falha ao criar arquivo de Log" .. logFile);
		elseif (linha == nil) then
			message.mesa.chat:escrever("...A Linha é null?");
		else
			fileStream:writeBinary("ansi", linha .. "\r\n");
			fileStream:close();
		end
	end
end

-- Callback da listagem de comandos
function helpCallback(message)
	message.response = {{comando="/autolog", descricao="Abre o painel de configurações e comandos do Autolog para a mesa atual."},
						{comando="/enablelog", descricao="Ativa o Autolog para a mesa atual."},
						{comando="/readlog", descricao="Copia o log inteiro do chat principal da mesa atual para a Área de Transferência."},
						{comando="/clearlog", descricao="Apaga TODOS os logs da mesa atual. Esse processo é irreversível!"},
						{comando="/exportlog", descricao="Salva o log inteiro do chat principal da mesa atual em um arquivo txt."},
						{comando="/sendlog <n>", descricao="Envia as últimas <n> linhas do log do chat principal da mesa atual para a janela ativa."}};
end

-- Escuta das mensagens de comandos
rrpg.messaging.listen("HandleChatCommand", commandCallback);
-- Escuta das mensagens de chat padrão
rrpg.messaging.listen("ChatMessage", chatMessageCallback);
-- Escuta das mensagens de join
rrpg.messaging.listen("MesaJoined", joinCallback);
-- Escuta das mensagens de part
rrpg.messaging.listen("MesaParted", partCallback);
-- Escuta do Help
rrpg.messaging.listen("ListChatCommands", helpCallback);
