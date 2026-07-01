local NDB = require("ndb.lua");

local SheetBackup = {};

local GENERATED_TEXT_FIELDS = {
    "modoTextoAtualizado",
    "modoTextoGolpesInterpretativosNomes",
    "modoTextoGolpesPrincipaisNomes",
    "modoTextoInventarioNomes",
    "modoTextoGeradoBase",
    "modoTextoTexto"
};

local function rootSheet(node)
    if node == nil then return nil; end;
    return NDB.getRoot(node) or node;
end;

function SheetBackup.exportXML(node)
    local root = rootSheet(node);
    if root == nil then
        return nil, "Ficha nao encontrada.";
    end;

    local ok, xmlOrError = pcall(function()
        return NDB.exportXML(root);
    end);

    if not ok then
        return nil, tostring(xmlOrError);
    end;

    if xmlOrError == nil or xmlOrError == "" then
        return nil, "O Firecast retornou um backup vazio.";
    end;

    for _, fieldName in ipairs(GENERATED_TEXT_FIELDS) do
        xmlOrError = string.gsub(xmlOrError, "%s" .. fieldName .. "=\".-\"", "");
        xmlOrError = string.gsub(xmlOrError, "%st_" .. fieldName .. "=\".-\"", "");
    end;

    -- O monitor de sorte e um registro de sessao, nao um dado da personagem.
    xmlOrError = string.gsub(xmlOrError, "%sazar[%w_]*=\".-\"", "");
    xmlOrError = string.gsub(xmlOrError, "%st_azar[%w_]*=\".-\"", "");

    xmlOrError = string.gsub(xmlOrError, "<modoTextoRich>.-</modoTextoRich>", "");

    return xmlOrError, nil;
end;

return SheetBackup;
