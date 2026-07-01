local Presets = {};

local function setFields(sheet, fields)
    if sheet == nil or fields == nil then return; end;

    for key, value in pairs(fields) do
        sheet[key] = value;
    end;
end;

Presets.categories = {
    passiva={
        categoria="Passiva",
        acao="Sempre ativa",
        tags="Passiva",
        custo="--",
        bonus="",
        teste="",
        formula="1d20",
        resumoCurto="Sempre ativa ou quase sempre ativa."
    },
    ativa={
        categoria="Ativa",
        acao="Declarar uso",
        tags="Ativa",
        custo="--",
        bonus="",
        teste="",
        formula="1d20",
        resumoCurto="Precisa declarar uso para gerar efeito."
    },
    reacao={
        categoria="Reação",
        acao="Reação",
        tags="Reação",
        custo="--",
        bonus="",
        teste="",
        formula="1d20",
        resumoCurto="Responde a algo que acabou de acontecer."
    },
    roleplay={
        categoria="Roleplay",
        acao="Uso narrativo",
        tags="Social, Roleplay",
        custo="--",
        bonus="",
        teste="",
        formula="1d20",
        resumoCurto="Efeito narrativo, social ou interpretativo."
    },
    sensorial={
        categoria="Sensorial",
        acao="Sentir",
        tags="Percepção, Aura, Instinto",
        custo="--",
        bonus="",
        teste="Percepção",
        formula="1d20",
        resumoCurto="Percepção, aura, instinto ou leitura do ambiente."
    },
    truque={
        categoria="Truque",
        acao="Usar",
        tags="Blefe, Malícia, Distração",
        custo="--",
        bonus="",
        teste="Astúcia",
        formula="1d20",
        resumoCurto="Blefe, malícia, distração ou vantagem esperta."
    },
    defesa={
        categoria="Defesa",
        acao="Reação",
        tags="Resistência, Proteção, Fuga",
        custo="--",
        bonus="",
        teste="Proteção",
        formula="1d20",
        resumoCurto="Resistência, proteção, fuga ou resposta defensiva."
    },
    suporte={
        categoria="Suporte",
        acao="Apoiar",
        tags="Aliados, Apoio",
        custo="--",
        bonus="",
        teste="",
        formula="1d20",
        resumoCurto="Ajuda aliados, melhora uma cena ou abre oportunidade."
    }
};

Presets.examples = {
    auraSinistra={
        nome="Aura Sinistra",
        tipo="Sombrio",
        categoria="Sensorial",
        tags="Passiva, Empatia, Roleplay, Detecção",
        fonte="Manual",
        acao="Passiva",
        custo="--",
        bonus="+1d4 em Empatia",
        teste="Empatia",
        formula="1d20 + 1d4",
        resumoCurto="Detecta hostilidade, mentira ou intenção ruim.",
        descricao="O Pokémon é sensível a energia negativa, percebendo mentiras, hostilidade ou intenção perigosa em situações relacionadas.",
        usoNarrativo="Perfeito para suspeitar de emboscadas, perceber blefes ou sentir que algo está errado antes dos outros."
    },
    distracaoMaliciosa={
        nome="Distração Maliciosa",
        tipo="Sombrio",
        categoria="Truque",
        tags="Ativa, Social, Caos, Oportunidade",
        fonte="Manual",
        acao="Ativa",
        custo="--",
        bonus="+1d4 em Dissimulação/Persuasão",
        teste="Dissimulação ou Persuasão",
        formula="1d20 + 1d4",
        resumoCurto="Provoca confusão para abrir oportunidade.",
        descricao="O Pokémon provoca caos, ruído, provocação ou distração para abrir brecha para si ou seus aliados.",
        usoNarrativo="Ideal para confundir guardas, provocar inimigos, roubar atenção ou preparar uma ação oportunista."
    },
    sorrisoDeQuemSabe={
        nome="Sorriso de Quem Sabe Demais",
        tipo="Sombrio",
        categoria="Roleplay",
        tags="Social, Provocação, Blefe",
        fonte="Roleplay",
        acao="Uso narrativo",
        custo="--",
        bonus="",
        teste="Social, Astúcia ou Empatia",
        formula="1d20",
        resumoCurto="O Pokémon age como se já tivesse vencido.",
        descricao="O Pokémon sustenta um olhar, sorriso ou postura que sugere que já entendeu tudo e está apenas esperando o alvo errar.",
        usoNarrativo="Serve para pressionar, distrair, provocar, intimidar de leve ou criar desconforto."
    },
    customBlank={
        nome="",
        tipo="",
        categoria="",
        tags="",
        fonte="Custom",
        acao="",
        custo="",
        bonus="",
        teste="",
        formula="1d20",
        resumoCurto="",
        descricao="",
        usoNarrativo=""
    }
};

function Presets.applyCategory(sheet, key)
    setFields(sheet, Presets.categories[key]);
end;

function Presets.applyExample(sheet, key)
    setFields(sheet, Presets.examples[key]);
end;

return Presets;
