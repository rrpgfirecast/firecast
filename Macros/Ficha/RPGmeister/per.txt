local indice = tonumber(arg[1]);
local nome = parametro;
local texto = "";

local filter = arg[#arg];
local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter=="mine" then
  if filter=="mine"then
    personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja usar para o teste?", myPlayer));
  else
    personagem = getCharacterSheet(chooseCharacter("Qual personagem deseja usar para o teste?", filter));
  end;
  local size = #arg-1;
  nome = "";
  for i=1, size, 1 do
    nome = nome .. arg[i];
    if i ~= size then
      nome = nome .. " ";
    end;
  end;
end;

local pericias = ndb.getChildNodes(personagem.campoDasPericias);

local lista = {};
for i=1, #pericias, 1 do
  lista[i] = pericias[i].nomePericia;
  if utils.compareStringPtBr(lista[i], nome) == 0 then
    indice = i;
  end
end;

if indice == nil or indice < 1 or indice > #pericias then
  indice, texto = choose("Que teste deseja fazer?", lista, 1);
end;
local teste = "1d20+";

teste = teste .. (tonumber(pericias[indice].totalPericia) or 0);
rolar(teste, "Teste de " .. lista[indice] .. " de " .. (personagem.nome or "Nome"));