-- Hedge Path Aspects, the pt half (SPEC I244f, V585, V210, V345 / T1426).
--
-- One entry per Aspect a Hedge Path offers in its Aspects window (HEDGE_ASPECTS, root form).
-- The 11 general Aspects of M20 Sorcerer p.13-14 sit under their bare name; under
-- '<Path>|<name>' sit the 23 a Path brings of its own and the 11 general ones a Path CHANGES,
-- whose body is the Path's sentence before the general ladder. descText tries '<Path>|<name>'
-- first and the bare name second (SPEC I244f(2)(3)), so one Aspect name can mean two things.
--
-- Its own module and not keys in descNumina: V32 holds every descNumina key to a picker item.
-- Three blocks separated by two blank lines (SPEC I21): source, name, body. The book title and
-- the name in block 2 do not translate; only p./pag. does. LF only (SPEC V345).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).
-- BUILT in T1426: the Path texts are cut by line from descNumina_<lang>.lua and the rest comes
-- from research/hedge_aspects.json (the pt of those is the translation made for T1426).

return {
				-- >>> ASPECT_DESC_BEGIN (generated - SPEC T1426)
				["Area"] = {
					pt = [==[M20 Sorcerer, pág. 13


Area


• Raio de 30 cm
•• Raio de 1 metro
••• Raio de 2 metros
•••• Raio de 3,5 metros
••••• Raio de 7,5 metros]==],
				},
				["Damage/Healing"] = {
					pt = [==[M20 Sorcerer, pág. 13


Damage/Healing


Para cada nível deste Aspecto, até dois dados de dano letal podem ser curados ou causados. Dois sucessos adicionais gastos neste Aspecto convertem o dano curado ou causado em agravado.]==],
				},
				["Distance"] = {
					pt = [==[M20 Sorcerer, pág. 13


Distance


Estas distâncias são referências para regiões povoadas. Para regiões menos povoadas, os números podem ser dobrados ou até triplicados. A Distância é usada para viagens, deslocamento e efeitos remotos. Para efeitos que emanam diretamente do mago estático, como magias de combate, use Alcance em vez disso.
• Apenas um ou dois metros
•• Até cerca de 6 metros
••• Até 30 metros
•••• Até 800 metros
••••• Até 8 km]==],
				},
				["Duration"] = {
					pt = [==[M20 Sorcerer, pág. 13


Duration


• Alguns minutos
•• Uma cena
••• Um ou dois dias
•••• Umas duas semanas
••••• Vários meses]==],
				},
				["Number of Targets"] = {
					pt = [==[M20 Sorcerer, pág. 13


Number of Targets


• Um único alvo
•• Dois alvos
••• Até 10
•••• Até 50
••••• Centenas]==],
				},
				["Metaphysical Weight"] = {
					pt = [==[M20 Sorcerer, pág. 13


Metaphysical Weight


• Criaturas simples, como animais pequenos e sem inteligência, a maioria dos Gafflings menores e os menores seres das hostes de um céu ou de um inferno
•• Criaturas maiores, como ursos ou lobos, Gafflings mais poderosos, fantasmas que começaram a aprender a navegar sua existência, mas não têm experiência
••• Humanos e seres verdadeiramente inteligentes, como a maioria dos Jagglings, fantasmas que conseguem navegar o submundo com eficácia, anjos menores, demônios servidores e elementais notáveis
•••• Humanos aprimorados, como carniçais, parentes (kinfolk) e outros feiticeiros, bem como Jagglings poderosos, Preceptores Umbrood e tentadores infernais
••••• Seres poderosos, como os verdadeiramente sobrenaturais (vampiros, lobisomens, magos, fadas etc.), Incarnae, os barões do inferno e os generais da hoste celestial]==],
				},
				["Passengers"] = {
					pt = [==[M20 Sorcerer, pág. 13


Passengers


• Você mesmo, mas sem roupas nem equipamento
•• Você mesmo, suas roupas e uma pequena quantidade de coisas
••• Você mesmo e mais uma pessoa ou o peso equivalente em coisas
•••• Dois passageiros
••••• Três passageiros]==],
				},
				["Range"] = {
					pt = [==[M20 Sorcerer, pág. 13


Range


• Apenas toque (exige um ataque de Briga bem-sucedido se o alvo não estiver disposto)
•• Menos de 3 metros
••• Menos de 7,5 metros
•••• Cerca de 15 metros
••••• Até 45 metros]==],
				},
				["Sympathetic Connection"] = {
					pt = [==[M20 Sorcerer, pág. 14


Sympathetic Connection


• Contato físico direto
•• Nome Verdadeiro
••• Parte do corpo, incluindo sangue, aparas de unha etc.
•••• Posse valiosa
••••• Qualquer posse]==],
				},
				["Travel Speed"] = {
					pt = [==[M20 Sorcerer, pág. 14


Travel Speed


• Cerca de três vezes mais rápido que a pé
•• Mais ou menos a velocidade de um carro
••• Como dirigir sem limites de velocidade nem sinais vermelhos
•••• Quilômetros são percorridos em segundos
••••• Viagem instantânea]==],
				},
				["Weight"] = {
					pt = [==[M20 Sorcerer, pág. 14


Weight


• Menos de 30 gramas
•• Alguns quilos
••• Até 45 kg
•••• Até 450 kg
••••• Objetos grandes, como carros ou elefantes, podem ser movidos]==],
				},
				["Divination|Time Period"] = {
					pt = [==[M20 Sorcerer, pág. 24


Time Period


• um dia

•• uma semana

••• um mês

•••• um ano

••••• 10 anos]==],
				},
				["Divination|Accuracy"] = {
					pt = [==[M20 Sorcerer, pág. 25


Accuracy


• Visões e sinais são incrivelmente vagos e difíceis de interpretar com qualquer certeza

•• Tipicamente precisos, mas profundamente enterrados em simbolismo

••• Precisos, mas vagos e abertos a más interpretações

•••• A verdade está lá sob camadas de simbolismo, mas não é terrivelmente difícil de interpretar

••••• Precisos e muitas vezes fáceis de entender, embora ainda sujeitos a erro humano]==],
				},
				["Divination|Query"] = {
					pt = [==[M20 Sorcerer, pág. 25


Query


• Uma pergunta simples que poderia ser respondida com sim ou não se você estivesse falando com uma pessoa em vez de com as estrelas ou as entranhas

•• Uma pergunta específica que pode ser respondida com uma explicação curta e simples. Por exemplo, “Qual estrada à frente é mais segura?”, mas não “Qual é o plano do nosso inimigo?”

••• A pergunta poderia ser pesquisada e respondida com conhecimento de fontes públicas, se apenas você tivesse as horas para dedicar.

•••• A pergunta pode ser detalhada e exigir informações ocultas, mas as informações poderiam ser descobertas com tempo e conhecimento suficientes.

••••• Uma consulta muito detalhada que normalmente exigiria informações perdidas, destruídas ou deliberadamente ocultadas para ser respondida.]==],
				},
				["Ephemera|Spiritual Reach"] = {
					pt = [==[M20 Sorcerer, pág. 25


Spiritual Reach


• O mago pode sentir espíritos e obter sua atenção, mas pouco mais pode fazer.

•• O mago está restrito a invocar um tipo geral de espírito

••• Agora espíritos específicos podem ser chamados por meio de rituais feitos sob medida, e quase sempre aparecem, a menos que o mago os tenha ofendido de alguma forma.

•••• Espíritos começam a se aproximar do mago sem serem solicitados. O mago consegue ver a Penumbra, o que aumenta o número e os tipos de espírito com os quais pode interagir. O mago também pode revidar contra espíritos, se precisar, embora a maioria tente evitar isso.

••••• O mago agora pode ir até os espíritos em vez de precisar que eles venham ao mundo físico. Embora a viagem física até a Umbra ainda seja impossível, o mago pode se projetar astralmente até lá, usando Raciocínio no lugar de Destreza, Manipulação no lugar de Força, Inteligência como Vigor e Força-de-Vontade como níveis de Vitalidade. Eles estão conectados ao seu corpo por um fio de prata e, se ficarem sem Força-de-Vontade, ele se rompe, cortando sua conexão e deixando-os presos.]==],
				},
				["Fascination|Allure"] = {
					pt = [==[M20 Sorcerer, pág. 29


Allure


• Adicione 1 dado às paradas de dados sociais
•• Adicione 2 dados às paradas de dados sociais
••• Adicione 3 dados às paradas de dados sociais
•••• Adicione 4 dados às paradas de dados sociais
••••• Adicione 5 dados às paradas de dados sociais]==],
				},
				["Fascination|Willbending"] = {
					pt = [==[M20 Sorcerer, pág. 29


Willbending


• Intrigante (Intriguing): Você atrai atenção mesmo em uma multidão, e os indivíduos o acham interessante em uma conversa a dois. Você pode fazer sugestões brandas que se alinhem com a personalidade e a situação do alvo, como deixar outra pessoa bêbada se estiverem em um bar.
•• Atraente (Alluring): Quase todos na reunião sabem que você estava lá, e os indivíduos tentarão encontrar uma maneira de vê-lo novamente. Você pode fazer sugestões fortes que se alinhem com a personalidade e a situação do alvo, como ir para casa com o mago estático (hedge wizard) após uma noite divertida.
••• Ludibriante (Beguiling): Todos presumem que você teve participação na organização da festa, e os indivíduos ao seu redor disputarão sua atenção. Você pode fazer sugestões que não se alinhem necessariamente com a personalidade e a situação do alvo, como sugerir que terminem com seu parceiro de longa data para dar ao conjurador da magia uma chance de uma única vez.
•••• Arrebatador (Entrancing): Com convite ou não, a festa é realizada em sua homenagem, na estimativa de todos. Os indivíduos não querem mais apenas sua atenção, eles anseiam por sua aprovação, possivelmente fazendo papel de bobos no processo. Você pode fazer sugestões fortes que não se alinhem com a personalidade ou os interesses do alvo, como sugerir que o alvo lute contra outra pessoa para defender a honra do mágico.
••••• Escravizador (Enthralling): Se você começasse a atirar coisas, este lugar se tornaria um tumulto em escala total; os presentes se veem em dificuldade para resistir aos seus pedidos, fazendo quase qualquer coisa que você venha a pedir. Inferno, eles podem até matar por você ou colocar a vida em risco por você se você pedir do jeito certo. Você pode fazer sugestões fortes que desafiem descaradamente o caráter e as circunstâncias do alvo, como sugerir que a vítima da magia incendeie um bar por ousar anunciar a última rodada.]==],
				},
				["Fortune|Severity"] = {
					pt = [==[M20 Sorcerer, pág. 31


Severity


• Uma bênção ou maldição menor, geralmente algo simples, como um ato falho ou conseguir pegar por muito pouco um ônibus de que o alvo precisa.
•• Um inconveniente, ferimento ou pequeno benefício duradouro, mas não permanente. Torções, doenças que não ameaçam a vida e objetos quebrados são o padrão da má sorte, enquanto a boa sorte pode ser tão simples quanto evitar a gripe por uma estação, uma pequena vantagem em combate ou a resolução de um obstáculo menor.
••• Um grande reverso ou bônus. Doenças temporárias, mas graves, e sérias gafes sociais são as maldições mais comuns, enquanto encontrar burocratas prestativos, sucesso com jogos de azar ou relacionamentos, ou um dado adicional em paradas de combate são as bênçãos mais comuns.
•••• Agora as bênçãos e as maldições podem ter efeitos sérios e permanentes. Ferimentos debilitantes, falência, uma tragédia social que deixa o alvo um pária, ganhar na loteria, sobreviver a uma morte quase certa, ou apenas um encontro casual que muda a posição social do alvo são todos possíveis.
••••• Maldições neste nível quase sempre resultam em uma morte dolorosa e incomum. Alvos são decapitados, sofrem doenças degenerativas incuráveis, sofrem acidentes de carro horríveis e mais. As bênçãos são igualmente dramáticas, como ser resgatado de uma execução estatal por uma ligação do governador. Outras salvações de última hora de uma morte certa são possíveis, mas também vitórias muito mais raras que uma em um milhão: um inimigo em combate pode tropeçar e quebrar o pescoço, o beneficiário pode encontrar um tomo perdido na cesta de promoções de uma livraria de usados, ou pode ganhar um cargo político sem nenhum reconhecimento de nome.]==],
				},
				["Hellfire|Special Effects"] = {
					pt = [==[M20 Sorcerer, pág. 34


Special Effects


• Decadência (Decay): Em vez de causar dano a alvos vivos, a magia decompõe qualquer coisa que eles estejam vestindo ou carregando. Para cada ponto de dano que ela causaria, pode transformar três libras de material em lixo.
• Tempestade de Poeira (Dust Storm): A magia invoca uma tempestade de poeira, varrendo a área (que deve ter pelo menos três pontos) e, além do dano, causando cegueira na área por um turno por nível de Vitalidade infligido.
• Água-Neve (Sleet): Um jato de gelo e água congelante causa cegueira breve e deixa o chão escorregadio. Isto não pode ser tornado agravado.
• Fumaça (Smoke): O conjurador emite uma nuvem de fumaça venenosa que envolve a área (que deve ter pelo menos três pontos no Aspecto Área). Todos dentro da nuvem sofrem um nível de dano por turno, a menos que estejam protegidos. Uma máscara de gás normal fornece dois turnos de proteção antes de se tornar inútil. Seres que não precisam respirar são imunes a esse dano. A visão, mesmo que aprimorada, fica completamente obscurecida enquanto se está dentro da nuvem.
•• Terremoto (Earthquake): a magia faz o chão se abrir e engolir, e então esmagar, o alvo. Ele pode rolar Força com dificuldade 6 para tentar cavar e se libertar. Precisa de tantos sucessos quantos os níveis de Vitalidade de dano que sofreu. Isto não pode ser tornado agravado.
•• Relâmpago (Lightning): Em vez de fogo, a magia dispara um raio de eletricidade. Qualquer um em contato com o alvo através de um material condutor sofre o mesmo dano que o alvo.
•• Emaranhado de Madeira (Tanglewood): As plantas se agitam e atacam o alvo, lançando espinhos, lascas e outros pedaços de madeira contra ele. Com sorte extrema (pelo menos três sucessos além do exigido pela magia), isto pode empalar um vampiro, mas um mago que conte com isso provavelmente ficará muito decepcionado. Se o alvo estiver em vegetação densa, ele é capturado pelas plantas. Uma criatura contida dessa forma não pode se mover até acumular tantos sucessos em um teste de Força (dificuldade 7) quanto o dano causado pela magia. Isto não pode ser tornado agravado.
•••• Maré Afogadora (Drowning Tide): Isto requer uma piscina de tamanho olímpico ou um corpo de água maior. O alvo é puxado para debaixo da água por uma onda súbita ou por uma correnteza, fazendo com que comece a se afogar (veja M20 página 440-441). Escapar da água requer um teste estendido de Força, dificuldade 8, com pelo menos dois sucessos necessários, muitas vezes mais. Isto causa apenas dano por afogamento.

Os Efeitos Especiais acima devem ser comprados com Pontos de Bônus (Freebie) ou Pontos de Experiência, a um custo igual ao valor em pontos + 1.]==],
				},
				["Illusion|Senses"] = {
					pt = [==[M20 Sorcerer, pág. 35


Senses


• Afeta um sentido
•• Afeta dois sentidos
••• Afeta três sentidos
•••• Afeta quatro sentidos
••••• Amplitude sensorial completa]==],
				},
				["Illusion|Realism"] = {
					pt = [==[M20 Sorcerer, pág. 35


Realism


• Completamente imóvel e fixa; se visual, plana
•• Muda com a perspectiva, de modo que o movimento do observador não a desfaz imediatamente
••• As ilusões podem ter partes móveis, mas somente grandes
•••• Movimentos e variações menores são possíveis, mas ainda há indícios sutis
••••• Totalmente imersiva, este nível engana completamente todos os sentidos visados]==],
				},
				["Maelstroms|Intensity"] = {
					pt = [==[M20 Sorcerer, pág. 38


Intensity


• Trazer uma brisa e neblina do submundo para o mundo dos vivos pacifica as Terras das Sombras locais. Os fantasmas na área são acalmados. Eles se defenderão, mas fora isso não atacarão ninguém na área durante a duração, a menos que obtenham sucesso em um teste de Força-de-Vontade (dificuldade 6).
•• Uma tempestade de chuva é invocada, e ela drena tanta energia do submundo que os fantasmas ficam congelados no lugar, a menos que façam um teste de Força-de-Vontade (dificuldade 7). Eles são tornados corpóreos apenas o suficiente para que o mago possa movê-los fisicamente. Normalmente, eles removem os fantasmas de uma área onde não são bem-vindos.
••• Convocar uma tempestade de trovões em escala total faz ainda mais para silenciar as Terras das Sombras. Isso drena o poder do Esquecimento (Oblivion) da área. Os fantasmas são sedados como no primeiro nível, mas aqueles sob controle de suas Sombras têm a razão restaurada. Os resultados variam com os espectros, mas existem lendas de magos estáticos (hedge magicians) com este Caminho arrancando um espectro do Esquecimento.
•••• Tempestades poderosas no mundo dos vivos, com ventos de força de vendaval, granizo e muitos danos à propriedade, podem realmente esgotar o poder do Esquecimento nas Terras das Sombras. Espectros e outros fantasmas profundamente maliciosos que falhem em um teste de Força-de-Vontade (dificuldade 8) desaparecem dentro da barragem de vento e granizo. Nenhum mago estático sabe com certeza o que acontece com esses espíritos, mas eles nunca são vistos no local onde o poder foi evocado por um ano e um dia.
••••• Uma tempestade massiva que drena toda a energia da região correspondente das Terras das Sombras. Tanto a área quanto seu reflexo nas Terras das Sombras tornam-se completamente inabitáveis para fantasmas. Os Mortos Inquietos (Restless Dead) devem fugir da área, ou então sofrer cinco dados de dano por rodada até que o façam.]==],
				},
				["Necromancy|Ghost Binding"] = {
					pt = [==[M20 Sorcerer, pág. 39


Ghost Binding


• O conjurador pode ver, ouvir e falar com fantasmas em suas proximidades, esteja ele em qualquer um dos lados da Mortalha (Shroud).
•• O mágico agora pode aterrorizar os mortos inquietos. Enchendo-se com a energia necrótica das Terras das Sombras, os mortos podem vê-lo como vivo, mas imbuído do poder da morte. Isso resulta em –2 de dificuldade em todos os testes de Intimidação e Lábia contra os mortos.
••• O conjurador força um fantasma a assumir uma forma corpórea, quer ele pudesse fazê-lo por conta própria ou não. Pela duração, o fantasma é, para todos os efeitos, uma pessoa viva novamente, incluindo os sete níveis de Vitalidade habituais. Se morto, porém, ele não simplesmente retorna a ser um fantasma. Em vez disso, a experiência transforma o fantasma em um espectro, um fantasma consumido pelos poderes do Oblívio (Oblivion) e subserviente a eles. E esse espectro guarda rancor contra o conjurador.
•••• Qualquer fantasma pode ser convocado até o conjurador neste nível. Tudo de que o mágico precisa é o Nome Verdadeiro (True Name) do fantasma e ganhar um teste resistido de Força-de-Vontade. Se o necromante for bem-sucedido, o fantasma deve então chegar imediatamente. Tenha em mente que a maioria dos mortos não se torna fantasma, e a maioria dos fantasmas não aprecia ser convocada.
••••• Os mestres da Necromancia podem impor obediência aos mortos. Além do teste do Caminho, eles devem ganhar um teste resistido de Força-de-Vontade. Se conseguirem, podem exigir que o fantasma realize uma tarefa simples ou responda a uma pergunta simples da melhor forma que puder. Para tarefas, o Aspecto Duração cobre por quanto tempo o fantasma deve tentar realizá-la.]==],
				},
				["Necronics|Impedance"] = {
					pt = [==[M20 Sorcerer, pág. 41


Impedance


• O mágico inunda o submundo local com energia elétrica, desligando todos os poderes fantasmagóricos ativos. Os fantasmas podem ignorar isso, continuando como estavam, se obtiverem sucesso em um teste de Força-de-Vontade (dificuldade 8).
•• Neste nível, em vez de apenas interromper uma assombração, o mágico pode aumentar o índice da Mortalha (Shroud). Isso custa um sucesso por grau aumentado, com o primeiro grau incluído no custo básico do feitiço (assim, além dos requisitos normais, são necessários 2 sucessos para aumentar a Mortalha de 6 para 9).
••• Lugares podem ser defendidos de assombrações pela simples técnica de enganar o fantasma para que ele assombre outro lugar. Neste grau, o mágico pode criar uma armadilha, um reino falso que o fantasma pode assombrar em vez do local real. Um fantasma pode perceber que foi enganado com um teste de Raciocínio + Enigmas (dificuldade 8) e pode escapar com outro.
•••• Neste nível, o mágico pode usar diretamente sua bioeletricidade como um ataque contra um fantasma. Ao usar este grau da Necrônica, os Aspectos Área e Duração são substituídos por Dano e Alcance.
••••• Os mestres deste Caminho são capazes de devastar uma região das Terras das Sombras e seus habitantes. Eles chamam isso de “criar um zero”, e “formatam” o espaço para um padrão predefinido. Quando bem-sucedidos, não sobra nada. Pela duração do feitiço, a região se torna inabitável para fantasmas, fazendo com que os Mortos Inquietos (Restless Dead) perdam Corpus a uma taxa de 3 por turno até que consigam escapar da área. Se não conseguirem escapar antes de esgotar seus níveis de Corpus, eles desaparecem. Os mágicos geralmente acreditam que esses fantasmas foram completamente destruídos, em vez das consequências usuais de esgotar o Corpus. Como nenhum especialista em Necrônica jamais viu um que tenha sobrevivido a ser “zerado”, este parece ser o melhor palpite.]==],
				},
				["Oneiromancy|Dreamwalking"] = {
					pt = [==[M20 Sorcerer, pág. 42


Dreamwalking


• A Oniromancia básica permite que o mágico toque os sonhos dos outros, vendo lampejos de imagens que poderiam ser interpretados para obter percepções sobre a natureza e a história de seu alvo.
•• O oniromante agora pode entrar nos sonhos dos outros, não apenas vê-los. Ele se torna parte do sonho, forçado a assumir um papel apropriado ao próprio sonho. Uma vez no sonho, mudanças podem ser feitas. A magnitude das mudanças determina a dificuldade de um teste adicional de Oniromancia, sendo a criação de pequenos itens dificuldade 6, mas violar o tema do sonho dificuldade 8, talvez com um Limiar (Threshold).
••• Os Caminhantes de Sonhos agora podem observar os sonhos de fora, vendo-os claramente sem serem puxados para dentro deles. Agora eles podem verdadeiramente transformar os sonhos que encontram. Com este grau, podem criar terrores que imitam o Defeito Pesadelos (Nightmares) ou acalmar um sonho até o ponto de ajudar o sonhador a recuperar um ponto adicional de Força-de-Vontade temporária.
•••• Os Envios de Sonho (Dream Sendings) se tornam disponíveis para o conjurador neste nível. Ele pode elaborar sequências oníricas específicas e detalhadas para seu alvo, que se repetem uma vez por sucesso. Se elas se repetirem mais de uma ou duas vezes por noite, o alvo pode começar a suspeitar que seus sonhos estão sendo manipulados.
••••• Os mestres da Oniromancia podem criar sonhos compartilhados, trazendo uma pessoa para o sonho por cada sucesso no teste de conjuração. O ambiente começa como uma mistura de suas influências subconscientes, mas o oniromante pode manipulá-lo ainda mais usando níveis inferiores do Caminho.]==],
				},
				["Quintessence Manipulation|Flow"] = {
					pt = [==[M20 Sorcerer, pág. 44


Flow


• Sentir os Arredores (Sense Surroundings): Sentir as energias da área torna-se uma tarefa rotineira. Com um momento de meditação ou invocação, um feiticeiro determina se uma área ou item está carregado de poder (seja Quintessência, sangue de vampiro, Gnosis ou outra fonte mística). Com três sucessos, o feiticeiro identifica a Ressonância dessa energia.

•• Percepção Focada (Focused Awareness): A capacidade de sentir o fluxo e o refluxo da energia transcende os arredores locais e o inanimado e cruza para o domínio dos indivíduos. Agora o feiticeiro pode perceber outro indivíduo usando magias sutis e isso lhe permite ver meridianos obstruídos ou fluxos de energia ocluídos. Isso revela maldições deixadas sobre indivíduos ou fluxo de Quintessência bloqueado através do corpo, imposto por perturbações maliciosas. A capacidade de avaliar o potencial mágico em um sujeito também se torna disponível. Embora especialmente útil para identificar ameaças em potencial, a quantidade de informação obtida dessa maneira carece de nuance detalhada para definir plenamente se o sujeito é uma criatura sobrenatural ou um humano normal com certa aptidão.

••• Perturbar (Disrupt): Não mais restrito a observar, agora o feiticeiro habilidoso pode começar a afetar a Quintessência ao seu redor. Ainda incapaz de dobrar e manipular a energia com graça, o praticante deste caminho é ao menos versado o suficiente para causar perturbações no fluxo ao seu redor. Com sua invocação ou foco, o feiticeiro pode aquietar o fluxo na área local, fazendo com que uma fonte de Quintessência se torne dormente por um tempo. Perturbar também pode significar desviar. Um fluxo de Quintessência pode ser desviado e enviado por um novo caminho de maneira muito semelhante. Alternativamente, com algum esforço um praticante pode aprisionar uma partícula de Quintessência em um objeto simples por um tempo limitado.

•••• Controlar (Control): A mera força bruta dá lugar ao controle nuançado do fluxo de Quintessência dentro de si mesmos, do mundo ao seu redor e dentro do padrão dos outros. Os fluxos de energia através de si mesmos são agora rios correntes com canais dosados e comportas que permitem ao praticante aproveitar a Quintessência em um lugar de poder. Cada sucesso em um esforço deste tipo permite ao feiticeiro canalizar um ponto de Quintessência por sucesso, até o limite do poder daquela área. A Quintessência extraída dessa forma se dissipa a menos que seja usada no próximo turno.

O fluxo de energia de um inimigo agora é um alvo viável para perturbação neste nível de compreensão. Retirar a energia da reserva de outra pessoa destrói uma Quintessência por cada sucesso rolado. Energias mais alienígenas de outras criaturas sobrenaturais ainda são acessíveis, mas fazê-lo é mais desgastante. A energia de outras criaturas sobrenaturais é perturbada em um ponto por cada dois sucessos.

O fluxo de energia através do padrão de um indivíduo é essencial para sua saúde. Um feiticeiro com esse conhecimento pode causar grande dano ou proporcionar grande ajuda, ainda que ao longo de um período prolongado, por meio de algo semelhante a uma maldição ou a uma bênção. Alterar o fluxo da energia vital de outra pessoa pode promover ou deteriorar sua saúde, mas leva muito tempo para se tornar evidente. Ela adoece com mais frequência, achando difícil combater um simples resfriado, e leva mais tempo para se recuperar de um ferimento simples. Se não for controlado, ela inevitavelmente será vítima de um carcinógeno ambiental ou de uma enfermidade que corre em seu histórico familiar. Por outro lado, beneficiar o fluxo de Quintessência em um indivíduo fará com que o receptor quase nunca fique doente por mais de um dia, recuperando-se de qualquer ferimento como se fosse um mero inconveniente e vivendo até uma idade avançada. Por meio desta função, o mago estático pode conceder Qualidades (Merits) físicas ou infligir Defeitos (Flaws) físicos, gastando 2 sucessos por ponto da Qualidade ou do Defeito.

••••• Governar (Rule): Os mestres da Manipulação de Quintessência alcançaram um nível de compreensão que põe o fluxo de energia à sua disposição, impressionando até os Despertos. Agora, a Quintessência armazenada pode ser diretamente infundida em contramagia, adicionando dados às paradas de dados (dice pools) de contramagia. Sentindo a Quintessência sendo direcionada, o feiticeiro pode interromper o fluxo de energia, impedindo que outro feiticeiro use a Quintessência que possui. Cada sucesso bloqueia um ponto de Quintessência ou Tass de potencializar um efeito.]==],
				},
				["Shadows|Shadowgrip"] = {
					pt = [==[M20 Sorcerer, pág. 46


Shadowgrip


A severidade e a persistência das sombras controladas são aferidas pelo Domínio das Sombras de cada um. Quando um alvo tenta resistir ao Caminho das Sombras, ele faz um teste de Força-de-Vontade com uma dificuldade determinada pelo Aspecto selecionado. Qualquer sucesso encerra o efeito no turno seguinte ou após um minuto.

• Aprofundar (Deepening): Trazer as sombras mais profundamente para nossa visão pode criar uma atmosfera distrativa e intimidadora. Dentro de uma área, a iluminação geral em si pode não mudar propriamente, mas as sombras se aprofundam, e até os sons tornam-se ligeiramente sufocados nas bordas. Essas sombras também podem ser lançadas sobre outros para conferir os benefícios do Caminho, como um bônus em testes de Furtividade em condições sombrias.

•• Moldar (Shaping): Assumindo maior maestria sobre o material escuro que compõe a sombra, o feiticeiro agora imprime padrão e intenção em sua tecelagem de sombras. Após uma conjuração bem-sucedida, o feiticeiro adiciona dois dados a qualquer parada de dados (dice pool) envolvendo Intimidação ou Furtividade, bem como a qualquer teste de Lábia para ocultar sua identidade. Inversamente, as sombras podem cercar um indivíduo e lançar dúvida e confusão sobre os sentidos da vítima. Neste nível de maestria, elas são fortes o suficiente para fazer o alvo hesitar ou reconsiderar suas ações devido ao desconforto não identificável. Isso causa ao alvo uma penalidade de –1 em rolagens feitas para esquivar ou que dependam de tempo de reação rápido. Um teste de Força-de-Vontade com dificuldade 6 permite à vítima afastar as sombras de seus olhos e concentrar-se na tarefa em mãos.

••• Entrincheirar (Entrenching): Não satisfeito em meramente fortalecer as sombras, o feiticeiro agora anima a própria matéria-sombra, deixando-a mudar e agitar-se ao seu redor. Caso leve suas habilidades de aprofundamento ainda mais longe, a luz agora fenece no local visado, e a cor irá dessaturar antes das sombras. Afetar outra pessoa agora é muito mais eficaz. As sombras mudam e se distorcem em seus olhos, e sussurros inquietantes podem ser ouvidos quando a vítima se aproxima demais de uma poça de sombra acumulada. Ser assediado dessa maneira causa uma dificuldade de –1 em todos os testes. O efeito pode ser rompido com um teste de Força-de-Vontade com dificuldade 7. Por fim, o conjurador pode fazer as sombras tremularem ou tremerem, criando distrações visuais e aumentando em um a dificuldade de todos os ataques à distância feitos contra o beneficiário.

•••• Comandar (Commanding): A “disposição” da sombra para agir tornou-se pura avidez. O tormento que a matéria-sombra visita sobre os inimigos do feiticeiro é enlouquecedor e agora causa uma dificuldade de –2 em todos os testes feitos pelo alvo. Qualquer tentativa de se libertar exige um teste de Força-de-Vontade com dificuldade 8 e pode lançar alguns inimigos em frenesi ou fúria se falharem. Envolver um alvo em sombras benevolentes concede +4 em todas as paradas de dados de Intimidação e Furtividade e em qualquer parada de dados de Lábia usada para mascarar a própria identidade.

••••• Governar (Ruling): As sombras sabem quem é seu mestre e agem imediatamente com abandono ao chamado do feiticeiro. Inimigos podem ser reduzidos a um monte tagarela no chão pelas horríveis sombras maléficas. Os oponentes devem obter sucesso em um teste de Força-de-Vontade com dificuldade 9 ou serão reduzidos à inutilidade, desabando no chão. Esse teste pode ser repetido em cada um dos turnos do alvo, mas o alvo só pode agir normalmente em um turno no qual obtenha um sucesso. Se o alvo deixar a área afetada, recupera a capacidade de agir normalmente. A escuridão que engolfa aqueles que desejam permanecer invisíveis é quase impenetrável de fora e de dentro, salvo para o próprio feiticeiro, diminuindo em um a dificuldade dos testes de Furtividade. Essa escuridão carrega um peso tão palpável que pode danificar equipamentos de gravação engolfados por sua influência.]==],
				},
				["Shapeshifting|Scale"] = {
					pt = [==[M20 Sorcerer, pág. 47


Scale


• Apenas alterações cosméticas, como a cor dos olhos ou o crescimento do cabelo.

•• Alterações pequenas mas perceptíveis, como o crescimento de garras ou escamas.

••• O mago pode transformar uma única parte do corpo na de alguma outra criatura.

•••• Meia-Transformação (Half-Shift): o mago pode transformar metade de seu corpo na de um animal ou assumir uma forma a meio caminho entre humano e animal.

••••• Transformação Completa (Full Shifting): O mago pode se transformar completamente em um animal.]==],
				},
				["Shapeshifting|Subject"] = {
					pt = [==[M20 Sorcerer, pág. 47


Subject


••• O mago só pode afetar a si mesmo.

•••• O mago pode transformar outro alvo.

••••• O mago pode afetar dois sujeitos ao mesmo tempo.]==],
				},
				["Shapeshifting|Disparity"] = {
					pt = [==[M20 Sorcerer, pág. 47


Disparity


••• Apenas uma única característica animal.

•••• O mago pode assumir duas transformações não relacionadas, como a cabeça de um animal e o corpo de outro.

••••• Três transformações não relacionadas são possíveis.]==],
				},
				["Starlight|Wending"] = {
					pt = [==[M20 Sorcerer, pág. 48


Wending


• O limiar é o primeiro obstáculo que um navegador deve dominar. Com foco e vontade, qualquer portal pode servir como limiar para as Terras das Sombras. A porta permanece aberta apenas para o navegador e permitirá que ele e seus passageiros passem. Companheiros de viagem se beneficiam do mesmo efeito de preservação da vida que o conjurador, desde que permaneçam ao alcance da visão de seu navegador. Qualquer um que tente reabrir a porta depois de fechada encontrará o limiar mundano correspondente. Esta porta desmorona depois de ter sido reaberta e fechada novamente pelo navegador durante seu retorno das Terras das Sombras, ou desmoronada deliberadamente pelo navegador para fechar o caminho atrás de si. Uma porta diferente nas Terras das Sombras pode ser usada para reentrar nas Terras da Pele (Skinlands), mas outra ativação de Luz das Estrelas deve ser realizada para criar o novo limiar. Há uma desvantagem nesta técnica; O destino nas Terras da Pele é difícil de saber sem mais capacidades como navegador.

•• As Terras das Sombras são mais familiares para um navegador deste nível. A confiança cresce em seu peito, e o reino dos mortos parece muito menos assustador. Enquanto viaja nas Terras das Sombras, o navegador se beneficia de –1 de dificuldade em todas as rolagens de Sensitividade, Liderança, Sobrevivência e Ocultismo referentes a este ambiente, bem como em rolagens de Força-de-Vontade para superar medo e intimidação.

••• O navegador encontrou um ponto nas Terras das Sombras que é semelhante à sua própria Estrela do Norte pessoal. Não importa onde esteja nas Terras das Sombras, desde que possa ver esta estrela, o navegador tem uma compreensão geral de onde poderá sair para as Terras da Pele ao abrir um novo limiar.

•••• A familiaridade com as Terras das Sombras agora é palpável para quaisquer companheiros de viagem que o navegador tenha trazido consigo. Os companheiros de viagem do navegador se beneficiam de –1 de dificuldade em rolagens de Força-de-Vontade feitas para superar medo e intimidação, bem como em rolagens de Sensitividade e Sobrevivência feitas dentro das Terras das Sombras.

••••• A luz-guia do navegador dentro das Terras das Sombras é visível para ele mesmo com os olhos fechados. Não importa quão profundamente viaje ou quão desorientado possa ficar, o navegador sempre será capaz de encontrar seu caminho até uma porta de volta para as Terras da Pele. Além disso, ele sabe exatamente para onde levará sua saída das Terras das Sombras.]==],
				},
				["Summoning, Binding, and Warding|Warding Strength"] = {
					pt = [==[M20 Sorcerer, pág. 49


Warding Strength


Proteção tem Duração e Força, cada nível da qual subtrai um dado de todas as ações que o ser invocado realiza contra o mago. Com três sucessos, a Força de Proteção permite a criação de um Círculo de Proteção, que o ser não pode atravessar sem uma rolagem de Força-de-Vontade (dificuldade 6) na qual obtenha mais sucessos que o mago.]==],
				},
				["Summoning, Binding, and Warding|Binding Intensity"] = {
					pt = [==[M20 Sorcerer, pág. 49


Binding Intensity


• A criatura não pode agir diretamente contra o mago.

•• Qualquer pergunta isolada deve ser respondida com sinceridade.

••• Todas as perguntas durante a duração devem ser respondidas com sinceridade, e o ser pode ser obrigado a realizar um serviço, embora possa interpretar a ordem liberalmente desde que a satisfaça literalmente.

•••• Uma única tarefa é realizada conforme instruído, seguindo as ordens de perto.

••••• O mago pode transferir controle limitado do vínculo para outra pessoa. O ser realiza uma tarefa para ela e responde a quaisquer perguntas que o invocador lhe faça.]==],
				},
				["Weather Control|Intensity"] = {
					pt = [==[M20 Sorcerer, pág. 50


Intensity


• Apenas pequenas mudanças. Isso inclui brisas quentes ou frias, mudanças leves mas perceptíveis na temperatura e fazer o fogo bruxulear e flamejar momentaneamente.

•• O trabalhador do clima pode causar efeitos menores que não causam dano direto. O feiticeiro pode invocar uma névoa densa que impõe penalidades de percepção (veja Mage 20 p. 435), limpar um céu nublado ou criar ventos na direção que desejar.

••• Um feiticeiro pode formar e dissipar tempestades de chuva simples. Ventos fortes podem impor uma penalidade a ataques à distância, desviando o projétil de seu curso e causando dificuldades para mirar. O trabalhador do clima também pode alterar a temperatura em até 30 graus Fahrenheit em qualquer direção. Dependendo da temperatura inicial, isso pode impor ou remover penalidades de doenças causadas pelo calor ou de hipotermia. Enchentes repentinas também podem ser mortais.

•••• A força da tempestade de um trabalhador do clima aumenta. Ele agora pode comandar ventos de força de vendaval, relâmpagos, granizo e outros efeitos climáticos danosos. Agora pode escolher indivíduos como alvo para receber o impacto da tempestade, e os efeitos danosos causam 4 + sucessos de dano. Relâmpagos causam dano letal, enquanto o dano contundente resulta do granizo. Outros efeitos também podem causar dano, dentro do razoável. Efeitos climáticos podem causar penalidades moderadas àqueles apanhados nas tempestades.

••••• O feiticeiro pode causar efeitos extremos. Tempestades com trovões estão bem ao alcance do trabalhador do clima. Tornados destrutivos e outras atividades meteorológicas poderosas podem rasgar uma cidade. O feiticeiro pode causar 6 + sucessos contundente ou letal a cada 15 minutos àqueles no caminho da tempestade. Qualquer um apanhado na tempestade também sofre penalidades ambientais máximas.]==],
				},
				["Fortune|Duration"] = {
					pt = [==[M20 Sorcerer, pág. 31


Duration


A Fortuna usa o Aspecto Duração (Duration), mas trata todas as durações como um nível acima, com Duração 5 consistindo em magias que duram vários anos.

M20 Sorcerer, pág. 13

• Alguns minutos
•• Uma cena
••• Um ou dois dias
•••• Umas duas semanas
••••• Vários meses]==],
				},
				["Fortune|Number of Targets"] = {
					pt = [==[M20 Sorcerer, pág. 31


Number of Targets


Além disso, usa o Aspecto Número de Alvos (Number of Targets), mas todos os alvos devem ser relacionados (membros de uma família, a população de uma cidade pequena, etc.).

M20 Sorcerer, pág. 13

• Um único alvo
•• Dois alvos
••• Até 10
•••• Até 50
••••• Centenas]==],
				},
				["Healing|Damage/Healing"] = {
					pt = [==[M20 Sorcerer, pág. 33


Damage/Healing


Este caminho usa o Aspecto Dano/Cura (Damage/Healing). Dano contundente pode ser curado com um sucesso por nível de dano. Além disso, cada sucesso pode reduzir uma toxina, doença ou penalidade de ferimento (causada por dor, em vez de um membro faltante, por exemplo) em um nível. Veja Mage 20 p. 406 para informações sobre penalidades de ferimento e p. 442 para a tabela de toxinas e doenças.

M20 Sorcerer, pág. 13

Para cada nível deste Aspecto, até dois dados de dano letal podem ser curados ou causados. Dois sucessos adicionais gastos neste Aspecto convertem o dano curado ou causado em agravado.]==],
				},
				["Weather Control|Distance"] = {
					pt = [==[M20 Sorcerer, pág. 50


Distance


O Controle do Clima usa os Aspectos Distância (trate a medida na tabela como o raio de efeito), Duração e Intensidade:

M20 Sorcerer, pág. 13

Estas distâncias são referências para regiões povoadas. Para regiões menos povoadas, os números podem ser dobrados ou até triplicados. A Distância é usada para viagens, deslocamento e efeitos remotos. Para efeitos que emanam diretamente do mago estático, como magias de combate, use Alcance em vez disso.
• Apenas um ou dois metros
•• Até cerca de 6 metros
••• Até 30 metros
•••• Até 800 metros
••••• Até 8 km]==],
				},
				["Necronics|Area"] = {
					pt = [==[M20 Sorcerer, pág. 41


Area


•••• Neste nível, o mágico pode usar diretamente sua bioeletricidade como um ataque contra um fantasma. Ao usar este grau da Necrônica, os Aspectos Área e Duração são substituídos por Dano e Alcance.

M20 Sorcerer, pág. 13

• Raio de 30 cm
•• Raio de 1 metro
••• Raio de 2 metros
•••• Raio de 3,5 metros
••••• Raio de 7,5 metros]==],
				},
				["Necronics|Duration"] = {
					pt = [==[M20 Sorcerer, pág. 41


Duration


•••• Neste nível, o mágico pode usar diretamente sua bioeletricidade como um ataque contra um fantasma. Ao usar este grau da Necrônica, os Aspectos Área e Duração são substituídos por Dano e Alcance.

M20 Sorcerer, pág. 13

• Alguns minutos
•• Uma cena
••• Um ou dois dias
•••• Umas duas semanas
••••• Vários meses]==],
				},
				["Necronics|Damage/Healing"] = {
					pt = [==[M20 Sorcerer, pág. 41


Damage/Healing


•••• Neste nível, o mágico pode usar diretamente sua bioeletricidade como um ataque contra um fantasma. Ao usar este grau da Necrônica, os Aspectos Área e Duração são substituídos por Dano e Alcance.

M20 Sorcerer, pág. 13

Para cada nível deste Aspecto, até dois dados de dano letal podem ser curados ou causados. Dois sucessos adicionais gastos neste Aspecto convertem o dano curado ou causado em agravado.]==],
				},
				["Necronics|Range"] = {
					pt = [==[M20 Sorcerer, pág. 41


Range


•••• Neste nível, o mágico pode usar diretamente sua bioeletricidade como um ataque contra um fantasma. Ao usar este grau da Necrônica, os Aspectos Área e Duração são substituídos por Dano e Alcance.

M20 Sorcerer, pág. 13

• Apenas toque (exige um ataque de Briga bem-sucedido se o alvo não estiver disposto)
•• Menos de 3 metros
••• Menos de 7,5 metros
•••• Cerca de 15 metros
••••• Até 45 metros]==],
				},
				["Necromancy|Duration"] = {
					pt = [==[M20 Sorcerer, pág. 40


Duration


••••• Os mestres da Necromancia podem impor obediência aos mortos. Além do teste do Caminho, eles devem ganhar um teste resistido de Força-de-Vontade. Se conseguirem, podem exigir que o fantasma realize uma tarefa simples ou responda a uma pergunta simples da melhor forma que puder. Para tarefas, o Aspecto Duração cobre por quanto tempo o fantasma deve tentar realizá-la.

M20 Sorcerer, pág. 13

• Alguns minutos
•• Uma cena
••• Um ou dois dias
•••• Umas duas semanas
••••• Vários meses]==],
				},
				["Summoning, Binding, and Warding|Number of Targets"] = {
					pt = [==[M20 Sorcerer, pág. 49


Number of Targets


Além disso, tem Número de seres invocados (ou enxames) e Peso Metafísico para o ser invocado.

M20 Sorcerer, pág. 13

• Um único alvo
•• Dois alvos
••• Até 10
•••• Até 50
••••• Centenas]==],
				},
				["Summoning, Binding, and Warding|Metaphysical Weight"] = {
					pt = [==[M20 Sorcerer, pág. 49


Metaphysical Weight


Além disso, tem Número de seres invocados (ou enxames) e Peso Metafísico para o ser invocado.

Vínculo similarmente tem os aspectos de Duração e Peso Metafísico, bem como Intensidade do Vínculo. Alguns seres, especialmente aqueles com Peso Metafísico 5, são poderosos o suficiente para exigir rituais de vínculo com grandes limiares além dos requisitos usuais — às vezes tão altos quanto 20 ou mais sucessos.

M20 Sorcerer, pág. 13

• Criaturas simples, como animais pequenos e sem inteligência, a maioria dos Gafflings menores e os menores seres das hostes de um céu ou de um inferno
•• Criaturas maiores, como ursos ou lobos, Gafflings mais poderosos, fantasmas que começaram a aprender a navegar sua existência, mas não têm experiência
••• Humanos e seres verdadeiramente inteligentes, como a maioria dos Jagglings, fantasmas que conseguem navegar o submundo com eficácia, anjos menores, demônios servidores e elementais notáveis
•••• Humanos aprimorados, como carniçais, parentes (kinfolk) e outros feiticeiros, bem como Jagglings poderosos, Preceptores Umbrood e tentadores infernais
••••• Seres poderosos, como os verdadeiramente sobrenaturais (vampiros, lobisomens, magos, fadas etc.), Incarnae, os barões do inferno e os generais da hoste celestial]==],
				},
				-- <<< ASPECT_DESC_END
}
