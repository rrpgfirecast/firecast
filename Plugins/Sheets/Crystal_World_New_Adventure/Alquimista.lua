local Alquimista = {}

local camposItem = {"nomeItem","tipoItem","subtipoMaterial","RankItem","imagemestilo2","quantidade","quantidadeDisplay","nivelUpgrade","textoUpgrade","usaQuantidade","hp","pp","ca","rd","dano","cura","potionEfeito","potionValor","potionDuracaoMinutos","durabilidade","durabilidadeMaxima","durabilidadeDisplay","durabilidadeBaseTempo","durabilidadeDataBase","origemLoja","uidLojaOrigem","precoLojaPrata","descricaoLoja","origemLivroReceita","LivroReceitasAlquimistaLista","LivroReceitasAlquimistaQtd","LivroReceitasAlquimistaRank"}

local function numero(valor, padrao)
    if valor == nil then return padrao or 0 end
    local texto = tostring(valor):gsub("%.", ""):gsub(",", ".")
    return tonumber(texto) or padrao or 0
end

local function slotVazio(item)
    return item ~= nil and tostring(item.slotVazio or "") == "true"
end

local function prepararSlotVazio(slot, ordem)
    if slot == nil then return end
    slot.slotVazio = "true"
    slot.ordemInventario = ordem or slot.ordemInventario
    slot.uidInventario = "slot_" .. tostring(slot.ordemInventario or "")
    slot.nomeItem = ""
    for _, campo in ipairs(camposItem) do
        if campo ~= "uidInventario" and campo ~= "nomeItem" then slot[campo] = "" end
    end
    slot.equipadoEm = ""
end

local function procurarItemPorUid(ficha, uid)
    if ficha == nil or ficha.magias2 == nil or uid == nil then return nil end
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if tostring(item.uidInventario or "") == tostring(uid) then return item end
    end
    return nil
end

local function primeiroSlotVazio(ficha)
    if ficha == nil or ficha.magias2 == nil then return nil end
    local melhor, melhorOrdem = nil, 999999
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if slotVazio(item) then
            local ordem = tonumber(item.ordemInventario) or 999999
            if ordem < melhorOrdem then melhor, melhorOrdem = item, ordem end
        end
    end
    return melhor
end

local function avisar(controle, texto, duracao)
    if CWNA_mostrarAvisoInventario ~= nil then
        CWNA_mostrarAvisoInventario(controle, texto, duracao)
    else
        showMessage(texto)
    end
end

local function rankPorIndice(indice)
    local ranks = {[1]="E", [2]="D", [3]="C", [4]="B", [5]="A", [6]="S"}
    return ranks[math.max(1, math.min(6, tonumber(indice) or 1))] or "E"
end

local function metaNivel(nivel)
    nivel = tonumber(nivel) or 1
    if nivel >= 5 then return 0 end
    if nivel == 4 then return 2000 end
    if nivel == 3 then return 1000 end
    if nivel == 2 then return 450 end
    return 150
end

local function nivelPorXp(xp)
    xp = tonumber(xp) or 0
    if xp >= 2000 then return 5 end
    if xp >= 1000 then return 4 end
    if xp >= 450 then return 3 end
    if xp >= 150 then return 2 end
    return 1
end

local function inicioNivel(nivel)
    if nivel >= 5 then return 2000 end
    if nivel == 4 then return 1000 end
    if nivel == 3 then return 450 end
    if nivel == 2 then return 150 end
    return 0
end

local function atualizarXp(ficha)
    if ficha == nil then return end
    if tostring(ficha.AlquimistaXpPorNivel or "") ~= "true" then
        local xpAntigo = math.max(0, math.floor(tonumber(ficha.AlquimistaXP) or 0))
        local nivelSalvo = math.floor(tonumber(ficha.AlquimistaNivel) or 0)
        local nivelMigrado = nivelSalvo >= 1 and nivelSalvo or nivelPorXp(xpAntigo)
        local inicio = inicioNivel(nivelMigrado)
        ficha.AlquimistaXP = xpAntigo >= inicio and math.max(0, xpAntigo - inicio) or xpAntigo
        ficha.AlquimistaNivel = math.max(1, math.min(5, nivelMigrado))
        ficha.AlquimistaXpPorNivel = "true"
    end

    local xp = math.max(0, math.floor(tonumber(ficha.AlquimistaXP) or 0))
    local nivel = math.max(1, math.min(5, math.floor(tonumber(ficha.AlquimistaNivel) or 1)))
    local meta = metaNivel(nivel)
    if nivel < 5 and meta > 0 and xp >= meta then
        nivel, xp = nivel + 1, 0
    end

    ficha.AlquimistaXP, ficha.AlquimistaNivel = xp, nivel
    ficha.AlquimistaRankLetra = rankPorIndice(nivel)
    if nivel >= 5 then
        ficha.AlquimistaXPBarra, ficha.AlquimistaXPBarraMax, ficha.AlquimistaXPTexto = 1, 1, "MAX"
    else
        ficha.AlquimistaXPBarra, ficha.AlquimistaXPBarraMax = xp, math.max(1, meta)
        ficha.AlquimistaXPTexto = tostring(xp) .. "/" .. tostring(meta)
    end
end

function CWNA_atualizarXpAlquimista(ficha)
    atualizarXp(ficha)
end

function CWNA_adicionarXpAlquimista(ficha, ganho)
    if ficha == nil then return 0 end
    local xpGanho = math.max(0, math.floor(numero(ganho, 0)))
    atualizarXp(ficha)
    ficha.AlquimistaXP = (tonumber(ficha.AlquimistaXP) or 0) + xpGanho
    atualizarXp(ficha)
    return xpGanho
end

local function normalizarRankAlquimiaLocal(rank)
    local r = tostring(rank or "E"):upper():gsub("^%s*(.-)%s*$", "%1")
    if r == "SS" then return "SS" end
    if r == "S" or r == "A" or r == "B" or r == "C" or r == "D" or r == "E" then return r end
    return "E"
end
local function bonusRankAlquimista(rank)
    local r = normalizarRankAlquimiaLocal(rank)
    if r == "E" then return 1 end
    if r == "D" then return 2 end
    if r == "C" then return 3 end
    if r == "B" then return 4 end
    if r == "A" then return 5 end
    if r == "S" then return 6 end
    return 0
end

local function cdAlquimiaRank(rank)
    local r = normalizarRankAlquimiaLocal(rank)
    if r == "E" then return 10 end
    if r == "D" then return 13 end
    if r == "C" then return 16 end
    if r == "B" then return 19 end
    if r == "A" then return 22 end
    if r == "S" then return 25 end
    return 10
end

local function xpAlquimiaRank(rank)
    local r = normalizarRankAlquimiaLocal(rank)
    if r == "E" then return 10 end
    if r == "D" then return 20 end
    if r == "C" then return 35 end
    if r == "B" then return 55 end
    if r == "A" then return 80 end
    if r == "S" then return 120 end
    return 10
end

local function indiceRankAlquimia(rank)
    local r = normalizarRankAlquimiaLocal(rank)
    if r == "E" then return 1 end
    if r == "D" then return 2 end
    if r == "C" then return 3 end
    if r == "B" then return 4 end
    if r == "A" then return 5 end
    if r == "S" then return 6 end
    return 1
end

local function rankNecessarioReceitaAlquimia(receita)
    local resultado = receita and receita.resultado or {}
    return normalizarRankAlquimiaLocal(resultado.RankItem or receita.rank or "E")
end

local function rankAtualAlquimista(ficha)
    atualizarXp(ficha)
    return rankPorIndice(tonumber(ficha and ficha.AlquimistaNivel) or 1)
end

local function alquimistaPodeCriarReceita(ficha, receita)
    local rankAtual = rankAtualAlquimista(ficha)
    local rankNecessario = rankNecessarioReceitaAlquimia(receita)
    return indiceRankAlquimia(rankAtual) >= indiceRankAlquimia(rankNecessario), rankAtual, rankNecessario
end

local function avisarRankInsuficienteAlquimista(controle, rankAtual, rankNecessario)
    avisar(controle, "Voce nao tem rank de Alquimista necessario para criar esta potion. Necessario: Rank " .. tostring(rankNecessario or "?") .. ". Seu rank: " .. tostring(rankAtual or "?") .. ".", 9000)
end
local function codigoCorRankChatAlquimia(rank)
    local r = normalizarRankAlquimiaLocal(rank)
    if r == "SS" then return "10" end
    if r == "E" then return "14" end
    if r == "D" then return "9" end
    if r == "C" then return "11" end
    if r == "B" then return "13" end
    if r == "A" then return "8" end
    if r == "S" then return "4" end
    return "1"
end

local function enviarMensagemAlquimia(ficha, sucesso, nomeItem, rankItem, imagem, quantidade, xpGanho)
    local mesa = rrpg.getMesaDe(ficha) or Firecast.getMesaDe(ficha)
    local jogador = mesa and mesa.me or nil
    local chat = mesa and mesa.chat or nil
    if jogador == nil or chat == nil then return end

    local nomeJogador = "Jogador"
    pcall(function()
        nomeJogador = tostring(jogador.nick or jogador.nickname or jogador.nome or jogador.name or jogador.login or "Jogador")
    end)

    local marcadorCor = "[" .. string.char(194, 167) .. "K"
    local marcadorImagem = "[" .. string.char(194, 167) .. "I "
    local corItem = codigoCorRankChatAlquimia(rankItem)
    local qtd = math.max(1, math.floor(numero(quantidade, 1)))
    local texto
    if sucesso then
        texto = "<" .. nomeJogador .. "> " .. marcadorCor .. "1]fabricou com sucesso:\n" ..
                marcadorCor .. corItem .. "]" .. tostring(nomeItem or "Pocao") .. marcadorCor .. "1] x" .. tostring(qtd)
        if (tonumber(xpGanho) or 0) > 0 then
            texto = texto .. "\n" .. marcadorCor .. "1]XP +" .. tostring(xpGanho)
        end
    else
        texto = "<" .. nomeJogador .. "> " .. marcadorCor .. "1]falhou ao fabricar:\n" ..
                marcadorCor .. corItem .. "]" .. tostring(nomeItem or "Pocao") .. marcadorCor .. "1]"
    end

    imagem = tostring(imagem or "")
    if imagem ~= "" then texto = texto .. "\n" .. marcadorImagem .. imagem .. "]" end
    pcall(function() chat:enviarMensagem(texto) end)
end
local function campoSlot(slot, campo)
    return "AlquimistaSlot" .. tostring(slot) .. "_" .. tostring(campo)
end

local function slotTemItem(ficha, slot)
    return ficha ~= nil and tostring(ficha[campoSlot(slot, "nomeItem")] or "") ~= ""
end

local function textoLimpo(valor)
    return tostring(valor or ""):lower():gsub("^%s*(.-)%s*$", "%1")
end

local function textoChave(valor)
    local texto = textoLimpo(valor)
    texto = texto:gsub("ÃƒÂ¡", "a"):gsub("Ãƒ ", "a"):gsub("ÃƒÂ¢", "a"):gsub("ÃƒÂ£", "a")
    texto = texto:gsub("ÃƒÂ©", "e"):gsub("ÃƒÂª", "e"):gsub("ÃƒÂ­", "i")
    texto = texto:gsub("ÃƒÂ³", "o"):gsub("ÃƒÂ´", "o"):gsub("ÃƒÂµ", "o")
    texto = texto:gsub("ÃƒÂº", "u"):gsub("ÃƒÂ§", "c")
    texto = texto:gsub("Ã¡", "a"):gsub("Ã ", "a"):gsub("Ã¢", "a"):gsub("Ã£", "a")
    texto = texto:gsub("Ã©", "e"):gsub("Ãª", "e"):gsub("Ã­", "i")
    texto = texto:gsub("Ã³", "o"):gsub("Ã´", "o"):gsub("Ãµ", "o")
    texto = texto:gsub("Ãº", "u"):gsub("Ã§", "c")
    texto = texto:gsub("á", "a"):gsub("à", "a"):gsub("â", "a"):gsub("ã", "a")
    texto = texto:gsub("é", "e"):gsub("ê", "e"):gsub("í", "i")
    texto = texto:gsub("ó", "o"):gsub("ô", "o"):gsub("õ", "o")
    texto = texto:gsub("ú", "u"):gsub("ç", "c")
    return texto
end

local function itemEmpilhavel(item)
    local tipo = textoLimpo(item and item.tipoItem)
    return tipo == "material"
        or tipo == "outros"
        or tipo == "potion hp"
        or tipo == "potion pp"
        or tipo:find("^potion") ~= nil
        or tipo == "minerio"
        or tipo == "minério"
end

local function nomeContemReceita(item)
    return textoLimpo(item and item.nomeItem):find("receita", 1, true) ~= nil
end

local function nomeContemFrasco(item)
    return textoLimpo(item and item.nomeItem):find("frasco", 1, true) ~= nil
end

local function subtipoMaterialPermitidoFrasco(item)
    local tipo = textoLimpo(item and item.tipoItem)
    local subtipo = textoLimpo(item and item.subtipoMaterial)
    local textoItem = tipo .. " " .. subtipo
    if textoItem:find("erva", 1, true) ~= nil or textoItem:find("crist", 1, true) ~= nil then return true end
    if subtipo:find("erva", 1, true) ~= nil or subtipo:find("crist", 1, true) ~= nil then return true end
    subtipo = subtipo:gsub("Ã©", "e")
    return tipo == "material" and (subtipo == "erva" or subtipo == "ervas" or subtipo == "cristal" or subtipo == "cristais")
end

local function slotEhFrasco(slot)
    return slot == 2 or slot == 3 or slot == 4 or slot == 6 or slot == 7 or slot == 8
end

local slotsIngredientesAlquimia = {2, 3, 4, 6, 7, 8}

local receitasAlquimia = {
    -- POCOES DE CURA - HP
    {
        id = "potion_frasco_pequeno",
        nomes = {"receita potion frasco pequeno"},
        rank = "E",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 2},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "E", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Frasco Pequeno",
            tipoItem = "Potion HP",
            RankItem = "E",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/QAPRULDG_4517947/6a7921dc3cc024f402f64855.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "https://blob.firecast.com.br/blobs/OUUQHSCK_4516914/ChatGPT_Image_9_de_ago._de_2026__10_21_23.png",
            imagemReceitaSlot = "",
            quantidade = 1,
            cura = 15,
            precoLojaPrata = 20,
            descricaoLoja = "Pocao de cura de Rank E, capaz de curar 15 de HP."
        }
    },
    {
        id = "potion_mais_concentrada",
        nomes = {"receita potion mais concentrada"},
        rank = "D",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 2},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Mais Concentrada",
            tipoItem = "Potion HP",
            RankItem = "D",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/GWUCWIIJ_4517948/6a7921ef3cc024f402f64984.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            cura = 30,
            precoLojaPrata = 50,
            descricaoLoja = "Pocao de cura de Rank D, capaz de curar 30 pontos de HP."
        }
    },
    {
        id = "potion_cura_significativa",
        nomes = {"receita potion cura significativa"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 2},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion de Cura Significativa",
            tipoItem = "Potion HP",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/JWNAIQDA_4517949/6a7921ff3cc024f402f64a54.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            cura = 50,
            precoLojaPrata = 100,
            descricaoLoja = "Pocao de cura de Rank C, capaz de curar 50 pontos de HP."
        }
    },
    {
        id = "potion_cura_avancada",
        nomes = {"receita potion de cura avancada"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 2},
            {tipo = "cristal", id = "cristal_brilhante", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion de Cura Avancada",
            tipoItem = "Potion HP",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/AEBSJBWS_4517950/6a79220e3cc024f402f64ae5.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            cura = 75,
            precoLojaPrata = 150,
            descricaoLoja = "Pocao de cura de Rank B, capaz de curar 75 pontos de HP."
        }
    },
    {
        id = "potion_cura_superior",
        nomes = {"receita potion de cura superior"},
        rank = "A",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 2},
            {tipo = "cristal", id = "cristal_raro", rank = "A", quantidade = 1},
            {tipo = "frasco", rank = "A", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion de Cura Superior",
            tipoItem = "Potion HP",
            RankItem = "A",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/FOSQKHVE_4517951/6a7922203cc024f402f64c12.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            cura = 100,
            precoLojaPrata = 200,
            descricaoLoja = "Pocao de cura de Rank A, capaz de curar 100 pontos de HP."
        }
    },
    {
        id = "potion_elixir_da_vida",
        nomes = {"receita elixir da vida", "receita de elixir da vida", "receita potion elixir da vida"},
        rank = "S",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "selenita", rank = "S", quantidade = 2},
            {tipo = "cristal", id = "cristal_ancestral", rank = "S", quantidade = 1},
            {tipo = "frasco", rank = "S", quantidade = 1}
        },
        resultado = {
            nomeItem = "Elixir da Vida",
            tipoItem = "Potion HP",
            RankItem = "S",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/WKHTETBI_4517953/6a7922303cc024f402f64d0d.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            cura = 150,
            precoLojaPrata = 300,
            descricaoLoja = "Elixir de cura de Rank S, restaura 150 pontos de HP."
        }
    },

    -- POCOES DE PODER - PP
    {
        id = "potion_goticula_arcana",
        nomes = {"receita potion goticula arcana"},
        rank = "E",
        xp = 0,
        ingredientes = {
            {tipo = "cristal", rank = "E", quantidade = 2},
            {tipo = "erva", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "E", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Goticula Arcana",
            tipoItem = "Potion PP",
            RankItem = "E",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/PWONAUNO_4517977/6a7923c93cc024f402f662c8.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            pp = 4,
            precoLojaPrata = 60,
            descricaoLoja = "Pocao que restaura 4 pontos de PP."
        }
    },
    {
        id = "potion_essencia_azul_lunar",
        nomes = {"receita potion essencia azul lunar"},
        rank = "D",
        xp = 0,
        ingredientes = {
            {tipo = "cristal", rank = "D", quantidade = 2},
            {tipo = "erva", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Essencia Azul Lunar",
            tipoItem = "Potion PP",
            RankItem = "D",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/KWAKBQPH_4517981/6a7923eb3cc024f402f664ae.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            pp = 8,
            precoLojaPrata = 110,
            descricaoLoja = "Pocao que restaura 8 pontos de PP."
        }
    },
    {
        id = "potion_cristal_liquido",
        nomes = {"receita potion cristal liquido"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "cristal", rank = "C", quantidade = 2},
            {tipo = "erva", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Cristal Liquido",
            tipoItem = "Potion PP",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/WVGDCJJD_4517986/6a7924173cc024f402f6682a.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            pp = 12,
            precoLojaPrata = 170,
            descricaoLoja = "Pocao que restaura 12 pontos de PP."
        }
    },
    {
        id = "potion_sopro_de_eter",
        nomes = {"receita potion sopro de eter"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "cristal", rank = "B", quantidade = 2},
            {tipo = "erva", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Sopro de Eter",
            tipoItem = "Potion PP",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/WHUQHGWK_4517990/6a7924613cc024f402f66b89.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            pp = 16,
            precoLojaPrata = 240,
            descricaoLoja = "Pocao que restaura 16 pontos de PP."
        }
    },
    {
        id = "potion_lagrimas_de_thalasia",
        nomes = {"receita potion lagrimas de thalasia"},
        rank = "A",
        xp = 0,
        ingredientes = {
            {tipo = "cristal", rank = "A", quantidade = 2},
            {tipo = "erva", rank = "A", quantidade = 1},
            {tipo = "frasco", rank = "A", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Lagrimas de Thalasia",
            tipoItem = "Potion PP",
            RankItem = "A",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/IGFAICKT_4517991/6a79248f3cc024f402f66dbb.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            pp = 24,
            precoLojaPrata = 330,
            descricaoLoja = "Pocao que restaura 24 pontos de PP."
        }
    },
    {
        id = "potion_coracao_de_mana",
        nomes = {"receita potion coracao de mana"},
        rank = "S",
        xp = 0,
        ingredientes = {
            {tipo = "cristal", rank = "S", quantidade = 2},
            {tipo = "erva", rank = "S", quantidade = 1},
            {tipo = "frasco", rank = "S", quantidade = 1}
        },
        resultado = {
            nomeItem = "Potion Coracao de Mana",
            tipoItem = "Potion PP",
            RankItem = "S",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/AHQIBHLU_4517996/6a7924c53cc024f402f66fe2.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            pp = 30,
            precoLojaPrata = 400,
            descricaoLoja = "Elixir que restaura 30 pontos de PP."
        }
    },
    -- POCOES ESPECIAIS DO BANCO
    {
        id = "potion_veneno",
        nomes = {"receita de veneno", "receita potion veneno"},
        rank = "D",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Veneno",
            tipoItem = "Potion Especial",
            RankItem = "D",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/HQHLVUFS_4518003/6a7925e83cc024f402f67f9d.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VENENO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Poção que aplica um efeito de veneno."
        }
    },
    {
        id = "potion_sono",
        nomes = {"receita do sono", "receita potion sono"},
        rank = "D",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção do Sono",
            tipoItem = "Potion Especial",
            RankItem = "D",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/DSBIWIHC_4518023/6a7928513cc024f402f6a308.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "SONO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Poção que provoca sonolência."
        }
    },
    {
        id = "potion_visao_noturna",
        nomes = {"receita de visão noturna", "receita potion visão noturna"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Visão Noturna",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/DGTBRTUC_4518016/6a7926ff3cc024f402f691c0.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VISAO_NOTURNA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Permite enxergar melhor em ambientes escuros."
        }
    },
    {
        id = "potion_respiracao_aquatica",
        nomes = {"receita de respiração aquática", "receita potion respiração aquática"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Respiração Aquática",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/VKQREBGJ_4518029/potion_respira_ao.png",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "RESPIRACAO_AQUATICA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Permite respirar normalmente debaixo d'água."
        }
    },
    {
        id = "potion_resistencia_calor",
        nomes = {"receita de resistência ao calor", "receita potion resistência ao calor"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Resistência ao Calor",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/OKRFOQPA_4518039/6a792a663cc024f402f6bcb2.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "RESISTENCIA_CALOR",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta a resistência contra calor."
        }
    },
    {
        id = "potion_resistencia_frio",
        nomes = {"receita de resistência ao frio", "receita potion resistência ao frio"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Resistência ao Frio",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/TKURDHTV_4518040/6a792aa93cc024f402f6bfff.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "RESISTENCIA_FRIO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta a resistência contra frio."
        }
    },
    {
        id = "potion_forca",
        nomes = {"receita de força", "receita potion força"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_brilhante", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Força",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/AUOQLVDK_4518009/6a79269c3cc024f402f68c42.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "FORCA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a força."
        }
    },
    {
        id = "potion_agilidade",
        nomes = {"receita de agilidade", "receita potion agilidade"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Agilidade",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/EDQWCAIA_4518045/6a792b153cc024f402f6c496.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "AGILIDADE",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a agilidade."
        }
    },
    {
        id = "potion_invisibilidade",
        nomes = {"receita de invisibilidade", "receita potion invisibilidade"},
        rank = "A",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "cristal", id = "cristal_raro", rank = "A", quantidade = 1},
            {tipo = "frasco", rank = "A", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Invisibilidade",
            tipoItem = "Potion Especial",
            RankItem = "A",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/AKHABULS_4518058/6a792d1a3cc024f402f6e0da.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "INVISIBILIDADE",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Torna o usuário invisível temporariamente."
        }
    },
    {
        id = "potion_queda_suave",
        nomes = {"receita de queda suave", "receita potion queda suave"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Queda Suave",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/KNFUMEML_4518063/6a792d7a3cc024f402f6e588.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "QUEDA_SUAVE",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Reduz drasticamente o impacto de uma queda."
        }
    },
    {
        id = "potion_voz_alterada",
        nomes = {"receita da voz alterada", "receita potion voz alterada"},
        rank = "D",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção da Voz Alterada",
            tipoItem = "Potion Especial",
            RankItem = "D",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/LLTLVJSM_4518075/6a792eec3cc024f402f6f6bf.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VOZ_ALTERADA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Altera temporariamente a voz do usuário."
        }
    },
    {
        id = "potion_antidoto",
        nomes = {"receita de antídoto", "receita potion antídoto"},
        rank = "D",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "D", quantidade = 1}
        },
        resultado = {
            nomeItem = "Antídoto",
            tipoItem = "Potion Especial",
            RankItem = "D",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/ORVDLAQP_4518080/6a792f303cc024f402f6fac8.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "ANTIDOTO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Neutraliza efeitos de veneno."
        }
    },
    {
        id = "potion_sentidos_aguçados",
        nomes = {"receita de sentidos", "receita potion sentidos aguçados"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Sentidos Aguçados",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/LJFDTDPV_4518084/6a792fa53cc024f402f700bf.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "SENTIDOS_AGUCADOS",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aguça temporariamente os sentidos."
        }
    },
    {
        id = "potion_aderencia",
        nomes = {"receita de aderência", "receita potion aderência"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Aderência",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/BKUOTBQB_4518088/6a7930623cc024f402f708a8.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "ADERENCIA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Permite aderir a superfícies."
        }
    },
    {
        id = "potion_pele_resistente",
        nomes = {"receita de pele resistente", "receita potion pele resistente"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_brilhante", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Pele Resistente",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/QJDVSWWM_4518090/6a7931573cc024f402f7152f.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "PELE_RESISTENTE",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta a resistência física da pele."
        }
    },
    {
        id = "potion_velocidade",
        nomes = {"receita de velocidade", "receita potion velocidade"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Velocidade",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/ESMGNTIW_4518104/6a7933063cc024f402f73336.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VELOCIDADE",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a velocidade."
        }
    },
    {
        id = "potion_salto",
        nomes = {"receita de salto", "receita potion salto"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Salto",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/OOUDMHDF_4518106/6a79338c3cc024f402f739cd.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "SALTO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta a capacidade de salto."
        }
    },
    {
        id = "potion_faro",
        nomes = {"receita de faro", "receita potion faro"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Faro",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/LFUVFIIH_4518110/6a79340a3cc024f402f73e57.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "FARO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aguça temporariamente o olfato."
        }
    },
    {
        id = "potion_clareza_mental",
        nomes = {"receita de clareza", "receita potion clareza mental"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "cristal", id = "cristal_brilhante", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Clareza Mental",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/AKIDWMKE_4518112/6a7934743cc024f402f742af.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "CLAREZA_MENTAL",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a clareza mental."
        }
    },
    {
        id = "potion_visao_magica",
        nomes = {"receita de visão mágica", "receita potion visão mágica"},
        rank = "A",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "selenita", rank = "S", quantidade = 1},
            {tipo = "cristal", id = "cristal_raro", rank = "A", quantidade = 1},
            {tipo = "frasco", rank = "A", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Visão Mágica",
            tipoItem = "Potion Especial",
            RankItem = "A",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VISAO_MAGICA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Permite perceber manifestações de energia mágica."
        }
    },
    {
        id = "potion_visao_espiritual",
        nomes = {"receita de visão espiritual", "receita potion visão espiritual"},
        rank = "S",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "erva", id = "selenita", rank = "S", quantidade = 1},
            {tipo = "cristal", id = "cristal_ancestral", rank = "S", quantidade = 1},
            {tipo = "frasco", rank = "S", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Visão Espiritual",
            tipoItem = "Potion Especial",
            RankItem = "S",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/VMGJCPCK_4518125/6a7937013cc024f402f76496.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VISAO_ESPIRITUAL",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Permite perceber espíritos e manifestações espirituais."
        }
    },
  
    {
        id = "potion_coagulacao",
        nomes = {"receita de coagulação", "receita potion coagulação"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Coagulação",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/CSCRHFIT_4518124/6a7936aa3cc024f402f76144.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "COAGULACAO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Acelera a coagulação de ferimentos."
        }
    },
   
    {
        id = "potion_leveza",
        nomes = {"receita de leveza", "receita potion leveza"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Leveza",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "LEVEZA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Reduz temporariamente o peso do usuário."
        }
    },
    {
        id = "potion_visao_distante",
        nomes = {"receita de visão distante", "receita potion visão distante"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Visão Distante",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VISAO_DISTANTE",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente o alcance da visão."
        }
    },
    {
        id = "potion_reflexos",
        nomes = {"receita de reflexos", "receita potion reflexos"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Reflexos",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "REFLEXOS",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a velocidade dos reflexos."
        }
    },
    {
        id = "potion_camuflagem",
        nomes = {"receita de camuflagem", "receita potion camuflagem"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Camuflagem",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "CAMUFLAGEM",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Dificulta a percepção visual do usuário."
        }
    },
    {
        id = "potion_passos_silenciosos",
        nomes = {"receita de passos silenciosos", "receita potion passos silenciosos"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_opaco", rank = "E", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Passos Silenciosos",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "PASSOS_SILENCIOSOS",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Reduz o som produzido pelos movimentos."
        }
    },
    {
        id = "potion_sonho_lucido",
        nomes = {"receita de sonho lúcido", "receita potion sonho lúcido"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Sonho Lúcido",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/ICDLFVPT_4518121/6a7936563cc024f402f75d21.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "SONHO_LUCIDO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Induz um estado de sonho lúcido."
        }
    },
    {
        id = "potion_medo",
        nomes = {"receita do medo", "receita potion medo"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "cristal", id = "cristal_brilhante", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção do Medo",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/PTBISQCP_4518119/6a79361f3cc024f402f7591a.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "MEDO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Provoca uma sensação intensa de medo."
        }
    },
    {
        id = "potion_furia",
        nomes = {"receita da fúria", "receita potion fúria"},
        rank = "B",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "raiz_de_sa", rank = "B", quantidade = 1},
            {tipo = "erva", id = "braverva", rank = "D", quantidade = 1},
            {tipo = "cristal", id = "cristal_brilhante", rank = "B", quantidade = 1},
            {tipo = "frasco", rank = "B", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção da Fúria",
            tipoItem = "Potion Especial",
            RankItem = "B",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/PANJBBDO_4518118/6a7935f13cc024f402f7575d.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "FURIA",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Provoca um estado temporário de fúria."
        }
    },
   
    {
        id = "potion_folego",
        nomes = {"receita de fôlego", "receita potion fôlego"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_azul", rank = "D", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Fôlego",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/WBDWJHPM_4518117/6a7935a83cc024f402f75285.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "FOLEGO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a capacidade de fôlego."
        }
    },
    {
        id = "potion_resistencia_veneno",
        nomes = {"receita de resistência a veneno", "receita potion resistência a veneno"},
        rank = "C",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "verdolina_simples", rank = "E", quantidade = 1},
            {tipo = "erva", id = "noctifolio", rank = "C", quantidade = 1},
            {tipo = "cristal", id = "cristal_violeta", rank = "C", quantidade = 1},
            {tipo = "frasco", rank = "C", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Resistência a Veneno",
            tipoItem = "Potion Especial",
            RankItem = "C",
            imagemestilo2 = "https://blob.firecast.com.br/blobs/CDIULPQO_4518115/6a7935523cc024f402f74d1d.jpg",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "RESISTENCIA_VENENO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta temporariamente a resistência contra venenos."
        }
    },
    {
        id = "potion_purificacao",
        nomes = {"receita de purificação", "receita potion purificação"},
        rank = "A",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "erva", id = "selenita", rank = "S", quantidade = 1},
            {tipo = "cristal", id = "cristal_raro", rank = "A", quantidade = 1},
            {tipo = "frasco", rank = "A", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Purificação",
            tipoItem = "Potion Especial",
            RankItem = "A",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "PURIFICACAO",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Remove determinadas impurezas e efeitos negativos."
        }
    },
    {
        id = "potion_protecao_mental",
        nomes = {"receita de proteção mental", "receita potion proteção mental"},
        rank = "A",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "erva", id = "selenita", rank = "S", quantidade = 1},
            {tipo = "cristal", id = "cristal_raro", rank = "A", quantidade = 1},
            {tipo = "frasco", rank = "A", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Proteção Mental",
            tipoItem = "Potion Especial",
            RankItem = "A",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "PROTECAO_MENTAL",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Aumenta a proteção contra influências mentais."
        }
    },
    {
        id = "potion_visao_do_alem",
        nomes = {"receita de visão do além", "receita potion visão do além"},
        rank = "S",
        xp = 0,
        ingredientes = {
            {tipo = "erva", id = "flor_de_vahrun", rank = "A", quantidade = 1},
            {tipo = "erva", id = "selenita", rank = "S", quantidade = 1},
            {tipo = "cristal", id = "cristal_ancestral", rank = "S", quantidade = 1},
            {tipo = "frasco", rank = "S", quantidade = 1}
        },
        resultado = {
            nomeItem = "Poção de Visão do Além",
            tipoItem = "Potion Especial",
            RankItem = "S",
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
            quantidade = 1,
            potionEfeito = "VISAO_DO_ALEM",
            potionValor = 0,
            potionDuracaoMinutos = 0,
            precoLojaPrata = 0,
            descricaoLoja = "Permite perceber manifestações além do mundo físico."
        }
    },

   
    
}

local gruposPocoesPericiaAlquimia = {
    -- POCOES DE FORCA
    {
        grupo = "Forca",
        receita = {
            rank = "E",
            xp = 7,
            ingredientes = {
                {tipo = "erva", rank = "E", quantidade = 2},
                {tipo = "cristal", rank = "E", quantidade = 2}
            },
            potionValor = 2,
            potionDuracaoMinutos = 10,
            precoLojaPrata = 90,
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = ""
        },
        pericias = {
            {id = "braco_de_ferro", nome = "Braco de Ferro", efeito = "BracoDeFerro", imagemestilo2 = ""},
            {id = "correr", nome = "Correr", efeito = "Correr", imagemestilo2 = ""},
            {id = "dano_curto_alcance", nome = "Dano Curto Alcance", efeito = "DanoCurtoAlcance", imagemestilo2 = ""},
            {id = "dano_longo_alcance", nome = "Dano Longo Alcance", efeito = "DanoLongoAlcance", imagemestilo2 = ""},
            {id = "empurrar_obstaculo", nome = "Empurrar Obstaculo", efeito = "EmpurrarObstaculo", imagemestilo2 = ""},
            {id = "escalar", nome = "Escalar", efeito = "Escalar", imagemestilo2 = ""}
        }
    },

    -- POCOES DE DESTREZA
    {
        grupo = "Destreza",
        receita = {
            rank = "E",
            xp = 7,
            ingredientes = {
                {tipo = "erva", rank = "E", quantidade = 2},
                {tipo = "cristal", rank = "E", quantidade = 2}
            },
            potionValor = 2,
            potionDuracaoMinutos = 10,
            precoLojaPrata = 90,
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = ""
        },
        pericias = {
            {id = "acerto_distancia", nome = "Acerto Distancia", efeito = "AcertoDistancia", imagemestilo2 = ""},
            {id = "acerto_curto_alcance", nome = "Acerto Curto Alcance", efeito = "AcertoCurtoAlcance", imagemestilo2 = ""},
            {id = "desarmar_armadilha", nome = "Desarmar Armadilha", efeito = "DesarmarArmadilha", imagemestilo2 = ""},
            {id = "esquivar", nome = "Esquivar", efeito = "Esquivar", imagemestilo2 = ""},
            {id = "furtividade", nome = "Furtividade", efeito = "Furtividade", imagemestilo2 = ""},
            {id = "iniciativa", nome = "Iniciativa", efeito = "Iniciativa", imagemestilo2 = ""},
            {id = "montaria_direcao", nome = "Montaria Direcao", efeito = "MontariaDirecao", imagemestilo2 = ""},
            {id = "roubo", nome = "Roubo", efeito = "Roubo", imagemestilo2 = ""}
        }
    },

    -- POCOES DE INTELIGENCIA
    {
        grupo = "Inteligencia",
        receita = {
            rank = "E",
            xp = 7,
            ingredientes = {
                {tipo = "erva", rank = "E", quantidade = 2},
                {tipo = "cristal", rank = "E", quantidade = 2}
            },
            potionValor = 2,
            potionDuracaoMinutos = 10,
            precoLojaPrata = 90,
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = ""
        },
        pericias = {
            {id = "acerto_magico", nome = "Acerto Magico", efeito = "AcertoMagico", imagemestilo2 = ""},
            {id = "identificar_criatura", nome = "Identificar Criatura", efeito = "IdentificarCriatura", imagemestilo2 = ""},
            {id = "investigacao", nome = "Investigacao", efeito = "Investigacao", imagemestilo2 = ""},
            {id = "ler_manuscrito", nome = "Ler Manuscrito", efeito = "LerManuscrito", imagemestilo2 = ""},
            {id = "medicina", nome = "Medicina", efeito = "Medicina", imagemestilo2 = ""},
            {id = "preparar_estrategia", nome = "Preparar Estrategia", efeito = "PrepararEstrategia", imagemestilo2 = ""},
            {id = "profissao", nome = "Profissao", efeito = "Profissao", imagemestilo2 = ""},
            {id = "resistencia_mental", nome = "Resistencia Mental", efeito = "ResistenciaMental", imagemestilo2 = ""}
        }
    },

    -- POCOES DE SABEDORIA
    {
        grupo = "Sabedoria",
        receita = {
            rank = "E",
            xp = 7,
            ingredientes = {
                {tipo = "erva", rank = "E", quantidade = 2},
                {tipo = "cristal", rank = "E", quantidade = 2}
            },
            potionValor = 2,
            potionDuracaoMinutos = 10,
            precoLojaPrata = 90,
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = ""
        },
        pericias = {
            {id = "detectar_magia", nome = "Detectar Magia", efeito = "DetectarMagia", imagemestilo2 = ""},
            {id = "dano_magico", nome = "Dano Magico", efeito = "DanoMagico", imagemestilo2 = ""},
            {id = "historia", nome = "Historia", efeito = "Historia", imagemestilo2 = ""},
            {id = "natureza", nome = "Natureza", efeito = "Natureza", imagemestilo2 = ""},
            {id = "perceber_mentira", nome = "Perceber Mentira", efeito = "PerceberMentira", imagemestilo2 = ""},
            {id = "percepcao", nome = "Percepcao", efeito = "Percepcao", imagemestilo2 = ""},
            {id = "religiao", nome = "Religiao", efeito = "Religiao", imagemestilo2 = ""},
            {id = "sobrevivencia", nome = "Sobrevivencia", efeito = "Sobrevivencia", imagemestilo2 = ""}
        }
    },

    -- POCOES DE CARISMA
    {
        grupo = "Carisma",
        receita = {
            rank = "E",
            xp = 7,
            ingredientes = {
                {tipo = "erva", rank = "E", quantidade = 2},
                {tipo = "cristal", rank = "E", quantidade = 2}
            },
            potionValor = 2,
            potionDuracaoMinutos = 10,
            precoLojaPrata = 90,
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = ""
        },
        pericias = {
            {id = "atuar", nome = "Atuar", efeito = "Atuar", imagemestilo2 = ""},
            {id = "discurso", nome = "Discurso", efeito = "Discurso", imagemestilo2 = ""},
            {id = "intimidar", nome = "Intimidar", efeito = "Intimidar", imagemestilo2 = ""},
            {id = "mentir", nome = "Mentir", efeito = "Mentir", imagemestilo2 = ""},
            {id = "seducao", nome = "Seducao", efeito = "Seducao", imagemestilo2 = ""}
        }
    },

    -- POCOES DE CONSTITUICAO
    {
        grupo = "Constituicao",
        receita = {
            rank = "E",
            xp = 7,
            ingredientes = {
                {tipo = "erva", rank = "E", quantidade = 2},
                {tipo = "cristal", rank = "E", quantidade = 2}
            },
            potionValor = 2,
            potionDuracaoMinutos = 10,
            precoLojaPrata = 90,
            imagemestilo2 = "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = ""
        },
        pericias = {
            {id = "resistencia_cansaco", nome = "Resistencia Cansaco", efeito = "ResistenciaCansaco", imagemestilo2 = ""},
            {id = "resistir_veneno", nome = "Resistir Veneno", efeito = "ResistirVeneno", imagemestilo2 = ""},
            {id = "segurar_folego", nome = "Segurar Folego", efeito = "SegurarFolego", imagemestilo2 = ""},
            {id = "suporte_frio_calor", nome = "Suporte Frio Calor", efeito = "SuporteFrioCalor", imagemestilo2 = ""}
        }
    }
}

local function registrarPocoesPericiaAlquimia()
    for _, grupo in ipairs(gruposPocoesPericiaAlquimia) do
        local receita = grupo.receita or {}
        for _, pericia in ipairs(grupo.pericias or {}) do
            local nomeItem = "Potion " .. pericia.nome
            local valor = tonumber(pericia.potionValor or receita.potionValor) or 2
            local duracao = tonumber(pericia.potionDuracaoMinutos or receita.potionDuracaoMinutos) or 10
            table.insert(receitasAlquimia, {
                id = "potion_" .. tostring(pericia.id or "") .. "_menor",
                grupoReceita = "POCOES DE " .. tostring(grupo.grupo or ""):upper(),
                nomes = {
                    "receita " .. nomeItem,
                    "receita de " .. nomeItem,
                    "receita potion " .. pericia.nome .. " menor",
                    "receita de potion " .. pericia.nome .. " menor",
                    "receita pocao " .. pericia.nome .. " menor",
                    "receita potion " .. pericia.nome,
                    "receita de potion " .. pericia.nome,
                    "receita pocao " .. pericia.nome,
                    "receita " .. pericia.nome,
                    "receita de " .. pericia.nome
                },
                rank = pericia.rank or receita.rank or "E",
                xp = pericia.xp or receita.xp or 7,
                ingredientes = pericia.ingredientes or receita.ingredientes or {
                    {tipo = "erva", rank = "E", quantidade = 2},
                    {tipo = "cristal", rank = "E", quantidade = 2}
                },
                resultado = {
                    nomeItem = nomeItem,
                    tipoItem = "Potion Especial",
                    RankItem = pericia.rank or receita.rank or "E",
                    imagemestilo2 = pericia.imagemestilo2 or receita.imagemestilo2 or "",
            imagemReceitaLivro = "",
            imagemPaginaReceita = "",
            imagemReceitaSlot = "",
                    quantidade = 1,
                    potionEfeito = pericia.efeito,
                    potionValor = valor,
                    potionDuracaoMinutos = duracao,
                    precoLojaPrata = pericia.precoLojaPrata or receita.precoLojaPrata or 90,
                    descricaoLoja = pericia.descricaoLoja or ("Potion que aumenta " .. pericia.nome .. " em +" .. tostring(valor) .. " por " .. tostring(duracao) .. " minutos.")
                }
            })
        end
    end
end

registrarPocoesPericiaAlquimia()

Alquimista.receitas = receitasAlquimia

local function normalizarRank(rank)
    local texto = tostring(rank or "E"):upper()
    if texto == "D" or texto == "C" or texto == "B" or texto == "A" or texto == "S" then return texto end
    return "E"
end

local function materialBanco(tipo, rank)
    local banco = rawget(_G, "CWNA_Materiais")
    if banco ~= nil and banco.getMaterial ~= nil then
        return banco.getMaterial(tipo, normalizarRank(rank))
    end
    return nil
end

local function nomeMaterialReceita(ingrediente)
    if ingrediente == nil then return "" end
    if tostring(ingrediente.nome or "") ~= "" then return tostring(ingrediente.nome) end
    local mat = materialBanco(ingrediente.tipo, ingrediente.rank)
    return tostring(mat and mat.nome or ingrediente.tipo or "")
end

local function chaveReceitaAlquimia(receita)
    return textoChave(receita and receita.id)
end

local function receitaAlquimiaPorChave(chave)
    local chaveBusca = textoChave(chave)
    if chaveBusca == "" then return nil end
    for _, receita in ipairs(receitasAlquimia) do
        if chaveReceitaAlquimia(receita) == chaveBusca then return receita end
    end
    return nil
end

local function receitaAlquimiaPorNome(nomeReceita)
    local nome = textoChave(nomeReceita)
    if nome == "" then return nil end
    for _, receita in ipairs(receitasAlquimia) do
        for _, nomeAceito in ipairs(receita.nomes or {}) do
            if nome:find(textoChave(nomeAceito), 1, true) ~= nil then return receita end
        end
    end
    return nil
end

local function itemEhLivroAlquimista(item)
    local nome = textoChave(item and item.nomeItem)
    return nome:find("livro de receitas", 1, true) ~= nil and nome:find("alquimista", 1, true) ~= nil
end

local function rankLivroAlquimistaPorQuantidade(qtd)
    qtd = math.max(0, math.floor(tonumber(qtd) or 0))
    if qtd >= 50 then return "S" end
    if qtd >= 40 then return "A" end
    if qtd >= 30 then return "B" end
    if qtd >= 20 then return "C" end
    if qtd >= 10 then return "D" end
    return "E"
end

local function contarListaLivroAlquimista(lista)
    local total = 0
    local vistos = {}
    for chave in tostring(lista or ""):gmatch("[^;]+") do
        chave = textoChave(chave)
        local receita = receitaAlquimiaPorChave(chave)
        local id = tostring(receita and receita.id or "")
        if chave ~= "" and receita ~= nil and not id:match("_menor$") and not vistos[chave] then
            vistos[chave] = true
            total = total + 1
        end
    end
    return total
end
local function encontrarLivroAlquimistaInventario(ficha)
    if ficha == nil or ficha.magias2 == nil then return nil end
    local handle = tostring(ficha.TempDetalheItemHandle or "")
    if handle ~= "" then
        local ok, item = pcall(function() return NDB.openNode(handle) end)
        if ok and item ~= nil and itemEhLivroAlquimista(item) then return item end
    end
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if item ~= nil and tostring(item.slotVazio or "") ~= "true" and itemEhLivroAlquimista(item) then return item end
    end
    return nil
end

local function atualizarRankLivroAlquimistaItem(livro)
    if livro == nil then return end
    local total = contarListaLivroAlquimista(livro.LivroReceitasAlquimistaLista)
    local rank = rankLivroAlquimistaPorQuantidade(total)
    livro.LivroReceitasAlquimistaQtd = tostring(total)
    livro.LivroReceitasAlquimistaRank = rank
    livro.RankItem = rank
end

local function sincronizarLivroAlquimistaParaFicha(ficha, livro)
    if ficha == nil or livro == nil then return end
    livro.LivroReceitasAlquimistaLista = tostring(livro.LivroReceitasAlquimistaLista or "")
    atualizarRankLivroAlquimistaItem(livro)
    ficha.LivroReceitasAlquimistaLista = livro.LivroReceitasAlquimistaLista
    ficha.LivroReceitasAlquimistaQtd = livro.LivroReceitasAlquimistaQtd
    ficha.LivroReceitasAlquimistaRank = livro.LivroReceitasAlquimistaRank
end

local function livroAlquimistaAtivo(ficha)
    local livro = encontrarLivroAlquimistaInventario(ficha)
    if livro ~= nil then sincronizarLivroAlquimistaParaFicha(ficha, livro) end
    return livro
end

local function listaLivroReceitas(ficha)
    if ficha == nil then return {} end
    local livro = livroAlquimistaAtivo(ficha)
    if livro == nil then return {} end
    local lista = livro.LivroReceitasAlquimistaLista
    local mapa = {}
    for chave in tostring(lista or ""):gmatch("[^;]+") do
        chave = textoChave(chave)
        if chave ~= "" then mapa[chave] = true end
    end
    return mapa
end

local function salvarListaLivroReceitas(ficha, mapa)
    if ficha == nil then return end
    local livro = livroAlquimistaAtivo(ficha)
    local listaAtual = livro ~= nil and livro.LivroReceitasAlquimistaLista or ficha.LivroReceitasAlquimistaLista
    local antigas = {}

    if type(mapa) == "table" and type(mapa.__ordem) == "table" then
        antigas = mapa.__ordem
    else
        for chave in tostring(listaAtual or ""):gmatch("[^;]+") do
            chave = textoChave(chave)
            if chave ~= "" and mapa[chave] then table.insert(antigas, chave) end
        end
        local ja = {}
        for _, chave in ipairs(antigas) do ja[chave] = true end
        for _, receita in ipairs(receitasAlquimia) do
            local chave = chaveReceitaAlquimia(receita)
            if mapa[chave] and not ja[chave] then table.insert(antigas, chave) end
        end
    end

    local listaFinal = table.concat(antigas, ";")
    ficha.LivroReceitasAlquimistaLista = listaFinal
    if livro ~= nil then
        livro.LivroReceitasAlquimistaLista = listaFinal
        sincronizarLivroAlquimistaParaFicha(ficha, livro)
    else
        ficha.LivroReceitasAlquimistaQtd = tostring(contarListaLivroAlquimista(listaFinal))
        ficha.LivroReceitasAlquimistaRank = rankLivroAlquimistaPorQuantidade(ficha.LivroReceitasAlquimistaQtd)
    end
end
local function categoriaLivroReceita(receita)
    local resultado = receita and receita.resultado or {}
    local tipo = textoChave(resultado.tipoItem)
    local efeito = textoChave(resultado.potionEfeito)
    local nome = textoChave(resultado.nomeItem)
    if tipo == "potion hp" or nome:find("cura", 1, true) ~= nil or nome:find("elixir da vida", 1, true) ~= nil then return "HP" end
    if tipo == "potion pp" or efeito == "pp" or nome:find("poder", 1, true) ~= nil or nome:find("mana", 1, true) ~= nil then return "PP" end
    if tostring(receita and receita.id or ""):find("_menor", 1, true) ~= nil or tostring(receita and receita.grupoReceita or "") ~= "" then return "PERICIAS" end
    return "ESPECIAIS"
end
local function tituloCategoriaLivro(categoria)
    if categoria == "HP" then return "POCOES DE HP" end
    if categoria == "PP" then return "POCOES DE PP" end
    if categoria == "ESPECIAIS" then return "POCOES ESPECIAIS" end
    if categoria == "PERICIAS" then return "POCOES DE PERICIAS" end
    return "OUTROS"
end

local function receitaTemImagemOuTexto(valor)
    return tostring(valor or "") ~= ""
end

local function descricaoLivroReceita(receita)
    local resultado = receita and receita.resultado or {}
    local desc = tostring(resultado.descricaoLoja or "")
    local efeito = tostring(resultado.potionEfeito or "")
    local valor = tonumber(resultado.potionValor or 0) or 0
    local duracao = tonumber(resultado.potionDuracaoMinutos or 0) or 0
    if desc == "" then desc = "Uma receita alquimica registrada no Livro de receitas ALQUIMISTA." end
    if valor > 0 and duracao > 0 then
        desc = desc .. "\n\nAo ser preparada corretamente, esta potion concede " .. efeito .. " +" .. tostring(valor) .. " por " .. tostring(duracao) .. " minutos."
    elseif tonumber(resultado.cura or 0) and tonumber(resultado.cura or 0) > 0 then
        desc = desc .. "\n\nA mistura restaura " .. tostring(resultado.cura) .. " pontos de HP quando consumida."
    elseif tonumber(resultado.pp or 0) and tonumber(resultado.pp or 0) > 0 then
        desc = desc .. "\n\nA mistura restaura " .. tostring(resultado.pp) .. " pontos de PP quando consumida."
    elseif efeito ~= "" then
        desc = desc .. "\n\nEfeito registrado: " .. efeito .. "."
    end
    return desc
end

local function imagemMaterialReceita(ingrediente)
    local tipo = textoChave(ingrediente and ingrediente.tipo)
    local rank = normalizarRank(ingrediente and ingrediente.rank)
    local mat = materialBanco(tipo, rank)
    if mat == nil and tipo == "cristais" then mat = materialBanco("cristal", rank) end
    if mat == nil and tipo == "ervas" then mat = materialBanco("erva", rank) end
    if mat == nil and tipo == "frascos" then mat = materialBanco("frasco", rank) end
    return tostring((ingrediente and ingrediente.imagem) or (ingrediente and ingrediente.imagemUrl) or (mat and mat.imagemUrl) or (mat and mat.imagemestilo2) or "")
end

local function itemInventarioBateIngrediente(item, ingrediente)
    if item == nil or ingrediente == nil or slotVazio(item) then return false end
    local nomeItem = textoChave(item.nomeItem)
    local tipo = textoChave(item.tipoItem)
    local subtipo = textoChave(item.subtipoMaterial)
    local rank = normalizarRank(item.RankItem)
    local tipoIng = textoChave(ingrediente.tipo)
    local rankIng = normalizarRank(ingrediente.rank)

    if rank ~= rankIng then return false end
    if tipoIng == "frasco" then
        return nomeItem:find("frasco", 1, true) ~= nil
            and (tipo == "material" or tipo == "outros" or tipo == "")
    end

    local nomeIng = textoChave(nomeMaterialReceita(ingrediente))
    if nomeIng ~= "" and nomeItem == nomeIng then return true end
    if tipo ~= "material" and tipo ~= "outros" then return false end
    if tipoIng == "erva" then return subtipo:find("erva", 1, true) ~= nil end
    if tipoIng == "cristal" then return subtipo:find("crist", 1, true) ~= nil end
    if tipoIng == "minerio" then return subtipo:find("miner", 1, true) ~= nil end
    if tipoIng == "madeira" then return subtipo:find("madeira", 1, true) ~= nil end
    if tipoIng == "couro" then return subtipo:find("couro", 1, true) ~= nil end
    return false
end

local function contarIngredienteInventarioLivro(ficha, ingrediente)
    local total = 0
    if ficha ~= nil and ficha.magias2 ~= nil then
        for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
            if itemInventarioBateIngrediente(item, ingrediente) then
                total = total + math.max(0, math.floor(numero(item.quantidade, 1)))
            end
        end
    end

    if ficha ~= nil then
        for slot = 2, 8 do
            if slotTemItem(ficha, slot) then
                local itemSlot = {
                    nomeItem = ficha[campoSlot(slot, "nomeItem")],
                    tipoItem = ficha[campoSlot(slot, "tipoItem")],
                    subtipoMaterial = ficha[campoSlot(slot, "subtipoMaterial")],
                    RankItem = ficha[campoSlot(slot, "RankItem")],
                    quantidade = ficha[campoSlot(slot, "quantidade")]
                }
                if itemInventarioBateIngrediente(itemSlot, ingrediente) then
                    total = total + math.max(0, math.floor(numero(itemSlot.quantidade, 1)))
                end
            end
        end
    end

    return total
end

local function limparIngredientesPaginaLivro(ficha, prefixo)
    for i = 1, 6 do
        ficha[prefixo .. "Ing" .. tostring(i) .. "Imagem"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "Nome"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "Qtd"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdOk"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdFalta"] = ""
    end
end

local function preencherIngredientesPaginaLivro(ficha, prefixo, receita)
    limparIngredientesPaginaLivro(ficha, prefixo)
    local ingredientes = receita and receita.ingredientes or {}
    for i = 1, math.min(6, #ingredientes) do
        local ingrediente = ingredientes[i]
        local necessario = math.max(1, math.floor(numero(ingrediente.quantidade, 1)))
        local tem = contarIngredienteInventarioLivro(ficha, ingrediente)
        ficha[prefixo .. "Ing" .. tostring(i) .. "Imagem"] = imagemMaterialReceita(ingrediente)
        ficha[prefixo .. "Ing" .. tostring(i) .. "Nome"] = nomeMaterialReceita(ingrediente)
        local textoQtd = tostring(tem) .. "/" .. tostring(necessario)
        ficha[prefixo .. "Ing" .. tostring(i) .. "Qtd"] = textoQtd
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdOk"] = tem >= necessario and textoQtd or ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdFalta"] = tem < necessario and textoQtd or ""
    end
end
local imagensLocaisIngredientesLivro = {
    erva = {
        E = "Frames/Ervas/verdolina.png",
        D = "Frames/Ervas/braverva.png",
        C = "Frames/Ervas/noctifolio.png",
        B = "Frames/Ervas/raiz_de_sa.png",
        A = "Frames/Ervas/Flor_de_varum.png",
        S = "Frames/Ervas/selenita.png"
    },
    cristal = {
        E = "Frames/cristais/cristal_opaco.png",
        D = "Frames/cristais/cristal_azul.png",
        C = "Frames/cristais/cristal_violeta.png",
        B = "Frames/cristais/cristal_brilhante.png",
        A = "Frames/cristais/cristal_raro.png",
        S = "Frames/cristais/cristal_amcestral.png"
    }
}

local function imagemMaterialLivroLocal(ingrediente)
    local tipo = textoChave(ingrediente and ingrediente.tipo)
    local rank = normalizarRank(ingrediente and ingrediente.rank)
    if tipo == "cristais" then tipo = "cristal" end
    if tipo == "ervas" then tipo = "erva" end
    if tipo == "frasco" then return imagemMaterialReceita(ingrediente) end
local grupo = imagensLocaisIngredientesLivro[tipo]
    if grupo ~= nil and tostring(grupo[rank] or "") ~= "" then return grupo[rank] end
    return imagemMaterialReceita(ingrediente)
end

local function textoEfeitoCurtoLivro(receita)
    local resultado = receita and receita.resultado or {}
    local linhas = {}
    local cura = tonumber(resultado.cura or resultado.hp or 0) or 0
    local pp = tonumber(resultado.pp or 0) or 0
    local valor = tonumber(resultado.potionValor or 0) or 0
    local duracao = tonumber(resultado.potionDuracaoMinutos or 0) or 0
    local efeito = tostring(resultado.potionEfeito or resultado.efeito or "")

    if cura > 0 then
        table.insert(linhas, "Efeito: restaura " .. tostring(cura) .. " HP.")
    elseif pp > 0 then
        table.insert(linhas, "Efeito: restaura " .. tostring(pp) .. " PP.")
    elseif efeito ~= "" and valor ~= 0 then
        local texto = "Efeito: " .. efeito .. " +" .. tostring(valor)
        if duracao > 0 then texto = texto .. " por " .. tostring(duracao) .. " min" end
        table.insert(linhas, texto .. ".")
    elseif tostring(resultado.dano or "") ~= "" then
        table.insert(linhas, "Efeito: modifica dano em " .. tostring(resultado.dano) .. ".")
    elseif tostring(resultado.ca or "") ~= "" then
        table.insert(linhas, "Efeito: modifica CA em " .. tostring(resultado.ca) .. ".")
    elseif tostring(resultado.rd or "") ~= "" then
        table.insert(linhas, "Efeito: modifica RD em " .. tostring(resultado.rd) .. ".")
    else
        table.insert(linhas, "Efeito: preparo alquimico especial.")
    end

    local desc = tostring(resultado.descricaoLoja or resultado.descricao or "")
    if desc ~= "" then
        desc = desc:gsub("%s+", " ")
        if string.len(desc) > 120 then desc = string.sub(desc, 1, 117) .. "..." end
        table.insert(linhas, "Descricao: " .. desc)
    end
    return table.concat(linhas, "\n")
end
local function limparPaginaLivroDesenhada(ficha, prefixo)
    ficha[prefixo .. "Titulo"] = ""
    ficha[prefixo .. "Subtitulo"] = ""
    ficha[prefixo .. "Imagem"] = ""
    ficha[prefixo .. "Receita"] = ""
    ficha[prefixo .. "Ingredientes"] = ""
    ficha[prefixo .. "Descricao"] = ""
    ficha[prefixo .. "CriarTexto"] = ""
    ficha[prefixo .. "Preparo"] = ""
    ficha[prefixo .. "PreparoTitulo"] = ""
    ficha[prefixo .. "Meta"] = ""
    for i = 1, 6 do
        ficha[prefixo .. "Ing" .. tostring(i) .. "Imagem"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "Nome"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdOk"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdFalta"] = ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "Plus"] = ""
    end
end

local function preencherIngredientesLivroDesenhado(ficha, prefixo, receita)
    local ingredientes = receita and receita.ingredientes or {}
    local total = math.min(6, #ingredientes)
    for i = 1, total do
        local ingrediente = ingredientes[i]
        local necessario = math.max(1, math.floor(numero(ingrediente.quantidade, 1)))
        local tem = contarIngredienteInventarioLivro(ficha, ingrediente)
        local textoQtd = tostring(tem) .. "/" .. tostring(necessario)
        ficha[prefixo .. "Ing" .. tostring(i) .. "Imagem"] = imagemMaterialLivroLocal(ingrediente)
        ficha[prefixo .. "Ing" .. tostring(i) .. "Nome"] = nomeMaterialReceita(ingrediente)
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdOk"] = tem >= necessario and textoQtd or ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "QtdFalta"] = tem < necessario and textoQtd or ""
        ficha[prefixo .. "Ing" .. tostring(i) .. "Plus"] = i < total and "+" or ""
    end
end
local function textoIngredientesLivro(receita)
    local linhas = {}
    for _, ingrediente in ipairs(receita and receita.ingredientes or {}) do
        local qtd = tostring(ingrediente.quantidade or 1)
        table.insert(linhas, qtd .. "x " .. nomeMaterialReceita(ingrediente) .. " rank " .. tostring(ingrediente.rank or receita.rank or "E"))
    end
    return table.concat(linhas, "\n")
end

local function receitasLivroPorCategoria(ficha, categoria)
    local mapa = listaLivroReceitas(ficha)
    local lista = {}
    for _, receita in ipairs(receitasAlquimia) do
        local chave = chaveReceitaAlquimia(receita)
        if mapa[chave] and (categoria == "TODOS" or categoriaLivroReceita(receita) == categoria) then
            table.insert(lista, receita)
        end
    end
    return lista
end

local function todasReceitasLivro(ficha)
    local ordemCategorias = {"HP", "PP", "ESPECIAIS", "PERICIAS"}
    local lista = {}
    for _, categoria in ipairs(ordemCategorias) do
        for _, receita in ipairs(receitasLivroPorCategoria(ficha, categoria)) do
            table.insert(lista, receita)
        end
    end
    return lista
end


local function tempoPreparoReceita(receita)
    local rank = normalizarRank(receita and receita.rank)
    local mapa = {E = 2, D = 3, C = 5, B = 8, A = 12, S = 20}
    return mapa[rank] or 2
end

local function textoPreparoReceita(receita)
    local ingredientes = receita and receita.ingredientes or {}
    local nomes = {}
    for _, ingrediente in ipairs(ingredientes) do
        if textoChave(ingrediente and ingrediente.tipo) ~= "frasco" then
            table.insert(nomes, nomeMaterialReceita(ingrediente))
        end
    end
    local primeiro = nomes[1] or "os reagentes"
    local segundo = nomes[2] or "a essencia"
    return "1. Macere " .. primeiro .. " ate soltar aroma.\n"
        .. "2. Misture " .. segundo .. " ao frasco morno.\n"
        .. "3. Gire, vede e deixe estabilizar."
end
local function textoMetaReceita(receita)
    local resultado = receita and receita.resultado or {}
    local rank = tostring(resultado.RankItem or receita.rank or "E")
    local tempo = tempoPreparoReceita(receita)
    local rendimento = math.max(1, math.floor(numero(resultado.quantidade, 1)))
    return "Nivel necessario: Rank " .. rank .. "\nTempo de preparo: " .. tostring(tempo) .. " minutos\nRendimento: " .. tostring(rendimento) .. " frasco"
end
local function limparPaginaImagemLivro(ficha, prefixo)
    ficha[prefixo .. "Titulo"] = ""
    ficha[prefixo .. "Subtitulo"] = ""
    ficha[prefixo .. "Imagem"] = ""
    ficha[prefixo .. "Receita"] = ""
    ficha[prefixo .. "Ingredientes"] = ""
    ficha[prefixo .. "Descricao"] = ""
    ficha[prefixo .. "CriarTexto"] = ""
    ficha[prefixo .. "Preparo"] = ""
    ficha[prefixo .. "PreparoTitulo"] = ""
    ficha[prefixo .. "Meta"] = ""
    limparIngredientesPaginaLivro(ficha, prefixo)
end

local function imagemPaginaReceitaLivro(receita)
    local resultado = receita and receita.resultado or {}
    return tostring(resultado.imagemPaginaReceita or resultado.imagemReceitaLivro or "")
end

local function imagemPotionReceitaLivro(receita)
    local resultado = receita and receita.resultado or {}
    local campos = {
        resultado.imagemestilo2,
        resultado.imagemUrl,
        resultado.imagem,
        resultado.urlImagem,
        resultado.imagemItem,
        resultado.imagemPotion,
        resultado.imagemReceitaSlot,
        resultado.imagemReceitaLivro
    }
    for _, valor in ipairs(campos) do
        valor = tostring(valor or "")
        if valor ~= "" then return valor end
    end
    return ""
end
local function preencherPaginaReceitaLivro(ficha, lado, receita)
    if ficha == nil then return end
    local prefixo = lado == "D" and "LivroAlqDir" or "LivroAlqEsq"
    limparPaginaLivroDesenhada(ficha, prefixo)
    if receita == nil then return end
    local resultado = receita.resultado or {}
    ficha[prefixo .. "Titulo"] = "Receita da Pocao"
    ficha[prefixo .. "Subtitulo"] = tostring(resultado.nomeItem or "Pocao")
    ficha[prefixo .. "Imagem"] = imagemPotionReceitaLivro(receita)
    ficha[prefixo .. "Receita"] = ""
    ficha[prefixo .. "Ingredientes"] = "Ingredientes"
    ficha[prefixo .. "Descricao"] = textoEfeitoCurtoLivro(receita)
    ficha[prefixo .. "Preparo"] = textoPreparoReceita(receita)
    ficha[prefixo .. "PreparoTitulo"] = "Modo de Preparo"
    ficha[prefixo .. "Meta"] = textoMetaReceita(receita)
    ficha[prefixo .. "CriarTexto"] = "CRIAR"
    preencherIngredientesLivroDesenhado(ficha, prefixo, receita)
end

local function linhasIndiceLivro(lista)
    local linhas = {}
    local categorias = {
        {"HP", "POCOES DE HP"},
        {"PP", "POCOES DE PP"},
        {"ESPECIAIS", "POCOES ESPECIAIS"},
        {"PERICIAS", "POCOES DE PERICIAS"},
        {"OUTROS", "OUTRAS RECEITAS"}
    }
    local mapa = {}
    for _, receita in ipairs(lista or {}) do
        local cat = categoriaLivroReceita(receita)
        if cat ~= "HP" and cat ~= "PP" and cat ~= "ESPECIAIS" and cat ~= "PERICIAS" then cat = "OUTROS" end
        if mapa[cat] == nil then mapa[cat] = {} end
        table.insert(mapa[cat], receita)
    end
    for _, info in ipairs(categorias) do
        local itens = mapa[info[1]] or {}
        table.insert(linhas, {texto = info[2], chave = ""})
        if #itens == 0 then
            table.insert(linhas, {texto = "  -", chave = ""})
        else
            for _, receita in ipairs(itens) do
                table.insert(linhas, {
                    texto = "  " .. tostring(receita.resultado and receita.resultado.nomeItem or receita.id or "Receita"),
                    chave = chaveReceitaAlquimia(receita)
                })
            end
        end
        table.insert(linhas, {texto = "", chave = ""})
    end
    return linhas
end

local function textoIndiceLivro(ficha, lista)
    local textos = {}
    for _, linha in ipairs(linhasIndiceLivro(lista)) do
        table.insert(textos, linha.texto or "")
    end
    return table.concat(textos, "\n")
end
function CWNA_atualizarLivroReceitasAlquimista(ficha)
    if ficha == nil then return end
    if tostring(ficha.LivroAlqAtualizando or "") == "true" then return end
    ficha.LivroAlqAtualizando = "true"
    local lista = todasReceitasLivro(ficha)
    local pagina = math.max(1, math.floor(numero(ficha.LivroAlqPaginaDupla, ficha.LivroAlqPagina or 1)))
    local totalPaginas = math.max(1, math.ceil(#lista / 2) + 1)
    if pagina > totalPaginas then pagina = totalPaginas end
    ficha.LivroAlqPaginaDupla = pagina
    ficha.LivroAlqPagina = pagina
    ficha.LivroAlqPaginaTexto = "Paginas " .. tostring(((pagina - 1) * 2) + 1) .. "-" .. tostring(((pagina - 1) * 2) + 2)
    ficha.LivroAlqTotalTexto = tostring(#lista) .. " receitas aprendidas"
    ficha.LivroAlqPrevTexto = pagina > 1 and "<" or ""
    ficha.LivroAlqNextTexto = pagina < totalPaginas and ">" or ""

    for i = 1, 12 do
        if pagina == 1 then
            local linha = linhasIndiceLivro(lista)[i]
            ficha["LivroAlqItem" .. tostring(i)] = linha and tostring(linha.texto or "") or ""
            ficha["LivroAlqItemChave" .. tostring(i)] = linha and tostring(linha.chave or "") or ""
        else
            ficha["LivroAlqItem" .. tostring(i)] = ""
            ficha["LivroAlqItemChave" .. tostring(i)] = ""
        end
    end

    local selecionada = nil
    local chaveSelecionada = textoChave(ficha.LivroAlqReceitaSelecionada)
    for _, receita in ipairs(lista) do
        if chaveReceitaAlquimia(receita) == chaveSelecionada then
            selecionada = receita
            break
        end
    end
    if selecionada == nil and #lista > 0 then selecionada = lista[1] end
    if selecionada ~= nil then
        local resultado = selecionada.resultado or {}
        ficha.LivroAlqReceitaSelecionada = chaveReceitaAlquimia(selecionada)
        ficha.LivroAlqNome = tostring(resultado.nomeItem or "")
        ficha.LivroAlqRank = "Rank " .. tostring(resultado.RankItem or selecionada.rank or "E")
        ficha.LivroAlqReceita = tostring((selecionada.nomes or {})[1] or "")
        ficha.LivroAlqIngredientes = textoIngredientesLivro(selecionada)
        ficha.LivroAlqDescricao = descricaoLivroReceita(selecionada)
        ficha.LivroAlqImagem = tostring(resultado.imagemestilo2 or "")
    else
        ficha.LivroAlqNome = "Livro de receitas ALQUIMISTA"
        ficha.LivroAlqRank = ""
        ficha.LivroAlqReceita = "Nenhuma receita aprendida nesta categoria."
        ficha.LivroAlqIngredientes = ""
        ficha.LivroAlqDescricao = "Compre receitas no mercado para registra-las automaticamente aqui."
        ficha.LivroAlqImagem = ""
    end

    if pagina == 1 then
        limparPaginaLivroDesenhada(ficha, "LivroAlqEsq")
        limparPaginaLivroDesenhada(ficha, "LivroAlqDir")
        ficha.LivroAlqEsqTitulo = "Indice de Pocoes"
        ficha.LivroAlqEsqSubtitulo = "Receitas conhecidas"
        ficha.LivroAlqEsqReceita = ""
        ficha.LivroAlqDirImagem = tostring(ficha.LivroAlqImagemCompendio or "")
    else
        local indice = ((pagina - 2) * 2) + 1
        preencherPaginaReceitaLivro(ficha, "E", lista[indice])
        preencherPaginaReceitaLivro(ficha, "D", lista[indice + 1])
    end
    ficha.LivroAlqAtualizando = ""
end

function CWNA_prepararReceitaLivroAlquimista(ficha, controle)
    if ficha == nil then return end
    if tostring(ficha.ProfissaoEscolhida or "") ~= "ALQUIMISTA" then
        avisar(controle, "Apenas personagens com profissao ALQUIMISTA podem criar por este livro.", 7000)
        return
    end
    local receita = receitaAlquimiaPorChave(ficha.LivroAlqReceitaSelecionada)
    if receita == nil then
        avisar(controle, "Selecione uma receita aprendida no livro.", 7000)
        return
    end
    local podeCriar, rankAtual, rankNecessario = alquimistaPodeCriarReceita(ficha, receita)
    if not podeCriar then
        avisarRankInsuficienteAlquimista(controle, rankAtual, rankNecessario)
        return
    end
    local resultado = receita.resultado or {}
    ficha.AlquimistaSlot1_nomeItem = tostring((receita.nomes or {})[1] or resultado.nomeItem or "Receita")
    ficha.AlquimistaSlot1_tipoItem = "Receita"
    ficha.AlquimistaSlot1_subtipoMaterial = "ALQUIMISTA"
    ficha.AlquimistaSlot1_RankItem = tostring(receita.rank or resultado.RankItem or "E")
    ficha.AlquimistaSlot1_imagemestilo2 = tostring(resultado.imagemReceitaSlot or resultado.imagemPaginaReceita or resultado.imagemReceitaLivro or resultado.imagemestilo2 or "")
    ficha.AlquimistaSlot1_quantidade = 1
    ficha.AlquimistaSlot1_quantidadeDisplay = "1"
    ficha.AlquimistaSlot1_usaQuantidade = "false"
    ficha.AlquimistaSlot1_origemLivroReceita = "true"
    ficha.LivroAlqPaginaDupla = ficha.LivroAlqPaginaDupla or 1
    local ctrl = controle
    while ctrl ~= nil do
        local livro = ctrl:findControlByName("frameLivroReceitasAlquimista")
        if livro ~= nil then livro.visible = false end
        local detalhe = ctrl:findControlByName("frameDetalheItemLoja")
        if detalhe ~= nil then detalhe.visible = false end
        local alq = ctrl:findControlByName("frameAlquimistaInventario")
        if alq ~= nil then
            alq.visible = true
            pcall(function() alq:bringToFront() end)
            return
        end
        ctrl = ctrl.parent
    end
end

function CWNA_prepararReceitaPaginaLivroAlquimista(ficha, lado, controle)
    if ficha == nil then return end
    local pagina = math.max(1, math.floor(numero(ficha.LivroAlqPaginaDupla, ficha.LivroAlqPagina or 1)))
    if pagina <= 1 then
        avisar(controle, "Abra uma pagina de receita antes de criar.", 5000)
        return
    end
    local lista = todasReceitasLivro(ficha)
    local indice = ((pagina - 2) * 2) + (lado == "D" and 2 or 1)
    local receita = lista[indice]
    if receita == nil then
        avisar(controle, "Esta pagina nao possui receita.", 5000)
        return
    end
    ficha.LivroAlqReceitaSelecionada = chaveReceitaAlquimia(receita)
    CWNA_prepararReceitaLivroAlquimista(ficha, controle)
end

function CWNA_definirCategoriaLivroAlquimista(ficha, categoria)
    if ficha == nil then return end
    ficha.LivroAlqCategoria = tostring(categoria or "HP")
    ficha.LivroAlqPagina = 1
    CWNA_atualizarLivroReceitasAlquimista(ficha)
end

function CWNA_mudarPaginaLivroAlquimista(ficha, delta)
    if ficha == nil then return end
    ficha.LivroAlqPaginaDupla = math.max(1, math.floor(numero(ficha.LivroAlqPaginaDupla, ficha.LivroAlqPagina or 1) + numero(delta, 0)))
    CWNA_atualizarLivroReceitasAlquimista(ficha)
end

function CWNA_selecionarReceitaLivroAlquimista(ficha, indice)
    if ficha == nil then return end
    local chave = tostring(ficha["LivroAlqItemChave" .. tostring(indice)] or "")
    if chave ~= "" then
        ficha.LivroAlqReceitaSelecionada = chave
        local lista = todasReceitasLivro(ficha)
        for pos, receita in ipairs(lista) do
            if chaveReceitaAlquimia(receita) == textoChave(chave) then
                ficha.LivroAlqPaginaDupla = math.ceil(pos / 2) + 1
                break
            end
        end
        CWNA_atualizarLivroReceitasAlquimista(ficha)
    end
end

function CWNA_abrirLivroReceitasAlquimista(ficha, controle)
    if ficha == nil then return end
    ficha.LivroAlqPaginaDupla = 1
    CWNA_atualizarLivroReceitasAlquimista(ficha)
    local ctrl = controle
    while ctrl ~= nil do
        local frame = ctrl:findControlByName("frameLivroReceitasAlquimista")
        if frame ~= nil then
            frame.visible = true
            pcall(function() frame:bringToFront() end)
            return
        end
        ctrl = ctrl.parent
    end
end

function CWNA_registrarReceitaAlquimistaComprada(ficha, itemReceita, controle)
    if ficha == nil or itemReceita == nil then return false end
    local receita = receitaAlquimiaPorNome(itemReceita.nomeItem)
    if receita == nil then return false end

    local livro = livroAlquimistaAtivo(ficha)
    if livro == nil then
        if controle ~= nil and CWNA_mostrarAvisoInventario ~= nil then
            CWNA_mostrarAvisoInventario(controle, "Voce precisa ter o Livro de receitas ALQUIMISTA no inventario para aprender esta receita.", 8000)
        end
        return true, false, "sem_livro"
    end

    local mapa = listaLivroReceitas(ficha)
    mapa.__ordem = {}
    for chaveExistente in tostring(livro.LivroReceitasAlquimistaLista or ficha.LivroReceitasAlquimistaLista or ""):gmatch("[^;]+") do
        chaveExistente = textoChave(chaveExistente)
        if chaveExistente ~= "" and mapa[chaveExistente] then table.insert(mapa.__ordem, chaveExistente) end
    end
    local chave = chaveReceitaAlquimia(receita)
    local nova = not mapa[chave]
    if nova then table.insert(mapa.__ordem, chave) end
    mapa[chave] = true
    salvarListaLivroReceitas(ficha, mapa)
    ficha.LivroAlqReceitaSelecionada = chave
    CWNA_atualizarLivroReceitasAlquimista(ficha)
    if controle ~= nil then
        local msg = nova and ("Receita adicionada ao Livro de receitas ALQUIMISTA. Rank do livro: " .. tostring(livro.RankItem or "E")) or "Voce ja tinha esta receita no Livro de receitas ALQUIMISTA."
        if CWNA_mostrarAvisoInventario ~= nil then CWNA_mostrarAvisoInventario(controle, msg, 7000) end
    end
    return true, nova
end
local function receitaPorItem(ficha)
    local nomeReceita = textoChave(ficha and ficha[campoSlot(1, "nomeItem")])
    if nomeReceita ~= "" then
        local receita = receitaAlquimiaPorNome(nomeReceita)
        if receita ~= nil then return receita end
    end
    return receitaAlquimiaPorChave(ficha and ficha.LivroAlqReceitaSelecionada)
end

local function ingredienteEhFrasco(ingrediente)
    return textoChave(ingrediente and ingrediente.tipo) == "frasco"
end

local function frascoCentralBateReceita(ficha, receita)
    if ficha == nil or receita == nil or not slotTemItem(ficha, 5) then return false end
    if not nomeContemFrasco({nomeItem = ficha[campoSlot(5, "nomeItem")]}) then return false end

    local rankFrasco = normalizarRank(ficha[campoSlot(5, "RankItem")])
    local rankReceita = normalizarRank(receita.rank)
    for _, ingrediente in ipairs(receita.ingredientes or {}) do
        if ingredienteEhFrasco(ingrediente) then
            rankReceita = normalizarRank(ingrediente.rank or receita.rank)
            break
        end
    end
    return rankFrasco == rankReceita
end

local function quantidadeSlotAlquimia(ficha, slot)
    return math.max(0, math.floor(numero(ficha and ficha[campoSlot(slot, "quantidade")], 1)))
end

local function slotBateIngrediente(ficha, slot, ingrediente)
    if ficha == nil or ingrediente == nil or not slotTemItem(ficha, slot) then return false end
    if ingredienteEhFrasco(ingrediente) then return false end
    local nomeSlot = textoChave(ficha[campoSlot(slot, "nomeItem")])
    local nomeIng = textoChave(nomeMaterialReceita(ingrediente))
    if nomeIng ~= "" and nomeSlot == nomeIng then return true end

    local tipo = textoChave(ficha[campoSlot(slot, "tipoItem")])
    local subtipo = textoChave(ficha[campoSlot(slot, "subtipoMaterial")])
    local rank = normalizarRank(ficha[campoSlot(slot, "RankItem")])
    local tipoIng = textoChave(ingrediente.tipo)
    if rank ~= normalizarRank(ingrediente.rank) then return false end
    if tipo ~= "material" and tipo ~= "outros" then return false end
    if tipoIng == "erva" then return subtipo:find("erva", 1, true) ~= nil end
    if tipoIng == "cristal" then return subtipo:find("crist", 1, true) ~= nil end
    return false
end

local function contarIngrediente(ficha, ingrediente)
    local total = 0
    for _, slot in ipairs(slotsIngredientesAlquimia) do
        if slotBateIngrediente(ficha, slot, ingrediente) then
            total = total + math.max(0, math.floor(numero(ficha and ficha[campoSlot(slot, "quantidade")], 1)))
        end
    end
    return total
end

local function consumirIngrediente(ficha, ingrediente, quantidade)
    local falta = math.max(0, math.floor(numero(quantidade, 0)))
    for _, slot in ipairs(slotsIngredientesAlquimia) do
        if falta <= 0 then return true end
        if slotBateIngrediente(ficha, slot, ingrediente) then
            local atual = quantidadeSlotAlquimia(ficha, slot)
            local gasto = math.min(atual, falta)
            CWNA_consumirQuantidadeSlotAlquimista(ficha, slot, gasto)
            falta = falta - gasto
        end
    end
    return falta <= 0
end

local function limparSlot(ficha, slot)
    if ficha == nil then return end
    for _, campo in ipairs(camposItem) do ficha[campoSlot(slot, campo)] = "" end
end

local function copiarItemParaSlot(ficha, slot, item, quantidadeSlot)
    if ficha == nil or item == nil then return end
    for _, campo in ipairs(camposItem) do ficha[campoSlot(slot, campo)] = item[campo] or "" end
    if itemEmpilhavel(item) then
        local qtd = math.max(1, math.floor(numero(quantidadeSlot, item.quantidade) or 1))
        ficha[campoSlot(slot, "quantidade")] = qtd
        ficha[campoSlot(slot, "quantidadeDisplay")] = tostring(qtd)
        ficha[campoSlot(slot, "usaQuantidade")] = "true"
        ficha[campoSlot(slot, "nivelUpgrade")] = ""
        ficha[campoSlot(slot, "textoUpgrade")] = ""
    end
end

local function copiarSlotParaItem(ficha, slot, item)
    if ficha == nil or item == nil then return end
    for _, campo in ipairs(camposItem) do item[campo] = ficha[campoSlot(slot, campo)] or "" end
    item.slotVazio = "false"
    item.uidInventario = tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
    item.equipadoEm = ""
    if tostring(item.usaQuantidade or "") == "true" then
        local qtd = math.max(1, math.floor(numero(item.quantidade, 1)))
        item.quantidade = qtd
        item.quantidadeDisplay = tostring(qtd)
    end
end

local function atualizarQuantidadeItem(item, quantidade)
    if item == nil then return end
    local qtd = math.floor(numero(quantidade, 0))
    if qtd <= 0 then
        prepararSlotVazio(item, item.ordemInventario)
    else
        item.slotVazio = "false"
        item.quantidade = qtd
        item.quantidadeDisplay = tostring(qtd)
        item.usaQuantidade = "true"
        if item.uidInventario == nil or item.uidInventario == "" then
            item.uidInventario = tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
        end
    end
end

local function slotEmpilhavel(ficha, slot)
    return tostring(ficha and ficha[campoSlot(slot, "usaQuantidade")] or "") == "true"
end

local function mesmoItemEmpilhavel(item, ficha, slot)
    if item == nil or ficha == nil then return false end
    return not slotVazio(item)
        and itemEmpilhavel(item)
        and tostring(item.nomeItem or "") == tostring(ficha[campoSlot(slot, "nomeItem")] or "")
        and textoLimpo(item.tipoItem) == textoLimpo(ficha[campoSlot(slot, "tipoItem")])
        and textoLimpo(item.subtipoMaterial) == textoLimpo(ficha[campoSlot(slot, "subtipoMaterial")])
        and string.upper(textoLimpo(item.RankItem)) == string.upper(textoLimpo(ficha[campoSlot(slot, "RankItem")]))
        and tostring(item.imagemestilo2 or "") == tostring(ficha[campoSlot(slot, "imagemestilo2")] or "")
end

local function encontrarPilhaInventario(ficha, slot)
    if ficha == nil or ficha.magias2 == nil then return nil end
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if mesmoItemEmpilhavel(item, ficha, slot) then return item end
    end
    return nil
end

local function mesmoResultadoAlquimia(item, resultado)
    if item == nil or resultado == nil then return false end
    return not slotVazio(item)
        and itemEmpilhavel(item)
        and tostring(item.nomeItem or "") == tostring(resultado.nomeItem or "")
        and textoLimpo(item.tipoItem) == textoLimpo(resultado.tipoItem)
        and string.upper(textoLimpo(item.RankItem)) == string.upper(textoLimpo(resultado.RankItem))
        and tostring(item.cura or "") == tostring(resultado.cura or "")
        and tostring(item.pp or "") == tostring(resultado.pp or "")
end

local function encontrarPilhaResultado(ficha, resultado)
    if ficha == nil or ficha.magias2 == nil then return nil end
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if mesmoResultadoAlquimia(item, resultado) then return item end
    end
    return nil
end

local function criarResultadoInventario(ficha, receita, controle, quantidadeCriada)
    if ficha == nil or receita == nil or receita.resultado == nil then return false end
    local resultado = receita.resultado
    local quantidade = math.max(1, math.floor(numero(quantidadeCriada, resultado.quantidade or 1)))
    local pilha = encontrarPilhaResultado(ficha, resultado)
    if pilha ~= nil then
        atualizarQuantidadeItem(pilha, numero(pilha.quantidade, 0) + quantidade)
        return true
    end

    local destino = primeiroSlotVazio(ficha)
    if destino == nil then
        avisar(controle, "Inventario cheio para receber a pocao.", 7000)
        return false
    end

    local ordem = destino.ordemInventario
    prepararSlotVazio(destino, ordem)
    destino.slotVazio = "false"
    destino.uidInventario = tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
    destino.nomeItem = tostring(resultado.nomeItem or "Pocao")
    destino.tipoItem = tostring(resultado.tipoItem or "Potion HP")
    destino.subtipoMaterial = tostring(resultado.subtipoMaterial or "")
    destino.RankItem = tostring(resultado.RankItem or receita.rank or "E")
    destino.imagemestilo2 = tostring(resultado.imagemestilo2 or "")
    destino.quantidade = quantidade
    destino.quantidadeDisplay = tostring(quantidade)
    destino.usaQuantidade = "true"
    destino.cura = tostring(resultado.cura or "")
    destino.potionEfeito = tostring(resultado.potionEfeito or "")
    destino.potionValor = tostring(resultado.potionValor or "")
    destino.potionDuracaoMinutos = tostring(resultado.potionDuracaoMinutos or "")
    destino.hp = tostring(resultado.hp or "")
    destino.pp = tostring(resultado.pp or "")
    destino.ca = tostring(resultado.ca or "")
    destino.rd = tostring(resultado.rd or "")
    destino.dano = tostring(resultado.dano or "")
    destino.origemLoja = "true"
    destino.precoLojaPrata = tostring(resultado.precoLojaPrata or 0)
    destino.descricaoLoja = tostring(resultado.descricaoLoja or "")
    destino.equipadoEm = ""
    return true
end

function CWNA_receberItemAlquimista(ficha, slotAlquimista, uidInventario, controle)
    if ficha == nil or uidInventario == nil then return end
    local slot = math.max(1, math.min(8, tonumber(slotAlquimista) or 1))
    if slotTemItem(ficha, slot) then
        avisar(controle, "Este slot do Alquimista ja possui um item.", 5000)
        return
    end

    local item = procurarItemPorUid(ficha, uidInventario)
    if item == nil or slotVazio(item) then return end

    if slot == 1 and not nomeContemReceita(item) then
        avisar(controle, "Esse slote so aceita receitas", 7000)
        return
    end

    if slotEhFrasco(slot) and not subtipoMaterialPermitidoFrasco(item) then
        avisar(controle, "Os frascos aceitam apenas materiais do subtipo Erva ou Cristais.", 7000)
        return
    end

    if slot == 5 and not nomeContemFrasco(item) then
        avisar(controle, "Esse slote so aceita frascos", 7000)
        return
    end

    if slot == 5 then
        local receitaAtual = receitaPorItem(ficha)
        if receitaAtual ~= nil then
            local rankFrasco = normalizarRank(item.RankItem)
            local rankReceita = normalizarRank(receitaAtual.rank)
            for _, ingrediente in ipairs(receitaAtual.ingredientes or {}) do
                if ingredienteEhFrasco(ingrediente) then
                    rankReceita = normalizarRank(ingrediente.rank or receitaAtual.rank)
                    break
                end
            end
            if rankFrasco ~= rankReceita then
                avisar(controle, "O frasco precisa ser do mesmo rank da receita.", 8000)
                return
            end
        end
    end
    local qtdOrigem = math.max(1, math.floor(numero(item.quantidade, 1)))
    copiarItemParaSlot(ficha, slot, item, qtdOrigem)
    prepararSlotVazio(item, item.ordemInventario)
end

function CWNA_devolverSlotAlquimistaParaInventario(ficha, slotAlquimista, itemDestino, controle)
    if ficha == nil or not slotTemItem(ficha, slotAlquimista) then return end
    local slot = math.max(1, math.min(8, tonumber(slotAlquimista) or 1))
    if slot == 1 and tostring(ficha[campoSlot(slot, "origemLivroReceita")] or "") == "true" then
        limparSlot(ficha, slot)
        return
    end
    local qtdSlot = math.max(1, math.floor(numero(ficha[campoSlot(slot, "quantidade")], 1)))

    if slotEmpilhavel(ficha, slot) then
        if mesmoItemEmpilhavel(itemDestino, ficha, slot) then
            atualizarQuantidadeItem(itemDestino, numero(itemDestino.quantidade, 0) + qtdSlot)
            limparSlot(ficha, slot)
            return
        end

        local pilha = encontrarPilhaInventario(ficha, slot)
        if pilha ~= nil then
            atualizarQuantidadeItem(pilha, numero(pilha.quantidade, 0) + qtdSlot)
            limparSlot(ficha, slot)
            return
        end
    end

    local destino = itemDestino
    if destino == nil or not slotVazio(destino) then destino = primeiroSlotVazio(ficha) end
    if destino == nil then
        avisar(controle, "Limite maximo de 60 itens.", 5000)
        return
    end

    local ordem = destino.ordemInventario
    copiarSlotParaItem(ficha, slot, destino)
    destino.ordemInventario = ordem
    limparSlot(ficha, slot)
end

function CWNA_consumirQuantidadeSlotAlquimista(ficha, slotAlquimista, quantidade)
    if ficha == nil then return 0 end
    local slot = math.max(1, math.min(8, tonumber(slotAlquimista) or 1))
    if not slotTemItem(ficha, slot) then return 0 end
    local atual = math.max(1, math.floor(numero(ficha[campoSlot(slot, "quantidade")], 1)))
    local gasto = math.max(0, math.floor(numero(quantidade, 0)))
    local restante = atual - gasto
    if restante <= 0 then
        limparSlot(ficha, slot)
        return 0
    end
    ficha[campoSlot(slot, "quantidade")] = restante
    ficha[campoSlot(slot, "quantidadeDisplay")] = tostring(restante)
    ficha[campoSlot(slot, "usaQuantidade")] = "true"
    return restante
end

function CWNA_dragSlotAlquimista(ficha, slotAlquimista, drag)
    if ficha == nil or drag == nil or not slotTemItem(ficha, slotAlquimista) then return end
    drag:addData("cwnaAlquimistaSlot", tostring(slotAlquimista))
    drag:addData("text", tostring(ficha[campoSlot(slotAlquimista, "nomeItem")] or "Item"))
    local imagem = tostring(ficha[campoSlot(slotAlquimista, "imagemestilo2")] or "")
    if imagem ~= "" then
        drag:addData("url", imagem)
        drag:addData("imageURL", imagem)
        drag:addData("image", imagem)
        drag:addData("text/uri-list", imagem)
    end
end

function CWNA_trabalharAlquimista(ficha, controle)
    if ficha == nil then return end
    if not slotTemItem(ficha, 5) then
        avisar(controle, "Coloque um frasco no slot central.", 7000)
        return
    end

    local receita = receitaPorItem(ficha)
    if receita == nil then
        avisar(controle, "Coloque uma receita no slot ou selecione uma receita no Livro de receitas ALQUIMISTA.", 8000)
        return
    end
    if not frascoCentralBateReceita(ficha, receita) then
        avisar(controle, "O frasco precisa ser do mesmo rank da receita.", 8000)
        return
    end

    local faltando = {}
    for _, ingrediente in ipairs(receita.ingredientes or {}) do
        if not ingredienteEhFrasco(ingrediente) then
            local precisa = math.max(1, math.floor(numero(ingrediente.quantidade, 1)))
            local tem = contarIngrediente(ficha, ingrediente)
            if tem < precisa then
                table.insert(faltando, tostring(precisa - tem) .. "x " .. nomeMaterialReceita(ingrediente))
            end
        end
    end
    if #faltando > 0 then
        avisar(controle, "Faltam materiais: " .. table.concat(faltando, ", "), 9000)
        return
    end
    if encontrarPilhaResultado(ficha, receita.resultado) == nil and primeiroSlotVazio(ficha) == nil then
        avisar(controle, "Inventario cheio para receber a pocao.", 7000)
        return
    end

    local resultado = receita.resultado or {}
    local podeCriar, rankAtual, rankNecessario = alquimistaPodeCriarReceita(ficha, receita)
    if not podeCriar then
        avisarRankInsuficienteAlquimista(controle, rankAtual, rankNecessario)
        return
    end
    local rankReceita = normalizarRank(receita.rank or resultado.RankItem)
    local rankItem = normalizarRank(resultado.RankItem or receita.rank)
    local nome = tostring(resultado.nomeItem or "Pocao")
    local imagem = imagemPotionReceitaLivro(receita)
    local dado = math.random(1, 20)
    local bonusAlquimista = bonusRankAlquimista(rankPorIndice(tonumber(ficha.AlquimistaNivel) or 1))
    local bonusReceita = bonusRankAlquimista(rankReceita)
    local cd = cdAlquimiaRank(rankItem)
    local total = dado + bonusAlquimista + bonusReceita
    local margem = total - cd
    local quantidadeBase = math.max(1, math.floor(numero(resultado.quantidade, 1)))
    local quantidadeCriada = quantidadeBase
    local multiplicadorXp = 1
    local textoBonusMargem = ""

    if margem >= 10 then
        multiplicadorXp = 2
        quantidadeCriada = quantidadeCriada + 1
        textoBonusMargem = " Sucesso superior: +1 potion e XP dobrada."
    elseif margem >= 5 then
        multiplicadorXp = 1.5
        textoBonusMargem = " Sucesso superior: XP +50%."
    end

    if total < cd then
        enviarMensagemAlquimia(ficha, false, nome, rankItem, imagem, 1, 0)
        avisar(controle, "Alquimia falhou: " .. tostring(dado) .. "+" .. tostring(bonusAlquimista) .. "+" .. tostring(bonusReceita) .. " = " .. tostring(total) .. " contra CD " .. tostring(cd) .. ".", 9000)
        return
    end

    for _, ingrediente in ipairs(receita.ingredientes or {}) do
        if not ingredienteEhFrasco(ingrediente) then
            consumirIngrediente(ficha, ingrediente, ingrediente.quantidade)
        end
    end
    CWNA_consumirQuantidadeSlotAlquimista(ficha, 5, 1)

    if criarResultadoInventario(ficha, receita, controle, quantidadeCriada) then
        local xpGanho = math.floor(xpAlquimiaRank(rankItem) * multiplicadorXp)
        local xp = CWNA_adicionarXpAlquimista(ficha, xpGanho)
        enviarMensagemAlquimia(ficha, true, nome, rankItem, imagem, quantidadeCriada, xp)
        avisar(controle, "Alquimia: " .. tostring(dado) .. "+" .. tostring(bonusAlquimista) .. "+" .. tostring(bonusReceita) .. " = " .. tostring(total) .. " contra CD " .. tostring(cd) .. ". " .. tostring(quantidadeCriada) .. "x " .. nome .. " criada com sucesso! XP +" .. tostring(xp) .. "." .. textoBonusMargem, 9000)
    end
end

return Alquimista