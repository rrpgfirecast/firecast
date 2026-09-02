local M = {}

M.DEFAULT_FUNCTIONS_URL = "https://southamerica-east1-crystal-world-e5c03.cloudfunctions.net"
M.DIRECT_FUNCTION_URLS = {
    submitAutomationRequest = "https://submitautomationrequest-vtxd5xddfq-rj.a.run.app",
    pollAutomationRequests = "https://pollautomationrequests-vtxd5xddfq-rj.a.run.app",
    completeAutomationRequest = "https://completeautomationrequest-vtxd5xddfq-rj.a.run.app",
    submitLightCommand = "https://submitlightcommand-vtxd5xddfq-rj.a.run.app",
    pollLightCommands = "https://polllightcommands-vtxd5xddfq-rj.a.run.app"
}


local Internet = require("internet.lua")

-- Trava local de emergencia: false impede qualquer chamada HTTP para Cloud Functions.
M.FUNCTIONS_ATIVAS = true

local function functionsAtivas()
    local global = rawget(_G, "CWNA_FIREBASE_FUNCTIONS_ATIVAS")
    if global ~= nil then
        local v = tostring(global):lower()
        return global == true or v == "true" or v == "sim" or v == "1" or v == "on"
    end
    return M.FUNCTIONS_ATIVAS ~= false
end

local camposItem = {
    "uidInventario", "nomeItem", "tipoItem", "subtipoMaterial", "RankItem", "imagemestilo2",
    "quantidade", "quantidadeDisplay", "nivelUpgrade", "textoUpgrade", "usaQuantidade",
    "hp", "pp", "ca", "rd", "dano", "cura", "raio", "luz", "raioLuz", "metrosLuz", "alcanceLuz", "lightIntense", "lightWeak", "potionEfeito", "potionValor", "potionDuracaoMinutos",
    "durabilidade", "durabilidadeMaxima", "durabilidadeDisplay", "durabilidadeBaseTempo", "durabilidadeDataBase",
    "origemLoja", "uidLojaOrigem", "precoLojaPrata", "descricaoLoja", "LivroReceitasAlquimistaLista", "LivroReceitasAlquimistaQtd", "LivroReceitasAlquimistaRank"
}

local camposBonusPotion = {
    "Forca", "Destreza", "Constituicao", "Inteligencia", "Sabedoria", "Carisma",
    "CA", "RD", "HP", "PP", "Dano",
    "BracoDeFerro", "Correr", "DanoCurtoAlcance", "DanoLongoAlcance",
    "EmpurrarObstaculo", "Escalar", "AcertoDistancia", "AcertoCurtoAlcance",
    "DesarmarArmadilha", "Esquivar", "Furtividade", "Iniciativa",
    "MontariaDirecao", "Roubo", "AcertoMagico", "IdentificarCriatura",
    "Investigacao", "LerManuscrito", "Medicina", "PrepararEstrategia",
    "Profissao", "ResistenciaMental", "DetectarMagia", "DanoMagico",
    "Historia", "Natureza", "PerceberMentira", "Percepcao", "Religiao",
    "Sobrevivencia", "Atuar", "Discurso", "Intimidar", "Mentir", "Seducao",
    "ResistenciaCansaco", "ResistirVeneno", "SegurarFolego", "SuporteFrioCalor"
}

local function trim(s)
    local out = tostring(s or ""):gsub("^%s*(.-)%s*$", "%1")
    return out
end

local function numberValue(v)
    local txt = trim(v)
    if txt == "" then return 0 end
    txt = txt:gsub("[^%d,%.-]", "")
    if txt:find(",") ~= nil and txt:find("%.") ~= nil then
        txt = txt:gsub("%.", ""):gsub(",", ".")
    else
        txt = txt:gsub(",", ".")
    end
    return tonumber(txt) or 0
end

local function invalidName(nome)
    nome = trim(nome)
    if nome == "" then return true end
    if nome:match("^%?+$") ~= nil then return true end
    if nome:match("%?%?%?%?%?") ~= nil then return true end
    if nome == "table" or nome:match("^table:") ~= nil then return true end
    return false
end

local function corrigirAcentos(txt)
    txt = tostring(txt or "")
    local trocas = {
        ["ÃƒÂ¡"]="Ã¡", ["ÃƒÂ "]="Ã ", ["ÃƒÂ¢"]="Ã¢", ["ÃƒÂ£"]="Ã£", ["ÃƒÂ¤"]="Ã¤",
        ["ÃƒÂ©"]="Ã©", ["ÃƒÂª"]="Ãª", ["ÃƒÂ­"]="Ã­", ["ÃƒÂ³"]="Ã³", ["ÃƒÂ´"]="Ã´", ["ÃƒÂµ"]="Ãµ", ["ÃƒÂº"]="Ãº", ["ÃƒÂ§"]="Ã§",
        ["Algodï¿½o"]="AlgodÃ£o", ["Aï¿½o"]="AÃ§o", ["Poï¿½ï¿½o"]="PoÃ§Ã£o", ["Coraï¿½ï¿½o"]="CoraÃ§Ã£o",
        ["Minï¿½rio"]="MinÃ©rio", ["Mï¿½gico"]="MÃ¡gico", ["Mï¿½gica"]="MÃ¡gica", ["Dracï¿½nico"]="DracÃ´nico"
    }
    for errado, certo in pairs(trocas) do txt = txt:gsub(errado, certo) end
    return txt
end

local function itemEquipamentoTroca(item)
    local usaQtd = tostring(item.usaQuantidade or ""):lower()
    if usaQtd == "true" or usaQtd == "sim" then return false end
    local tipo = tostring(item.tipoItem or ""):lower()
    if tipo == "material" or tipo == "pocao" or tipo:match("^po") ~= nil or tipo == "consumivel" or tipo:match("^consum") ~= nil then return false end
    return true
end

local function textoLevelItem(item)
    if not itemEquipamentoTroca(item) then return "" end
    local texto = trim(item.textoUpgrade)
    if texto ~= "" and texto:match("^%+") ~= nil then return texto end
    local nivel = math.floor(numberValue(item.nivelUpgrade or 0))
    return "+" .. tostring(nivel)
end

local function itemComDurabilidadeTroca(item)
    local tipo = tostring(item and item.tipoItem or ""):lower():gsub("^%s*(.-)%s*$", "%1")
    return tipo == "arma" or tipo == "capacete" or tipo == "peitoral" or tipo == "escudo" or tipo == "bota" or tipo == "calca" or tipo == "calça"
end

local function durabilidadeMaximaRankTroca(rank)
    local r = tostring(rank or "E"):upper()
    if r == "D" then return 30 end
    if r == "C" then return 40 end
    if r == "B" then return 50 end
    if r == "A" then return 60 end
    if r == "S" or r == "SS" then return 80 end
    return 20
end

local function garantirDurabilidadeSnapshot(item)
    if item == nil then return end
    if not itemComDurabilidadeTroca(item) then
        item.durabilidade = ""
        item.durabilidadeMaxima = ""
        item.durabilidadeDisplay = ""
        item.durabilidadeBaseTempo = ""
        item.durabilidadeDataBase = ""
        return
    end

    local maximo = numberValue(item.durabilidadeMaxima)
    if maximo <= 0 then maximo = durabilidadeMaximaRankTroca(item.RankItem) end
    local atual = numberValue(item.durabilidade)
    if atual <= 0 and trim(item.durabilidade) == "" then atual = maximo end
    if atual > maximo then atual = maximo end
    if atual < 0 then atual = 0 end

    item.durabilidadeMaxima = maximo
    item.durabilidade = atual
    item.durabilidadeDisplay = tostring(math.floor(atual))
    if numberValue(item.durabilidadeBaseTempo) <= 0 and trim(item.durabilidadeBaseTempo) == "" then
        item.durabilidadeBaseTempo = atual
    end
end
local function limparDocIdFirebase(txt)
    txt = corrigirAcentos(trim(txt))
    txt = txt:gsub("/", "-"):gsub("[%c]", " "):gsub("%s+", " ")
    txt = trim(txt)
    if txt == "" or txt == "." or txt == ".." or txt:match("^__.*__$") ~= nil then txt = "Item" end
    if string.len(txt) > 120 then txt = string.sub(txt, 1, 120) end
    return txt
end

local function idFirebaseLegivel(txt)
    return limparDocIdFirebase(txt):gsub("#", "N"):gsub("%$", "S"):gsub("%[", "("):gsub("%]", ")")
end

local function mesaDeFicha(ficha)
    local mesa = nil
    pcall(function()
        mesa = (rrpg and rrpg.getMesaDe and rrpg.getMesaDe(ficha)) or (Firecast and Firecast.getMesaDe and Firecast.getMesaDe(ficha))
    end)
    return mesa
end

local function jogadorDaMesa(ficha)
    local mesa = mesaDeFicha(ficha)
    if mesa == nil then return nil end
    return mesa.me or mesa.jogador or mesa.player or mesa.usuario or mesa.user
end


local function docIdItemFirebase(item, vistos)
    local uid = limparDocIdFirebase(trim(item.uidInventario or item.itemUid or ""))
    if uid ~= "" and uid ~= "Item" then return uid end

    local nome = corrigirAcentos(trim(item.nomeItem))
    if nome == "" then nome = "Item" end
    local base = limparDocIdFirebase(nome .. textoLevelItem(item))
    local usado = (vistos[base] or 0) + 1
    vistos[base] = usado
    if usado == 1 then return base end
    return limparDocIdFirebase(base .. " #" .. tostring(usado))
end

local function displayIdItemFirebase(item, vistos)
    local nome = corrigirAcentos(trim(item.nomeItem))
    if nome == "" then nome = trim(item.uidInventario) end
    local base = limparDocIdFirebase(nome .. textoLevelItem(item))
    local usado = (vistos[base] or 0) + 1
    vistos[base] = usado
    if usado == 1 then return base end
    return limparDocIdFirebase(base .. " #" .. tostring(usado))
end

local function jsonEscape(s)
    s = tostring(s or "")
    s = s:gsub("\\", "\\\\")
    s = s:gsub('"', '\\"')
    s = s:gsub("\r", "\\r")
    s = s:gsub("\n", "\\n")
    s = s:gsub("\t", "\\t")
    return s
end

local function isArray(t)
    if type(t) ~= "table" then return false end
    local max = 0
    local count = 0
    for k, _ in pairs(t) do
        if type(k) ~= "number" then return false end
        if k > max then max = k end
        count = count + 1
    end
    return max == count
end

local function encodeValue(v)
    local tv = type(v)
    if tv == "nil" then return "null" end
    if tv == "boolean" then return v and "true" or "false" end
    if tv == "number" then return tostring(v) end
    if tv == "table" then
        local parts = {}
        if isArray(v) then
            for i = 1, #v do table.insert(parts, encodeValue(v[i])) end
            return "[" .. table.concat(parts, ",") .. "]"
        end
        for k, val in pairs(v) do
            table.insert(parts, '"' .. jsonEscape(k) .. '":' .. encodeValue(val))
        end
        return "{" .. table.concat(parts, ",") .. "}"
    end
    return '"' .. jsonEscape(v) .. '"'
end

function M.encode(t)
    return encodeValue(t)
end

local function jsonUnescape(s)
    s = tostring(s or "")
    s = s:gsub('\\"', '"')
    s = s:gsub('\\n', '\n')
    s = s:gsub('\\r', '\r')
    s = s:gsub('\\t', '\t')
    s = s:gsub('\\\\', '\\')
    return corrigirAcentos(s)
end

local function jsonValueByKey(json, key)
    local escapedKey = tostring(key or ""):gsub("([%%%^%$%(%)%%.%[%]%*%+%-%?])", "%%%1")
    local raw = json:match('"' .. escapedKey .. '"%s*:%s*"(.-)"')
    if raw ~= nil then return jsonUnescape(raw) end
    local num = json:match('"' .. escapedKey .. '"%s*:%s*([%-%d%.]+)')
    if num ~= nil then return tonumber(num) or num end
    local bool = json:match('"' .. escapedKey .. '"%s*:%s*(true)')
    if bool ~= nil then return true end
    bool = json:match('"' .. escapedKey .. '"%s*:%s*(false)')
    if bool ~= nil then return false end
    return nil
end

local function decodeOfferSlots(json, side)
    local items = {}
    for i = 1, 10 do
        local item = {}
        local found = false
        local prefix = side .. "Item" .. tostring(i) .. "_"
        for _, campo in ipairs(camposItem) do
            local valor = jsonValueByKey(json, prefix .. campo)
            if valor ~= nil then
                item[campo] = valor
                found = true
            end
        end
        local qtd = jsonValueByKey(json, prefix .. "quantity")
        if qtd ~= nil then
            item.quantidade = qtd
            found = true
        end
        if found then
            table.insert(items, item)
        end
    end
    return items
end
local function decodeBasic(json)
    json = tostring(json or "")
    local t = { raw = json }
    t.ok = json:match('"ok"%s*:%s*true') ~= nil
    t.error = json:match('"error"%s*:%s*"(.-)"')
    t.tradeId = json:match('"tradeId"%s*:%s*"(.-)"')
    t.code = json:match('"code"%s*:%s*"(.-)"')
    t.status = json:match('"status"%s*:%s*"(.-)"')
    t.hostName = json:match('"hostName"%s*:%s*"(.-)"')
    t.guestName = json:match('"guestName"%s*:%s*"(.-)"')
    t.hostCharacterId = json:match('"hostCharacterId"%s*:%s*"(.-)"')
    t.guestCharacterId = json:match('"guestCharacterId"%s*:%s*"(.-)"')
    t.totalItems = tonumber(json:match('"totalItems"%s*:%s*(%d+)'))
    local hostGoldRaw = json:match('"hostGold"%s*:%s*(%d+)')
    local hostSilverRaw = json:match('"hostSilver"%s*:%s*(%d+)')
    local guestGoldRaw = json:match('"guestGold"%s*:%s*(%d+)')
    local guestSilverRaw = json:match('"guestSilver"%s*:%s*(%d+)')
    t.hostGold = hostGoldRaw ~= nil and tonumber(hostGoldRaw) or nil
    t.hostSilver = hostSilverRaw ~= nil and tonumber(hostSilverRaw) or nil
    t.guestGold = guestGoldRaw ~= nil and tonumber(guestGoldRaw) or nil
    t.guestSilver = guestSilverRaw ~= nil and tonumber(guestSilverRaw) or nil
    t.hostConfirmed = json:match('"hostConfirmed"%s*:%s*true') ~= nil
    t.guestConfirmed = json:match('"guestConfirmed"%s*:%s*true') ~= nil
    t.hostItems = decodeOfferSlots(json, "host")
    t.guestItems = decodeOfferSlots(json, "guest")
    t.potionBonuses = {}
    for _, campo in ipairs(camposBonusPotion) do
        local escaped = campo:gsub("([%%%^%$%(%)%%.%[%]%*%+%-%?])", "%%%1")
        t.potionBonuses[campo] = tonumber(json:match('"' .. escaped .. '"%s*:%s*([%-%d%.]+)')) or 0
    end
    t.durationMinutes = tonumber(json:match('"durationMinutes"%s*:%s*([%-%d%.]+)')) or 0
    t.remainingSeconds = tonumber(json:match('"remainingSeconds"%s*:%s*([%-%d%.]+)')) or 0
    t.stat = json:match('"stat"%s*:%s*"(.-)"')
    t.value = tonumber(json:match('"value"%s*:%s*([%-%d%.]+)')) or 0
    return t
end

local function endpoint(baseUrl, name)
    if M.DIRECT_FUNCTION_URLS ~= nil and M.DIRECT_FUNCTION_URLS[name] ~= nil then
        return M.DIRECT_FUNCTION_URLS[name]
    end
    baseUrl = trim(baseUrl)
    if baseUrl == "" or baseUrl:match("crystal%-world%-new%-adventure") ~= nil then
        baseUrl = M.DEFAULT_FUNCTIONS_URL
    end
    if baseUrl == "" then return "" end
    baseUrl = baseUrl:gsub("/+$", "")
    for _, fname in ipairs({"syncInventory", "registerCharacterOpen", "claimDailyCollection", "useTimedPotion", "getActivePotionEffects", "createTrade", "joinTrade", "addItemToTrade", "removeItemFromTrade", "setTradeCurrency", "confirmTrade", "completeTrade", "cancelTrade", "getTrade"}) do
        baseUrl = baseUrl:gsub("/" .. fname .. "$", "")
    end
    return baseUrl .. "/" .. name
end

function M.post(baseUrl, name, payload, callback)
    if not functionsAtivas() then
        if callback ~= nil then callback(false, { error = "Cloud Functions desativadas nesta ficha.", disabled = true }) end
        return
    end
    local url = endpoint(baseUrl, name)
    if url == "" then
        if callback ~= nil then callback(false, { error = "Configure a URL das Cloud Functions." }) end
        return
    end

    local req = Internet.newHTTPRequest("POST", url)
    req:setRequestHeader("Content-Type", "application/json; charset=utf-8")
    req:addEventListener("onResponse", function()
        local body = req.responseText or ""
        local parsed = decodeBasic(body)
        local status = tonumber(req.status or 0) or 0
        local ok = parsed.ok and status >= 200 and status < 300
        if not ok and trim(parsed.error) == "" then
            parsed.error = "HTTP " .. tostring(req.status or "?") .. " em " .. url
        end
        if callback ~= nil then callback(ok, parsed, body, req.status) end
    end)
    req:addEventListener("onError", function(errorMsg)
        if callback ~= nil then callback(false, { error = tostring(errorMsg or "Erro de rede") }) end
    end)
    req:send(M.encode(payload or {}))
end

function M.ensureCharacterId(ficha)
    if ficha == nil then return "" end
    local playerBase = idFirebaseLegivel(M.playerName(ficha))
    local charBase = idFirebaseLegivel(M.characterName(ficha))
    if playerBase == "Item" or playerBase == "Jogador" then playerBase = "Jogador" end
    if charBase == "Item" or charBase == "Personagem" then charBase = "Personagem" end
    local desejado = playerBase .. "__" .. charBase
    local atual = trim(ficha.FirebaseCharacterId)
    if atual == "" or atual:match("^char_") ~= nil or atual:match("__") == nil or atual ~= desejado then
        ficha.FirebaseCharacterId = desejado
    end
    return tostring(ficha.FirebaseCharacterId or "")
end

local function nomeValido(v)
    local nome = trim(v)
    if invalidName(nome) then return nil end
    return nome
end

local function nomeDeObjeto(obj)
    if obj == nil then return nil end
    local direto = nomeValido(obj.nome or obj.name or obj.nick or obj.nickname or obj.login)
    if direto ~= nil then return direto end
    local nomesMetodos = {"getNome", "getName", "getNick", "getLogin", "getTitulo", "getTitle"}
    for _, metodo in ipairs(nomesMetodos) do
        if obj[metodo] ~= nil then
            local ok, valor = pcall(function() return obj[metodo](obj) end)
            local nome = ok and nomeValido(valor) or nil
            if nome ~= nil then return nome end
        end
    end
    return nil
end

function M.characterName(ficha)
    local achado = nil
    pcall(function()
        local mesa = mesaDeFicha(ficha)
        local jogador = jogadorDaMesa(ficha)
        local candidatos = {
            mesa and mesa.meupersonagem,
            mesa and mesa.meuPersonagem,
            mesa and mesa.personagemAtual,
            jogador and jogador.meupersonagem,
            jogador and jogador.meuPersonagem,
            jogador and jogador.personagemAtual,
            jogador and jogador.personagem,
            jogador and jogador.character,
        }
        for _, candidato in ipairs(candidatos) do
            local nome = nomeValido(candidato) or nomeDeObjeto(candidato)
            if nome ~= nil then achado = nome; return end
        end
        local metodos = {"getPersonagem", "getPersonagemAtual", "getMeuPersonagem", "getCharacter", "getCurrentCharacter"}
        for _, metodo in ipairs(metodos) do
            if jogador ~= nil and jogador[metodo] ~= nil then
                local ok, personagem = pcall(function() return jogador[metodo](jogador) end)
                local nome = ok and (nomeValido(personagem) or nomeDeObjeto(personagem)) or nil
                if nome ~= nil then achado = nome; return end
            end
            if mesa ~= nil and mesa[metodo] ~= nil then
                local ok, personagem = pcall(function() return mesa[metodo](mesa) end)
                local nome = ok and (nomeValido(personagem) or nomeDeObjeto(personagem)) or nil
                if nome ~= nil then achado = nome; return end
            end
        end
    end)

    if achado ~= nil then return achado end
    local nome = nomeValido(ficha and ficha.meupersonagem) or nomeValido(ficha and ficha.MeuPersonagem) or nomeValido(ficha and ficha.NomePersonagem)
    return nome or "Personagem"
end

function M.playerName(ficha)
    local achado = nil
    pcall(function()
        local jogador = jogadorDaMesa(ficha)
        local candidatos = {
            jogador and jogador.login, jogador and jogador.nick, jogador and jogador.nickname,
            jogador and jogador.name, jogador and jogador.nome, jogador and jogador.usuario, jogador and jogador.user
        }
        for _, candidato in ipairs(candidatos) do
            local nome = nomeValido(candidato) or nomeDeObjeto(candidato)
            if nome ~= nil then achado = nome; return end
        end
        local metodos = {"getLogin", "getNick", "getNickname", "getUserName", "getNome", "getName"}
        for _, metodo in ipairs(metodos) do
            if jogador ~= nil and jogador[metodo] ~= nil then
                local ok, valor = pcall(function() return jogador[metodo](jogador) end)
                local nome = ok and nomeValido(valor) or nil
                if nome ~= nil then achado = nome; return end
            end
        end
    end)
    return achado or "Jogador"
end

function M.tableName(ficha)
    local achado = nil
    pcall(function()
        local mesa = mesaDeFicha(ficha)
        local candidatos = {mesa and mesa.nome, mesa and mesa.name, mesa and mesa.titulo, mesa and mesa.title}
        for _, candidato in ipairs(candidatos) do
            local nome = nomeValido(candidato) or nomeDeObjeto(candidato)
            if nome ~= nil then achado = nome; return end
        end
        local metodos = {"getNome", "getName", "getTitulo", "getTitle"}
        for _, metodo in ipairs(metodos) do
            if mesa ~= nil and mesa[metodo] ~= nil then
                local ok, valor = pcall(function() return mesa[metodo](mesa) end)
                local nome = ok and nomeValido(valor) or nil
                if nome ~= nil then achado = nome; return end
            end
        end
    end)
    return achado or "Mesa desconhecida"
end

function M.displayName(ficha)
    return M.characterName(ficha)
end

function M.exportInventory(ficha)
    local items = {}
    local vistosDocId = {}
    local vistosDisplayId = {}
    local vistosUid = {}
    if ficha == nil or ficha.magias2 == nil then return items end

    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if item ~= nil and tostring(item.slotVazio or "") ~= "true" then
            local out = {}
            for _, campo in ipairs(camposItem) do
                local valor = item[campo] or ""
                if type(valor) == "string" then valor = corrigirAcentos(valor) end
                out[campo] = valor
            end

            if trim(out.uidInventario) == "" or vistosUid[trim(out.uidInventario)] ~= nil then
                out.uidInventario = "item_" .. tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
                item.uidInventario = out.uidInventario
            end

            if trim(out.nomeItem) == "" then
                local fallbackNome = item.nomeItem or item.nome or item.name or item.Nome or item.titulo or item.label or item.text or item.descricaoLoja or out.uidInventario
                out.nomeItem = corrigirAcentos(trim(fallbackNome))
                if out.nomeItem == "" then out.nomeItem = out.uidInventario end
                item.nomeItem = out.nomeItem
            end

            if trim(out.nomeItem) ~= "" then
                vistosUid[trim(out.uidInventario)] = true
                garantirDurabilidadeSnapshot(out)
                item.durabilidade = out.durabilidade
                item.durabilidadeMaxima = out.durabilidadeMaxima
                item.durabilidadeDisplay = out.durabilidadeDisplay
                item.durabilidadeBaseTempo = out.durabilidadeBaseTempo
                item.durabilidadeDataBase = out.durabilidadeDataBase
                out.firebaseDocId = docIdItemFirebase(out, vistosDocId)
                out.displayId = displayIdItemFirebase(out, vistosDisplayId)
                table.insert(items, out)
            end
        end
    end

    return items
end
function M.syncInventory(ficha, callback)
    local payload = {
        characterId = M.ensureCharacterId(ficha),
        playerName = M.playerName(ficha),
        characterName = M.characterName(ficha),
        tableName = M.tableName(ficha),
        gold = numberValue(ficha and ficha.OuroPersonagem),
        silver = numberValue(ficha and ficha.PrataPersonagem),
        items = M.exportInventory(ficha)
    }
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "syncInventory", payload, callback)
end

function M.registerCharacterOpen(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "registerCharacterOpen", {
        characterId = M.ensureCharacterId(ficha),
        playerName = M.playerName(ficha),
        characterName = M.characterName(ficha),
        tableName = M.tableName(ficha),
        gold = numberValue(ficha and ficha.OuroPersonagem),
        silver = numberValue(ficha and ficha.PrataPersonagem)
    }, callback)
end

function M.claimDailyCollection(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "claimDailyCollection", {
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        tableName = M.tableName(ficha)
    }, callback)
end

function M.applyPotionBonusesToSheet(ficha, resposta)
    if ficha == nil then return end
    resposta = resposta or {}
    local bonuses = resposta.potionBonuses or {}
    for _, campo in ipairs(camposBonusPotion) do
        ficha["PotionBonus" .. campo] = tostring(bonuses[campo] or 0)
    end
end

function M.useTimedPotion(ficha, item, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "useTimedPotion", {
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        tableName = M.tableName(ficha),
        potionName = tostring(item and item.nomeItem or item and item.tipoItem or "")
    }, function(ok, resposta, body, status)
        if ok then M.applyPotionBonusesToSheet(ficha, resposta) end
        if callback ~= nil then callback(ok, resposta, body, status) end
    end)
end

function M.getActivePotionEffects(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "getActivePotionEffects", {
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        tableName = M.tableName(ficha)
    }, function(ok, resposta, body, status)
        if ok then M.applyPotionBonusesToSheet(ficha, resposta) end
        if callback ~= nil then callback(ok, resposta, body, status) end
    end)
end

function M.createTrade(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "createTrade", {
        hostCharacterId = M.ensureCharacterId(ficha),
        hostName = M.displayName(ficha),
        playerName = M.playerName(ficha),
        tableName = M.tableName(ficha)
    }, callback)
end

function M.joinTrade(ficha, code, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "joinTrade", {
        code = code,
        guestCharacterId = M.ensureCharacterId(ficha),
        guestName = M.displayName(ficha),
        playerName = M.playerName(ficha),
        tableName = M.tableName(ficha)
    }, callback)
end


function M.itemByUid(ficha, uid)
    uid = trim(uid)
    if ficha == nil or ficha.magias2 == nil or uid == "" then return nil end
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if trim(item.uidInventario) == uid then return item end
    end
    return nil
end

function M.itemSnapshotByUid(ficha, uid)
    local item = M.itemByUid(ficha, uid)
    if item == nil then return nil end
    local out = {}
    for _, campo in ipairs(camposItem) do
        local valor = item[campo] or ""
        if type(valor) == "string" then valor = corrigirAcentos(valor) end
        out[campo] = valor
    end
    if trim(out.uidInventario) == "" then
        out.uidInventario = "item_" .. tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
        item.uidInventario = out.uidInventario
    end
    if trim(out.nomeItem) == "" then
        local fallbackNome = item.nomeItem or item.nome or item.name or item.Nome or item.titulo or item.label or item.text or item.descricaoLoja or out.uidInventario
        out.nomeItem = corrigirAcentos(trim(fallbackNome))
        if out.nomeItem == "" then out.nomeItem = out.uidInventario end
        item.nomeItem = out.nomeItem
    end
    garantirDurabilidadeSnapshot(out)
    item.durabilidade = out.durabilidade
    item.durabilidadeMaxima = out.durabilidadeMaxima
    item.durabilidadeDisplay = out.durabilidadeDisplay
    item.durabilidadeBaseTempo = out.durabilidadeBaseTempo
    item.durabilidadeDataBase = out.durabilidadeDataBase
    local vistosDocId = {}
    local vistosDisplayId = {}
    out.firebaseDocId = docIdItemFirebase(out, vistosDocId)
    out.displayId = displayIdItemFirebase(out, vistosDisplayId)
    return out
end


local function codigoTrocaAtual(ficha)
    local atual = trim(ficha and ficha.TradeCodigoAtual)
    if atual ~= "" then return atual end
    return trim(ficha and ficha.TradeCodigoEntrada)
end

function M.addItemToTrade(ficha, uid, quantity, callback)
    if type(quantity) == "function" and callback == nil then
        callback = quantity
        quantity = nil
    end
    local item = M.itemSnapshotByUid(ficha, uid)
    if item == nil then
        if callback ~= nil then callback(false, { error = "Item nao encontrado no inventario." }) end
        return
    end
    local qtd = math.max(1, math.floor(numberValue(quantity or 1)))
    item.quantidade = qtd
    item.quantidadeDisplay = tostring(qtd)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "addItemToTrade", {
        tradeId = trim(ficha and ficha.TradeIdAtual),
        code = codigoTrocaAtual(ficha),
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        item = item,
        quantity = qtd
    }, callback)
end

function M.removeItemFromTrade(ficha, uid, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "removeItemFromTrade", {
        tradeId = trim(ficha and ficha.TradeIdAtual),
        code = codigoTrocaAtual(ficha),
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        itemUid = uid
    }, callback)
end

function M.setTradeCurrency(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "setTradeCurrency", {
        tradeId = trim(ficha and ficha.TradeIdAtual),
        code = codigoTrocaAtual(ficha),
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        gold = numberValue(ficha and ficha.TradeOuroOferta),
        silver = numberValue(ficha and ficha.TradePrataOferta)
    }, callback)
end

function M.confirmTrade(ficha, confirmed, callback)
    if type(confirmed) == "function" then
        callback = confirmed
        confirmed = true
    end
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "confirmTrade", {
        tradeId = trim(ficha and ficha.TradeIdAtual),
        code = codigoTrocaAtual(ficha),
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha),
        confirmed = confirmed == true
    }, callback)
end
function M.completeTrade(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "completeTrade", {
        tradeId = trim(ficha and ficha.TradeIdAtual),
        code = codigoTrocaAtual(ficha),
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha)
    }, callback)
end
function M.cancelTrade(ficha, callback)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "cancelTrade", {
        tradeId = trim(ficha and ficha.TradeIdAtual),
        code = codigoTrocaAtual(ficha),
        characterId = M.ensureCharacterId(ficha),
        characterName = M.characterName(ficha),
        playerName = M.playerName(ficha)
    }, callback)
end
function M.getTrade(ficha, callback)
    local tradeId = trim(ficha and ficha.TradeIdAtual)
    local code = codigoTrocaAtual(ficha)
    M.post(ficha and ficha.FirebaseFunctionsUrl or "", "getTrade", { tradeId = tradeId, code = code }, callback)
end

return M
