local M = {}

local opcoes = {
    {texto = "-", valor = "0"},
    {texto = "APRIMORAMENTO DE ATRIBUTO", valor = "APRIMORAMENTO_DE_ATRIBUTO"},
    {texto = "APRENDIZADO EXCEPCIONAL", valor = "APRENDIZADO_EXCEPCIONAL"},
    {texto = "ARTESÃO PRÁTICO", valor = "ARTESAO_PRATICO"},
    {texto = "BENÇÃO PROTETORA", valor = "BENCAO_PROTETORA"},
    {texto = "CONTROLE DE RESPIRAÇÃO", valor = "CONTROLE_DE_RESPIRACAO"},
    {texto = "CONCENTRAÇÃO INABALÁVEL", valor = "CONCENTRACAO_INABALAVEL"},
    {texto = "CURA EMERGENCIAL", valor = "CURA_EMERGENCIAL"},
    {texto = "DEFESA OFENSIVA", valor = "DEFESA_OFENSIVA"},
    {texto = "ECO TEMPORAL", valor = "ECO_TEMPORAL"},
    {texto = "ENGANAR O ALVO", valor = "ENGANAR_O_ALVO"},
    {texto = "ESCUDO ESPIRITUAL", valor = "ESCUDO_ESPIRITUAL"},
    {texto = "EFICIÊNCIA LETAL", valor = "EFICIENCIA_LETAL"},
    {texto = "FÔLEGO DE FERRO", valor = "FOLEGO_DE_FERRO"},
    {texto = "FOCO ELEMENTAL", valor = "FOCO_ELEMENTAL"},
    {texto = "GOLPE PESADO", valor = "GOLPE_PESADO"},
    {texto = "GERENCIAMENTO DE ENERGIA", valor = "GERENCIAMENTO_DE_ENERGIA"},
    {texto = "GOLPE ESTABILIZADO", valor = "GOLPE_ESTABILIZADO"},
    {texto = "INTUIÇÃO ARCANA", valor = "INTUICAO_ARCANA"},
    {texto = "LUZ RESTAURADORA", valor = "LUZ_RESTAURADORA"},
    {texto = "MANIPULAÇÃO ESPACIAL", valor = "MANIPULACAO_ESPACIAL"},
    {texto = "MARCA MÁGICA", valor = "MARCA_MAGICA"},
    {texto = "MESTRE DA OCULTAÇÃO", valor = "MESTRE_DA_OCULTACAO"},
    {texto = "MENTE E CORPO", valor = "MENTE_E_CORPO"},
    {texto = "NÚCLEO ADAPTATIVO", valor = "NUCLEO_ADAPTATIVO"},
    {texto = "OSSOS DENSOS", valor = "OSSOS_DENSOS"},
    {texto = "PALAVRA DE INCENTIVO", valor = "PALAVRA_DE_INCENTIVO"},
    {texto = "PELE ENDURECIDA", valor = "PELE_ENDURECIDA"},
    {texto = "PELE MÍSTICA", valor = "PELE_MISTICA"},
    {texto = "POLIGLOTA", valor = "POLIGLOTA"},
    {texto = "PONTO VITAL", valor = "PONTO_VITAL"},
    {texto = "PURIFICAÇÃO", valor = "PURIFICACAO"},
    {texto = "RASTREADOR", valor = "RASTREADOR"},
    {texto = "RECUPERAÇÃO ARCANA", valor = "RECUPERACAO_ARCANA"},
    {texto = "REFLEXO AFIADO", valor = "REFLEXO_AFIADO"},
    {texto = "RETOMAR O FÔLEGO", valor = "RETOMAR_O_FOLEGO"},
    {texto = "ROBUSTO", valor = "ROBUSTO"},
    {texto = "SALTO TÁTICO", valor = "SALTO_TATICO"},
    {texto = "SOBREVIVENTE", valor = "SOBREVIVENTE"},
    {texto = "VIGOR CONTÍNUO", valor = "VIGOR_CONTINUO"},
    {texto = "VIGOR COMPARTILHADO", valor = "VIGOR_COMPARTILHADO"}
}

local function indiceAtual(valor)
    local atual = tostring(valor or "")
    if atual == "" or atual == "-" then atual = "0" end
    for i, hb in ipairs(opcoes) do
        if tostring(hb.valor) == atual or tostring(hb.texto) == atual then
            return i
        end
    end
    return 1
end

function M.escolher(ficha, campo)
    if ficha == nil or campo == nil then return end
    local textos = {}
    for i, hb in ipairs(opcoes) do textos[i] = hb.texto end
    Dialogs.choose("Escolha a HB", textos, function(confirmado, indice)
        if confirmado and indice ~= nil and opcoes[indice] ~= nil then
            ficha[campo] = opcoes[indice].valor
        end
    end, indiceAtual(ficha[campo]))
end

function CWNA_escolherHB(ficha, campo)
    M.escolher(ficha, campo)
end

return M
