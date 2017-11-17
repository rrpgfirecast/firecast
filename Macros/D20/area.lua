-- Causa Dano a todos jogadores
local rolagem = arg[1];

if rolagem==nil then
  rolagem = inputQuery("Rolagem de dano a ser causado.");
end;

local resultado = rolar(rolagem, "Dano em Area");

for i = 1, #jogadores, 1 do
  if jogadores[i].isJogador then
    local min, max = jogadores[i]:getBarValue(1);
  	local novo = min - resultado;
    jogadores[i]:requestSetBarValue(1, novo);
  end;
end;