armas = {}

function ajusteArma1(sheet)
    arma = sheet.arma1;
    armaSelecionada = defineArma(arma);
    sheet.arma1Iniciativa = armaSelecionada.iniciativa;
    sheet.arma1DanoBase = armaSelecionada.dano;
end

function ajusteArma2(sheet)
    arma = sheet.arma2;
    armaSelecionada = defineArma(arma);
    sheet.arma2Iniciativa = armaSelecionada.iniciativa;
    sheet.arma2DanoBase = armaSelecionada.dano;
end

function ajusteArma3(sheet)
    arma = sheet.arma3;
    armaSelecionada = defineArma(arma);
    sheet.arma3Iniciativa = armaSelecionada.iniciativa;
    sheet.arma3DanoBase = armaSelecionada.dano;
end

function defineArma(arma)
    dicDeArmas = criaDicionario();
    if arma == "Adaga" then
        return dicDeArmas.adaga;
    end;
    if arma == "Bordão/Cajado" then
        return dicDeArmas.bordao;
    end;
    if arma == "Arco Curto" then
        return dicDeArmas.arcoCurto;
    end;
    if arma == "Espada Curta" then
        return dicDeArmas.espadaCurta;
    end;
    if arma == "Espada Longa" then
        return dicDeArmas.espadaLonga;
    end;
    if arma == "Machado" then
        return dicDeArmas.machado;
    end;
    if arma == "Maça" then
        return dicDeArmas.maca;
    end;
    if arma == "Montante" then
        return dicDeArmas.montante;
    end;
    if arma == "--" then
        return dicDeArmas.nenhuma;
    end;
end;

function criaDicionario()
    local armasDictionary = {
        nenhuma = {
            dano = "",           
            iniciativa = nil
        },
        adaga = {
            dano = "1D4",
            iniciativa = 8
        },
        bordao = {
            dano = "1D4",
            iniciativa = 7
        },
        arcoCurto = {
            dano = "1D6",
            iniciativa = 3
        },
        espadaCurta = {
            dano = "1D6",
            iniciativa = 7
        },
        espadaLonga = {
            dano = "1D8",
            iniciativa = 5
        },
        machado = {
            dano = "1D8",
            iniciativa = 3
        },
        maca = {
            dano = "1D8",
            iniciativa = 3
        },
        montante = {
            dano = "1D10",
            iniciativa = 1
        }
    }
    return armasDictionary;
end;

return armas;
