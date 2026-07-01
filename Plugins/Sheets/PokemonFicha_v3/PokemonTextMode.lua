local TextMode = {};

local ndb = require("ndb.lua");
local Adjustments = require("PokemonAttributeAdjustments.lua");

local SEP = "============================================================";
local MINI = "------------------------------------------------------------";

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function filled(value)
    local text = trim(value);
    if text == nil or text == "" then return nil; end;
    return text;
end;

local function value(node, fieldName, fallback)
    if node == nil then return fallback or "--"; end;
    return filled(node[fieldName]) or fallback or "--";
end;

local function oneLine(valueText)
    local text = filled(valueText);
    if text == nil then return nil; end;
    text = string.gsub(text, "[\r\n]+", " ");
    text = string.gsub(text, "%s+", " ");
    return trim(text);
end;

local function blockText(valueText)
    local text = filled(valueText);
    if text == nil then return nil; end;
    text = string.gsub(text, "\r\n", "\n");
    text = string.gsub(text, "\r", "\n");
    return text;
end;

local function ratioValue(currentValue, maximumValue, fallbackCurrent, fallbackMaximum)
    local current = filled(currentValue) or fallbackCurrent or "0";
    if string.find(current, "/", 1, true) ~= nil then
        return current;
    end;

    local maximum = filled(maximumValue) or fallbackMaximum or "0";
    return current .. "/" .. maximum;
end;

local function nodeName(node)
    if node == nil or ndb == nil or ndb.getNodeName == nil then return nil; end;
    local ok, result = pcall(ndb.getNodeName, node);
    if ok then return result; end;
    return nil;
end;

local function parentOf(node)
    if node == nil or ndb == nil or ndb.getParent == nil then return nil; end;
    local ok, result = pcall(ndb.getParent, node);
    if ok then return result; end;
    return nil;
end;

local function childrenOf(node)
    if node == nil or ndb == nil or ndb.getChildNodes == nil then return {}; end;
    local ok, children = pcall(ndb.getChildNodes, node);
    if ok and children ~= nil then return children; end;
    return {};
end;

local function isRoot(node)
    return node ~= nil and (
        node.nomePokemon ~= nil or
        node.vidaBase ~= nil or
        node.typeSelectionOrder ~= nil or
        node.pvMaximo ~= nil
    );
end;

function TextMode.rootSheet(node)
    local current = node;
    local last = node;

    for _ = 1, 12 do
        if current == nil then break; end;
        if isRoot(current) then return current; end;

        last = current;
        local parent = parentOf(current);
        if parent == nil or parent == current then break; end;
        current = parent;
    end;

    return last;
end;

local function hasAnyField(node, fallbackFields)
    if node == nil or fallbackFields == nil then return false; end;

    if type(fallbackFields) == "string" then
        return node[fallbackFields] ~= nil;
    end;

    for _, fieldName in ipairs(fallbackFields) do
        if node[fieldName] ~= nil then return true; end;
    end;

    return false;
end;

local function childList(root, listName, fallbackFields)
    local list = {};

    for _, child in ipairs(childrenOf(root)) do
        local name = nodeName(child);
        if name == listName then
            for _, item in ipairs(childrenOf(child)) do
                if nodeName(item) ~= "__ndb__" and hasAnyField(item, fallbackFields) then
                    table.insert(list, item);
                end;
            end;
        elseif name ~= "__ndb__" and hasAnyField(child, fallbackFields) then
            table.insert(list, child);
        end;
    end;

    return list;
end;

local function nodeIndex(node)
    return tonumber(node ~= nil and node.i or nil) or 999999;
end;

local function sortedIndexedNodes(nodes)
    local sorted = {};
    for _, node in ipairs(nodes or {}) do
        if nodeName(node) ~= "__ndb__" then
            table.insert(sorted, node);
        end;
    end;

    table.sort(sorted, function(left, right)
        return nodeIndex(left) < nodeIndex(right);
    end);

    return sorted;
end;

local function richText(root, fieldName)
    local richRoot = nil;

    for _, child in ipairs(childrenOf(root)) do
        if nodeName(child) == fieldName then
            richRoot = child;
            break;
        end;
    end;

    if richRoot == nil then return nil; end;

    local paragraphs = {};
    for _, paragraphNode in ipairs(sortedIndexedNodes(childrenOf(richRoot))) do
        if nodeName(paragraphNode) == "p" then
            local fragments = {};

            for _, fragmentNode in ipairs(sortedIndexedNodes(childrenOf(paragraphNode))) do
                if nodeName(fragmentNode) == "e" then
                    local fragment = fragmentNode.text;
                    if fragment ~= nil and fragment ~= "" then
                        table.insert(fragments, tostring(fragment));
                    end;
                end;
            end;

            local paragraph = trim(table.concat(fragments, ""));
            if paragraph ~= nil and paragraph ~= "" then
                paragraph = string.gsub(paragraph, "^ï‚·%s*", "- ");
                table.insert(paragraphs, paragraph);
            end;
        end;
    end;

    if #paragraphs == 0 then return nil; end;
    return table.concat(paragraphs, "\n\n");
end;

local INVENTORY_FIELDS = {
    "quantidade", "peso", "pesoTotal", "efeito", "observacoes", "imagemItem"
};

local MAIN_MOVE_FIELDS = {
    "nomeOriginal", "dano"
};

local INTERPRETATIVE_FIELDS = {
    "fonte", "bonus", "resumoCurto", "usoNarrativo"
};

local function section(lines, icon, title)
    table.insert(lines, "");
    table.insert(lines, SEP);
    table.insert(lines, icon .. " " .. title);
    table.insert(lines, SEP);
end;

local function card(lines, title)
    table.insert(lines, "");
    table.insert(lines, ">> " .. title);
end;

local function kv(lines, label, text)
    table.insert(lines, "- " .. label .. ": " .. tostring(text or "--"));
end;

local function opt(lines, label, text)
    local clean = oneLine(text);
    if clean ~= nil then
        kv(lines, label, clean);
    end;
end;

local function paragraph(lines, text)
    local clean = blockText(text);
    if clean ~= nil then
        table.insert(lines, clean);
    end;
end;

local function namesFromText(text)
    local names = {};
    local source = blockText(text);

    if source == nil then return names; end;

    source = source .. "\n";
    for line in string.gmatch(source, "([^\n]*)\n") do
        local name = filled(line);
        if name ~= nil then
            table.insert(names, name);
        end;
    end;

    return names;
end;

local function addNameList(lines, names, emptyText)
    if #names == 0 then
        table.insert(lines, "- " .. emptyText);
        return;
    end;

    for i, name in ipairs(names) do
        local index = tostring(i);
        if i < 10 then index = "0" .. index; end;
        table.insert(lines, "- " .. index .. ". " .. name);
    end;
end;

local function splitLines(text)
    local lines = {};
    local source = blockText(text);
    if source == nil then return lines; end;

    source = source .. "\n";
    for line in string.gmatch(source, "([^\n]*)\n") do
        table.insert(lines, line);
    end;

    return lines;
end;

local function sliceLines(lines, firstIndex, lastIndex)
    local result = {};
    for index = firstIndex, lastIndex do
        table.insert(result, lines[index]);
    end;
    return result;
end;

local function parseTextSections(text)
    local lines = splitLines(text);
    local starts = {};

    for index = 1, #lines - 2 do
        if lines[index] == SEP and lines[index + 2] == SEP then
            table.insert(starts, index);
        end;
    end;

    local parsed = {order={}, sections={}};
    local firstSection = starts[1] or (#lines + 1);
    parsed.sections.__PREAMBLE__ = sliceLines(lines, 1, firstSection - 1);
    table.insert(parsed.order, "__PREAMBLE__");

    for position, startIndex in ipairs(starts) do
        local endIndex = (starts[position + 1] or (#lines + 1)) - 1;
        local key = lines[startIndex + 1] or ("__SECTION_" .. tostring(position));
        local uniqueKey = key;
        local duplicate = 2;

        while parsed.sections[uniqueKey] ~= nil do
            uniqueKey = key .. "#" .. tostring(duplicate);
            duplicate = duplicate + 1;
        end;

        parsed.sections[uniqueKey] = sliceLines(lines, startIndex, endIndex);
        table.insert(parsed.order, uniqueKey);
    end;

    return parsed;
end;

local function addedLines(currentLines, generatedLines)
    local currentCount = #currentLines;
    local generatedCount = #generatedLines;
    local lcs = {};

    for currentIndex = 1, currentCount + 1 do
        lcs[currentIndex] = {};
        lcs[currentIndex][generatedCount + 1] = 0;
    end;

    for generatedIndex = 1, generatedCount + 1 do
        lcs[currentCount + 1][generatedIndex] = 0;
    end;

    for currentIndex = currentCount, 1, -1 do
        for generatedIndex = generatedCount, 1, -1 do
            if currentLines[currentIndex] == generatedLines[generatedIndex] then
                lcs[currentIndex][generatedIndex] = 1 + lcs[currentIndex + 1][generatedIndex + 1];
            else
                lcs[currentIndex][generatedIndex] = math.max(
                    lcs[currentIndex + 1][generatedIndex],
                    lcs[currentIndex][generatedIndex + 1]
                );
            end;
        end;
    end;

    local additions = {};
    local currentIndex = 1;
    local generatedIndex = 1;

    while currentIndex <= currentCount and generatedIndex <= generatedCount do
        if currentLines[currentIndex] == generatedLines[generatedIndex] then
            currentIndex = currentIndex + 1;
            generatedIndex = generatedIndex + 1;
        elseif lcs[currentIndex + 1][generatedIndex] >= lcs[currentIndex][generatedIndex + 1] then
            table.insert(additions, currentLines[currentIndex]);
            currentIndex = currentIndex + 1;
        else
            generatedIndex = generatedIndex + 1;
        end;
    end;

    while currentIndex <= currentCount do
        table.insert(additions, currentLines[currentIndex]);
        currentIndex = currentIndex + 1;
    end;

    while #additions > 0 and trim(additions[1]) == "" do
        table.remove(additions, 1);
    end;

    while #additions > 0 and trim(additions[#additions]) == "" do
        table.remove(additions, #additions);
    end;

    local filtered = {};
    for _, line in ipairs(additions) do
        local clean = trim(line) or "";
        if string.match(clean, "^Modo Texto gerado pela ficha%.") == nil then
            table.insert(filtered, line);
        end;
    end;

    return filtered;
end;

local function insertManualLines(sectionLines, additions)
    if additions == nil or #additions == 0 then return sectionLines; end;

    local insertAt = #sectionLines + 1;
    for index, line in ipairs(sectionLines) do
        if line == MINI then
            insertAt = index;
            break;
        end;
    end;

    while insertAt > 1 and trim(sectionLines[insertAt - 1]) == "" do
        insertAt = insertAt - 1;
    end;

    local merged = {};
    for index = 1, insertAt - 1 do table.insert(merged, sectionLines[index]); end;

    if #merged > 0 and trim(merged[#merged]) ~= "" then table.insert(merged, ""); end;
    for _, line in ipairs(additions) do table.insert(merged, line); end;
    table.insert(merged, "");

    for index = insertAt, #sectionLines do table.insert(merged, sectionLines[index]); end;
    return merged;
end;

local function mergeManualAdditions(previousGenerated, currentText, newGenerated)
    local previous = parseTextSections(previousGenerated);
    local current = parseTextSections(currentText);
    local fresh = parseTextSections(newGenerated);
    local additionsBySection = {};

    for key, currentLines in pairs(current.sections) do
        local previousLines = previous.sections[key];
        if previousLines ~= nil then
            local additions = addedLines(currentLines, previousLines);
            if #additions > 0 then additionsBySection[key] = additions; end;
        end;
    end;

    local mergedLines = {};
    for _, key in ipairs(fresh.order) do
        local sectionLines = fresh.sections[key] or {};
        sectionLines = insertManualLines(sectionLines, additionsBySection[key]);
        for _, line in ipairs(sectionLines) do table.insert(mergedLines, line); end;
    end;

    return table.concat(mergedLines, "\n");
end;

local function pad2(valueText)
    local text = filled(valueText) or "00";
    local number = tonumber(text);
    if number ~= nil and number >= 0 and number < 10 and math.floor(number) == number then
        return "0" .. tostring(number);
    end;
    return text;
end;

local function signed(valueText)
    local text = filled(valueText) or "00";
    if string.sub(text, 1, 1) == "+" or string.sub(text, 1, 1) == "-" then
        return text;
    end;
    return "+" .. pad2(text);
end;

local function joinExpression(left, right)
    local first = filled(left) or "0";
    local second = filled(right) or "0";

    if first == "0" then return second; end;
    if second == "0" then return first; end;
    if string.sub(second, 1, 1) == "+" or string.sub(second, 1, 1) == "-" then
        return first .. " " .. second;
    end;

    return first .. " + " .. second;
end;

local function compactSuffix(text)
    local suffix = trim(text);
    if suffix == nil or suffix == "" then return ""; end;

    suffix = string.gsub(suffix, "%s+", " ");
    suffix = string.gsub(suffix, "%+ ", "+");
    suffix = string.gsub(suffix, "%- ", "-");

    if string.sub(suffix, 1, 1) ~= "+" and string.sub(suffix, 1, 1) ~= "-" then
        suffix = "+" .. suffix;
    end;

    return " " .. suffix;
end;

local function adjustmentSuffix(root, key, baseExpression)
    local base = trim(baseExpression) or "0";
    local full = trim(Adjustments.expressionFor(root, key, base)) or base;

    if full == base then return ""; end;
    if string.sub(full, 1, string.len(base)) == base then
        return compactSuffix(string.sub(full, string.len(base) + 1));
    end;

    return " -> " .. full;
end;

local function coreAttr(root, key, baseField, modField)
    local mod = pad2(value(root, modField, "00"));
    local base = signed(value(root, baseField, "00"));
    local expr = joinExpression(value(root, baseField, "0"), value(root, modField, "0"));
    return "(" .. mod .. ")" .. base .. adjustmentSuffix(root, key, expr);
end;

local function singleAttr(root, key, fieldName)
    local base = pad2(value(root, fieldName, "00"));
    return "(" .. base .. ")" .. adjustmentSuffix(root, key, value(root, fieldName, "0"));
end;

local function moveName(move)
    local name = value(move, "nome", "Novo golpe");
    local original = oneLine(move.nomeOriginal);
    if original ~= nil then return name .. " (" .. original .. ")"; end;
    return name;
end;

local function moveTypeLine(move)
    local parts = {};

    local tipo = oneLine(move.tipo);
    local categoria = oneLine(move.categoria);
    local tags = oneLine(move.tags);

    if tipo ~= nil then table.insert(parts, tipo); end;
    if categoria ~= nil then table.insert(parts, categoria); end;
    if tags ~= nil then table.insert(parts, tags); end;

    if #parts == 0 then return nil; end;
    return table.concat(parts, ", ");
end;

local function formatIndex(index)
    if index < 10 then return "0" .. tostring(index); end;
    return tostring(index);
end;

local function costLine(node)
    local pe = oneLine(node.custoPE);
    if pe ~= nil then return pe .. " PE"; end;
    return oneLine(node.custo);
end;

local function addInventory(lines, root)
    do
        addNameList(lines, namesFromText(root.modoTextoInventarioNomes), "Mochila vazia por enquanto.");
        return;
    end;

    local items = childList(root, "inventarioItens", INVENTORY_FIELDS);

    if #items == 0 then
        table.insert(lines, "- Mochila vazia por enquanto.");
        return;
    end;

    for _, item in ipairs(items) do
        local name = value(item, "nome", "Item");
        local qty = oneLine(item.quantidade);
        local desc = oneLine(item.efeito) or oneLine(item.descricaoCurta) or oneLine(item.descricao);
        local line = "- " .. name;

        if qty ~= nil and qty ~= "1" then
            line = line .. " x" .. qty;
        end;

        if desc ~= nil then
            line = line .. " | " .. desc;
        end;

        table.insert(lines, line);
    end;
end;

local function addMoveList(lines, root)
    do
        addNameList(lines, namesFromText(root.modoTextoGolpesPrincipaisNomes), "Nenhum golpe principal registrado.");
        return;
    end;

    local moves = childList(root, "habilidadesPrincipais", MAIN_MOVE_FIELDS);

    if #moves == 0 then
        table.insert(lines, "- Nenhum golpe principal registrado.");
        return;
    end;

    for i, move in ipairs(moves) do
        card(lines, formatIndex(i) .. ". " .. moveName(move));
        opt(lines, "Texto", oneLine(move.descricaoCurta) or oneLine(move.descricao));
        opt(lines, "Tipo", moveTypeLine(move));
        opt(lines, "Ação", move.acao);
        opt(lines, "Teste", move.teste);
        opt(lines, "Dano", move.dano);
        opt(lines, "Fórmula", move.formula);
        opt(lines, "Custo", costLine(move));
    end;
end;

local function addInterpretative(lines, root)
    do
        addNameList(lines, namesFromText(root.modoTextoGolpesInterpretativosNomes), "Nenhum golpe interpretativo registrado.");
        return;
    end;

    local entries = childList(root, "habilidadesInterpretativas", INTERPRETATIVE_FIELDS);

    if #entries == 0 then
        table.insert(lines, "- Nenhum golpe interpretativo registrado.");
        return;
    end;

    for i, entry in ipairs(entries) do
        card(lines, formatIndex(i) .. ". " .. value(entry, "nome", "Golpe interpretativo"));
        opt(lines, "Texto", oneLine(entry.resumoCurto) or oneLine(entry.descricao) or oneLine(entry.usoNarrativo));
        opt(lines, "Tipo", moveTypeLine(entry));
        opt(lines, "Ação", entry.acao);
        opt(lines, "Bônus", entry.bonus);
        opt(lines, "Teste", entry.teste);
        opt(lines, "Fórmula", entry.formula);
        opt(lines, "Custo", costLine(entry));
        opt(lines, "Fonte", entry.fonte);
    end;
end;

local function addGeneralActions(lines)
    local actions = {
        {
            name="Atacar",
            test="Precisão",
            action="Comum",
            cost="1 PE",
            effect="Dano 1+1d4",
            text="Ataque simples adjacente. Causa Dano Bruto e pode ser resistido."
        },
        {
            name="Esquivar",
            test="Proteção",
            action="Reação",
            cost="1 PE",
            effect="Move 1 ou 2 metros",
            text="Sai do alcance de um golpe com movimento ágil."
        },
        {
            name="Resistir",
            test="Proteção",
            action="Reação",
            cost="1 PE",
            effect="Redução 1+2d4",
            text="Firma postura e reduz parte do dano recebido."
        },
        {
            name="Avançar",
            test="--",
            action="Rápida",
            cost="2 PE",
            effect="Bônus de deslocamento",
            text="Recebe bônus de deslocamento no turno."
        },
        {
            name="Recuar",
            test="--",
            action="Rápida ou Reação",
            cost="2 PE",
            effect="Afasta sem penalidade",
            text="Sai de perto de inimigo adjacente sem penalidade."
        }
    };

    for _, action in ipairs(actions) do
        card(lines, action.name);
        kv(lines, "Teste", action.test);
        kv(lines, "Ação", action.action);
        kv(lines, "Custo", action.cost);
        kv(lines, "Efeito", action.effect);
        kv(lines, "Texto", action.text);
    end;
end;

local function addNature(lines, root)
    card(lines, "Personalidade 1");
    opt(lines, "Nome", root.personalidadeNatural);
    opt(lines, "Descrição", root.descricaoNatural);
    opt(lines, "Efeito", root.efeitoPersonalidadeNatural);

    if oneLine(root.personalidadeNatural2) ~= nil or oneLine(root.descricaoNatural2) ~= nil then
        card(lines, "Personalidade 2");
        opt(lines, "Nome", root.personalidadeNatural2);
        opt(lines, "Descrição", root.descricaoNatural2);
        opt(lines, "Efeito", root.efeitoPersonalidadeNatural2);
    end;

    local abilities = {
        {title="Habilidade Natural 1", name="habilidadeNaturalNome", desc="habilidadeNaturalDescricao"},
        {title="Habilidade Natural 2", name="habilidadeNatural2Nome", desc="habilidadeNatural2Descricao"},
        {title="Habilidade Natural 3", name="habilidadeNatural3Nome", desc="habilidadeNatural3Descricao"}
    };

    for _, ability in ipairs(abilities) do
        if oneLine(root[ability.name]) ~= nil or oneLine(root[ability.desc]) ~= nil then
            card(lines, ability.title);
            opt(lines, "Nome", root[ability.name]);
            opt(lines, "Descrição", root[ability.desc]);
        end;
    end;
end;

local function addJourney(lines, root)
    paragraph(lines, root.resumoNarrativo or root.descricaoPokemon);

    if filled(root.resumoNarrativo) == nil and filled(root.descricaoPokemon) == nil then
        table.insert(lines, "História ainda não registrada.");
    end;

    local biography = richText(root, "biografiaCompletaRich");
    if biography ~= nil then
        card(lines, "Biografia / diário completo");
        paragraph(lines, biography);
    end;

    local bonds = childList(root, "jornadaVinculos", "nomeVinculo");
    if #bonds > 0 then
        card(lines, "Vínculos importantes");
        for _, bond in ipairs(bonds) do
            table.insert(lines, "- " .. value(bond, "nomeVinculo", "Vínculo") ..
                " | " .. value(bond, "tipoRelacao", "Relação") ..
                " | " .. value(bond, "estadoRelacao", "Estado"));
            opt(lines, "  Última cena", bond.ultimaInteracao);
        end;
    end;

    local events = childList(root, "jornadaEventos", "tituloEvento");
    if #events > 0 then
        card(lines, "Linha do tempo");
        for _, event in ipairs(events) do
            table.insert(lines, "- " .. value(event, "sessaoEvento", "Sessão --") .. " | " .. value(event, "tituloEvento", "Evento"));
            opt(lines, "  Resumo", event.resumoEvento);
        end;
    end;

    local hooks = childList(root, "jornadaGanchos", "nomeGancho");
    if #hooks > 0 then
        card(lines, "Ganchos");
        for _, hook in ipairs(hooks) do
            table.insert(lines, "- " .. value(hook, "nomeGancho", "Gancho") ..
                " | " .. value(hook, "tipoGancho", "Tipo") ..
                " | Intensidade: " .. value(hook, "intensidadeGancho", "--"));
            opt(lines, "  Resumo", hook.resumoGancho);
        end;
    end;
end;

local function addCustomRolls(lines, root)
    local rolls = childList(root, "rolagensCustomizadas", {"formula", "categoria", "descricao"});

    if #rolls == 0 then
        table.insert(lines, "- Nenhum atalho personalizado registrado.");
        return;
    end;

    for i, roll in ipairs(rolls) do
        local line = "- " .. formatIndex(i) .. ". " .. value(roll, "nome", "Rolagem");
        local formula = oneLine(roll.formula);
        local category = oneLine(roll.categoria);

        if formula ~= nil then line = line .. " | " .. formula; end;
        if category ~= nil then line = line .. " | " .. category; end;
        table.insert(lines, line);
    end;
end;

function TextMode.build(root)
    local lines = {};
    local dex = value(root, "registroNumero", "----");
    local name = value(root, "nomePokemon", value(root, "apelidoPokemon", "Pokémon"));
    local sex = value(root, "sexoEmoji", "");
    local xp = ratioValue(root.experienciaPokemon, root.experienciaMaximoPokemon, "0", "100");
    local pv = ratioValue(root.pvAtual, root.pvMaximo, value(root, "pvMaximo", "0"), "0");
    local pe = ratioValue(root.peAtual, root.peMaximo, value(root, "peMaximo", "0"), "0");
    local dexLabel = dex;

    if string.sub(dexLabel, 1, 1) ~= "#" then
        dexLabel = "#" .. dexLabel;
    end;

    table.insert(lines, SEP);
    table.insert(lines, dexLabel .. " | " .. string.upper(name) .. " " .. sex);
    table.insert(lines, value(root, "tipoPokemon", "Sem tipo") .. " | Nível " .. value(root, "nivelPokemon", "--") .. " | XP " .. xp);
    table.insert(lines, "PV " .. pv .. " | PE " .. pe .. " | Movimento " .. value(root, "deslocamentoValor", "--"));
    table.insert(lines, SEP);

    section(lines, "📌", "PERFIL RÁPIDO");
    kv(lines, "Nome", value(root, "nomePokemon", "--"));
    opt(lines, "Apelido", root.apelidoPokemon);
    kv(lines, "Tipo", value(root, "tipoPokemon", "--"));
    kv(lines, "Altura/Peso", value(root, "alturaPokemon", "--") .. " / " .. value(root, "pesoPokemon", "--"));
    kv(lines, "Condição", value(root, "condicaoValor", "Saudável"));
    kv(lines, "Afeição/Frustração", ratioValue(root.afeicaoValor, nil, "0", "50") .. " / " .. ratioValue(root.frustracaoValor, nil, "0", "50"));
    opt(lines, "Vantagem", root.vantagemPokemon);
    opt(lines, "Desvantagem", root.desvantagemPokemon);
    opt(lines, "Evolução", root.evolucaoPokemon);
    opt(lines, "Descrição", root.descricaoPokemon);

    section(lines, "📊", "ATRIBUTOS");
    card(lines, "Inatos");
    kv(lines, "Vida", coreAttr(root, "vida", "vidaBase", "vidaMod"));
    kv(lines, "Poder", coreAttr(root, "poder", "poderBase", "poderMod"));
    kv(lines, "Força", coreAttr(root, "forca", "forcaBase", "forcaMod"));
    kv(lines, "Resistência", coreAttr(root, "resistencia", "resistenciaBase", "resistenciaMod"));
    kv(lines, "Defesa", coreAttr(root, "defesa", "defesaBase", "defesaMod"));
    kv(lines, "Velocidade", coreAttr(root, "velocidade", "velocidadeBase", "velocidadeMod"));

    card(lines, "Combate");
    kv(lines, "Precisão", singleAttr(root, "precisao", "precisaoValor"));
    kv(lines, "Proteção", singleAttr(root, "protecao", "protecaoValor"));
    kv(lines, "Efeito", singleAttr(root, "efeito", "efeitoValor"));
    kv(lines, "Tenacidade", singleAttr(root, "tenacidade", "tenacidadeValor"));

    card(lines, "Aptidões");
    kv(lines, "Astúcia", singleAttr(root, "astucia", "astuciaValor"));
    kv(lines, "Físico", singleAttr(root, "fisico", "fisicoValor"));
    kv(lines, "Mental", singleAttr(root, "mental", "mentalValor"));
    kv(lines, "Natural", singleAttr(root, "natural", "naturalValor"));
    kv(lines, "Social", singleAttr(root, "social", "socialValor"));
    kv(lines, "Técnico", singleAttr(root, "tecnico", "tecnicoValor"));

    section(lines, "❤️", "RECURSOS");
    kv(lines, "Pontos de Vida", pv);
    kv(lines, "Pontos de Energia", pe);
    kv(lines, "Deslocamento", value(root, "deslocamentoValor", "--"));
    kv(lines, "Fórmula PV", "(Nível+10)+(Vida*3)");
    kv(lines, "Fórmula PE", "(Atributos Naturais+Nível+10)");
    kv(lines, "Fórmula Movimento", "(5)+(Velocidade/2)");

    section(lines, "🌿", "NATUREZA");
    addNature(lines, root);

    section(lines, "🎒", "INVENTÁRIO");
    addInventory(lines, root);

    section(lines, "⚙", "AÇÕES GERAIS");
    addGeneralActions(lines);

    section(lines, "🎲", "ATALHOS DE ROLAGEM");
    addCustomRolls(lines, root);

    section(lines, "🎭", "GOLPES INTERPRETATIVOS");
    addInterpretative(lines, root);

    section(lines, "⚔", "GOLPES PRINCIPAIS");
    addMoveList(lines, root);

    section(lines, "📖", "HISTÓRIA / JORNADA");
    addJourney(lines, root);

    local liveContext = richText(root, "contextoAoVivoRich");
    if liveContext ~= nil then
        section(lines, "📝", "CONTEXTO DA SESSÃO");
        paragraph(lines, liveContext);
    end;

    table.insert(lines, "");
    table.insert(lines, MINI);
    table.insert(lines, "Modo Texto gerado pela ficha. Linhas adicionadas manualmente são preservadas ao atualizar.");

    return table.concat(lines, "\n");
end;

function TextMode.refresh(node, force)
    if force ~= true then return; end;

    local root = TextMode.rootSheet(node);
    if root == nil then return; end;

    local newGenerated = TextMode.build(root);
    local previousGenerated = blockText(root.modoTextoGeradoBase);
    local currentText = blockText(root.modoTextoTexto);
    local mergedText = newGenerated;

    if currentText ~= nil then
        mergedText = mergeManualAdditions(previousGenerated or newGenerated, currentText, newGenerated);
    end;

    root.modoTextoGeradoBase = newGenerated;
    root.modoTextoTexto = mergedText;
    root.modoTextoAtualizado = "Modo Texto atualizado. Adições manuais preservadas.";
end;

return TextMode;
