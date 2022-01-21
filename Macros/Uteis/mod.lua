-- Modera ou desativa a moderaçao da mesa e ja da voz a todos jogadores. 
if mesa.isModerada then
  mesa:requestSetModerada(false);
  for i = 1, #jogadores, 1 do
    if jogadores[i].isJogador then
      jogadores[i]:requestSetVoz(false);
    end;
  end
else
  mesa:requestSetModerada(true);
  for i = 1, #jogadores, 1 do
    if jogadores[i].isJogador then
      jogadores[i]:requestSetVoz(true);
    end;
  end
end;