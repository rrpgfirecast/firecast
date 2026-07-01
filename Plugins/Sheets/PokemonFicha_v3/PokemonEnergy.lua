local PokemonEnergy = {};

local rrpg = require("rrpg.lua");
local ndb = require("ndb.lua");
local dialogs = require("dialogs.lua");
local PokemonTokenSync = require("PokemonTokenSync.lua");

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

function PokemonEnergy.parse(value)
    local text = trim(value);
    if text == nil or text == "" then return 0; end;

    text = string.gsub(text, ",", ".");

    local numberText = string.match(text, "[-+]?%d+%.?%d*");
    local number = tonumber(numberText);

    if number == nil or number < 0 then return 0; end;
    return math.floor(number);
end;

function PokemonEnergy.costLabel(value)
    local cost = PokemonEnergy.parse(value);
    if cost <= 0 then return ""; end;
    return tostring(cost) .. " PE";
end;

local function parentOf(node)
    if node == nil then return nil; end;

    if ndb ~= nil and ndb.getParent ~= nil then
        local ok, parent = pcall(ndb.getParent, node);
        if ok then return parent; end;
    end;

    if NDB ~= nil and NDB.getParent ~= nil then
        local ok, parent = pcall(NDB.getParent, node);
        if ok then return parent; end;
    end;

    return nil;
end;

function PokemonEnergy.rootSheet(node)
    local current = node;
    local last = node;

    for i = 1, 10 do
        if current == nil then break; end;

        if current.nomePokemon ~= nil or
           current.vidaBase ~= nil or
           current.peMaximo ~= nil or
           current.typeSelectionOrder ~= nil then
            return current;
        end;

        last = current;
        local parent = parentOf(current);
        if parent == nil or parent == current then break; end;
        current = parent;
    end;

    return last;
end;

function PokemonEnergy.syncFirecast(root)
    if root == nil then return; end;

    local personagem = nil;

    if rrpg ~= nil and rrpg.getPersonagemDe ~= nil then
        local ok, result = pcall(rrpg.getPersonagemDe, root);
        if ok then personagem = result; end;
    end;

    if personagem == nil or personagem.asyncUpdate == nil then return; end;

    local peMaximo = PokemonEnergy.parse(root.peMaximo);
    local peAtualTexto = trim(root.peAtual);
    local peAtual = PokemonEnergy.parse(root.peAtual);

    if peMaximo <= 0 then peMaximo = peAtual; end;
    if (peAtualTexto == nil or peAtualTexto == "") and peMaximo > 0 then peAtual = peMaximo; end;
    pcall(function()
        personagem:asyncUpdate({
            bar1Val = peAtual,
            bar1Max = peMaximo
        });
    end);

    PokemonTokenSync.syncTokenBars(root, false);
end;

function PokemonEnergy.pay(root, costValue, label)
    local cost = PokemonEnergy.parse(costValue);
    if cost <= 0 then return true; end;

    if root == nil then
        dialogs.alert("Não encontrei a ficha principal para descontar Pontos de Energia.");
        return false;
    end;

    local peMaximo = PokemonEnergy.parse(root.peMaximo);
    local peAtualTexto = trim(root.peAtual);
    local peAtual = PokemonEnergy.parse(root.peAtual);

    if (peAtualTexto == nil or peAtualTexto == "") and peMaximo > 0 then
        peAtual = peMaximo;
    end;

    if peAtual < cost then
        local name = trim(label) or "esta ação";
        dialogs.alert("Pontos de Energia insuficientes para " .. name .. ".\n\nAtual: " .. tostring(peAtual) .. " PE\nCusto: " .. tostring(cost) .. " PE");
        return false;
    end;

    root.peAtual = tostring(peAtual - cost);
    PokemonEnergy.syncFirecast(root);
    return true;
end;

return PokemonEnergy;
