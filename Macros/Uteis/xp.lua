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
local target = 1 
-- true para salvar o xp na barrinha, false para salvar em uma linha digitável
local barrinha = false
local jogador = meuJogador

-- Retorna quanto xp é necessário para sair do nível passado e ir para o próximo
-- A função padrão faz com que:
-- nível 1 -> 100xp
-- nível 2 -> 200xp
-- Caso não queira colocar uma fórmula, você pode adicionar uma tabela e retornar um valor baseado no índice
function calcularXpNivel(nivel)
	return nivel * 100
end
-- Função contrária ao calcularXpNivel, retorna o nível atual baseado no xp necessário para chegar no próximo
function calcularNivelXp(xp)
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
local currentValue
local level
-- Barrinha
if (barrinha) then
	if (jogador:getBarValue(target) == nil) then
		escrever("Barrinha não encontrada")
		return 2
	end
	
	currentValue, level = jogador:getBarValue(target)
	level = calcularNivelXp(level)
-- Linha digitável
else
	if (jogador:getEditableLine(target) == nil) then
		escrever("Barrinha não encontrada")
		return 2
	end
	local lineRaw = jogador:getEditableLine(target)
	if (string.find(lineRaw, "%[[+-]?%d+/[+-]?%d+%]") == nil) then
		escrever("Você não possuí xp na barrinha")
		return 3
	end
	
	local bufferInicio, bufferFim = string.find(lineRaw, "%b[/")
	currentValue = tonumber(string.sub(lineRaw, bufferInicio + 1, bufferFim - 1))

	bufferInicio, bufferFim = string.find(lineRaw, "%b/]")
	level = math.floor(tonumber(string.sub(lineRaw, bufferInicio + 1, bufferFim - 1)) / 100)
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

escrever("---------- \nNível inicial:	[§K2]" .. level .. "\n[§K1]xp inicial:	[§K2]" .. currentValue)

if (op == "L") then
	level = level + valor
else
	currentValue = currentValue + valor
	local levelsGained = 0
	if (valor > 0) then
		while (true) do
			if (level == 0) then level = level + 1 end
			if (currentValue < calcularXpNivel(level)) then
				escrever("\nNíveis ganhos: [§K2]" .. levelsGained)
				break
			end
			currentValue = currentValue - calcularXpNivel(level)
			level = level + 1
			levelsGained = levelsGained + 1
		end
	elseif (valor < 0) then
		while (true) do
			if (currentValue >= 0 or level <= 0) then
				escrever("\nNíveis perdidos: [§K2]" .. levelsGained)
				break
			end
			level = level - 1
			currentValue = currentValue + calcularXpNivel(level)
			levelsGained = levelsGained + 1
		end
	end
end


escrever("\nNível final:	[§K2]" .. level .. "\n[§K1]xp final:	[§K2]" .. currentValue .. "\n[§K1]---------- ")

if (barrinha) then
	jogador:requestSetBarValue(target, currentValue, calcularXpNivel(level))
else
	jogador:requestSetEditableLine(target, "Nível " .. level .. ": [" .. currentValue .. "/" .. calcularXpNivel(level) .. "]")
end
