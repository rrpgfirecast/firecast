local Coletor = {}

local camposItem = {"nomeItem","tipoItem","subtipoMaterial","RankItem","imagemestilo2","quantidade","quantidadeDisplay","nivelUpgrade","textoUpgrade","usaQuantidade","hp","pp","ca","rd","dano","cura","durabilidade","durabilidadeMaxima","durabilidadeDisplay","durabilidadeBaseTempo","durabilidadeDataBase","origemLoja","uidLojaOrigem","precoLojaPrata","descricaoLoja"}
local tiposColeta = {"minerio", "madeira", "erva", "couro", "cristal"}

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

local function avisar(controle, texto, duracao)
    if CWNA_mostrarAvisoInventario ~= nil then
        CWNA_mostrarAvisoInventario(controle, texto, duracao)
    else
        showMessage(texto)
    end
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
            if ordem < melhorOrdem then
                melhor, melhorOrdem = item, ordem
            end
        end
    end
    return melhor
end

local function atualizarQuantidade(item, quantidade)
    if item == nil then return end
    local qtd = math.floor(numero(quantidade, 0))
    if qtd <= 0 then
        prepararSlotVazio(item, item.ordemInventario)
    else
        item.quantidade = qtd
        item.quantidadeDisplay = tostring(qtd)
        item.usaQuantidade = "true"
    end
end

local function campoFerramenta(campo)
    return "ColetorFerramenta_" .. tostring(campo)
end

local function ferramentaTemItem(ficha)
    return ficha ~= nil and tostring(ficha[campoFerramenta("nomeItem")] or "") ~= ""
end

local function limparFerramenta(ficha)
    if ficha == nil then return end
    for _, campo in ipairs(camposItem) do ficha[campoFerramenta(campo)] = "" end
end

local function bonusRank(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "D" then return 2 end
    if r == "C" then return 3 end
    if r == "B" then return 4 end
    if r == "A" then return 5 end
    if r == "S" then return 6 end
    return 1
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

local function rankPermitidoParaColetor(rankFerramenta, rankColetor)
    return indiceRank(rankFerramenta) <= indiceRank(rankColetor)
end

local function rankAcima(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "E" then return "D" end
    if r == "D" then return "C" end
    if r == "C" then return "B" end
    if r == "B" then return "A" end
    if r == "A" then return "S" end
    return nil
end

local function rankAbaixo(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "S" then return "A" end
    if r == "A" then return "B" end
    if r == "B" then return "C" end
    if r == "C" then return "D" end
    if r == "D" then return "E" end
    return nil
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

local function xpPorRankMaterial(rank)
    local r = string.upper(tostring(rank or "E"))
    if r == "D" then return 4 end
    if r == "C" then return 7 end
    if r == "B" then return 11 end
    if r == "A" then return 16 end
    if r == "S" then return 22 end
    return 2
end

local function xpColeta(rankColetor, rankMaterial, quantidade)
    local xp = xpPorRankMaterial(rankMaterial)
    if rankAcima(rankColetor) == string.upper(tostring(rankMaterial or "")) then
        if tonumber(quantidade) == 2 then
            xp = xp + 5
        else
            xp = xp + 2
        end
    end
    return xp
end

local function resultadoColetaPorBase(rankBase, total)
    local base = string.upper(tostring(rankBase or "E"))
    local cdBase = cdPorRank(base)
    if total < cdBase then return nil, 0, cdBase end

    local rankFinal, qtdFinal, cdFinal = base, 1, cdBase
    local superior = rankAcima(base)
    if superior ~= nil and total >= cdBase + 10 then
        rankFinal, qtdFinal, cdFinal = superior, 2, cdPorRank(superior)
    elseif superior ~= nil and total >= cdBase + 5 then
        rankFinal, qtdFinal, cdFinal = superior, 1, cdPorRank(superior)
    elseif superior == nil and total >= cdBase + 10 then
        qtdFinal = 3
    elseif superior == nil and total >= cdBase + 5 then
        qtdFinal = 2
    end
    return rankFinal, qtdFinal, cdFinal
end

local function codigoCorRankChat(rank)
    local r = string.upper(limparTexto(rank))
    if r == "SS" then return "10" end
    if r == "E" then return "14" end
    if r == "D" then return "9" end
    if r == "C" then return "11" end
    if r == "B" then return "13" end
    if r == "A" then return "8" end
    if r == "S" then return "4" end
    return "1"
end

local function enviarMensagemColeta(ficha, nomeItem, rankItem, quantidade, imagem)
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
    local corItem = codigoCorRankChat(rankItem)
    local texto = "<" .. nomeJogador .. "> " .. marcadorCor .. "1]coletou com sucesso:\n" ..
                  marcadorCor .. corItem .. "]" .. tostring(nomeItem or "Item") .. marcadorCor .. "1] x" .. tostring(tonumber(quantidade) or 1)

    imagem = tostring(imagem or "")
    if imagem ~= "" then texto = texto .. "\n" .. marcadorImagem .. imagem .. "]" end
    pcall(function() chat:enviarMensagem(texto) end)
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
    if tostring(ficha.ColetorXpPorNivel or "") ~= "true" then
        local xpAntigo = math.max(0, math.floor(tonumber(ficha.ColetorXP) or 0))
        local nivelSalvo = math.floor(tonumber(ficha.ColetorNivel) or 0)
        local nivelMigrado = nivelSalvo >= 1 and nivelSalvo or nivelPorXp(xpAntigo)
        local inicio = inicioNivel(nivelMigrado)
        ficha.ColetorXP = xpAntigo >= inicio and math.max(0, xpAntigo - inicio) or xpAntigo
        ficha.ColetorNivel = math.max(1, math.min(5, nivelMigrado))
        ficha.ColetorXpPorNivel = "true"
    end

    local xp = math.max(0, math.floor(tonumber(ficha.ColetorXP) or 0))
    local nivel = math.max(1, math.min(5, math.floor(tonumber(ficha.ColetorNivel) or 1)))
    local meta = metaNivel(nivel)
    if nivel < 5 and meta > 0 and xp >= meta then
        nivel, xp = nivel + 1, 0
    end

    ficha.ColetorXP, ficha.ColetorNivel = xp, nivel
    local letras = {[0]="E", [1]="D", [2]="C", [3]="B", [4]="A", [5]="S"}
    local rankNivel = nivel >= 5 and 5 or math.max(0, math.min(5, nivel - 1))
    ficha.ColetorRankLetra = letras[rankNivel] or "E"
    if nivel >= 5 then
        ficha.ColetorXPBarra, ficha.ColetorXPBarraMax, ficha.ColetorXPTexto = 1, 1, "MAX"
    else
        ficha.ColetorXPBarra, ficha.ColetorXPBarraMax = xp, math.max(1, meta)
        ficha.ColetorXPTexto = tostring(xp) .. "/" .. tostring(meta)
    end
end

function CWNA_atualizarXpColetor(ficha)
    atualizarXp(ficha)
end

function CWNA_adicionarXpColetor(ficha, ganho)
    if ficha == nil then return 0 end
    local xpGanho = math.max(0, math.floor(tonumber(ganho) or 0))
    atualizarXp(ficha)
    ficha.ColetorXP = (tonumber(ficha.ColetorXP) or 0) + xpGanho
    atualizarXp(ficha)
    return xpGanho
end

local function ehFerramenta(item)
    return limparTexto(item and item.nomeItem) == "ferramenta de coleta"
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

function CWNA_receberFerramentaColetor(ficha, uidInventario, controle)
    if ficha == nil or uidInventario == nil then return end
    local item = procurarItemPorUid(ficha, uidInventario)
    if item == nil or slotVazio(item) then return end
    if ferramentaTemItem(ficha) then avisar(controle, "O slot de coleta ja possui uma ferramenta."); return end
    if not ehFerramenta(item) then avisar(controle, "Este slot aceita apenas Ferramenta de Coleta."); return end
    atualizarXp(ficha)
    if not rankPermitidoParaColetor(item.RankItem, ficha.ColetorRankLetra) then
        avisar(controle, "Esta ferramenta exige Coletor Rank " .. tostring(item.RankItem or "?") .. " ou maior.")
        return
    end
    copiarItemParaFerramenta(ficha, item)
    prepararSlotVazio(item, item.ordemInventario)
end

function CWNA_dragFerramentaColetor(ficha, drag)
    if ficha == nil or drag == nil or not ferramentaTemItem(ficha) then return end
    drag:addData("cwnaColetorFerramentaSlot", "1")
    drag:addData("text", tostring(ficha[campoFerramenta("nomeItem")] or "Ferramenta de Coleta"))
    local imagem = tostring(ficha[campoFerramenta("imagemestilo2")] or "")
    if imagem ~= "" then
        drag:addData("url", imagem)
        drag:addData("imageURL", imagem)
        drag:addData("image", imagem)
        drag:addData("text/uri-list", imagem)
    end
end

function CWNA_devolverFerramentaColetorParaInventario(ficha, itemDestino, controle)
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

local function materialEmpilhavel(item)
    local tipo = limparTexto(item and item.tipoItem)
    local usa = limparTexto(item and item.usaQuantidade)
    return usa == "true" or tipo == "material" or tipo == "outros" or tipo == "minerio" or tipo == "minÃ©rio" or tipo == "madeira" or tipo == "erva" or tipo == "couro" or tipo == "cristal"
end

local function procurarPilhaMaterial(ficha, dados)
    if ficha == nil or ficha.magias2 == nil or dados == nil then return nil end
    for _, item in ipairs(NDB.getChildNodes(ficha.magias2)) do
        if not slotVazio(item)
            and materialEmpilhavel(item)
            and tostring(item.nomeItem or "") == tostring(dados.nome or "")
            and string.upper(tostring(item.RankItem or "")) == string.upper(tostring(dados.rank or ""))
            and limparTexto(item.tipoItem) == limparTexto(dados.tipo) then
            return item
        end
    end
    return nil
end

local function adicionarMaterial(ficha, tipoMaterial, rank, quantidade)
    local dados = CWNA_Materiais and CWNA_Materiais.getMaterial and CWNA_Materiais.getMaterial(tipoMaterial, rank) or nil
    if ficha == nil or dados == nil then return nil end
    local qtd = math.max(1, math.floor(tonumber(quantidade) or 1))
    local pilha = procurarPilhaMaterial(ficha, dados)
    if pilha ~= nil then
        atualizarQuantidade(pilha, numero(pilha.quantidade, 0) + qtd)
        return dados.nome, dados.imagemUrl or ""
    end

    local destino = primeiroSlotVazio(ficha)
    if destino == nil then return nil end
    local ordem = destino.ordemInventario
    destino.slotVazio = nil
    destino.uidInventario = tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
    destino.nomeItem = dados.nome or "Material"
    destino.tipoItem = dados.tipo or "material"
    destino.subtipoMaterial = string.upper(tostring(tipoMaterial or "material"))
    destino.RankItem = rank
    destino.imagemestilo2 = dados.imagemUrl or ""
    destino.quantidade = qtd
    destino.quantidadeDisplay = tostring(qtd)
    destino.usaQuantidade = "true"
    destino.nivelUpgrade = ""
    destino.textoUpgrade = ""
    destino.hp, destino.pp, destino.ca, destino.rd = 0, 0, 0, 0
    destino.dano, destino.cura = 0, 0
    destino.durabilidade, destino.durabilidadeMaxima, destino.durabilidadeDisplay = "", "", ""
    destino.durabilidadeBaseTempo, destino.durabilidadeDataBase = "", ""
    destino.origemLoja = "true"
    destino.uidLojaOrigem = "coleta_" .. tostring(os.time()) .. "_" .. tostring(math.random(100000, 999999))
    destino.precoLojaPrata = dados.precoPrata or 0
    destino.descricaoLoja = dados.descricao or ""
    destino.equipadoEm = ""
    destino.ordemInventario = ordem
    return dados.nome, dados.imagemUrl or ""
end

local function executarTrabalhoColetor(ficha, controle)
    if ficha == nil then return end

    atualizarXp(ficha)
    local rankColetor = string.upper(tostring(ficha.ColetorRankLetra or "E"))
    local rankFerramenta = string.upper(tostring(ficha[campoFerramenta("RankItem")] or ""))
    local cd = cdPorRank(rankColetor)
    local dado = math.random(1, 20)
    local bonusColetor = bonusRank(rankColetor)
    local bonusFerramenta = ferramentaTemItem(ficha) and rankPermitidoParaColetor(rankFerramenta, rankColetor) and bonusRank(rankFerramenta) or 0
    local total = dado + bonusColetor + bonusFerramenta

    local rankFinal, qtdFinal, cdFinal = resultadoColetaPorBase(rankColetor, total)
    if rankFinal == nil then
        local rankTeste = rankAbaixo(rankColetor)
        while rankTeste ~= nil do
            rankFinal, qtdFinal, cdFinal = resultadoColetaPorBase(rankTeste, total)
            if rankFinal ~= nil then break end
            rankTeste = rankAbaixo(rankTeste)
        end
    end

    if rankFinal == nil then
        avisar(controle, "Coleta falhou: " .. tostring(dado) .. "+" .. tostring(bonusColetor) .. "+" .. tostring(bonusFerramenta) .. " = " .. tostring(total) .. ". Nao atingiu nem a CD 10 do Rank E.")
        return
    end

    local tipo = tiposColeta[math.random(1, #tiposColeta)]
    local nome, imagem = adicionarMaterial(ficha, tipo, rankFinal, qtdFinal)
    if nome == nil then avisar(controle, "Limite maximo de 60 itens."); return end

    local xpGanho = CWNA_adicionarXpColetor(ficha, xpColeta(rankColetor, rankFinal, qtdFinal))
    enviarMensagemColeta(ficha, nome, rankFinal, qtdFinal, imagem)
    avisar(controle, "Coleta: " .. tostring(dado) .. "+" .. tostring(bonusColetor) .. "+" .. tostring(bonusFerramenta) .. " = " .. tostring(total) .. " contra CD " .. tostring(cdFinal) .. ". Coletou " .. tostring(qtdFinal) .. "x " .. tostring(nome) .. " Rank " .. tostring(rankFinal) .. ". XP +" .. tostring(xpGanho))
end

function CWNA_trabalharColetor(ficha, controle)
    if ficha == nil then return end

    if CWNA_FirebaseTrocas == nil or CWNA_FirebaseTrocas.claimDailyCollection == nil then
        avisar(controle, "Nao foi possivel validar a coleta diaria no banco de dados.")
        return
    end

    avisar(controle, "Verificando coleta diaria...")
    CWNA_FirebaseTrocas.claimDailyCollection(ficha, function(ok, resposta)
        if not ok then
            local msg = resposta and resposta.error or ""
            if msg == "" then msg = "VocÃª jÃ¡ coletou hoje. A prÃ³xima coleta libera Ã s 00:00hrs." end
            avisar(controle, msg, 9000)
            return
        end

        executarTrabalhoColetor(ficha, controle)
    end)
end

return Coletor
