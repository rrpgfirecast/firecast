-- Ajuda a alterar o xp e nível da barrinha/linha digitável rapidamente, calculando o nível final e descrevendo as mudanças no chat
-- xp <valor> [L para editar diretamento dos níveis]

-- Template de xp na linha digitável
-- Nível 1: [0/100]

-- Apesar de funcionar aos trancos e barrancos, o macro não foi feito para nível e xp negativos, podendo ter comportamentos inesperados
-- É sabido que o macro crasha se você estiver usando ele na barrinha, seu nível for negativo e você tentar subtrair xp
------------------------------------
--                                --
--         CONFIGURAÇÕES          --
--                                --
------------------------------------
-- em que linha/barrinha o xp vai ficar
local alvo = 1 
-- true para salvar o xp na barrinha, false para salvar em uma linha digitável
local usandoBarrinha = false
local jogador = meuJogador

-- Retorna quanto xp é necessário para sair do nível passado e ir para o próximo
-- A função padrão faz com que:
-- nível 1 -> 100xp
-- nível 2 -> 200xp
-- Caso não queira colocar uma fórmula, você pode adicionar uma tabela e retornar um valor baseado no índice
function xpNecessario(nivel)
	return nivel * 100
end
-- Função contrária ao xpNecessario, retorna o nível atual baseado no xp necessário para chegar no próximo
function calcularNivel(xp)
	return xp / 100
end
------------------------------------
--                                --
--        CARREGAR VALORES        --
--                                --
------------------------------------
-- se o objeto jogador não existe, retorna 1
if jogador == nil then 
	escrever("Jogador não encontrado")
	return 1
end

-- Carrega os valores já salvo de xp
local xpAtual
local nivel
-- Barrinha
if (usandoBarrinha) then
	if (jogador:getBarValue(alvo) == nil) then
		escrever("Barrinha não encontrada")
		return 2
	end
	
	xpAtual, nivel = jogador:getBarValue(alvo)
	nivel = calcularNivel(nivel)
-- Linha digitável
else
	if (jogador:getEditableLine(alvo) == nil) then
		escrever("Barrinha não encontrada")
		return 2
	end
	local linhaBruta = jogador:getEditableLine(alvo)
	if (string.find(linhaBruta, "%[[+-]?%d+/[+-]?%d+%]") == nil) then
		escrever("Você não possuí xp na barrinha")
		return 3
	end
	
	local bufferInicio, bufferFim = string.find(linhaBruta, "%b[/")
	xpAtual = tonumber(string.sub(linhaBruta, bufferInicio + 1, bufferFim - 1))

	bufferInicio, bufferFim = string.find(linhaBruta, "%b/]")
	nivel = math.floor(tonumber(string.sub(linhaBruta, bufferInicio + 1, bufferFim - 1)) / 100)
end

-- VALORES
local valor = tonumber(arg[1])
while (valor == nil) do
	valor = tonumber(inputQuery("Valor: ", 0))
end

-- OPERAÇÃO
local op = arg[2]

if (op ~= nil) then
	op = string.upper(op)
end

if (op ~= nil and op ~= "L") then
	local id, text = choose("Qual a operação?", {"L", "Normal"},1)
	op = text
end

------------------------------------
--                                --
--         PROCESSAMENTO          --
--                                --
------------------------------------

escrever("---------- \nNível inicial:	[§K2]" .. nivel .. "\n[§K1]xp inicial:	[§K2]" .. xpAtual)

if (op == "L") then
	nivel = nivel + valor
else
	xpAtual = xpAtual + valor
	local niveisGanho = 0
	if (valor > 0) then
		while (true) do
			if (nivel == 0) then nivel = nivel + 1 end
			if (xpAtual < xpNecessario(nivel)) then
				escrever("\nNíveis ganhos: [§K2]" .. niveisGanho)
				break
			end
			xpAtual = xpAtual - xpNecessario(nivel)
			nivel = nivel + 1
			niveisGanho = niveisGanho + 1
		end
	elseif (valor < 0) then
		while (true) do
			if (xpAtual >= 0 or nivel <= 0) then
				escrever("\nNíveis perdidos: [§K2]" .. niveisGanho)
				break
			end
			nivel = nivel - 1
			xpAtual = xpAtual + xpNecessario(nivel)
			niveisGanho = niveisGanho + 1
		end
	end
end


escrever("\nNível final:	[§K2]" .. nivel .. "\n[§K1]xp final:	[§K2]" .. xpAtual .. "\n[§K1]---------- ")

if (usandoBarrinha) then
	jogador:requestSetBarValue(alvo, xpAtual, xpNecessario(nivel))
else
	jogador:requestSetEditableLine(alvo, "Nível " .. nivel .. ": [" .. xpAtual .. "/" .. xpNecessario(nivel) .. "]")
end
