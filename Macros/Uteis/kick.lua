-- Expulsa da mesa o jogador atraves do login dele
local target = arg[1];
if target==nil then
  escrever("Utilize /kick <login>");
end;

for i = 1, #jogadores, 1 do
  if jogadores[i].login == target then
    jogadores[i]:requestKick();
    return;
  end;
end;