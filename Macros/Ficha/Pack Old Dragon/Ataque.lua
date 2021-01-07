local indice = tonumber(arg[1]);
local dificuldade = tonumber(arg[2]);
local mod = tonumber(arg[3]);
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

if indice == nil or indice < 1 or indice > 4 then
  indice, texto = choose("Qual arma você deseja usar?", {personagem.arma1, personagem.arma2, personagem.arma3, personagem.arma4}, 1);
end;

if dificuldade == nil then
	dificuldade = inputQuery("Informe a CA do alvo: ", 0);
end

if dificuldade == 0 then
	dificuldade =  0;
end

if mod == nil then
	mod = inputQuery("Bônus ou penalidade: ", 0);
end

if indice == 1 then
  nome = personagem.arma1 or "Preencher nome da arma"
  acerto = personagem.atk1 or "1d20"
  dano = personagem.dano1 or "1d4"
  local resultado1, rolagem = rolar(acerto .. "+" .. mod, "Ataque com " .. nome .. "/ Tipo: " .. (personagem.tipo1 or "Preencher tipo") .. "/ Crit: " .. (personagem.crit1 or "Preencher crit") .. "/ Especial: " .. (personagem.esp1 or "Preencher esp") .. "/ Alcance: " .. (personagem.rng1 or "Preencher alc"));
   for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       

        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
				if tonumber(op.resultados[j]) == 20 then
   enviar("[§K9][§B]Acerto Crítico!");
	local resultado2 = rolar(dano, "Dano. Digite /c e multiplique o seu dano!")
	elseif tonumber(op.resultados[j]) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado1 >= tonumber(dificuldade) then
	enviar("[§K9]Acertou!");
	local resultado2 = rolar(dano, "Dano")
	else
  enviar("[§K4]Errou");
  end
                end;
        end;
end; 
  
elseif indice == 2 then
  nome = personagem.arma2 or "Preencher nome da arma"
  acerto = personagem.atk2 or "1d20"
  dano = personagem.dano2 or "1d4"
  local resultado1, rolagem = rolar(acerto .. "+" .. mod, "Ataque com " .. nome .. "/ Tipo: " .. (personagem.tipo2 or "Preencher tipo") .. "/ Crit: " .. (personagem.crit2 or "Preencher crit") .. "/ Especial: " .. (personagem.esp2 or "Preencher esp") .. "/ Alcance: " .. (personagem.rng2 or "Preencher alc"));
   for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       

        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
				if tonumber(op.resultados[j]) == 20 then
   enviar("[§K9][§B]Acerto Crítico!");
	local resultado2 = rolar(dano, "Dano. Digite /c e multiplique o seu dano!")
	elseif tonumber(op.resultados[j]) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado1 >= tonumber(dificuldade) then
	enviar("[§K9]Acertou!");
	local resultado2 = rolar(dano, "Dano")
	else
  enviar("[§K4]Errou");
  end
                end;
        end;
end;  

  
  elseif indice == 3 then
  nome = personagem.arma3 or "Preencher nome da arma"
  acerto = personagem.atk3 or "1d20"
  dano = personagem.dano3 or "1d4"
  local resultado1, rolagem = rolar(acerto .. "+" .. mod, "Ataque com " .. nome .. "/ Tipo: " .. (personagem.tipo3 or "Preencher tipo") .. "/ Crit: " .. (personagem.crit3 or "Preencher crit") .. "/ Especial: " .. (personagem.esp3 or "Preencher esp") .. "/ Alcance: " .. (personagem.rng3 or "Preencher alc"));
   for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       

        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
				if tonumber(op.resultados[j]) == 20 then
   enviar("[§K9][§B]Acerto Crítico!");
	local resultado2 = rolar(dano, "Dano. Digite /c e multiplique o seu dano!")
	elseif tonumber(op.resultados[j]) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado1 >= tonumber(dificuldade) then
	enviar("[§K9]Acertou!");
	local resultado2 = rolar(dano, "Dano")
	else
  enviar("[§K4]Errou");
  end
                end;
        end;
end;  

  
elseif indice == 4 then
  nome = personagem.arma4 or "Preencher nome da arma"
  acerto = personagem.atk4 or "1d20"
  dano = personagem.dano4 or "1d4"
  local resultado1, rolagem = rolar(acerto .. "+" .. mod, "Ataque com " .. nome .. "/ Tipo: " .. (personagem.tipo4 or "Preencher tipo") .. "/ Crit: " .. (personagem.crit4 or "Preencher crit") .. "/ Especial: " .. (personagem.esp4 or "Preencher esp") .. "/ Alcance: " .. (personagem.rng4 or "Preencher alc"));
   for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       

        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
				if tonumber(op.resultados[j]) == 20 then
   enviar("[§K9][§B]Acerto Crítico!");
	local resultado2 = rolar(dano, "Dano. Digite /c e multiplique o seu dano!")
	elseif tonumber(op.resultados[j]) == 1 then
	enviar("[§K4][§B]Erro Crítico!");
	elseif resultado1 >= tonumber(dificuldade) then
	enviar("[§K9]Acertou!");
	local resultado2 = rolar(dano, "Dano")
	else
  enviar("[§K4]Errou");
  end
                end;
        end;
end;  
end
end;