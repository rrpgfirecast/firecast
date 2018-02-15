-- /sr dados limite threshold
local dados = tonumber(arg[1]);
local limite = tonumber(arg[2]);
local threshold = tonumber(arg[3]);

if dados==nil then
	dados = tonumber(inputQuery("Quantidade de dados: "));
end;

if limite==nil then
	limite = tonumber(inputQuery("Limite de sucessos: "));
end;

if threshold==nil then
	threshold = tonumber(inputQuery("Quantidade de sucessos necessaria: "));
end;

local glitch = math.floor(dados/2) + 1;

local teste = dados .. "d6";
local resultado, rolagem = rolar(teste, dados .. " [" .. limite .. "] (" .. threshold .. ")");

local sucessos = 0;
local falhas = 0;

local op = rolagem.ops[1];
for j=1, #op.resultados, 1 do
	if op.resultados[j] >= 5 then
		sucessos = sucessos + 1;
	 elseif op.resultados[j] == 1 then
	 	falhas = falhas + 1;
	end;
end;

local result = math.min(sucessos, limite) .. " sucessos. ";

if falhas >= glitch then
	if sucessos > 0 then
		result = result .. "Houve um glitch. ";
	else
		result = result .. "Houve um glitch crítico. ";
	end;
end;

enviar(result);