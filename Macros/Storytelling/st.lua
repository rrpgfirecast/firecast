-- Faz a rolagem seguindo as regras de Storytelling
local dados = tonumber(arg[1]);
local dificuldade = 8;
if dados == nil then
   escrever("Utilize: /st <quantidade dados>");
   return;
end; 
if dados < 0 then
   escrever("Não utilize números negativos.");
   return;
end; 

local teste = dados .. "d10";
local resultado, rolagem = rolar(teste, "Dificuldade: " .. dificuldade);
local sucessos = 0;
local explosao = 0;

local op = rolagem.ops[1];
for j=1, #op.resultados, 1 do
  if op.resultados[j] >= dificuldade then
    sucessos = sucessos +1;
  end;
  if op.resultados[j] >= 10 then
    explosao = explosao +1;
  end;
end;

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

enviar(sucessos .. " Sucesso(s)!");
