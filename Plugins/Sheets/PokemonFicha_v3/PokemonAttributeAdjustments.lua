local Adjustments = {};

local ndb = require("ndb.lua");
local EDITING_NODES = setmetatable({}, {__mode="k"});

local ATTRIBUTES = {
    {key="vida", label="Vida", group="NÚCLEO"},
    {key="poder", label="Poder", group="NÚCLEO"},
    {key="forca", label="Força", group="NÚCLEO"},
    {key="resistencia", label="Resistência", group="NÚCLEO"},
    {key="defesa", label="Defesa", group="NÚCLEO"},
    {key="velocidade", label="Velocidade", group="NÚCLEO"},
    {key="precisao", label="Precisão", group="COMBATE"},
    {key="protecao", label="Proteção", group="COMBATE"},
    {key="efeito", label="Efeito", group="COMBATE"},
    {key="tenacidade", label="Tenacidade", group="COMBATE"},
    {key="astucia", label="Astúcia", group="APTIDÕES"},
    {key="fisico", label="Físico", group="APTIDÕES"},
    {key="mental", label="Mental", group="APTIDÕES"},
    {key="natural", label="Natural", group="APTIDÕES"},
    {key="social", label="Social", group="APTIDÕES"},
    {key="tecnico", label="Técnico", group="APTIDÕES"}
};

local ATTRIBUTE_BY_KEY = {};

for _, attr in ipairs(ATTRIBUTES) do
    ATTRIBUTE_BY_KEY[attr.key] = attr;
end;

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function normalizeToken(value)
    local text = string.lower(tostring(value or ""));

    text = string.gsub(text, "á", "a");
    text = string.gsub(text, "à", "a");
    text = string.gsub(text, "â", "a");
    text = string.gsub(text, "ã", "a");
    text = string.gsub(text, "é", "e");
    text = string.gsub(text, "ê", "e");
    text = string.gsub(text, "í", "i");
    text = string.gsub(text, "ó", "o");
    text = string.gsub(text, "ô", "o");
    text = string.gsub(text, "õ", "o");
    text = string.gsub(text, "ú", "u");
    text = string.gsub(text, "ç", "c");

    return text;
end;

local function getParent(node)
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

local function getNodeName(node)
    if node == nil then return nil; end;

    if ndb ~= nil and ndb.getNodeName ~= nil then
        local ok, name = pcall(ndb.getNodeName, node);
        if ok then return name; end;
    end;

    if NDB ~= nil and NDB.getNodeName ~= nil then
        local ok, name = pcall(NDB.getNodeName, node);
        if ok then return name; end;
    end;

    return nil;
end;

local function childNodes(node)
    if node == nil then return {}; end;

    if ndb ~= nil and ndb.getChildNodes ~= nil then
        local ok, children = pcall(ndb.getChildNodes, node);
        if ok and children ~= nil then return children; end;
    end;

    if NDB ~= nil and NDB.getChildNodes ~= nil then
        local ok, children = pcall(NDB.getChildNodes, node);
        if ok and children ~= nil then return children; end;
    end;

    return {};
end;

local function isAdjustmentNode(node)
    if node == nil then return false; end;

    if getNodeName(node) == "ajustesAtributos" then
        return true;
    end;

    return node.ajusteNome ~= nil or
           node.ajusteValor ~= nil or
           node.ajusteAlvos ~= nil or
           node.ajusteObservacao ~= nil or
           node.ajusteAtivo ~= nil;
end;

local function truthy(value)
    if value == nil then return true; end;
    if value == false then return false; end;

    local text = normalizeToken(trim(value) or "");
    return text ~= "false" and text ~= "0" and text ~= "nao" and text ~= "não";
end;

local function cleanTargets(value)
    local selected = {};
    local seen = {};

    for token in string.gmatch(tostring(value or ""), "[^|,; ]+") do
        local key = normalizeToken(token);

        if ATTRIBUTE_BY_KEY[key] ~= nil and not seen[key] then
            table.insert(selected, key);
            seen[key] = true;
        end;
    end;

    return selected;
end;

local function cleanValue(value)
    local text = trim(value);
    if text == nil or text == "" then return nil; end;

    text = string.gsub(text, "%s+", "");
    text = string.gsub(text, "D", "d");

    if not string.match(text, "^[%+%-]?%d+$") and
       not string.match(text, "^[%+%-]?%d+d%d+$") then
        return nil;
    end;

    if not string.match(text, "^[%+%-]") then
        text = "+" .. text;
    end;

    return text;
end;

local function expressionTerm(value)
    local clean = cleanValue(value);
    if clean == nil then return nil; end;

    local sign = string.sub(clean, 1, 1);
    local body = string.sub(clean, 2);

    if sign == "-" then
        return "- " .. body;
    end;

    return "+ " .. body;
end;

local function appendTerm(expression, term)
    local base = trim(expression) or "0";
    local extra = trim(term);

    if extra == nil or extra == "" then
        return base;
    end;

    if base == "" or base == "0" then
        if string.sub(extra, 1, 1) == "+" then
            return trim(string.sub(extra, 2)) or "0";
        end;

        return "0 " .. extra;
    end;

    return base .. " " .. extra;
end;

local function cacheSafe(value)
    local text = tostring(value or "");
    text = string.gsub(text, "\t", " ");
    text = string.gsub(text, "\r", " ");
    text = string.gsub(text, "\n", " ");
    return trim(text) or "";
end;

local function newId()
    return "ajuste_" .. tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999));
end;

local function parseCache(root)
    local entries = {};
    local cache = tostring(root and root.ajustesAtributosCache or "");

    for line in string.gmatch(cache, "[^\r\n]+") do
        local id, name, value, targets, active = string.match(line, "^([^\t]*)\t([^\t]*)\t([^\t]*)\t([^\t]*)\t([^\t]*)$");

        if id ~= nil and id ~= "" then
            table.insert(entries, {
                id=id,
                name=name or "",
                value=value or "",
                targets=targets or "",
                active=active ~= "false"
            });
        end;
    end;

    return entries;
end;

local function serializeCache(entries)
    local lines = {};

    for _, entry in ipairs(entries or {}) do
        if entry.id ~= nil and entry.id ~= "" then
            table.insert(lines, table.concat({
                cacheSafe(entry.id),
                cacheSafe(entry.name),
                cacheSafe(entry.value),
                cacheSafe(entry.targets),
                entry.active == false and "false" or "true"
            }, "\t"));
        end;
    end;

    return table.concat(lines, "\n");
end;

local function cacheWasInitialized(root)
    local value = root and root.ajustesAtributosCacheInicializado;
    return value == true or value == 1 or value == "1" or value == "true";
end;

local function cacheEntries(root)
    local entries = parseCache(root);

    if #entries > 0 or cacheWasInitialized(root) then
        return entries;
    end;

    for _, node in ipairs(childNodes(root)) do
        if isAdjustmentNode(node) then
            local id = trim(node.ajusteId);
            if id == nil or id == "" then
                id = newId();
                node.ajusteId = id;
            end;

            table.insert(entries, {
                id=id,
                name=node.ajusteNome or "",
                value=node.ajusteValor or "",
                targets=node.ajusteAlvos or "",
                active=truthy(node.ajusteAtivo)
            });
        end;
    end;

    if root ~= nil and #entries > 0 then
        root.ajustesAtributosCache = serializeCache(entries);
        root.ajustesAtributosCacheInicializado = true;
    end;

    return entries;
end;

function Adjustments.attributes()
    return ATTRIBUTES;
end;

function Adjustments.attributeLabel(key)
    local attr = ATTRIBUTE_BY_KEY[normalizeToken(key)];
    if attr ~= nil then return attr.label; end;
    return tostring(key or "");
end;

function Adjustments.rootSheet(node)
    local current = node;
    local last = node;

    for i = 1, 10 do
        if current == nil then break; end;

        if current.nomePokemon ~= nil or
           current.vidaBase ~= nil or
           current.poderBase ~= nil or
           current.typeSelectionOrder ~= nil or
           current.ajusteEditorAlvos ~= nil then
            return current;
        end;

        last = current;
        local parent = getParent(current);
        if parent == nil or parent == current then break; end;
        current = parent;
    end;

    return last;
end;

function Adjustments.nodeName(node)
    return getNodeName(node);
end;

function Adjustments.normalizeValue(value)
    return cleanValue(value);
end;

function Adjustments.isPenalty(value)
    local clean = cleanValue(value);
    return clean ~= nil and string.sub(clean, 1, 1) == "-";
end;

function Adjustments.targets(value)
    return cleanTargets(value);
end;

function Adjustments.targetText(value)
    local labels = {};

    for _, key in ipairs(cleanTargets(value)) do
        table.insert(labels, Adjustments.attributeLabel(key));
    end;

    if #labels == 0 then return "sem alvo"; end;
    return table.concat(labels, ", ");
end;

function Adjustments.containsTarget(value, key)
    local targetKey = normalizeToken(key);

    for _, current in ipairs(cleanTargets(value)) do
        if current == targetKey then
            return true;
        end;
    end;

    return false;
end;

function Adjustments.adjustmentNodes(root)
    local nodes = {};

    for _, child in ipairs(childNodes(root)) do
        if isAdjustmentNode(child) then
            table.insert(nodes, child);
        end;
    end;

    return nodes;
end;

function Adjustments.ensureId(node)
    if node == nil then return newId(); end;

    if trim(node.ajusteId) == nil or trim(node.ajusteId) == "" then
        node.ajusteId = newId();
    end;

    return node.ajusteId;
end;

function Adjustments.rebuildCache(root)
    if root == nil then return {}; end;

    local entries = {};

    for _, node in ipairs(Adjustments.adjustmentNodes(root)) do
        local value = cleanValue(node.ajusteValor);
        local targets = table.concat(cleanTargets(node.ajusteAlvos), "|");

        if value ~= nil and targets ~= "" then
            table.insert(entries, {
                id=Adjustments.ensureId(node),
                name=node.ajusteNome or "",
                value=value,
                targets=targets,
                active=truthy(node.ajusteAtivo)
            });
        end;
    end;

    root.ajustesAtributosCache = serializeCache(entries);
    root.ajustesAtributosCacheInicializado = true;
    Adjustments.touch(root);
    return entries;
end;
function Adjustments.upsert(root, entry)
    if root == nil or entry == nil then return nil; end;

    local id = trim(entry.id) or newId();
    local entries = cacheEntries(root);
    local found = false;

    for _, current in ipairs(entries) do
        if current.id == id then
            current.name = entry.name or "";
            current.value = cleanValue(entry.value) or entry.value or "";
            current.targets = table.concat(cleanTargets(entry.targets), "|");
            current.active = entry.active ~= false;
            found = true;
            break;
        end;
    end;

    if not found then
        table.insert(entries, {
            id=id,
            name=entry.name or "",
            value=cleanValue(entry.value) or entry.value or "",
            targets=table.concat(cleanTargets(entry.targets), "|"),
            active=entry.active ~= false
        });
    end;

    root.ajustesAtributosCache = serializeCache(entries);
    root.ajustesAtributosCacheInicializado = true;
    Adjustments.touch(root);
    return id;
end;

function Adjustments.remove(root, id)
    if root == nil or trim(id) == nil or trim(id) == "" then return; end;

    local entries = cacheEntries(root);
    local kept = {};

    for _, current in ipairs(entries) do
        if current.id ~= id then
            table.insert(kept, current);
        end;
    end;

    root.ajustesAtributosCache = serializeCache(kept);
    root.ajustesAtributosCacheInicializado = true;
    Adjustments.touch(root);
end;

function Adjustments.hasCachedId(root, id)
    id = trim(id);
    if root == nil or id == nil or id == "" then return false; end;

    for _, entry in ipairs(cacheEntries(root)) do
        if entry.id == id then return true; end;
    end;

    return false;
end;

function Adjustments.rememberEditingNode(root, node)
    if root == nil then return; end;
    EDITING_NODES[root] = node;
end;

function Adjustments.editingNode(root, id)
    if root == nil then return nil; end;

    local node = EDITING_NODES[root];
    if node ~= nil and (trim(id) == nil or trim(id) == "" or node.ajusteId == id) then
        return node;
    end;

    return Adjustments.findById(root, id);
end;

function Adjustments.clearEditingNode(root)
    if root ~= nil then EDITING_NODES[root] = nil; end;
end;

function Adjustments.findByNodeName(root, nodeName)
    if nodeName == nil or nodeName == "" then return nil; end;

    for _, node in ipairs(Adjustments.adjustmentNodes(root)) do
        if getNodeName(node) == nodeName then
            return node;
        end;
    end;

    return nil;
end;

function Adjustments.findById(root, id)
    if trim(id) == nil or trim(id) == "" then return nil; end;

    for _, node in ipairs(Adjustments.adjustmentNodes(root)) do
        if node.ajusteId == id then
            return node;
        end;
    end;

    return nil;
end;

function Adjustments.activeCount(root)
    local count = 0;

    for _, entry in ipairs(cacheEntries(root)) do
        if entry.active ~= false and cleanValue(entry.value) ~= nil and #cleanTargets(entry.targets) > 0 then
            count = count + 1;
        end;
    end;

    return count;
end;

function Adjustments.countFor(root, key)
    local count = 0;

    for _, entry in ipairs(cacheEntries(root)) do
        if entry.active ~= false and
           cleanValue(entry.value) ~= nil and
           Adjustments.containsTarget(entry.targets, key) then
            count = count + 1;
        end;
    end;

    return count;
end;

function Adjustments.badgeFor(root, key)
    local badges = {};

    for _, entry in ipairs(cacheEntries(root)) do
        local value = cleanValue(entry.value);

        if entry.active ~= false and value ~= nil and Adjustments.containsTarget(entry.targets, key) then
            table.insert(badges, value);
        end;
    end;

    return table.concat(badges, " ");
end;

function Adjustments.detailsFor(root, key)
    local details = {};

    for _, entry in ipairs(cacheEntries(root)) do
        local value = cleanValue(entry.value);

        if entry.active ~= false and value ~= nil and Adjustments.containsTarget(entry.targets, key) then
            table.insert(details, {
                name=trim(entry.name) or "Ajuste",
                value=value,
                penalty=Adjustments.isPenalty(value)
            });
        end;
    end;

    return details;
end;
function Adjustments.expressionFor(root, key, baseExpression)
    local expression = trim(baseExpression) or "0";

    for _, entry in ipairs(cacheEntries(root)) do
        if entry.active ~= false and Adjustments.containsTarget(entry.targets, key) then
            expression = appendTerm(expression, expressionTerm(entry.value));
        end;
    end;

    return expression;
end;

function Adjustments.editorPreview(root)
    local name = trim(root and root.ajusteEditorNome) or "Ajuste";
    local value = cleanValue(root and root.ajusteEditorValor) or trim(root and root.ajusteEditorValor) or "?";
    local targets = Adjustments.targetText(root and root.ajusteEditorAlvos);

    return name .. " -> " .. targets .. " " .. value;
end;

function Adjustments.validateEditor(root)
    if root == nil then
        return false, "Ficha não encontrada.";
    end;

    if trim(root.ajusteEditorNome) == nil or trim(root.ajusteEditorNome) == "" then
        return false, "Informe o nome/fonte do ajuste.";
    end;

    if cleanValue(root.ajusteEditorValor) == nil then
        return false, "Valor inválido. Use formatos como +2, -1, +1d4 ou -1d6.";
    end;

    if #cleanTargets(root.ajusteEditorAlvos) == 0 then
        return false, "Escolha pelo menos um atributo alvo.";
    end;

    return true, nil;
end;

function Adjustments.touch(root)
    if root == nil then return; end;

    root.ajustesRefreshTick = tostring(os.time()) .. "." .. tostring(math.random(100000, 999999));
end;

return Adjustments;
