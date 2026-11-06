-- Path descriptions, the [pt] half (SPEC T495, V210).
--
-- descPath.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [pt] only, descPath_en.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descPath_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Path descriptions for the Vampire tab (SPEC I21). One entry per canonical picker
-- value, keyed in ENGLISH because that is what the sheet saves (SPEC V24); `pt` is a
-- translation of the same three blocks, source line for source line.
--
-- SPEC I24 / T479-T481: this table used to be an upvalue inside the <script> of HH.13.lfm.
-- The <script> CDATA is copied raw into constructNew_*(), so every open sheet parsed and
-- kept its own copy. As a module it is parsed once and cached in package.loaded, and the
-- require that pulls it lives INSIDE pathText (SPEC V198).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24). The generator
-- markers migrated verbatim, so research/rebuild_ritual_desc.sh and the .tsv maps still aim
-- at the same region - only the path of the target changed.

return {
				-- >>> PATH_DESC_BEGIN (generated - SPEC T445)
				["Ash Path"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 163


Ash Path


• Visão do Sudário
Sistema: Uma simples rolagem de Percepção + Prontidão (dificuldade 7) permite ao necromante utilizar Visão do Sudário. Os efeitos duram uma cena.

•• Línguas sem Vida
Sistema: Usar Línguas sem Vida exige uma rolagem de Percepção + Ocultismo (dificuldade 6) e o gasto de um ponto de Força de Vontade.

••• Mão Morta
Sistema: O jogador gasta um ponto de Força de Vontade e faz uma rolagem bem-sucedida de Raciocínio + Ocultismo (dificuldade 7) para ativar Mão Morta por uma cena. Para cada cena adicional em que o vampiro queira permanecer em contato com o Submundo, ele precisa gastar um ponto de sangue.

•••• Ex Nihilo
Sistema: Usar Ex Nihilo cobra um preço tremendo do necromante. Para ativar este poder, o vampiro precisa primeiro desenhar uma porta com giz ou sangue em qualquer superfície disponível. (O vampiro pode desenhar portas com antecedência exatamente para esse fim.) O jogador precisa então gastar dois pontos de Força de Vontade e dois pontos de sangue antes de fazer uma rolagem de Vigor + Ocultismo (dificuldade 8) enquanto o vampiro tenta abrir fisicamente a porta de giz. Se a rolagem tiver sucesso, a porta se abre e o vampiro atravessa para o Submundo.
Quando o vampiro deseja retornar ao mundo real, basta que se concentre (e o jogador gasta outro ponto de Força de Vontade e rola Vigor + Ocultismo, dificuldade 6). A critério do Narrador, um vampiro imerso fundo demais no Submundo pode precisar viajar até um lugar próximo das terras dos vivos para conseguir atravessar. Vampiros que vagam longe demais pelas terras dos mortos podem ficar presos lá para sempre.
Vampiros no Submundo não podem se alimentar de fantasmas sem o uso de outro poder; seu único sustento é o sangue que trazem consigo.

••••• Domínio do Sudário
Sistema: Para exercer Domínio do Sudário, o necromante gasta dois pontos de Força de Vontade e então declara se está tentando erguer ou baixar o Sudário. O jogador então faz uma rolagem de Força de Vontade (dificuldade 9). Cada sucesso na rolagem aumenta ou reduz em um as dificuldades de todas as tentativas de espectros próximos de atravessar o Sudário de qualquer forma, até um máximo de 10 ou um mínimo de 3. O Sudário volta à sua força normal a uma taxa de um ponto por hora daí em diante.]==],
				},
				["Awakening of the Steel"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 440


Awakening of the Steel


• Conferenciar com a Lâmina
Sistema: O número de sucessos determina a quantidade de informação que o feiticeiro obtém sobre a história da lâmina e seu estado atual, além de tudo o que um número menor de sucessos revelaria. Com três ou mais sucessos, o feiticeiro pode reduzir em um a dificuldade de sua próxima tentativa de aplicar um ritual de magia de sangue à arma.
1 sucesso — Apenas informação física: comprimento e peso precisos (ao micrômetro e ao miligrama), composição química (supondo que o personagem entenda de metalurgia), número de dados de dano e tipo de dano (letal ou agravado).
2 sucessos — Panorama histórico: quando e onde a lâmina foi forjada, o nome e o rosto de seu ferreiro, vislumbres breves de eventos significativos de sua existência.
3 sucessos — Compreensão feiticeira: o tipo e o nível relativo de poder de quaisquer encantamentos ou aprimoramentos sobrenaturais que a lâmina possua, bem como o nome e o rosto de quem os lançou.
4 sucessos — Síntese subliminar: conhecimento abrangente da história da espada. Pelas sete noites seguintes, o personagem reconhece o gosto de qualquer sangue que já tenha manchado a lâmina, caso o prove.
5 sucessos — Comunhão total: a espada e o portador se ligam num nível mais profundo que o físico e mais duradouro que o imediato. O Narrador determina que informação a espada guarda para o personagem, mas ela pode incluir qualquer evento da história da lâmina ou qualquer aspecto de sua existência e condição presentes.

•• Agarrar da Montanha
Sistema: Pelo resto da cena, o personagem tem um número de sucessos automáticos para resistir a todas as tentativas de desarmá-lo igual ao número de sucessos rolados. Ele não pode derrubar a lâmina acidentalmente (o que significa que suas falhas críticas provavelmente resultam em automutilação em vez de uma mão vazia). Se o personagem for de algum modo desarmado apesar de Agarrar da Montanha, ele pode chamar a lâmina de volta à mão invocando este poder com sucesso outra vez, desde que tenha linha de visão livre para a arma.

••• Perfurar a Pele do Aço
Sistema: Enquanto Perfurar a Pele do Aço estiver em efeito, um ataque contra um alvo sem armadura causa metade do dano (arredondado para baixo). Contudo, por um número de turnos igual ao número de sucessos rolados, cada ataque bem-sucedido que o personagem faz contra um inimigo blindado causa dano à armadura corporal do alvo em vez de feri-lo diretamente. Só armadura de metal pode ser danificada por este poder. Quando o personagem faz um ataque bem-sucedido contra um alvo blindado, o jogador não rola dano. Em vez disso, ele rola um número de dados igual ao bônus de dano da espada (o número de dados que ela soma à Força dele) contra dificuldade 7. Cada sucesso reduz em um dado o bônus de absorção da armadura. Armadura reduzida a zero dados de absorção desse modo é completamente destruída e irrecuperável. Sucessos adicionais além dos necessários para destruir uma peça de armadura não têm efeito.
A critério do Narrador, Perfurar a Pele do Aço pode destruir outros objetos inanimados (paredes, portas, carros, obstáculos dramaticamente apropriados) sem dano significativo à espada. Para os fins deste poder, Fortitude conta como parte do Vigor do alvo, não como armadura externa.

•••• Escudo da Navalha
Sistema: Por um número de turnos igual ao número de sucessos rolados, o personagem pode tentar aparar projéteis. Isso exige uma ação para cada projétil que o jogador queira bloquear, e o personagem precisa conseguir ver o disparo vindo (Sentidos Aguçados permite acompanhar balas visualmente). Cada tentativa de aparar exige uma rolagem de Destreza + Armas Brancas, com dificuldade determinada pela velocidade do projétil. Objetos arremessados têm dificuldade 6; flechas e virotes de besta, dificuldade 7; e balas, dificuldade 9. Cada sucesso subtrai um sucesso da rolagem de ataque do atacante.
Escudo da Navalha não permite ao personagem aparar ataques à distância que não envolvam projéteis sólidos, como fogo, relâmpago ou sangue cuspido.

••••• Golpear a Carne Verdadeira
Sistema: Os efeitos de Golpear a Carne Verdadeira duram um número de turnos igual ao número de sucessos rolados, e terminam com o primeiro ataque bem-sucedido que o personagem fizer nesse período. A espada causa apenas a quantidade básica de dano letal que uma arma de seu tamanho e tipo normalmente causaria, desconsiderando todos os aprimoramentos que ela possa ter recebido (ainda que aumentos na força ou na velocidade do portador, como Potência e Celeridade, mantenham seus efeitos normais, assim como sucessos extras na rolagem de ataque).
Contudo, todas as defesas sobrenaturais do alvo (inclusive Fortitude) são igualmente anuladas — ele absorve o ataque apenas com seu Vigor básico. Se a anulação de seus poderes e defesas deixar o alvo incapaz de absorver dano letal, ele não pode absorver o ataque de forma alguma. Armadura corporal protege contra este ataque, por ser uma forma mundana de defesa.]==],
				},
				["Bone Path"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 164


Bone Path


• Tremens
Sistema: Para usar Tremens, o necromante gasta um único ponto de sangue, e o jogador precisa ter sucesso numa rolagem de Destreza + Ocultismo (dificuldade 6). Quanto mais sucessos obtidos, mais complicada pode ser a ação efetuada no cadáver. Um sucesso permite um movimento instantâneo, como um espasmo, enquanto cinco permitem ao vampiro estabelecer condições específicas sob as quais o corpo se anima ("Na próxima vez que alguém entrar na sala, quero que o cadáver se sente e abra os olhos."). Em nenhuma circunstância Tremens pode fazer um corpo morto atacar ou causar dano.

•• Vassouras do Aprendiz
Sistema: Uma rolagem de Raciocínio + Ocultismo (dificuldade 7) e o gasto de um ponto de sangue e um de Força de Vontade é tudo o que se precisa para animar cadáveres com Vassouras do Aprendiz. O número de cadáveres animados é igual ao número de sucessos obtidos. O necromante precisa então declarar a tarefa à qual está incumbindo seus zumbis. Os cadáveres se dedicam ao trabalho até terminarem o serviço (quando então desabam) ou até que algo (inclusive o tempo) os destrua.
Cadáveres animados dessa forma não têm iniciativa própria e são incapazes de fazer julgamentos de valor. Eles respondem a instruções bem literais. Assim, um zumbi pode ser mandado "varrer esta sala todo dia até que toda a poeira e teias de aranha sumam" ou "transcrever este manuscrito" com expectativa de resultados razoáveis, enquanto uma ordem mais aberta como "conserte esta motocicleta" ou "pesquise este ritual necromântico e anote os resultados" estaria fadada ao fracasso.
Corpos energizados por este poder continuam a se decompor, ainda que a uma taxa muito mais lenta que o normal.

••• Hordas Cambaleantes
Sistema: O jogador gasta um ponto de Força de Vontade. O jogador precisa então ter sucesso numa rolagem de Raciocínio + Ocultismo (dificuldade 8). Cada sucesso permite ao vampiro erguer mais um cadáver da sepultura, e custa um ponto de sangue. Se o jogador não puder ou escolher não pagar o custo em sangue de zumbis adicionais além de certo número, os sucessos extras simplesmente se perdem. Cada zumbi pode seguir uma instrução simples, como "Fique aqui e guarde este cemitério contra quaisquer intrusos" ou "Mate-os!".
Nota: Zumbis criados por Hordas Cambaleantes esperarão para sempre, se preciso, para cumprir suas funções. Muito depois de a carne ter apodrecido e caído de seus ossos misticamente animados, os zumbis esperarão, esperarão e esperarão, ainda capazes de desempenhar seus deveres.

•••• Roubo de Alma
Sistema: O jogador gasta um ponto de Força de Vontade e então faz uma rolagem disputada de Força de Vontade contra a vítima pretendida (dificuldade 6). Os sucessos indicam o número de horas durante as quais a alma original fica forçada para fora de sua morada. O corpo em si permanece autonomicamente vivo, porém catatônico.
Este poder pode ser usado para criar hospedeiros adequados para Possessão Demoníaca. Não tem efeito sobre Membros ou outras criaturas sobrenaturais (exceto carniçais) enquanto tais criaturas não estiverem mortas — no caso de vampiros, isso significa a Morte Final.

••••• Possessão Demoníaca
Sistema: O corpo em questão não pode estar morto há mais de 30 minutos, e o novo inquilino precisa concordar em habitá-lo — um fantasma ou forma astral não pode ser forçado a entrar numa nova casca. Contudo, a maioria dos fantasmas agarraria a oportunidade de bom grado. Caso o vampiro, por qualquer razão, deseje inserir uma alma no cadáver de outro vampiro (antes que ele se desfaça em cinzas), o necromante precisa obter cinco sucessos numa rolagem resistida de Força de Vontade contra o dono original do corpo. Do contrário, o intruso tem a entrada negada.
Nota: A alma pode usar quaisquer habilidades físicas (Esportes, Briga, Potência) que seu novo lar de carne possua, e quaisquer habilidades mentais (Informática, Direito, Presença) que ela já possuísse. Ela não pode usar as habilidades físicas de sua forma antiga, nem as habilidades mentais da nova.]==],
				},
				["Cenotaph Path"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 166


Cenotaph Path


• Um Toque da Morte
Sistema: O necromante simplesmente toca uma pessoa ou objeto que suspeita ser vítima de influência espectral. O jogador rola Percepção + Prontidão (dificuldade 6). Se tiver sucesso, o necromante consegue determinar se um fantasma exerceu algum tipo de poder sobre o sujeito, ou mesmo passou por perto, conforme a duração detalhada abaixo.
1 sucesso — Último turno; detecta uso de poderes espectrais.
2 sucessos — Últimos três turnos; detecta uso de poderes espectrais.
3 sucessos — Última hora; detecta o toque do fantasma e o uso de poderes espectrais.
4 sucessos — Último dia; detecta o toque do fantasma e o uso de poderes espectrais.
5 sucessos — Última semana; detecta a passagem próxima do fantasma, o toque dele e o uso de poderes espectrais.
Numa falha, o necromante não recebe impressão alguma. Uma falha crítica revela uma resposta enganosa (um objeto pode parecer tingido de poder espectral sem estar, ou vice-versa). Caso o necromante tenha sucesso na detecção enquanto toca um objeto ou pessoa que um fantasma esteja possuindo, ele imediatamente percebe que o fantasma ainda está lá dentro. A impressão obtida nesse caso basta para contar como uma imagem do espírito para os fins dos poderes da Trilha do Sepulcro, de modo que o Membro pode ser capaz de (por exemplo) ordenar imediatamente que um fantasma saia da pessoa que ele possui.

•• Revelar os Catene
Sistema: O necromante segura e examina o objeto por pelo menos três turnos — se for um item, isso significa virá-lo nas mãos, correr os dedos por ele ou de outro modo lhe dar um olhar crítico; com uma pessoa, isso pode exigir um exame mais… invasivo… O jogador então gasta um ponto de sangue e rola Percepção + Ocultismo (dificuldade 7). Se tiver sucesso, o Membro determina se o objeto guarda algum significado para algum fantasma e, com três ou mais sucessos, a identidade de pelo menos um desses fantasmas (o que permite ao Membro usar a Trilha do Sepulcro naquele espectro, se quiser). Se o necromante já conhece algum dos fantasmas envolvidos, os laços deles são revelados junto com a identidade — assim, se o necromante já conhece um espectro bem o bastante para invocá-lo e compeli-lo com outros poderes, a identificação bem-sucedida de um grilhão diz se o objeto está ligado àquele fantasma, além de quaisquer outras impressões obtidas.
Se ocorrer uma falha crítica, o necromante nunca mais conseguirá usar este poder com sucesso no item examinado.

••• Pisar Sobre a Sepultura
Sistema: O jogador simplesmente declara a intenção de sentir o Sudário numa área e faz uma rolagem de Força de Vontade (dificuldade 8). O sucesso revela se o local é altamente sintonizado com as Terras das Sombras, se é mediano (não particularmente próximo do mundo dos mortos) ou se está bem distante do reino da morte. Uma tentativa fracassada de usar o poder não tem efeito adverso, embora só possa ser tentada uma vez por cena (de modo que o necromante precisa esperar um tempo ou se mover para outra área antes de tentar Pisar Sobre a Sepultura novamente).
Uma falha crítica atordoa o necromante à inação por um turno inteiro e lhe custa um ponto temporário de Força de Vontade, enquanto ele é dominado por arrepios e uma sensação de desespero avassalador.
Com três ou mais sucessos, o necromante consegue determinar se a força do Sudário foi artificialmente alterada na área.

•••• Dobre de Finados
Sistema: Sempre que alguém morre e se torna fantasma a menos de um quilômetro do necromante, ela percebe automaticamente o falecimento (embora muitos escolham ignorar este poder "sempre ligado" a menos que estejam procurando alguém ativamente). Este poder não localiza nem identifica automaticamente o novo fantasma, mas o jogador pode gastar um ponto de Força de Vontade e rolar Percepção + Ocultismo (dificuldade 7) para que o necromante obtenha uma noção vaga da distância e da direção do novo espectro. Com um sucesso, o Membro pode sentir um puxão vago numa direção geral; com três sucessos, o necromante consegue sentir a direção e estimar a distância dentro de meio quilômetro. Com cinco sucessos, o necromante percebe imediatamente a localização do novo fantasma com precisão de 30 cm. Uma falha não acarreta penalidade, mas uma tentativa com falha crítica manda o necromante correr na direção errada.
O Narrador pode determinar que distúrbios no Submundo, magia interveniente ou outros fenômenos semelhantes turvem essa sensação, simplesmente para evitar sobrecarregar uma crônica com caça a fantasmas e rolagens constantes.

••••• Vínculo Efêmero
Sistema: O necromante precisa cobrir um objeto com seu sangue (o equivalente a um ponto de sangue inteiro); se o sujeito for uma pessoa, então esse indivíduo precisa ingerir a vitae. O jogador marca o ponto de sangue, gasta um ponto de Força de Vontade e rola Manipulação + Ocultismo (dificuldade 8). Se tiver sucesso, o item temporariamente se torna grilhão de um espectro. Se o Membro já sabe o nome do espectro ou tem uma impressão psíquica forte, então o objeto pode se tornar grilhão a qualquer distância, mesmo de um fantasma que normalmente não se aproxima do mundo dos vivos (desde que o fantasma ainda exista). Do contrário, o necromante precisa conseguir ver ou sentir o fantasma (com Testemunha da Morte, Visão do Sudário ou outros meios do tipo).
Um grilhão criado artificialmente dessa forma funciona, para todos os fins necrománticos e espectrais, como um grilhão normal: pode ser detectado com outros poderes de Necromancia, o vampiro ganha bônus em Necromancia contra o espectro sintonizado a ele, e o fantasma igualmente acha mais fácil exercer seus poderes sobre o sujeito (de modo que o vampiro pode transformar um carniçal desavisado em consorte de um espectro versado em possessão…). O fantasma pode mergulhar no grilhão para se curar; inversamente, se o grilhão for destruído, o espectro é banido para alguma região inacessível do Submundo, talvez para nunca mais voltar.
Um grilhão criado com Vínculo Efêmero dura uma noite por sucesso obtido. O gasto de um ponto adicional de Força de Vontade aumenta essa duração para uma semana por sucesso, ao passo que gastar um ponto permanente de Força de Vontade estende a duração para um ano e um dia.
Uma falha crítica com este poder não só causa o fracasso como também deixa o fantasma imediatamente ciente do que o necromante estava tentando fazer. A maioria dos fantasmas não recebe bem Membros intrometidos tentando fabricar correntes artificiais para eles.]==],
				},
				["Corpse in the Monster"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 168


Corpse in the Monster


• Máscara da Morte
Sistema: O jogador gasta um ponto de sangue para o personagem adquirir a forma descrita. Os afligidos pela Máscara da Morte perdem dois pontos de Destreza e de Aparência (mínimo de 1 em Destreza e 0 em Aparência) pela duração do poder. O jogador também ganha dois dados extras em sua parada de Intimidação, caso queira aterrorizar espectadores. Além disso, se o personagem permanecer perfeitamente imóvel, observadores precisam de cinco sucessos numa rolagem de Percepção + Medicina (dificuldade 7) para distinguir o personagem de um cadáver comum. O jogador não precisa rolar nada para o personagem parar de se mover — vampiros não têm funções autonômicas.
Se o usuário infligir Máscara da Morte a outro vampiro, ele precisa gastar um ponto de sangue, tocar o alvo e então fazer uma rolagem de Vigor + Medicina (dificuldade igual ao Vigor do alvo + 3). A Máscara da Morte dura até o próximo pôr do sol, a menos que o personagem que criou a máscara queira extinguir seus efeitos antes.

•• Frio da Sepultura
Sistema: O jogador gasta um ponto de Força de Vontade. Pelo resto da cena, o personagem não sofre penalidades por ferimento, e o jogador ganha um dado adicional em todas as paradas que envolvam resistir a manipulação emocional, como Intimidação ou Empatia. Contudo, o jogador também perde um dado das paradas para manipular emocionalmente os outros. O personagem é frio como um peixe para quem interage com ela, e as pessoas não respondem prontamente a ela. O Frio da Sepultura não protege o personagem contra as depredações da Besta. Ela pode estar emocionalmente fria na superfície, mas se outros a provocarem e enfurecerem o bastante, ela ainda está sujeita a frenesi normalmente.

••• Maldição da Vida
Sistema: O jogador gasta um ponto de Força de Vontade e rola Inteligência + Medicina (dificuldade 8) para afetar um alvo na linha de visão e a não mais que 20 metros do personagem. Se a rolagem tiver sucesso, o alvo sofre as fraquezas dos vivos sem ganhar nenhum benefício desse estado. Ele não se torna imune à luz do sol ou a artefatos sagrados, por exemplo. Contudo, fica seriamente distraído por necessidades mundanas, com o resultado líquido de que seu jogador sofre penalidade de +2 de dificuldade em todas as rolagens. Ele pode ignorar essas distrações ao custo de um ponto de Força de Vontade por cena. Além disso, a vítima não pode usar sangue para aumentar seus Atributos Físicos enquanto este poder estiver em efeito, e Força de Vontade não pode eliminar essa penalidade. O poder permanece em efeito até o próximo pôr do sol.

•••• Dádiva do Cadáver
Sistema: O jogador gasta um ponto de Força de Vontade e rola Vigor + Ocultismo (dificuldade 8). Para cada sucesso, o personagem pode passar um turno num estado em que é mais parecido com um cadáver animado do que com um vampiro. Artefatos sagrados e solo sagrado não têm efeito, e o personagem fica imune a frenesi e a Rötschreck. A luz do sol causa apenas dano contundente, e ainda assim só se houver pele nua exposta num dia claro. Ser estacado no coração é apenas tão perigoso quanto ser apunhalado no baço morto dele. O fogo o fere apenas como feriria um mortal — causando dano letal em vez de agravado.
Caso o personagem chegue ao fim da duração do poder enquanto exposto a qualquer das coisas nocivas mencionadas, ele imediatamente sofre o efeito pleno delas. Se estiver estacado, fica imobilizado; se estiver em ou perto do fogo, começa a sofrer o dano que um Cainita deveria sofrer, e precisa rolar imediatamente contra Rötschreck.

••••• Dádiva da Vida
Sistema: O jogador gasta 12 pontos de sangue, queimando o máximo de sangue possível a cada turno até atingir esse patamar. Ela então rola Vigor + Ocultismo (dificuldade 6) e precisa de apenas um sucesso para o poder funcionar. Uma falha crítica tem efeitos catastróficos. O personagem pode ser morto instantaneamente ou pode inadvertidamente Abraçar sua vítima, por exemplo. Se levar mais de um turno para gastar o sangue necessário para efetivar esta capacidade, ela não entra em efeito até que todos os 12 pontos tenham sido gastos. Contudo, o sangue precisa ser gasto continuamente — o vampiro não pode queimar cinco, sair para se alimentar e queimar mais sete uma hora depois. Por outro lado, ela pode se alimentar enquanto ativa o poder — num turno pode queimar um ponto de sangue enquanto bebe três. Como poucos Membros acima da Sétima Geração conseguem gastar tal quantidade de sangue com facilidade, a forma mais eficiente de ativar este poder é ter um humano por perto que possa ser sacrificado para alimentar a transformação.
Depois da transformação, o personagem ganha muitos traços de um humano comum. Ela fica em grande parte imune aos efeitos escaldantes do sol (dificuldades de Fortitude para absorver dano de luz solar direta são reduzidas à metade, e ela não sofre dano se estiver suficientemente coberta), e pode experimentar e apreciar muitas das coisas boas da vida humana. Ela mantém alguns de seus benefícios vampíricos, contudo. Fortitude e Auspícios continuam funcionando se ela tiver qualquer uma dessas Disciplinas, e o Narrador pode permitir que ela mantenha outras Disciplinas também, se julgar dramaticamente apropriado. Ela também mantém os benefícios de um vampiro no que toca a lidar com dano contundente. Contudo, ela ainda é vulnerável a artefatos sagrados, à fé humana e a ser estacada. Seu sangue continua sendo vitae, não sangue humano. O uso desta capacidade — que cria um arremedo da vida humana — pode interferir no avanço de Caminho do personagem, a critério do Narrador.
O vampiro não é mais vulnerável ao fogo que qualquer outro mortal enquanto está nesse estado semivivo, mas ainda sofre um pouco com a Besta. As dificuldades de frenesi e Rötschreck são reduzidas à metade (arredondando para cima). Ela pode permanecer ativa durante o dia sem os limites de parada de dados por Humanidade ou Caminho, embora esteja certamente cansada durante o dia, já que esse não é seu horário habitual de atividade.
Sua Besta cobra uma retribuição perigosa quando seu dia de "vida" termina. Embora a influência dela seja bastante suprimida durante a duração deste poder, a Besta faz o que quer com o vampiro pelas seis noites seguintes, pois todas as dificuldades para resistir a frenesi aumentam em três. O necromante sábio se esconde em algum lugar durante esse período, mas, dependendo de moral e temperamento, o isolamento forçado pode levá-la ao frenesi por si só.]==],
				},
				["Die Herrschaft des Wyrm"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 109


Die Herrschaft des Wyrm


• Infecção Malfeana
Sistema: O infernalista precisa saber o nome de seu alvo e pintar um olho na própria palma com vitae. Para cada sucesso no uso da Trilha, a vítima perde quaisquer poderes associados à sua Fé Verdadeira por um número de noites:
1 sucesso — Uma noite
2 sucessos — Três noites
3 sucessos — Uma semana
4 sucessos — Um mês
5 sucessos — Um ano
6 ou mais sucessos — Permanente (ou até ser removido por uma bênção)
Se refletido de volta sobre o infernalista por causa de uma falha crítica ou de a vítima combater o efeito com sucesso numa rolagem de Raciocínio + Ocultismo, a Infecção Malfeana impede o uso de Taumaturgia Negra por um número de noites correspondente ao número de sucessos, conforme indicado acima. Essa limitação pode ser removida por um novo acordo de subserviência com um demônio.

•• Ruína para a Alma
Sistema: O infernalista precisa segurar um item ou artigo outrora tocado por seu alvo e pingar vitae sobre ele. Uma Ruína demoníaca se prenderá à alma do alvo com um sucesso, aumentando em +2 a dificuldade dos testes de Virtude (até o máximo de 9). Cada sucesso determina quanto tempo a Ruína permanece:
1 sucesso — Uma noite
2 sucessos — Três noites
3 sucessos — Uma semana
4 sucessos — Um mês
5 sucessos — Um ano
6 ou mais sucessos — Permanente (ou até ser removido por uma bênção)

••• Miserere Dissonante
Sistema: O infernalista precisa possuir um pedaço de pele, cabelo ou unha da vítima e embebê-lo em vitae. As bocas gritantes do Wyrm entram na mente da vítima, aumentando a dificuldade de todos os testes de Força de Vontade e de qualquer teste que exija concentração em um ponto por sucesso rolado (até o máximo de dificuldade 9), e retiram um ponto temporário de Força de Vontade da vítima a cada noite em que permanecem.
O efeito é permanente, até a vítima receber uma bênção ou invocar um demônio da loucura para aliviá-la dessa dor. Se ocorrer o segundo caso, o demônio — uma criatura guinchante sem forma tangível — oferecerá à vítima uma trégua em troca de um serviço. A natureza desse serviço depende de quão fraca de vontade o demônio julga estar a vítima nesse momento (e é determinada pelo Narrador), mas pedidos típicos incluem o assassinato de um inocente, o despojamento de todos os bens materiais ou um sacrifício de vitae ao infernalista.

•••• Alimentar o Wyrm
Sistema: O infernalista precisa possuir uma porção (um ponto de sangue) do sangue da vítima, misturar sua vitae a ele e beber a mistura. Isso pode formar um laço de sangue, se o sangue for de outro vampiro. Uma vez engolido o sangue, uma rolagem bem-sucedida inflige um nível de dano agravado por sucesso. Esse dano pode ser absorvido com Fortitude. O corpo da vítima se contorce de dor e manifesta excrescências desumanas, reduzindo sua Aparência em dois pontos. A perda de Aparência é cumulativa se este poder for usado mais de uma vez.
A vítima só pode recuperar sua Aparência concordando em servir ao Wyrm. Se o fizer, um demônio de desejo ligado à vaidade aparece numa superfície reflexiva e exige um sacrifício, cuja severidade é determinada pelo tamanho da perda de beleza ocorrida. Sacrifícios podem envolver arrancar o sorriso do rosto de um recém-nascido, matar uma dúzia de virgens ou a vítima permitir que um Maeljin habite sua alma permanentemente.

••••• Hospedar o Maeljin
Sistema: O infernalista precisa assassinar um mortal ou vampiro com quem mantenha relação próxima. Se a vítima for um vampiro, o infernalista precisa cometer diablerie em sua presa. Uma rolagem bem-sucedida manifesta um dos Maeljin no corpo do infernalista. Cada sucesso determina quanto tempo o Maeljin permanece:
1 sucesso — Uma cena
2 sucessos — Uma noite
3 sucessos — Duas noites
4 sucessos — Quatro noites
5 sucessos — Uma semana
6 ou mais sucessos — Permanente (ou até ser removido por uma bênção)
Se o Maeljin permanecer permanentemente, o vampiro corre o risco de perder todo o controle para o demônio dentro dele. Torna-se então uma corrida para alcançar a purificação antes que o Maeljin possa exercer domínio absoluto.
As naturezas dos vários Maeljin diferem. Como seres de profanidade elemental, eles representam pecados abstratos, como vergonha, perda, raiva e uma multidão de outros conceitos intangíveis. Todos os Maeljin fortalecem seu hospedeiro com seis pontos para distribuir entre Atributos (nenhum Atributo pode ganhar mais de dois), seis pontos para distribuir entre Habilidades e seis pontos para distribuir entre Disciplinas (nenhuma Disciplina pode ganhar mais de dois). O Narrador decide onde esses pontos são alocados na ficha.
Como exemplos de como um Maeljin possuidor pode fortalecer seu hospedeiro: um Maeljin da Luxúria pode alocar seis pontos entre Atributos Sociais, colocar três pontos em Performance e outros três em Expressão, com dois pontos indo para Presença, mais dois para Dominação e os dois finais em Daimoinon. Um Maeljin das Mentiras pode alocar dois pontos em Manipulação, dois em Inteligência e dois em Destreza, com seis pontos espalhados entre Habilidades coercitivas. Os seis finais podem ir para Ofuscação, Presença e Quimerismo.
Um Maeljin habitante permite ao hospedeiro praticar livremente os poderes que concedeu. Ele quer o hospedeiro fortalecido e terrível. Contudo, ocasionalmente tentará influenciar ou controlar abertamente seu hospedeiro para agir de modos favoráveis à sua agenda alienígena. Nesses casos, o vampiro precisa fazer uma rolagem de Instinto/Autocontrole (dificuldade 8) para não agir do modo que o Maeljin deseja. O Narrador determina os desejos do Maeljin. Ele pode tentar exercer controle uma vez por noite.
Conforme o Maeljin se aproxima do fim de sua habitação, ele busca consumir o hospedeiro levando-o a um ato de autodestruição. O Maeljin só pode tentar isso uma vez, mas, para resistir a se lançar numa pira, saudar o sol ou entrar num edifício santificado, o vampiro precisa ter sucesso numa rolagem de Coragem (dificuldade 9). Se sua coterie tentar contê-lo, ele imediatamente cai em frenesi. O Maeljin partirá em paz se não tiver êxito em sua tentativa de reclamar a alma inteira de seu hospedeiro.]==],
				},
				["Elemental Mastery"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 214


Elemental Mastery


• Força Elemental
Sistema: O jogador distribui um total de três pontos temporários de bônus entre a Força e o Vigor do personagem. O número de sucessos na rolagem para ativar o poder é o número de turnos que esses pontos permanecem. O jogador pode gastar um ponto de Força de Vontade para aumentar essa duração em um turno. Este poder não pode ser "acumulado" — uma aplicação precisa expirar antes que a seguinte possa ser feita.

•• Línguas de Madeira
Sistema: O número de sucessos dita a quantidade e a relevância da informação que o personagem recebe. Um sucesso pode render a lembrança que um pedregulho tem de um incêndio florestal, enquanto três podem indicar que ele se recorda de uma figura sombria passando correndo, e cinco farão a pedra relatar uma descrição precisa de um Gangrel local.

••• Animar o Imóvel
Sistema: Este poder exige o gasto de um ponto de Força de Vontade com menos de quatro sucessos na rolagem. Cada uso deste poder anima um objeto não maior que o tamanho humano; o conjurador pode controlar simultaneamente um número de objetos animados igual à sua Inteligência. Objetos animados por este poder permanecem animados enquanto estiverem na linha de visão do conjurador ou por até uma hora, embora o taumaturgo possa realizar outras ações nesse período.

•••• Forma Elemental
Sistema: O número de sucessos determina quão completamente o personagem assume a forma que deseja imitar. São necessários ao menos três sucessos para o personagem usar seus sentidos ou Disciplinas enquanto estiver na forma alterada. Este poder dura o resto da noite, embora o personagem possa voltar à sua forma normal à vontade.

••••• Invocar Elemental
Sistema: O personagem precisa estar perto de alguma quantidade do elemento clássico correspondente ao espírito que deseja invocar. O espírito invocado pode ou não seguir de fato as instruções do conjurador depois de invocado, mas em geral ao menos dará atenção aproximada ao que lhe for mandado fazer. O número de sucessos obtidos na rolagem de Força de Vontade determina o nível de poder do elemental.
O elemental tem três pontos em todos os Atributos Físicos e Mentais. Um ponto pode ser somado a um dos Atributos Físicos do elemental para cada sucesso obtido pelo conjurador na rolagem inicial. O Narrador deve determinar as Habilidades, os ataques e o dano do elemental, e quaisquer poderes especiais que ele tenha relacionados a seu elemento.
Uma vez invocado o elemental, o taumaturgo precisa exercer controle sobre ele. Quanto mais poderoso o elemental, mais difícil é essa tarefa. O jogador rola Manipulação + Ocultismo (dificuldade igual ao número de sucessos obtidos na rolagem de conjuração + 4), e o número de sucessos determina o grau de controle:
Falha crítica — O elemental ataca imediatamente o taumaturgo.
Falha — O elemental fica livre e pode atacar qualquer um ou deixar a cena, a critério do Narrador.
1 sucesso — O elemental não ataca quem o invocou.
2 sucessos — O elemental se comporta favoravelmente com quem o invocou e pode prestar um serviço em troca de pagamento (determinado pelo Narrador).
3 sucessos — O elemental presta um serviço, dentro do razoável.
4 sucessos — O elemental realiza qualquer tarefa para o conjurador que não ponha em risco a própria existência.
5 sucessos — O elemental realiza qualquer tarefa que o conjurador lhe determinar, mesmo uma que leve várias noites para ser concluída ou que coloque sua existência em risco.]==],
				},
				["Grave’s Decay"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 171


Grave’s Decay


• Destruir a Casca
Sistema: O jogador gasta um ponto de sangue enquanto o vampiro pinga sua vitae sobre o cadáver. O jogador então rola Inteligência + Medicina (dificuldade 6). Um sucesso é tudo o que se precisa para reduzir o cadáver a pó, embora o processo leve um número de turnos igual a cinco menos os sucessos.

•• Rigor Mortis
Sistema: O jogador gasta um ponto de Força de Vontade e rola Inteligência + Medicina (dificuldade 7). Cada sucesso congela o alvo no lugar por um turno. Uma falha indica simplesmente a perda do ponto de Força de Vontade, enquanto uma falha crítica torna o alvo imune aos poderes da trilha Decomposição da Sepultura pelas próximas 24 horas. O alvo precisa estar visível e a cerca de 25 metros para que esta capacidade tenha efeito. Um alvo congelado é tratado como se tivesse sido estacado (ver p. 280). Com uma rolagem de Força de Vontade (dificuldade 7) e dois sucessos, o alvo pode se libertar da rigidez em seu turno. A falha lhe causa um nível de dano contundente e significa mais um turno desperdiçado e congelado.

••• Mirrar
Sistema: O jogador gasta um ponto de Força de Vontade. O personagem escolhe um membro do alvo e então toca esse membro. Se o alvo estiver tentando evitar contato, o jogador do invocador rola Destreza + Briga para acertar normalmente. Se o personagem tiver sucesso em tocar o membro pretendido, o alvo sofre dois ferimentos agravados. A menos que o alvo absorva ambos os ferimentos (com Fortitude, por exemplo), o membro atingido fica aleijado e inutilizável até que ambos os ferimentos tenham sarado. Membros curam os ferimentos como fariam com qualquer outro ferimento agravado (ver p. 285). Mortais são incapazes de curar ferimentos agravados, então sofrem pelo resto da vida a menos que sejam curados por meios sobrenaturais. Um membro mirrado não se degenera mais, nem mesmo num mortal. O personagem pode ficar aleijado para a vida, mas o membro não infecciona nem gangrena.
Os efeitos do mirramento dependem do membro afetado. Um braço aleijado tem Força 0, não pode se beneficiar de Potência e não pode carregar nada mais pesado que cerca de 200 gramas. Uma perna aleijada impede o personagem de se mover mais rápido que um pulo trôpego ou um manquejar arrastado. O personagem sofre os efeitos do Defeito Manco (ver p. 482). Um único olho ou ouvido mirrado impõe +1 de dificuldade às rolagens de Percepção pertinentes. Perder ambos os olhos ou ambos os ouvidos impõe os efeitos dos Defeitos Cego ou Surdo (ver pp. 484 e 483). Uma língua mirrada impõe os efeitos do Defeito Mudo (p. 483), enquanto um rosto mirrado reduz a Aparência do alvo em um para cada ferimento agravado sofrido.

•••• Corromper a Carne Não-Morta
Sistema: A jogadora escolhe um alvo na linha de visão de sua personagem e a não mais que 20 metros. Ela rola Inteligência + Medicina (dificuldade 6) e gasta um ponto de Força de Vontade. O jogador da vítima precisa rolar Vigor (+ Fortitude, se apropriado) contra dificuldade igual à Força de Vontade da atacante. Se a jogadora obtiver mais sucessos que a vítima, esta contrai imediatamente uma doença virulenta. A doença tem os seguintes efeitos:
• A Força e o Raciocínio da vítima são reduzidos à metade (arredondando para baixo).
• A vítima perde um ponto de Destreza.
• O jogador da vítima precisa gastar um ponto adicional de sangue toda noite para o vampiro despertar à consciência. Mortais perdem um nível de vitalidade por dia em vez disso.
• O jogador da vítima precisa rolar Autocontrole ou Instinto cada vez que o personagem se alimentar (dificuldade 8). Numa falha, o vampiro não consegue manter dentro do corpo o sangue que acabou de ingerir, e o vomita em grandes jorros horrendos de sangue, perdendo qualquer benefício que o sangue pudesse ter dado. Humanos vomitam comida.
Toda noite ao pôr do sol, a vítima tem uma chance de se livrar da praga. O jogador da vítima rola Vigor, com dificuldade igual a 10 menos o número de poentes desde que contraiu a praga. Numa rolagem bem-sucedida, o personagem contém a doença e começa a se recuperar. Ele recupera instantaneamente sua capacidade de reter sangue, e recupera um ponto de Atributo perdido por hora até que todos tenham voltado.

••••• Dissolver a Carne
Sistema: O jogador gasta dois pontos de sangue e um ponto de Força de Vontade enquanto o vampiro extrai uma quantidade de sua vitae carregada com o poder da sepultura. Se ela a pingar sobre um único Membro vítima em algum dos poucos turnos seguintes (a maior parte do sangue precisa alcançar a vítima, de modo que atirar algumas gotas é ineficaz), isso faz pedaços inteiros do corpo da vítima se desfazerem em cinzas. O jogador rola Força de Vontade contra dificuldade igual ao Vigor da vítima + 3. Para cada sucesso, o alvo sofre um ferimento agravado.
A carne não-morta danificada por este poder vira pó (perdido por ora), e precisa ser regenerada penosamente pela vítima, caso ela sobreviva. Esse pó sem dúvida tem propriedades místicas que vários feiticeiros poderiam aproveitar. Cada ferimento infligido por esta capacidade representa a perda de cerca de um oitavo do peso do alvo; o Narrador escolhe de onde vem a perda. (Ela também pode se distribuir por todo o corpo, deixando a vítima um pouco mais esquelética ou faltando pedaços de carne.)
A regeneração de partes do corpo ocorre naturalmente enquanto se curam ferimentos agravados na taxa normal (ver p. 285).]==],
				},
				["Hands of Destruction"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 217


Hands of Destruction


• Decomposição
Sistema: Se a rolagem tiver sucesso, o objeto inanimado tocado pelo taumaturgo envelhece 10 anos a cada minuto em que o Membro o toca. Se o vampiro romper o contato físico e desejar envelhecer o objeto de novo, outro ponto de sangue precisa ser gasto e outra rolagem precisa ser feita. Este poder não afeta vampiros.

•• Retorcer a Madeira
Sistema: Vinte e cinco quilos de madeira visível podem ser retorcidos para cada ponto de sangue gasto neste poder (o taumaturgo pode gastar quanto sangue quiser neste poder, até seu máximo geracional por turno). Também é possível deformar múltiplos objetos visíveis — como todas as estacas que uma equipe de caçadores de vampiros empunha.

••• Toque Ácido
Sistema: O jogador gasta um ponto de sangue para criar o ácido — o sangue literalmente se transmuta na secreção volátil. Um ponto de sangue cria ácido suficiente para queimar através de meio centímetro de chapa de aço ou sete centímetros de madeira. O dano de um ataque corpo a corpo aumentado por ácido é agravado e custa um ponto de sangue por turno de uso. O taumaturgo é imune ao próprio toque ácido.

•••• Atrofia
Sistema: A vítima pode resistir aos efeitos de Atrofia obtendo três ou mais sucessos numa rolagem de Vigor + Esportes (dificuldade 8). A falha significa que o membro fica permanente e completamente aleijado. Resistência parcial é possível: um sucesso indica que a dificuldade de qualquer rolagem que envolva o uso do braço aumenta em dois, embora esses efeitos ainda sejam permanentes no caso de mortais. Dois sucessos significam que as dificuldades aumentam em um. Vampiros afligidos por este poder podem gastar cinco pontos de sangue para rejuvenescer membros atrofiados. Mortais ficam permanentemente aleijados. Este poder afeta apenas membros ou partes de membros (braços, pernas, mãos); não funciona na cabeça, no tronco etc. das vítimas.

••••• Reduzir a Pó
Sistema: Cada sucesso na rolagem envelhece a vítima em 10 anos. Uma vítima em potencial pode resistir com uma rolagem de Vigor + Coragem (dificuldade 8), mas precisa acumular mais sucessos que a rolagem de ativação do conjurador — é tudo ou nada. Se a vítima tiver sucesso, não envelhece nada. Se não obtiver mais sucessos que o taumaturgo, envelhece o total. Obviamente, este poder, embora afete vampiros, não tem efeito prejudicial sobre eles (são imortais). No máximo, uma vítima Membro fica mais pálida e mirra ligeiramente (-1 em Aparência) por uma noite.]==],
				},
				["Iter Pernix"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 297


Iter Pernix


• Um ser (uma montaria ou humano a pé)

•• Até seis montarias ou uma carroça carregada

••• Até doze montarias ou quatro carroças de suprimentos

•••• Até 24 montarias ou oito carroças de suprimentos ou uma máquina de cerco

••••• Até 48 montarias ou dezesseis carroças de suprimentos ou quatro máquinas de cerco]==],
				},
				["Lure of Flames"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 218


Lure of Flames


• Vela (dificuldade 3 para absorver, um nível de vitalidade de dano agravado por turno)

•• Palma de chamas (dificuldade 4 para absorver, um nível de vitalidade de dano agravado por turno)

••• Fogueira de acampamento (dificuldade 5 para absorver, dois níveis de vitalidade de dano agravado por turno)

•••• Fogueira grande (dificuldade 7 para absorver, dois níveis de vitalidade de dano agravado por turno)

••••• Inferno (dificuldade 9 para absorver, três níveis de vitalidade de dano agravado por turno)]==],
				},
				["Mastery of the Mortal Shell"] = {
					pt = [==[Rites of Blood, pág. 138


Mastery of the Mortal Shell


• Vertigem
Sistema: Um toque do taumaturgo provoca desorientação em sua vítima. Se tiver sucesso, todas as ações físicas da vítima ficam com +1 de dificuldade pela duração do poder. Usos subsequentes desta Trilha podem estender a duração, embora a dificuldade não aumente mais.

•• Contorção
Sistema: Ao fazer contato físico com um dos membros do alvo, o taumaturgo o torna inútil pela duração de Contorção. Uma perna inutilizada torna difícil ficar de pé, e a vítima sofre dificuldade aumentada (+1 a +3, dependendo das circunstâncias) em desafios de Destreza pertinentes relacionados à perna, como dançar ou se equilibrar em beiradas. Um braço contorcido pende sem vida ao lado do sujeito. Uma cabeça inutilizada causa perda da fala e aumenta em +2 a dificuldade de todas as rolagens Sociais, enquanto os músculos faciais espasmam fora de controle.

••• Convulsão
Sistema: Um toque leve do taumaturgo impõe os efeitos bastante desagradáveis deste poder ao alvo. Pela duração da convulsão, o corpo do alvo se contorce, atormentando-a a ponto da incapacitação. As vítimas sofrem penalidade de +2 de dificuldade em todas as ações físicas. A vítima também sofre um nível de dano contundente a cada turno, enquanto seu corpo se retorce impotente. A critério do Narrador, os efeitos deste poder podem até causar a morte em mortais extremamente doentes ou feridos.
O dano pode ser reduzido normalmente (embora níveis vindos de armadura não se apliquem).

•••• Falência Corporal
Sistema: O taumaturgo não precisa mais tocar sua vítima para golpear com este nível de domínio da Trilha. Ela pode afetar qualquer alvo em sua linha de visão, mas precisa manter contato visual com a vítima o tempo todo para manter este efeito. Uma ativação bem-sucedida deste poder concede efeitos semelhantes aos de Convulsão, exceto que o dano é letal (e portanto não absorvível por mortais) devido à falência maciça e completa de tecidos e órgãos. Além disso, a vítima sofre penalidade de +2 de dificuldade em todas as ações.
O sujeito pode resistir aos efeitos de Falência Corporal por meio de uma rolagem de Vigor + Fortitude quando o taumaturgo tenta golpear o alvo (dificuldade igual à Força de Vontade atual do taumaturgo). Cada sucesso que a vítima obtiver nessa rolagem reduz a duração de Falência Corporal em um turno.

••••• Marionete
Sistema: O taumaturgo pode afetar qualquer alvo em sua linha de visão, mas precisa manter contato visual com a vítima o tempo todo para manter este efeito. O sujeito pode resistir aos efeitos de Marionete numa rolagem de Vigor + Fortitude (dificuldade igual à Força de Vontade atual do taumaturgo) quando o taumaturgo tenta assumir o controle. Cada sucesso que a vítima obtiver nessa rolagem reduz a duração de Marionete em um turno. Vítimas sem Fortitude não têm a resistência física para desafiar este efeito.
Pela duração deste poder, o taumaturgo pode fazer a vítima realizar qualquer ação física, usando as paradas do alvo com penalidade de +2 de dificuldade em todas as rolagens. A concentração que este poder exige também aumenta em dois as dificuldades do próprio taumaturgo para todas as demais ações pessoais realizadas enquanto manipula a vítima. Para estender a duração desse controle, o taumaturgo precisa fazer uma segunda rolagem de ativação. Marionete não priva a vítima de sua consciência, apenas do controle físico sobre o próprio corpo. Durante esse tempo de domínio do taumaturgo, o alvo permanece ciente de que alguma força externa está manipulando suas ações físicas, consciente de que não são suas. A vítima pode gastar um ponto de Força de Vontade para tentar realizar uma ação mental ou social, como ativar uma Disciplina ou falar.]==],
				},
				["Movement of the Mind"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 220


Movement of the Mind


• Meio quilograma

•• 10 quilogramas

••• 100 quilogramas

•••• 250 quilogramas

••••• 500 quilogramas]==],
				},
				["Neptune’s Might"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 218


Neptune’s Might


• Olhos do Mar
Sistema: O número de sucessos rolados determina quão longe no passado o personagem consegue enxergar.
1 sucesso — Um dia
2 sucessos — Uma semana
3 sucessos — Um mês
4 sucessos — Um ano
5 sucessos — 10 anos
O Narrador pode exigir uma rolagem de Percepção + Ocultismo para o personagem discernir detalhes muito pequenos nas imagens transmitidas. Este poder só pode ser usado em água parada; lagos e poças servem, mas oceanos, rios, esgotos e taças de vinho não.

•• Prisão de Água
Sistema: O número de sucessos obtidos na rolagem é o número de sucessos que a vítima precisa obter numa rolagem de Força (dificuldade 8; Potência pode somar a essa rolagem) para se libertar. Um sujeito só pode ser mantido em uma prisão por vez, embora o conjurador seja livre para invocar múltiplos usos deste poder sobre vítimas distintas e possa dissolver essas prisões à vontade. Se uma quantidade suficiente de água (ao menos o equivalente a uma banheira) não estiver presente, a dificuldade da rolagem de Força de Vontade para ativar este poder aumenta em um.

••• Sangue em Água
Sistema: O personagem precisa tocar a vítima pretendida. O jogador rola Força de Vontade normalmente. Cada sucesso converte um ponto de sangue da vítima em água. Um sucesso mata um mortal em minutos. Vampiros que perdem pontos de sangue para este poder também sofrem penalidades de parada de dados como se tivessem recebido um número equivalente de níveis de vitalidade em ferimentos. A água deixada no organismo do alvo por este ataque evapora à taxa do equivalente a um ponto de sangue por hora, mas o sangue perdido não retorna.
A critério do Narrador, outros líquidos podem ser transformados em água com este poder (a dificuldade para tal ação é reduzida em um a menos que a substância seja particularmente perigosa ou de natureza mágica). O personagem ainda precisa tocar a substância ou seu recipiente para usar este poder.

•••• Muralha Fluida
Sistema: O personagem toca a superfície de um corpo de água parada; o jogador gasta três pontos de Força de Vontade e o ponto de sangue normalmente exigido e rola normalmente. Os sucessos são aplicados tanto à largura quanto à altura da muralha; cada sucesso "compra" três metros em uma das dimensões. A muralha pode ser posicionada em qualquer ponto da linha de visão do personagem e precisa ser formada em linha reta. A muralha dura até o próximo nascer do sol. Não pode ser escalada, embora se possa voar sobre ela. Para atravessar a barreira, qualquer ser sobrenatural (inclusive seres que tentem passar pela muralha em outros níveis de existência, como fantasmas) precisa obter ao menos três sucessos numa única rolagem de Força de Vontade (dificuldade 9).

••••• Desidratar
Sistema: Este poder pode ser usado em qualquer alvo na linha de visão do personagem. O jogador rola normalmente; a vítima resiste com uma rolagem de Vigor + Fortitude (dificuldade 9). Cada sucesso obtido pelo conjurador se traduz em um nível de vitalidade de dano letal infligido à vítima. Este ferimento não pode ser absorvido (a rolagem de resistência substitui a absorção neste ataque), mas pode ser curado normalmente. Vampiros perdem pontos de sangue em vez de níveis de vitalidade, embora, se um vampiro não tiver pontos de sangue, este ataque inflija perda de níveis de vitalidade como faria contra um mortal. A vítima deste ataque também precisa rolar Coragem (dificuldade igual ao número de sucessos obtidos pelo conjurador + 3) para conseguir agir no turno seguinte ao ataque; a falha significa que ela é dominada pela agonia e não consegue fazer nada.]==],
				},
				["Path of Conjuring"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 220


Path of Conjuring


• Invocar a Forma Simples
Sistema: A cada turno em que o conjurador desejar manter o objeto em existência, outro ponto de Força de Vontade precisa ser gasto, ou o objeto desaparece.

•• Permanência
Sistema: O jogador precisa investir três pontos de sangue num objeto para torná-lo real.

••• Magia do Ferreiro
Sistema: Objetos criados por Magia do Ferreiro são automaticamente permanentes e custam cinco pontos de sangue para conjurar. Itens particularmente complexos muitas vezes exigem uma rolagem de Conhecimento (Ofícios, Ciências, Tecnologia etc.) além da rolagem básica.

•••• Conjuração Reversa
Sistema: Esta é uma rolagem de sucessos prolongada. O conjurador precisa acumular tantos sucessos quantos o conjurador original obteve ao criar o objeto em questão. Isso também pode ser usado pelo taumaturgo para banir objetos que ela mesma criou com esta Trilha.

••••• Poder Sobre a Vida
Sistema: O jogador gasta 10 pontos de sangue. Imperfeitas e impermanentes, criaturas invocadas por esta trilha são complexas demais para existir por muito tempo. Dentro de uma semana após a conjuração, os simulacros se desvanecem na insubstancialidade.]==],
				},
				["Path of Corruption"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 221


Path of Corruption


• Contradizer
Sistema: Este poder pode ser usado em qualquer sujeito na linha de visão do personagem. O jogador rola normalmente. O alvo rola Percepção + Lábia (dificuldade igual ao número de sucessos obtidos pelo conjurador + 2). Dois sucessos permitem ao sujeito perceber que está sendo influenciado por alguma fonte externa. Três sucessos permitem a ela identificar a fonte do efeito. Quatro sucessos lhe dão um momento de hesitação, não realizando nem sua ação original nem o inverso dela, enquanto cinco permitem que ela leve a cabo a ação original.
O Narrador dita qual é a reação precisa do sujeito a este poder. Contradizer não pode ser usado em combate nem para afetar outras ações (a critério do Narrador) que sejam principalmente físicas e reflexas.

•• Subverter
Sistema: Este poder exige que o personagem faça contato visual (ver p. 152) com a vítima pretendida. O jogador rola normalmente. O alvo resiste com uma rolagem de Percepção + Lábia (dificuldade igual à Manipulação + Lábia do alvo). Se o taumaturgo obtiver mais sucessos, a vítima fica inclinada a seguir um desejo reprimido e vergonhoso pelo período de tempo descrito abaixo.
1 sucesso — Cinco minutos
2 sucessos — Uma hora
3 sucessos — Uma noite
4 sucessos — Três noites
5 sucessos — Uma semana
O Narrador determina o desejo ou a agenda precisa que a vítima segue. Deve estar de acordo com os Defeitos Psicológicos que ela possui ou com os aspectos negativos de sua Natureza (por exemplo, uma Solitária desejando isolamento a tal ponto que se torna violenta se for forçada a comparecer a um evento social). O sujeito não deve ficar fixado em seguir essa nova agenda o tempo todo, mas ocasionalmente deve ser forçado a gastar um ponto de Força de Vontade se surgir a oportunidade de sucumbir e ele quiser resistir ao impulso.

••• Dissociar
Sistema: O personagem precisa tocar o alvo. O jogador rola normalmente. O alvo resiste com uma rolagem de Força de Vontade (dificuldade igual à Manipulação + Empatia do taumaturgo). A vítima perde três dados de todas as rolagens Sociais por um período determinado pelo número de sucessos obtidos pelo conjurador:
1 sucesso — Cinco minutos
2 sucessos — Uma hora
3 sucessos — Uma noite
4 sucessos — Três noites
5 sucessos — Uma semana
Esta penalidade se aplica a todas as rolagens que dependam de Atributos Sociais, mesmo as exigidas para o uso de Disciplinas. Se este poder for usado num personagem que tenha participado da Vaulderie ou ritual semelhante, os níveis de Vinculum desse personagem são reduzidos em três pela duração do efeito de Dissociar.
O efeito primário de Dissociar recai mais sobre a interpretação que sobre a mecânica de jogo. Vítimas deste poder devem ser interpretadas como retraídas, desconfiadas e emocionalmente distantes. O Narrador deve se sentir à vontade para exigir o gasto de um ponto de Força de Vontade de um jogador que não siga essas diretrizes.

•••• Vício
Sistema: O sujeito precisa encontrar ou ser exposto à sensação, substância ou ação à qual o personagem quer viciá-lo. O taumaturgo então toca seu alvo. O jogador rola normalmente; a vítima resiste com uma rolagem de Autocontrole/Instinto (dificuldade igual ao número de sucessos obtidos pelo conjurador + 3). A falha dá ao sujeito um vício instantâneo naquele objeto.
Um personagem viciado precisa satisfazer seu vício ao menos uma vez por noite. Cada noite em que ele fica sem satisfazer seu desejo impõe uma penalidade cumulativa de um dado em todas as suas paradas (até um mínimo de um dado). A vítima precisa rolar Autocontrole/Instinto (dificuldade 8) toda vez que for confrontada com o objeto de seu vício e desejar evitar ceder. Vício dura um número de semanas igual à Manipulação do taumaturgo.
Um indivíduo pode tentar romper os efeitos de Vício. Isso exige uma rolagem prolongada de Autocontrole/Instinto (dificuldade igual à Manipulação + Lábia do conjurador), com uma rolagem por noite. O viciado precisa acumular um número de sucessos igual a três vezes o número de sucessos obtidos pelo conjurador. A vítima não pode ceder ao vício ao longo do tempo necessário para acumular esses sucessos. Se ceder, todos os sucessos acumulados são perdidos e ele precisa recomeçar na noite seguinte. Note que a parada de Autocontrole/Instinto é reduzida a cada noite em que a vítima passa sem alimentar seu vício.

••••• Dependência
Sistema: O personagem envolve o alvo numa conversa. O jogador rola normalmente. A vítima rola Autocontrole/Instinto (dificuldade igual ao número de sucessos obtidos pelo conjurador + 3). A falha significa que a psique da vítima foi sutilmente atada à do taumaturgo por uma noite por sucesso rolado pelo conjurador.
Uma vítima atada não é menos propensa a atacar quem a controla, e não sente emoções positivas particulares por ela. Contudo, fica psicologicamente viciada na presença dela, e sofre penalidade de um dado em todas as rolagens quando não está perto dela nem realizando tarefas para ela.
Além disso, ele é muito menos resistente às ordens dela, e suas paradas são reduzidas à metade quando tenta resistir à Dominação, à Presença (ou a outros poderes de controle mental ou emocional) ou a rolagens Sociais mundanas dela. Por fim, ele é incapaz de recuperar Força de Vontade quando não está na presença do taumaturgo.]==],
				},
				["Path of Haunting"] = {
					pt = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, pág. 174


Path of Haunting


• Canção dos Mortos
Sistema: A vampira entoa o canto para a vítima enquanto sua jogadora gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade igual à Força de Vontade atual do alvo). Uma falha crítica indica que a vampira afeta a si mesma como se tivesse obtido sucessos iguais ao número de 1 rolados.
Por um número de noites igual aos sucessos rolados, o alvo sofre de depressão e ansiedade mórbida. Essa fixação soma +2 à dificuldade de rolagens Sociais (exceto as que envolvam Intimidação) e +1 à dificuldade de todas as demais rolagens não reflexas. Se um alvo sofrer os efeitos deste poder por mais noites contínuas que sua Força de Vontade permanente, ele perde um ponto de Força de Vontade permanente. Esse ciclo continua após um intervalo igual ao novo valor em dias, com a vítima perdendo um ponto de Força de Vontade permanente após cada iteração dessas. Quando um personagem chega a zero de Força de Vontade permanente, ele comete suicídio (se vivo) ou cai em torpor (se vampiro). Se o poder for interrompido por ao menos uma noite, a vítima recupera sua Força de Vontade permanente à taxa de um ponto por semana. Um vampiro que cai em torpor por chegar a zero de Força de Vontade desperta com seu valor original.

•• Invocar Fogo-Fátuo
Sistema: A jogadora gasta um ponto de sangue e rola Carisma + Ocultismo (dificuldade 5) para conjurar um orbe de luz pálida que dura uma cena. O fogo-fátuo pode assumir qualquer cor que a vampira escolher e não tem substância nem peso. Pode voar tão rápido quanto a vampira consegue correr, lançando uma iluminação fria tão brilhante quanto uma vela. Mortais que contemplem o fogo-fátuo precisam rolar Força de Vontade (dificuldade 4) e obter mais sucessos que a conjuradora, ou caem num transe leve, que soma +1 à dificuldade de todas as ações por distração. Se os sucessos da vampira forem o dobro dos do mortal, ele segue a luz sem se importar com nada além dos obstáculos mais óbvios. Contorna árvores e pedras, mas cai em areia movediça ou de um parapeito alto. Qualquer ruído alto ou outra distração rompe o devaneio imediatamente.
Se a jogadora da vampira tiver falha crítica na rolagem de conjuração, o fogo-fátuo aparece e age com sua própria agenda malévola. Tal criatura é apenas um estorvo, mas pode demonstrar astúcia notável ao atrair inimigos ao refúgio da vampira ou ao denunciar a posição dela.

••• Tormenta Onírica
Sistema: A vampira faz contato visual com a vítima, enquanto sua jogadora gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade igual à Força de Vontade permanente do alvo). Se tiver sucesso, a vítima sente uma leve sensação de inquietação. Da próxima vez em que dormir, sofre pesadelos horríveis sobre a própria morte. Ainda que não consiga lembrar plenamente o conteúdo de suas visões ao acordar, o trauma emocional o impede de recuperar Força de Vontade. Além disso, seu déjà vu distorcido e sua paranoia antinatural lhe dão os Defeitos Pesadelos e Presença Sinistra (V20, p. 495) pelo dia. Uma falha crítica ao conjurar este poder inflige os mesmos sonhos terríveis à vampira quando ela dormir.

•••• Fantasmas
Sistema: A vampira visualiza a aparição desejada, enquanto a jogadora gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade 7). Essas criações não têm substância e não podem falar nem realizar ações complicadas, embora emitam um frio surreal. Cada sucesso permite à vampira criar um fenômeno, ou acrescentar uma característica ou condição a outro fantasma. Por exemplo, três sucessos poderiam animar sombras para se arrastarem e contorcerem (um sucesso) e criar uma ilusão de sangue escorrendo que irrompe numa nuvem de moscas quando alguém se aproxima (um sucesso para o sangue e um sucesso para a condição). Este poder pode criar aparições em qualquer ponto da linha de visão da conjuradora. O Narrador continua sendo o árbitro final do que é ou não possível com este poder.
Uma falha crítica chama a atenção de um fantasma maléfico, dando à vampira o Defeito Assombrado (V20, p. 495) por um número de noites igual aos 1 rolados.

••••• Tormento
Sistema: A jogadora gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade 8). Numa falha crítica, a vampira ganha permanentemente o Defeito Assombrado (V20, p. 495), atraindo os fantasmas mais vis e odiosos. Se tiver sucesso, a vítima sente um calafrio súbito. A dificuldade para fantasmas afetarem o alvo com qualquer poder diminui em um para cada sucesso rolado, até um mínimo de dificuldade 4. Fantasmas maliciosos se aglomeram em torno do alvo, infligindo avidamente todo horror à sua disposição. A redução de dificuldade diminui em um a cada dia ao amanhecer, até a vítima voltar ao normal e os espectros perderem o interesse. Múltiplas aplicações deste poder não podem ser acumuladas para aumentar a duração ou a intensidade do efeito. As estatísticas e os poderes dos espectros ficam a cargo do Narrador, mas a experiência deve aterrorizar completamente o personagem e bem pode resultar em perturbações, no mínimo.]==],
				},
				["Path of Mars"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 224


Path of Mars


• Grito de Guerra
Sistema: Pela duração de uma cena, o vampiro soma um a seu Traço de Coragem. Além disso, para fins de efeitos hostis, sua Força de Vontade é considerada um ponto mais alta (embora este bônus se aplique apenas ao Traço em si, não à reserva de Força de Vontade). Um personagem só pode obter os benefícios de Grito de Guerra uma vez por cena.

•• Golpe Certeiro
Sistema: Ao invocar este poder, o jogador não precisa rolar para ver se o ataque do vampiro acerta — ele acerta, automaticamente. Só ataques de Armas Brancas ou Briga podem ser feitos dessa maneira. Esses ataques são considerados ataques de um sucesso; não oferecem dados de dano adicionais. Além disso, podem ser esquivados, bloqueados ou aparados normalmente, e o defensor precisa de apenas um sucesso (já que o número de sucessos dos ataques é assumido como um). Golpe Certeiro não tem efeito se tentado em múltiplos ataques (divisões de parada de dados) num único turno pelo mesmo personagem.

••• Dança do Vento
Sistema: A jogadora pode esquivar de qualquer número de ataques com sua parada de dados completa num único turno. Esta vantagem se aplica apenas a esquivas — se a personagem quiser atacar e esquivar, a jogadora ainda precisa dividir sua parada. Este poder dura uma cena.

•••• Coração Destemido
Sistema: Coração Destemido concede ao vampiro um ponto extra em cada um dos Atributos Físicos (Força, Destreza e Vigor). Esses Traços não podem exceder seus máximos geracionais, embora o jogador possa usar pontos de sangue para elevar os Traços do personagem ainda mais. Os efeitos duram uma cena, e um personagem só pode obter seus benefícios uma vez por cena. O vampiro precisa passar duas horas em estado calmo e de repouso após o uso de Coração Destemido, ou perde um ponto de sangue a cada 15 minutos até descansar.

••••• Camaradas de Armas
Sistema: O jogador escolhe um dos poderes de nível inferior da trilha, invocando-o normalmente. Depois, ele toca outro personagem e (se a rolagem de Camaradas de Armas tiver sucesso) concede o benefício a ela também. O mesmo poder pode ser entregue a qualquer número de companheiros de matilha, desde que as rolagens de Camaradas de Armas tenham sucesso e o taumaturgo pague os custos de sangue apropriados.]==],
				},
				["Path of Spirit Manipulation"] = {
					pt = [==[Rites of Blood, pág. 142


Path of Spirit Manipulation


• Visão Hermética
Sistema: Visão Hermética permite ao taumaturgo perceber o reino espiritual entremeado ao mundo material por uma hora. Cada nível adicional de sucesso na rolagem de ativação aumenta a duração deste poder em mais trinta minutos.

•• Cântico Astral
Sistema: Cântico Astral permite ao taumaturgo falar com qualquer espírito visível por Visão Hermética durante quinze minutos. Cada nível adicional de sucesso na rolagem de ativação aumenta a duração deste poder em mais quinze minutos.

••• Voz de Comando
Sistema: O taumaturgo faz a rolagem oposta normal de Força de Vontade contra o espírito. O espírito alvo resiste com Força de Vontade (dificuldade igual à Manipulação + Ocultismo do taumaturgo). O grau de sucesso que o taumaturgo alcança determina a complexidade e a severidade da ordem que pode dar.
Falha crítica — O espírito fica imune às ordens do personagem pelo resto da noite. Ele reage como o Narrador julgar apropriado. Tipicamente, o espírito fica irado o bastante para buscar vingança na primeira oportunidade. Pode ignorar, zombar ou até atacar o personagem, a critério do Narrador.
Falha — O espírito não é afetado, e novas tentativas de comandá-lo são feitas com +1 de dificuldade (cumulativo).
1 sucesso — O espírito obedece a uma ordem bem simples que não lhe cause grande incômodo.
2 sucessos — O espírito atende a uma ordem relativamente direta à qual não se oponha inatamente.
3 sucessos — O espírito concorda em realizar uma tarefa moderadamente complexa que não viole sua ética.
4 sucessos — O espírito consente com uma tarefa prolongada ou intrincada que não o coloque em perigo imediato.
5 sucessos — O espírito aceita uma tarefa longa ou quase impossível, ou uma que signifique sua destruição.

•••• Aprisionar o Efêmero
Sistema: O taumaturgo precisa primeiro localizar um receptáculo simbolicamente alinhado ao espírito alvo, que eventualmente se tornará o fetiche. Então precisa ordenar ao espírito alvo que entre no receptáculo por meio de uma rolagem oposta de Força de Vontade. O espírito alvo resiste com Força de Vontade (dificuldade igual à Manipulação + Ocultismo do taumaturgo).
Se o taumaturgo tiver sucesso, pode criar um fetiche de nível de poder baseado no número de sucessos obtidos sobre o espírito, até um fetiche de nível cinco. Por exemplo, se o taumaturgo vencer a rolagem oposta de Força de Vontade contra o espírito por três sucessos, cria um fetiche de nível três.
Criar e manter um fetiche é difícil; por isso, o número de fetiches que um taumaturgo pode criar é limitado por sua Força de Vontade. Se o taumaturgo doar tal fetiche, ele ainda conta contra seu total de espaços disponíveis. Ela só pode criar um fetiche adicional quando um de seus fetiches anteriores tiver sido destruído.
Um fetiche concede um número de dados de bônus a uma perícia específica correspondente ao nível do fetiche. Por exemplo, um espírito de cura preso dentro de um bisturi concederia dados extras (o nível do fetiche) para qualquer rolagem de Medicina. O Narrador sempre tem a palavra final sobre que tipo de fetiche pode ser feito.
Um fetiche é ativado rolando-se a Força de Vontade do usuário (dificuldade igual ao nível de poder do fetiche + 3). Uma falha crítica nessa rolagem destrói o componente físico do fetiche e liberta o espírito que estava preso dentro dele.

••••• Dualidade
Sistema: O taumaturgo pode interagir com o mundo espiritual por quinze minutos. Cada nível adicional de sucesso na rolagem de ativação aumenta a duração deste poder em mais quinze minutos. Dualidade só pode ser acionada enquanto o personagem começa o processo no mundo físico. Nesse estado, o taumaturgo fica suscetível a ataques de ambos os reinos e sofre +1 de dificuldade em todas as rolagens de Percepção. O personagem ainda é considerado como estando no mundo físico para fins de física básica (e bom senso).
Espíritos previamente irritados buscarão vingança física contra taumaturgos desatentos que usem este poder.
Uma falha crítica na rolagem para ativar este poder arranca o vampiro do mundo físico e o prende no reino espiritual. O caminho de volta ao reino físico, se houver, fica a critério do Narrador, e pode dar início a uma história inteiramente nova.]==],
				},
				["Path of Technomancy"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 224


Path of Technomancy


• Analisar
Sistema: O personagem precisa tocar o dispositivo para aplicar este poder. O número de sucessos rolados determina quão bem o personagem compreende aquele equipamento em particular. Um sucesso permite um conhecimento básico (ligar/desligar e funções simples), enquanto três sucessos concedem competência em operar o dispositivo, e cinco sucessos mostram ao personagem toda a gama de potencial do dispositivo. O conhecimento dura um número de minutos igual à Inteligência do personagem.
Este poder também pode ser usado para compreender uma inovação tecnológica não física — geralmente um software — com +2 de dificuldade. O personagem precisa tocar o computador em que o software está instalado — apenas segurar o pen drive ou CD-ROM não basta. Software aplicado remotamente a um dispositivo (como por uma loja de aplicativos) também não pode ser analisado até estar instalado.

•• Queima
Sistema: O personagem pode usar este poder a uma distância de até 10 vezes sua Força de Vontade em metros, embora +1 de dificuldade seja aplicado se ela não estiver tocando o item alvo. O número de sucessos determina a extensão do dano:
1 sucesso — Interrupção momentânea do funcionamento (um turno), mas sem dano permanente.
2 sucessos — Perda significativa de função; +1 de dificuldade para usar o dispositivo pelo resto da cena.
3 sucessos — O dispositivo quebra e fica inoperante até ser consertado.
4 sucessos — Mesmo depois de consertado, as capacidades do dispositivo ficam diminuídas (+1 de dificuldade permanente para usar).
5 sucessos — O equipamento é perda total; completamente irrecuperável.
Sistemas grandes o bastante, como um cluster de servidores ou uma aeronave de passageiros, impõem +2 a +4 de dificuldade (a critério do Narrador) para serem afetados por este poder. Além disso, alguns sistemas, como redes militares e bancárias, podem estar protegidos contra surtos e picos de energia e, portanto, possuir de um a cinco dados (novamente a critério do Narrador) para rolar e resistir a este poder. Cada sucesso nessa rolagem (dificuldade 6) retira um sucesso da rolagem de Taumaturgia.
Queima pode ser usado para destruir armazenamento eletrônico de dados; nesse caso, três sucessos destroem toda a informação no item alvo, e cinco a apagam além de qualquer esperança de recuperação não mágica.

••• Encriptar/Decriptar
Sistema: O personagem toca o dispositivo ou recipiente de dados que deseja encriptar. O jogador rola normalmente. O número de sucessos obtidos é aplicado como modificador de dificuldade para quem tentar usar o equipamento protegido ou acessar a informação embaralhada sem a ajuda do personagem. O conjurador pode dissipar o efeito a qualquer momento tocando o item alvo e gastando um ponto de Força de Vontade.
Este poder também pode ser usado para contrariar o uso de Encriptar/Decriptar por outro taumaturgo. O jogador rola com +1 de dificuldade; cada sucesso anula um do "dono".
Os efeitos de Encriptar/Decriptar duram um número de semanas igual à Força de Vontade permanente do personagem.

•••• Acesso Remoto
Sistema: Este poder pode ser usado em qualquer dispositivo eletrônico na linha de visão do personagem. O número de sucessos rolados é o número máximo de dados de qualquer Habilidade pertinente que o personagem pode usar enquanto controla o dispositivo remotamente. (Por exemplo, se Fritz tem Tecnologia 5 e obtém três sucessos ao usar Acesso Remoto numa fechadura de teclado, ele só pode aplicar três pontos de seu nível de Tecnologia a quaisquer rolagens que fizer por meio de qualquer uso do poder.) Acesso Remoto dura um número de turnos igual ao número de sucessos rolados, e só pode ser usado num item por vez.
Se um item for destruído enquanto estiver sob os efeitos de Acesso Remoto, o personagem sofre cinco dados de dano contundente devido ao choque de ter suas percepções bruscamente arremessadas de volta ao próprio corpo.

••••• Teletrabalho
Sistema: O personagem toca qualquer forma de dispositivo de comunicação: um celular, um netbook com 3G, um tablet com Wi-Fi ou qualquer outra coisa conectada direta ou indiretamente à Internet. O jogador rola normalmente e gasta um ponto de Força de Vontade. Teletrabalho dura cinco minutos por sucesso rolado, e pode ser estendido em 10 minutos com o gasto de outro ponto de Força de Vontade. O número de sucessos indica o alcance máximo a que o personagem pode projetar sua consciência para longe do corpo:
1 sucesso — 40 quilômetros
2 sucessos — 400 quilômetros
3 sucessos — 1500 quilômetros
4 sucessos — 8000 quilômetros
5 sucessos — Qualquer lugar do mundo
Enquanto estiver na rede, o personagem pode aplicar qualquer outro poder da Trilha da Tecnomancia a qualquer dispositivo ou dado com que entrar em contato. Uma perda de conexão, seja pela destruição de uma parte da rede, seja simplesmente por perda de sinal de celular, arremessa sua consciência de volta ao corpo e inflige oito dados de dano contundente.
Um personagem viajando pela Internet por meio deste poder pode usar seus poderes da Trilha da Tecnomancia com dificuldade normal. Usar quaisquer outras habilidades ou poderes enquanto assim engajado é feito com +2 de dificuldade.]==],
				},
				["Path of the Father’s Vengeance"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 226


Path of the Father’s Vengeance


• Litania de Zillah
Sistema: Se o sujeito tiver quaisquer laços de sangue ou Vinculi com outros vampiros, este poder os revela ao conjurador. Embora o conjurador possa não conhecer os vampiros em questão, este poder de fato revela os nomes e dá impressões psíquicas aproximadas dos indivíduos em questão.

•• O Orgulho da Anciã
Sistema: Este poder reduz a Aparência do alvo a zero. Todas as rolagens Sociais durante esse período geralmente falham, a menos que o personagem tente intimidar ou coagir o sujeito. Este poder dura uma noite.

••• Banquete de Cinzas
Sistema: A vítima deste poder não consegue mais consumir sangue, vomitando-o como faria com comida ou bebida mortal. Em vez disso, a vítima só pode comer cinzas, e os "pontos de sangue" que obtém disso só podem ser usados para se erguer a cada noite. "Pontos de sangue" de cinza não podem ser usados para alimentar Disciplinas, aumentar Atributos ou alimentar carniçais (embora pontos de sangue reais no corpo do personagem no momento em que este poder é invocado ainda possam ser usados para tanto). O equivalente a um ponto de sangue em cinza é cerca de meio litro, e qualquer cinza serve — cinza de cigarro, restos de fogueira ou cadáveres de vampiros destruídos pelo fogo ou pelo sol. Este poder dura uma semana.

•••• Desfavor de Uriel
Sistema: A presença de qualquer luz deixa o sujeito desconfortável, e luz forte de qualquer tipo — lanternas, faróis etc. — inflige um nível de vitalidade de dano agravado ao personagem a cada turno em que ele permanecer sob seu foco direto. A maioria dos vampiros que sofre esta maldição opta por dormir pela duração dela, escondendo-se na escuridão de seus refúgios até poder caminhar novamente entre os vivos sem dor. Este poder dura uma semana.

••••• Valedição
Sistema: Quando este poder faz efeito, o sujeito reverte imediatamente à sua Geração original. Essa mudança pode implicar a perda de pontos em certos Traços devido aos máximos geracionais. Este poder dura uma semana, após a qual quaisquer Traços reduzidos aos máximos de Geração mais alta voltam ao normal. Leva três turnos para pronunciar o verso completo que efetiva os efeitos deste poder.]==],
				},
				["Path of the Focused Mind"] = {
					pt = [==[Rites of Blood, pág. 139


Path of the Focused Mind


• Prontidão
Sistema: Este poder só é utilizável na própria taumaturga. Cada sucesso na rolagem de ativação soma um dado a uma parada especial pelo resto do turno. Esses dados podem ser usados em quaisquer rolagens ou ações relacionadas a Raciocínio que a taumaturga realizar durante este turno. Alternativamente, cada dado retirado da parada soma um à iniciativa do conjurador.

•• Centramento
Sistema: Este poder é utilizável em qualquer sujeito ao alcance da voz da taumaturga e dura um turno por sucesso na rolagem de ativação. Durante esse período, o alvo não é afetado por nenhum poder ou efeito (com a notável exceção de disciplinas de Anciões) que reduza suas paradas de dados. Isso inclui penalidades por ferimento, modificadores situacionais e Disciplinas. Modificações em números de dificuldade ainda se aplicam nesse período, contudo. Além disso, devido à serenidade antinatural que este poder concede, o alvo recebe dois dados adicionais em todas as tentativas de evitar ou romper o frenesi.

••• Mente de Trilho Único
Sistema: Este poder pode afetar qualquer um que consiga ouvir a taumaturga. A invocação bem-sucedida torna o alvo incapaz de dividir qualquer parada de dados para múltiplas ações e incapaz de mudar de tática depois de declaradas as ações. Como benefício colateral, o alvo reduz em um a dificuldade da ação declarada. Ações adicionais que a vítima realize (por Celeridade, por exemplo) durante a duração deste poder precisam dar seguimento à ação inicial, pois ela se concentra inteiramente nessa única ideia. Se o alvo quiser tentar um curso de ação diferente, precisa gastar um ponto de Força de Vontade por cena (ou por turno, em combate). A duração de Mente de Trilho Único é uma cena, ou um turno por sucesso na rolagem de ativação.

•••• Pensamento Duplo
Sistema: O uso bem-sucedido de Pensamento Duplo permite ao conjurador realizar duas ações sem penalidade durante seu turno. (Note que este poder especificamente suspende as restrições de múltiplas ações detalhadas em V20, p. 248.) A ação extra concedida por este poder precisa ser uma ação mental, seja o uso de Disciplinas como Auspícios ou Taumaturgia, seja a contemplação de algum problema. Se a personagem estiver usando as duas ações para resolver um problema, ela tem duas paradas de dados separadas para usar. Essas duas ações acontecem ao mesmo tempo, conforme determinado pela iniciativa da personagem. Não se pode usar a ação extra para reconjurar Pensamento Duplo.

••••• Clareza Perfeita
Sistema: Clareza Perfeita dura uma cena (ou um turno mais um turno adicional para cada sucesso na rolagem de ativação, se usada em combate). Nesse período, a taumaturga tem as dificuldades de todas as ações reduzidas em dois. O Membro fica imune a frenesi e Rötschreck de todas as fontes, mesmo gatilhos sobrenaturais. Por fim, quaisquer meios de controlar ou influenciar a taumaturga sofrem +2 de dificuldade, incluindo poderes como Presença, Dominação e Dementação.]==],
				},
				["Path of the Levinbolt"] = {
					pt = [==[Rites of Blood, pág. 140


Path of the Levinbolt


• Apagão
Sistema: A taumaturga simplesmente lança o olhar sobre um alvo alimentado por eletricidade. Com uma rolagem de ativação bem-sucedida, ela pode desligar um dispositivo elétrico por dez minutos por sucesso na rolagem de ativação. A faísca de eletricidade arqueia do dispositivo diretamente para a taumaturga numa exibição assustadora de poder místico. A fonte deste poder é imediatamente conhecida.

•• Faísca
Sistema: A taumaturga simplesmente toca um alvo (após o gasto de sangue exigido e a rolagem de ativação pelo jogador) e libera a faísca. A eletricidade pode estalar de qualquer parte do corpo do conjurador, de modo que uma taumaturga pode dar uma surpresa desagradável a quem a tocar. A descarga elétrica resultante inflige quatro dados de dano letal aos alvos (dificuldade 7 para absorver) e causa curto-circuito em equipamentos e dispositivos eletrônicos não especificamente aterrados contra descargas atmosféricas.

••• Iluminar
Sistema: Cada sucesso obtido na rolagem de ativação do jogador se traduz em aproximadamente um turno de energia suficiente para alimentar um punhado de luzes ou um pequeno dispositivo elétrico. Alternativamente, a taumaturga pode chocar alguém pelo toque, como no poder Faísca, mas causando oito dados de dano elétrico letal (dificuldade 8 para absorver).
A corrente criada com este poder não é forte o bastante para forçar caminho por condutores menos que ideais, e assim simplesmente inflige dano elétrico a metais brutos, madeiras ou outra matéria na forma de queimadura e descoloração. A taumaturga pode alternativamente deixar a eletricidade faiscar ao redor da mão, dos olhos ou da cabeça; isso cria iluminação equivalente a uma lâmpada fraca e reduz em 2 a dificuldade de quaisquer rolagens de Intimidação.

•••• Fúria de Thor
Sistema: A taumaturga concentra sua atenção no alvo e então dirige os raios arremessados por meio de uma rolagem de Percepção + Ciências (dificuldade 6 mais o alcance em metros, máximo de 4 metros). Cada sucesso inflige um nível de dano letal (dificuldade 8 para absorver). A fonte deste poder é imediatamente conhecida.

••••• Olho da Tempestade
Sistema: Quando a taumaturga gasta um ponto de Força de Vontade para invocar este poder, ela solidifica a eletricidade armazenada dentro de si numa barreira mística que a cerca completamente. O conjurador se torna imune a quaisquer ataques à distância. Armas de metal, como espadas, causam ferimento normalmente no primeiro golpe, mas então derretem com o contato com a barreira, e quem as empunha sofre um nível de dano letal. Inimigos que ousem tocar o conjurador sofrem dois pontos de dano agravado (dificuldade 8 para absorver). Armas não metálicas, como estacas de madeira, não são afetadas pelo Olho da Tempestade. Este poder dura um único turno, e cada sucesso adicional na rolagem de ativação estende essa duração em um turno. Ataques mentais e sociais podem atravessar esta barreira.]==],
				},
				["Potestas Exsecrabilis"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 300


Potestas Exsecrabilis


• Estigma
Sistema: O taumaturgo gasta um ponto de sangue e rola Força de Vontade normalmente. Se tiver sucesso, o alvo sofre penalidade de +2 em todas as ações Sociais (rolagens que envolvam Carisma, Manipulação ou Aparência), até uma dificuldade máxima aumentada de 9. O efeito dura até o próximo pôr do sol ou até que o conjurador decida levantar a maldição.

•• Enfermidade
Sistema: Para cada sucesso que o taumaturgo rolar, as paradas de Força, Destreza e Vigor do alvo são reduzidas em um (até o máximo de penalidade de três dados com três sucessos) por um número de noites igual à Força de Vontade do conjurador. A cada noite, a vítima pode fazer uma rolagem de Força de Vontade (dificuldade 7) para se livrar do efeito; cada sucesso reduz a penalidade aos Atributos Físicos em um dado até a noite seguinte. Se ela remover todas as penalidades numa única noite, a maldição é quebrada.

••• Bode Expiatório
Sistema: Para cada sucesso que o taumaturgo rolar, a maldição dura uma noite. Durante esse tempo, a vítima aparece a todos que encontra como alguma forma de inimigo. Embora isso não resulte necessariamente em violência imediata, tende a impedir o alvo de interagir de qualquer modo normal com os que estão à sua volta.

•••• Corromper o Corpo
Sistema: Uma vez que o taumaturgo lance a maldição e role por sucessos, o alvo pode tentar resistir rolando Força de Vontade (dificuldade 7), com cada sucesso reduzindo a força efetiva da maldição em um. Depois disso, contudo, não há chance de desfazê-la a menos que o conjurador a levante voluntariamente ou a duração se esgote.
A maldição exige apenas um turno para ser conjurada, mas a transformação leva três turnos para se completar. Nesses três turnos, a dor da mudança reduz em três a parada de dados de qualquer ação que o alvo realize. Depois, pela duração da maldição, as paradas de dados da vítima para todas as ações ficam reduzidas em um (cumulativo com penalidades por ferimento). Além disso, o alvo tem um atributo à escolha do conjurador — Força, Destreza, Vigor ou Aparência — reduzido a 1. A duração depende do número de sucessos rolados:
1 sucesso — Uma noite
2 sucessos — Uma semana
3 sucessos — Um mês
4 sucessos — Uma estação
5 sucessos — Um ano

••••• Acídia
Sistema: Os efeitos desta maldição exigem uma rolagem de Força de Vontade (dificuldade 8) para resistir. Se o alvo tiver falha crítica na rolagem e o conjurador tiver obtido ao menos três sucessos ao lançá-la, a maldição é permanente. Do contrário, a duração é a mesma de Corromper o Corpo.
Sob a influência de Acídia, a vítima não pode ter sucesso automático em nenhuma tarefa, e é tratada como tendo rolado uma falha crítica em cada ação. (Em outras palavras, anule um sucesso em cada rolagem; nenhum sucesso significa resultado de falha crítica.) Mesmo se tiver sucesso, o resultado efetivo máximo que ela consegue alcançar é dois sucessos, incluindo sucesso adicional de Força de Vontade ou de outras fontes.]==],
				},
				["Rego Calatio"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 111


Rego Calatio


• Demônio Menor (Atributos 4/3/2, Habilidades 3/2/1, Força de Vontade 3, Vitalidade 4)

•• Demônio da Loucura (Atributos 5/4/3, Habilidades 4/3/2, Força de Vontade 4, Vitalidade 6, Pontos de Sangue 5, dois pontos de Disciplinas, um dos quais precisa ser Dementação)

••• Demônio da Paixão (Atributos 6/5/4, Habilidades 5/4/3, Força de Vontade 6, Vitalidade 7, Pontos de Sangue 6, quatro pontos de Disciplinas, dois dos quais precisam ser Presença)

•••• Demônio Assassino (Atributos 7/6/5, Habilidades 6/5/4, Força de Vontade 7, Vitalidade 8, Pontos de Sangue 7, seis pontos de Disciplinas, três dos quais precisam ser Potência)

••••• Demônio Nomeado (Atributos 8/7/6, Habilidades 7/6/5, Força de Vontade 9, Vitalidade 10, Pontos de Sangue 10, oito pontos de Disciplinas, alocados onde o infernalista escolher, com máximo de seis pontos numa única Disciplina)
O número de sucessos rolados determina quanto controle o infernalista tem sobre o demônio invocado:
Falha — A invocação não ocorre. Pode ser tentada de novo com um novo sacrifício.
1 sucesso — O demônio fica preso ao círculo por uma noite e só dará ouvidos ao infernalista.
2 sucessos — O demônio fica preso ao círculo por uma noite e dará ouvidos a qualquer um em suas proximidades, respondendo a perguntas simples.
3 sucessos — O demônio fica obrigado a permanecer ao alcance da vista do infernalista por uma noite. Está bem-disposto e responderá com precisão a perguntas complicadas.
4 sucessos — O demônio fica obrigado a permanecer ao alcance da vista do infernalista por uma noite. É forçado a servir ao infernalista em tarefas simples.
5 sucessos — O demônio pode sair do campo de visão do infernalista e cumprir suas ordens sombrias. Submete-se de bom grado aos decretos do infernalista pela duração da noite.
6 ou mais sucessos — Um demônio de um grau acima do pretendido é invocado, e tratado como se tivesse sido invocado com 4 sucessos. O grau máximo é o Demônio Nomeado.]==],
				},
				["Sepulchre Path"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 160


Sepulchre Path


• Testemunha da Morte
Sistema: O jogador rola Percepção + Prontidão (dificuldade 5). O sucesso permite ao vampiro perceber fantasmas como descrito pelo resto da cena (no mundo mortal — ver fantasmas na terra dos mortos exige Visão do Sudário, na p. 163). A falha não tem efeito especial, mas uma falha crítica significa que o vampiro só consegue ver os mortos pela cena; todo o resto aparece como sombras disformes e opacas. Embora os demais sentidos do vampiro permaneçam sintonizados com os vivos, ele fica praticamente cego nesse estado e sofre +3 de dificuldade na maioria das rolagens de Percepção baseadas em visão e nos ataques. Fantasmas notam os olhos brilhantes de um vampiro usando este poder apenas com uma rolagem bem-sucedida de Percepção + Prontidão (dificuldade 7).

•• Invocar a Alma
Sistema: O jogador gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade igual a 7 ou à Força de Vontade do fantasma, o que for maior). O vampiro precisa saber o nome do fantasma e ter à mão um objeto com que o fantasma teve contato em vida. Desde que o alvo tenha morrido e se tornado fantasma, o sucesso significa que a sombra aparece diante do necromante como descrito acima. Nem todos viram fantasma — é preciso vontade forte para perseverar diante da morte, e almas que encontraram a paz seguem para suas recompensas eternas. Além disso, é possível que os mortos sofram dissolução e destruição espiritual depois de se tornarem fantasmas. O Narrador deve considerar todos esses fatores ao decidir se determinado fantasma existe para um vampiro invocar.
Vampiros sabem se sua invocação deveria ter tido sucesso por uma sensação de queda súbita e aterrorizante, ao alcançarem longe demais no grande Além, de modo que este poder pode ser usado para determinar se uma alma perdurou além da morte. Enquanto a falha significa que o vampiro desperdiça sangue, a falha crítica chama um espírito diferente do procurado — geralmente um fantasma malevolente conhecido como Espectro (ver p. 385). Tal demônio atormenta quem o invocou com todo poder perverso à sua disposição.
Uma vez invocado, o fantasma não pode deliberadamente sair do campo de visão do vampiro, embora possa realizar quaisquer outras ações, inclusive ataque direto. O jogador do vampiro pode gastar um ponto de Força de Vontade para dispensar o fantasma a qualquer momento (a menos que tenha rolado falha crítica). Do contrário, ao fim da cena, as sombras envolvem o espírito mais uma vez e o devolvem à sua localização original.

••• Compelir a Alma
Sistema: O vampiro localiza e se aproxima do fantasma pretendido ou o chama à sua presença com Invocar a Alma. Como no poder anterior, ele precisa ter o nome do fantasma e um objeto que ele manuseou em vida. Seu jogador então gasta um ponto de sangue e rola Manipulação + Ocultismo numa rolagem resistida contra a Força de Vontade do fantasma (dificuldade 6 para ambas as rolagens).
Se o vampiro vencer, o número de sucessos líquidos determina o grau de controle que ele tem sobre o fantasma (como descrito abaixo). Além disso, o controle do vampiro impede que fantasmas chamados com Invocar a Alma retornem às suas localizações originais ao fim da cena. Se o fantasma vencer, o vampiro perde um número de pontos de Força de Vontade igual aos sucessos líquidos do fantasma. Num empate, a rolagem se torna uma disputa prolongada que continua a cada turno até um dos lados vencer. Se o vampiro tiver falha crítica em qualquer ponto, o fantasma fica imune a qualquer uso da Necromancia do vampiro pelo resto da cena. Se o fantasma tiver falha crítica, ele precisa obedecer como se o jogador do vampiro tivesse rolado cinco sucessos líquidos.
1 sucesso — O fantasma precisa realizar uma tarefa simples para o vampiro que não o coloque em perigo certo. Precisa cuidar dessa tarefa imediatamente, embora possa adiar a compulsão e seguir seus próprios assuntos ao custo de um ponto de Força de Vontade por cena. O fantasma não pode atacar o vampiro até que essa tarefa esteja concluída. É possível dar como tarefa responder a uma pergunta, caso em que o fantasma precisa responder com verdade e da melhor forma que souber.
2 sucessos — O vampiro pode dar duas ordens ou fazer duas perguntas, conforme descrito para um sucesso. Alternativamente, o vampiro pode exigir uma tarefa simples com possibilidade real de perigo, desde que o perigo não seja certo. O fantasma pode adiar essa compulsão com Força de Vontade.
3 sucessos — O vampiro pode dar três ordens, conforme descrito para um sucesso. Alternativamente, pode exigir que o fantasma cumpra uma tarefa difícil e perigosa ou uma incumbência simples com duração prolongada de até um mês. O fantasma pode adiar tais ordens com Força de Vontade.
4 sucessos — O vampiro pode dar quatro ordens, conforme descrito para um sucesso, ou atribuir duas tarefas, como para dois sucessos. Alternativamente, o vampiro pode ordenar ao fantasma que realize uma incumbência complexa que o coloque em risco extremo, ou que realize qualquer número de tarefas não ameaçadoras como escravo do vampiro por até um mês (ou, se o necromante gastar um ponto permanente de Força de Vontade, por um ano e um dia). É possível que fantasmas adiem tarefas individuais, mas não que adiem a escravização.
5 ou mais sucessos — O vampiro pode dar múltiplas ordens cuja complexidade ou perigo somados equivalham a cinco sucessos. Em vez disso, o vampiro pode ordenar ao fantasma que realize qualquer ação que ele seja capaz de executar dentro de um mês. Tal tarefa pode colocar o fantasma em perigo imediato de destruição, ou até forçá-lo a trair e agredir entes queridos. Não é possível que fantasmas adiem uma tarefa dessa magnitude com Força de Vontade — precisam obedecer.

•••• Assombração
Sistema: A jogadora gasta um ponto de sangue enquanto está no local da assombração ou tocando a prisão pretendida. Ela então faz com que o fantasma seja trazido até si por quaisquer meios que deseje, embora Invocar a Alma seja o mais rápido e confiável. Sua jogadora então rola Manipulação + Ocultismo (a dificuldade é igual aos pontos atuais de Força de Vontade do alvo, se houver resistência, com mínimo de 4; do contrário, é 4). A dificuldade sobe em um se a vampira quiser colocar o fantasma num objeto. Como de costume, a dificuldade diminui em um se a necromante tiver uma parte do cadáver do espírito além de saber seu nome (dificuldade mínima 3).
Cada sucesso prende o fantasma dentro do local ou objeto por uma noite. Essa duração se estende para uma semana se a jogadora gastar um ponto de Força de Vontade, ou para um ano e um dia por um ponto permanente de Força de Vontade. Um espectro que tente deixar a área de uma assombração precisa fazer uma rolagem prolongada de Força de Vontade (dificuldade 9, quatro sucessos cumulativos necessários numa única cena) ou sofrer um nível de dano agravado por rolagem. Se o espectro ficar sem níveis de vitalidade, é arremessado às profundezas do Submundo para enfrentar a destruição.

••••• Tormento
Sistema: O jogador rola Vigor + Empatia (dificuldade igual aos pontos atuais de Força de Vontade do espectro), e o vampiro estende a mão para golpear o espectro. Cada sucesso inflige um nível de dano letal ao espectro. Se o espectro perder todos os níveis de vitalidade, ele desaparece imediatamente pelo que parece ser uma porta para algum reino de pesadelo horrendo. Fantasmas "destruídos" assim não podem reaparecer no mundo real ou perto dele por um mês.]==],
				},
				["The Bialowieza Kraina"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 46


The Bialowieza Kraina


• Brecha no Domínio
Sistema: O koldun gasta ao menos um ponto de sangue dentro da área que deseja afetar com esta Disciplina, e o jogador rola para ativar este poder (Atributo: Percepção). Um quilômetro quadrado ao redor do koldun é afetado para cada ponto de sangue gasto. Pelo resto da noite, o koldun sente se quaisquer visitantes entram ou saem da área determinada.
Se este poder for ativado dentro da Floresta de Białowieza, nenhum gasto inicial de sangue é exigido. Este poder não pode ser usado num ambiente predominantemente urbano.

•• Dedos de Bialowieza
Sistema: O koldun gasta sangue, garantindo que ele toque a planta que deseja afetar, e rola para ativar este poder (Atributo: Destreza). A planta tentará enlaçar qualquer um que passe a até dois metros de seu alcance, permanecendo pronta para agarrar dessa forma por uma noite por ponto de sangue gasto. Para fins de agarrão, a planta rola seis dados. Ela inflige um nível de dano contundente a cada turno após um agarrão bem-sucedido. A planta ganha um dado adicional para agarrar a cada turno subsequente, até o máximo de dez dados. Plantas pequenas possuem dois níveis de vitalidade para fins de destruição, com galhos de árvore chegando a seis, dependendo do tamanho. Elas têm um ponto de Vigor para cada nível de vitalidade e podem absorver dano contundente.
Se este poder for ativado dentro da Floresta de Białowieza, o dano contundente das plantas e seus níveis de vitalidade são dobrados em relação aos números iniciais, com o Vigor aumentando como subproduto do aumento de vitalidade.

••• O Impasse de Grondrska
Sistema: A koldun gasta ao menos um ponto de sangue dentro da área que deseja afetar, e a jogadora rola para ativar este poder (Atributo: Percepção). Um quilômetro quadrado ao redor da koldun é afetado para cada ponto de sangue gasto. Pelo resto da noite, quaisquer visitantes detectados com Brecha no Domínio sofrem dificuldade aumentada em três nas tentativas de rastrear, escapar e se orientar dentro da área, enquanto a vegetação rasteira se desloca e se ergue ao redor do intruso. Se o visitante falhar em sua rolagem, a koldun pode escolher se o move para mais perto, para mais longe ou na direção de uma armadilha bem posicionada.
Se este poder for ativado dentro da Floresta de Białowieza, a vegetação rasteira suga dois pontos da Percepção do visitante, devolvidos se ele deixar a área. A koldun pode escolher que isso não afete certos visitantes que dispararam o poder de Brecha no Domínio.

•••• A Boca de Djabelek
Sistema: A koldun derrama ao menos um ponto de sangue na área de terra que deseja afetar, e gasta um ponto de Força de Vontade além de fazer a rolagem para ativar este poder (Atributo: Força). Caso qualquer ser pise a até dez metros de onde o poder foi ativado, abre-se um fosso de dois metros de diâmetro e três metros de profundidade. Cada ponto de sangue gasto deixa a vítima presa e imóvel por um turno. Para se libertar, é preciso uma rolagem bem-sucedida baseada em Força por parte da vítima (dificuldade 8), e são exigidos cinco sucessos num teste prolongado. Seres presos no fosso sofrem dois níveis de dano letal a cada turno, que podem ser absorvidos (dificuldade 7).
Se este poder for ativado dentro da Floresta de Białowieza, a duração dele é dobrada. A koldun pode escolher que isso não afete certos visitantes.

••••• A Torre Branca
Sistema: A koldun espalha um ponto de sangue no solo; a jogadora gasta um ponto de Força de Vontade e faz a rolagem para ativar este poder (Atributo: Vigor). A Torre Branca faz efeito imediatamente, com a terra se movendo e ossos irregulares e blocos de terra formando uma parede circular aparentemente orgânica ao redor da koldun, com cinco metros de altura. Para cada sucesso na ativação, mais um andar de cinco metros de altura é construído acima do inicial, um andar por turno. A Torre Branca se estende sob a terra tanto quanto se estende acima dela, e não tem entrada nem saída, a menos que a koldun assim queira. Quaisquer bens deixados dentro na última vez em que a Disciplina foi ativada permanecem na torre. A Torre Branca é altamente resistente a forças externas, possuindo 20 níveis de vitalidade e invulnerabilidade a tudo exceto dano agravado.
A Torre Branca pode se dobrar de volta à terra levando a koldun junto, ao custo de mais um ponto de sangue e um único ponto de Força de Vontade. Nesse ponto, a vampira fica efetivamente sepultada cinco metros abaixo da terra no local onde a Torre Branca estava.
Ao custo de um ponto de sangue e um ponto de Força de Vontade adicionais, junto com a rolagem para ativar o poder (Atributo: Vigor), a Torre Branca emerge em qualquer ponto num raio de 20 quilômetros da localização anterior, desde que a área seja florestada. O tamanho dessa nova Torre Branca é estabelecido da mesma maneira que na rolagem inicial.
A Torre Branca não se desmonta se a koldun quiser que uma saída apareça e deixar a construção. Se qualquer Cainita cair em torpor dentro da Torre Branca, ou um mortal adormecer lá dentro, ela os consome e acrescenta os ossos do vampiro aos outros que revestem as paredes e os pisos.
Se este poder for ativado dentro da Floresta de Białowieza, ele possui o dobro dos níveis de vitalidade.]==],
				},
				["The Black Sea Kraina"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 277


The Black Sea Kraina


• Vozes Danubianas
Sistema: O koldun pinga o sangue exigido num rio, riacho ou outro curso d'água corrente. Até a água do degelo da neve ou de uma chuva forte basta para usar este poder. Se for o próprio Danúbio, ou um de seus afluentes, nenhum gasto inicial de sangue é necessário. Eles então fazem a rolagem de ativação (Atributo: Carisma); se tiverem sucesso, um espírito da água lhes aparece e os servirá (na medida do possível) por um número de dias igual aos sucessos rolados. Essa duração pode ser estendida a qualquer momento antes de expirar borrifando mais sangue na água; um ponto de sangue estende a servidão do espírito por mais um dia.
O que o espírito pode fazer é bastante limitado; ele pode conversar com o koldun, compartilhando o que sabe, ou pode receber uma mensagem para levar a alguém ou a outro lugar. O espírito ficará mais que feliz em falar do que sabe; espíritos de rio podem ser bem tagarelas, e aconselha-se ao Tzimisce ajudar a conduzir o espírito aos tópicos que mais lhe interessam, sob pena de ser entretido por horas com descrições prosaicas do campo ao redor. O espírito só é capaz de se mover para cima e para baixo em seu curso d'água (e rio acima é bem mais lento que rio abaixo), de modo que o destinatário da mensagem precisa ser alguém que ele possa encontrar em sua jornada. Outro método envolve instruir o espírito a ir a um lugar ao longo de seu caminho e entregar a mensagem à primeira pessoa que encontrar, embora isso obviamente tenha seus inconvenientes também. Um koldun também pode suplicar a um espírito da água que permaneça num lugar e vigie contra invasores ou outras ameaças, e então se mova rapidamente pelo leito do rio para adverti-la do perigo, caso algum se apresente.

•• Sepultura do Marea Neagra
Sistema: A koldun pode sempre descer em segurança às profundezas mais baixas do Mar Negro, onde pode repousar confortavelmente, protegida do sol e do mundo exterior. Ao borrifar seu sangue num corpo d'água grande o bastante para conter sua massa e fazer sua rolagem de ativação (Atributo: Raciocínio), ela imbui aquela água com todas as propriedades protetoras do Mar Negro. Ela não pode ser ferida pela luz do sol, seu corpo fica perfeitamente preservado enquanto ela permanecer ali sepultada, e ela se torna extremamente difícil de detectar. Para avistar a koldun, um personagem precisa rolar Percepção + Prontidão (dificuldade 8) e obter mais sucessos que a koldun rolou em sua ativação. Quem enfrentar a Tzimisce submersa sofre dois níveis de dano letal a cada turno em que permanecer na água gelada.

••• Pontos Euxeinos
Sistema: A koldun precisa ter acesso a um corpo d'água grande o bastante para se submergir. Uma vez submersa na água acolhedora, ela libera nela o sangue exigido (embora, se for de fato o Mar Negro, nenhum gasto de ponto de sangue seja necessário), e então faz sua rolagem de ativação (Atributo: Vigor). Cada sucesso pode ser alocado à cura exatamente como se fosse um ponto de sangue (um sucesso cura um nível de dano contundente ou letal, enquanto cinco sucessos curam um nível de dano agravado). Isso não reduz a limitação de tempo sobre a cura; para curar dano agravado, a koldun precisa permanecer submersa e em repouso por um dia por nível curado.

•••• Servos da Marmara Profunda
Sistema: O koldun borrifa seu sangue sobre a superfície da água — ao menos um ponto de sangue, mas quantos ele escolher gastar — e então faz a rolagem de ativação (Atributo: Manipulação). Para cada sucesso, até o total de pontos de sangue gastos, um servo emerge da água. Os Servos da Marmara Profunda são criaturas humanoides estranhas, combinando traços de rã e peixe. Eles realizarão uma tarefa para o koldun, após a qual estão livres para retornar a suas moradas aquáticas. A cada servo pode ser dada uma tarefa diferente. Servos usam os seguintes valores (os valores entre parênteses são para os servos invocados do próprio Mar Negro):
Atributos: Força 4 (5), Destreza 3, Vigor 4 (5), Carisma 1, Manipulação 1, Aparência 0, Percepção 3, Inteligência 1 (2), Raciocínio 2 (3)
Força de Vontade: 3
Níveis de Vitalidade: Ok, Ok, -1, -1, (-1), -2, -2, -2, -5, (-5), Incapacitado
Habilidades: Esportes 2, Briga 4, Intimidação 3, Sobrevivência 3
Ataque: Garras (Força + 2, letal), Agarrão (Força + 4, contundente); escamas e carne gordurosa dão +2 dados nas rolagens de absorção.
Capacidades: Servos de Marmara podem respirar ar ou água igualmente bem. São nadadores exímios, movendo-se com a mesma facilidade dentro e fora d'água.

••••• Pontos Axeinos
Sistema: O koldun pinga seu sangue num corpo d'água (a menos que seja o Mar Negro, caso em que nenhum sangue precisa ser gasto) e faz a rolagem de ativação (Atributo: Inteligência). Ela pode alocar seus sucessos para manifestar qualquer número de perigos aquáticos para seus oponentes enfrentarem; alguns exemplos do que cada sucesso pode realizar: um redemoinho ou correnteza de fundo com Força igual à Força da koldun, que pode agarrar ou arrastar os outros; aumentar em um o multiplicador de Força da correnteza; revelar rochas pontiagudas que causam Força + 3 de dano letal quando alguém se choca contra elas; névoa que aumenta em 2 todas as dificuldades de Percepção baseadas na visão; ventos e chuva fortes com rajadas de até 75 km por hora; uma queda abrupta da temperatura da água a níveis quase de congelamento, e assim por diante. Este poder dura uma cena e então se dissipa.]==],
				},
				["The Blessings of the Great Dark Mother"] = {
					pt = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, pág. 86


The Blessings of the Great Dark Mother


• Canção de Ninar
Sistema: A ashipu canta sua canção de ninar, gasta um ponto de sangue e rola Percepção + Ocultismo (dificuldade igual à maior Força de Vontade atual entre os indivíduos do grupo, ou à Força de Vontade atual do indivíduo se estiver tentando afetar um alvo único). Se tiver sucesso, a canção faz com que todo e qualquer pacto infernal, pacto espiritual e laço voluntário ou involuntário de qualquer tipo (inclusive o laço de sangue) se torne "visível" de alguma forma para a conjuradora.

•• Kessep
Sistema: A ashipu invoca a dádiva da serpente argêntea, gastando um ponto de sangue e rolando Manipulação + Ocultismo, com dificuldade igual à Força de Vontade atual do alvo. Se tiver sucesso, a invocação faz com que um único laço selecionado entre o alvo e um espírito escravizado ou demônio preso seja rompido. Isso, é claro, libera o espírito ou demônio antes preso para fugir, se vingar ou impor quaisquer consequências do cativeiro que prefira sobre seu antigo dono.

••• Sotheq
Sistema: A ashipu invoca a dádiva da coruja crepuscular, gastando um ponto de sangue e rolando Manipulação + Ocultismo, com dificuldade igual à Força de Vontade atual do alvo. Se tiver sucesso, a invocação faz cair um silêncio psíquico ou espiritual sobre todos os laços e pactos em que o alvo esteja envolvido — ele não pode mais dar ordens a seus espíritos presos ou demônios servos, nem pode receber comunicação ou ordens de qualquer espírito ou demônio que o tenha em servidão. Sucesso excepcional (quatro sucessos ou mais) estende este efeito ao Cainita do outro lado de qualquer laço de sangue em que o alvo esteja envolvido.

•••• Allah
Sistema: A ashipu invoca a dádiva do gato de sombra noturna, gastando um ponto de sangue e rolando Manipulação + Ocultismo, com dificuldade igual à Força de Vontade atual do alvo, para cada espírito ou demônio que o alvo mantenha escravizado como servo. O sucesso liberta o espírito ou demônio preso para fazer o que quiser. A falha não apenas deixa de libertar o espírito ou demônio, como também permite que essas entidades saibam precisamente quem tentou romper aqueles vínculos.

••••• Memo
Sistema: A ashipu invoca a dádiva da grande serpente do oceano, gastando um ponto de sangue e rolando Percepção + Ocultismo, com dificuldade igual à Força de Vontade atual do alvo. Ao fazê-lo, ela obtém o conhecimento do que levou o alvo a firmar uma barganha em que sua alma seria perdida. Cada sucesso rolado rende conhecimento mais detalhado sobre seu alvo, sobre a natureza e as forças do pacto e sobre quaisquer investiduras ou dádivas infernais que o alvo possua. Sucesso espetacular rende o Nome Verdadeiro do patrono demoníaco do alvo e a oportunidade de enfrentá-lo diretamente numa rolagem disputada de Manipulação + Ocultismo (dificuldade igual à Força de Vontade permanente dele). O sucesso por parte da ashipu rompe o laço entre o infernalista e seu patrono; o sucesso por parte do patrono permite que o laço permaneça intacto. A falha de qualquer rolagem nesta sequência permite ao patrono do infernalista perceber a ashipu e obter informação substancial sobre ela por meio do contato.]==],
				},
				["The Covenant of Enki"] = {
					pt = [==[Rites of Blood, pág. 160


The Covenant of Enki


Muitas das trilhas associadas ao Dur-An-Ki são funcionalmente idênticas a várias trilhas de Taumaturgia. Em muitos casos, a versão Dur-An-Ki veio primeiro e foi adaptada à Taumaturgia pelos Tremere.
O Pacto de Enki é uma dessas trilhas: é funcionalmente idêntica ao Poder de Netuno (V20, pp. 218-220).]==],
				},
				["The Fires of the Inferno"] = {
					pt = [==[Rites of Blood, pág. 167


The Fires of the Inferno


• Isqueiro (dificuldade 3 para absorver, um nível de vitalidade de dano por turno)

•• Boca de fogão (dificuldade 4 para absorver, dois níveis de vitalidade de dano por turno)

••• Maçarico (dificuldade 5 para absorver, três níveis de vitalidade de dano por turno)

•••• Lança-chamas (dificuldade 7 para absorver, quatro níveis de vitalidade de dano por turno)

••••• Conflagração (dificuldade 9 para absorver, cinco níveis de vitalidade de dano por turno)]==],
				},
				["The Flow of Ashe"] = {
					pt = [==[Rites of Blood, pág. 165


The Flow of Ashe


• Toque da Vida
O wangateur pode ingerir uma mistura especial de ervas e pós em vez de gastar sangue ao tentar imitar as características dos vivos. O efeito dura uma cena. O wangateur pode ingerir esta mistura para si mesmo ou fornecê-la a outro Membro (mas não a um mortal), que precisa engolir a mistura durante aquela cena. Neste último caso, o wangateur decide que aspecto dos vivos o outro Membro imitará.

•• Força da Raiz e da Pedra
O wangateur pode inalar pelo nariz uma mistura de ervas e pós em vez de gastar sangue ao tentar aumentar um Atributo Físico. O efeito é o mesmo que se o vampiro tivesse gasto um ponto de sangue para melhorar um Atributo Físico. O efeito dura uma cena. O wangateur pode usar esta mistura ele mesmo ou fornecê-la a outro (inclusive a um mortal). Se for para ser usada por outro, o wangateur decide qual Atributo será aumentado quando a mistura é preparada.

••• Sopro da Vida
A wangateur pode usar uma mistura de ervas e pós no lugar do sangue ao tentar se curar. A mistura específica produz uma pasta que a wangateur precisa esfregar fisicamente na área a ser curada. O efeito é o mesmo que se o vampiro tivesse gasto um ponto de sangue para reparar dano físico. Este poder não pode ser usado para curar dano agravado, apenas contundente ou letal. A wangateur pode usar esta mistura para si mesma ou para outro (inclusive um mortal).

•••• Favor dos Orixás
A wangateur pode usar uma mistura de ervas e pós para alimentar qualquer Disciplina (inclusive magia de sangue) que exija exatamente um ponto de sangue para funcionar. Esta fórmula também exige uma pequena quantidade de sangue para funcionar, mas ele não precisa vir da wangateur e, de fato, pode vir de um inimigo (humano ou Membro) que tenha derramado sangue por perto. A wangateur só pode usar esta mistura em si mesma e precisa fazer um corte superficial no braço e então esfregar a mistura na ferida aberta.

••••• Dádiva do Ashe
O wangateur pode agora criar misturas usando os três primeiros níveis desta trilha que manterão sua eficácia por uma noite inteira, em vez de apenas um turno ou uma cena. Além disso, o wangateur pode manter simultaneamente um número de misturas até sua Inteligência. Assim, ele pode fornecer as misturas a aliados e não precisa mais estar por perto para conceder os benefícios apropriados — pode simplesmente dar a mistura a uma aliada e mandá-la seguir seu caminho.]==],
				},
				["The Green Path"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 215


The Green Path


• Sabedoria das Ervas
Sistema: O número de sucessos rolados determina a quantidade de informação que se pode obter do contato. Dependendo da informação precisa que o vampiro busca, o Narrador pode exigir que o jogador role Inteligência + Ocultismo para interpretar os resultados da comunicação.
1 sucesso — Impressões crípticas fugazes
2 sucessos — Uma ou duas imagens claras
3 sucessos — Uma resposta concisa a uma pergunta simples
4 sucessos — Uma resposta detalhada a uma ou mais perguntas complexas
5 sucessos — A totalidade do conhecimento do espírito-planta sobre determinado assunto

•• Acelerar a Passagem das Estações
Sistema: O personagem toca a planta alvo. O jogador rola normalmente, e o número de sucessos determina a quantidade de crescimento ou decomposição. Um sucesso dá à planta um breve surto de crescimento ou simula os efeitos de tempo severo, enquanto três a aumentam ou murcham perceptivelmente. Com cinco sucessos, uma planta adulta brota de uma semente ou se desfaz em pó em poucos minutos, e uma árvore dá frutos ou começa a apodrecer quase instantaneamente. Se este poder for usado em combate, três sucessos são necessários para tornar uma arma de madeira completamente inútil. Dois sucessos bastam para enfraquecê-la, enquanto cinco fazem com que ela se desintegre na mão de quem a empunha.

••• Dança das Trepadeiras
Sistema: Qualquer quantidade total de vegetação com massa menor ou igual à do personagem pode ser animada por este poder. As plantas permanecem ativas por um turno por sucesso obtido na rolagem, e ficam sob controle completo do personagem. Se usadas para fins de combate, as plantas têm Força e Destreza iguais, cada uma, à metade da Força de Vontade do personagem (arredondada para baixo) e Briga um ponto abaixo da do personagem.
Dança das Trepadeiras não pode fazer plantas se desenraizarem e sair pisoteando por aí. Mesmo a vegetação mais enérgica é incapaz de se arrancar do solo e caminhar sob o efeito deste poder. Contudo, 100 quilogramas de kudzu conseguem cobrir uma área considerável sozinhos….

•••• Refúgio Verdejante
Sistema: O personagem precisa estar de pé numa área densamente vegetada para usar este poder. O Refúgio Verdejante brota ao redor do personagem ao longo de três turnos. Uma vez estabelecido o refúgio, quem quiser entrar nele sem a permissão do conjurador precisa obter mais que o número original de sucessos do conjurador numa única rolagem de Raciocínio + Sobrevivência (dificuldade igual à Força de Vontade do conjurador). O refúgio dura até o próximo pôr do sol, ou até que o conjurador o dissipe ou o deixe. Se o conjurador obtiver quatro ou mais sucessos, o refúgio é impenetrável à luz do sol, a menos que seja rompido fisicamente.

••••• Despertar os Gigantes da Floresta
Sistema: O personagem toca a árvore a ser animada. O jogador gasta um ponto de sangue e rola normalmente. Se a rolagem tiver sucesso, o jogador precisa gastar um ponto de sangue para cada sucesso. A árvore permanece animada por um turno por sucesso rolado; quando esse tempo se esgota, a árvore lança raízes onde quer que esteja e não pode ser animada de novo até a noite seguinte. Enquanto animada, a árvore segue as ordens verbais do personagem da melhor forma que consegue. Uma árvore animada tem Força e Vigor iguais ao nível de Taumaturgia do conjurador, Destreza 2 e Briga igual à do próprio conjurador. Ela é imune a dano contundente, e todas as paradas de dano letal são reduzidas à metade devido ao seu tamanho.
Uma vez que a energia animadora deixa a árvore, ela lança raízes imediatamente, independentemente do que esteja sob ela no momento. Uma árvore se restabelecendo no solo pode furar concreto e asfalto para achar terra e água nutritivas embaixo, o que significa que é inteiramente possível um plátano se enraizar no meio de uma estrada sem aviso algum.]==],
				},
				["The Hand of the Magi"] = {
					pt = [==[Rites of Blood, pág. 160


The Hand of the Magi


Muitas das trilhas associadas ao Dur-An-Ki são funcionalmente idênticas a várias trilhas de Taumaturgia. Em muitos casos, a versão Dur-An-Ki veio primeiro e foi adaptada à Taumaturgia pelos Tremere.
The Hand of the Magi é uma dessas trilhas: é funcionalmente idêntica ao Chamado das Chamas (V20, p. 218).]==],
				},
				["The Hunter’s Winds"] = {
					pt = [==[Rites of Blood, pág. 159


The Hunter’s Winds


• Odor do Engano
Sistema: Uma rolagem bem-sucedida significa que o alvo ou não deixa odor algum que possa ser detectado ou rastreado, ou deixa o odor de outra pessoa que ela conheça. A falha significa que nada acontece. Uma falha crítica significa que o odor dela fica mais facilmente identificável para os outros (além das outras penalidades por falha crítica numa rolagem de magia de sangue).

•• Pele de Camaleão
Sistema: Pela duração da cena seguinte à cena de ativação, a dificuldade de todas as rolagens de Percepção para detectar o alvo aumenta em +4 enquanto ele permanecer parado. Enquanto estiver em movimento, o efeito é anulado, mas assim que ele voltar a parar junto a uma superfície diferente, pode reafirmar a camuflagem com uma rolagem bem-sucedida de Percepção + Furtividade (dificuldade 6, ou 9 se alguém estiver ativamente procurando por ele no momento). Quaisquer mudanças de textura são ilusórias; o alvo não ganha a resistência de um muro de tijolos só por ficar perto dele.

••• Pose Discreta
Sistema: Se a rolagem tiver sucesso, qualquer observador assumirá automaticamente que o alvo pertence ao local em que for encontrado. Os que o procuram são incapazes de perceber que ele é um intruso. Contudo, este efeito não engana a tecnologia, e qualquer um que observe por circuito interno de TV, por exemplo, pode identificá-lo como intruso.

•••• Sopro de Kalif
Sistema: Se o efeito for ativado com sucesso, qualquer um que observe o alvo durante o resto da cena precisa rolar reflexivamente Raciocínio + Prontidão (dificuldade 7) ou ficar inebriado por um número de horas igual aos sucessos do ashipu ao disparar o efeito. Indivíduos afetados são incapazes de realizar qualquer ação além de encarar com o olhar perdido visões que só eles veem, ou talvez rir baixinho de vez em quando. Contudo, qualquer ameaça direta a um indivíduo afetado faz a embriaguez se dissipar imediatamente.

••••• Corpo Fantasma
Sistema: Se ativado com sucesso, o alvo se torna imaterial em quase todos os sentidos. O efeito não a transforma num fantasma de verdade, e ela é incapaz de interagir com espectros ou espíritos nessa forma. Ela também é incapaz de usar quaisquer Disciplinas nessa forma. O efeito termina assim que o alvo tomar a decisão consciente de afetar o mundo físico de qualquer maneira.]==],
				},
				["The Keeper’s Way"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 42


The Keeper’s Way


• Sentir as Ondulações
Assamitas que aprendem esta trilha aprendem primeiro a escutar e ler as maiores ondulações do Grande Poço, que indicam eventos dramáticos: a morte ou torpor de um Ancião ou do Ancião-Mor, uma traição planejada, ou coisa pior. Embora eventos dramáticos possam ser vistos conforme ocorrem, é só com conhecimento superior que um praticante consegue saber em detalhe o que aconteceu. A cada sucesso, ela pode fazer uma pergunta esclarecedora relacionada ao assunto que possa ser respondida com sim ou não. Perguntas paradoxais não podem ser respondidas.

•• A Dádiva de Haqim
Com estudo maior, o praticante consegue esticar o sangue tirado do Grande Poço. Ele precisa beber ao menos um ponto de sangue do poço. Seu corpo é preenchido pelo poço, independentemente de quão longe esteja do poço de fato. Ele ganha pontos de sangue iguais ao número de sucessos, que chegam a uma taxa de um por hora até serem plenamente concedidos.

••• O Carmesim Distante
Com este feitiço, a praticante pode observar os arredores físicos de quaisquer Assamitas num raio de cem quilômetros. Ela pode ver pelos olhos dos Assamitas presentes no local, e consegue dizer seus estados emocionais gerais, se têm sangue suficiente para atravessar a semana e se estiveram em combate na última noite. Com sucessos adicionais, ela pode filtrar suas percepções com base num traço adicional formalmente reconhecido, como casta ou idade.

•••• Conhecer o Destino de Um
Ao examinar com mais clareza as agitações mínimas do poço, a praticante consegue sentir uma mudança dramática no destino de um vampiro. Ela pode fazer perguntas que possam ser respondidas com sim ou não, em número igual aos sucessos de sua rolagem. Este feitiço é frequentemente realizado para discernir a verdadeira depravação de vampiros especialmente poderosos. Quando os guerreiros acreditam que precisam infligir a Morte Final a um Príncipe, eles primeiro perguntam aos Guardiões.

••••• Lançar-se ao Poço de Sangue
Este feitiço precisa sempre ser conjurado por quatro feiticeiros. Ao se esvaziarem de pontos de sangue com as mãos no poço, os praticantes conseguem sentir o sangue de todos os membros do clã fluindo por eles, e podem impactar o destino imediato do Clã Assamita. A Geração de todos os participantes aumenta em um, pois eles sacrificam a potência de seu sangue para influenciar o destino do clã. Embora não possam controlar o tempo nem impactar as coisas diretamente, pelo poder deste ritual podem impactar dramaticamente o resultado de uma série de eventos. Na prática, eles escolhem um objetivo a alcançar, que precisa ser acordado por todos os membros conjuradores. Para cada sucesso, escolha um dos seguintes:
• Indivíduos ganham –1 de dificuldade em ações pertinentes (até a dificuldade mínima 3).
• Indivíduos ganham +1 dado em ações pertinentes (até o máximo de +5 dados).
• Os que obstruem o objetivo ganham +1 de dificuldade (até a dificuldade máxima 9).
• Os que obstruem o objetivo perdem 1 dado (até a parada mínima de 1 dado).
Por exemplo: se o objetivo é impedir que um exército invada Alamut, todos os guerreiros receberiam bônus em suas rolagens feitas para defender a cidade, e todos os feiticeiros ganhariam bônus em rituais em defesa do coletivo, enquanto os inimigos sofreriam penalidades para atacar os Assamitas ali dentro.]==],
				},
				["The Kraina of Enoch"] = {
					pt = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, pág. 169


The Kraina of Enoch


• Sudário do Esquecimento
Sistema: O koldun gasta um ponto de Força de Vontade e então faz a rolagem de ativação (Atributo: Vigor). Com um sucesso, a pele do koldun vira cinza e se esfarela até sumir, expondo sua carne aos elementos. Ele mergulha as mãos na terra, afastando qualquer impedimento como se fosse solo recém-arado, e arranca dali uma lâmina insubstancial de noite tinta, puxando um pedaço do Submundo com o qual se envolver. Uma vez vestido, a aparência de tudo o que o sudário cobre fica visivelmente esmaecida; no mundo físico, tudo sob seu escudo se assemelha a imagens de televisão em preto e branco num mundo colorido, enquanto no Submundo as coisas assumem um tom mais medonho de escuridão e decomposição mais profundas.
O Sudário do Esquecimento se centra no koldun e o acompanha. O poder tem raio de dois metros por sucesso obtido na rolagem de ativação, e duração (em turnos) igual aos sucessos. Todos dentro do raio se beneficiam dos efeitos do sudário. Os efeitos deste poder diferem conforme a terra em que o koldun se encontra no momento (ver o quadro "Vampiros no Submundo" na p. 119): enquanto no mundo mortal, o dano da luz do sol se reduz a contundente. Se em qualquer parte do Submundo, o sol tênue não causa dano algum.
Quando a duração do poder expira, o koldun sangra, perdendo um ponto de sangue a cada turno até gastar um ponto de sangue para rejuvenescer sua pele (a menos que esteja no Submundo, caso em que nenhum sangue é perdido). Penalidades sofridas para ativar este poder são contabilizadas depois que a duração termina. Curar-se antes desse momento suspende os efeitos do poder.

•• Manto Espectral
Sistema: A koldun arranca os próprios olhos, esmaga-os nas mãos e estende as palmas ao céu, então faz a rolagem de ativação (Atributo: Percepção). Com um sucesso, a polpa vira pó e alça voo num uivo sinistro de vento que jorra de uma escuridão insondável dentro de suas órbitas vazias. Sombras extraídas dos arredores envolvem a koldun, que desaparece, tornando-se invisível à visão comum (para os que têm Auspícios, ver o quadro "Seeing the Unseen" na p. 142 de V20, usando o nível da koldun nesta kraina). Embora a koldun enxergue normalmente dentro do raio de efeito do poder, ela fica cega para tudo fora dessa área. Os demais dentro do raio precisam ter sucesso numa rolagem de Força de Vontade (dificuldade igual ao nível da koldun na kraina mais os sucessos obtidos na rolagem de ativação, máximo 9), ou são afligidos pelo Defeito Visão da Morte (V20, p. 494) e tentam fugir apavorados por um número de turnos igual aos sucessos obtidos na rolagem de ativação.
O raio do poder se centra na koldun e a acompanha, permitindo que ela se mova e aja sobre os outros, mesmo violentamente, sem ser revelada. O Manto Espectral tem raio de três metros por sucesso obtido na rolagem de ativação e duração (em turnos) igual aos sucessos. Quando a duração do poder expira, a koldun fica abandonada à cegueira até gastar um ponto de sangue para se curar (a menos que esteja no Submundo, onde a koldun pode continuar a enxergar indefinidamente, apesar da perda dos olhos). Penalidades sofridas para ativar este poder são contabilizadas depois que a duração termina. Curar-se antes desse momento suspende os efeitos do poder.

••• Lago do Pavor Malévolo
Sistema: O koldun passa um turno se estripando, enfiando as mãos fundo no abdome para expelir as entranhas no chão, então faz a rolagem de ativação (Atributo: Vigor). Com um sucesso, suas vísceras perfuram a terra atravessando qualquer obstrução em seu caminho, e então cruzam o limiar que separa as terras vibrantes dos vivos das terras ressecadas dos mortos. Suas entranhas tocam as próprias profundezas da camada mais funda do Submundo, criando raízes no Mar das Sombras. O vampiro drena a essência dele para dentro de si e a descarrega para fora em ondas pulsantes de desespero que borbulham pela terra e o cercam num lago líquido de espectros fervilhantes e contorcidos. Braços fantasmagóricos se estendem para agarrar e devorar os que caminham pelo raio do círculo. O lago ondulante se centra sob o koldun, que permanece travado no lugar da cintura para baixo até o poder terminar.
O poder tem raio de cinco metros por sucesso obtido na rolagem de ativação e duração (em turnos) igual aos sucessos. Todos dentro do raio têm sua velocidade reduzida a ¼ e precisam ter sucesso numa rolagem de Força de Vontade a cada turno (dificuldade igual ao nível do koldun na kraina mais os sucessos obtidos na rolagem de ativação, máximo 9) ou perdem 1 ponto de Força de Vontade permanente.
Quando a duração do poder expira, o koldun secciona as vísceras enterradas na terra e sofre dois níveis de dano letal inabsorvível. Este dano não pode ser curado por nenhum outro meio que não gastar sangue. Além disso, o koldun perde uma quantidade de pontos de sangue igual à metade dos sucessos obtidos na rolagem de ativação, arredondada para cima (a menos que esteja no Submundo, caso em que nenhum sangue é perdido). Ferimentos sofridos para ativar este poder são contabilizados depois que a duração termina. Curar-se antes desse momento suspende os efeitos do poder.

•••• Ira da Tempestade
Sistema: A koldun gasta um ponto de Força de Vontade e ergue a cabeça ao céu, então faz a rolagem de ativação (Atributo: Força). Com um sucesso, ela abre a boca e um coro de vozes que não são suas emite um grito ensurdecedor que se funde em trovão, enquanto nuvens de tempestade se juntam acima dela pelo resto do turno. Segue-se um silêncio imóvel enquanto a koldun permanece congelada, a expressão transfixada, ecoando o chamado. Momentos depois, um furacão rugidor explode ao seu redor, irrompendo da terra dos mortos com toda a fúria do Submundo. Seu olho, um funil focado, desce pela boca da koldun, fazendo-a convulsionar e se contorcer enquanto se ergue nove metros no ar.
A tempestade tem raio de sete metros por sucesso obtido na rolagem de ativação e duração (em turnos) igual aos sucessos. Todos dentro do raio precisam ter sucesso numa rolagem de Força de Vontade (dificuldade 8) a cada turno ou ganham uma perturbação e entram num estranho estado de fuga (descrito na p. 291 de V20) chamado "Harrowing", enquanto a tempestade deforma memórias, aprisionando os que estão dentro num labirinto interno de arrependimento, depressão e desesperança pelo resto da cena. Enquanto a tempestade ruge, a koldun fica sem mente e completamente alheia aos arredores; ela sofre um nível de dano contundente inabsorvível a cada turno enquanto a tempestade a golpeia por dentro (a menos que esteja no Submundo, caso em que o dano contundente pode ser absorvido normalmente). Penalidades sofridas para ativar este poder são contabilizadas depois que a duração termina. Curar-se antes desse momento suspende os efeitos do poder.

••••• Fome do Vazio
Sistema: O koldun gasta um ponto de Força de Vontade, enfia a mão pela própria garganta e arranca sua própria alma. Ele passa um turno atormentando e esticando a boca do espírito cada vez mais, enquanto ela protesta mudamente, arranhando impotente seu violador em descrença chocada. Ele lança a alma contorcida à terra a seus pés, então faz a rolagem de ativação (Atributo: Força) antes de mergulhar nela. Com um sucesso, as fauces gigantes se transformam numa cavidade de um metro e meio de circunferência que começa a sugar tudo o que pode para saciar seu apetite insaciável.
O poder tem raio de oito metros por sucesso obtido na rolagem de ativação e duração (em turnos) igual aos sucessos. Todos dentro do raio são arrastados três metros por turno em direção ao Nihil, e têm sua velocidade reduzida à metade a cada dois metros mais próximos que estejam dele. Se consumidos pelas fauces, eles desaparecem e precisam fazer uma rolagem de Força de Vontade (dificuldade 9). Depois que o poder termina, o Nihil implode, deixando uma cratera enorme em seu rastro. Na base da cratera jaz o koldun, com tudo o que as fauces consumiram repousando sobre ele. Personagens que falharam na rolagem são transformados em criaturas sem mente, com suas virtudes e moralidade completamente arrancadas e reduzidas a zero. Vampiros que tiverem sucesso na rolagem entram num Harrowing (ver Ira da Tempestade) pelo resto da cena e ganham uma perturbação. Independentemente de sucesso ou falha, qualquer mortal consumido pelo poço tem a alma obliterada e entra em coma permanente.
A estase não-morta de um vampiro não consegue encarnar esta energia de outro mundo. Ao término do poder, fissuras de nada não filtrado despedaçam a alma do koldun por dentro, enquanto queimaduras abrasadoras irrompem e rasgam a carne por toda a sua estrutura (infligindo dois níveis de dano agravado).]==],
				},
				["The Kraina of the Well"] = {
					pt = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, pág. 172


The Kraina of the Well


• Chamar os Filhos
Sistema: Exigindo uma cena inteira de foco ininterrupto e o gasto de um ponto de sangue para efetivar, o koldun realiza uma longa série de encantações enquanto traça glifos ao redor de um círculo feito com seu próprio sangue em torno da entrada de seu Poço do Sacrifício. O poder e a força do demônio que o koldun é capaz de invocar sobem proporcionalmente a seu nível de avanço na kraina.
Conforme a perícia do koldun na kraina sobe, sobe também sua capacidade de invocar demônios de poder crescente. Ao longo da cena, ele faz uma rolagem prolongada de invocação (Atributo: Raciocínio), exigindo uma quantidade de sucessos igual ao nível de dificuldade do demônio invocado.
Kraina nível 1 — Dificuldade de 5 sucessos; Tentador Caído
Kraina nível 2 — Dificuldade de 6 sucessos; Tentador Caído: +30
Kraina nível 3 — Dificuldade de 7 sucessos; Tentador Caído: +55
Kraina nível 4 — Dificuldade de 8 sucessos; Profanador Terreno nas Trevas
Kraina nível 5 — Dificuldade de 9 sucessos; Profanador Terreno nas Trevas: +30
Demônios usam as estatísticas apresentadas nas pp. 386-387 de V20. Narradores devem trocar livremente Habilidades e Disciplinas específicas por outras e variar os valores de Atributo para atender às necessidades de seu jogo. Demônios invocados por Chamar os Filhos não estão de posse de um hospedeiro mortal, mantendo o semblante de sua Forma Apocalíptica descrita em Poderes e Fraquezas. Sem estar preso, um demônio não pode sair dos limites do círculo de invocação em que está e será arrancado de volta ao Inferno depois que expirar um número de turnos igual ao nível de dificuldade de sua conjuração. O demônio pode se comunicar, mas em geral exige uma troca de bens ou serviços (às vezes até um contrato) por qualquer informação que lhe seja pedida e, mesmo assim, não há garantia de que precise responder com verdade. O jogador pode escolher invocar o mesmo demônio de novo mais tarde se uma barganha foi firmada, mas não cumprida antes do fim da duração do poder. Dois ou mais koldun com este poder podem eleger um invocador principal e trabalhar em conjunto para invocar uma entidade. O nível de dificuldade é reduzido em um (mínimo 4) para cada koldun que auxilie na invocação.

•• Escutar o Coração Fadado ao Inferno
Sistema: Ao sorver um ponto de sangue diretamente de seu Poço, a koldun soma seus níveis alcançados na Kraina do Poço à sua Habilidade Prontidão para detectar influência demoníaca em áreas maculadas por sua presença ou almas manchadas por seu toque. Este efeito dura enquanto o ponto de sangue permanecer em seu organismo. O sangue é sempre consumido na ordem em que foi ingerido.

••• Égide Alighieri
Sistema: A koldun lacera uma veia, gastando um turno e um ponto de sangue para cobrir um amuleto com seu sangue, então faz a rolagem de ativação (Atributo: Carisma). Pelo resto da cena, a koldun soma os sucessos obtidos na rolagem de ativação à dificuldade de ataques e influências sobrenaturais de origem infernal usados contra ela (como objetos abençoados infernalmente, Investiduras e Dádivas, ou quaisquer Disciplinas e poderes de feitiçaria de sangue empunhados por infernalistas e demônios). Ela também ganha uma quantidade de dados extras nas rolagens para resistir a esses mesmos efeitos igual à quantidade de sucessos obtidos. Qualquer objeto mundano ou místico pode ser consagrado como amuleto; escolhas populares incluem adagas cerimoniais, crucifixos aviltados ou cabeças decepadas que se animam para gritar infindavelmente em silêncio. Contudo, apenas a koldun se beneficia da proteção concedida pela Égide Alighieri, e ela precisa estar com o amuleto consigo para este poder funcionar. Antes de ativar este poder, exige-se que a koldun tenha mergulhado o amuleto em seu Poço, deixando-o de molho ali por uma noite inteira. Dois ou mais koldun trabalhando juntos em estreita proximidade (a até 15 metros) concedem uns aos outros um sucesso extra em rolagens de resistência e aumentam em um (máximo 9) a dificuldade para atacá-los, para todos os koldun presentes com este poder ativado.

•••• Expulsar a Hoste do Inferno
Sistema: O koldun cria um elo com seu Poço moldando ou cavando uma depressão em forma de tigela (mínimo de 30 cm de diâmetro) na terra e batizando-a com um ponto de sangue. Ele entoa uma litania de admoestações e maldições enquanto asperge o sangue sobre a área ou batiza o sujeito que pretende exorcizar, então faz a rolagem de ativação (Atributo: Manipulação).
Para limpar uma área, ser ou coisa de marca infernal, ou expulsar uma entidade demoníaca, exige-se uma quantidade de sucessos relativa ao grau de corrupção infundida (1 a 2 para máculas menores, 3 para infecções sutis de maldade perceptível, 4 ou mais para objetos e espaços que irradiem uma malevolência palpavelmente potente). Infernalistas imbuídos do diabólico e espíritos demoníacos que aviltam uma área com sua presença (ou que estejam diretamente de posse de seres, lugares ou coisas) podem resistir gastando um ponto de Força de Vontade e então rolando Força de Vontade (dificuldade igual à Força de Vontade permanente do koldun). Demônios que falharem na rolagem são dispensados e banidos de volta ao Inferno. Infernalistas purificados não recuperam suas almas condenadas, mas qualquer marca infernal que outrora permeasse seu ser é permanentemente expelida.
Um ou mais koldun com Expulsar a Hoste do Inferno podem auxiliar um exorcista principal a anular uma praga infernal. O nível de dificuldade para limpar ou expulsar é reduzido em um (mínimo 4) para cada koldun que auxilie no exorcismo.

••••• Ceifar o Poço
Sistema: Ao invocar um demônio ou descobrir um fugitivo solto e livre fora da prisão do Inferno, a koldun pode tentar prender e escravizar a criatura à sua vontade. A koldun corta os pulsos, levando um turno para juntar um ponto de sangue nas mãos em concha a fim de fabricar uma conexão com seu Poço. Quando pronta, ela gasta um ponto de Força de Vontade e faz a rolagem de ativação (Atributo: Força). O sangue salta de suas mãos na forma de seis correntes de ganchos entrelaçadas, ancoradas sob seus pulsos cortados, que se lançam ao alvo com precisão infalível (máximo de 30 metros). Se a rolagem for um sucesso, os ganchos de sangue se fincam dolorosamente na entidade, criando ferimentos sangrentos (sem dano), independentemente de a criatura possuir ou não forma física. Uma criatura enlaçada pode se debater para romper uma corrente por turno gastando um ponto de Força de Vontade e então rolando Força de Vontade (dificuldade igual à Força de Vontade permanente da koldun).
Enquanto os ganchos penetrarem o corpo da entidade, uma vez por turno a koldun pode exigir seu Nome Verdadeiro, atormentando o demônio ao rolar Inteligência + Intimidação contra os pontos atuais de Força de Vontade do alvo para dilacerar sua alma com dor excruciante. Com um sucesso, a vítima brada a resposta em súplica. A koldun tem duas escolhas: pode desacorrentar e dispensar o demônio por Expulsar a Hoste do Inferno, ou absorvê-lo para dentro de si.
Uma koldun que tenha obtido o Nome Verdadeiro de um demônio reduz o nível de dificuldade em dois ao evocá-lo mais tarde por Chamar os Filhos. Demônios presos por seu Nome Verdadeiro podem sair dos limites do círculo em que foram invocados, e podem ser comandados por uma koldun a cumprir um número de tarefas por um número de dias igual aos sucessos obtidos na rolagem de invocação. O demônio responderá a qualquer pergunta da koldun, e a koldun não precisa oferecer troca de serviços por perguntas ou tarefas.
Se escolher absorver um demônio acorrentado, a koldun pode gastar um ponto de sangue para chamá-lo de volta instantaneamente. Demônios acorrentados são inteiramente obedientes e servem à vontade da koldun na capacidade que ela exigir, mas precisam permanecer atados (máximo de 30 metros) à koldun. Uma koldun pode controlar até seis servos demoníacos acorrentados; cada corrente dividida diminui a quantidade de correntes disponíveis para futuros aprisionamentos e aumenta em um a dificuldade para atormentar demônios não domados.
Um demônio que desobedeça ou minta para uma invocadora que conheça seu Nome Verdadeiro ao conjurá-lo sofre agonia paralisante. Caso Ceifar o Poço seja usado para realizar um exorcismo violento num hospedeiro vivo possuído por um demônio, o hospedeiro rola Vigor contra dificuldade igual à quantidade de turnos levados para domar o demônio a revelar seu Nome Verdadeiro. A falha resulta na morte do hospedeiro por choque. Múltiplos koldun podem Ceifar o Poço juntos, diminuindo coletivamente em um por corrente a dificuldade para atormentar um demônio (mínimo 4). A Ceifadora do Inferno que extrair com sucesso o Nome Verdadeiro do demônio em seu turno pode escolher prendê-lo ou dispensá-lo. Todos os koldun presentes ouvem o demônio uivar seu Nome Verdadeiro e, se dispensado, podem conjurá-lo individualmente. Um demônio a serviço de uma Ceifadora do Inferno não pode ser evocado até ser liberado do serviço.]==],
				},
				["The Laws of Suleiman"] = {
					pt = [==[Rites of Blood, pág. 160


The Laws of Suleiman


Muitas das trilhas associadas ao Dur-An-Ki são funcionalmente idênticas a várias trilhas de Taumaturgia. Em muitos casos, a versão Dur-An-Ki veio primeiro e foi adaptada à Taumaturgia pelos Tremere.
The Laws of Suleiman é uma dessas trilhas: é funcionalmente idêntica a à Trilha da Manipulação de Espíritos (Rites of Blood, pp. 142-145).]==],
				},
				["The Nightshade Path"] = {
					pt = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, pág. 70


The Nightshade Path


• Cuidar do Jardim de Corpos
Sistema: A jogadora gasta um ponto de sangue enquanto a vampira deixa parte de seu sangue pingar sobre um cadáver, e rola Raciocínio + Ocultismo (dificuldade 6). Os sucessos permitem à vampira acelerar ou deter a decomposição da seguinte forma:
1 sucesso — Retardar ou acelerar a putrefação em até um dia
2 sucessos — Até uma semana
3 sucessos — Até um mês
4 sucessos — Até um ano
5 ou mais sucessos — A critério do Narrador
A vampira pode usar este poder em mortais e animais desde que os restos não tenham sido substancialmente espalhados. Pode ser usado em Membros por no máximo um turno depois de terem encontrado a Morte Final. Cadáveres que recentemente pertenceram aos vivos mudam conforme as condições locais, de modo que um guardado em lugar seco pode mumificar, enquanto outro que repousa sobre solo rapidamente brota plantas e larvas. Coisas vivas que se alimentam dos mortos são aceleradas ou mantidas em estase junto com o cadáver, desde que sejam plantas, fungos ou não maiores que um escaravelho. Membros sob a Morte Final mirram e se desfazem em pó sem atrair tais organismos.

•• Fruto da Bruxa
Sistema: A jogadora gasta um ponto de sangue enquanto a vampira toca matéria vegetal comestível. Nenhuma rolagem é exigida. A primeira criatura viva a comer essa refeição contaminada cai num transe desperto e ambulante por uma cena, durante a qual pode enxergar as Terras das Sombras, ouvir seus habitantes e até tocar e ser tocada por fantasmas. O alvo não pode fazer contato físico com prédios e outros objetos que nunca estiveram vivos, e não pode ser arrastado para a Tempestade ou qualquer outro lugar que não tenha localização correspondente no mundo dos vivos. A matéria vegetal contaminada apodrece até o próximo nascer do sol e perde a capacidade de conferir esse estado.
Frutos de bruxa são alucinógenos leves. Visões distorcidas de fantasmas e prédios há muito derrubados desorientam mortais sob sua influência. Isso normalmente impõe +2 às dificuldades para realizar quaisquer ações, exceto rolagens de Força de Vontade, enquanto durar o efeito. Criaturas familiarizadas com fenômenos sobrenaturais não sofrem essa penalidade.

••• Erguer o Verdejante
Sistema: O jogador rola Raciocínio + Ocultismo (dificuldade 8). Ele gasta um ponto de Força de Vontade e um ponto de sangue enquanto se concentra num cadáver que jaz sobre ou dentro de solo fértil. Se a rolagem tiver sucesso, trepadeiras, galhos e folhas de tom avermelhado envolvem o cadáver, e ele se ergue para cumprir as ordens do necromante. O necromante só pode erguer os Verdejantes um de cada vez, e nunca pode ter múltiplos Verdejantes ativos ao mesmo tempo.
Verdejantes são mais fortes, mais rápidos e possuem instintos melhores que a maioria dos zumbis. Seus traços são Força 4, Destreza 4, Vigor 4, Esportes 2, Briga 3 e o equivalente a 2 pontos de Fortitude, pois seus corpos úmidos resistem a ferimentos. O dano contundente causa metade do dano a um Verdejante. Como vampiros, eles sofrem dano contundente de armas de fogo. Diferentemente dos zumbis comuns, agem na ordem normal de iniciativa.

•••• Lamentos e Sussurros
Sistema: A vampira se concentra num alvo, gritando ou sussurrando conforme suas intenções ditarem. (O alvo não precisa conseguir ouvir a vampira.) A jogadora gasta um ponto de Força de Vontade e rola Raciocínio + Ocultismo (dificuldade 8). Se ela desejar atrair seu alvo para mais perto da morte, cada sucesso soma um nível de dano letal ao total infligido pelo próximo ferimento que ele sofrer naquela cena. Se ela desejar impedir que o alvo morra, cada sucesso reserva um nível de dano (de qualquer tipo) do próximo ferimento que o alvo sofrer durante a cena, mas este benefício só dura até o fim da cena, após o que o dano reservado retorna. O alvo sofre o ferimento, mas não sente seus efeitos, até e inclusive a morte, até a cena terminar e o dano retornar. Note que o Narrador pode determinar que quantidades muito grandes de dano possam causar a morte por destruição total ou quase total do corpo, independentemente dos efeitos deste poder.

••••• Ventre Ctônico
Sistema: A vampira precisa beber ao menos um ponto do sangue de uma vítima mortal, mas pode matá-lo por outro método. Outra pessoa ou incidente pode causar a morte do mortal, mas a necromante precisa fazer contato físico com ele no momento da morte. Nesse ponto, a jogadora gasta um ponto de Força de Vontade e rola Raciocínio + Ocultismo (dificuldade 8). Se a jogadora tiver sucesso, a alma ocupa o corpo da vampira em estado dormente por até um mês por sucesso. (Percepção de Aura ou poderes semelhantes revelam a presença da alma dormente, que pode ser confundida com uma forma de possessão.) A necromante pode armazenar múltiplas almas dessa forma, mas "gêmeos", "trigêmeos" e mais oneram a energia da "mãe". Cada alma armazenada além da primeira drena um ponto de sangue adicional quando a vampira desperta a cada noite.
A qualquer momento antes de a alma deixar seu corpo, a vampira pode invocá-la para se manifestar com os traços de um fantasma recém-falecido (ver V20, p. 385) ou com os que possuía em vida, junto com as capacidades sobrenaturais de um fantasma recém-falecido. Ela precisa prestar três serviços à sua "mãe". Depois disso, a alma está livre para seguir rumo a seu destino final. Se o fantasma for ordenado a realizar qualquer tarefa que traumatizaria um mortal (tipicamente, aquelas que arriscariam um teste de Humanidade num vampiro com esse traço em 7), ele pode, a critério do Narrador, tratar a necromante como um "grilhão", um objeto no qual o fantasma se fixa e que usa como laço com o mundo dos vivos. Isso dá ao fantasma a capacidade de assombrar a necromante até ser banido. A necromante pode sempre simplesmente dispensar a alma quando ela aparecer, ou até ordenar que ela deixe seu corpo enquanto a alma ainda dorme.]==],
				},
				["The Path of Blood"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 213


The Path of Blood


• Gosto pelo Sangue
Sistema: O número de sucessos obtidos na rolagem determina quanta informação o taumaturgo colhe e quão precisa ela é.

•• Fúria de Sangue
Sistema: Cada sucesso força o sujeito a gastar um ponto de sangue imediatamente do modo que a conjuradora desejar (o que precisa se dirigir a algum gasto lógico que o vampiro alvo poderia fazer, como aumentar Atributos Físicos ou alimentar Disciplinas). Note que pontos de sangue gastos à força dessa maneira podem exceder o máximo normal "por turno" indicado pela Geração da vítima. Cada sucesso obtido também aumenta em um a dificuldade do sujeito para resistir ao frenesi. A taumaturga não pode usar Fúria de Sangue em si mesma para burlar os limites geracionais.

••• Sangue de Potência
Sistema: Um sucesso na rolagem de Força de Vontade permite ao personagem reduzir sua Geração em um passo por uma hora. Cada sucesso adicional concede ao Membro ou um passo a menos na Geração ou uma hora de efeito. Os sucessos obtidos precisam ser gastos tanto para diminuir a Geração do vampiro quanto para manter a mudança (este poder não pode ser ativado de novo até que a aplicação original se esgote). Se o vampiro for diablerizado enquanto este poder estiver em efeito, ele se esgota imediatamente e o diablerista ganha poder apropriado à Geração real do conjurador. Além disso, quaisquer mortais Abraçados pelo taumaturgo nascem na Geração apropriada à Geração original de seu senhor (por exemplo, um Tremere de Décima Geração que reduziu sua Geração efetiva para Oitava ainda produz cria de Décima Primeira Geração).
Uma vez esgotado o efeito, qualquer sangue acima do máximo da reserva do personagem se dilui, deixando o personagem em sua reserva máxima normal. Assim, se um Tremere de Décima Segunda Geração (reserva máxima de 11) reduziu sua Geração para Nona (reserva máxima 14), ingeriu 14 pontos de sangue e tinha toda essa vitae no organismo quando o poder se esgotou, sua reserva de sangue cairia imediatamente para 11.

•••• Roubo de Vitae
Sistema: O número de sucessos determina quantos pontos de sangue a conjuradora transfere do sujeito. O sujeito precisa estar visível para a taumaturga e a até 15 metros. Usar este poder impede que a conjuradora fique presa por laço de sangue, mas de resto conta como se a vampira tivesse ingerido o sangue ela mesma. Este poder é espetacularmente óbvio, e os príncipes da Camarilla, com razão, consideram seu uso público uma quebra da Máscara.

••••• Caldeirão de Sangue
Sistema: O número de sucessos obtidos determina quantos pontos de sangue entram em ebulição. O sujeito sofre um nível de vitalidade de dano agravado para cada ponto fervido (indivíduos com Fortitude podem absorver este dano usando apenas seus dados de Fortitude). Um único sucesso mata qualquer mortal, embora se diga que alguns carniçais com acesso a Fortitude sobreviveram após absorver todo o dano agravado.]==],
				},
				["The Path of Jinn’s Gift"] = {
					pt = [==[Rites of Blood, pág. 160


The Path of Jinn’s Gift


Muitas das trilhas associadas ao Dur-An-Ki são funcionalmente idênticas a várias trilhas de Taumaturgia. Em muitos casos, a versão Dur-An-Ki veio primeiro e foi adaptada à Taumaturgia pelos Tremere.
The Path of Jinn’s Gift é uma dessas trilhas: é funcionalmente idêntica a à Trilha da Conjuração (V20, pp. 220-221).]==],
				},
				["The Path of Life’s Waters"] = {
					pt = [==[Rites of Blood, pág. 160


The Path of Life’s Waters


Muitas das trilhas associadas ao Dur-An-Ki são funcionalmente idênticas a várias trilhas de Taumaturgia. Em muitos casos, a versão Dur-An-Ki veio primeiro e foi adaptada à Taumaturgia pelos Tremere.
The Path of Life’s Waters é uma dessas trilhas: é funcionalmente idêntica a à Trilha do Sangue (V20, pp. 213-214).]==],
				},
				["The Path of Phobos"] = {
					pt = [==[Rites of Blood, pág. 168


The Path of Phobos


• Induzir Medo
Sistema: A infernalista pode escolher como alvo qualquer sujeito em sua linha de visão. Ela precisa se concentrar, gesticular em direção à vítima e entoar a invocação apropriada ao Inferno. Se tiver sucesso, a vítima fica visivelmente perturbada e preocupada, o que deve ser interpretado. Para resistir, a vítima precisa fazer uma rolagem de Coragem (dificuldade 4 + o número de sucessos obtidos na rolagem de ativação, até o máximo de 9) para realizar qualquer ação que não seja procurar o perseguidor imaginado.
Todas as paradas de dados da vítima pela duração deste poder são automaticamente reduzidas em um. A duração deste poder é limitada pelo número de sucessos obtidos na rolagem de ativação:
1 sucesso — Um turno
2 sucessos — Cinco turnos
3 sucessos — Uma hora
4 sucessos — Uma noite
5 sucessos — Duas noites

•• Assombrar
Sistema: A infernalista precisa ver sua vítima e sussurrar uma prece ao Inferno para este poder funcionar. A sensação incômoda no fundo da mente do personagem se torna mais tangível. Mortais precisam de uma rolagem bem-sucedida de Coragem (dificuldade 7) para não fugirem da área em terror. Vampiros precisam fazer a mesma rolagem, mas se falharem entram em Rötschreck.

••• Aterrorizar
Sistema: A infernalista precisa se concentrar por um momento e então gesticular em direção à vítima. Se tiver sucesso, o sujeito aterrorizado precisa ter sucesso numa rolagem de Coragem (dificuldade 7) para sacudir seu medo e conseguir agir. Do contrário, ela simplesmente se encolhe, escondendo-se debilmente de seu objeto imaginário de terror. Uma falha crítica nessa rolagem de Coragem resulta numa perturbação, de preferência adequada ao medo que visita a vítima.
A duração deste poder é limitada pelo número de sucessos obtidos na rolagem de ativação:
1 sucesso — Um turno
2 sucessos — Cinco turnos
3 sucessos — 30 minutos
4 sucessos — Uma hora
5 sucessos — Uma noite

•••• Praga do Medo
Sistema: A infernalista precisa ver e então amaldiçoar em voz alta sua vítima para este poder terrível fazer efeito. Uma vez amaldiçoada, este poder dura uma semana. A vítima é constantemente assediada por seu medo a cada instante. Pela duração deste poder, todas as rolagens de Força de Vontade são feitas como se o valor permanente do personagem fosse três pontos menor que o normal (até um mínimo de 1).

••••• Sanguessuga do Medo
Sistema: Enquanto tiver seu sujeito à vista, a infernalista pode tentar obter sustento de qualquer medo que a vítima esteja sofrendo no momento. Naturalmente, a vítima precisa ter motivo para ter medo de algo ou alguém enquanto a infernalista pratica este poder. Esses medos não podem ser causados por outras aplicações desta trilha.
O número de sucessos obtidos na rolagem de ativação determina o número de pontos transmutados na "reserva de medo" da infernalista. Cada ponto nessa "reserva de medo" pode ser gasto exatamente como um ponto de sangue, além dos limites normais de Geração. Contudo, essa fonte extra de poder precisa ser utilizada antes do nascer do sol, ou desaparecerá.
Além do ponto de Força de Vontade perdido, uma falha crítica significa que a infernalista não obtém "reserva de medo" alguma da vítima, e não pode usar o poder naquela vítima de novo por 24 horas.]==],
				},
				["The Path of Praapti"] = {
					pt = [==[Rites of Blood, pág. 165


The Path of Praapti


• Teletransporta até 10 metros.

•• … até 50 metros.

••• … até 500 metros.

•••• … até 8 quilômetros.

••••• … até 800 quilômetros.
O teletransporte raramente é exato. Cada "1" rolado numa rolagem bem-sucedida desvia o feiticeiro em 10% do total do destino. O número de sucessos rolados determina o que pode ser transportado. Um único sucesso permite o teletransporte do corpo nu do feiticeiro. Cada sucesso adicional permite o transporte de mais nove quilos. Se os sucessos rolados não bastarem para abranger o que o feiticeiro pretende levar, o Narrador decide o que fica para trás.]==],
				},
				["The Path of Skulls"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 54


The Path of Skulls


• Calvaria Emissicius
Sistema: O necromante precisa possuir o crânio de qualquer criatura que ele mesmo tenha matado. O jogador gasta um ponto de sangue e rola Percepção + Ocultismo (dificuldade 5). A falha não tem efeito; uma falha crítica significa que o crânio se desfaz em pó imediatamente. O sucesso significa que o necromante pode entrar instantaneamente num estado meditativo em que consegue ver pelas órbitas do crânio, cancelado apenas quando o transe é rompido ou o sol nasce. Esse estado de espionagem pode ser reiniciado um número de vezes igual ao número de sucessos.

•• Consilium Mortuus
Sistema: O necromante precisa possuir a cabeça decepada de um ser cuja língua ele compreenda. O jogador precisa gastar ao menos um ponto de sangue e rolar Manipulação + Empatia (dificuldade 6). A falha não tem efeito; uma falha crítica significa que a cabeça responderá apenas com mentiras ao interrogatório do necromante. O sucesso força a cabeça a responder com verdade a uma pergunta feita pelo necromante, mas precisa ser uma pergunta cuja resposta o antigo dono da cabeça saberia. Para cada ponto de sangue gasto além do inicial, uma pergunta adicional pode ser feita.
Nenhum espírito é invocado com Consilium Mortuus — o ser morto com quem o necromante se comunica nem sequer está ciente de estar sendo canalizado. A resposta vem por memória vestigial, traços deixados no cérebro apodrecido da cabeça, impressos em sua língua em putrefação.

••• Ammorsus Vicarius
Sistema: O necromante precisa possuir um crânio ou cabeça em decomposição com todos os dentes removidos. O jogador precisa gastar um ponto de Força de Vontade e ao menos um ponto de sangue para este poder fazer efeito. No lugar dos dentes, uma fileira cruel de presas emerge no crânio, permanecendo até que ele consuma tantos pontos de sangue quantos foram gastos pelo necromante em sua ativação. Nesse ponto, o crânio fica inerte e suas presas caem.
O crânio morde instintivamente quando está a meio metro de carne viva e sangue quente. Com o gasto de um segundo ponto de Força de Vontade pelo vampiro, ele também investirá contra Cainitas. O crânio é capaz de se impulsionar meio metro com as mandíbulas abertas numa única ocasião, com parada de combate total de 6 e dificuldade padrão. Uma mordida bem-sucedida de um crânio independente é um agarrão imediato do qual o crânio não se soltará até ser destruído.
O crânio pode ser empunhado como arma pelo necromante, caso em que mantém a mesma parada de combate e dificuldade da arma em que está fixado (ver V20 Dark Ages p. 349). Nesse caso, o crânio retrairá voluntariamente sua mordida se o necromante o afastar da vítima.
A mordida do crânio causa três níveis de dano agravado a cada turno em que suas presas estiverem cravadas num alvo. Ela também consome um ponto de sangue por turno, que é necromanticamente canalizado ao Cainita que lhe deu poder. Vitae canalizada dessa forma pode contar para um laço de sangue.
O crânio é destrutível, mas leva ao menos um turno de ataque concentrado para ser destruído. Para fins de defesa, o crânio não pode esquivar nem manobrar. Tem Força 3 para determinar resistência a ser arrancado e Vigor 2; tem apenas três níveis de vitalidade e só pode absorver dano contundente.
Um necromante pode animar múltiplos crânios fazendo o gasto de Força de Vontade e sangue para cada um.

•••• Exedo Animus
Sistema: O necromante precisa possuir um crânio e conhecer a identidade da pessoa da qual o crânio outrora fez parte. O jogador precisa gastar dois pontos de Força de Vontade e dois pontos de sangue, e rolar Inteligência + Ocultismo (dificuldade 7). A falha não tem efeito; uma falha crítica significa que as memórias do falecido serão confusas e enganosas. O sucesso permite ao necromante virar o crânio e beber a personalidade dele. Para cada sucesso, o necromante ganha uma hora como hospedeiro das memórias e da identidade do crânio.
Os efeitos de Exedo Animus permitem ao necromante realizar rolagens baseadas em Inteligência que envolvam a recordação e as memórias do falecido com dificuldade reduzida em 3. Essas memórias param no ponto da morte — o espírito em comunhão é uma sombra da vida, e não um espectro independente e pensante.
Exedo Animus também concede ao necromante o poder de se passar pela identidade do falecido, ganhando três dados em rolagens baseadas em Performance ao fazê-lo. Tal imitação sofre penalidades quando o necromante não se assemelha fisicamente à fonte morta de sua imitação, mas ao utilizar Ofuscação ou ao explicar que está canalizando o morto em vez de ser o morto, esses atos são mais bem-sucedidos.

••••• Degulo
Sistema: O necromante precisa possuir o crânio do ser cujos poderes deseja ingerir e absorver. O jogador precisa gastar dois pontos de Força de Vontade e fazer uma rolagem de Força de Vontade (dificuldade 9). Força de Vontade não pode ser gasta para criar um sucesso automático nessa rolagem. A falha não tem efeito; uma falha crítica significa que o necromante perde aquilo que estava preparado para sacrificar pela Disciplina, mas não ganha nenhum dos benefícios. O sucesso permite ao necromante desencaixar a mandíbula e consumir o crânio inteiro, absorvendo em seguida elementos do espírito devorado.
Degulo força o vampiro a perder um traço qualquer de sua ficha. O Narrador então substitui o valor desse traço pelo valor detido pela pessoa morta cujo crânio foi consumido.
O vampiro que usa Degulo está restrito a trocar apenas um valor de traço e, como o crânio é consumido no ato, este ato não pode ser repetido com outros traços do mesmo espírito. Diferentemente dos outros níveis da Trilha dos Crânios, se houver um espectro do falecido, ele é afetado por este poder, ganhando o traço legado pelo necromante em troca do seu próprio.
A única restrição de Degulo se aplica a Disciplinas, permitindo apenas uma troca de valor igual de poderes Cainitas. Um necromante não pode trocar seu único ponto em Auspícios pelos quatro pontos de Dominação de outro Cainita, mas pode trocar seu único ponto em Auspícios pelo primeiro ponto da Disciplina Dominação do Cainita falecido. O praticante de Degulo então perde sua Disciplina escolhida como Disciplina de Clã, ganhando a Disciplina consumida como sua nova Disciplina de Clã.]==],
				},
				["The Path of Woe"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 57


The Path of Woe


• Encontrar o Lócus
Sistema: A jogadora gasta um ponto de sangue enquanto sua vampira esfrega vitae nos olhos e rola Percepção + Sensitividade (dificuldade 5). A falha não tem efeito; uma falha crítica significa que a necromante confunde o objeto errado com um Grilhão. O sucesso permite à necromante ver um brilho ectoplásmico ao redor de algo importante para um espectro, como a espada usada para matá-lo, o vestido em que ela morreu, a casa em que ele cresceu ou a filha que ela entregou à Igreja. Cada sucesso adicional permite à necromante ver trilhas até outros Grilhões do mesmo espectro. Os efeitos da Disciplina duram uma cena. Este poder só permite ao vampiro ver um Grilhão. Embora o espectro muitas vezes se manifeste se seu Grilhão for ameaçado, a necromante não conseguirá vê-lo até que ele torne sua presença evidente.

•• Expurgar os Condenados
Sistema: O necromante precisa estar num espaço fechado, formar um círculo de ossos humanos ou pintar um usando a própria vitae. O jogador precisa gastar um ponto de sangue (mais, se estiver pintando um círculo, com o volume a critério do Narrador) e rolar Raciocínio + Teologia (dificuldade 7, reduzida em um se um Grilhão dentro da área for identificado, em dois se o Grilhão for danificado e em três se o Grilhão for destruído). Se o espectro estava dentro da área afetada por Expurgar os Condenados antes da rolagem, o sucesso o expele das Terras das Sombras para o mundo dos vivos numa forma física e vulnerável. A falha resulta no Poder não funcionar; uma falha crítica puxa a vampira através das Terras das Sombras, onde ela se vê sujeita ao que quer que o espectro tenha planejado.
Espectros expurgados para a área do necromante usam as estatísticas de V20 Dark Ages (p. 403) e podem absorver dano tanto contusivo quanto letal. Espectros trazidos assim podem voltar livremente às Terras das Sombras, mas poucos o fazem quando seus Grilhões estão sob ameaça.

••• Flagelo de Sangue
Sistema: A jogadora gasta no mínimo um ponto de sangue. A vitae flui livremente das palmas e das solas da necromante, que pode lançar as mãos como se empunhasse um chicote contra o espírito diante dela. A jogadora precisa rolar Armas Brancas + Destreza para sua Cainita acertar o espectro, com o espectro tendo direito a esquivar se estiver em posição de fazê-lo. Para cada ponto de sangue gasto, a necromante inflige esse número em dano agravado ao espectro. Essa vitae ardente causa tamanha agonia que aumenta em dois a dificuldade de qualquer tentativa do espectro de usar seus poderes.
O Flagelo de Sangue não pode ferir espectros nas Terras das Sombras, a menos que o necromante esteja presente lá.

•••• Eucaristia Maldita
Sistema: A jogadora rola Vigor + Teologia (dificuldade 6) enquanto a necromante tenta se alimentar de um espectro. Na falha, nada acontece; uma falha crítica resulta em icor ardente drenado do espírito, causando um nível de dano agravado à Cainita. O sucesso converte a Paixão drenada do espectro em Força de Vontade temporária, à razão de um ponto de Força de Vontade para cada dois pontos de Paixão consumidos.

••••• Purgar a Alma do Apóstata
Sistema: O jogador gasta três pontos de Força de Vontade e rola Inteligência + Teologia (dificuldade 8), enquanto o necromante está na presença de ao menos um espectro. A falha resulta em nada acontecer; uma falha crítica reverte o efeito sobre o vampiro. Cada sucesso inflige um nível de dano agravado à alma do espectro e a qualquer outro dentro de um raio de 10 metros do necromante, mortal ou morto-vivo. Para cada nível de vitalidade perdido pelo espectro, uma poça desprendida de ectoplasma é produzida. O necromante pode bebê-la, recuperando um ponto de Força de Vontade para cada poça lambida do chão.
O uso deste poder contamina irreversivelmente o raio de 10 metros ao redor do necromante, tornando-o uma esfera onde a vida é incapaz de crescer e na qual espectros jamais podem voltar a entrar.]==],
				},
				["The Path of the Ailing Jackal"] = {
					pt = [==[Rites of Blood, pág. 160


The Path of the Ailing Jackal


Muitas das trilhas associadas ao Dur-An-Ki são funcionalmente idênticas a várias trilhas de Taumaturgia. Em muitos casos, a versão Dur-An-Ki veio primeiro e foi adaptada à Taumaturgia pelos Tremere.
The Path of the Ailing Jackal é uma dessas trilhas: é funcionalmente idêntica à Trilha da Vingança do Pai (V20, pp. 226-228).]==],
				},
				["The Path of the Evil Eye"] = {
					pt = [==[Rites of Blood, pág. 160


The Path of the Evil Eye


• Humilhação
Sistema: Cada sucesso representa uma noite durante a qual o alvo é afetado pela maldição. A maldição dispara uma vez por noite num momento à escolha do Narrador, em geral a cena em que o personagem está diante do maior número de indivíduos ou diante do maior número de pessoas socialmente importantes. Ou seja, ela pode disparar enquanto o personagem está num restaurante lotado ou quando está a sós com o Príncipe, o que tiver o maior potencial de constrangimento pessoal. O Narrador determina quando a maldição dispara, mas ela deve fazê-lo ao menos uma vez por noite.
Durante a cena de disparo, em cada rolagem Social feita para o personagem, o jogador precisa acrescentar um número de 1s automáticos igual ao valor do feiticeiro na Trilha do Mau-Olhado, aumentando assim a probabilidade de falha crítica numa rolagem Social. Além disso, durante a cena de disparo, o Narrador deve rolar um número de dados igual ao valor do feiticeiro nesta trilha (dificuldade 5). Sucessos significam que algum evento externo acontece e causa constrangimento ao personagem, como um garçom derramando bebidas nele ou um carro respingando lama.

•• Perda
Sistema: Dentro de uma semana, o alvo perde um ponto de um Antecedente apropriado. Em geral, a maldição ataca preferencialmente Recursos em vez de outros Antecedentes, mas teoricamente qualquer forma de Antecedente tangível que represente um bem pessoal pode ser alvo válido. O feiticeiro não tem controle sobre como o ponto de Antecedente é perdido, nem sobre qual ponto de Antecedente é perdido. O Narrador pode até optar por decidir aleatoriamente.

••• Perigo
Sistema: O número de sucessos determina por quantas noites o personagem fica em risco. No início de cada noite, o Narrador precisa rolar um dado e, conforme o resultado, montar um encontro para o personagem alvejado.
1-3 — Nenhum. A maldição não dispara durante esta noite.
4-6 — Leve: Um encontro que provavelmente não fere o personagem, mas que tem chance de fazê-lo. Um mortal tenta assaltar o personagem enquanto ela está diante de mortais, ou simplesmente tenta assaltar uma loja de conveniência enquanto a personagem está na fila pagando gasolina. Um frequentador de bar se ofende com algo que a personagem faz ou diz e tenta arrumar briga.
7-8 — Moderado: Um encontro com probabilidade significativa de ao menos algum dano ao personagem. O personagem se envolve num acidente de carro ou é atropelado por um motorista que foge. Uma escada cede enquanto o personagem a sobe.
9 — Grave: Um encontro em que o personagem quase certamente sofrerá algum dano letal. O personagem diz sem querer algo ofensivo que provoca rolagens de frenesi em vampiros próximos. O prédio desaba enquanto o personagem está dentro dele, ou irrompe um incêndio.
10 — Catastrófico: Um encontro potencialmente mortal. O personagem fica trancado do lado de fora de seu refúgio durante o dia. O personagem diz sem querer algo que ofende uma alcateia de Lupinos próxima.
Noites em que não há perigo não contam contra os sucessos da ashipu; a maldição continua até que o alvo tenha sofrido um número de encontros perigosos igual aos sucessos ou até que a maldição seja levantada. Durante qualquer encontro perigoso, o personagem alvejado tem chance de perceber que está sob uma maldição (se já não soubesse). A rolagem é Inteligência + Ocultismo. A dificuldade padrão é 9, mas cai para 8 se o personagem tiver Auspícios ou para 6 se o personagem tiver algum conhecimento desta Trilha.

•••• Inimigo
Sistema: Para cada sucesso na rolagem de Força de Vontade, o alvo perde um ponto de Aliados, Contatos, Influência ou Lacaios. Isso pode refletir amigos e aliados que ficaram irritados com o personagem e lhe dão as costas, pode refletir contatos e aliados que simplesmente ficam indisponíveis por um tempo, ou pode de fato resultar em tais personagens sendo feridos ou até morrendo por má sorte. Como alternativa, o jogador pode optar por gastar parte ou todos os sucessos para dar ao alvo um novo Inimigo (conforme o Defeito Inimigo), que aparece para perseguir uma vendeta contra o personagem. De todo modo, os efeitos se manifestam dentro de uma semana, e o jogador do personagem alvejado não pode nem recuperar Antecedentes perdidos nem remover o Defeito Inimigo sem descobrir e neutralizar a maldição.

••••• O Olho Que Fere
Sistema: Embora a maldição permita flexibilidade, o pressuposto padrão é que, a cada dois sucessos (arredondados para cima), o alvo (ou objeto, se a maldição for dirigida a um bem do alvo) sofre um nível de dano agravado. Em geral, mesmo um único nível de dano basta para matar um animal ou destruir a maioria dos objetos. Se usado contra um mortal, este poder o mutila permanentemente. Se usado contra um Membro, a maldição inflige dano moldado pelas palavras da ashipu. Se ela elogia os belos olhos dele, eles serão queimados e ele pode ficar cego até conseguir se curar. Se ela zomba de suas palavras melífluas, a maldição pode queimar-lhe a língua e deixá-lo incapaz de falar. Esta maldição pode ser transmitida por uma efígie, mas a penalidade normal de dificuldade imposta pelo uso de efígie aumenta em +2 (ver Princípios de Contágio e Simpatia, pp. 133-135).]==],
				},
				["The Path of the Twilight Garden"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 289


The Path of the Twilight Garden


• Sussurros à Alma
Sistema: A Lilin sussurra um dos nomes secretos de Lilith. Qualquer alvo único a até 100 passos e na linha de visão da personagem ouve o sussurro como se a invocadora falasse diretamente em seu ouvido. O alvo precisa fazer imediatamente uma rolagem de Força de Vontade (dificuldade 8) ou será atormentado por pesadelos e alucinações por um número de dias e noites igual ao valor de Manipulação da invocadora. Isso faz o alvo perder dois dados de todas as paradas de dados enquanto durar o poder.

•• Beijo da Mãe Negra
Sistema: A jogadora gasta um ponto de sangue enquanto a vampira enche a boca com a substância cáustica. O próximo ataque de mordida que ela fizer causa dano dobrado antes da absorção. Isso não torna a alimentação mais eficiente, nem agrava o dano causado por perda de sangue. Se a vampira não usar um ataque de mordida contra um alvo, sua mordida permanece potente pelo resto da noite.

••• Humores Negros
Sistema: A jogadora gasta dois pontos de sangue enquanto a Lâmia corta a própria pele (ela pode usar uma faca, morder a língua ou simplesmente rasgar a pele com as garras). Ela transubstancia uma pequena quantidade de sangue num dos humores descritos abaixo. Ela também pode usar isso como defesa contra outro vampiro que esteja se alimentando dela. O alvo não precisa ingerir o humor para sofrer seus efeitos; o contato com a pele basta.
Os quatro humores são:
Fleumático: A exposição a humores fleumáticos deixa o alvo letárgico. Todas as paradas de dados são reduzidas em dois pelo restante da cena.
Melancólico: Humores melancólicos mergulham o alvo em profundo desespero. Pelo resto da cena, ele não pode gastar nenhum ponto de Força de Vontade e a dificuldade de todas as suas rolagens de Força de Vontade aumenta em dois.
Sanguíneo: Ao ser exposto a humores sanguíneos, o alvo se torna propenso a sangramento excessivo. Quaisquer ferimentos letais ou agravados causam um nível extra de dano do tipo correspondente no turno seguinte.
Bilioso: Humores biliosos envenenam o alvo, infligindo um número de níveis de dano letal igual ao Vigor do necromante.

•••• Manto do Nunca-Nascido
Sistema: A vampira bebe ao menos cinco pontos de sangue de um cadáver frio, depois gasta cinco pontos para invocar o poder. Ela então se transforma em nível espiritual e fisiológico; seus olhos ficam inteiramente negros, seus modos ficam distantes e frios. Ela ganha dois dados adicionais de absorção e imunidade a todas as penalidades por ferimento pelo restante da cena. Com uma rolagem bem-sucedida de Percepção + Ocultismo (dificuldade 7), ela pode enxergar as Terras das Sombras e falar com quaisquer fantasmas de lá. Por fim, ela consegue determinar de imediato a saúde relativa de qualquer ser que veja, pois ferimentos e doenças se manifestam vividamente na aura da criatura.

••••• Lamento de D’hainu
Sistema: A jogadora gasta dois pontos de Força de Vontade e rola Vigor + Esportes, dificuldade 7. Para cada sucesso rolado, o raio do Lamento de D’hainu aumenta em cinco metros. Qualquer um dentro do raio do Lamento (exceto a necromante) precisa fazer uma rolagem de Força de Vontade, dificuldade 7. Se a rolagem de Força de Vontade falhar, as vítimas do Lamento são tomadas pelo desespero e buscam pôr fim à própria vida imediatamente. Homens se lançam sobre suas espadas, lupinos rasgam a própria garganta e magos voltam suas magias contra si mesmos. A menos que seja detida, a vítima do Lamento não cessa sua busca pela morte até conseguir se matar. Cainitas afetados pelo Lamento não são levados ao suicídio, mas caem em torpor imediatamente. Mesmo que o alvo tenha êxito na rolagem de Força de Vontade, ele se livra dos impulsos suicidas, mas sua parada de dados para todas as ações é reduzida em dois pelo restante da cena. Se uma vítima que falhou na rolagem de Força de Vontade não tiver conseguido se matar até o fim da cena, os efeitos do Lamento se dissipam, mas sua parada de dados para todas as ações fica reduzida em dois até o nascer do sol seguinte.]==],
				},
				["The Revelations of Duat"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 61


The Revelations of Duat


• Vista do Chacal
Sistema: Sucessos adicionais permitem maior percepção da força, da forma e da história do fantasma. O poder dura o restante da cena. Fantasmas percebem o feiticeiro numa falha crítica e, conforme seu temperamento, podem atacar o vampiro. A Vista do Chacal não permite ao feiticeiro se comunicar com os mortos.

•• Pesar as Virtudes
Sistema: Para cada sucesso, um feito diferente — de salvar uma criança das mandíbulas de um crocodilo a assassinar um rival por causa de um amante — surge ao feiticeiro em vívidos detalhes. Numa falha crítica, este poder revela um dos pecados do feiticeiro aos seus companheiros mais confiáveis.

••• Sentinela do Faraó
Sistema: Quando o feiticeiro pratica a Sentinela do Faraó sobre um cadáver morto há uma única noite num lugar que um fantasma assombra, um fragmento da alma do fantasma migra para o cadáver e causa sua reanimação. O feiticeiro precisa ter usado Pesar as Virtudes antes, para identificar um gancho espiritual com que enredar o espírito. Cada sucesso permite usar o poder sobre um cadáver morto há uma noite a mais.
O édito do feiticeiro precisa ser uma única frase, p. ex. “Você deve guardar esta tumba de todos os intrusos, menos eu”, ou “Você deve seguir este homem até a casa dele e matá-lo lá dentro”. A ambiguidade leva a erros graves. Nos exemplos anteriores, “Você deve guardar esta tumba de todos os intrusos” levaria até o próprio feiticeiro a ser atacado caso tentasse entrar na tumba; e “Você deve seguir este homem até a casa dele e matá-lo” pode levar ao assassinato da vítima num ponto prematuro, em vez de dentro do prédio pretendido.
O cadáver animado permanece ativo permanentemente, sem sucumbir à decomposição.
Uma falha crítica na tentativa da Sentinela do Faraó faz o cadáver se erguer e atacar irracionalmente seu invocador até ser destruído.
Atributos: Força 4, Destreza 3, Vigor 5, Carisma 0, Manipulação 0, Aparência 0, Percepção 1, Inteligência 0, Raciocínio 1
Habilidades: Prontidão 2, Esportes 2, Briga 3, Intimidação 2, Armas Brancas 2, Furtividade 2
Disciplinas: Fortitude 1
Força de Vontade: 5
Vitalidade: 7
Notas: Essas sentinelas costumam ter uma reserva de sete pontos de sangue e se desfazem em pó depois de usá-los. Esse sangue está morto para fins de alimentação, então não pode ser consumido por vampiros.

•••• Imbuir com a Graça de Anúbis
Sistema: Uma sentinela com memória básica dos feitos que a definem age impulsivamente de modos semelhantes aos de sua vida anterior; p. ex. um antigo assassino que cortava a garganta de mercadores sempre matará quaisquer comerciantes que encontrar com ataques ao pescoço, enquanto um padre que auxiliava os pobres terá como alvo as casas dos ricos, incendiando-as e massacrando os moradores. Um único sucesso planta a memória de um feito na mente da sentinela, e cada sucesso adicional dá ao feiticeiro a opção de plantar outro.
O espírito de que o feito é extraído para a criação desta sentinela dotada tem consciência de que suas virtudes ou pecados estão sendo drenados, mas, sem o auxílio do feiticeiro, não pode recuperar a parte que perde para este poder. O feiticeiro precisa gastar um ponto de sangue para devolver o feito ao espírito de que ele se originou, ponto em que a sentinela se torna irracional, mantendo as mesmas estatísticas, mas nenhuma liberdade de pensamento.
A sentinela ataca seu senhor numa rolagem com falha crítica.
Atributos: Força 5, Destreza 4, Vigor 5, Carisma 0, Manipulação 0, Aparência 0, Percepção 2, Inteligência 0, Raciocínio 2
Habilidades: Prontidão 2, Esportes 3, Briga 3, Intimidação 3, Armas Brancas 3, Furtividade 3
Disciplinas: Fortitude 2, Potência 1
Força de Vontade: 7
Vitalidade: 8
Notas: Essas sentinelas costumam ter uma reserva de oito pontos de sangue e se desfazem em pó depois de usá-los. Narradores podem ampliar as estatísticas conforme o feito imbuído no cadáver.

••••• A Feitiçaria da Vida
Sistema: O feiticeiro precisa ter dado os passos necessários de Imbuir com a Graça de Anúbis e manter sob seu jugo um cadáver animado que carregue o fogo de feitos movidos por emoção. Cada sucesso se converte em pontos que o feiticeiro pode atribuir aos Atributos ou Disciplinas da sentinela. Quaisquer Disciplinas concedidas à sentinela precisam estar entre as que o feiticeiro possui. A Proto-Múmia Maligna ainda está sujeita aos caprichos do feiticeiro, mas tentará tarefas intrincadas se sua Inteligência for elevada o bastante para permitir a compreensão de ordens complicadas.
Como em Imbuir com a Graça de Anúbis, o espírito colhido para a criação desta Proto-Múmia Maligna tem consciência de que suas virtudes ou pecados estão sendo roubados. O feiticeiro precisa gastar um ponto de sangue para devolver o feito, ponto em que o cadáver se torna uma sentinela irracional, mantendo as mesmas estatísticas, mas nenhuma liberdade de pensamento nem capacidade de usar Disciplinas.
Atributos: Força 6, Destreza 4, Vigor 6, Carisma 1, Manipulação 1, Aparência 0, Percepção 3, Inteligência 1, Raciocínio 2
Habilidades: Prontidão 3, Esportes 3, Briga 3, Intimidação 4, Liderança 1, Armas Brancas 3, Furtividade 3, Sobrevivência 2, Ocultismo 2, Teologia 1
Disciplinas: Fortitude 2, Potência 2
Força de Vontade: 9
Vitalidade: 12
Notas: Estas são as estatísticas padrão da Proto-Múmia Maligna, antes de os sucessos adicionais serem traduzidos em pontos adicionais. Esses monstros costumam ter uma reserva de dez pontos de sangue e se desfazem em pó depois de usá-los. Eles podem obter mais sangue comendo a carne de um vampiro ou de um mortal. Narradores podem ampliar as estatísticas conforme o feito imbuído no cadáver. Proto-Múmias Malignas podem absorver todo dano, exceto o agravado.]==],
				},
				["The Revelations of Eden"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 64


The Revelations of Eden


• Remova um ponto de Força de Vontade temporária da vítima e um ponto do valor de Força de Vontade dela.

•• Remova da vítima um ponto de Força de Vontade temporária e um ponto do valor do Caminho dela.

••• Remova da vítima um ponto de Força de Vontade temporária e um ponto do Autocontrole/Instinto dela.

•••• Remova da vítima um ponto de Força de Vontade temporária e escolha o novo Comportamento dela.

••••• Remova da vítima um ponto de Força de Vontade temporária e escolha a nova Natureza dela.]==],
				},
				["The Revelations of Midgard"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 65


The Revelations of Midgard


• Concessão de Escamas
Sistema: A Concessão de Escamas afeta qualquer criatura viva ou carniçal de quem o Cainita tenha se alimentado, não importa a distância. Quando tal cultista sofre dano, a feiticeira pode reflexivamente aplicar sua resistência morta-viva ao corpo do cultista, transferindo o dano para a vampira. A Cainita pode absorver esse dano do modo normal, embora qualquer dano não absorvido pela vampira seja sofrido pelo cultista. O cultista desenvolve escamas no lugar em que teria sofrido o dano. Conforme a localização, isso pode reduzir o valor de Aparência do cultista, embora os Setitas reconheçam a deformidade como uma bênção. Uma falha crítica neste poder permite à vampira absorver o dano, mas a impede de absorvê-lo com dados.

•• Sofrer por Jormungandr
Sistema: Quando uma Cainita instruída em Sofrer por Jörmungandr recebe dano físico, ela pode aplicar esse dano a um servo mortal de quem tenha tomado sangue e a quem tenha dado vitae. O cultista precisa estar ao alcance da vista da feiticeira. Sofrer por Jörmungandr é ativado reflexivamente, a menos que a vampira opte por não usá-lo. Para cada sucesso acumulado além do primeiro, a vampira pode infligir um nível adicional do dano que sofreu ao cultista escolhido. O dano adquirido num único turno não pode ser distribuído entre múltiplos cultistas, e qualquer dano que exceda a trilha de vitalidade do cultista volta à vampira para ser absorvido ou sofrido. A manifestação deste poder reduz o valor de Aparência do cultista gradualmente, a critério do Narrador. Uma falha crítica na rolagem deste poder ainda transfere todo o dano a um cultista, mas cada ponto é convertido em agravado, se já não o for.

••• Engolir a Cauda
Sistema: Este poder é sempre ativado como a última ação de um turno, depois das ações de Celeridade. O sangue ao alcance da vista da vampira desliza até ela, levando um turno para chegar à sua boca e repor pontos de sangue perdidos. Fica a critério do Narrador quantos pontos de sangue há na área ao redor, mas cada sucesso rolado permite a um ponto de sangue rastejar até a feiticeira. Numa falha crítica, o poder força a vampira a regurgitar dez pontos de sangue menos o valor de seu Caminho. Este poder não pode ser usado para drenar sangue de um recipiente vivo ou morto-vivo.

•••• Ciclo da Serpente de Midgard
Sistema: Um Setita que use este poder pode conceder pontos em Disciplinas a um carniçal que tenha consumido ao menos um ponto de seu sangue. O número de pontos de Disciplina concedidos é igual ao número de sucessos rolados. O poder dura até o próximo pôr do sol. Alguns poderes são perigosos ou mesmo autodestrutivos se um mortal os usar. O Narrador tem a palavra final sobre se um carniçal pode usar uma dada Disciplina.
Para efeito de Disciplinas que exigem o gasto de pontos de sangue para ativar, o carniçal possui um número de pontos de sangue igual aos consumidos do senhor na noite em que o poder é ativado. Uma falha crítica nesta rolagem resulta no carniçal ganhando os pontos em Disciplinas até o próximo pôr do sol, mas o laço de sangue com seu domitor se rompe. O rompimento desse laço não é percebido pelo vampiro.

••••• Transformação de Apep
Sistema: Este poder só afeta um cultista mortal ou carniçal que tenha bebido o sangue do vampiro feiticeiro. Numa rolagem bem-sucedida, o corpo do cultista passa dez turnos — menos o número de sucessos rolados — se contorcendo e se transformando numa serpente sem membros, com braços e pernas se desprendendo como um amálgama de pele morta, tecido e osso. O cultista de Apep incha até uma forma de serpente com o tamanho aproximado de um cavalo de guerra. Ele não pode falar, mas compreende a língua de seu criador. A mudança em cultista de Apep é permanente. A serpente permanece leal ao vampiro como carniçal bestial, ainda exigindo doses regulares de vitae. Quaisquer poderes das Revelações de Midgard usáveis em seguidores continuam usáveis no cultista de Apep. Uma falha crítica na rolagem para executar este poder mata o cultista e provoca um teste de frenesi na feiticeira, já que ela se depara com um fracasso humilhante de fé.
O cultista de Apep tem as seguintes estatísticas:
Atributos: Força 5, Destreza 5, Vigor 4, Carisma 3, Manipulação 1, Aparência 1, Percepção 3, Inteligência 2, Raciocínio 3
Habilidades: Prontidão 4, Esportes 4, Briga 5, Intimidação 5, Performance 3, Furtividade 4, Sobrevivência 3, Teologia 3
Disciplinas: Fortitude 1, Potência 2, Presença 2
Força de Vontade: 9
Vitalidade: 15, sem penalidades por ferimento
Notas: O cultista de Apep costuma ter uma reserva de dez pontos de sangue e mergulha num estado torpente sem sangue. Eles podem obter mais sangue bebendo de uma vítima. Cultistas de Apep podem absorver todo dano, exceto o agravado. Seu ataque de mordida usa oito dados (Força + 3).]==],
				},
				["The Taking of the Spirit"] = {
					pt = [==[Rites of Blood, pág. 170


The Taking of the Spirit


• Retorno de 3 pontos de Força de Vontade por dia de descanso

•• Retorno de 2 pontos de Força de Vontade por dia de descanso

••• Retorno de 1 ponto de Força de Vontade por dia de descanso

•••• Retorno de 1 ponto de Força de Vontade por semana de descanso

••••• Retorno de 1 ponto de Força de Vontade a cada duas semanas de descanso]==],
				},
				["The Transylvanian Kraina"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 275


The Transylvanian Kraina


• Trono de Burebista
Sistema: O koldun gasta um ponto de sangue e faz a rolagem de ativação (Atributo: Percepção). Se estiver no alto de qualquer montanha dos Cárpatos, não há necessidade de gastar sangue. Com sucesso, o koldun pode lançar seus sentidos ao alto pelos ares, ou estendê-los para além do corpo; quão longe depende de quantos sucessos forem rolados (ver abaixo). Este efeito dura até o koldun recolher seus sentidos ou até o fim da cena, o que vier primeiro.
1 sucesso — Raio de 50 metros
2 sucessos — Raio de 100 metros
3 sucessos — Raio de 500 metros
4 sucessos — Raio de 1,5 quilômetro
5 sucessos — Raio de dez quilômetros

•• Hospitalidade de Pietrosu
Sistema: O koldun precisa lançar o sangue exigido ao ar (a menos que esteja à vista dos Cárpatos, caso em que nenhum gasto de sangue é necessário) e fazer a rolagem de ativação (Atributo: Destreza). Se obtiver sucesso, um vento poderoso e gélido se ergue ao redor do koldun por um número de turnos igual aos sucessos rolados. Esse vento causa um nível de dano contusivo por turno e entorpece o corpo de qualquer um, exceto o koldun, apanhado dentro dele, reduzindo o deslocamento à metade e as paradas de Destreza em dois. No turno seguinte ao término deste poder, a penalidade de Destreza cai para um e o deslocamento fica em três quartos, e no turno depois desse a vítima recupera Destreza e mobilidade plenas. Um efeito colateral útil deste poder é que o koldun fica imune ao frio e à força do vento enquanto ele estiver ativo; ao cruzar montanhas ou outros ambientes onde o vento seja um risco, basta ativar a Hospitalidade de Pietrosu para se proteger do perigo.

••• As Margens do Bâsca
Sistema: O koldun libera seu sangue em água corrente — um rio ou riacho é o mais comum, embora um córrego ou mesmo apenas o degelo da neve seja o bastante — e rola para ativar este poder (Atributo: Força). Com sucesso, o sangue reforça o fluxo, fazendo-o inchar e avançar, uma enxurrada dotada de vida mágica. Qualquer pessoa, bem como quase qualquer coisa não fixada ao chão, apanhada em seu caminho será arrastada rumo ao ponto de menor elevação a uma taxa de cem metros por turno, e precisa absorver cinco dados de dano contusivo por turno. Qualquer sujeito de algum modo impedido de ser levado correnteza abaixo — preso contra uma parede ou outro objeto imóvel, por exemplo — sofre o dobro do dano normal. Além disso, mortais precisam fazer uma rolagem de natação (dificuldade 8) a cada turno para evitar engolir grandes goles de água; a falha inflige um nível adicional de dano letal que não pode ser absorvido. Essas águas revoltas duram um número de turnos igual aos sucessos rolados para ativar o poder, ou o dobro desse número se a fonte da enchente for qualquer rio dos Cárpatos.

•••• Exalação de Kupala
Sistema: O koldun gasta sangue, ao menos um ponto mas quanto quiser, e rola para ativar este poder (Atributo: Vigor). Uma vez por turno, por um número de turnos igual aos sucessos rolados, até o limite de quanto sangue foi gasto, ela pode fazer os gases sob o solo irromperem para cima, formando uma cratera vulcânica minúscula. Esses gases são de um frio cortante; qualquer um apanhado num raio de três metros do cone está sujeito ao mesmo dano e às mesmas penalidades da Hospitalidade de Pietrosu. Pior ainda, o gás borbulhante é altamente inflamável; qualquer chama próxima acende o gás numa explosão terrível, infligindo cinco dados de dano letal (agravado para vampiros) a todos ao alcance do cone. Se este poder for ativado dentro da bacia de Berca, cada ponto de sangue gasto conta em dobro.

••••• Medias Inquieta
Sistema: O koldun gasta um ponto de Força de Vontade além do ponto de sangue e da rolagem de ativação de sempre (Atributo: Força). Se usado à vista dos Cárpatos, nenhum gasto de ponto de sangue é necessário. Cada sucesso permite ao koldun ou afetar uma área maior (ver abaixo) ou prolongar a duração do terremoto. Qualquer um e qualquer coisa apanhados no alcance do abalo estão sujeitos a dez dados de dano letal a cada turno em que permaneçam em sua área de efeito, e precisam fazer uma rolagem de Destreza + Esportes (dificuldade 8) ou serão derrubados. A maioria das casas e estruturas simples desaba depois de um ou dois turnos; estruturas de construção mais robusta, como castelos, permanecem de pé quatro ou cinco turnos antes de serem totalmente destruídas.
1 sucesso — Uma casa ou uma construção pequena
2 sucessos — Várias construções, até cinco
3 sucessos — Uma rua inteira de um povoado ou vilarejo
4 sucessos — Uma estrutura grande, como um castelo
5 sucessos — Um vilarejo inteiro, ou uma parte de uma cidade]==],
				},
				["The Way of Earth"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 448


The Way of Earth


• Solo Agarrador
Sistema: O koldun pode dirigir qualquer trecho de terra num raio de 30 metros para prender um alvo por dois turnos por sucesso rolado. O barro animado sobe e comprime na metade entre os joelhos e os quadris da vítima, mantendo-a presa a menos que o jogador dela obtenha cinco sucessos numa rolagem de Força + Sobrevivência (dificuldade 6). Também é possível usar este poder como ataque, caso em que a terra agarra, esmaga uma vez e solta. Usado assim, cada sucesso na conjuração inflige um nível de dano letal. Tal dano se manifesta como pernas quebradas e pés esmagados.

•• Resistência da Pedra
Sistema: Uma rolagem de ativação bem-sucedida concede ao koldun dois pontos extras de Vigor pelo resto da cena. Esses pontos são considerados parte do Vigor natural do personagem e podem auxiliar em qualquer uso daquele Atributo, inclusive absorção.

••• Terra Faminta
Sistema: Como em Solo Agarrador, cada sucesso na rolagem de ativação deixa a vítima imóvel por um turno. Porém, a dificuldade da rolagem de Força + Sobrevivência para se libertar sobe para 8 e ainda exige cinco sucessos. Como a terra continua a se mover e agarrar enquanto o poder durar, essa rolagem precisa ser feita como uma tentativa única (embora repetível), não como um teste prolongado. Além disso, seres presos no fosso esmagador sofrem um nível de dano letal por turno. Seres capazes de absorver esse dano podem fazê-lo, mas com dificuldade 7. Ao fim da duração do poder, a terra se escancara mais uma vez para soltar a vítima.

•••• Raiz da Vitalidade
Sistema: O jogador gasta quantos pontos de sangue quiser (o que pode exigir múltiplos turnos, conforme a Geração) e faz a rolagem de ativação. Cada sucesso permite à terra curar dois níveis de dano contusivo ou um nível de dano letal. Curar dano agravado exige dois sucessos por nível. O total de níveis de vitalidade que podem ser restaurados a cada uso deste poder é o número de pontos de sangue investidos ou o número de sucessos na rolagem de ativação, o que for menor. Qualquer ponto de sangue gasto além do número de sucessos escoa sem efeito. O processo de cura em si leva um turno por nível contusivo, um minuto por nível letal e uma hora por nível agravado. Assim que a cura termina ou o poder é interrompido por escavação determinada, a terra expele o alvo de volta à superfície.

••••• Fúria de Kupala
Sistema: Este poder exige um ponto de Força de Vontade além do custo e da rolagem de ativação de sempre. O koldun golpeia a terra com o punho, e sua ira flui pelo solo até qualquer alvo em sua linha de visão. O terremoto irrompe para fora daquele ponto, infligindo 10 dados de dano letal a tudo e a todos na área de efeito. A maioria das estruturas de madeira desaba por inteiro, e mesmo prédios de concreto e aço podem ficar rachados e marcados com dano superficial pelo tremor. O abalo dura um turno e afeta uma área determinada pelo número de sucessos rolados. Não é possível aplicar menos sucessos do que os rolados.
1 sucesso — Uma casa ou uma loja isolada
2 sucessos — Cinco estruturas menores ou um pequeno quarteirão
3 sucessos — Uma rua lateral inteira ou um quarteirão grande
4 sucessos — Vários quarteirões ou uma estrutura grande (como um estádio)
5 sucessos — Um bairro inteiro ou um complexo industrial imenso]==],
				},
				["The Way of Fire"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 452


The Way of Fire


• Coragem Ígnea
Sistema: Uma vez aprendido, este poder é permanente e não exige rolagem de ativação nem sangue. O koldun subtrai seu nível na Via do Fogo da dificuldade das rolagens de Coragem para resistir ao Rötschreck causado por exposição ou proximidade a chamas. Este poder não ajuda a resistir ao pânico que acompanha a luz do sol nem a qualquer outra causa além do fogo propriamente dito. Se isso reduzir a dificuldade de uma rolagem de Coragem abaixo de dois, o koldun simplesmente não sucumbe ao Medo Vermelho. Koldun nunca correm risco de Rötschreck por fogo e magma que eles mesmos conjuram.

•• Combustão
Sistema: Para cada sucesso na rolagem de ativação, o alvo sofre um nível de dano agravado. Este ataque pode ser esquivado, mas não bloqueado, e pode afetar seres vivos (ou mortos-vivos) com +2 de dificuldade. Só é possível fazer um ataque ígneo por turno.

••• Muralha de Magma
Sistema: A muralha de magma invocada com este poder tem duração de dois turnos por sucesso rolado. Se o koldun quiser liberar o magma numa forma diferente do círculo protetor, aumente a dificuldade base em um. Personagens não conseguem se aproximar de uma muralha de rocha derretida sem uma rolagem de Coragem (dificuldade 8), e mesmo assim o calor escaldante de perto inflige um nível de dano agravado. O contato efetivo com a lava eleva o dano a três níveis e sobe a dificuldade de absorção para 9, supondo que algum tipo de absorção seja possível. O koldun não sofre dano pela proximidade do magma invocado (embora o contato com ele ainda o fira normalmente).

•••• Onda de Calor
Sistema: Numa rolagem de ativação bem-sucedida, a vítima sofre cinco níveis de dano letal, que podem ser absorvidos por seres capazes disso. Alvos vampiros também perdem cinco pontos de sangue, independentemente do dano infligido.

••••• Explosão Vulcânica
Sistema: Este poder custa um ponto de Força de Vontade além de um ponto de sangue. Para cada sucesso na rolagem de ativação, a explosão inicial de lava dura um turno. Os rios de rocha líquida ardente então fluem lentamente pelo dobro dessa duração antes de esfriar e endurecer de repente. Mesmo que um objeto sobreviva ao calor, ele agora fica preso sob a rocha. Qualquer coisa que entre em contato com a lava (inclusive o koldun) sofre no mínimo três níveis de dano agravado. Para objetos que não têm níveis de vitalidade, o Narrador precisa decidir quantos turnos eles duram antes de derreter ou irromper em seu próprio inferno. Uma falha crítica neste poder abre o gêiser de lava sob um alvo não pretendido, possivelmente o próprio koldun.]==],
				},
				["The Way of Sorrows"] = {
					pt = [==[Rites of Blood, pág. 157


The Way of Sorrows


• As Frustrações de Nestrecha
Sistema: Por um turno por sucesso, o alvo não pode gastar Força de Vontade para nenhuma finalidade.

•• Os Insultos de Krivda
Sistema: Em resposta ao insulto, o alvo precisa rolar imediatamente Autocontrole para resistir ao frenesi contra uma dificuldade de 5 + o número de sucessos na rolagem de ativação, dificuldade máxima 9.

••• O Pranto de Kruchina
Sistema: Por um turno por sucesso, o alvo é dominado por uma tristeza intensa e chora incontrolavelmente. Ele não pode se envolver em nenhuma ação que exija concentração, e um Membro perde um ponto de sangue a cada turno enquanto a vitae escorre de seus olhos.

•••• O Infortúnio de Chernogolov
Sistema: O alvo perde automaticamente dois sucessos em toda rolagem que tentar. O efeito dura por um número de rolagens consecutivas igual aos sucessos rolados.

••••• A Inanição de Marena
Sistema: Para cada sucesso, o alvo sofre dois níveis de dano contusivo que podem ser absorvidos normalmente. Além disso, um vampiro alvejado por este poder perde um ponto de sangue por sucesso.]==],
				},
				["The Way of Water"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 450


The Way of Water


• Poça de Mentiras
Sistema: Com uma rolagem de ativação bem-sucedida, o koldun pode projetar uma ilusão sobre qualquer superfície de água em sua linha de visão. A ilusão pode falar e se mover como o vampiro quiser, embora não tenha substância e não possa sair dos limites da água. O fantasma dura um turno por sucesso rolado, após o que se dissipa lentamente numa névoa fina. É possível estender essa duração com ativações subsequentes do poder, que se acumulam na determinação da duração final. Rolagens para estender a duração de uma ilusão somam um à dificuldade base, mas não exigem sangue. Uma vez que a ilusão se desfaz, ela precisa ser conjurada de novo.

•• Refúgio Aquático
Sistema: Este poder não exige sangue. Se o jogador obtiver dois ou mais sucessos na rolagem de ativação, o vampiro afunda na água conforme o poder de Metamorfose Fusão com a Terra. Um corpo d’água precisa ter ao menos sessenta centímetros de profundidade e ser tão grande nas outras dimensões quanto o corpo do vampiro para contê-lo. Vislumbrar um koldun oculto na água exige uma rolagem bem-sucedida de Percepção + Prontidão (dificuldade 8).

••• Névoa Sobre o Mar
Sistema: Para cada sucesso na rolagem de ativação, o koldun pode andar sobre a água por uma cena ou uma hora, o que for mais longo. O koldun pode optar por abandonar os efeitos deste poder para submergir ou nadar; porém, o vampiro não pode voltar a andar sobre a água a menos que reative o poder.

•••• Lacaios das Profundezas
Sistema: O jogador gasta um ponto de Força de Vontade e faz a rolagem de ativação padrão. Com sucesso, o jogador pode gastar sangue para invocar lacaios elementais. Esse sangue precisa ser pingado ou lançado num corpo d’água, o que pode exigir múltiplos turnos conforme os limites de gasto de sangue por Geração.
Assim que a última gota de sangue cai, a água se ergue na forma que o koldun desejar. O conjurador pode criar tantos lacaios quantos forem os pontos de sangue gastos, mas nunca mais do que o total de sucessos rolados. Independentemente da forma, os espíritos têm valor igual ao Raciocínio do vampiro em todos os Traços. Esses seres não têm Conhecimentos e nenhuma Perícia além de Furtividade. Além disso, seus Atributos Mentais e Sociais são considerados como valor 1, exceto em situações passivas ou defensivas (como resistir a persuasão ou controle mental).
Elementais de água absorvem e sofrem dano como vampiros, inclusive de luz solar. O fogo os fere menos, infligindo apenas dano contusivo. Ademais, as criaturas aquosas podem extinguir chamas com seus corpos líquidos, embora não sem sofrer ferimento. Um elemental que deixa o corpo d’água que o gerou sofre um nível de dano agravado por hora. Lacaios regeneram um nível de dano de qualquer tipo (inclusive agravado) a cada turno em que permaneçam em contato com um grande corpo d’água, mas fora isso não se curam. A menos que sejam destruídos, lacaios invocados duram até o amanhecer seguinte, quando desabam em poças inanimadas.

••••• Maré da Perdição
Sistema: O jogador gasta um ponto de Força de Vontade além do sangue de sempre. Para cada sucesso na rolagem de ativação, o redemoinho resultante tem raio de 1,5 metro, centrado em qualquer ponto da linha de visão do vampiro. Redemoinhos têm Força base 15, aumentando em 5 pontos por sucesso após o primeiro. Vítimas precisam se opor com êxito a essa Força usando a própria Força + Sobrevivência (dificuldade 8) para se libertar. As que falham são sugadas às profundezas e golpeadas por correntes esmagadoras. Seres vivos se afogam normalmente, enquanto vampiros e outras criaturas que não respiram simplesmente ficam presos, impotentes, no vórtice. Este poder dura uma cena.]==],
				},
				["The Way of Wind"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 449


The Way of Wind


• Sopro de Sussurros
Sistema: Toda vez que o koldun quiser enviar uma nova mensagem por este poder, seu jogador faz a rolagem de ativação de sempre. Porém, o jogador só precisa gastar sangue na primeira vez em que o poder é usado numa dada cena. Cada sucesso permite um turno de fala. Depois que o vampiro conclui a mensagem, ventos velozes a levam ao destino. Em até um minuto, o alvo ouve o koldun como se o vampiro sussurrasse em seu ouvido. Ele pode responder ou permanecer calado, mas tudo o que disser dentro de um número de turnos igual aos sucessos do koldun voa de volta ao koldun. Este poder pode levar palavras a qualquer um a até um quilômetro e meio que não esteja num cômodo vedado. Ao usar este poder, o koldun precisa se concentrar plenamente. Qualquer perturbação rompe a comunicação.

•• Vendaval Cortante
Sistema: Com uma rolagem de ativação bem-sucedida, o koldun invoca um vento congelante num raio máximo de 100 metros. Qualquer um apanhado nessa rajada gélida sofre um dado de dano contusivo por turno (que pode ser absorvido normalmente), perde dois dados de todas as paradas de Destreza e se move à metade da velocidade normal. Os ventos duram enquanto o koldun quiser, desde que ele mantenha a concentração. Qualquer ação não reflexiva por parte do vampiro faz os ventos cessarem e se dissiparem. Isso inclui qualquer movimento.

••• Brisa da Letargia
Sistema: Por dois turnos por sucesso, o koldun cria um vento que inflige letargia extrema num raio de 60 metros. Jogadores de personagens apanhados nesse vento precisam rolar Vigor + Sobrevivência (dificuldade 8). Essa rolagem é feita uma vez a cada dez minutos de exposição. A falha significa que o personagem reduz à metade todas as paradas de dados que envolvam ações físicas pelo restante da duração do vento e reduz à metade todos os deslocamentos pela cena. Uma falha crítica faz o personagem adormecer (ou entrar em torpor leve, no caso de vampiros) pela cena. Personagens adormecidos acordam se cutucados, sacudidos ou de outro modo manuseados, embora se movam devagar e possam sofrer paradas de dados reduzidas à metade se o vento persistir.

•••• Cavalgar a Tempestade
Sistema: Com uma rolagem de ativação bem-sucedida, o koldun se dissolve no vento e voa a 400 km/h até seu destino. Este poder não funciona de modo eficaz em cavernas, prédios ou outras áreas fechadas. Ao ar livre, o voo do vampiro contorna todos os obstáculos. Assim que o koldun chega ao destino ou a cena termina, o vampiro desce à terra e se solidifica.

••••• Tempestade
Sistema: Com uma rolagem de ativação bem-sucedida e um ponto de Força de Vontade (além do sangue de sempre), o koldun pode conjurar uma tempestade terrível. Levam-se seis horas para as nuvens se juntarem e adensarem no alto, menos uma hora para cada sucesso rolado. Se isso resultar numa duração inferior a uma hora, as nuvens desabrocham para fora direto de cima como um dossel negro, enchendo o céu em meros minutos. Assim que as nuvens se formam, a chuva começa a cair em torrentes e os relâmpagos começam. A tempestade persiste em plena força por uma hora por sucesso rolado. Ela se dissipa gradualmente ao longo da hora seguinte. No auge de sua fúria, a tempestade pode causar enchentes e certamente gela até os ossos qualquer mortal exposto (1 dado de dano contusivo inabsorvível a cada cinco minutos de exposição plena). Raios caem com regularidade, muito mais do que numa tempestade comum. De fato, ao custo de um ponto de Força de Vontade, o koldun pode dirigir um raio contra um inimigo usando Percepção + Ocultismo (dificuldade 6). Um golpe bem-sucedido inflige 10 dados de dano letal (que podem ser absorvidos normalmente). Só um ataque desses pode ser feito por turno.]==],
				},
				["The Way of the Spirit"] = {
					pt = [==[Rites of Blood, pág. 156


The Way of the Spirit


• O koldun consegue perceber tudo num raio de 20 metros.

•• ... num raio de 100 metros.

••• ... num raio de meio quilômetro.

•••• ... num raio de 1,5 quilômetro.

••••• ... num raio de oito quilômetros.
Sistema: O número de sucessos na rolagem de ativação determina por quantas cenas sucessivas o efeito dura. Se ativado antes de o sol nascer, a consciência do koldun pode se estender pelas horas de luz, e o koldun não sofre efeitos negativos por monitorar suas terras durante o dia. Ele ainda sofre as penalidades usuais de dados por realizar quaisquer outras ações durante o dia.]==],
				},
				["Ushabti"] = {
					pt = [==[Rites of Blood, pág. 163


Ushabti


• Trabalhador
O ushabti pode ser um humano ou um animal. É irracional e obedece a todas as ordens de seu senhor. Tem dois pontos em cada Atributo Físico, um ponto em cada Atributo Mental e nenhum ponto em Atributo Social. Não tem Habilidades.

•• Servidor
Ao Trabalhador, some três pontos adicionais de Atributo. Nenhum pode ser aplicado a Atributo Social, e nenhum Atributo Mental pode subir acima de 2. Some dois pontos de Habilidades não combativas.

••• Guarda
Ao Trabalhador, some seis pontos de Atributos e quatro pontos de Habilidades. Guardas podem ter Atributos Sociais, mas nenhum Atributo Social ou Mental pode exceder 2, nem qualquer Habilidade.

•••• Supervisor
Ao Trabalhador, some nove pontos de Atributos e seis pontos de Habilidades; nenhum Atributo Social ou Mental pode exceder 3, nem qualquer Habilidade.

••••• Dom de Khnum
A expressão máxima desta arte, o Dom de Khnum (o lendário criador da humanidade segundo a tradição egípcia) permite ao feiticeiro criar o que é, na prática, um corpo vivo, seja como escravo obediente, seja como recipiente pronto para um espectro ou espírito. A personagem que ativa o ushabti decide qual, embora a segunda opção exija que ela tenha à mão um espectro ou espírito complacente.
Ao Trabalhador básico, some 12 pontos de Atributos e oito pontos de Habilidades. O ushabti ganha as Virtudes, a Humanidade e a Força de Vontade de um vampiro iniciante. Ele é senciente, mas emocionalmente ligado a quem o ativa como se por laço de sangue. Isso vale mesmo se um espírito ou espectro o possuir. Cada uso do Dom de Khnum custa dois pontos de Força de Vontade no momento da ativação, e o jogador pode gastar pontos adicionais de Força de Vontade para obter sucessos automáticos na rolagem de ativação. Um ushabti criado com esta Trilha não se degrada, a menos que alguém conteste ativamente sua identidade e o convença de que ele não é real. Na ausência de prova de sua própria irrealidade, o ushabti é efetivamente imortal.]==],
				},
				["Vitreous Path"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 174


Vitreous Path


• Olhos dos Mortos
Sistema: O jogador rola Percepção + Ocultismo, dificuldade 6. Um sucesso permite ao necromante determinar se alguém está ferido, doente ou morrendo, bem como se o indivíduo padece sob algum tipo de maldição ou magia maligna.
Além disso, o vampiro pode adivinhar o falecimento futuro do alvo, conforme os sucessos obtidos. Um sucesso significa que o personagem consegue estimar quanto tempo de vida o alvo tem, com margem de algumas semanas. Três sucessos significam que o personagem consegue estimar quanto tempo de vida o alvo tem e qual será a provável origem da morte, pois as marcas entrópicas mostram os ferimentos que um dia existirão naquela pessoa. Cinco sucessos significam que o personagem consegue de fato ver onde e quando o evento ocorrerá, interpretando as marcas negras na alma do alvo.
Esta capacidade dura uma cena, embora o necromante possa optar por encerrar o poder antes. Ela só pode ser usada para ler o destino de um alvo por vez. Narradores devem exercer bom senso com este poder, já que as marcas da morte costumam ser inevitáveis. Ele pode decidir rolar os dados por conta própria, de modo que a jogadora não tenha como saber se sua intuição está correta.

•• Aura de Decadência
Sistema: Nenhuma rolagem é exigida, mas este poder custa ao menos um ponto de sangue. Objetos submetidos a esta Aura de Decadência se decompõem e se tornam inúteis depois de alvejados. Como o objeto cede, bem como o mecanismo exato da falha, cabe ao Narrador. Corrosão, fadiga de metal ou pura fragilidade são todas igualmente plausíveis para a ruína de um dado item, mas o efeito em jogo de usar um item condenado é como se o personagem dono dele tivesse rolado uma falha crítica. A velocidade com que o item se decompõe depende de quantos pontos de sangue são gastos.
Um ponto de sangue — Uma semana
Dois pontos de sangue — Um dia
Três pontos de sangue — Fim da cena
Quatro pontos de sangue — Cinco turnos
Cinco pontos de sangue — Um turno
Note que, como este poder exige o gasto de pontos de sangue, o personagem não pode causar uma Aura de Decadência enquanto estiver estacado.

••• Banquete de Almas
Sistema: O jogador gasta um ponto de Força de Vontade para permitir ao vampiro se alimentar das energias negativas dos mortos. Se a personagem estiver extraindo as energias da atmosfera, ela precisa estar num lugar onde tenha ocorrido uma morte na última hora ou num lugar onde a morte seja comum, como um cemitério, um necrotério ou a cena de um assassinato recente. Em geral, o necromante consegue extrair de um a quatro pontos de entropia de tal local, embora a dificuldade para usar toda Necromancia e poderes mortíferos semelhantes dentro daquela área aumente em valor igual por um número de noites igual aos pontos tomados. As energias de tal área só podem ser drenadas uma vez, até que a entropia do lugar se reponha.
Nos casos em que o necromante se alimenta de um fantasma, o vampiro precisa de fato atacar o espectro como se estivesse se alimentando normalmente. Espectros têm até 10 “pontos de sangue” que podem lhes ser tomados, e eles ficam cada vez menos substanciais à medida que sua essência espiritual escoa. A personagem fica vulnerável a qualquer ataque que o fantasma possa fazer, mesmo aqueles que normalmente não afetam o mundo físico; enquanto se alimenta, o vampiro está essencialmente num meio-estado, existindo ao mesmo tempo nas terras dos vivos e no Mundo Inferior. O espectro assim atacado é considerado imobilizado e não pode correr nem escapar, a menos que consiga derrotar o vampiro numa rolagem resistida de Força de Vontade (dificuldade 6 para ambos os lados). Este poder também pode ser usado em conjunto com a Necromancia da Trilha das Cinzas, permitindo ao vampiro drenar poder (embora não sustento) de fantasmas enquanto viaja pelas terras dos mortos.
Essa energia de alma pode ser usada exatamente como sangue em todos os aspectos, exceto quando o vampiro se ergue para a noite. Ela pode ativar Disciplinas, curar ferimentos, elevar Atributos etc. Uma falha crítica neste poder deixa o vampiro incapaz de se alimentar através da Mortalha pelo resto da noite. Porém, ele permanece suscetível aos assaltos de fantasmas e espíritos por vários turnos (em geral, um número de turnos igual à quantidade de energia que poderia ter sido extraída da área, ou um turno se estivesse atacando um fantasma) enquanto paira entre os mundos, incapaz de funcionar de modo eficaz em qualquer um deles.

•••• Sopro de Thanatos
Sistema: O jogador gasta um ponto de sangue e rola Força de Vontade (dificuldade 8). Só um sucesso é necessário para extrair o Sopro de Thanatos. Se dispersadas para invocar Espectros, as energias cobrem cerca de 400 metros de raio, centradas no necromante. O alcance aumenta em mais 400 metros para cada ponto de sangue adicional gasto.
Espectros invocados por este poder ignoram o necromante invocador pela duração do poder, a menos que sejam provocados, mas podem muito bem fazer questão de causar estrago em qualquer outra pessoa nas redondezas. O necromante pode então usar outros poderes de Necromancia (como os da Trilha do Sepulcro) para manipular e afetar esses Espectros. Fantasmas assim alvejados podem então interagir com o necromante normalmente, embora os demais Espectros da área continuem a ignorar tanto o vampiro quanto o fantasma alvejado. Essa energia se dispersa depois de uma cena, após a qual os Espectros partem em busca de nova presa. As regras de Espectros estão na p. 385.
Se a nuvem for dirigida a um alvo específico, o necromante precisa ou tocar o alvo ou dirigir o jato de entropia usando Destreza + Ocultismo (dificuldade 7). Um alvo carregado de entropia sofre um (e apenas um) nível de dano agravado; isso em geral se manifesta como doença ou decomposição súbita. As dificuldades sociais do alvo ao interagir com quem não está familiarizado com o toque da morte — a maioria dos humanos normais, bem como algumas criaturas sobrenaturais — aumentam em 2. Além disso, percepções sobrenaturais indicam que o alvo está maculado de decadência, o que pode ser perigoso. Essa forma de mácula dura até o nascer do sol; uma vítima já assolada por este poder não pode ser afetada de novo até que a névoa de entropia anterior tenha se dispersado.
Uma falha crítica na rolagem para controlar este poder indica que o vampiro voltou a energia contra si mesmo e sofre todos os efeitos do sopro vitriólico. Isso inflige o ferimento de sempre e pode sujeitar o necromante à atenção possivelmente perigosa de Espectros provocados e outras criaturas de além-túmulo.

••••• Grito Noturno
Sistema: O vampiro escolhe um número de alvos dentro de um metro por ponto de Necromancia e invoca o Grito Noturno com um berro terrível. O jogador gasta um ponto de Força de Vontade e um ponto de sangue para cada alvo além do primeiro. (Ou seja, ele não gasta sangue se for atrás de um único alvo, ou um de sangue para dois alvos. Os limites de sangue por Geração se aplicam, e o vampiro não pode “pré-gastar” sangue antes de usar o Grito Noturno.)
O jogador então escolhe se o vampiro vai auxiliar ou ferir os alvos, e rola Manipulação + Ocultismo (dificuldade 6). Se escolher auxiliar o alvo ou alvos, cada sucesso dá a cada alvo afetado um modificador de -2 de dificuldade a todas as suas ações por um turno por sucesso. Se em vez disso escolher ferir, cada sucesso causa um ferimento agravado a cada alvo. Os alvos podem ser qualquer tipo de criatura viva, inclusive as sobrenaturais.
Não importa o resultado, o Grito Noturno é ouvido dos dois lados da Mortalha, atraindo a atenção de qualquer um por perto. Numa falha crítica, a necromancia pode invocar fantasmas ou Espectros indóceis, semelhante ao Sopro de Thanatos.]==],
				},
				["Weather Control"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 228


Weather Control


• Névoa: A visão fica levemente prejudicada e os sons ficam abafados; um +1 de dificuldade é imposto a todas as rolagens de Percepção que envolvam visão e audição, e o alcance efetivo de todos os ataques à distância cai pela metade.
• Brisa leve: Um +1 de dificuldade é imposto a todas as rolagens de Percepção que envolvam olfato.
• Mudança pequena de temperatura: É possível elevar ou reduzir a temperatura local em até 5 graus Celsius.

•• Chuva ou neve: Como a Névoa, mas as rolagens de Percepção são prejudicadas em grau bem maior; o modificador de dificuldade de todas essas rolagens sobe para +2. Além disso, a dificuldade de todas as rolagens de Condução aumenta em dois.

••• Ventos Fortes: A velocidade do vento sobe a cerca de 50 quilômetros por hora, com rajadas de até o dobro disso. Ataques à distância ficam muito mais difíceis: +1 para ataques com armas de fogo e +2 para armas de arremesso e arco e flecha. Além disso, durante rajadas ferozes, rolagens de Destreza (dificuldade 6) podem ser exigidas para impedir que os personagens sejam derrubados pelos ventos. Quando ventos de força de vendaval estão em ação, papéis saem voando, objetos são apanhados pelo vento e arremessados sem cerimônia, e outros efeitos devidamente cinematográficos são prováveis.
••• Mudança moderada de temperatura: A temperatura local pode ser elevada ou reduzida em até 10 graus Celsius.

•••• Tempestade: Tem os efeitos tanto da Chuva quanto dos Ventos Fortes.

••••• Golpe de Raio: Este ataque inflige 10 dados de dano letal. Armadura corporal não soma à parada de dados do alvo para absorver este ataque.]==],
				},
				-- <<< PATH_DESC_END
};
