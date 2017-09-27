require("rrpg.lua");
require("utils.lua");

--[[--------------------------------
	Configurações do BOT
]]

-- Qual a face de dados que o bot usará? 100 significa 1d100
local facesRoleta = 100;

-- Quantos milisegundos deve durar cada rodada de roleta russa. 35000 = 35 segundos
local tempoRodadaRoleta = 35000;

--[[------------------------------------------------------------
	Funções ligadas à execução do bot
]]


-- Verifica se todos os espectadores já rolaram 1d100. Se sim, automaticamente encerra o turno da roleta
function verificarSePodeEncerrarRoundDeRoletaRussa(chat)
	local mesa = rrpg.getMesaDe(chat);
	local roleta = chat.__roletaRussa;	-- informações da roleta ligadas ao chat.
	
	if mesa ~= nil and roleta ~= nil then
		local jogadores = mesa.jogadores;
		local alguemNaoRolouAinda = false;
		
		-- verificar se algum espectador ainda NAO rolou dado
		for i = 1, #jogadores, 1 do
			local jogador = jogadores[i];
			
			if jogador.isEspectador then
				if roleta.resultados[jogador.login] == nil then
					alguemNaoRolouAinda = true;
					break;
				end;
			end;
		end;
		
		if not alguemNaoRolouAinda then
			-- Não há nenhum espectador que não tenha rolado dado, então, vamos encerrar o round.
			finalizarRoundRoletaRussa(chat);
		end;
	end;
end;

-- Inicia um round de roleta russa no chat.
function comecarRoundRoletaRussa(chat)
	if chat == nil then
		return;
	end;
	
	if chat.__roletaRussa ~= nil then	
		chat:escrever("-------------");
		chat:escrever("OPS!!!! Este chat já está em uma Rodada de Roleta Russa...");
		chat:escrever("Para finalizar a rodada, digite /FimRoleta");
		chat:escrever("-------------");
		return;
	end;
	
	-- criar as informações de roleta russa no chat.
	chat.__roletaRussa = {};
	chat.__roletaRussa.resultados = {};
	
	-- "escutar" todas as rolagens de dados que são feitas neste chat.
	chat.__roletaRussa.idListener = rrpg.messaging.listen("ChatMessage",
		function(message)
			-- Esta pequena função é chamada toda vez que alguém rolar um dado no chat que está rodando a roleta russa
			-- Veja na documentação do SDK3 sobre a mensagem evento "ChatMessage"
			
			if message.jogador == nil then
				return;
			end;
			
			--[[ Vamos extrair o resultado da rolagem e 
				 verificar se não tentaram sacanear rolando algo diferente de 1d100
			--]]-- 
			local rol = message.rolagem;
			local resultadoDaFace = nil;
			local qtsDaFace = 0;
			local houveOutraCoisaNaRolagem = false;
			
			for i = 1, #rol.ops, 1 do
				local op = rol.ops[i];
				
				if op.tipo == "dado" then
					-- Um dado na rolagem.
					
					if tonumber(op.face) == facesRoleta then
						-- é um dado da face que queremos, facesRoleta = 100 por padrão, 1d100..
					
						-- Vamos percorrer todos os resultados desta face...
						for j = 1, #op.resultados, 1 do
							qtsDaFace = qtsDaFace + 1;
							resultadoDaFace = op.resultados[j];
						end;
						
						-- Queremos APENAS 1d100... se o usuário rolou, por exemplo, /r 4d100, qtsDaFace vai ficar igual a 4... e será descartado logo ali embaixo
					else
						-- Ops, uma face diferente da que desejamos...
						houveOutraCoisaNaRolagem = true;
					end
				else
					-- Na rolagem feita há algo que não é um dado.
					houveOutraCoisaNaRolagem = true;
				end;
			end;
			
			if (qtsDaFace ~= 1) or (houveOutraCoisaNaRolagem) then							
				-- Rolagem inválida.. Ou o usuário rolou mais de 1d100, ou ele rolou algo além de 1d100
				-- não vamos anotar o resultado e vamos enviar uma mensagem para o usuário informando que queremos é 1d100				
				chat:enviarMensagem(message.jogador.login .. ", sua rolagem DEVE ser 1d" .. facesRoleta .. ". Digite /r 1d" .. facesRoleta);
				return;
			end;		

			-- abaixo, contém a tabela que armazena os resultados de cada jogador..
			local resultados = chat.__roletaRussa.resultados;
			
			if resultados[message.jogador.login] == nil then
				-- Ainda não anotamos um resultado para o jogador.. Vamos anotar
				resultados[message.jogador.login] = resultadoDaFace;		
				
				-- Vamos verificar se todos os espectadores já rolaram dado.
				verificarSePodeEncerrarRoundDeRoletaRussa(chat);
			else
				-- Ops, já anotamos um resultado para este usuário. Vamos enviar uma mensagem para informá-lo
				chat:enviarMensagem(message.jogador.login .. ", você já rolou 1d" .. facesRoleta .. " nesta rodada. Seu valor é: " .. tostring(resultados[message.jogador.login]));				
			end;
		end, {chat=chat, tipo="dados"});  -- {chat=chat, tipo="dados"} significa que o evento acima só será chamado se ocorrer na interface de chat que queremos e se for uma rolagem de dados.
	
	
	-- Ainda estamos na etapa de iniciar um novo round..
	-- Vamos adicionar um timer que será disparado em 35 segundos para forçar o fim da rodada, caso ela ainda não for encerrada
	chat.__roletaRussa.idTimeout = setTimeout(
		function()
			finalizarRoundRoletaRussa(chat);
		end, tempoRodadaRoleta);
			
	-- Enviar uma mensagem bacana falando do novo round.
	chat:enviarMensagem("\n------------------- Nova Rodada de Roleta Russa -------------------\n" ..
						"Rolem 1d" .. facesRoleta .."!!!!\n" ..
						"-------------------------------------------------------------------");
	
	local mesa = rrpg.getMesaDe(chat);
	
	if mesa ~= nil then
		-- Tentar desativar a moderação da mesa.
		mesa:requestSetModerada(false);
	end;	
end;

-- Dado um chat, retorna as estatisticas da roleta russa.. Quem está ganhando, quem está perdendo, quem não rolou...
local function getStatsRoletaRussa(chat)
	if chat.__roletaRussa == nil then
		-- O chat não está em um round de roleta russa
		return nil;
	end;
	
	local rOrd = {};   -- rOrd = Resultados Ordenados
	local ret = {};	   -- tabela que conterá o retorno das estatisticas
	ret.maiores = {};
	ret.menores = {};
	ret.naoRolaram = {};
	ret.chat = chat;
	ret.mesa = rrpg.getMesaDe(chat);
	
	for k, v in pairs(chat.__roletaRussa.resultados) do
		rOrd[#rOrd + 1] = {login=k, valor=v};
	end;
	
	-- Ordenar os resultados.. os maiores primeiros, menores por ultimo
	table.sort(rOrd, 
		function(esq, dir)
			return esq.valor > dir.valor;
		end);
	
	-- obter Menores
	local menorEncontrado = nil;
	local highIndex = nil;
	
	for i = #rOrd, 1, -1 do
		local r = rOrd[i];
		local v = r.valor;

		if menorEncontrado == nil or v <= menorEncontrado then
			ret.menores[#ret.menores + 1] = r;
			menorEncontrado = v;
			highIndex = i - 1;
		end;
	end;
	
	if highIndex == nil then
		highIndex = #rOrd;
	end;
	
	-- obter Maiores
	local maiorEncontrado = nil;
	
	for i = 1, highIndex, 1 do
		local r = rOrd[i];
		local v = r.valor;

		if maiorEncontrado == nil or v >= maiorEncontrado then
			maiorEncontrado = v;
			ret.maiores[#ret.maiores + 1] = r;
		end;
	end;
	
	-- obter Não Rolaram
	local mesa = rrpg.getMesaDe(chat);
	
	if mesa ~= nil then
		local jogadores = mesa.jogadores;
		
		for i = 1, #jogadores, 1 do
			local jogador = jogadores[i];
			
			if chat.__roletaRussa.resultados[jogador.login] == nil and jogador.isEspectador then
				ret.naoRolaram[#ret.naoRolaram + 1] = jogador.login;
			end;
		end;
	end;
	
	return ret;
end;

-- Dado um login, e uma tabela de Estatisticas retornada pela função getStatsRoletaRussa acima,
-- Gera um texto legal para identificar um usuário, tentando colocar o nick dele também na mensagem...
local function genStringIdUsuario(login, stats)
	if stats.mesa ~= nil then
		local jogador = stats.mesa:findJogador(login);  -- tentar localizar o jogador na mesa por login
		
		if jogador ~= nil then
			return utils.removerFmtChat(jogador.nick) .. " (" .. login .. ")";  -- achou, vamos incluir o nick dele na msg.
		else
			return login;
		end;
	else
		return login;
	end;
end;

-- Dado uma tabela de Estatisticas retornada pela função getStatsRoletaRussa acima, retorna um texto descrevendo os vencedores da rodada 
local function genMaioresStr(stats)
	local r = "";
	local qt = #stats.maiores;
	
	if qt <= 0 then	
		return "";
	elseif qt == 1 then
		r = "Vencedor: ";
	else 
		r = "Vencedores: ";
	end;
		
	local valorVencedor = nil;
		
	for i = 1, #stats.maiores, 1 do
		local v = stats.maiores[i];
		valorVencedor = v.valor;
		
		r = r .. genStringIdUsuario(v.login, stats);
		
		if i == qt - 1 then		
			r = r .. " e ";
		elseif i < qt - 1 then
			r = r .. ", ";
		end;
	end;
	
	r = r .. " [Valor: " .. (valorVencedor or 0) .. "]";
	return r;
end;

-- Dado uma tabela de Estatisticas retornada pela função getStatsRoletaRussa acima, retorna um texto descrevendo os perdedores da rodada
local function genMenoresStr(stats)
	local r = "";
	local qt = #stats.menores;
	
	if qt <= 0 then	
		return "";
	elseif qt == 1 then
		r = "Perdedor: ";
	else 
		r = "Perdedores: ";
	end;
		
	local valorVencedor = nil;
		
	for i = 1, #stats.menores, 1 do
		local v = stats.menores[i];
		valorVencedor = v.valor;
		
		r = r .. genStringIdUsuario(v.login, stats);
		
		if i == qt - 1 then		
			r = r .. " e ";
		elseif i < qt - 1 then
			r = r .. ", ";
		end;
	end;
	
	r = r .. " [Valor: " .. (valorVencedor or 0) .. "]";
	return r;
end;

-- Dado uma tabela de Estatisticas retornada pela função getStatsRoletaRussa acima, retorna um texto descrevendo aqueles que não rolaram dado..
local function genNaoRolaramStr(stats)
	local qt = #stats.naoRolaram;
	local r = "";
	
	if qt <= 0 then
		return "";
	elseif qt == 1 then
		r = "Não rolou: ";
	else 
		r = "Não rolaram: ";		
	end;
		
	for i = 1, #stats.naoRolaram, 1 do
		local login = stats.naoRolaram[i];			
		r = r .. genStringIdUsuario(login, stats);
		
		if i == qt - 1 then		
			r = r .. " e ";
		elseif i < qt - 1 then
			r = r .. ", ";
		end;
	end;		
	
	return r;
end

-- Imprime na tela do usuário apenas, as informações da rodada de roleta russa atual.
local function printStatRoundRoletaRussa(chat)
	local stats = getStatsRoletaRussa(chat);
	
	if stats ~= nil then
		local vencStr = genMaioresStr(stats);
		local perdStr = genMenoresStr(stats);
		local naoRolaramStr = genNaoRolaramStr(stats);
		
		chat:escrever("-------------");
		chat:escrever(vencStr);
		chat:escrever(perdStr);
		chat:escrever(naoRolaramStr);
		chat:escrever("-------------");
	else
		chat:escrever("-------------");
		chat:escrever("Ops! Este chat NÃO está em uma rodada de Roleta Russa");
		chat:escrever("Digite /Roleta para começar uma rodada!");
		chat:escrever("-------------");
	end;
end;

-- Encerra uma rodada de roleta russa no chat....
function finalizarRoundRoletaRussa(chat)
	local stats = getStatsRoletaRussa(chat);  -- Obtém as estatisticas finais da rodada...
	local roleta = chat.__roletaRussa;
	chat.__roletaRussa = nil;
	
	if roleta ~= nil then
		-- Vamos desativar o timer de 35 segundos que encerraria automaticamente a rodada
		clearTimeout(roleta.idTimeout);
		roleta.idTimeout = nil;
		
		-- Vamos desativar nosso "escutador" de dados da mesa
		rrpg.messaging.unlisten(roleta.idListener);
		roleta.idListener = nil;		
	end;
	
	-- A seguir, vamos enviar no chat quais são os resultados da rodada!
	
	if roleta ~= nil and stats ~= nil then		
		local vencStr = genMaioresStr(stats);
		local perdStr = genMenoresStr(stats);
		local naoRolaramStr = genNaoRolaramStr(stats);

		local mesa = rrpg.getMesaDe(chat);
		
		if mesa ~= nil then
			mesa:requestSetModerada(true);  -- Tentar ativar a moderação da mesa...
		end;			
		
		chat:enviarMensagem("\n------- Fim da Rodada de Roleta Russa ------\n" ..
							vencStr .. "\n" ..
							perdStr .. "\n" ..
							naoRolaramStr .. "\n" ..
							'--------------------------------------------');		
	else
		chat:escrever("-------------");
		chat:escrever("Ops! Este chat NÃO está em uma rodada de Roleta Russa");
		chat:escrever("Digite /Roleta para começar uma rodada!");
		chat:escrever("-------------");
	end;
end;

-- Abaixo, o tratador dos comandos /roleta , /fimRoleta e /statRoleta
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		-- o usuário digita /comando na mesa.... vamos ver se é um dos que conseguimos tratar!
		--local comando = string.upper(removerAcentos(message.comando));
		local comando = removerAcentos(string.upper(message.comando));
				
		if comando == "ROLETA" then
			message.response = {handled = true};
			comecarRoundRoletaRussa(message.chat);  -- comando /roleta.. vamos começar 1 round de roleta no chat!
		elseif comando == "FIMROLETA" then
			message.response = {handled = true};
			finalizarRoundRoletaRussa(message.chat);  -- comando /fimRoleta, vamos encerrar o round de roleta no chat.
		elseif comando == "STATROLETA" then
			message.response = {handled = true};
			printStatRoundRoletaRussa(message.chat);  -- comando /statRoleta, vamos escrever na tela o resultado parcial do round da roleta...
		end;
	end);
	
-- Abaixo, quando o usuário digitar /help ou /?, vamos informar que existem os seguintes comandos também...
rrpg.messaging.listen("ListChatCommands",
	function(message)
		message.response = {{comando="/roleta", descricao="Inicia nova Rodada do jogo Roleta Russa"},
							{comando="/fimRoleta", descricao="Força o fim da rodada do jogo Roleta Russa"},
							{comando="/statRoleta", descricao="Exibe as estatisticas da atual rodada de Roleta Russa"}};
	end);
	