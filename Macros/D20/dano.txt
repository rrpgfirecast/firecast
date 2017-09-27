-- Joga uma rolagem de dano N vezes
local dano = arg[1];
local qtd = tonumber(arg[2]);

if dano==nil then
  dano = inputQuery("Dano causado.");
end

if qtd == nil then
  qtd = tonumber(inputQuery("Quantidade de vezes que o dano é causado."));
end;

local total = 0;
for i=1, qtd, 1 do
  total = total + rolar(dano, "Dano " .. i);
end

enviar("Dano total: ".. total);