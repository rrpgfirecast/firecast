local Monitor = {};

local DICE = {
    {key="D4", sides=4},
    {key="D6", sides=6},
    {key="D8", sides=8},
    {key="D10", sides=10},
    {key="D20", sides=20},
    {key="D100", sides=100}
};

local SUPPORTED = {
    [4]="D4",
    [6]="D6",
    [8]="D8",
    [10]="D10",
    [20]="D20",
    [100]="D100"
};

local PROFILES = {
    atual={field="Atual", label="Sessão atual"},
    anterior={field="Anterior", label="Sessão anterior"},
    campanha={field="Campanha", label="Campanha inteira"}
};

local PROFILE_ORDER = {"atual", "anterior", "campanha"};

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function parseNumber(value)
    return tonumber(trim(value) or "0") or 0;
end;

local function parentOf(node)
    local ok, parent;

    if ndb ~= nil and ndb.getParent ~= nil then
        ok, parent = pcall(ndb.getParent, node);
        if ok then return parent; end;
    end;

    if NDB ~= nil and NDB.getParent ~= nil then
        ok, parent = pcall(NDB.getParent, node);
        if ok then return parent; end;
    end;

    return nil;
end;

local function rootSheet(node)
    local current = node;
    local last = node;

    for i = 1, 8 do
        if current == nil then break; end;

        if current.nomePokemon ~= nil or
           current.vidaBase ~= nil or
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

local function statField(profileKey, dieKey, metric)
    local profile = PROFILES[profileKey] or PROFILES.atual;
    return "azar" .. profile.field .. dieKey .. metric;
end;

local function eventsField(profileKey)
    local profile = PROFILES[profileKey] or PROFILES.atual;
    return "azar" .. profile.field .. "Eventos";
end;

local function getStat(root, profileKey, dieKey, metric)
    return parseNumber(root[statField(profileKey, dieKey, metric)]);
end;

local function setStat(root, profileKey, dieKey, metric, value)
    root[statField(profileKey, dieKey, metric)] = tostring(value or 0);
end;

local function incStat(root, profileKey, dieKey, metric, amount)
    setStat(root, profileKey, dieKey, metric, getStat(root, profileKey, dieKey, metric) + (amount or 1));
end;

local function splitLines(value)
    local lines = {};
    local text = tostring(value or "");

    for line in string.gmatch(text, "([^\n]+)") do
        local cleaned = trim(line);
        if cleaned ~= nil and cleaned ~= "" then
            table.insert(lines, cleaned);
        end;
    end;

    return lines;
end;

local function appendEvent(root, profileKey, text)
    local field = eventsField(profileKey);
    local lines = splitLines(root[field]);

    table.insert(lines, 1, text);

    while #lines > 20 do
        table.remove(lines);
    end;

    root[field] = table.concat(lines, "\n");
end;

local function totalFor(root, profileKey)
    local total = 0;
    local crit1 = 0;
    local max = 0;

    for _, die in ipairs(DICE) do
        total = total + getStat(root, profileKey, die.key, "Total");
        crit1 = crit1 + getStat(root, profileKey, die.key, "Crit1");
        max = max + getStat(root, profileKey, die.key, "Max");
    end;

    return total, crit1, max;
end;

local function saldoText(saldo)
    if saldo > 0 then
        return "+" .. tostring(saldo) .. " Sorte";
    elseif saldo < 0 then
        return tostring(saldo) .. " Azar";
    end;

    return "0 Equilíbrio";
end;

local function diagnostic(saldo)
    if saldo <= -8 then
        return "A mesa está cobrando juros.";
    elseif saldo <= -4 then
        return "A sorte está evitando contato visual.";
    elseif saldo <= -1 then
        return "A sorte está desconfiada de você.";
    elseif saldo == 0 then
        return "O caos está estatisticamente educado.";
    elseif saldo >= 8 then
        return "Isso já parece suborno cósmico.";
    elseif saldo >= 4 then
        return "O universo está fingindo que gosta de você.";
    end;

    return "A sorte piscou primeiro.";
end;

local function chaosBar(saldo)
    local clamped = saldo;
    if clamped < -10 then clamped = -10; end;
    if clamped > 10 then clamped = 10; end;

    local parts = {};
    for i = -10, 10 do
        if i == clamped then
            table.insert(parts, "◆");
        elseif i == 0 then
            table.insert(parts, "◇");
        else
            table.insert(parts, "─");
        end;
    end;

    return "💀 ◄" .. table.concat(parts, "") .. "► 🍀";
end;

local function currentProfile(root)
    local profile = trim(root.azarPerfilSelecionado);
    if PROFILES[profile] == nil then
        profile = "atual";
        root.azarPerfilSelecionado = profile;
    end;

    return profile;
end;

function Monitor.ensure(root)
    if root == nil then return nil; end;

    root.azarPerfilSelecionado = root.azarPerfilSelecionado or "atual";

    for profileKey, _ in pairs(PROFILES) do
        root[eventsField(profileKey)] = root[eventsField(profileKey)] or "";

        for _, die in ipairs(DICE) do
            root[statField(profileKey, die.key, "Total")] = root[statField(profileKey, die.key, "Total")] or "0";
            root[statField(profileKey, die.key, "Crit1")] = root[statField(profileKey, die.key, "Crit1")] or "0";
            root[statField(profileKey, die.key, "Max")] = root[statField(profileKey, die.key, "Max")] or "0";
        end;
    end;

    return root;
end;

function Monitor.refresh(node)
    local root = Monitor.ensure(rootSheet(node));
    if root == nil then return; end;

    local profileKey = currentProfile(root);
    local profile = PROFILES[profileKey];
    local total, crit1, max = totalFor(root, profileKey);
    local saldo = max - crit1;

    root.azarPerfilTexto = profile.label;

    if total <= 0 then
        root.azarResumoLinha = profile.label .. " · nenhum dado monitorado ainda.";
        root.azarSaldoLinha = "Balança do Caos: aguardando o primeiro desastre.";
        root.azarBarraCaos = chaosBar(0);
        root.azarDiagnostico = "A caixa-preta aguarda.";
    else
        root.azarResumoLinha = profile.label .. " · 🎲 " .. tostring(total) .. " dados · 💀 " .. tostring(crit1) .. " críticos 1 · 🍀 " .. tostring(max) .. " máximos";
        root.azarSaldoLinha = "Balança do Caos: " .. saldoText(saldo);
        root.azarBarraCaos = chaosBar(saldo);
        root.azarDiagnostico = "Diagnóstico: " .. diagnostic(saldo);
    end;

    root.azarPopupResumo = "Perfil: " .. profile.label ..
                           "\nDados rolados: " .. tostring(total) ..
                           "\nCríticos 1: " .. tostring(crit1) ..
                           "\nMáximos: " .. tostring(max) ..
                           "\nSaldo: " .. saldoText(saldo) ..
                           "\nDiagnóstico: " .. diagnostic(saldo);

    for _, die in ipairs(DICE) do
        root["azarDetalhe" .. die.key] = die.key ..
            "    Rolados: " .. tostring(getStat(root, profileKey, die.key, "Total")) ..
            "    1: " .. tostring(getStat(root, profileKey, die.key, "Crit1")) ..
            "    Max: " .. tostring(getStat(root, profileKey, die.key, "Max"));
    end;

    local events = trim(root[eventsField(profileKey)]);
    if events == nil or events == "" then
        root.azarEventosPerfil = "Nenhum evento crítico registrado.";
    else
        root.azarEventosPerfil = events;
    end;
end;

function Monitor.cycleProfile(node)
    local root = Monitor.ensure(rootSheet(node));
    if root == nil then return; end;

    local current = currentProfile(root);
    local nextIndex = 1;

    for i, value in ipairs(PROFILE_ORDER) do
        if value == current then
            nextIndex = i + 1;
            break;
        end;
    end;

    if nextIndex > #PROFILE_ORDER then
        nextIndex = 1;
    end;

    root.azarPerfilSelecionado = PROFILE_ORDER[nextIndex];
    Monitor.refresh(root);
end;

function Monitor.resetCurrent(node)
    local root = Monitor.ensure(rootSheet(node));
    if root == nil then return; end;

    root[eventsField("atual")] = "";
    for _, die in ipairs(DICE) do
        setStat(root, "atual", die.key, "Total", 0);
        setStat(root, "atual", die.key, "Crit1", 0);
        setStat(root, "atual", die.key, "Max", 0);
    end;

    Monitor.refresh(root);
end;

function Monitor.archiveCurrent(node)
    local root = Monitor.ensure(rootSheet(node));
    if root == nil then return; end;

    root[eventsField("anterior")] = root[eventsField("atual")] or "";

    for _, die in ipairs(DICE) do
        setStat(root, "anterior", die.key, "Total", getStat(root, "atual", die.key, "Total"));
        setStat(root, "anterior", die.key, "Crit1", getStat(root, "atual", die.key, "Crit1"));
        setStat(root, "anterior", die.key, "Max", getStat(root, "atual", die.key, "Max"));
    end;

    Monitor.resetCurrent(root);
    root.azarPerfilSelecionado = "atual";
    Monitor.refresh(root);
end;

function Monitor.recordBatch(node, rolls, origin)
    local root = Monitor.ensure(rootSheet(node));
    if root == nil or rolls == nil then return; end;

    local source = trim(origin) or "Rolagem";
    local changed = false;

    for _, roll in ipairs(rolls) do
        local sides = tonumber(roll.sides or roll.face);
        local result = tonumber(roll.result);
        local dieKey = SUPPORTED[sides];

        if dieKey ~= nil and result ~= nil then
            changed = true;

            incStat(root, "atual", dieKey, "Total", 1);
            incStat(root, "campanha", dieKey, "Total", 1);

            if result == 1 then
                incStat(root, "atual", dieKey, "Crit1", 1);
                incStat(root, "campanha", dieKey, "Crit1", 1);
                appendEvent(root, "atual", "💀 " .. dieKey .. " saiu 1 em " .. source);
                appendEvent(root, "campanha", "💀 " .. dieKey .. " saiu 1 em " .. source);
            elseif result == sides then
                incStat(root, "atual", dieKey, "Max", 1);
                incStat(root, "campanha", dieKey, "Max", 1);
                appendEvent(root, "atual", "🍀 " .. dieKey .. " saiu " .. tostring(result) .. " em " .. source);
                appendEvent(root, "campanha", "🍀 " .. dieKey .. " saiu " .. tostring(result) .. " em " .. source);
            end;
        end;
    end;

    if changed then
        Monitor.refresh(root);
    end;
end;

function Monitor.recordDie(node, sides, result, origin)
    Monitor.recordBatch(node, {{sides=sides, result=result}}, origin);
end;

function Monitor.recordRoll(node, formula, origin, rollObject)
    local rolls = {};

    if rollObject ~= nil and rollObject.ops ~= nil then
        for _, op in ipairs(rollObject.ops) do
            if op.tipo == "dado" and tonumber(op.face) ~= nil and op.resultados ~= nil then
                for _, result in ipairs(op.resultados) do
                    table.insert(rolls, {sides=tonumber(op.face), result=tonumber(result)});
                end;
            end;
        end;
    end;

    Monitor.recordBatch(node, rolls, origin or formula);
end;

local function markedRoll(value, sides)
    if value == 1 then
        return "1!";
    elseif value == sides then
        return tostring(value) .. "*";
    end;

    return tostring(value);
end;

function Monitor.rollSaiZika(node)
    local root = Monitor.ensure(rootSheet(node));
    if root == nil then return nil, 0; end;

    local diceSets = {
        {label="D4", sides=4, count=20},
        {label="D6", sides=6, count=20},
        {label="D8", sides=8, count=20},
        {label="D10", sides=10, count=20},
        {label="D12", sides=12, count=20},
        {label="D20", sides=20, count=20}
    };

    local totalSum = 0;
    local physicalCount = 0;
    local oneCount = 0;
    local maxCount = 0;
    local physicalSum = 0;
    local groupLines = {};
    local luckRolls = {};
    local formula = "20d4 + 20d6 + 20d8 + 20d10 + 20d12 + 20d20";

    for _, cfg in ipairs(diceSets) do
        local parts = {};

        for i = 1, cfg.count do
            local result = math.random(1, cfg.sides);

            physicalCount = physicalCount + 1;
            totalSum = totalSum + result;
            physicalSum = physicalSum + result;

            if result == 1 then
                oneCount = oneCount + 1;
            end;

            if result == cfg.sides then
                maxCount = maxCount + 1;
            end;

            table.insert(luckRolls, {sides=cfg.sides, result=result});
            table.insert(parts, markedRoll(result, cfg.sides));
        end;

        table.insert(groupLines, cfg.label .. " [ " .. table.concat(parts, ", ") .. " ]");
    end;

    local average = 0;
    if physicalCount > 0 then
        average = physicalSum / physicalCount;
    end;

    local sumFeedback = string.format("Soma na media (%d)", totalSum);
    if totalSum <= 600 then
        sumFeedback = string.format("Soma baixa (%d). Sai zika!", totalSum);
    elseif totalSum >= 720 then
        sumFeedback = string.format("Soma alta (%d). Zika expulsa!", totalSum);
    end;

    local maxFeedback = string.format("Maximos na media (%d)", maxCount);
    if maxCount <= 10 then
        maxFeedback = string.format("Poucos maximos (%d)", maxCount);
    elseif maxCount >= 22 then
        maxFeedback = string.format("Chuva de maximos (%d)!", maxCount);
    end;

    local oneFeedback = string.format("1s na media (%d).", oneCount);
    if oneCount >= 22 then
        oneFeedback = string.format("muitos 1s (%d)... Azar!", oneCount);
    elseif oneCount <= 10 then
        oneFeedback = string.format("poucos 1s (%d)! Sorte!", oneCount);
    end;

    local estimates =
        "Estimativas (Soma | Dados | 'Uns' | 'Maximos'):\n" ..
        "Azar: ~600 ou menos | 120 | ~22+ | ~10-\n" ..
        "Media: 660 | 120 | ~15-16 | ~15-16\n" ..
        "Sorte: ~720+ | 120 | ~10- | ~22+";

    local msg = string.format(
        "%s\n\n" ..
        "🧿 SAI ZIKA - %s\n" ..
        "%s\n" ..
        "Soma Total: %d | Media Dados Fisicos: %.2f\n" ..
        "(%d dados fisicos rolados no total)\n" ..
        "%s | %s | %s\n" ..
        "Legenda: 1! = azar | * = valor maximo",
        estimates,
        formula,
        table.concat(groupLines, "\n"),
        totalSum,
        average,
        physicalCount,
        sumFeedback, maxFeedback, oneFeedback
    );

    root.azarSaiZikaResultado = msg;
    root.azarSaiZikaResumo = "Ultimo SAI ZIKA: " .. tostring(totalSum) .. " | 1s: " .. tostring(oneCount) .. " | Max: " .. tostring(maxCount);

    Monitor.recordBatch(root, luckRolls, "🧿 SAI ZIKA");
    Monitor.refresh(root);

    return msg, totalSum;
end;

return Monitor;
