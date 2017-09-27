-- Chama pelo nick cada um com +Jogador na sala
local lista = "";
for i = 1, #jogadores, 1 do
  if jogadores[i].isJogador then
   lista = lista .. " " .. jogadores[i].nick;
  end;
end;

enviar("Estao ai"..lista.."?");