-- Teste contra alguma CD
local bonus= tonumber(arg[1]); 
local dificuldade = tonumber(arg[2]); 
local info = arg[3];

if bonus == nil then
  bonus = tonumber(inputQuery("Bônus."));
end;

if dificuldade == nil then
  dificuldade = tonumber(inputQuery("Dificuldade."));
  info = inputQuery("Teste de ?.", nil, true);
end; 

local text = "";
if info==nil or info == "" then
  text = "CD " .. dificuldade;
else
  text = "Teste de " .. info .. "; CD " .. dificuldade;
end;

local resultado = rolar("1d20+" .. bonus, text); 

if resultado >= dificuldade then
  enviar("Passou no teste!");
else
  enviar("Não passou no teste");
end;