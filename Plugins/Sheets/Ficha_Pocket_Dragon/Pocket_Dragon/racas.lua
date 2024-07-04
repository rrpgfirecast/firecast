racas = {}

function racasOnChange(sheet)
    sheet.movimento = racaMovimento(sheet.raca);
end;

function racaMovimento(racaSelecionada)
    if racaSelecionada == "Anão" or racaSelecionada == "Halfling" then
        return 6;
    else
        return 9;
    end;
end;


return racas;