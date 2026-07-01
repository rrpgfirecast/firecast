local PokemonTokenSync = {};

local rrpg = require("rrpg.lua");
local dialogs = require("dialogs.lua");

local sceneOk, SceneLib = pcall(require, "scene.lua");
if not sceneOk then
    SceneLib = nil;
end;

local UID_FIELD = "pokemonSheetUID";
local TOKEN_PLUGIN_FIELD = "pokemonPluginId";
local TOKEN_CHARACTER_FIELD = "pokemonCharacterCode";
local TOKEN_NAME_FIELD = "pokemonNomeSnapshot";
local PLUGIN_ID = "br.com.sb2.PokemonBetaVisual";

local function trim(value)
    if value == nil then return nil; end;
    return tostring(value):match("^%s*(.-)%s*$");
end;

local function parseNumber(value)
    local text = trim(value);
    if text == nil or text == "" then return 0; end;

    text = string.gsub(text, ",", ".");

    local numberText = string.match(text, "[-+]?%d+%.?%d*");
    local number = tonumber(numberText);

    if number == nil or number < 0 then return 0; end;
    return math.floor(number);
end;

local function sheetUID(root)
    return trim(root ~= nil and root[UID_FIELD] or nil);
end;

local function newUID(root)
    local timePart = "0";
    if os ~= nil and os.time ~= nil then
        timePart = tostring(os.time());
    end;

    local randomPart = tostring(math.random(100000, 999999));
    local rootPart = tostring(root or ""):gsub("%W", "");
    if rootPart == "" then rootPart = "sheet"; end;

    return "PKM-" .. timePart .. "-" .. randomPart .. "-" .. rootPart;
end;

local function ensureSheetUID(root)
    if root == nil then return nil; end;

    local uid = sheetUID(root);
    if uid ~= nil and uid ~= "" then return uid; end;

    uid = newUID(root);
    local ok = pcall(function()
        root[UID_FIELD] = uid;
    end);

    if ok then return uid; end;
    return nil;
end;

local function characterOf(root)
    if root == nil or rrpg == nil or rrpg.getPersonagemDe == nil then return nil; end;

    local ok, personagem = pcall(rrpg.getPersonagemDe, root);
    if ok then return personagem; end;
    return nil;
end;

local function characterCode(personagem)
    if personagem == nil then return nil; end;

    local ok, code = pcall(function()
        return personagem.codigoInterno;
    end);

    if ok then
        return tonumber(code);
    end;

    return nil;
end;

local function loadedScenes()
    if SceneLib == nil or SceneLib.getLoadedScenes == nil then return {}; end;

    local ok, scenes = pcall(SceneLib.getLoadedScenes);
    if ok and type(scenes) == "table" then return scenes; end;
    return {};
end;

local function isToken(item)
    if item == nil then return false; end;

    local okType, isTokenType = pcall(function()
        return item:isType("token");
    end);

    if okType and isTokenType == true then return true; end;

    local okObjectType, objectType = pcall(function()
        return item.objectType;
    end);

    return okObjectType and tostring(objectType) == "token";
end;

local function tokenUserData(token)
    if token == nil then return nil; end;

    local ok, data = pcall(function()
        return token.userData;
    end);

    if ok then return data; end;
    return nil;
end;

local function tokenLinkedUID(token)
    local data = tokenUserData(token);
    if data == nil then return nil; end;
    return trim(data[UID_FIELD]);
end;

local function pokemonName(root)
    local name = trim(root ~= nil and root.nomePokemon or nil);
    if name == nil or name == "" then
        name = trim(root ~= nil and root.apelidoPokemon or nil);
    end;
    if name == nil or name == "" then
        name = "Pokemon";
    end;
    return name;
end;

local function forEachOpenToken(callback)
    local scenes = loadedScenes();

    for _, scene in ipairs(scenes) do
        local okScene, items = pcall(function()
            return scene.items;
        end);

        if okScene and items ~= nil then
            local okCount, count = pcall(function()
                return items.count or 0;
            end);

            if okCount then
                for i = 1, count do
                    local okItem, token = pcall(function()
                        return items:get(i);
                    end);

                    if okItem and isToken(token) then
                        callback(token, scene);
                    end;
                end;
            end;
        end;
    end;
end;

local function selectedTokens()
    local result = {};
    local scenes = loadedScenes();

    for _, scene in ipairs(scenes) do
        local okItems, items = pcall(function()
            return scene.items;
        end);

        if okItems and items ~= nil then
            local okSelection, selection = pcall(function()
                return items.selection;
            end);

            if okSelection and type(selection) == "table" then
                for _, item in ipairs(selection) do
                    if isToken(item) then
                        table.insert(result, {token=item, scene=scene});
                    end;
                end;
            end;
        end;
    end;

    return result;
end;

local function collectLinkedTokens(root)
    local personagem = characterOf(root);
    local code = characterCode(personagem);
    local uid = sheetUID(root);
    local tokens = {};

    local scenes = loadedScenes();
    if #scenes == 0 then
        return tokens, "Nenhum grid aberto no Firecast. Abra o grid onde o token esta.";
    end;

    if uid ~= nil and uid ~= "" then
        forEachOpenToken(function(token, scene)
            if tokenLinkedUID(token) == uid then
                table.insert(tokens, {token=token, scene=scene});
            end;
        end);

        if #tokens > 0 then
            return tokens, nil;
        end;
    end;

    if code ~= nil and code ~= 0 then
        forEachOpenToken(function(token, scene)
            local okOwner, owner = pcall(function()
                return token.ownerCharacter;
            end);

            if okOwner and tonumber(owner) == code then
                table.insert(tokens, {token=token, scene=scene});
            end;
        end);

        if #tokens > 0 then
            return tokens, nil;
        end;
    end;

    if #tokens == 0 then
        return tokens, "Nao encontrei token vinculado. Selecione o token no grid e clique em Vincular token selecionado.";
    end;

    return tokens, nil;
end;

local function movementValue(root)
    local value = parseNumber(root ~= nil and root.deslocamentoValor or nil);
    if value <= 0 then return ""; end;
    return tostring(value);
end;

local function updateTokenBars(token, root)
    local pvAtualTexto = trim(root.pvAtual);
    local peAtualTexto = trim(root.peAtual);
    local pvAtual = parseNumber(root.pvAtual);
    local pvMaximo = parseNumber(root.pvMaximo);
    local peAtual = parseNumber(root.peAtual);
    local peMaximo = parseNumber(root.peMaximo);
    local name = pokemonName(root);

    if pvMaximo <= 0 then pvMaximo = pvAtual; end;
    if peMaximo <= 0 then peMaximo = peAtual; end;
    if (pvAtualTexto == nil or pvAtualTexto == "") and pvMaximo > 0 then pvAtual = pvMaximo; end;
    if (peAtualTexto == nil or peAtualTexto == "") and peMaximo > 0 then peAtual = peMaximo; end;

    local desired = {
        name=name,
        barValue1=tostring(pvAtual),
        barMax1=tostring(pvMaximo),
        barColor1="#FF5A5A",
        barValue2=tostring(peAtual),
        barMax2=tostring(peMaximo),
        barColor2="#8A5CFF",
        barValue3=movementValue(root),
        barMax3=movementValue(root),
        barColor3="#00BFFF"
    };

    local changed = false;
    for fieldName, desiredValue in pairs(desired) do
        local currentValue = nil;
        local readOk = pcall(function() currentValue = token[fieldName]; end);
        if not readOk or tostring(currentValue or "") ~= tostring(desiredValue or "") then
            changed = true;
            break;
        end;
    end;

    if not changed then return false; end;

    local began = false;
    local ok = pcall(function()
        token:beginUpdate();
        began = true;

        token.name = desired.name;

        token.barValue1 = desired.barValue1;
        token.barMax1 = desired.barMax1;
        token.barColor1 = desired.barColor1;

        token.barValue2 = desired.barValue2;
        token.barMax2 = desired.barMax2;
        token.barColor2 = desired.barColor2;

        token.barValue3 = desired.barValue3;
        token.barMax3 = desired.barMax3;
        token.barColor3 = desired.barColor3;
    end);

    if began then
        pcall(function() token:endUpdate(); end);
    end;

    return ok;
end;

local function writeTokenLink(token, root)
    local uid = ensureSheetUID(root);
    if uid == nil or uid == "" then
        return false;
    end;

    local personagem = characterOf(root);
    local code = characterCode(personagem);
    local data = tokenUserData(token);

    if data == nil then
        return false;
    end;

    local ok = pcall(function()
        data[UID_FIELD] = uid;
        data[TOKEN_PLUGIN_FIELD] = PLUGIN_ID;
        data[TOKEN_CHARACTER_FIELD] = tostring(code or "");
        data[TOKEN_NAME_FIELD] = pokemonName(root);
    end);

    if not ok then return false; end;

    pcall(function()
        token.name = pokemonName(root);
        if code ~= nil and code ~= 0 then
            token.ownerCharacter = code;
        end;
    end);

    return true;
end;

local function updateTokenPhoto(token, imageURL)
    local began = false;
    local ok = pcall(function()
        token:beginUpdate();
        began = true;

        local image = token.image;
        if image ~= nil then
            image.url = imageURL;
        end;
    end);

    if began then
        pcall(function() token:endUpdate(); end);
    end;

    return ok;
end;

local function sendScenes(tokens)
    local sent = {};

    for _, entry in ipairs(tokens) do
        local scene = entry.scene;
        if scene ~= nil and sent[scene.objectID] ~= true then
            sent[scene.objectID] = true;
            pcall(function()
                scene:sendDelayedUpdates();
            end);
        end;
    end;
end;

function PokemonTokenSync.linkSelectedToken(root)
    if root == nil then
        dialogs.alert("Nao encontrei a ficha para vincular o token.");
        return 0;
    end;

    local selected = selectedTokens();

    if #selected == 0 then
        dialogs.alert("Selecione um token no grid aberto e tente novamente.");
        return 0;
    end;

    if #selected > 1 then
        dialogs.alert("Mais de um token selecionado. Deixe apenas o token deste Pokemon selecionado.");
        return 0;
    end;

    local entry = selected[1];
    if not writeTokenLink(entry.token, root) then
        dialogs.alert("Nao consegui gravar o vinculo no token selecionado.");
        return 0;
    end;

    updateTokenBars(entry.token, root);

    local imageURL = trim(root.fotoAptidoes);
    if imageURL ~= nil and imageURL ~= "" then
        updateTokenPhoto(entry.token, imageURL);
    end;

    sendScenes({entry});
    dialogs.alert("Token vinculado a esta ficha.\nNome e barrinhas ja foram sincronizados.");
    return 1;
end;

function PokemonTokenSync.syncTokenBars(root, showAlert)
    local tokens, reason = collectLinkedTokens(root);
    if #tokens == 0 then
        if showAlert then dialogs.alert(reason or "Nao encontrei o token vinculado."); end;
        return 0, reason;
    end;

    local updated = 0;
    local changedTokens = {};
    for _, entry in ipairs(tokens) do
        if updateTokenBars(entry.token, root) then
            updated = updated + 1;
            table.insert(changedTokens, entry);
        end;
    end;

    sendScenes(changedTokens);

    if showAlert then
        dialogs.alert("Barrinhas sincronizadas em " .. tostring(updated) .. " token(s).");
    end;

    return updated, nil;
end;

function PokemonTokenSync.syncTokenPhoto(root, showAlert)
    local imageURL = trim(root ~= nil and root.fotoAptidoes or nil);

    if imageURL == nil or imageURL == "" then
        local reason = "A foto do Perfil Visual ainda esta vazia.";
        if showAlert then dialogs.alert(reason); end;
        return 0, reason;
    end;

    local tokens, reason = collectLinkedTokens(root);
    if #tokens == 0 then
        if showAlert then dialogs.alert(reason or "Nao encontrei o token vinculado."); end;
        return 0, reason;
    end;

    local updated = 0;
    for _, entry in ipairs(tokens) do
        if updateTokenPhoto(entry.token, imageURL) then
            updateTokenBars(entry.token, root);
            updated = updated + 1;
        end;
    end;

    sendScenes(tokens);

    if showAlert then
        dialogs.alert("Foto e barrinhas enviadas para " .. tostring(updated) .. " token(s) vinculado(s).");
    end;

    return updated, nil;
end;

return PokemonTokenSync;
