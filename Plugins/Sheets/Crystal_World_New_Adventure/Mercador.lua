local Mercador = {}

local camposItem = {"nomeItem","tipoItem","subtipoMaterial","RankItem","imagemestilo2","quantidade","quantidadeDisplay","nivelUpgrade","textoUpgrade","usaQuantidade","hp","pp","ca","rd","dano","cura","durabilidade","durabilidadeMaxima","durabilidadeDisplay","durabilidadeBaseTempo","durabilidadeDataBase","origemLoja","uidLojaOrigem","precoLojaPrata","descricaoLoja"}

local function numero(valor, padrao)
    if valor == nil then return padrao or 0 end
    local texto = tostring(valor):gsub("%.", ""):gsub(",", ".")
    return tonumber(texto) or padrao or 0
end

local function limparTexto(valor)
    local texto = tostring(valor or ""):lower()
    texto = texto:gsub("^%s*(.-)%s*$", "%1")
    return texto
end

local function avisar(controle, texto, duracao, corTexto)
    if CWNA_mostrarAvisoInventario ~= nil then
        CWNA_mostrarAvisoInventario(controle, texto, duracao, corTexto)
    else
        showMessage(texto)
    end
end

local function campoFerramenta(campo)
    return "MercadorFerramenta_" .. tostring(campo)
end

local function ferramentaTemItem(ficha)
    return ficha ~= nil and tostring(ficha[campoFerramenta("nomeItem")] or "") ~= ""
end

local function limparFerramenta(ficha)
    if ficha == nil then return end
    for _, campo in ipairs(camposItem) do ficha[campoFerramenta(campo)] = "" end
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

local function indiceRank(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "D" then return 2 end
    if r == "C" then return 3 end
    if r == "B" then return 4 end
    if r == "A" then return 5 end
    if r == "S" then return 6 end
    return 1
end

local function rankPorIndice(indice)
    local ranks = {[1]="E", [2]="D", [3]="C", [4]="B", [5]="A", [6]="S"}
    return ranks[math.max(1, math.min(6, tonumber(indice) or 1))] or "E"
end

local function bonusRank(rank)
    return indiceRank(rank)
end

local function cdPorRank(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "D" then return 13 end
    if r == "C" then return 16 end
    if r == "B" then return 19 end
    if r == "A" then return 22 end
    if r == "S" then return 25 end
    return 10
end

local function descontoPorRank(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "D" then return 10 end
    if r == "C" then return 15 end
    if r == "B" then return 18 end
    if r == "A" then return 22 end
    if r == "S" then return 25 end
    return 5
end

local function metaNivel(nivel)
    nivel = tonumber(nivel) or 1
    if nivel >= 6 then return 0 end
    if nivel == 5 then return 2000 end
    if nivel == 4 then return 1000 end
    if nivel == 3 then return 500 end
    if nivel == 2 then return 250 end
    return 100
end

local function nivelPorXp(xp)
    xp = tonumber(xp) or 0
    if xp >= 2000 then return 6 end
    if xp >= 1000 then return 5 end
    if xp >= 500 then return 4 end
    if xp >= 250 then return 3 end
    if xp >= 100 then return 2 end
    return 1
end

local function inicioNivel(nivel)
    if nivel >= 6 then return 2000 end
    if nivel == 5 then return 1000 end
    if nivel == 4 then return 500 end
    if nivel == 3 then return 250 end
    if nivel == 2 then return 100 end
    return 0
end

local function arredondarXpMercador(valor)
    return math.max(0, math.floor(tonumber(valor) or 0))
end

local function textoXpMercador(valor)
    return tostring(arredondarXpMercador(valor))
end

local function xpMercadorPorUso(xpTotal, usosAntes)
    xpTotal = arredondarXpMercador(xpTotal)
    usosAntes = math.max(1, math.min(6, math.floor(tonumber(usosAntes) or 1)))

    local base = math.floor(xpTotal / 6)
    local resto = xpTotal % 6
    local indiceUso = 7 - usosAntes

    if indiceUso > (6 - resto) then
        return base + 1
    end

    return base
end

local function atualizarXp(ficha)
    if ficha == nil then return end
    if tostring(ficha.MercadorXpPorNivel or "") ~= "true" then
        local xpAntigo = arredondarXpMercador(math.max(0, tonumber(ficha.MercadorXP) or 0))
        local nivelSalvo = math.floor(tonumber(ficha.MercadorNivel) or 0)
        local nivelMigrado = nivelSalvo >= 1 and nivelSalvo or nivelPorXp(xpAntigo)
        local inicio = inicioNivel(nivelMigrado)
        ficha.MercadorXP = xpAntigo >= inicio and math.max(0, xpAntigo - inicio) or xpAntigo
        ficha.MercadorNivel = math.max(1, math.min(6, nivelMigrado))
        ficha.MercadorXpPorNivel = "true"
    end

    local xp = arredondarXpMercador(math.max(0, tonumber(ficha.MercadorXP) or 0))
    local nivel = math.max(1, math.min(6, math.floor(tonumber(ficha.MercadorNivel) or 1)))
    local meta = metaNivel(nivel)
    if nivel < 6 and meta > 0 and xp >= meta then
        nivel, xp = nivel + 1, 0
    end

    ficha.MercadorXP, ficha.MercadorNivel = xp, nivel
    ficha.MercadorRankLetra = rankPorIndice(nivel)
    if nivel >= 6 then
        ficha.MercadorXPBarra, ficha.MercadorXPBarraMax, ficha.MercadorXPTexto = 1, 1, "MAX"
    else
        ficha.MercadorXPBarra, ficha.MercadorXPBarraMax = xp, math.max(1, meta)
        ficha.MercadorXPTexto = textoXpMercador(xp) .. "/" .. tostring(meta)
    end
end

function CWNA_atualizarXpMercador(ficha)
    atualizarXp(ficha)
end

function CWNA_adicionarXpMercador(ficha, ganho)
    if ficha == nil then return 0 end
    local xpGanho = arredondarXpMercador(math.max(0, tonumber(ganho) or 0))
    atualizarXp(ficha)
    ficha.MercadorXP = arredondarXpMercador((tonumber(ficha.MercadorXP) or 0) + xpGanho)
    atualizarXp(ficha)
    return xpGanho
end

local function ehLupa(item)
    return limparTexto(item and item.nomeItem) == "lupa"
end

local function rankPermitido(rankFerramenta, rankMercador)
    return indiceRank(rankFerramenta) <= indiceRank(rankMercador)
end

local function copiarItemParaFerramenta(ficha, item)
    if ficha == nil or item == nil then return end
    for _, campo in ipairs(camposItem) do ficha[campoFerramenta(campo)] = item[campo] or "" end
    ficha[campoFerramenta("quantidade")] = ""
    ficha[campoFerramenta("quantidadeDisplay")] = ficha[campoFerramenta("textoUpgrade")]
    ficha[campoFerramenta("usaQuantidade")] = "false"
end

local function copiarFerramentaParaItem(ficha, item)
    if ficha == nil or item == nil then return end
    for _, campo in ipairs(camposItem) do item[campo] = ficha[campoFerramenta(campo)] or "" end
    item.slotVazio = nil
    item.uidInventario = tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
    item.equipadoEm = ""
end

function CWNA_receberFerramentaMercador(ficha, uidInventario, controle)
    if ficha == nil or uidInventario == nil then return end
    local item = procurarItemPorUid(ficha, uidInventario)
    if item == nil or slotVazio(item) then return end
    if ferramentaTemItem(ficha) then avisar(controle, "O slot do mercador ja possui uma ferramenta."); return end
    if not ehLupa(item) then avisar(controle, "Este slot aceita apenas Lupa."); return end
    atualizarXp(ficha)
    if not rankPermitido(item.RankItem, ficha.MercadorRankLetra) then
        avisar(controle, "Esta Lupa exige Mercador Rank " .. tostring(item.RankItem or "?") .. " ou maior.")
        return
    end
    copiarItemParaFerramenta(ficha, item)
    prepararSlotVazio(item, item.ordemInventario)
end

function CWNA_dragFerramentaMercador(ficha, drag)
    if ficha == nil or drag == nil or not ferramentaTemItem(ficha) then return end
    drag:addData("cwnaMercadorFerramentaSlot", "1")
    drag:addData("text", tostring(ficha[campoFerramenta("nomeItem")] or "Lupa"))
    local imagem = tostring(ficha[campoFerramenta("imagemestilo2")] or "")
    if imagem ~= "" then
        drag:addData("url", imagem)
        drag:addData("imageURL", imagem)
        drag:addData("image", imagem)
        drag:addData("text/uri-list", imagem)
    end
end

function CWNA_devolverFerramentaMercadorParaInventario(ficha, itemDestino, controle)
    if ficha == nil or not ferramentaTemItem(ficha) then return end
    if itemDestino == nil or not slotVazio(itemDestino) then itemDestino = primeiroSlotVazio(ficha) end
    if itemDestino == nil then avisar(controle, "Limite maximo de 60 itens."); return end
    local ordem = itemDestino.ordemInventario
    copiarFerramentaParaItem(ficha, itemDestino)
    itemDestino.ordemInventario = ordem
    itemDestino.quantidade = ""
    itemDestino.quantidadeDisplay = itemDestino.textoUpgrade or ""
    itemDestino.usaQuantidade = "false"
    limparFerramenta(ficha)
end

local function dataMercadorHoje()
    return os.date("%Y-%m-%d")
end

local function modoNegociacaoMercador(modo)
    local m = string.upper(tostring(modo or "COMPRA"))
    if m == "VENDA" then return "Venda", "VENDA" end
    return "Compra", "COMPRA"
end

local function campoNegociacaoMercador(modo, campo)
    local prefixo = modoNegociacaoMercador(modo)
    return "MercadorNegociacao" .. prefixo .. "_" .. tostring(campo)
end

local function limparNegociacaoModo(ficha, modo)
    if ficha == nil then return end
    ficha[campoNegociacaoMercador(modo, "Data")] = ""
    ficha[campoNegociacaoMercador(modo, "Rank")] = ""
    ficha[campoNegociacaoMercador(modo, "Sucesso")] = "false"
    ficha[campoNegociacaoMercador(modo, "Percentual")] = 0
    ficha[campoNegociacaoMercador(modo, "Xp")] = 0
    ficha[campoNegociacaoMercador(modo, "Margem")] = 0
    ficha[campoNegociacaoMercador(modo, "Usos")] = 0
end

local function textoVisualNegociacaoModo(ficha, modo)
    local _, modoFinal = modoNegociacaoMercador(modo)
    local dataCampo = campoNegociacaoMercador(modoFinal, "Data")
    local dataNegociacao = tostring(ficha[dataCampo] or "")
    local rank = string.upper(tostring(ficha[campoNegociacaoMercador(modoFinal, "Rank")] or ""))

    if dataNegociacao ~= dataMercadorHoje() then
        return modoFinal .. ": +0% x0", false, false
    end

    if rank == "" then rank = "E" end

    local sucesso = tostring(ficha[campoNegociacaoMercador(modoFinal, "Sucesso")] or "") == "true"
    local percentual = tonumber(ficha[campoNegociacaoMercador(modoFinal, "Percentual")]) or 0
    local usos = math.max(0, math.floor(tonumber(ficha[campoNegociacaoMercador(modoFinal, "Usos")]) or 0))

    if usos > 0 then
        local valor = math.abs(percentual)
        local sinal
        if percentual >= 0 then
            sinal = modoFinal == "COMPRA" and "-" or "+"
        else
            sinal = modoFinal == "COMPRA" and "+" or "-"
        end

        return modoFinal .. " " .. rank .. ": " .. sinal .. tostring(valor) .. "% x" .. tostring(usos), sucesso, not sucesso
    end

    return modoFinal .. " " .. rank .. ": +0% x0", false, false
end

local function limparNegociacaoVisual(ficha)
    if ficha == nil then return end
    ficha.MercadorNegociacaoAtiva = "false"
    ficha.MercadorNegociacaoData = ""
    ficha.MercadorNegociacaoModo = ""
    ficha.MercadorNegociacaoRank = ""
    ficha.MercadorNegociacaoSucesso = "false"
    ficha.MercadorNegociacaoPercentual = 0
    ficha.MercadorNegociacaoXp = 0
    ficha.MercadorNegociacaoMargem = 0
    ficha.MercadorNegociacaoCompraTexto = "COMPRA: +0% x0"
    ficha.MercadorNegociacaoVendaTexto = "VENDA: +0% x0"
    ficha.MercadorNegociacaoTexto = ficha.MercadorNegociacaoCompraTexto .. "\n" .. ficha.MercadorNegociacaoVendaTexto
    ficha.MercadorNegociacaoCompraCor = "#D8C56A"
    ficha.MercadorNegociacaoVendaCor = "#D8C56A"
    ficha.MercadorNegociacaoCor = "#D8C56A"
end

local function corVisualNegociacao(ativa, falha)
    if falha then return "#FF4D4D" end
    if ativa then return "#35D46F" end
    return "#D8C56A"
end

local function atualizarVisualNegociacao(ficha, modo)
    if ficha == nil then return end
    local _, modoFinal = modoNegociacaoMercador(modo)
    local dataCampo = campoNegociacaoMercador(modoFinal, "Data")
    local sucessoCampo = campoNegociacaoMercador(modoFinal, "Sucesso")
    local percentualCampo = campoNegociacaoMercador(modoFinal, "Percentual")
    local rankCampo = campoNegociacaoMercador(modoFinal, "Rank")

    local textoCompra, compraAtiva, compraFalha = textoVisualNegociacaoModo(ficha, "COMPRA")
    local textoVenda, vendaAtiva, vendaFalha = textoVisualNegociacaoModo(ficha, "VENDA")
    ficha.MercadorNegociacaoCompraTexto = textoCompra
    ficha.MercadorNegociacaoVendaTexto = textoVenda
    ficha.MercadorNegociacaoTexto = textoCompra .. "\n" .. textoVenda
    ficha.MercadorNegociacaoCompraCor = corVisualNegociacao(compraAtiva, compraFalha)
    ficha.MercadorNegociacaoVendaCor = corVisualNegociacao(vendaAtiva, vendaFalha)
    ficha.MercadorNegociacaoCor = "#D8C56A"

    ficha.MercadorNegociacaoAtiva = "false"
    ficha.MercadorNegociacaoData = ficha[dataCampo] or ""
    ficha.MercadorNegociacaoModo = modoFinal
    ficha.MercadorNegociacaoRank = string.upper(tostring(ficha[rankCampo] or ""))
    ficha.MercadorNegociacaoSucesso = tostring(ficha[sucessoCampo] or "") == "true" and "true" or "false"
    ficha.MercadorNegociacaoPercentual = tonumber(ficha[percentualCampo]) or 0
    ficha.MercadorNegociacaoXp = tonumber(ficha[campoNegociacaoMercador(modoFinal, "Xp")]) or 0
    ficha.MercadorNegociacaoMargem = tonumber(ficha[campoNegociacaoMercador(modoFinal, "Margem")]) or 0
end

local function validarNegociacaoDiaria(ficha)
    if ficha == nil then return end
    local hoje = dataMercadorHoje()



    for _, modo in ipairs({"COMPRA", "VENDA"}) do
        local dataCampo = campoNegociacaoMercador(modo, "Data")
        local dataNegociacao = tostring(ficha[dataCampo] or "")
        if dataNegociacao ~= "" and dataNegociacao ~= hoje then
            limparNegociacaoModo(ficha, modo)
        elseif dataNegociacao == hoje then
            local sucesso = tostring(ficha[campoNegociacaoMercador(modo, "Sucesso")] or "") == "true"
            local usos = math.max(0, math.floor(tonumber(ficha[campoNegociacaoMercador(modo, "Usos")]) or 0))
            local percentual = tonumber(ficha[campoNegociacaoMercador(modo, "Percentual")]) or 0
            if not sucesso and usos == 0 and percentual == 0 then
                ficha[campoNegociacaoMercador(modo, "Percentual")] = -descontoPorRank(ficha.MercadorRankLetra)
                ficha[campoNegociacaoMercador(modo, "Usos")] = 6
            end
        end
    end

    local modoAtual = string.upper(tostring(ficha.MercadorModo or "COMPRA"))
    atualizarVisualNegociacao(ficha, modoAtual)
end

function CWNA_validarNegociacaoMercador(ficha)
    validarNegociacaoDiaria(ficha)
end

local function negociacaoModoFeitaHoje(ficha, modo)
    if ficha == nil then return false end
    return tostring(ficha[campoNegociacaoMercador(modo, "Data")] or "") == dataMercadorHoje()
end

local function textoNegociacoesRestantesHoje(ficha)
    local restantes = {}
    if not negociacaoModoFeitaHoje(ficha, "COMPRA") then table.insert(restantes, "compra") end
    if not negociacaoModoFeitaHoje(ficha, "VENDA") then table.insert(restantes, "venda") end

    if #restantes == 0 then return "" end
    if #restantes == 1 then return restantes[1] end
    return restantes[1] .. " ou " .. restantes[2]
end

local function xpBasePorRank(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "D" then return 10 end
    if r == "C" then return 18 end
    if r == "B" then return 28 end
    if r == "A" then return 40 end
    if r == "S" then return 60 end
    return 5
end

local function xpNegociacao(rankItem, margem)
    local xp = xpBasePorRank(rankItem)
    margem = tonumber(margem) or 0

    if margem < 0 then
        return math.floor(xp * 0.2)
    end

    if margem >= 10 then
        return xp * 2
    end

    if margem >= 5 then
        return math.floor(xp * 1.5)
    end

    return xp
end

local function registrarNegociacao(ficha, modo, rankItem, sucesso, desconto, xp, margem)
    local _, modoFinal = modoNegociacaoMercador(modo)
    ficha[campoNegociacaoMercador(modoFinal, "Data")] = dataMercadorHoje()
    ficha[campoNegociacaoMercador(modoFinal, "Rank")] = string.upper(tostring(rankItem or "E"))
    local percentual = tonumber(desconto) or 0
    if not sucesso then percentual = -percentual end

    ficha[campoNegociacaoMercador(modoFinal, "Sucesso")] = sucesso and "true" or "false"
    ficha[campoNegociacaoMercador(modoFinal, "Percentual")] = percentual
    ficha[campoNegociacaoMercador(modoFinal, "Xp")] = tonumber(xp) or 1
    ficha[campoNegociacaoMercador(modoFinal, "Margem")] = tonumber(margem) or 0
    ficha[campoNegociacaoMercador(modoFinal, "Usos")] = 6
    atualizarVisualNegociacao(ficha, modoFinal)
end

local function limparNegociacao(ficha)
    if ficha == nil then return end
    limparNegociacaoModo(ficha, "COMPRA")
    limparNegociacaoModo(ficha, "VENDA")
    limparNegociacaoVisual(ficha)
end

function CWNA_trabalharMercador(ficha, controle)
    if ficha == nil then return end
    atualizarXp(ficha)
    validarNegociacaoDiaria(ficha)

    local modo = string.upper(tostring(ficha.MercadorModo or "COMPRA"))
    local _, modoFinal = modoNegociacaoMercador(modo)
    if negociacaoModoFeitaHoje(ficha, modoFinal) then
        local restantes = textoNegociacoesRestantesHoje(ficha)
        local mensagem = "A negociação ja foi feita."
        if restantes ~= "" then
            mensagem = mensagem .. " Mas você ainda pode negociar: " .. restantes .. "."
        end
        avisar(controle, mensagem, 7000, "#FFFFFF")
        atualizarVisualNegociacao(ficha, modoFinal)
        return
    end

    local rankItem = string.upper(tostring(ficha.MercadorRankItem or "E"))
    local cd = cdPorRank(rankItem)
    local dado = math.random(1, 20)
    local bonusMercador = bonusRank(ficha.MercadorRankLetra)
    local rankFerramenta = string.upper(tostring(ficha[campoFerramenta("RankItem")] or ""))
    local bonusFerramenta = ferramentaTemItem(ficha) and rankPermitido(rankFerramenta, ficha.MercadorRankLetra) and bonusRank(rankFerramenta) or 0
    local total = dado + bonusMercador + bonusFerramenta
    local margem = total - cd
    local sucesso = margem >= 0
    local rankMercador = string.upper(tostring(ficha.MercadorRankLetra or "E"))
    local rankDesconto = rankMercador
    if sucesso and margem >= 10 then
        rankDesconto = rankPorIndice(indiceRank(rankMercador) + 1)
    end
    local percentual = descontoPorRank(rankDesconto)
    local xp = xpNegociacao(rankItem, margem)

    registrarNegociacao(ficha, modoFinal, rankItem, sucesso, percentual, xp, margem)
    if sucesso then
        avisar(controle, "SUCESSO", 4500, "#35D46F")
    else
        avisar(controle, "FRACASSO", 4500, "#FF4D4D")
    end
end
local function normalizarRankNegociacao(rank, fallback)
    local r = string.upper(tostring(rank or ""))
    if r == "" then r = string.upper(tostring(fallback or "")) end
    if r == "E" or r == "D" or r == "C" or r == "B" or r == "A" or r == "S" then return r end
    return string.upper(tostring(fallback or "E"))
end

local function rankDoItemNegociacao(item, fallback)
    if item == nil then return normalizarRankNegociacao(nil, fallback) end
    return normalizarRankNegociacao(item.RankItem or item.rankItem or item.rank or item.Rank, fallback)
end

local function estadoNegociacaoParaOperacao(ficha, modo, rankItem)
    validarNegociacaoDiaria(ficha)
    if ficha == nil then return nil end

    local _, modoFinal = modoNegociacaoMercador(modo)
    local dataCampo = campoNegociacaoMercador(modoFinal, "Data")
    if tostring(ficha[dataCampo] or "") ~= dataMercadorHoje() then return nil end

    local rankNegociacao = normalizarRankNegociacao(ficha[campoNegociacaoMercador(modoFinal, "Rank")], "E")
    local rankOperacao = normalizarRankNegociacao(rankItem, rankNegociacao)
    local usos = math.max(0, math.floor(tonumber(ficha[campoNegociacaoMercador(modoFinal, "Usos")]) or 0))

    if rankNegociacao ~= rankOperacao or usos <= 0 then return nil end

    return {
        modo = modoFinal,
        rank = rankNegociacao,
        percentual = tonumber(ficha[campoNegociacaoMercador(modoFinal, "Percentual")]) or 0,
        xp = tonumber(ficha[campoNegociacaoMercador(modoFinal, "Xp")]) or 1,
        usos = usos
    }
end

local function aplicarPercentual(valor, percentual, modo)
    valor = math.floor(numero(valor, 0))
    percentual = tonumber(percentual) or 0
    local mult = 1
    if string.upper(tostring(modo or "")) == "COMPRA" then
        mult = 1 - percentual / 100
    else
        mult = 1 + percentual / 100
    end
    return math.max(0, math.floor(valor * mult))
end

function CWNA_precoCompraMercador(ficha, itemLoja, precoUnitario)
    if ficha == nil or itemLoja == nil then return math.floor(numero(precoUnitario, 0)), false end
    local rank = rankDoItemNegociacao(itemLoja, "E")
    local estado = estadoNegociacaoParaOperacao(ficha, "COMPRA", rank)
    if estado == nil then return math.floor(numero(precoUnitario, 0)), false end
    return aplicarPercentual(precoUnitario, estado.percentual, "COMPRA"), true
end

function CWNA_precoVendaMercador(ficha, item, valorUnitario)
    if ficha == nil or item == nil then return math.floor(numero(valorUnitario, 0)), false end
    local rank = rankDoItemNegociacao(item, "E")
    local estado = estadoNegociacaoParaOperacao(ficha, "VENDA", rank)
    if estado == nil then return math.floor(numero(valorUnitario, 0)), false end
    return aplicarPercentual(valorUnitario, estado.percentual, "VENDA"), true
end

function CWNA_consumirNegociacaoMercador(ficha, modo, rankItem, controle)
    if ficha == nil then return 0 end
    local estado = estadoNegociacaoParaOperacao(ficha, modo, rankItem)
    if estado == nil then return 0 end

    local ganhoUso = xpMercadorPorUso(estado.xp, estado.usos)
    local usosRestantes = math.max(0, estado.usos - 1)
    ficha[campoNegociacaoMercador(estado.modo, "Usos")] = usosRestantes
    local ganho = CWNA_adicionarXpMercador(ficha, ganhoUso)
    atualizarVisualNegociacao(ficha, estado.modo)
    avisar(controle, "Negociacao usada. Restam " .. tostring(usosRestantes) .. " uso(s). Mercador XP +" .. textoXpMercador(ganho) .. ".", 6000)
    return ganho
end
return Mercador
