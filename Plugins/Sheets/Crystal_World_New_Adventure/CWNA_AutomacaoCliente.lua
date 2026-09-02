local M = {}

local Firebase = require("FirebaseTrocas.lua")

local function textoSeguro(valor)
    if valor == nil then return "" end
    return tostring(valor)
end

local function normalizar(valor)
    local texto = textoSeguro(valor):lower()
    texto = texto:gsub("[_%-%:]+", " "):gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
    return texto
end

local function mesaDe(ficha)
    local mesa = nil
    pcall(function()
        mesa = (rrpg and rrpg.getMesaDe and rrpg.getMesaDe(ficha)) or (Firecast and Firecast.getMesaDe and Firecast.getMesaDe(ficha))
    end)
    return mesa
end

local function nomeLegivel(valor)
    if valor == nil then return "" end
    local txt = tostring(valor)
    if txt == "" then return "" end
    if txt:find("[\1-\8\11\12\14-\31]") ~= nil then return "" end
    if txt:find("function:", 1, true) ~= nil or txt:find("table:", 1, true) ~= nil or txt:find("userdata:", 1, true) ~= nil then return "" end
    txt = txt:gsub("^%s*(.-)%s*$", "%1")
    if txt == "" or #txt > 80 then return "" end
    return txt
end

local function add(lista, vistos, valor)
    local txt = normalizar(nomeLegivel(valor))
    if txt ~= "" and not vistos[txt] then
        vistos[txt] = true
        table.insert(lista, txt)
    end
end


local function addId(lista, vistos, valor)
    local txt = textoSeguro(valor)
    if txt ~= "" and not vistos[txt] then
        vistos[txt] = true
        table.insert(lista, txt)
    end
end

local function addObjetoAlvo(obj, nomes, vistosNomes, ids, vistosIds)
    if obj == nil then return end
    addId(ids, vistosIds, obj.objectID)
    addId(ids, vistosIds, obj.id)
    addId(ids, vistosIds, obj.codigoInterno)
    add(nomes, vistosNomes, obj.nome)
    add(nomes, vistosNomes, obj.name)
    add(nomes, vistosNomes, obj.nick)
    add(nomes, vistosNomes, obj.nickname)
    add(nomes, vistosNomes, obj.login)
end

local function addKeyUnica(lista, vistos, valor)
    local txt = textoSeguro(valor):gsub("^%s*(.-)%s*$", "%1")
    if txt ~= "" and not vistos[txt] then
        vistos[txt] = true
        table.insert(lista, txt)
    end
end

local function adicionarAliasesChave(lista, vistos, valor)
    local raw = nomeLegivel(valor)
    if raw == "" then raw = textoSeguro(valor):gsub("^%s*(.-)%s*$", "%1") end
    if raw == "" then return end

    addKeyUnica(lista, vistos, raw)
    addKeyUnica(lista, vistos, raw:lower())
    addKeyUnica(lista, vistos, normalizar(raw))

    local id = raw:match("[Rr]ooms/([%w%-_]+)")
        or raw:match("[Rr]oom/([%w%-_]+)")
        or raw:match("[Rr]oom[:%s]+([%w%-_]+)")
        or raw:match("sala[/=]([%w%-_]+)")
    if id ~= nil and id ~= "" then
        addKeyUnica(lista, vistos, "room:" .. tostring(id))
        addKeyUnica(lista, vistos, "room " .. tostring(id))
        addKeyUnica(lista, vistos, tostring(id))
    end
end

local function addKey(lista, vistos, valor)
    adicionarAliasesChave(lista, vistos, valor)
end

local function adicionarChavesMesaObjeto(lista, vistos, mesa)
    if mesa == nil then return end
    for _, campo in ipairs({"firecastURI", "FirecastURI", "uri", "URI", "url", "URL", "site", "link"}) do
        addKey(lista, vistos, mesa[campo])
    end
    for _, metodo in ipairs({"getFirecastURI", "getURI", "getUrl", "getURL", "getSite", "getLink"}) do
        if mesa[metodo] ~= nil then
            local ok, valor = pcall(function() return mesa[metodo](mesa) end)
            if ok then addKey(lista, vistos, valor) end
        end
    end
end

local function montarChavesMesa(ficha)
    local keys, vistos = {}, {}
    addKey(keys, vistos, Firebase.tableName(ficha))
    local mesa = mesaDe(ficha)
    if mesa ~= nil then
        adicionarChavesMesaObjeto(keys, vistos, mesa)
        for _, campo in ipairs({"codigoInterno", "id", "objectID", "roomId", "roomID"}) do
            local valor = mesa[campo]
            if valor ~= nil and tostring(valor) ~= "" then
                addKey(keys, vistos, "room:" .. tostring(valor))
                addKey(keys, vistos, tostring(valor))
            end
        end
        for _, campo in ipairs({"nome", "name", "titulo", "title"}) do
            addKey(keys, vistos, mesa[campo])
        end
    end
    return keys
end

local function montarAlvos(ficha)
    local nomes, vistosNomes, characterIds, userIds, vistosChars, vistosUsers = {}, {}, {}, {}, {}, {}
    add(nomes, vistosNomes, ficha and ficha.NomePersonagem)
    add(nomes, vistosNomes, Firebase.characterName(ficha))
    add(nomes, vistosNomes, Firebase.playerName(ficha))

    local personagem = nil
    pcall(function()
        if rrpg ~= nil and rrpg.getPersonagemDe ~= nil then personagem = rrpg.getPersonagemDe(ficha) end
        if personagem == nil and Firecast ~= nil and Firecast.getPersonagemDe ~= nil then personagem = Firecast.getPersonagemDe(ficha) end
    end)
    addObjetoAlvo(personagem, nomes, vistosNomes, characterIds, vistosChars)

    local mesa = mesaDe(ficha)
    local jogador = mesa and (mesa.me or mesa.jogador or mesa.player or mesa.usuario or mesa.user) or nil
    addObjetoAlvo(jogador, nomes, vistosNomes, userIds, vistosUsers)

    local candidatosPersonagem = {
        mesa and mesa.meupersonagem,
        mesa and mesa.meuPersonagem,
        mesa and mesa.personagemAtual,
        jogador and jogador.meupersonagem,
        jogador and jogador.meuPersonagem,
        jogador and jogador.personagemAtual,
        jogador and jogador.personagem,
        jogador and jogador.character
    }
    for _, candidato in ipairs(candidatosPersonagem) do
        addObjetoAlvo(candidato, nomes, vistosNomes, characterIds, vistosChars)
    end

    for _, metodo in ipairs({"getPersonagem", "getPersonagemAtual", "getMeuPersonagem", "getCharacter", "getCurrentCharacter"}) do
        if jogador ~= nil and jogador[metodo] ~= nil then
            local ok, valor = pcall(function() return jogador[metodo](jogador) end)
            if ok then addObjetoAlvo(valor, nomes, vistosNomes, characterIds, vistosChars) end
        end
        if mesa ~= nil and mesa[metodo] ~= nil then
            local ok, valor = pcall(function() return mesa[metodo](mesa) end)
            if ok then addObjetoAlvo(valor, nomes, vistosNomes, characterIds, vistosChars) end
        end
    end

    return { names = nomes, characterIds = characterIds, userIds = userIds }
end

function M.solicitarLuzToken(ficha, metros, itemNome)
    if ficha == nil then return end
    Firebase.post(ficha.FirebaseFunctionsUrl or "", "submitLightCommand", {
        tableName = Firebase.tableName(ficha),
        tableKeys = montarChavesMesa(ficha),
        commandId = tostring((os.time() or 0)) .. "-" .. tostring(Firebase.ensureCharacterId(ficha)) .. "-" .. tostring(tonumber(metros) or 0),
        characterId = Firebase.ensureCharacterId(ficha),
        characterName = Firebase.characterName(ficha),
        playerName = Firebase.playerName(ficha),
        type = "alterarLuzToken",
        item = textoSeguro(itemNome),
        clientSentAtMs = (os.time() or 0) * 1000,
        meters = tonumber(metros) or 0,
        lightIntense = tonumber(metros) or 0,
        lightWeak = tonumber(metros) or 0,
        raio = tonumber(metros) or 0,
        angle = 360,
        targets = montarAlvos(ficha)
    }, function(ok, resposta)
        if ok then
            ficha.TokenLuzUltimoRetorno = "Solicitação enviada à central."
        else
            ficha.TokenLuzUltimoRetorno = "Falha ao enviar para central: " .. textoSeguro(resposta and resposta.error or "")
        end
    end)
end

return M
