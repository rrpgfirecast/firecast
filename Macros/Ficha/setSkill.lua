-- /setSkill skillName maxValue filter
-- skillName vai ser o nome usado para acessar essa skill, não use nomes separados por espaços
-- MaxValue vai guardar a quantidade maxima de usos da pericia, quando alterado automaticamente poe o valor de usos restantes igual ao maximo. 
-- filter permite escolher em que personagem essa habilidade vai ser salva (npc|pc|pcOnline|all|mine)

local skillName = arg[1];
if skillName == nil then
	skillName = inputQuery("Informe o nome para a Habilidade: ");
end

local maxValue = tonumber(arg[2]);
while maxValue == nil do
	maxValue = tonumber(inputQuery("Informe a quantidade máxima de usos: "));
end

local filter = arg[3];
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter == "mine" then
  personagem = getCharacterSheet(chooseCharacter("Para qual personagem deseja criar/alterar a habilidade?", filter));
end;

if personagem.macroSavedSkills == nil then
	personagem.macroSavedSkills = {};
end;

personagem.macroSavedSkills[skillName] = {};
personagem.macroSavedSkills[skillName].nome = skillName;
personagem.macroSavedSkills[skillName].min = maxValue;
personagem.macroSavedSkills[skillName].max = maxValue;

escrever("Habilidade criada/alterada");