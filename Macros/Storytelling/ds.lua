-- Faz a rolagem seguindo as regras de Storytelling
local dados = 1;
local dificuldade = 10;

local teste = dados .. "d10";
local resultado, rolagem = rolar(teste, "Dificuldade: " .. dificuldade);
local sucessos = 0;
local explosao = 0;
local drama = false;

local op = rolagem.ops[1];
for j=1, #op.resultados, 1 do
  if op.resultados[j] >= dificuldade then
    sucessos = sucessos +1;
  end;
  if op.resultados[j] >= 10 then
    explosao = explosao +1;
  end;
  if op.resultados[j] <= 1 then
    drama = true;
  end;
end;

dificuldade = 8;
while explosao > 0 do
	local teste = explosao .. "d10";
	local resultado, rolagem = rolar(teste, "Dificuldade: " .. dificuldade);
	explosao = 0;
	local op = rolagem.ops[1];

	for j=1, #op.resultados, 1 do
	  if op.resultados[j] >= dificuldade then
	    sucessos = sucessos +1;
	  end;
	  if op.resultados[j] >= 10 then
	    explosao = explosao +1;
	  end;
	end;
end;

if drama then
	enviar("Falha dramática!");
else 
	enviar(sucessos .. " Sucesso(s)!");
end;
