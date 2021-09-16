-- Faz uma rolagem de 3d6 e compara o valor com o NH
local re = tonumber(arg[1]) or 0;
local teste = "3d6";
if re > 0 then teste = "3d6+"..re end;
if re < 0 then teste = "3d6"..re end;
local resultado = rolar(teste, "[§K1]Critical Table") + 1;
local table = {"[§K1]None", "[§K1]None", "[§K1]None", "[§K1]Triple Damage", "[§K1]Half DR after Divisor", "[§K1]Double Damage", "[§K1]Maximum Damage", "[§K1]Major Wound", "[§K1]Double Shock and Cripple", "[§K1]Normal Damage", "[§K1]Normal Damage", "[§K1]Normal Damage", "[§K1]Normal Damage and drops what he holds", "[§K1]Major Wound", "[§K1]Major Wound", "[§K1]Maximum Damage", "[§K1]Double Damage", "[§K1]Half DR After divisor", "[§K1]Triple Damage", "[§K1]None"};
if resultado > 20 then resultado = 20 end;
if resultado < 1 then resultado = 1 end;
enviar(table[resultado]);