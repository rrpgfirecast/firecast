local Presets = {};

local function setFields(sheet, fields)
    if sheet == nil or fields == nil then return; end;

    for key, value in pairs(fields) do
        sheet[key] = value;
    end;
end;

Presets.types = {
    normal={tipo="Normal"},
    fogo={tipo="Fogo"},
    agua={tipo="Água"},
    planta={tipo="Planta"},
    eletrico={tipo="Elétrico"},
    gelo={tipo="Gelo"},
    lutador={tipo="Lutador"},
    venenoso={tipo="Venenoso"},
    terrestre={tipo="Terrestre"},
    voador={tipo="Voador"},
    psiquico={tipo="Psíquico"},
    inseto={tipo="Inseto"},
    pedra={tipo="Pedra"},
    fantasma={tipo="Fantasma"},
    dragao={tipo="Dragão"},
    sombrio={tipo="Sombrio"},
    aco={tipo="Aço"},
    fada={tipo="Fada"},
    customBlank={tipo=""}
};

function Presets.applyType(sheet, key)
    setFields(sheet, Presets.types[key]);
end;

return Presets;
