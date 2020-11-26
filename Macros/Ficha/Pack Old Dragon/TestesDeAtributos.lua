local indice = tonumber(arg[1]);
local mod = arg[2];
local texto = "";

local filter = arg[#arg] or "mine";
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter=="mine" then
  if filter=="mine"then
    personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja usar para o teste?", myPlayer, true));
  else
    personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja usar para o teste?", filter));
  end

local personagem = sheet;

if indice == nil or indice < 1 or indice > 6 then
  indice, texto = choose("Que teste deseja fazer?", {"Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"}, 1);
end;

if mod == nil then
	mod = inputQuery("Bônus ou penalidade: ", 0);
end

local teste = "1d20+" .. mod;

if indice == 1 then
  dificuldade = (tonumber(personagem.FOR) or 0);
  local resultado = rolar(teste, "Teste de Força - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 1 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 20 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado <= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 2 then
  dificuldade = (tonumber(personagem.DES) or 0);
  local resultado = rolar(teste, "Teste de Destreza - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 1 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 20 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado <= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 3 then
  dificuldade = (tonumber(personagem.CON) or 0);
  local resultado = rolar(teste, "Teste de Constituição - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 1 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 20 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado <= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 4 then
  dificuldade = (tonumber(personagem.INT) or 0);
  local resultado = rolar(teste, "Teste de Inteligência - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 1 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 20 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado <= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 5 then
  dificuldade = (tonumber(personagem.SAB) or 0);
  local resultado = rolar(teste, "Teste de Sabedoria - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 1 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 20 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado <= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
elseif indice == 6 then
  dificuldade = (tonumber(personagem.CAR) or 0);
  local resultado = rolar(teste, "Teste de Carisma - Dificuldade " .. dificuldade);
    if tonumber(resultado - mod) == 1 then
    enviar("[§K9][§B]Acerto Crítico!");
	elseif tonumber(resultado - mod) == 20 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado <= dificuldade then
  enviar("[§K9]Passou no teste!");
else
  enviar("[§K4]Não passou no teste");
  end
end
end;