local indice = tonumber(arg[1]);
local mod = arg[2];
local texto = "";
local personagem = sheet;

local filter = arg[#arg] or "mine";
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter=="mine" then
  if filter=="mine"then
    personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja usar para o teste?", myPlayer, true));
  else
    personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja usar para o teste?", filter));
  end

if indice == nil or indice < 1 or indice > 3 then
  indice, texto = choose("Qual JP deseja fazer?", {"Destreza", "Constituição", "Sabedoria"}, 1);
end;

if mod == nil then
	mod = inputQuery("Bônus ou penalidade: ", 0);
end

local teste = "1d20+" .. mod;


if indice == 1 then
  dificuldade = (tonumber(personagem.JPDes) or 0);
  local resultado = rolar(teste, "Jogada de Proteção de Destreza - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 20 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado >= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 2 then
  dificuldade = (tonumber(personagem.JPCon) or 0);
  local resultado = rolar(teste, "Jogada de Proteção de Constituição - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 20 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado >= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 3 then
  dificuldade = (tonumber(personagem.JPSab) or 0);
  local resultado = rolar(teste, "Jogada de Proteção de Sabedoria - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 20 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado >= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
end;
end
