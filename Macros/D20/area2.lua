-- Causa dano em todos jogadores, menos os passados na lista
local rolagem = arg[1];

if rolagem==nil then
  rolagem = inputQuery("Rolagem de dano a ser causado.");
end;

local logins = "";
for i=2, #arg, 1 do
	logins = logins .. " " .. arg[2];
end

local resultado = rolar(rolagem, "Dano em Area");

for i = 1, #jogadores, 1 do
  if jogadores[i].isJogador and not string.match(logins, jogadores[i].login) then
  	local min, max = jogadores[i]:getBarValue(1);
  	local novo = min - resultado;
    jogadores[i]:requestSetBarValue(1, novo);
  end;
end;