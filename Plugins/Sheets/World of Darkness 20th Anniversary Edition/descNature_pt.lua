-- Nature/Demeanor archetype descriptions, the [pt] half (SPEC I102e, I21, V210 / T838).
--
-- One entry per item of PICKER_LIST["nature"], which IS PICKER_LIST["demeanor"] - one table
-- serves both rows (WoD20th.lfm), so one module serves both. Keyed in ENGLISH because that is
-- what the sheet saves (SPEC V24). Three blocks, exactly as the ten description modules
-- already do: "<Book>, p. <n>" - blank - blank - <Name> - blank - blank - <text>. The book
-- title does not translate; only p./pág. does (SPEC I100e).
--
-- PARTIAL BY MEASURE, and that is a decision, not a gap (user 2026-08-30): the picker offers
-- 68 archetypes and 46 have a usable description in the books on disk. The other 22 open the
-- box and fall to V360c's sentence through descText's empty answer (SPEC V365c, V364b) - the
-- right reply, because what they lack is a FILE. Six of the 22 - Bureaucrat, Comedian,
-- Grifter, Optimist, Pragmatist and Trendsetter - appear ZERO times across all 25 PDFs in the
-- library, so they come from a book nobody here has yet.
--
-- Eighteen seam repairs are recorded in the extractor, each confirmed against its page by the
-- user: a page turn cuts a word in half and the halves read like prose, so they cannot be
-- spotted by rule. The extractor is deterministic - it was NOT, and every count taken before
-- that was a sample of a coin toss (a `my ` loop variable was shadowing sort's ).
--
-- One module PER LANGUAGE and never both halves in one file (SPEC V210).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).
-- Extracted from the PDFs by scratchpad/arch_extract.pl; page numbers are the PRINTED page,
-- taken with each book's offset from research/README.md. Do not hand-edit.

return {
				-- >>> NATURE_DESC_BEGIN (generated - SPEC T838)
				["Activist"] = {
					pt = [==[Mage: The Ascension 20th Anniversary Edition, pág. 268


Activist


O mundo está quebrado. Ajude a consertá-lo. Fale a verdade ao poder, desenterre segredos, exponha as pessoas pelo que elas fazem e revele seus planos por um mundo melhor a quem quiser ouvir. Enquanto covardes apáticos ficam sentados e se alienam, você se levanta e faz o que precisa ser feito. Claro, tem gente que vai te achar um pé no saco, mas pelo menos você está fazendo diferença!

A ação é sua maior força. Você não é do tipo que fica de fora. Não há tempo a perder com autoindulgência vazia nem espaço para continuar com medo do que pode acontecer. O lobo já está com meio corpo dentro da porta, e você se recusa a deixar o desgraçado vencer.

Ainda assim, sua Indignação constante cansa. Nunca há espaço para relaxar e aproveitar a vida. Para você, a complacência é pecado. Sua fúria é justificada, claro, mas nem por isso deixa de envelhecer. Antes de poder Ascender de verdade, você precisa equilibrar a pirotecnia justiceira com a aceitação serena. A vida nunca foi — e nunca será — perfeita. Encontrar um lugar de serenidade dentro da sua tempestade é parte essencial da sua transcendência.

– Recupere Força de Vontade quando você enfrentar um abuso com sucesso, reparar injustiças ou revelar uma conspiração real e, com isso, derrubá-la.]==],
				},
				["Architect"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 88


Architect


O Arquiteto tem um senso de propósito maior do que ele mesmo. Ela só é verdadeiramente feliz quando cria algo de valor duradouro para os outros. As pessoas sempre precisarão de coisas, e o Arquiteto se esforça para prover ao menos uma necessidade. Inventores, pioneiros, fundadores de cidades, empreendedores e afins são todos Arquétipos Arquiteto. Um Cainita Arquiteto pode buscar criar novas leis que afetem seus semelhantes mortos-vivos, ou pode pretender estabelecer um novo domínio Anarquista.

— Recupere um ponto de Força de Vontade sempre que estabelecer algo de importância ou de valor duradouro.]==],
				},
				["Autocrat"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 88


Autocrat


O Autocrata quer estar no comando. Ele busca proeminência por ela mesma, não porque tenha os melhores interesses de uma operação no coração ou porque tenha as melhores ideias (embora certamente possa achar que sim). Ele pode genuinamente acreditar que os outros são incompetentes, mas no fundo o que ele deseja é poder e controle. Ditadores, líderes de gangue, valentões, tubarões corporativos e gente da mesma laia são Arquétipos Autocrata. Um Cainita Autocrata pode ansiar por um título, ou pode desejar ser reconhecido como líder de uma coterie.

— Recupere um ponto de Força de Vontade quando conquistar controle sobre um grupo ou organização que envolva outros indivíduos.]==],
				},
				["Benefactor"] = {
					pt = [==[Mage: The Ascension 20th Anniversary Edition, pág. 268


Benefactor


O mundo é cruel, mas você torna as coisas mais fáceis. Generoso às vezes até demais, você fornece o que puder fornecer: dinheiro, conselho, proteção, talvez apenas um ombro para quem realmente precisa chorar. Você não consegue simplesmente fechar os olhos para o sofrimento e a necessidade. É seu dever moral fazer tudo o que puder para consertar as coisas. Quando a situação aperta, você invoca seu Cavaleiro Branco interior e parte para cima, trazendo presentes, orientação e, quando nada mais resolve, força.

O altruísmo é raro demais, especialmente no Mundo das Trevas. Ajudar as pessoas é seu prazer. A Magia, no que lhe diz respeito, é uma ferramenta para ajudar quem tem menos sorte que você. Fazer menos que isso é abusar dos poderes que você possui.

Por outro lado, porém, você muitas vezes sente Obrigação mesmo quando não é realmente necessário. Isso, por sua vez, pode virar ressentimento — tanto da sua parte quanto da parte de quem agora sente, com razão ou sem ela, que lhe deve algo. Às vezes você precisa apenas recuar, se acalmar e deixar que as pessoas façam as coisas por si mesmas. O martírio nem sempre é o melhor Caminho rumo à Ascensão.

– Recupere Força de Vontade quando prestar ajuda de que outra pessoa precisa desesperadamente. A palavra-chave aqui é desesperadamente. Dar aula de catecismo não atinge esse nível de necessidade; mas se você usasse suas Artes para auxiliar crianças autistas, aí estaria claramente fazendo diferença na vida delas.]==],
				},
				["Bon Vivant"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 88


Bon Vivant


O Bon Vivant sabe que a vida — e a não-vida — é rasa e sem sentido. Sendo assim, o Bon Vivant decide aproveitar seu tempo na Terra. O Bon Vivant não é necessariamente irresponsável. Ele apenas tem predisposição a se divertir pelo caminho. A maioria dos Bon Vivants tem Autocontrole baixo, dada a inclinação ao excesso. Hedonistas, sibaritas e diletantes são todos exemplos do Arquétipo Bon Vivant. Um Cainita Bon Vivant pode gerar uma ninhada de cria bajuladora, ou pode passar o tempo se fartando do sangue de usuários de drogas pelo barato de segunda mão.

— Recupere um ponto de Força de Vontade sempre que se divertir de verdade e puder expressar plenamente seu contentamento. A critério do Narrador, uma farra especialmente memorável pode render vários pontos de Força de Vontade.]==],
				},
				["Bravo"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 88


Bravo


O Brutamontes é durão e valentão, e muitas vezes sente um prazer perverso em atormentar os fracos. Na cabeça do Brutamontes, quem pode manda. O que importa é o poder, e só quem tem poder merece respeito. Naturalmente, o poder físico é o melhor tipo, mas qualquer um serve. O Brutamontes vê ameaças abertas como um meio perfeitamente razoável de obter cooperação. O Brutamontes não é incapaz de piedade ou gentileza; ele apenas prefere fazer as coisas do jeito dele. Assaltantes, xenófobos e capangas são todos Arquétipos Brutamontes. Um Cainita Brutamontes pode abusar da autoridade que o sistema lhe concedeu, ou pode — de forma violenta ou não — tirar outros Cainitas do seu caminho para conseguir o que quer. Ele quase certamente é um babaca.

— Recupere um ponto de Força de Vontade sempre que impuser sua agenda pela brutalidade ou pela intimidação. Isso não precisa ser físico, já que muitos Brutamontes acuam suas vítimas verbal ou socialmente.]==],
				},
				["Caregiver"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 89


Caregiver


Todo mundo precisa de um ombro para chorar. O Protetor encontra seu conforto em consolar os outros, e as pessoas costumam procurá-lo com seus problemas. Vampiros com Arquétipo Protetor frequentemente tentam, na medida do possível, proteger os mortais de quem se alimentam. Enfermeiros, médicos e psiquiatras são exemplos de possíveis Protetores. Cainitas Protetores são muitas vezes do tipo que — tragicamente — Abraça amores mortais que deixou para trás na esperança de amenizar a perda, ou mesmo do tipo que cria situações de sofrimento para depois aliviá-las e assim se validar.

— Recupere um ponto de Força de Vontade sempre que proteger ou cuidar de alguém com sucesso.]==],
				},
				["Celebrant"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 89


Celebrant


O Celebrante se alegra com sua causa. Seja a paixão do personagem a batalha, a religião, frustrar seus rivais, ou ler boa literatura, é ela que dá ao Celebrante forças para suportar a adversidade. Tendo a chance, o Celebrante se entrega à sua paixão o mais profundamente possível. Ao contrário do Fanático (p. 91), o Celebrante persegue sua causa não por dever, mas por entusiasmo. Cruzados, hippies, ativistas políticos e entusiastas das artes são Arquétipos Celebrante. Cainitas Celebrantes podem se apegar a ideologias mortais incongruentes com sua nova condição de Maldito, ou podem ser os defensores de novas tendências e causas que circulam pela sociedade dos mortos-vivos.

— Recupere um ponto de Força de Vontade sempre que perseguir sua causa ou converter outro personagem à mesma paixão. Em contrapartida, perca um ponto de Força de Vontade temporária sempre que sua paixão lhe for negada ou gravemente perdida.]==],
				},
				["Chameleon"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 89


Chameleon


Independente e autossuficiente, você estuda com cuidado o comportamento e os trejeitos de todos com quem tem contato para poder se passar por outra pessoa depois. Você passa tanto tempo alterando seus modos e sua aparência que nem seu próprio senhor talvez o reconheça. Espiões, vigaristas, drag queens e impostores representam bem o Camaleão.

— Recupere um ponto de Força de Vontade sempre que enganar alguém fazendo-a pensar que você é outra pessoa, em benefício próprio (ou da sua matilha ou coterie).]==],
				},
				["Child"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 89


Child


A Criança ainda é imatura em personalidade e temperamento. Ele quer o que quer agora, e muitas vezes prefere que alguém lhe dê. Embora normalmente consiga cuidar de si, prefere que alguém atenda a seus desejos caprichosos. Alguns Arquétipos Criança são na verdade inocentes em vez de imaturos, ignorantes dos caminhos frios do mundo real. Crianças de fato, indivíduos mimados e alguns usuários de drogas são Arquétipos Criança. Cainitas com o Arquétipo Criança podem ainda não ter alcançado plenamente uma compreensão do mundo e ter alguma característica — crueldade, sensação de merecimento, compaixão ou fome — desequilibrada em relação aos demais aspectos da personalidade, já que ainda não chegaram ao estado "completo" da vida adulta. Note que um Arquétipo Criança não precisa ser uma criança física e literal no momento do Abraço. Algumas pessoas simplesmente nunca crescem.

— Recupere um ponto de Força de Vontade sempre que conseguir convencer alguém a ajudá-lo sem ganho algum para ela, ou a cuidar de você.]==],
				},
				["Competitor"] = {
					pt = [==[Werewolf: The Apocalypse 20th Anniversary Edition, pág. 487


Competitor


O Competidor se dedica à busca da vitória. Ele pode ser um apostador por natureza, ou pode procurar desafios que só se superem com disciplina e perícia. Toda interação é uma oportunidade de se sobressair. Lobisomens com este Arquétipo podem perseguir seus objetivos na política, na batalha ou em outras arenas. Um Garou Competidor leva o Renome muito a sério.

— Recupere um ponto de Força de Vontade sempre que tiver êxito em um teste ou desafio. Note que um teste ou desafio é mais do que uma simples rolagem de dados; é uma situação dramática inteira. Vitórias especialmente difíceis podem, a critério do Narrador, permitir que você recupere vários pontos de Força de Vontade.]==],
				},
				["Conniver"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 90


Conniver


Por que trabalhar por algo se você pode enganar outra pessoa para consegui-lo para você? O Trapaceiro sempre tenta achar o caminho fácil, o atalho para o sucesso e a riqueza. Algumas pessoas o chamam de ladrão, de vigarista ou de coisa pior, mas ele sabe que todo mundo no mundo faria o mesmo com ele se pudesse. Ele apenas faz primeiro, e melhor. Criminosos, vigaristas, vendedores, moleques de rua e empreendedores podem ser Trapaceiros. Alguns diriam que todos os Cainitas são Trapaceiros em algum sentido, mas os que têm o arquétipo Trapaceiro podem ser abusivos com sua cria e seus carniçais, ou podem ser mais persuasivos ao obter apoio para suas maquinações.

— Recupere um ponto de Força de Vontade sempre que enganar alguém para que faça algo por você, ou quando convencer alguém a ajudá-lo contra os próprios interesses.]==],
				},
				["Contrary"] = {
					pt = [==[Werewolf: The Apocalypse 20th Anniversary Edition, pág. 487


Contrary


O Contrariante tem uma necessidade inata de ir contra a corrente e desafiar convenções sociais estabelecidas ou até leis. Alguns têm queda por comportamentos bizarros, como se esperaria de uma celebridade excêntrica; outros são hereges declarados. Muitos Ragabash encarnam o contrariante em sua forma tradicional, desafiando leis convencionais como maneira de questionar sua relevância.

— Recupere um ponto de Força de Vontade toda vez que conseguir afrontar os costumes sociais sem sofrer represália.]==],
				},
				["Creep Show"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 90


Creep Show


Você se esforça para chocar e repugnar quem está à sua volta com atos gratuitos e trejeitos ostensivamente "malignos". Você percebe, é claro, que é tudo encenação e apenas um jeito de intimidar e controlar os outros. Os de fora, por sua vez, acham que você é o Diabo encarnado, e você se deleita com essa imagem. Roqueiros de choque, adolescentes rebeldes, aberrações de circo e os carentes de atenção exemplificam o Arquétipo Creep Show.

— Recupere um ponto de Força de Vontade sempre que alguém recuar de você com horror ou reagir de outra forma com medo.]==],
				},
				["Curmudgeon"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 90


Curmudgeon


O Rabugento é amargo e cínico, encontrando defeitos em tudo e vendo pouca graça na vida ou na não-vida. Ele é frequentemente fatalista ou pessimista, e tem muito pouca estima pelos outros. Para o Rabugento, o copo nunca está mais do que meio cheio, embora possa estar quase vazio quando outras pessoas estão envolvidas. Muitos viciados em internet, fãs de cultura pop e integrantes da Geração X são Rabugentos. Cainitas Rabugentos enxergam opressão dos anciões ou neófitos mimados fazendo bagunça por trás de cada acontecimento da sociedade dos mortos-vivos, e podem ou não passar da resmungação ácida para de fato mudar os problemas que percebem.

— Recupere um ponto de Força de Vontade sempre que alguém fizer algo específico e negativo, exatamente como você disse que faria. Você precisa prever e detalhar esse fracasso em voz alta, avisando por exemplo: "O Príncipe vai nos foder nessa" ou "Pode esperar, o carniçal daquele Malkaviano vai fazer alguma imprudência". Se preferir, você pode simplesmente sussurrar sua profecia de desgraça ao Narrador, em vez de anunciá-la à mesa inteira.]==],
				},
				["Dabbler"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 90


Dabbler


O Diletante se interessa por tudo mas não se concentra em nada. Ele salta de ideia em ideia, de paixão em paixão e de projeto em projeto sem de fato terminar coisa alguma. Outros podem se deixar levar pelo entusiasmo do Diletante e ficar a ver navios quando ele parte para outra sem aviso. A maioria dos Diletantes tem Inteligência, Carisma e Manipulação altos, mas pouca Raciocínio ou Vigor. Toreadores costumam ser Diletantes, em especial os afligidos pelo apelido depreciativo de "Poseurs".

— Recupere Força de Vontade sempre que encontrar um novo entusiasmo e abandonar completamente o anterior.]==],
				},
				["Defender"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 177


Defender


O Defensor luta para defender a causa que escolheu diante de seus inimigos. Pode ser alguma inovação frágil ou a esperança de um progresso futuro.

Recupere um ponto de Força de Vontade sempre que defender sua causa com sucesso.]==],
				},
				["Deviant"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 90


Deviant


O Desviante é uma aberração, ostracizado pela sociedade por gostos ou crenças singulares que o colocam fora do padrão. Desviantes não são rebeldes indolentes nem "gênios não reconhecidos" preguiçosos; são, antes, pensadores independentes que não se encaixam bem no status quo. Arquétipos Desviante muitas vezes sentem que o mundo está contra eles e, por isso, rejeitam a moralidade tradicional. Alguns têm gostos, preferências e ideologias bizarros. Extremistas, celebridades excêntricas e esquisitões assumidos são Arquétipos Desviante. Cainitas desviantes podem cultivar hábitos heréticos ou proscritos, como a diablerie ou a deferência aos anciões, e é bem possível que se tornem Anarquistas ou Autarcas em vez de ter de defender constantemente sua subversão das Tradições ou dos costumes da Seita.

— Recupere um ponto de Força de Vontade toda vez que conseguir afrontar os costumes sociais sem sofrer represália.]==],
				},
				["Director"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 91


Director


Para o Diretor, nada é pior que o caos e a desordem. O Diretor busca estar no comando, adotando uma postura de "ou do meu jeito, ou nada" nas decisões. O Diretor está mais preocupado, porém, em extrair ordem do conflito, e não precisa estar de fato "no controle" de um grupo para guiá-lo. Treinadores, professores e muitas figuras políticas exemplificam o Arquétipo Diretor. Cainitas Diretores podem ser simples defensores de códigos estabelecidos, ou podem ser decisivos em derrubar ordens corruptas para abrir caminho a novos líderes ou movimentos faccionais.

— Recupere um ponto de Força de Vontade quando influenciar ou auxiliar um grupo ou indivíduo influente na conclusão de uma tarefa difícil.]==],
				},
				["Enigma"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 91


Enigma


Suas ações são bizarras, desconcertantes e inexplicáveis para todos, menos para você. Sua estranheza pode ser um efeito residual do seu Abraço, ou a maneira mais eficaz de você realizar seu trabalho. Para o resto do mundo, no entanto, suas ações erráticas sugerem que você é excêntrico, se não completamente louco. Teóricos da conspiração, agentes infiltrados e fanáticos da Jyhad todos encarnam o Arquétipo Enigma.

— Recupere um ponto de Força de Vontade sempre que alguém ficar completamente perplexo ou confuso com uma de suas ações que depois se revele um empreendimento frutífero.]==],
				},
				["Eye of the Storm"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 91


Eye of the Storm


Apesar da sua aparência calma, o caos e a destruição parecem segui-lo. De cidades em chamas a convulsões emocionais, a morte e a destruição o rodeiam como albatrozes. Para você, a não-vida é uma provação sem fim, com incerteza em cada esquina. Líderes de gangue, figuras políticas e outros indivíduos influentes exemplificam o Arquétipo Olho do Furacão.

— Recupere um ponto de Força de Vontade sempre que um tumulto, um motim ou um fenômeno menos violento porém igualmente caótico ocorrer à sua volta.]==],
				},
				["Fanatic"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 91


Fanatic


O Fanático tem um propósito, e esse propósito consome sua existência. O Fanático se entrega inteiro à sua causa, e pode até se sentir culpado por empreender qualquer objetivo que se desvie de sua meta maior. Para o Fanático, os fins justificam os meios — a causa é mais importante que aqueles que a servem. Jogadores que escolherem o Arquétipo Fanático devem selecionar uma causa para o personagem promover. Revolucionários, zelotes e agitadores sinceros são todos exemplos de Arquétipos Fanático. Cainitas Fanáticos são frequentemente campeões a favor ou contra algum aspecto específico da sociedade dos mortos-vivos, como a igualdade entre todos os vampiros, o extermínio dos Anarquistas ou a erradicação do infernalismo na Espada de Caim.

— Recupere um ponto de Força de Vontade sempre que realizar alguma tarefa diretamente relacionada à sua causa.]==],
				},
				["Gallant"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 91


Gallant


Galantes são almas extravagantes, sempre em busca de atenção e da chance de ser a estrela mais brilhante. Galantes procuram a companhia dos outros, ainda que só para conquistar sua adoração. A atenção move o Galante, e a caçada muitas vezes importa tanto quanto o desfecho. Nada empolga tanto um Galante quanto uma plateia nova para cortejar. Artistas, filhos únicos e pessoas com baixa autoestima frequentemente encarnam o Arquétipo Galante. Cainitas Galantes podem ser Harpias, ou podem ter enormes rebanhos de servos devotados.

— Recupere um ponto de Força de Vontade sempre que impressionar outra pessoa com sucesso. Em última instância, é o Narrador quem julga o quanto você deslumbrou alguém, mesmo no caso de personagens de outros jogadores.]==],
				},
				["Guru"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 91


Guru


Sua iluminação atrai os outros até você. Você pode ser um mentor de uma Via de Iluminação específica, um sacerdote da Igreja ou apenas um idealista. Seja como for, sua presença motiva e move os outros a se dedicarem a buscas espirituais ou ideológicas. Seus pares o veem como calmo, centrado e "sintonizado", mesmo quando você prega a violência como meio para um fim. Líderes de culto, mestres Zen e Sacerdotes de Matilha são exemplos de Gurus.

— Recupere um ponto de Força de Vontade sempre que alguém procurar sua ajuda em questões espirituais e sua orientação levar essa pessoa a uma ação iluminada que normalmente ela não teria tomado. Além disso, recupere um ponto de Força de Vontade sempre que alcançar uma epifania relacionada à sua filosofia pessoal.]==],
				},
				["Hacker"] = {
					pt = [==[Mage: The Ascension 20th Anniversary Edition, pág. 269


Hacker


Todo sistema é um cofre trancado, e você tem as chaves. Se não tiver as que funcionam, você fabrica novas — afinal, essa é metade da graça da vida! Enigmas o empolgam; limites simplesmente o irritam. Ainda mais considerando a quantidade absurda de abuso embutida em qualquer sistema, o mundo precisa de gente como você para derrubar empecilhos e libertar a realidade.

A imaginação é sua maior força. Você vê as coisas não como são, mas como poderiam ser depois que você acabar com elas! Movido a desmontar sistemas existentes e remontá-los em formas novas e interessantes, você tende a temperar suas compulsões com uma filosofia sinceramente professada. Você não é um vândalo, ora essa — você é um visionário que se recusa a aceitar merda servida como almoço.

Às vezes, porém, você vai longe demais. A perversidade o leva a despedaçar coisas que não estavam quebradas... coisas que talvez, na verdade, fosse melhor deixar em paz. Ainda que pareça filosoficamente válido derrubar as proteções do laboratório de um mago, essas proteções podem ter sido postas ali por razões que você só entendeu quando já era um pouco tarde.

– Recupere Força de Vontade quando detectar uma falha em alguma estrutura, sistema ou dispositivo importante, ou então quando descobrir um jeito de melhorar algo que supostamente já era bem projetado.]==],
				},
				["Innovator"] = {
					pt = [==[Mage: The Ascension 20th Anniversary Edition, pág. 270


Innovator


Sempre existe um jeito melhor. Você passa a vida procurando métodos e invenções que aperfeiçoem o que veio antes. Claro, as conquistas do passado são maravilhosas... mas se você acrescentar isto, mudar aquilo, abordar a questão por este outro ângulo, então vai tornar uma coisa boa ainda melhor ou corrigir uma falha evidente num projeto promissor.

A criatividade é seu ponto forte. Nenhuma prática, ferramenta ou método tradicional é bom demais para ser aperfeiçoado, ainda mais neste momento crucial da evolução humana. Que os outros sigam os caminhos estabelecidos — você está ocupado traçando a próxima estrada rumo a uma meta que a maioria nem sabe que existe.

Sua Heterodoxia Inquieta, porém, pode lhe trazer problemas. Especialmente se você pertence a uma seita ou facção baseada em resultados e protocolos estabelecidos (a Tecnocracia, a Ordem Hermética, os Akashayana e assim por diante), suas inovações podem ser a heresia de outra pessoa. Muitos magos já foram queimados em fogueiras literais e simbólicas por fazer o que você faz, e um passo em falso pode reduzi-lo a cinzas.

– Recupere Força de Vontade quando sua inspiração levar a um avanço novo e útil.]==],
				},
				["Jester"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 177


Jester


O Bobo enxerga o mundo como um véu de tolice e engano, e ilumina os outros pelas vias sutis do humor.

Recupere um ponto de Força de Vontade sempre que levantar o ânimo de quem está em grande sofrimento, ou quando desmoralizar um valentão ou tirano tornando-o objeto de escárnio.]==],
				},
				["Judge"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 92


Judge


O Juiz busca perpetuamente aperfeiçoar o sistema. Um Juiz sente prazer em sua natureza racional e em sua capacidade de chegar à conclusão certa quando lhe apresentam os fatos. O Juiz respeita a justiça, por ser o modelo mais eficiente de resolver questões. Juízes, embora persigam a "racionalização" dos problemas, raramente são visionários, pois preferem modelos comprovados à intuição. Engenheiros, advogados e médicos são frequentemente Arquétipos Juiz. Cainitas Juízes podem gravitar em torno de papéis de fiscalização na sociedade local, ou podem ser a voz da razão numa coterie de resto radical.

— Recupere um ponto de Força de Vontade sempre que resolver corretamente um problema considerando as evidências apresentadas, ou quando um de seus argumentos unir partes discordantes.]==],
				},
				["Loner"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 92


Loner


Mesmo em meio à multidão o Solitário se destaca, porque é evidente que ele não pertence. Os outros veem os Solitários como párias, distantes e isolados, mas na verdade o Solitário prefere a própria companhia à alheia. Por qualquer razão que seja, o Solitário simplesmente desdenha os outros, e esse sentimento costuma ser recíproco. Criminosos, radicais e livres-pensadores são todos Arquétipos Solitário. Cainitas Solitários muitas vezes vêm de um dos Clãs de individualistas rudes, como os Gangrel ou os Ravnos, e têm propensão a acabar Autarcas por não darem a mínima para o que algum Príncipe ou Arcebispo cheio de si diz que é lei.

— Recupere um ponto de Força de Vontade quando realizar algo sozinho que, ainda assim, beneficie a coterie de alguma forma.]==],
				},
				["Machine"] = {
					pt = [==[Mage: The Ascension 20th Anniversary Edition, pág. 270


Machine


A carne é fraca. Você não. Sendo ou não um ciborgue de fato, você tem o ímpeto implacável de um Exterminador do Futuro chapado de PCP. Falhas não lhe dizem respeito. Limites são para os sacos de carne choramingões conhecidos como seres humanos. Compaixão é para fracos. Fadiga é para entidades menores. Se e quando você ficar aquém da perfeição, entende que esse fracasso é apenas um desafio para fazer melhor da próxima vez.

Criatura Diligente e Estoica, você se leva aos limites da resistência. Tudo o que faz é feito com padrões rigorosos, sem reclamação nem hesitação. A União Tecnocrata adora operativos como você.

No que diz respeito às outras pessoas, porém, você é Assustador e Propenso ao Esgotamento. Sejam quais forem as ilusões que você alimenta sobre sua perfeição, você é tão falho quanto qualquer outra coisa mortal. Até máquinas têm limites e, a menos que aprenda a reconhecer os seus, seu destino é o ferro-velho, não a Ascensão.

– Recupere Força de Vontade quando transcender os limites da mera carne, osso e aço, realizando algo que ninguém mais conseguiu fazer.]==],
				},
				["Martyr"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 92


Martyr


O Mártir sofre por sua causa, suportando suas provações na crença de que seu desconforto acabará por melhorar a sorte alheia. Alguns Mártires querem apenas a atenção ou a compaixão que suas provações geram, enquanto outros são sinceros em sua causa e recebem a oposição com fé inabalável. Muitos revolucionários, idealistas convictos e proscritos são Arquétipos Mártir. Cainitas Mártires são frequentemente associados a movimentos de reforma na sociedade dos Cainitas, mas raramente como figuras de proa — e não precisam necessariamente estar do lado favorável à reforma.

— Recupere um ponto de Força de Vontade quando sofrer algum dano ou perda de um recurso definível em nome de seus ideais ou do ganho imediato de outra pessoa.]==],
				},
				["Masochist"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 92


Masochist


O Masoquista existe para testar seus limites, para ver quanta dor consegue tolerar antes de desabar. Ele obtém satisfação na humilhação, no sofrimento, na privação e até na dor física. O Masoquista define quem é pela sua capacidade de sentir desconforto — ele se levanta a cada noite apenas para saudar uma dor nova. Certos atletas radicais, tribalistas urbanos e pessoas clinicamente deprimidas exemplificam o Arquétipo Masoquista. Cainitas Masoquistas podem ser horrores abertamente automortificantes, que atendem aos caprichos autodestrutivos da própria Besta, ou podem ser capatazes ambiciosos, como o líder de coterie que se recusa a aceitar o fracasso e força os próprios limites em seus esquemas exigentes.

— Recupere um ponto de Força de Vontade quando seu próprio sofrimento levar a algum ganho tangível para você, e dois pontos de Força de Vontade sempre que sentir dor de um modo verdadeiramente inédito.]==],
				},
				["Mercenary"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 178


Mercenary


O Mercenário acredita que qualquer coisa pode ser mercadoria. Aparência e influência são tudo quando se trata de uma venda, e nenhuma vantagem é desperdiçada.

Recupere um ponto de Força de Vontade sempre que realizar com sucesso a venda de qualquer mercadoria ou serviço.]==],
				},
				["Pedagogue"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 178


Pedagogue


O Pedagogo sabe de tudo e garante que sua mensagem seja ouvida — longamente, se preciso.

Recupere um ponto de Força de Vontade sempre que vir ou souber de alguém que se beneficiou da sabedoria que você compartilhou.]==],
				},
				["Penitent"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 178


Penitent


O Penitente expia o grave pecado que comete simplesmente por ser quem é, e se sente compelido a "compensar" por ter infligido a si mesmo ao mundo.

Recupere um ponto de Força de Vontade sempre que sentir que alcançou a absolvição de um determinado pecado.]==],
				},
				["Perfectionist"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 94


Perfectionist


Arquétipos Perfeccionista exigem execução impecável. Um trabalho feito pela metade não dá satisfação alguma ao Perfeccionista, e ela espera dos outros o mesmo grau de comprometimento e atenção ao detalhe que exige de si. Embora o Perfeccionista possa ser rigoroso, é o alcance da meta final que o move, e frequentemente move também aqueles por quem ele é responsável. Prima donnas, artistas e arquitetos exemplificam o Arquétipo Perfeccionista. Um Cainita Perfeccionista pode ser um membro zeloso do Sabá que espera mais do que sua matilha consegue entregar de forma consistente, ou pode ser um moralista que às vezes aplica seus próprios padrões elevados de Humanidade aos demais de sua coterie.

— Recupere um ponto de Força de Vontade sempre que alcançar seu objetivo sem nenhuma falha ou empecilho demonstrável, e recupere um ponto de Força de Vontade sempre que motivar outro personagem a ter êxito graças ao seu próprio exemplo brilhante.]==],
				},
				["Philosopher"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 178


Philosopher


O Filósofo examina criticamente cada situação, buscando desfechos e padrões lógicos.

Recupere um ponto de Força de Vontade toda vez que uma abordagem lógica e sistemática de um problema ajudar você a resolvê-lo, ou quando informações reunidas logicamente forem úteis em outra situação semelhante.]==],
				},
				["Rebel"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 94


Rebel


O Rebelde é um insatisfeito, nunca contente com o status quo ou com o sistema como ele é. Ele odeia a própria ideia de autoridade e faz tudo ao seu alcance para desafiá-la e miná-la. Talvez o Rebelde acredite de verdade em seus ideais, mas é igualmente provável que guarde alguma má vontade contra figuras de autoridade por um "erro" cometido contra ele no passado. Um Rebelde pode odiar instituições categoricamente, ou pode estar consumido pela oposição a uma única autoridade específica. Adolescentes, insurgentes e inconformistas exemplificam o Arquétipo Rebelde. Cainitas Rebeldes certamente incluem o Sabá, os Anarquistas e Brujah temperamentais, mas também comportam Tremere que se irritam com a rígida hierarquia do Clã ou neófitos que desprezam seus senhores.

— Recupere um ponto de Força de Vontade sempre que suas ações prejudicarem a oposição que você escolheu. Rebeldes podem se opor ao governo, à Igreja, a um Príncipe vampiro ou a qualquer outro detentor de autoridade. O jogador deve escolher contra quem ou contra o que seu personagem se rebela ao adotar este Arquétipo. Narradores devem receber a rebeldia contra "toda autoridade" com reservas, e aplicar a recompensa de Força de Vontade para um conceito tão amplo apenas a ações de insurgência cada vez maiores.]==],
				},
				["Rogue"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 94


Rogue


Só uma coisa importa para o Trapaceiro Solitário: ela mesma. Cada um por si, e se os outros não conseguem proteger o que reivindicam, não têm direito a isso. O Trapaceiro Solitário não é necessariamente um capanga ou um valentão, no entanto. Ela simplesmente se recusa a sucumbir aos caprichos alheios. Trapaceiros Solitários quase universalmente possuem um senso de autossuficiência. Têm os próprios interesses em mente o tempo todo. Prostitutas, capitalistas e criminosos todos encarnam o Arquétipo Trapaceiro Solitário. Cainitas desse Arquétipo incluem diableristas, Autarcas e o Primogênito que põe as oportunidades de seu Clã acima da supremacia dos Cainitas como um todo.

— Recupere um ponto de Força de Vontade quando sua disposição egocêntrica lhe render lucro, material ou não. A critério do Narrador, acumular ganho sem expor as próprias fraquezas pode permitir que você recupere dois pontos de Força de Vontade. Da mesma forma, você pode recuperar um ponto de Força de Vontade quando seus esforços beneficiarem o grupo a que pertence e esse benefício vier às custas de outro grupo.]==],
				},
				["Sadist"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 94


Sadist


Você existe para infligir dor e sofrimento aos outros. Matar é fácil demais; a tortura é o melhor jeito de realmente ferir uma pessoa, e você busca os meios mais lentos e dolorosos de levar os outros aos limites extremos. A dor — a dor alheia — lhe dá um prazer imenso. Sargentos instrutores, ex-amantes rejeitados e alguns dos terminalmente perturbados podem todos encarnar o Arquétipo Sádico em um momento ou outro; o sadismo é raro o bastante para aparecer apenas em casos aberrantes, e não de forma confiável em qualquer tipo ou classe de pessoa.

— Recupere um ponto de Força de Vontade sempre que infligir dor a alguém por nenhuma razão além do seu próprio prazer.]==],
				},
				["Scientist"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 94


Scientist


Para o Cientista, a existência é um quebra-cabeça que ela pode ajudar a remontar. O Cientista examina lógica e metodicamente cada situação e manobra, buscando desfechos e padrões lógicos. Isso não quer dizer que o Cientista esteja sempre atrás de uma explicação científica ou racional; ela examina seu entorno de forma rigorosa e com olhar crítico. O sistema que um Cientista tenta impor ao mundo pode ser completamente absurdo, mas é um sistema, e ela se atém a ele.

— Recupere Força de Vontade toda vez que uma abordagem lógica e sistemática de um problema ajudar você a resolvê-lo, ou quando informações reunidas logicamente forem úteis em outra situação semelhante.]==],
				},
				["Soldier"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 95


Soldier


O Soldado não é um seguidor cegamente leal. Embora exista para cumprir ordens, ela não as segue sem questionar. Mais independente que um Conformista, mas ligada demais à ideia de comando para ser uma Solitária, a Soldado aplica as próprias técnicas aos objetivos alheios. Ainda que um dia possa buscar o comando, suas ambições se dão dentro da hierarquia e da estrutura estabelecidas. A Soldado não tem escrúpulos em usar os meios necessários para fazer o que precisa ser feito, desde que a ordem tenha vindo do lugar certo.

— Recupere um ponto de Força de Vontade quando cumprir os objetivos de suas ordens. Quanto mais difíceis de cumprir forem as ordens, melhor é a sensação de realizá-las. A critério do Narrador, obter um sucesso espetacular ou cumprir uma missão longa pode muito bem valer pontos adicionais de Força de Vontade.]==],
				},
				["Survivor"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 95


Survivor


Não importa o que aconteça, não importam as probabilidades ou a oposição, o Sobrevivente sempre dá um jeito de escapar. Sozinho ou em grupo, a recusa absoluta do Sobrevivente em aceitar a derrota muitas vezes faz a diferença entre o êxito e o fracasso. Sobreviventes se frustram com a aceitação alheia do "que o destino reservou" ou com a disposição de suportar menos do que se pode alcançar. Proscritos, gente de rua e idealistas podem muito bem ser Arquétipos Sobrevivente. Um Cainita Sobrevivente pode ser um renegado sob édito de Caçada de Sangue de um Príncipe, um ex-Bispo afastado do poder, ou um reles Nosferatu que se vê expulso de um território de caça a outro sem nenhuma reivindicação reconhecida de domínio.

— Recupere um ponto de Força de Vontade sempre que sobreviver a uma situação ameaçadora pela tenacidade, ou quando seu conselho fizer outra pessoa persistir apesar da oposição.]==],
				},
				["Thrill-Seeker"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 95


Thrill-Seeker


O Aventureiro vive pela adrenalina do perigo. Ao contrário dos de índole indiscutivelmente mais sã, o Aventureiro busca ativamente situações arriscadas e possivelmente mortais. O Aventureiro não é conscientemente suicida ou autodestrutivo — ele simplesmente procura o estímulo do desastre iminente. Gangsteres, ladrõezinhos e exibicionistas são todos exemplos do Arquétipo Aventureiro. Cainitas Aventureiros podem quebrar a Masquerade por hábito só para ver se são pegos, podem manter contatos num Clã ou Seita rival, ou podem tramar ativamente a derrubada de um Príncipe só para ver se conseguem.

— Recupere um ponto de Força de Vontade toda vez que tiver êxito numa tarefa perigosa que tenha assumido deliberadamente. Aventureiros não são burros, no entanto, e o Narrador pode optar por não recompensar um jogador que atire o personagem ao perigo de forma imprudente com o único intuito de colher Força de Vontade.]==],
				},
				["Traditionalist"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 95


Traditionalist


Os caminhos ortodoxos satisfazem o Tradicionalista, que prefere alcançar seus objetivos por métodos testados pelo tempo. Por que mudar de rumo quando o que funcionou no passado já é bom o bastante? O Tradicionalista acha o status quo aceitável, até preferível, a uma mudança que possa render resultados imprevisíveis. Conservadores, juízes e figuras de autoridade são todos exemplos de Arquétipos Tradicionalista. Cainitas Tradicionalistas, sem surpresa, tomam as Tradições como modelo de conduta, embora alguns Anarquistas e anciões possam defender um "tradicionalismo" anterior tanto à Camarilla quanto ao Sabá.

— Recupere um ponto de Força de Vontade toda vez que os caminhos comprovados se revelarem os melhores. Além disso, recupere um ponto de Força de Vontade toda vez que se mantiver fiel a uma posição que já defendeu e ela se provar um curso de ação sábio.]==],
				},
				["Visionary"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 96


Visionary


O Visionário é forte o bastante para olhar além do mundano e perceber o verdadeiramente maravilhoso. Visionários testam os limites aceitos pela sociedade e buscam aquilo que poucos têm coragem de imaginar. O Visionário raramente encontra satisfação no que a sociedade tem a oferecer; ela prefere estimular a sociedade a oferecer o que poderia, em vez do que oferece. Tipicamente, a sociedade responde mal aos Visionários, embora sejam eles os responsáveis por trazer progresso e mudança. Filósofos, inventores e os artistas mais inspirados frequentemente têm Natureza Visionária. Cainitas Visionários podem querer mergulhar todos os mortais na servidão vampírica, podem adaptar tecnologias que outros Cainitas mais estáticos temem ou ignoram, ou podem ter um "jeito melhor" de coexistir com outros vampiros do que toda essa bobagem de Príncipe e Regente.

— Recupere um ponto de Força de Vontade cada vez que conseguir convencer os outros a ter fé em seus sonhos e a seguir o curso de ação ditado por sua visão. Note que conseguir apoio é a chave para o Visionário recuperar Força de Vontade. O êxito não precisa vir ao Visionário, ao menos não a cada passo na mudança das estruturas em questão. Seus maiores êxitos podem, de fato, vir depois de sua Morte Final.]==],
				},
				-- <<< NATURE_DESC_END
};
