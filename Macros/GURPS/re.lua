-- Faz uma rolagem de 3d6 e compara o valor com o NH
local re = tonumber(arg[1]) or 0; 

local teste = "3d6";
if re > 0 then teste = "3d6+"..re end;
if re < 0 then teste = "3d6"..re end;

local resultado = rolar(teste, "Reação") + 1;
local table = {"Disastrous", "Very Bad", "Very Bad", "Very Bad", "Bad", "Bad", "Bad", "Poor", "Poor", "Poor", "Neutra", "Neutra", "Neutra", "Good", "Good", "Good", "Very Good", "Very Good", "Very Good", "Excellent"};
if resultado > 20 then resultado = 20 end;

enviar(table[resultado]);
