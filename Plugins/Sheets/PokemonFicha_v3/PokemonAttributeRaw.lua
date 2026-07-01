local AttributeRaw = {};

local PokemonChat = require("PokemonChat.lua");
local AttributeAdjustments = require("PokemonAttributeAdjustments.lua");

local ATTRIBUTES = {
    {key="vida", label="Vida", base="vidaBase", mod="vidaMod"},
    {key="poder", label="Poder", base="poderBase", mod="poderMod"},
    {key="forca", label="Força", base="forcaBase", mod="forcaMod"},
    {key="resistencia", label="Resistência", base="resistenciaBase", mod="resistenciaMod"},
    {key="defesa", label="Defesa", base="defesaBase", mod="defesaMod"},
    {key="velocidade", label="Velocidade", base="velocidadeBase", mod="velocidadeMod"},
    {key="precisao", label="Precisão", value="precisaoValor"},
    {key="protecao", label="Proteção", value="protecaoValor"},
    {key="efeito", label="Efeito", value="efeitoValor"},
    {key="tenacidade", label="Tenacidade", value="tenacidadeValor"},
    {key="astucia", label="Astúcia", value="astuciaValor"},
    {key="fisico", label="Físico", value="fisicoValor"},
    {key="mental", label="Mental", value="mentalValor"},
    {key="natural", label="Natural", value="naturalValor"},
    {key="social", label="Social", value="socialValor"},
    {key="tecnico", label="Técnico", value="tecnicoValor"}
};

local BY_KEY = {};

for _, attr in ipairs(ATTRIBUTES) do
    BY_KEY[attr.key] = attr;
end;

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function cleanExpression(value)
    local text = trim(value);
    if text == nil or text == "" then return "0"; end;

    text = string.gsub(text, "[%(%)]", "");
    text = trim(text);

    if text == nil or text == "" then return "0"; end;
    return text;
end;

local function joinTerms(left, right)
    local first = cleanExpression(left);
    local second = cleanExpression(right);

    if first == "0" then return second; end;
    if second == "0" then return first; end;

    if string.match(second, "^[%+%-]") then
        return first .. " " .. second;
    end;

    return first .. " + " .. second;
end;

local function roomChat(root)
    if root == nil then return nil; end;

    local room = Firecast.getRoomOf(root);
    if room ~= nil then return room.chat; end;
    return nil;
end;

function AttributeRaw.attributes()
    return ATTRIBUTES;
end;

function AttributeRaw.label(key)
    local attr = BY_KEY[key];
    if attr ~= nil then return attr.label; end;
    return tostring(key or "");
end;

function AttributeRaw.modifiersEnabled(root)
    if root == nil then return true; end;

    local value = root.attrBrutoUsarModificadores;
    if value == nil or value == "" then return true; end;

    return value == true or value == 1 or value == "1" or value == "true";
end;

function AttributeRaw.expression(root, key, includeModifiers)
    local attr = BY_KEY[key];
    if root == nil or attr == nil then return "0"; end;

    local expression;
    if attr.value ~= nil then
        expression = cleanExpression(root[attr.value]);
    else
        expression = joinTerms(root[attr.base], root[attr.mod]);
    end;

    if includeModifiers ~= false then
        return AttributeAdjustments.expressionFor(root, key, expression);
    end;

    return expression;
end;

function AttributeRaw.roll(root, key, sourceTitle, accentColor, includeModifiers)
    if root == nil then return; end;

    local attr = BY_KEY[key];
    if includeModifiers == nil then
        includeModifiers = AttributeRaw.modifiersEnabled(root);
    else
        includeModifiers = includeModifiers == true;
    end;
    local expression = AttributeRaw.expression(root, key, includeModifiers);
    local formula = joinTerms("1d20", expression);
    local title = (trim(sourceTitle) or "ACERTAR") .. " · " .. AttributeRaw.label(key);
    local chat = roomChat(root);
    local breakdown = {
        adjustments=includeModifiers and AttributeAdjustments.detailsFor(root, key) or {}
    };

    if attr ~= nil and attr.value ~= nil then
        breakdown.value = cleanExpression(root[attr.value]);
    elseif attr ~= nil then
        breakdown.mod = cleanExpression(root[attr.mod]);
        breakdown.base = cleanExpression(root[attr.base]);
    end;

    if chat == nil then return; end;

    local chatDetails = root.attributeChatDetailsEnabled;
    local chatDetailsEnabled = chatDetails == nil or chatDetails == "" or
                               chatDetails == true or chatDetails == 1 or
                               chatDetails == "1" or chatDetails == "true";

    PokemonChat.roll(chat, formula, {
        title = title,
        rawFormula = formula,
        formula = formula,
        ownerSheet = root,
        accentColor = accentColor,
        attributeDetailsEnabled = includeModifiers and chatDetailsEnabled,
        attributeBreakdown = breakdown
    });
end;return AttributeRaw;
