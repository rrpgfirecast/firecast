-- Faz a rolagem seguindo as regras de ACN
-- Como storyteller, mas nao tem falhas criticas ou decisivos
local dados = tonumber(arg[1]);
local dificuldade = tonumber(arg[2]);
if dados == nil or dificuldade == nil then
   escrever("Utilize: /acn <quantidade dados> <dificuldade>");
   return;
end; 
if dados < 0 or dificuldade < 0 then
   escrever("Não utilize números negativos.");
   return;
end; 

local teste = dados .. "d10";
local resultado, rolagem = rolar(teste, "Dificuldade: " .. dificuldade);
local sucessos = 0;

local op = rolagem.ops[1];
for j=1, #op.resultados, 1 do
  if op.resultados[j] >= dificuldade then
    sucessos = sucessos +1;
  end;
end;

enviar(sucessos .. " Sucesso(s)!");