-- Faz uma rolagem de 3d6 e compara o valor com o NH
local dificuldade = tonumber(parametro); 
while dificuldade == nil do
   dificuldade = tonumber(inputQuery("NH:"));
end;

local resultado = rolar("3d6", "NH " .. dificuldade);
local diff = math.abs(dificuldade - resultado);

if resultado==18 or (resultado>=17 and dificuldade<=15) or resultado-10>=dificuldade then
  enviar("Falha Critica por ".. diff .."!");
elseif resultado<=4 or (resultado<=5 and dificuldade>=15) or (resultado<=6 and dificuldade>=16) then
  enviar("Sucesso Critico por ".. diff .."!");
elseif resultado > dificuldade then
  enviar("Falha por ".. diff .."!");
else
  enviar("Sucesso por ".. diff .."!");
end;
