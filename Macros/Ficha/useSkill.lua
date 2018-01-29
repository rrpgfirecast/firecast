-- /useSkill skillName uses filter
-- skillName vai ser o nome usado para acessar essa skill, não use nomes separados por espaços
-- uses vai marcar quantos usos da habilidade vão ser gastos, se por um numero negativo vai recuperar ao inves de gastar
-- filter permite escolher de que personagem essa habilidade vai ser usada(npc|pc|pcOnline|all|mine)

local uses = tonumber(arg[2]);
while uses == nil do
	uses = tonumber(inputQuery("Informe quantos usos foram gastos: "));
end

local filter = arg[3];
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter == "mine" then
  personagem = getCharacterSheet(chooseCharacter("Para qual personagem deseja criar/alterar a habilidade?", filter));
end;

local skillName = arg[1];
local indice;
if skillName == nil then
	local habilidades = ndb.getChildNodes(personagem.macroSavedSkills);
	local lista = {};
	for i=1, #habilidades, 1 do
		lista[i] = habilidades[i].nome;
	end;
	indice, skillName = choose("Que habilidade deseja usar?", lista, 1);
end

if personagem.macroSavedSkills == nil then
	escrever("Esse personagem não tem habilidades salvas. Use /setSkill para criar habilidades para ele primeiro!");
	return;
end;

if personagem.macroSavedSkills[skillName] == nil then
	escrever("Esse personagem não tem nenhuma habilidade com esse nome salva. Use exatamente o mesmo nome para acessar a habilidade. Em caso de duvida use /showSkills para exibir as habilidades que possui. ");
	return;
end;

personagem.macroSavedSkills[skillName].min = personagem.macroSavedSkills[skillName].min - uses;
if personagem.macroSavedSkills[skillName].min < 0 then
	enviar("Foram usadas " .. (personagem.macroSavedSkills[skillName].min*-1) ..  "cargas a mais que o personagem tinha.");
	personagem.macroSavedSkills[skillName].min = 0;
end;

enviar("Foram gastos " .. uses .. " cargas da habilidade " .. skillName .. ". Saldo atual: " .. personagem.macroSavedSkills[skillName].min .. "/" .. personagem.macroSavedSkills[skillName].max);