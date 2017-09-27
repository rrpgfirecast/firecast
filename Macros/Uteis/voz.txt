-- Da voz a todos com +Jogador
for i = 1, #jogadores, 1 do
  if jogadores[i].isJogador then
    jogadores[i]:requestSetVoz(true);
  end;
end;