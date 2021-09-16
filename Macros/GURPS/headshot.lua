-- Faz uma rolagem de 3d6 e compara o valor com o NH
local re = tonumber(arg[1]) or 0;
local teste = "3d6";
if re > 0 then teste = "3d6+"..re end;
if re < 0 then teste = "3d6"..re end;
local resultado = rolar(teste, "[§K1]Critical Head Blow Table") + 1;
local table = {"[§K1]None", "[§K1]None", "[§K1]None", "[§K1]Maximum damage and ignores DR", "[§K1]Half DR after Divisor, penetrating damage becomes Major Wound", "[§K1]Half DR after Divisor, penetrating damage becomes Major Wound", "[§K1]Treat Face or Skull hit as Eye hit, if from behind, half DR after Divisor and penetrating damage becomes Major Wound instead", "[§K1]Treat Face or Skull hit as Eye hit, if from behind, half DR after Divisor and penetrating damage becomes Major Wound instead", "[§K1]Must Do Nothing next turn (defenses allowed)", "[§K1]Normal Damage", "[§K1]Normal Damage", "[§K1]Normal Damage", "[§K1]Normal damage and penetrating damage deafens if cr, severe scarring if other type", "[§K1]Normal Damage and penetrating damage deafens if cr, severe scarring if other type", "[§K1]Normal damage and drops weapon (random if more than one)", "[§K1]Maximum Damage", "[§K1]Double Damage", "[§K1]Half DR after Divisor", "[§K1]Triple Damage", "[§K1]None"};
if resultado > 20 then resultado = 20 end;
if resultado < 1 then resultado = 1 end;
enviar(table[resultado]);