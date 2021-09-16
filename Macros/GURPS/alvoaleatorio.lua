-- Faz uma rolagem de 3d6 e compara o valor com o NH
local re = tonumber(arg[1]) or 0;
local teste = "3d6";
if re > 0 then teste = "3d6+"..re end;
if re < 0 then teste = "3d6"..re end;
local resultado = rolar(teste, "[§K1]Random Hit Location") + 1;
local table = {"[§K1]None", "[§K1]None", "[§K1]None", "[§K1]Skull", "[§K1]Skull", "[§K1]Face", "[§K1]Left Leg", "[§K1]Left Leg", "[§K1]Left Arm", "[§K1]Chest", "[§K1]Chest", "[§K1]Abdomen", "[§K1]Right Arm", "[§K1]Right Leg", "[§K1]Right Leg", "[§K1]Hands", "[§K1]Feet", "[§K1]Neck", "[§K1]Neck", "[§K1]None"};
if resultado > 20 then resultado = 20 end;
if resultado < 1 then resultado = 1 end;
enviar(table[resultado]);