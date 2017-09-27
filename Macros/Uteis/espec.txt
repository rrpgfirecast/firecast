-- Transforma em espectador cada jogador sem voz
for i = 1, #jogadores, 1 do
  if jogadores[i].isJogador and not jogadores[i].haveVoice then
    jogadores[i]:requestSetJogador(false);
  end;
end;