-- Numina descriptions, the [pt] half (SPEC T495, V210).
--
-- descNumina.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [pt] only, descNumina_en.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descNumina_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Numina descriptions, transcribed from M20 Sorcerer (chapter 1 pp. 18-51, chapter 2
-- pp. 54-77): intro prose + the System block / dot levels. Sample rituals, recipes,
-- creations and sidebars are deliberately out (SPEC C, T62).
--
-- Keyed by the canonical ENGLISH picker value, because that is what the sheet saves
-- (SPEC V24). `pt` is a translation of the same text, paragraph for paragraph.
-- This table is NOT part of the HH.6 `PT` map on purpose (SPEC V28 / V31): the block
-- is re-rendered from here on every language change instead of being translated
-- in place, so the English original can never be lost.
--
-- SPEC I24 / T478: this table used to be an upvalue inside the <script> of HH.7.lfm.
-- The <script> CDATA is copied raw into constructNew_frmHH_7(), so every open sheet
-- parsed and kept its own 380 KB copy. As a module it is parsed once and cached in
-- package.loaded, and the require that pulls it lives INSIDE numinaText (SPEC V198).
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).

return {
				-- >>> DESC_BEGIN (generated - SPEC T62)
				["Alchemy"] = { pt = [==[M20 Sorcerer, pág. 18


Alchemy


Sistema

Modificadores: Uma vez que o mago siga uma receita com sucesso três vezes, a dificuldade é reduzida em um.

Tempo: A Alquimia leva mais tempo para obter resultados do que a maioria dos Caminhos. As receitas exigem um dia por nível para serem preparadas, mas isso pode ser encurtado se a Habilidade do Caminho exceder o nível da receita. Cada ponto da Habilidade acima do nível do ritual reduz o tempo total gasto em um dia. Se isso reduzisse o tempo de preparação a menos de um dia, presuma em vez disso várias horas de trabalho.

Duração: Os efeitos duram uma única cena, a menos que indicado de outra forma.

Efeitos: A Alquimia não possui Aspectos; em vez disso, cada ponto aumenta o poder e o controle do praticante. Exceto pelas receitas mais potentes, elas exigem apenas um único sucesso para serem feitas. Os sucessos adicionais são divididos entre fornecer doses adicionais e manter essas doses potentes por um dia por sucesso gasto.

• As destilações neste nível não parecem mágicas de forma alguma. Essas receitas são simplesmente versões mais avançadas de substâncias químicas e concocções existentes, produzindo analgésicos, venenos, colas, solventes etc. mais potentes, e aumentando em um o Índice de Toxina (Toxin Rating) da substância química (conforme Mage 20 p. 442). Níveis mais altos do Caminho podem alterar ainda mais o Índice de Toxina, aumentando ou diminuindo o índice em um por ponto.
•• Agora as substâncias criadas permitem que quem as ingere exceda seus limites físicos habituais. Qualquer um dos Atributos pode ser aumentado em um ponto, até um máximo de cinco, pela duração da cena. Preparações especiais podem expandir a consciência mística de alguém, principalmente por meio de sonhos ou alucinações induzidos. Essas visões ficam a critério do Narrador e devem permanecer enigmáticas e incertas. As visões obtidas neste nível carecem da força de um benefício de sistema e estão incluídas como um recurso narrativo.
••• Não apenas o alquimista pode agora aprimorar seus alvos além das capacidades normais dos humanos, como também pode conceder habilidades psíquicas de baixo nível (veja o Capítulo Dois) por uma hora de cada vez. Essas habilidades psíquicas começam com um único ponto, mas cada dois sucessos adicionais fornecem um ponto adicional, até um máximo do nível de Caminho do alquimista.
•••• Os alquimistas podem provocar melhorias verdadeiramente potentes em seres vivos. Eles podem aumentar um único Atributo ou Habilidade em dois, ou dois Atributos ou Habilidades em um cada, e o limite humano normal de cinco não se aplica mais.
••••• O alquimista agora pode elaborar receitas que reproduzem até três pontos de poderes sobrenaturais. Cada ponto reproduzido dessa maneira imita um único efeito — escolhido quando a receita é elaborada — mesmo que o poder replicado ofereça múltiplos efeitos. Estas são algumas das poções mais difíceis de produzir e exigem componentes exóticos, tais como pedaços do ser sobrenatural em questão.

Preço do Fracasso: Trabalhar com compostos voláteis é perigoso por si só. Mesmo um simples fracasso resulta em equipamento quebrado e reagentes arruinados, exigindo substituições caras. No melhor cenário possível com um desastre de verdade, o produto alquímico explode, potencialmente ferindo o mago (bem como seus vizinhos). Mais comumente, porém, a receita desastrada parece se concretizar perfeitamente, mas produz efeitos indesejáveis e possivelmente danosos. Até mesmo um efeito inesperado, mas benigno, pode ser catastrófico no momento errado.]==] },
				["Conjuration"] = { pt = [==[M20 Sorcerer, pág. 20


Conjuration


Sistema

Modificadores: Para qualquer aplicação que possa ser passada como — ou descrita de modo suficientemente semelhante a — mágica de palco, mantenha um sucesso que de outra forma teria sido removido pelas testemunhas. Até o consenso racional está predisposto pela cultura pop a acreditar que conjurar um elefante do nada é possível com truques visuais inteligentes. Observe que ações que causem dano físico óbvio não podem ser explicadas dessa maneira.

Usar Conjuração em um objeto nas mãos de alguém que resista ativamente acarreta +1 de dificuldade. Tentar usar Conjuração para mover um alvo que resista acarreta +2 de dificuldade. Aplique –1 de dificuldade para um objeto bem conhecido pelo feiticeiro (veja também Permanência de Objeto (Object Permanence) abaixo).

Aspectos: A Conjuração usa os Aspectos de Distância, Número de Alvos e Peso. A Conjuração notavelmente não usa Velocidade. O alvo convocado aparece instantaneamente com a conclusão bem-sucedida de uma magia ou ritual. O feiticeiro também pode escolher comprar os seguintes efeitos com sucessos adicionais:

• 1 sucesso para poder usar Conjuração para atacar desajeitadamente sem tocar a arma (penalidade de –1 dado no ataque).
• 2 sucessos para atacar como acima, mas sem penalidade, ou para conceder controle motor fino a qualquer objeto conjurado, como usar um conjunto de gazuas a distância.
• 1 sucesso para cada rodada adicional que o feiticeiro deseje manter o efeito. O Feiticeiro não pode mudar drasticamente o efeito, como arremessar um fantoche para golpear alguém depois de fazer o fantoche dançar, sem rolar Conjuração novamente.

Preço do Fracasso: Enquanto um simples fracasso significa que nenhum item é transportado, um desastre de Conjuração vai do altamente inconveniente ao grotesco. Um feiticeiro pode enviar um objeto para o lugar errado, como mandar um item ainda mais longe do alcance ou conjurar uma arma preparada diretamente na própria mão. Às vezes o feiticeiro convoca o objeto completamente errado. Alternativamente, um feiticeiro pode conjurar apenas parte do item pretendido, e basta imaginar o horror de um desastre na Conjuração de um ser vivo.]==] },
				["Conveyance"] = { pt = [==[M20 Sorcerer, pág. 22


Conveyance


Sistema

Modificadores: +2 de dificuldade para cada alvo relutante, –1 de dificuldade para locais bem conhecidos

Aspectos: Além dos Aspectos de Distância, Velocidade de Viagem e Passageiros, cada um dos seguintes aumenta o número de sucessos necessários:

• 1 sucesso para viajar até um local onde o mago nunca esteve.
• 2 sucessos para teletransportar-se, mesmo que não seja instantâneo Isso é necessário para tentar usar o Transporte ofensivamente.
• Cada barreira atravessada custa um sucesso. As barreiras devem ser possíveis de contornar. Este Caminho não pode penetrar câmaras hermeticamente seladas.

Preço do Fracasso: Os acidentes com o Caminho do Transporte podem ser extremamente perigosos. Os fracassos são bastante inócuos, já que simplesmente nada acontece. Os desastres, porém, tendem a ser específicos ao método de transporte utilizado e tendem a atingir o conjurador (o trocadilho é intencional) no meio da viagem. Vassouras voadoras caem do céu, botas de sete léguas deixam você preso a léguas do seu destino, e corpos inteiros de ficção científica discutem o que acontece quando o teletransporte dá errado.]==] },
				["Curses"] = { pt = [==[The Hunters Hunted II, pág. 72


Curses


Sistema

Teste: Manipulação + Intimidação (dificuldade 7)

Modificadores: N/A

Custo: 1 ponto de Força de Vontade

Duração: Varia (veja abaixo)

Níveis do Caminho das Maldições

• A vítima sofre inconveniências breves, como deixar cair um objeto, dizer algo tolo, ou ter o pé atropelado por uma motocicleta. Mecanicamente, isso é representado pelo Narrador somando +1 de dificuldade às paradas de dados apropriadas à situação especificada pela duração da maldição. Por exemplo, o pé machucado pode aumentar em 1 as dificuldades de Esportes, enquanto dizer algo tolo pode fazer as dificuldades de Etiqueta aumentarem do mesmo modo.
•• A vítima sofre uma sequência de erros e má sorte que resultam em ferimento duradouro ou constrangimento, como pisar em um prego, quebrar uma herança de família, ou pegar uma doença leve. Mecanicamente, isso é representado pelo Narrador aumentando em 2 a dificuldade dos testes apropriados à maldição pela duração da maldição.
••• A vítima sofre acidentes e infortúnios severos. Efeitos típicos podem ser ossos quebrados, perda de renda, ou doença grave. Mecanicamente, isso é representado pelo Narrador aumentando em 3 a dificuldade dos testes apropriados à maldição pela duração da maldição.
•••• A vítima sofre grandes catástrofes e doenças crônicas. Mecanicamente, isso é representado pelo Narrador aumentando em 3 a dificuldade dos testes apropriados à maldição pela duração da maldição. Além disso, a vítima subtrai um das paradas de dados associadas nos momentos apropriados da história.
••••• As maldições infligidas neste nível são quase de escopo Bíblico. Nada dá certo para a vítima pela duração da maldição. Sua vida é um exercício de miséria, e pode muito bem ser acompanhada de pragas de gafanhotos, de tornar-se estéril, ou de causar desespero naqueles que encontra. Mecanicamente, isso é representado pelo Narrador aumentando em 4 a dificuldade dos testes apropriados à maldição pela duração da maldição. Além disso, a vítima subtrai dois das paradas de dados associadas nos momentos apropriados da história. Invocar uma maldição desta magnitude exige um teste de Humanidade para os Magos Estáticos de Humanidade 4 ou mais.

Duração da Maldição

A duração de uma maldição específica é determinada pelo número de sucessos obtidos no teste de ativação.

Um sucesso — A próxima ação
Dois sucessos — Uma cena
Três sucessos — Um dia
Quatro sucessos — Uma semana
Cinco sucessos — Um mês
Seis+ sucessos — Até um ano, decidido na ativação da maldição]==] },
				["Divination"] = { pt = [==[M20 Sorcerer, pág. 23


Divination


Sistema

Modificadores: +1 de dificuldade ao usar Ciência Extraordinária (Extraordinary Science), mas essa Prática fornece probabilidades mais precisas.

–1 de dificuldade quando sob a influência de substâncias que alteram a mente. Visões e sinais podem vir com mais facilidade e mais vívidos em estados alterados, mas continuam sujeitos a interpretação.

Aspectos: a Divinação usa os seguintes:

Período de Tempo (Time Period)

• um dia

•• uma semana

••• um mês

•••• um ano

••••• 10 anos

Precisão (Accuracy)

• Visões e sinais são incrivelmente vagos e difíceis de interpretar com qualquer certeza

•• Tipicamente precisos, mas profundamente enterrados em simbolismo

••• Precisos, mas vagos e abertos a más interpretações

•••• A verdade está lá sob camadas de simbolismo, mas não é terrivelmente difícil de interpretar

••••• Precisos e muitas vezes fáceis de entender, embora ainda sujeitos a erro humano

Consulta (Query)

• Uma pergunta simples que poderia ser respondida com sim ou não se você estivesse falando com uma pessoa em vez de com as estrelas ou as entranhas

•• Uma pergunta específica que pode ser respondida com uma explicação curta e simples. Por exemplo, “Qual estrada à frente é mais segura?”, mas não “Qual é o plano do nosso inimigo?”

••• A pergunta poderia ser pesquisada e respondida com conhecimento de fontes públicas, se apenas você tivesse as horas para dedicar.

•••• A pergunta pode ser detalhada e exigir informações ocultas, mas as informações poderiam ser descobertas com tempo e conhecimento suficientes.

••••• Uma consulta muito detalhada que normalmente exigiria informações perdidas, destruídas ou deliberadamente ocultadas para ser respondida.

Preço do Fracasso (Price of Failure): No melhor cenário, o feiticeiro simplesmente não recebe visões nem intuição alguma devido ao fracasso. Um desastre, no entanto, pode dar leituras patentemente falsas ou perigosamente enganosas. O mago estático pode divinar que não há segurança no local em que seu coven planeja invadir, quando o lugar usa segurança suficiente para rivalizar com Fort Knox. Alternativamente, o feiticeiro pode divinar corretamente que a fechadura de uma porta está quebrada, mas não compreender que o proprietário sabe disso e colocou guardas armados para vigiá-la. O Narrador deve variar as abordagens para os desastres de Divinação, para que não se tornem previsíveis dentro e fora do personagem.]==] },
				["Ephemera"] = { pt = [==[M20 Sorcerer, pág. 25


Ephemera


Sistema

Modificadores: –2 a +2 de dificuldade dependendo da opinião do espírito sobre o mago.

Aspectos: Peso Metafísico (Metaphysical Weight) e Alcance Espiritual (Spiritual Reach).

Alcance Espiritual

• O mago pode sentir espíritos e obter sua atenção, mas pouco mais pode fazer.

•• O mago está restrito a invocar um tipo geral de espírito

••• Agora espíritos específicos podem ser chamados por meio de rituais feitos sob medida, e quase sempre aparecem, a menos que o mago os tenha ofendido de alguma forma.

•••• Espíritos começam a se aproximar do mago sem serem solicitados. O mago consegue ver a Penumbra, o que aumenta o número e os tipos de espírito com os quais pode interagir. O mago também pode revidar contra espíritos, se precisar, embora a maioria tente evitar isso.

••••• O mago agora pode ir até os espíritos em vez de precisar que eles venham ao mundo físico. Embora a viagem física até a Umbra ainda seja impossível, o mago pode se projetar astralmente até lá, usando Raciocínio no lugar de Destreza, Manipulação no lugar de Força, Inteligência como Vigor e Força-de-Vontade como níveis de Vitalidade. Eles estão conectados ao seu corpo por um fio de prata e, se ficarem sem Força-de-Vontade, ele se rompe, cortando sua conexão e deixando-os presos.

Preço do Fracasso: Lidar com espíritos pode ser perigoso, especialmente nos estágios iniciais, quando tudo o que um mago consegue fazer é chamar a atenção do que estiver por perto. Mesmo nos níveis mais altos, a coisa mais perigosa possível em um desastre é chamar o espírito errado, sendo as pragas (banes) particularmente comuns.]==] },
				["Enchantment"] = { pt = [==[M20 Sorcerer, pág. 26


Enchantment


Sistema

Modificadores: Uma vez que um mago crie um Talismã (Talisman) três vezes, a dificuldade é reduzida em 1.

Tempo: Tempo de confecção do objeto, mais 1-3 dias por nível do encantamento

Efeitos: O Encantamento não tem Aspectos; em vez disso, tem os seguintes Efeitos:

• O Encantador pode criar itens menores que raramente são perceptivelmente mágicos para aqueles que ainda não estejam cientes de seus poderes. Isso pode adicionar um (ou, em circunstâncias restritas, dois) dados a um teste de Atributo ou Habilidade, ou diminuir a dificuldade em 1 para um ataque ou uma perícia. Outras pequenas dádivas também são possíveis.

•• Versões mais poderosas de Artefatos já possíveis oferecem dois dados adicionais ou –2 de dificuldade em uma tarefa. Alguns dos objetos criados neste nível podem mudar a realidade de maneira sutil, sendo mais mágicos do que era possível anteriormente.

••• Itens obviamente mágicos agora são possíveis, embora ainda pareçam apenas “muito estranhos” para os leigos em magia. Estes incluem itens que oferecem dois dados adicionais em até três testes diferentes de Atributo ou Habilidade, e aqueles que conferem percepções sobrenaturais ao usuário replicando poderes sobrenaturais de não mais de um único ponto.

•••• Objetos de poder verdadeiramente sobre-humano. Estes podem elevar Atributos acima de 5, duplicar poderes (até o segundo ponto) de outros seres sobrenaturais e, de outras formas, distorcer a realidade de maneiras significativas.

••••• Itens extremamente poderosos, muitas vezes beirando o mítico. Milagres menores são possíveis, e frequentemente esses poderes são bastante evidentes. Itens criados neste nível podem reproduzir até três pontos de poderes sobrenaturais. Cada ponto reproduzido dessa forma imita um único efeito — escolhido quando o item é confeccionado — mesmo que o poder replicado ofereça múltiplos efeitos.

Preço do Fracasso: O fracasso geralmente significa que o mago desperdiçou dias ou semanas de seu tempo, possivelmente arruinando o item que tentava encantar, mas nada pior. Desastres tendem a ser mais variados. Podem resultar em explosões que destroem a oficina. Pior, porém, podem resultar em objetos que parecem funcionar, mas têm algum tipo de efeito colateral imprevisto. Esses itens malditos tendem a ser difíceis de destruir ou de descartar, muitas vezes permanecendo muito tempo depois de o Encantador ter partido e até chegando às mãos de Adormecidos (Sleepers).]==] },
				["Fascination"] = { pt = [==[M20 Sorcerer, pág. 29


Fascination


Sistema

Modificadores: +1 de dificuldade por ser antipatizado pelo alvo, +2 de dificuldade por ser odiado pelo alvo

Aspectos: Além dos Aspectos de Número de Alvos (Number of Targets), Alcance (Range) e Conexão Simpática (Sympathetic Connection), Fascinação (Fascination) usa os Aspectos Atração (Allure) e Dobra de Vontade (Willbending):

Atração

• Adicione 1 dado às paradas de dados sociais
•• Adicione 2 dados às paradas de dados sociais
••• Adicione 3 dados às paradas de dados sociais
•••• Adicione 4 dados às paradas de dados sociais
••••• Adicione 5 dados às paradas de dados sociais

Dobra de Vontade

• Intrigante (Intriguing): Você atrai atenção mesmo em uma multidão, e os indivíduos o acham interessante em uma conversa a dois. Você pode fazer sugestões brandas que se alinhem com a personalidade e a situação do alvo, como deixar outra pessoa bêbada se estiverem em um bar.
•• Atraente (Alluring): Quase todos na reunião sabem que você estava lá, e os indivíduos tentarão encontrar uma maneira de vê-lo novamente. Você pode fazer sugestões fortes que se alinhem com a personalidade e a situação do alvo, como ir para casa com o mago estático (hedge wizard) após uma noite divertida.
••• Ludibriante (Beguiling): Todos presumem que você teve participação na organização da festa, e os indivíduos ao seu redor disputarão sua atenção. Você pode fazer sugestões que não se alinhem necessariamente com a personalidade e a situação do alvo, como sugerir que terminem com seu parceiro de longa data para dar ao conjurador da magia uma chance de uma única vez.
•••• Arrebatador (Entrancing): Com convite ou não, a festa é realizada em sua homenagem, na estimativa de todos. Os indivíduos não querem mais apenas sua atenção, eles anseiam por sua aprovação, possivelmente fazendo papel de bobos no processo. Você pode fazer sugestões fortes que não se alinhem com a personalidade ou os interesses do alvo, como sugerir que o alvo lute contra outra pessoa para defender a honra do mágico.
••••• Escravizador (Enthralling): Se você começasse a atirar coisas, este lugar se tornaria um tumulto em escala total; os presentes se veem em dificuldade para resistir aos seus pedidos, fazendo quase qualquer coisa que você venha a pedir. Inferno, eles podem até matar por você ou colocar a vida em risco por você se você pedir do jeito certo. Você pode fazer sugestões fortes que desafiem descaradamente o caráter e as circunstâncias do alvo, como sugerir que a vítima da magia incendeie um bar por ousar anunciar a última rodada.

Preço do Fracasso: As consequências do fracasso ao manipular corações e mentes tendem a se basear no contexto da situação. Um simples fracasso em uma festa pode passar em grande parte despercebido após um momento de leve vergonha, como uma bebida derramada durante a tentativa de um floreio grandioso ou pisar nos pés dos outros ao atravessar a pista de dança. Um desastre, porém, inevitavelmente leva à humilhação, ou pior. Isso pode ser representado invertendo qualquer bônus em uma penalidade pelo tempo da duração. O alvo do encantamento se torna um inimigo jurado em vez de um amante, ou pode perder a capacidade de sentir emoções por completo. O sujeito deste último efeito fica insensível a todas as formas de empatia e simpatia e exige grandes esforços ou a passagem do tempo para voltar ao normal. O inverso pode ver a vítima se tornar desequilibrada, transformando-se em um abusador violentamente ciumento que fará mal a qualquer um que perceba como invasor de seu domínio.]==] },
				["Fortune"] = { pt = [==[M20 Sorcerer, pág. 30


Fortune


Sistema

Modificadores: –1 de dificuldade com uma conexão simpática fraca (objeto pertencente ao alvo), –2 de dificuldade para uma conexão simpática forte (posse valiosa do alvo, parte do alvo como cabelo ou aparas de unha)

Aspectos: A Fortuna usa o Aspecto Duração (Duration), mas trata todas as durações como um nível acima, com Duração 5 consistindo em magias que duram vários anos. Além disso, usa o Aspecto Número de Alvos (Number of Targets), mas todos os alvos devem ser relacionados (membros de uma família, a população de uma cidade pequena, etc.). O Caminho da Fortuna também usa um Aspecto chamado Severidade (Severity), como segue:

Severidade

• Uma bênção ou maldição menor, geralmente algo simples, como um ato falho ou conseguir pegar por muito pouco um ônibus de que o alvo precisa.
•• Um inconveniente, ferimento ou pequeno benefício duradouro, mas não permanente. Torções, doenças que não ameaçam a vida e objetos quebrados são o padrão da má sorte, enquanto a boa sorte pode ser tão simples quanto evitar a gripe por uma estação, uma pequena vantagem em combate ou a resolução de um obstáculo menor.
••• Um grande reverso ou bônus. Doenças temporárias, mas graves, e sérias gafes sociais são as maldições mais comuns, enquanto encontrar burocratas prestativos, sucesso com jogos de azar ou relacionamentos, ou um dado adicional em paradas de combate são as bênçãos mais comuns.
•••• Agora as bênçãos e as maldições podem ter efeitos sérios e permanentes. Ferimentos debilitantes, falência, uma tragédia social que deixa o alvo um pária, ganhar na loteria, sobreviver a uma morte quase certa, ou apenas um encontro casual que muda a posição social do alvo são todos possíveis.
••••• Maldições neste nível quase sempre resultam em uma morte dolorosa e incomum. Alvos são decapitados, sofrem doenças degenerativas incuráveis, sofrem acidentes de carro horríveis e mais. As bênçãos são igualmente dramáticas, como ser resgatado de uma execução estatal por uma ligação do governador. Outras salvações de última hora de uma morte certa são possíveis, mas também vitórias muito mais raras que uma em um milhão: um inimigo em combate pode tropeçar e quebrar o pescoço, o beneficiário pode encontrar um tomo perdido na cesta de promoções de uma livraria de usados, ou pode ganhar um cargo político sem nenhum reconhecimento de nome.

Preço do Fracasso: Algumas magias de Fortuna fracassadas são indetectáveis. O alvo é naturalmente sortudo ou azarado, resultando na aparência de um sucesso. Desastres são um assunto mais sério. Uma bênção ou maldição distorcida ainda resulta. Bênçãos parecem benéficas no início, mas cada vez que ajudam o alvo há consequências horríveis. Maldições, do mesmo modo, parecem prejudiciais, mas acabam beneficiando o alvo da ira do mágico. Isso é especialmente perigoso para um mágico que tenta usar o Caminho da Fortuna em si mesmo. Em vez de bênçãos distorcidas, a força total de uma maldição mais poderosa, muitas vezes a mais poderosa que o mágico consegue causar, o toma como alvo. E o pior de tudo, o mágico não pode desfazer (unweave) a magia em que obteve um desastre sobre si mesmo, embora possa fazê-lo em outros.]==] },
				["Healing"] = { pt = [==[M20 Sorcerer, pág. 32


Healing


Sistema

Modificadores: A conjuração rápida (fast casting) só pode ser usada para estabilizar dano letal ou agravado ou para reduzir penalidades de ferimento. Todos os outros usos devem empregar magias comuns, magias de rolagem estendida ou rituais.

• 1 sucesso adicional para corrigir um ferimento mal curado
• +1 de dificuldade para curar um paciente não cooperativo

Aspectos: Este caminho usa o Aspecto Dano/Cura (Damage/Healing). Dano contundente pode ser curado com um sucesso por nível de dano. Além disso, cada sucesso pode reduzir uma toxina, doença ou penalidade de ferimento (causada por dor, em vez de um membro faltante, por exemplo) em um nível. Veja Mage 20 p. 406 para informações sobre penalidades de ferimento e p. 442 para a tabela de toxinas e doenças.

Preço do Fracasso: Um fracasso simplesmente significa que a magia não funcionou; o dano estava além da capacidade de cura do feiticeiro. Um desastre pode se tornar horrível rapidamente. Um Curandeiro pode tornar a pessoa mais suscetível à toxina que está tentando combater, aumentando o Índice de Toxina (Toxin Rating) efetivo. Ele pode causar dano diretamente ou curar algo incorretamente, como fundir as pálpebras ou consertar um osso torto, de modo que ele precise ser quebrado de novo mais tarde. O curandeiro também pode infectar a si mesmo com a doença que estava tentando curar.]==] },
				["Hellfire"] = { pt = [==[M20 Sorcerer, pág. 33


Hellfire


Sistema

Aspectos: Dano, Alcance, Área, e os seguintes Efeitos Especiais podem ser adicionados:

• Decadência (Decay): Em vez de causar dano a alvos vivos, a magia decompõe qualquer coisa que eles estejam vestindo ou carregando. Para cada ponto de dano que ela causaria, pode transformar três libras de material em lixo.
• Tempestade de Poeira (Dust Storm): A magia invoca uma tempestade de poeira, varrendo a área (que deve ter pelo menos três pontos) e, além do dano, causando cegueira na área por um turno por nível de Vitalidade infligido.
• Água-Neve (Sleet): Um jato de gelo e água congelante causa cegueira breve e deixa o chão escorregadio. Isto não pode ser tornado agravado.
• Fumaça (Smoke): O conjurador emite uma nuvem de fumaça venenosa que envolve a área (que deve ter pelo menos três pontos no Aspecto Área). Todos dentro da nuvem sofrem um nível de dano por turno, a menos que estejam protegidos. Uma máscara de gás normal fornece dois turnos de proteção antes de se tornar inútil. Seres que não precisam respirar são imunes a esse dano. A visão, mesmo que aprimorada, fica completamente obscurecida enquanto se está dentro da nuvem.
•• Terremoto (Earthquake): a magia faz o chão se abrir e engolir, e então esmagar, o alvo. Ele pode rolar Força com dificuldade 6 para tentar cavar e se libertar. Precisa de tantos sucessos quantos os níveis de Vitalidade de dano que sofreu. Isto não pode ser tornado agravado.
•• Relâmpago (Lightning): Em vez de fogo, a magia dispara um raio de eletricidade. Qualquer um em contato com o alvo através de um material condutor sofre o mesmo dano que o alvo.
•• Emaranhado de Madeira (Tanglewood): As plantas se agitam e atacam o alvo, lançando espinhos, lascas e outros pedaços de madeira contra ele. Com sorte extrema (pelo menos três sucessos além do exigido pela magia), isto pode empalar um vampiro, mas um mago que conte com isso provavelmente ficará muito decepcionado. Se o alvo estiver em vegetação densa, ele é capturado pelas plantas. Uma criatura contida dessa forma não pode se mover até acumular tantos sucessos em um teste de Força (dificuldade 7) quanto o dano causado pela magia. Isto não pode ser tornado agravado.
•••• Maré Afogadora (Drowning Tide): Isto requer uma piscina de tamanho olímpico ou um corpo de água maior. O alvo é puxado para debaixo da água por uma onda súbita ou por uma correnteza, fazendo com que comece a se afogar (veja M20 página 440-441). Escapar da água requer um teste estendido de Força, dificuldade 8, com pelo menos dois sucessos necessários, muitas vezes mais. Isto causa apenas dano por afogamento.

Os Efeitos Especiais acima devem ser comprados com Pontos de Bônus (Freebie) ou Pontos de Experiência, a um custo igual ao valor em pontos + 1.

Preço do Fracasso: Quando você brinca com fogo, às vezes se queima. Obter um desastre ao usar o Caminho do Fogo do Inferno normalmente resulta na magia ricocheteando no conjurador. Ele sofre qualquer dano que estivesse tentando infligir ao seu alvo.]==] },
				["Illusion"] = { pt = [==[M20 Sorcerer, pág. 35


Illusion


Sistema

Modificadores: –1 a –3 de dificuldade se usar uma base semelhante ao objetivo (fazer uma mesa parecer diferente é mais fácil do que fazer uma mesa aparecer do nada)

Aspectos: Duração, Número de Alvos, e o seguinte:

Sentidos

• Afeta um sentido
•• Afeta dois sentidos
••• Afeta três sentidos
•••• Afeta quatro sentidos
••••• Amplitude sensorial completa

Realismo

• Completamente imóvel e fixa; se visual, plana
•• Muda com a perspectiva, de modo que o movimento do observador não a desfaz imediatamente
••• As ilusões podem ter partes móveis, mas somente grandes
•••• Movimentos e variações menores são possíveis, mas ainda há indícios sutis
••••• Totalmente imersiva, este nível engana completamente todos os sentidos visados

Preço do Fracasso: Magos ingênuos pensam que obter um desastre em uma ilusão não deve ser grande coisa. A magia não fez nada real, então nada real deveria acontecer quando ela dá errado. Ao contrário, as percepções do conjurador são alteradas. Pior, a maioria das alterações é sutil e facilmente ignorada. Para magias maiores, porém, eventualmente haverá uma mudança substancial, provavelmente no momento mais perigoso para o conjurador ser pego de surpresa.]==] },
				["Maelstroms"] = { pt = [==[M20 Sorcerer, pág. 37


Maelstroms


Sistema

Aspectos: Área, Duração e Intensidade

Intensidade

• Trazer uma brisa e neblina do submundo para o mundo dos vivos pacifica as Terras das Sombras locais. Os fantasmas na área são acalmados. Eles se defenderão, mas fora isso não atacarão ninguém na área durante a duração, a menos que obtenham sucesso em um teste de Força-de-Vontade (dificuldade 6).
•• Uma tempestade de chuva é invocada, e ela drena tanta energia do submundo que os fantasmas ficam congelados no lugar, a menos que façam um teste de Força-de-Vontade (dificuldade 7). Eles são tornados corpóreos apenas o suficiente para que o mago possa movê-los fisicamente. Normalmente, eles removem os fantasmas de uma área onde não são bem-vindos.
••• Convocar uma tempestade de trovões em escala total faz ainda mais para silenciar as Terras das Sombras. Isso drena o poder do Esquecimento (Oblivion) da área. Os fantasmas são sedados como no primeiro nível, mas aqueles sob controle de suas Sombras têm a razão restaurada. Os resultados variam com os espectros, mas existem lendas de magos estáticos (hedge magicians) com este Caminho arrancando um espectro do Esquecimento.
•••• Tempestades poderosas no mundo dos vivos, com ventos de força de vendaval, granizo e muitos danos à propriedade, podem realmente esgotar o poder do Esquecimento nas Terras das Sombras. Espectros e outros fantasmas profundamente maliciosos que falhem em um teste de Força-de-Vontade (dificuldade 8) desaparecem dentro da barragem de vento e granizo. Nenhum mago estático sabe com certeza o que acontece com esses espíritos, mas eles nunca são vistos no local onde o poder foi evocado por um ano e um dia.
••••• Uma tempestade massiva que drena toda a energia da região correspondente das Terras das Sombras. Tanto a área quanto seu reflexo nas Terras das Sombras tornam-se completamente inabitáveis para fantasmas. Os Mortos Inquietos (Restless Dead) devem fugir da área, ou então sofrer cinco dados de dano por rodada até que o façam.

Preço do Fracasso: O controle do mago sobre essas tempestades é tênue, na melhor das hipóteses. Em uma falha, a Força-de-Vontade ainda é gasta, mas nada acontece. Desastres, porém, resultam em tempestades que saem de controle, tanto no mundo dos vivos quanto nas Terras das Sombras. Quando um mago estático perde o controle das energias deste Caminho, ele invoca um pedaço da Tempestade (Tempest). Isso faz com que os fantasmas normais fiquem desorientados e tenham dificuldade em se mover. Os espectros, por outro lado, prosperam nesse ambiente. Esses espíritos, os mais maliciosos de todos, cavalgam a Tempestade diretamente até as Terras das Sombras e têm mais facilidade para se manifestar na área pela duração que a magia teria tido.]==] },
				["Necromancy"] = { pt = [==[M20 Sorcerer, pág. 39


Necromancy


Sistema

Aspectos: Duração juntamente com Vínculo com Fantasmas (Ghost Binding):

Vínculo com Fantasmas

• O conjurador pode ver, ouvir e falar com fantasmas em suas proximidades, esteja ele em qualquer um dos lados da Mortalha (Shroud).
•• O mágico agora pode aterrorizar os mortos inquietos. Enchendo-se com a energia necrótica das Terras das Sombras, os mortos podem vê-lo como vivo, mas imbuído do poder da morte. Isso resulta em –2 de dificuldade em todos os testes de Intimidação e Lábia contra os mortos.
••• O conjurador força um fantasma a assumir uma forma corpórea, quer ele pudesse fazê-lo por conta própria ou não. Pela duração, o fantasma é, para todos os efeitos, uma pessoa viva novamente, incluindo os sete níveis de Vitalidade habituais. Se morto, porém, ele não simplesmente retorna a ser um fantasma. Em vez disso, a experiência transforma o fantasma em um espectro, um fantasma consumido pelos poderes do Oblívio (Oblivion) e subserviente a eles. E esse espectro guarda rancor contra o conjurador.
•••• Qualquer fantasma pode ser convocado até o conjurador neste nível. Tudo de que o mágico precisa é o Nome Verdadeiro (True Name) do fantasma e ganhar um teste resistido de Força-de-Vontade. Se o necromante for bem-sucedido, o fantasma deve então chegar imediatamente. Tenha em mente que a maioria dos mortos não se torna fantasma, e a maioria dos fantasmas não aprecia ser convocada.
••••• Os mestres da Necromancia podem impor obediência aos mortos. Além do teste do Caminho, eles devem ganhar um teste resistido de Força-de-Vontade. Se conseguirem, podem exigir que o fantasma realize uma tarefa simples ou responda a uma pergunta simples da melhor forma que puder. Para tarefas, o Aspecto Duração cobre por quanto tempo o fantasma deve tentar realizá-la.

Preço do Fracasso: O fracasso, para a maioria dos Caminhos, simplesmente resulta em nada acontecer. Para a Necromancia, o desespero de gerações os domina, resultando em uma perturbação (derangement), geralmente depressão severa, por uma hora. Se tiverem menos de três pontos temporários de Força-de-Vontade, então a perturbação dura, em vez disso, uma semana. Desastres são verdadeiramente perigosos, com não apenas as perturbações durando mais (um mês inteiro) e a quase certeza de fantasmas muito irritados, mas o mágico corre o risco de ser arrancado de seu corpo, deixando-o aparentemente em coma enquanto sua mente passa o mês “vivendo” como um dos mortos inquietos.]==], },
				["Necronics"] = { pt = [==[M20 Sorcerer, pág. 40


Necronics


Sistema

Aspectos: Área, Duração e Impedância (Impedance):

Impedância

• O mágico inunda o submundo local com energia elétrica, desligando todos os poderes fantasmagóricos ativos. Os fantasmas podem ignorar isso, continuando como estavam, se obtiverem sucesso em um teste de Força-de-Vontade (dificuldade 8).
•• Neste nível, em vez de apenas interromper uma assombração, o mágico pode aumentar o índice da Mortalha (Shroud). Isso custa um sucesso por grau aumentado, com o primeiro grau incluído no custo básico do feitiço (assim, além dos requisitos normais, são necessários 2 sucessos para aumentar a Mortalha de 6 para 9).
••• Lugares podem ser defendidos de assombrações pela simples técnica de enganar o fantasma para que ele assombre outro lugar. Neste grau, o mágico pode criar uma armadilha, um reino falso que o fantasma pode assombrar em vez do local real. Um fantasma pode perceber que foi enganado com um teste de Raciocínio + Enigmas (dificuldade 8) e pode escapar com outro.
•••• Neste nível, o mágico pode usar diretamente sua bioeletricidade como um ataque contra um fantasma. Ao usar este grau da Necrônica, os Aspectos Área e Duração são substituídos por Dano e Alcance.
••••• Os mestres deste Caminho são capazes de devastar uma região das Terras das Sombras e seus habitantes. Eles chamam isso de “criar um zero”, e “formatam” o espaço para um padrão predefinido. Quando bem-sucedidos, não sobra nada. Pela duração do feitiço, a região se torna inabitável para fantasmas, fazendo com que os Mortos Inquietos (Restless Dead) perdam Corpus a uma taxa de 3 por turno até que consigam escapar da área. Se não conseguirem escapar antes de esgotar seus níveis de Corpus, eles desaparecem. Os mágicos geralmente acreditam que esses fantasmas foram completamente destruídos, em vez das consequências usuais de esgotar o Corpus. Como nenhum especialista em Necrônica jamais viu um que tenha sobrevivido a ser “zerado”, este parece ser o melhor palpite.

Preço do Fracasso: Como o mágico da Necrônica usa sua própria bioeletricidade para interagir com os mortos, os desastres são particularmente arriscados. Eles não estão apenas estendendo sentidos místicos, mas sim uma parte muito real e física de si mesmos. Em um desastre, o efeito pretendido não acontece. Em vez disso, todos os fantasmas na área ganham Pathos e Angst iguais ao nível do feitiço ou ritual sendo realizado. Eles também se tornam intensamente cientes de que o mágico está tentando controlá-los ou bani-los e podem afetar o mágico diretamente com seus poderes como se ele fosse um fantasma, em vez de terem que atravessar a Mortalha ou de precisarem de poderes específicos que lhes permitam tocar os vivos.]==], },
				["Oneiromancy"] = { pt = [==[M20 Sorcerer, pág. 42


Oneiromancy


Sistema

Aspectos: O Caminho da Oniromancia tem dois Aspectos: Conexão Simpática (Sympathetic Connection) e Caminhada nos Sonhos (Dreamwalking)

Caminhada nos Sonhos

• A Oniromancia básica permite que o mágico toque os sonhos dos outros, vendo lampejos de imagens que poderiam ser interpretados para obter percepções sobre a natureza e a história de seu alvo.
•• O oniromante agora pode entrar nos sonhos dos outros, não apenas vê-los. Ele se torna parte do sonho, forçado a assumir um papel apropriado ao próprio sonho. Uma vez no sonho, mudanças podem ser feitas. A magnitude das mudanças determina a dificuldade de um teste adicional de Oniromancia, sendo a criação de pequenos itens dificuldade 6, mas violar o tema do sonho dificuldade 8, talvez com um Limiar (Threshold).
••• Os Caminhantes de Sonhos agora podem observar os sonhos de fora, vendo-os claramente sem serem puxados para dentro deles. Agora eles podem verdadeiramente transformar os sonhos que encontram. Com este grau, podem criar terrores que imitam o Defeito Pesadelos (Nightmares) ou acalmar um sonho até o ponto de ajudar o sonhador a recuperar um ponto adicional de Força-de-Vontade temporária.
•••• Os Envios de Sonho (Dream Sendings) se tornam disponíveis para o conjurador neste nível. Ele pode elaborar sequências oníricas específicas e detalhadas para seu alvo, que se repetem uma vez por sucesso. Se elas se repetirem mais de uma ou duas vezes por noite, o alvo pode começar a suspeitar que seus sonhos estão sendo manipulados.
••••• Os mestres da Oniromancia podem criar sonhos compartilhados, trazendo uma pessoa para o sonho por cada sucesso no teste de conjuração. O ambiente começa como uma mistura de suas influências subconscientes, mas o oniromante pode manipulá-lo ainda mais usando níveis inferiores do Caminho.

Preço do Fracasso: Obter um desastre na Oniromancia tende a ser psicologicamente prejudicial. Muitos oniromantes são lançados em um Reino de Pesadelo (Nightmare Realm), que os atormenta de forma semelhante aos Reinos de Paradoxo (Paradox Realms) (Mage 20 p. 102-103) temidos pelos magos. Na melhor das hipóteses, eles perdem o controle de qualquer sonho com o qual estejam interagindo. Claro, mesmo se tiverem sucesso, interagir com os sonhos de alguém com o Defeito Pesadelos pode ser um tipo próprio de inferno.]==], },
				["Quintessence Manipulation"] = { pt = [==[M20 Sorcerer, pág. 43


Quintessence Manipulation


Sistema

Modificadores: –1 a –3 de dificuldade com base em distrações na área ao redor, com –1 representando um sistema de som alto tocando na mesma sala e –3 representando a Time Square à meia-noite no Ano Novo.

Aspectos: Área e Duração, bem como o Fluxo (Flow) listado abaixo:

Fluxo (Flow)

• Sentir os Arredores (Sense Surroundings): Sentir as energias da área torna-se uma tarefa rotineira. Com um momento de meditação ou invocação, um feiticeiro determina se uma área ou item está carregado de poder (seja Quintessência, sangue de vampiro, Gnosis ou outra fonte mística). Com três sucessos, o feiticeiro identifica a Ressonância dessa energia.

•• Percepção Focada (Focused Awareness): A capacidade de sentir o fluxo e o refluxo da energia transcende os arredores locais e o inanimado e cruza para o domínio dos indivíduos. Agora o feiticeiro pode perceber outro indivíduo usando magias sutis e isso lhe permite ver meridianos obstruídos ou fluxos de energia ocluídos. Isso revela maldições deixadas sobre indivíduos ou fluxo de Quintessência bloqueado através do corpo, imposto por perturbações maliciosas. A capacidade de avaliar o potencial mágico em um sujeito também se torna disponível. Embora especialmente útil para identificar ameaças em potencial, a quantidade de informação obtida dessa maneira carece de nuance detalhada para definir plenamente se o sujeito é uma criatura sobrenatural ou um humano normal com certa aptidão.

••• Perturbar (Disrupt): Não mais restrito a observar, agora o feiticeiro habilidoso pode começar a afetar a Quintessência ao seu redor. Ainda incapaz de dobrar e manipular a energia com graça, o praticante deste caminho é ao menos versado o suficiente para causar perturbações no fluxo ao seu redor. Com sua invocação ou foco, o feiticeiro pode aquietar o fluxo na área local, fazendo com que uma fonte de Quintessência se torne dormente por um tempo. Perturbar também pode significar desviar. Um fluxo de Quintessência pode ser desviado e enviado por um novo caminho de maneira muito semelhante. Alternativamente, com algum esforço um praticante pode aprisionar uma partícula de Quintessência em um objeto simples por um tempo limitado.

•••• Controlar (Control): A mera força bruta dá lugar ao controle nuançado do fluxo de Quintessência dentro de si mesmos, do mundo ao seu redor e dentro do padrão dos outros. Os fluxos de energia através de si mesmos são agora rios correntes com canais dosados e comportas que permitem ao praticante aproveitar a Quintessência em um lugar de poder. Cada sucesso em um esforço deste tipo permite ao feiticeiro canalizar um ponto de Quintessência por sucesso, até o limite do poder daquela área. A Quintessência extraída dessa forma se dissipa a menos que seja usada no próximo turno.

O fluxo de energia de um inimigo agora é um alvo viável para perturbação neste nível de compreensão. Retirar a energia da reserva de outra pessoa destrói uma Quintessência por cada sucesso rolado. Energias mais alienígenas de outras criaturas sobrenaturais ainda são acessíveis, mas fazê-lo é mais desgastante. A energia de outras criaturas sobrenaturais é perturbada em um ponto por cada dois sucessos.

O fluxo de energia através do padrão de um indivíduo é essencial para sua saúde. Um feiticeiro com esse conhecimento pode causar grande dano ou proporcionar grande ajuda, ainda que ao longo de um período prolongado, por meio de algo semelhante a uma maldição ou a uma bênção. Alterar o fluxo da energia vital de outra pessoa pode promover ou deteriorar sua saúde, mas leva muito tempo para se tornar evidente. Ela adoece com mais frequência, achando difícil combater um simples resfriado, e leva mais tempo para se recuperar de um ferimento simples. Se não for controlado, ela inevitavelmente será vítima de um carcinógeno ambiental ou de uma enfermidade que corre em seu histórico familiar. Por outro lado, beneficiar o fluxo de Quintessência em um indivíduo fará com que o receptor quase nunca fique doente por mais de um dia, recuperando-se de qualquer ferimento como se fosse um mero inconveniente e vivendo até uma idade avançada. Por meio desta função, o mago estático pode conceder Qualidades (Merits) físicas ou infligir Defeitos (Flaws) físicos, gastando 2 sucessos por ponto da Qualidade ou do Defeito.

••••• Governar (Rule): Os mestres da Manipulação de Quintessência alcançaram um nível de compreensão que põe o fluxo de energia à sua disposição, impressionando até os Despertos. Agora, a Quintessência armazenada pode ser diretamente infundida em contramagia, adicionando dados às paradas de dados (dice pools) de contramagia. Sentindo a Quintessência sendo direcionada, o feiticeiro pode interromper o fluxo de energia, impedindo que outro feiticeiro use a Quintessência que possui. Cada sucesso bloqueia um ponto de Quintessência ou Tass de potencializar um efeito.]==] },
				["Shadows"] = { pt = [==[M20 Sorcerer, pág. 45


Shadows


Sistema

Aspectos: Os Aspectos de Área, Distância, Duração e Número de Alvos, bem como o Domínio das Sombras (Shadowgrip) listado abaixo:

Domínio das Sombras (Shadowgrip)

A severidade e a persistência das sombras controladas são aferidas pelo Domínio das Sombras de cada um. Quando um alvo tenta resistir ao Caminho das Sombras, ele faz um teste de Força-de-Vontade com uma dificuldade determinada pelo Aspecto selecionado. Qualquer sucesso encerra o efeito no turno seguinte ou após um minuto.

• Aprofundar (Deepening): Trazer as sombras mais profundamente para nossa visão pode criar uma atmosfera distrativa e intimidadora. Dentro de uma área, a iluminação geral em si pode não mudar propriamente, mas as sombras se aprofundam, e até os sons tornam-se ligeiramente sufocados nas bordas. Essas sombras também podem ser lançadas sobre outros para conferir os benefícios do Caminho, como um bônus em testes de Furtividade em condições sombrias.

•• Moldar (Shaping): Assumindo maior maestria sobre o material escuro que compõe a sombra, o feiticeiro agora imprime padrão e intenção em sua tecelagem de sombras. Após uma conjuração bem-sucedida, o feiticeiro adiciona dois dados a qualquer parada de dados (dice pool) envolvendo Intimidação ou Furtividade, bem como a qualquer teste de Lábia para ocultar sua identidade. Inversamente, as sombras podem cercar um indivíduo e lançar dúvida e confusão sobre os sentidos da vítima. Neste nível de maestria, elas são fortes o suficiente para fazer o alvo hesitar ou reconsiderar suas ações devido ao desconforto não identificável. Isso causa ao alvo uma penalidade de –1 em rolagens feitas para esquivar ou que dependam de tempo de reação rápido. Um teste de Força-de-Vontade com dificuldade 6 permite à vítima afastar as sombras de seus olhos e concentrar-se na tarefa em mãos.

••• Entrincheirar (Entrenching): Não satisfeito em meramente fortalecer as sombras, o feiticeiro agora anima a própria matéria-sombra, deixando-a mudar e agitar-se ao seu redor. Caso leve suas habilidades de aprofundamento ainda mais longe, a luz agora fenece no local visado, e a cor irá dessaturar antes das sombras. Afetar outra pessoa agora é muito mais eficaz. As sombras mudam e se distorcem em seus olhos, e sussurros inquietantes podem ser ouvidos quando a vítima se aproxima demais de uma poça de sombra acumulada. Ser assediado dessa maneira causa uma dificuldade de –1 em todos os testes. O efeito pode ser rompido com um teste de Força-de-Vontade com dificuldade 7. Por fim, o conjurador pode fazer as sombras tremularem ou tremerem, criando distrações visuais e aumentando em um a dificuldade de todos os ataques à distância feitos contra o beneficiário.

•••• Comandar (Commanding): A “disposição” da sombra para agir tornou-se pura avidez. O tormento que a matéria-sombra visita sobre os inimigos do feiticeiro é enlouquecedor e agora causa uma dificuldade de –2 em todos os testes feitos pelo alvo. Qualquer tentativa de se libertar exige um teste de Força-de-Vontade com dificuldade 8 e pode lançar alguns inimigos em frenesi ou fúria se falharem. Envolver um alvo em sombras benevolentes concede +4 em todas as paradas de dados de Intimidação e Furtividade e em qualquer parada de dados de Lábia usada para mascarar a própria identidade.

••••• Governar (Ruling): As sombras sabem quem é seu mestre e agem imediatamente com abandono ao chamado do feiticeiro. Inimigos podem ser reduzidos a um monte tagarela no chão pelas horríveis sombras maléficas. Os oponentes devem obter sucesso em um teste de Força-de-Vontade com dificuldade 9 ou serão reduzidos à inutilidade, desabando no chão. Esse teste pode ser repetido em cada um dos turnos do alvo, mas o alvo só pode agir normalmente em um turno no qual obtenha um sucesso. Se o alvo deixar a área afetada, recupera a capacidade de agir normalmente. A escuridão que engolfa aqueles que desejam permanecer invisíveis é quase impenetrável de fora e de dentro, salvo para o próprio feiticeiro, diminuindo em um a dificuldade dos testes de Furtividade. Essa escuridão carrega um peso tão palpável que pode danificar equipamentos de gravação engolfados por sua influência.]==] },
				["Shapeshifting"] = { pt = [==[M20 Sorcerer, pág. 47


Shapeshifting


Sistema

Duração: Cena

Aspectos: Nenhum dos Aspectos padrão se aplica à Metamorfose. Em vez disso, ela usa:

Escala (Scale)

• Apenas alterações cosméticas, como a cor dos olhos ou o crescimento do cabelo.

•• Alterações pequenas mas perceptíveis, como o crescimento de garras ou escamas.

••• O mago pode transformar uma única parte do corpo na de alguma outra criatura.

•••• Meia-Transformação (Half-Shift): o mago pode transformar metade de seu corpo na de um animal ou assumir uma forma a meio caminho entre humano e animal.

••••• Transformação Completa (Full Shifting): O mago pode se transformar completamente em um animal.

Sujeito (Subject)

••• O mago só pode afetar a si mesmo.

•••• O mago pode transformar outro alvo.

••••• O mago pode afetar dois sujeitos ao mesmo tempo.

Disparidade (Disparity)

••• Apenas uma única característica animal.

•••• O mago pode assumir duas transformações não relacionadas, como a cabeça de um animal e o corpo de outro.

••••• Três transformações não relacionadas são possíveis.

Preço do Fracasso: Quando um metamorfo comete um desastre, o melhor cenário consiste em uma transformação inesperada e desagradável. Ele também pode se perder em sua outra forma, tornando-se funcionalmente feral. No pior cenário, pode experimentar um descontrole violento semelhante ao Defeito Berserker/Atavismo de Estresse (Berserker/Stress Atavism Flaw) (Mage 20 p. 644).]==] },
				["Starlight"] = { pt = [==[M20 Sorcerer, pág. 48


Starlight


Sistema

Modificadores: Reduza a dificuldade em –1 se estiver portando um item pessoal de alguém recentemente falecido

Aspectos: Os Aspectos de Duração, Passageiros e Percurso (Wending):

Percurso

• O limiar é o primeiro obstáculo que um navegador deve dominar. Com foco e vontade, qualquer portal pode servir como limiar para as Terras das Sombras. A porta permanece aberta apenas para o navegador e permitirá que ele e seus passageiros passem. Companheiros de viagem se beneficiam do mesmo efeito de preservação da vida que o conjurador, desde que permaneçam ao alcance da visão de seu navegador. Qualquer um que tente reabrir a porta depois de fechada encontrará o limiar mundano correspondente. Esta porta desmorona depois de ter sido reaberta e fechada novamente pelo navegador durante seu retorno das Terras das Sombras, ou desmoronada deliberadamente pelo navegador para fechar o caminho atrás de si. Uma porta diferente nas Terras das Sombras pode ser usada para reentrar nas Terras da Pele (Skinlands), mas outra ativação de Luz das Estrelas deve ser realizada para criar o novo limiar. Há uma desvantagem nesta técnica; O destino nas Terras da Pele é difícil de saber sem mais capacidades como navegador.

•• As Terras das Sombras são mais familiares para um navegador deste nível. A confiança cresce em seu peito, e o reino dos mortos parece muito menos assustador. Enquanto viaja nas Terras das Sombras, o navegador se beneficia de –1 de dificuldade em todas as rolagens de Sensitividade, Liderança, Sobrevivência e Ocultismo referentes a este ambiente, bem como em rolagens de Força-de-Vontade para superar medo e intimidação.

••• O navegador encontrou um ponto nas Terras das Sombras que é semelhante à sua própria Estrela do Norte pessoal. Não importa onde esteja nas Terras das Sombras, desde que possa ver esta estrela, o navegador tem uma compreensão geral de onde poderá sair para as Terras da Pele ao abrir um novo limiar.

•••• A familiaridade com as Terras das Sombras agora é palpável para quaisquer companheiros de viagem que o navegador tenha trazido consigo. Os companheiros de viagem do navegador se beneficiam de –1 de dificuldade em rolagens de Força-de-Vontade feitas para superar medo e intimidação, bem como em rolagens de Sensitividade e Sobrevivência feitas dentro das Terras das Sombras.

••••• A luz-guia do navegador dentro das Terras das Sombras é visível para ele mesmo com os olhos fechados. Não importa quão profundamente viaje ou quão desorientado possa ficar, o navegador sempre será capaz de encontrar seu caminho até uma porta de volta para as Terras da Pele. Além disso, ele sabe exatamente para onde levará sua saída das Terras das Sombras.]==] },
				["Summoning, Binding, and Warding"] = { pt = [==[M20 Sorcerer, pág. 49


Summoning, Binding, and Warding


Sistema

Aspectos: As três partes distintas do Caminho têm Aspectos separados. Proteção tem Duração e Força, cada nível da qual subtrai um dado de todas as ações que o ser invocado realiza contra o mago. Com três sucessos, a Força de Proteção permite a criação de um Círculo de Proteção, que o ser não pode atravessar sem uma rolagem de Força-de-Vontade (dificuldade 6) na qual obtenha mais sucessos que o mago.

Invocação tem Duração como Aspecto. Além disso, tem Número de seres invocados (ou enxames) e Peso Metafísico para o ser invocado. O ser invocado é obrigado a aparecer diante do mago, mas ainda precisa se transportar até lá. Apenas os seres mais poderosos podem realmente viajar instantaneamente.

Vínculo similarmente tem os aspectos de Duração e Peso Metafísico, bem como Intensidade do Vínculo. Um ser pode gastar um ponto de Força-de-Vontade para resistir a um vínculo, mas o vínculo pode ser reconjurado. Alguns seres, especialmente aqueles com Peso Metafísico 5, são poderosos o suficiente para exigir rituais de vínculo com grandes limiares além dos requisitos usuais — às vezes tão altos quanto 20 ou mais sucessos.

Intensidade do Vínculo

• A criatura não pode agir diretamente contra o mago.

•• Qualquer pergunta isolada deve ser respondida com sinceridade.

••• Todas as perguntas durante a duração devem ser respondidas com sinceridade, e o ser pode ser obrigado a realizar um serviço, embora possa interpretar a ordem liberalmente desde que a satisfaça literalmente.

•••• Uma única tarefa é realizada conforme instruído, seguindo as ordens de perto.

••••• O mago pode transferir controle limitado do vínculo para outra pessoa. O ser realiza uma tarefa para ela e responde a quaisquer perguntas que o invocador lhe faça.

Preço do Fracasso: O Caminho de Invocação, Vínculo e Proteção não precisa de custos especiais de falha ou desastre. Em vez disso, as consequências das falhas e desastres são infligidas ao mago pelo ser invocado. A maior fonte desses problemas é que, em um desastre, o mago frequentemente acaba sob a impressão equivocada de que teve sucesso.]==] },
				["Via Geniorum"] = { pt = [==[The Hunters Hunted II, pág. 125


Via Geniorum


Sistema

Teste: Varia (veja abaixo)

Modificadores: –2 de dificuldade se o Teurgista souber o nome verdadeiro do espírito

Custo: 1 ponto de Força de Vontade

Duração: Varia (veja abaixo)

Níveis da Via Geniorum

• Ritual da Revelação (Ritual of Revelation): O Teurgista não tanto espia o mundo espiritual quanto ordena que os seres supernos próximos se revelem. Com um teste bem-sucedido de Carisma + Ocultismo (dificuldade 8), o Teurgista pode ver todos os espíritos na área imediata (inclusive os que possuem corpos físicos).
•• Ritual da Proteção (Ritual of Protection): Com um teste bem-sucedido de Raciocínio + Ocultismo (dificuldade 7), o Teurgista pode desenhar sigilos protetores em objetos de mão ou em um pequeno círculo ao seu redor. Testes rituais estendidos podem fazer círculos maiores ou locais mais completamente protegidos, sendo 10 sucessos o bastante para proteger uma casa pequena. Espíritos não podem molestar nem entrar em uma pessoa ou local assim protegido sem obter sucesso em um teste de Força de Vontade (dificuldade 9). A proteção dura um mês ou até que o sigilo seja perturbado (um sigilo entalhado é muito mais difícil de romper que um desenhado a giz).
••• Ritual da Dispensa (Ritual of Dismissal): O Teurgista pode mandar um espírito de volta ao seu reino natal. Esta via exige um teste de Carisma + Ocultismo (dificuldade 9). O número de sucessos necessários, em um ritual estendido, varia amplamente conforme o poder do espírito (e fica a critério do Narrador).
•••• Ritual da Invocação (Ritual of Summoning): O Teurgista pode agora invocar entidades espirituais. Esta via exige um teste de Carisma + Ocultismo (dificuldade 9). O número de sucessos necessários, em um ritual estendido, varia amplamente conforme o poder do espírito (e fica a critério do Narrador). Um espírito invocado deve permanecer na presença do Teurgista por uma cena ou até ter respondido a três perguntas (não se pode forçá-lo a revelar seu nome verdadeiro dessa maneira). Interações posteriores dependem de testes Sociais, sacrifícios ou outros poderes. Uma falha crítica invoca um espírito enfurecido que provavelmente ataca o azarado Teurgista.
••••• Ritual do Vínculo (Ritual of Binding): O Teurgista pode agora forçar um espírito à servidão. Esta via exige um teste de Manipulação + Ocultismo (dificuldade 9). O número de sucessos necessários, em um ritual estendido, varia amplamente conforme o poder do espírito (e fica a critério do Narrador). A um espírito vinculado pode-se pedir uma ação específica (“Ataque aquele vampiro!”) ou uma ação contínua (“Vigie-me.”) que dura até o próximo nascer ou pôr do sol.]==] },
				["Via Necromantiae"] = { pt = [==[The Hunters Hunted II, pág. 126


Via Necromantiae


Sistema

Teste: Varia (veja abaixo)

Modificadores: –1 de dificuldade se o Teurgista tiver um objeto que foi importante para o fantasma em vida

Custo: 1 ponto de Força de Vontade

Duração: Varia (veja abaixo)

Níveis da Via Necromantiae

• Ritual do Despertar (Ritual of Wakening): O Teurgista pode ordenar que um cadáver recentemente falecido desperte. Com um teste bem-sucedido de Carisma + Ocultismo (dificuldade 7), o corpo se sentará e responderá às perguntas do Teurgista, o melhor que puder, por um minuto por sucesso. Cada vinte e quatro horas que o cadáver esteja morto soma um à dificuldade. Um cadáver morto há mais de três dias não pode ser despertado.
•• Ritual da Proteção (Ritual of Warding): Os Teurgistas podem proteger uma área contra intrusão fantasmagórica. Com um teste bem-sucedido de Raciocínio + Ocultismo (dificuldade 7), o Teurgista pode impedir que fantasmas entrem em uma área do tamanho de um cômodo. Cada sucesso indica uma semana de proteção bem-sucedida.
••• Ritual da Comunicação (Ritual of Communication): Os Teurgistas podem contatar os mortos fazendo um teste de Carisma + Ocultismo (dificuldade 10). Essa dificuldade cai, cumulativamente, se algum dos seguintes critérios for atendido: o Teurgista possui um objeto que foi importante para o fantasma em vida (–1), uma pessoa importante para o fantasma está presente (–1), o ritual é conduzido na antiga casa do fantasma (–1), o ritual é conduzido em um lugar onde o véu entre o Submundo e o mundo dos vivos é tênue (–2). Manter contato com os mortos é difícil. Cada sucesso obtido permite ao Teurgista um minuto de comunicação. O período de tempo pode ser dobrado por mais um ponto de Força de Vontade.
•••• Ritual da Expulsão (Ritual of Expulsion): Os Teurgistas podem expulsar um fantasma que assombra. Isso exige um teste de Carisma + Ocultismo (dificuldade igual à Força de Vontade do fantasma + 3, máximo de 9); é um teste sustentado, que requer um número de sucessos igual ao dobro da Força de Vontade do fantasma. Simplesmente iniciar o banimento custa 1 ponto de Força de Vontade, mas nenhum ponto adicional é exigido pelo restante da luta.
••••• Ritual da Vivificação (Ritual of Vivification): O Teurgista pode agora instar um cadáver a erguer-se. Esta via exige um teste de Manipulação + Ocultismo (dificuldade 8). Cada sucesso anima o corpo por uma semana, e esse tempo pode ser dobrado por mais um ponto de Força de Vontade. Cadáveres animados não terão muita personalidade ou inteligência, mas podem seguir instruções simples.]==] },
				["Weather Control"] = { pt = [==[M20 Sorcerer, pág. 50


Weather Control


Sistema

Modificadores: O controle do clima não usa rituais. O grande número de sucessos necessários para produzir efeitos favorece testes prolongados e trabalho em equipe.

• 1 ou mais sucessos adicionais necessários para deter uma tempestade severa ou algo pior depois que ela já começou. É mais fácil provocar clima calmo do que apaziguar clima ruim.

• +1 de dificuldade para causar qualquer efeito em ambientes internos.

Aspectos: O Controle do Clima usa os Aspectos Distância (trate a medida na tabela como o raio de efeito), Duração e Intensidade:

Intensidade

• Apenas pequenas mudanças. Isso inclui brisas quentes ou frias, mudanças leves mas perceptíveis na temperatura e fazer o fogo bruxulear e flamejar momentaneamente.

•• O trabalhador do clima pode causar efeitos menores que não causam dano direto. O feiticeiro pode invocar uma névoa densa que impõe penalidades de percepção (veja Mage 20 p. 435), limpar um céu nublado ou criar ventos na direção que desejar.

••• Um feiticeiro pode formar e dissipar tempestades de chuva simples. Ventos fortes podem impor uma penalidade a ataques à distância, desviando o projétil de seu curso e causando dificuldades para mirar. O trabalhador do clima também pode alterar a temperatura em até 30 graus Fahrenheit em qualquer direção. Dependendo da temperatura inicial, isso pode impor ou remover penalidades de doenças causadas pelo calor ou de hipotermia. Enchentes repentinas também podem ser mortais.

•••• A força da tempestade de um trabalhador do clima aumenta. Ele agora pode comandar ventos de força de vendaval, relâmpagos, granizo e outros efeitos climáticos danosos. Agora pode escolher indivíduos como alvo para receber o impacto da tempestade, e os efeitos danosos causam 4 + sucessos de dano. Relâmpagos causam dano letal, enquanto o dano contundente resulta do granizo. Outros efeitos também podem causar dano, dentro do razoável. Efeitos climáticos podem causar penalidades moderadas àqueles apanhados nas tempestades.

••••• O feiticeiro pode causar efeitos extremos. Tempestades com trovões estão bem ao alcance do trabalhador do clima. Tornados destrutivos e outras atividades meteorológicas poderosas podem rasgar uma cidade. O feiticeiro pode causar 6 + sucessos contundente ou letal a cada 15 minutos àqueles no caminho da tempestade. Qualquer um apanhado na tempestade também sofre penalidades ambientais máximas.

Preço do Fracasso: Até mesmo efeitos intencionais de controle do clima podem ter consequências indesejadas no ambiente, tanto próximo quanto distante. Perturbações em padrões climáticos não são assunto pequeno. Um desastre, porém, desencadeia efeitos terríveis dependendo da natureza das mudanças buscadas. Relâmpagos podem atingir diretamente o feiticeiro ou seus aliados. Um clima árido pode ser atingido por uma monção que o solo não consegue acomodar, levando a inundações generalizadas. O clima local e possivelmente a área circundante sofrem mudanças dramáticas, talvez duradouras. Isso pode causar uma crise para a fauna local, a vida vegetal e as pessoas que não tiveram tempo de se preparar e podem não saber como lidar com o novo clima. A morte, mesmo que não imediata, é infelizmente um risco comum quando feiticeiros brincam com o clima.]==] },
				["Animal Psychics"] = { pt = [==[M20 Sorcerer, pág. 54


Animal Psychics


• Commune (Comunhão): Um psíquico pode se comunicar com um animal que o psíquico consiga perceber por meio de sentidos mundanos (visão, audição, etc). Ele pode dar comandos simples, mas não pode ordenar que um animal ataque. O psíquico pode, no entanto, ordenar que um animal desista de um ataque pretendido. Dar um comando que o animal já estava inclinado a cumprir não exige nenhum teste adicional, mas ordenar que um animal faça algo contra sua natureza exige um teste de Carisma + Empatia com Animais com dificuldade 9 menos os pontos de Animal Psychics (Psíquicos de Animais) do psíquico.

•• Mass Communication (Comunicação em Massa): Como em Commune, mas o Psíquico agora pode se comunicar com múltiplos animais da mesma espécie de uma só vez. Comandos dados a animais podem ser mais complexos, desde que o psíquico consiga descrevê-los adequadamente; entretanto, animais normalmente não atacam pelo psíquico a menos que já estejam inclinados a fazê-lo. Este nível pode, alternativamente, ter como alvo um único animal para capacidade de comando ampliada.

••• Mind Link (Vínculo Mental): Um psíquico pode vincular mentes com um único animal para comunicação instantânea de mão dupla e a capacidade de sentir o que o animal sente. O psíquico deve inicialmente sentir o animal como em Commune, mas o animal pode viajar para fora do alcance de percepção do psíquico sem romper o vínculo. Este poder termina quando o psíquico rompe o vínculo. O vínculo pode se mostrar perigoso — qualquer dano que o animal vinculado sofra resulta em um contragolpe psíquico, que causa uma quantidade igual de dano contundente absorvível ao psíquico. Se o animal morrer enquanto o vínculo estiver ativo, o psíquico deve não apenas testar para absorver o dano, mas também testar sua Força-de-Vontade atual com dificuldade 8. Uma falha deixa o psíquico atordoado por 1 rodada. Desastres podem deixar o psíquico dominado pelo trauma da morte por uma cena e ter consequências duradouras, como reações de sobressalto intensificadas, até que o psíquico recupere um ponto de Força-de-Vontade.

•••• Domination (Dominação): Um psíquico pode ordenar que qualquer animal isolado faça qualquer coisa dentro das capacidades naturais do animal. O animal luta e morre pelo psíquico quando exigido, sem questionar. O psíquico deve descrever um comando adequadamente para que o animal entenda o que o psíquico quer. Comandos complexos ainda podem confundir um animal, embora o animal faça o melhor que pode para interpretar e executar qualquer comando que o psíquico lhe dê. Uma vez que o psíquico ative este poder com sucesso, o animal segue as ordens do psíquico até que o psíquico rompa a conexão ou o animal morra. Psíquicos que usam este poder também devem estabelecer um Mind Link se desejarem continuar dando comandos ao animal à distância. Isso não exige testes adicionais nem gasto de Força-de-Vontade, mas expõe o psíquico a sofrer dano quando o animal for ferido ou morto, conforme detalhado acima.

••••• Swarm (Enxame): Com o domínio deste Fenômeno, um psíquico agora pode usar qualquer habilidade inferior em todos os animais que o psíquico consiga sentir por meio de sentidos mundanos de uma só vez. O controle do psíquico não está mais limitado a uma espécie por vez. Usar Mind Link desta forma pode rapidamente se tornar perigoso, pois cada animal vinculado representa um risco de dano por contragolpe se for ferido. A distração de manter múltiplos vínculos mentais é avassaladora, infligindo uma penalidade de -3 dados a todos os testes baseados em Atributos até que o Mind Link termine, a menos que o psíquico gaste um ponto de Força-de-Vontade ao fazer o teste para temporariamente superar a distração.]==], },
				["Anti-Psychic"] = { pt = [==[M20 Sorcerer, pág. 55


Anti-Psychic


• Raio de 5 jardas. Adicione +1 de dificuldade à ativação de fenômenos psíquicos dentro do raio e +1 de dificuldade aos testes da Esfera da Mente.

•• Raio de 10 jardas. Adicione +2 de dificuldade à ativação de fenômenos psíquicos dentro do raio e +1 de dificuldade aos testes da Esfera da Mente.

••• Raio de 15 jardas. Adicione +3 de dificuldade à ativação de fenômenos psíquicos dentro do raio e +2 de dificuldade aos testes da Esfera da Mente. Adicione +1 de dificuldade para o uso de quaisquer poderes de base mental do Povo-da-Noite.

•••• Raio de 25 jardas. Adicione +4 de dificuldade à ativação de fenômenos psíquicos dentro do raio e +2 de dificuldade aos testes da Esfera da Mente. Adicione +2 de dificuldade para o uso de quaisquer poderes de base mental do Povo-da-Noite.

••••• Raio de 40 jardas. Adicione +5 de dificuldade à ativação de fenômenos psíquicos dentro do raio e +3 de dificuldade aos testes da Esfera da Mente. Adicione +3 de dificuldade para o uso de quaisquer poderes de base mental do Povo-da-Noite.]==], },
				["Astral Projection"] = { pt = [==[M20 Sorcerer, pág. 56


Astral Projection


• Peek (Espiada): O psíquico pode passar até um minuto por ponto de Vigor em projeção astral e viajar até uma milha de distância de seu corpo. Um psíquico só pode usar a visão neste nível — seus outros sentidos não funcionam durante a projeção. Um personagem também pode viajar para a Penumbra Astral por esse mesmo período de tempo.

•• Errand (Incumbência): O psíquico ganha a capacidade de ouvir durante a viagem astral. Ele pode viajar até 100 milhas de distância de seu corpo com um limite de 10 minutos por ponto de Vigor.

••• Journey (Jornada): O psíquico pode viajar até 1000 milhas de distância de seu corpo e pode permanecer em forma astral por 30 minutos por ponto de Vigor. Um psíquico pode escolher se manifestar como uma imagem borrada e fantasmagórica de sua forma astral por um turno gastando um ponto de Força-de-Vontade, mas não pode falar. Ele não aparece em gravações.

•••• Failsafe (Salvaguarda): Ao ser atordoado ou nocauteado, o psíquico pode testar a ativação de Astral Projection como uma ação reflexiva. O psíquico pode usar este poder para buscar ajuda para seu corpo prostrado, ou simplesmente como uma forma de permanecer útil enquanto estiver fora de combate. O psíquico pode se manifestar como em Journey e, enquanto manifestado, o psíquico pode se comunicar em volume de sussurro. A voz e a forma translúcida do psíquico não aparecem em gravações. O psíquico pode viajar para qualquer lugar da Terra e permanecer projetado por até uma hora por ponto de Vigor que possua, embora possa gastar um ponto de Força-de-Vontade a cada hora que desejar continuar viajando além desse limite. Ele pode usar todos os sentidos normalmente. Embora o psíquico possa retornar ao seu corpo a qualquer momento antes de seu limite normal terminar, retornar não o despertará a menos que a causa da inconsciência tenha sido resolvida.

••••• Odyssey (Odisseia): As capacidades de viagem astral do psíquico são lendárias. O psíquico pode viajar para qualquer lugar sobre ou dentro da Terra, estendendo-se ao menos até a borda da atmosfera. Tentar ir mais longe exige um teste de Força-de-Vontade com dificuldade 9. Enquanto o corpo do psíquico viver, incluindo com auxílio de tecnologia de suporte à vida, o psíquico pode viajar indefinidamente. Se manifestado, o psíquico pode falar em volume normal e pode escolher aparecer em uma forma indistinta e translúcida ou enganosamente opaca, e pode permanecer manifestado por até uma hora por ponto de Força-de-Vontade gasto. O psíquico pode escolher aparecer em gravações.]==], },
				["Biocontrol"] = { pt = [==[M20 Sorcerer, pág. 57


Biocontrol


• Mindfulness (Atenção Plena): O psíquico se concentra em alterar seus processos biológicos de maneiras menores. Pode estancar o sangramento de pequenos ferimentos, elevar ou reduzir a temperatura central do corpo em até dois graus, prender a respiração por um tempo prolongado, ignorar a dor de ferimentos menores, incluindo penalidades de ferimento de até metade de seu índice de Biocontrol (arredondado para cima), e regular consciente e voluntariamente sua pressão sanguínea e sua pulsação dentro da faixa normal. O efeito termina se a concentração do psíquico for quebrada.

•• Healing Factor (Fator de Cura): O psíquico força seu corpo a acelerar os processos metabólicos responsáveis pela cura e pelo combate a infecções muito além da taxa normal. O psíquico deve passar tempo descansando e meditando, idealmente enquanto recebe cuidados médicos — o psíquico ainda é mortal, afinal. Para cada sucesso de ativação, o psíquico reduz em um nível o tempo para curar o nível de Vitalidade mais alto, até um mínimo de uma hora para dano contundente e um dia para dano letal ou agravado. Depois que o primeiro nível de dano é curado, o psíquico pode rolar ativação novamente para repetir o processo. Ao usar Healing Factor, psíquicos podem ignorar o risco de sequela permanente (permanent impairment) (ver Mage 20 p. 408), desde que tenham nutrição e descanso suficientes.

••• Surge (Descarga): O psíquico inunda seu sistema com hormônios a seu comando. Psíquicos escolhem Físico, Social ou Mental e dividem seus sucessos de ativação entre atributos da categoria escolhida para elevar pontos (até um máximo de 5 em qualquer atributo) por uma cena. Isso pode representar uma descarga de adrenalina que permite “força histérica” em uma emergência, uma descarga de dopamina para melhorar a função mental, ou a modulação de serotonina e feromônios para se tornar mais calmo ou subconscientemente atraente em situações sociais. Provocar picos hormonais deliberadamente desgasta o corpo: Quando o efeito passa, o psíquico deve rolar Vigor (Stamina) com dificuldade 5 para absorver os sucessos de ativação como dano contundente.

•••• Toggle Nerves (Alternar Nervos): Um psíquico com este nível de controle aprimora ou reduz a sensibilidade de seus nervos por até uma cena por sucesso de ativação. O uso mais comum é anestesiar temporariamente a dor. Um psíquico pode ignorar penalidades de ferimento causadas por dor em até o número de sucessos de ativação em níveis de Vitalidade — isso não permite que o psíquico ignore penalidades devidas a partes do corpo não funcionais ou ausentes. Um psíquico pode, em vez disso, escolher anestesiar os sentidos para ignorar outros estímulos nocivos, como odores poderosos, mudanças súbitas de iluminação ou extremos de temperatura. O psíquico pode ignorar até os sucessos de ativação em penalidades de distração e pode dividir os sucessos entre múltiplos tipos de penalidade. Alternativamente, um psíquico pode aumentar a sensibilidade nervosa, reduzindo a dificuldade de testes baseados em percepção pelos sucessos de ativação, e pode dividir os sucessos entre os sentidos. No entanto, aumentar a sensibilidade nervosa traz um risco. Cada sucesso gasto para reduzir a dificuldade de percepção com um sentido soma à dificuldade de resistir a distrações usando aquele sentido enquanto o poder estiver ativo. Se o psíquico aumentar a sensibilidade do tato e sofrer dano, ele sofre penalidades de ferimento adicionais iguais aos seus sentidos de ativação dedicados ao tato.

••••• Biological Mastery (Maestria Biológica): O psíquico alcança controle completo sobre seu corpo. Pode parar e reiniciar seu coração à vontade, regular a digestão, suspender temporariamente a necessidade de oxigênio e se colocar em hibernação para forçar feitos de cura mais extremos — inclusive regenerar partes do corpo. Pode acelerar ou suspender a regeneração em nível celular e pode anular toxinas com um teste de ativação. Cada sucesso de ativação reduz em um o Índice de Toxina (Toxin Rating) da substância. Se o Índice de Toxina restante for menor que o Vigor do psíquico, o psíquico pode direcionar a toxina para uma parte específica de seu corpo para que ela siga seu curso, sofrendo um Impediment (Impedimento) (como o defeito, ver M20 Book of Secrets p. 39) pela duração do efeito da toxina. Se o Índice de Toxina for maior que o Vigor do psíquico após usar Biological Mastery, o psíquico sofre a toxina normalmente no Índice de Toxina reduzido. Um psíquico pode gastar um turno se concentrando e rolar ativação para absorver dano letal e agravado com Vigor por uma cena.]==] },
				["Channeling"] = { pt = [==[M20 Sorcerer, pág. 58


Channeling


• O canalizador pode se conectar ao outro lado e extrair as Habilidades de um fantasma, embora possa acessar apenas uma única Habilidade por uso deste poder. Sucessos no teste de ativação se tornam dados bônus para testes que utilizem o Talento, a Perícia ou o Conhecimento desejado pelo restante da cena. Ao contemplar através da Mortalha, o psíquico pode obter uma ideia vaga dos espectros presentes.

•• O psíquico agora pode acessar duas Habilidades simultaneamente, dividindo os sucessos entre os traços desejados. O canalizador também pode agora distinguir mais das Terras das Sombras ao espiar através da Mortalha. O canalizador pode discernir detalhes da paisagem e identificar fantasmas específicos que estejam presentes.

••• Um crescimento maior agora permite que uma terceira Habilidade seja canalizada, sujeita às limitações acima. O canalizador agora pode se comunicar verbalmente com fantasmas além da Mortalha.

•••• O psíquico agora pode acessar qualquer Talento, Perícia ou Conhecimento, mantendo múltiplos traços canalizados desde que obtenha sucessos suficientes no teste de ativação para cobrir os níveis de traço desejados. A comunicação não é mais limitada por uma janela curta de acessibilidade, e contemplar através da Mortalha dura uma cena inteira.

••••• Com uma psique fortalecida por muitas provações e tribulações, o psíquico está robusto o bastante para agora canalizar duas personalidades separadas ao mesmo tempo. Note que cada espectro canalizado ainda exige seu próprio custo e teste de poder. Caso a Habilidade canalizada seja a mesma em cada uso, os dados bônus de ambos os usos são somados às paradas de dados que usem o Talento, a Perícia ou o Conhecimento.

No auge de sua habilidade, com um espírito canalizado, o médium pode se abrir para um espectro e ganhar todas as Habilidades do espírito visitante. Os sucessos obtidos durante o teste de canalização ficam agora disponíveis para qualquer Talento, Perícia ou Conhecimento que aquele espectro possa ter possuído em vida. Os custos extras de canalizar com defesas tão baixas podem ser altos, no entanto. O espírito pode pedir um favor, uma tarefa a ser cumprida, ou até o direito de controlar livremente o corpo do canalizador por um período de tempo.]==] },
				["Clairvoyance"] = { pt = [==[M20 Sorcerer, pág. 59


Clairvoyance


• Experimentar locais remotos é novo para o psíquico, e a maioria das observações é interpretativa. Essa impressão pode ser uma sensação física de aço frio para uma faca, o cheiro de pólvora para armas de fogo, ou uma visão de uma casinha de cachorro para cães de guarda. Em alguns casos, uma imagem real do objeto pode ser alcançada, mas será nebulosa na melhor das hipóteses. A única exceção é a audição. Os sons atravessam a ponte mental distorcidos e ininteligíveis, se puderem ser ouvidos. Mais sucessos concedem sensações simbólicas mais literais, com cinco sucessos proporcionando percepção visual real do alvo, por turva que seja. Os sentidos têm alcance limitado para novatos e chegam a aproximadamente uma milha ao redor do psíquico. Redirecionar seu foco exige outro teste de Força-de-Vontade e outro gasto de Força-de-Vontade para solidificar seu novo objeto remoto.

•• A visão remota se torna mais confiavelmente alcançável, embora ainda envolta em leve distorção ou névoa. O som atravessa com muito mais frequência, com uma chance de ser claro o bastante para ser compreensível. Três sucessos no teste de Força-de-Vontade proporcionam uma imagem quase clara do objeto com sons distorcidos, enquanto cinco sucessos concedem clareza de cristal e sons inteligíveis que poderiam transmitir o assunto geral e o clima das conversas próximas ao objeto. O psíquico agora pode empurrar seus sentidos mais longe — até dez milhas de distância de sua localização atual. A dificuldade do teste aumenta em um após 5 milhas e em dois a 8 milhas.

••• A clareza não é mais um problema, e a percepção remota traz visão e som através da extensão sem distorção. O clarividente destrava uma nova via de percepção clarificada no sentido do tato. “Tocar” psiquicamente um objeto distante devolve sensações abafadas, como se suas mãos estivessem envoltas em luvas grossas. Com a clareza não sendo mais uma preocupação, os sucessos agora definem a distância que um clarissenciente pode alcançar, com cada sucesso representando dez milhas de alcance. Neste ponto, um novo teste de Força-de-Vontade ainda é exigido para reorientar, mas não custa mais esforço para ser realizado.

•••• Visão, som e tato estão todos dentro do alcance do visualizador remoto (remote viewer). O clarividente também começa a perceber cheiros e sabores, com odores e sabores fortes sendo detectados quando estão em abundância. O alcance agora aumenta dez vezes, com cada sucesso equivalendo a 100 milhas de alcance.

••••• O mestre clarissenciente pode visualizar remotamente um local como se estivesse de pé na sala. Todos os cinco sentidos são recebidos com definição exata, sem que nenhum segredo escape de sua percepção. O alcance aumenta dez vezes mais uma vez, com cada sucesso estendendo seu alcance em 1.000 milhas. Por fim, desde que o psíquico esteja reorientando o foco para um elemento que possa ver dentro de sua visão clarividente atual, nenhum novo teste é exigido, pois ele forja novas correspondências para objetos na hora.]==] },
				["Cyberkinesis"] = { pt = [==[M20 Sorcerer, pág. 60


Cyberkinesis


• Switch (Interruptor): O cinético cibernético pode ligar e desligar aparelhos eletrônicos sem tocá-los. +2 de dificuldade na ativação se o eletrônico exigir um relé físico em vez de um eletrônico. O psíquico precisa ser capaz de sentir o aparelho eletrônico para usar este poder. Esta é uma exceção à exigência usual de acessar o display do aparelho e se aplica a aparelhos sem display, como luminárias.

•• Remote (Remoto): O psíquico pode controlar aparelhos eletrônicos com a mente sem ter que usar um dispositivo de entrada como um teclado. Isso não fornece nenhuma credencial de login ou de sobreposição, mas, se o psíquico souber as credenciais, ele pode digitá-las. Qualquer ação mais difícil do que operar um computador de escritório aumenta a dificuldade de ativação. Este poder elimina a necessidade de dispositivos de entrada hápticos se o psíquico usar Realidade Aumentada (Augmented Reality) (M20 Operative’s Dossier, p. 58).

Modificador de Dificuldade = Exemplo
+1 = Controlar a rede de servidores de um pequeno escritório ou um sistema de segurança residencial, usar uma impressora 3-D com projetos pré-carregados
+2 = Dirigir psiquicamente um carro elétrico em velocidade de estrada
+3 = Usar equipamento especializado, como uma impressora 3-D sem projetos pré-carregados
+4 = Comandar uma fábrica controlada por computador
+5 = Operar um ônibus espacial sozinho

••• Glitch (Falha): O psíquico direciona seus campos eletromagnéticos para embaralhar processos eletrônicos causando pequenos curtos-circuitos internos e picos de energia. Ele pode fazer computadores travarem ou exibirem a tela azul e equipamentos de gravação captarem apenas estática. O efeito exige concentração ativa. A maioria dos aparelhos eletrônicos volta ao normal depois que o efeito termina, mas algumas tecnologias mais antigas simplesmente quebram. Um psíquico usando RA pode usar isto como um ataque contra Ícones e outros objetos da Digital Web, causando dano contundente. Use a ativação para atacar e substitua os pontos em Cyberkinesis pelo modificador de arma na rolagem de dano. Se o psíquico infligir 3 ou mais de dano em um ataque, o alvo fica atordoado por um turno.

•••• Spoof (Falsificar): O psíquico engana sistemas operacionais para que o deixem entrar sem credenciais válidas. Se o sistema for capaz de executar a tarefa, o psíquico pode forçar o sistema a fazê-la. O psíquico pode plantar documentos falsos, instalar malware, conceder a si mesmo privilégios de administrador ou apagar dados.

••••• Overclock (Sobrecarregar): O psíquico anula os limitadores de segurança de aparelhos eletrônicos para forçá-los a exceder suas capacidades normais. Um computador processa mais rápido ou roda softwares mais intensivos do que deveria ser capaz, um carro elétrico acelera mais rápido ou um apontador laser de escritório se torna uma arma. Cada sucesso na ativação adiciona um sucesso automático ao próximo uso da máquina pelo psíquico, mas o esforço danifica a máquina. Rolagens para operar a máquina depois que este poder é usado sofrem uma penalidade em dados igual aos sucessos de ativação até que o aparelho seja reparado. Obter 8 ou mais sucessos ao ativar este poder frita completamente a máquina depois que o efeito de Overclock termina.]==] },
				["Cyberpathy"] = { pt = [==[M20 Sorcerer, pág. 61


Cyberpathy


• Map Structure (Mapear Estrutura): O ciberpata pode examinar o diretório de computadores e dispositivos de armazenamento. O ciberpata pode encontrar a localização e as propriedades de todos os arquivos armazenados, mas não pode acessar os arquivos usando este poder. Isso pode ser útil para ciberpatas hackers que procuram dados específicos. O psíquico pode usar este nível para identificar um aparelho pelo seu Augmented Reality Object ID (ID de Objeto de Realidade Aumentada) se ele tiver capacidade de acesso à web.

•• Read-only Mode (Modo Somente Leitura): Como Map Structure, mas o ciberpata também pode ler arquivos. Arquivos de texto simples e de imagem são fáceis de visualizar, e o ciberpata pode adivinhar as funções de arquivos executáveis e aplicativos. O ciberpata é incapaz de descriptografar arquivos encriptados neste estágio. O psíquico pode visualizar o ARO associado ao aparelho se ele for de Nível 1 ou inferior e pode adivinhar as propriedades do ARO se ele for de um nível superior.

••• Download (Baixar): O psíquico pode usar o próprio cérebro como mídia de armazenamento, copiando e colando arquivos encontrados usando Cyberpathy. O ciberpata pode acessar textos, imagens e vídeos armazenados a qualquer momento a partir da própria mente, mas não pode rodar aplicativos. O psíquico pode armazenar um número máximo de arquivos igual ao total de seus atributos mentais (Exemplo: Coleen tem Percepção (Perception) 4, Inteligência (Intelligence) 3 e Raciocínio (Wits) 3. Ela pode armazenar 10 arquivos em sua mente). Arquivos e aplicativos maiores podem ocupar mais de um espaço de armazenamento, enquanto uma pasta compactada pode conter vários arquivos pequenos em um único espaço, ao custo de o psíquico ser incapaz de ler qualquer um dos arquivos enquanto estiverem armazenados dessa maneira. O ciberpata pode mais tarde gravar quaisquer arquivos que salvou dessa forma em qualquer mídia que possa acessar com Cyberpathy, com a opção de copiar o arquivo para a mídia ou transferi-lo de sua mente. Se o aparelho tiver um dispositivo de exibição conectado, o psíquico pode combinar Download com Cyberpathy para gravar e exibir um arquivo a outras pessoas no mesmo turno. Apagar arquivos da mente do psíquico é uma ação livre, mas o psíquico só pode apagar um arquivo por vez. Arquivos maiores que ocuparam mais de um espaço de armazenamento levam um número de turnos igual ao número de espaços que o arquivo ocupa para terminar a exclusão, mas o psíquico pode realizar outras ações normalmente durante a exclusão. O personagem pode baixar um ARO de um aparelho para carregá-lo depois e falsificar a identidade do aparelho.

•••• Remote Access (Acesso Remoto): O ciberpata pode se conectar a qualquer computador ou aparelho, como discos rígidos externos, na mesma rede que seu aparelho local. Este poder apenas permite que o psíquico trate o aparelho remoto como se ele estivesse à sua frente, e quaisquer outros poderes precisam ser ativados separadamente. O psíquico pode acessar múltiplos aparelhos na mesma rede ao custo de 1 de Força-de-Vontade por aparelho. Se o aparelho for capaz de acessar a internet, o psíquico pode usar esta habilidade para acessar a internet, incluindo a Digital Web. O psíquico pode usar dispositivos avançados de RA como seu ponto de acesso com este poder.

••••• Enigma (Enigma): O ciberpata se torna um algoritmo de descriptografia vivo, capaz de quebrar com facilidade até sistemas e arquivos fortemente encriptados. O psíquico pode ativar este poder para ignorar aumentos de dificuldade dos poderes inferiores de Cyberpathy e do acesso mundano em sistemas ou arquivos seguros e encriptados previamente armazenados usando Download. O psíquico pode, alternativamente, usar os sucessos de ativação para aumentar a dificuldade de Cyberpathy e de hackeamento para outras pessoas em um arquivo ou aparelho, a +1 de dificuldade por sucesso de ativação, se o psíquico possuir pontos em Informática (Computers) ou Cyberkinesis.]==] },
				["Ectoplasmic Generation"] = { pt = [==[M20 Sorcerer, pág. 62


Ectoplasmic Generation


• Quando alguém começa a explorar suas capacidades como gerador, isso começa com práticas de aparência bastante juvenil. Geradores novatos não acham difícil o ato de criar ectoplasma. A real dificuldade está em criar um volume e uma força substanciais. Isso leva o gerador iniciante a ser incapaz de forçar o plasma semilíquido para fora de seus orifícios sem assistência. Enfiando a mão na boca, no nariz e nos ouvidos para extrair a substância manualmente ou contando com o peristaltismo, o gerador precisa se esforçar para trazê-la para fora. Cada sucesso no teste de ativação gera um volume do tamanho de uma bola de softbol da substância pegajosa. Ele dura apenas um número de turnos igual à Força-de-Vontade do gerador, mas pode ser aplicado tão rápido quanto é gerado. Cobrir um objeto com uma camada fina de ectoplasma não exige passos extras além de gerá-lo. O plasma adere a todas as superfícies e não é fácil de limpar. Ele vai se agarrar e formar fios em qualquer coisa que o toque e só sublima no nada quando a duração expira.

Outra abordagem inédita que os usuários descobrem cedo é a técnica do “homem que fuma”. Quando estimulado corretamente, o ectoplasma também pode surgir como um vapor semelhante a névoa. Lambidas e tentáculos persistentes de fumaça espessa vazam da boca, do nariz e dos dutos lacrimais do gerador. Durando um número de turnos igual à Força-de-Vontade do psíquico, isso deve ser levado em conta ao lidar com interações sociais. Usar a técnica pode adicionar um dado de bônus em situações como o número de um mágico de palco ou intimidar um brutamontes desavisado, mas incorre em uma penalidade de -1 a Habilidades como Expressão ou Liderança devido à visão desconcertante dessa nuvem ectoplásmica.

•• Uma vez que os geradores de ectoplasma pegam o ritmo, o grau de avanço no controle é impressionante. A cada sucesso na rolagem de ativação, um psíquico gera o equivalente a um quarto de galão do fluido viscoso. Com esse volume aumentado, não é necessária assistência para forçar o plasma para fora, pois ele simplesmente escorre dos orifícios nasais e esofágicos do psíquico. Não há desconforto nisso, e mais de alguns geradores sentem um prazer doentio na repulsa dos outros à sua prática. Todos os fenômenos de plasma agora duram um número de minutos igual à Força-de-Vontade do gerador.

Uma névoa gerada agora ganha uma medida de responsividade à vontade do criador. O psíquico agora pode empurrar a névoa para fora formando uma nuvem que se move e se desloca ao comando mental do gerador. A velocidade da nuvem não é impressionante, a 10 pés por turno, mas ela pode ser usada para obscurecer olhos curiosos, impondo +2 de dificuldade a testes de Percepção (Perception). Esta nuvem de névoa tem um raio de 1 pé por Força-de-Vontade do psíquico.

••• A geração de fluido de plasma é truque de criança para o gerador experiente. Cada sucesso na rolagem de ativação agora invoca um galão de líquido em um fluxo contínuo. A força do jato não é suficiente para fazer um indivíduo perder o passo, mas é suficiente para que o gerador atinja o canto do teto em um quarto padrão.

As névoas ectoplásmicas ganham um grau de solidez. Não mais apenas fios de fumaça, a névoa agora é sólida o bastante para parecer algodão-doce aos vivos. Isso vem em conjunto com um volume aumentado de 5 pés de raio por ponto de Força-de-Vontade. Tentar forçar passagem pela névoa espessa e semissólida exige uma rolagem de Força (Strength) + Esportes (dificuldade 6). Espessa o bastante agora para que a névoa seja praticamente opaca, ela também fornece cobertura visual e aumenta a dificuldade de ver e atacar através dela em +3, semelhante a uma granada de fumaça pesada.

•••• Fluido e névoa são úteis, mas o acesso a massa sólida e a formas moldadas expande as possibilidades de criatividade dez vezes. O volume não aumenta, mas agora a produção do canalizador pode resultar em matéria sólida com a consistência de banha densa. Com maior estabilidade estrutural, o ectoplasma pode manter formas definidas que só são limitadas pela criatividade do gerador. Essas criações têm um número de pontos igual à Força-de-Vontade do psíquico para ser distribuído entre Força, Destreza (Dexterity) e Vigor (Stamina). A criação tem 3 níveis de Vitalidade e não sofre penalidades por ferimento. Embora não sejam capazes de movimentos complexos, as criações efêmeras sólidas podem se mover pelo espaço a 30 pés por turno. As criações estão psiquicamente atadas ao seu criador e não podem deixar sua percepção física e manter o movimento. Por fim, todas as criações de plasma não são mais limitadas por um limite de tempo e duram enquanto o gerador se concentrar.

••••• Aparições vaporosas de torso completo e flutuando livremente estão no ápice do ofício do gerador. Ainda fantoches do criador, as criações moldadas agora podem se animar plenamente conforme apropriado às suas formas complexas. Embora incapazes de enganar alguém a ponto de fazê-lo pensar que é a coisa genuína, as formas agora podem imitar grosseiramente pessoas e criaturas, até emitindo gemidos conforme bolsões de ar escapam dentro da forma gosmenta. As formas ainda são limitadas pelo volume gerado na rolagem, com um ser de ectoplasma do tamanho de um adulto exigindo três sucessos para ser preenchido. As criações seguem as mesmas regras de distribuição de Atributos detalhadas acima, mas têm 6 níveis de Vitalidade e não sofrem penalidades por ferimento. Fantoches ectoplásmicos podem ser possuídos e controlados com facilidade por fantasmas na área. O psíquico gasta 1 de Força-de-Vontade para entregar as rédeas a um fantasma disposto que esteja próximo. O fantasma então tem controle total do construto ectoplásmico, usando-o como se fosse seu próprio corpo. Uma vez que o psíquico entrega o corpo dessa maneira, ele dura um número de turnos igual ao valor de Força-de-Vontade do psíquico, após o que o ectoplasma do fantoche se dissipa. Outras manifestações que o psíquico cria não são afetadas e permanecem existentes enquanto o psíquico se concentrar.]==] },
				["Mind Shields"] = { pt = [==[M20 Sorcerer, pág. 65


Mind Shields


• As defesas são finas, mas presentes. O Psíquico recebe 2 dados para conter fenômenos de ataque mental e 1 dado para ataques mentais de outras fontes. Nesse ponto, os Escudos estão sempre ativos e não conseguem distinguir efeitos amigáveis e hostis. O psíquico pode baixar seus Mind Shields para permitir acesso a um psíquico amigo, mas isso o deixa aberto a qualquer outra habilidade mental usada antes que eles sejam erguidos novamente.

•• Camadas de caos mental ou muralhas mais grossas da mente são construídas. O psíquico recebe 4 dados para conter fenômenos de ataque mental e 2 dados para ataques mentais de outras fontes.

••• A mente do psíquico é uma confusão desnorteante ou um bunker resistente para qualquer invasor. O psíquico recebe 6 dados para conter fenômenos de ataque mental e 3 dados para ataques mentais de outras fontes. A capacidade de modular os próprios Mind Shields se torna clara nesse nível. Sempre que apresentado a uma habilidade mental que tente interagir com a mente do psíquico protegido, o alvo pode decidir se deixa isso passar por seus escudos ou não. Note que isso não identifica cada habilidade usada, apenas que uma tentativa está em curso para acessar a mente do psíquico. Fica a cargo do raciocínio dedutivo do alvo descobrir quem está diante de seus portões mentais.

•••• Um baluarte mental ou um atoleiro desconcertante de pensamentos dispersos recebe os intrusos. O psíquico recebe 8 dados para conter fenômenos de ataque mental e 4 dados para ataques mentais de outras fontes.

••••• A fortaleza mental do psíquico se ergue impenetrável ou o labirinto infinito se torna inavegável. O Psíquico recebe 10 dados para conter fenômenos de ataque mental e 5 dados para ataques mentais de outras fontes.]==] },
				["Precognition"] = { pt = [==[M20 Sorcerer, pág. 65


Precognition


• Intuition (Intuição): O vidente adquire um talento para adivinhar corretamente. Para eventos puramente aleatórios (loteria, rolagens de dados), as previsões podem ser bastante precisas. O psíquico pode saber intuitivamente a rota mais curta até um determinado destino e desfruta de uma probabilidade maior de encontros casuais benéficos. O psíquico não experimenta visões, ele apenas “tem um pressentimento” e adivinha muito bem. Mesmo com cinco ou mais sucessos, é improvável que as previsões sejam inteiramente precisas.

•• Insight (Discernimento): O psíquico experimenta visões oníricas tanto durante o sono quanto nas horas em que está acordado. Como sonhos, elas raramente são literais. Em vez disso, as visões são impregnadas de metáfora. Um inimigo pode aparecer como um dragão feroz ou como figuras em mantos clandestinos, enquanto um mentor amado pode aparecer como um pai há muito morto. As imagens dependem do paradigma do vidente e, embora mais sucessos ofereçam visões detalhadas, elas estão sempre sujeitas a interpretação.

••• Danger Sense (Sentido de Perigo): A conexão do vidente com o futuro se torna um sistema de alerta antecipado. O psíquico percebe isso como qualquer coisa desde uma dor lancinante na têmpora, até cãibras, até uma sensação crescente de pavor. Não importa a manifestação, ela é sempre a mesma para o vidente. Esse poder está sempre “ligado”, embora possa ser subvertido por certos efeitos de Esfera ou pelo Fenômeno Anti-Psychic (Anti-Psíquico). Quando algo não notado toma o psíquico como alvo, o Narrador rola a ativação de Danger Sense antes de rolar a emboscada. Esse poder não custa Força-de-Vontade ao psíquico para ativar.

Sucessos = Efeito
Desastre = O vidente involuntariamente se coloca em perigo ainda pior e perde sua rolagem para notar a emboscada.
Falha = O psíquico não obtém nenhuma intuição sobre a situação.
1 = O vidente sente que está em perigo, mas não obtém especificidades. Ele recebe 1 dado bônus para notar uma emboscada.
2 = O vidente sente que está em perigo e recebe instruções simples sobre como evitá-lo, como “abaixe-se” ou “corra”. O psíquico recebe 2 dados bônus para notar a emboscada e se esquiva normalmente se o atacante permanecer escondido.
3 = O vidente sabe que está em perigo, como evitá-lo e a direção do perigo. O atacante não rola emboscada e o ataque se resolve normalmente.
4 = O vidente sabe os detalhes do ataque e recebe um turno de aviso. O psíquico ganha um turno para se preparar antes que o perigo aconteça.
5 = O vidente recebe um turno de aviso e uma visão dos responsáveis. O psíquico será capaz de identificar a pessoa pela visão e/ou por intuição psíquica caso o psíquico veja ou esteja na presença da pessoa mais tarde. A impressão psíquica também funciona em gravações e criações, como pinturas ou cartas, feitas pelo atacante.

•••• Clarity (Clareza): O vidente desfruta de uma visão quase perfeita do futuro imediato. Para cada sucesso de ativação, jogadores e Narrador anunciam seus planos futuros gerais para um turno. Se o psíquico interferir com o tempo — como se mover para trás de uma cobertura para frustrar um ataque, o futuro muda, e o psíquico deve reativar esse poder para obter atualizações.

••••• Roads of Time (Estradas do Tempo): Um psíquico vê mais do que apenas os resultados mais prováveis e suas probabilidades relativas. Como Insight, mas o psíquico vê o tempo como estradas divergentes que se ramificam nas decisões. O vidente identifica pontos de decisão que de outra forma pareceriam inócuos antes que as escolhas sejam feitas. Isso também permite que um psíquico veja quais eventos futuros são difíceis de mudar e quais eventos são mais maleáveis.

Sucessos = Alcance de Tempo
1 = 12 horas
2 = 24 horas
3 = 1 semana
4 = 1 mês
5 = 1 ano
6+ = 1 ano adicional por sucesso

Fornecer informações sobre o futuro distante pode ser difícil para o Narrador. O Narrador pode, em vez disso, conceder uma nova rolagem por cada sucesso de precognição para a história. Isso representa a capacidade do psíquico de manejar probabilidades futuras relativas. Um psíquico pode usar quantas dessas novas rolagens quiser em uma única ação.]==] },
				["Psychic Healing"] = { pt = [==[M20 Sorcerer, pág. 66


Psychic Healing


• Diagnosis (Diagnóstico): O curandeiro diagnostica instantaneamente doença ou lesão pela visão ou pelo contato com a pele. A terminologia do diagnóstico depende do conhecimento médico do psíquico — alguém com pouco conhecimento pode descrever lúpus como “o corpo lutando contra si mesmo”. Um psíquico pode usar os sucessos de Diagnosis em uma rolagem complementar (veja Mage 20 p. 389) para rolagens de Medicina. Se usar trabalho em equipe, o psíquico pode contribuir com sucessos para a rolagem do profissional médico até o valor de Medicina do psíquico.

•• Restorative Slumber (Sono Restaurador): Com um toque, o curandeiro concentra as energias do corpo de seu paciente na cura. Trate uma ativação bem-sucedida como tratamento médico habilidoso para dano contundente e letal e como estabilização magicka para dano agravado. O toque deve durar pelo menos um minuto, após o qual o paciente cai em um sono profundo. Com 3+ sucessos, o paciente também recupera um ponto de Força-de-Vontade.

••• Urgent Care (Atendimento de Urgência): A habilidade de cura do psíquico agora facilita a resolução rápida de lesões e venenos leves. Um psíquico toca o paciente e pode curar até seus sucessos de ativação em dano contundente, a uma taxa de um por turno. Cada dois sucessos podem reduzir o Índice de Toxina (Toxin Rating) de um veneno, droga ou doença em um, até 3 níveis de redução.

•••• Intensive Care (Atendimento Intensivo): O curandeiro agora pode curar os gravemente feridos. O psíquico cura até 1 letal por sucesso de ativação e pode reduzir o Índice de Toxina de venenos, drogas e doenças em um nível por sucesso. Cada nível curado leva 10 minutos, durante os quais o psíquico deve manter contato físico com o paciente. O processo é claramente sobrenatural para quaisquer testemunhas, pois os ferimentos se costuram miraculosamente e as substâncias nocivas escorrem pelo suor da pele do alvo.

••••• Psychic Surgery (Cirurgia Psíquica): O psíquico agora pode curar ferimentos graves, cânceres e infecções. O psíquico cura até 1 de dano agravado por sucesso. Cada nível curado leva 10 minutos, enquanto o psíquico fecha os olhos e gesticula como se estivesse enfiando as mãos na carne. Curandeiros também podem usar essa habilidade para causar dano, alcançando o interior de uma vítima e removendo fisicamente tecido saudável — um processo horrível e sangrento. Fora de combate, o psíquico pode usar esse poder para infligir dano agravado em um alvo contido. Como na cura, essa aplicação do poder leva 10 minutos por nível de Vitalidade. Cada sucesso na rolagem de ativação causa um nível de Vitalidade de dano agravado impossível de absorver. Esse uso da cura psíquica é sádico e considerado tortura, mas, em combate, não há tempo suficiente para usar esse poder em toda a sua extensão. Psychic Surgery só pode ser usada em combate para causar dor — ela inflige penalidades de ferimento como se o psíquico tivesse ferido o alvo, mas não causa dano. A vítima pode gastar pontos de Força-de-Vontade iguais aos sucessos de ativação do psíquico para “curar” o dano.]==] },
				["Psychic Hypnosis"] = { pt = [==[M20 Sorcerer, pág. 67


Psychic Hypnosis


• Trance State (Estado de Transe): O hipnotizador coloca um alvo voluntário em um estado de transe calmante, embora não possa emitir comandos. Nesse estado, o alvo consegue lembrar eventos e detalhes com mais clareza e ganha uma redução de dificuldade em quaisquer testes que envolvam recordação de memória igual aos sucessos de ativação, até uma dificuldade mínima de 2. O alvo também recupera um ponto de Força-de-Vontade por cada sucesso de ativação, embora não possa se beneficiar dessa função novamente até ter descansado normalmente. Leva cinco turnos para colocar o alvo no transe, e o transe se rompe se alguém perturbar o alvo. O hipnotizador também pode colocar a si mesmo em transe.

•• Suggestion (Sugestão): O hipnotizador comanda um alvo a realizar ações após colocá-lo em transe. O psíquico pode dar um comando por sucesso, e o comando não pode obviamente resultar na morte do alvo nem ir contra a Natureza (Nature) do alvo. O psíquico pode forçar o alvo a ignorar respostas de dor e a esquecer comandos dados no transe, como comandos adicionais, se o psíquico gastar sucessos para isso. Apenas o psíquico decide quando o alvo sai do transe. O alvo ignora comandos incompatíveis em vez de romper o transe.

••• Implanted Suggestion (Sugestão Implantada): Um psíquico implanta sugestões que se ativarão fora do transe. Por cada sucesso, o psíquico pode implantar um comando ou uma condição para ativar um comando implantado. Essa condição pode ser um gatilho temporal ou sensorial. Um dos comandos pode ser entrar automaticamente em transe sob uma circunstância especificada. Como em Suggestion, a tentativa falha automaticamente se obviamente resultaria na morte do alvo ou conflitar com a Natureza do alvo. Comandos não são recorrentes a menos que o hipnotizador gaste um sucesso extra para adicionar uma condição recorrente.

•••• Fast Trance (Transe Rápido): O psíquico coloca instantaneamente sujeitos voluntários em transe e pode gastar um ponto de Força-de-Vontade para colocar um sujeito involuntário em transe, embora um sujeito involuntário possa testar Força-de-Vontade (dificuldade 7) para resistir, com cada sucesso anulando um dos sucessos de ativação do psíquico. O número de sucessos de ativação líquidos é o número de turnos que o alvo permanece no transe. O psíquico pode testar para ativar poderes adicionais a partir do seu próximo turno.

••••• Sleeper Agent (Agente Adormecido): O psíquico realiza níveis avançados de lavagem cerebral e condicionamento, do tipo que os governos anseiam. O psíquico implanta comandos para o alvo fazer qualquer coisa, mesmo até o ponto da morte, e o alvo conscientemente não lembra nada do que foi dito durante o transe. Este poder leva 10 minutos para colocar o sujeito em transe, o que não pode ser abreviado com Fast Trance. O alvo deve ouvir claramente a voz do psíquico. Sons e distrações adicionais tornam o uso deste poder impossível, então psíquicos com esta habilidade frequentemente designam salas especiais para esse propósito. O psíquico gasta um ponto de Força-de-Vontade para usar este poder em um sujeito involuntário. Cada sucesso de ativação permite que um comando seja implantado, e cada comando ou condição leva uma hora para ser implantado.]==] },
				["Psychic Invisibility"] = { pt = [==[M20 Sorcerer, pág. 68


Psychic Invisibility


• Wallflower (Enfeite de Parede): Enquanto o psíquico permanecer completamente imóvel e silencioso, ele continua não notado. Entretanto, o psíquico não precisa prender a respiração — apenas uma respiração pesada ou ruidosa rompe o efeito.

•• Slink (Esgueirar-se): O psíquico se move enquanto invisível, mas não pode interagir de forma significativa com o mundo. O poder se rompe se o psíquico fizer qualquer coisa para chamar atenção para si mesmo ou interagir com o mundo, como escrever em um quadro-negro ou abrir uma porta. Um psíquico pode fazer um teste de Raciocínio (Wits) + Furtividade em dificuldade 7 ou mais para evitar romper acidentalmente seu poder em condições desfavoráveis, como pisos de floresta cobertos de gravetos ou uma sala com alarme de movimento.

••• Invisibility (Invisibilidade): O psíquico pode agora realizar qualquer ação enquanto invisível, mesmo que essas ações normalmente chamassem atenção para o psíquico. Seres com sentidos mundanos podem fazer um teste de Percepção (Perception) + Sensitividade em dificuldade 9 para ver o psíquico se o psíquico atacá-los ou se estiverem especificamente procurando pelo psíquico. O ser que procura deve exceder os sucessos de ativação do psíquico. O psíquico não pode desaparecer enquanto alguém o observa diretamente.

•••• Selective Invisibility (Invisibilidade Seletiva): O psíquico controla para quem projeta o comando “não me note”. Por cada sucesso de ativação, o psíquico pode declarar uma pessoa isenta do efeito. Qualquer pessoa declarada isenta percebe e interage com o psíquico normalmente, mas todos os demais são tratados como se o psíquico tivesse ativado Invisibility. Note que os outros ainda podem perceber qualquer um que interaja com o psíquico, e isso pode atrair atenção negativa.

••••• I Was Never Here (Eu Nunca Estive Aqui): Na expressão mais elevada deste Fenômeno, um psíquico desaparece na frente de testemunhas e apaga sua presença das mentes das testemunhas. O psíquico testa ativação em oposição à testemunha com a maior reserva de Percepção + Sensitividade. A testemunha testa em dificuldade 8. Com um sucesso líquido, o psíquico desaparece de vista, confundindo e desconcertando quaisquer testemunhas. Com três ou mais sucessos líquidos, as testemunhas também esquecem a presença do psíquico por um turno passado por sucesso. É possível que as testemunhas esqueçam de ter visto o psíquico, se a observação foi breve.]==] },
				["Psychic Vampirism"] = { pt = [==[M20 Sorcerer, pág. 69


Psychic Vampirism


• Tap Energy (Extrair Energia): O vampiro se alimenta das emoções fortes dos outros, tanto positivas quanto negativas. O vampiro sente quais são as emoções enquanto se alimenta e pode usar este poder para avaliar as emoções de um indivíduo ao longo do tempo. Requer apenas um sucesso para saborear o paladar nuançado das emoções de uma pessoa e dar ao vampiro um barato agradável. Com três sucessos, o vampiro recupera um ponto perdido de Força-de-Vontade, e recupera uma Força-de-Vontade adicional por sucesso além do terceiro. O vampiro deve estar a até 10 jardas da vítima e ser capaz de senti-la. A vítima fica desconcertada, e suas emoções ficam contidas — mas não ausentes — até o fim da cena.

•• Invigorate (Vigorar): O psíquico drena as energias vitais de uma vítima para fortalecer a si mesmo. Cada sucesso drena um ponto temporário de Força-de-Vontade da vítima e o adiciona à reserva do vampiro, até um máximo de 10 no total. Cada Força-de-Vontade acima do máximo normal do vampiro dá um barato eufórico e se dissipa a um ponto por hora. O alcance é de 15 jardas, e o vampiro deve sentir a vítima para tomá-la como alvo com este poder.

••• Leech Vitality (Sugar Vitalidade): Este poder extremamente perigoso permite que um vampiro use a força vital de outro para curar a si mesmo e experimentar um barato indescritível. O psíquico deve tocar a vítima por um turno por nível de Vitalidade de dano curado, até os sucessos de ativação. O dano contundente cura primeiro, depois o letal, e então o agravado é rebaixado para letal. Cada sucesso excedente que não resulte em cura restaura 2 pontos de Força-de-Vontade ao psíquico, como em Invigorate. Cada sucesso usado causa um de dano letal à vítima. Se o contato for interrompido antes de terminar, o psíquico não cura e deve fazer outra tentativa.

•••• Essence Feast (Banquete de Essência): O psíquico não está limitado a uma vítima por vez. O psíquico testa ativação para determinar o número máximo de alvos simultâneos, ganhando um alvo adicional por sucesso. Todos os alvos devem estar a até 40 jardas do vampiro, mas o vampiro não precisa ser capaz de sentir todos eles. Ao obter sucesso, o psíquico pode ativar qualquer poder inferior no mesmo turno, usando os custos e o teste de ativação normais associados ao poder inferior. O psíquico fica atordoado no turno seguinte — o influxo de múltiplos perfis de sabor de uma só vez é tão avassalador quanto eufórico para o psíquico. Um desastre pode causar uma “viagem ruim”, como se o psíquico tivesse ingerido alucinógenos, e deixá-lo atordoado pelo resto da cena.

••••• Distant Drain (Dreno Distante): O domínio do vampiro sobre a extração de energias vitais permite que ele volte a extrair de uma vítima anterior a distância. O vampiro deve ter usado Telepathy (Telepatia) ou outro poder de Psychic Vampirism (Vampirismo Psíquico) na vítima anteriormente. Os sucessos de ativação especificam um alcance máximo no qual o vampiro pode usar um poder inferior na vítima.

Sucessos = Alcance
Desastre = Não pode usar Psychic Vampirism neste alvo por um mês
Falha = Nada acontece
1 = 500 jardas
2 = 1 milha
3 = 2 milhas
4 = 5 milhas
5 = 10 milhas
6+ = +10 milhas por cada sucesso acima de 5]==] },
				["Psychokinesis"] = { pt = [==[M20 Sorcerer, pág. 70


Psychokinesis


• Com Força e Destreza mentais de 0, o psíquico só pode levantar no máximo 5 libras. Os objetos seguem um caminho lento e desajeitado pelo espaço quando movidos e têm velocidade máxima de 5+ Raciocínio (Wits) jardas por rodada.

•• A Força e a Destreza mentais do psíquico sobem para 1, e os objetos têm movimento de 7+ Raciocínio jardas por rodada.

••• O poder e a compreensão crescentes proporcionaram ao psicoquineta Força e Destreza mentais de 2. Os alvos manipulados se movem a 9+ Raciocínio jardas por rodada.

Desbloquear ainda mais sua compreensão da força cinética como ferramenta da mente dá novos frutos. O psíquico agora pode fazer um ataque à distância com sua ação pela pura força. A força psicoquinética atinge como um soco à distância, usando a Força mental do psíquico e sua Briga ou Artes Marciais como parada de dados para atacar, com dano base igual à sua Força mental. Esse ataque representa um uso concentrado do Fenômeno e não pode ser utilizado enquanto se realiza qualquer outra ação psicoquinética. Essa aplicação também é instantânea e exige o custo total de ativação do Fenômeno todas as vezes.

•••• A Força e a Destreza mentais do psíquico agora são 3, e ele pode mover objetos manipulados a 11+ Raciocínio jardas por rodada.

Mais uma nova aplicação se torna disponível ao psicoquineta. O psíquico internalizou sua força psicoquinética e agora pode levitar a si mesmo, independentemente do peso, a uma taxa equivalente à sua velocidade de caminhada. Esse uso do Fenômeno exige maior concentração do que a maioria e, portanto, não pode ser empregado enquanto se levantam outros alvos.

••••• Um mestre psicoquineta tem Força e Destreza mentais de 4 e pode mover alvos manipulados a uma taxa de 15+ Raciocínio jardas por rodada.

Ambas as ações refinadas do fenômeno recebem melhorias neste nível. A levitação agora é algo natural e pode ser realizada enquanto se levantam outros alvos, e os ataques psicoquinéticos agora podem causar dano contundente ou letal.]==] },
				["Psychometry"] = { pt = [==[M20 Sorcerer, pág. 72


Psychometry


• Impression (Impressão): O psíquico pode obter impressões oníricas de eventos recentes envolvendo o objeto ou de eventos mais distantes com fortes emoções associadas. O psíquico, neste estágio, obtém principalmente leituras emocionais e imagens vagas e figurativas. Com 3+ sucessos, o psíquico também pode ver uma imagem precisa da pessoa mais intimamente associada ao objeto.

•• Reveal Scar (Revelar Cicatriz): O psíquico obtém impressões do evento com a mais forte ressonância emocional associada ao objeto. Ele recebe imagens oníricas e imprecisas do evento. Com 3+ sucessos, também determina a idade aproximada do dono, indícios de personalidade, a conexão com o objeto e o que o dono sentiu na ocasião.

••• Replay (Reprise): O psíquico vivencia claramente o evento e pode reunir impressões gerais sobre o que aconteceu com o dono do objeto no dia do incidente. Alternativamente, o psíquico pode reproduzir as últimas 24 horas do objeto, mesmo que nada emocionalmente significativo tenha acontecido.

•••• Tether (Vínculo): O psíquico pode usar o objeto como um vínculo psíquico com o dono do objeto. Ativar este nível dá ao psíquico uma percepção da localização atual do dono para rastreá-lo. Além de ver claramente o evento com a mais forte ressonância emocional associada ao objeto, ele também lê impressões emocionais e visões das outras pessoas presentes no evento e dos sentimentos delas.

••••• Catalog (Catálogo): O psíquico pode usar Tether em qualquer evento ao qual o objeto esteve associado, não apenas naqueles com o maior impacto emocional.]==] },
				["Psychoportation"] = { pt = [==[M20 Sorcerer, pág. 73


Psychoportation


• Short Hop (Salto Curto): Alcance de até 12 + Inteligência jardas em um turno.

•• Simple Jump (Salto Simples): Alcance de até 20 + (3 x Inteligência) jardas.

••• Long Jump (Salto Longo): Alcance de até 40 + (6 x Inteligência) jardas. O psíquico pode gastar um turno de concentração e rolar a ativação com +1 de dificuldade para dobrar esse alcance.

•••• Leap (Salto): Alcance de até 80 + (12 x Inteligência) jardas. O psíquico pode dobrar, conforme Long Jump.

••••• Leap of Faith (Salto de Fé): O psíquico não precisa mais sentir um local estável para se psicoportar até ele. O psíquico pode gastar uma cena estudando o local e rolar com sucesso Percepção + Prontidão em dificuldade 8 para memorizá-lo.]==] },
				["Pyrokinesis"] = { pt = [==[M20 Sorcerer, pág. 74


Pyrokinesis


• Spark (Faísca): O pirocinético pode gerar pequenas faíscas, normalmente a partir das pontas dos dedos. Essas faíscas normalmente só conseguem incendiar substâncias altamente inflamáveis, como papel ou gasolina, mas com 3 ou mais sucessos as faíscas do psíquico podem incendiar materiais como um fósforo faria. As faíscas podem acender qualquer coisa ao alcance do pirocinético, embora ele não precise tocar o alvo. Mesmo com muitos sucessos, as faíscas não são quentes o bastante para incendiar diretamente uma pessoa, embora o efeito de uma chama surgindo possa assustar alguém. Após a ativação, trate as faíscas como um ataque de arremesso com uma arma que não causa dano. Isso pode ser esquivado normalmente. Se o ataque acertar, o alvo rola Força-de-Vontade com dificuldade 6 para evitar ficar atordoado por um turno. Em um desastre, o alvo entra em pânico. O alvo pode, em vez disso, gastar um ponto de Força-de-Vontade para suprimir a reação de susto.

•• Combustion (Combustão): O psíquico se concentra em um objeto a até 10 jardas, fazendo-o irromper em chamas. O psíquico pode incendiar de forma confiável materiais inflamáveis como gasolina, madeira seca, carvão e vampiros. Com 3 ou mais sucessos, o psíquico pode incendiar qualquer coisa combustível, como pessoas. O fogo inicial é do tamanho de uma tocha e se comporta e se espalha normalmente. Se o psíquico tiver como alvo uma pessoa ou as roupas de uma pessoa, o alvo pode tentar esquivar normalmente, tratando os sucessos de ativação como a rolagem de mira.

••• Sun’s Fury (Fúria do Sol): O psíquico agora pode transformar pequenas esferas de ar em plasma e chama, que incendeia prontamente quase tudo o que toca. Este poder causa incêndios do tamanho de uma fogueira a até 10 jardas de distância, causando dois de dano agravado por turno pelo calor intenso. Os alvos podem tentar esquivar normalmente, tratando os sucessos de ativação como a rolagem de mira. Se acertado, o alvo deve gastar um ponto de Força-de-Vontade ou rolar Força-de-Vontade com dificuldade 6 para conseguir evitar o pânico. Se permanecer calmo, o alvo pode imediatamente usar sua ação para rolar Destreza + Esportes com dificuldade 5, apagando as chamas em si mesmo com um sucesso.

•••• Pyrotechnics (Pirotecnia): O pirocinético ganha controle sobre as chamas, incluindo as produzidas por níveis inferiores de Pirocinese. O psíquico pode aumentar, diminuir, direcionar e moldar chamas dentro de sua linha de visão à vontade. Com um sucesso, o psíquico pode controlar uma porção de chamas do tamanho de uma tocha. Com três sucessos, o psíquico arranca o controle de uma fogueira. Com cinco ou mais sucessos, o psíquico pode comandar até um inferno. Ter indivíduos como alvo com chamas é um ataque de Raciocínio + Esportes com dificuldade 7, com +1 de dificuldade para evitar ferir transeuntes próximos no processo. Este ataque pode ser esquivado. Um psíquico pode apagar uma chama à vontade. Uma fogueira ou chama menor é apagada instantaneamente, mas qualquer chama maior leva um turno inteiro de concentração para ser apagada.

••••• Inferno (Inferno): O pirocinético agora comanda chamas maiores e de crescimento mais rápido, que podem aparecer em qualquer lugar da linha de visão do psíquico. As chamas consomem tudo o que está dentro delas com 3 de dano agravado por turno, embora alvos nas bordas externas possam esquivar como em Sun’s Fury. Com um sucesso, a chama inicial é um fogo pequeno, mas com três sucessos as chamas enchem um grande salão, até um máximo de Força-de-Vontade vezes 3 jardas quadradas. Se o psíquico mantiver a concentração, as chamas resistem a ser apagadas por meios mundanos, levando rodadas iguais aos sucessos obtidos na rolagem de ativação para serem apagadas por sufocamento, água ou produtos químicos retardantes de chama. Se o psíquico quebrar a concentração, como ao sofrer dano ou ser derrubado inconsciente, as chamas perdem todas as propriedades sobrenaturais e podem ser apagadas normalmente.]==] },
				["Shadow"] = { pt = [==[M20 Sorcerer, pág. 74


Shadow


• Dispersar as bordas das sombras projetadas e perturbar o som só é suficiente para aumentar a eficácia da ocultação e da desmoralização. As sombras ficam ligeiramente mais longas, alcançam um pouco mais longe, enquanto os sons são todos inquietantemente abafados. Todas as rolagens de Intimidação e Furtividade têm sua dificuldade ajustada em −1. Alvos distraídos por sombras que escurecem e por sons abafados sofrem +1 de dificuldade em todas as rolagens que dependem de visão e audição.

•• As sombras agora crescem e se curvam à vontade do psíquico. Os sons agora confundem e distorcem, tendo a qualidade de serem tocados por um alto-falante estourado. O psíquico encarna o idiomatismo de “to darken a doorstep” (“escurecer a soleira de uma porta”), pois as salas perdem luz quando ele chega. As rolagens de Intimidação e Furtividade são feitas com −2 de dificuldade.

••• Não apenas as sombras ficam mais escuras, mas agora os esforços do psíquico fazem as fontes de luz perderem sua potência. O som viaja pela sala em ondulações erráticas, e as palavras que são inteligíveis têm um atraso perceptível em relação a quem fala. Tentativas de ver o psíquico oculto sofrem +3 de dificuldade. Os atormentados começam a sentir uma ansiedade crescente e devem fazer uma rolagem de Força-de-Vontade (dificuldade 7) para evitar o pânico, sofrendo uma penalidade de -1 em todas as ações que não envolvam sair da cena, caso falhem.

•••• Espalhando seu dom de refúgio escuro, o psíquico agora pode encobrir um pequeno grupo de três ou quatro pessoas, possivelmente até um pequeno cupê ou sedã.

Vítimas de assédio sombrio devem fazer uma rolagem de Força-de-Vontade (dificuldade 8) para evitar entrar em pânico e sair imediatamente da cena para escapar da escuridão. Intimidação e Furtividade têm −4 de dificuldade em condições propícias à exploração. Um armazém já escuro, uma floresta sombria à noite, ou um estacionamento mal iluminado, todos pedem para ter suas sombras profundas encorajadas pelo psíquico. Essa quantidade de manipulação de sombras tem um efeito inverso em ambientes mais claros, como o meio-dia em um estacionamento aberto ou ao ficar em um campo esportivo escolar com todas as luzes acesas. A escuridão ao redor do psíquico atrai mais atenção no brilho do meio-dia do que desvia.

••••• Em ambientes onde a escuridão já habita, o psíquico é mestre. Estar em um local onde as condições favorecem as sombras dá ao psíquico a chance de sufocar toda a luz ao seu redor até 50 pés. A escuridão é quase impenetrável para aqueles sem visão mística, pois até lanternas de mão de alta potência são engolidas pelo negrume. Todos os que estão dentro ficam completamente encobertos e invisíveis para o exterior e para os outros que estão dentro, exceto o psíquico. A escuridão é a dele, afinal.]==] },
				["Synergy"] = { pt = [==[M20 Sorcerer, pág. 75


Synergy


• Like Knows Like (Igual Reconhece Igual): O sinergista pode sentir outros psíquicos. Isso tem sucesso automático se o psíquico tocar outro, mas o sinergista pode rolar ativação para varrer em busca de psíquicos na linha de visão. Com 3 ou mais sucessos, o sinergista pode sentir o poder relativo dos outros psíquicos.

•• Share Will (Compartilhar Vontade): O sinergista forma um vínculo psíquico fraco para aumentar o poder dos participantes. Cada psíquico pode gastar um ponto de Força-de-Vontade para um sucesso automático no efeito de outro, ou permitir que o psíquico “empreste” a Força-de-Vontade e adicione temporariamente o ponto à sua reserva, até um máximo de 10. Se a Força-de-Vontade não for gasta, ela pode ser negociada múltiplas vezes entre os psíquicos no vínculo. Quaisquer Fenômenos sensoriais (Telepatia [Telepathy], Precognição [Precognition], etc.) permitem que todos os psíquicos no vínculo compartilhem os resultados.

••• Share Powers (Compartilhar Poderes): O sinergista forma um vínculo mais forte, permitindo que todos os psíquicos usem seus poderes como um grupo. Cada psíquico pode doar até dois poderes, pontos de Força-de-Vontade, ou um de cada. Apenas uma rolagem de ativação é necessária para poderes de grupo.

•••• Power Gestalt (Gestalt de Poder): Como Share Powers, mas agora os psíquicos no vínculo podem combinar efeitos de habilidades para formar um único poder compartilhado. Por exemplo, o grupo poderia combinar Psiquismo Animal (Animal Psychics) e Invisibilidade Psíquica (Psychic Invisibility) para conseguir passar despercebido por cães de guarda.

••••• Power Network (Rede de Poder): O sinergista pode vincular outros psíquicos e remover a necessidade de os psíquicos se tocarem, ou mesmo de estarem no mesmo lugar. Um psíquico com este nível de Sinergia primeiro vincula todos como nas habilidades inferiores, gastando 10 minutos em foco e meditação combinados para cimentar os laços. Uma vez formado o vínculo, os psíquicos em rede permanecem vinculados e capazes de usar qualquer uma das habilidades inferiores por um número de horas igual aos sucessos de ativação. Este vínculo não se desfaz com a distância, mas se um psíquico no vínculo sofrer dano igual ou superior ao seu Vigor de uma única fonte, todos os psíquicos na rede devem fazer uma rolagem de Força-de-Vontade com dificuldade 7 ou ser ejetados da rede. Se o psíquico que formou a rede for ejetado, derrubado inconsciente ou morto, a rede automaticamente colapsa.]==] },
				["Telepathy"] = { pt = [==[M20 Sorcerer, pág. 76


Telepathy


• Todos os telepatas começam sentindo os pensamentos superficiais e as emoções de um sujeito. As emoções incluem o humor atual, o desejo imediato e o bem-estar mental. Pensamentos superficiais são músicas presas na cabeça, a recordação ativa de coisas como uma lista de compras ou um código de acesso enquanto ele é digitado, ou o que eles acham que era aquele cheiro que acabaram de sentir.

•• Os pensamentos internos se abrem para o telepata. A cada sucesso na rolagem de ativação, o telepata pode fazer uma única pergunta sobre as ruminações subsuperficiais do alvo. Essas respostas têm uma frase de extensão e são o mais diretas possível. Pensamentos internos incluem inclinações políticas, livros ou filmes favoritos, ou memórias recentes.

Os inícios da comunicação telepática também se abrem neste nível. Para cada sucesso na rolagem de ativação, o telepata pode enviar ou receber uma frase de comunicação mental. Essas comunicações acontecem na velocidade do pensamento e, como tal, não ocupam nenhum tempo dentro de uma rodada nem exigem qualquer divisão de reserva de dados para múltiplas ações.

••• Pensamentos mais profundos são revelados ao telepata. Como nos níveis anteriores, cada sucesso na rolagem de ativação permite uma única pergunta que é respondida pelo alvo. Essas respostas podem ser mais detalhadas quando o assunto da pergunta não é um segredo bem guardado. Pensamentos mais profundos incluem memórias dos últimos 5 anos, senhas de contas de redes sociais e cartões bancários, e os nomes de todos, da família imediata à estendida.

A comunicação telepática vem muito mais facilmente neste estágio. Para cada sucesso na rolagem de ativação, o telepata pode enviar e receber várias frases (duas ou três) de comunicação. Novamente, essas comunicações acontecem na velocidade do pensamento e seguem as mesmas regras acima.

•••• Pensamentos subconscientes e os recessos mais profundos da mente estão ao alcance do telepata. Cada sucesso na rolagem de ativação permite uma única pergunta que é respondida pelo Narrador. Nada dentro da mente está fora dos limites neste ponto. Memórias que remontam à infância, códigos esquecidos de instalações em que costumavam trabalhar, e mesmo pensamentos que têm e que negam a si mesmos sobre seus entes queridos são todos alvos legítimos.

As conversas por conexões telepáticas não estão mais limitadas a frases. Conversas completas entre duas pessoas acontecem em um piscar de olhos. A melhoria mais impressionante é que os vínculos telepáticos podem ser ampliados para uma rede. Cada sucesso na rolagem de ativação permite que outra mente seja adicionada à conversa. Quando múltiplas mentes são adicionadas ao vínculo do psíquico, a largura de banda telepática excedente desacelera, pois a mente do psíquico está agindo como um roteador central. Conversas assim acontecem em tempo real, como se todos os envolvidos estivessem falando uns com os outros ao redor de uma mesa.

••••• Por insidioso que seja, o telepata agora pode implantar pensamentos subversivos nas mentes de seus alvos. Esses pensamentos podem ser de qualquer coisa, mas qualquer linha de pensamento que ainda não estivesse presente na mente do alvo requer uma rolagem de Manipulação + Lábia (dificuldade 7) para implantar pensamentos que complementem a personalidade e os desejos do alvo. Pensamentos implantados que vão contra a personalidade e os desejos do alvo sofrem +2 de dificuldade na rolagem. Caso esses pensamentos criem raízes, o alvo começará a agir de acordo com eles na primeira oportunidade conveniente, convencido de que os pensamentos são seus.]==] },
				-- True Faith is not one of the 43 above: it is the single Path of its own Numina
				-- and it has its own two-entry picker (SPEC T81/T82, R.16). Same shape as the
				-- rest so the renderer and the gate treat it identically.
				["True Faith"] = { pt = [==[The Hunters Hunted II, pág. 83


True Faith


• Cada nível de Fé Verdadeira concede um ponto extra de Força de Vontade.

• Cada ponto de Fé Verdadeira age como um dado de proteção divina para resistir aos efeitos de Núminas, Disciplinas de vampiros ou outros poderes sobrenaturais. Quando um personagem seria afetado por uma Disciplina de Kindred ou outro poder, seu jogador pode gastar um ponto de Força de Vontade e rolar o índice de Fé Verdadeira do personagem como reserva de dados contra uma dificuldade de 7. Os sucessos obtidos nessa rolagem subtraem sucessos da rolagem de ativação do poder em questão. Essa proteção afeta apenas poderes que afetariam o personagem diretamente, e somente se uma rolagem de dados for necessária para determinar seu grau de sucesso. Ela não oferece proteção alguma contra usos passivos ou indiretos de poderes como Percepção de Aura ou Fortitude.

A Númina da Fé Verdadeira, como qualquer outra, tem um índice de 1 a 5. Exatamente qual proteção é concedida ao indivíduo depende desse índice, conforme descrito abaixo. A seu critério, os Narradores podem querer emendar ou alterar esses benefícios para refletir a intervenção de poderes superiores conforme isso ilustre os temas de suas próprias crônicas.

Níveis de Fé Verdadeira

• Qualquer personagem com Fé Verdadeira pode tentar repelir vampiros, fantasmas e outras criaturas sobrenaturais brandindo um símbolo sagrado ou proferindo orações. O jogador do Fiel gasta um ponto de Força de Vontade e rola o índice de Fé Verdadeira de seu personagem contra uma dificuldade igual à Força de Vontade permanente da criatura.

Os sucessos obtidos indicam o número de turnos que a criatura deve fugir do personagem enquanto ele invoca a proteção da oração ou do símbolo sagrado. Se a rolagem de ativação não render sucesso algum, a criatura sobrenatural não precisa recuar, mas não pode avançar. Uma falha crítica indica que ela pode avançar sem impedimento. Se o símbolo religioso for encostado no corpo de um vampiro, cada sucesso causa um nível de dano agravado, queimando a carne da criatura.

•• O Fiel pode sentir a presença de um vampiro. Ele não precisa tentar detectar conscientemente a presença do vampiro, mas precisa estar em um ambiente pacífico e silencioso, talvez sozinho com seus pensamentos, orando, lendo um livro religioso, meditando, etc. O Fiel não sentirá o vampiro se estiver preocupado (p.ex., discutindo) ou em um lugar lotado e ruidoso (acotovelado por uma multidão, no meio de uma festa, etc.). Essa habilidade não acende o vampiro como um farol; o Narrador revela a presença do vampiro apenas quando a atenção do Fiel indicaria isso. Note que o personagem não sabe exatamente o que sente através de sua fé. Tudo o que ele sabe é que algo sinistro está por perto.

••• O Fiel é imune a Quimerismo, Demência, Dominação, Ofuscação e outros efeitos sobrenaturais que confundem a mente.

•••• O Fiel não pode ser transformado em carniçal. Ele não é afetado por Presença nem por outros efeitos sobrenaturais que manipulam emoções.

••••• A mera presença do Fiel pode encher um vampiro ou outra criatura sobrenatural de auto-ódio, nojo, terror ou até dor física. O jogador de qualquer vampiro que ouça o Fiel orar ou pregar, ou que seja tocado pelo Fiel, deve obter sucesso em uma rolagem de Rötschreck (dificuldade 9) para resistir a fazer o Kindred fugir imediatamente e pela duração da cena. Um vampiro incapaz de fugir é reduzido a um destroço balbuciante, se debatendo no chão, gritando, soluçando ou implorando por misericórdia.

Milagres da Fé Verdadeira

Um milagre é uma instância de intervenção divina direta. Os Fiéis costumam orar ao divino como forma de adoração e meditação. Em ocasiões raras e inspiradoras, o divino responde a uma oração na forma de um milagre. Tais milagres devem ser raros, nunca mais de um por história, e sempre dramáticos.

O Narrador deve examinar a motivação do personagem que invoca o milagre. O divino provavelmente não se importa se o Fiel quer dirigir um carro de luxo, ganhar na loteria ou mesmo sobreviver a um encontro com um vampiro qualquer. Toda religião tem seus mártires, e a morte às vezes faz parte do plano divino. Orações que são altruístas e buscam ajudar ou inspirar outros têm a melhor chance de serem respondidas. Não existe sistema rígido para invocar milagres — é simplesmente um lembrete dramático de que indivíduos Fiéis carregam um dever divino e podem ocasionalmente servir como condutos para a vontade de seu poder maior no mundo.

Milagres são impossíveis de definir mecanicamente, pois devem ser especificamente adaptados à situação. Alguns exemplos incluem:

• Ajudar uma mulher estéril a poder ter um filho

• Curar uma doença terrível e dolorosa, como o câncer

• Ajudar alguém preso sob um prédio desabado

• Encontrar-se ao lado de um amigo em necessidade desesperada]==] },
				-- The fifty-two SAMPLE RITUALS of the hedge Paths, "HEDGE MAGIC RITUALS" on the
				-- Numina tab (SPEC T928, I140i, I140l). They are keyed by the picker value, level
				-- prefix and all, because that is what the sheet saves and what mfOpen hands to
				-- descText - the box already passes the 'Numina' kind, so no code names them.
				-- The book prints these as prose with no System block, which is why every one of
				-- them is on the named V335c list (SPEC I104c).
				["1. Death Curse"] = { pt = [==[M20 Sorcerer, pág. 31


1. Death Curse


Um dos rituais mais extremos que um mago pode realizar, a Death Curse sempre resulta na morte dele e, normalmente, na destruição de seus inimigos. O mago gasta toda a sua Força-de-Vontade permanente, ganhando uma reserva de sucessos igual a esse valor para a magia final. Este ritual permite que ele eleve o nível dos Aspectos a 2 acima do seu nível de Caminho, permitindo que magos relativamente poderosos se sacrifiquem por maldições lendárias (ou, mais raramente, bênçãos). Maldições que ressoam por gerações, com destinos piores que a morte para cidades inteiras, não são inéditas entre os magos mais poderosos que se dispõem a fazer o sacrifício. Ele faz o teste de Caminho com a dificuldade determinada pelos Aspectos, como de costume, mas com essa reserva adicional de sucessos automáticos. Ao concluir o ritual, o mago desaba, tendo gasto a própria vida na conjuração; muitas vezes já está morto antes mesmo de atingir o chão.]==] },
				["1. Deathsight"] = { pt = [==[M20 Sorcerer, pág. 40


1. Deathsight


Normalmente, um necromante só consegue ver os fantasmas ao seu redor. Ele não vê o ambiente que os fantasmas chamam de lar. Este ritual muda isso. Com ele, o mago não apenas vê os Mortos Inquietos, como consegue de fato enxergar dentro das Terras das Sombras. O efeito dura um minuto por sucesso no ritual. Enquanto está sob a influência deste ritual, o necromante não consegue perceber o mundo normal; apenas as Terras das Sombras são visíveis para ele.]==] },
				["1. Eldritch Mark"] = { pt = [==[M20 Sorcerer, pág. 29


1. Eldritch Mark


Ao inscrever um símbolo ou marca em um objeto ou na testa de uma pessoa, o mago a marca como sua. A marca é invisível a olho nu, mas evidente para qualquer um com percepções magicamente ampliadas de qualquer tipo. A marca informa a quem a observa o nome do mago que a criou. Este ritual leva cinco minutos para ser conjurado e não custa Força-de-Vontade. A marca dura até a próxima lua nova.]==] },
				["1. Face Theft"] = { pt = [==[M20 Sorcerer, pág. 47


1. Face Theft


O ritual central da espionagem baseada no Caminho da Metamorfose, Face Theft permite que o mago assuma a forma exata de outro ser humano. Ele precisa ter alguma parte da pessoa, como fios de cabelo ou aparas de unha. O ritual exige um sucesso para uma pessoa de aparência amplamente semelhante à do conjurador, e um sucesso adicional para cada diferença de etnia, sexo ou mais de 20 anos de idade.]==] },
				["1. Healing Slumber"] = { pt = [==[M20 Sorcerer, pág. 33


1. Healing Slumber


O curandeiro trata um paciente voluntário (ou inconsciente) e o envia a um sono profundo e revigorante. Com sucesso, o paciente permanece adormecido por 9 horas; ao despertar, todo o dano contundente está curado e ele recupera um ponto de Força-de-Vontade. Para cada sucesso acima do primeiro, subtraia uma hora do tempo de sono exigido. O curandeiro não pode tratar ferimentos letais ou agravados desta forma.]==] },
				["1. Lifting Shadows"] = { pt = [==[M20 Sorcerer, pág. 46


1. Lifting Shadows


Sombras e penumbras escondem segredos para quem deseja escondê-los, mas o feiticeiro instruído pode revelar esses segredos a quem confia. Untando tinta em um par de lentes de contato ou canalizando fumaça para dentro de óculos de natação justos, o feiticeiro leva a visão do beneficiado ao reino das sombras. Pelas oito horas seguintes, a noite pode ser tão clara quanto o dia. Uma vez abençoados, o feiticeiro ou seu aliado podem tratar toda escuridão como luz do dia ao fazer testes de Prontidão baseados na visão.]==] },
				["1. Sprint"] = { pt = [==[M20 Sorcerer, pág. 22


1. Sprint


Às vezes, um mago precisa percorrer uma distância curta rapidamente. Embora os preparativos variem, principalmente conforme a Prática e a Habilidade, este ritual sempre termina com o amarrar de um par de tênis azuis. Uma vez calçados, o mago pode correr mais rápido que qualquer humano mundano, desde que ninguém o veja fazê-lo. Cada sucesso no ritual dobra a velocidade de corrida e concede um minuto de corrida. Ao final, o ritual deixa o mago exausto, e ele precisa descansar por cinco minutos.]==] },
				["1. Symbol Interpretation"] = { pt = [==[M20 Sorcerer, pág. 43


1. Symbol Interpretation


Na pressa de controlar os sonhos alheios, muitos oniromantes esquecem até o significado do nome de seu Caminho. Embora nenhum esqueça que oneiros significa sonho, eles acham que “mancia” se refere simplesmente a magia, em vez de derivar de manteia, ou adivinhação. Um movimento crescente entre os oniromantes de várias Confrarias — encabeçado pelo Prof. Jeremiah Marquette, especializado em usar sonhos para acessar memórias bloqueadas ou esquecidas — vem resgatando informações perdidas ao reunir aspectos do Caminho esquecidos por muitos praticantes. Ele popularizou um novo ritual que permite ao oniromante encontrar a resposta de qualquer pergunta de sim ou não cuja resposta o sonhador já tenha conhecido, lendo os símbolos de seus sonhos. O mago precisa ter em sua posse algo pertencente ao alvo. Em seguida, precisa obter sucesso em um teste de Caminho e passar a noite observando os sonhos do alvo com uma pergunta específica de sim ou não em mente. Ao final, deve fazer um teste de Inteligência + Enigmas ou Inteligência + Esotérica (Interpretação de Sonhos). Se tiver sucesso, encontra a resposta à sua pergunta nos sonhos do alvo.]==] },
				["2. Bedtime Story"] = { pt = [==[M20 Sorcerer, pág. 43


2. Bedtime Story


O momento mais perigoso para um oniromante é aquele primeiro passo dentro de um sonho. A narrativa do sonho está em vigor, e ele é adaptado à força a ela, às vezes se perdendo nela. Oniromantes empreendedores desenvolveram um ritual para tomar o controle do sonho enquanto ele se forma, mitigando o risco de perdê-lo. Este ritual precisa ser concluído no momento em que o sujeito adormece e exige que o oniromante esteja no mesmo aposento que ele. Em compensação, um único sucesso permite que o oniromante dirija o sonho em formação, guiando amplamente sua narrativa e seus temas.]==] },
				["2. Cruel Whispers"] = { pt = [==[M20 Sorcerer, pág. 36


2. Cruel Whispers


Ilusionistas precisam ser, com frequência, mestres da guerra psicológica. Eles não conseguem criar nada verdadeiramente real, então jogam com os medos e as ansiedades de seus alvos para controlá-los. Um dos rituais centrais para isso é Cruel Whispers. Uma ilusão puramente auditiva, Cruel Whispers segue seu alvo por vinte e quatro horas. Embora o mago talvez nunca saiba o que os sussurros dizem, a vítima ouve vozes, quase inaudíveis, apontando cada defeito, cada insegurança e cada passo em falso que ela dá ao longo do dia. Isso a distrai, dando +1 de dificuldade a todos os seus testes durante o dia, e sempre que ela obtiver um desastre precisa fazer um teste de Força-de-Vontade (dificuldade 6) ou sofrer os efeitos do Defeito Depressão Crônica (BoS p. 51) por uma semana.]==] },
				["2. Enhance Craftsmanship"] = { pt = [==[M20 Sorcerer, pág. 29


2. Enhance Craftsmanship


Às vezes, em vez de um item mágico, o que um mago precisa é de um objeto comum, mas perfeitamente confeccionado. Este ritual cria lâminas inquebráveis, suéteres que não desfiam e objetos semelhantes cujo único aprimoramento está na qualidade extrema de sua confecção. Esses objetos não podem, contudo, receber encantamentos adicionais. Itens aprimorados não são mágicos, mas um Encantador ou Alquimista pode fazer um teste de Percepção + Ocultismo (dificuldade 6) para reconhecer que foram criados desta maneira. Este ritual precisa ser conjurado durante a criação do objeto, ou leva de 15 a 20 minutos depois do fato, e não custa Força-de-Vontade.]==] },
				["2. Fire's Weal"] = { pt = [==[M20 Sorcerer, pág. 34


2. Fire's Weal


O fogo é um dos perigos mais graves do Mundo das Trevas; mesmo chamas naturais podem facilmente causar dano permanente a seres sobrenaturais poderosos. Com este ritual, o mago pode conceder proteção contra fogo de todo tipo. Com dois sucessos, o ritual permite que o alvo absorva dano de fogo, mesmo de chamas sobrenaturais, como se fosse contundente, independentemente do dano que ele cause. Sucessos além de dois reduzem a dificuldade dos testes de absorção contra fogo (até um modificador máximo de –3), de modo que quatro sucessos no total resultam em absorver dano de fogo com –2 de dificuldade.]==] },
				["2. Hellblade"] = { pt = [==[M20 Sorcerer, pág. 34


2. Hellblade


Um ritual espalhafatoso, Hellblade sintoniza uma arma, tradicionalmente uma espada, ao Caminho do Fogo do Inferno. Uma vez sintonizada, o mago pode gastar um ponto de Força-de-Vontade para envolver a arma em chamas. As chamas fazem a arma infligir dois dados adicionais de dano e convertem seu dano em agravado. Isso dura uma cena, embora o ritual termine se a arma deixar a mão do conjurador. Este ritual exige um mínimo de dois sucessos.]==] },
				["2. Jolt"] = { pt = [==[M20 Sorcerer, pág. 33


2. Jolt


O feiticeiro gasta um ponto de Força-de-Vontade e desperta magicamente uma pessoa que esteja dormindo, inconsciente ou em coma. Isso normalmente exige um sucesso, mas exige o Índice de Toxina em sucessos para despertar alguém drogado, e quatro sucessos para despertar quem está em coma.

Reverter um efeito mágico exige sucessos iguais aos do efeito original +1. Este poder não cura a doença, o ferimento ou o envenenamento subjacente, e o paciente cai inconsciente de novo ao final da cena se o curandeiro não resolver a causa. Isso pode ser usado para ajudar a identificar o paciente e reunir informações sobre quem ou o que o deixou naquele estado.]==] },
				["2. Object Permanence"] = { pt = [==[M20 Sorcerer, pág. 21


2. Object Permanence


Magos estáticos naturalmente têm mais facilidade em invocar alvos com os quais têm uma ligação forte, como um animal de estimação querido ou a faca ritual que o mentor lhes deu. Com Object Permanence, o mago estático força uma conexão sobrenatural com objetos para invocá-los no futuro. Isso trata o alvo como “bem conhecido do feiticeiro”, mesmo que o feiticeiro o tenha achado numa lixeira uma hora atrás. O feiticeiro medita a até 10 pés do alvo e gasta um ponto de Força-de-Vontade. Cada sucesso representa um dia em que o alvo mantém a conexão sobrenatural com o feiticeiro. Um mago estático pode manter, ao mesmo tempo, no máximo tantos alvos vinculados desta forma quantos forem seus pontos em Conjuration.]==] },
				["2. Quintessence Infusion"] = { pt = [==[M20 Sorcerer, pág. 45


2. Quintessence Infusion


A capacidade de armazenar e redirecionar Quintessência é útil quase diariamente para o feiticeiro que vive em movimento. Pensando à frente, o feiticeiro se prepara para situações em que pode começar a ficar sem Quintessência disponível infundindo bebidas ou lanches com as próprias reservas para uso posterior. Classicamente, isso era uma poção de grande poder. Nas noites modernas, o feiticeiro esperto pode achar que o espresso enlatado ou a barra de proteína são igualmente práticos, servindo como o consumível discreto perfeito. A única desvantagem desta tarefa é o combustível e o recurso do ritual. Para cada ponto de Quintessência armazenado, outro ponto de Quintessência precisa ser canalizado para infundir o receptáculo.]==] },
				["2. Rest in Peace"] = { pt = [==[M20 Sorcerer, pág. 38


2. Rest in Peace


Ao invocar uma tempestade vinda do submundo, o mago pode colocar os fantasmas próximos em estado de Slumber (Sono). O Slumber é semelhante, em muitos aspectos, ao sono dos vivos. É restaurador para a forma efêmera do fantasma e repousante para sua mente e sua personalidade. Durante o Slumber, o fantasma perde a consciência do que o cerca e passa a ter sonhos vívidos. Normalmente esses sonhos são vibrantes e coloridos, centrados nas Paixões do fantasma, mas com uma escuridão sobreposta a eles por causa da Sombra. O Slumber criado por este ritual traz sonhos melhores e mais tranquilos. A influência da Sombra sobre eles é reduzida a nada, e até Espectros se veem tendo sonhos positivos pela primeira vez desde que sucumbiram às suas Sombras. Um único sucesso sempre coloca um alvo voluntário em Slumber, mas alvos involuntários (como a maioria dos Espectros) testam Força-de-Vontade (dificuldade 6) e precisam obter mais sucessos que o ritual para permanecerem acordados.]==] },
				["2. Step on a Crack"] = { pt = [==[M20 Sorcerer, pág. 31


2. Step on a Crack


Uma cantiga comum entre crianças diz: “Se você pisar numa rachadura, quebra as costas da sua mãe”. É apenas a versão infantil de uma crença antiga de que tocar rachaduras traz infortúnio. Essa crença se torna manifesta neste ritual. Ao contrário da maioria das maldições, o mago precisa informar o alvo da maldição para que ela tenha efeito, e a maldição não ocorre automaticamente. Em vez disso, a vítima pode tentar escapar dela não tocando em rachaduras. Isso, é claro, acaba se provando impossível, disparando uma maldição que traz algum dano não fatal, mas potencialmente permanente, à vítima ou a seus entes queridos. Se ela conseguir desfazer (ver p. 15) essa maldição antes de pisar numa rachadura, faz isso com –2 de dificuldade. Porém, uma vez disparada a maldição, qualquer tentativa de livrar a vítima dela é feita com +2 de dificuldade, já que as ações dela foram a causa direta de seu infortúnio, por mais injusto que isso seja.]==] },
				["2. Teleport Ward"] = { pt = [==[M20 Sorcerer, pág. 22


2. Teleport Ward


Magos estáticos que estudam o Caminho do Transporte rapidamente aprendem a se defender dele. Ao demarcar um cômodo ou edifício de maneira apropriada — um círculo de giz, sigilos nas paredes ou projetores de campo antiteletransporte, etc. — eles podem dificultar que outros magos estáticos usem o Caminho para entrar na área. Depois que o ritual é fixado, cada sucesso precisa ser superado por um conjurador que tente entrar na área delimitada. Essa proteção se degrada a uma taxa de um sucesso por mês, mas um único sucesso em outro teste de ritual a restaura.]==] },
				["3. Always Armed"] = { pt = [==[M20 Sorcerer, pág. 21


3. Always Armed


O feiticeiro não precisa parecer armado para ter uma arma à mão. Pela natureza deste ritual, ele quase sempre é deixado pendurado antes de o feiticeiro entrar numa situação potencialmente perigosa. Se precisar acessar a arma, o feiticeiro completa o ritual enfiando a mão no sobretudo ou em uma sombra conveniente para invocá-la. Tradicionalmente, feiticeiros usavam este ritual para conjurar espadas, mas nos tempos modernos é mais comum que invoquem uma espingarda ou um rifle. A arma invocada não pode ser maior que uma espingarda ou uma espada longa.]==] },
				["3. Bashert"] = { pt = [==[M20 Sorcerer, pág. 32


3. Bashert


Embora este ritual existisse na Antiguidade de uma forma ou de outra, foi popularizado em sua forma atual por Anne Richard e Judith Marquette. O destino pode ser volúvel, mas alguns pares são quase impossíveis de manter separados. Com um único sucesso, o alvo deste ritual está praticamente garantido a encontrar um par perfeito, alguém com potencial para ser seu Amor Verdadeiro (conforme a Qualidade em Book of Secrets p. 59), dentro de um ano. Cada sucesso adicional divide o tempo: dois sucessos os aproximam em seis meses, três reduzem a espera para quatro meses, e assim por diante.]==] },
				["3. Belle/Beau/Bright of the Ball"] = { pt = [==[M20 Sorcerer, pág. 30


3. Belle/Beau/Bright of the Ball


Sabendo de um evento social próximo e com o preparo adequado, um feiticeiro pode se tornar a grande sensação. Com um convite em mãos, destinado a ele ou não, o mago infunde sua presença no encontro que se aproxima. Durante toda a festa especificada, ele recebe tratamento VIP de todos os presentes e de toda a equipe contratada. Os organizadores dão sua bênção e oferecem um caloroso “tenha uma ótima noite” sem questionar a lista de convidados.]==] },
				["3. Calm Above, Hell Below"] = { pt = [==[M20 Sorcerer, pág. 39


3. Calm Above, Hell Below


As magias do Caminho dos Maelstroms geralmente trazem a energia da Tempestade do Submundo para o mundo físico. Isso cria as tormentas acima e acalma o que está abaixo. Este ritual inverte isso. Só pode ser realizado durante uma tempestade e, ao ser concluído, qualquer tempestade normal na área se dissipa. Eventos climáticos extremos são em grande parte inalterados e podem ser usados para realizar este ritual várias vezes, chegando a reduzir a dificuldade em um. Ainda assim, raramente é boa ideia ficar do lado de fora num furacão por várias horas. A energia da tempestade enfurece os fantasmas da área. Com um único sucesso, eles precisam fazer testes de Força-de-Vontade (dificuldade 6), ou começam a atacar uns aos outros e até os vivos, se tiverem poder para tanto. Se o conjurador obtiver cinco ou mais sucessos, isso cria adicionalmente um Maelstrom, fazendo com que a maioria dos fantasmas tente fugir da área, antes de serem atacados pelos espectros que tais perturbações inevitavelmente atraem.]==] },
				["3. Get Me the Heck Outta Here!"] = { pt = [==[M20 Sorcerer, pág. 22


3. Get Me the Heck Outta Here!


Uma das ferramentas mais úteis que um mago pode ter no bolso é uma rota de fuga para quando as coisas dão errado. Este ritual traz o mago instantaneamente de volta a um local de origem preparado de antemão, dentro de um raio de 50 milhas dele. Exige ao menos quatro sucessos para ser conjurado, embora sucessos adicionais acrescentem 20 milhas cada ao alcance do ritual. Um teste adicional ao conjurar o ritual permite que o mago retorne a um local secundário, caso sua origem dedicada esteja longe demais. Este ritual é quase sempre conjurado como um ritual pendurado.]==] },
				["3. Grip of Shades"] = { pt = [==[M20 Sorcerer, pág. 47


3. Grip of Shades


Dentro de cada fenda esconde-se uma pequena sombra. Dentro de cada sombra esconde-se um aliado do feiticeiro do Caminho das Sombras. É o acesso a esses aliados que dá ao feiticeiro uma vantagem que poucos conseguiriam antecipar. Ao endurecer a substância sombria contida nas sombras sobre seu corpo, o feiticeiro garante a si mesmo uma medida de proteção contra impactos e vantagem no combate corpo a corpo. Por 24 horas após banhar-se em óleos infundidos com carvão, o feiticeiro tem armadura de índice 2 ao absorver dano contundente ou letal e soma dois a todas as reservas de dados de Briga e Artes Marciais que envolvam agarrões.]==] },
				["3. Hard-Light Constructs"] = { pt = [==[M20 Sorcerer, pág. 37


3. Hard-Light Constructs


Um ritual popular entre os tecnofeiticeiros, os Hard-Light Constructs são ilusões que todos os envolvidos sabem serem falsas. Isso cria cenários, mobília, etc., que parecem e são sentidos como reais, embora colocar seu peso sobre eles não seja a melhor das ideias. É frequentemente usado para simular imagens em que nem todo detalhe é necessário, mas que tenham partes móveis. Cria a ilusão para todos os observadores, em vez de para um conjunto fixo de alvos. Ao menos um Cidadão Extraordinário já foi repreendido por usar Hard-Light Constructs para conduzir sua mesa de World of Shadows.]==] },
				["3. Invade Demesne"] = { pt = [==[M20 Sorcerer, pág. 43


3. Invade Demesne


Normalmente, o espaço criado pelo Antecedente Demesne é inviolável. Apenas magos poderosos, capazes de encontrá-lo por viagem astral, conseguem alcançá-lo. Oniromantes, porém, têm truques que poucos conseguem reproduzir. Este ritual permite que o oniromante entre no Demesne de seu alvo. Uma vez lá, ele pode tentar tomar o controle, embora isso exija um teste de Caminho com dificuldade 9, resistido pelo dono do Demesne com um teste de Raciocínio + Demesne (dificuldade 6). Isso é altamente arriscado, e apenas os oniromantes mais bem preparados deveriam tentar.]==] },
				["3. Mike's Cure-All"] = { pt = [==[M20 Sorcerer, pág. 33


3. Mike's Cure-All


Embora rituais semelhantes fossem realizados havia séculos, ou mais, esta versão foi registrada pela primeira vez em Chicago durante a Lei Seca e foi baseada nos Cure-Alls da era vitoriana. O curandeiro pode forçar o corpo do paciente a expelir todas as drogas e toxinas por qualquer, e às vezes por todas, as saídas possíveis. Isso inclui vômito, suor, lágrimas, diarreia, etc. O processo é incrivelmente desagradável, mas pode salvar uma vítima de envenenamento ou alguém em overdose. O feiticeiro precisa obter ao menos tantos sucessos quanto o Índice de Toxina da toxina mais potente no organismo do paciente. Nenhum dano é curado, mas o paciente não sofre mais nenhum efeito nocivo. Isso também pode expelir poções mágicas.]==] },
				["3. Purification of the Inferno"] = { pt = [==[M20 Sorcerer, pág. 35


3. Purification of the Inferno


Depois de um encontro infeliz com um vampiro, Charles Moran desenvolveu este ritual para se proteger no futuro. Infelizmente, este ritual não distingue amigo de inimigo, o que o torna extremamente arriscado de conjurar quando o mago pode estar em espaço apertado com outras pessoas, como num elevador. Purification of the Inferno funciona como um dispositivo defensivo de segurança. A primeira pessoa a tocar o mago depois do ritual imediatamente irrompe em chamas, sofrendo quatro dados de dano agravado. As chamas então se tornam inteiramente mundanas, causando três de dano letal por turno, que pode ser absorvido com dificuldade 8 até que sejam apagadas. O ritual exige três sucessos na conjuração.]==] },
				["3. Shape Quintessence"] = { pt = [==[M20 Sorcerer, pág. 45


3. Shape Quintessence


Seguindo diagramas elaborados ou práticas alinhadas ao seu estilo, o feiticeiro pode manipular o fluxo de Quintessência dentro de uma área. Uma casa de jogos poderia ficar mais sortuda para a banca, ou um pronto-socorro particularmente respeitado poderia sofrer taxas de mortalidade mais altas apesar dos melhores esforços da equipe, simplesmente pela manipulação das linhas de força sob a superfície. As energias acabam retornando ao seu padrão original, pois o ritual as mantém em estado elástico apenas por certo tempo. Com manutenção adequada e observação contínua, um local pode assumir os novos aspectos permanentemente.]==] },
				["3. Shitstorm"] = { pt = [==[M20 Sorcerer, pág. 21


3. Shitstorm


O mago estático envolve a si mesmo e aos companheiros a até 25 pés dele com uma casca giratória de pequenos objetos inanimados. Isso adiciona +1 de dificuldade para acertar qualquer um coberto pelo efeito com um ataque à distância a cada 2 sucessos de ativação. Além disso, qualquer um que tente combate corpo a corpo contra os afetados pelo ritual precisa absorver [sucessos de ativação] de dano. Isso normalmente é contundente, a menos que o feiticeiro estivesse num cômodo cheio de cacos de vidro, facas pequenas ou outros objetos cortantes, caso em que o dano é letal. O feiticeiro não precisa mirar em nenhum inimigo em particular para que isso ocorra. Qualquer um, amigo ou inimigo, que chegue perto demais dos destroços voadores é atingido e precisa absorver o dano.]==] },
				["3. Shroud Bubble"] = { pt = [==[M20 Sorcerer, pág. 41


3. Shroud Bubble


Às vezes, quando tudo o mais falha, a melhor coisa que um mago pode fazer diante de uma assombração problemática é se esconder e esperar passar. O problema é que fantasmas têm a péssima tendência de atravessar paredes e a maioria das outras barreiras protetoras. Também costumam ser implacáveis, muitas vezes obcecados quando fixam a mente numa tarefa. Magos desesperados, perseguidos por fantasmas perseverantes, inventaram o conceito do Shroud Bubble para se protegerem, especialmente enquanto esperam reforços chegarem para lidar com o fantasma de forma mais direta. O ritual exige três sucessos e eleva a Mortalha (Shroud) para 10 nas proximidades do mago. Na verdade, o índice da Mortalha aumenta numa esfera grande o bastante apenas para contê-lo. O efeito permanece estacionário, de modo que o mago não pode deixar a área sem aumentar seu risco diante dos fantasmas, e dura 8 horas.]==] },
				["3. Shut It Down"] = { pt = [==[M20 Sorcerer, pág. 41


3. Shut It Down


Assombrações variam em escala. Para as confinadas a um ou dois cômodos, é bem simples desligar os poderes que os fantasmas usam para interagir com o mundo físico. Mais frequentemente, porém, há um edifício inteiro ou uma área maior sendo assombrada e, se o fantasma for barrado em um cômodo, ele simplesmente vai para outro. Com Shut It Down, uma área muito maior que o normal pode ser silenciada, de modo que poderes fantasmagóricos se tornem impossíveis de usar. O mago precisa marcar os cantos do edifício ou da área, que pode ser tão grande quanto um quarteirão inteiro de terreno vazio ou um único edifício. O ritual exige ao menos 3 sucessos, e os fantasmas dentro dela só podem usar seus poderes se tiverem sucesso num teste de Força-de-Vontade com dificuldade 8.]==] },
				["3. Wrapped in a Shroud"] = { pt = [==[M20 Sorcerer, pág. 40


3. Wrapped in a Shroud


A Mortalha (Shroud) separa o mundo dos vivos do mundo dos mortos. Pode ser difícil cruzar essa barreira, fato que protege tanto os vivos quanto os mortos uns dos outros. Normalmente, ou um necromante precisa alcançar a terra dos mortos a partir da terra dos vivos, ou um fantasma precisa ter cruzado para realizar algo entre os vivos, para que possam interagir. Por um minuto para cada sucesso neste ritual, o necromante consegue de fato ficar entre os mundos, capaz de interagir diretamente com ambos sem mais nenhuma magia. Tanto seres humanos quanto fantasmas podem interagir livremente com o mago, para o bem ou para o mal.]==] },
				["4. Doxxing"] = { pt = [==[M20 Sorcerer, pág. 42


4. Doxxing


Ao ler as correntes geradas por um fantasma e por seus movimentos, o mago pode extrair informações dele. Cada informação tem um custo e precisa ser declarada e paga antes da conjuração. Quaisquer recursos gastos desta forma não são devolvidos se o ritual falhar. Nenhuma informação é obtida se o ritual não alcançar o número de sucessos exigido pela informação buscada:

• Identificar uma Paixão — Um sucesso cada. Isso identifica tanto a Paixão quanto a emoção à qual ela está ligada.

• Natureza, Comportamento e Arquétipo da Sombra — Um sucesso e um ponto de Força-de-Vontade cada.

• Identificar um Grilhão — Bem mais difícil, isso exige dois sucessos e um ponto de Força-de-Vontade.

• O Nome Verdadeiro do fantasma — Isso exige cinco sucessos e dois pontos de Força-de-Vontade.]==] },
				["4. Dream Scream"] = { pt = [==[M20 Sorcerer, pág. 43


4. Dream Scream


Embora oniromantes poderosos possam simplesmente enviar sonhos às pessoas como magias, com este ritual eles podem enviar uma mensagem a várias pessoas de uma só vez através dos sonhos delas. O mago escolhe uma mensagem composta por uma única frase, fixa-a na mente e realiza o ritual. Ao concluí-lo, pode enviar a mensagem a uma pessoa por sucesso dentro de um raio de 10 milhas.]==] },
				["4. Extraction"] = { pt = [==[M20 Sorcerer, pág. 22


4. Extraction


Outro ritual comumente deixado pendurado “por precaução”, Extraction permite que o feiticeiro retire do combate companheiros caídos ou encurralados e os leve para um lugar seguro. O feiticeiro primeiro sai do alcance do combate, tipicamente para trás de uma cobertura, e puxa seus companheiros para fora de uma sombra. Não há aumento de dificuldade nem penalidade de sucessos se os companheiros não estiverem resistindo e não forem alvo imediato — o caos do combate pode disfarçar o uso deste ritual. Uma vez que o feiticeiro e seus companheiros estejam fora de alcance, eles não são mais considerados em combate, a menos que um combatente os encontre e ataque. Este ritual poderoso pode funcionar com até 10 companheiros, que o feiticeiro precisa definir ao realizar o ritual pela primeira vez.]==] },
				["4. Fix the True Form"] = { pt = [==[M20 Sorcerer, pág. 47


4. Fix the True Form


Metamorfos frequentemente se veem em conflito uns com os outros. Também esbarram em coisas mais estranhas, com múltiplas formas. Fix the True Form foi desenvolvido por alguém que alegava descender de lobisomens. Ele força qualquer um que seja seu alvo a assumir sua “verdadeira” forma, caso falhe num teste de Força-de-Vontade (dificuldade 8). Magos simplesmente revertem à sua forma natural, assim como a maioria dos outros metamorfos. Ironicamente, apesar de ter sido criado em parte para forçar lobisomens a assumir sua forma humana ou lupina, este ritual força Garou e Fera a assumirem suas formas intermediárias, muitas vezes com consequências terríveis para um mago estático excessivamente confiante.]==] },
				["4. Forced Medium"] = { pt = [==[M20 Sorcerer, pág. 40


4. Forced Medium


Algumas pessoas são naturalmente mais fáceis de serem possuídas por fantasmas. Esses médiuns podem ver isso como um dom ou uma maldição, mas isso os distingue. São as pessoas que lidam com os mundos espirituais, e a quem os fantasmas procuram para pedir a solução de um problema ou para tomar seu corpo e obrigá-las a resolvê-lo. Este ritual concede ao alvo a Qualidade Medium (BoS p. 69) por uma semana, junto de –2 de dificuldade nas tentativas de fantasmas de possuí-lo.]==] },
				["4. Freudian Slip"] = { pt = [==[M20 Sorcerer, pág. 32


4. Freudian Slip


Dizer o que se pensa na hora errada pode ser um suicídio social. Pode acabar com amizades, destruir carreiras e criar ódios para a vida toda, com outras consequências mais adiante. Magos que estudam o Caminho da Fortuna refinaram este ritual para tirar proveito desse conhecimento. Freudian Slip amaldiçoa a vítima a dizer a pior coisa possível em que ela realmente acredita, em seu próximo evento ou encontro social importante. Isso pode incluir discursos políticos, entrevistas de emprego, encontros amorosos, eventos de família e mais. Seja qual for o contexto, na próxima vez em que ela estiver tentando ocultar seus verdadeiros sentimentos numa situação em que revelá-los causaria dano significativo e duradouro, precisa fazer um teste de Força-de-Vontade (dificuldade 8) para não simplesmente deixá-los escapar. Se ela evitar eventos sociais importantes por um ano e um dia, a maldição se esvai e a deixa em paz.]==] },
				["4. Humor Alignment"] = { pt = [==[M20 Sorcerer, pág. 33


4. Humor Alignment


Este é um ritual antigo para curar condições crônicas e congênitas. Remonta à Idade Média, quando a teoria dos humores estava em voga. O curandeiro sangra o paciente com sanguessugas, uma faca ritual ou outro instrumento adequado à sua Prática, o que causa um nível de dano letal. O curandeiro gasta um ponto de Força-de-Vontade e precisa obter ao menos 5 sucessos. Ele pode realizar este ritual como uma ação estendida. O paciente descansa por três dias, ao fim dos quais o dano letal e a condição estão curados. Esse repouso não precisa ser apenas sono. O paciente pode se mover minimamente para realizar funções corporais básicas, mas fora isso deve permanecer deitado. Se o paciente for ativo demais durante os três dias, o ritual falha automaticamente. O ritual também falha se o paciente sofrer estresse mental ou emocional significativo, como tentar trabalhar da cama ou ter uma discussão acalorada.]==] },
				["4. Information Superhighway"] = { pt = [==[M20 Sorcerer, pág. 23


4. Information Superhighway


Para magos de base tecnológica, existe um meio de transporte incomum, muitas vezes ignorado pelos místicos. É mais difícil de acessar que os outros, mas às vezes alcança lugares que o Caminho do Transporte normalmente não alcança. Este ritual permite que o conjurador viaje de qualquer tomada elétrica para qualquer outra, convertendo o mago em eletricidade. O alcance é limitado a 5 milhas por sucesso. A viagem leva um minuto a cada 5 milhas. Contudo, o arquetípico cômodo lacrado que o Caminho do Transporte não acessa normalmente não está isolado da eletricidade: se existe uma tomada, o mago consegue chegar até ela.]==] },
				["4. Instant Feast"] = { pt = [==[M20 Sorcerer, pág. 37


4. Instant Feast


Comida ilusória é enganosamente difícil de criar. Sabor, cheiro, imagem e textura precisam estar exatamente certos para enganar alguém e fazê-lo pensar que está comendo uma refeição de verdade. O alvo faz um teste de Percepção + Prontidão (dificuldade 7). Se falhar, acredita estar comendo comida de verdade durante toda a refeição — qualquer comida que o mago consiga imaginar. Ainda assim, continua com fome. Isso não fornece nenhum sustento (a menos que a ilusão esteja encobrindo alguma outra comida), embora, se seis ou mais sucessos forem obtidos na conjuração, os sinais de fome sejam suprimidos por um número de horas igual ao Vigor do alvo, antes que ele volte a sentir fome. Isso não pode aliviar os efeitos da inanição.]==] },
				["4. Love Potion Number 9"] = { pt = [==[M20 Sorcerer, pág. 30


4. Love Potion Number 9


Apesar de sua natureza clássica e icônica, o uso da “poção do amor” caiu em desuso por razões óbvias. À medida que as sociedades passaram a insistir mais na importância do consentimento, os feiticeiros tiveram menos motivos para gastar o tempo e os recursos exigidos por este ritual. Os que ainda se dispõem a preparar a potente mistura de amor e lealdade o fazem com hesitação e cobram um preço alto.

Uma mecha de cabelo, uma dracma de sangue ou um objeto pessoal de valor sentimental é necessário para criar a conexão certa com o coração em questão. Quando realizado para outra pessoa que não o próprio feiticeiro, normalmente também se exige alguma parte do cliente. Em algumas Práticas, o ritual assume a forma da poção tradicional; em outras, é uma espécie de vínculo ritualizado feito com um cordão de nós. Em todos os casos, a vítima é atada ao ponto de ancoragem do feiticeiro ou de seu cliente.

Uma vez realizado, a vítima se vê inquieta e enjoada. A náusea persistente desaparece quando a âncora está por perto, ou quando ela realiza uma tarefa que sabe que agradaria à âncora.]==] },
				["5. Generational Wealth"] = { pt = [==[M20 Sorcerer, pág. 32


5. Generational Wealth


Só existem tantas maneiras de ficar rico o bastante para que a riqueza dure gerações. Fora a sorte pura, todas elas exigem um sacrifício substancial. Para a maioria, esse sacrifício é suportado por outros, por meio de práticas trabalhistas exploratórias ou de empreendimentos criminosos. De fato, dada a natureza volúvel da sorte, a exploração sempre foi o caminho mais fácil e mais confiável para a riqueza. Este ritual permite que a sorte seja domada e garantida. Ele ainda exige um sacrifício; afinal, nada vem de graça. Mas, em vez de sacrificar outros, aproveitando-se do desespero alheio, o pai ou a mãe que busca segurança para a família sacrifica voluntariamente a si mesmo. Embora o sacrifício precise ser voluntário, poucos magos se dispõem a realizar este ritual. Os que se dispõem precisam realizar o sacrifício de alguma forma apropriada à sua Prática. Os beneficiários do sacrifício se veem subitamente com sorte extrema, capazes de ganhar dinheiro suficiente no jogo para que eles, seus filhos e os filhos de seus filhos nunca mais precisem trabalhar um único dia na vida. Mesmo que de algum modo consigam esbanjar essa vasta fortuna, a geração seguinte será igualmente sortuda e a recuperará. A bênção dura sete gerações, após as quais os descendentes ficam por conta própria.]==] },
				["5. Megafauna Transformation"] = { pt = [==[M20 Sorcerer, pág. 48


5. Megafauna Transformation


O Caminho da Metamorfose permite que o conjurador assuma formas animais, incluindo transformações parciais. Mas, no fim das contas, o conjurador normalmente só consegue se transformar por completo em um animal normal. Este ritual permite que ele se torne uma versão gigantesca do animal em que quiser se transformar. Na maioria dos casos, isso é um retorno completo a uma versão extinta do animal, como o megatério (preguiça-gigante) das Américas. Isso exige ao menos cinco sucessos.]==] },
				["5. Oubliette"] = { pt = [==[M20 Sorcerer, pág. 37


5. Oubliette


Um dos rituais mais aterrorizantes do Caminho da Ilusão, Oubliette já quebrou algumas das pessoas mais fortes do mundo. O mago precisa permanecer a poucos passos de seu alvo durante todo um ritual de três horas, que exige ao menos 5 sucessos. Se conseguir, o ritual retira todos os cinco sentidos da vítima. Ela fica presa num mundo sem qualquer sensação até que o mago a liberte ou até que ela acumule 5 sucessos em testes de Percepção com dificuldade 9, fazendo um a cada hora. A vítima precisa recomeçar do zero em caso de desastre. Muitas vezes, as vítimas deste ritual estão sendo punidas por crimes hediondos e o recebem antes de serem lançadas num buraco e esquecidas, deixadas para morrer de fome sem sequer saber que estão morrendo de fome.]==] },
				["5. Overwrite"] = { pt = [==[M20 Sorcerer, pág. 42


5. Overwrite


A expressão máxima do Caminho da Necrônica: o praticante conclui que todos os fantasmas são sinais eletromagnéticos presos na matriz da personalidade de uma pessoa que já foi viva. Isso explica por que são tão maleáveis, para o bem ou para o mal. Com este ritual, o mago pode reescrever a natureza do fantasma em nível fundamental. Para isso, precisa saber o Nome Verdadeiro do fantasma e possuir um de seus Grilhões. O ritual leva 12 horas e exige dois testes de Vigor (dificuldade 6) para ser concluído. Durante todo esse tempo, o fantasma precisa ser mantido no mesmo cômodo que o conjurador, um espaço de mais ou menos 10 por 10 pés. Ao concluir o ritual, mudanças significativas podem ser feitas no fantasma, mas cada uma tem um custo. Por padrão elas duram um ciclo lunar, mas se tornam permanentes se os custos forem dobrados. Algumas das mudanças possíveis são:

• 1 sucesso e 1 ponto de Força-de-Vontade por nível para mudar Paixões, e um ponto adicional de Força-de-Vontade para mudar para uma emoção diferente.

• 2 sucessos e 1 nível de Vitalidade — não é dano, o próprio nível de Vitalidade desaparece pela duração — para adicionar ou remover um ponto de Angústia.

• 5 sucessos e 5 pontos de Força-de-Vontade para sobrescrever o fantasma por completo com outra personalidade específica.]==] },
				["5. Shelter for the Dead"] = { pt = [==[M20 Sorcerer, pág. 39


5. Shelter for the Dead


Um ritual poderoso, mas útil apenas em situações específicas, Shelter for the Dead só pode ser realizado com as maiores tempestades do Submundo: os Grandes Maelstroms. Ninguém sabe como ou quando ele foi desenvolvido, mas foi usado pela primeira vez para proteger os fantasmas de Constantinopla durante o Grande Maelstrom causado pela Peste Negra. O ritual é transmitido pelos poucos que o conhecem a seus alunos, na esperança de que nunca seja necessário, mas sabendo o quanto pode ser valioso se o pior acontecer. Ao custo de arriscar uma tempestade extrema castigando as terras dos vivos, Shelter for the Dead cria uma região, não maior que um quarteirão moderno, onde o Maelstrom não pode entrar. Ou melhor: se pedaços do Grande Maelstrom entrarem, eles são imediatamente transformados em tempestades brutais, com vento extremo, granizo do tamanho de punhos e outras coisas estranhas, independentemente do clima habitual da área. O ritual exige dez sucessos, quase sempre exigindo um grupo, e dura um dia, mais um dia para cada sucesso adicional além dos dez mínimos.]==] },
				["5. Smoldering Ruin"] = { pt = [==[M20 Sorcerer, pág. 35


5. Smoldering Ruin


O alvo mais comum do Caminho do Fogo do Inferno é um inimigo individual. É magia diretamente ofensiva, e os magos sabem disso e a usam como tal. Às vezes, mirar em indivíduos, e mesmo em grupos, é pequeno demais. Às vezes o mago quer mesmo é se soltar de vez, e a magia estática não oferece muitas válvulas de escape para isso. Os mestres do Fogo do Inferno, porém, desenvolveram este ritual justamente para isso: se soltar e causar dano a todos os seus inimigos de uma vez. Smoldering Ruin exige três horas inteiras de conjuração e, em todas as suas formas, um teste de Vigor (dificuldade 6) apenas para concluir o ritual exaustivo. Uma vez concluído, o mago gasta 3 pontos de Força-de-Vontade e precisa obter ao menos 5 sucessos. Apesar da dificuldade, o sucesso vale o esforço: o ritual põe fogo em um edifício, reduzindo-o a cinzas. Nenhum esforço mundano extingue esse fogo, alimentado pelo desejo de destruição do conjurador, embora meios sobrenaturais sejam capazes de fazê-lo. Ele consegue até queimar edifícios feitos de materiais normalmente resistentes ao fogo e à prova de fogo. Vale notar que o conjurador precisa realizar o ritual dentro do edifício e depois torcer para conseguir escapar antes de ficar preso lá dentro.]==] },
				["5. Steal Life"] = { pt = [==[M20 Sorcerer, pág. 40


5. Steal Life


Uma das artes mais sombrias da Necromancia: os mestres do Caminho conseguem roubar a energia vital de outra pessoa viva. O conjurador primeiro se enche de energia mortuária, mas não a molda diretamente numa magia. Em vez disso, antes que ela absorva sua própria força vital, ele a empurra para dentro da vítima. Essa transferência leva consigo os cinco níveis de dano mais recentes que o conjurador está sofrendo. O conjurador cura esses ferimentos. A maioria das versões deste ritual envolve entalhar sigilos na vítima (ou perfurá-la com fios elétricos, ou qualquer outra técnica), causando dano adicional. Nem é preciso dizer que pouquíssimos sobrevivem a esse processo, e os que sobrevivem muitas vezes caçam o necromante até o fim de seus dias.]==] },
				["5. Teleportal"] = { pt = [==[M20 Sorcerer, pág. 23


5. Teleportal


Os mestres do Caminho do Transporte podem fazer mais do que simplesmente transportar a si mesmos e a outros de um lugar a outro. Eles podem criar portais estáveis entre dois locais. Primeiro, o mago precisa preparar os dois sítios para que o portal seja criado. Isso leva três dias de preparação em cada sítio, usando parafernália e materiais apropriados à Habilidade de Caminho do conjurador. Concluídos os preparativos apropriados, o mago faz um teste estendido, com um teste por hora. Exige ao menos um sucesso a cada 10 milhas entre os portais. Cada sucesso extra acrescenta cinco usos do portal ou uma condição em uma ou nas duas pontas, como uma restrição de quem pode usá-lo ou torná-lo de mão única. Criar este portal custa um ponto permanente de Força-de-Vontade, que não é devolvido se o portal se dissipar. Teleportal é um ritual complexo, mais bem realizado com assistentes.]==] },
				-- The twenty-six AFFILIATIONS of the Affiliation picker on the Numina tab (SPEC
				-- T929, I140i, I140m). Same reason the hedge rituals above are here and not in a
				-- module of their own: the picker hands mfOpen the 'Numina' kind, so descText
				-- already requires THIS module for them. Twenty come out of M20 Sorcerer chapter
				-- three, Lone Practitioner off the page before it, four out of Sorcerer's
				-- Companion chapter two and the Society of Leopold out of The Hunters Hunted II.
				-- Prose with no System block, like the rituals - all twenty-six are on V335c.
				["Balamo’ob"] = { pt = [==[M20 Sorcerer, pág. 81


Balamo’ob


Atributos Favorecidos: Vigor, Raciocínio

Caminhos Favorecidos: Alchemy, Healing, Shapeshifting, Summoning, Binding, and Warding

Nas selvas da Mesoamérica, os sacerdotes-guerreiros dos maias, os Balamo’ob, ainda velam por seu povo. Eles transmitem ensinamentos que já eram antigos no auge do império maia, vinculando-se ao seu wayob, um animal familiar e guia espiritual, e, por sua vez, guiando seu povo para protegê-lo dos espíritos sombrios que sobem de Xibalba, o Outro Mundo, ou, simplesmente, a Umbra. Transes visionários levam os Balamo’ob a Xibalba, onde o primeiro espírito que contatam se torna seu wayob. A Wakah-Chan, a Árvore do Mundo, separa a terra e o céu, mas também liga nosso mundo a Xibalba, venerada em símbolos e efígies feitos de corda e madeira. A seiva mágica da Árvore do Mundo é encontrada na seiva de árvores sagradas do mundo mundano, assim como em várias secreções líquidas naturais do corpo humano. O derramamento de sangue é em si um ato sagrado, especialmente quando se oferece o próprio sangue, e, embora algumas gotas bastem para as magias mais simples, as magias mais espetaculares ou urgentes exigem muito mais. Esse derramamento maior é feito perfurando o corpo com espirais de corda e dançando, lançando sangue pelo ar em sacrifício. A dança é parte inseparável da arte Balamo’ob. Em alguns festivais, os Balamo’ob assumem a aparência do wayob, vestindo mantos, peles ou trajes para emulá-los em reencenações da criação do mundo. Os talentosos o bastante assumem a forma do patrono ao fim do festival, disparando noite adentro, representação física de seu wayob e também da Árvore do Mundo, unindo carne e espírito, o celeste e o mundano.

Os Balamo’ob vêm da população local da Mesoamérica, em particular do povo maia hoje espalhado pela região. Poucos de fora — arqueólogos, antropólogos ou buscadores do oculto — foram iniciados em seus mistérios. Os Balamo’ob tiveram de manter seu conhecimento em segredo diante da opressão ao longo dos séculos. Os ensinamentos são transmitidos oralmente em mestizo, um dialeto de espanhol e maia. Embora a língua em si não seja sagrada, algumas coisas podem se perder na tradução. Junto dos estudos linguísticos, o iniciado precisa aprender a cosmologia e a simbologia maias para compreender a magia Balamo’ob. Depois disso, quando o ancião o julga pronto, o iniciado realiza seu primeiro transe visionário. Esse transe permite que o aspirante viaje até Xibalba em forma onírica. A grande Serpente da Visão o guia pelos ritos secretos finais, quando o Balamo’ob encontra seu wayob, um espírito animal em forma de jaguar, cobra, águia ou outro animal, mesmo mítico. Desse dia em diante, seu estudo é só seu. O Balamo’ob ganha sabedoria pela experiência, aprendendo com outros anciãos e viajando a Xibalba com seu wayob.

Os xamãs, itzamna, dos Balamo’ob não adotam nenhuma organização formal, mas se estabelecem em territórios pessoais por toda a Mesoamérica, pois os espíritos preferem permanecer nos lugares que melhor conhecem. As relações entre os xamãs são sempre pessoais, fundando alianças para resolver problemas e rivalidades onde surgem conflitos. Não há politicagem entre eles. Como cada xamã tem suas próprias crenças e interpretações, não cabe a um julgar o outro, desde que continuem com seu trabalho. Essa abertura permite que alguns Balamo’ob se vinculem a espíritos de natureza mais sombria, o que pode levar o xamã a incursões movidas pela fúria contra forasteiros, exploradores e profanadores. Outros são atraídos por revoluções políticas ou buscam o ressurgimento do império maia.]==] },
				["Followers of Set"] = { pt = [==[Sorcerer’s Companion, pág. 14


Followers of Set


Iniciação

Os Followers of Set são conhecidos por se tratarem mais como uma seita religiosa do que como um clã e, por isso, frequentemente acolhem convertidos de outros clãs, mortais e até outros seres sobrenaturais, desde que estejam dispostos a aceitar e seguir os ensinamentos de Set. Feiticeiros, sendo mais poderosos que a maioria dos mortais e ainda mais propensos a se sentirem forasteiros num mundo incerto, são portanto tão ou mais propensos que qualquer outro a encontrar o caminho até um dos Cultos que compõem os Followers of Set, e os setitas ficam mais que felizes em atraí-los.

Há uma diferença, é claro, entre um joguete e alguém que sabe o que há por trás da cortina, tendo sido plenamente introduzido à filosofia setita e feito parte do Clã. Os primeiros são abundantes, os segundos bem mais raros, mesmo entre feiticeiros — ainda que alguns dos primeiros possam estar se aproveitando dos demais adoradores do mesmo modo que os próprios setitas fazem, ou talvez estejam apenas envolvidos no turbilhão de vícios e experiências que lhes é oferecido.

De um jeito ou de outro, os próprios Kindred setitas costumam ficar mais que satisfeitos em aproveitar os talentos únicos desses usuários de magia, pondo suas magias e rituais a serviço da coleta dos recursos e segredos que pretendem oferecer às massas doutrinadas. Os feiticeiros, por sua vez, tendem a pôr seus novos aliados para trabalhar e, de fato, mais de um Filho de Osíris (inimigo comum desses feiticeiros, como descrito em Sorcerer Revised, pág. 34) já descobriu que um feiticeiro setita rival tem alguns aliados mortos-vivos dispostos a ajudá-lo.

Organização e Estilo

Os diletantes que apenas fazem média com os Cultos setitas raramente vão longe e raramente seguem qualquer padrão reconhecível em sua magia além de uma inclinação genericamente mítica e religiosa. Já os que se veem plenamente doutrinados entre os setitas descobrem que seus focos e seu estilo passam a espelhar os ensinamentos de seu culto e do Clã como um todo. Embora as especificidades variem entre Cultos e mesmo entre indivíduos, isso normalmente significa santuários “blasfemos”, sangue, sacrifícios, orações a Set e/ou a suas máscaras (ou símbolos e representações deles), profanação de símbolos de deuses opostos a Set e, claro, serpentes, sejam representações delas ou espécimes físicos de verdade.

Embora os “diletantes” possam acabar servindo como carniçais dos setitas, é na verdade muito raro que iniciados adotados sejam alimentados com Vitae, ou pelo menos não é mais comum do que seria um setita tentar criar um Vínculo de Sangue com outro.

Caminhos

Fascination, Illusion (pág. 31) e Shapeshifting, com outros dependendo do Culto de que o feiticeiro faz parte. Com permissão do Narrador, feiticeiros que tenham comprado a Qualidade Setite Initiate (Lore of the Clans, pág. 67) podem, em vez de comprar Disciplinas setitas diretamente, espelhar a Setite Sorcery apropriada ao estilo de feitiçaria de seu Culto (Akhu, Sadhana, etc.) como Caminhos de feitiçaria, substituindo os custos em Vitae por Força-de-Vontade, mas comprando-os como se fossem um nível acima do normal (assim, o primeiro ponto daquela feitiçaria é inútil, e o segundo ponto fornece o primeiro ponto do Caminho).]==] },
				["Forn Jafnaðr"] = { pt = [==[M20 Sorcerer, pág. 85


Forn Jafnaðr


Atributos Favorecidos: Destreza, Raciocínio

Caminhos Favorecidos: Divination, Enchantment, Hellfire e Summoning, Binding and Warding

Desde tempos antigos, povos da Escandinávia praticaram, principalmente mas nem sempre, uma bruxaria feminina derivada do forn seiðr, os “antigos costumes” dos nórdicos. Eles cultuam divindades de uma ou de ambas as famílias dos Æsir e dos Vanir.

Digna de nota é Freyja, a deusa Vanir da fertilidade, do amor, da guerra e da magia, que ensinou feitiçaria aos Æsir. Odin também se destaca como chefe masculino dos Æsir, associado à feitiçaria, à guerra, à sabedoria e ao alfabeto rúnico, entre outras coisas. Historicamente, os praticantes eram muito valorizados por seus poderes, mas sofreram estigma e perseguição após a cristianização da região.

Apesar da oposição, a prática nunca morreu por completo. Muitos se esconderam sob o disfarce da religião dominante para manter sua fé em segredo. Hoje em dia, é mais aceitável praticar abertamente religiões e magias pagãs, mas eles ainda sofrem retaliação preconceituosa em alguns lugares. Os praticantes são nominalmente atraídos pelos Verbena quando se envolvem na política da Guerra da Ascensão, embora muitos covens se contentem em cuidar de si mesmos e de suas comunidades. Forn Jafnaðr é uma Afiliação nova e em rápido crescimento que não escolheu nenhuma dessas opções.

Nas últimas décadas, grupos neonazistas (sob quaisquer nomes que lhes deem negação plausível suficiente para suas intenções) apropriaram-se de simbologia e de outros aspectos do forn seiðr para justificar sua intolerância. Um desses grupos, o Asatru Futhark, era um bando de perdedores nazistas que não se deram ao trabalho de checar os fatos, nomeando-se preguiçosamente a partir dos seguidores dos Æsir e do nome do alfabeto rúnico. O Asatru Futhark era um grupo de criminosos que se julgavam racialmente superiores aos outros e que, embora fossem um bando de aspirantes a feiticeiros, falharam completamente em entender que a prática de que roubaram era historicamente, e sobretudo, um ofício de mulheres, e não teria nada a ver com a merda patriarcal do Asatru Futhark. O Asatru Futhark causou destruição e morte sob o pretexto de crença religiosa até que um grupo de feiticeiros da Ordem Aeon pôs fim a eles. Isso levou os feiticeiros locais do forn seiðr a se erguerem em oposição direta àqueles que se apropriam de suas crenças para promover crimes de ódio e retórica indesculpáveis.

Membros remanescentes do Asatru Futhark tentaram ressuscitar a facção extinta várias vezes, e todas as vezes foram definitivamente esmagados pelo Forn Jafnaðr. O Forn Jafnaðr tem as mãos cheias em sua luta contra grupos neonazistas que se apropriam do nórdico, mas felizmente não estão sem aliados nem sem gente disposta a se juntar a eles. Embora façam questão pessoal de destruir os grupos neonazistas apropriadores, também não recusam ajuda oferecida, especialmente de outros feiticeiros. O Forn Jafnaðr é hoje uma Afiliação descentralizada, composta de vários covens que praticam alguma variação do forn seiðr. Estão baseados sobretudo na Escandinávia, mas vêm se espalhando por outras áreas da Europa à medida que o sentimento ganha força. Em 2019, fundaram o primeiro coven Forn Jafnaðr nos Estados Unidos.

Feiticeiros mais experientes costumam orientar individualmente membros promissores e interessados de sua fé para que aprendam sua prática mágica. O aprendiz aprende ao lado de seu mestre e auxilia no trabalho ritual do mestre e do coven, oferecendo um par extra de mãos. A aptidão para a magia é secundária à paixão e à devoção pela causa na hora de escolher iniciados. A filosofia é que a magia sempre pode ser ensinada a quem deseja aprender, mas a paixão pelos ideais é imperativa.

Na medida em que o Forn Jafnaðr se envolve na política da Guerra da Ascensão, é mais provável que formem relações de trabalho temporárias com a Aliança Díspar ou com os Verbena. Normalmente, estão ocupados demais com seu objetivo principal para se importar em combater a Tecnocracia, mas, sendo místicos, às vezes são arrastados para o conflito assim mesmo. Além de combater o fascismo direta e indiretamente, covens individuais são livres para agir de forma autônoma e adaptar melhor suas respostas às comunidades locais. Alguns covens se esforçam para viver fora da rede, como seus antepassados, mas outros acolhem a tecnologia moderna em suas vidas, se não em suas práticas mágicas. É bem mais fácil, afinal, se organizar com aliados pela internet do que por cartas manuscritas.]==] },
				["Giovanni"] = { pt = [==[Sorcerer’s Companion, pág. 15


Giovanni


Iniciação

Os Giovanni já foram Necromantes mortais, dizem muitos, e de fato a Necromancia (a versão “Magia de Sangue”) foi ela própria baseada nos preceitos da antiga feitiçaria mortal. Embora o conhecimento dessa magia costume ser mantido longe dos membros mortais das várias famílias do Clã, alguns dos que ganham uma espiada por trás da cortina encontram meios de imitar seus poderes de qualquer forma, seja por uma aproximação da Feitiçaria de Sangue que testemunham, por um vislumbre de recursos necrománticos de eras passadas ou, talvez, pela ajuda dos spiriti presos pela família, no caso dos que têm sensibilidade natural a eles.

Ainda assim, os Giovanni raramente confiam muito em magos mortais, e são ainda mais hesitantes quanto aos membros vivos de sua própria família assumirem tais poderes, a menos que sejam alguém que já vinham observando como protegido por um motivo ou outro. De modo geral, quando os anziani descobrem que há um feiticeiro na família, há duas possibilidades: o Beijo por Procuração, se você for visto como digno, ou dois metros abaixo da terra, se não for.

Organização e Estilo

Mesmo que lhe permitam continuar sua prática, o melhor que um feiticeiro entre os Giovanni pode esperar é o já mencionado Vínculo de Sangue, tornando-se carniçal de um membro talvez poderoso da Família, mas carniçal ainda assim. Mortais simplesmente não têm permissão para progredir nas fileiras; no que diz respeito à família, não passam de uma ferramenta muito útil. Ao menos até que comecem a ser considerados para o Abraço.

Dependendo da forma de Necromancia com que estão mais familiarizados, bem como da tradição do ramo exato da família de que vêm, as ferramentas e a prática podem variar. Alguns podem usar práticas vodun, outros podem seguir a parafernália do Alto Ritual, e outros que juntaram as peças por conta própria talvez precisem depender do que muitos Magos chamariam de “magia de sarjeta”.

De todo modo, todas as suas magias e rituais costumam seguir os mesmos preceitos dos Necromantes mortos-vivos: precisam incorporar um aspecto da autoridade do usuário de magia sobre os mortos (ou sobre o mundo mais amplo), o aprisionamento que é a própria morte (para que os espíritos e os mortos saibam seu lugar) e um item que identifique o alvo ou o efeito (no caso dos Wraiths, isso normalmente significa incorporar um Grilhão). Os instrumentos e focos que representam essas coisas variam tanto quanto a própria prática, e podem envolver língua e invocação, círculos e símbolos, representações de outros mundos, retratos da morte, elementos concretos da morte (como cadáveres), estados emocionais, sacrifícios ou oferendas, entre outras possibilidades.

Caminhos

Divination, Shadowcasting e Summoning/Binding/Warding (necromântico ou material). Muitos rituais de Necromancia podem ser duplicados como rituais de um dos Caminhos citados, com permissão do Narrador (por exemplo, Puppet pode virar um ritual de Summoning/Binding/Warding de nível 2).]==] },
				["Lone Practitioner"] = { pt = [==[M20 Sorcerer, pág. 79


Lone Practitioner


Embora muitos magos estáticos aprendam suas artes pela estrutura de uma Afiliação, é quase tão comum que cheguem à prática por conta própria, já que inúmeras avenidas de estudo podem levar à magia estática. Muitos dos que aprendem magia estática sozinhos preferem permanecer livres de enredamentos com outros magos. Podem formar alianças temporárias, amizades e laços românticos com outros magos, mas, quando se trata de reunir conhecimento e poder, o praticante solitário prefere a autossuficiência. Alguns praticantes solitários não se juntam a covens ou Afiliações pelo simples fato de não saberem que existem. Muitos magos estáticos, ao longo dos séculos, viveram e morreram sem nunca ter conhecido outro praticante.

Os psíquicos são ainda mais propensos à prática solitária. Muitos psíquicos não sabem que existem outros com habilidades semelhantes pelo mundo. Eles simplesmente tentam sobreviver e ganhar controle sobre o próprio poder, para não se tornarem um perigo para todos ao seu redor. Boa parte dos psíquicos evita usar seus poderes, manifestando fenômenos apenas quando o instinto ou a sobrevivência exigem. A ideia de procurar outros como eles e se juntar a um time de aberrações iguais a si tem apelo mínimo para esses psíquicos.]==] },
				["Maison Liban"] = { pt = [==[M20 Sorcerer, pág. 87


Maison Liban


Atributos Favorecidos: Inteligência, Manipulação

Caminhos Favorecidos: Fortune, Shadow, Summoning, Binding, and Warding, Quintessence Manipulation

Durante o Cisma Hermético do século XI, que resultou no nascimento do clã vampírico Tremere, Mathieu de Calice concentrou seus estudos em proteção e contramagia, decidido a se manter em segurança enquanto a Ordem começava a se despedaçar. Fugindo para território mais seguro no norte da França, de Calice e seus aprendizes se esconderam sob sua ofuscação arcana enquanto os Tremere se ocupavam com os vampiros locais. Separado da Ordem de Hermes, temendo por sua vida diante de seu antigo mentor e dos vampiros-magos recém-empoderados, o Magus de Calice trabalhou para ocultar a Casa Hermética. Ele rebatizou o grupo de “Liban” na língua visigoda, significando “viver, partir, sobreviver”. Começando apenas com os aprendizes de de Calice, depois com refugiados franceses e espanhóis, o grupo se esforçou para manter o segredo e uma aparência de normalidade. Levaria 250 anos até o fim do expurgo da Casa Tremere pela Ordem de Hermes, época em que a Maison Liban já se tornara uma sociedade própria.

Depois dos anos formativos vivendo em segredo, todos os estudantes da Maison Liban são orientados a manter uma vida dupla, para separar sua prática mágica de vidas normais e respeitáveis. Não devem revelar sua Arte a ninguém que conheçam, a menos que julguem a pessoa responsável o bastante para aprender os caminhos da Maison Liban. Isso não impede que os Liban usem magias protetoras em entes queridos e amigos. Não há grandes feitos, nenhuma exibição de poder para a Maison Liban, que segue seus estudos sob sua máscara mundana. Os estudantes aprendem como iniciados de um mestre até saberem o bastante para ensinar outros, ponto em que também são nomeados mestres, um pater ou mater. Os mais venerados da Maison Liban, em deferência à fundação, usam o honorífico Pontifex.

A Maison Liban nasceu como uma Casa Hermética. Eles mantêm o uso de selos, anéis e círculos em sua magia. Embora o latim seja usado predominantemente, ele é combinado com a língua gótica do tempo em que a sociedade viveu escondida. Essa mistura das origens herméticas com a necessidade de se esconder entre os visigodos durante o expurgo da Ordem de Hermes deu à Maison Liban um estilo de magia único, que não é facilmente copiado por outras sociedades herméticas.]==] },
				["Mogen HaLev"] = { pt = [==[M20 Sorcerer, pág. 87


Mogen HaLev


Atributos Favorecidos: Inteligência, Percepção

Caminhos Favorecidos: Divination, Ephemera (Fantasmas) e Summoning, Binding and Warding (Anjos). Caminhos Favorecidos do Auxiliar Feminino: Fortune, Healing e Weather Control

Em algumas formas do misticismo judaico, existe a crença de que há 36 justos em cada geração. Essas pessoas estão dispersas e podem vir de qualquer origem, mas, sem ao menos 36 delas vivas a qualquer momento, o mundo acabaria. É apenas pela bondade essencial desses 36 que o mundo é poupado da ruína certa. Complicando a questão, os 36 são tão humildes que não saberiam que são de fato um dos 36 justos, quanto mais contariam a alguém.

A Mogen HaLev, hebraico para “Escudo dos 36”, é uma afiliação frouxa de covens místicos judaicos ortodoxos com um propósito único: encontrar e proteger esses 36 indivíduos justos. São um grupo de eruditos homens com idades entre 45 e quase 100 anos, embora permitam que iniciados comecem o estudo já aos 40. Acreditam que estudar a magia necessária antes da maturidade convida ao desastre. A maioria dos membros está na casa dos 60. O mais velho da Mogen HaLev, chamado Baal Shem Tov (“Mestre do Bom Nome”), é reconhecido como uma espécie de líder em toda a Afiliação, embora sobretudo no sentido de buscar orientação e desempatar decisões. Uma vez que o iniciado começa o estudo, é um processo intensivo que envolve não só a magia em si, mas também filosofia e habilidades mundanas de contato com pessoas úteis, como médicos e assistentes sociais. Cada vez mais, nos últimos anos, a Mogen HaLev trabalha com covens irmãos de místicas judias que usam outros conjuntos de habilidades e Caminhos para alcançar o objetivo comum. Embora não sejam membros oficiais da facção, esses covens irmãos se concentram em magias práticas de proteção dos 36, em vez da adivinhação e dos assuntos espirituais em que os homens da Mogen HaLev se especializam.

O coven principal (embora eles não se chamassem assim) da Mogen HaLev se reúne num sobrado no Brooklyn, em Nova York, ao lado de uma yeshiva. Eles mantêm uma biblioteca ocultista e religiosa grande o bastante para emprestar textos aos outros covens da Afiliação conforme necessário. Concentram-se sobretudo em magia de adivinhação e proteção, embora também aprendam a falar com espíritos para coletar informações. Todos os membros seguem estritamente as tradições judaicas ortodoxas, incluindo restrições alimentares, cuidados com barba e cabelo e o uso da kipá, além de trabalho e doações de caridade somados ao trabalho dentro da Mogen HaLev. Cada coven cultiva conexões que ajudem a identificar e proteger os 36, de abrigos para desabrigados a profissionais de medicina.

Os motivos do grupo Mogen HaLev começam e terminam em encontrar e proteger os 36. Não têm tempo para nenhuma dessa bobagem de Guerra da Ascensão, exceto quando ela ameaça um dos 36. Não são conhecidos por guardar rancores duradouros e prefeririam cuidar de si mesmos e de seu propósito. São igualmente improváveis de formar até alianças temporárias com outras facções mágicas, a não ser num esforço para proteger os 36. Se um dos que protegem estiver em perigo, chegarão a extremos para resolver a ameaça. A exceção notável ao hábito de evitar rancores mágicos são grupos como os Nebuu-Afef e outros que tentam explicitamente o genocídio de populações judaicas. A Mogen HaLev não hesitará em defender a si mesma e suas comunidades se um desses grupos aparecer na cidade.]==] },
				["Nebuu-Afef, The Order of The Golden Fly"] = { pt = [==[M20 Sorcerer, pág. 88


Nebuu-Afef, The Order of The Golden Fly


Atributos Favorecidos: Força, Vigor

Caminhos Favorecidos: Conjuration, Hellfire, Shadowcasting, Shapeshifting

Depois do Êxodo dos israelitas do Egito, nos dias de Ramsés, o Grande, a Nebuu-Afef foi forjada nas chamas do ódio, da fúria e da dor. Após a perda de seus primogênitos e o sofrimento das pragas lançadas sobre eles pela escravização do povo hebreu pelo Egito, um grupo de soldados egípcios condecorados iniciou sua busca por vingança contra os refugiados em fuga. Agraciados com uma medalha em forma de mosca dourada como insígnia de honra, esses guerreiros já eram habilidosos com magia, mas desejavam mais: concentrar sua fúria em força destrutiva. Nomeando-se a partir dessa marca de distinção, a Ordem da Mosca Dourada passou anos em pesquisa e acúmulo de recursos. Sua devoção finalmente deu frutos com a descoberta dos nomes secretos do anjo da morte que trouxera as pragas sobre o Egito — o mesmo anjo que lhes tomara os primogênitos — e dos meios de invocar e controlar esse anjo. Por meio de ritual profano, os místicos invocaram esse anjo, Mastema, e o prenderam ao seu controle, exigindo mais conhecimento e amuletos para trazer pragas ou fazer chover fogo. A Ordem queria essas ferramentas para punir os israelitas.

O que a Ordem não percebeu em sua arrogância é que Mastema nunca esteve preso a eles; não foi contido nem controlado. Mastema havia caído, corrompido por sua destruição do Egito, descobrindo uma volúpia pela morte e pelo medo que espalhara por todo o país. Enquanto a Ordem exigia poder do anjo, Mastema lhes alimentava apenas as magias mais sombrias e destrutivas. Por mais que a Ordem se julgasse no comando, Mastema só lhes dava o que ele mesmo desejava, convertendo sua raiva e seu ódio em propósito destrutivo. Os membros originais da Nebuu-Afef nunca realizaram seus planos contra os israelitas, mas a Ordem foi fundada e continuou a atormentar o Egito por séculos. No período copta, o faraó Ikhnaton expulsou o pequeno grupo do Egito. A Ordem se mudou de região em região, mantida pequena por compartilhar o poder de um único anjo ‘preso’ para servir a todos.

Foi na Áustria, na Segunda Guerra Mundial, que a Ordem saiu da obscuridade para buscar a carnificina de seu propósito inicial. Eles procuraram membros do partido nazista, oferecendo sua assistência ao já ocultista Hitler. Isso acabou sendo a ruína da Ordem, pois, pouco depois desse contato, a casa de reuniões da Ordem explodiu, destruindo a maior parte de seus registros e matando os membros seniores da seita. O aprendiz do sacerdote da Ordem e alguns iniciados fugiram, escapando no caos.

Os remanescentes da Ordem hoje existem espalhados pelo globo em pequenas células, ligadas por comunicação pela internet. Os que restam estão inteiramente sob o controle de Mastema, embora a criatura cativa ainda se disfarce de tutor submisso. O anjo guia habilmente a Ordem a recrutar gente como os fundadores originais — guerreiros fortes, rápidos e taticamente talentosos. Soldados, policiais, seguranças de casas noturnas e assassinos em série suficientemente cautelosos são perseguidos e recrutados para as fileiras da Ordem. Mastema ensina aos novos alunos a morte, o ódio e o medo; a Ordem ensina a seus recrutas que a autoridade vem do poder. O novato é torturado e humilhado, desmontado e remontado como um matador.

Interpretando os Nebuu-Afef

Os Nebuu-Afef são uma Ordem antagonista e não foram feitos para serem personagens de jogador. São ‘feiticeiros’ apenas no nome, enganados a acreditar que controlam um anjo. Se os jogadores tiverem interesse em interpretar vilões como esses, converse com o grupo sobre o propósito de interpretá-los. É uma tentativa de retratar reforma, reabilitação e reparação daqueles perdidos para o próprio ódio e raiva, ou apenas uma tentativa de ser transgressor? Essa deve ser uma conversa séria para todos na sua mesa. Se todos concordarem, consulte Book of the Fallen para mais orientações sobre ferramentas e cuidados ao incorporar o mal puro ao seu jogo.

Para representar mecanicamente a dependência dos Nebuu-Afef e a natureza pouco confiável da ajuda de Mastema, o Narrador deve fazer todos os testes do Caminho Summoning, Binding, and Warding em segredo e, mesmo que o teste seja bem-sucedido, Mastema apenas foi contatado e pode não aparecer.

Embora a Ordem tenha sido fundada por místicos que haviam desenvolvido rituais e práticas próprias antes de invocar Mastema, a magia da Ordem atual depende dos ensinamentos do anjo. Todo estudante aprende magias de aprisionamento destinadas a chamar e controlar Mastema, mas essas magias são inúteis contra o anjo. Se o anjo se dignar a ensinar um Caminho a um estudante, será um focado em destruição e sofrimento. Ele não ensina nada de Aprisionamento ou Comando, pois jamais revelará que todo membro da Ordem é brinquedo e ferramenta do anjo.]==] },
				["Thal’hun"] = { pt = [==[M20 Sorcerer, pág. 92


Thal’hun


Atributos Favorecidos: Inteligência, Raciocínio

Caminhos Favorecidos: Conjuration, Fortune, Hellfire, Quintessence Manipulation

Os Thal’hun professam que a ideia de magia tal como apresentada pelos feiticeiros é ridícula, mas há um grão de verdade escondido em meio a toda a fanfarronice e superstição. Os Thal’hun são uma ordem de cientistas, engenheiros e metafísicos que encontraram a verdade: toda “magia” consiste meramente em acessar o maior poder do cosmos, chamado thal. Thal é a ciência dos harmônicos, e um Thal’hun é um engenheiro desses harmônicos. A ordem afirma ter sido ensinada por uma raça antiga de alienígenas vindos das estrelas, os Hui:xa.

Como os Thal’hun explicam, os Hui:xa tiveram milhares de anos de cultura para desenvolver ciências além da compreensão humana, mas thal é a joia da coroa de suas descobertas. Exige intelecto e vontade supremos dominar esse poder sem ferir os que estão ao redor do Thal’hun. Embora alguns dos Hui:xa tivessem dominado o thal, havia outras ciências que ainda não compreendiam plenamente, e um desastre biológico levou à destruição de seu mundo natal, ameaçando extingui-los. Para evitar a perda total de seu povo, seus mais eruditos sacerdotes-cientistas deslocaram uma parte de sua grande cidade, Zoraster, para outro plano além do tempo e do espaço. Trezentos dos Hui:xa foram selecionados para ser Jeva, ou Portadores da Luz, transformados em criaturas de pura energia e enviados a encontrar um novo lar para o que resta de seu povo.

Um Jeva chamado Khuvon veio ao nosso mundo quando a Mesopotâmia estava em ascensão. Intrigado com a humanidade, assumiu forma mortal e viveu entre as pessoas por um tempo, mas havia um limite para o que podia fazer. Ocasionalmente, ele se erguia e ensinava as artes do thal, criando uma nova geração de Thal’hun. Essas primeiras lições não eram de ciência, pois tal ideia estava além da compreensão humana daqueles dias, então o thal era ensinado envolto nas histórias e mitos da época. Finalmente, em 1961, quando a humanidade alcançou pela primeira vez o espaço além da Terra, Khuvon voltou a ensinar. Desta vez, a cientistas, não a místicos e filósofos. Nada de mitos e lendas, mas ciência pura do Thal. Ele passou 5 anos com seus 7 alunos, ensinando-lhes tudo o que podia, e então os enviou entre a humanidade para ensinarem em seu lugar. Satisfeito de que a Terra seria um novo lar para os Hui:xa, lançou o chamado ao espaço, chamando os outros Jeva, chamando-os a si para trazer Zoraster de volta a este plano. Agora Khuvon repousa no núcleo da Terra, os Thal’hun instruem a próxima geração e todos aguardam a chegada dos Jeva, espalhados pelas estrelas por milhares de anos.

Novos iniciados dos Thal’hun vêm de várias sociedades marginais: questionadores do status quo de mente científica, gente que mergulha em pseudociência, curandeiros de cristais da Nova Era, observadores de OVNIs ou tipos ‘inventor genial’. Os mais inclinados ao místico, ocultistas e filósofos, estão simplesmente arraigados demais em suas crenças para considerar a verdade do thal. Esses novos iniciados passam anos aprendendo a escrever e pronunciar os caracteres Luz’at, a meditação apropriada e a história da atividade de Khuvon na Terra, antes que sua mente esteja pronta para entender a língua em si. Depois disso, o novo iniciado começa a usar diademas, dispositivos de metal e cristal como varas, bastões, tripés e outras antenas, para amplificar seus harmônicos e sua sintonia mental e assim manipular o próprio thal ‘estabelecendo uma ressonância’ com aqueles sons específicos. Eles ajudam outros a construir diademas e em seus experimentos com o Thal, e estudam a cultura, a tradição, a astronomia e os poemas e histórias Hui:xa deixados por Khuvon para seus “filhos” humanos.

Por fim, o recruta repousa num tanque de privação sensorial por até uma semana, começando com silêncio e depois passando a uma série de frequências geradas por cientistas mais velhos para abrir a mente do iniciado. Dentro de um estado de transe, o iniciado encontra Khuvon em sua forma espiritual, que o inicia e o aceita como novo discípulo. Após mais uma hora de silêncio para assimilar a experiência, o iniciado emerge como um novo Thal’hun.]==] },
				["The Ancient Order of The Aeon Rites"] = { pt = [==[M20 Sorcerer, pág. 80


The Ancient Order of The Aeon Rites


Atributos Favorecidos: Inteligência, Raciocínio

Caminhos Favorecidos: Conjuration, Divination, Enchantment, Summon, Binding, and Warding

Dentro dos tabernáculos sagrados da Ancient Order of the Aeon Rites, feiticeiros estudam os diários e ensinamentos do Mestre Johannes Agrippa, que fundou a Ordem em 1873. Baseados em obras ainda mais antigas, milenares e vindas de culturas e sociedades de todo o globo, os Vigias Secretos da Ordem haviam escondido fragmentos da Verdade dentro da estrutura de todo o ocultismo e misticismo, para quando a humanidade estivesse pronta para essa Verdade. As visões do Mestre Agrippa vindas dos Vigias Secretos e seu estudo dessas culturas antigas levaram à formação dos Ritos do Éon, escritos em enochiano, a língua dos anjos. Os feiticeiros da Ancient Order operam sua magia por meio de estudo cuidadoso e rituais precisos, envoltos em simbolismo e correspondência que podem ser familiares a magos de qualquer outra Prática. Com túnicas cerimoniais, movimentos prescritos e a colocação calculada de instrumentos meticulosamente confeccionados, os feiticeiros da AOAR adotam uma abordagem hermética da magia, exigindo estudo e execução acima de práticas mais emocionais.

Os mestres da Ordem agem como professores benevolentes, vendo outras sociedades como recrutas em potencial que apenas precisam ser postos no caminho apropriado para a iluminação. É crença da Ordem que todos os feiticeiros deveriam usar suas habilidades para guiar a humanidade a uma nova era dourada de prosperidade. Isso poderia soar autoglorificante se a AOAR não acompanhasse as palavras com atos, auxiliando outros magos em sua busca pela iluminação, fundando organizações de caridade e realizando outras boas obras. A Ordem dedica os três primeiros graus de iniciação a esses deveres mundanos. Os egoístas e centrados em si mesmos não têm permissão para avançar aos círculos internos da Ordem. No círculo seguinte, outros 3 graus da Ordem supervisionam o trabalho mais amplo da sociedade, desenvolvendo conexões políticas, mantendo seus consideráveis cofres e treinando os recém-iniciados, tudo isso enquanto perseguem verdades maiores e o domínio dos Caminhos da magia. Os 3 graus finais da Ordem são os daqueles que verdadeiramente se dedicam ao estudo dos Ritos do Éon, mergulhando nos mistérios mais esotéricos.

Diz-se que, na morte, os da AOAR que se provaram dignos são aceitos pelos Vigias Secretos em suas fileiras. Esses Vigias Secretos guiam e aconselham a Ordem, mas raramente são vistos. O Mestre Agrippa já apareceu em forma fantasmagórica para orientar iniciados e magisters, embora tais manifestações sejam raras. Corre o boato de que a Ordem é meramente uma ferramenta do Mestre Agrippa, que ainda vive e puxa os cordões da Ordem de longe. A maioria dos membros descarta tal especulação, pois não parece haver propósito para semelhante engodo. À medida que uma nova geração de magisters começa a tomar seu lugar nas fileiras superiores da Ordem, eles começaram a questionar esse passo final. Uma vida após a morte continuando seu trabalho no reino espiritual é realidade, ou é meramente um ardil para impedir que magisters plenamente treinados criem suas próprias facções?]==] },
				["The Arcanum"] = { pt = [==[M20 Sorcerer, pág. 80


The Arcanum


Atributos Favorecidos: Inteligência, Raciocínio

Caminhos Favorecidos: Alchemy, Conveyance, Enchantment, Summoning, Binding, and Warding

O Arcanum nasceu do auge ocultista do fim do século XIX, quando a alta sociedade vitoriana prestava reverência da boca para fora a rituais e esoterismo. Frustrada com a Ordem Hermética do Dia Nascente, uma nova sociedade nasceu não para cumprir o protocolo, mas para buscar conhecimento e verdade. Independentemente de cultura e fonte, o Arcanum investiga superstição, mito, pseudociência e ocorrências estranhas. O Arcanum acredita que há outro mundo que faz fronteira com o nosso, um lugar onde as histórias contadas pelos antigos são reais. Pelo estudo dos contos e lendas desses antigos, acreditam poder encontrar o cerne de verdade do qual essas histórias brotam. Eles não julgam esse conhecimento; não atribuem moralidade ao sobrenatural, servindo apenas como bibliotecários e observadores. Embora o Arcanum seja voraz por conhecimento e use outros contatos para ajudar a reuni-lo, guarda seus segredos com ciúme. O Arcanum só revela informação a estranhos sob determinação do Comitê Executivo.

O Arcanum opera numa série de camadas, começando pela comunidade acadêmica em geral, onde também faz seu recrutamento. Nesses círculos, o Arcanum é conhecido simplesmente como uma sociedade erudita que apoia investigações em pesquisas marginais. O Arcanum é ativo em muitas publicações, incluindo mídias tradicionais como livros e periódicos. Recentemente, começaram a avaliar e apoiar os trabalhos de indivíduos e grupos pela internet que investigam e relatam por mídias mais novas, como vídeos ou podcasts. A filiação ao Arcanum não é secreta, e eles são frequentemente procurados diretamente por acadêmicos curiosos interessados em entrar na Confraria. A primeira camada do Arcanum são esses Associados, os jovens estudiosos, pesquisadores ou outros investigadores que trabalham com o Arcanum mas não estão de fato sujeitos às regras nem gozam dos privilégios de um membro pleno. Os Associados que começam a fazer perguntas ao Arcanum, examinando o propósito da sociedade e buscando iluminação além de seu foco pessoal, são convidados a entrar como Neófitos. Esses Neófitos estudam sob um mentor, muitas vezes um Irmão Ancião que lhes dá acesso à literatura e aos recursos do Arcanum conforme necessário. Os Neófitos são as “crianças” do Arcanum, ali para aprender e estudar, mas não contribuem para a conversa maior da sociedade. Com exame e ritual, um Neófito se gradua como membro pleno do Arcanum, um Arcanista, às vezes chamado de Irmão, Irmã ou Irmão-em-geral. Embora não seja um posto acima dos demais, os membros que demonstraram ser sábios e eruditos recebem o honorífico de “Ancião”, ainda que isso não tenha relação com idade ou senioridade dentro do Arcanum.

Em termos de organização, a sociedade do Arcanum se reporta ao Comitê Executivo na Casa Fundação, sob direção do Grão-Chanceler. A própria Casa Fundação é uma propriedade enorme e ostenta o “Axis Mundi”, que eles alegam ser a mais completa biblioteca de tudo que é arcano e sobrenatural. Casas Capitulares pelo globo coordenam e apoiam os Arcanistas locais. Cada Casa Capitular tem liberdade para se organizar conforme a necessidade de seus membros, assumindo funções abaixo do Chanceler local, como Diretor Financeiro, Bibliotecário-Chefe ou Sargento de Armas. Essas Casas Capitulares podem oferecer hospedagem aos Arcanistas, nas próprias instalações ou nas proximidades. Servem também como locais seguros para onde um Arcanista pode se recolher em caso de problemas que apareçam durante investigações. Dentro das Casas Capitulares, os membros também se ligam como uma “loja” de vários Arcanistas, muitas vezes uma turma graduada de Neófitos, que trabalham juntos para perseguir seus interesses variados, reunindo especialistas de campos diferentes para trabalhar num único problema. Esses interesses são apoiados por um Colégio, que ajuda a organizar a pesquisa de diferentes campos, como o Colégio de Taumatologia, o Programa de Estudos Herméticos e a Escola de Mitoarqueologia.]==] },
				["The Children of Osiris"] = { pt = [==[M20 Sorcerer, pág. 82


The Children of Osiris


Atributos Favorecidos: Inteligência, Raciocínio

Caminhos Favorecidos: Ephemera, Healing, Herbalism e Oneiromancy

No antigo Egito, muito antes de as pirâmides se erguerem, antes de o faraó Narmer unir os reinos alto e baixo, vivia um rei mortal, sábio e estudioso, do oeste do Egito, chamado Osíris. Osíris tinha um irmão mais novo e invejoso chamado Set, que queria governar a qualquer custo. Depois de uma tentativa de assassinato dramática mas malsucedida, a esposa de Osíris, Ísis, o salvou com sua magia. Set ficou enfurecido por Ísis tê-lo frustrado e buscou meios mais astutos de contrariar o poder dela. Encontrou exatamente a vantagem que procurava quando foi abraçado como vampiro.

Encorajado por seu novo poder, Set exigiu que Osíris lhe entregasse o trono. Quando Osíris recusou, Set entrou em frenesi e despedaçou o irmão em 14 pedaços. Set espalhou os pedaços pela terra para impedir que Ísis o revivesse.

Isso não bastou para deter a determinada feiticeira de reunir os pedaços do cadáver do marido. Depois de recolher tantos fragmentos quantos pôde, toda a magia empunhada por Ísis e pelo coven de Osíris trouxe Osíris de volta milagrosamente, mas de forma imperfeita. Ele estava fraco. Sua pele estava irreparavelmente danificada pelo tempo em decomposição. Foram necessários esforços contínuos do coven apenas para manter Osíris vivo.

Angustiada, Ísis não suportava ver o marido morto ou em agonia constante. Ela procurou freneticamente uma solução melhor e topou com uma figura misteriosa que prometeu restaurar seu marido. Estava desesperada demais para discutir o que o processo envolveria, ou qual seria o custo, e aceitou. A figura misteriosa abraçou Osíris como vampiro.

Osíris massacrou seu amigo mais próximo no coven imediatamente após o abraço. Quando percebeu que não apenas matara seu querido amigo mas consumira seu sangue num frenesi de fome, ficou horrorizado. Tomado pelo luto, culpou Ísis e jurou encontrar um meio de banir seus impulsos monstruosos. O coven se partiu em dois: os que simpatizavam com Osíris e os que o achavam um monstro irredimível. Aqueles poucos simpatizantes foram os primeiros Filhos de Osíris mortais.

A Afiliação cresceu, unindo-se a vampiros que também buscavam a liberdade de suas Bestas e a feiticeiros que buscavam reconciliar vida e morte para se tornarem imortais sem as falhas do vampirismo. A princípio, os Filhos feiticeiros e vampiros eram tratados como iguais. Contudo, depois que Set finalmente matou Osíris, os vampiros da facção tomaram o controle. Os feiticeiros se tornaram servos de seus mestres vampíricos, embora os Filhos mortos-vivos supostamente seguissem a ordem de Osíris de que jamais abraçassem seus equivalentes feiticeiros. Há algum tempo, os Filhos vampiros desapareceram, deixando os feiticeiros por conta própria.

Os Filhos de Osíris são poucos, mas crescem lentamente devido ao interesse mundial crescente pela tradição do antigo Egito e à recente descoberta de algumas tumbas de Osíris. Estão concentrados sobretudo no Egito e arredores, mas os que não vivem no Egito fazem questão de visitá-lo com a maior frequência possível. Organizam-se em templos ocultos projetados à maneira de tumbas. Os Filhos de Osíris são liderados pelo membro mais experiente, de qualquer gênero, seja ele o mais velho ou não. A iniciação leva anos para ser concluída e consiste em rituais solenes modelados a partir de práticas funerárias do antigo Egito, seguidos de estudo guiado de línguas antigas e textos mágicos.

Eles normalmente praticam uma vida saudável, com dietas simples e exercício regular incentivados. Todos os Filhos, independentemente do gênero, mantêm a cabeça raspada, embora muitos usem perucas fora de seus templos. Isso é tanto uma prática ritual quanto uma questão de saúde — quando os Filhos de Osíris estavam em sua infância, o único modo confiável de evitar piolhos e as infecções de pele potencialmente fatais que deles resultavam era raspar a cabeça.

Os Filhos ainda veneram Osíris como um deus, alegando que ele não se foi para sempre, mas assumiu seu lugar de direito como rei do submundo. A maioria dedica seu tempo ao estudo meticuloso de seus Caminhos. Alguns arranjam tempo para manter uma rivalidade unilateral com o mais poderoso Cult of Isis, embora isso geralmente não seja incentivado e seja considerado uma distração da verdade em seus estudos. A progênie de Set em grande parte deixou os seguidores mortais de Osíris em paz desde o desaparecimento dos Filhos vampiros, mas, se seus descendentes encontrassem um templo feiticeiro dos Filhos de Osíris, as coisas ficariam feias rapidamente.]==] },
				["The Cult of Isis"] = { pt = [==[M20 Sorcerer, pág. 83


The Cult of Isis


Atributos Favorecidos: Carisma, Manipulação

Caminhos Favorecidos: Divination, Fascination, Fortune, Healing

O Cult of Isis é um grupo fraturado e disperso, distante no tempo e no espaço de suas origens no Egito, aos pés da deusa da cura, Ísis. Ramos do Culto já foram de magos pacíficos buscando nutrir a humanidade a feiticeiros da natureza que abençoavam tanto o campo quanto o ventre. Depois da destruição da deusa-mãe, seu filho, Hórus, tomou o controle do Culto para lutar contra o assassino, Set, e seus filhos amaldiçoados. Na época de Cleópatra, o Culto havia caído em desgraça, uma casca partida de sua antiga glória, mas, à medida que Roma conquistava o Egito, o Culto se uniu ao culto de outras deusas, e o nome de Ísis passou a ser pronunciado ao lado dos de Juno, Ceres e Vesta. Cultos de fertilidade se espalharam pela região em nome dela, e mais cultos de mistério diluíram o Culto numa miríade de seitas e ramos, alguns com crenças e propósitos radicalmente diferentes.

Nos tempos modernos, a influência do Culto pode ser vista nos ensinamentos de Tradições como os Extáticos e os Verbena, ou entre Kindred corrompidos que hoje seguem os ensinamentos de Set, mas há um novo Cult of Isis que floresceu na esteira da Primavera Árabe de 2010. Liderado por uma maga que se chama Semet, este ramo do Culto é dedicado a uma nova era de cura e paz. Isso começou como a tentativa de uma pequena seita de cuidar das relíquias e maravilhas ocultas do passado, em meio a agitação e sofrimento. A sacerdotisa Semet organizou o Culto como socorristas de rua, enfermeiros, cuidadores e mediadores. O Culto não assume postos de liderança nem toma partido em política, apenas cuidando dos feridos ou dos que ficam no meio do fogo cruzado, na esperança de impedir que qualquer conflito escale além do reparável. Os símbolos do disco lunar com chifres de Ísis ou de suas asas abertas são colocados como marcos de refúgio e segurança. Esta seita do Culto não abandonou os ensinamentos místicos de Ísis. Em meio a uma organização de socorristas amadores pelas redes sociais, o Culto opera sua magia, tratando dos piores ferimentos, que eles prometem “não serem tão graves quanto parecem”. A portas fechadas, o sacerdócio moderno de Ísis realiza rituais para abençoar as mãos dos trabalhadores, e amuletos sagrados são encantados para a proteção de seus membros.

Enquanto o ramo de Semet cresce e se espalha pela região, outros Cultos seguiram em moldes mais tradicionais. Cultos de fertilidade ligados à sensualidade e ao sexo se valem de impulsos naturais da humanidade — experiências extáticas que aproximam da deusa e alimentam sua magia. Hieróglifos egípcios, cânticos demóticos e arquitetura geomântica precisa dão poder a rituais transmitidos por mais de sete milênios. Esses Cultos cresceram e viajaram longe, primeiro do Egito a Roma, depois por todo o Império Romano, e agora a cada canto do globo, com dezenas de faces para a deusa. Seitas secretas que operam manipulação e controle sociais, irmandades zelosas que reverenciam todas as deusas sagradas, ou alguns dos poucos que ainda apoiam Hórus, o filho imortal de Ísis, em sua busca por vingança — todos reverenciam o nome da deusa e se contam como um Cult of Isis.]==] },
				["The Cult of Mercury"] = { pt = [==[M20 Sorcerer, pág. 83


The Cult of Mercury


Atributos Favorecidos: Carisma, Vigor

Caminhos Favorecidos: Conjuration, Conveyance, Divination, Fortune, para o templo romano. Substitua um deles por um Caminho aplicável à interpretação local de Mercúrio, a critério do Narrador.

O Cult of Mercury foi fundado na Roma antiga entre muitos cultos semelhantes devotados a divindades específicas dos panteões locais e vizinhos. Seu primeiro templo ficava no Circo Máximo, perto de uma pista de corrida de cavalos e de um popular ponto de mercadores, local apropriado para um deus da fortuna financeira e das viagens rápidas.

Mercadores locais, e depois até senadores, afluíram ao culto para dar apoio às suas elevadas aspirações de poder. Apesar de atrair populações que de outro modo seriam propensas a ambições implacáveis, o Cult of Mercury exige imenso trabalho em equipe. O culto realiza exclusivamente magia ritual, organizando até centenas de seguidores numa prática cooperativa intrincada para criar seus efeitos. O simples número de feiticeiros realizando rituais juntos exige várias camadas de liderança para organizar todas as engrenagens. Durante os rituais, todos os feiticeiros vestem túnicas, togas ou outras roupas brancas limpas, mais apropriadas à região nos templos fora de Roma. Os rituais incluem incenso, movimento coordenado, velas acesas, o segurar de objetos associados à intenção do ritual e toda a assembleia entoando em latim e grego antigo.

Devotos de um deus das viagens, os membros do Cult of Mercury sem aspirações políticas locais viajavam e formavam novas congregações como forma de subir rapidamente de posto no culto. À medida que o Cult of Mercury se espalhou por outras regiões, tanto por conquistas romanas quanto pelo comércio, os cultistas assemelharam Mercúrio às divindades locais, alegando que essas outras divindades eram simplesmente aspectos e compreensões diferentes de Mercúrio. Assim, os templos podem focar Caminhos mais aplicáveis à sua interpretação local de Mercúrio, como Shapeshifting para o aspecto Mercurius Artaios, um deus dos ursos e da caça no sudeste da França. As práticas são igualmente localizadas, com elementos rituais tradicionais dos primeiros congregantes da região.

O Cult of Mercury sofreu um duro golpe em liderança e retenção de membros quando Constantino converteu o Império Romano ao cristianismo. Muitos dos que entraram em busca de boa sorte concluíram que não estariam desafiando tanto o destino ao aderir à nova religião majoritária e patrocinada pelo Estado, em vez de ficar com o que conheciam. Os templos que continuaram a praticar esconderam sua religião disfarçando-se de igrejas cristãs. Os efeitos dessa mudança persistem até hoje, com os postos de liderança do Cult of Mercury compartilhando nomes com cargos da igreja católica.

O Cult of Mercury procura tirar proveito da recente onda de popularidade das religiões antigas. Sem conversões suficientes, templos inteiros ruem quando os membros mais velhos morrem e o número já não sustenta o elaborado trabalho ritual. O culto prefere os ambiciosos e aventureiros, mas no fim a liderança não é exigente, desde que haja subordinados suficientes para que os rituais funcionem. Pais são incentivados a trazer os filhos para o culto assim que tiverem idade para executar tarefas rituais auxiliares simples — e para guardar segredos nas regiões em que a prática é estigmatizada.

O Cult of Mercury pode realizar feitos impressionantes quando em plena força, mas está limitado a magia ritual com não menos de 50 participantes. Embora um cultista não possa usar magias conjuradas de improviso, é costume que os templos preparem rituais de antemão, que membros habilidosos possam terminar de conjurar numa emergência. Personagens do Cult of Mercury podem aprender 2 rituais gratuitos adicionais para cada ponto num Caminho. Pastorear uma grande congregação não é tarefa fácil e exige liderança com Atributos sociais fortes. Carisma costuma ser o Atributo favorecido para cultistas com papéis ou aspirações de liderança, enquanto o cultista médio de uma congregação pode preferir Vigor, pela paciência e dedicação de ser uma engrenagem em rituais imensos.]==] },
				["The Dozen Priests of the Pythian Order"] = { pt = [==[M20 Sorcerer, pág. 84


The Dozen Priests of the Pythian Order


Atributos Favorecidos: Carisma, Inteligência

Caminhos Favorecidos: Divination, Healing, Shapeshifting, Weather Control

A própria Ordem Pítia já atravessou o mundo helênico e grego. Seus membros eram especialistas em adivinhação, que transmitiam as palavras dos deuses e encontravam sua magia no ritmo e na rima da poesia. Não meramente uma forma de arte, mas uma expressão de numerologia, a prática pítia unia música, astrologia e matemática, ressoando com a música das esferas. Eles se esforçavam para encontrar exatamente a métrica poética certa para encapsular essa magia, prendendo-a a textos para armazenar esse poder. Magia delicada e minuciosa, era raro dominá-la. O número de sacerdotes da Ordem Pítia diminuiu com o tempo. Quando a ciência e o saber declinaram na Europa, a Ordem Pítia já havia caído em desgraça. Seus números minguaram àqueles poucos que haviam estendido a própria vida além dos limites naturais da humanidade.

Na época do Renascimento e do interesse renovado pelos clássicos, os Doze Sacerdotes da Ordem Pítia que ainda viviam foram procurados. Os poucos textos pítios que haviam chegado aos eruditos da época eram uma maravilha, e a Ordem Pítia ganhou um punhado de novos convertidos. No período romântico, o interesse cresceu ainda mais, especialmente entre os poetas da época. Esses artistas descobriram que o sentido de sua poesia alcançava novas alturas quando inspirado pelo saber esotérico dos pítios. Contudo, surtos de popularidade nunca revitalizaram a Ordem Pítia além dos poucos eruditos antigos que restam, mesmo com novos magos se dedicando ao ofício.

O que resta da Ordem — os Doze Sacerdotes hoje reduzidos a quatro — habita um templo em Milos, uma ilha ao largo da costa da Grécia. Ali, os versos sagrados são preservados, e os Sacerdotes começaram a questionar se devem lutar contra a inevitável erosão do tempo e deixar a Ordem Pítia finalmente cair, ou buscar novos alunos, dignos e dedicados, para transmitir seu conhecimento. Não é meramente uma questão de perda de conhecimento, pois sua poesia está guardada, e outras obras pítias estão em arquivos e museus. Há mais a considerar, pois os sacerdotes remanescentes acumularam poder imenso ao longo de séculos de estudo. Deixá-lo morrer com eles parece uma afronta aos deuses por quem um dia falaram. Eles trabalham agora nesse sentido, adivinhando o futuro e o próprio fim dos seus dias, para ver se chegarão alunos para aprender com eles ou se seguem agarrados à tradição por teimosia fútil.]==] },
				["The Fenian"] = { pt = [==[M20 Sorcerer, pág. 85


The Fenian


Atributos Favorecidos: Manipulação, Aparência

Caminhos Favorecidos: Fascination, Shapeshifting, Weather Control

Muitos feiticeiros que compartilham ancestralidade com os celtas alegam ter sangue e poder feéricos em sua linhagem. Na maior parte das vezes, isso é ou patentemente falso ou remoto demais para importar. Os Fenian são diferentes. São uma família ininterrupta de metamorfos de sangue feérico que podem, se acreditarmos neles, traçar sua linhagem até os Tuatha Dé Danann. Seu domínio da mudança para formas animais é prova adicional dessa alegação.

Nos primeiros dias da família, eles eram um grupo de aventureiros meio-feéricos que encontraram mais aventura do que esperavam. A faísca da exploração os atingiu, e eles deixaram para trás suas conexões humanas para encontrar a verdade de sua linhagem. Ao descobrirem sua ligação com os fae, alguns abandonaram a humanidade por completo para se juntar ao Sonhar. Os outros fizeram acordos com os Tuatha Dé Danann para aprender a controlar a magia em seu sangue. Adotaram formas animais conforme suas personalidades: os guerreiros comumente mudavam para ursos ou grandes felinos, enquanto os trapaceiros de espírito livre viravam raposas ou corvídeos. Todos os Fenian aprenderam a influenciar as opiniões dos mortais, e alguns poucos ganharam verdadeiro domínio sobre o clima. A família não é tanto uma família normal de feiticeiros, mas uma família de seres inatamente mágicos. Os contratos mágicos, ou geasa, eram talhados para cada Fenian conforme a tradição e as tendências pessoais. Um Fenian que aprecia muito os prazeres da vida pode ser proibido de comer certos tipos de comida, enquanto um Fenian que resiste à autoridade pode ser obrigado a sempre aceitar orientação — mesmo que a orientação seja prejudicial. Um Fenian pode assumir um geas por poderes ao aprender um novo Caminho ou ritual, e ele também pode se aplicar a seus descendentes.

Hoje em dia, os Fenian estão à beira da extinção. Alguns especulam que seu sangue feérico está ficando ralo demais; outros suspeitam que alguém quebrou os geasa com os Tuatha Dé Danann. Ainda há esperança: uma criança da família chamada Niamh desenvolveu a habilidade de falar com animais depois de uma geração inteira sem qualquer aptidão ou predileção mágica. Há apenas algumas dezenas de feiticeiros Fenian vivos e ativos atualmente.

Dada sua herança mágica, os Fenian tratam todos os Caminhos favorecidos Fenian como seus Caminhos de Afinidade, mas aprendem toda a outra magia estática a um custo maior. Pagam 10 de experiência para aprender um novo Caminho não-Fenian, novo nível x8 para aumentar um Caminho não-Fenian e nível x2 para rituais não-Fenian. Qualquer Fenian sob o efeito de geasa quebrados recebe uma penalidade adicional de experiência para toda a magia estática, aumentando o multiplicador de nível em 1, e +1 de dificuldade a toda magia estática e fenômeno psíquico. É portanto mais difícil para gerações inteiras aprender e usar magia estática do que para a pessoa comum, se quebrarem os geasa. Esta é a única linhagem feiticeira remanescente conhecida com mais probabilidade de passar por uma Crisálida Changeling do que de Despertar como Mago.]==] },
				["The Nephite Priesthood"] = { pt = [==[M20 Sorcerer, pág. 89


The Nephite Priesthood


Atributos Favorecidos: Vigor, Raciocínio

Caminhos Favorecidos: Divination, Enchantment, Hellfire, Summoning, Binding, and Warding e Weather Control

O Nephite Priesthood, também conhecido como “Os Profetas da Poeira”, é uma Afiliação exclusiva de místicos da Igreja de Jesus Cristo dos Santos dos Últimos Dias. Eles acreditam que Joseph Smith não revelou publicamente os segredos de um sacerdote chamado Néfi, a quem Deus ensinou por meio de sonhos a realizar milagres. Néfi manteve um grupo de discípulos para transmitir o conhecimento divino e servir seu povo. Néfi e seus discípulos foram mortos na batalha de Cumorah, e o conhecimento se perdeu por mais de um milênio. Em 1849, Néfi se revelou como ser celestial a um piedoso colono do deserto chamado Uriah Spence, para que Uriah restaurasse o Sacerdócio e protegesse a Igreja de um governo opressor e de outros forasteiros hostis. Eles também se preparam para um confronto final vindouro, quando chegar o apocalipse. Todos os Profetas da Poeira juram votos de segredo. Não lhes é permitido deixar que membros da Igreja saibam de suas habilidades milagrosas.

Para entrar no Sacerdócio, é preciso ser um homem em boa situação dentro da Igreja. A maioria dos Sacerdotes Nefitas nasceu na Igreja, mas convertidos não são inéditos. Se um homem não é Santo dos Últimos Dias, precisa primeiro se converter à Igreja e estudar por ao menos vários anos antes que um sacerdote nefita o aborde. Eles acreditam que qualquer um que se desviasse de um código de conduta estrito seria rapidamente corrompido pelo poder e arriscaria a danação. Os ritos de iniciação são realizados em templos secretos. O iniciado, conhecido como Diácono, jejua primeiro por três dias. Ao nascer do sol do quarto dia, ele entra no templo, se despe e é ungido com óleo. Passa a manhã em oração. Ao meio-dia, o Diácono se veste com um manto branco puro. Um Sacerdote assiste ao altar, separado do Diácono por um véu, e ora com o iniciado. Ao término da cerimônia, o Diácono “renasce” no reino celestial, atravessando o véu e aproximando-se do altar para uma oração final.

Depois do ritual, o Diácono passa dois anos estudando os milagres e a história nefita, incluindo os nomes sagrados dos Sacerdotes Nefitas originais que se deve invocar para realizar os milagres. Para progredir ao sacerdócio e além, o Profeta da Poeira passa por rituais cada vez mais longos e solenes. Sacerdotes podem agir por sua própria conta na ausência de Anciãos e, após a ordenação, precisam passar ao menos dois anos peregrinando fora do deserto, tipicamente pela América Central e do Sul, para espalhar a fé e conhecer o mundo exterior. Anciãos são sacerdotes mais velhos e experientes, que tipicamente passam ao menos uma década peregrinando e aprendendo após a ordenação. O Sumo Sacerdote-Profeta é o ancião de posto mais alto, escolhido por voto popular entre os Anciãos. A maioria dos Sacerdotes Nefitas faz uma jornada anual, peregrinando por 40 dias e 40 noites pelo ermo que se estende de Utah à América do Sul, viajando o mais longe possível da civilização.

Em 4 de janeiro de 2000, no 104º aniversário da criação do estado de Utah, todo o Nephite Priesthood se reuniu em Salt Lake City com um propósito desconhecido. O que restou dos relatos se contradiz enormemente, mas uma coisa é certa: ocorreu um evento de proporções apocalípticas. Apenas um Ancião Nefita, Porter Larsen, restou para transmitir o conhecimento e reconstruir a facção. Alguns sussurram que um ritual em massa deu terrivelmente errado, outros especulam que houve o arrebatamento, levando todos menos um Ancião e deixando o resto do mundo à sua ruína. Ninguém reivindica abertamente o crédito pelo que quer que tenha acontecido, e o Ancião Larsen nada acrescentou à discussão. Sua missão é reconstruir o Sacerdócio, diz ele, não perder tempo se preocupando com o que não pode mudar. Ele não foi visto muito em público desde então, e o novo Nephite Priesthood não chamou atenção para si.

A possibilidade de um ataque externo não é implausível. O Nephite Priesthood tinha muitos inimigos. Agências de inteligência dos EUA acumularam arquivos imensos sobre a organização, atribuindo-lhe ações antigovernamentais (merecidas e imerecidas); consequentemente, o Project Twilight vigiava o Sacerdócio. O Nephite Priesthood acredita que seus poderes são dons divinos e considerava todos os outros feiticeiros místicos adoradores do diabo. Na melhor das hipóteses, os Profetas da Poeira os evitavam, mesmo quando invadiam terras alheias durante suas peregrinações. Consideravam interações amistosas com outras sociedades místicas potencialmente traiçoeiras. Alguns permanecem esperançosos de que a Afiliação, se e quando ressurgir, não seja tão beligerante quanto foi sob a liderança anterior.]==] },
				["The Seven Thunders"] = { pt = [==[M20 Sorcerer, pág. 90


The Seven Thunders


Atributos Favorecidos: Carisma, Manipulação

Caminhos Favorecidos: Divination, Fortune, Healing, Hellfire

O Armagedom estava previsto para a virada do milênio, mas os anos continuaram a se acumular, e os Seven Thunders, os profetas desse apocalipse, descobriram que seu exército de fiéis perdeu a fé. A Fé Verdadeira dos sete profetas não vacilou nas décadas que se passaram. Eles continuam sua missão, ainda que mudada e ajustada à medida que percebem que sua compreensão mortal das visões divinas era falha. Os Seven Thunders se espalharam pelo globo, apoiados por seus poucos seguidores fiéis remanescentes, enquanto trabalham para trazer o julgamento sobre os ímpios. Os Seven Thunders não olham mais para o relógio, esperando uma data específica para a chegada do Armagedom. Acreditam que ele virá no tempo determinado, e não antes. Pode ser que o Armagedom não chegue antes que eles tenham preparado plenamente a terra para ele.

Com essa nova visão de sua missão, os Seven Thunders buscam os ímpios, os falsos deuses e os desencaminhados. Vão rebaixar os altos e poderosos; trazê-los à luz de sua fé. Se necessário, vão destruí-los. Eles são o Julgamento na Terra e, enquanto os profetas erguem a espada da fé contra as maiores ameaças, seus seguidores procuram os inimigos que puderem encontrar. Os Thunders pregam o fim do mundo, exibindo sinais de sua fé, curando os enfermos e expulsando espíritos imundos. Enquanto isso, comandam pessoas comuns armadas de rosários e rifles para combater vampiros, lobisomens e místicos.

Com o passar do tempo, os Seven Thunders descobrem que não estão em completo acordo. Embora acreditem ter a mesma missão, o caminho que trilham mudou. Agora fisicamente separados para cobrir mais território e apressar a chegada do Armagedom, os métodos e focos dos Seven Thunders se diversificaram conforme o que cada profeta considera mais importante. Os profetas não são dedicados a territórios específicos, mas viajam pelos continentes conforme suas visões os conduzem, buscando redes de apoio locais para suas missões. Isso significa que alguns apoiadores se veem passando de pastores de sua comunidade local a caçadores de licantropos na mata no espaço de uma semana. Essa mudança contínua de prioridades e de liderança afastou alguns seguidores, mas os que permanecem são dedicados à causa, arriscando suas relações e suas vidas.]==] },
				["The Silver Portal"] = { pt = [==[M20 Sorcerer, pág. 90


The Silver Portal


Atributos Favorecidos: Carisma, Percepção

Caminhos Favorecidos: Ephemera (Umbrood), Fascination, Oneiromancy, Shadows

A mente é uma coisa poderosa. Quando dormimos, até os não iniciados podem provar o potencial dos indomados mundos oníricos. O caos é apenas potencial esperando para ser explorado. O Silver Portal é único nessa compreensão da habilidade mágica entre as Afiliações de feiticeiros. Seu texto sagrado é uma obra eldritch que foi repassada como um telefone sem fio ao longo de séculos, línguas, múltiplas revisões massivas e culturas, virando algo inteiramente alheio ao pergaminho persa do século V (ou ainda mais antigo, como alega) chamado Zolondrodere, do qual deriva. Ele ensina que todo pensamento e toda ideia possíveis existem à deriva em Maya, os Reinos do Sonho, esperando alguém com poder para arrancá-los desse reino subliminar e trazê-los à realidade.

Os segredos do Zolondrodere desafiam o pensamento racional, mesmo para padrões místicos. A mente sã costuma rejeitar os ensinamentos do tomo, então os iniciados do Silver Portal muitas vezes precisam começar seu estudo por hipnose, indulgência em substâncias alteradoras da mente e privação ritual de sentidos e de sono. Assim que o feiticeiro começa a sentir que compreende, ele entra num transe onírico, com frequência diante de um espelho inscrito com símbolos místicos tidos como promotores de abertura. Uma vez cruzado o portal de prata rumo a Maya, encontram Umbrood estranhos e imagens desorientadoras e potentes — fantásticas e horríveis em igual medida. Ali, encontram poder para trazer ao mundo desperto.

Eruditos Despertos compararam as práticas do Silver Portal à natureza caótica dos Marauders, o que é um pensamento bastante horrível para a maioria. Os feiticeiros permitem que os reinos oníricos lhes confiram magia que se derrama no mundo desperto. Para um feiticeiro do Silver Portal, sonho e realidade não são dois conceitos distintos e se sobrepõem bastante. São os mais flexíveis de todos os feiticeiros, capazes de dobrar as regras da magia linear com suas práticas sem levar um tapa da Realidade por isso.

O feiticeiro do Silver Portal mantém registro do número total de pontos gastos em Caminhos e rituais a todo momento. Sempre que o feiticeiro entra no Reino do Sonho de propósito por um transe, o jogador do feiticeiro pode redistribuir esses pontos entre Caminhos e rituais como quiser, mesmo para Caminhos que o feiticeiro ainda não conhece. Para cada Caminho pretendido, o feiticeiro testa seu Atributo Favorecido mais Meditação com dificuldade 6 ou Sonho Lúcido com dificuldade 5. O número de sucessos é o número de pontos que o feiticeiro pode possuir naquele Caminho, até o número de pontos alocados. Todos os pontos alocados que não forem obtidos com sucessos ficam inacessíveis até o efeito terminar. O feiticeiro viaja pelo Reino do Sonho para encontrar esses poderes e rituais, e o narrador é incentivado a usar imagens oníricas surreais para a jornada. Ele pode usar esses poderes temporários no Reino do Sonho e na realidade desperta até ter um sono reparador. O feiticeiro precisa ter um sono reparador antes de poder entrar em transe para redistribuir os pontos de Caminho de novo. Como o feiticeiro não aprende Caminhos diretamente por meios normais, ele precisa primeiro redistribuir pontos para um Caminho ou ritual e gastar a Experiência para torná-lo um de seus poderes básicos.

Não há hierarquia formal no Silver Portal, dada a natureza dos próprios feiticeiros. Novos membros conquistam a iniciação fascinando um feiticeiro do Silver Portal tanto no mundo desperto e sem graça quanto por seus sonhos.]==] },
				["The Society of Enlightened Altruistic Ideologies (SEAI)"] = { pt = [==[M20 Sorcerer, pág. 91


The Society of Enlightened Altruistic Ideologies (SEAI)


Atributos Favorecidos: Inteligência, Manipulação

Caminhos Favorecidos: Alchemy, Conjuration, Conveyance, Enchantment

Os membros Iluminados da União Tecnocrata são alguns dos maiores opositores dos feiticeiros pelo mundo, quer reconheçam ou não que seu Gênio interior é um Avatar Desperto. Contudo, nem todos os membros da Tecnocracia são Iluminados, e a Society of Enlightened Altruistic Ideologies (SEAI, pronunciado si-á, para encurtar) trabalha para tratar das preocupações dos associados não Iluminados, garantindo que suas necessidades sejam atendidas. A SEAI tem um certo ar de clube social, com encontros cheios de fofoca em torno de café e bolo, mas os tópicos de conversa são mais esotéricos e profundos do que os do cafezinho comum. Como a SEAI cavalga os mundos da Ciência Iluminada e da sociedade mundana, eles adquirem conhecimento de muita coisa fora de seu alcance. Veem o poder de feiticeiros e magos, mas são obrigados a levar vidas monótonas e sem graça. Sentem ressentimento crescente pelos Desviantes da Realidade que acessaram as energias cósmicas do universo apenas para desperdiçá-las; afinal, os cidadãos extraordinários da SEAI são bem mais merecedores desses poderes.

Entre empurrar papel, buscar café e reportar estatísticas, a SEAI ouviu coisas, acompanhou eventos, calculou despesas e tomou notas cuidadosas, com uma única ideia em mente: capturar um mago das Tradições, apagar-lhe a mente e tomar seu Avatar para si. Os Progenitores da Tecnocracia já trabalham na tecnologia de apagamento de mente, então, combinando essa tecnologia com algumas magias de invenção própria da SEAI, eles começaram a avançar rumo ao seu objetivo. A ideia de Avatares Nephandi é ignorada como mera propaganda ou conto de fadas e não foi verdadeiramente considerada pela SEAI. Operativos Iluminados que zombam ou riem da SEAI podem descobrir que se juntaram aos Desviantes da Realidade na lista dos que deveriam ter seu Avatar removido e entregue aos membros mais dignos e trabalhadores da SEAI. Embora ainda não tenham capturado um mago vivo, as discussões sobre como proceder foram feitas a sério, e eles estão prontos para atacar assim que surgir a oportunidade. Ocasionalmente, notícias desses planos e avanços chegam aos membros Iluminados da União Tecnocrata, causando certa preocupação, já que os membros da SEAI se agrupam conforme a Tradição a que se juntariam, fossem eles Despertos. Quando esses rumores chegam à alta gerência, os membros da SEAI que falaram demais ou foram vistos desviando do protocolo são normalmente levados para recondicionamento.

Feiticeiros de todos os tipos podem topar com a Sociedade, já que a SEAI usa magias para guardar seu trabalho e experimenta outros usos na busca de capturar um mago das Tradições. Alguns da SEAI flertam com a linha da coleta de informação e vão ‘disfarçados’ para dentro de grupos feiticeiros a fim de extrair conhecimento ou descobrir quando um mago pode estar vulnerável. Esses cidadãos correm o risco de ser pegos pela União Tecnocrata ou pelas sociedades que infiltram, caminhando no fio da navalha para tomar poder dos indignos. Outros da SEAI perdem a ‘perspectiva’ e escorregam para fora da Tecnocracia quando provam a magia por ritual e estudo, muitas vezes ao começarem a reconhecer que a hiperciência que estudaram parece tão semelhante às fórmulas herméticas.]==] },
				["The Society of Leopold"] = { pt = [==[The Hunters Hunted II, pág. 117


The Society of Leopold


E o anjo falou comigo, em voz forte, clamando: “Muitos são os filhos do Dragão, a Serpente, o grande Satã, e eles estão entre vós agora. Digo-vos, Servos de Cristo, que a Parusia está próxima, que a Segunda Vinda logo chegará. Cada vez mais fortes se tornam os filhos do Dragão, e eles se multiplicam, e são uma ferida sobre a terra. E nós somos o bálsamo para essa ferida, precisamos limpá-la com fogo e purificá-la, e então a terra estará pronta para a Parusia, e seremos julgados dignos.”

— Leopold de Murnau, O Testamento de Leopold

Chame-os de velas no escuro. Chame-os de anjos feridos. Chame-os de zelotes sádicos. Mas não os chame de apáticos. Antes que a ciência acendesse sua luz noturna para dar coragem aos homens, essas ovelhas ousaram desafiar os senhores predadores. Não são cruzados antiquados enclausurados em mosteiros. Esta noite, eles empunham lâmina e arma em becos sórdidos pintados com sangue de monstro e o brilho trêmulo de uma cruz de neon. Eles recrutam e coordenam ataques pela internet. Tocam música coral digital em fones de ouvido para abafar as palavras venenosas dos demônios que exorcizam. Estas são as histórias da Inquisição moderna. Não há mortais que os Filhos de Caim temam mais.

Tema e Clima

O tema da Inquisição é o cruzado moderno. O mundo inteiro é sua Terra Santa. Quando um Inquisidor olha para a rua mais banal, não consegue deixar de ver a guerra secreta. Não há como voltar atrás. As apostas não poderiam ser mais altas. O Inimigo é o próprio Diabo, e as almas de toda a humanidade estão em jogo. Nos momentos mais sombrios, o Inquisidor sabe que esta nem sequer é a guerra verdadeira. Quando o mundo se rachar e o Inferno se soltar sobre a terra, então a verdadeira batalha começará. E a Inquisição estará pronta.

O clima da Inquisição é fé e dúvida. Um pêndulo afiado balança entre as duas. O frenesi apocalíptico faz a lâmina tremer. O que é cortado? O que sangra? Pode um caçador de bruxas fazer as coisas terríveis que se exigem dele e ainda manter a fé? A paixão extática e o ímpeto, e as coisas maravilhosas e terríveis que eles nos permitem fazer, estão no coração da história do caçador fiel.]==] },
				["The Star Council"] = { pt = [==[M20 Sorcerer, pág. 92


The Star Council


Atributos Favorecidos: Percepção, Inteligência

Caminhos Favorecidos: A maioria dos Star Council modernos são psíquicos, mas alguns conhecem Enchantment, Healing, Shadow e Quintessence Manipulation

Em julho de 1947, a notícia de uma possível queda extraterrestre em Roswell, Novo México, varreu o país. Pessoas de todas as origens ficaram encantadas e inspiradas pela possibilidade de vida além da Terra. O Star Council se formou originalmente como um punhado de entusiastas de OVNIs e pesquisadores do paranormal com ideias afins. Embora viessem de origens diferentes, de professores excêntricos a adolescentes delinquentes, encontraram comunidade e prontamente compartilharam suas teorias e descobertas sobre o espaço, extraterrestres e conspirações relacionadas.

O Star Council acolheu outro grupo menor, os Thal’hun, em suas fileiras no fim dos anos 1960. Os Thal’hun eram mais fechados que o resto do Star Council e permaneceram em grande parte como facção própria, embora participassem do compartilhamento de suas crenças e descobertas. Foram os primeiros a apresentar ao Star Council provas do sobrenatural e ganharam credibilidade quando a suposta tecnologia extraterrestre que roubaram do Governo dos EUA funcionou exatamente como previram.

Com o passar das décadas, o Star Council fez o possível para continuar sendo baixa prioridade para o governo. Seus esforços foram muitas vezes complicados pelas ações da facção Thal’hun, e o Star Council teve de contar com membros mais jovens e habilidosos em tecnologia e com advogados desacreditados em suas fileiras para não chamar atenção. Os objetivos divergentes e as práticas rigorosas de estudo dos Thal’hun se tornaram pontos de atrito supurantes.

Sem que o grupo soubesse, o Star Council não-Thal’hun era composto em sua maioria de psíquicos no fim dos anos 1990. Esses membros normalmente acreditam ser vítimas de experimentação extraterrestre ou descendentes reais de extraterrestres. Acreditam que diferenças genéticas, naturais ou não, causaram seus poderes sobrenaturais, enquanto os Thal’hun insistiam que jamais alcançariam seu pleno potencial sem a educação Thal’hun.

Quando os Thal’hun deixaram a polícia no encalço do grupo após um experimento que deu terrivelmente errado em 2002, o Star Council finalmente os expulsou. A discussão explosiva que se seguiu deixou mágoas dos dois lados, e foi preciso o esforço de todo o Star Council para limpar a bagunça tanto do experimento fracassado quanto do conflito resultante. Desde então, o Star Council voltou às suas raízes de exploradores de olhos arregalados com todo o universo a descobrir. O Star Council mantém suas práticas de estudo individualizado e de apresentação e discussão em grupo. Alguns usam “ciência alienígena” derivada das práticas Thal’hun, mas também aceitam outros paradigmas adjacentes de hiperciência e tecnomagia. O Star Council não apoia oficialmente ações para expor segredos governamentais sobre extraterrestres, mas frequentemente procuram onde não deveriam. Normalmente tentam ser discretos, mas, se algo dá errado, um colega está sempre pronto a ajudar a dar cobertura. Recentemente, alguns jovens membros audaciosos inspiraram uma multidão a invadir a Área 51 por meio de um meme viral. Não foi tão útil para reunir informações secretas quanto esperavam, mas o Star Council iniciou vários membros novos após o evento.

A iniciação é uma convenção social importante no Star Council. O iniciado precisa se encontrar com os membros para estabelecer química social e apresentar uma tese informal de suas crenças sobre o extraterrestre e o futuro do universo ao resto do Star Council. Se o Star Council julgar que o iniciado está pronto e se encaixa bem, dão uma festa celebrando a nova adição ao conhecimento e à criatividade coletivos. O Star Council moderno aprendeu com seus erros com os Thal’hun e quer ter certeza de que novos iniciados contribuam sem desviar a missão da Afiliação para um rumo radicalmente diferente.

O Star Council de hoje é um bando de esquisitos frequentemente desprezados que atravessa gerações. Muitos deles enfrentam ou enfrentaram dificuldades de exclusão social e, por isso, construíram a sua própria. São rápidos em ajudar uns aos outros quando é preciso, e membros que passam por maus bocados costumam ser bem-vindos a ficar na casinha que o Star Council mantém para eventos sociais do grupo.

Nem todos começaram como entusiastas de OVNIs. Alguns só se interessaram pelo fenômeno depois de encontrar no Star Council uma comunidade que os aceitou. Um dos efeitos colaterais da filosofia do Star Council sobre extraterrestres é que, por pior que fique o mundo à sua volta, eles acreditam firmemente que a humanidade como um todo pode melhorar. Acreditam que há algo naquele pontinho azul de planeta chamado Terra que vale a pena atravessar galáxias para encontrar. Sua esperança persistente, ainda que devastadoramente ingênua às vezes, costuma ser sua maior força.]==] },
				["U.S. Government (Project Twilight)"] = { pt = [==[M20 Sorcerer, pág. 93


U.S. Government (Project Twilight)


Atributos Favorecidos: Destreza, Raciocínio

Caminhos Favorecidos: A maioria são psíquicos, mas magos estáticos comumente aprendem Divination, Fortune e Hellfire

Não existe nenhuma subdivisão de inteligência dos EUA, nem mesmo classificada, oficialmente conhecida como “Project Twilight” — esse é apenas o apelido que pegou. “Project Twilight” inclui departamentos de parainteligência de várias agências, como o Departamento de Defesa, a Agência de Segurança Nacional (NSA), a Agência Central de Inteligência (CIA), o Departamento de Assuntos Especiais do FBI e até projetos secretos dentro do Centro de Controle de Doenças e do Departamento do Interior. O apelido vem de agentes brincando sombriamente que sair em missão era como viver na “Twilight Zone” (Além da Imaginação), embora o apelido traga conotações diferentes para os agentes mais jovens.

Todos os projetos que caem sob o rótulo de Project Twilight são financiados por uma verba única chamada de despesas de “livro negro”, que o Congresso autoriza para operações de inteligência classificadas. Assim, a maioria dos indivíduos, mesmo em alguns dos mais altos níveis do governo, permanece sem saber da existência do projeto. As agências prefeririam que as coisas continuassem assim, já que extirpar a interferência sobrenatural intrometida no governo e manter isso em segredo do público é o trabalho dos agentes. Todos os agentes têm níveis chocantes de discricionariedade em suas funções. Nenhum jamais seria indiciado pelo que normalmente seria considerado grave abuso de poder, desde que justificado por impedir que vampiros e lobisomens corram soltos, ou por preservar a “segurança nacional”, como codificam os documentos oficiais. Mesmo que um superior achasse que o agente cruzou uma linha, ou várias, o agente simplesmente seria terminado, e nunca mais se ouviria falar dele. Isso é duplamente verdadeiro para os magos estáticos e psíquicos que trabalham para o governo.

Nem todos os agentes do Project Twilight são feiticeiros, mas muitos agentes de campo são. É bem mais fácil combater sobrenaturais barulhentos com uma variedade maior de ferramentas à disposição do governo. E é assim que muitos feiticeiros do Project Twilight são vistos: descartáveis. Agentes são enviados para lidar com tudo, de ataques Sabá a magos egocêntricos numa viagem de poder (o que quer dizer, a maioria deles). No mínimo, o salário é melhor que a maioria das outras formas de um feiticeiro ganhar a vida legalmente, ainda que não honestamente.

Muitos dos figurões respondem a mestres inteiramente diferentes. A Camarilla, a Tecnocracia, a Pentex e outros têm os dedos nas divisões de parainteligência para servir aos próprios objetivos, que muitas vezes coincidem com manter o público alheio ao sobrenatural. Por outro lado, os agentes nunca podem ficar bons demais em desenterrar o sobrenatural dentro das próprias organizações; os sobrenaturais envolvidos nas agências não permitem. Embora muitos agentes possam ser rigorosamente eficazes em campo, os conflitos de interesse inerentes aos níveis superiores servem para manter os agentes focados em assuntos fora de sua agência, e não em seus superiores.

Psíquicos são de interesse particular para o governo por vários motivos. Tendem a ter Força-de-Vontade bem acima da média, e suas habilidades tendem a funcionar sem necessidade de rituais longos ou equipamento especializado. Além disso, tendem a ser mais fáceis de aceitar como legítimos pelos não feiticeiros, por causa da quantidade imensa de mídia que retrata psíquicos trabalhando nas agências de três letras. Por causa da influência tecnocrata no governo e na cultura dos EUA, os magos estáticos nos projetos de parainteligência são majoritariamente tecnofeiticeiros.

Feiticeiros não afiliados à Tecnocracia dificilmente confiam em feiticeiros envolvidos com o Project Twilight, se o empregador deles (mesmo apenas o mundano) for conhecido. Nem mesmo outros feiticeiros do Project Twilight tendem a confiar uns nos outros, dada a frequência com que acabam espionando uns aos outros. O governo tem uma história longa e sangrenta de opressão de grupos de etnias, religiões e outras identidades minoritárias — que compõem a maioria dos covens de feiticeiros. Historicamente, a magia foi uma válvula para grupos oprimidos corrigirem injustiças e se protegerem quando os sistemas lhes falharam ou nunca foram desenhados para protegê-los em primeiro lugar.]==] },
				["Uzoma"] = { pt = [==[M20 Sorcerer, pág. 95


Uzoma


Atributos Favorecidos: Carisma, Raciocínio

Caminhos Favorecidos: Alchemy, Healing, Summoning, Binding, and Warding, Quintessence Manipulation

Originários das regiões iorubás da África, os Uzoma são os guardiões do mundo espiritual, intercedendo entre os orixás, os deuses de toda a criação, e a humanidade. Por anos serviram como sacerdotes e feiticeiros, chamados babalawos, dentro da cidade-estado sagrada de Ifé, mas, à medida que outras civilizações oprimiram e escravizaram seu povo, os Uzoma começaram a perder influência. Os Uzoma ganham poder dos orixás, os orixás ganham poder dos crentes e, à medida que seu povo era levado à escravidão, sua crença vacilou. Para onde quer que seu povo fosse levado, os Uzoma iam junto. No Novo Mundo, essa fé se fundiu a outras crenças, criando novas religiões: candomblé, vodum, macumba e outras. A fé Uzoma continuou, porém, oculta ao lado dessas novas fés, tanto em sua terra natal quanto na África. Com o passar do tempo, o peso da colonização diminuiu um pouco, e os velhos costumes ressurgiram entre as diásporas africanas.

Os Uzoma se organizam em grupos “familiares” chamados ilê, adotando uma abordagem discreta enquanto velam por seu povo e seu território. Depois de centenas de anos de influência externa, os Uzoma não permitem nenhuma interferência com seu povo. Quando os Uzoma intervêm, não há contenção, e eles golpeiam sem reservas. Enquanto seu mundo permanecer em paz, os Uzoma se contentam em observar e permanecer em segundo plano. Veem sua tarefa como a de servir de portais para os espíritos, não como a de magos. Os verdadeiros feiticeiros são os Nhanga, que servem a outros orixás de origem mais sombria. Os Uzoma se dedicam aos outros e ao seu povo, enquanto os Nhanga se põem acima dos demais. Frequentemente, feiticeiros e magos estrangeiros também são rotulados de Nhanga, devido às experiências passadas dos Uzoma com eles.

Cada orixá é único, e há mais de 400 deles, embora os Uzoma nem sempre concordem sobre os nomes e papéis de cada um. Cada orixá tem um número, uma cor, uma comida e uma dança que lhe são específicos; conhecer essas características é necessário para se comunicar apropriadamente com eles e conquistá-los. Cada indivíduo tem um orixá guia que influencia sua personalidade e comportamento, as aldeias adotam um orixá patrono, e os Uzoma escolhem orixás específicos a quem servem.

A magia que os Uzoma realizam se dá por ritual religioso, começando por louvar e agradecer a Olorun, o Dono do Céu. Os sacerdotes então apelam a orixás específicos, pedindo sua assistência mágica em troca do serviço passado dos Uzoma e para capacitá-los a mais serviço no futuro. Os rituais giram em torno de dança, tambores e canto como formas de alcançar o orixá. Formas diferentes de toque de tambor e de dança estão ligadas a certos rituais, e nunca são executadas fora deles. A performance é oferecida para chamar o orixá e convidá-lo a se juntar à comunidade dos Uzoma; o ritual inteiro é rito mágico, serviço religioso e celebração, tudo junto. Ao término do rito, o sacerdote é “montado” pelo orixá, que fala através dele como uma espécie de possessão, embora às vezes o orixá escolha não falar e apenas se una ao babalawo por um tempo.

O início da iniciação de um Uzoma começa com uma leitura do Ifá, uma coleção de patakis (ditos, mitos e histórias) consultada por meio de uma adivinhação com búzios. Os anciãos discernem o orixá guia pessoal do iniciado, o que ajuda a determinar a qual ilê ele pertence. O iniciado recebe seus elekes, colares abençoados pelo babalawo do ilê e que indicam sua casa. Isso dá início a um ano de serviço como ‘filho’. Eles se vestem de branco, seguem uma dieta estrita e não podem ser tocados durante seu tempo de serviço. Os dias são passados aprendendo os patakis com os sacerdotes da casa e aprendendo a lançar o Ifá. Depois de seu ano de serviço ao ilê, o ‘filho’ se torna um babalawo e inicia seu serviço ao seu povo e aos orixás. Embora todos os iniciados vão às terras iorubás da Nigéria, do Benim e do Togo para começar seu aprendizado, muitos retornaram para casa nas Américas e na Europa, dando continuidade ao retorno dos velhos costumes em novos lugares.]==] },
				-- <<< DESC_END
};
