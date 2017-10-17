-- Faz rolagens para GOT
local valor = tonumber(arg[1]);
local bonus = tonumber(arg[2]) or 0;
local pen = tonumber(arg[3]) or 0;

if valor == nil or valor < 1 then
	escrever("Utilize /got <valor> <bonus> <penalidade>");
	return;
end;

local teste = valor .. "d6";

if bonus > 0 then
	teste = teste .. "+"  .. bonus .. "d6";
end;

local msg = "Valor: " .. valor .. ", Bônus: " .. bonus .. ", Penalidade: " .. pen;

local resultado, rolagem = rolar(teste, msg);

local resultados = {};
local index = 0;

for i = 1, #rolagem.ops, 1 do
	local operacao = rolagem.ops[i]; 
	if operacao.tipo == "dado" then 
		for j=1, #operacao.resultados, 1 do
			index = index +1;
			resultados[index] = operacao.resultados[j];
		end;
	end;
end;

table.sort(resultados);

local total = 0;
local dices = " [";
local limit = bonus+pen+1;

for i=index, limit, -1 do
	total = total + resultados[i];
	dices = dices .. math.floor(resultados[i]);
	if i ~= limit then
		dices = dices .. ', ';
	end;
end;
dices = dices .. "]";

total = math.floor(total);

enviar("Resultado: " .. total .. dices);