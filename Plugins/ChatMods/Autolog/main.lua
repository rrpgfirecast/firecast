require("rrpg.lua");
require("vhd.lua");
require("utils.lua");

-- getRolagemAsString(rolagem): recebe um objeto Rolagem do SDK e retorna uma string descrevendo a rolagem
-- da mesma maneira que é mostrado no RRPG
function getRolagemAsString(rolagem)
	local total = 0;
	local lastTipoOp = "soma";
--	local modif = 0;
--	local dices = "{";

	local diceString = "{";
	for i,op in ipairs(rolagem.ops) do
		if(op.tipo == "dado") then
			diceString = diceString .. "[";
			for j,result in ipairs(op.resultados) do
				if(j > 1) then
					diceString = diceString .. ", ";
				end
				diceString = diceString .. string.format("%d",result)
				if(lastTipoOp == "subtracao") then
					total = total - result;
				else
					total = total + result;
				end
			end
			diceString = diceString .. "]";

		elseif(op.tipo == "imediato") then
			if(lastTipoOp == "subtracao") then
				total = total - op.valor;
			else
				total = total + op.valor;
			end
			diceString = diceString .. string.format("%d",op.valor);

		elseif(op.tipo == "soma") then
			lastTipoOp = op.tipo;
			diceString = diceString .. " + ";

		elseif(op.tipo == "subtracao") then
			lastTipoOp = op.tipo;
			diceString = diceString .. " - ";
		end
	end
	local diceString = diceString .. "}";

	return string.format(rolagem.asString .. " = %d %s", total, diceString);
end
-- getRolagemAsString

autologEnabled = {};

-- Implementação dos comandos
rrpg.messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "autolog" then
			if autologEnabled[message.mesa.nome] ~= false then
				autologEnabled[message.mesa.nome] = false;
				message.mesa.chat:escrever("Log desabilitado!");
			else
				autologEnabled[message.mesa.nome] = true;
				message.mesa.chat:escrever("Log habilitado!");
			end	
			
			message.response = {handled = true};
			
		elseif message.comando == "readlog" then
			local logFile = "/" .. message.mesa.nome .. ".log";
			
			vhd.forceDirectory("/Logs/" .. logTable .. "/");
			if vhd.fileExists(logFile) then
				fileStream = vhd.openFile(logFile, "r");
				local logText = fileStream:readBinary("ansi");
				
				if fileStream == nil then
					message.mesa.chat:escrever("Falha ao ler Log");
				else
					if system.setClipboardText(logText) then
						message.mesa.chat:escrever("Log Copiado!");
					else
						message.mesa.chat:escrever("Falha ao copiar o log para o clipboard!");
					end					
				end
				
				fileStream:close();
			else
				message.mesa.chat:escrever("Log não encontrado!");
			end	

			message.response = {handled = true};
			
		elseif message.comando == "clearlog" then
			local logFile = "/" .. message.mesa.nome .. ".log";
			
			vhd.forceDirectory("/Logs/" .. logTable .. "/");
			if vhd.fileExists(logFile) then
				fileStream = vhd.openFile(logFile, "w+");				
				fileStream:close();
				message.mesa.chat:escrever("Log Limpo!");
			end

			message.response = {handled = true};
		end
		
	end);

-- Escuta das mensagens de chat padrão
rrpg.messaging.listen("ChatMessage", 
	function (message)
		if autologEnabled[message.mesa.nome] ~= false then
			autologEnabled[message.mesa.nome] = true				
			
			local logFile = os.date("[%Y/%m/%d] ");
			local logTable = message.mesa.nome; 
			
			--Se o objeto jogadorPVT não é nil, então foi um PVT Privado.
			if(message.jogadorPVT ~= nil) then
				logFile = logFile .. "(PVT com " .. utils.removerFmtChat(message.jogadorPVT.login) .. ")";				
			--Se o objeto jogadorPVT é nil, mas o chat não é o  chat principal da mesa, então eh um PVT em grupo.
			elseif(message.chat.objectID ~= message.mesa.chat.objectID) then
				logFile = logFile .. "(Conversa Em Grupo ID " .. message.chat.objectID .. ")";	
			else
				logFile = logFile .. "(Mesa)";	
			end
			
			logFile = logFile:gsub('[\\/:*?\"<>|]', '_');
			logTable = logTable:gsub('[\\/:*?\"<>|]', '_');
			logTable = string.gsub(logTable, "%.", "_");
			

			logFile = "/Logs/" .. logTable .. "/".. logFile .. ".log";
			
			local linha = os.date("[%H:%M] ");
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
		
			vhd.forceDirectory("/Logs/" .. logTable .. "/");
			if vhd.fileExists(logFile) then
				fileStream = vhd.openFile(logFile, "a");
			else
				fileStream = vhd.openFile(logFile, "w");
			end
			
			if(fileStream == nil) then
				message.mesa.chat:escrever("Falha ao criar arquivo de Log. Se possivel tente criar a pasta <" .. logTable .. "> em Documents\\RRPG\\Complementos\\Autolog\\Logs e após isso use /autolog para reativar o autolog. ");
				autologEnabled[message.mesa.nome] = false;
			else
				fileStream:writeBinary("ansi", linha .. "\r\n");
				fileStream:close();
			end
		end
	end);

-- Escuta das mensagens de join
rrpg.messaging.listen("MesaJoined",
function (message)
	if autologEnabled[message.mesa.nome] ~= false then
		autologEnabled[message.mesa.nome] = true
		local linha = os.date("[%H:%M] ") .. utils.removerFmtChat(message.jogador.nick) .. " (" .. message.jogador.login .. ")";
		local logFile = os.date("[%Y/%m/%d] ") .. "(Mesa)";	
		logFile = logFile:gsub('[\\/:*?\"<>|]', '_');

		local logTable = message.mesa.nome; 
		logTable = logTable:gsub('[\\/:*?\"<>|]', '_');
		logTable = string.gsub(logTable, "%.", "_");
			
		linha = linha .. " acabou de entrar";
			
		logFile = "/Logs/" .. logTable .. "/" .. logFile .. ".log";
			
		local fileStream;

		vhd.forceDirectory("/Logs/" .. logTable .. "/");	
		if vhd.fileExists(logFile) then
			fileStream = vhd.openFile(logFile, "a");
		else
			fileStream = vhd.openFile(logFile, "w");
		end
			
		if(fileStream == nil) then
			message.mesa.chat:escrever("Falha ao criar arquivo de Log. Se possivel tente criar a pasta <" .. logTable .. "> em Documents\\RRPG\\Complementos\\Autolog\\Logs e após isso use /autolog para reativar o autolog. ");
			autologEnabled[message.mesa.nome] = false;
		else
			fileStream:writeBinary("ansi", linha .. "\r\n");
			fileStream:close();
		end
	end
end);

-- Escuta das mensagens de part
rrpg.messaging.listen("MesaParted",
function (message)
	if autologEnabled[message.mesa.nome] ~= false then
		autologEnabled[message.mesa.nome] = true
			
		local linha = os.date("[%H:%M] ") .. utils.removerFmtChat(message.jogador.nick) .. " (" .. message.jogador.login .. ")";
		local logFile = os.date("[%Y/%m/%d] ") .. "(Mesa)";	
		logFile = logFile:gsub('[\\/:*?\"<>|]', '_');

		local logTable = message.mesa.nome; 
		logTable = logTable:gsub('[\\/:*?\"<>|]', '_');
		logTable = string.gsub(logTable, "%.", "_");
			
		--Senão, é o chat main
		if(message.ehKick) then
			linha = linha .. " foi kickado por " .. utils.removerFmtChat(message.responsavel.nick) .. " (" .. message.responsavel.login .. ")";
		else
			linha = linha .. " acabou de sair";
		end
			
		logFile = "/Logs/" .. logTable .. "/" .. logFile .. ".log";
			
		local fileStream;

		vhd.forceDirectory("/Logs/" .. logTable .. "/");	
		if vhd.fileExists(logFile) then
			fileStream = vhd.openFile(logFile, "a");
		else
			fileStream = vhd.openFile(logFile, "w");
		end
			
		if(fileStream == nil) then
			message.mesa.chat:escrever("Falha ao criar arquivo de Log. Se possivel tente criar a pasta <" .. logTable .. "> em Documents\\RRPG\\Complementos\\Autolog\\Logs e após isso use /autolog para reativar o autolog. ");
			autologEnabled[message.mesa.nome] = false;
		else
			fileStream:writeBinary("ansi", linha .. "\r\n");
			fileStream:close();
		end
	end
end);

-- Add dica ao comando /help
rrpg.messaging.listen("ListChatCommands",
        function(message)
                message.response = {{comando="/autolog", descricao="Ativa ou desativa o autolog na mesa atual. v1.2"}};
        end);