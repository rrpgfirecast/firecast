local indice = tonumber(arg[1]);
local texto = "";

local filter = arg[2];
local personagem = sheet;

if indice == nil or indice < 1 or indice > 6 then
  indice, texto = choose("Que teste deseja fazer?", {"Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"}, 1);
end;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" then
  personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja testar "..texto.."?", filter));
elseif filter == "mine" then
  personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja testar "..texto.."?", myPlayer));
end;

local teste = "1d20+";

if indice == 1 then
  teste = teste .. (tonumber(personagem.efetModFor) or 0);
  rolar(teste, "Teste de Força de " .. (personagem.nome or "Nome"));
elseif indice == 2 then
  teste = teste .. (tonumber(personagem.efetModDes) or 0);
  rolar(teste, "Teste de Destreza de " .. (personagem.nome or "Nome"));
elseif indice == 3 then
  teste = teste .. (tonumber(personagem.efetModCon) or 0);
  rolar(teste, "Teste de Constituição de " .. (personagem.nome or "Nome"));
elseif indice == 4 then
  teste = teste .. (tonumber(personagem.efetModInt) or 0);
  rolar(teste, "Teste de Inteligência de " .. (personagem.nome or "Nome"));
elseif indice == 5 then
  teste = teste .. (tonumber(personagem.efetModSab) or 0);
  rolar(teste, "Teste de Sabedoria de " .. (personagem.nome or "Nome"));
elseif indice == 6 then
  teste = teste .. (tonumber(personagem.efetModCar) or 0);
  rolar(teste, "Teste de Carisma de " .. (personagem.nome or "Nome"));
end