-- /showSkills filter
-- filter permite escolher em que personagem se vai exibir as habilidades (npc|pc|pcOnline|all|mine)

local filter = arg[1];
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter == "mine" then
  personagem = getCharacterSheet(chooseCharacter("Para qual personagem deseja criar/alterar a habilidade?", filter));
end;

local habilidades = ndb.getChildNodes(personagem.macroSavedSkills);
enviar("Saldo de suas habilidades. ");
for i=1, #habilidades, 1 do
	enviar(habilidades[i].nome .. ": " .. habilidades[i].min .. "/" .. habilidades[i].max);
end;
