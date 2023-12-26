if #arg < 2 then 
	escrever("Passe ao menos um valor de ataque e dano.");
	escrever("Use /ataqueTotal <bonus de ataque> <danos>");
end;
local metade = math.floor(#arg/2);

--Rolando ataque
local ataque;
for i=1, metade, 1 do
	ataque = rolar("1d20+" .. arg[i], "Ataque #" .. i);
end;
-- Rolando dano
local dano = 0;
local j = 1;
for i=metade+1, #arg, 1 do
	dano = rolar(arg[i], "Dano #" .. j);
	j = j +1;
end;
