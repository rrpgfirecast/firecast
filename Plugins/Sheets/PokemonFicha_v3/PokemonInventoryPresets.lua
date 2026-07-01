local Presets = {};

local function setFields(sheet, fields)
    if sheet == nil or fields == nil then return; end;

    for key, value in pairs(fields) do
        sheet[key] = value;
    end;
end;

local function item(nome, categoria, resumo, efeito, descricao, observacoes)
    return {
        nome=nome,
        quantidade="1",
        peso="0",
        categoria=categoria,
        descricaoCurta=resumo,
        efeito=efeito,
        descricao=descricao,
        observacoes=observacoes or ""
    };
end;

Presets.items = {
    customBlank=item("", "Misc", "", "", "", ""),

    aiPoke=item("AI-Poké", "Ferramenta", "Assistente digital ligado ao iPoké.", "NPC digital para pesquisas, comunicação, máquinas e habilidades digitais.", "Programa de inteligência artificial que recebe comandos e executa tarefas digitais que seu criador faria por máquinas.", "Item de classe/tecnologia. Pode exigir dispositivo compatível."),
    armadilhaPredadora=item("Armadilha Predadora", "Ferramenta", "Armadilha para atrair e prender Pokémon.", "A cada 12 horas, rola atração e depois captura temporária.", "Atrai Pokémon dos tipos escolhidos e pode prendê-los até o Rastreador coletar.", "Porte: Criaturas + Tecnologia. Atração: (Nível + Tecnologia) x 3%."),
    inibidor=item("Inibidor", "Equipamento", "Reduz desempenho de tipos escolhidos.", "Pode ser usado com ação ou equipado fora de combate.", "Equipamento, gás, luz, som ou substância que reduz rolagens de certos tipos.", "Escolhe dois tipos. Reduz rolagens e dificuldade de captura em 2 conforme a regra da classe."),
    reprodutor=item("Reprodutor", "Ferramenta", "Dispositivo que replica golpes.", "Armazena golpes de um tipo. Usos diários ligados à Inteligência.", "Replica golpes conhecidos por seus Pokémon usando Tecnologia ou Técnico como base.", "Golpes armazenados: metade de Tecnologia."),

    lum=item("Lum", "Consumível", "Corta a primeira condição comum.", "Restaura 10 PV e corta uma Condição Negativa Comum por 1 hora, exceto Incapacitado.", "Fruta para proteção geral contra condições negativas comuns.", "Preço: 10."),
    custap=item("Custap", "Consumível", "Retorna de Incapacitado.", "Ao ser Incapacitado, recompõe o Pokémon e retorna com 1 PV. Uma vez por dia.", "Fruta de emergência para impedir queda total.", "Preço: 50. Calorias: 300."),
    oran=item("Oran", "Consumível", "Restaura PV.", "Restaura 10 PV. Se estiver abaixo da metade da vida, restaura 20 PV.", "Fruta simples de cura, útil em combate e exploração.", "Preço: 04."),
    sitrus=item("Sitrus", "Consumível", "Restaura PV com bônus se ferido.", "Restaura 20 PV. Abaixo da metade da vida, restaura 20 + Vida.", "Fruta de cura mais forte para situações de risco.", "Preço: 07."),
    leppa=item("Leppa", "Consumível", "Restaura PV e PE.", "Restaura 10 PV e 10 PE.", "Fruta equilibrada para recuperar vida e energia.", "Preço: 04. Calorias: 150."),
    tamato=item("Tamato", "Consumível", "Restaura PE.", "Restaura 10 PE. Se estiver abaixo da metade da energia, restaura 20 PE.", "Fruta voltada para recuperar energia.", "Preço: 04."),
    starf=item("Starf", "Consumível", "Restauração forte de PV e PE.", "Restaura 20 + Vida + Nível PV e PE.", "Fruta rara para recuperação robusta.", "Preço: 15. Calorias: 300."),
    bluk=item("Bluk", "Consumível", "Facilita captura.", "Adiciona +2d2 no próximo teste de captura pelos próximos 15 minutos.", "Fruta para Pokémon selvagens, usada para facilitar captura.", "Preço: 05."),
    nanab=item("Nanab", "Consumível", "Diminui deslocamento e fuga.", "Diminui deslocamento em 5 metros e impossibilita fugir por 15 minutos.", "Fruta que deixa o Pokémon mais lento e menos propenso a fugir.", "Preço: 05."),
    pinap=item("Pinap", "Consumível", "Pode fazer Pokémon fugir.", "Pode causar medo e fazer o Pokémon retornar para sua toca por 15 minutos.", "Fruta para manipular comportamento de Pokémon selvagens.", "Preço: 05."),

    occa=item("Occa", "Consumível", "Fruta típica ligada ao Tipo Fogo.", "Reduz dano do tipo correspondente ou aumenta próximo golpe do mesmo tipo.", "Enquanto carregada, reduz dano do tipo da fruta na primeira vez que o Pokémon for atingido. Ao comer, pode aumentar o próximo golpe do mesmo tipo.", "Preço: 15. Calorias: 300."),
    passho=item("Passho", "Consumível", "Fruta típica ligada ao Tipo Água.", "Reduz dano do tipo correspondente ou aumenta próximo golpe do mesmo tipo.", "Enquanto carregada, reduz dano do tipo da fruta na primeira vez que o Pokémon for atingido. Ao comer, pode aumentar o próximo golpe do mesmo tipo.", "Preço: 15. Calorias: 300."),
    chilan=item("Chilan", "Consumível", "Fruta típica ligada ao Tipo Normal.", "Reduz dano Normal ou aumenta próximo golpe Normal.", "Fruta típica usada como defesa ou impulso de dano para seu tipo.", "Preço: 15. Calorias: 300."),
    colbur=item("Colbur", "Consumível", "Fruta típica ligada ao Tipo Sombrio.", "Reduz dano Sombrio ou aumenta próximo golpe Sombrio.", "Fruta típica usada como defesa ou impulso de dano para seu tipo.", "Preço: 15. Calorias: 300."),

    antiVeneno=item("Anti-Veneno", "Medicinal", "Cura Envenenamento.", "Cura Envenenamento e previne pela próxima 1 hora.", "Loção medicinal para venenos.", "Preço: 15."),
    antiQueimadura=item("Anti-Queimadura", "Medicinal", "Cura Queimadura.", "Cura Queimadura e previne pela próxima 1 hora.", "Loção medicinal contra queimaduras.", "Preço: 15."),
    antiParalisia=item("Anti-Paralisia", "Medicinal", "Cura Paralisia.", "Cura Paralisia e previne pela próxima 1 hora.", "Loção medicinal contra paralisia.", "Preço: 15."),
    restaurador=item("Restaurador", "Medicinal", "Cura condições comuns e especiais.", "Cura toda Condição Comum e Especial.", "Medicina ampla para limpar condições negativas.", "Preço: 30."),
    pocao=item("Poção", "Medicinal", "Restaura PV.", "Restaura 25 PV de um Pokémon.", "Loção básica de cura.", "Preço: 10."),
    pocaoForte=item("Poção Forte", "Medicinal", "Restaura mais PV.", "Restaura 50 PV de um Pokémon.", "Loção de cura mais concentrada.", "Preço: 20."),
    pocaoConcentrada=item("Poção Concentrada", "Medicinal", "Restaura muito PV.", "Restaura 100 PV de um Pokémon.", "Loção de cura potente.", "Preço: 50."),
    pocaoMaxima=item("Poção Máxima", "Medicinal", "Restaura todo o PV.", "Restaura todo o PV de um Pokémon.", "Loção de cura máxima.", "Preço: 60."),
    revitalizador=item("Revitalizador", "Medicinal", "Cura condições e PV completo.", "Cura condições comuns/especiais e recupera PV por completo.", "Tratamento forte de recuperação total.", "Preço: 100."),
    elixir=item("Elixir", "Medicinal", "Restaura PE.", "Restaura 25 PE de um Pokémon.", "Loção de recuperação de energia.", "Preço: 20."),
    elixirMaximo=item("Elixir Máximo", "Medicinal", "Restaura todo o PE.", "Restaura todo o PE de um Pokémon.", "Loção de recuperação total de energia.", "Preço: 50."),

    calcio=item("Cálcio", "Medicinal", "Aumenta Poder temporariamente.", "Por 10 minutos, aumenta Poder em 3 níveis.", "Vitamina de aumento temporário de atributo.", "Não conta para limite de níveis e não pode ser reduzido durante o efeito."),
    carboidratos=item("Carboidratos", "Medicinal", "Aumenta Velocidade temporariamente.", "Por 10 minutos, aumenta Velocidade em 3 níveis.", "Vitamina de aumento temporário de atributo.", "Não conta para limite de níveis e não pode ser reduzido durante o efeito."),
    ferro=item("Ferro", "Medicinal", "Aumenta Defesa temporariamente.", "Por 10 minutos, aumenta Defesa em 3 níveis.", "Vitamina de aumento temporário de atributo.", "Não conta para limite de níveis e não pode ser reduzido durante o efeito."),
    gordura=item("Gordura", "Medicinal", "Aumenta PV temporariamente.", "Por 10 minutos, aumenta PV e PV máximos em 15.", "Vitamina de reforço corporal temporário.", "Usar com cautela conforme o manual."),
    proteina=item("Proteína", "Medicinal", "Aumenta Força temporariamente.", "Por 10 minutos, aumenta Força em 3 níveis.", "Vitamina de aumento temporário de atributo.", "Não conta para limite de níveis e não pode ser reduzido durante o efeito."),
    zinco=item("Zinco", "Medicinal", "Aumenta Resistência temporariamente.", "Por 10 minutos, aumenta Resistência em 3 níveis.", "Vitamina de aumento temporário de atributo.", "Não conta para limite de níveis e não pode ser reduzido durante o efeito."),

    poLuminosita=item("Pó de Luminosita", "Material", "Cura qualquer condição negativa.", "Cura um Pokémon de toda Condição Negativa.", "Material raro de efeito medicinal.", "Preço: 10."),
    pedrasEvolutivasComuns=item("Pedras Evolutivas Comuns", "Material", "Grupo de pedras evolutivas comuns.", "Inclui Pedra do Fogo, Água, Trovão, Folha e Gelo.", "Pedras usadas para evolução ou cenas especiais.", "Preço: 100-150."),
    pedrasEvolutivasRaras=item("Pedras Evolutivas Raras", "Material", "Grupo de pedras evolutivas raras.", "Inclui Pedra da Lua, Sol, Luz, Anoitecer e Amanhecer.", "Pedras usadas para evolução ou cenas especiais.", "Preço: 150-200."),
    pedrasPreciosas=item("Pedras Preciosas", "Material", "Pedras de alto valor comercial.", "Inclui Ouro, Pérola, Diamante, Rubi, Safira e Esmeralda.", "Material valioso para venda, troca ou narrativa.", "Preço: 200-300."),

    comidaHumana=item("Comida Humana", "Comida", "Porção comum de comida humana.", "Serve como 1 porção de comida humana.", "Alimento comum para personagens humanos.", "Preço: 01."),
    racaoPokemon=item("Ração Pokémon", "Comida", "Porção comum para Pokémon.", "Serve como 1 porção de comida para Pokémon.", "Alimento comum para Pokémon.", "Preço: 02."),
    pokeblocoVermelho=item("Pokébloco Vermelho", "Comida", "Bônus de Técnico em torneios.", "Aumenta rolagens da Aptidão Técnico em Torneios em 1d4.", "Pokébloco nutritivo usado em ensaio ou torneio.", "Ingredientes: 4 Frutas Vermelhas + recurso + Preparo."),
    pokeblocoAzul=item("Pokébloco Azul", "Comida", "Bônus de Astúcia em torneios.", "Aumenta rolagens da Aptidão Astúcia em Torneios em 1d4.", "Pokébloco nutritivo usado em ensaio ou torneio.", "Ingredientes: 4 Frutas Azuis + recurso + Preparo."),
    pokeblocoRosa=item("Pokébloco Rosa", "Comida", "Bônus de Social em torneios.", "Aumenta rolagens da Aptidão Social em Torneios em 1d4.", "Pokébloco nutritivo usado em ensaio ou torneio.", "Ingredientes: 4 Frutas Rosas + recurso + Preparo."),
    pokeblocoVerde=item("Pokébloco Verde", "Comida", "Bônus de Mental em torneios.", "Aumenta rolagens da Aptidão Mental em Torneios em 1d4.", "Pokébloco nutritivo usado em ensaio ou torneio.", "Ingredientes: 4 Frutas Verdes + recurso + Preparo."),
    pokeblocoAmarelo=item("Pokébloco Amarelo", "Comida", "Bônus de Físico em torneios.", "Aumenta rolagens da Aptidão Físico em Torneios em 1d4.", "Pokébloco nutritivo usado em ensaio ou torneio.", "Ingredientes: 4 Frutas Amarelas + recurso + Preparo."),
    pokeblocoMulticor=item("Pokébloco Multicor", "Comida", "Bônus de Natural em torneios.", "Aumenta rolagens da Aptidão Natural em Torneios em 1d4.", "Pokébloco nutritivo usado em ensaio ou torneio.", "Ingredientes: 4 Frutas de cores não repetidas + recurso + Preparo."),

    pokebola=item("Pokébola", "Equipamento", "Ajuda recuperação no repouso.", "Adiciona 1d4 à restauração de PV do Repouso e enfraquece condições pela metade.", "Equipamento de suporte e descanso para Pokémon.", "Efeito citado na seção de Descanso."),
    centroSaude=item("Centro de Saúde", "Especial", "Tratamento rápido de Pokémon.", "Recupera um Pokémon em 10 minutos de tratamento.", "Serviço de recuperação em centro de saúde.", "Não é item físico; incluído como preset utilitário.")
};

function Presets.applyItem(sheet, key)
    setFields(sheet, Presets.items[key]);
end;

return Presets;
