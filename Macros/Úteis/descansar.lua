-- Recupera completamente

for i=1, 3, 1 do
	local min, max = meuJogador:getBarValue(i);
	meuJogador:requestSetBarValue(i, max);
end;