local ExplodingRolls = {};

local DIE_SCALE = {4, 6, 8, 10, 12, 20};

local DEFAULT_CHAT_COLOR = {
    normal = 7,
    character = 0,
    important = 14,
    body = 11,
    mind = 13,
    charm = 14,
    talent = 13,
    cutieMark = 10,
    die = 11,
    result = 10,
    explosion = 12
};

local CHAT_PALETTES = {
    colorido = DEFAULT_CHAT_COLOR,
    epico = {
        normal = 7,
        character = 0,
        important = 14,
        body = 11,
        mind = 13,
        charm = 14,
        talent = 13,
        cutieMark = 10,
        die = 15,
        result = 10,
        explosion = 12
    },
    minimal = {
        normal = 7,
        character = 0,
        important = 14,
        body = 11,
        mind = 13,
        charm = 14,
        talent = 13,
        cutieMark = 10,
        die = 7,
        result = 15,
        explosion = 12
    }
};

local function colorsFor(options)
    local paletteName = options ~= nil and (options.palette or options.rollPalette) or "colorido";
    return CHAT_PALETTES[paletteName] or DEFAULT_CHAT_COLOR;
end;

local function paint(colors, colorName, text)
    local color = colors[colorName] or colors.normal or 7;
    local normal = colors.normal or 7;
    return "[§K" .. color .. "]" .. tostring(text or "") .. "[§K" .. normal .. "]";
end;

local function displayNumber(value)
    local numericValue = tonumber(value) or 0;
    if numericValue == math.floor(numericValue) then
        return tostring(math.floor(numericValue));
    end;
    return tostring(numericValue);
end;

local function labelColor(colors, label)
    local normalized = string.lower(tostring(label or ""));

    if string.find(normalized, "cutie mark", 1, true) == 1 then
        return "cutieMark";
    elseif normalized == "corpo" or string.find(normalized, "corpo de ", 1, true) == 1 then
        return "body";
    elseif normalized == "mente" or string.find(normalized, "mente de ", 1, true) == 1 then
        return "mind";
    elseif normalized == "charme" or string.find(normalized, "charme de ", 1, true) == 1 then
        return "charm";
    end;

    return "talent";
end;

local function coloredTitle(colors, title)
    local text = tostring(title or "Teste");
    local left, right = string.match(text, "^(.-) %+ (.+)$");

    if left ~= nil and right ~= nil then
        return paint(colors, labelColor(colors, left), left)
            .. " " .. paint(colors, "normal", "+") .. " "
            .. paint(colors, labelColor(colors, right), right);
    end;

    return paint(colors, labelColor(colors, text), text);
end;

local function normalizeSides(sides)
    local numericSides = tonumber(sides) or 4;
    for _, value in ipairs(DIE_SCALE) do
        if value == numericSides then return value; end;
    end;
    return 4;
end;

local function nextDie(sides)
    for index, value in ipairs(DIE_SCALE) do
        if value == sides then return DIE_SCALE[index + 1]; end;
    end;
    return nil;
end;

local function extractValue(result)
    local best = nil;
    if result ~= nil then
        for _, operation in ipairs(result.ops or {}) do
            if operation.tipo == "dado" then
                for _, value in ipairs(operation.resultados or {}) do
                    local numericValue = tonumber(value);
                    if numericValue ~= nil and (best == nil or numericValue > best) then
                        best = numericValue;
                    end;
                end;
            end;
        end;
        if best == nil then best = tonumber(result.resultado); end;
    end;
    return best or 0;
end;

local function chainText(colors, chain, options)
    local parts = {};
    for index, die in ipairs(chain.results) do
        local didExplode = die.value == die.sides and index < #chain.results;
        local resultColor = didExplode and "explosion" or "result";

        parts[#parts + 1] = paint(colors, "die", "D" .. die.sides)
            .. " " .. paint(colors, resultColor, "[" .. displayNumber(die.value) .. "]");
    end;

    local text = paint(colors, "normal", "◆")
        .. " " .. paint(colors, labelColor(colors, chain.label), chain.label)
        .. paint(colors, "normal", ": ")
        .. table.concat(parts, paint(colors, "normal", "  →  "));

    if #chain.results > 1 and (options == nil or options.showExplosions ~= false) then
        text = text .. "  " .. paint(colors, "explosion", "✦ EXPLODIU");
    end;

    return text;
end;

local function sendSummary(room, title, characterName, chains, callback, options)
    local colors = colorsFor(options);
    local best = 0;
    local lines = {paint(colors, "important", "✦ TÉCNICA DO CASCO EXPLOSIVO ✦")};

    if characterName ~= nil and characterName ~= "" then
        lines[#lines + 1] = paint(colors, "character", characterName)
            .. " " .. paint(colors, "normal", "•") .. " "
            .. coloredTitle(colors, title);
    else
        lines[#lines + 1] = coloredTitle(colors, title);
    end;

    for _, chain in ipairs(chains) do
        if options == nil or options.showDetails ~= false then
            lines[#lines + 1] = chainText(colors, chain, options);
        end;
        for _, die in ipairs(chain.results) do
            if die.value > best then best = die.value; end;
        end;
    end;

    if options ~= nil and options.bestFullGold == true then
        lines[#lines + 1] = paint(colors, "important", "★ MELHOR RESULTADO: "
            .. displayNumber(best));
    else
        lines[#lines + 1] = paint(colors, "normal", "★ MELHOR RESULTADO: ")
            .. paint(colors, "important", displayNumber(best));
    end;

    local message = table.concat(lines, "\n");
    if room.chat.asyncSendStd ~= nil then
        room.chat:asyncSendStd(message, {
            talemarkOptions = {
                defaultTextStyle = {color="#AEB4C2", bold=false}
            }
        });
    else
        room.chat:enviarMensagem(message);
    end;

    if callback ~= nil then callback(best, chains); end;
end;

local function rollChain(room, chain, sides, onFinished)
    local currentSides = normalizeSides(sides);
    local isExplosion = #chain.results > 0;
    local title;

    if isExplosion then
        local previous = chain.results[#chain.results];
        title = "✦ CASCO EXPLOSIVO • D" .. previous.sides .. " tirou " .. previous.value
            .. "! Rolando D" .. currentSides;
    else
        title = chain.label;
    end;

    room.chat:rolarDados(Firecast.interpretarRolagem("1d" .. currentSides), title, function(result)
        local value = extractValue(result);
        chain.results[#chain.results + 1] = {sides=currentSides, value=value};

        local higherDie = value == currentSides and nextDie(currentSides) or nil;
        if higherDie ~= nil then
            rollChain(room, chain, higherDie, onFinished);
        else
            onFinished();
        end;
    end);
end;

function ExplodingRolls.rollSingle(room, sides, title, characterName, callback)
    local options = nil;
    if type(callback) == "table" then
        options = callback;
        callback = nil;
    end;
    local chain = {label=title or "Teste", results={}};
    rollChain(room, chain, sides, function()
        sendSummary(room, title or "Teste", characterName, {chain}, callback, options);
    end);
end;

function ExplodingRolls.rollSingleEx(room, sides, title, characterName, options, callback)
    local chain = {label=title or "Teste", results={}};
    rollChain(room, chain, sides, function()
        sendSummary(room, title or "Teste", characterName, {chain}, callback, options);
    end);
end;

function ExplodingRolls.rollBestOf(room, rolls, title, characterName, callback)
    local options = nil;
    if type(callback) == "table" then
        options = callback;
        callback = nil;
    end;
    local chains = {};
    for _, roll in ipairs(rolls or {}) do
        chains[#chains + 1] = {
            label=roll.label or "Dado",
            results={},
            sides=normalizeSides(roll.sides)
        };
    end;

    if #chains == 0 then return; end;

    local function rollAt(index)
        local chain = chains[index];
        if chain == nil then
            sendSummary(room, title or "Teste combinado", characterName, chains, callback, options);
            return;
        end;
        rollChain(room, chain, chain.sides, function()
            rollAt(index + 1);
        end);
    end;

    rollAt(1);
end;

function ExplodingRolls.rollBestOfEx(room, rolls, title, characterName, options, callback)
    local chains = {};
    for _, roll in ipairs(rolls or {}) do
        chains[#chains + 1] = {
            label=roll.label or "Dado",
            results={},
            sides=normalizeSides(roll.sides)
        };
    end;

    if #chains == 0 then return; end;

    local function rollAt(index)
        local chain = chains[index];
        if chain == nil then
            sendSummary(room, title or "Teste combinado", characterName, chains, callback, options);
            return;
        end;
        rollChain(room, chain, chain.sides, function()
            rollAt(index + 1);
        end);
    end;

    rollAt(1);
end;

return ExplodingRolls;
