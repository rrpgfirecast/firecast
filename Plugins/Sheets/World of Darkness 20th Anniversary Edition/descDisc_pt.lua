-- Discipline descriptions, the [pt] half (SPEC T495, V210).
--
-- descDisc.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [pt] only, descDisc_en.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descDisc_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Discipline descriptions for the Vampire tab (SPEC I21). One entry per canonical picker
-- value, keyed in ENGLISH because that is what the sheet saves (SPEC V24); `pt` is a
-- translation of the same three blocks, source line for source line.
--
-- SPEC I24 / T479-T481: this table used to be an upvalue inside the <script> of HH.12.lfm.
-- The <script> CDATA is copied raw into constructNew_*(), so every open sheet parsed and
-- kept its own copy. As a module it is parsed once and cached in package.loaded, and the
-- require that pulls it lives INSIDE discText (SPEC V198).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24). The generator
-- markers migrated verbatim, so research/rebuild_ritual_desc.sh and the .tsv maps still aim
-- at the same region - only the path of the target changed.

return {
				-- >>> DISC_DESC_BEGIN (generated - SPEC T444)
				["Abombwe"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 189


Abombwe


• Comunhão do Predador
Sistema: Gaste um ponto de sangue. Pelo resto da cena, o Laibon consegue sentir predadores na área, incluindo vampiros, metamorfos, fantasmas, animais predatórios, mortais e carniçais com Caminho 4 ou menos. Para localizar com precisão ou encontrar uma criatura escondida, o jogador rola Percepção + Sobrevivência (dificuldade 6, modificada pela força do predador conforme o Narrador determinar; predadores mais fortes costumam ser mais fáceis de detectar).

•• Invocando o Predador
Sistema: Essa transformação leva um turno e exige um ponto de sangue. O personagem pode fazer crescer garras que causam Força +1 de dano letal ou uma cauda para equilíbrio. A maioria das transformações é automática, mas as particularmente exóticas, como glândulas de veneno, exigem uma rolagem de Inteligência + Sobrevivência (dificuldade 7). Uma falha crítica resulta numa transformação bem-sucedida, mas acrescenta mudanças cosméticas como escamas ou listras. Esse poder não suspende as leis da física; o Laibon não pode criar asas nem teia de aranha forte o bastante para sustentar seu peso.

••• Hibernação Invisível
Sistema: O jogador gasta um ponto de sangue. Hibernação Invisível é automática e leva um turno para se completar. O personagem cai numa consciência um passo acima do torpor durante esse tempo, e seu jogador precisa fazer uma rolagem de Caminho (dificuldade 6) para que o personagem desperte antes da hora.
A dificuldade das rolagens para localizar o personagem aumenta em dois. Indivíduos astrais não conseguem afetá-lo diretamente, encontrando em vez disso uma escuridão contorcida enquanto suas mãos o atravessam.
Violência contra o vampiro submerso o expele do objeto num jato ofuscante (todos perto do vampiro, e o próprio vampiro, ficam com +2 de dificuldade em Percepção naquele turno). O vampiro subtrai dois da sua Iniciativa no primeiro turno após a expulsão, mas pode agir normalmente depois disso.

•••• Poder da Escuridão
Sistema: Esse poder custa dois pontos de sangue e é automático. Uma transformação pode estar ativa por vez, durando uma cena, durante a qual resistir a Rötschreck é +1 de dificuldade.
Exemplos de uso estão listados abaixo, mas jogadores e Narradores são encorajados a criar suas próprias mudanças:
Mãos – Socos causam Força +1 de dano agravado.
Cabeça – Ganhe a capacidade de enxergar perfeitamente na escuridão normal e -2 de dificuldade para enxergar em escuridão sobrenatural. Cuspa uma toxina rolando Destreza + Esportes (dificuldade 7) que paralisa qualquer membro inimigo que toque, a menos que o alvo obtenha sucesso numa rolagem de Vigor (dificuldade 7).
Torso – Faça brotar quatro pernas de aranha, que permitem um ataque adicional como parte de uma ação múltipla no turno. Ações de escalada têm sucesso automático, e tentativas de escapar correndo ficam com -2 de dificuldade.
Pernas – Chutes causam dano agravado. Salte até 10 vezes a distância normal e receba -1 de dificuldade para aterrissar em segurança depois de uma queda ou salto.
Garganta – Emita um rugido primordial. Mortais e carniçais precisam ter sucesso numa rolagem de Coragem (dificuldade 9) ou fogem, enquanto seres sobrenaturais precisam ter sucesso numa rolagem de Coragem (dificuldade 8) ou ficam fracos de terror (todas as paradas de dados reduzidas à metade, arredondando para cima).

••••• Transformação do Predador
Sistema: O jogador gasta um ponto de sangue e rola Vigor + Sobrevivência (dificuldade 7). Se tiver sucesso, o Laibon se transforma fisicamente na criatura. A criatura precisa ser predatória por natureza e ter ao menos o tamanho de um gato. Humanos e seres sobrenaturais podem ser duplicados, mas isso não inclui poderes. Transformação do Predador dura até o nascer do sol ou até o Laibon encerrar o poder.
Um Laibon pode duplicar uma transformação anterior sem consumir outra criatura. Isso exige uma rolagem de Vigor + Sobrevivência (dificuldade 10), com a dificuldade reduzida em um para cada vez que ele matou e se transformou numa criatura daquele tipo, até uma dificuldade mínima de 6. Com mortais, vampiros e outros humanoides, o Laibon assume uma aparência média para o grupo étnico da vítima.]==],
				},
				["Abyss Mysticism"] = {
					pt = [==[Lore of the Clans, pág. 125


Abyss Mysticism


À medida que os Lasombra se aprofundavam nos segredos da Tenebrosidade, descobriram que ela extraía poder de um reino sombrio de sombras chamado Abismo. Místicos do Clã passaram a estudar esse reino secreto para destrancar seus segredos e, por meio disso, desenvolveram a arte do Misticismo do Abismo. Os Lasombra mantêm esse poder em segredo do resto da Sabbat, pois as criaturas que invocam e controlam com ele são tão sombrias quanto misteriosas.

O Misticismo do Abismo é difícil e demorado de aprender, e cobra seu preço. Seus rituais muitas vezes têm efeitos colaterais que criam Defeitos que o personagem não pode remover e que não dão pontos de bônus. Para aprender o poder, um vampiro precisa ter ao menos um ponto tanto em Tenebrosidade quanto em Ocultismo. Ela não pode aprender nenhum ritual do Abismo de nível superior ao menor entre seus valores de Tenebrosidade e Ocultismo, e cada ritual custa um número de pontos de experiência igual a três vezes o nível do ritual.

Rituais do Abismo são conjurados com uma rolagem de Raciocínio + Ocultismo. A dificuldade é 3 + o nível do ritual sendo conjurado. Apenas um sucesso é necessário para conjurar o ritual, mas o Narrador é encorajado a tornar as penalidades do fracasso especialmente horripilantes.

(Mais detalhes sobre o Misticismo do Abismo podem ser encontrados em Rites of Blood, pp. 37-39.)]==],
				},
				["Animalism"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 128


Animalism


• Sussurros Selvagens
Sistema: Nenhuma rolagem é necessária para conversar com um animal, mas o personagem precisa primeiro estabelecer contato visual (ver p. 152). Dar ordens exige uma rolagem de Manipulação + Empatia com Animais. A dificuldade depende da criatura: mamíferos predadores (lobos, gatos, morcegos-vampiros) são dificuldade 6, outros mamíferos e aves de rapina (ratos, corujas) são dificuldade 7, e outras aves e répteis (pombos, cobras) são dificuldade 8. Essa dificuldade é reduzida em um se o personagem falar com o animal na "língua nativa" dele, e pode ser ajustada ainda mais pelas circunstâncias e pela habilidade de interpretação (recomendamos fortemente que toda comunicação entre personagens e animais seja interpretada).
O número de sucessos que o jogador obtém determina o quão fortemente a ordem do personagem afeta o animal. Um sucesso basta para fazer um gato seguir um indivíduo e levar o personagem ao mesmo lugar, três sucessos bastam para fazer um corvo espionar um alvo por semanas, e cinco sucessos garantem que um urso-pardo guarde ferozmente a entrada do refúgio silvestre do personagem por alguns meses.
A Natureza do personagem tem grande papel em como ele aborda essas conversas. O personagem pode tentar intimidar, provocar, bajular ou racionalizar. O jogador deve entender que, nessas situações, ele não interpreta apenas seu personagem, mas a Besta Interior também.
Usar este poder não pode forçar um animal a fazer algo contra sua natureza, nem forçar uma criatura a arriscar a vida. Embora o urso-pardo mencionado acima montasse guarda ao refúgio do vampiro e até lutasse por ele, não o faria contra um número obviamente superior nem contra algo esmagadoramente sobrenatural. Uma ave de rapina poderia ser convencida a fustigar um alvo, mas definitivamente não manteria posição. Um cão dócil ou um gato arisco não teria problema em relatar algo que tivesse visto, mas não entraria em combate a menos que não lhe restasse outra opção — embora provavelmente concordasse em ficar e lutar e então fugisse na primeira oportunidade, se um Membro severo o exigisse.

•• Chamado
Sistema: O jogador rola Carisma + Sobrevivência (dificuldade 6) para determinar a resposta ao chamado do personagem; consulte a tabela abaixo. Só animais que possam ouvir o grito responderão. Se o Narrador decidir que não há animais daquele tipo ao alcance da audição, a convocação fica sem resposta.
O chamado pode ser tão específico quanto o jogador desejar. Um personagem poderia chamar todos os morcegos da área, apenas os morcegos machos por perto, ou apenas o morcego albino de orelha entalhada que ele viu na outra noite.
1 sucesso — Um único animal responde.
2 sucessos — Um quarto dos animais ao alcance da audição responde.
3 sucessos — Metade dos animais responde.
4 sucessos — A maioria dos animais responde.
5 sucessos — Todos os animais respondem.

••• Aplacar a Besta
Sistema: O jogador rola Manipulação + Intimidação se estiver subjugando a Besta pelo medo, ou Manipulação + Empatia se estiver acalmando-a até a complacência. A dificuldade da rolagem é 7 em qualquer dos casos. Esta é uma ação estendida que exige tantos sucessos totais quanto o alvo tiver de Força de Vontade. Um fracasso indica que o jogador precisa recomeçar do início, enquanto uma falha crítica indica que o vampiro não pode afetar a Besta daquele sujeito pelo resto da cena.
Quando a Besta de um mortal é intimidada ou acalmada, ela não pode mais usar nem recuperar Força de Vontade. Ela cessa toda resistência, seja mental ou física. Ela nem sequer se defende se for agredida, embora o Narrador possa permitir uma rolagem de Força de Vontade se a mortal acreditar que sua vida está realmente ameaçada. Para se recuperar deste poder, a jogadora da mortal rola Força de Vontade (dificuldade 6) uma vez por dia até acumular sucessos suficientes para igualar a Força de Vontade do vampiro. Membros não podem ser afetados por este poder.
Embora a Besta de um vampiro não possa ser intimidada com esta habilidade, o Narrador pode permitir que personagens usem a variação "acalmante" deste poder para tirar um vampiro do frenesi. Com três ou mais sucessos, o vampiro em frenesi pode rolar novamente para sair do frenesi, usando a mesma dificuldade do estímulo que causou o frenesi originalmente.

•••• Subsumir o Espírito
Sistema: O jogador rola Manipulação + Empatia com Animais (dificuldade 8) enquanto o personagem olha nos olhos do animal (ver o quadro na p. 152). O número de sucessos permite ao personagem empregar algumas Disciplinas mentais enquanto possui o animal, conforme indicado abaixo.
1 sucesso — Não pode usar Disciplinas.
2 sucessos — Pode usar Auspícios e outros poderes sensoriais.
3 sucessos — Pode usar também Presença e outros poderes de manipulação emocional.
4 sucessos — Pode usar também Demência, Dominação e outros poderes de manipulação mental.
5 sucessos — Pode usar também Quimerismo, Necromancia, Taumaturgia e outros poderes místicos.
Este poder entrelaça a consciência do personagem intimamente com o espírito do animal, a tal ponto que o personagem pode continuar a pensar e sentir como aquele animal mesmo depois de romper a conexão. Esse efeito continua até que o personagem gaste um total de sete noites ou três pontos de Força de Vontade para resistir e finalmente superar a natureza animal. Isso deve ser interpretado, embora o personagem seja afetado em menor grau se o jogador optar por gastar Força de Vontade.
Ao fim de qualquer incidente particularmente empolgante durante a possessão, o jogador rola Raciocínio + Empatia (dificuldade 8) para que o personagem retenha a própria mente. Um fracasso indica que a mente do personagem retorna ao próprio corpo, mas ainda pensa em termos puramente animalescos. Uma falha crítica devolve o personagem ao corpo e também o lança em frenesi.
O personagem pode viajar tão longe do próprio corpo físico quanto quiser enquanto possui o animal. Nesse período, porém, o personagem não retém nenhuma conexão consciente com seu corpo vampírico. O vampiro também pode se aventurar durante o dia, ainda que no corpo do animal. Contudo, o próprio corpo do personagem precisa estar desperto para isso, exigindo uma rolagem bem-sucedida para permanecer acordado (ver p. 262). Se o personagem deixar o corpo do animal (por escolha, se seu corpo adormecer, ou após sofrer ferimento significativo), a consciência do vampiro retorna instantaneamente à sua forma física.
Embora o vampiro não tenha ligação consciente com seu corpo enquanto possui o animal, ele forma um vínculo simpático. Tudo o que o animal sente, o vampiro também experimenta, do prazer à dor. De fato, qualquer dano que o corpo do animal sofra também é aplicado ao corpo do personagem, embora o corpo do Membro possa absorver normalmente. Se o animal morrer antes que a alma do vampiro possa fugir do corpo, o corpo do personagem cai em torpor. Presume-se que isso seja uma resposta simpática ao trauma massivo da morte, mas alguns Membros acreditam que a alma do vampiro fica à deriva durante esse tempo e precisa encontrar o caminho de volta ao corpo.

••••• Extrair a Besta
Sistema: O jogador precisa anunciar o alvo pretendido (já que precisa ser alguém à vista, Extrair a Besta não pode ser usado se o vampiro estiver sozinho) e então rolar Manipulação + Autocontrole/Instinto (dificuldade 8). Consulte a tabela abaixo para os resultados:
1 sucesso — O personagem transfere a Besta, mas a desencadeia sobre um indivíduo aleatório.
2 sucessos — O personagem fica atordoado pelo esforço e não pode agir no turno seguinte, mas transfere a Besta com sucesso. Alternativamente, o personagem pode agir normalmente durante o turno, mas precisa gastar um ponto de Força de Vontade ou sofrer um único nível de dano letal.
3+ sucessos — O personagem transfere a Besta com sucesso.
Se a tentativa fracassar, o próprio personagem entra imediatamente em frenesi. Enquanto o personagem relaxa na expectativa de aliviar seus impulsos selvagens, a Besta aproveita a oportunidade para se enterrar mais fundo. Nesse caso, o frenesi dura o dobro do normal e é duas vezes mais difícil de sacudir; sua severidade também aumenta exponencialmente. Obter uma falha crítica nessa rolagem é ainda mais catastrófico; o frenesi intensificado cresce a tal extremo que nem mesmo gastar Força de Vontade contém sua duração ou seus efeitos. O personagem é vítima indefesa da fúria terrível de sua Besta, e pode muito bem lançar-se numa carnificina selvagem e dilacerante que deixa a Máscara (e os infelizes espectadores por perto) em farrapos.
Se o personagem deixar a presença do alvo antes que o frenesi se esgote, o vampiro perde sua Besta, talvez permanentemente. Embora não esteja mais vulnerável ao frenesi, o personagem não pode usar nem recuperar Força de Vontade e fica cada vez mais letárgico. Para recuperar a Besta, ele precisa encontrar a pessoa que agora a possui (e que provavelmente não está se divertindo nada) e persuadir a Besta a voltar ao seu receptáculo apropriado. A maneira mais eficaz de fazê-lo é comportar-se de modo que faça a Besta querer voltar — no entanto, isso não garante que ela vá desejar fazê-lo. Alternativamente, o personagem pode simplesmente matar o hospedeiro (fazendo assim com que a Besta retorne imediatamente ao vampiro).]==],
				},
				["Assamite Sorcery"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 440


Assamite Sorcery


De um ponto de vista puramente funcional, a magia de sangue que a casta de feiticeiros Assamita pratica difere pouco daquela empunhada pelos Tremere. De uma perspectiva filosófica, porém, mundos de diferença separam as duas. Os Tremere forçam cada fragmento de conhecimento que incorporam para dentro da estrutura rígida e sistemática da alta invocação Hermética. Em contraste, as práticas da casta de feiticeiros são fruto de milênios de adaptação e fusão, e são díspares demais para serem consideradas "estruturadas" em qualquer sentido real. O corpo moderno de conhecimento que é a Feitiçaria Assamita extrai seu conteúdo de um amplo leque de tradições mágicas, dos ritos extáticos dos seguidores de Kali e Shiva à precisão sutil do feng shui, até as elegantes transformações simbólicas e matemáticas dos alquimistas e astrônomos islâmicos.
A Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia mais comum que aparece nas pp. 212-240. Contudo, embora funcionem por princípios semelhantes (o uso de vitae vampírica para alimentar exercícios de vontade consciente a fim de efetuar mudança no mundo físico ou espiritual), as duas não são compatíveis entre si. Um Tremere se esforça para realizar sua magia da mesma maneira, o tempo todo, sempre. Um Assamita pode nunca executar o mesmo ritual exatamente da mesma forma duas vezes num milênio.
Como se pode esperar, estudantes de Feitiçaria Assamita têm grande dificuldade em aprender as práticas de outras tradições de magia de sangue. Todos os custos em pontos de experiência para aprender outras trilhas e rituais de magia de sangue são aumentados pela metade (arredondando para cima) para feiticeiros Assamitas. Além disso, mesmo depois que a feiticeira incorpora essas lições ao seu repertório, elas continuam alheias a ela. Todas as invocações de uma trilha "estrangeira" exigem um ponto de sangue extra, e todos os rituais levam o triplo do tempo normal e exigem um sucesso extra para qualquer resultado desejado.

Os feiticeiros têm ensinamentos equivalentes para muitas técnicas comuns de magia de sangue, além de suas próprias lições exclusivas. A lista a seguir não é uma cobertura exaustiva de tudo o que há na Grande Biblioteca, mas é um ponto de partida para jogadores e Narradores que queiram determinar as capacidades dos feiticeiros Assamitas. Nomes entre parênteses são os nomes que a casta de feiticeiros prefere usar para cada item, quando o nome Assamita difere do comumente aceito. Trilhas marcadas com asterisco costumam ser opções para um feiticeiro Assamita aprender como sua trilha principal, desde que seu instrutor aprove.
Trilhas: The Path of Blood, The Lure of Flames*, Movement of the Mind*, The Path of Conjuring, Hands of Destruction
Rituais: Defense of the Sacred Haven (Curtain of Will), Wake with Evening’s Freshness (Black Sunrise), Communicate with Kindred Sire (Speak with Sire), Deflection of Wooden Doom (Turn the Impaling Shaft), Ward versus Ghouls, Principal Focus of Vitae Infusion (Draught of the Pebble), Incorporeal Passage (Passage of the Ghul), Bone of Lies (Stain of Guilt)]==],
				},
				["Auspex"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 134


Auspex


• Sentidos Aguçados
Sistema: Ativar essa habilidade exige uma ação reflexiva, mas nenhuma rolagem ou outro custo é necessário. Em certas circunstâncias, rolagens de dados associadas ao uso dos sentidos do personagem (como Percepção + Prontidão) têm sua dificuldade reduzida em um número igual ao valor de Auspícios do personagem enquanto o poder estiver ativo.
O Narrador também pode usar esse poder para verificar se o personagem percebe uma ameaça. Nesse caso, o Narrador rola em segredo o valor de Auspícios não modificado do personagem, aplicando a dificuldade que julgar mais adequada às circunstâncias. Por exemplo, sentir que uma pistola está apontada para a nuca do personagem pode exigir uma rolagem de dificuldade 5, enquanto a súbita compreensão de que um rival ao Primogênito planeja seu assassinato pode exigir um 9. Note que mesmo essa "precognição" vem apenas como resultado da interpretação de detalhes que o Membro é capaz de notar. Não é uma percepção universal nem uma revelação milagrosa.
A critério da personagem, ela pode aguçar seletivamente um sentido específico, em vez de deixar todos ligados. Nesses casos, a dificuldade para perceber estímulos com aquele sentido cai em um, mas a dificuldade para evitar distração ou ofuscamento temporário aumenta em um.
Este poder não permite que personagens enxerguem na escuridão total, como faz Olhos da Besta (p. 199), mas reduz as penalidades de dificuldade para agir nessa escuridão de +2 para +1, e o personagem pode fazer ataques à distância na escuridão total se conseguir ouvir, cheirar ou de outro modo detectar seu adversário.

•• Percepção da Aura
Sistema: Depois que o personagem encara o sujeito por ao menos alguns segundos, o jogador rola Percepção + Empatia (dificuldade 8); cada sucesso indica quanto da aura do sujeito o personagem vê e compreende (veja a tabela abaixo). Uma falha indica que o jogo de cores e padrões não produz nenhuma impressão dominante. Uma falha crítica indica uma interpretação falsa ou errônea. O Narrador pode preferir fazer essa rolagem, mantendo assim o jogador no escuro quanto à veracidade da interpretação do personagem.
1 sucesso — Consegue distinguir apenas o tom (pálido ou brilhante).
2 sucessos — Consegue distinguir a cor principal.
3 sucessos — Consegue reconhecer os padrões de cor.
4 sucessos — Consegue detectar mudanças sutis.
5 sucessos — Consegue identificar misturas de cor e padrão.
A tabela de Cores da Aura oferece algumas ideias de cores comuns e das emoções que elas refletem, que os Narradores podem usar. Note que é quase impossível determinar com certeza se um personagem em particular está mentindo ou não com esse poder – vampiros são inerentemente enganadores por natureza, mas até mortais podem reagir com ansiedade a perguntas sendo sinceros. É útil, porém, para determinar o estado emocional do alvo, o que pode levar o vampiro a decidir que determinado alvo é suspeito.
Um personagem pode escolher fazer uma varredura de aura bem superficial numa área grande, como a pista de dança de uma casa noturna ou o público de uma galeria. Nesse caso, o jogador decide qual característica das auras ela está procurando, e essa é a única informação que consegue obter se a rolagem for bem-sucedida. (A critério do Narrador, nessa rolagem de varredura geral, mais sucessos podem render mais rapidamente o que o personagem procura.) Por exemplo, o jogador pode especificar: "Quem é a pessoa mais nervosa presente?" ou "Há alguma aura vampiricamente pálida na comitiva do presidente da empresa?" Depois disso, o jogador pode estreitar seu exame para um único indivíduo, com uma rolagem adicional normal.
O personagem só pode focar na aura de um sujeito em particular uma vez por cena com algum grau de clareza. Quaisquer tentativas subsequentes que resultem em falha devem ser consideradas falhas críticas. É muito fácil para o personagem imaginar que vê o que quer ver ao julgar as intenções de alguém. Depois de 24 horas, o personagem pode tentar de novo sem penalidade.
É possível, embora difícil, sentir a aura de um ser que de outro modo é invisível à visão normal. Consulte "Vendo o Invisível", p. 142, para mais informações.
Cores da Aura
Com medo — Laranja
Agressivo — Roxo
Furioso — Vermelho
Amargurado — Marrom
Calmo — Azul-claro
Compassivo — Rosa
Conservador — Lilás
Deprimido — Cinza
Desejoso ou Luxurioso — Vermelho-escuro
Desconfiado — Verde-claro
Invejoso — Verde-escuro
Empolgado — Violeta
Generoso — Rosa-chá
Feliz — Vermelhão
Odioso — Preto
Idealista — Amarelo
Inocente — Branco
Apaixonado — Azul
Obcecado — Verde
Triste — Prateado
Espiritual — Dourado
Suspeitoso — Azul-escuro
Ansioso — A aura aparece embaralhada como estática ou ruído branco
Confuso — Cores manchadas e cambiantes
Diaborista — Veios pretos na aura
Sonhando acordado — Cores em lampejos agudos
Em frenesi — Cores ondulando rapidamente
Psicótico — Cores hipnóticas e rodopiantes
Vampiro — As cores da aura são pálidas
Carniçal — Manchas pálidas na aura
Uso de Magia — Miríade de faíscas na aura
Metamorfo — Aura viva e vibrante
Fantasma — Aura fraca e intermitente
Feérico — Reflexos de arco-íris na aura

••• O Toque do Espírito
Sistema: O jogador rola Percepção + Empatia. A dificuldade é determinada pela idade das impressões e pela força mental e espiritual da pessoa ou do evento que as deixou. Sentir informação de uma pistola usada num assassinato horas atrás pode exigir um 4, enquanto descobrir quem foi o dono de um boneco manchado de sangue confeccionado há um século pode ser um 9.
Quanto maior a conexão emocional do indivíduo com o objeto, mais forte a impressão que ele deixa nele — e mais informação o Membro consegue extrair. Eventos envolvendo emoções fortes (uma doação de presente, uma tortura, uma longa história de família) também deixam impressões mais fortes do que contatos curtos ou casuais. Assuma que cada sucesso oferece uma informação, conforme a tabela abaixo.
Falha crítica — O personagem é sobrecarregado por impressões psíquicas pelos próximos 30 minutos e fica incapaz de agir.
Falha — Nenhuma informação de valor.
1 sucesso — Informação bem básica: o gênero ou a cor de cabelo do último dono, por exemplo.
2 sucessos — Uma segunda informação básica.
3 sucessos — Informação mais útil sobre o último dono, como a idade e o estado de espírito na última vez que usou o item.
4 sucessos — O nome da pessoa.
5+ sucessos — Uma riqueza de informação: praticamente qualquer coisa que você queira saber sobre a relação da pessoa com aquele objeto está disponível.
A critério do Narrador, algumas impressões em objetos podem ser tão fortes — uma faca cravada no peito de César, a ponta da Lança do Destino, uma presa arrancada das fauces de Drácula — que qualquer uso desse poder pode ser considerado um sucesso.

•••• Telepatia
Sistema: O jogador rola Inteligência + Subterfúgio (dificuldade igual aos pontos atuais de Força de Vontade do sujeito). Projetar pensamentos na mente do alvo exige um sucesso. O sujeito reconhece que os pensamentos vêm de algum lugar que não sua própria consciência, embora não consiga discernir a origem real deles sem uma rolagem bem-sucedida de Percepção + Consciência (dificuldade igual à Manipulação + Subterfúgio do vampiro).
Para ler mentes, é preciso rolar um sucesso para cada informação colhida ou cada camada de pensamento perfurada. Segredos profundos ou memórias enterradas são mais difíceis de obter do que emoções superficiais ou comentários não ditos, exigindo cinco ou mais sucessos para serem acessados.
Ler pensamentos com Telepatia normalmente não funciona sobre a mente morta-viva. Um personagem pode gastar um ponto de Força de Vontade para fazer a tentativa, fazendo a rolagem normalmente em seguida. Do mesmo modo, é igualmente difícil ler os pensamentos de outras criaturas sobrenaturais. Contudo, o personagem pode projetar seus pensamentos sem gastar um ponto de Força de Vontade. Esses pensamentos, porém, ainda são obviamente intrusões na mente do alvo, mas o personagem pode tentar disfarçar sua "voz" mental com uma rolagem de Manipulação + Subterfúgio (dificuldade igual à Percepção + Consciência do alvo), de modo que o alvo não a reconheça como a "falante".
Narradores são encorajados a descrever pensamentos como correntes fluidas de impressões e imagens, em vez de como uma sequência de prosa (poderes como Comunicação Telepática são mais úteis para isso). Em vez de fazer afirmações secas como "Ele está planejando matar o novo namorado da ex-amante", diga: "Você vê uma série fugaz de visões: um casal se beijando com paixão numa entrada de porta, depois o homem caminhando sozinho à noite; de repente você vê suas próprias mãos, os nós dos dedos brancos, agarradas a um volante, com uma figura atravessando a rua à frente; seu coração, mortal agora e martelando de pânico enquanto você ouve o motor acelerar descontrolado; e acima de tudo, uma raiva ardente somada a uma agonia emocional e a um medo apavorado de perda". Descrições assim não só acrescentam à história, como também forçam o jogador a interpretar por si mesmo o que sua personagem apreende. Afinal, compreender mentes — especialmente mentes muito emotivas ou perturbadas — é uma tarefa difícil e frequentemente desconcertante.

••••• Projeção Psíquica
Sistema: Viajar em forma astral exige que o jogador gaste um ponto de Força de Vontade e faça uma rolagem de Percepção + Consciência. A dificuldade varia conforme a distância e a complexidade da viagem pretendida; 5 é dentro do campo de visão, 7 é perto ou para um local familiar, e 9 reflete uma viagem para longe de território conhecido (uma primeira jornada da América do Norte para o Extremo Oriente; tentar cortar caminho através da terra). Quanto maior o número de sucessos rolados, mais focada é a presença astral do personagem, e mais fácil é para ela alcançar o destino desejado.
Uma falha significa que o personagem não consegue separar sua consciência do corpo, enquanto uma falha crítica pode ter consequências desagradáveis — lançar sua forma astral para um destino aleatório na Terra ou no reino espiritual, chegar a um lugar onde o sol está ativo (exigindo uma rolagem de frenesi, embora a luz solar não cause dano algum) ou arremessá-la em direção ao destino desejado com tanta força que o cordão de prata se rompe.
O jogador pode gastar um ponto de Força de Vontade para ativar esse poder, e um ponto adicional de Força de Vontade para obter o sucesso necessário para realizar a excursão. Esta é uma exceção à regra normal, segundo a qual um jogador não pode gastar mais de um único ponto de Força de Vontade por turno.
Cada cena em Projeção Psíquica exige outro ponto de Força de Vontade e uma nova rolagem. Uma falha indica que o vampiro se perdeu e precisa refazer o trajeto do seu cordão de prata. Uma falha crítica nesse estágio significa que o cordão se rompe, encalhando a forma psíquica do personagem no misterioso plano astral.
Uma forma astral pode viajar a grandes velocidades (o Narrador pode usar aproximadamente 1.600 quilômetros por hora como guia geral) e não carrega roupas nem objetos materiais de espécie alguma. Diz-se que alguns artefatos existem no mundo espiritual, e o personagem pode tentar usar uma dessas ferramentas se encontrar alguma. O personagem não pode trazer tais relíquias para o mundo físico ao retornar ao corpo, porém.
Interagir com o mundo físico é impossível enquanto se usa Projeção Psíquica. Na melhor das hipóteses, o personagem pode gastar um ponto de Força de Vontade para se manifestar como uma forma fantasmagórica. Essa aparição dura um turno antes de se desvanecer; embora não possa afetar nada fisicamente nesse tempo, o personagem pode falar. Apesar de não ter substância física, um personagem astral pode usar Auspícios normalmente. A critério do Narrador, tal personagem pode empregar alguns ou todos os poderes de Animalismo, Demência, Dominação, Necromancia, Tenebrosidade, Presença, Taumaturgia e poderes não corpóreos semelhantes que possua, embora isso normalmente exija no mínimo três sucessos na rolagem inicial de Projeção Psíquica.
Se duas formas astrais se encontram, elas interagem como se fossem sólidas. Podem conversar, tocar e até lutar como se ambas estivessem no mundo material. Como não têm corpos físicos, personagens astrais que buscam interagir "fisicamente" substituem os Atributos Físicos por Mentais e Sociais (Raciocínio substitui Destreza, Manipulação substitui Força e Inteligência substitui Vigor). Por causa da ausência de forma material, a única maneira real de danificar outra entidade psíquica é cortar seu cordão de prata. Ao lutar dessa forma, considere pontos de Força de Vontade como níveis de vitalidade; quando um combatente perde toda a sua Força de Vontade, o cordão é rompido.
Embora um personagem projetado astralmente permaneça no reflexo do mundo mortal, ela pode se aventurar mais fundo nos reinos espirituais, especialmente se ficar perdida. Outros seres com sensibilidade particular à atividade psíquica, como fantasmas, lobisomens e até alguns magos, também percorrem o plano astral e podem interagir normalmente com a presença psíquica de um vampiro (embora o personagem projetado astralmente não seja considerado um "fantasma" para poderes como Necromancia). O personagem observador nota o vampiro em projeção astral com uma rolagem de Percepção + Consciência (dificuldade 8), exigindo mais sucessos do que a rolagem de ativação da Projeção Psíquica. Mesmo quem nota você não conseguirá identificá-la; você é apenas uma sombra imaterial pairando pela área. Narradores são encorajados a tornar as viagens ao mundo espiritual tão bizarras, misteriosas e oníricas quanto possível. O mundo além é um lugar vívido e fantástico, onde a verdadeira natureza das coisas é mais forte e muitas vezes marcadamente diferente de sua aparência terrena.

Vendo o Invisível (p. 142)
Auspícios permite aos Membros perceber muitas coisas além dos limites de sentidos menores. Entre seus muitos usos, Auspícios pode detectar a presença de um ser sobrenatural escondido da visão normal (um vampiro usando Ofuscação, por exemplo, ou um fantasma) ou atravessar ilusões criadas pela Disciplina de Quimerismo. Nota: "Visão normal" inclui o uso regular, sem Auspícios, da perícia Consciência.
• Ofuscação: Quando um vampiro tenta usar suas percepções aguçadas para notar um Membro escondido com Ofuscação, ela detecta a presença do sujeito se seu valor de Auspícios for maior que a Ofuscação dele, e se obtiver sucesso numa rolagem de Percepção + Consciência (dificuldade igual a 7 menos o número de pontos pelos quais seu Auspícios excede a Ofuscação dele). Inversamente, se a Ofuscação do alvo superar o Auspícios dela, ele permanece por descobrir. Se os dois valores forem iguais, ambos os personagens fazem uma rolagem resistida de Percepção + Consciência (usuário de Auspícios) contra Manipulação + Subterfúgio (usuário de Ofuscação). A dificuldade para ambas as rolagens é 7, e vence o personagem com mais sucessos.
• Quimerismo: Do mesmo modo, vampiros com Auspícios podem buscar penetrar ilusões criadas com Quimerismo. Quem empunha Auspícios precisa buscar ativamente atravessar a ilusão (isto é, o jogador precisa dizer ao Narrador que seu personagem está tentando detectar uma ilusão). O usuário de Auspícios e o usuário de Quimerismo então comparam valores relativos, como em Ofuscação, acima. O processo é em tudo o mais idêntico ao de atravessar Ofuscação.
• Outros Poderes: Como os poderes de seres como magos e wraiths funcionam de modo diferente das Disciplinas vampíricas, uma comparação simples de valores relativos não se aplica. Para manter as coisas simples, ambos os personagens fazem uma rolagem resistida. O vampiro rola Percepção + Consciência, enquanto o sujeito rola Manipulação + Subterfúgio. Novamente, a dificuldade é 7, e vence o personagem com mais sucessos.]==],
				},
				["Bardo"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 442


Bardo


• Restaurar Humanitas
Sistema: Quando o vampiro perde um ponto de Humanidade, ele pode tentar recuperá-lo sem gastar pontos de experiência usando esse poder. O Filho precisa usar esse poder dentro de uma semana da perda da Humanidade e não pode ter perdido mais Humanidade desde a perda inicial (isto é, se o personagem cai de Humanidade 8 para Humanidade 7 e depois cai para Humanidade 6 antes de usar esse poder, Restaurar Humanitas só pode ser usado para recuperar a Humanidade 7). O personagem medita por várias horas e gasta todos os pontos de sangue atualmente em seu corpo. O jogador então rola Consciência (dificuldade igual ao nível de Humanidade sendo recuperado). Se a rolagem for bem-sucedida, o personagem recupera o ponto de Humanidade e (se aplicável) o ponto de Consciência perdido numa rolagem de degeneração com falha crítica. Se o personagem ganhou um distúrbio, ele desaparece dentro de uma semana do uso de Restaurar Humanitas.

•• Sinal de Banimento de Thoth
Sistema: O jogador gasta um ponto de sangue e rola Destreza + Ocultismo (dificuldade 7). Esse poder pode ser usado para "esquivar" de qualquer ataque de natureza mística que chegue, incluindo quaisquer Disciplinas que tenham o personagem como alvo (causem dano ou não). Quaisquer sucessos que o jogador role são subtraídos dos sucessos na rolagem do atacante. O sinal não serve para desviar ataques físicos magicamente potencializados; um soco de um vampiro com a Disciplina Potência ainda tem efeito pleno.

••• Dádiva de Ápis
Sistema: Sangue animal é tão nutritivo para o personagem quanto sangue humano. Um animal é considerado como tendo uma reserva de sangue igual ao número de níveis de vitalidade que possui, em vez do valor menor normalmente atribuído para representar os fluidos pouco saciantes da criatura (veja a p. 270 para mais sobre beber de animais). Essa habilidade está sempre ativa.

•••• Pilar de Osíris
Sistema: Criar o Pilar de Osíris exige um ritual que dura a noite inteira, com a dificuldade determinada pelo local. Quanto mais remoto e livre de violência o local, menor a dificuldade. Uma caverna longe de populações humanas que nunca viu violência pode ser dificuldade 5, enquanto o local de um homicídio-suicídio macabro numa área central seria dificuldade 9. O jogador gasta um ponto de Força de Vontade e rola Força de Vontade. O sucesso cria o Pilar, que não exige um pilar físico — o Pilar de Osíris é conceitual, não literal.
Uma vez criado o Pilar, qualquer vampiro com ao menos um ponto de Bardo recebe -3 nas dificuldades de qualquer Disciplina ou outra atividade mística (incluindo magia de sangue) realizada no Pilar. Contudo, isso exige idas regulares ao Pilar. Depois que o vampiro cria um Pilar, ele precisa visitá-lo ao menos uma vez por mês, ou o Pilar deixa de funcionar. Além disso, para cada semana que ele passa longe de um Pilar (não necessariamente o que criou), as dificuldades de todas as rolagens para evitar frenesi aumentam em um. A Besta, longamente negada pelas práticas ascéticas do Filho, cresce em força enquanto ele está longe do Pilar, e por fim empurra o vampiro ao frenesi e (provavelmente) à perda de Humanidade. Os Filhos de Osíris, por essa e outras razões, não deixam seus templos por muito tempo.

••••• Paradoxo
Sistema: O vampiro fala a frase, e o jogador gasta um ponto de Força de Vontade e rola Manipulação + Ocultismo (dificuldade igual à Força de Vontade atual do ouvinte). Se houver múltiplos ouvintes, o jogador rola contra a maior dificuldade. Se a rolagem for bem-sucedida, o(s) ouvinte(s) fica(m) imobilizado(s) pela cena enquanto contempla(m) o que ouviu(ram). Golpear a vítima a tira desse estado. No fim da cena, o paradoxo se vai, e o alvo nunca consegue explicá-lo direito. Ele sofre, porém, um +1 permanente de dificuldade para ferir ou agir contra o Filho de Osíris.]==],
				},
				["Celerity"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 142


Celerity


Sistema: Cada ponto de Celeridade acrescenta um dado a toda rolagem relacionada a Destreza. Além disso, o jogador pode gastar um ponto de sangue para realizar uma ação extra, até o número de pontos que tiver em Celeridade no início do turno em questão; esse gasto pode ultrapassar o máximo normal da sua Geração. Quaisquer pontos usados para ações extras, porém, deixam de estar disponíveis para rolagens relacionadas a Destreza durante aquele turno. Essas ações adicionais precisam ser físicas (por exemplo, o vampiro não pode usar uma Disciplina mental como Dominação várias vezes num turno), e as ações extras ocorrem no fim do turno (a ação regular do vampiro continua acontecendo conforme sua rolagem de iniciativa).
Normalmente, um personagem sem Celeridade precisa dividir seus dados se quiser realizar múltiplas ações num único turno, conforme a p. 248. Um personagem usando Celeridade realiza suas ações extras (incluindo movimento completo) sem penalidade, obtendo uma parada de dados cheia para cada ação separada. Ações extras obtidas por Celeridade não podem, por sua vez, ser divididas em múltiplas ações, porém.]==],
				},
				["Chimerstry"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 144


Chimerstry


• Ignis Fatuus
Sistema: O jogador gasta um ponto de Força de Vontade para que o vampiro crie essa ilusão. O volume de cheiros, iluminação ambiente, nuvens de fumaça e afins é limitado a aproximadamente meio metro cúbico por ponto que o vampiro tenha em Quimerismo. A ilusão dura até que o vampiro deixe as imediações dela (como sair da sala) ou até que outra pessoa a desmascare de algum modo. O Cainita também pode encerrar a ilusão a qualquer momento sem esforço.

•• Fata Morgana
Sistema: O jogador gasta um ponto de Força de Vontade e um ponto de sangue para criar a ilusão. Essas imagens estáticas permanecem até serem dissipadas, muito da mesma forma que uma ilusão de Ignis Fatuus.

••• Aparição
Sistema: O criador gasta um ponto de sangue para fazer a ilusão se mover de uma maneira significativa, ou de qualquer número de maneiras sutis. Por exemplo, o vampiro poderia criar a ilusão de um assaltante à espreita avançando sobre sua vítima, ou poderia criar a ilusão de uma rua desolada, pela qual um vento gelado sopra lixo enquanto um poste de luz pisca e zumbe. Realizar ações complicadas além de manter a ilusão — isto é, qualquer coisa que exigiria uma rolagem de dados — exige primeiro sucesso numa rolagem de Força de Vontade, resultando na dissolução do falso constructo se a rolagem falhar.
Uma vez que o criador para de se concentrar na ilusão, ela pode continuar em movimentos simples e repetitivos – grosso modo, qualquer coisa que possa ser descrita numa frase simples, como um guarda andando de um lado para outro diante de uma porta de aço. Depois disso, o vampiro não pode retomar o controle sobre a ilusão – ela pode ou permitir que continue se movendo como ordenado, ou deixá-la se desvanecer conforme descrito em Ignis Fatuus.

•••• Permanência
Sistema: O vampiro só precisa gastar um ponto de sangue, e a ilusão se torna permanente até ser dissolvida (incluindo ilusões "programadas" como as criadas por Aparição).

••••• Realidade Horrenda
Sistema: Uma ilusão de Realidade Horrenda custa dois pontos de Força de Vontade para ser posta em movimento e dura uma cena inteira (embora seus efeitos possam durar mais; veja abaixo). Se o vampiro estiver tentando ferir sua vítima, seu jogador precisa rolar Manipulação + Subterfúgio (dificuldade igual à Percepção + Autocontrole/Instinto da vítima). Cada sucesso inflige um nível de vitalidade de dano letal na vítima, que não pode ser absorvido — o Cainita ataca a mente e as percepções da vítima, não seu corpo. Se o jogador quiser infligir menos dano ou mudá-lo para dano por contusão, pode anunciar uma quantidade máxima de dano antes de rolar os dados. Efeitos secundários (como rolagens de frenesi por causa de fogo ilusório) também podem ocorrer.
A vítima cura todo o seu dano instantaneamente se puder ser convencida de que o dano que sofreu era ilusório, mas convencê-la pode dar trabalho, como com ao menos dois sucessos numa rolagem de Carisma + Empatia (dificuldade igual à Manipulação + Subterfúgio do Cainita usando Realidade Horrenda). O alvo precisa ser convencido da natureza ilusória do ataque dentro de 24 horas de sua ocorrência, ou ele se estabelece bem demais na memória dele, e ele terá de curar o dano usando sangue (se for vampiro) ou com o tempo (se for mortal).
Este poder não pode de fato matar suas vítimas (embora um alvo com problema cardíaco possa muito bem morrer de susto). Uma vítima "morta" por um ataque ilusório perde a consciência ou entra em torpor.]==],
				},
				["Daimonion"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 208


Daimonion


• Sentir o Pecado
Sistema: Role Percepção + Empatia contra seres vivos ou mortos-vivos; a dificuldade é igual ao Autocontrole ou Instinto do sujeito +4. O sucesso indica que o Baali obteve uma percepção da fraqueza do sujeito. Com um sucesso, isso é informação como uma Virtude baixa, Força de Vontade fraca ou ações recentes que violaram o Caminho do sujeito. Dois sucessos podem render um vício estimado ou um segredo casual. Três ou mais rendem um Distúrbio central ou um trauma formativo do passado do sujeito.

•• Medo do Vazio
Sistema: O Baali precisa primeiro usar com sucesso Sentir o Pecado ou outro método para descobrir os segredos ou medos do alvo. Ela precisa então falar com o alvo, zombando das inseguranças dele com o tom de voz. Uma rolagem bem-sucedida de Raciocínio + Intimidação (dificuldade da Coragem do sujeito +4) leva a vítima a acessos furiosos de terror. Dois sucessos causam fuga em pânico semelhante ao Rötschreck, enquanto três causam um Distúrbio inflamado (escolha do Narrador) e quatro ou mais causam catatonia. Todos os efeitos duram o resto da cena. Mortais e criaturas sobrenaturais ligadas a emoções fortes (como feéricos ou fantasmas) não podem contestar essa rolagem; outras criaturas sobrenaturais podem fazer uma rolagem resistida de Coragem (dificuldade da Força de Vontade do Baali).

••• Essência Atormentada
Sistema: Gaste um ponto de sangue. O personagem reúne dor infernal nas mãos; mais comumente isso se manifesta como um dardo de chama negra, mas relâmpagos de tonalidade nauseante ou tentáculos negros e viscosos são igualmente comuns. Seja como for, o poder cria um projétil que inflige um dado de dano agravado. Mais pontos de sangue podem ser gastos para aumentar o tamanho e o dano do projétil, a um dado por ponto. O jogador rola Destreza + Ocultismo (dificuldade 6) para acertar o alvo, que pode se esquivar normalmente. Como em qualquer ataque normal, os sucessos somam-se à parada de dados de dano. Vampiros confrontados com esse poder fazem testes de Rötschreck (dificuldade 8), independentemente da forma do poder. Curiosamente, esse poder é duplamente eficaz contra demônios e outros espíritos, cujas formas corpóreas reagem mal à matéria do tormento. Contra tais criaturas, cada ponto de sangue vira dois dados de dano em vez de um.

•••• Psicomaquia
Sistema: Depois de usar Sentir o Pecado com sucesso, o vampiro força o alvo a rolar sua Virtude mais baixa (dificuldade da Força de Vontade do Baali). Falhar nessa rolagem traz à tona quaisquer Distúrbios que o alvo possua, opondo-os a uma aparição personificada do vício da vítima invocada do seu eu mais sombrio. Uma falha crítica indica que o alvo foi sobrepujado e entra em frenesi — ou é possuído pelo seu passageiro sombrio. Uma falha resulta numa luta literal entre os dois, embora isso possa tomar a forma de qualquer conflito, como uma discussão abusiva em vez de uma batalha física.
O agressor é um personagem do Narrador com traços equivalentes ou ligeiramente inferiores aos da vítima. Alvos com pontuação baixa de Caminho enfrentam uma oposição significativamente mais poderosa (+1 em todos os traços para cada nível de Caminho abaixo de 5). Os ferimentos infligidos pela mente são ilusórios, embora possam forçar um mortal à catatonia ou um vampiro ao torpor com uma "morte" fantasma. O fantasma desaparece com a derrota deles ou com a perda de concentração do Baali.

••••• Condenação
Sistema: Uma rolagem de Inteligência + Ocultismo (dificuldade igual à Força de Vontade do sujeito) determina a duração e a severidade da maldição. Os sucessos precisam ser divididos entre esses dois efeitos, conforme o quadro abaixo.
Maldições com zero sucessos alocados à duração duram uma noite. O Baali pode escolher encerrar a maldição a qualquer momento, mas raramente o faz. Narradores devem se sentir à vontade para inventar maldições criativas ou apropriadas à história. Com cinco sucessos, um Baali pode arrancar um demônio de um hospedeiro mortal ou de uma relíquia e atirá-lo de volta ao Inferno, mas só o fazem contra os mais recalcitrantes.
Condenação
1 sucesso — Até uma semana — "Suas pisadas mais leves são como pisões infantis." — Todas as rolagens de Furtividade ficam com +3 de dificuldade.
2 sucessos — Um mês — "Adoeça e definhe, e sinta a fraqueza do seu sangue." — A dificuldade de todas as rolagens de Vigor aumenta em dois, ou o vampiro perde quatro dados de absorção.
3 sucessos — Um ano — "Viva para sempre com medo: aqueles que você respeita buscam sua traição." — O vampiro sofre dificuldades aumentadas em rolagens Sociais, ou o personagem não pode se beneficiar de Aliados ou Contatos.
4 sucessos — Dez anos — "Sinta esmagado o deuszinho nas suas veias, e desaparecida sua futura prole." — O personagem não pode Abraçar cria nem criar carniçais.
5 sucessos — Permanente — "A perdição estará sobre você, e seus passos em falso se tornarão fatais e definitivos." — Falhas simples são consideradas falhas críticas.]==],
				},
				["Dark Thaumaturgy"] = {
					pt = [==[Rites of Blood, pág. 112


Dark Thaumaturgy


A Taumaturgia Negra é expressamente definida como "feitiçaria ensinada por demônios". Como tal, a Taumaturgia Negra é absoluta, descaradamente e cruelmente maligna. Outros itens também caem nesse domínio. A Disciplina Baali de Daimoinon, que exige que o usuário invoque nomes demoníacos e profira bênçãos infernais, é infernal e corrompe a alma do usuário a cada uso. Todos esses poderes exigem a perda de um ponto de moralidade no primeiro uso, e testes continuados contra a Consciência do personagem a cada vez que forem usados depois da primeira — a menos que o usuário de tais poderes tenha trocado sua moralidade pelo Caminho das Revelações Malignas. Alguns exemplos começam na p. 167.]==],
				},
				["Dementation"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 147


Dementation


• Paixão
Sistema: O personagem conversa com sua vítima, e o jogador do vampiro rola Carisma + Empatia (dificuldade igual ao valor de Humanidade ou Caminho da vítima). O número de sucessos determina a duração do estado alterado de sentimento. Efeitos desse poder podem incluir acréscimos ou reduções de um ou dois pontos nas dificuldades de rolagens de frenesi, rolagens de Virtude, rolagens para resistir a poderes de Presença, etc.
1 sucesso — Um turno
2 sucessos — Uma hora
3 sucessos — Uma noite
4 sucessos — Uma semana
5 sucessos — Um mês
6+ sucessos — Três meses

•• A Assombração
Sistema: Depois que o vampiro fala com a vítima, o jogador gasta um ponto de sangue e rola Manipulação + Subterfúgio (dificuldade da Percepção + Autocontrole/Instinto da vítima). O número de sucessos determina a duração das "visitações" sensoriais. Os efeitos precisos ficam a cargo do Narrador, embora aparições especialmente sinistras ou dilacerantes possam certamente reduzir paradas de dados por um turno ou dois após a manifestação.
1 sucesso — Uma noite
2 sucessos — Duas noites
3 sucessos — Uma semana
4 sucessos — Um mês
5 sucessos — Três meses
6+ sucessos — Um ano

••• Olhos do Caos
Sistema: Este poder permite a um vampiro determinar a verdadeira Natureza de uma pessoa, entre outras coisas. O vampiro se concentra por um turno, e então sua jogadora rola Percepção + Ocultismo. A dificuldade depende da complexidade do padrão. Discernir a Natureza de um estranho seria dificuldade 9, de um conhecido casual seria 8, e de um aliado estabelecido, 6. O vampiro também poderia ler a mensagem trancada numa missiva cifrada (dificuldade 7), ou até ver a atuação de uma mão invisível em eventos como o padrão das folhas caindo (dificuldade 6). Quase qualquer coisa pode conter alguma percepção escondida, por mais trivial ou sem sentido que seja. Os padrões estão presentes na maioria das coisas, mas são muitas vezes tão intrincados que podem manter um vampiro enfeitiçado por horas enquanto tenta compreender sua mensagem.
Este é um poder potente, sujeito a arbitragem. Narradores, este poder é uma forma eficaz de introduzir fios de trama para uma crônica, revelar uma pista negligenciada, prenunciar eventos importantes ou comunicar informação crítica que um jogador procura. Importante no seu uso, porém, é entregar a informação da maneira certa. Segredos revelados por Olhos do Caos nunca são fatos simples; são símbolos instigantes à deriva num mar de loucura. Descreva os resultados desse poder em termos de alegoria: "O homem diante de você aparece como uma marionete tosca, com feições berrantes pintadas em maquiagem de palco vistosa, e cordões sumindo noite acima". Evite afirmar secamente: "Você descobre que este carniçal é lacaio de um Matusalém poderoso".

•••• Voz da Loucura
Sistema: O jogador gasta um ponto de sangue e faz uma rolagem de Manipulação + Empatia (dificuldade 7). Um alvo é afetado por sucesso, embora todas as vítimas potenciais precisem estar ouvindo a voz do vampiro.
As vítimas afetadas entram imediatamente em frenesi ou num medo cego como o Rötschreck. Membros ou outras criaturas capazes de frenesi, como Lupinos, podem fazer um teste de frenesi ou de Rötschreck (escolha do Narrador quanto ao modo como são afetados) com +2 de dificuldade para resistir ao poder. Mortais são afetados automaticamente e não se lembram de suas ações enquanto enlouquecidos. O frenesi ou o medo dura uma cena, embora vampiros e Lupinos possam testar normalmente para sair dele.
O vampiro que usa Voz da Loucura também precisa testar frenesi ou Rötschreck ao invocar esse poder, embora sua dificuldade para resistir seja um ponto menor que o normal. Se a rolagem inicial para invocar o poder for uma falha, porém, a rolagem para resistir ao frenesi é um ponto maior que o normal. Se a rolagem para invocar o poder for uma falha crítica, a resposta de frenesi ou Rötschreck é automática.

••••• Insanidade Total
Sistema: O Membro precisa obter a atenção indivisa do seu alvo por ao menos um turno inteiro para executar esse poder. O jogador gasta um ponto de sangue e rola Manipulação + Intimidação (dificuldade dos pontos atuais de Força de Vontade da vítima). Se a rolagem for bem-sucedida, a vítima é afligida com cinco distúrbios à escolha do Narrador (veja a p. 290). O número de sucessos determina a duração.
1 sucesso — Um turno
2 sucessos — Uma noite
3 sucessos — Uma semana
4 sucessos — Um mês
5+ sucessos — Um ano
Numa falha crítica… bem, o Narrador pode decidir o que um vampiro inflige a si mesmo ao tentar incitar os infernos primais que espreitam nos recessos mais escuros da mente de uma vítima.
A vítima (ou o alvo de uma falha crítica) pode gastar um número de pontos de Força de Vontade igual aos sucessos rolados para encerrar a duração prematuramente. O Narrador decide quando esses pontos de Força de Vontade podem ser gastos (como depois de uma sessão de terapia ou depois que um amigo conseguiu provar que determinado delírio é falso).]==],
				},
				["Dominate"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 151


Dominate


• Comando
Sistema: O jogador rola Manipulação + Intimidação (dificuldade igual aos pontos atuais de Força de Vontade do alvo). Mais sucessos forçam o sujeito a agir com maior vigor ou por uma duração mais longa (continuar correndo por um número de turnos, cair num ataque de riso, gritar incontrolavelmente).
Lembre também que ser mandado a agir contra a própria Natureza atrapalha o uso desse poder. Ouvir "durma!" numa situação perigosa ou "ataque!" sob custódia policial pode não ter o efeito desejado, ou de fato efeito algum.

•• Mesmerizar
Sistema: O jogador rola Manipulação + Liderança (dificuldade igual aos pontos atuais de Força de Vontade do alvo). O número de sucessos determina o quão bem a sugestão se fixa no subconsciente da vítima. Se o vampiro obtiver um ou dois sucessos, o sujeito não pode ser forçado a fazer nada que lhe pareça estranho (ela pode sair andando, mas dificilmente roubaria um carro). Com três ou quatro sucessos, a ordem é eficaz a menos que segui-la coloque o sujeito em perigo. Com cinco sucessos ou mais, o vampiro pode implantar praticamente qualquer tipo de ordem.
Por mais forte que seja a vontade do Membro, sua ordem não pode forçar o sujeito a ferir a si mesma diretamente nem a desafiar sua Natureza inata. Assim, embora um vampiro que obtivesse cinco sucessos pudesse fazer um fracote de 45 quilos atacar um leão de chácara de 135 quilos, ele não conseguiria fazer a mortal atirar na própria cabeça.
Se um vampiro tentar Mesmerizar um sujeito antes que o alvo cumpra uma diretriz implantada anteriormente, compare os sucessos rolados com os obtidos ao implantar a primeira sugestão. A rolagem com o maior número de sucessos é a ordem que passa a governar o comportamento do alvo; a outra sugestão é apagada. Se os sucessos rolados forem iguais, a ordem mais nova suplanta a antiga.

••• A Mente Esquecida
Sistema: O jogador declara que tipos de alteração quer realizar e então rola Raciocínio + Subterfúgio (dificuldade igual aos pontos atuais de Força de Vontade do alvo). Qualquer sucesso pacifica a vítima pelo tempo que o vampiro levar para realizar a alteração verbal, contanto que o vampiro não aja agressivamente com ela. A tabela abaixo indica o grau de modificação possível na memória do sujeito. Se os sucessos rolados não permitirem a extensão de mudança que o personagem desejava, o Narrador reduz o impacto resultante na mente da vítima.
1 sucesso — Pode remover uma única memória; dura um dia.
2 sucessos — Pode remover permanentemente, mas não alterar, uma memória.
3 sucessos — Pode fazer pequenas mudanças na memória.
4 sucessos — Pode alterar ou remover uma cena inteira da memória do sujeito.
5 sucessos — Pode reconstruir períodos inteiros da vida do sujeito.
Para restaurar memórias removidas ou detectar memórias falsas num sujeito, o valor de Dominação do personagem precisa ser igual ou maior que o do vampiro que fez a alteração. Nessa situação, o jogador precisa fazer uma rolagem de Raciocínio + Empatia (dificuldade igual à Força de Vontade permanente do vampiro original) e obter mais sucessos do que seu predecessor obteve. Contudo, o Membro não pode usar A Mente Esquecida para restaurar as próprias memórias se elas foram roubadas dessa maneira.

•••• Condicionamento
Sistema: O jogador rola Carisma + Liderança (dificuldade igual aos pontos atuais de Força de Vontade do alvo) uma vez por cena. Condicionamento é uma ação estendida, para a qual o Narrador determina em segredo o número de sucessos necessários. Costuma exigir entre cinco e 10 vezes o valor de Autocontrole/Instinto do sujeito. Alvos com Naturezas mais empáticas podem exigir um número menor de sucessos, enquanto os de Naturezas obstinadas exigem um total maior. Só pela interpretação um personagem pode discernir se seu sujeito foi condicionado com sucesso.
Um alvo pode se tornar mais tratável mesmo antes de estar plenamente condicionado. Uma vez que o vampiro acumule metade do número de sucessos necessários, o Narrador pode aplicar uma dificuldade menor aos usos subsequentes de Dominação pelo vampiro. Depois de condicionado, o alvo cai tão profundamente sob a influência do vampiro que o Membro não precisa fazer contato visual nem sequer estar presente para manter controle absoluto. O sujeito faz exatamente o que lhe é dito (incluindo tomar ações que a machucariam), contanto que seu mestre consiga se comunicar com ela verbalmente. Nenhuma rolagem de comando é necessária a menos que o sujeito esteja totalmente isolado da presença do vampiro (em outro cômodo, ao telefone). Mesmo que uma rolagem de comando falhe, o alvo ainda provavelmente cumprirá parte das ordens dadas, simplesmente porque seu mestre assim deseja.
Depois que o sujeito está plenamente condicionado, outros Membros a acham mais difícil de Dominar. Tal condicionamento aumenta as dificuldades dos outros em dois (até um máximo de 10).
É possível, embora difícil, se livrar do Condicionamento. O sujeito precisa ser separado inteiramente do vampiro a quem estava subjugada. Esse período de separação varia conforme o indivíduo, mas o Narrador pode fixá-lo em seis meses, menos um número de semanas igual à Força de Vontade permanente do sujeito (de modo que uma pessoa com Força de Vontade 5 precisa ficar longe do vampiro por pouco menos de cinco meses). O sujeito recupera sua personalidade lentamente durante esse tempo, embora ainda possa recair em breves acessos de apatia, desespero ou até raiva. Se o vampiro encontrar o alvo antes que esse tempo passe, uma única rolagem bem-sucedida de Carisma + Liderança (dificuldade dos pontos atuais de Força de Vontade do alvo) por parte do vampiro reafirma completamente o domínio.
Se o sujeito atravessar o período sem intervenção do seu mestre, o alvo recupera sua antiga individualidade. Mesmo assim, o vampiro pode restabelecer o condicionamento mais facilmente do que na primeira vez, pois o sujeito agora está predisposto a cair sob o controle mental do Membro. Novas tentativas exigem metade do número total de sucessos que a última rodada de condicionamento exigiu (o que significa que o sujeito também alcança mais cedo o limiar para dificuldades reduzidas).

••••• Possessão
Sistema: O vampiro precisa despojar completamente a Força de Vontade do alvo antes de possuí-la. O jogador gasta um ponto de Força de Vontade e então rola Carisma + Intimidação, enquanto o sujeito rola sua Força de Vontade numa ação resistida (dificuldade 7 para cada). Para cada sucesso que o vampiro obtiver acima do total da vítima, o alvo perde um ponto temporário de Força de Vontade. Só se o atacante obtiver falha crítica é que o sujeito pode escapar do seu destino, pois isso torna o alvo imune a quaisquer outras tentativas de Dominação daquele vampiro pelo resto da história.
Uma vez que o alvo perde toda a sua Força de Vontade temporária, sua mente está aberta. O vampiro rola Manipulação + Intimidação (dificuldade 7) para determinar quão plenamente ele assume o controle da casca mortal. Semelhante ao poder de Animalismo Absorver o Espírito, múltiplos sucessos permitem ao personagem utilizar algumas Disciplinas mentais, indicadas na tabela abaixo. (Vampiros possuindo carniçais podem usar as Disciplinas físicas que o carniçal possui, mas não as mentais.)
1 sucesso — Não pode usar Disciplinas
2 sucessos — Pode usar Auspícios e outros poderes sensoriais
3 sucessos — Pode também usar Presença e outros poderes de manipulação emocional
4 sucessos — Pode também usar Demência, Dominação e outros poderes de manipulação mental
5 sucessos — Pode também usar Quimerismo, Necromancia, Taumaturgia e outros poderes místicos
O personagem pode viajar tão longe do próprio corpo quanto for fisicamente capaz enquanto possui o mortal. O vampiro também pode se aventurar durante o dia na forma mortal. Contudo, o próprio corpo do vampiro precisa estar acordado para isso, exigindo uma rolagem bem-sucedida para permanecer acordado (veja a p. 262). Se o vampiro deixar a casca mortal (por escolha, se seu corpo adormecer, por expulsão sobrenatural, após sofrer ferimento significativo, etc.), sua consciência retorna à forma física num instante.
Uma vez libertada da possessão, a mortal recupera o controle mental de si mesma. Isso pode acontecer num instante, ou a vítima pode ficar comatosa por dias enquanto sua psique lida com a violação.
O vampiro experimenta tudo o que o corpo mortal sente durante a possessão, do prazer à dor. De fato, qualquer dano que o corpo da vítima sofra também é aplicado ao corpo do personagem (embora o Membro possa absorver normalmente). Se a mortal morrer antes que a alma do vampiro consiga fugir do corpo, o corpo do personagem cai em torpor. Presumivelmente isso é uma resposta simpática ao trauma massivo da morte, embora alguns Membros acreditem que a alma do vampiro fica à deriva durante esse tempo e precisa achar o caminho de volta ao corpo.
O Membro pode permanecer no corpo da mortal mesmo que sua própria forma torporosa seja destruída, embora uma criatura tão patética dificilmente exista por muito tempo. A cada nascer do sol, o vampiro precisa rolar Coragem (dificuldade 8) ou ser expelido do corpo. Se for forçado a sair do corpo mortal, o vampiro despenca no plano astral, sua alma permanentemente perdida no mundo espiritual. Um vampiro preso num corpo mortal não pode ser "re-Abraçado". Se o Abraço ocorrer a uma criatura dessas, ele simplesmente encontra a Morte Final.

Contato Visual (p. 152)
Existem muitos mitos e histórias sobre a capacidade mística de um vampiro de enfeitiçar pessoas olhando fundo nos olhos da vítima. A persistência dessas histórias ao longo das eras não surpreende, já que vários poderes de Disciplinas dos Membros (mais notavelmente Dominação) exigem contato visual para funcionar. Outros vampiros, ao saberem desse requisito, já tentaram de tudo, de usar óculos escuros espelhados a arrancar os próprios olhos, para impedir que um ancião imponha sua vontade sobre eles.
Mas os Membros não são frustrados tão facilmente.
A necessidade de contato visual nasce da necessidade que o Membro agressor tem de ver a alma da vítima, e os olhos são tradicionalmente conhecidos como as janelas da alma. Embora o vampiro precise capturar a atenção do alvo, os olhos do alvo não precisam estar presentes para que tal poder funcione (embora as artes dos Tzimisce tornem isso um tanto desafiador às vezes) — eles só precisam encontrar a alma da vítima exposta.
Um alvo tentando evitar o contato visual pode fazer uma rolagem de Força de Vontade contra uma dificuldade igual à Manipulação + Intimidação do usuário de Dominação (ou outra combinação apropriada para outras Disciplinas ou situações específicas, a critério do Narrador). A dificuldade pode ser reduzida por fatores atenuantes: -1 no caso de o alvo obscurecer levemente os olhos (como fechar os olhos ou usar óculos escuros), até -3 para os olhos estarem completamente invisíveis (como com uma venda grossa ou com os olhos arrancados). Em última análise, porém, cabe ao Narrador decidir se o contato visual é estabelecido num caso específico.]==],
				},
				["Flight"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 447


Flight


• O personagem não consegue de fato voar, mas pode planar como uma asa-delta. Ele também não pode carregar nada (precisa das mãos para ajudar a se dirigir). A velocidade máxima é igual à dos ventos predominantes, ou 25 quilômetros por hora em ar calmo.

•• O personagem pode fazer uma decolagem em corrida e carregar 10 quilos enquanto voa. A velocidade máxima é de 50 quilômetros por hora.

••• O personagem pode fazer uma decolagem vertical direta se estiver desimpedido, ou uma decolagem em corrida carregando até 25 kg. A velocidade máxima no ar é de 70 quilômetros por hora.

•••• O personagem agora pode fazer uma decolagem vertical com até 25 kg de bagagem, mas pode carregar até 45 kg enquanto voa. A velocidade máxima é de 95 quilômetros por hora.

••••• O personagem agora pode carregar até 90 kg, o bastante para levar embora uma pessoa adulta (ou um vampiro). A velocidade máxima é de 120 quilômetros por hora.

Pontos adicionais na Disciplina somam 45 kg de peso e 30 quilômetros por hora à velocidade. Os Gárgulas não pensam em Voo como uma Disciplina. Para eles é só voar, parte inseparável de ser um Gárgula, e podem ficar perplexos com noções como a de ensiná-lo a outros vampiros.]==],
				},
				["Fortitude"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 158


Fortitude


Sistema: O valor de Fortitude de um personagem soma-se ao seu Vigor para fins de absorver dano normal (contusão e letal). Um personagem com essa Disciplina também pode usar seus pontos de Fortitude para absorver dano agravado, embora os Membros normalmente não possam absorver coisas como mordidas de vampiro, garras de lobisomem, efeitos mágicos, fogo, luz do sol ou trauma físico massivo. Veja a p. 272 para mais detalhes sobre absorção e dano.]==],
				},
				["Koldunic Sorcery"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 448


Koldunic Sorcery


A conjuração propriamente dita da feitiçaria Koldúnica exige mais que um exercício desajeitado de vontade. Essa magia demanda perfeição de forma e domínio do saber apropriado. O jogador do conjurador gasta um ponto de sangue e rola (Atributo) + Ocultismo contra uma dificuldade igual ao nível do poder + 3, com o Atributo específico listado para cada trilha ou "via". Vampiros sempre usam o Atributo base, ignorando quaisquer bônus obtidos por gasto de sangue ou outras Disciplinas. Todos os kolduns precisam escolher uma das vias listadas abaixo como sua trilha principal.]==],
				},
				["Melpominee"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 453


Melpominee


• A Voz Ausente
Sistema: Esse poder funciona automaticamente enquanto o personagem o quiser. Contudo, usar A Voz Ausente enquanto realiza qualquer ação que não seja falar ou cantar acarreta uma penalidade de dois dados naquela ação, devido à quebra de concentração do personagem.

•• Orador Fantasma
Sistema: O jogador rola Raciocínio + Performance (dificuldade 7) e gasta um ponto de sangue. Cada sucesso permite um turno de fala; três ou mais sucessos permitem falar por uma cena inteira.

••• Madrigal
Sistema: O jogador rola Carisma + Performance (dificuldade 7). Cada sucesso instila a emoção escolhida em um quinto da plateia do Membro (mais de cinco sucessos não têm efeito adicional). O Narrador decide precisamente quais membros da plateia são afetados. Personagens podem resistir a esse poder pela duração da cena com o gasto de um ponto de Força de Vontade, mas apenas se tiverem motivo para acreditar que estão sendo controlados por indivíduos externos. A canção que o vampiro canta também precisa refletir a emoção que ela deseja engendrar — ninguém vai partir para cima da segurança do show por melhor que ela cante "High Hopes", mas talvez o façam se ela tocar "I Predict a Riot".
Indivíduos afetados devem agir de acordo com suas Naturezas — Conformistas enfurecidos entrariam num tumulto, mas não o iniciariam; Valentões excitados podem forçar suas atenções sobre o objeto do seu desejo; e Diretores enciumados podem mandar capangas atrás de seus rivais.
Múltiplas Filhas podem usar essa Disciplina em conjunto.

•••• O Chamado da Sereia
Sistema: O Chamado da Sereia exige uma rolagem estendida e resistida. O jogador rola Manipulação + Performance (dificuldade igual à Força de Vontade atual do alvo); a vítima resiste com uma rolagem de Força de Vontade (dificuldade igual à Aparência + Performance da cantora). Se a cantora acumular cinco sucessos a mais que a vítima em qualquer ponto, a pobre alma adquire um novo distúrbio ou Defeito Psicológico à escolha do Narrador. Esse distúrbio normalmente dura uma noite, com uma noite adicional por sucesso acima de cinco. Com um total de 20 sucessos líquidos, a Filha pode torná-lo permanente.
Múltiplas Filhas podem usar essa Disciplina em conjunto.

••••• Virtuosa
Sistema: A Filha pode usar Orador Fantasma ou O Chamado da Sereia num número de alvos igual ao seu Vigor + Performance. O jogador precisa gastar um ponto de sangue para cada cinco alvos além do primeiro.]==],
				},
				["Mytherceria"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 455


Mytherceria


• Folderol
Sistema: O personagem sabe quando um alvo está mentindo deliberadamente. Nenhuma rolagem ou gasto é necessário para esse poder funcionar, mas o personagem precisa ativá-lo deliberadamente. Note que esse poder não fornece nenhuma percepção do que a verdade poderia ser, nem permite ao vampiro dizer se um alvo está simplesmente afirmando algo falso que ele acredita ser verdadeiro.

•• Visão Feérica
Sistema: O Kiasyd vê feéricos e outros mortais tocados pelos feéricos pelo que realmente são, sem rolagem necessária. Além disso, o jogador pode detectar qualquer forma de magia que não venha de fantasmas ou dos mortos-vivos, incluindo magia de magos, lobisomens e outras fontes estranhas do gênero. O personagem consegue reconhecê-las pelo que verdadeiramente são, desde que já tenha visto efeitos semelhantes antes.

••• Absorção de Aura
Sistema: O jogador precisa fazer uma rolagem de Percepção + Empatia. A dificuldade é determinada pelo Narrador com base na idade das impressões e na força mental e espiritual da pessoa que as deixou. O número de sucessos determina a quantidade de informação obtida, tanto em termos de imagens da cena em que o objeto estava sendo segurado ou tocado quanto da natureza da pessoa que segurava o objeto. Uma imagem do tipo cena e um aspecto da identidade da pessoa (Natureza, Comportamento, aura, nome, sexo ou idade) ficam claros para cada sucesso que o jogador obtiver na rolagem. Qualquer um que tente usar esse poder ou O Toque do Espírito no mesmo objeto posteriormente precisa acumular mais sucessos do que o Kiasyd obteve para ter qualquer impressão. Os sucessos do primeiro Kiasyd subtraem-se do número de sucessos obtidos por quem tentar ler o objeto depois.

•••• Selo Chanjelin
Sistema: O vampiro que cria o selo inscreve o símbolo num local visível — numa porta de biblioteca, numa estante ou na roupa de um indivíduo — e o jogador rola Inteligência + Furto (dificuldade 7 para objetos inanimados, ou a Força de Vontade atual do sujeito +2). Qualquer um que entre na área selada ou toque o objeto selado perde dois dados das suas paradas de Inteligência enquanto mantiver contato ou proximidade com o selo. Além disso, qualquer um que veja o selo fica aturdido e perdido, a menos que obtenha sucesso numa rolagem de Raciocínio + Investigação (dificuldade 8). O Kiasyd é imune aos próprios selos. Os glifos duram por um tempo indicado pelo número de sucessos na rolagem de Inteligência + Furto:
1 sucesso — Uma hora
2 sucessos — Uma noite
3 sucessos — Uma semana
4 sucessos — Um mês
5 sucessos — Um ano

••••• O Enigma Fantástico
Sistema: O jogador rola Manipulação + Ocultismo (dificuldade da Força de Vontade atual da vítima). Depois de uma rolagem bem-sucedida, a vítima não consegue fazer nada além de sentar e ponderar o Enigma até acumular três vezes os sucessos do enigmista. O sujeito rola Raciocínio + Ocultismo (dificuldade 8, mais ou menos o número de distúrbios que a vítima tem, a critério do Narrador). Ela faz essa rolagem assim que ouve o Enigma, e depois uma vez por hora até ter reunido sucessos suficientes. Se a vítima obtiver falha crítica numa rolagem para resolver o Enigma, ela sofre um nível de dano letal enquanto o enigma místico tortura seu corpo, e perde todos os sucessos do total acumulado. Esse dano não pode ser curado até que o Enigma seja resolvido. O enigmista pode encerrar esse transe dizendo a resposta à vítima, mas ninguém mais pode.]==],
				},
				["Necromancy"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 159


Necromancy


Sistema: Um necromante Cainita precisa aprender ao menos três níveis na sua trilha principal antes de aprender seu primeiro nível numa trilha secundária de Necromancia. Ele precisa então dominar a trilha principal (todos os cinco níveis) antes de adquirir qualquer conhecimento de uma terceira trilha.
Como na Taumaturgia, o avanço na trilha principal custa a quantidade normal de experiência, enquanto o estudo de trilhas necrománticas adicionais acarreta um custo adicional em pontos de experiência (veja a p. 124). Como a Necromancia não é um estudo tão rígido quanto a Taumaturgia, as rolagens exigidas para usar poderes necrománticos podem variar de trilha para trilha e até dentro de trilhas individuais. A Trilha do Sepulcro, comumente aprendida, é apresentada primeiro, e as trilhas restantes são apresentadas em ordem alfabética.
As estatísticas de fantasmas podem ser encontradas no Capítulo Nove, p. 385.]==],
				},
				["Obeah"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 457


Obeah


• Sentir a Vitalidade
Sistema: O Salubri precisa tocar o alvo para ver quão perto da morte ela está. Ele precisa então fazer uma rolagem de Percepção + Empatia (dificuldade 7). Um sucesso nessa rolagem identifica um sujeito como mortal, vampiro, carniçal ou outra criatura. Dois sucessos revelam quantos níveis de vitalidade de dano o sujeito sofreu. Três sucessos dizem o quão cheia está a reserva de sangue do sujeito (se for vampiro) ou quantos pontos de sangue ela ainda tem no organismo (se for mortal ou outra forma de vida portadora de sangue). Quatro sucessos revelam quaisquer doenças na corrente sanguínea do sujeito. Um jogador pode optar por saber a informação obtida por um grau menor de sucesso — por exemplo, um jogador que acumule três sucessos pode saber se um sujeito é ou não vampiro, além do conteúdo da sua reserva de sangue.
Alternativamente, cada sucesso nessa rolagem permite ao jogador fazer ao Narrador uma pergunta sobre a saúde ou os níveis de vitalidade do sujeito. "Ele foi drogado?" ou "Os ferimentos dele são agravados?" são perguntas válidas, mas "A Sabbat fez isso?" ou "Como era o Lupino que o atacou?" não são. O Salubri pode usar esse poder em si mesma se estiver ferida mas de algum modo tiver perdido a memória de como recebeu os ferimentos.
Além disso, ao custo de um ponto de sangue, o Salubri pode usar Empatia numa rolagem em vez de Medicina.

•• Toque Anestésico
Sistema: Se o sujeito estiver disposto a passar por esse processo, o jogador gasta um ponto de sangue e faz uma rolagem de Força de Vontade (dificuldade 6) para bloquear a dor do sujeito. Isso permite ao sujeito ignorar todas as penalidades de ferimento por um turno por sucesso. Uma segunda aplicação desse poder pode ser feita depois que a primeira expirar, ao custo de outro ponto de sangue e outra rolagem de Força de Vontade. Se o sujeito estiver relutante por algum motivo, o jogador precisa fazer uma rolagem resistida de Força de Vontade contra o sujeito (dificuldade 8).
Para adormecer um mortal, aplica-se o mesmo sistema. O mortal dorme de cinco a 10 horas — o que for seu ciclo normal de sono — e recupera um ponto temporário de Força de Vontade ao acordar. Ele dorme em paz e não sofre pesadelos nem os efeitos de quaisquer distúrbios enquanto dorme. Pode ser acordado normalmente (ou violentamente).
Membros, incluindo a própria Salubri, não são afetados por esse poder — seus corpos cadavéricos estão ligados demais à morte.

••• Corpore Sano
Sistema: Esse poder funciona em qualquer criatura viva ou morta-viva, mas o personagem precisa tocar o ferimento propriamente dito (ou a parte mais próxima do corpo da vítima, no caso de ferimentos internos). Cada nível de vitalidade a ser curado exige o gasto de um ponto de sangue e um turno de contato. Ferimentos agravados também podem ser curados dessa maneira, mas o vampiro precisa gastar dois pontos de sangue em vez de um para cada nível de vitalidade agravado.

•••• Vigília do Pastor
Sistema: O jogador gasta dois pontos de Força de Vontade. Erguer essa barreira é uma ação padrão, mas mantê-la de turno em turno ou baixá-la é uma ação reflexiva. A barreira invisível se estende por um raio de cerca de 3 metros a partir do personagem, e ninguém fora dela pode atravessá-la enquanto ela mantiver o poder. Quem estiver dentro dela na sua criação pode sair e voltar, porém. A barreira se move com o Salubri. Não pode ser mantida à distância.
Aqueles que desejarem atravessar a barreira de fora, sejam amistosos ou hostis, precisam superar o personagem numa rolagem estendida e resistida de Força de Vontade (a dificuldade é a Força de Vontade atual do oponente para o Salubri, e a Força de Vontade atual do Salubri para o oponente). O oponente pode atravessar a barreira assim que acumular três sucessos líquidos a mais que o Salubri.

••••• Mens Sana
Sistema: O jogador gasta dois pontos de sangue e rola Inteligência + Empatia (dificuldade 8). O uso de Mens Sana leva ao menos 10 minutos de conversa relativamente ininterrupta. O sucesso cura o sujeito de um distúrbio à escolha do jogador do Salubri. Esse poder não pode curar um Malkaviano do seu distúrbio central, embora alivie seus efeitos pelo resto da cena. Uma falha crítica inflige o mesmo distúrbio ao Salubri pelo resto da cena. Esse poder não pode ser usado pelo Salubri para curar seus próprios distúrbios.]==],
				},
				["Obfuscate"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 184


Obfuscate


• Manto de Sombras
Sistema: Nenhuma rolagem é exigida enquanto o personagem cumprir os critérios descritos acima. Enquanto permanecer quieto e imóvel, praticamente ninguém além de outro Membro com um valor de Auspícios alto o bastante o verá.

•• Presença Invisível
Sistema: Nenhuma rolagem é necessária para usar esse poder, a menos que o personagem fale, ataque ou de outro modo chame atenção para si. O Narrador deve pedir uma rolagem de Raciocínio + Furtividade em qualquer circunstância que possa fazer o personagem se revelar. A dificuldade da rolagem depende da situação; pisar numa tábua rangente pode ser 5, enquanto caminhar por uma poça d’água pode exigir 9. Outros atos podem exigir um certo número de sucessos; falar baixo sem entregar a própria posição, por exemplo, exige ao menos três sucessos. Com o sucesso, o vampiro, toda a sua roupa e objetos que caibam num bolso ficam ocultos.
Algumas coisas estão além do poder de ocultação da Presença Invisível. Embora o personagem esteja encoberto da vista enquanto atravessa uma janela, grita ou atira alguém do outro lado da sala, o vampiro se torna visível a todos logo depois. Os presentes despertam da fuga sutil em que a Ofuscação os pôs. Pior ainda, cada observador pode fazer uma rolagem de Raciocínio + Consciência (dificuldade 7); se tiver sucesso, a névoa mental se dissipa completamente, e esses indivíduos lembram cada movimento que o personagem fez até então como se ele estivesse visível o tempo todo.

••• Máscara de Mil Faces
Sistema: O jogador rola Manipulação + Performance (dificuldade 7) para determinar o quão bem o disfarce funciona. Se o personagem tentar personificar alguém, ele precisa dar uma boa olhada no sujeito antes de vestir a máscara. O Narrador pode aumentar a dificuldade se o personagem tiver visto apenas um relance. A tabela abaixo lista os graus de sucesso na fabricação de outra aparência. Vampiros que desejem se mascarar como alguém mais atraente do que são precisam pagar pontos de sangue adicionais iguais à diferença entre o valor de Aparência do vampiro e a Aparência da máscara (o que significa que vampiros mais jovens podem precisar de mais tempo para gastar o sangue necessário).
1 sucesso — O vampiro mantém a mesma altura e compleição, com algumas alterações leves nas suas feições básicas. Nosferatu podem parecer mortais normais, ainda que feios.
2 sucessos — Ele parece diferente de si mesmo; as pessoas não o reconhecem facilmente nem concordam sobre a aparência dele.
3 sucessos — Ele parece do jeito que quer parecer.
4 sucessos — Transformação completa, incluindo gestos, maneirismos, aparência e voz.
5 sucessos — Alteração profunda (parecer do sexo oposto, de idade muito diferente ou com mudança extrema de tamanho).
Fazer-se passar por outra pessoa de fato traz seus próprios problemas. O personagem deve saber ao menos informações básicas sobre o indivíduo; enganos especialmente difíceis (enganar um amante ou amigo próximo) exigem ao menos alguma familiaridade com o alvo para dar certo.

•••• Desvanecer da Mente
Sistema: O jogador rola Carisma + Furtividade; a dificuldade é igual ao Raciocínio + Prontidão do alvo (use o maior total do grupo se o personagem desaparecer diante de uma multidão). Com três sucessos ou menos, o personagem se esmaece mas não some, tornando-se uma figura indistinta e fantasmagórica. Com mais de três, ele desaparece completamente. Se o jogador obtiver mais sucessos que o valor de Força de Vontade de um observador, essa pessoa esquece que o vampiro esteve ali.
Acompanhar o personagem com precisão enquanto ele aparece fantasmagórico exige uma rolagem de Percepção + Prontidão (dificuldade 8). Uma rolagem bem-sucedida significa que o indivíduo pode interagir normalmente com o vampiro (embora o Membro pareça uma forma fantasmagórica profundamente perturbadora). Uma rolagem falha resulta num modificador de +2 de dificuldade (máximo 10) ao tentar agir sobre o vampiro ou interagir com ele. O Narrador pode pedir novas checagens de observação se o vampiro se mover para um ambiente em que seja difícil de ver (entra nas sombras, passa atrás de um obstáculo, atravessa uma multidão). Quando totalmente invisível, o vampiro é tratado como descrito em Presença Invisível, acima.
Uma pessoa sujeita ao sumiço faz uma rolagem de Raciocínio + Coragem (mortais com dificuldade 9, vampiros com dificuldade 5). Uma rolagem bem-sucedida significa que o indivíduo reage imediatamente (embora depois de o vampiro realizar sua ação naquele turno); a falha significa que a pessoa fica parada sem compreender por dois turnos enquanto sua mente tenta dar sentido ao que acabou de experimentar.

••••• Encobrir a Reunião
Sistema: O personagem pode ocultar um indivíduo extra para cada ponto de Furtividade que possua. Ele pode conceder ao grupo qualquer poder único de Ofuscação por vez. Embora o poder se aplique a todos sob o manto do personagem, seu jogador só precisa fazer uma rolagem. Cada indivíduo precisa seguir os requisitos descritos no poder de Ofuscação em questão para permanecer sob seu efeito; qualquer pessoa que deixe de fazê-lo perde a proteção do manto, mas não expõe os outros. Só se o próprio vampiro errar é que o poder cai para todos.]==],
				},
				["Obtenebration"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 188


Obtenebration


• Jogo de Sombras
Sistema: Este poder não exige rolagem, mas um ponto de sangue precisa ser gasto para ativá-lo. Jogo de Sombras dura uma cena e não exige concentração ativa. Membros que se cobrem de sombra ganham um dado extra nas suas paradas de Furtividade e somam um às dificuldades de ataques com armas à distância contra eles. Vampiros que usam a escuridão para se tornar mais aterrorizantes somam um dado às paradas de Intimidação. Oponentes assolados por sombras esvoaçantes e escuridão estranguladora subtraem um dado de todas as paradas de Vigor (incluindo absorção). Mortais, carniçais e outros que respiram ar reduzidos a Vigor zero por sombras estranguladoras começam a asfixiar; vampiros perdem todos os dados cabíveis, mas não são afetados de outro modo. Apenas um alvo ou sujeito pode ser afetado por esse poder por vez, embora algum grau de ocultação seja oferecido a um grupo relativamente imóvel.
A aparência antinatural desse poder se mostra extremamente perturbadora para mortais e animais (e, a critério do Narrador, Membros que nunca o viram antes). Sempre que esse poder é invocado nas imediações de um mortal, esse indivíduo precisa fazer uma rolagem de Coragem (dificuldade 8) ou sofrer uma penalidade de um dado em todas as paradas pelo resto da cena, por medo das sombras monstruosas.

•• Manto da Noite
Sistema: O jogador rola Manipulação + Ocultismo (dificuldade 7). O sucesso na rolagem gera escuridão de aproximadamente três metros de diâmetro, embora a nuvem amorfa se desloque e ondule constantemente, às vezes até estendendo tentáculos sombrios. Cada sucesso adicional dobra o diâmetro da nuvem (embora o vampiro possa voluntariamente reduzir a área que deseja cobrir). A nuvem pode ser invocada a uma distância de até 50 metros, embora criar escuridão fora do campo de visão do vampiro some dois à dificuldade da rolagem e exija o gasto de um ponto de sangue.
A massa alcatroada de fato extingue as fontes de luz que engolfa (com exceção do fogo) e abafa os sons até que fiquem indistinguíveis. Quem está dentro da nuvem perde todo o sentido da visão e sente como se estivesse imerso em piche. O som também se deforma e distorce dentro da nuvem, tornando quase impossível realizar qualquer coisa (+2 de dificuldade, conforme Combate às Cegas na p. 274). Mesmo os que possuem Sentidos Aguçados, Olhos da Besta, Língua da Áspide e poderes semelhantes sofrem a penalidade por cegueira, devido à escuridão antinatural. Além disso, estar cercado pelo Manto da Noite reduz em dois dados as paradas baseadas em Vigor, pois a treva sufoca e agita as vítimas. Esse efeito não é cumulativo com Jogo de Sombras, embora os alvos asfixiem conforme Jogo de Sombras se chegarem a Vigor 0; mais de um mortal infeliz já se "afogou" na escuridão.
Mortais e animais cercados pelo Manto da Noite precisam fazer rolagens de Coragem conforme Jogo de Sombras, acima, ou entrar em pânico e fugir.

••• Braços do Abismo
Sistema: O jogador gasta um ponto de sangue e faz uma rolagem simples (nunca estendida) de Manipulação + Ocultismo (dificuldade 7); cada sucesso permite a criação de um único tentáculo. Cada tentáculo tem dois metros de comprimento e possui valores de Força e Destreza iguais ao Traço de Tenebrosidade do vampiro que o invoca — pontos de Potência e Celeridade são somados a esses valores de Força e Destreza, respectivamente. Se o vampiro quiser, ela pode gastar um ponto de sangue para aumentar em um a Força ou a Destreza de um único tentáculo, ou para estender seu comprimento em mais dois metros. Cada tentáculo tem quatro níveis de vitalidade, é afetado por fogo e luz do sol como se fosse um vampiro, e absorve dano por contusão e letal usando o Vigor + Fortitude do vampiro. Dano agravado não pode ser absorvido.
Tentáculos podem constringir adversários, infligindo (Força +1) de dano letal por turno. Romper o agarrão de um tentáculo exige que a vítima vença uma rolagem resistida de Força contra o tentáculo (dificuldade 6 para cada). Contudo, tentáculos não podem ser usados para nenhum tipo de manipulação, como digitar ou dirigir.
Nem todos os tentáculos precisam emanar da mesma fonte — desde que haja múltiplas manchas de escuridão adequadas, há fontes para os Braços do Abismo. Controlar os tentáculos não exige concentração total; se o Membro não estiver incapacitado nem em torpor, ela pode controlar tentáculos enquanto realiza outras ações.

•••• Metamorfose Negra
Sistema: O jogador gasta dois pontos de sangue e faz uma rolagem de Manipulação + Coragem (dificuldade 7) — vampiros de Geração mais baixa podem precisar de dois turnos para fazer a transição. A falha indica que o vampiro não consegue realizar a Metamorfose Negra (embora gaste os pontos de sangue mesmo assim). Uma falha crítica inflige dois níveis de vitalidade de dano letal não absorvível ao vampiro, enquanto a escuridão devasta seu corpo morto-vivo.
Sob os efeitos da Metamorfose Negra, o vampiro possui quatro tentáculos semelhantes aos evocados por Braços do Abismo (embora seus valores de Força e Destreza sejam iguais aos Atributos do próprio vampiro, incluindo dados de Celeridade e Potência). Esses tentáculos, combinados às faixas de escuridão por todo o corpo do Membro, subtraem dois dados das paradas de Vigor e absorção de oponentes tocados fisicamente em combate, enquanto o vampiro mantiver contato com a vítima. Isso não é cumulativo com outros poderes de Tenebrosidade, embora os alvos possam asfixiar com Vigor 0, conforme Jogo de Sombras. O vampiro pode fazer um ataque adicional sem penalidade usando os tentáculos (para um total de dois ataques, não um ataque adicional por tentáculo). Além disso, o vampiro consegue sentir plenamente o ambiente mesmo na escuridão total.
A cabeça e as extremidades do vampiro às vezes parecem se desvanecer no nada, enquanto em outros momentos parecem envoltas numa escuridão de outro mundo. Isso, combinado aos tentáculos que se contorcem saindo do seu corpo, cria uma visão inquietante. Mortais, animais e outras criaturas não acostumadas a esse tipo de exibição precisam fazer rolagens de Coragem (dificuldade 8) ou sucumbir a um pânico equivalente ao Rötschreck (embora inspirado pela escuridão, e não pelo fogo). Muitos Membros cultivam esse aspecto diabólico, e a Metamorfose Negra soma três dados às paradas de Intimidação do Membro que a invoca.

••••• Forma Tenebrosa
Sistema: A transformação custa três pontos de sangue (que podem precisar ser gastos ao longo de três turnos, dependendo da Geração do vampiro). O vampiro é imune a ataques físicos enquanto está na forma tenebrosa (embora ainda sofra dano agravado de fogo e luz do sol), mas ela mesma não pode atacar fisicamente. Ela pode, contudo, envolver e escorrer sobre os outros, afetando-os da mesma maneira que um Manto da Noite, além de usar Disciplinas mentais. Vampiros em Forma Tenebrosa podem até se esgueirar por paredes e tetos ou "pingar" escuridão para cima — eles não têm massa e portanto não são afetados pela gravidade. As dificuldades de Rötschreck causadas por fogo e luz do sol aumentam em um para vampiros nessa forma, pois a luz é ainda mais dolorosa para seus corpos sombrios.
Mortais (e outros não acostumados a tais exibições) que testemunham o vampiro se transformar em sombra profana precisam de rolagens de Coragem (dificuldade 8) para evitar o terror debilitante descrito em Metamorfose Negra.]==],
				},
				["Ogham"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 461


Ogham


• Consagrar o Bosque
Sistema: O jogador gasta de um a três pontos de sangue, e o personagem precisa realizar o processo descrito acima. Um ponto de sangue desperta a vida vegetal num diâmetro de 3 metros; dois pontos de sangue dobram isso para 6 metros; três levam a 12 metros. Percorrer a área desejada leva um turno por ponto de sangue gasto.
Quando o sangue foi semeado, o jogador rola Carisma + Sobrevivência (dificuldade 6). Se a rolagem obtiver ao menos um sucesso, a vida vegetal se anima enquanto o mundo espiritual local é despertado para a ação. Inimigos na área sofrem -2 em todas as paradas de dados por distração e interferência física. Além disso, intrusos precisam fazer uma rolagem de Vigor + Esportes para evitar três dados de dano por contusão vindos da flora local (desde que a vida vegetal local seja capaz de tal dano; árvores e sarças provavelmente são, mas um prado de capim não contém o tipo de flora necessário para tal ataque). Uma falha crítica nessa rolagem faz as plantas se voltarem contra a própria Lhiannan.
Este poder dura uma cena.

•• Glasto Carmesim
Sistema: O personagem gasta uma cena traçando o glasto no corpo; isso custa um ponto de sangue. O jogador então rola Inteligência + Ocultismo (dificuldade 7). Cada sucesso permite ao personagem ignorar um dado de penalidade por ferimento. Também subtrai um da dificuldade para evitar frenesi ou Rötschreck. Essa habilidade dura uma cena. Além disso, se o personagem receber mais de quatro níveis de vitalidade de dano, as inscrições místicas são arruinadas e os espíritos fogem do seu corpo.
A Lhiannan também pode desferir um golpe contra seus inimigos, somando a fúria do glasto ao seu ataque. O jogador pode somar o número de sucessos obtidos na rolagem acima ao número de dados rolados para dano num único ataque corpo a corpo (essa habilidade só pode ser usada uma vez por aplicação de Glasto Carmesim).

••• Inscrever a Maldição
Sistema: O jogador gasta três pontos de sangue. A Lhiannan precisa escrever o nome do adversário em sangue, e ele precisa estar exposto numa parte do seu corpo visível ao alvo pretendido para que Inscrever a Maldição faça efeito. O jogador escolhe qual maldição lançar sobre o alvo a partir da lista abaixo; a maldição entra em vigor assim que o alvo vê seu nome. Ele não precisa entender a língua usada, mas se conseguir compreendê-la pode resistir à maldição com uma rolagem de Raciocínio + Ocultismo (dificuldade 8).
As maldições descritas abaixo expiram quando o glifo é apagado, se desgasta ou é desfigurado pela Lhiannan sofrer quatro ou mais níveis de vitalidade de dano. A maldição funciona de modo diferente conforme o lugar em que a Lhiannan inscreve o nome do alvo.
Corpo: Inscreva o nome nos braços, nas pernas ou no ventre. O corpo da vítima adoece e enfraquece (+2 em todas as dificuldades de rolagens Físicas, e todas as penalidades de ferimento aumentam em um dado) ou, no caso de Cainitas, a vítima não pode usar sangue além do ponto por dia necessário para permanecer ativa.
Mente: Inscreva o nome atravessando a testa. O adversário fica confuso enquanto partes da sua mente se desconectam umas das outras; ele precisa gastar um ponto de Força de Vontade para tentar qualquer rolagem de Conhecimento ou usar qualquer habilidade mágica ou Disciplina (que não seja Celeridade, Fortitude ou Potência). Essa Força de Vontade não lhe compra um sucesso naquela rolagem; simplesmente permite que ele a faça.
Voz: Inscreva o nome na garganta. A vítima perde o poder da fala; pode grunhir ou gemer, mas não consegue dizer palavra alguma.
Alma: Inscreva o nome descendo pelo esterno e sobre o coração. O sujeito perde a vontade de resistir à Besta: as dificuldades para evitar frenesi aumentam em dois. Não-vampiros são tomados pelo medo. O alvo precisa fugir do território da Lhiannan a menos que obtenha sucesso numa rolagem de Coragem (dificuldade 8).

•••• Lua e Sol
Sistema: O jogador gasta três pontos de sangue. A Lhiannan inscreve o sinete desejado no corpo ao longo de 15 minutos. O sinete pode ser inscrito em qualquer lugar, mas precisa estar exposto. O personagem pode escolher inscrever tanto a lua quanto o sol, mas cada símbolo exige o gasto de sangue e 15 minutos para ser traçado. Ela também pode inscrever esses sinetes em qualquer sujeito voluntário.
O emblema do sol protege um vampiro dos piores efeitos do fogo e da luz do sol. Enquanto o símbolo permanecer no corpo do personagem, o jogador faz uma rolagem de Vigor (dificuldade 8) quando afligido por fogo ou luz do sol. Se a rolagem for bem-sucedida, o dano é considerado letal e o jogador pode rolar para absorvê-lo normalmente. Essa rolagem precisa ser feita toda vez que o personagem enfrentar tal dano.
O emblema da lua soma um às dificuldades das rolagens de Autocontrole/Instinto para evitar frenesi (mas não às rolagens de Coragem para evitar Rötschreck). Outros efeitos do emblema da lua dependem da fase atual da lua:
Lua Nova: Some um dado às paradas de Destreza e Furtividade.
Lua Crescente: Some um dado às paradas de Raciocínio e Ocultismo.
Quarto de Lua: Some um dado às paradas de Percepção e Subterfúgio.
Lua Gibosa: Some um dado às paradas de Carisma e Expressão.
Lua Cheia: Some um dado às paradas de Força e Briga.

••••• Beber a Terra até Secar
Sistema: O jogador rola Percepção + Ocultismo (dificuldade 8). Um sucesso determina se um dado local é um sítio adequado (decisão geralmente deixada nas mãos do Narrador, embora uma Lhiannan com um Antecedente Domínio alto possa ter um sítio desses dentro dos seus domínios). Dois ou mais sucessos nessa rolagem concedem uma ideia aproximada do poder do sítio numa escala de 1 a 5. Se o personagem quiser explorar o poder daquele local, ela precisa gastar uma cena e um ponto de sangue marcando várias partes do sítio com sinetes de poder, chaves para que seu estilhaço espiritual destranque as energias do lugar.
Uma vez preparado o sítio, o jogador faz uma segunda rolagem reflexiva de Percepção + Ocultismo (dificuldade 7). Quaisquer sucessos acima do valor de poder do sítio são ignorados. Para cada sucesso, o jogador ganha dois dados, que ela pode somar a quaisquer paradas de dados (exceto as para evitar frenesi ou Rötschreck) pelo resto da cena. Esses dados somem quando usados, mas o personagem pode explorar o mesmo local de novo, de turno em turno. O jogador precisa fazer a rolagem de Percepção + Ocultismo a cada vez. Cada "gole" das energias do sítio o esgota, porém, como descrito abaixo.
O estilhaço espiritual da Lhiannan é uma coisa gananciosa, vestindo como veste a roupagem da Besta de um Cainita, e bebe as energias do sítio de modo imprudente. Uma Lhiannan só pode obter um número de sucessos igual a 10 vezes o valor de poder do sítio, ponto a partir do qual a área se transforma num ermo estéril, incapaz de sustentar vida. Esse tipo de atividade em particular certamente atrairá a atenção de Lupinos ou magos. Um sítio pode se reabastecer ao longo de anos. Contudo, um sítio explorado com Beber a Terra até Secar em qualquer momento do ano é incapaz de repor os dados perdidos naquele ano, e se o sítio for completamente drenado, está irrevogavelmente morto.]==],
				},
				["Potence"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 192


Potence


Sistema: Cada ponto que o vampiro tem em Potência acrescenta um dado a todas as rolagens relacionadas a Força. Além disso, o jogador pode gastar um ponto de sangue e transformar seus dados de Potência num número igual de sucessos automáticos em todas as rolagens relacionadas a Força naquele turno. Em combate com armas brancas e briga, os sucessos vindos de Potência (rolados ou automáticos) são aplicados aos resultados da rolagem de dano.]==],
				},
				["Presence"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 193


Presence


• Assombro
Sistema: O jogador gasta um ponto de sangue e rola Carisma + Performance (dificuldade 7). O número de sucessos rolados determina quantas pessoas são afetadas, conforme a tabela abaixo. Se houver mais pessoas presentes do que o personagem pode influenciar, Assombro afeta primeiro as de menor valor de Força de Vontade. O poder permanece em vigor pelo resto da cena ou até que o personagem escolha encerrá-lo.
1 sucesso — Uma pessoa
2 sucessos — Duas pessoas
3 sucessos — Seis pessoas
4 sucessos — 20 pessoas
5 sucessos — Todos nas imediações do vampiro (um auditório inteiro, uma multidão)
Os afetados podem usar pontos de Força de Vontade para superar o efeito, mas precisam continuar gastando Força de Vontade a cada cena enquanto permanecerem na mesma área que o vampiro. Assim que um indivíduo gastar um número de pontos de Força de Vontade igual aos sucessos rolados, ele se livra completamente do Assombro e permanece imune pelo resto da noite.

•• Olhar Aterrador
Sistema: O jogador rola Carisma + Intimidação (dificuldade igual ao Raciocínio + Coragem da vítima). O sucesso indica que a vítima é acovardada, enquanto a falha significa que o alvo fica assustado, mas não aterrorizado com a visão. Três ou mais sucessos significam que ele foge em medo absoluto; vítimas que não têm para onde correr arranham as paredes, na esperança de cavar uma saída em vez de encarar o vampiro. Além disso, cada sucesso subtrai um das paradas de dados de ação do alvo no turno seguinte.
O personagem pode tentar Olhar Aterrador uma vez por turno contra um único alvo, embora também possa executá-lo como ação estendida, somando seus sucessos para subjugar o alvo completamente. Uma vez que o alvo perde dados suficientes para não conseguir realizar nenhuma ação, ele fica tão abalado e aterrorizado que se encolhe no chão e chora. A falha durante a ação estendida significa que a tentativa fracassa. O personagem perde todos os sucessos acumulados e pode recomeçar no turno seguinte, enquanto a vítima pode agir normalmente de novo.
Uma falha crítica a qualquer momento indica que o alvo não fica nem um pouco impressionado — talvez até ache as palhaçadas do vampiro cômicas — e permanece imune a quaisquer outros usos de Presença por parte do personagem pelo resto da história.

••• Enlevo
Sistema: O jogador gasta um ponto de sangue e rola Aparência + Empatia (dificuldade igual aos pontos atuais de Força de Vontade do alvo); o número de sucessos determina por quanto tempo o sujeito fica Enlevado, conforme a tabela abaixo. (Sujeitos ainda podem gastar Força de Vontade para resistir temporariamente, como em qualquer outro poder de Presença.) O Narrador pode preferir fazer a rolagem, já que o personagem nunca tem certeza da força do seu domínio sobre a vítima. O vampiro pode tentar manter o sujeito sob seu jugo, mas só depois que o Enlevo inicial passar. Tentar esse poder enquanto o Enlevo já está em operação não tem efeito.
Falha crítica — O sujeito não pode ser enlevado pelo resto da história.
Falha — O sujeito não pode ser enlevado pelo resto da noite.
1 sucesso — Uma hora
2 sucessos — Um dia
3 sucessos — Uma semana
4 sucessos — Um mês
5 sucessos — Um ano

•••• Convocação
Sistema: O jogador gasta um ponto de sangue e rola Carisma + Subterfúgio. A dificuldade base é 5; ela sobe para 7 se o sujeito foi encontrado apenas brevemente. Se o personagem usou Presença com sucesso no alvo no passado, essa dificuldade cai para 4, mas se a tentativa foi malsucedida, a dificuldade sobe para 8.
O número de sucessos indica a velocidade e a atitude do sujeito ao responder:
Falha crítica — O sujeito não pode ser Convocado por aquele vampiro pelo resto da história.
Falha — O sujeito não pode ser Convocado por aquele vampiro pelo resto da noite.
1 sucesso — O sujeito se aproxima devagar e hesitante.
2 sucessos — O sujeito se aproxima com relutância e é facilmente barrado por obstáculos.
3 sucessos — O sujeito se aproxima com velocidade razoável.
4 sucessos — O sujeito vem com pressa, superando quaisquer obstáculos no seu caminho.
5 sucessos — O sujeito corre até o vampiro, fazendo qualquer coisa para chegar até ela.

••••• Majestade
Sistema: Nenhuma rolagem é exigida da parte do vampiro, mas ela precisa gastar um ponto de Força de Vontade. Um sujeito precisa fazer uma rolagem de Coragem (dificuldade igual ao Carisma + Intimidação do vampiro, até um máximo de 10) se quiser ser grosseiro ou simplesmente contrário ao vampiro. O sucesso permite ao indivíduo agir normalmente naquele momento, embora ele sinta o peso do desagrado do vampiro esmagando-o. Um sujeito que falhe na rolagem aborta a ação pretendida e chega a ir a extremos absurdos para se humilhar diante do vampiro, não importa quem mais esteja assistindo. Os efeitos da Majestade duram uma cena.]==],
				},
				["Protean"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 199


Protean


• Olhos da Besta
Sistema: O personagem precisa declarar seu desejo de invocar os Olhos. Nenhuma rolagem é necessária, mas a mudança exige um turno inteiro para se completar. Enquanto manifesta os Olhos, o personagem sofre +1 de dificuldade em todas as rolagens Sociais com mortais, a menos que tome medidas para proteger os olhos (óculos escuros são a solução mais simples). (Um vampiro sem esse poder que esteja imerso em escuridão total sofre as penalidades de combate às cegas conforme a p. 274.)

•• Garras Ferinas
Sistema: As garras crescem automaticamente em resposta ao desejo do personagem, e podem crescer tanto das mãos quanto dos pés. A transformação exige o gasto de um ponto de sangue, leva um único turno para se completar e dura uma cena.
O personagem ataca normalmente em combate, mas as garras infligem Força + 1 de dano agravado. Outros sobrenaturais normalmente não conseguem absorver esse dano, embora um poder como Fortitude possa ser usado. Além disso, as dificuldades de todas as rolagens de escalada são reduzidas em dois.

••• Fusão com a Terra
Sistema: Nenhuma rolagem é necessária, embora o personagem precise gastar um ponto de sangue. Afundar na terra é automático e leva um turno para se completar. O personagem cai num estado um passo acima do torpor durante esse tempo, sentindo o ambiente apenas distantemente. O jogador precisa fazer uma rolagem de Humanidade ou Caminho (dificuldade 6) para que o personagem desperte em resposta a um perigo antes do momento desejado de emergir.
Como o personagem está num estado intermediário, quaisquer tentativas de localizá-lo (captar seu cheiro, escanear sua aura, viajar astralmente e assim por diante) são feitas com +2 de dificuldade. Indivíduos astrais não conseguem afetar o vampiro diretamente, encontrando em vez disso uma espécie de resistência esponjosa enquanto suas mãos o atravessam. Do mesmo modo, cavar no mundo material encontra terra incrivelmente compactada, praticamente tão densa quanto pedra.
Tentativas de violência contra o vampiro submerso, de qualquer um dos lados, o devolvem à sua natureza física, expelindo o solo ao qual se ligou num jato ofuscante (todas as rolagens baseadas em Percepção ficam com +2 de dificuldade naquele turno). O próprio personagem subtrai dois da sua iniciativa no primeiro turno após sua restauração, devido à desorientação momentânea. Uma vez expelido da terra, o vampiro pode agir normalmente.

•••• Forma da Besta
Sistema: O personagem gasta um ponto de sangue para assumir a forma desejada. A transformação exige três turnos para se completar (gastar pontos de sangue adicionais reduz o tempo de transformação em um turno por ponto gasto, até um mínimo de um). O vampiro permanece na sua forma bestial até o amanhecer seguinte, a menos que deseje voltar antes.
Enquanto na forma do animal, o vampiro pode usar qualquer Disciplina que possua, exceto Necromancia, Serpentis, Taumaturgia ou Vicissitude (bem como quaisquer outras que o Narrador julgue indisponíveis). Além disso, cada forma dá ao personagem as capacidades daquela criatura. Em forma de lobo, os dentes e garras do vampiro infligem Força + 1 de dano agravado, ele pode correr no dobro da velocidade e as dificuldades de todas as rolagens de Percepção são reduzidas em dois. Em forma de morcego, a Força do vampiro é reduzida a 1, mas ele pode voar a até 30 quilômetros por hora, as dificuldades de todas as rolagens de Percepção baseadas em audição são reduzidas em três, e ataques feitos contra ele ficam com +2 de dificuldade devido ao seu tamanho pequeno.
O Narrador pode permitir que os Gangrel assumam uma forma animal diferente, mas deve estabelecer as capacidades naturais que ela concede ao personagem.

••••• Forma de Névoa
Sistema: Nenhuma rolagem é exigida, embora um ponto de sangue precise ser gasto. A transformação leva três turnos para se completar, embora o personagem possa reduzir esse tempo em um turno para cada ponto de sangue adicional gasto (até um mínimo de um turno). Ventos fortes podem sacudir o personagem, embora Disciplinas como Potência possam ser usadas para resistir a eles. Vampiros em Forma de Névoa conseguem perceber o ambiente normalmente, embora não possam usar poderes que exijam contato visual.
O vampiro é imune a todos os ataques físicos mundanos enquanto está em forma de névoa, embora ataques sobrenaturais o afetem normalmente. Além disso, o vampiro sofre um dado a menos de dano de fogo e luz do sol. O personagem não pode atacar outros fisicamente nesse estado — isso inclui encontrar outro vampiro em forma de névoa. Ele pode usar Disciplinas que não exijam substância física, porém.]==],
				},
				["Quietus"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 203


Quietus


• Silêncio da Morte
Sistema: Este poder (que custa um ponto de sangue para ativar) mantém um raio de 6 metros de quietude absoluta ao redor do Membro por uma hora.

•• Toque do Escorpião
Sistema: Para converter um pouco do seu sangue em veneno, o jogador do Membro gasta ao menos um ponto de sangue e rola Força de Vontade (dificuldade 6). Se essa rolagem for bem-sucedida, e o vampiro acertar (mas não necessariamente danificar) seu oponente, o alvo perde um número de pontos de Vigor igual ao número de pontos de sangue convertidos em veneno — vampiros que tentem beber o sangue do Membro com Toque do Escorpião são automaticamente considerados como "acertados com sucesso".
A vítima pode resistir ao veneno com uma rolagem de Vigor + Fortitude (dificuldade 6); os sucessos obtidos na rolagem de resistência subtraem-se dos sucessos do vampiro. O número máximo de pontos de sangue que um Membro pode converter de uma vez é igual ao seu Vigor. O número de sucessos obtidos indica a duração da perda de Vigor.
1 sucesso — Um turno
2 sucessos — Uma hora
3 sucessos — Um dia
4 sucessos — Um mês
5 sucessos — Permanentemente (embora o Vigor possa ser recomprado com experiência)
Se o Vigor de um mortal cair a zero pelo uso do Toque do Escorpião, ela fica terminalmente doente e perde qualquer imunidade a doenças, seu corpo sucumbindo a enfermidades dentro de um ano, a menos que de algum modo consiga aumentar o Vigor de novo. Se o Vigor de um Membro cair a zero, o vampiro entra em torpor e assim permanece até que um dos seus pontos de Vigor retorne. Se um Membro for permanentemente reduzido a Vigor zero, ela só pode se recuperar do torpor por meios místicos.
Para afligir alguém com o veneno, o Cainita precisa tocar a carne do alvo ou acertá-lo com algo que carregue a peçonha. Muitos Assamitas untam suas armas com a secreção, enquanto outros acumulam a toxina nas mãos (ou salpicam os lábios com o veneno, para um "beijo da morte") e a pressionam contra os oponentes. Armas assim envenenadas precisam ser do tipo corpo a corpo — flechas, pedras de funda, balas, armas de arremesso e afins não conseguem carregar material suficiente para causar dano, ou ele escorre em voo. Jogadores cujos vampiros queiram cuspir nos alvos precisam fazer uma rolagem de Vigor + Esportes (dificuldade 6). Não mais que dois pontos de sangue de veneno podem ser expectorados, e um Membro pode cuspir a uma distância de 3 metros para cada ponto de Força (e Potência) que o personagem possua. Vampiros com Quietus são imunes ao próprio veneno, mas não ao sangue-peçonha de outros Membros com esse poder.

••• Chamado de Dagon
Sistema: O vampiro precisa tocar seu alvo antes de usar o Chamado de Dagon. Dentro de uma hora depois disso, o vampiro pode emitir o chamado, embora não precise estar na presença nem sequer no campo de visão do alvo.
Invocar o poder custa um ponto de Força de Vontade. O jogador do Membro faz uma rolagem resistida de Vigor contra o Vigor do alvo; a dificuldade de cada rolagem é igual ao valor de Força de Vontade permanente do oponente. O número de sucessos que o vampiro usando o Chamado de Dagon obtiver é a quantidade de dano letal, em níveis de vitalidade, que a vítima sofre. Por um ponto adicional de Força de Vontade gasto no turno seguinte, o vampiro pode continuar usando o Chamado de Dagon fazendo outra rolagem resistida de Vigor. Enquanto o jogador do Membro continuar gastando Força de Vontade, o personagem pode continuar dilacerando seu oponente por dentro.

•••• Carícia de Baal
Sistema: Carícia de Baal não aumenta o dano causado por uma dada arma, mas essa arma inflige dano agravado em vez de normal. Nenhuma rolagem é necessária para ativar esse poder, mas um ponto de sangue é consumido por acerto. Por exemplo, se um Cainita envenena sua faca e golpeia o oponente (mesmo sem infligir dano), um ponto de sangue de lubrificação desaparece. Por essa razão, muitos vampiros escolhem cobrir suas armas com uma quantidade significativa de sangue. Se o vampiro errar, nenhum sangue contaminado é consumido.

••••• Sabor da Morte
Sistema: O vampiro pode cuspir até 3 metros para cada ponto de Força e Potência que possua. Acertar o alvo exige uma rolagem de Vigor + Esportes (dificuldade 6). Cada ponto de sangue jorrado no alvo inflige dois dados de dano agravado, e não há limite (além da capacidade do vampiro e do máximo de gasto por turno) para a quantidade de sangue com que um alvo pode ser inundado.]==],
				},
				["Sanguinus"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 463


Sanguinus


• Sangue do Irmão
Sistema: O jogador gasta um ponto de sangue, que pode ser usado para curar qualquer membro do círculo, independentemente da distância em relação ao personagem. O Irmão de Sangue também pode "poupar" sangue, gastando cinco pontos para curar um ferimento agravado de outro ao longo de vários turnos. Esse poder tem efeito automático; nenhuma rolagem é necessária. Sangue gasto por outro Frankenstein não conta contra a quantidade máxima de vitae que o personagem alvo pode gastar por turno.

•• Octópode
Sistema: O jogador "doador" gasta um ponto de sangue para cada membro ou órgão que queira emprestar ao outro membro do círculo. (Só o doador precisa ter esse nível de maestria em Sanguinus; o receptor pode ser qualquer outro membro do círculo do doador.) Os órgãos emprestados aparecem no fim daquele turno, no local que o receptor quiser — já se viram olhos na nuca ou nas pontas das mãos, assim como cabeças inteiras localizadas entre as pernas de um Irmão de Sangue. O uso desse poder não confere ataques extras, mas pode permitir entrada sensorial adicional, mais sangue consumido num único turno, ou mãos extras para segurar armas ou imobilizar adversários. Apenas órgãos externos podem ser emprestados dessa maneira — corações, estômagos e cérebros não.

••• Gestalt
Sistema: Este poder confere vários benefícios aos Irmãos de Sangue. Para que funcione, porém, todo Irmão de Sangue do círculo precisa gastar um ponto de sangue. Se sequer um membro não puder ou não quiser gastar um ponto de sangue, esse poder falha. Uma vez que um Irmão de Sangue encontra a Morte Final, ele deixa de fazer parte do círculo, de modo que o poder continua funcionando entre os membros ainda mortos-vivos do grupo. Gestalt dura uma cena. Enquanto esse poder está ativo:
• Dominação, Presença e afins fazem efeito contra o maior valor de Força de Vontade do círculo. Por exemplo, se um vampiro tentar Dominar um Irmão de Sangue sob a influência do Gestalt, ela precisa rolar contra o maior valor de Força de Vontade que qualquer um dos vampiros do círculo possua, mesmo que seu sujeito tenha o menor valor de Força de Vontade do círculo. Além disso, um Irmão de Sangue afetado por poderes dessa maneira sai do Gestalt, embora o Gestalt permaneça ativo para os outros. Esse "fusível" mental teria sido criado para impedir que o círculo inteiro fosse Dominado por um vampiro olhando nos olhos de um único Irmão de Sangue.
• As dificuldades de Percepção de todos os Irmãos de Sangue do círculo diminuem em três, pois eles compartilham a entrada sensorial dos outros vampiros do círculo.
• Não realizando nenhuma ação além de se concentrar, um Irmão de Sangue pode "emprestar" uma Habilidade a outro irmão. Por exemplo, um vampiro ferido com Armas Brancas 4 pode sair do combate e emprestar a um companheiro de círculo com Armas Brancas 2 seu domínio daquela Perícia. O vampiro que "toma emprestado" faz testes de Habilidade contra o Traço emprestado como se fosse seu.
• Os Irmãos de Sangue no Gestalt podem se comunicar por telepatia, o que lhes permite coordenar ações. Em termos de jogo, apenas uma rolagem de iniciativa é feita para o círculo, baseada no personagem com o maior valor de iniciativa (veja a p. 271).
Nem todos os Irmãos de Sangue do círculo precisam ter esse nível de Sanguinus para se beneficiar do Gestalt. Se um dado personagem não conhece esse poder, porém, o jogador rola Raciocínio + Ocultismo (dificuldade 7) quando o poder é ativado. Se essa rolagem falhar, o personagem ainda pode receber Habilidades emprestadas, mas não ganha nenhum outro benefício do Gestalt.

•••• Caminhada de Caim
Sistema: Cada membro do círculo pode "doar" um degrau de Geração. No exemplo acima, o vampiro de Décima Primeira Geração poderia tomar um degrau de cada um dos seus dois companheiros de círculo e cair para a Nona, mas o vampiro de Décima Terceira Geração não poderia cair abaixo da Décima Primeira. Não importa o tamanho do círculo, nenhum Irmão de Sangue pode cair a uma Geração efetiva inferior à Quarta. Do mesmo modo, um Irmão de Sangue de Décima Terceira Geração pode cair a uma Geração efetiva de Décima Quarta, o que traz consigo as penalidades listadas no Defeito Décima Quarta Geração (p. 481). (Ele não pode ir para a Décima Quinta Geração, porém.)
Como no Gestalt, apenas um Irmão de Sangue precisa conhecer esse poder para iniciar o processo. Os que não tiverem Caminhada de Caim precisam fazer uma rolagem de Vigor + Consciência (dificuldade 7). Se essa rolagem falhar, eles não podem participar da ação.

••••• Entidade Coagulada
Sistema: Todo vampiro do círculo que deseje se tornar parte da Entidade Coagulada gasta três pontos de sangue. Três turnos depois de o processo começar, o monstro está completo e apto a agir. O vampiro de Geração mais baixa que faz parte do constructo guia as ações da criatura. A Geração real da própria criatura, contudo, é a Geração mais alta de qualquer vampiro presente no constructo, menos um para cada vampiro adicional presente no constructo. (Usando o exemplo anterior, o vampiro de Décima Primeira Geração seria o guia, mas a Geração mais alta é 13, então a Entidade geral seria 13 menos 2, ou Décima Primeira Geração.)
A Força, o Vigor e a Percepção da criatura são iguais aos do guia, com +1 para cada vampiro adicional contido nela. (Limites de Geração não se aplicam a essa criatura — por puro tamanho, uma Entidade Coagulada pode ter Força 7 ou mais.) Todas as ações físicas empreendidas pela monstruosidade ganham um dado extra na parada para cada vampiro além do primeiro presente no constructo (antes de dividir as paradas de dados).
Apenas um vampiro do círculo precisa possuir Sanguinus em Nível Cinco para que esse poder funcione. Partes do corpo tendem a se deslocar durante a criação de uma Entidade Coagulada — fauces cheias de presas nas pontas das mãos e olhos no alto de hastes carnudas já foram relatados por sobreviventes aterrorizados. Narradores devem se sentir à vontade para dar quaisquer bônus (ou penalidades) ao constructo como acharem melhor.
Uma Entidade Coagulada não pode ser empalada, pois tem corações demais em lugares nada convencionais para que qualquer coisa além da sorte mais cega os transpasse. Ela tem os sete níveis de vitalidade normais de um vampiro, mais dois para cada vampiro adicional que se torne parte da entidade (trate esses níveis de vitalidade extras como Escoriado). A entidade permanece coagulada por uma cena, a menos que o Narrador queira decidir que ninguém mandou os Irmãos de Sangue se separarem.]==],
				},
				["Serpentis"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 209


Serpentis


• Os Olhos da Serpente
Sistema: Nenhuma rolagem é exigida, mas esse poder pode ser evitado se o mortal tomar cuidado para não olhar nos olhos do vampiro. Vampiros e outras criaturas sobrenaturais também podem ser afetados por esse poder se o jogador do Cainita obtiver sucesso numa rolagem de Força de Vontade (dificuldade 9). Se atacadas ou de outro modo feridas, criaturas sobrenaturais podem gastar um ponto de Força de Vontade para quebrar o encanto.
Nota: Isto é diferente do contato visual normal detalhado na p. 152. O alvo precisa conseguir ver os olhos do vampiro para que Os Olhos da Serpente funcionem.

•• A Língua da Áspide
Sistema: O açoite da bifurcação afiada da língua causa ferimentos agravados (dificuldade 6, dano de Força). Se o Membro ferir seu inimigo, ela pode beber sangue do alvo no turno seguinte como se tivesse cravado as presas no pescoço da vítima. Por mais horrendo que seja, o afago da língua é muito parecido com o Beijo, e deixa vítimas mortais indefesas de medo e êxtase. Além disso, a língua é altamente sensível a vibrações, permitindo ao vampiro funcionar com eficácia na escuridão que o Clã prefere. Estalando a língua para dentro e para fora da boca, o vampiro pode reduzir pela metade quaisquer penalidades relativas à escuridão (p. 274).

••• A Pele da Víbora
Sistema: O vampiro gasta um ponto de sangue e um ponto de Força de Vontade. Sua pele fica escamosa e mosqueada; isso, combinado à flexibilidade aumentada do personagem, reduz as dificuldades de absorção para 5. O vampiro pode usar seu Vigor para absorver dano agravado de garras e presas, mas não de fogo, luz do sol ou outras energias sobrenaturais. A boca do vampiro se alarga e as presas se alongam, permitindo que sua mordida inflija um dado extra de dano. Por fim, o vampiro pode passar por qualquer abertura larga o bastante para caber sua cabeça.
A Aparência do vampiro cai para 1, e ela é obviamente inumana se observada com algum grau de atenção, embora transeuntes casuais possam não notar, se o vampiro estiver na escuridão ou usando roupas pesadas.

•••• A Forma da Cobra
Sistema: O vampiro gasta um ponto de sangue; a mudança é automática, mas leva três turnos. Roupas e pequenos pertences pessoais se transformam junto com o vampiro. O vampiro permanece em forma de serpente até o amanhecer seguinte, a menos que deseje voltar antes. O Narrador pode conceder ao Setita dados de bônus em todas as rolagens de Percepção relacionadas ao olfato, mas as dificuldades de todas as rolagens de audição aumentam em dois. A mordida da naja inflige dano igual ao do vampiro, mas o vampiro não precisa agarrar sua vítima; além disso, o veneno aplicado é fatal para mortais.

••••• O Coração das Trevas
Sistema: Este poder não exige rolagem. Aqueles que testemunham um vampiro arrancar o coração do peito (ou cortar o coração de outro vampiro) precisam fazer rolagens de Coragem. A falha indica desde forte desconforto até repulsa completa, possivelmente até Rötschreck.]==],
				},
				["Setite Sorcery"] = {
					pt = [==[Rites of Blood, pág. 36


Setite Sorcery


Existem muitos tipos diferentes de feitiçaria Setita, do wanga semelhante ao vodu ao akhu de base egípcia. As Serpentes da Luz, e seu Clã de origem, os Seguidores de Set, dedicaram grande energia à prática da magia, criando uma série de teosofias radicalmente diferentes a respeito de conjuração e encantamento.
As Serpentes da Luz rejeitam a doutrina Teofidiana (baseada em Set) em todas as suas formas. Aceitam o lugar de Caim como o primeiro vampiro, em vez de aderir às crenças do seu Clã de origem de que Set não descenderia do Pai Sombrio. As Serpentes da Luz acreditam que, através da morte, é possível se tornar um deus. Se ficarem poderosas o bastante, acreditam, poderão se erguer para tomar o domínio da terra, e o controle do mundo espiritual também. Quando um grupo de Setitas egípcios militantes (mais da metade deles Seguidores de Set Guerreiros) tentou forçar as serpentes do Novo Mundo a aceitar sua Ortodoxia, empurrou um grande número de Setitas afro-caribenhos para a Espada de Caim. Por causa desse cisma de doutrina (tanto mágica quanto teosófica), as Serpentes da Luz nutrem grande amargura contra os Seguidores de Set, e frequentemente buscam a destruição do seu Clã de origem.
A feitiçaria das Serpentes da Luz exige muitos níveis de iniciação. Um buscador atravessa círculos de mistério e aprende mais a cada passo ao longo da trilha. As quatro Serpentes da Luz que detêm a iniciação mais alta são chamadas de empereurs, e esses vampiros são receptáculos da maioria da sabedoria e do conhecimento Cobra. Por causa da natureza da sua tutela iniciática, os Cobras são ainda mais ciosos dos seus segredos mágicos que a maioria dos outros taumaturgos da Seita, recusando-se a compartilhar o conhecimento das suas práticas rituais mesmo com outros Cobras – a menos que esses adeptos tenham passado pelos ritos de iniciação apropriados.]==],
				},
				["Spiritus"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 465


Spiritus


• Auxílio dos Espíritos
Sistema: O personagem toca o objeto, e o jogador gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade 6). Se a rolagem for bem-sucedida, o jogador recebe um bônus na sua parada de dados ao usar aquele item, igual ao número de sucessos rolados. Por exemplo, se o personagem usar esse poder numa arma de fogo e o jogador rolar três sucessos, ela recebe +3 na sua próxima rolagem de Armas de Fogo feita com aquela arma. Bônus não usados desaparecem no fim da cena, e múltiplos usos desse poder não se combinam (o uso mais recente prevalece sobre os anteriores). O personagem pode, contudo, usar o poder em vários objetos que utilize na mesma cena, contanto que tenha sangue para isso.

•• Invocar Feras Espirituais
Sistema: O animal invocado precisa ser nativo da área — só porque o zoológico local abriga um tigre não significa que haja espíritos-tigre por aí. O jogador precisa gastar um ponto de sangue e rolar Carisma + Empatia com Animais (dificuldade 7). O número de sucessos indica por quanto tempo o espírito permanece material. Os espíritos têm o mesmo número de níveis de vitalidade que suas contrapartes físicas normalmente teriam (veja a p. 388 para alguns traços de animais de exemplo). Se forem reduzidos a Incapacitado, eles se descorporificam.
1 sucesso — Um turno
2 sucessos — Cinco turnos
3 sucessos — Uma hora
4 sucessos — Uma noite
5 sucessos — Uma semana

••• Aspecto da Besta
Sistema: O jogador gasta um ponto de sangue e rola Manipulação + Ocultismo (dificuldade 7). O poder dura um turno por sucesso, salvo indicação em contrário. Alguns exemplos de aspectos são dados abaixo, embora o jogador e o Narrador estejam livres para inventar outros:
Mordida do Castor — Torna a mordida da Ahrimane forte e afiada o bastante para cortar quase qualquer substância (embora não cause dano adicional a alvos vivos ou não-vivos).
Cores do Camaleão — A Ahrimane se torna capaz de mudar de cor para se adequar ao ambiente (-2 de dificuldade em todas as rolagens de Furtividade que envolvam se esconder).
Orelhas da Lebre — A Ahrimane consegue ouvir tão bem quanto um coelho, reduzindo em dois a dificuldade das rolagens de Percepção que envolvam audição.
Olho do Falcão — A Ahrimane consegue enxergar a grandes distâncias como se tivesse os olhos de um falcão (-3 em todas as rolagens de Percepção que envolvam visão).
Ferocidade do Puma — Todas as rolagens de Coragem são feitas com -2 de dificuldade.
Salto da Rã — Concede à Ahrimane a capacidade de saltar três vezes a altura e a distância normais. (Veja a p. 260 para as regras de salto.)
Focinho do Cão — O olfato da Ahrimane é muito superior ao de um mortal. Ela pode até rastrear por cheiro com uma rolagem de Percepção + Sobrevivência (dificuldade definida pelo Narrador).
Peçonha da Serpente — A mordida da Ahrimane transmite uma toxina venenosa que causa dois níveis de vitalidade de dano em vítimas vivas por turno (veja "Venenos e Drogas", p. 301). O dano continua até que a toxina seja removida ou neutralizada, ou até que o poder espiritual da Ahrimane termine.
Som do Grilo — Concede o poder de produzir um som irritante e estridente, alto o bastante para ensurdecer quem estiver por perto. O alvo sofre +4 em todas as rolagens de Percepção relacionadas à audição pela próxima cena, a menos que obtenha sucesso numa rolagem de Força de Vontade (dificuldade 7).
Equilíbrio do Esquilo — A Ahrimane consegue se mover pelos galhos e ramos das árvores ou por cordas bambas com pouco medo de cair. Todas essas rolagens de Esportes têm suas dificuldades reduzidas em dois.
Força do Urso — Dá à Ahrimane dois pontos extras de Força.
Rapidez do Cervo — A Ahrimane pode se mover no dobro da sua velocidade normal de corrida.

•••• Fúria Engling
Sistema: O jogador rola Manipulação + Intimidação (dificuldade 8). Cada sucesso permite a ela recuperar um ponto de Força de Vontade, mas cada uso desse poder destrói mais um espírito.

••••• A Fera Selvagem
Sistema: A mudança não exige rolagem, mas o jogador precisa gastar dois pontos de sangue. A mudança eleva a Força do vampiro em três, e a Destreza e o Vigor em dois cada. A Aparência cai para 0 e a Manipulação é reduzida em três. As presas do vampiro infligem um dado extra de dano, e ela ganha garras que infligem dano agravado. O personagem consegue enxergar no escuro, e todas as dificuldades envolvendo olfato, audição e visão caem em dois. O personagem pode manter a forma de Fera Selvagem por um número de horas por noite igual ao seu valor de Força de Vontade.]==],
				},
				["Temporis"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 467


Temporis


• Ampulheta da Mente
Sistema: Uma vez comprada, essa Disciplina dá ao vampiro um senso perfeito de tempo. O vampiro conhece os eventos com precisão de segundos ou melhor. Além disso, o Cainita sabe sempre que o fluxo do tempo é misticamente perturbado pelo uso de Celeridade, por níveis maiores de Temporis, por magia mortal ou por coisas mais estranhas. Sentir perturbações é instintivo e reflexivo, embora exija uma rolagem bem-sucedida de Percepção + Consciência (dificuldade 6 para a maioria dos fenômenos, modificada pelo Narrador conforme distância e intensidade).

•• Contemplação Recorrente
Sistema: O vampiro se concentra numa única vítima dentro do seu campo de visão. O jogador rola Manipulação + Ocultismo (dificuldade igual à Força de Vontade atual da vítima). Com qualquer sucesso, a vítima cai num transe leve e revive as experiências mais recentes que precederam sua fuga. Alternativamente, o vampiro pode evocar outro conjunto de memórias e circunstâncias específicas do passado da vítima, desde que tenha algum meio de extraí-las telepaticamente. Os eventos recorrentes precisam ser relativamente benignos, no sentido de que nada digno de nota acontece ou nada acontece que exija ação imediata da vítima. Assim, no exemplo da sentinela, o vampiro poderia entranhá-la e passar sem ser observado, mas não se a sentinela o tivesse avistado antes de invocar o poder. Normalmente, a fuga dura um minuto por sucesso. Se o jogador do vampiro gastar um ponto de sangue para alimentar esse poder, determine a duração do transe conforme a tabela a seguir:
1 sucesso — um minuto
2 sucessos — 10 minutos
3 sucessos — uma hora
4 sucessos — seis horas
5+ sucessos — um dia
Vítimas em transe ficam alheias ao ambiente e ao fluxo real do tempo ao seu redor. Contudo, a fuga termina imediatamente se a vítima sofrer qualquer dano ou experimentar um choque súbito nos sentidos, como um trovão ou mesmo um empurrãozinho leve. Conversa normal não quebra o transe, mas gritar quebra.

••• Momento de Chumbo
Sistema: O jogador gasta um ponto de sangue e rola Inteligência + Ocultismo. A dificuldade depende do tamanho e da natureza do alvo: um único tijolo arremessado é apenas dificuldade 4, enquanto um carniçal enlouquecido tem dificuldade 9. Alvos maiores que um humano adulto não podem ser afetados por Momento de Chumbo. É possível afetar objetos inanimados pequenos e agrupados de mesma natureza como se fossem um único objeto, embora isso aumente a dificuldade em dois ou mais a critério do Narrador (uma saraivada de balas pode ser dificuldade 9). Este poder pode ser ativado reflexivamente como ação defensiva contra projéteis, mas de outro modo exige uma ação completa na iniciativa do vampiro. Embora a falha não acarrete penalidade especial além do desperdício de sangue, uma falha crítica significa que o vampiro por engano desacelera a si mesmo em vez do alvo, contando cada 1 como sucesso para esse fim.
Se o vampiro tiver sucesso, o objeto desacelera para metade da sua velocidade real. A cada dois sucessos além do primeiro, essa velocidade é reduzida por mais um fator, de modo que três sucessos desaceleram o alvo para um terço da sua velocidade, cinco sucessos rendem um quarto, etc. A mecânica real dessa desaceleração depende da situação. Para projéteis, multiplique quaisquer sucessos de acerto e o dano final pelo fator de velocidade, arredondando para baixo. Aplique de modo semelhante o modificador de velocidade aos sucessos de outras ações envolvendo Destreza, Raciocínio ou Força para personagens desacelerados. Personagens com Celeridade podem gastar um ponto de sangue para anular um fator de redução de velocidade, ao custo da ação extra normalmente concedida – por exemplo, um ponto de sangue cancela uma redução para metade da velocidade, dois pontos de sangue cancelam um terço, etc. Momento de Chumbo dura um turno para cada dois sucessos rolados, arredondando para cima.

•••• Paciência das Nornas
Sistema: O jogador gasta dois pontos de sangue e rola Inteligência + Ocultismo (dificuldade 6). O vampiro precisa conseguir perceber o objeto que está suspendendo, de modo que o jogador pode precisar fazer uma rolagem de Percepção + Prontidão com dificuldade determinada pelo Narrador para congelar objetos em movimento rápido. Se um objeto exceder a velocidade da percepção mortal, é necessária percepção sobre-humana como Auspícios para vê-lo e pará-lo (assim sendo, balas podem ser paradas com esse poder, mas só se o vampiro tiver ao menos um ponto de Auspícios). Objetos congelados por esse poder permanecem parados conforme o número de sucessos rolados:
1 sucesso — um turno
2 sucessos — um minuto
3 sucessos — 10 minutos
4 sucessos — uma hora
5 sucessos — um dia
6+ sucessos — uma semana por sucesso acima de 5
Objetos suspensos retêm toda a energia na sua suspensão, sem liberar nada para o universo exterior. Uma faca suspensa não tem energia cinética no que diz respeito ao resto do mundo, e fica pendurada no ar até que o poder seja interrompido ou a duração expire. Processos alquímicos ou químicos suspensos também param, incluindo o fogo. Contudo, qualquer contato físico mais substancial que uma gota de chuva quebra a suspensão.

••••• Dádiva de Cloto
Sistema: O jogador gasta três pontos de sangue e rola Inteligência + Ocultismo (dificuldade 7). Por um número de turnos igual à metade do valor de Temporis do vampiro, arredondando para cima, o personagem pode realizar um número de ações extras com sua parada de dados cheia igual ao número de sucessos rolados. Essas ações seguem as regras de contagem associadas à Celeridade, mas podem ser usadas para realizar qualquer ação. Um vampiro pode usar as ações concedidas pela Dádiva de Cloto para ativar Disciplinas várias vezes, mesmo Disciplinas que não podem ser usadas mais de uma vez por turno (como Dominação ou Taumaturgia). Contudo, para cada ação gasta ativando uma Disciplina, o vampiro sofre um nível de dano letal não absorvível. Existe apenas uma exceção importante: qualquer tentativa de acumular ações extras por meio de Celeridade, de aplicações subsequentes da Dádiva de Cloto ou de outros poderes resulta em Morte Final imediata, com o vampiro desmoronando em cinzas como se queimado pelo sol.]==],
				},
				["Thanatosis"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 471


Thanatosis


• Rugas da Bruxa
Sistema: Este poder exige um turno para moldar as rugas e o gasto de um ponto de sangue. Se o poder for usado para distorcer as feições de um personagem, o jogador da Samedi precisa rolar Vigor + Subterfúgio (dificuldade 8). O sucesso aumenta em um a dificuldade de identificar visualmente o personagem e dura uma hora por sucesso rolado. Se o personagem estiver tentando esconder um objeto pequeno (uma carteira, uma carta, uma pistola pequena), a rolagem e a duração são as mesmas, mas todas as rolagens feitas para verificar se o objeto é detectado (por exemplo, uma revista corporal ou a inspeção visual de um segurança) ficam com +2 de dificuldade.

•• Putrefação
Sistema: Este poder exige primeiro que o personagem toque o alvo pretendido. O jogador então rola Destreza + Medicina (dificuldade do Vigor + Fortitude do alvo) e gasta um ponto de sangue. O sucesso inflige um nível de vitalidade de dano letal ao alvo e remove um ponto de Aparência da vítima. Essa perda de Aparência retorna aos vampiros à razão de um ponto por noite, mas é permanente para mortais (embora a cirurgia plástica possa corrigir a desfiguração física dos mortais). Se um mortal sofrer três ou mais níveis de vitalidade de dano por usos repetidos desse poder numa cena, gangrena ou outras enfermidades podem ocorrer.
Putrefação também pode ser usada em plantas, caso em que o alvo fica crestado e murcho. Não pode, porém, ser usada em objetos inanimados como carros ou estacas de madeira.

••• Cinzas às Cinzas
Sistema: A transformação em cinzas exige um turno e o gasto de dois pontos de sangue. Enquanto o personagem está em forma de cinzas, o jogador precisa fazer uma rolagem de Percepção + Prontidão (dificuldade 9) para qualquer cena em que deseje que sua personagem esteja ciente do ambiente. Reconstituir-se do monte de cinzas leva um turno. Se o personagem estiver num espaço confinado (como uma urna), ela explode para fora dele de maneira adequadamente dramática enquanto retoma o tamanho normal. Se uma Samedi for espalhada nessa forma, um nível de vitalidade e um ponto de sangue são perdidos para cada décimo (aproximadamente) da personagem que tenha sido dissipado. Cinco pontos de sangue são necessários para curar cada nível de vitalidade perdido dessa maneira. A critério do Narrador, a Samedi pode ficar sem membros ou órgãos vitais (embora nunca a cabeça ou o coração) até que os níveis de vitalidade faltantes sejam curados.

•••• Definhamento
Sistema: O Samedi precisa tocar o membro que pretende encolher. O jogador gasta um ponto de Força de Vontade e rola Manipulação + Medicina (dificuldade igual ao Vigor + Fortitude da vítima). Três sucessos são necessários para que esse poder encolha um membro. Com um ou dois sucessos, a vítima sofre um nível de vitalidade de dano por contusão, que pode ser absorvido normalmente, mas de resto não é afetada. (Se a tentativa de Definhamento for bem-sucedida, o sujeito não sofre nenhum nível de vitalidade de dano, mas sim o definhamento do próprio membro.)
Os efeitos do Definhamento desaparecem depois de uma noite se a vítima for um vampiro ou outra criatura sobrenatural, mas mortais (incluindo magos) ficam permanentemente afligidos, a menos que algum tipo de cura sobrenatural seja usado. Se este poder for usado num braço ou numa perna, o membro fica instantaneamente inutilizado. Se este poder for usado na cabeça de um oponente, vítimas mortais morrem instantaneamente. Membros perdem dois pontos de todos os Atributos Mentais enquanto suas cabeças estão encolhidas e ficam incapazes de usar qualquer Disciplina exceto Celeridade, Fortitude e Potência. Múltiplos usos desse poder no mesmo apêndice não têm efeito adicional.

••••• Necrose
Sistema: O Samedi precisa fazer contato com a vítima. O jogador gasta dois pontos de sangue e rola Destreza + Medicina (dificuldade do Vigor + Fortitude do alvo). A vítima sofre um número de níveis de vitalidade de dano letal igual ao número de sucessos rolados e sofre efeitos adicionais conforme listado abaixo.
1 sucesso — Nenhum efeito adicional
2 sucessos — Perde um ponto de Aparência
3 sucessos — Perde um ponto de Aparência e um de Destreza
4 sucessos — Perde um ponto de Aparência, um de Destreza e um de Força
5+ sucessos — Perde dois pontos de Aparência e um de Destreza e um de Força
Atributos perdidos dessa maneira são recuperados quando todo o dano do ataque de Necrose é curado. Se uma vítima for reduzida a Força ou Destreza zero, ela fica incapaz de se mover a não ser por debater-se fracamente e rastejar, mas ainda pode usar Disciplinas e gastar pontos de sangue normalmente.]==],
				},
				["Thaumaturgy"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 212


Thaumaturgy


Taumaturgia abrange a magia de sangue e outras artes feiticeiras disponíveis aos Membros. O Clã Tremere é mais conhecido por possuir (e acumular ciosamente) essa Disciplina. Os Tremere criaram a Taumaturgia combinando a magia mortal com o poder da vitae vampírica e, como resultado, ela é uma Disciplina versátil e poderosa. Embora haja sussurros sobre a existência de Tremere antitribu na Sabbat, outros Clãs da Espada de Caim também pesquisaram e desenvolveram acesso a esse poderio místico. Ainda assim, os Tremere da Camarilla continuam sendo os mestres dessa Disciplina.
Como a Necromancia, a prática da Taumaturgia se divide em trilhas e rituais. Trilhas taumatúrgicas são aplicações do conhecimento de magia de sangue do vampiro, permitindo que ela crie efeitos a seu bel-prazer. Rituais são mais formulaicos por natureza, mais parecidos com "feitiços" mágicos antigos. Como tantas trilhas e rituais diferentes estão disponíveis aos arcanos Tremere, nunca se sabe o que esperar ao se deparar com um praticante dessa Disciplina.
Quando um personagem aprende Taumaturgia pela primeira vez, o jogador escolhe uma trilha para o personagem. Essa trilha é considerada a trilha principal do personagem, e ela recebe automaticamente um ponto nela, além de um ritual de Nível Um. Daí em diante, sempre que o personagem aumenta seu nível em Taumaturgia, seu valor na trilha principal também aumenta em um. Rituais adicionais são aprendidos separadamente, como parte de uma história; os jogadores não precisam pagar pontos de experiência para que seus personagens aprendam rituais até o nível igual ao seu valor geral em Taumaturgia, embora precisem encontrar alguém para ensinar os rituais em questão. Valores de trilha nunca excedem 5, embora a pontuação geral de Taumaturgia possa. Se um personagem atinge valor 5 na sua trilha principal e aumenta sua pontuação de Taumaturgia depois disso, ela pode alocar seu ponto "gratuito" de trilha a uma trilha diferente. (Os custos de experiência estão na p. 124.)
Muitos Membros temem se indispor com os praticantes da Taumaturgia. É uma Disciplina muito potente e mutável, e quase tudo o que o Membro desejar pode ser realizado por sua magia.

Trilhas Taumatúrgicas
As trilhas definem os tipos de magia que um vampiro pode realizar. Um vampiro tipicamente aprende sua trilha principal com seu senhor, embora não seja desconhecido que alguns vampiros estudem sob muitos tutores diferentes.
Como mencionado antes, a primeira trilha que um personagem aprende é considerada sua trilha principal e aumenta automaticamente conforme o personagem avança na própria Disciplina. Trilhas secundárias podem ser aprendidas quando o personagem tiver adquirido dois ou mais pontos na sua trilha principal, e precisam ser aumentadas separadamente com pontos de experiência. Além disso, o valor do personagem na sua trilha principal precisa sempre ser ao menos um ponto maior que qualquer uma das suas trilhas secundárias, até que ela tenha dominado a trilha principal. Uma vez que o personagem tenha alcançado o quinto nível da sua trilha principal, as trilhas secundárias podem ser aumentadas até esse nível.
Cada vez que o personagem invoca um dos poderes de uma trilha taumatúrgica, o jogador do taumaturgo precisa gastar um ponto de sangue e fazer uma rolagem de Força de Vontade contra uma dificuldade igual ao nível do poder +3. Apenas um sucesso é necessário para invocar o efeito de uma trilha — os níveis de trilha, e não os sucessos, governam o poder da magia de sangue. A falha nessa rolagem indica que a magia falha. Uma falha crítica causa algum tipo de perda ou contragolpe catastrófico, como perder um ponto (ou um ponto permanente!) de Força de Vontade, combustão espontânea, ou deixar acidentalmente uma estátua viva correr solta. A Taumaturgia é uma arte implacável.
Diferentes Seitas e Clãs têm acesso diferente a cada trilha, mas a menos que o Narrador decida o contrário, presume-se que os Tremere tenham algum acesso a todas elas. ("Ter acesso" não significa o mesmo que "obter facilmente", especialmente dentro da estrutura de poder Tremere.) As trilhas começam por uma das mais comuns (A Trilha do Sangue) e, daí em diante, são apresentadas em ordem alfabética. (A incomum "trilha" da Contramágica Taumatúrgica também é apresentada, embora seja considerada uma Disciplina separada – veja a p. 228 para detalhes.)]==],
				},
				["Valeren"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 474


Valeren


• Sentir a Vitalidade
Sistema: Este poder funciona de modo idêntico ao poder de Obeah de mesmo nome (p. 457).

•• Toque Anestésico
Sistema: Este poder funciona de modo idêntico ao poder de Obeah de mesmo nome (p. 458).

••• Toque Ardente
Sistema: O vampiro precisa tocar seu sujeito para que esse poder faça efeito, e os efeitos diminuem rapidamente depois que ele retira a mão. O jogador gasta ao menos um ponto de sangue para ativar esse poder, e cada ponto de sangue gasto reduz em dois as paradas de dados da vítima enquanto a Fúria estiver em contato com ela. Este poder é frequentemente usado para interrogatório ou tortura, desgastando a resistência do sujeito e tornando-o muito mais tratável.

•••• Armadura da Fúria de Caim
Sistema: O jogador gasta um ponto de sangue e rola Vigor + Armas Brancas (dificuldade 7). Para cada sucesso, o personagem ganha um ponto de proteção de armadura contra dano por contusão e letal, até um máximo de cinco pontos de proteção. Além disso, a cada dois sucessos rolados, ela ganha um dado adicional para resistir ao Rötschreck causado pelos efeitos da batalha (mas não por fogo ou luz do sol). Este poder funciona por uma cena.

••••• Vingança de Samiel
Sistema: Este poder custa três pontos de sangue. Qualquer ataque único feito pelo vampiro acerta o alvo automaticamente, pois forças místicas guiam o golpe. Ataques feitos dessa maneira não podem ser esquivados, embora possam ser bloqueados, aparados e absorvidos normalmente. O golpe acerta como se o Salubri antitribu tivesse obtido sucesso com toda a sua parada de dados de Destreza + Armas Brancas ou Briga (o que resulta em dano significativo). Este poder só pode ser usado uma vez por turno, e nesse caso a única ação do Salubri antitribu é o ataque. Além disso, este poder não funciona para armas à distância; apenas mãos nuas ou armas brancas.]==],
				},
				["Vicissitude"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 241


Vicissitude


• Semblante Maleável
Sistema: O jogador precisa gastar um ponto de sangue para cada parte do corpo a ser mudada, e então rolar Inteligência + Medicina (dificuldade 6). Duplicar outra pessoa ou outra voz exige uma rolagem de Percepção + Medicina (dificuldade 8), e cinco sucessos são necessários para uma cópia impecável; menos sucessos deixam falhas minúsculas (ou nem tanto). Aumentar o próprio Traço de Aparência tem dificuldade 9, e o vampiro precisa gastar um ponto de sangue adicional para cada ponto de Aparência aumentado além do seu total natural. Uma falha crítica reduz permanentemente o Atributo em um.

•• Modelagem da Carne
Sistema: Depois de gastar um ponto de sangue, o vampiro precisa agarrar a vítima pretendida. O jogador do vampiro que faz a Modelagem faz uma rolagem bem-sucedida de Destreza + Medicina (dificuldade variável: 5 para um puxa-e-dobra tosco, até 9 para transformações precisas). Um vampiro que deseje aumentar o Traço de Aparência de outro o faz conforme descrito em Semblante Maleável; reduzir o Atributo é consideravelmente mais fácil (dificuldade 5), embora uma desfiguração verdadeiramente inspirada possa exigir dificuldade maior. Em ambos os casos, cada sucesso aumenta ou reduz o Atributo em um.
Um vampiro pode usar esse poder para deslocar aglomerados de pele, gordura e tecido muscular, provendo assim acolchoamento adicional onde for necessário. Para cada sucesso obtido numa rolagem de Destreza + Medicina (dificuldade 8), o vampiro pode aumentar em um a parada de absorção do sujeito, à custa de um ponto de Força ou de um nível de vitalidade (escolha do vampiro).

••• Modelagem dos Ossos
Sistema: O jogador do vampiro precisa gastar um ponto de sangue e fazer uma rolagem de Força + Medicina (dificuldades como acima). Modelagem dos Ossos pode ser usada sem as artes de modelar carne, como arma ofensiva. Cada sucesso obtido na rolagem de Força + Medicina (dificuldade 7) inflige um nível de vitalidade de dano letal à vítima, enquanto seus ossos rasgam, perfuram e cortam caminho para fora da pele.
O vampiro pode utilizar esse poder (em si mesmo ou em outros) para formar espigões ou garras de osso, seja nos nós dos dedos como arma ofensiva, seja por todo o corpo como "espinhos" defensivos. Se espigões de osso forem usados, o vampiro ou a vítima sofre um nível de vitalidade de dano letal (o do vampiro vem de ter o osso muito afiado atravessando sua pele — esse armamento não sai barato). No caso dos espinhos, o sujeito sofre um número de níveis de vitalidade igual a cinco menos o número de sucessos (uma falha crítica mata o sujeito ou lança o vampiro em torpor). Esses níveis de vitalidade podem ser curados normalmente. Espigões nos nós dos dedos infligem Força +1 de dano letal. Espinhos defensivos infligem a Força de um atacante corpo a corpo em dano letal, a menos que o atacante obtenha três ou mais sucessos na rolagem de ataque (caso em que o atacante não sofre dano); o defensor ainda sofre dano normalmente. Espinhos também permitem ao vampiro ou ao sujeito alterado somar dois a todo dano infligido por agarrões, imobilizações ou investidas.
Um vampiro que obtenha cinco ou mais sucessos na rolagem de Força + Medicina pode fazer a caixa torácica de um vampiro rival se curvar para dentro e perfurar o coração. Embora isso não lance o vampiro em torpor, faz o vampiro afetado perder metade dos seus pontos de sangue, enquanto a sede da sua vitae se rompe num jorro de sangue.

•••• Forma Horrenda
Sistema: A Forma Horrenda custa dois pontos de sangue para despertar. Todos os Atributos Físicos aumentam em três, mas todos os Atributos Sociais caem a zero, exceto ao lidar com outros também em Forma Horrenda. Contudo, um vampiro em Forma Horrenda que esteja tentando intimidar alguém pode substituir um Atributo Social por Força. O dano infligido em combate de briga aumenta em um, devido às cristas irregulares e às protuberâncias ósseas que vincam as mãos da criatura.

••••• Forma de Sangue
Sistema: O vampiro pode transformar toda ou parte de si como achar melhor. Cada perna pode virar dois pontos de sangue de vitae, assim como o torso; cada braço, a cabeça e o abdômen convertem-se em um ponto de sangue cada. O sangue pode ser reconvertido na parte do corpo, desde que esteja em contato com o vampiro. Se o sangue tiver sido utilizado ou destruído, o vampiro precisa gastar um número de pontos de sangue igual ao que foi originalmente criado para regenerar a parte do corpo faltante.
Um vampiro inteiramente nessa forma não pode ser empalado, cortado, golpeado nem perfurado, mas pode ser queimado ou exposto ao sol. O vampiro pode escorrer, pingar parede acima e fluir pelas frestas mais estreitas, como se estivesse em Forma Tenebrosa (p. 190).
Disciplinas mentais podem ser usadas, desde que não seja necessário contato visual nem emissão vocal, embora o vampiro consiga perceber o ambiente perfeitamente bem (mas as percepções são sempre centradas na maior poça de sangue). Se um vampiro nessa forma "lavar" um mortal ou animal, esse mortal precisa fazer uma rolagem de Coragem (dificuldade 8) ou entrar em pânico.]==],
				},
				["Visceratika"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 475


Visceratika


• Pele do Camaleão
Sistema: O jogador gasta um ponto de sangue. Pelo resto da cena, a parada de dados de Furtividade do Gárgula é aumentada em cinco. Este poder está sujeito às limitações descritas acima. Qualquer movimento em solo mais rápido que uma caminhada anula o efeito desse poder, assim como o voo (a critério do Narrador).

•• Vigiar a Pedra do Lar
Sistema: O jogador gasta um ponto de Força de Vontade para ativar esse poder, que permanece em vigor enquanto o Gárgula estiver dentro da estrutura alvo ou em contato com ela, ou até o pôr do sol seguinte. Vigiar a Pedra do Lar pode ser usado em qualquer coisa até o tamanho de um complexo de cavernas, um teatro grande, um estacionamento coberto ou uma mansão. O personagem ganha um senso inato da localização e do tamanho e condição física aproximados de todos os seres vivos (ou não-vivos) dentro da estrutura. Para localizar com precisão a posição de um indivíduo específico com esse poder, o jogador precisa obter sucesso numa rolagem de Percepção + Consciência (dificuldade 6). Se o sujeito estiver tentando se esconder, ele pode opor essa rolagem com uma rolagem de Raciocínio + Furtividade (dificuldade 6).
Vigiar a Pedra do Lar pode ser usado para detectar a presença de personagens sob efeito de Ofuscação ou poderes semelhantes. Nesse caso, o Gárgula sabe apenas que há alguém presente — ela não consegue de fato ver o indivíduo em questão. Para determinar a capacidade do Gárgula de detectar personagens Ofuscados, compare os níveis relativos do Visceratika do Gárgula menos um e da Ofuscação do intruso, conforme o quadro "Vendo o Invisível" na p. 142.

••• Vínculo com a Montanha
Sistema: O jogador gasta dois pontos de sangue, e a fusão leva quatro turnos para se completar. Este poder funciona de maneira semelhante ao poder Metamorfose 3, Fusão com a Terra, e só pode ser realizado sobre rocha nua ou substância semelhante. Contudo, o Gárgula não afunda completamente na substância com a qual se funde, e seu contorno pode ser detectado dentro da pedra com uma rolagem bem-sucedida de Percepção + Prontidão (dificuldade 9). Um Gárgula atacado enquanto está Vinculado à Montanha tem o triplo da sua parada normal de absorção contra todas as formas de ataque. Contudo, se ele sofrer três ou mais níveis de vitalidade de dano letal de um único ataque, é forçado para fora do seu vínculo e sofre desorientação semelhante à experimentada por um personagem em Fusão com a Terra cujo sono é interrompido.

•••• Armadura de Terra
Sistema: Este poder é automático e não exige rolagem; está sempre em vigor. Um vampiro com Armadura de Terra tem um dado extra de absorção contra todos os ataques agravados e letais e dois contra todos os ataques por contusão, reduz todas as penalidades de ferimento em um e reduz pela metade a parada de dados de dano de qualquer fonte de ferimento baseada em fogo (esta Disciplina não muda as regras de Rötschreck, porém). A dificuldade de todas as rolagens de Percepção baseadas em tato é aumentada em dois, devido à dessensibilização da pele do personagem.

••••• Fluir Dentro da Montanha
Sistema: Uma vez que o personagem tenha usado Vínculo com a Montanha, o jogador gasta mais dois pontos de sangue para ativar Fluir Dentro da Montanha pela duração da cena. O Gárgula pode se mover dentro de pedra e cimento (de resto usando as mesmas regras do poder de Metamorfose Controle da Terra, p. 200). O personagem também pode usar esse poder para atravessar uma parede de pedra e emergir do outro lado sem antes usar Vínculo com a Montanha. Nesse caso, o jogador gasta um ponto de sangue e rola Força (dificuldade 8; Potência acrescenta dados ou sucessos normalmente). O Gárgula pode fluir através de uma espessura máxima em centímetros igual a 30 vezes o número de sucessos rolados. Se a parede ou barreira for mais espessa que isso, o personagem fica preso dentro dela até ser cinzelado para fora ou usar Fluir Dentro da Montanha para escapar.]==],
				},
				-- <<< DISC_DESC_END
};
