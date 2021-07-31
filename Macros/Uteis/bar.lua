-- bar <login ou nick> <bar #1-4> <op ++ -- += -= ==> <atual> <maximo[opcional]>
-- ++ overflow da barra
-- -- underflow da barra
-- += soma ao atual
-- -= subtrai do atual
-- == atualiza o total
local target = arg[1]
local jogador = nil

local users = {}

-- JOGADOR

-- se alvo foi passado, procure na lista de jogadores o objeto jogador
for i=1, #jogadores, 1 do
	-- salvando a lista dos nicks dos jogadores pra depois
	users[i] = jogadores[i].nick

	-- checa se o target bate com o nick ou login, removendo caracteres especiais
	if target~=nil and (Utils.compareStringPtBr(Utils.removerFmtChat(jogadores[i].login), Utils.removerFmtChat(target))==0 or Utils.compareStringPtBr(Utils.removerFmtChat(jogadores[i].nick), Utils.removerFmtChat(target))==0) then
		jogador = jogadores[i]
	end
end

-- se o objeto jogador está nulo faça o usuario selecionar da lista
if jogador == nil then 
	local id = choose("Qual o jogador?", users, 1)
	jogador = jogadores[id]
end

-- BARRINHA

local bar = tonumber(arg[2])

-- pegue a barra pelo nome
if (bar == nil or bar < 1 or bar > 4) and arg[2] ~= nil then
	local bars = {}
	-- mude esses bar1-bar4 para o nome das barras de sua mesa
	bars["bar1"] = 1
	bars["bar2"] = 2
	bars["bar3"] = 3
	bars["bar4"] = 4

	bar = bars[arg[2]]
end

if bar == nil or bar < 1 or bar > 4 then
	local id = choose("Qual a barrinha?", {"1","2","3","4"}, 1)
	bar = tonumber(id)
end

-- OPERAÇÃO
local op = arg[3]

if op == nil or (op~="++" and op~="--" and op~="+=" and op~="-=" and op~="==") then
	local id, text = choose("Qual a operação?", {"++","--","+=","-=","=="},3)
	op = text
end

-- VALORES
local curr = tonumber(arg[4])
local max = tonumber(arg[5])

if curr == nil then
	curr = tonumber(inputQuery("Valor:"))
	if curr==nil then return end
end

-- ACTION
local currentValue, maxValue = jogador:getBarValue(bar)

if max ~= nil then
	if op=="++" then
		maxValue = maxValue + max
	elseif op=="--"then
		maxValue = 0 - max
	elseif op=="+="then
		maxValue = maxValue + max
	elseif op=="-="then
		maxValue = maxValue - max
	elseif op=="=="then
		maxValue = max
	end
end

if op=="++" then
	currentValue = maxValue + curr
elseif op=="--"then
	currentValue = 0 - curr
elseif op=="+="then
	currentValue = currentValue + curr
elseif op=="-="then
	currentValue = currentValue - curr
elseif op=="=="then
	currentValue = curr
end

jogador:requestSetBarValue(bar, currentValue, maxValue)