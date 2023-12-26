-- Tabela de exemplos de falhas criticas para deixar a sua vida mais divertida
local resultado = rolar("1d100", "D Falha Critica"); 

if resultado <= 1 then
	enviar("Algo de muinto Ruim acontece contigo.");
elseif resultado <= 5 then
	enviar("Sua arma quebra");
elseif resultado <= 7 then
	enviar("Acerta a si proprio causando um critico.");
elseif resultado <= 9 then
	enviar("Acerta a si próprio, causando metade do dano e atordoamento por 1 turno.");
elseif resultado <= 11 then
	enviar("Acerta a si próprio, causando o dano e incapacitado por 1 turnos.");
elseif resultado <= 13 then
	enviar(" Acerta a si próprio, causando o dano e atordoamento pro 1 turnos.");
elseif resultado <= 20 then
	enviar("Acerta a si próprio, causando o dano.");
elseif resultado <= 22 then
	enviar("Acerta um aliado proximo causando um critico.");
elseif resultado <= 24 then
	enviar("Acerta um aliado próximo, metade do dano.");
elseif resultado <= 30 then
	enviar("Acerta um aliado próximo causando o dano normal.");
elseif resultado <= 35 then
	enviar("Perde a firmeza na arma e tem desvantagem para atacar no proximo turno.");
elseif resultado <= 40 then
	enviar("Perde a firmeza na arma e não pode atacar no próximo turno.");
elseif resultado <= 45 then
	enviar("Perde a firmeza na arma e a derruba no chão (1 ação para pegar a arma).");
elseif resultado <= 50 then
	enviar("Perde o Equilibrio e não pode agir no proximo turno.");
elseif resultado <= 55 then
	enviar("Perde o Equilibrio, o primeiro inimigo tem vantagem para bater em você no proiximo turno.");
elseif resultado <= 60 then
	enviar("Perde o Equilibrio, seus inimigos tem vantagem para bater em você.");
elseif resultado <= 65 then
	enviar("Perde o Equilibrio, Escorrega e fica caido no mesmo lugar..");
elseif resultado <= 70 then
	local duracao = rolar("1d6", "Duration");
	enviar("Torce o pé e fica lento por " .. duracao .. " turnos (-50% movimentação arredondado para baixo).");
elseif resultado <= 75 then
	local duracao = rolar("1d4", "Duration");
	enviar("Tropeça e cai, fica lento por " .. duracao .. " turnos (-50% movimentação).");
elseif resultado <= 80 then
	enviar("O adversário do personagem ganha um ataque de oportunidade.");
elseif resultado <= 85 then
	enviar("O personagem tropeça e cai e seu adversário ganha um ataque de oportunidade.");
elseif resultado <= 90 then
	local duracao = rolar("1d4", "Duration");
	enviar("Algo afeta seus olhos, perde seu bônus de DES na CA e seus próximos ataques têm 50% de chance de falha por " .. duracao .. " turnos. Constituição CD 12 remove debuff.");
elseif resultado <= 95 then
	enviar("Acerto no alvo do ataque mas a arma fica presa (em posse) do alvo.");
elseif resultado <= 98 then
	enviar("Não acontece nada.");
elseif resultado <= 99 then
	enviar("Acerto no alvo do ataque.");
else
	enviar("Recebe ajuda divina ou tem uma grande sorte, acerto critico no alvo do ataque.");
end
