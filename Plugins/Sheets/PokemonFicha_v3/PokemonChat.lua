local PokemonChat = {};
local PokemonLuckMonitor = require("PokemonLuckMonitor.lua");

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function firstFilled(...)
    local count = select("#", ...);

    for i = 1, count do
        local value = select(i, ...);
        local text = trim(value);

        if text ~= nil and text ~= "" then
            return text;
        end;
    end;

    return nil;
end;

local function asText(value)
    if value == nil then return nil; end;
    return tostring(value);
end;

-- Paleta do chat da ficha:
-- Texto comum: branco suave, para leitura em interface cinza escuro.
-- Texto secundário: azul acinzentado discreto, para entradas e notas.
-- Dado/resultado/prioridade: dourado, usado com parcimônia para chamar o olho.
-- Alerta/penalidade futura: vermelho, para dano, sangue, perigo, queimado etc.
-- Natureza/cura/positivo futuro: verde, para recuperação, natureza e bônus orgânicos.
-- Calma/técnico/controle futuro: azul, para efeitos controlados, mentais ou tecnologia.
local CHAT_COLORS = {
    text = "#F4F8FF",
    muted = "#8FA7BD",
    important = "#FFD700",
    danger = "#FF5A5A",
    nature = "#39FF14",
    calm = "#00BFFF"
};

local ACTION_PAD = "  ";

local function actionLine(text)
    return "*" .. ACTION_PAD .. text .. ACTION_PAD .. "*";
end;

function PokemonChat.talemarkOptions(context)
    context = context or {};

    local accentColor = firstFilled(context.accentColor, CHAT_COLORS.important);

    return {
        defaultTextStyle = {color = CHAT_COLORS.text},
        charActionTextStyle = {color = accentColor, bold = true},
        charQuotedSpeechTextStyle = {color = CHAT_COLORS.text},
        outOfCharTextStyle = {color = CHAT_COLORS.muted, italic = true},
        parseCharActions = true,
        parseCharQuotedSpeech = true,
        parseCommonMarkStrongEmphasis = true,
        parseHorzLines = true,
        parseOutOfChar = true,
        parseSmileys = true,
        trimTexts = false
    };
end;

function PokemonChat.buildRollTitle(context)
    context = context or {};

    local title = firstFilled(context.title, "Rolagem");
    return actionLine("🎲 " .. title);
end;

local CHAT_MARKUP = {
    normal = "[§K1]",
    structure = "[§K14]",
    technical = "[§K10]",
    positive = "[§K9]",
    negative = "[§K5]",
    result = "[§K8]"
};

local function buildAttributeDetails(context, resultText)
    if context.attributeDetailsEnabled ~= true then return nil; end;

    local breakdown = context.attributeBreakdown;
    if breakdown == nil then return nil; end;

    local lines = {};
    local structure = CHAT_MARKUP.structure;
    local normal = CHAT_MARKUP.normal;
    local technical = CHAT_MARKUP.technical;

    if breakdown.value ~= nil then
        table.insert(lines, structure .. "┌─ ⚙ " .. technical .. "VALOR " .. tostring(breakdown.value) .. normal);
    else
        table.insert(lines,
            structure .. "┌─ ⚙ " ..
            technical .. "MOD " .. tostring(breakdown.mod or "0") ..
            structure .. " + " ..
            technical .. "BASE " .. tostring(breakdown.base or "0") ..
            normal
        );
    end;

    for _, adjustment in ipairs(breakdown.adjustments or {}) do
        local valueColor = adjustment.penalty and CHAT_MARKUP.negative or CHAT_MARKUP.positive;
        local icon = adjustment.penalty and "⚠" or "✦";

        table.insert(lines,
            structure .. "├─ " .. icon .. " " ..
            normal .. tostring(adjustment.name or "Ajuste") .. ": " ..
            valueColor .. tostring(adjustment.value or "?") .. normal
        );
    end;

    table.insert(lines,
        structure .. "└─ 📊 " .. normal .. "RESULTADO FINAL · " ..
        CHAT_MARKUP.result .. (resultText or "?") .. normal
    );

    return table.concat(lines, "\n");
end;

function PokemonChat.buildRollDetails(context, result, roll)
    context = context or {};

    local title = firstFilled(context.title, "Rolagem");
    local resultText = firstFilled(asText(result));
    local attributeDetails = buildAttributeDetails(context, resultText);

    if attributeDetails ~= nil then
        return attributeDetails;
    end;

    local lines = {};
    table.insert(lines, actionLine("📊 " .. title .. " — RESULTADO FINAL: " .. (resultText or "?")));

    return table.concat(lines, "\n");
end;

function PokemonChat.sendDetails(chat, context, result, roll)
    if chat == nil then return; end;

    local message = PokemonChat.buildRollDetails(context, result, roll);
    local params = {talemarkOptions = PokemonChat.talemarkOptions(context)};

    if chat.asyncSendStd ~= nil then
        local ok = pcall(function()
            chat:asyncSendStd(message, params);
        end);

        if ok then
            return;
        end;
    end;

    if chat.enviarMensagem ~= nil then
        chat:enviarMensagem(message);
    end;
end;

function PokemonChat.roll(chat, formula, context)
    if chat == nil then return; end;

    context = context or {};
    context.formula = firstFilled(context.formula, formula);

    local title = PokemonChat.buildRollTitle(context);
    local params = {talemarkOptions = PokemonChat.talemarkOptions(context)};

    if chat.asyncRoll ~= nil then
        local ok = pcall(function()
            local promise = chat:asyncRoll(formula, title, params);

            if promise ~= nil and promise.thenDo ~= nil then
                promise:thenDo(function(resultNumber, rollObject)
                    PokemonLuckMonitor.recordRoll(context.ownerSheet, context.formula or formula, context.title, rollObject);
                    PokemonChat.sendDetails(chat, context, resultNumber, rollObject);

                    if context.onResult ~= nil then
                        pcall(context.onResult, resultNumber, rollObject);
                    end;
                end);
            end;
        end);

        if ok then
            return;
        end;
    end;

    chat:rolarDados(formula, title, function(roll)
        local result = nil;
        if roll ~= nil then
            result = roll.resultado;
        end;

        PokemonLuckMonitor.recordRoll(context.ownerSheet, context.formula or formula, context.title, roll);
        PokemonChat.sendDetails(chat, context, result, roll);

        if context.onResult ~= nil then
            pcall(context.onResult, result, roll);
        end;
    end);
end;

return PokemonChat;
