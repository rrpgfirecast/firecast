local PokemonRollFormula = {};

local PokemonAttributeAdjustments = require("PokemonAttributeAdjustments.lua");

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function hasDice(formula)
    if formula == nil then return false; end;
    return string.match(formula, "[%d]*[dD]%d+") ~= nil;
end;

local function cleanExpression(value)
    local cleaned = trim(value);
    if cleaned == nil or cleaned == "" then return "0"; end;

    cleaned = string.gsub(cleaned, "[%(%)]", "");
    cleaned = trim(cleaned);

    if cleaned == nil or cleaned == "" then return "0"; end;
    return cleaned;
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

local attributeSources = {
    vida={base="vidaBase", mod="vidaMod"},
    poder={base="poderBase", mod="poderMod"},
    forca={base="forcaBase", mod="forcaMod"},
    resistencia={base="resistenciaBase", mod="resistenciaMod"},
    defesa={base="defesaBase", mod="defesaMod"},
    velocidade={base="velocidadeBase", mod="velocidadeMod"},
    precisao={value="precisaoValor"},
    protecao={value="protecaoValor"},
    efeito={value="efeitoValor"},
    tenacidade={value="tenacidadeValor"},
    astucia={value="astuciaValor"},
    fisico={value="fisicoValor"},
    mental={value="mentalValor"},
    natural={value="naturalValor"},
    social={value="socialValor"},
    tecnico={value="tecnicoValor"}
};

local attributeAliases = {
    vida="vida", vid="vida", vi="vida",
    poder="poder", pod="poder", po="poder",
    forca="forca", forc="forca", ["for"]="forca", fo="forca",
    resistencia="resistencia", res="resistencia",
    defesa="defesa", def="defesa", de="defesa",
    velocidade="velocidade", vel="velocidade",
    precisao="precisao", pre="precisao",
    protecao="protecao", prot="protecao", pro="protecao",
    efeito="efeito", efe="efeito",
    tenacidade="tenacidade", ten="tenacidade",
    astucia="astucia", ast="astucia",
    fisico="fisico", fis="fisico",
    mental="mental", men="mental",
    natural="natural", nat="natural",
    social="social", soc="social",
    tecnico="tecnico", tec="tecnico"
};

local function normalizeToken(token)
    local normalized = string.lower(tostring(token or ""));

    normalized = string.gsub(normalized, "á", "a");
    normalized = string.gsub(normalized, "à", "a");
    normalized = string.gsub(normalized, "â", "a");
    normalized = string.gsub(normalized, "ã", "a");
    normalized = string.gsub(normalized, "é", "e");
    normalized = string.gsub(normalized, "ê", "e");
    normalized = string.gsub(normalized, "í", "i");
    normalized = string.gsub(normalized, "ó", "o");
    normalized = string.gsub(normalized, "ô", "o");
    normalized = string.gsub(normalized, "õ", "o");
    normalized = string.gsub(normalized, "ú", "u");
    normalized = string.gsub(normalized, "ç", "c");

    return normalized;
end;

local function isTokenChar(char)
    local byte = string.byte(char);

    return (byte >= 48 and byte <= 57) or
           (byte >= 65 and byte <= 90) or
           (byte >= 97 and byte <= 122) or
           byte == 95 or
           byte >= 128;
end;

local function fieldExpression(root, fieldName)
    if root == nil then return "0"; end;
    return cleanExpression(root[fieldName]);
end;

function PokemonRollFormula.attributeExpression(root, key)
    local source = attributeSources[key];
    if source == nil then return "0"; end;

    local expression;

    if source.value ~= nil then
        expression = fieldExpression(root, source.value);
    else
        expression = joinTerms(fieldExpression(root, source.base), fieldExpression(root, source.mod));
    end;

    return PokemonAttributeAdjustments.expressionFor(root, key, expression);
end;

local function resolveToken(root, token)
    local key = attributeAliases[normalizeToken(token)];

    if key ~= nil then
        return PokemonRollFormula.attributeExpression(root, key);
    end;

    return token;
end;

function PokemonRollFormula.resolve(root, formula)
    if formula == nil then return formula; end;

    local text = tostring(formula);
    local parts = {};
    local token = "";

    for i = 1, string.len(text) do
        local char = string.sub(text, i, i);

        if isTokenChar(char) then
            token = token .. char;
        else
            if token ~= "" then
                table.insert(parts, resolveToken(root, token));
                token = "";
            end;

            table.insert(parts, char);
        end;
    end;

    if token ~= "" then
        table.insert(parts, resolveToken(root, token));
    end;

    return table.concat(parts);
end;

function PokemonRollFormula.normalize(root, formula)
    local normalized = trim(PokemonRollFormula.resolve(root, formula));

    if normalized == nil or normalized == "" then
        return nil;
    end;

    if not hasDice(normalized) then
        if string.sub(normalized, 1, 1) == "-" then
            normalized = "1d20 " .. normalized;
        else
            normalized = "1d20 + " .. normalized;
        end;
    end;

    return normalized;
end;

function PokemonRollFormula.join(left, right)
    return joinTerms(left, right);
end;

function PokemonRollFormula.trim(value)
    return trim(value);
end;

return PokemonRollFormula;
