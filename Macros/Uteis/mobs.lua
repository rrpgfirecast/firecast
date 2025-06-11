-- Ajuda com o gerenciamento de várias barrinhas de vida para diferentes mobs
--"/mobs help" explica mais detalhadamente o funcionamento

-- As informações são guardadas na linha segunda linha digitável isso gera os seguintes comportamentos:
-- + Se quem estiver usando o comando não tiver uma ficha, as informações não serão salvas;
-- + O conteúdo da segunda barrinha vai ser sobrescrito pelo conteúdo do macro;
-- + Caso o jogador troque de ficha, perde os mobs salvos na barrinha.
-- Esse macro foi feito em 2021, e na época não consegui salvar as informações do macro direto na ficha de forma estável
-- não tenho certeza se foi por ignorância minha ou algum problema do próprio firecast.
-- Dou minha permissão para que alguém que tenha interesse em mudar isso faças as 
-- alterações e suba pro github só peço que também deixe meu nome nos créditos.
------------------------------------
--                                --
--           DEFINIÇÕES           --
--                                --
------------------------------------

--   [nome|hpAt/hpMx]
-- "%[.-|%-*%d-/%-*%d-]"
local bruto = meuJogador:getEditableLine(1)
mobs = {}

local avisoMob = "\n[§K15][ [§K4]mob inexistente[§K15] ]"

local comando = string.lower(arg[1])
local nome = (arg[2] and string.gsub(arg[2], "%.", " "))


-- converte a linha bruta para uma tabela
local mobAtual = 0
while (string.find(bruto, "%[.-|%-*%d-/%-*%d-]", mobAtual)) do
	local mobBruto =  string.sub(bruto, string.find(bruto, "%[.-|%-*%d-/%-*%d-]", mobAtual))
	_, mobAtual    = string.find(bruto, "%[.-|%-*%d-/%-*%d-]", mobAtual)
	
	local mobNome = string.sub(string.sub(mobBruto, string.find(mobBruto, "%b[|")), 2, -2)
	
	mobs[#mobs + 1] = {["nome"] = mobNome}
	mobs[#mobs].vidaAtual = tonumber(string.sub(string.sub(mobBruto, string.find(mobBruto, "%b|/")), 2, -2)) or 0
	mobs[#mobs].vidaMax   = tonumber(string.sub(string.sub(mobBruto, string.find(mobBruto, "%b/]")), 2, -2)) or mobs[#mobs].vidaAtual
end

------------------------------------
--                                --
--             FUNÇÕES            --
--                                --
------------------------------------

function salvarMobs()
	local brutoFinal = ""
	for index, mob in ipairs(mobs) do
		if (mob.nome or mob.vidaAtual and mob.vidaMax) then
			brutoFinal = brutoFinal .. "[" .. mob.nome .. "|" .. mob.vidaAtual .. "/" .. mob.vidaMax .. "]"
		end
	end
	meuJogador:requestSetEditableLine(1, brutoFinal)
	
	return brutoFinal
end

function acharMob(nome)
	for index, mob in ipairs(mobs) do
		if (mob.nome and mob.nome == nome) then return index end
	end
end
mobIndex = acharMob(nome)

function comparar(...)
	local retorno = {}
	for _, index in ipairs({...}) do retorno[index] = true end
	return retorno
end

function tn(argN) return tonumber(arg[argN]) end

------------------------------------
--                                --
--              MAIN              --
--                                --
------------------------------------

-- exibe descrição das funções do macro
if (comando == "help") then
	escrever("--------------------------- \nComandos disponíveis:" .. 
			 "\n[§K2]  /mobs help" .. 
			 "\n[§K1]    Exibe este texto de ajuda" .. 
			 "\n[§K2]  /mobs " .. 
			 "\n[§K1]    Exibe só pra você os mobs salvos" .. 
			 "\n[§K2]  /mobs e [mob específico]" .. 
			 "\n[§K1]    Envia para todos os mobs salvos ou um específico" .. 
			 "\n[§K2]  /mobs r <nome do mob>" .. 
			 "\n[§K1]    Remove um mob especificado " .. 
			 "\n[§K2]  /delall [mob exceção 1] [exceção 2] [3] ..." .. 
			 "\n[§K1]    Deleta todos os mobs salvos" .. 
			 "\n[§K2]  /mobs c <nome> [vida atual] <vida máxima>" .. 
			 "\n[§K1]    Cria um mob" .. 
			 "\n[§K2]  /mobs a <nome do mob> <valor> [tipo de operação]" .. 
			 "\n[§K1]    Altera a vida de um mob" ..
			 "\n[§K2]  /da <dano> [mob exceção 1] [exceção 2] [3] ..." .. 
			 "\n[§K1]    Dá dano em todos os mobs" .. 
			 "\n[§K2]  /cv <nome> <vida máxima> <quantidade de mobs>" .. 
			 "\n[§K1]    Cria vários mobs de uma vez" .. 
			 ("\n[§K2]  " .. 
			 "\n[§K1]    "
			  and "\n---------------------------"))

-- retorna uma tabela indexada com o nome de todos os mobs
elseif (comando == "nomes" or comando == "nomesSet") then
	local nomes = {}
	for nome, _ in pairs(mobs) do
		if (comando == "nomesSet") then nomes[nome] = true
		else nomes[#nomes + 1] = nome end
	end
	return nomes
-- enviar/escrever mobs
elseif (#arg < 1) or (comando == "e") then 
	local mensagem = (#arg < 1 and "\n[§K15]-=[ [§K1]Lista de Mobs[§K15] ]=-") or "\n[§K15]-----------------------"
	for index, mob in ipairs(mobs) do
		if (mob.nome and mob.vidaAtual and mob.vidaMax) then
			local buffer = "\n[§K1]" .. mob.nome .. " [§K4]" .. mob.vidaAtual .. "[§K1]/[§K4]" .. mob.vidaMax
			if (nome == arg[2]) then
				enviar("\n[§K15]-----------------------" .. buffer .. "\n[§K15]-----------------------")
				return
			end
			mensagem = mensagem .. buffer
		end
	end
	mensagem = mensagem .. "\n[§K15]-----------------------"
	if (#arg < 1) then
		escrever(mensagem)
	elseif (comando == "e" and #arg < 2) then
		enviar(mensagem)
	else
		escrever(avisoMob)
	end
	
	return
-- remover mob
elseif (comando == "r") then
	if (#arg < 2) then 
		escrever("Uso correto: /mobs r <nome do mob>")
		return 1
	end
	
	escrever((mobs[mobIndex] and ("\n[§K15]-=[ [§K4]" .. nome .. " foi deletado[§K15] ]=-")) or avisoMob)
	
	mobs[mobIndex] = nil
-- remover vários mobs
elseif (comando == "rv") then
	escrever("\n-----------------------")
	if #mobs < 1 then escrever("[§K15]-=[ [§K4]Nenhum mob encontrado[§K15] ]=-") end
	for index, mob in ipairs(mobs) do
		mob = nil
	end
	escrever("\n-----------------------")
-- criar mob
elseif (comando == "c") then
	if (#arg < 3) then 
		escrever("Uso correto: /mobs c <nome do mob> [vida atual] <vida máxima>")
		return 1
	end
	
	mobs[#mobs + 1] = {["vidaMax"] = (tn(4) or tn(3) or 0), ["vidaAtual"] = (tn(3) or 0), ["nome"] = nome}
	escrever("\n[§K15]----=[ [§K1]" .. nome .. "[§K15] ]=----\n- [§K4]" .. mobs[#mobs].vidaAtual .. "[§K1]/[§K4]" .. mobs[#mobs].vidaMax .. "\n[§K15]-----------------------")
	
-- criar vários mobs
elseif (comando == "cv") then
	
-- alterar vida de um mob
elseif (comando == "a") then
	-- definições
	local valor = tn(3)
	local operacao = arg[4]
	local mob = mobs[mobIndex]

	-- checagem de parametros
	if (#arg < 3) then 
		escrever("Uso correto: /mobs a <nome do mob> <valor> [tipo de operação]")
		return 1
	elseif (mobs and mobs[mobIndex] == nil) then
		escrever("Mob não encontrado")
		return 2
	elseif not(valor) then
		escrever("valor invalido")
		return 3
	elseif (#arg > 3) and not(comparar("=", "==", "+", "++", "-", "--", "+=", "-=", "++=", "--=")[operacao]) then
		escrever("Operação invalida")
		return 4
	end
	
	-- texto vida antiga
	escrever("\n[§K15]----=[ [§K1]" .. nome .. "[§K15] ]=----\n- [§K3]Vida antiga[§K15] \n- [§K4]" .. mob.vidaAtual .. "[§K1]/[§K4]" .. mob.vidaMax .. "\n[§K15]----=[ [§K2]" .. (operacao or ((valor < 0 and "-") or "+")) .. " " .. ((not(operacao) and valor < 0 and valor * -1) or valor))
	
	operacao = operacao or "+"
	
	if    (operacao == "==") then mob.vidaMax = valor
	elseif (operacao == "=") then mob.vidaAtual = valor
	elseif (comparar("+", "++", "-", "--", "+=", "-=", "++=", "--=")[operacao]) then
		if (comparar("-", "--", "-=", "--=")[operacao]) then valor = valor * -1 end
	
		if (comparar("+", "++", "-", "--")[operacao]) then mob.vidaAtual = mob.vidaAtual + valor
		else                                               mob.vidaMax   = mob.vidaMax   + valor end
		
		if     (comparar("+", "-", "+=", "-=")[operacao] and mob.vidaAtual > mob.vidaMax) then mob.vidaAtual = mob.vidaMax
		elseif (comparar("+", "-", "+=", "-=")[operacao] and mob.vidaAtual < 0)           then mob.vidaAtual = 0 end
		
		if     (comparar("+", "-", "+=", "-=")[operacao] and mob.vidaMax   < 0)           then mob.vidaMax   = 0 end
	end
	-- texto vida nova
	escrever("[§K15] ]=----\n- [§K3]Vida nova[§K15] \n- [§K4]" .. mob.vidaAtual .. "[§K1]/[§K4]" .. mob.vidaMax .. "\n[§K15]-----------------------", false)
	
	mobs[mobIndex] = mob
end


return salvarMobs()