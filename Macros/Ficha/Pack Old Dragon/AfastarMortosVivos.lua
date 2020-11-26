local dificuldade = tonumber(arg[1]);
local bn = tonumber(arg[2]);
local personagem = sheet;

local filter = arg[#arg] or "mine";
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter=="mine" then
  if filter=="mine"then
    personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja usar para o teste?", myPlayer, true));
  else
    personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja usar para o teste?", filter));
  end

if bn == nil then
	bn = inputQuery("Bônus de nivel? Nivel atual " .. sheet.Nivel, 0);
end

nivel = tonumber((sheet.Nivel) + (bn or "0"))

if dificuldade == nil then
	dificuldade = inputQuery("Qual a dificuldade (em DVs)?: ", 0);
end

local teste = "1d20+" .. tonumber(sheet.Nivel)
local quantidade = sheet.Mor_Viv_Afas

local bqtd = sheet.nivel

-- Jogador nivel 1

if nivel == 1 then

if tonumber(dificuldade) == 1 then
local resultado = rolar(teste, "Dificuldade: 13")
if resultado >= tonumber(13) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade .. "+" .. bqtd, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 2 then
local resultado = rolar(teste, "Dificuldade:17")
if resultado >= tonumber(17) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local resultado = rolar(teste, "Dificuldade: 19")
if resultado >= tonumber(19) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 4 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 2

elseif nivel == 2 then

if tonumber(dificuldade) == 1 then
local resultado = rolar(teste, "Dificuldade: 11")
if resultado >= tonumber(11) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 2 then
local resultado = rolar(teste, "Dificuldade:15")
if resultado >= tonumber(15) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local resultado = rolar(teste, "Dificuldade: 18")
if resultado >= tonumber(18) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local resultado = rolar(teste, "Dificuldade: 20")
if resultado >= tonumber(20) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 5 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 3

elseif nivel == 3 then

if tonumber(dificuldade) == 1 then
local resultado = rolar(teste, "Dificuldade: 9")
if resultado >= tonumber(9) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 2 then
local resultado = rolar(teste, "Dificuldade:13")
if resultado >= tonumber(13) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local resultado = rolar(teste, "Dificuldade: 17")
if resultado >= tonumber(17) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local resultado = rolar(teste, "Dificuldade: 19")
if resultado >= tonumber(19) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 5 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 4

elseif nivel == 4 then

if tonumber(dificuldade) == 1 then
local resultado = rolar(teste, "Dificuldade: 7")
if resultado >= tonumber(7) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 2 then
local resultado = rolar(teste, "Dificuldade:11")
if resultado >= tonumber(11) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local resultado = rolar(teste, "Dificuldade: 15")
if resultado >= tonumber(15) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local resultado = rolar(teste, "Dificuldade: 18")
if resultado >= tonumber(18) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local resultado = rolar(teste, "Dificuldade: 20")
if resultado >= tonumber(20) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 6 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 5

elseif nivel == 5 then

if tonumber(dificuldade) == 1 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 2 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 6 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 6

elseif nivel == 6 then

if tonumber(dificuldade) == 1 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 2 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 7 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 7

elseif nivel == 7 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 7 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 8

elseif nivel == 8 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 8 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 9

elseif nivel == 9 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
local dif = 2
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 3 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 8 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;


-- Jogador nivel 10

elseif nivel == 10 then
  if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 3 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 5 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 8 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 9 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 11

elseif nivel == 11 then

  if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 3 then
local dif = 2
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 4 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 5 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 8 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 9 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 10 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 12

elseif nivel == 12 then

  if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif dificuldade == nil or dificuldade < 2 or dificuldade > 3 then
enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 5 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 8 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 9 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 10 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 11 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 13

elseif nivel == 13 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
local dif = 2
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 5 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 12 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 14

elseif nivel == 14 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 12 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 13 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 15

elseif nivel == 15 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
local dif = 2
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
 elseif tonumber(dificuldade) == 6 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 12 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 13 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 14 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 16

elseif nivel == 16 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 6 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 12 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 13 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) == 14 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 15 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 17

elseif nivel == 17 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 6 then
local dif = 2
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 7 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 12 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 13 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) == 14 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
elseif tonumber(dificuldade) == 15 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 16 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 18

elseif nivel == 18 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 6 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 7 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 12 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 13 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) == 14 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
elseif tonumber(dificuldade) == 15 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
  elseif tonumber(dificuldade) == 16 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 17 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 19

elseif nivel == 19 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 6 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 7 then
local dif = 2
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 8 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 12 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 13 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) == 14 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
elseif tonumber(dificuldade) == 15 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
  elseif tonumber(dificuldade) == 16 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
 elseif tonumber(dificuldade) == 17 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end  
  elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
elseif tonumber(dificuldade) >= 18 then
  enviar("[§B][§K4] Você é fraco, te falta Fé");
end;

-- Jogador nivel 20

elseif nivel == 20 then

if tonumber(dificuldade) == 1 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 2 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 3 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 4 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 5 then
  enviar("[§K9]Conseguiu Destruir:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
 elseif tonumber(dificuldade) == 6 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
elseif tonumber(dificuldade) == 7 then
    enviar("[§K9]Conseguiu Afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos")
  elseif tonumber(dificuldade) == 8 then
local dif = 3
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
  elseif tonumber(dificuldade) == 9 then
local dif = 5
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 10 then
local dif = 7
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 11 then
local dif = 9
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
elseif tonumber(dificuldade) == 12 then
local dif = 11
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end
    elseif tonumber(dificuldade) == 13 then
local dif = 13
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
  elseif tonumber(dificuldade) == 14 then
local dif = 15
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end 
elseif tonumber(dificuldade) == 15 then
local dif = 17
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
  elseif tonumber(dificuldade) == 16 then
local dif = 18
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end   
 elseif tonumber(dificuldade) == 17 then
local dif = 19
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end  
   elseif tonumber(dificuldade) == 18 then
local dif = 20
local resultado = rolar(teste, "Dificuldade: " .. dif)
if resultado >= tonumber(dif) then
  enviar("[§K9]Conseguiu afastar:");
local resultado2 = rolar(quantidade, "Mortos Vivos Afastados")
else
  enviar("[§K4]Não conseguiu afastar T.T");
  end  
elseif tonumber(dificuldade) >= 19 then
  enviar("[§B][§K4] Seu deus sente vergonha de você, vá ler o livro");
end;
end
  end 