local indice = tonumber(arg[1]);
local texto = "";

local filter = arg[2];
local personagem = sheet;

if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" then
  personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja usar para atacar?", filter));
elseif filter == "mine" then
  personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja usar para atacar?", myPlayer));
end;

local ataques = ndb.getChildNodes(personagem.campoDosAtaques);

local lista = {};
for i=1, #ataques, 1 do
  lista[i] = ataques[i].nomeAtaque;
end;

if indice == nil or indice < 1 or indice > #ataques then
  indice, texto = choose("Que teste deseja fazer?", lista, 1);
end;

local armas = ndb.getChildNodes(ataques[indice].campoDeArmas);

local acertos = {};
local danos = {};
local margens = {};
local decisivo = {};
local nomes = {};
local id = {};
local resultados = {};
local rolagem = {};
local index = 0;

for i=1, #armas, 1 do
  local golpes = armas[i].acertos;
  for j=1, armas[i].numAtaques, 1 do
    index = index + 1;
    acertos[index] = golpes[j];
    danos[index] = armas[i].dado;
    margens[index] = armas[i].decisivo;
    decisivo[index] = armas[i].crit;
    nomes[index] = armas[i].nomeAtaque or "arma";
    id[index] = j;
  end;
end;

for i=1, index, 1 do
  local teste = "1d20+".. acertos[i];
  resultados[i], rolagem[i] = rolar (teste, "Ataque#" .. id[i] .. " com " .. nomes[i] .. " de " .. (personagem.nome or "nome"));
end;
for i=1, index, 1 do
  rolar (danos[i], "Dano#" .. id[i] .." com " .. nomes[i] .. " de " .. (personagem.nome or "nome"));
end;
for i=1, index, 1 do
  local dado = rolagem[i].ops[1].resultados[1];
  if dado>=margens[i] then
    local teste = "1d20+".. acertos[i];
    rolar (teste, "Confirmação de Decisivo#" .. id[i] .. " com " .. nomes[i] .. " de " .. (personagem.nome or "nome"));
  end;
end;
for i=1, index, 1 do
  local dado = rolagem[i].ops[1].resultados[1];
  if dado>=margens[i] then
    local teste = "1d20+".. acertos[i];
    rolar (decisivo[i], "Dano extra de Decisivo#" .. id[i] .." com " .. nomes[i] .. " de " .. (personagem.nome or "nome"));
  end;
end;