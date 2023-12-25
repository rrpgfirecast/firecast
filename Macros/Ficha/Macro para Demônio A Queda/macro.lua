local indice = tonumber(arg[1]);
local dificuldade1 = tonumber(arg[2]);
local bonus = tonumber(arg[3]);
local nome = parametro;
local texto = "";

local filter = arg[#arg] or "mine";

local personagem = sheet;
if filter == "all" or filter == "pc" or filter == "pcOnline" or filter=="npc" or filter=="mine" then
  if filter=="mine"then
    personagem = getCharacterSheet(chooseCharacterOfPlayer("Qual personagem deseja usar para o teste?", myPlayer, true));
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

local rolagem = ndb.getChildNodes(personagem.campoDosItens);

local lista = {};
for i=1, #rolagem, 1 do
  lista[i] = rolagem[i].campoTitulo .. " + " .. rolagem[i].campoTitulo2;
  if utils.compareStringPtBr(lista[i], nome) == 0 then
    indice = i;
  end
end;

if indice == nil or indice < 1 or indice > #rolagem then
  indice, texto = choose("Que teste deseja fazer?", lista, 1);
end;

if dificuldade == nil then
	dificuldade = tonumber(inputQuery("Qual a dificuldade?: ", 6));
end

if bonus == nil then
	bonus = tonumber(inputQuery("Bônus ou Penalidade?: ", 0));
end

local nome = (rolagem[indice].campoTitulo) .. " + " .. (rolagem[indice].campoTitulo2)

local qtd = math.floor(tonumber((rolagem[indice].RolP or 0) + (rolagem[indice].RolS or 0)));

local quantidade = math.floor(tonumber(qtd + (bonus or 0)))

local teste = quantidade .. "d10"

local resultado = rolar(teste .. ">" .. dificuldade, nome)
