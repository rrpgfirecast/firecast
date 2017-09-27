local indice = tonumber(arg[1]);
local texto = "";

local filter = arg[2];
local personagem = sheet;

if indice == nil or indice < 1 or indice > 3 then
  indice, texto = choose("Que teste deseja fazer?", {"Fortitude", "Reflexos", "Vontade"}, 1);
end;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" then
  personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja testar "..texto.."?", filter));
elseif filter == "mine" then
  personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja testar "..texto.."?", myPlayer));
end;

local teste = "1d20+";
if indice == 1 then
  teste = teste .. (tonumber(personagem.trFort) or 0);
  rolar(teste, "Teste de Fortitude de " .. (personagem.nome or "Nome"));
elseif indice == 2 then
  teste = teste .. (tonumber(personagem.trRef) or 0);
  rolar(teste, "Teste de Reflexos de " .. (personagem.nome or "Nome"));
elseif indice == 3 then
  teste = teste .. (tonumber(personagem.trVon) or 0);
  rolar(teste, "Teste de Vontade de " .. (personagem.nome or "Nome"));
end