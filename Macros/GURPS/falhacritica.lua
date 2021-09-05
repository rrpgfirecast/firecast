-- Faz uma rolagem de 3d6 e compara o valor com o NH
local re = tonumber(arg[1]) or 0;
local teste = "3d6";
if re > 0 then teste = "3d6+"..re end;
if re < 0 then teste = "3d6"..re end;
local resultado = rolar(teste, "[§K1]Critical Failure") + 1;
local table = {"[§K1]None", "[§K1]None", "[§K1]None", "[§K1]Weapon breaks", "[§K1]Weapon Breaks", "[§K1]Hit yourself (arm or leg); unless imp or pi: roll again", "[§K1]Hit yourself (arm or leg); unless imp or pi: roll again. Half damage", "[§K1]Lose your balance. Do nothing until next turn; active defences at -2", "[§K1]Weapon turns; Must spend ready manuever", "[§K1]Drop the weapons (break if cheap)", "[§K1]Drop the weapons (break if cheap)", "[§K1]Drop the weapons (break if cheap)", "[§K1]Weapon turns; Must spend ready manuever", "[§K1]Lose your balance. Do nothing until next turn; active defences at -2", "[§K1]If sw: weapon flyes 1d yard (front or back) - if somebody is hit, test DX or take damage!; if ranged or thr, drop the weapon; ", "[§K1]Strain your shoulder. Arm is 'crippled', but doesn't drop the weapon. Can't attack or defend for 30 minutes.", "[§K1]Fall down! If ranged, lose balance. Do nothing, and -2 active defences", "[§K1]Weapon Breaks", "[§K1]Weapon breaks", "[§K1]None"};
if resultado > 20 then resultado = 20 end;
if resultado < 1 then resultado = 1 end;
enviar(table[resultado]);