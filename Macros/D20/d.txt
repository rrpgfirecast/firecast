-- faz uma rolagem de d20 + bonus
local bonus= tonumber(arg[1]); 
local info = arg[2];

if bonus == nil then
  bonus = tonumber(inputQuery("Bônus."));
  info = inputQuery("Teste de ?.", nil, true);
end; 

local text = "";
if info==nil or info == "" then
  text = "";
else
  text = "Teste de " .. info;
end;

local resultado = rolar("1d20+" .. bonus, text);