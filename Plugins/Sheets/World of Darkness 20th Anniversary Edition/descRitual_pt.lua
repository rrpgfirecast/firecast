-- Ritual descriptions, the [pt] half (SPEC T495, V210).
--
-- descRitual.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [pt] only, descRitual_en.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descRitual_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Ritual descriptions for the Vampire tab (SPEC I21). One entry per canonical picker
-- value, keyed in ENGLISH because that is what the sheet saves (SPEC V24); `pt` is a
-- translation of the same three blocks, source line for source line.
--
-- SPEC I24 / T479-T481: this table used to be an upvalue inside the <script> of HH.14.lfm.
-- The <script> CDATA is copied raw into constructNew_*(), so every open sheet parsed and
-- kept its own copy. As a module it is parsed once and cached in package.loaded, and the
-- require that pulls it lives INSIDE ritualText (SPEC V198).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24). The generator
-- markers migrated verbatim, so research/rebuild_ritual_desc.sh and the .tsv maps still aim
-- at the same region - only the path of the target changed.

return {
				-- >>> RITUAL_DESC_BEGIN (generated - SPEC T446)
				["1. Ambrus Kelemen’s Aegis"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 303


1. Ambrus Kelemen’s Aegis


Este ritual foi uma das principais fontes de proteção contra os Tzimisce durante a ascensão do clã nascente. O ritualista confecciona um berloque, uma peça de joalheria, e o usa até esgotá-lo. O berloque contém cargas iguais ao nível de Taumaturgia do vampiro. As cargas podem ser gastas como dados adicionais em qualquer rolagem para detectar surpresa, ou em qualquer parada de absorção contra dano contundente ou letal. A personagem só pode ter uma Aegis encantada por vez, mas pode dá-la a outra personagem.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["1. Armor of Diamond Serenity"] = {
					pt = [==[Rites of Blood, pág. 166


1. Armor of Diamond Serenity


Sistema: Pelo resto da noite, o sadhu fica imune a frenesi de todos os tipos, reduz a dificuldade de todas as rolagens de Força de Vontade em -2 e trata sua Força de Vontade como se fosse dois pontos mais alta contra efeitos que usem sua Força de Vontade (temporária ou permanente) como número-alvo. Porém, enquanto o efeito durar, o sadhu perde a capacidade de gastar sangue para aumentar Atributos Físicos.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["1. Bind the Accusing Tongue"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 230


1. Bind the Accusing Tongue


Sistema: O conjurador precisa ter uma fotografia ou outra imagem ou efígie do alvo do ritual, uma mecha de cabelo do alvo e um cordão de seda preta. O conjurador enrola o cordão em torno do cabelo e da imagem enquanto entoa o componente vocal do ritual. Uma vez completo o ritual, o alvo precisa obter mais sucessos numa rolagem de Força de Vontade (dificuldade igual ao valor de Taumaturgia do conjurador + 3) do que o conjurador obteve, para conseguir dizer qualquer coisa negativa sobre o conjurador. O ritual dura até que o alvo tenha sucesso nessa rolagem ou até que o cordão de seda seja desenrolado, momento em que a imagem e a mecha de cabelo se desfazem em pó.]==],
				},
				["1. Blood Mastery"] = {
					pt = [==[Rites of Blood, pág. 145


1. Blood Mastery


Sistema: A taumaturga precisa misturar uma quantidade mínima da própria vitae (uma quantidade desprezível, menos de um ponto) com a da vítima, e então queimá-la lentamente no fogo ou ferver o sangue devagar sobre chama aberta. A conjuradora profere as frases de simetria ao terminar. Uma vez completo, a taumaturga ganha um domínio mágico limitado sobre a vítima até o amanhecer. No próximo teste que a conjuradora iniciar contra a vítima, ela tem êxito automaticamente na tentativa.
Se a tarefa exigir uma rolagem, a conjuradora obtém um sucesso automaticamente, mas não mais que isso (e não pode rolar nem gastar Força de Vontade para melhorar a rolagem). Isso significa que a conjuradora tem garantido um sucesso marginal contra o oponente, ainda que não do modo que a taumaturga desejaria. Por exemplo, um sucesso sozinho não basta para hipnotizar completamente um inimigo, mas pode influenciá-lo brevemente com Dominação. Do mesmo modo, se a vítima agir primeiro, o Domínio do Sangue não ajuda em nada se a conjuradora não pudesse normalmente fazer uma rolagem de contraposição. Por exemplo, o conjurador ainda estaria sujeito ao uso de Presença por um oponente, porque ele normalmente não pode fazer uma rolagem para resistir. Se a vítima usar alguma Disciplina que exija que o conjurador resista, porém, então a taumaturga a contrapõe automaticamente e assim encerra o poder do ritual.
O Domínio do Sangue só pode garantir êxito num único empreendimento limitado — a taumaturga não pode queimar múltiplos pontos de sangue para obter sucessos adicionais nem êxito em várias ações consecutivas. Uma vez o ritual em vigor, ele precisa ser descarregado antes de poder ser invocado de novo contra o mesmo sujeito. O Domínio do Sangue expira se seus efeitos permanecerem sem uso até o nascer do sol.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Blood Rush"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 230


1. Blood Rush


Sistema: A execução do ritual resulta em a Besta ser mantida sob controle automaticamente. Ímpeto de Sangue permite ao vampiro resistir ao frenesi causado pela fome por até uma hora, momento em que o Cainita volta a sentir fome (presumindo que já a sentisse antes). Este ritual leva apenas um turno para ser executado.]==],
				},
				["1. Blood into Water"] = {
					pt = [==[Rites of Blood, pág. 145


1. Blood into Water


Sistema: A taumaturga derrama uma xícara de água purificada pelos dedos da mão estendida enquanto entoa cânticos. O ritual transmuta todo o sangue derramado num raio de dois metros por sucesso na rolagem de ativação. Sangue em recipientes e dentro de seres vivos não é afetado — apenas sangue derramado.
Este poder não tem efeito sobre sangue usado para criar efeitos ativos ou passivos de Disciplina. Sangue em Água não poderia ser usado para remover um ritual como a Proteção contra Carniçais (V20, p. 234), porque as propriedades mágicas do ritual transformaram o sangue, embora pudesse ser usado para limpar um círculo de sangue desenhado para prender um demônio, desde que essa amarração já esteja concluída.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Brand"] = {
					pt = [==[Rites of Blood, pág. 23


1. Brand


Sistema: Este processo doloroso queima um nível de dano agravado na área de pele marcada. A tatuagem pode ser colocada em qualquer lugar do corpo do sujeito. Uma vez que o dano tenha sido curado, a tatuagem permanece sobre a pele, sem defeito. Por causa da dor, o Narrador pode obrigar o alvo a fazer uma rolagem de Autocontrole para ficar imóvel durante o procedimento.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. CCTV"] = {
					pt = [==[Rites of Blood, pág. 67


1. CCTV


Sistema: O ritual dura uma noite para cada sucesso e pode ser renovado pelo mesmo intervalo indefinidamente, desde que o vampiro possa alimentar a lente com pontos adicionais de sangue. Enquanto o ritual durar, o taumaturgo pode tratar o vídeo transmitido pela câmera como se o estivesse vivenciando diretamente, para fins de mirar pessoas ou lugares com trilhas ou rituais. Se a câmera for do tipo espiã e for contrabandeada para dentro do refúgio de um inimigo, isso pode permitir efeitos devastadores. O ritual, porém, não é isento de risco. Enquanto estiver ativo, qualquer outro mago de sangue que obtenha a câmera encantada pode usá-la como vínculo simpático de volta ao taumaturgo, como se fosse uma amostra da própria vitae dele. Mesmo depois que o ritual acaba, um vínculo simpático menor persiste (equivalente a um pertence pessoal do taumaturgo) até a câmera ser destruída.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Call of the Hungry Dead"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 177


1. Call of the Hungry Dead


O Chamado dos Mortos Famintos leva apenas 10 minutos para ser conjurado e exige um fio de cabelo da cabeça do alvo. O ritual culmina com a queima desse fio na chama de uma vela preta, após o que a vítima passa a conseguir ouvir fragmentos de conversa do outro lado da Mortalha. Se o alvo não estiver preparado, as vozes chegam como uma confusa balbúrdia de uivos e exigências sobrenaturais; ele não consegue distinguir nada inteligível e pode enlouquecer por um breve momento.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Calling Card"] = {
					pt = [==[Rites of Blood, pág. 65


1. Calling Card


Sistema: A mensagem de grafite dura até ser removida, e seu verdadeiro significado permanece visível a qualquer alvo pretendido durante esse tempo. Para disparar o efeito secundário, o feiticeiro (e quaisquer aliados que traga) precisa de fato vandalizar a área e então deixar uma mensagem provocando alguma figura de autoridade. Essa mensagem pode ou não ter um significado oculto, mas precisa de alguma forma identificar o feiticeiro, seja por sua identidade habitual, seja por um apelido usado com regularidade e conhecido pelas autoridades locais que possam vir a visitar o local. Por uma hora para cada sucesso, a dificuldade de todos os rituais e efeitos de trilha executados pelo feiticeiro à vista do grafite é reduzida em 1 se o grafite incorporar um apelido, ou em 2 se revelar um nome pelo qual o feiticeiro seja pessoalmente conhecido pelas autoridades.
Alguns feiticeiros punk deixam mensagens ocultas visíveis apenas a vampiros específicos, como o Xerife ou o Príncipe, e então usam os benefícios de Calling Card para conjurar rituais de ação retardada como armadilhas, disparadas quando ele lê a mensagem oculta. O ritual BFU, por exemplo, foi projetado explicitamente para isso.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Chime of Unseen Spirits"] = {
					pt = [==[Rites of Blood, pág. 23


1. Chime of Unseen Spirits


Sistema: Uma vez encantado, o sino toca uma vez cada vez que um espírito invisível, fantasma ou demônio estiver a menos de dez metros de sua presença física. Fora isso, o sino foi encantado para não tocar, nem sob vento forte nem por manipulação manual. Alguns poderes podem bloquear a capacidade do sino de detectar uma entidade específica, a critério do Narrador.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Communicate with Kindred Sire"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 230


1. Communicate with Kindred Sire


Sistema: A conjuradora precisa meditar por 30 minutos para criar a conexão. A conversa pode ser mantida por 10 minutos por sucesso na rolagem de ativação.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Death’s Communion"] = {
					pt = [==[Lore of the Clans, pág. 108


1. Death’s Communion


Sistema: O conjurador deste ritual normalmente não é o beneficiário. Se o conjurador e o sujeito forem a mesma pessoa, ele sofre +1 de dificuldade na rolagem de conjuração. O Death’s Communion leva uma hora para ser completado. O sujeito do ritual ganha um bônus de +2 dados em todas as rolagens de Necromancia por uma noite para cada sucesso obtido na rolagem de conjuração.
Conjuração de ritual necromântico (V20, pág. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Defense of the Sacred Haven"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 230


1. Defense of the Sacred Haven


Sistema: Este ritual exige uma hora para ser realizado, durante a qual a conjuradora recita encantamentos e inscreve glifos. Um ponto de sangue é necessário para que este ritual funcione.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Deflection of Wooden Doom"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 231


1. Deflection of Wooden Doom


Sistema: A conjuradora precisa se cercar de um círculo de madeira por uma hora inteira. Qualquer madeira serve: móveis, serragem, madeira bruta, sarrafos, o que for. O círculo precisa permanecer ininterrupto, porém. Ao fim da hora, a vampira coloca uma lasca de madeira sob a língua. Se essa lasca for removida, o ritual é anulado. Este ritual dura até o amanhecer ou o anoitecer seguinte.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Devil’s Touch"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 231


1. Devil’s Touch


Sistema: Os efeitos deste ritual duram uma noite, desaparecendo quando o sol nasce. O mortal (não funciona em vampiros) precisa estar presente quando o ritual é invocado, e uma moeda precisa ser colocada em algum lugar de sua pessoa (num bolso, sapato etc.).
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Domino of Life"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 231


1. Domino of Life


Sistema: Usar este ritual acrescenta um dado às paradas de dados do conjurador ao tentar se passar por humano. A menos que os observadores estejam especialmente atentos, o Dominó da Vida deve enganá-los a ponto de pensarem que o conjurador é mortal — não que devessem ter qualquer motivo para suspeitar do contrário.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Drinking Death"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 48


1. Drinking Death


Sistema: Concluído o rito, o koldun passa a ser capaz de beber sangue da terra de uma sepultura. Ele precisa se deitar prostrado no chão, com o rosto no solo, e levar a terra à boca. Só um ponto de sangue pode ser obtido assim de cada sepultura, e uma sepultura dessas na área imediata pode ser afetada por sucesso na conjuração. Os efeitos do rito são permanentes até que uma das sepulturas seja consagrada por alguém com Fé Verdadeira.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["1. Eldritch Beacon"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 177


1. Eldritch Beacon


O Farol Sobrenatural leva 15 minutos para ser conjurado. O componente material é uma vela verde, cuja cera derretida precisa ser recolhida e moldada numa esfera de 1,5 cm. Quem carregar essa esfera, seja na mão, seja no bolso, fica realçado nas Terras das Sombras com uma aura verde-esbranquiçada de brilho doentio. Todos os poderes fantasmagóricos afetam esse indivíduo com maior facilidade e severidade. A esfera retém seu poder por uma hora por sucesso na rolagem de conjuração.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Encrypt Missive"] = {
					pt = [==[Rites of Blood, pág. 145


1. Encrypt Missive


Sistema: A taumaturga escreve a mensagem com sangue ao longo de uma noite e fala o nome da pessoa ou do grupo que deseja que a leia. Só a autora e o alvo a quem a carta é endereçada conseguem ler o documento. Para quaisquer outros que observem a carta, a escrita parece um amontoado sem sentido. Obviamente, este ritual só pode ser usado em comunicação escrita. Codificar Missiva só funciona com o documento original. Se outra pessoa tentar escanear ou copiar o documento, a magia se mantém e a mensagem continua embaralhada.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Engaging the Vessel of Transference"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 231


1. Engaging the Vessel of Transference


Sistema: Este ritual leva três horas para ser executado (reduzidas em 15 minutos para cada sucesso na rolagem de conjuração) e exige um ponto de sangue (embora não necessariamente o sangue do conjurador), que é selado dentro do recipiente. O ritual só troca sangue entre si e um sujeito se for tocado com a pele nua — mesmo luvas finas de algodão impedem sua ativação.
Indivíduos com ao menos quatro pontos em Ocultismo reconhecem o sigilo Hermético com dois sucessos numa rolagem de Inteligência + Ocultismo (dificuldade 8).
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Eyes of the Abyss"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 271


1. Eyes of the Abyss


Sistema: A vampira esmaga uma chama pequena (uma vela acesa, por exemplo) com a mão nua, sofrendo um nível de dano agravado. Em seguida faz um teste de Rötschreck, dificuldade 4. Se for bem-sucedida, role Inteligência + Ocultismo, dificuldade 6. Uma falha crítica causa um nível adicional de dano agravado. Com um sucesso, um pequeno elemental do Abismo é convocado e consome a chama extinta.
Garra do Abismo (pág. 272): O Elemental do Abismo tem a aparência de uma massa amorfa de sombra escura. Pode assumir temporariamente a forma que quiser, até o tamanho de uma criança humana.
Atributos: Força 2, Destreza 5, Vigor 1, Carisma 1, Manipulação 3, Aparência 0, Percepção 3, Inteligência 2, Raciocínio 3
Habilidades: Prontidão 3, Esportes 3, Briga 3, Intimidação 2, Furtividade 5 (+1 em meio a sombras)
Disciplinas: Obtenebração 3
Força de Vontade: 5
Vitalidade: OK x 3, Esmaecido (-2) x2, Destruído
A criatura permanece um número de noites igual aos sucessos obtidos. O elemental responde e obedece a todas as ordens do conjurador. Não pode afetar o mundo material, mas pode se comunicar mentalmente entrando na sombra de uma pessoa. Qualquer não-místico que se comunique com um elemental do Abismo dessa forma precisa fazer um teste de Coragem, dificuldade 6. A falha resulta num Distúrbio temporário que dura o resto da noite. Numa falha crítica, o Distúrbio é permanente e só pode ser curado com o uso repetido de Força de Vontade.
O elemental está sempre em forma de sombra (como o Avatar Tenebroso, ver pág. 230), voa 30 metros por turno e é destruído instantaneamente pelo fogo ou pela luz do sol. Existe uma versão de nível 2 deste ritual, Garras do Abismo, que convoca elementais de sombra corpóreos, capazes inclusive de atacar inimigos.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["1. Final Sight"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 292


1. Final Sight


Há duas escolas de pensamento sobre como conduzir o ritual da Visão Final. Os adeptos da primeira o conduzem pingando algumas gotas de sangue no olho de um morto e dizendo uma breve prece pela alma dele. Outros o conduzem comendo lenta e reverentemente um dos olhos do morto. A maioria dos necromantes tem forte preferência por um dos métodos. Seja qual for o método usado, este ritual precisa ser empregado num cadáver com ao menos um olho intacto, e leva cerca de cinco minutos.
O número de sucessos na rolagem do ritual determina a nitidez do resultado.
1 sucesso — Uma noção básica da morte do sujeito
2 sucessos — Uma imagem nítida da morte do sujeito e dos segundos que a precederam
3 sucessos — Uma imagem nítida, com som, dos vários minutos que precederam a morte do sujeito
4 sucessos — Uma imagem nítida, com som, da meia hora anterior à morte do sujeito
5 sucessos — Percepção sensorial completa da hora que levou à morte do sujeito
Se a jogadora tirar uma falha crítica, sua personagem é assaltada por visões vagas e confusas da própria Morte Final, o que provoca imediatamente um teste de Rötschreck (ver pág. 357).
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["1. Flatline"] = {
					pt = [==[Rites of Blood, pág. 158


1. Flatline


Sistema: O efeito dura até a manhã seguinte e só pode ser usado num alvo por mês. O animal morto precisa ser colocado na casa de verdade do alvo. O ritual não funciona se for deixado num quarto de hotel ou em algum lugar onde ela esteja cuidando da casa de outra pessoa ou ocupando irregularmente. O poder não afeta nenhum ser sobrenatural. Este ritual é usado com mais frequência por Feiticeiros Punk que ou querem aterrorizar um mortal, ou constranger algum Sanguessuga da Camarilla fazendo uma de suas bonecas de sangue acreditar que virou vampira e dar um escândalo.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Foxfire"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 292


1. Foxfire


O celebrante precisa queimar uma pequena vela verde até o fim (o que leva cerca de quinze minutos) e moldar a cinza e a cera restantes numa pequena esfera. A esfera é então colocada em algum lugar do corpo ou das roupas do alvo pretendido.
Quem carrega a esfera parece normal a qualquer observador no mundo dos vivos, mas para quem está no Submundo o alvo aparece iluminado por um brilho verde doentio. Os fantasmas acham trivialmente fácil afetar o alvo com sua magia sombria e recebem -1 de dificuldade em todas as rolagens relacionadas a magia dirigidas contra ele. A esfera permanece por uma hora para cada sucesso na rolagem de conjuração.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["1. Horoscope"] = {
					pt = [==[Rites of Blood, pág. 162


1. Horoscope


Sistema: Cada sucesso permite ao ashipu descobrir um segredo sobre o alvo do horóscopo, escolhido entre os seguintes: Natureza, aptidões principais (isto é, Traços com valor 3 ou mais), Defeitos ou grandes tragédias de sua vida (ou não-vida). Como alternativa, o ashipu pode usar o horóscopo em conjunto com uma efígie para melhorar a eficácia da magia simpática, com os sucessos na rolagem do ritual reduzindo a penalidade de dificuldade aplicada a tais rolagens. Porém, o ashipu não pode usar um horóscopo para reduzir a penalidade de dados em mais do que seu valor de Dur-An-Ki, nem pode usá-lo para reduzir a penalidade a menos de zero.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["1. Illuminate the Trail of Prey"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 231


1. Illuminate the Trail of Prey


Sistema: A taumaturga precisa ter uma imagem mental de sua presa ou saber o nome dela. O rastro do indivíduo brilha com uma intensidade que depende de quanto tempo se passou desde que ele passou por ali — rastros antigos ardem com menos intensidade, enquanto rastros frescos flamejam.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Impressive Visage"] = {
					pt = [==[Rites of Blood, pág. 146


1. Impressive Visage


Sistema: A conjuradora ganha dois dados em todas as rolagens relacionadas a Aparência enquanto durar este ritual. Este ritual dura um número de horas igual aos sucessos obtidos na rolagem de ativação.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Incantation of the Shepherd"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 232


1. Incantation of the Shepherd


Sistema: Este ritual dá ao personagem a localização (em relação a ele) de cada membro de seu Rebanho. Se ele não tiver o Antecedente Rebanho, o Encantamento do Pastor localiza os três mortais mais próximos de quem o conjurador se alimentou ao menos três vezes cada. Este ritual tem alcance máximo de 15 quilômetros vezes o Antecedente Rebanho do personagem, ou oito quilômetros se ele não tiver pontos nesse Antecedente.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Insight"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 177


1. Insight


Este ritual permite ao necromante fitar os olhos de um cadáver e ver refletida ali a última coisa que o morto testemunhou. A visão aparece apenas nos olhos do cadáver e é visível a ninguém além do necromante que usa a Perspicácia. O jogador rola normalmente enquanto o vampiro fita os olhos do alvo por cinco minutos. O número de sucessos na rolagem determina a nitidez da visão. Uma falha crítica mostra ao necromante sua própria Morte Final, o que pode provocar uma rolagem de Rötschreck (ver p. 299).
Este poder não pode ser usado nos cadáveres de vampiros que alcançaram a Golconda, nem em corpos aos quais faltem ambos os olhos ou nos quais a decomposição avançada já tenha ocorrido.
1 sucesso — Uma noção básica da morte do sujeito
2 sucessos — Uma imagem nítida da morte do sujeito e dos segundos que a precederam
3 sucessos — Uma imagem nítida, com som, dos minutos que precederam a morte
4 sucessos — Uma imagem nítida, com som, da meia hora anterior ao falecimento do sujeito
5 sucessos — Percepção sensorial plena da hora que antecedeu a morte do alvo
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Knowing Stone"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 177


1. Knowing Stone


Usando o próprio sangue e os rituais apropriados, a necromante pode marcar o espírito de uma pessoa, permitindo à vampira ver onde seu sujeito está a qualquer momento, mesmo depois que ele morre. Desse modo, muitos dos vampiros assombrados por espíritos vigiam seus parentes próximos e seus inimigos.
A necromante corta a própria pele ou de outro modo se sangra, e então usa a vitae para pintar o nome do alvo numa pedra consagrada. Se o ritual for bem-sucedido, ela pode depois descobrir o paradeiro atual do alvo dançando ao redor da pedra em estado de transe até que um dos espíritos sussurre a informação desejada em seu ouvido. A pedra perde seus poderes na noite do Dia de Todos os Santos, a menos que a vampira gaste um ponto de sangue.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Learning the Mind Enslumbered"] = {
					pt = [==[Rites of Blood, pág. 146


1. Learning the Mind Enslumbered


Sistema: Este ritual exige meia hora para ser conjurado, ao fim da qual o taumaturgo ouve uma mensagem fantasmagórica da vítima nomeando quem ela acredita tê-la posto em torpor ou matado. Este não é um ritual de adivinhação e, portanto, a informação pode não ser exata. Se o culpado estava disfarçado ou oculto, o espírito da vítima fará o melhor que puder para responder à pergunta. Este poder não tem efeito sobre criaturas que não sejam Membros.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Light within Shadow"] = {
					pt = [==[Lore of the Clans, pág. 126


1. Light within Shadow


Sistema: Ao conjurar este ritual com sucesso, a Lasombra invoca em sua mão uma esfera de pura sombra. Enquanto a contempla, faz uma rolagem de Percepção + Ocultismo (dificuldade 8). Se a rolagem for bem-sucedida, ela ganha permanentemente a Qualidade Visão Noturna Controlável (ver pág. 122). Se falhar, pode tentar de novo na noite seguinte; mas, se tirar falha crítica, ganha permanentemente o Defeito Visão Noturna Incontrolável (pág. 123).
Efeito Colateral: Sempre que a vampira usa sua nova visão, seus olhos viram perturbadores poços negros de sombra. Se ela não tiver controle sobre a visão, os olhos ficam sempre assim.
Misticismo do Abismo (pág. 125): O Misticismo do Abismo é difícil e demorado de aprender, e tem um preço. Seus rituais costumam ter efeitos colaterais que criam Defeitos que a personagem não pode remover e que não dão pontos de bônus. Para aprender o poder, o vampiro precisa ter ao menos um ponto tanto em Obtenebração quanto em Ocultismo. Ele não pode aprender rituais do Abismo de nível superior ao menor entre seu Obtenebração e seu Ocultismo, e cada ritual custa um número de pontos de experiência igual a três vezes o nível do ritual. Os rituais do Abismo são conjurados com uma rolagem de Raciocínio + Ocultismo. A dificuldade é 3 + o nível do ritual conjurado. Só um sucesso é necessário para conjurar o ritual, mas o Narrador é encorajado a tornar as penalidades da falha especialmente horríveis.]==],
				},
				["1. Locating the Oubliette"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 35


1. Locating the Oubliette


Sistema: A Cainita precisa se cortar e gastar ao menos um ponto de sangue. Numa rolagem bem-sucedida de Percepção + Ocultismo (dificuldade 5), a vampira consegue ver uma linha de um quilômetro de comprimento (mais um quilômetro por sucesso) que leva ao Oubliette mais próximo, se houver algum. Essa linha permanece visível à Mística do Abismo por uma noite para cada ponto de sangue gasto. Numa falha, nada acontece; uma falha crítica conduz a Cainita ao local mais próximo dotado de Fé Verdadeira, não importa a distância.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["1. Master of the Domain"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 49


1. Master of the Domain


Sistema: Concluído o rito, a koldun ganha permanentemente dois dados adicionais nas tentativas de Intimidação contra súditos mortais e Cainitas dentro de seu domínio. O Master of the Domain também impede que as vítimas dessa intimidação gastem Força de Vontade temporária para superar seus efeitos. O rito pode ser desfeito se os súditos da koldun a virem derrotada em qualquer forma de disputa.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["1. Memento Mori"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 293


1. Memento Mori


Este ritual atormenta o alvo com visões aterrorizantes da própria morte. Para conduzi-lo, a necromante toma um pequeno objeto pessoal do alvo. Pode ser uma amostra de fluido corporal, um fio de cabelo ou mesmo um pertence muito usado. A celebrante precisa cavar uma sepultura de pelo menos dois metros de profundidade e não menos de um metro de largura. Ela pode usar meios sobrenaturais para se ajudar, como Potência ou Metamorfose, mas precisa fazer o trabalho diretamente, sem nenhum outro auxílio. Quando termina de enterrar o objeto, o ritual começa a fazer efeito.
O alvo sofre visões intermitentes e aterrorizantes da própria morte pelo período de uma semana. Toda vez que o alvo é submetido a uma visão, ele precisa rolar sua Coragem (dificuldade 7). Se falhar, não consegue tomar ação alguma além de se encolher de terror até a visão passar.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["1. Minestra di Morte"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 177


1. Minestra di Morte


A necromante obtém um pedaço de um corpo morto e o cozinha em fogo brando numa panela com meio litro de vitae vampírica. A esse ensopado, a necromante acrescenta alecrim (pela lembrança), manjericão (a erva funerária) e sal (o princípio alquímico da clarificação). Depois de levar a mistura à fervura plena, a necromante a come.
Se a rolagem para ativar este ritual for bem-sucedida, a personagem descobre se o sujeito do rito macabro se tornou um espectro ou um Espectro após a morte, ou se de fato se tornou algum dos dois. Infelizmente, essa informação só pode ser obtida sobre a pessoa de cujo corpo a “carne do ensopado” foi tirada.
O componente de sangue é gasto progressivamente ao longo do ritual: se a Necromante tomar o sangue de outro Membro, ela não fica parcialmente ligada por bebê-lo, nem soma um ponto à sua reserva de sangue. Do mesmo modo, se ela usar o próprio sangue, sua reserva diminui em um ponto, mas não aumenta quando ela consome a sopa.
Vampiros necromantes sem a Qualidade Comer Comida (ver p. 480) não conseguem manter a sopa no estômago, mas ainda podem usar o ritual e obter a informação.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Pierce the Veil"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 271


1. Pierce the Veil


Sistema: Usando Jogo de Sombras, a mística forma uma bola de sombras na mão e contempla as profundezas dela. A jogadora rola Percepção + Ocultismo, dificuldade 8. Um sucesso faz a personagem ganhar permanentemente a Qualidade Visão Noturna. A falha significa apenas que o ritual não deu certo e precisa ser tentado em outra noite, enquanto a falha crítica faz a Visão Noturna ser adquirida como Defeito.
Quando a personagem usa a Visão Noturna obtida por este ritual, seus olhos ficam completamente negros, sem reflexo algum — janelas para o próprio Abismo. Esse efeito é permanente para personagens que obtiveram a Visão Noturna por falha crítica no ritual.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["1. Preserve Corpse"] = {
					pt = [==[Rites of Blood, pág. 103


1. Preserve Corpse


Ritual de Necromancia de Nível Um. Este ritual permite ao usuário criar um elixir que impede a carne morta de apodrecer. O ritual exige que o conjurador revista fisicamente a carne morta com um líquido composto de terra de sepultura, água benta profanada e ervas raras. Uma vez seco o líquido, a carne fica preservada por tempo indefinido — sabe-se de casos que duraram centenas de anos. O ritual produz elixir suficiente para revestir um cadáver humano adulto.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["1. Purify Blood"] = {
					pt = [==[Rites of Blood, pág. 147


1. Purify Blood


Sistema: Purificar Sangue funciona em até um ponto de sangue. Por causa das limitações de volume, Purificar Sangue só pode limpar um ponto de sangue por vez. Venenos, doenças e outras misturas desaparecem, enquanto substâncias estranhas borbulham até a superfície e podem ser retiradas. Porém, o ritual não altera de modo algum a potência do sangue; a vitae ainda pode causar um laço de sangue, e sangue tornado ácido ou cáustico por uma Disciplina (como Quietus ou Vicissitude) não pode ser limpo. Este ritual não pode contrariar a Vaulderie (nem é discreto o bastante para ser realizado sem ser notado no meio de tal rito). Sangue podre, solidificado ou excessivamente estragado também desaparece se submetido ao ritual (a critério do Narrador), de modo que o vampiro não precisa temer engasgar com sangue velho e morto.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Purity of Flesh"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 232


1. Purity of Flesh


Sistema: O jogador gasta um ponto de sangue antes de rolar. A Pureza da Carne remove todos os itens físicos do corpo da conjuradora, mas não remove encantamentos, controle mental nem doenças do sangue.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Reawakening the Dead Water"] = {
					pt = [==[Rites of Blood, pág. 157


1. Reawakening the Dead Water


Sistema: Se o ritual for realizado com êxito (com ao menos um sucesso), o koldun recupera um ponto de Força de Vontade gasto. Isso não pode elevar sua Força de Vontade acima do máximo normal. Este ritual só pode ser realizado uma vez por noite.
Mecânica de dados da Feitiçaria Koldúnica (p. 156): a rolagem para ativar um ritual de Feitiçaria Koldúnica é Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual. As conexões metafísicas da escola com Kupala e com as terras permeadas por esse espírito aumentam a dificuldade em +1 em todas as rolagens de Feitiçaria Koldúnica feitas em favor de koldun que operam sua magia fora dos territórios da Europa Oriental.]==],
				},
				["1. Rite of Introduction"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 311


1. Rite of Introduction


Ritual Tremere. Os Tremere usam este ritual como método formal de apresentação ao chegarem a uma cidade nova, embora também seja possível usá-lo para pedir ajuda. A conjuradora ferve um punhado de raiz de tamarisco moída e uma gota de óleo de galanga numa panela de água da chuva, e então recita uma curta encantação sobre os vapores que se formam acima da panela. Em seguida fala uma breve mensagem de trinta segundos, que é comunicada telepaticamente primeiro ao regente e depois aos demais membros do clã na cidade, conforme a posição de cada um na hierarquia. O ritual permite ao regente responder telepaticamente e travar uma conversa de cinco minutos com a conjuradora, se assim desejar.
Rituais de clã (pág. 302): Os rituais de clã são segredos ciosamente guardados, jamais compartilhados com quem não pertence ao clã ou linhagem que abriga seus mistérios.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["1. Rite of Reclamation"] = {
					pt = [==[Rites of Blood, pág. 76


1. Rite of Reclamation


Sistema: Os efeitos do ritual duram até se passar um número de nasceres do sol igual ao número de sucessos obtidos na conjuração. Quando o Feiticeiro alcança a Morte Final, todo o seu sangue escorre por seus poros e é reclamado pela terra, sendo misticamente transportado a Alamut. Se o momento da Morte Final vier como resultado de diablerie, a diablerista sente todo o sangue obtido do Assamita arranhando o caminho para fora dela, causando um número de danos letais igual aos sucessos obtidos na conjuração do ritual. Ele escorre pelos poros dela e é sugado pelo chão. A diablerie ainda é considerada bem-sucedida, mas nenhum sangue é obtido do ato, o que pode provocar um teste de frenesi por fome.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["1. Ritual of Return"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 42


1. Ritual of Return


Só os Assamitas detêm o conhecimento necessário para localizar Alamut, guardado nas profundezas do próprio Sangue de Alamut. Quando um vizir precisa mandar um Assamita para Alamut ou de lá, ou convocá-lo à Cidade Santa, o feiticeiro que conjura este ritual usa uma de três variações. Quando o Ritual do Retorno é invocado, salvo indicação, o Assamita afetado entra no Transe do Retorno descrito na pág. 40 assim que parte em viagem para Alamut. Na prática, se um Assamita tivesse se refugiado na corte de um Príncipe, isso surtiria efeito quando ele deixasse o domínio do Príncipe.
Se todos os participantes estiverem em Alamut, o feiticeiro só precisa cuspir em terra ou poeira para fazer lama antes de marcar cada calcanhar do Cainita que será enviado. Assim que o vizir fala o nome do lugar, o Assamita entra imediatamente no Transe do Retorno. Ele viaja ao destino o mais rápido possível e esquece a jornada, parando apenas para comer, se abrigar do sol e nas Torres de Vigia do clã ao longo do caminho.
Se todos os participantes estiverem no mesmo lugar e esse lugar não for Alamut, o feiticeiro que conjura o feitiço precisa pôr um capuz de viajante no Assamita e instruí-lo a voltar para casa. O vizir então lhe pergunta se serviu a Haqim com fidelidade (ao que se espera que o Assamita responda que sim). O feiticeiro toma o frasco de sangue que o vizir traz consigo e desenha um círculo em volta do viajante, usando o frasco como instrumento para marcar o chão. Quando o vizir fala o nome de Alamut, o Assamita o repete e entra imediatamente no Transe do Retorno.
Se o vizir e o feiticeiro estiverem em Alamut, mas o Assamita convocado não, o ritual é mais complicado. O feiticeiro invoca o Sangue de Alamut para chamar de volta o membro errante do clã. Isso exige que o conjurador seja membro dos Guardiões da Poça (como descrito na pág. 41). O Guardião precisa desenhar um círculo em volta do vizir, que fala o nome do Assamita convocado três vezes enquanto o sangue da poça é derramado sobre sua cabeça. O membro do clã se sente irrevogavelmente atraído, mas pode passar a noite acertando pendências antes de começar a viagem de volta na noite seguinte, quando então entra imediatamente no Transe do Retorno. O uso deste ritual em geral se limita às ocasiões em que um Assamita está longe de qualquer cidade grande onde vizires e feiticeiros poderiam usar o segundo método de invocar o Ritual do Retorno.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["1. Ritual of the Smoking Mirror"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 178


1. Ritual of the Smoking Mirror


Este ritual permite ao necromante usar um espelho de obsidiana para ver como os fantasmas veem. Ao fitar as profundezas de ébano do espelho, o vampiro pode descobrir os defeitos de um objeto, avaliar a saúde geral de mortais ou até ler a aura de um ser.
No início do ritual, a Membro decide qual dos dois aspectos do ritual usará — ela não pode usar os dois ao mesmo tempo. Com a Visão da Vida, a necromante pode ler auras como se tivesse o poder de nível dois de Auspícios, Percepção da Aura. A Visão da Morte, por outro lado, concede à necromante a capacidade de ver fantasmas e as Terras das Sombras. Ela também mostra a mácula do olvido nos vivos, conforme os Olhos dos Mortos (p. 174). A critério do Narrador, a Membro pode fazer um estudo semelhante dos defeitos de um objeto inanimado e de como repará-los, se aquele objeto tiver forte ligação com energias de vida ou de morte (como a faca de um assassino ou uma jardineira usada para cultivar ervas medicinais).
Para realizar o ritual, a necromante segura um espelho de obsidiana cuja borda foi afiada de modo a cortar a carne de quem o empunha. Enquanto a vitae escorre sobre a superfície do espelho, ela permite que o poder reflexivo do espelho faça a ponte entre os mundos dos vivos e dos mortos, tal como permite à própria necromante fazê-lo. O jogador então rola para ativar o ritual normalmente. Se for bem-sucedida, a Necromante pode ver o mundo como um fantasma o vê pela superfície reflexiva do espelho, por uma cena. Numa falha crítica, a vampira pode muito bem atrair a ira dos espíritos que invoca.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["1. Sanctify the Temple"] = {
					pt = [==[Rites of Blood, pág. 62


1. Sanctify the Temple


Sistema: O ritual dura um mês lunar, mas pode ser renovado indefinidamente. Enquanto o ritual estiver ativo, a dificuldade de todas as rolagens para ativar trilhas ou rituais Old Skool executados dentro do espaço do templo é reduzida em -1. O número de sucessos determina o tamanho máximo do espaço que pode ser santificado.
1 sucesso — uma área de dois por dois metros, como um closet grande, um quarto secreto ou um bosquete minúsculo
3 sucessos — uma área de seis por seis metros, como o santuário de uma igreja pequena ou um bosque grande
5 sucessos — uma área de uns 30 metros quadrados, como uma igreja de porte médio ou uma pequena mata
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Sanguineous Phial"] = {
					pt = [==[Rites of Blood, pág. 147


1. Sanguineous Phial


Sistema: Para se preparar para este ritual, a taumaturga enterra um recipiente de barro com tampa por duas noites e depois o desenterra. Na noite seguinte, ela esfarela folha seca de freixo dentro do pote vazio e então sussurra a encantação apropriada. Depois, ela pode derramar sangue no recipiente e selá-lo com sebo derretido de uma vela. O sangue permanece fresco até que o selo seja rompido. Depois que o recipiente é aberto, o sangue começa a estragar a uma taxa normal. Se o recipiente for quebrado, o sangue se deteriora imediatamente ao estado que teria alcançado se nunca tivesse sido conservado. O recipiente pode ser usado mais de uma vez, mas o ritual precisa ser reconjurado, ou o sangue estraga.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Sense the Mystical"] = {
					pt = [==[Rites of Blood, pág. 147


1. Sense the Mystical


Sistema: O efeito deste ritual dura um número de horas igual aos sucessos obtidos na rolagem de ativação. Sentir o Místico pode detectar Taumaturgia, Necromancia e magia de sangue semelhante se usada dentro do raio da luz da vela. Este poder não distingue entre os diferentes tipos de magia de sangue, nem capta Disciplinas normais. Esta capacidade dura uma hora.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Servitor’s Perception"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


1. Servitor’s Perception


Sistema: Concluído o rito, a koldun imbui qualquer animal com tantos pontos quantos tiver em Genius Loci. A koldun precisará de um jeito de comandar ou possuir o animal se quiser ter alguma influência sobre o que ele procura ou relata. Este rito se rompe se o animal for morto.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["1. Shew-Stone"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 293


1. Shew-Stone


Este ritual Impundulu cria uma pedra mágica que pode ser usada para acompanhar os amigos ou inimigos de um necromante, vivos ou mortos. Para criar uma Shew-Stone, o necromante precisa pintar o nome de uma pessoa com sangue de ave (as tradições germânicas insistem no uso de sangue de poupa) sobre uma pedra polida e consagrada. O necromante precisa apaziguar os espíritos executando um rito, como uma dança, uma prece ou uma oferenda. Espíritos fantasmagóricos então aparecem na Shew-Stone e sussurram o paradeiro do alvo ao ouvido do necromante.
A pedra perde seus poderes depois de um mês, a menos que o necromante gaste um ponto de sangue para renovar a magia.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["1. Sigil of Authority"] = {
					pt = [==[Rites of Blood, pág. 24


1. Sigil of Authority


Sistema: O taumaturgo corta metodicamente um desenho na carne do sujeito voluntário com uma lâmina de ponta de prata. Este sigilo precisa ter ao menos oito centímetros de diâmetro e pode ser colocado em qualquer lugar do corpo do sujeito. O desenho deve apresentar metaforicamente a autoridade do cargo representado, e o significado deve ser facilmente compreendido por quem o vir. Por exemplo, o sigilo do Xerife de um domínio pode ser um distintivo em forma de estrela ou um escudo policial.
O taumaturgo precisa passar uma noite na presença voluntária do Investidor do Sigilo (o vampiro que ocupa o cargo do qual a autoridade provém) e do Portador do Sigilo (o vampiro que carregará a voz do referido cargo) para sintonizar o sigilo com a ressonância do cargo. Ao fim da noite, o Portador do Sigilo precisa jurar lealdade ao cargo. Uma vez ativado, todos os presentes sabem instintivamente que o Portador do Sigilo representa legitimamente o cargo do Investidor do Sigilo.
O Portador do Sigilo precisa expor o sigilo e gastar um ponto temporário de Força de Vontade para projetar o peso da autoridade do Investidor do Sigilo. Qualquer vampiro em sua presença precisa fazer uma rolagem de Autocontrole (dificuldade 8) ou fica com três dados a menos em todas as rolagens Sociais contra o Portador do Sigilo pelos quinze minutos seguintes.
O Sigilo da Autoridade dura um ano para cada sucesso na rolagem de ativação, e o Portador percebe quando ele se desfaz. Este ritual pode ser renovado com o Portador do Sigilo jurando novamente o juramento do cargo.
A autoridade do sigilo pode ser revogada imediatamente se o Investidor do Sigilo gastar um ponto de Força de Vontade. Se isso acontecer, o Portador do Sigilo fica sabendo na hora, pois o símbolo cortado em sua carne é queimado até deixar de ser visível. Essa rejeição é dolorosa e queima um nível de dano agravado na carne do ex-Portador do Sigilo.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Strength of Haqim"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 42


1. Strength of Haqim


Um dos primeiros rituais que um novo feiticeiro Assamita pode aprender é este feitiço protetor, destinado a permitir que ele recorra ao poder de todos os Assamitas, passados e presentes, para resistir à dominação ou ao vício de sangue. Carregando consigo um amuleto banhado no Sangue de Alamut e recitando uma breve encantação, a Assamita pode ganhar dados adicionais iguais aos seus pontos de Taumaturgia para resistir ao efeito de feitiços ou Disciplinas que alterem a mente. A defesa da vampira contra esses mesmos efeitos é reduzida em um a cada conjuração fracassada. Se o efeito não admitir defesa, isso se aplica como penalidade à ativação.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["1. Tame the Maddening Flame"] = {
					pt = [==[Dark Ages Companion, pág. 116


1. Tame the Maddening Flame


Nota: Este é um Ritual de Refúgio (ver Dedicate the Haven, V20 Dark Ages, pág. 310)
O fogo ilumina a Idade das Trevas e, embora os Cainitas o temam, eles em geral conseguem controlar sua reação diante de uma fogueira, lareira ou tocha domadas. Este ritual os protege quando o fogo pode se espalhar de forma imprevisível, como num campo de batalha ou quando é usado como arma.
O Tremere conspurca um jarro de água com uma quantidade trivial de seu sangue e o usa para molhar o perímetro de um aposento ou local ao ar livre. Um espaço fechado de quase qualquer tamanho pode ser protegido, mas uma área ao ar livre se limita a um raio de cerca de 50 metros. Todo fogo novo ou já existente na área protegida assume um tom esverdeado e sua fumaça tem cheiro doce. Ele já não pode provocar Rötschreck. Além disso, reduza em um Nível de Vitalidade o dano de todos os ferimentos infligidos pelo fogo dentro da área. Isso dura enquanto o conjurador estiver presente.
Ritual de Refúgio (V20 Dark Ages, pág. 310): Uma vez consagrado pelo Dedicate the Haven, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["1. The Abyss Knows"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 35


1. The Abyss Knows


Sistema: O Cainita precisa possuir o ritual de Misticismo do Abismo Pierce the Veil (ver V20 Dark Ages pág. 271) e ter a Qualidade Visão Noturna. Gastando um ponto de sangue e rolando Percepção + Vigilância (dificuldade padrão contra uma rolagem oposta de Consciência/Convicção, se resistida), o sucesso indica se o alvo é um verdadeiro servo do Abismo ou um impostor. A falha não tem efeito; uma falha crítica faz o Místico do Abismo interpretar mal o resultado.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["1. The Word of the Dark God"] = {
					pt = [==[Rites of Blood, pág. 83


1. The Word of the Dark God


Sistema: Isto é puramente um recurso narrativo para o Narrador aproveitar, sem nenhum outro benefício mecânico. Como regra opcional, os Narradores podem empregar as tarefas dadas por este ritual como testes a cumprir antes de conceder acesso a níveis mais altos de Feitiçaria Setita. De resto, o favor de Set pode se manifestar da forma que o Narrador quiser.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["1. Treasured Ornaments"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 49


1. Treasured Ornaments


Sistema: Concluído o rito, a koldun pode conversar com os ornamentos importantes de seu refúgio. Os efeitos são permanentes, embora deixar os espíritos no local tenda a irritá-los com o tempo. Um ornamento importante é aquele com história — talvez uma arma dada de presente, ou o berço de uma criança falecida. O rito é dispensado quando um convidado não convidado toca os ornamentos.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["1. Truth in Water"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


1. Truth in Water


Sistema: O sucesso do rito converte a água numa espécie de detector de mentiras. O rito só afeta água suficiente para encher um barril, e essa água permanece pura até ser derramada no chão. Uma vez fervendo, ela causa um nível de dano letal aos mortais que mintam em contato com ela, e um nível de dano contundente por turno aos Cainitas.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["1. Typhon’s Brew"] = {
					pt = [==[Rites of Blood, pág. 84


1. Typhon’s Brew


Sistema: Fermentar a Cerveja de Tífon leva um mês lunar completo, começando e terminando na lua nova. Para cada galão fermentado, o alquimista inclui o equivalente a um ponto de sangue de seu próprio vitae. O processo de fermentação multiplica o vitae, de modo que um carniçal ganha um ponto de sangue por quarto de galão da cerveja mágica. Os vampiros, porém, ganham apenas um ponto de sangue por galão consumido — a mesma taxa usada na fermentação. Para vampiros, a magia da cerveja se limita ao fato de que eles conseguem bebê-la sem regurgitá-la segundos depois. Podem até ficar bêbados com ela (e sofrer ressaca depois).
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["1. Unnatural Decay"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 48


1. Unnatural Decay


Sistema: Concluído o rito, todas as plantações num raio de um quilômetro do ponto de conclusão tornam-se levemente venenosas para humanos, fazendo quem consumir os produtos tóxicos perder um ponto de Vigor por semana. O rito é desfeito pela sangria de um mortal sobre a terra amaldiçoada. Tecnicamente isso só exige a perda de uns três pontos de sangue, mas na prática costuma significar a morte do mortal.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["1. Wake with Evening’s Freshness"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 232


1. Wake with Evening’s Freshness


Sistema: Este ritual precisa ser realizado imediatamente antes de o vampiro dormir para o dia. Qualquer interrupção da conjuração cerimonial torna o ritual ineficaz. Se surgir perigo, o conjurador acorda e pode ignorar a regra de limite de parada de dados por Humanidade/Trilha nos dois primeiros turnos de consciência. Depois disso, a penalidade entra em vigor, mas o taumaturgo já terá se erguido e poderá lidar com situações problemáticas.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Water Walking"] = {
					pt = [==[Rites of Blood, pág. 63


1. Water Walking


Sistema: Em combate, os sucessos determinam por quantos turnos a New Ager pode continuar a se mover sem afundar ou cair. Fora de combate, os efeitos do ritual duram enquanto a ritualista permanecer em movimento, ou até o fim da cena.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Weight of Shadows"] = {
					pt = [==[Rites of Blood, pág. 38


1. Weight of Shadows


Sistema: Este ritual só permite à conjuradora controlar sombras naturais, não sombras criadas por Obtenebração. As sombras controladas por ela podem ganhar ou perder um pouco de tamanho (assim, a sombra de uma mulher poderia parecer a de um homem, mas a sombra de um cachorro não). Só uma sombra dessas pode ser controlada por vez. O Narrador é o árbitro de que tipos de sombra são grandes demais para este poder afetar (como a sombra de um arranha-céu). Os efeitos deste ritual duram até o nascer do sol seguinte.
Efeito Colateral: As sombras são atraídas para a conjuradora e, quando não controladas, tentam se mover em direção a ela, chegando a se curvar contra a luz. A conjuradora ganha o Defeito Presença Sinistra (com o descritor acima) pela duração dos efeitos deste ritual. (V20, pág. 495).
Rituais Abissais (pág. 37): Os rituais a seguir não seguem as mesmas regras de outras formas de magia, em grande parte porque se apoiam numa Disciplina que não é de fato uma forma de feitiçaria. Para aprender Misticismo do Abismo, o Cainita precisa ter ao menos um ponto em Obtenebração e um ponto em Ocultismo. Essa personagem não pode aprender rituais do Abismo de nível superior ao seu Obtenebração ou ao seu Ocultismo (o que for menor). Conjurar rituais do Abismo exige uma rolagem bem-sucedida de Raciocínio + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para o ritual dar certo. Diferentemente dos rituais normais, cada ritual de Misticismo do Abismo custa 3 vezes o nível do ritual em pontos de experiência para ser aprendido. Todos os rituais de Misticismo do Abismo também têm efeitos colaterais permanentes; em nenhuma circunstância os Defeitos obtidos desses efeitos colaterais recompensam o vampiro com pontos de bônus ou de experiência, nem podem ser comprados de volta.]==],
				},
				["1. Widow’s Spite"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 232


1. Widow’s Spite


Sistema: A boneca cerimonial precisa se parecer, por mais toscamente que seja, com a vítima do ritual. Ela não produz efeito mecânico nenhum além de um simples estímulo físico. O conjurador pode determinar em que parte do corpo do sujeito a dor ou coceira aparece.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["1. Word of Insight"] = {
					pt = [==[Rites of Blood, pág. 93


1. Word of Insight


Sistema: Ao conjurar o ritual com sucesso, uma fumaça sobe do incensário e uma miríade de rostos fantasmagóricos pode ser vista dentro dela. Cada rosto murmura ou sussurra uma palavra ou frase, todas se sobrepondo, formando um estrondo cacofônico. A visão e as vozes se desvanecem depois de alguns segundos.
O futuro é um mar largo e mutável de possibilidades, então, de início, a necromante precisa especificar um assunto particular sobre o qual está indagando (fechar um negócio com êxito, obter um item específico, superar um certo problema etc.). Ela não necessariamente acha as vozes coerentes ou compreensíveis, mas, quando o ritual se concretiza, ela vive um momento de clareza e entende o que a mensagem queria dizer.
Mecanicamente, essa revelação permite à necromante rerrolar uma ação fracassada mais tarde, na mesma noite em que o ritual foi conjurado, desde que seja em busca direta do futuro que ela adivinhou. Ela previu esse fracasso e possivelmente sabia como evitá-lo. Se falhar na segunda rolagem, ainda assim falha, percebendo a revelação um momento tarde demais.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Abyssal Blade"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 35


2. Abyssal Blade


Sistema: A Mística do Abismo precisa mergulhar a lâmina da arma no sangue de qualquer criatura viva, segurando o cabo enquanto dedica suas mortes futuras ao Abismo. Ela rola Força + Ocultismo (dificuldade 7); o sucesso imbui a arma de um poder profano que permite ignorar armaduras — não Fortitude — e infligir dano agravado a mortais. Cada sucesso mantém a arma imbuída por uma noite. Quando o poder se esgota, a arma corrói e fica inútil. O ritual pode ser executado mais de uma vez na mesma arma, antes da corrosão. A falha não produz resultado; uma falha crítica corrói a arma imediatamente e impede que o ritual seja entoado de novo naquela noite.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["2. Antonius’s Denial"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 293


2. Antonius’s Denial


Um prodígio do sangue de Augustus Giovani, chamado Antonius Giovani, criou este rito perverso no início dos estudos da linhagem. Ele nega a morte a uma vítima, ainda que temporariamente. Não nega, porém, a dor. O ritual exige que o vampiro sacrifique temporariamente um ponto permanente (não um ponto temporário) de Força de Vontade, que só retorna na noite seguinte àquela em que ele decide encerrar os efeitos. Ao conjurar este ritual, a vítima ganha um número de níveis de Vitalidade Incapacitado fantasmas igual aos sucessos da conjuração. A personagem não pode ficar Incapacitada, apenas Aleijada, não importa o dano que sofra. A vítima não pode curar esses níveis de Vitalidade fantasmas sob nenhuma circunstância, e se o ritual terminar, quaisquer ferimentos nessas caixas são somados como dano agravado à sua trilha de Vitalidade normal.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["2. Ascension of the Blood"] = {
					pt = [==[Lore of the Clans, pág. 221


2. Ascension of the Blood


Sistema: A ritualista prepara um cálice especial no qual põe tanto do próprio sangue quanto precisar. Com ao menos um sucesso, o sangue do cálice já não pode criar laço de sangue e é seguro para qualquer outro beber. É claro que o sangue continua com a mesma aparência, seja o ritual um sucesso, seja a Tremere simplesmente mentindo.
Conjuração de ritual taumatúrgico (V20, pág. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Autumn’s Armor"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


2. Autumn’s Armor


Sistema: Concluído o rito, a koldun emerge da terra portando uma armadura de terra com valor permanente 2 contra todas as formas de dano. A armadura aumenta em 2 a dificuldade das ações Sociais. O rito se encerra se a koldun for atingida por uma arma com ponta de pedra.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["2. Banning Rituals"] = {
					pt = [==[Dark Ages Companion, pág. 116


2. Banning Rituals


• Poderes Infernais: poderes demoníacos, magia Infernal de todo tipo.
• Os Gentis: poderes dos Feéricos.
• Feitiçaria: magia mortal aprendida por Caminho ou Pilar.
• Malícia Espiritual: Dons de Lupinos e espíritos.
• Ira dos Mortos: Arcanoi fantasmagóricos.
• Sabedoria da Maldição: Disciplinas Cainitas.
Se o poder não tiver um valor em pontos, use o maior valor de Traço envolvido em sua operação. Poderes da categoria não podem afetar um objeto banido, nem cruzar o limiar de um espaço banido em qualquer direção, mas ainda podem ser usados dentro dele. Por exemplo, um mago mortal pode ler a mente de um Tremere enquanto os dois estão dentro de um refúgio Banido contra Feitiçaria, mas não enquanto um está fora e o outro dentro.
De modo semelhante às proteções, os banimentos podem ser resistidos com uma rolagem estendida de Força de Vontade com dificuldade 4 + o nível do banimento, acumulando sucessos iguais ao nível de Taumaturgia de quem o conjurou. A personagem que desafia o banimento precisa, porém, conseguir ver ou tocar o objeto ou o limiar. O sucesso destrói o banimento e, não importa onde a conjuradora esteja, ela ouve um estalo seco quando ele cai.
Os banimentos duram um número de semanas igual aos sucessos obtidos na rolagem de conjuração.
Ritual de Refúgio (V20 Dark Ages, pág. 310): Uma vez consagrado pelo Dedicate the Haven, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["2. Beat Your Way to Glory"] = {
					pt = [==[Rites of Blood, pág. 65


2. Beat Your Way to Glory


Sistema: Cada sucesso faz o vampiro ganhar uma característica ligada à Aparência da vítima mortal, escolhida entre cor do cabelo, estilo do cabelo, pelos faciais, tatuagens, piercings ou roupas. Quando o vampiro desperta na noite seguinte, ele tem esses traços (e, se for o caso, acorda vestindo uma cópia das roupas do mortal com o tamanho perfeito para ele). O ritual não altera a aparência geral — o vampiro continua com basicamente o mesmo aspecto de antes, e só traços superficiais mudam. Piercings e tatuagens aparecem no corpo do vampiro aproximadamente no mesmo lugar em que estavam no corpo do mortal, ajustados onde necessário por diferenças de tamanho e compleição. As roupas duram até serem destruídas, mas todas as demais características adquiridas passam a fazer parte da aparência padrão do vampiro.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Blade of Smoke and Shadow"] = {
					pt = [==[Rites of Blood, pág. 77


2. Blade of Smoke and Shadow


Desde as noites da Segunda Cidade, os Assamitas lutam contra forças demoníacas. Armas físicas mundanas normalmente não têm efeito sobre esses seres efêmeros, mas os Assamitas Feiticeiros há muito conhecem o segredo de encantar uma lâmina para que ela possa ferir demônios.
A Feiticeira primeiro obtém uma adaga de obsidiana com cabo de ferro. Ela pode ser preparada pela Feiticeira ou obtida de outra forma — o que importa é a composição da arma, não o método de sua criação. Em seguida, ela prepara uma câmara onde nenhuma luz possa entrar naturalmente. Este ritual precisa ser conjurado em escuridão completa, ou fracassa automaticamente.
O seguinte precisa estar presente na câmara, mas pode ser real ou representado da forma que a Feiticeira escolher: um conjunto de água, representando o oceano primordial, e um bloco de argila endurecida, representando a Tábua dos Destinos suméria.
A Feiticeira invoca o nome do herói sumério Marduk da forma que quiser, desde que esteja pedindo o auxílio dele para golpear as forças de Tiamat, as forças do caos e da escuridão. Enquanto entoa os cânticos, a Feiticeira deixa a lâmina provar seu sangue.
Depois de dez minutos de invocação, se a rolagem for bem-sucedida (o que também acarreta um dano letal pela sangria), o ritual está completo. A lâmina de obsidiana torna-se completamente insubstancial, restando sólido apenas o cabo. A lâmina agora aparece como uma coluna de fumaça que gira lentamente e se estende do cabo, mas em geral mantém a forma anterior. Ela permanece assim até se passar um número de nasceres do sol igual ao número de sucessos obtidos. Depois disso, a fumaça se dissipa e a lâmina de obsidiana se foi para sempre (exigindo, assim, obter uma nova lâmina para uma nova conjuração).
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Blood Calls to Blood"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 43


2. Blood Calls to Blood


Um vizir muitas vezes precisa contatar um membro do clã que esteja vagando pelo mundo, numa corte da Europa ou infiltrado numa coterie para julgar um de seus membros. Invocando o nome do Cainita que deseja contatar, o vizir pode orientar um feiticeiro a alcançar o membro do clã em questão, desde que esteja voltado para a direção geral dele. Se o vizir que pede a conversa for de geração inferior à do alvo, a conexão começa imediatamente e ele pode então falar na mente do membro do clã, ouvir os pensamentos enviados e até ver pelos olhos e ouvir pelos ouvidos de seu irmão Assamita. Se o requisitante for de geração superior, o viajante ganha pleno conhecimento de quem ele e seu senhor são, onde estão e seu estado geral de espírito, e pode aceitar ou recusar a comunicação.
O feiticeiro age apenas como conduto que viabiliza a comunicação, e não pode participar nem ouvir parte alguma da troca. Ele precisa gastar um ponto de sangue a cada cinco minutos em que a conexão fica aberta, arredondando para cima. Um Assamita de geração inferior pode usar quaisquer Disciplinas de Clã que normalmente exijam proximidade física enquanto se comunica dessa forma.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["2. Blood Crystal"] = {
					pt = [==[Rites of Blood, pág. 63


2. Blood Crystal


Sistema: O número de sucessos determina a quantidade máxima de pontos de sangue que podem ser armazenados num único cristal. O feiticeiro pode retirar parte ou toda a própria vitae de um cristal à vontade. Qualquer outra personagem que manuseie o cristal e medite sobre ele retira magicamente um ponto de vitae dele para o próprio corpo se obtiver ao menos um sucesso numa rolagem de Força de Vontade (dificuldade 7). Isso inclui mortais ou até seres sobrenaturais como Lupinos ou magos. Se a personagem que medita tiver sofrido ferimentos, o sangue a cura como se ela fosse uma carniçal que tivesse gasto sangue conscientemente para se curar. Uma personagem que medite com sucesso sobre um cristal em três ocasiões fica vinculada pelo sangue ao criador do cristal (supondo que ele contivesse vitae suficiente). Porém, enquanto o cristal ainda contiver vitae, ele carrega um vínculo simpático com seu criador equivalente a um ponto da vitae dele nas mãos de um mago de sangue rival.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Blood Walk"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 232


2. Blood Walk


Sistema: Este ritual exige três horas para ser conjurado, reduzidas em 15 minutos para cada sucesso na rolagem. Exige um ponto de sangue do sujeito. Cada sucesso permite ao conjurador “ver para trás” uma Geração (até o limite da Quarta Geração — os de Terceira Geração não entregam seus segredos com tanta facilidade), dando ao conjurador tanto o nome verdadeiro do ancestral quanto uma imagem de seu rosto. O conjurador também descobre a Geração e o Clã ou linhagem de que o sujeito descende. Com três sucessos, o conjurador também descobre a identidade de todas as partes com quem o sujeito compartilha um laço de sangue, seja como senhor, seja como servo.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Borne by Wind"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


2. Borne by Wind


Sistema: Concluído o rito, o koldun é capaz de mergulhar numa área se houver vento presente e ele conseguir ver o destino. Com um turno de concentração, ele desaparece do local de origem, viajando à velocidade do vento, e reaparece no destino pretendido. Este rito não pode ser usado se ele estiver sendo atacado, pois o Cainita não consegue se concentrar nessa ocasião. Ele permite, contudo, fazer um ataque de surpresa contra um inimigo desavisado. Este rito é neutralizado se o koldun o usar para lançar um ataque e errar o primeiro golpe.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["2. Burning Blade"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 232


2. Burning Blade


Sistema: Este ritual só pode ser conjurado em armas brancas. A conjuradora precisa cortar a palma da mão que empunha a arma durante o ritual — com a própria arma, se for cortante, ou com uma pedra afiada. Isso inflige um único nível de dano letal, que não pode ser absorvido, mas pode ser curado normalmente. A jogadora gasta três pontos de sangue, que são absorvidos pela arma. Uma vez conjurado o ritual, a arma inflige dano agravado a todas as criaturas sobrenaturais nos próximos ataques bem-sucedidos, um por sucesso rolado. Múltiplas conjurações da Lâmina Ardente não podem ser “acumuladas” para durações mais longas.
Além disso, quem empunha a arma não pode escolher causar dano normal e “guardar” golpes agravados — cada ataque bem-sucedido usa um golpe agravado até não restar nenhum, ponto em que a arma volta a infligir dano normal.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Comforting Darkness"] = {
					pt = [==[Lore of the Clans, pág. 126


2. Comforting Darkness


Sistema: Conjurado o ritual, a vampira faz uma rolagem de Vigor + Ocultismo (dificuldade 8). Se tirar falha crítica, a escuridão a queima e ela sofre um nível de dano agravado. Se for bem-sucedida, pode então gastar um ponto de sangue por sucesso, ignorando os limites de Geração. Para cada ponto de sangue gasto assim, ela pode curar três níveis de dano contundente ou letal.
Infelizmente há um custo adicional antes que a escuridão interior se sacie. Todo o sangue que a vampira consumir alimenta o escuro dentro dela, sem sequer entrar em seu próprio sistema. Isso continua até que tenha sido consumido o dobro do sangue originalmente gasto. Até quitar esse custo, a Cainita não pode usar este ritual de novo. Ele também só pode ser usado uma vez por noite.
Efeito Colateral: A mácula da escuridão nunca deixa o sangue da conjuradora, tingindo-o para sempre de um tom rubro escuro, quase negro.
Misticismo do Abismo (pág. 125): O Misticismo do Abismo é difícil e demorado de aprender, e tem um preço. Seus rituais costumam ter efeitos colaterais que criam Defeitos que a personagem não pode remover e que não dão pontos de bônus. Para aprender o poder, o vampiro precisa ter ao menos um ponto tanto em Obtenebração quanto em Ocultismo. Ele não pode aprender rituais do Abismo de nível superior ao menor entre seu Obtenebração e seu Ocultismo, e cada ritual custa um número de pontos de experiência igual a três vezes o nível do ritual. Os rituais do Abismo são conjurados com uma rolagem de Raciocínio + Ocultismo. A dificuldade é 3 + o nível do ritual conjurado. Só um sucesso é necessário para conjurar o ritual, mas o Narrador é encorajado a tornar as penalidades da falha especialmente horríveis.]==],
				},
				["2. Commune with Cainite"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 304


2. Commune with Cainite


Ao executar este ritual, o conjurador pode unir sua mente à de outro Cainita, falando telepaticamente com ele a qualquer distância. Para criar a conexão, o conjurador precisa meditar por dez minutos sobre um objeto físico que já tenha pertencido ao outro Cainita. A comunicação pode ser mantida por uma cena, ou até que uma das partes encerre a conversa.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["2. Concentrated Vitae"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


2. Concentrated Vitae


Sistema: Concluído o rito, o sangue consumido quando misturado à água escolhida rende o dobro de pontos de sangue do normal. O rito só se encerra se a água for conspurcada com outra substância.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["2. Craft Bloodstone"] = {
					pt = [==[Rites of Blood, pág. 147


2. Craft Bloodstone


Sistema: Uma taumaturga pode criar um número de Pedras de Sangue até seu valor permanente de Força de Vontade. Ela sabe instintivamente a direção precisa e a distância aproximada em relação à conjuradora. Se uma Pedra de Sangue for ofuscada ou misticamente escondida, a conjuradora pode seguir a trilha até chegar ao local aproximado. Uma vez lá, a conexão fica embaçada e ela não consegue mais sentir bem a Pedra de Sangue. Uma Pedra de Sangue destruída rompe sua conexão com a taumaturga imediatamente, muitas vezes com alguma forma de contragolpe doloroso (que distrai, mas não fere).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Craft Gris-Gris"] = {
					pt = [==[Rites of Blood, pág. 166


2. Craft Gris-Gris


Sistema: Enquanto estiver sob os efeitos da maldição do gris-gris, o alvo sofre uma penalidade de -1 em todas as paradas de dados por causa de uma dor de cabeça constante e latejante. Este efeito é permanente contra mortais, a menos que a bolsa seja encontrada e removida. Contra Membros, dura uma noite por sucesso, mas termina antes se a bolsa for removida. Nas mãos de outra wangateur com valor de Wanga mais alto, a bolsa tem uma conexão simpática com sua criadora equivalente a um ponto do sangue da criadora.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Donning the Mask of Shadows"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 233


2. Donning the Mask of Shadows


Sistema: Este ritual pode ser conjurado simultaneamente sobre um número de sujeitos igual ao valor de Ocultismo do conjurador; cada indivíduo além do primeiro acrescenta cinco minutos ao tempo base de conjuração. Indivíduos sob a Máscara das Sombras só podem ser detectados se o observador possuir um poder (como Auspícios) suficiente para penetrar Ofuscação 3. A Máscara das Sombras dura um número de horas igual ao número de sucessos rolados na conjuração, ou até o conjurador baixá-la voluntariamente.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Draining the Well of Life"] = {
					pt = [==[Rites of Blood, pág. 93


2. Draining the Well of Life


Sistema: Ao conjurar o rito com sucesso, o necromante ganha todo o sangue que normalmente obteria do ato de se alimentar da vítima, e cada um de seus companheiros fantasmagóricos pode repor sua Reserva de Paixão na mesma quantidade (ignorando qualquer excesso — ver V20, pág. 385). Isso é, em última instância, um ato de assassinato e deve, portanto, exigir um teste de Humanidade. Por isso, este ritual é praticado com mais frequência por quem segue um Caminho de Iluminação (como o Caminho dos Ossos) que não se oporia à prática de um ato desses.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Extinguish"] = {
					pt = [==[Rites of Blood, pág. 148


2. Extinguish


Sistema: Conjurar o ritual exige que a taumaturga recite uma encantação e então apague com os dedos a chama de uma vela enquanto cospe no chão. Uma vez concluído, pelo resto da noite a taumaturga pode proferir uma única sílaba mágica para extinguir automaticamente um único fogo de até o tamanho de uma fogueira. Este poder pode ser usado um número de vezes igual ao número de sucessos na rolagem de ativação do ritual. A conjuração deste ritual pode disparar um teste de Rötschreck (ver V20, p. 299).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Eyes of Babel"] = {
					pt = [==[Rites of Blood, pág. 24


2. Eyes of Babel


Sistema: A duração do ritual é de uma semana para cada sucesso na rolagem de ativação. Este é um ritual horrendo que mutila permanentemente um mortal (e não é nada agradável para Membros também), e todos os Membros, exceto os mais desumanos, provavelmente terão de fazer uma rolagem de Degeneração por tentarem este ritual.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Eyes of the Dead"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


2. Eyes of the Dead


Sistema: Como o Servitor’s Perception, com as mesmas restrições e o mesmo método de neutralização, mas sobre espíritos.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["2. Eyes of the Grave"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 179


2. Eyes of the Grave


Este ritual, que leva duas horas para ser conjurado, faz o alvo experimentar visões intermitentes da própria morte ao longo de uma semana. As visões vêm sem aviso e podem durar até um minuto. O conjurador do ritual não faz ideia do conteúdo das visões, pois só a vítima as vê. Cada vez que uma visão se manifesta, o alvo precisa rolar Coragem (dificuldade 7) ou é reduzido a um pânico trêmulo. As visões, que vêm de forma aleatória, também podem interferir em atividades como dirigir, estudar, atirar e assim por diante.
Olhos do Túmulo exige uma pitada de terra de uma cova recente.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. Eyes of the Night Hawk"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 233


2. Eyes of the Night Hawk


Sistema: A vampira consegue controlar mentalmente para onde a ave viaja durante a duração do ritual. A ave não necessariamente executa qualquer outra ação além de voar — a conjuradora não pode ordenar que ela lute, pegue e traga um objeto ou arranhe um alvo. A ave retorna à vampira depois de concluir seu voo. Se a vampira não arrancar os olhos da ave, ela sofre um período de três noites de cegueira. Este ritual cessa o efeito ao nascer do sol.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Feed the Darkness"] = {
					pt = [==[Rites of Blood, pág. 38


2. Feed the Darkness


Sistema: A conjuradora precisa passar quinze minutos em contemplação no início da noite, entoando cânticos em línguas Abissais e invocando os espíritos do Abismo. Os efeitos deste ritual duram até o nascer do sol seguinte.
Efeito Colateral: Enquanto o corpo da conjuradora contiver qualquer vitae obtido pelo uso deste ritual, seu sangue tem cor escura, quase negra. Isso causa estrias escuras visíveis onde suas veias e artérias estão perto da superfície da carne.
Rituais Abissais (pág. 37): Os rituais a seguir não seguem as mesmas regras de outras formas de magia, em grande parte porque se apoiam numa Disciplina que não é de fato uma forma de feitiçaria. Para aprender Misticismo do Abismo, o Cainita precisa ter ao menos um ponto em Obtenebração e um ponto em Ocultismo. Essa personagem não pode aprender rituais do Abismo de nível superior ao seu Obtenebração ou ao seu Ocultismo (o que for menor). Conjurar rituais do Abismo exige uma rolagem bem-sucedida de Raciocínio + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para o ritual dar certo. Diferentemente dos rituais normais, cada ritual de Misticismo do Abismo custa 3 vezes o nível do ritual em pontos de experiência para ser aprendido. Todos os rituais de Misticismo do Abismo também têm efeitos colaterais permanentes; em nenhuma circunstância os Defeitos obtidos desses efeitos colaterais recompensam o vampiro com pontos de bônus ou de experiência, nem podem ser comprados de volta.]==],
				},
				["2. Flaming Weapon"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 304


2. Flaming Weapon


Este ritual afeta apenas armas utilizáveis por humanos; não afeta rochedos nem máquinas de cerco. A conjuradora precisa cortar a palma da própria mão com a arma (ou com um objeto afiado, se a arma não tiver fio), sofrendo um nível de dano letal não absorvível; a jogadora gasta três pontos de sangue. Se o ritual for bem-sucedido, a arma fica envolta numa chama verde e sem calor que não provoca Rötschreck. A chama pode ser ocultada se coberta, e não incendeia outros objetos. A arma inflige dano agravado por um número de golpes igual aos sucessos obtidos. O portador não pode escolher se um golpe inflige dano normal ou agravado, embora a arma precise acertar um objeto para gastar uma de suas cargas. Se uma arma corpo a corpo de madeira carregada empalar um vampiro, ele sofre um nível de dano agravado por sucesso restante na arma, esgotando assim todas as cargas dela. Projéteis encantados retêm a magia por apenas um ataque; cada sucesso obtido na conjuração acrescenta um dado extra ao dano da arma. Só uma conjuração de Flaming Weapon pode estar ativa numa mesma arma; as cargas da arma precisam ser esgotadas antes que o ritual possa ser conjurado nela de novo.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["2. Generation of the Acheron Vortex"] = {
					pt = [==[Lore of the Bloodlines, pág. 49


2. Generation of the Acheron Vortex


Os Precursores do Ódio que provam do sangue Lasombra têm seu vínculo com o Estige reavivado. Sob a lua nova, o necromante precisa derramar sangue composto de vitae de Precursor e de Lasombra em qualquer corpo d’água (de uma poça a um oceano) e escutar as vozes do outro lado da Mortalha com um ritual como o Chamado dos Mortos Famintos (V20, pág. 177). Forma-se um vórtice, e cada ponto de sangue derramado faz o redemoinho durar um turno a mais. Entrar no vórtice leva o vampiro ao equivalente do corpo d’água nas Terras das Sombras, e uma única pessoa (mortal ou vampiro) pode segui-lo por turno em que o vórtice ainda estiver ativo. O ritual funciona ao contrário, mas exige o gasto de dois pontos de sangue de cada indivíduo que siga o necromante das Terras das Sombras para as Terras da Pele, e só pode ocorrer numa noite de lua cheia.
Conjuração de ritual necromântico (V20, pág. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. Haruspicy"] = {
					pt = [==[Rites of Blood, pág. 62


2. Haruspicy


Sistema: Cada sucesso permite à harúspice fazer uma pergunta sobre o passado ou o presente do sujeito, enquanto dois sucessos podem ser gastos para fazer uma pergunta sobre o futuro do sujeito. Usar um sacrifício maior reduz a dificuldade em 1. Usar um sacrifício humano a reduz em 3. Esses benefícios acumulam com a redução de -1 de dificuldade por usar um templo santificado.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Haunting Breeze"] = {
					pt = [==[Rites of Blood, pág. 103


2. Haunting Breeze


Ritual de Necromancia de Nível Dois. O vampiro pode convocar um vento sobrenatural leve que serve para assustar e confundir todos dentro de uma área pequena ou de um único prédio de até 30 metros de diâmetro. Até o nascer do sol seguinte (ou até ser dissipado à vontade pelo conjurador), o vento naquele local fica repleto dos ecos suaves de sussurros, avisos, maldições e do riso dos mortos. Esses sons aterrorizantes distraem e inquietam, aumentando em 2 a dificuldade das rolagens de Percepção e em 1 a de todas as outras rolagens para quem permanecer na área. Além disso, todos os mortais precisam fazer uma rolagem de Coragem (dificuldade 4) ou ficam muito assustados e deixam a área. Essas pessoas se recusam a voltar sob qualquer circunstância por pelo menos uma hora.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Hidden Haven"] = {
					pt = [==[Rites of Blood, pág. 101


2. Hidden Haven


Sistema: O conjurador precisa contornar o edifício e marcar todos os cantos, portas e peitoris com giz feito de cinza de pena de coruja. O ritual leva uma noite inteira para ser conjurado e exige que o conjurador sacrifique um ponto permanente de Força de Vontade. Quem quiser encontrar o edifício sem conhecer a chave física correta precisa se aproximar a até 100 metros do local da estrutura e obter sucesso numa rolagem de Inteligência + Ocultismo (dificuldade 9) cada vez que quiser enxergar através da proteção deste ritual. Os efeitos de Hidden Haven duram um ano.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Illusion of Peaceful Death"] = {
					pt = [==[Rites of Blood, pág. 148


2. Illusion of Peaceful Death


Sistema: A conjuradora precisa ter uma pena imaculada embebida no sangue de um homem bom que morreu em paz. Ela precisa passar cuidadosamente a pena sobre o cadáver enquanto entoa a frase: “Devia ser a hora do Frank ir. Ao menos ele se foi dormindo”. Este ritual não acrescenta sangue a um cadáver, mas reduz a chance de alguém notar quanto sangue falta. O corpo precisa ainda ter ao menos metade do sangue original para que este ritual funcione. Isso aumenta em um, por sucesso no ritual, a dificuldade de quaisquer poderes ou habilidades de investigação usados sobre o cadáver.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Implant the Bezoar"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 35


2. Implant the Bezoar


Sistema: A Mística do Abismo precisa ter acesso a um Oubliette, ou ficar de pé num lago durante a lua nova, e cortar um dedo para produzir um ponto de sangue. Um Bezoar Infantil ruma para o vitae e tenta entrar na Mística do Abismo, a menos que ela esteja preparada com uma tigela de sangue separada. O Bezoar permanece na tigela por uma noite enquanto bebe até se fartar, tempo durante o qual a Mística pode sair do Oubliette — se souber o caminho — carregando a tigela e o parasita em alimentação. O Bezoar continua a se alimentar até o amanhecer, quando então viaja até o Cainita adormecido mais próximo e se arrasta para dentro da boca dele a fim de escapar do dia. As estatísticas do Bezoar Infantil estão na pág. 33. Ele se dissolve numa poça de sombra depois de sair da vítima.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["2. Infusion of Kalif"] = {
					pt = [==[Rites of Blood, pág. 162


2. Infusion of Kalif


Sistema: O feiticeiro precisa obter uma quantidade de haxixe e embebê-la numa quantidade do próprio sangue. A proporção é bem alta — seiscentos gramas de haxixe são embebidos em um ponto de sangue, e o processo (que leva três noites inteiras) rende apenas trinta gramas de kalif por sucesso. A “qualidade” do kalif é determinada pela Geração do vampiro cujo sangue foi usado no ritual (que não precisa ser o do feiticeiro). Cada ponto de Geração aumenta a qualidade em +1, de modo que kalif infundido com êxito com a vitae de um vampiro de Nona Geração teria qualidade quatro.
Para usar adequadamente o kalif como parte de um ritual Dur-An-Ki, trinta gramas dele precisam ser colocados num narguilé junto com água de rosas especialmente preparada. Depois de fumar por ao menos meia hora, o jogador do personagem que consome precisa rolar Vigor + Fortitude (dificuldade 6, com uma penalidade de dados igual à qualidade do kalif usado no ritual). Há uma espécie de “ponto ideal” que o feiticeiro precisa alcançar. Se o feiticeiro falhar ou tirar falha crítica, ele fica intoxicado demais para fazer qualquer coisa além de continuar apreciando o kalif (e, para muitos Membros, isso basta). Por outro lado, se o jogador rolar mais sucessos do que o valor de Dur-An-Ki do personagem, o personagem não fica chapado de jeito nenhum e precisa continuar fumando por mais meia hora antes de rolar de novo.
Só um número de sucessos maior que zero mas igual ou menor que o valor de Dur-An-Ki do personagem permite a ele alcançar o estado extático exigido para usar adequadamente o kalif em outros rituais. Se o número correto de sucessos for rolado, o personagem entra num estado de consciência aguçada em que o Dur-An-Ki é mais fácil de executar. Pelo resto da cena, a dificuldade de qualquer rolagem relacionada a trilhas ou rituais Dur-An-Ki é reduzida numa quantidade igual à metade da qualidade do kalif.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Invoke the Lesser Sign of Power"] = {
					pt = [==[Rites of Blood, pág. 157


2. Invoke the Lesser Sign of Power


Sistema: Por uma hora por sucesso, a koldun ganha uma redução de -2 na dificuldade de todas as rolagens de Intimidação ou Liderança feitas contra mortais, desde que ela consiga fazer contato visual com eles.
Mecânica de dados da Feitiçaria Koldúnica (p. 156): a rolagem para ativar um ritual de Feitiçaria Koldúnica é Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual. As conexões metafísicas da escola com Kupala e com as terras permeadas por esse espírito aumentam a dificuldade em +1 em todas as rolagens de Feitiçaria Koldúnica feitas em favor de koldun que operam sua magia fora dos territórios da Europa Oriental.]==],
				},
				["2. Iron Body"] = {
					pt = [==[Rites of Blood, pág. 158


2. Iron Body


Sistema: O ritual dura uma hora por sucesso e não concede ao beneficiário nenhuma absorção adicional. Ele apenas estende sua absorção normal para incluir fogo e luz solar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Machine Blitz"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 233


2. Machine Blitz


Sistema: Este ritual apenas para máquinas; não concede controle nenhum sobre elas. Os efeitos deste ritual são invisíveis e parecem coincidência.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Occhio d’Uomo Morto"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 179


2. Occhio d’Uomo Morto


Para conjurar este ritual, a necromante precisa de um olho de um cadáver cuja alma ausente tenha se tornado um espectro ou Espectro. O olho é preparado ritualmente num processo que envolve incenso, lua nova e um período de cânticos à meia-noite. Os cânticos culminam quando a necromante remove um dos próprios olhos e o substitui pelo do cadáver (quanto mais fresco, melhor). A cura Membro assume dali em diante, selando o olho na órbita.
Se o ritual for bem-sucedido, a Necromante ganha permanentemente a capacidade de Visão da Mortalha (ver p. 163). Essa capacidade está sempre ativa e não exige rolagem.
Além disso, se for o cadáver de um Espectro, a vampira consegue ouvir o murmúrio vago de quaisquer Espectros na área. Essa capacidade não é muito precisa; em vez de leitura de mentes, é mais como tentar escutar uma conversa em voz baixa no cômodo ao lado. Com uma rolagem de Percepção + Ocultismo, a Necromante pode colher uma impressão bem vaga do que os Espectros próximos estão tramando. Uma falha crítica nessa rolagem pode muito bem render à necromante um novo distúrbio (a critério do Narrador), à medida que os sussurros se infiltram no subconsciente da conjuradora.
Este ritual tem alguns inconvenientes graves, o primeiro sendo que seu resultado adequado é medonhamente feio. A menos que a vampira use óculos escuros ou encontre outro modo de esconder o olho, sua Aparência é reduzida em um ponto.
Além disso, tecido morto ou apodrecido não é o melhor para a percepção normal. Quaisquer rolagens visuais mundanas de Percepção recebem +1 de dificuldade (possivelmente mais, se o cadáver tinha visão ruim em vida). Por outro lado, como o olho oferece uma janela para uma alma diferente da da necromante, ele dá alguma proteção contra poderes que exigem contato visual. Essas Disciplinas são usadas contra a necromante de olho morto com +1 de dificuldade.
O mais importante, porém, é que o fantasma cujo corpo foi profanado sabe disso e muito provavelmente o odeia. O fantasma consegue encontrar em qualquer lugar a necromante que possui seu olho, e todos os poderes fantasmagóricos usados contra a necromante por aquele fantasma específico recebem –1 de dificuldade.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. Oinos of Dionysus"] = {
					pt = [==[Rites of Blood, pág. 148


2. Oinos of Dionysus


Sistema: O conjurador precisa misturar ao menos um ponto de seu sangue ao vinho e às especiarias. Uma vez concluído, o oinos precisa ser ingerido para fazer efeito. Depois de beber o oinos, um mortal precisa obter êxito numa rolagem de Força de Vontade (dificuldade 8) para realizar qualquer ação, pois é tomado por uma letargia induzida artificialmente. Este efeito dura um número de horas igual ao número de sucessos obtidos na rolagem de ativação. Sujeitos podem resistir a este efeito obtendo ao menos três sucessos numa rolagem de Vigor (dificuldade 8). Vampiros e outras criaturas sobrenaturais não são afetados pelo Oinos de Dionísio, pois seu sangue é potente demais para ser dominado por esta poção.
Vampiros que se alimentam de um mortal sob os efeitos do Oinos de Dionísio sentem um efeito semelhante, mas que não os domina nem os prejudica. Sentem uma sensação de felicidade artificialmente inflada e se lembram das noites em que eram mortais. Numa emergência, o vampiro sob esses efeitos pode gastar um ponto de sangue para expulsar a toxina de seu organismo.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Parting the Veil"] = {
					pt = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, pág. 176


2. Parting the Veil


Sistema: Para conjurar o rito com sucesso, a necromante precisa primeiro encontrar o reflexo, nas Terras das Sombras, de um local de ressonância espiritual, como um templo, um cemitério ou um local de assassinato, ou de um lugar onde as paixões corram soltas, como um estádio esportivo, um antro de drogas ou o quarto de um adolescente.
Depois de acender chamas na versão do local nas Terras das Sombras e expor a elas a carne dos pulsos (normalmente uma de cada lado da conjuradora), a necromante precisa fazer uma rolagem de Coragem para resistir ao Rötschreck com dificuldade 7. Se Fortitude for usada para mitigar o dano causado pelo fogo (V20, pág. 297), o ritual fracassa.
A conjuradora precisa gastar dois pontos de sangue para apagar as chamas (mais pontos precisam ser gastos se as chamas forem maiores que as de tochas). A Barreira fica enfraquecida por um número de horas igual aos pontos que a conjuradora tem em sua Trilha de Necromancia mais alta, e permite uma visão translúcida do mundo mortal.
Um número de mortais igual ao número de pontos de sangue gastos pode passar entre as chamas usadas no rito, ficando preso nas Terras das Sombras. O véu se fecha depois que o número necessário de mortais atravessa, ou quando as horas se esgotam.
Conjuração de ritual necromântico (V20, pág. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. Prepare the Vessel"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 293


2. Prepare the Vessel


Este ritual funciona bem como método de facilitar a mediunidade, como moeda de troca para fantasmas que anseiam caminhar nas Terras da Pele, ou como uma forma bastante peculiar de tortura psicológica. Prepare the Vessel torna um sujeito (voluntário ou não) um receptáculo adequado para a possessão espiritual. É preciso colocar sobre a cabeça do alvo um capuz (como os usados em enforcamentos) por uma hora. Até o nascer do sol seguinte (independentemente de o capuz permanecer no lugar), qualquer fantasma ou espírito que tente possuir o alvo ganha dois sucessos automáticos ao fazê-lo. Para mais sobre possessão fantasmagórica, ver pág. 403.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["2. Preserve"] = {
					pt = [==[Rites of Blood, pág. 24


2. Preserve


Sistema: Preserve permite ao taumaturgo blindar misticamente um item contra os efeitos do tempo e do uso. O taumaturgo precisa revestir levemente o item com um ponto de seu sangue ao longo de uma noite, entoando os encantamentos apropriados. Cada sucesso na rolagem de ativação preserva misticamente o item por mais uma década. O item preservado permanece protegido até o ritual expirar. Este ritual não cria vínculo simpático com o taumaturgo, pois o sangue usado para alimentá-lo é completamente absorvido pelo objeto.
Este ritual foi criado principalmente para preservar documentos e textos, mas um taumaturgo esperto pode usá-lo em quase qualquer item que caiba na mão. O item alvo precisa ser feito de minerais trabalhados e outros materiais naturais, pois compostos artificiais (como plástico) perturbam o ritual. Itens que podem ser preservados incluem, mas não se limitam a, obras de arte, armas antigas, joias ou roupas. Este ritual não torna o item alvo invulnerável nem sequer resistente a alguém que queira danificá-lo de propósito. Por exemplo, um antigo gládio romano permanece afiado e em bom estado, mas ainda assim se estilhaça se usado de forma imprópria ou se alguém com força suficiente tentar quebrar a lâmina.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Principal Focus of Vitae Infusion"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


2. Principal Focus of Vitae Infusion


Sistema: Um objeto só pode armazenar um ponto de sangue de vitae. Se uma Membro quiser fazer um foco infundido para um aliado, ela pode fazê-lo, mas o sangue contido nele precisa ser o dela. (Se o aliado então beber o sangue, ele fica um passo mais perto do laço de sangue.) O aliado precisa estar presente na criação do foco.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Puppet"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 179


2. Puppet


Usado principalmente para facilitar conversas com os recém-falecidos, embora também aplicado como método de tortura psicológica, o Fantoche prepara um sujeito (voluntário ou não) como receptáculo adequado para possessão fantasmagórica. Ao longo de uma hora, o necromante espalha terra de cova sobre os olhos, os lábios e a testa do sujeito. Pelo restante da noite, qualquer espectro que tente assumir o controle do sujeito ganha dois sucessos automáticos. Os efeitos do ritual permanecem mesmo que a terra seja lavada.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. Recure of the Homeland"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


2. Recure of the Homeland


Sistema: A Cainita precisa misturar a terra a dois pontos do próprio sangue para fazer uma pasta curativa. Um punhado cura um ferimento agravado, e só um punhado pode ser usado por noite. Este ritual só pode ser usado na vampira que o conhece.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Seal Egress"] = {
					pt = [==[Rites of Blood, pág. 25


2. Seal Egress


Sistema: Para conjurar Seal Egress, o taumaturgo precisa espalhar um ponto de seu sangue sobre as quatro paredes do aposento que deseja selar e então entoar o encantamento apropriado (o que pode ser feito fora do aposento). Este ritual é um processo demorado, que exige uma hora de conjuração. Cada sucesso obtido na rolagem de ativação estende a duração do ritual por uma década. Seal Egress sela misticamente todas as entradas do aposento. O material das paredes ao redor se fecha fisicamente sobre qualquer abertura de entrada ou saída, criando uma vedação hermética perfeita. Invasores com rituais místicos como Incorporeal Passage (V20, p. 236) ou Disciplinas como Corpo Espectral (V20, p. 202) descobrem que este aposento está misticamente protegido contra suas habilidades. Este ritual, porém, não reforça nem protege as paredes do aposento, e assim é possível que alguém com força suficiente simplesmente arrombe as paredes. Fantasmas, espíritos e outras criaturas naturalmente imateriais podem entrar no aposento à vontade. (Para barrar tais criaturas, são necessários círculos de proteção. Ver V20, p. 234.)
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Self-Executing File"] = {
					pt = [==[Rites of Blood, pág. 68


2. Self-Executing File


Sistema: Para usar Self-Executing File, o taumaturgo precisa primeiro preparar o ritual de Tecnomancia que deseja disseminar num formato de arquivo de computador. Tanto os Hacktivistas quanto os tecnomantes Tremere usam um código de programação especial que integra uma mistura de linguagens de computador extintas e línguas escritas mortas. Usando essa linguagem, o taumaturgo codifica uma descrição completa do ritual a ser transmitido e então a reduz a um arquivo .zip. Em seguida, envia o arquivo por e-mail ao destinatário pretendido. Quando o destinatário clica no arquivo para abri-lo, aparece uma caixa de texto informando que ele tem sessenta segundos para ativar o programa passando um pouco de seu sangue no polegar direito e então colocando-o sobre o quadrado branco abaixo do texto. Se o destinatário fizer isso antes que o tempo acabe, o sangue se dissipa sem causar dano, e o programa se abre automaticamente e se instala no disco rígido do computador. Um ícone do programa correspondente aparece na área de trabalho, visível apenas ao destinatário, e o próprio programa é um arquivo invisível que não pode ser detectado no disco rígido por nenhum meio que não seja Tecnomancia. Cada sucesso além do primeiro permite um destinatário adicional, caso o taumaturgo queira enviar mais de uma cópia do arquivo.
Programas de exemplo (p. 68): Fangbook modifica o computador, smartphone ou tablet da usuária de modo que quaisquer mensagens, fotos ou vídeos que ela publique no Facebook, no Twitter ou em qualquer outro site equivalente de rede social pareçam publicações inócuas — como felicitações de aniversário a estranhos aleatórios ou fotos e memes de vídeo bastante compartilhados do dia — quando vistos por não-vampiros. Bloodspot, de forma semelhante, é uma plataforma de blog em shareware que só pode ser percebida como tal por Membros; quando uma página do Bloodspot é vista por um humano, ela vê apenas uma mensagem de “Servidor não encontrado” ou algum erro comparável. FangChat é um programa de mensagens capaz de encontrar qualquer Membro que esteja on-line e abrir uma janela de conversa no computador dele que, segundo os criadores do programa, é completamente irrastreável; a mensagem se apaga sozinha depois de alguns minutos, sem deixar vestígio.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Subsume the Darkness"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 272


2. Subsume the Darkness


Sistema: A vampira passa um turno inteiro meditando sobre o Abismo, depois gasta um ponto de Força de Vontade e rola Vigor + Ocultismo (dificuldade 8); uma falha crítica causa um nível de dano agravado. Cada sucesso permite à vampira gastar um ponto de sangue para curar dois níveis de dano letal ou quatro níveis de dano contundente, ignorando os limites de geração para esse gasto.
Contudo, depois que o Místico conjura este ritual, o Abismo consome todo o sangue obtido ao se alimentar até receber um número de pontos de sangue igual ao sangue gasto na cura. O Místico não pode usar este ritual mais de uma vez por noite, nem voltar a usá-lo antes de quitar sua dívida com o Abismo. Além disso, o uso deste ritual mancha a alma do Místico: depois dele, o sangue do Místico fica negro e absorve toda a luz. Esse efeito o marca claramente como algo assustadoramente alienígena. Qualquer mortal que veja o Místico sangrar (ou chorar) precisa passar num teste de Coragem 6 ou rola um dado a menos em todas as rolagens pelo resto da cena.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["2. Summon Guardian Spirit"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 305


2. Summon Guardian Spirit


O conjurador convoca um espírito com o propósito expresso de guardá-lo. O espírito serve ao conjurador por 24 horas e não ajuda de nenhuma outra forma além de alertá-lo do perigo. Embora o espírito não possa falar, o conjurador costuma ser sobressaltado (e acordado, se estiver em repouso) por uma sensação intuitiva súbita e forte de que algo está errado. O espírito só é visível ao conjurador ou a quem consiga vê-lo por percepção sobrenatural, como Auspícios. Ele só aparece em momentos de perigo, encarando o conjurador enquanto aponta na direção da ameaça.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["2. Thanatos’ Caress"] = {
					pt = [==[Rites of Blood, pág. 90


2. Thanatos’ Caress


Sistema: Até o nascer do sol seguinte, o necromante pode executar um único uso de “Putrefação” sobre um alvo (V20, pág. 471), usando os mesmos sistemas descritos para o poder original.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. The Hand of Glory"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 179


2. The Hand of Glory


A Mão da Glória é uma mão mumificada usada pelo necromante para anestesiar os moradores de uma casa e, assim, ter rédea livre para fazer o que quiser na residência. Para criar uma, o necromante envolve a mão decepada de um assassino condenado numa mortalha, aperta-a bem para espremer o sangue restante e conserva a mão num pote de barro com sal, salitre e pimenta-longa. Depois de duas semanas, o vampiro retira a mão e a seca num forno com verbena e samambaia. Ao fim desse processo, se a rolagem para ativar o ritual obtiver algum sucesso, a criação é viável.
Para usar a Mão da Glória, o vampiro primeiro reveste as pontas dos dedos da mão mumificada com uma substância inflamável derivada da gordura de um enforcado e ateia fogo aos dedos. O necromante então recita a frase: “Que todos os que dormem durmam, e que os que estão acordados fiquem acordados”. Todos os mortais de uma casa que forem afetados caem em sono profundo e não podem ser despertados (a mão não tem efeito sobre criaturas sobrenaturais). Para cada ocupante não afetado da casa, um dedo da mão se recusa a acender. Falhas críticas podem resultar em todos os dedos acesos e ninguém dormindo na casa. A mão pode ser apagada a qualquer momento pelo necromante que a criou. Qualquer outra pessoa que queira apagá-la precisa usar leite — nada mais funciona. Uma vez feita, a Mão da Glória pode ser reutilizada indefinidamente. Os efeitos duram uma cena.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. The Jinx"] = {
					pt = [==[Rites of Blood, pág. 148


2. The Jinx


Sistema: O taumaturgo precisa concentrar sua raiva contra a vítima enquanto queima um objeto que tenha ressonância psíquica com o alvo pretendido, conforme o Princípio da Identidade (pp. 132-133). Cada sucesso obtido na rolagem de ativação da conjuração deste ritual causa uma falha automática na próxima rolagem que o personagem azarado fizer, independentemente do resultado. Se o conjurador obtiver quatro sucessos na rolagem de ativação, então as próximas quatro rolagens do personagem azarado falham independentemente do resultado. O Azar não causa falha crítica, apenas uma falha simples. Se o Azar for aplicado a uma ação resistida ou prolongada, a rolagem simplesmente não rende sucessos no turno corrente até que o número de falhas pendentes se esgote.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. The Ritual of Pochtli"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 180


2. The Ritual of Pochtli


Este ritual não pode ser conjurado sozinho, mas apenas em conjunto com outro ritual Necromântico, ou com o uso fortemente ritualizado de uma trilha Necromântica. A ação do ritual é a seguinte: dois ou mais necromantes Membros contêm um recipiente mortal e lhe infligem incisões em forma de símbolos blasfemos (tipicamente hieróglifos egípcios subvertidos ou símbolos astecas). Eles então bebem desses ferimentos. Cada Necromante participante precisa fazer seu próprio corte e beber de nenhum outro corte. Dali em diante, o poder Necromântico que os Membros pretendem empregar ganha o benefício do conhecimento de todos os participantes. Este ritual torna possível aos Necromantes criar feitos verdadeiramente temíveis de magia da morte.
O jogador rola para ativar este ritual normalmente. Se a rolagem for bem-sucedida, os Membros que participaram do ritual podem trabalhar juntos na trilha ou ritual que o Ritual de Pochtli pretende auxiliar, e os jogadores compartilham sucessos. Note que a aplicação principal da Necromancia exige sua própria rolagem, e que os sucessos (e falhas) obtidos pelo grupo são somados. Todos os Membros participantes do ritual precisam conhecer o Ritual de Pochtli, bem como o ritual ou poder de trilha que o grupo busca executar.
A desvantagem deste poder é que a falha crítica de um único jogador anula os sucessos de todo o grupo, resultando num fracasso horrível para todos os oficiantes do ritual.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. To Lace with Hidden Nectar"] = {
					pt = [==[Rites of Blood, pág. 84


2. To Lace with Hidden Nectar


Sistema: Este ritual depende de a Feiticeira já saber fermentar a Cerveja de Tífon. Ela fermenta uma leva da bebida normalmente, conforme o ritual, e conjura o To Lace with Hidden Nectar na última noite do mês completo do processo. Ela então investe de novo na mistura a mesma quantidade de sangue do início do processo e gasta uma quantidade igual de pontos de Força de Vontade. Qualquer vampiro que beba um galão da cerveja perde a mesma quantidade de pontos de Força de Vontade (distribuída uniformemente ao longo da hora seguinte) enquanto fica rapidamente intoxicado. Isso provou ser uma ferramenta notavelmente útil para manipular Cainitas embriagados.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["2. Totenpass"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 294


2. Totenpass


O necromante Impundulu “mata” cerimonialmente um mortal, deitando-o num esquife e colocando duas moedas sobre seus olhos ou uma tábua inscrita sobre seu peito. O mortal pode então deixar o corpo e viajar para o Submundo. Ele não fica completamente separado desse corpo — fantasmas e outras entidades que usem Visão da Vida ou Percepção da Aura verão um cordão prateado ligando sua alma ao corpo ainda vivo. Ele pode perceber o Submundo e falar com fantasmas, mas não pode afetar o Submundo fisicamente.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["2. Two Centimes"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 180


2. Two Centimes


O necromante “mata” cerimonialmente um mortal, deitando-o num catre e pondo moedas sobre seus olhos. A alma do mortal viaja ao Mundo Inferior, que ele percebe, ao menos de início, como uma estação de passagem. O mortal pode interagir com as almas dos mortos e viajar por outras partes do Mundo Inferior, mantendo ao mesmo tempo a capacidade de falar com o vampiro e descrever o que está vivenciando. Enquanto está no Mundo Inferior, porém, a alma do sujeito não pode afetar o ambiente. Embora possa falar com outros espíritos, ele não pode interagir fisicamente com eles nem com o que os cerca — ele é, por assim dizer, um “fantasma entre fantasmas”. Lacaios podem se submeter voluntariamente ao ritual para auxiliar necromantes, ou o vampiro pode usar Dois Cêntimos para aterrorizar vítimas involuntárias.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["2. Ward"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 305


2. Ward


Ao invocar este ritual, a conjuradora cria uma proteção que impede intrusos indesejados de entrar num local ou manusear um item. As proteções podem ser conjuradas sobre objetos ou espaços fechados, como um corredor ou o arco de uma grade levadiça, mas só uma proteção pode estar conjurada sobre um dado objeto ou espaço por vez. A conjuradora gasta uma hora preparando cerimonialmente a área ou o objeto a ser protegido, e em seguida arranca um fio de cabelo da própria cabeça e o parte ao meio. Com uma rolagem de conjuração bem-sucedida, o objeto ou espaço protegido não pode ser movido nem violado sequer minimamente por um sujeito que não atenda ao requisito mínimo estabelecido pela conjuradora. Toda proteção está vinculada a um único Atributo, escolhido pela conjuradora ao executar o ritual. Para pegar um objeto protegido ou entrar num aposento protegido, o sujeito precisa ter pontos naquele Atributo iguais ou superiores ao nível da Proteção. O valor mínimo de traço para as Proteções começa em 2, por ser um ritual de nível dois. Conjurar uma Proteção ritual de nível mais alto aumenta o valor de traço proporcionalmente ao nível do ritual conjurado. Por exemplo, uma Proteção de nível três tem valor mínimo de traço 3, vinculado a um Atributo escolhido pela conjuradora ao executá-la. Ninguém com valor de traço inferior a 3 no Atributo vinculado à Proteção pode entrar no local nem pegar o objeto sobre o qual a proteção foi conjurada. Se quiser, a conjuradora pode designar uma senha que, entoada mentalmente enquanto se toca a Proteção, permite que outros contornem a exigência mínima de Atributo. As Proteções duram um número de semanas igual aos sucessos obtidos na rolagem de conjuração.
Ao custo de um ponto de Força de Vontade por tentativa, o sujeito impedido de interagir com um objeto ou espaço protegido pode rolar Força de Vontade como ação estendida (dificuldade igual a 4 + o nível da proteção), precisando de um número de sucessos igual ao nível de Taumaturgia da conjuradora para romper uma proteção individual. Uma proteção rompida é acompanhada do som de vidro estilhaçado, que a conjuradora ouve independentemente de onde esteja. A partir daí, a proteção fica completamente anulada e qualquer um pode interagir livremente com o objeto ou dentro do espaço.
Este é um Ritual de Refúgio (ver Dedicate the Haven na pág. 310).
Ritual de Refúgio (pág. 310): Uma vez consagrado pelo Dedicate the Haven, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["2. Ward Versus Ghouls"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


2. Ward Versus Ghouls


Sistema: Carniçais que tocam objetos protegidos sofrem três dados de dano letal. Esse dano ocorre de novo se o carniçal continuar a tocar o objeto; de fato, um carniçal que queira conscientemente tocar um objeto protegido precisa gastar um ponto de Força de Vontade para fazê-lo.
Este ritual protege apenas um objeto — se inscrito na lateral de um carro, a proteção afeta apenas aquela porta ou para-lama, não o carro inteiro. Proteções podem ser colocadas em armas, até em balas, embora isso normalmente funcione melhor em armas de pequeno calibre. Balas muitas vezes se deformam ao serem disparadas, porém, e, para que uma proteção permaneça intacta num projétil disparado, o jogador precisa de cinco sucessos na rolagem de Armas de Fogo.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Warding Circle versus Ghouls"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


2. Warding Circle versus Ghouls


Sistema: O ritual exige três pontos de sangue mortal. A conjuradora determina o tamanho do círculo de proteção no momento da conjuração; o raio padrão é de 3 metros, e cada aumento de 3 metros eleva a dificuldade em um, até o máximo de 9 (um sucesso adicional é exigido para cada aumento além do número necessário para elevar a dificuldade a 9). A jogadora gasta um ponto de sangue para cada 3 metros de raio e rola. O ritual leva o tempo normal de conjuração se for de curto prazo (durando o resto da noite) ou uma noite se for de longo prazo (durando um ano e um dia).
Uma vez estabelecido o círculo de proteção, qualquer carniçal que tente cruzar seu limite sente um formigamento na pele e uma leve brisa no rosto — uma rolagem bem-sucedida de Inteligência + Ocultismo (dificuldade 8) identifica isso como um círculo de proteção. Se o carniçal tentar avançar, ele precisa obter mais sucessos numa rolagem de Força de Vontade (dificuldade igual ao valor de Taumaturgia do conjurador + 3) do que o conjurador obteve ao estabelecer a proteção. A falha indica que a proteção bloqueia sua passagem e inflige três dados de dano contusivo, e sua próxima rolagem para tentar entrar no círculo recebe +1 de dificuldade. Se o carniçal sair do círculo e tentar entrar de novo, precisa repetir a rolagem. Tentativas de sair do círculo não são bloqueadas.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Whispers of the Ghost"] = {
					pt = [==[Rites of Blood, pág. 149


2. Whispers of the Ghost


Sistema: A conjuradora precisa meditar por quinze minutos em completo silêncio. Depois precisa decepar a orelha de uma criatura ainda viva e segurar a dita orelha na mão esquerda antes de usar a Projeção Astral (V20, pp. 138-139 — a taumaturga precisa possuir Projeção Astral para usar este ritual). A taumaturga pode falar ao mundo físico num sussurro fantasmagórico. Se quiser ser vista, precisa gastar um ponto de Força de Vontade para se manifestar normalmente, mas isso cancela o ritual. Caso o “doador” da orelha morra, o ritual termina imediatamente. Perda de moralidade pode se aplicar se a doação não foi voluntária.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["2. Witch Eye"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 293


2. Witch Eye


Ao implantar na própria órbita ocular um olho encantado tirado do cadáver de uma alma inquieta, a necromante ganha permanentemente a habilidade Visão da Morte (ver pág. 403). O ritual é complexo e leva uma noite inteira para ser executado. À meia-noite, a celebrante arranca o próprio olho e o olho do cadáver. Em seguida coloca o olho do cadáver na própria órbita e o seu olho no cadáver. A cura vampírica ocorre instantaneamente, selando o olho do morto na órbita dela. O olho em si, porém, não se cura: permanece imóvel e apodrecido no rosto da necromante, fazendo sua Aparência diminuir em 1 quando o olho está visível. Mesmo um olho recém-colhido fica turvo e se decompõe em questão de horas, o que aumenta em 1 a dificuldade das rolagens de Percepção que envolvam visão mundana. E, como o olho já não é uma janela adequada para a alma da necromante, o Witch Eye aumenta em 1 a dificuldade de todas as Disciplinas que exigem contato visual.
O Witch Eye também pode complicar a vida da vampira em nível sobrenatural. Qualquer fantasma cujo corpo esteja sendo profanado pelo ritual sabe disso imediatamente, e provavelmente ficará descontente com as ações da necromante. Mesmo que a necromante complete o ritual com sucesso, o fantasma mantém uma conexão sobrenatural com o Witch Eye, fazendo com que todas as rolagens mágicas dele contra a necromante sejam feitas com -1 de dificuldade.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["2. Witness of Whispers"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 304


2. Witness of Whispers


Este ritual cria um dispositivo de escrutínio que pode ser usado tanto para observar inimigos e acontecimentos de uma posição relativamente segura quanto para ouvir sons a grande distância. O ritual exige um alfinete de sete centímetros, um pedaço de linha, a garra de um corvo, três pontos de vitae da conjuradora, um recipiente e uma orelha ou um olho humano saudável (um ou outro, nunca os dois). A conjuradora costura o olho ou a orelha na garra e depois sela o dispositivo num recipiente com seu vitae. Passada uma semana, o dispositivo se anima e pode ser colocado em qualquer lugar que a conjuradora queira vigiar à distância. A garra dá ao Witness of Whispers mobilidade limitada e a capacidade de se fixar a qualquer superfície. Para ver ou ouvir através do dispositivo, a usuária concentra-se por cinco minutos e gasta um ponto de sangue. Estabelecida a conexão, a conjuradora pode mover mentalmente o dispositivo trinta centímetros por turno, à vontade. Pelo tempo que a conjuradora quiser, o dispositivo assume a percepção visual ou auditiva dela (conforme tenha usado um olho ou uma orelha para criá-lo): em vez do que está à sua frente, ela vê ou ouve o que o dispositivo vê ou ouve, mas usa a própria Percepção. Um Witness of Whispers tem um nível de Vitalidade e um ponto em cada Atributo Físico. A conjuradora pode desativá-lo à vontade e reativá-lo a qualquer momento seguindo os passos acima. Ele permanece potente até ser destruído.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. A Shield of Mirror"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 43


3. A Shield of Mirror


Com uma dança executada à luz da lua e a encantação apropriada, a Assamita pode proteger a si mesma ou a outrem de um diablerista de fora do clã. Se executado corretamente, este ritual concede ao beneficiário uma bênção contra a diablerie. Se algum vampiro tentar o Amaranto contra ele dentro do mesmo mês, ele é que toma todo o sangue do agressor para si — e isso não gera laço de sangue.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. A Touch of Nightshade"] = {
					pt = [==[Rites of Blood, pág. 149


3. A Touch of Nightshade


Sistema: Este ritual cria um veneno de contato com a pele que só pode ser usado uma vez antes de se tornar inerte. Se o veneno não for usado até o fim da noite, o poder se esvai e o veneno se torna inútil.
A taumaturga precisa aplicar o veneno místico na própria pele (que é imune ao veneno) e então tocar o alvo pretendido. O Narrador pode exigir uma rolagem de Destreza ou de Manipulação para tocar a vítima, conforme as circunstâncias. Uma vez por noite, até que a potência do veneno se dissipe, a vítima precisa fazer um teste de Vigor + Fortitude (dificuldade 8) para resistir aos efeitos do veneno. Com três ou mais sucessos, o alvo resiste aos efeitos tóxicos do veneno, mas ainda sofre dores de cabeça leves e sente que algo está errado. Do contrário, a vítima sofre uma reação extrema ao veneno, causando sudorese, visão embaçada e convulsões. A dificuldade de todas as rolagens pelo restante da noite aumenta em um. (Lembre-se de que Membros suam sangue! Isso pode ser um problema real para Membros que tentam preservar a Máscara.)
O número de sucessos na rolagem de ativação do ritual determina a potência do veneno. Cada sucesso acrescenta uma noite adicional de eficácia ao veneno.
Os efeitos deste veneno místico podem ser anulados pelo ritual Pureza da Carne (V20, p. 232).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Abyssal Threads"] = {
					pt = [==[Rites of Blood, pág. 38


3. Abyssal Threads


Sistema: A pessoa ou o item ao qual o fio será preso precisa estar presente enquanto o ritual é conjurado. Este ritual leva trinta minutos de conjuração, durante os quais o Místico do Abismo extrai um ponto de seu sangue e o mistura com a essência sobrenatural do Abismo. Fiando essa matéria combinada numa meada, o conjurador forma o Fio Abissal e pode então prendê-lo como desejar. Os efeitos deste ritual duram até o nascer do sol seguinte.
Efeito Colateral: Enquanto este ritual estiver em vigor, o ar frio do Abismo circula em volta do conjurador e pode atrair atenção indesejada. O conjurador ganha efetivamente o Defeito Brisa Fria pela duração dos efeitos deste ritual. (V20, pág. 494).
Rituais Abissais (pág. 37): Os rituais a seguir não seguem as mesmas regras de outras formas de magia, em grande parte porque se apoiam numa Disciplina que não é de fato uma forma de feitiçaria. Para aprender Misticismo do Abismo, o Cainita precisa ter ao menos um ponto em Obtenebração e um ponto em Ocultismo. Essa personagem não pode aprender rituais do Abismo de nível superior ao seu Obtenebração ou ao seu Ocultismo (o que for menor). Conjurar rituais do Abismo exige uma rolagem bem-sucedida de Raciocínio + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para o ritual dar certo. Diferentemente dos rituais normais, cada ritual de Misticismo do Abismo custa 3 vezes o nível do ritual em pontos de experiência para ser aprendido. Todos os rituais de Misticismo do Abismo também têm efeitos colaterais permanentes; em nenhuma circunstância os Defeitos obtidos desses efeitos colaterais recompensam o vampiro com pontos de bônus ou de experiência, nem podem ser comprados de volta.]==],
				},
				["3. Amulet of Mnemosyne"] = {
					pt = [==[Rites of Blood, pág. 25


3. Amulet of Mnemosyne


Sistema: O taumaturgo cria um amuleto forjado em latão e mergulhado numa poça de seu sangue. Em seguida, precisa recitar os encantamentos apropriados sobre o amuleto enquanto ele repousa sobre um objeto que simbolize a verdade para o taumaturgo. Por fim, o sujeito (que não precisa ser o taumaturgo) precisa furar os próprios lábios, beijar o amuleto e então sussurrar seu segredo.
Uma vez ativado, esse segredo é completamente removido da mente do sujeito até que ela reverta o ritual beijando o amuleto de novo. As memórias são completamente reescritas para dar conta da informação ausente. Essas novas memórias são geradas pelo poder da magia; nem o taumaturgo nem o sujeito têm qualquer controle sobre os detalhes específicos.
Se o amuleto for destruído, o segredo retorna à mente do dono.
Se um taumaturgo rival descobrir o amuleto e conhecer ou pesquisar este ritual, ele pode tentar aprender o segredo que ele contém. Segurando o amuleto junto ao ouvido, o taumaturgo rival disputa uma rolagem resistida de Força de Vontade com o conjurador original. Se o taumaturgo rival vencer, o segredo é implantado em sua mente. O conjurador sente um desconforto, como se algo estivesse errado, mas não sabe a causa, pois esqueceu o segredo.
A desvantagem deste ritual é que o sujeito não faz ideia de que o segredo existe nem de que o escondeu dentro do amuleto. Ela age como sua personalidade típica sugeriria, o que pode causar uma série de complicações. Ironicamente, ao esconder o segredo, o sujeito se deixa vulnerável. Por exemplo, se o sujeito assassinou a cria do Príncipe, ela não saberá que precisa ter cuidado na corte nem ficar atenta a quem possa ter descoberto seu segredo.
Um taumaturgo astuto garante que o amuleto volte às suas mãos depois que o perigo passar, enviando-o pelo correio a si mesma ou escondendo-o com um lacaio de confiança junto de um bilhete escrito de próprio punho. Por causa disso, qualquer taumaturgo que conheça o ritual se sobressalta sempre que encontra um Amuleto de Mnemósine, temendo o segredo que possa destrancar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Angra Mainyu Consumes Spenta Mainyu"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 37


3. Angra Mainyu Consumes Spenta Mainyu


Sistema: O Místico do Abismo precisa beber uma taça de piche quente, obtendo sucesso numa rolagem baseada em Vigor (dificuldade 9) para não vomitá-lo de imediato. Consumir o piche causa dois níveis de dano agravado, que podem ser absorvidos com Fortitude. Esse piche permanece dentro do corpo do Místico por um número de noites igual aos sucessos obtidos. A qualquer momento enquanto carrega o piche, o Místico do Abismo pode fazer um teste de Coragem (dificuldade 6) para vomitá-lo numa chuva de escuridão antinatural que se espalha pelo ar como bolhas de tinta, gravitando na direção de qualquer luz. O piche se enrola em torno dessa luz e impede que ela volte a acender pelo resto da noite. O raio percorrido pelo piche é de 10 metros por sucesso no teste de Coragem. Isso não protege do sol.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["3. Animate Curios"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 50


3. Animate Curios


Sistema: Concluído o rito, a capacidade de combate e intimidação de qualquer coisa animada é determinada a critério do Narrador. Uma ferramenta ou objeto mundano e tradicionalmente não violento tem parada de Intimidação não maior que 3 e parada de combate não maior que 4; uma arma ou aparato perigoso tem parada de Intimidação não maior que 5 e parada de combate não maior que 7. O rito se encerra se o refúgio do koldun for incendiado ou se os objetos forem destruídos.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["3. Animated Assistants"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 306


3. Animated Assistants


Este ritual permite à conjuradora intrépida animar servos temporários. Ela corta o próprio braço e sacode um ponto de sangue enquanto entoa encantações por cinco minutos para cada três metros de espaço. O ritual dura uma noite por sucesso obtido, animando quaisquer itens que estejam por ali, como pedras, béqueres de vidro, instrumentos de dissecação, penas de escrever ou livros. Todos os objetos animados ficam intuitivamente ligados ao subconsciente da conjuradora. Qualquer ferramenta de que ela precise se prepara ao alcance dela ou realiza pequenas tarefas em seu lugar, como anotar, limpar, costurar, moer ingredientes num pilão etc. Esses objetos, porém, não podem atacar fisicamente nem defender a conjuradora.
Este é um Ritual de Refúgio (ver Dedicate the Haven na pág. 310).
Ritual de Refúgio (pág. 310): Uma vez consagrado pelo Dedicate the Haven, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. BFU"] = {
					pt = [==[Rites of Blood, pág. 66


3. BFU


Sistema: Assim que o alvo lê a mensagem, ela precisa rolar imediatamente contra frenesi de raiva com +2 de dificuldade. Além disso, os efeitos persistem: pelas várias noites seguintes, todas as dificuldades para resistir a frenesi de raiva ficam aumentadas em 1. A própria mensagem dura uma noite para cada sucesso e, se não for vista pelo destinatário pretendido, o ritual é desperdiçado. Se o destinatário a vir, as dificuldades aumentadas de frenesi persistem por mais uma noite para cada sucesso, mesmo que ela veja a mensagem na última noite em que ela poderia afetá-la.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Balthazar’s Revelation"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 272


3. Balthazar’s Revelation


Esta estranha expressão do Misticismo do Abismo vem da linhagem Kiasyd. Ela afasta os véus que mantêm uma mente estável a salvo das verdades sombrias do mundo. O ritualista encanta um objeto pequeno, em geral uma moeda. Qualquer um que segure a moeda precisa fazer uma rolagem de Força de Vontade, dificuldade 9 menos seu nível de Obtenebração. A falha impõe um Distúrbio escolhido no momento em que o objeto foi encantado, que dura até a vítima ter gasto tanta Força de Vontade quanto o nível de Obtenebração do ritualista. Além disso, a vítima vê beladonas e outras entidades estranhas por toda parte, o que causa +2 de dificuldade em todas as rolagens de Percepção e +2 em todas as dificuldades de Coragem enquanto o Distúrbio persistir.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["3. Bind the Familiar"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 306


3. Bind the Familiar


• É imune ao Juramento de Sangue e a compulsões mentais ou sociais de natureza sobrenatural (como Animalismo), e não pode ser transformado em carniçal.
• Ganha um ponto adicional de Inteligência, tendo mais ou menos a mesma capacidade intelectual de uma criança de 10 anos.
• Pode falar verbalmente a língua natal do mestre e comunicar-se telepaticamente com ele, independentemente da distância que os separe.
• A dor (embora não o dano em si) é sentida mutuamente e compartilhada entre o conjurador e o familiar.
• O conjurador pode gastar um ponto de sangue para adotar as percepções do familiar em detrimento das suas, fazendo sua consciência residir no corpo dele e experimentar pelos sentidos dele.
• Todos os familiares são leais como se estivessem presos pelo Juramento de Sangue e, desde que sejam devidamente alimentados com sua dieta normal, nunca envelhecem e permanecem perfeitamente saudáveis. A critério do Narrador, os conjuradores podem aumentar a força de um familiar como Antecedente, gastando os próprios pontos de experiência para melhorar as estatísticas da criatura.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. Blood Dance"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 180


3. Blood Dance


A Dança do Sangue permite a um fantasma se comunicar com um parente vivo. Necromantes às vezes realizam este ritual para pessoas em troca de dinheiro ou favores.
O vampiro precisa dançar e entoar cânticos por duas horas, chamando o espírito certo e suplicando a todos os outros fantasmas que deixem a área. Enquanto dança, o vampiro derrama areias coloridas e sal marinho no chão num padrão preciso e então faz a ligação entre a pessoa viva e o falecido. Se for bem-sucedido, o fantasma “aparece” dentro do sigilo de areia do necromante e a pessoa viva pode se comunicar com ele por uma hora. A falha significa que o espírito não pôde ser contatado.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["3. Blood and Bane"] = {
					pt = [==[Rites of Blood, pág. 37


3. Blood and Bane


Sistema: A Al-Aziz precisa passar uma hora em dança extática, cânticos e meditação. Usando o nome de batismo de sua vítima e um pequeno objeto pertencente a ela — uma mecha de cabelo ou algum item de significado pessoal —, ela dirige o feitiço àquela pessoa. A conjuradora precisa fazer uma rolagem de Raciocínio + Ocultismo (dificuldade 7). Para cada sucesso, ela reduz em um ponto o nível de Taumaturgia do alvo em sua trilha primária. Os efeitos deste ritual duram até o nascer do sol seguinte, ou até a conjuradora liberar o feitiço ou ser destruída.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Bound by Oath"] = {
					pt = [==[Rites of Blood, pág. 77


3. Bound by Oath


Sistema: Quando os participantes fazem um ataque em uníssono contra o alvo selecionado, um número deles (igual aos sucessos obtidos na conjuração) pode se impulsionar na ordem de iniciativa para agir uma rodada antes do alvo. Por exemplo, quatro Assamitas atacam um alvo. O alvo age na iniciativa 10, mas três dos Assamitas rolam iniciativas 9, 9 e 7, respectivamente. Dois sucessos foram obtidos na conjuração, permitindo que dois dos três retardatários ajam na iniciativa 11 em vez disso. O terceiro permanece na ordem de iniciativa original. O ritual só concede seu benefício se todos os participantes (inclusive a Feiticeira) engajarem ativamente o alvo no início do combate.
Além disso, cada participante do combate tem um bônus (igual aos sucessos na conjuração) em quaisquer rolagens de Prontidão naquela cena. Os efeitos do ritual duram até o nascer do sol seguinte, ou até o fim do primeiro combate contra o alvo, o que vier primeiro.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Brotherhood of the Cup"] = {
					pt = [==[Lore of the Clans, pág. 221


3. Brotherhood of the Cup


Sistema: Embora nenhum Tremere admitisse, este ritual tem uma semelhança preocupante com a Vaulderie. Além da ritualista, ele exige que ao menos outros quatro Tremere (embora a tradição exija sete no total) ponham seu sangue num cálice. Quem beber do cálice fica preso por laço de sangue, mas ao Clã Tremere e ao que percebe serem os objetivos dele. O efeito dura uma hora para cada sucesso obtido na rolagem. Quando o ritual passa, passam também os efeitos. Isso não conta como ter bebido uma vez de nenhum dos Tremere que conduziram o ritual.
Conjuração de ritual taumatúrgico (V20, pág. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Bull of Heaven"] = {
					pt = [==[Rites of Blood, pág. 163


3. Bull of Heaven


Sistema: O ashipu precisa beber do animal enquanto simultaneamente o alimenta com sangue. Um ponto de sangue basta para qualquer animal menor que um homem. Três pontos são exigidos para qualquer animal maior que o tamanho de um homem, até o tamanho de um touro. Animais maiores que isso não podem ser usados neste ritual. Ao receber o sangue, o animal se torna imediatamente um carniçal, ganhando um ponto de Potência e um ponto de Fortitude ou de qualquer outra Disciplina possuída pelo ashipu que não exija sapiência (como Dominação ou Dur-An-Ki). Pelo restante da noite, o ashipu pode dirigir reflexivamente o animal à vontade e ver por seus sentidos, mantendo ao mesmo tempo sua consciência normal do que o cerca.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Calling the Hungry Shade"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 272


3. Calling the Hungry Shade


Sistema: Começando logo depois do anoitecer, o Místico pinta um círculo com o próprio sangue. Passa horas em cânticos de evocação, completando a convocação logo após o poente da lua. Ao terminar, o Místico rola Inteligência + Ocultismo, dificuldade 9. A dificuldade pode ser reduzida em 1 para cada Místico adicional que auxilie no ritual, até um número máximo de participantes igual ao Ocultismo do conjurador. A falha significa que o ritual não produz Sombra alguma, e a falha crítica faz a Sombra atacar o conjurador.
Com um sucesso, o Místico convoca uma Sombra Faminta. Ela possui Força, Destreza e Vigor iguais ao nível de Obtenebração do conjurador, até o valor máximo de 4. Está sempre em forma de sombra, como a Garra do Abismo.
Sombra Faminta (pág. 272): Os traços a seguir são iguais ao nível de Obtenebração do conjurador.
Atributos: Força, Vigor, Destreza
Habilidades: Prontidão, Esportes, Briga, Intimidação, Armas Brancas, Furtividade
Ela também possui o seguinte:
Disciplinas: Distribua entre as Disciplinas um número de pontos igual ao nível de Obtenebração do conjurador. A Sombra Faminta não pode ter Disciplinas desconhecidas do conjurador ou dos Místicos auxiliares (se houver).
Força de Vontade: 6
Vitalidade: 12
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["3. Claiming the Dark"] = {
					pt = [==[Lore of the Clans, pág. 126


3. Claiming the Dark


Sistema: Ao conjurar este ritual, a vampira se corta com uma faca e puxa as sombras ao redor para dentro do próprio corpo. O processo leva uma hora e é muito doloroso, subtraindo dois dados de qualquer rolagem que a Cainita faça durante esse tempo. Depois desse tormento, a vampira faz uma rolagem de Manipulação + Ocultismo (dificuldade 8) para reter o poder das sombras dentro de si. Se falhar, as sombras lhe escapam; se tirar falha crítica, as sombras ainda lhe tomam um ponto de sangue para cada 1 rolado.
Se for bem-sucedida, sua pele escurece e seus olhos ficam negros. Todos os seus atributos físicos sobem ao nível de seu Obtenebração, se forem menores. Os poderes de Obtenebração até o nível três são usados com -2 de dificuldade, e o custo em pontos de sangue dos Braços do Abismo é eliminado. Esse aprimoramento dura o tempo que a vampira quiser.
Infelizmente, ao se erguer do sono a cada noite, a vampira nessa condição precisa pagar um custo adicional em pontos de sangue igual ao seu nível de Obtenebração. Se não conseguir, volta ao normal. Na forma aprimorada, ela também fica mais vulnerável à luz do sol e sofre o triplo de dano dela. Sua Aparência também cai um ponto enquanto estiver empoderada.
Efeito Colateral: Se a vampira passar nessa forma mais dias consecutivos do que o valor de sua Virtude mais alta, sua pele começa a escurecer permanentemente, de modo semelhante ao dos Assamitas anciões.
Misticismo do Abismo (pág. 125): O Misticismo do Abismo é difícil e demorado de aprender, e tem um preço. Seus rituais costumam ter efeitos colaterais que criam Defeitos que a personagem não pode remover e que não dão pontos de bônus. Para aprender o poder, o vampiro precisa ter ao menos um ponto tanto em Obtenebração quanto em Ocultismo. Ele não pode aprender rituais do Abismo de nível superior ao menor entre seu Obtenebração e seu Ocultismo, e cada ritual custa um número de pontos de experiência igual a três vezes o nível do ritual. Os rituais do Abismo são conjurados com uma rolagem de Raciocínio + Ocultismo. A dificuldade é 3 + o nível do ritual conjurado. Só um sucesso é necessário para conjurar o ritual, mas o Narrador é encorajado a tornar as penalidades da falha especialmente horríveis.]==],
				},
				["3. Clinging of the Insect"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 235


3. Clinging of the Insect


Sistema: A personagem pode se mover à metade de sua velocidade normal ao escalar paredes ou tetos. Este poder dura uma cena, ou até a vampira cuspir a aranha.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Cowing the Servant"] = {
					pt = [==[Rites of Blood, pág. 157


3. Cowing the Servant


Sistema: Por uma semana por sucesso, a dificuldade de qualquer rolagem feita pelo koldun para manipular o servo é reduzida em -1.
Mecânica de dados da Feitiçaria Koldúnica (p. 156): a rolagem para ativar um ritual de Feitiçaria Koldúnica é Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual. As conexões metafísicas da escola com Kupala e com as terras permeadas por esse espírito aumentam a dificuldade em +1 em todas as rolagens de Feitiçaria Koldúnica feitas em favor de koldun que operam sua magia fora dos territórios da Europa Oriental.]==],
				},
				["3. Craft Dream Catcher"] = {
					pt = [==[Rites of Blood, pág. 62


3. Craft Dream Catcher


Sistema: Uma vez criado, o filtro dos sonhos dura uma semana para cada sucesso. Enquanto o dono tiver o filtro dos sonhos consigo ou a até três metros, ele ganha os seguintes benefícios: primeiro, a dificuldade de todos os ataques feitos contra ele por espíritos aumenta em 2. Segundo, a dificuldade de todas as tentativas de influenciar sua mente ou seus sonhos enquanto ele dorme aumenta em 2. Por fim, se o dono for um vampiro, a dificuldade para ele acordar durante o dia em resposta a um perigo potencial diminui em 2.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Dante’s Urban Legend"] = {
					pt = [==[Rites of Blood, pág. 26


3. Dante’s Urban Legend


Sistema: O conjurador precisa recriar exatamente a lenda urbana que deseja propagar no local. Por exemplo, ela pode precisar roubar alguns rins de um mortal bêbado ou matar um grupo de adolescentes com um gancho. Depois, precisa sacrificar um ponto de sangue em cada entrada da casa ou do local.
Normalmente os taumaturgos têm o cuidado de escolher uma lenda urbana que não lembre vampiros aos outros. Alguns conjuram este ritual na propriedade de seus rivais para dar um recado. Uma vez executado o ritual, logo circulam rumores entre os mortais de que a casa é assombrada ou amaldiçoada e, portanto, deve ser evitada por qualquer pessoa sensata. O valor dos imóveis ao redor da casa “assombrada” despenca à medida que os vizinhos se mudam para não morar ao lado da casa que lhes causa pesadelos.
Esses mortais racionalmente não creem no sobrenatural, mas se sentem perturbados ao pensar no local protegido pelo ritual e tentam evitá-lo. Mortais de vontade forte podem ficar curiosos o bastante para fazer um teste de Força de Vontade (dificuldade 8) para tentar entrar no prédio ou na área — a falha significa que inventam alguma desculpa para não entrar. A duração deste ritual é de uma década mais um ano adicional para cada sucesso adicional obtido na rolagem de ativação.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Death’s Head"] = {
					pt = [==[Rites of Blood, pág. 103


3. Death’s Head


Ritual de Necromancia de Nível Três. Alguns necromantes da Tal’Mahe’Ra recolhem fragmentos de cabelo, osso, cinza ou carne de seus inimigos como lembrança de uma vitória. Usando Necromancia, empregam esses restos para criar um resíduo semelhante a tinta com o qual decoram máscaras de porcelana conhecidas como Cabeças da Morte. Uma vez ativada, essa máscara faz quem a usa (que pode ser outra pessoa que não o necromante que a fez) parecer um espectro enquanto a estiver usando. No mundo físico, quem a usa parece translúcido e fantasmagórico (mas não recebe capacidade especial de atravessar objetos físicos nem de cruzar para as Terras das Sombras). Nas Terras das Sombras, quem a usa pode se passar por espectro até entre espectros verdadeiros. Note que a aura do usuário fica pálida, como a de um espectro (e seu tipo de criatura é lido como espectro), mas isso não esconde nem altera quaisquer outros padrões ou cores (como as estrias da diablerie).
Uma Cabeça da Morte, uma vez pintada, fica encantada mas inativa até ser usada. Uma vez ativada (ao se colocar a máscara), a máscara se desfaz em pó, deixando um padrão tênue de marcas branco-osso pelo rosto do usuário. Se o usuário quiser encerrar o efeito antes, os padrões suaves se dissolvem no nada e ele retorna à sua aparência física normal. Um necromante só pode criar uma Cabeça da Morte por vez; quaisquer máscaras já existentes são destruídas (ou seus usos ativos cancelados) quando uma segunda é criada. Leva uma noite inteira para criar uma Cabeça da Morte.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Din of the Damned"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 180


3. Din of the Damned


Este ritual é semelhante ao Ritual de Nível Um Chamado dos Mortos Famintos (ver p. 177) por tornar os sons do Mundo Inferior audíveis no plano físico. Porém, o Estrondo dos Condenados é um ritual de área usado para proteger um cômodo contra escuta. Ao longo de meia hora, o necromante traça uma linha ininterrupta de cinzas de crematório pelas paredes do cômodo (essa linha pode passar sobre batentes de porta para permitir entrada e saída). Pelo resto da noite, qualquer tentativa de escutar o que ocorre dentro do cômodo, seja simples (como um copo na parede), eletrônica (como um microfone a laser) ou mística (inclusive poderes como Sentidos Aguçados), exige que o bisbilhoteiro obtenha mais sucessos numa rolagem de Percepção + Ocultismo (dificuldade 7) do que o conjurador do ritual obteve. Não superar essa marca dá ao ouvinte uma enxurrada de lamentos e gemidos fantasmagóricos e o som de ventos uivantes; uma falha crítica o ensurdece pelo resto da noite.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["3. Displacement of the Pneuma"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 311


3. Displacement of the Pneuma


Ritual dos Seguidores de Set. Este ritual leva vinte minutos para ser executado e exige uma vítima mortal presa em pé sobre uma superfície plana, além de um animal (como um bode ou um porco) amarrado por perto. A feiticeira corta o próprio pulso e “mata” ritualmente o prisioneiro passando uma lâmina cega pela garganta dele (sem causar dano), enquanto deixa o sangue jorrar do pulso sobre o peito da vítima. O ritual só funciona se a vítima não perceber o embuste e acreditar por um momento que teve a própria garganta cortada. Nesse instante, a feiticeira grita uma palavra de poder o mais alto que puder no ouvido da vítima. Se for bem-sucedida, ela arranca por choque a alma da vítima do corpo dela e a lança no corpo do animal. A vítima vive o resto da expectativa de vida do animal presa naquele corpo; carente dos instintos do animal, pode estar mal equipada para sobreviver. Um simulacro do intelecto da vítima, despido de memória, desejo ou Força de Vontade, permanece no corpo humano. O ser sem alma é sugestionável e segue as instruções da feiticeira, desde que não exijam interpretação. Sem volição, o servo não busca a própria sobrevivência básica e morre de sede se não for mandado beber.
Rituais de clã (pág. 302): Os rituais de clã são segredos ciosamente guardados, jamais compartilhados com quem não pertence ao clã ou linhagem que abriga seus mistérios.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. Divine Sign"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 180


3. Divine Sign


Ao descobrir a data de nascimento de uma pessoa, o jogador do necromante pode rolar para ativar este ritual. Se for bem-sucedido, o Membro pode usá-lo para prever o próximo curso de ação do alvo, o que lhe permite lidar com ele de acordo. O efeito sobre fantasmas é bem diferente: em vez disso, o ritual dá ao necromante uma compreensão tão íntima do espectro em questão que ela funciona como uma conexão com o fantasma, tornando mais fácil invocar outros efeitos de Necromancia sobre aquele espírito. Para fins de história, equivale a segurar um dos grilhões daquele espectro (ver Ritual do Grilhão Desenterrado, abaixo).
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["3. Enfolding the Believers"] = {
					pt = [==[Rites of Blood, pág. 64


3. Enfolding the Believers


Sistema: Os efeitos duram uma semana para cada sucesso. Cada seguidor mantém sua lealdade normal de laço de sangue com o regente, mas também sente fortes sentimentos de amor e afeição por todo mortal que participa do ritual com ele, por mais numerosos que sejam. Cada participante também sente um forte senso de lealdade e devoção aos ideais e dogmas do culto. Ainda é possível que irrompa conflito se dois ou mais seguidores expressarem discordância genuína sobre as crenças do culto ou os desejos do regente, mas, se a própria regente estiver presente, tais rusgas se resolvem com facilidade. Além de quaisquer outros benefícios da lealdade de grupo, este ritual também pode beneficiar indiretamente a própria feiticeira. Para cada cinco pessoas sob o efeito deste ritual que estejam presentes para auxiliar a feiticeira em suas outras atividades ocultas, ela ganha um bônus de +1 dado em todas as rolagens relativas a trilhas ou rituais. Este ritual não tem efeito sobre Membros.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Father’s Freedom"] = {
					pt = [==[Rites of Blood, pág. 101


3. Father’s Freedom


Sistema: Este ritual leva uma hora para ser executado e exige que o conjurador gaste 10 pontos de sangue ao longo da conjuração. O alvo do ritual precisa permanecer dentro do círculo ritual (uma área máxima de 10 metros quadrados) durante toda a conjuração, embora possa ser contido por força física ou meios sobrenaturais. Se o ritual for bem-sucedido, ele remove imediatamente todos os efeitos dessa diablerie (bons e ruins) do alvo, exceto que o ritual não restaura nenhuma perda de moralidade sofrida por diablerizar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Flesh of Fiery Touch"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 235


3. Flesh of Fiery Touch


Sistema: A Carne do Toque Ígneo leva duas horas para ser conjurada (reduzidas em 10 minutos por sucesso). Exige um pequeno pedaço de madeira, carvão ou outra fonte comum de combustível, que é aceso e engolido ao fim do ritual. O sujeito que engole a brasa em brasa recebe um único nível de dano agravado (dificuldade 6 para absorver com Fortitude). Até o pôr do sol seguinte, qualquer um que toque a carne do sujeito recebe uma queimadura que inflige um único nível de dano agravado (novamente, dificuldade 6 para absorver com Fortitude). A vítima precisa tocar o sujeito voluntariamente; este dano não é infligido se a vítima for tocada ou entrar em contato acidental com o sujeito.
Este ritual escurece a pele do sujeito ao tom que seria obtido por exposição prolongada ao sol num mortal. O tom é levemente antinatural e metálico, e é claramente artificial para qualquer observador que tenha êxito numa rolagem de Percepção + Medicina (dificuldade 8).
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Hell’s Calling"] = {
					pt = [==[Rites of Blood, pág. 158


3. Hell’s Calling


Sistema: Ao término deste ritual, o alvo precisa rolar imediatamente para frenesi de medo. O efeito pode ser superado com o gasto de um ponto de Força de Vontade mas, do contrário, uma rolagem falha faz o alvo entrar em frenesi e fugir da área aterrorizado. A personagem também não faz ideia de por que está subitamente tomada de terror e, assim que ela pensa em se perguntar do que tem medo, o efeito termina.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Incorporeal Passage"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 236


3. Incorporeal Passage


Sistema: Este ritual dura um número de horas igual ao número de sucessos obtidos numa rolagem de Raciocínio + Sobrevivência (dificuldade 6). A conjuradora pode encerrar o ritual prematuramente (e, portanto, sua incorporeidade) virando o caco de espelho de modo que ele não reflita mais sua imagem.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Inscription"] = {
					pt = [==[Rites of Blood, pág. 150


3. Inscription


Sistema: Uma taumaturga que conheça as técnicas da Inscrição pode escrever uma forma abreviada de qualquer ritual de primeiro ou segundo nível que conheça, ao custo de dois pontos de sangue. Qualquer um que saiba ler a língua usada pode então reconjurar o ritual depois. Conjurar o ritual a partir das notas exige o uso dos componentes e do tempo de sempre, além de uma rolagem de Inteligência + Ocultismo, mas o conjurador não precisa ter conhecimento nenhum de Taumaturgia. Uma vez completa a inscrição, o poder da vitae da autora fica preso no objeto; sua reserva máxima de sangue é efetivamente reduzida em um até que a inscrição seja usada. Depois do uso, a inscrição seca numa cinza fina e ilegível, com todo o poder expelido da tinta. A escriba pode usar a inscrição ela mesma (o que é bastante inútil) ou dá-la a outra pessoa.
É bem sabido nos círculos mágicos que o sangue que alimenta a Inscrição pode ser usado para vínculos de Simpatia e Identidade, e uma taumaturga incauta pode ver seu sangue nas mãos de um inimigo capaz de usá-lo contra ela. Para impedir que uma inscrição chegue ao sujeito errado, muitos escribas também usam Codificar Missiva em suas notas encantadas, para garantir que só o destinatário pretendido possa usar este ritual.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Mirror of Second Sight"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 236


3. Mirror of Second Sight


Sistema: O ritual exige um ponto do sangue da vampira. Dali em diante, o espelho reflete imagens das formas verdadeiras de outras criaturas sobrenaturais — lobisomens aparecem em suas descomunais formas homem-lobo, magos brilham num nimbo cintilante, fantasmas ficam visíveis (no espelho) e assim por diante. Às vezes, o espelho também revela os possuidores de Fé Verdadeira em nuvens de luz dourada.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Nightmare Drums"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 180


3. Nightmare Drums


O necromante que usa este ritual envia os mortos para assombrar os sonhos de um inimigo, usando os fantasmas para enlouquecer lentamente um oponente. Uma vez conjurado o ritual, o vampiro não tem controle sobre este poder, exceto para interrompê-lo. A forma dos pesadelos e as imagens que assaltam o alvo não estão sob o controle do necromante; estão sob o controle dos fantasmas que de fato fazem a assombração.
O necromante usa o próprio sangue e um bem pessoal do alvo neste ritual. Uma vez que o item tenha sido revestido de sangue, o vampiro precisa queimá-lo, enviando um ícone fantasmagórico dele às Terras das Sombras, tanto como distintivo de identificação quanto como recompensa aos fantasmas que concordarem em assombrar o alvo. Enquanto o item queima, o necromante (e assistentes, se houver) martela uma batida implacável em tambores gigantescos de pele humana. Os tambores são inaudíveis neste plano, mas trovejantes na morada dos mortos. Para silenciar os tambores ensurdecedores, os fantasmas concordam com resignação em negociar com o necromante. Eles prometem enviar pesadelos à vítima pelo tempo que o vampiro exigir, em troca de um favor. O pedido deles costuma ser algo como levar uma mensagem a um parente vivo ou executar vingança contra alguém que os desprezou.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["3. One with the Dark"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 36


3. One with the Dark


Sistema: O Místico do Abismo precisa estar num Oubliette, ou num espaço fechado sem luz, numa noite de meia-lua. Precisa preparar o corpo com tatuagens rituais desenhadas por Místicos mestres, ditas escritas na língua do Abismo. Nu e coberto de piche, o Cainita convulsiona e produz no mínimo três pontos de sangue por seus orifícios, exigindo uma rolagem de Vigor + Ocultismo (dificuldade 6). Cada sucesso concede ao Místico um segredo pertencente a qualquer um dos Cainitas nomeados no ritual — segredos a serem determinados pelo Narrador — e faz a pele do Místico do Abismo assumir um negro fumegante e antinatural. A Aparência do Místico do Abismo sobe para quatro pontos, ou aumenta em um ponto ignorando os limites de Geração — o que for maior — até a meia-lua seguinte; se o Cainita seguir qualquer Caminho que não o do Pecado ou o do Abismo, executar este ritual reduz permanentemente o nível dele em um. Numa falha, o ritual não dá certo e os pares do Místico do Abismo o evitam por pelo menos um mês. Numa falha crítica, todo Cainita do domínio local vê os segredos do Místico do Abismo enquanto dorme.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["3. One with the Forest"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 51


3. One with the Forest


Sistema: Na floresta onde o rito foi concluído, o koldun pode entrar em qualquer árvore mais larga que ele e emergir de outra da mesma floresta, de largura igual ou maior. O vampiro não pode permanecer dentro da árvore. Este efeito permanente é neutralizado quando uma árvore em que o Cainita entrou naquela noite é derrubada.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["3. Pavis of Foul Presence"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 236


3. Pavis of Foul Presence


Sistema: Este ritual resiste a um número de efeitos igual aos sucessos rolados, ou até o nascer do sol após ser executado. Note que o poder da Disciplina Presença precisa de fato ter êxito antes de ser revertido pelo ritual. Assim, só poderes que tenham o conjurador especificamente como alvo (e que, portanto, exigem uma rolagem para ter êxito) podem ser revertidos — poderes “passivos” como a Majestade não são afetados.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Rings Like Chains"] = {
					pt = [==[Rites of Blood, pág. 84


3. Rings Like Chains


Sistema: Enquanto tanto o Feiticeiro quanto o destinatário estiverem usando as joias, na próxima vez em que o alvo pretendido consumir uma substância viciante (drogas, álcool, vitae etc.), o Feiticeiro fica sabendo e tem a opção de fazer os dois se tornarem automaticamente viciados na substância em questão. Os efeitos do ritual se esvaem depois dessa primeira ocorrência, quer o Feiticeiro o ative, quer não. Isso dá ao Feiticeiro Setita uma enorme alavancagem sobre o alvo, ao criar nele um novo vício a ser explorado.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Ritual of The Unearthed Fetter"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 181


3. Ritual of The Unearthed Fetter


Este ritual exige que o necromante tenha um osso de dedo do esqueleto do fantasma específico que lhe interessa. Quando o ritual é conjurado, o osso do dedo se sintoniza com algo de importância vital para o espectro, cuja posse pelo necromante torna a conjuração de poderes Necrománticos contra aquele fantasma bem mais fácil (ver a Trilha do Sepulcro, p. 160, para um exemplo). A maioria dos necromantes pega o osso sintonizado e o suspende por um fio, permitindo que ele atue como uma espécie de bússola sobrenatural e seguindo-o até o item especial em questão.
O Ritual do Grilhão Desenterrado leva três horas para ser conjurado adequadamente. Exige tanto o nome do fantasma alvejado quanto o osso de dedo já mencionado, além de uma lasca lascada de uma lápide ou outro marco (não necessariamente o marco do antigo dono do osso). Ao longo do ritual, a pedra se desfaz em pó, que é então polvilhado sobre o osso do dedo.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["3. Rutor’s Hands"] = {
					pt = [==[Rites of Blood, pág. 150


3. Rutor’s Hands


Sistema: A conjuração deste ritual exige que a taumaturga decepe a própria mão e arranque o próprio olho ao término do ritual; isso causa cinco níveis de dano agravado inabsorvível. Uma vez curado esse dano, a Tremere regenera a mão e o olho, embora o homúnculo medonho ainda possa rondar. Completar este ritual também pode exigir uma rolagem de Força de Vontade, a critério do Narrador, simplesmente para levar a cabo o final doloroso. A mão animada tem um nível de vitalidade próprio e se move com o equivalente a dois pontos em cada Atributo Físico e em Percepção (ver p. 108). A conjuradora dirige mentalmente o movimento da coisa à vontade (desde que a taumaturga permaneça consciente, é claro). A Mão precisa receber um ponto de sangue por semana, ou se desfaz em pó. Do mesmo modo, se a mão for exposta à luz do sol ou ao fogo, ela desaparece com um guincho, deixando para trás um fedor pútrido.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Samira’s Kihanah"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 117


3. Samira’s Kihanah


O Samira’s Kihanah permite à conjuradora saber aquilo que é verdadeiramente desconhecido. Para usar este ritual, ela toma um pequeno objeto de metal feito à mão, não maior que seu antebraço, e o unta com três pontos de sangue ao longo de seis horas, sob a lua de sangue. O objeto absorve o sangue e assume um tom avermelhado. Conjurado o ritual, ele invoca um djim. A conjuradora, ou qualquer outra pessoa que segure o objeto, pode fazer uma pergunta perdida no tempo — ou seja, uma pergunta cuja resposta nenhuma pessoa viva (nem Cainita) conhece. Do contrário, a pergunta fica sem resposta. O djim espalha sua consciência pelo espaço e pelo tempo e retorna instantaneamente com a resposta. Contudo, o djim sempre tenta formular a resposta de modo que o curioso que perguntou se meta em enorme encrenca, apesar da verdade dela. A cada pergunta respondida, o vermelho esmaece um pouco, até a terceira pergunta, quando então o djim foge do mundo da carne. O objeto permanece encantado até se esgotar por completo. Perguntas não respondidas não esgotam o objeto.
Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. Sanguine Assistant"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 236


3. Sanguine Assistant


Sistema: O jogador gasta cinco pontos de sangue e rola. O servo criado pelo ritual tem 30 cm de altura e aparenta ser uma forma grosseiramente humanoide composta do que quer que o ritual tenha sugado para seu próprio uso. Ele dura uma noite por sucesso rolado. Ao fim da última noite, o assistente rasteja até a tigela usada em sua criação e se desfaz. O assistente pode ser reanimado por outra aplicação deste ritual; se o conjurador assim desejar, ele se reconstitui dos mesmos materiais, com as mesmas memórias e personalidade.
Um Assistente Sanguíneo tem Força e Vigor 1, e Destreza e Atributos Mentais iguais aos do conjurador. Começa sem Atributos Sociais dignos de nota, mas ganha um ponto por noite em Carisma e Manipulação até que seus valores igualem os do conjurador. Tem todas as Habilidades do conjurador um ponto abaixo das dele. Um Assistente Sanguíneo é uma criatura naturalmente tímida e foge se atacado, embora tente defender a vida de seu senhor ao custo da própria. Não tem Disciplinas próprias, mas tem compreensão plena de todo o conhecimento Taumatúrgico de seu senhor e pode instruir outros, se assim for ordenado. Um Assistente Sanguíneo é impermeável a quaisquer Disciplinas ou magias de controle mental, de tão completamente ligado que está à vontade de seu criador.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Sanguine Trail"] = {
					pt = [==[Lore of the Clans, pág. 221


3. Sanguine Trail


Sistema: Se o ritual for bem-sucedido, a conjuradora consegue ver a conexão entre o alvo e qualquer pessoa a quem ele esteja preso por laço de sangue. Se houver múltiplos laços, ela vê um para cada sucesso obtido. Se obtiver cinco sucessos, também vê a direção de cada laço, revelando quem está preso a quem.
Conjuração de ritual taumatúrgico (V20, pág. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Scorpion Sending"] = {
					pt = [==[Rites of Blood, pág. 166


3. Scorpion Sending


Sistema: O escorpião tem os traços normais de um animal de seu tamanho mas, se acertar o alvo com êxito, ele é envenenado. O veneno inflige um nível de dano letal a cada quinze minutos. O dano cessa se o alvo tiver êxito numa rolagem de Vigor (dificuldade 7), com uma rolagem a cada quinze minutos. O veneno ataca mortais e sobrenaturais igualmente. O escorpião é pequeno e, portanto, difícil de ver (Percepção + Prontidão, dificuldade 7).
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Scry the Hearthstone"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 307


3. Scry the Hearthstone


Com este ritual, a conjuradora ou o sujeito sobre quem ela o conjura fica vinculado a um refúgio (até o tamanho de um pequeno castelo). O sujeito pode detectar intrusos de qualquer tipo, mesmo que estejam fora de vista ou sob o véu de Ofuscação ou poderes similares. O ritual leva uma noite inteira para ser completado e envolve encantação contínua junto à marcação do vitae do sujeito nos limites cardeais do refúgio, seguida do gasto de um ponto de Força de Vontade pela conjuradora para ativar os efeitos. Concluído o ritual, o sujeito ganha uma noção inata da localização, do tamanho aproximado e da condição física de todos os seres vivos ou mortos-vivos dentro da estrutura. Para localizar exatamente um indivíduo, a jogadora rola Percepção + Vigilância (dificuldade 6); se o alvo estiver tentando se esconder, ele contesta com uma rolagem de Raciocínio + Furtividade (dificuldade 6), e quem obtiver mais sucessos vence. Independentemente de sucesso ou falha na rolagem, o sujeito sabe que há alguém presente, mesmo que não consiga ver o indivíduo em questão. Para detectar intrusos que empreguem habilidades mágicas ou sobrenaturais de ocultação, como Ofuscação, o sujeito precisa possuir e ter ativa no momento uma percepção sobrenatural própria (como Auspícios) (ver o quadro “Vendo o Invisível” na pág. 195). O Scry the Hearthstone dura um número de semanas igual aos sucessos obtidos na rolagem inicial de conjuração e está vinculado apenas ao local associado à conjuração.
Este é ao mesmo tempo um Ritual de Gárgula e um Ritual de Refúgio (ver Enchant Talisman na pág. 309 e Dedicate the Haven na pág. 310).
Ritual de Refúgio (pág. 310): Uma vez consagrado pelo Dedicate the Haven, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Rituais de Gárgula (pág. 309): Os taumaturgos Tremere podem conjurar o Enchant Talisman sobre uma Gárgula para encantá-la permanentemente com um ritual específico que a conjuradora conheça. Esse feito exige seis horas por noite e uma semana por nível do ritual. Uma vez conjurado com sucesso, o ritual permanentemente encantado numa Gárgula torna-se inerente a ela, como uma Disciplina, e pode ser ativado, desativado e reativado à vontade pela Gárgula com o gasto de um ponto de sangue. Se o ritual estiver vinculado a um item específico, passa a estar vinculado à própria Gárgula. Uma Gárgula que invoque o Scry the Hearthstone pode aplicar os efeitos do ritual a qualquer morada tocando-a diretamente e gastando um ponto de Força de Vontade. Os rituais ativados por uma Gárgula não exigem rolagem de conjuração e duram uma cena ou até serem dispensados.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. Shaft of Belated Quiescence"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 237


3. Shaft of Belated Quiescence


Sistema: O ritual leva cinco horas para ser executado, menos 30 minutos por sucesso. A estaca precisa ser entalhada em sorveira-brava, revestida com três pontos do sangue do conjurador e enegrecida num fogo de madeira de carvalho. Quando o ritual está completo, a estaca fica encantada para agir como descrito acima.
Um ataque com uma Haste do Repouso Tardio é feito como com uma estaca normal: uma rolagem de Destreza + Armas Brancas (dificuldade 6, modificada conforme as regras normais de combate; o ataque não precisa mirar especificamente o coração) com valor de dano letal igual a Força + 1. Se ao menos um nível de dano for infligido depois de o alvo rolar para absorver, a ponta da estaca se quebra e começa a cavar. Se não, a estaca pode ser usada para ataques subsequentes até acertar fundo o bastante para ativar.
Uma vez que a ponta da estaca esteja no corpo da vítima, o Narrador inicia uma rolagem prolongada do valor de Taumaturgia do conjurador (dificuldade 9), rolando uma vez por hora de tempo de jogo. Os sucessos nessa rolagem são somados aos sucessos obtidos no ataque inicial. Isso representa o avanço da ponta rumo ao coração da vítima. Uma falha crítica indica que a ponta atingiu um osso e todos os sucessos acumulados são perdidos (inclusive os da rolagem de ataque inicial). Remover a parte do corpo onde a ponta se alojou (como um Tzimisce se transformando em sangue ou um vampiro decepando o próprio braço) pode deter o avanço da ponta, conforme o número de sucessos obtidos e o critério do Narrador. Quando a haste acumula um total de 15 sucessos, ela alcança o coração da vítima. Isso paralisa Membros e é instantaneamente fatal para mortais e carniçais.
Tentativas de remover cirurgicamente a ponta da haste podem ser feitas com uma rolagem prolongada de Destreza + Medicina feita uma vez por hora (dificuldade 7 para Membros e 8 para mortais). O cirurgião precisa acumular um número de sucessos igual aos que a haste detém no momento para remover a ponta. Uma vez iniciada a cirurgia, porém, a haste começa a evadir ativamente as sondas do cirurgião, e suas rolagens passam a ser feitas uma vez a cada 30 minutos durante a tentativa de cirurgia. Cada rolagem individual de cirurgia que obtenha menos de três sucessos inflige um nível adicional de dano letal inabsorvível ao paciente.
A Haste do Repouso Tardio pode ser executada em outras armas perfurantes de madeira, como lanças, flechas, espadas de treino e tacos de sinuca, desde que sejam feitos de sorveira-brava. Ela não pode, porém, criar uma Bala do Repouso Tardio.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Soul of the Homunculus"] = {
					pt = [==[Rites of Blood, pág. 151


3. Soul of the Homunculus


Sistema: Um homúnculo (ver p. 107) tem dois níveis de vitalidade e dois pontos em cada Atributo Físico. Ele funciona muito como um membro do criador, pois o homúnculo só se move ou age se o conjurador assim quiser. Homúnculos são feridos pela luz do sol e pelo fogo como os Membros. Um homúnculo, embora criado da carne do conjurador, é uma entidade física separada e, portanto, não conta como conexão arcana, nem seus fluidos corporais contam como o sangue de seu criador.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Strength in Wisdom"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 43


3. Strength in Wisdom


O feiticeiro que testemunha um ato imoral servindo de prova da indignidade de um Cainita pode instilar proteções no guerreiro ou nos guerreiros enviados para prendê-lo. Este ritual concede dados de bônus iguais aos sucessos obtidos. Esses dados podem ser divididos como o feiticeiro quiser entre quaisquer defesas físicas ou mentais contra o alvo. Toda rolagem que use esses dados de bônus se beneficia de -1 de dificuldade.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["3. Summoning the Blatherskites"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 36


3. Summoning the Blatherskites


Sistema: A Cainita que entoa este ritual precisa ter familiaridade com o domínio no qual deseja que os blatherskites surjam, tendo já obtido sucesso numa rolagem de Percepção + Sobrevivência (dificuldade 6) numa noite anterior à convocação, a fim de identificar as fendas mais escuras. É delas que nascem os blatherskites. A Mística do Abismo precisa submergir num corpo d’água e fazer um teste estendido de Manipulação + Ocultismo (dificuldade 7) com alvo de 10, 15 ou 20 sucessos. Ao longo daquela noite, para cada marca atingida, um blatherskite surge no domínio escolhido e ataca ao acaso quem quer que encontre. Você não escolhe alvo; outro blatherskite surge a cada marca. Ele só pode ser ferido por dano agravado e derrete quando o sol nasce. Numa falha crítica no teste estendido, um blatherskite emerge do corpo d’água em que a Cainita executa o rito e ataca a própria convocadora. As estatísticas do blatherskite estão na pág. 33.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["3. Telecommunication"] = {
					pt = [==[Rites of Blood, pág. 68


3. Telecommunication


Sistema: Os sucessos obtidos criam uma parada de dados que o taumaturgo pode usar para observar através da tela ou controlá-la a qualquer momento nas sete noites seguintes. O jogador precisa rolar essa parada de dados para ver e ouvir através da tela (dificuldade 4) ou para controlar o que a tela exibe para os outros (dificuldade 7). Uma falha crítica em qualquer dessas rolagens encerra o efeito do ritual imediatamente.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Tempest Prison"] = {
					pt = [==[Rites of Blood, pág. 94


3. Tempest Prison


Sistema: Concluído o rito, o chão estremece por um momento para indicar o êxito. Ao desenterrar o recipiente de vidro, ele agora está cheio de uma névoa rodopiante roxa e negra, na qual se veem lampejos ocasionais de luz, como relâmpagos em miniatura. Quando a necromante abre a garrafa, qualquer espectro na linha de visão do recipiente precisa fazer um teste de Força (usando seu valor de Força tal como é nas Terras das Sombras) contra uma dificuldade de 6 mais o número de sucessos obtidos na conjuração do Ritual. Esse teste é repetido a cada rodada até o espectro sair da visão do recipiente, ou até falhar e ser sugado imediatamente para dentro do vórtice (que não sai do recipiente).
A Prisão de Tempestade pode conter um número de espectros igual a cinco vezes o número de sucessos obtidos em sua ativação. Também dura um número de noites igual a cinco vezes os sucessos obtidos, após o que o vórtice se aquieta e os espectros são libertados. Isso também pode ser encerrado prematuramente com o simples estilhaçar do recipiente (o que pode levar a lidar de repente com uma tempestade de espectros furiosos).
A Prisão de Tempestade não precisa necessariamente ser manejada por uma necromante depois de criada. Exige uma necromante para criá-la, mas não para usá-la. Aliás, muitos Giovanni chamados para livrar uma área de interferência fantasmagórica emprestam a seus contratantes um recipiente desses para recolher os fantasmas problemáticos. Depois eles “descartam” os fantasmas em outro lugar. Nesses casos, os dois lados do acordo conseguem o que querem.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["3. Tempesta Scudo"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 181


3. Tempesta Scudo


Diferentemente da maioria dos rituais, o Tempesta Scudo pode ser conjurado depressa. A necromante executa uma dança curta e desajeitada que termina com ela mordendo o próprio lábio e cuspindo o sangue num círculo ao seu redor. Todas as ações de fantasmas dentro do círculo de sangue são feitas com +2 de dificuldade.
Para conjurar este ritual com êxito, a necromante precisa gastar um turno de combate executando a dança. Ao fim do turno, ela faz uma rolagem de Destreza + Performance contra dificuldade 7 (se feita fora de combate, a dificuldade é apenas 6). No turno de combate seguinte, ela morde os próprios lábios (sofrendo um nível de dano contusivo) e cospe (gastando um ponto de sangue). Então é feita a rolagem normal de ritual para ver se o poder faz efeito.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["3. The Bottled Voice"] = {
					pt = [==[Rites of Blood, pág. 150


3. The Bottled Voice


Sistema: Para conjurar o ritual, o taumaturgo precisa imobilizar a vítima. Isso pode ser feito estacando ou amarrando o alvo. O conjurador precisa ter acesso irrestrito à vítima enquanto tenta extrair a voz. Cada ponto de Força de Vontade que a vítima possua no momento estende o tempo de conjuração exigido em quinze minutos. Uma vez completo o ritual, a garrafa de cristal contém a essência da voz da vítima, e ela não pode falar nem emitir som verbal algum até que o selo ou a garrafa de cristal seja quebrado. A morte do taumaturgo não rompe esta maldição.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. The Floating Dead"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 51


3. The Floating Dead


Sistema: Concluído o rito, o Cainita ganha a capacidade de atravessar rios, lagos e até mares sem afundar sob as ondas. Este poder permanente é anulado se o Cainita for algum dia submerso na água, por vontade própria ou à força.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["3. The Third Eye of Rickard Argentis"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 273


3. The Third Eye of Rickard Argentis


Este ritual invoca um misterioso terceiro olho, forjado de energias abissais, que repousa na testa do conjurador e o protege de danos. O ritual leva dez minutos para ser conjurado, o mais perto do anoitecer que ele conseguir, e nesse momento o conjurador escolhe quanto sangue investir no olho. Sempre que o conjurador fosse ser emboscado ou surpreendido, o olho gasta um dos pontos de sangue investidos. Quando isso acontece, o conjurador obtém sucesso automático na rolagem para reagir à surpresa, e o olho convoca reflexivamente um Braço de Ahriman (ver pág. 229) contra o atacante, que pode agir imediatamente. Se o jogador optar por gastar mais pontos de sangue, Braços adicionais podem ser convocados contra outros atacantes, mas nunca mais de um por atacante.
Uma vez gasto todo o sangue, o olho desaparece até ser reconjurado.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["3. Translocation of the Vessel"] = {
					pt = [==[Rites of Blood, pág. 27


3. Translocation of the Vessel


Sistema: Translocation of the Vessel exige que o taumaturgo escolha um receptáculo para sintonizar com sua vitae. Este item precisa ser pequeno o bastante para que ela o levante facilmente com uma das mãos. Exemplos incluem um bisturi, uma bengala, uma bolsa, um saquinho ou uma varinha. Em seguida, ela precisa embeber o receptáculo num ponto de seu sangue ao longo de uma noite. O objeto absorve lentamente a vitae, criando um vínculo simpático entre o receptáculo e o taumaturgo. O conjurador pode romper o vínculo a qualquer momento gastando um ponto de Força de Vontade, ou se o receptáculo for quebrado.
Quando o conjurador quer deixar o receptáculo pronto para a translocação, ela desenha um círculo de proteção no chão com sal purificado e um ponto de seu sangue. Este círculo precisa ser grande o bastante para cercar completamente o receptáculo. Uma vez colocado dentro do círculo de proteção, ele pode ser invocado pelo nome até o taumaturgo, de qualquer lugar do mundo. O conjurador precisa estender a mão e entoar o encantamento que envolve o nome do objeto, e ele aparece em sua mão.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Transubstantiation of Seven"] = {
					pt = [==[Rites of Blood, pág. 151


3. Transubstantiation of Seven


Sistema: O conjurador da Transubstanciação precisa sacrificar um ponto do próprio sangue. O sangue colocado no cálice permanece inalterado até depois de ser bebido e espalhado pelo organismo do sujeito, ponto em que assume as propriedades do Conselho dos Sete.
Isso causa um passo rumo a um laço de sangue com todo o conselho, mas garante que a vitae dos conselheiros não possa ser roubada. Como o sangue já está no organismo do sujeito, ele conta como a vitae dele próprio se for drenado depois.
Na verdade, não há exigência física de que este rito seja usado num neófito recente. Raros neófitos Tremere escapam do processo. Teoricamente, o rito também poderia ser usado para gerar um laço mais forte em Tremere mais velhos, ou mesmo em carniçais ou Membros de outros Clãs. Membros de 14ª ou 15ª geração, carniçais e revenants não podem usar este rito — seu sangue não é forte o bastante para canalizar o poder dos conselheiros.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Ward of the Winged Sepulcher"] = {
					pt = [==[Lore of the Bloodlines, pág. 37


3. Ward of the Winged Sepulcher


Sistema: O conjurador precisa preparar um pequeno cubo de cerca de um centímetro de diâmetro, cuidadosamente cortado de uma lápide que marque uma sepultura vazia num cemitério. Gastando um ponto de sangue, ele umedece cada face do cubo com uma gota de sangue, sussurrando uma encantação. O conjurador ingere o cubo e o ritual fica dormente até a pele da criatura ser tocada pela luz do sol, quando então as asas se desdobram para protegê-lo. A asa endurece numa substância pétrea e é capaz de proteger uma pessoa dentro de seu espaço. Se o conjurador ainda não possuir asas, a proteção causa um nível de dano agravado se estiver protegendo apenas o conjurador, e dois se estiver protegendo o conjurador e mais um sujeito.
Rituais de Gárgula (pág. 37): Encantar uma Gárgula com um ritual exige conjurar o ritual por seis horas a cada noite, por uma semana para cada nível do ritual a ser aplicado, mas de resto usa as mesmas regras do Enchant Talisman. Os rituais ativados por uma Gárgula não exigem rolagem de conjuração e duram uma cena ou até serem dispensados. Uma Gárgula encantada dessa forma pode gastar o próprio sangue ou a própria Força de Vontade como se fosse a conjuradora do ritual encantado em seu sangue. Se o ritual normalmente não exigir custo algum, a Gárgula ainda assim precisa gastar ao menos um ponto de sangue para ativá-lo. Se o ritual exigir um item específico, a própria Gárgula é considerada o “item” para efeitos do ritual.
Conjuração de ritual taumatúrgico (V20, pág. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Ward versus Lupines"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 237


3. Ward versus Lupines


Sistema: A Proteção contra Lupinos se comporta exatamente como a Proteção contra Carniçais, mas afeta lobisomens em vez de carniçais. O ritual exige um punhado de pó de prata em vez de um ponto de sangue.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Warding Circle versus Lupines"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


3. Warding Circle versus Lupines


Sistema: Como o Círculo de Proteção contra Carniçais (p. 234), mas o círculo afeta lobisomens. O ritual exige o mesmo componente material da Proteção contra Lupinos — pó de prata — porém em quantidade maior. A conjuradora determina o tamanho do círculo de proteção no momento da conjuração; o raio padrão é de 3 metros, e cada aumento de 3 metros eleva a dificuldade em um, até o máximo de 9. O ritual leva o tempo normal de conjuração se for de curto prazo (durando o resto da noite) ou uma noite se for de longo prazo (durando um ano e um dia).
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["3. Wield the Spear of Damnation"] = {
					pt = [==[Dark Ages Companion, pág. 116


3. Wield the Spear of Damnation


Este ritual evoca a própria lenda de Caim, dedicando uma arma a satisfazer a natureza do vampiro assim como o Pai Sombrio se amaldiçoou ao erguer uma pedra afiada contra o irmão. O Tremere escreve Gênesis 4:10 (“E disse Deus: ‘Que fizeste? A voz do sangue do teu irmão clama a mim desde a terra.’”) sobre uma arma de corte, em suposta escrita angelical, durante um transe meditativo. Isso exige uma hora. Daquele momento em diante, metade do dano letal infligido pela arma (arredondada para cima) se converte em pontos de sangue, enchendo a reserva do portador. Isso persiste até a arma ter colhido em pontos de sangue o nível de Taumaturgia do conjurador + os sucessos do ritual. O sangue assim colhido não inflige dano extra (vem direto do sangue derramado pelo ferimento), mas é do tipo do alvo. O sangue de Lupino continua duplamente potente, e os outros tipos de sangue têm seus efeitos característicos.
Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["4. Animated Weapon"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 307


4. Animated Weapon


• A arma tem vida efetiva de cinco turnos de combate por sucesso obtido na criação.
• A parada de dados de ataque da arma é igual a Raciocínio + Ocultismo do conjurador, e sua parada de dano é igual ao nível de Taumaturgia dele. A arma sempre mira o coração (dificuldade 9). Se a arma for de madeira, use as regras de empalamento (pág. 348) para julgar o sucesso. São necessários três sucessos numa rolagem de Destreza (dificuldade 8) para remover lascas de madeira animadas do coração de uma vítima sem deixar estilhaços para trás.
• A velocidade máxima de movimento da arma é 30 metros por turno, e ela só pode executar ações de atacar ou de se mover na direção do alvo. A arma não pode esquivar nem dividir a parada de dados para realizar múltiplos ataques.
• A arma tem três níveis de Vitalidade, e a dificuldade dos ataques dirigidos contra ela aumenta em três, por causa de seus padrões espásticos de movimento.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["4. Baleful Doll"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 181


4. Baleful Doll


Uma boneca malfazeja é uma figura poderosa ligada diretamente ao espírito do alvo. Essa boneca precisa ser feita à mão e só fica pronta quando pintada com o sangue do necromante e vestida com alguma peça de roupa da vítima (que deve estar suja para uma conexão melhor). Uma vez amaldiçoada a boneca, o vampiro pode usá-la para causar dano físico ao alvo. Se a boneca for ferida (muitas vezes com alfinetes ou outros itens), a vítima sofre seis dados de dano contusivo. Se a boneca for destruída, o alvo sofre seis dados de dano letal.
O necromante precisa confeccionar a boneca, usando cânticos rituais durante todo o processo. Isso normalmente leva de quatro a cinco horas. O jogador rola Vigor + Ofícios (dificuldade 8) para ter êxito nesta parte do ritual — uma boneca que não se pareça com sua vítima é inútil para os fins deste ritual, embora alguns necromantes vendam os fracassos a turistas como “autênticas bonecas de vodu”.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["4. Baron Zaraguin’s Sting"] = {
					pt = [==[Rites of Blood, pág. 66


4. Baron Zaraguin’s Sting


Sistema: Para cada dois sucessos (arredondados para cima) obtidos no ritual, a vampira sofre um nível de dano letal das ferroadas de escorpião. Esse dano não pode ser absorvido, mas pode ser curado normalmente. Em troca de se submeter às ferroadas dos escorpiões, porém, a vampira também ganha a bênção do Barão Zaraquin por uma noite para cada sucesso. Durante esse tempo, a dificuldade de todas as rolagens para influenciar sobrenaturalmente a feiticeira (como Dominação ou Majestade) ou para ler sua aura ou sua mente aumenta para 9. Além disso, qualquer personagem que tente usar tais poderes contra a feiticeira sofre um ponto não absorvível de dano psíquico contundente para cada 1 obtido na tentativa. Se essa rolagem sofrer falha crítica, o dano é letal e a personagem ainda tem uma breve visão de um escorpião espiritual gigante, manifestação do Barão Zaraguin, cuja cauda a atinge na testa pela afronta.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Bastone Diabolico"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 181


4. Bastone Diabolico


Conjurar este ritual é complicado porque exige a remoção de um osso da perna de uma pessoa viva. O doador precisa sobreviver à remoção, ao menos por um tempo. O osso é então submerso em chumbo derretido. Uma vez frio, o fino revestimento de chumbo é inscrito com várias runas. O necromante então usa esse osso revestido de metal para espancar o doador até a morte enquanto repete um cântico grego monótono.
Com uma rolagem bem-sucedida, este ritual produz um bastone diabolico, ou “bastão do diabo”. O bastão pode ser ativado por qualquer um que o segure e gaste um ponto de Força de Vontade. A ativação dura uma cena e, durante esse tempo, qualquer fantasma atingido pelo bastão do diabo perde um ponto de sua reserva de Paixão (ver p. 385). Além de seus efeitos normais, este porrete causa um dado adicional de dano quando usado contra os mortos-vivos ambulantes (não vampiros), e esse dano é agravado.
Infelizmente para o necromante, fantasmas percebem que o bastone diabolico é má notícia, mesmo que não saibam exatamente o que a coisa faz. Eles tendem a se manter longe de quem carrega um, o que significa que todas as rolagens desse personagem para usar poderes que invocam ou atraem fantasmas ocorrem com +1 de dificuldade.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["4. Bone of Lies"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 237


4. Bone of Lies


Sistema: O osso imbuído deste poder mágico precisa ter ao menos 200 anos e precisa absorver 10 pontos de sangue na noite em que o ritual é conjurado. Cada mentira que quem o segura deseja contar consome um desses pontos de sangue, e ele precisa dizer a verdade imediatamente em seguida. Quando todos os 10 pontos de sangue tiverem sido consumidos, a magia do osso deixa de funcionar.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Boukephos’ Gateway"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 37


4. Boukephos’ Gateway


Sistema: O Místico do Abismo passa uma noite inteira encarando um espelho, com apenas escuridão sendo refletida de volta. No decorrer da noite, precisa gastar três pontos de Força de Vontade e então obter sucesso numa rolagem de Convicção (dificuldade 8) na qual não se pode gastar Força de Vontade. O vampiro permanece no lugar, encarando o espelho, mesmo depois de o sol nascer. Outros três pontos de Força de Vontade precisam ser gastos, e outra rolagem de Convicção precisa ser feita (dificuldade 9), na qual não se pode gastar Força de Vontade temporária. Na noite seguinte, o vampiro se afasta do espelho tendo contemplado o Abismo e a própria alma vazia. Se for bem-sucedido, o Cainita ostenta um largo sorriso e passa a seguir o Caminho do Abismo. Além disso, gasta um ponto de sangue a menos em poderes de Obtenebração para sempre. Numa falha, o vampiro nunca poderá passar ao Caminho do Abismo, mas pode tentar o ritual de novo pelo benefício de Obtenebração. Uma falha crítica faz o vampiro cair direto em torpor, do qual só o vitae de um Lasombra de Geração inferior pode despertá-lo. Ele nunca mais pode tentar o ritual e ganha um Distúrbio.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["4. Cadaver’s Touch"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 182


4. Cadaver’s Touch


Entoando cânticos por três horas e derretendo uma boneca de cera com a forma do alvo, o necromante transforma um alvo mortal numa ruína cadavérica. À medida que a boneca perde o último resto de sua forma, o alvo fica frio e pegajoso. Seu pulso fica fraco e filiforme, e sua carne pálida e gredosa. Para todos os efeitos, ele se torna um fac-símile razoável dos mortos-vivos ambulantes. Isso pode ter efeitos adversos em situações sociais (+2 de dificuldade em todas as rolagens Sociais). Os efeitos do ritual só passam quando a cera da boneca é deixada solidificar. Se a cera for deixada evaporar por fervura, o feitiço é rompido.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["4. Candle of Haunting"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 308


4. Candle of Haunting


Numa noite de sexta-feira, o conjurador cria uma vela negra incorporando o cérebro e os ossos de um morto com nove pitadas de terra de cemitério. Queimando a vela por 20 minutos a cada noite enquanto agarra e se concentra num item que já pertenceu ao alvo, o conjurador atormenta a vítima com atividade semelhante à de um poltergeist, como objetos arremessados ou móveis que se movem para derrubá-la. A vela é grande o bastante para queimar um número de períodos de 20 minutos igual aos sucessos do conjurador na rolagem de conjuração. Cada incremento de 20 minutos custa ao conjurador um ponto de sangue. Um único sucesso lança o poltergeist contra a vítima por 24 horas. O poltergeist tem Intimidação 4 e Pavor 4 (cada ponto de Pavor acrescenta um dado às tentativas de assustar), Força 2 e uma parada de 4 dados para suas travessuras e ataques. Para assustar o alvo, o poltergeist precisa fazer uma rolagem contestada usando Pavor + Intimidação contra Autocontrole ou Instinto + Coragem da vítima. Com cinco ou mais sucessos, o cabelo do alvo fica branco e, se for mortal, ele pode muito bem ter um ataque cardíaco. O poltergeist tenta causar dano grave pelo menos uma vez a cada noite em que atormenta o alvo, usando o que encontrar à mão. Se a força fantasmagórica empurrar o alvo enquanto ele desce uma escadaria íngreme, ou atirar algo enquanto ele cavalga ou conduz uma carruagem, é provável que o alvo se fira gravemente.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["4. Directing Ahriman’s Lance"] = {
					pt = [==[Rites of Blood, pág. 163


4. Directing Ahriman’s Lance


Sistema: Para determinar quanto tempo o ritual dura, a ashipu precisa primeiro usar o ritual Horóscopo contra o alvo ou, se a data de nascimento e a data de morte do alvo forem desconhecidas, ela pode levantar um horóscopo para o assassino que empunhará o talismã. No segundo caso, só aquele assassino pode se beneficiar das propriedades do talismã; no primeiro, qualquer um pode usar o talismã. Quando o Horóscopo é usado em conjunto com este ritual, o talismã funciona por um número de noites igual aos sucessos rolados no Horóscopo. Durante esse tempo, qualquer rolagem feita pelo portador do talismã que o aproxime de matar o alvo se beneficia de uma redução de dificuldade igual aos sucessos rolados neste ritual.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["4. Dismemberment of Osiris"] = {
					pt = [==[Rites of Blood, pág. 167


4. Dismemberment of Osiris


Sistema: Os resultados ficam em grande parte a critério do Narrador, influenciados pelo êxito do ritual. Como regra geral, presuma que cada sucesso na rolagem resulta numa redução cumulativa de 10% no tamanho e nos recursos do grupo alvejado.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["4. Evoke the Storm"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 52


4. Evoke the Storm


Sistema: Para ativar os poderes conferidos por este rito, o Cainita precisa se postar num lugar elevado e aberto, de onde o horizonte inteiro possa ser visto sem obstrução, como um penhasco ou um grande castelo. Desse ponto, o koldun pode convocar vendavais e tempestades em qualquer lugar que consiga ver, parando um pouco antes de furacões. Os efeitos deste poder são determinados pelo jogador, com a concordância do Narrador. Este rito permanente é revogado se o praticante algum dia ficar acordado depois do amanhecer.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["4. Firewalker"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 238


4. Firewalker


Sistema: Cortar o próprio dedo não causa nível nenhum de dano, mas dói pra caramba e exige uma rolagem de Força de Vontade para ser feito. Este ritual pode ser conjurado em outros vampiros (às custas das pontas dos dedos do conjurador...). Se o sujeito não tiver Fortitude, ele pode absorver fogo com seu Vigor durante a duração deste ritual. Se o vampiro tiver Fortitude, ele pode absorver fogo com Vigor + Fortitude durante a duração do ritual. Este ritual dura uma hora.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Heart of Stone"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 238


4. Heart of Stone


Sistema: Este ritual exige nove horas (reduzidas em uma hora para cada sucesso). Só pode ser conjurado em si mesmo. O conjurador se deita nu sobre uma superfície plana de pedra e coloca uma vela nua sobre o coração. A vela se consome inteiramente ao longo do ritual, causando um nível de dano agravado (dificuldade 5 para absorver com Fortitude).
Ao fim do ritual, o coração do conjurador endurece em pedra. O conjurador ganha um número de dados adicionais igual ao dobro de seu valor de Taumaturgia para absorver qualquer ataque que mire seu coração e fica completamente imune aos efeitos de uma Haste do Repouso Tardio (ver p. 237). Além disso, a dificuldade para usar Presença ou outros poderes de manipulação emocional sobre ele aumenta em três, por causa de seu isolamento emocional. As desvantagens são as seguintes: os valores de Consciência/Convicção e Empatia do conjurador caem para 1 (ou para 0, se já estavam em 1) e todas as paradas de dados para rolagens Sociais, exceto as que envolvam Intimidação, são reduzidas à metade (inclusive as necessárias para usar Disciplinas). Todas as Qualidades do personagem relativas a interação social positiva são neutralizadas. O Coração de Pedra dura enquanto o conjurador desejar.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Houngan’s Doll"] = {
					pt = [==[Rites of Blood, pág. 62


4. Houngan’s Doll


Sistema: Os requisitos para construir uma Houngan’s Doll são idênticos aos da Baleful Doll. A Baleful Doll, porém, é um item de uso instantâneo — a criadora modela a boneca, executa o ritual e inflige o dano que consegue. A Houngan’s Doll, por outro lado, dura até ser destruída (o que não tem efeito sobre o alvo). Uma vez por semana, o Anarquista pode conjurar o ritual, que começa quando ele acende uma vela votiva e a põe para flutuar num copo contendo um ponto de sua vitae. Se o ritual for bem-sucedido, então até a chama se apagar (normalmente 30 minutos, a menos que o ritual seja interrompido de alguma forma), qualquer sensação física imposta à boneca é sentida por simpatia pelo alvo. Durante esse tempo, o feiticeiro só vê e ouve o que o alvo vê e ouve, então ele precisa ter o cuidado de deixar quaisquer ferramentas ou instrumentos onde possam ser achados pelo tato. O feiticeiro fica cego e surdo ao próprio ambiente enquanto o ritual durar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Impregnable Soul"] = {
					pt = [==[Rites of Blood, pág. 104


4. Impregnable Soul


Ritual de Necromancia de Nível Quatro. Tido como roubado de um mago mortal de nome Eochar, este ritual protege o usuário contra possessão por fantasmas, entidades infernais ou outros poderes espirituais. Consta que Eochar usava esta magia para proteger a si e a seus alunos das maquinações dos mortos. Enquanto este ritual estiver ativo, o corpo do necromante não pode ser tomado, nem sua alma pode ser arrancada de sua carne. Poderes que comandam a mente (como Dominação) continuam eficazes. Este ritual pode ser conjurado sobre outros mas, se for feito sem a permissão deles (por exemplo, para impedir um inimigo de ativar Projeção Psíquica, Subjugar o Espírito ou Possessão), o ritualista precisa ter um pouco do cabelo do alvo, gastar um ponto de Força de Vontade e obter sucesso numa rolagem de Manipulação + Ocultismo, enquanto o sujeito rola sua Força de Vontade numa ação resistida (dificuldade 7 para cada um). Uma vez ativado, o Impregnable Soul permanece até ser cancelado pelo usuário ou até o nascer do sol seguinte.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["4. Infirm Inert"] = {
					pt = [==[Rites of Blood, pág. 152


4. Infirm Inert


Sistema: Enfermo Inerte cria um veneno de contato com a pele que só pode ser usado uma vez antes de se tornar inerte. Se o veneno não for usado até o fim da noite, o poder do ritual se esvai e o veneno se torna inútil. A taumaturga precisa aplicar o veneno místico na própria pele (ela é imune) e então tocar o alvo pretendido. O Narrador pode exigir uma rolagem para tocar a vítima, conforme as circunstâncias.
Ao contato com a pele, Enfermo Inerte cancela temporariamente a capacidade de cura da vítima, embora ela possa não perceber isso até tentar ativamente usar seu sangue para se curar. Vítimas podem gastar um ponto de Força de Vontade para ignorar este efeito por um turno. Quando este ritual expira, todos os ferimentos podem ser curados conforme o tipo de dano sofrido, normalmente. Cada sucesso na rolagem de ativação do ritual acrescenta uma noite adicional de eficácia ao veneno. Os efeitos deste veneno místico podem ser anulados pelo ritual Pureza da Carne (V20, p. 232).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Innocence of the Child’s Heart"] = {
					pt = [==[Rites of Blood, pág. 152


4. Innocence of the Child’s Heart


Sistema: A Inocência do Coração da Criança exige o sacrifício ritualístico de uma criança mortal e a colheita de seu coração. A taumaturga precisa mergulhar um brinquedo querido que pertenceu à criança no sangue do coração. O brinquedo absorve depressa todo o sangue até parecer limpo de novo. Enquanto a conjuradora carregar o brinquedo, sua aura será de um branco puro, imaculada por qualquer sinal de vampirismo. A duração do efeito é de uma semana, mais uma semana adicional por sucesso na rolagem de ativação. Este ritual horrível impõe um custo extremo à Humanidade da conjuradora.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Invisible Chains of Binding"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 308


4. Invisible Chains of Binding


Este ritual permite ao conjurador criar uma força sobrenatural que mantém um alvo imóvel com correntes invisíveis e intangíveis. O conjurador precisa fazer gestos amplos com as mãos, mas nenhum componente material é exigido, e ele pode executar o ritual instantaneamente. O alvo pode tentar se mover, mas as correntes exigem que ele obtenha dois sucessos num único turno numa rolagem de Força (mais Potência, se houver) (dificuldade 8) para se romperem. Um número de alvos igual ao Ocultismo do conjurador pode ser acorrentado pelo ritual.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["4. Lord Aludian’s Orifices"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 37


4. Lord Aludian’s Orifices


Sistema: A Cainita precisa se recolher por uma hora num Oubliette, ou numa caverna subterrânea, numa noite de lua cheia. Nesse tempo, precisa forçar vitae para dentro de cada um de seus orifícios, até que inchem e corem de vida, ao custo de dois pontos de sangue. A vampira então faz uma rolagem de Vigor + Medicina (dificuldade 6); o sucesso faz o sangue enegrecer e formar pequenos portais para o Abismo. A falha não produz efeito, enquanto uma falha crítica causa à vampira dois níveis de dano agravado, que podem ser absorvidos com Fortitude. Qualquer ser que introduza algo dentro de um dos orifícios — durante o sexo, por exemplo — perde um ponto de sangue por turno. Uma rolagem reflexiva de Percepção + Vigilância percebe isso, exigindo cinco sucessos menos o sangue perdido (mínimo de um). Tentar extrair a parte penetrante causa um nível de dano agravado por turno enquanto a Mística do Abismo agarrar a presa com sucesso. É possível consumir uma vítima por completo dessa forma, devorando seu corpo enfraquecido por um orifício ligado ao Abismo.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["4. Maw of Ahriman"] = {
					pt = [==[Rites of Blood, pág. 38


4. Maw of Ahriman


Sistema: A conjuradora pode consumir qualquer coisa que caiba em sua boca, erradicando o item (ou criatura, ou parte de criatura) por completo ao absorvê-lo no Abismo. Morder um oponente causa dano agravado como uma mordida padrão, mas também remove um ponto permanente de Força de Vontade do total do oponente. A Força de Vontade perdida dessa forma não pode ser recuperada por um mês lunar. Os efeitos deste ritual duram até o nascer do sol seguinte, ou a conjuradora pode encerrá-lo a qualquer momento.
Efeito Colateral: A conjuradora não pode falar nem usar de outra forma as cordas vocais, a boca, a língua ou as presas pela duração dos efeitos deste ritual.
Rituais Abissais (pág. 37): Os rituais a seguir não seguem as mesmas regras de outras formas de magia, em grande parte porque se apoiam numa Disciplina que não é de fato uma forma de feitiçaria. Para aprender Misticismo do Abismo, o Cainita precisa ter ao menos um ponto em Obtenebração e um ponto em Ocultismo. Essa personagem não pode aprender rituais do Abismo de nível superior ao seu Obtenebração ou ao seu Ocultismo (o que for menor). Conjurar rituais do Abismo exige uma rolagem bem-sucedida de Raciocínio + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para o ritual dar certo. Diferentemente dos rituais normais, cada ritual de Misticismo do Abismo custa 3 vezes o nível do ritual em pontos de experiência para ser aprendido. Todos os rituais de Misticismo do Abismo também têm efeitos colaterais permanentes; em nenhuma circunstância os Defeitos obtidos desses efeitos colaterais recompensam o vampiro com pontos de bônus ou de experiência, nem podem ser comprados de volta.]==],
				},
				["4. Mirror Walk"] = {
					pt = [==[Rites of Blood, pág. 152


4. Mirror Walk


Sistema: A taumaturga precisa criar dois espelhos idênticos de tamanho apropriado feitos com prata. Precisa embeber ambos os espelhos em dois pontos do próprio sangue e entoar cânticos sobre sua criação por três noites, para criar uma ligação de ressonância especial entre os dois objetos. Uma vez concluído, a taumaturga pode se postar diante de qualquer um dos espelhos e recitar a senha mística para abrir um portal mágico entre os dois espelhos. Magia tão poderosa não pode ser feita depressa: são necessários três turnos para o portal se abrir. O vidro ondula e cintila quando está pronto, e então a conjuradora pode atravessar. Ela pode levar um passageiro consigo nessa viagem, mas precisa agir rápido, pois o portal se fecha depois de 2 turnos. Se a taumaturga ou seu passageiro se atrasar, eles podem ficar presos entre os locais e perdidos noutro plano.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Non-Disclosure Clause"] = {
					pt = [==[Rites of Blood, pág. 69


4. Non-Disclosure Clause


Sistema: Um sucesso basta para preparar a informação a ser baixada pela destinatária. Três sucessos são necessários para preparar a desinformação de reserva, que a destinatária acreditará ser verdade assim que for capturada e o dispositivo de segurança for disparado.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Peek Past the Shroud"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 182


4. Peek Past the Shroud


Este ritual de uma hora encanta um punhado de fungo de esporão de centeio para agir como catalisador da segunda visão. Ao comer uma pitada do fungo, um sujeito ganha os benefícios da Visão da Mortalha (p. 163) por um número de horas igual ao valor de Vigor do necromante. Três doses do esporão encantado são criadas para cada sucesso na rolagem. O esporão de centeio é normalmente venenoso em algum grau; este ritual remove suas propriedades tóxicas. Porém, uma falha crítica torna o esporão altamente e instantaneamente tóxico, infligindo oito dados de dano letal a qualquer sujeito que o ingira — inclusive vampiros.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["4. Point of the Needle"] = {
					pt = [==[Rites of Blood, pág. 90


4. Point of the Needle


Sistema: Até o nascer do sol seguinte, o necromante pode executar um único uso de “Definhamento” sobre um alvo (V20, pág. 472), usando os mesmos sistemas descritos para o poder original, mas com uma picada da agulha substituindo o ataque de toque.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["4. Preservation of the Sanguine Heart"] = {
					pt = [==[Rites of Blood, pág. 27


4. Preservation of the Sanguine Heart


Sistema: O taumaturgo precisa ungir a testa do alvo com um ponto da vitae do conjurador e então lhe passar um cálice preparado com uma gota de mercúrio. Ela precisa beber o metal e sofrer um ferimento agravado nos órgãos internos enquanto o mercúrio recobre seu interior com uma barreira mística. Depois disso, o alvo fica magicamente protegido contra ser vinculada pelo sangue ou contra os efeitos da Vaulderie (incluindo receber a Marca do Traidor, no caso de alguns Tremere antitribu) por um dia para cada sucesso obtido na rolagem de ativação. Essa proteção tem um preço alto. Além do ferimento agravado, o alvo não pode se alimentar de sangue sem cancelar voluntariamente o ritual.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Rebirth in the Light of Haqim"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 43


4. Rebirth in the Light of Haqim


Cada Assamita é iniciado no clã após o Abraço com sangue da poça coletiva. Sua cabeça é ungida com o sangue e seu verdadeiro propósito a chama. É só nesse momento que ela é plenamente acolhida como guerreira, feiticeira ou vizir, pois o sangue do clã inteiro decide seu destino. Muitos consideram isso a vontade de Haqim.
Este renascimento rompe quaisquer laços de sangue existentes. Também pode, na prática, mudar as Disciplinas de Clã da personagem: quaisquer Disciplinas que passem a ser fora de clã acumulam uma “dívida de experiência” que precisa ser quitada com os pontos de experiência que forem entrando. As Disciplinas recém-tornadas de clã são compradas a custo de clã.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["4. Reflections of Hollow Revelation"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 273


4. Reflections of Hollow Revelation


Sistema: A conjuradora convoca um Noturno (ver pág. 228) e dobra a forma dele à sua vontade, forçando-o a se contrair numa esfera que caiba nas duas mãos. Para tentar isso, a conjuradora rola Percepção + Ocultismo, dificuldade 7. Uma falha crítica deixa a personagem exaurida pela tentativa — ela rola dois dados a menos em todas as rolagens pelo resto da cena. Numa falha, o Noturno se expande e age como agiria normalmente. Num sucesso, o Noturno se torna uma janela fixa sobre qualquer objeto, lugar ou pessoa que a conjuradora já tenha testemunhado pessoalmente. Essa janela permanece aberta pelo resto da cena, ou até o alvo se afastar das imediações dela. Manter a janela, porém, exige concentração: a conjuradora perde dois dados das paradas de Prontidão enquanto a janela estiver ativa.
Qualquer personagem com Obtenebração ou com habilidades que ampliem os sentidos sobrenaturalmente, como Auspícios, pode rolar Percepção + Ocultismo (dificuldade 8) para detectar o olhar vigilante das sombras ao seu redor.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["4. Return of the Heart"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 310


4. Return of the Heart


Ritual Assamita. Os Cainitas alvejados por este ritual têm devolvida a si a porção da alma que vinha morrendo lentamente. Invocar este poder exige uma quantidade do sangue do alvo e leva cinco minutos de conjuração. Se for bem-sucedido, o alvo passa a ser temporariamente regido pela Hierarquia dos Pecados do Caminho da Humanidade como se tivesse Caminho 9, forçando o Cainita a fazer testes de Degeneração e a ser tomado de culpa pelos atos mais insignificantes. Isso não confere de fato Caminho da Humanidade 9 ao alvo; o sujeito continua com o nível de Caminho que normalmente teria, mas deixa de estar insensível às crueldades do mundo. Este poder dura uma hora por sucesso na rolagem do ritual.
Rituais de clã (pág. 302): Os rituais de clã são segredos ciosamente guardados, jamais compartilhados com quem não pertence ao clã ou linhagem que abriga seus mistérios.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["4. Ritual of Xipe Totec"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 182


4. Ritual of Xipe Totec


Para realizar o ritual, o Membro remove a camada superior de pele de sua vítima com uma adaga de obsidiana, tomando cuidado para danificar a pele o mínimo possível no processo. A vítima precisa sobreviver a esse processo (embora possa muito bem morrer de perda de sangue logo após o ritual, se não for devidamente cuidada). Ele então drena o sangue da vítima numa grande tigela cerimonial de ouro. Ali o sangue é misturado a octli, flor de amaranto e outros ingredientes. Quando ingerida pelo necromante, essa mistura o faz transpirar um brilho reluzente de sangue (equivalente a um ponto de sangue). O Membro então veste a pele de sua vítima, que, numa rolagem bem-sucedida, absorve a vitae Membro e começa a cicatrizar, formando uma segunda pele sobre a do próprio vampiro. A vítima precisa ser de estatura semelhante — do contrário, as feições ficam distorcidas e o disfarce se torna inútil. Este poder também não tem efeito sobre criaturas sobrenaturais (embora possa afetar carniçais).
Sob escrutínio visual normal, o ardil é impecável. É claro que ele não transmite nada do conhecimento ou dos trejeitos da vítima (e nada faz para mascarar a própria natureza morta-viva do Membro). Portanto, funciona melhor em situações em que o contato com amigos e família possa ser minimizado. Para preservar a condição da pele, o Membro precisa banhá-la em um ponto de vitae todas as noites. Quando o necromante remove a pele (o que causa um nível de dano letal inabsorvível ao usuário e precisa ser feito com a mesma faca usada para esfolar a vítima originalmente), ela é arruinada no processo.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["4. Scry"] = {
					pt = [==[Rites of Blood, pág. 153


4. Scry


Sistema: Uma vez a tigela e a água preparadas conforme as especificações, a taumaturga precisa se concentrar por um minuto antes de tentar a vidência sobre o alvo. Este ritual dura um número de horas igual aos sucessos da rolagem de ativação. A taumaturga só precisa se concentrar durante essa duração para ver cenas através da água. Se um local for o centro da Vidência, esse local não pode ser mudado durante a duração do ritual. A conjuradora não pode usar poderes de Auspícios, Taumaturgia ou Disciplinas mentais semelhantes através da Vidência.
Se a conjuradora estiver tentando a vidência sobre um item ou lugar, ela precisa ter familiaridade suficiente com ele para ter formado um vínculo psíquico. Se a conjuradora pretende a vidência sobre uma pessoa, ela pode ter em sua posse um objeto com ressonância psíquica com o alvo (p. 133).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Scrying Pool"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 51


4. Scrying Pool


Sistema: Ao dizer o nome de alguém que conhece, a koldun pode ver imediatamente o que essa pessoa está fazendo ao contemplar a água. A capacidade de ativar os poderes do rito só é encerrada se o alvo do escrutínio for informado de que alguém o está espionando. Essa acusação pode não ter relação alguma com a koldun.
Aprender e praticar kraina (pág. 48): Todo rito de kraina precisa ser ensinado por um Cainita, um mentor espiritual ou um demônio. O vampiro que aprende ritos precisa ter o mesmo nível em Koldunismo e na kraina correspondente. Para aprender ritos de kraina, o jogador precisa rolar Inteligência + Ocultismo (a dificuldade é o nível do rito + 4) e sacrificar os pontos de sangue e Força de Vontade indicados abaixo. Os ritos de kraina precisam ser praticados num local predominantemente dotado do foco do rito, como uma floresta ou um rio; esses locais não podem ser deixados depois de o rito começar, e, se o rito for interrompido, as exigências da rolagem estendida se reiniciam. Praticar ritos de kraina exige que a líder do rito role dados iguais ao seu Ocultismo mais o Atributo designado pelo rito. A dificuldade é o nível do rito + 4, e cada assassinato cometido no local do ritual reduz a dificuldade em 1, até o mínimo de 3. Cada Cainita adicional que participe do ritual contribui com dados iguais ao seu Ocultismo e está sujeito às exigências de sacrifício de sangue e Força de Vontade do rito. Retirar dois dados da parada reduz em um o número de sucessos exigidos, até o mínimo de um; esses dados ficam fora da parada nas rolagens seguintes da tarefa estendida. Cada vez que a líder do rito rola os dados, cada participante perde um ponto de sangue além do número comprometido com a prática do rito. Se o rito for abortado ou fracassar, o custo inicial de sangue e Força de Vontade é descontado por inteiro da líder do rito, além do que já foi perdido.
Nível 1 — custo para aprender 1s + 1FV — custo para praticar 3s + 2FV — 5 sucessos exigidos
Nível 2 — custo para aprender 2s + 2FV — custo para praticar 6s + 4FV — 10 sucessos exigidos
Nível 3 — custo para aprender 3s + 3FV — custo para praticar 9s + 6FV — 15 sucessos exigidos
Nível 4 — custo para aprender 4s + 4FV — custo para praticar 12s + 8FV — 20 sucessos exigidos
Nível 5 — custo para aprender 5s + 5FV — custo para praticar 15s + 10FV — 25 sucessos exigidos
s = pontos de sangue. FV = pontos de Força de Vontade]==],
				},
				["4. Splinter Servant"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 238


4. Splinter Servant


Sistema: O ritual exige 12 horas para ser conjurado, menos uma por sucesso, e o servo precisa ser criado como descrito acima. Quando a amarração é arrancada, o personagem que a segura precisa apontar o servo para seu alvo e ordenar verbalmente que ataque no mesmo turno. Se essa ordem não for dada, o servo ataca o ser vivo ou morto-vivo mais próximo, geralmente o infeliz que o carrega no momento.
Um Servo de Lascas sempre mira o coração. Tem parada de ataque igual a Raciocínio + Ocultismo do conjurador, parada de dano igual ao valor de Taumaturgia do conjurador e deslocamento máximo de 30 metros por turno. Note que esses valores são os do conjurador que criou o servo, não os do indivíduo que o ativa. Um Servo de Lascas não pode voar, mas pode saltar todo o seu deslocamento a cada turno. Toda ação que ele toma é atacar ou se mover em direção ao alvo; ele não pode esquivar nem dividir sua parada de dados para realizar múltiplos ataques. O servo faz ataques normais de estaca mirando o coração (dificuldade 9), e seu êxito é julgado conforme as regras de um estaqueamento normal (ver p. 280). Um Servo de Lascas tem três níveis de vitalidade, e ataques dirigidos contra ele são feitos com +3 de dificuldade, por causa de seu tamanho pequeno e de seus padrões erráticos de movimento.
Um Servo de Lascas tem vida efetiva de cinco turnos de combate por sucesso rolado em sua criação. Se não tiver empalado a vítima até o último turno de sua vida, o servo desaba num monte de lascas comuns e inanimadas. Três sucessos numa rolagem de Destreza (dificuldade 8) são necessários para remover um Servo de Lascas do coração de uma vítima sem deixar para trás fragmentos da estaca.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Stolen Kisses"] = {
					pt = [==[Rites of Blood, pág. 153


4. Stolen Kisses


Sistema: A taumaturga precisa primeiro fazer uma pequena incisão em seu corpo, no ponto onde pretende fazer contato físico com um recipiente. Uma vez conjurado o ritual, a ferida se fecha e então se abre para criar um orifício místico de lábios e boca que, quando pressionado contra a carne de um recipiente, bebe um ponto de sangue a cada dois turnos da vítima, enquanto o contato persistir. Depois que o segundo ponto de vitae é consumido, o recipiente provavelmente se sentirá zonzo, e tomar cinco pontos de sangue pode fazer a vítima desmaiar pela falta substancial de sangue em seu corpo. Beijos Roubados permanece ativo por uma noite. Note que o taumaturgo não causa êxtase ou arrebatamento ao tomar sangue desse modo, como causaria se se alimentasse de um recipiente normalmente.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Summon Ethereal Horde"] = {
					pt = [==[Rites of Blood, pág. 89


4. Summon Ethereal Horde


Sistema: Ao fim do cântico, se o ritual for bem-sucedido, o número de sucessos obtidos determina quantos zangões (fantasmas sem mente, e não espectros plenos) o necromante pode convocar. Esses fantasmas aparecem como imagens etéreas de guerreiros mortos há muito. Embora não possam se materializar por completo no mundo físico, podem usar seus próprios poderes para arremessar objetos ou espantar atacantes, em defesa do necromante. Os fantasmas voltam a seu repouso no nascer do sol seguinte.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["4. Summon the Blood Imp"] = {
					pt = [==[Rites of Blood, pág. 27


4. Summon the Blood Imp


Sistema: Summon the Blood Imp exige que o taumaturgo costure cadáveres frescos (de até três dias) de animais e humanos numa assustadora criação humanoide. O diabrete de sangue tem uma astúcia animal e um vínculo empático com seu mestre que lhe permite compreender inatamente as necessidades e desejos dele. Em seguida, o conjurador precisa acrescentar seis pontos de sangue Tremere à mistura e deixá-la fermentar ao longo de três noites.
Serviço tão devotado não vem sem custo. O diabrete de sangue exige certa dose de atenção, sob pena de ficar rancoroso. Nada é mais frustrante que um diabrete de sangue irritado atrapalhando rituais importantes ou quebrando artefatos inestimáveis num acesso de raiva. Diabretes de sangue precisam ser alimentados regularmente com vitae e carne.
Um diabrete de sangue pode lutar, mas não com tremenda eficácia; ainda assim, ele se destrói se necessário para proteger seu criador. Também pode empurrar ou carregar objetos pequenos e é um espião eficaz (embora deteste ficar longe de seu mestre por longos períodos). Diabretes de sangue são feridos pela luz do sol e pelo fogo como os Membros, e também podem ser destruídos por completo com imersão em água sagrada.
Mais informações sobre as capacidades de um diabrete de sangue estão na pág. 108.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. The Curse Belated"] = {
					pt = [==[Rites of Blood, pág. 151


4. The Curse Belated


Sistema: A taumaturga precisa primeiro preparar um ferro de marcar com seu sigilo. Precisa alimentar seu carniçal com um ponto de sangue enquanto entoa a encantação, e então selar o pacto marcando seu sigilo a ferro no corpo do servo. A taumaturga perde acesso a um ponto permanente de sua reserva de sangue até que este ritual seja disparado. No momento em que o coração do carniçal para de bater, a vitae armazenada dentro do corpo dele se ativa e o ressuscita como vampiro pleno. Uma vez “Abraçado”, o sigilo desaparece e o espaço vazio na reserva de sangue da conjuradora se destrava, permitindo que ela volte a gastar aquele ponto de sangue. A conjuradora percebe imediatamente que o ritual foi disparado e que seu antigo carniçal agora está morto e pode ser sua nova cria. (Embora consiga sentir a ativação do ritual, a taumaturga pode não ter como saber se o antigo carniçal conseguiu sobreviver ao processo.)
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Ties That Bind"] = {
					pt = [==[Rites of Blood, pág. 158


4. Ties That Bind


Sistema: Por uma noite por sucesso, a koldun reduz em -1 a dificuldade de todas as rolagens relativas à Feitiçaria Koldúnica. Este ritual não pode ser realizado mais de uma vez por semana.
Mecânica de dados da Feitiçaria Koldúnica (p. 156): a rolagem para ativar um ritual de Feitiçaria Koldúnica é Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual. As conexões metafísicas da escola com Kupala e com as terras permeadas por esse espírito aumentam a dificuldade em +1 em todas as rolagens de Feitiçaria Koldúnica feitas em favor de koldun que operam sua magia fora dos territórios da Europa Oriental.]==],
				},
				["4. Track Transgressor"] = {
					pt = [==[Rites of Blood, pág. 152


4. Track Transgressor


Sistema: Para conjurar o ritual, a taumaturga precisa localizar um sítio onde Taumaturgia tenha sido conjurada nas últimas vinte e quatro horas. Precisa então derramar seu sangue (gastando um ponto de sangue) no chão enquanto recita a encantação apropriada. Pegadas sangrentas visíveis apenas à conjuradora aparecem no chão e levam até o transgressor. Depois de conjurar este ritual, a Tremere consegue rastrear o transgressor sem falhas até o amanhecer. Esse rastreamento segue o caminho exato que o mago tomou depois de deixar a área onde a magia foi usada. Este ritual só pode rastrear Taumaturgia e rituais relacionados, não Necromancia nem outros tipos de magia.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Transcending Barriers Through Love"] = {
					pt = [==[Rites of Blood, pág. 64


4. Transcending Barriers Through Love


Sistema: Para cada sucesso obtido, o feiticeiro pode fazer um de seus seguidores que seja alvo válido para este ritual perder dois pontos de sangue, recuperando um ponto de sangue para cada dois pontos perdidos. Alternativamente, para cada três sucessos obtidos, o feiticeiro pode fazer um alvo válido perder dois pontos de Força de Vontade, recuperando um ponto de Força de Vontade para cada dois perdidos. Esta segunda aplicação tem uma desvantagem: ela imediatamente liberta quem perde Força de Vontade dessa forma dos efeitos de Enfolding the Believers e, pior, dos efeitos do próprio laço de sangue. O ritual pode ter vários cultistas como alvo, mas não pode ter o mesmo cultista como alvo mais de uma vez por uso. Depois de usar este ritual, o feiticeiro não pode usá-lo de novo até ter conjurado Enfolding the Believers sobre seu culto com sucesso outra vez, ou até ter passado uma semana, o que levar mais tempo.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Unweave Ritual"] = {
					pt = [==[Rites of Blood, pág. 154


4. Unweave Ritual


Sistema: Primeiro, a conjuradora precisa descobrir qual ritual a aflige no momento. Se ela possuir o ritual, isso é automático. Do contrário, pode exigir alguma pesquisa por meio de uma rolagem de Inteligência + Ocultismo com dificuldade base 4, mais 1 para cada nível do ritual. Em seguida, a conjuradora precisa obter um componente que seria usado na conjuração do ritual ofensor e então destruí-lo de alguma forma. Seus sucessos subtraem dos sucessos obtidos pelo conjurador original; se ela conseguir eliminar todos os sucessos, o ritual ofensor termina imediatamente, com todos os efeitos concomitantes. Assim, um fim rápido para Atar a Língua Acusadora (V20, p. 230) permitiria à vítima voltar a falar mal de seus inimigos, mas um fim prematuro de um Contrato de Sangue (V20, p. 239) a empurraria dolorosamente ao torpor.
Só rituais que tenham duração podem ser desfiados. Por exemplo, uma taumaturga que se livrou de um laço de sangue por Abandonar os Grilhões (abaixo) não está constantemente sob os efeitos daquele ritual. Uma vez completo o ritual, o laço se foi e o ritual está encerrado. Porém, uma taumaturga que padeça de A Voz Engarrafada (p. 150) seria considerada sob a duração do ritual enquanto a garrafa de cristal permanecesse selada, então ele poderia ser desfiado. Note que uma taumaturga só pode desfiar um ritual sobre si mesma, não um sobre outra pessoa. Uma taumaturga que padeça de múltiplos rituais precisa desfiar cada um separadamente. Múltiplos desfiamentos podem ser acumulados contra um ritual, desde que o tempo e os componentes apropriados possam ser obtidos.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Vigil of the Stone Guardian"] = {
					pt = [==[Rites of Blood, pág. 29


4. Vigil of the Stone Guardian


Sistema: Para criar um Guardião de Pedra, o taumaturgo precisa encontrar ou criar uma aldrava apropriada (com dois olhos e uma boca) e então embebê-la em seu sangue ao longo de três noites. Depois precisa pendurá-la na porta ou no portão que se tornará o novo lar do guardião e executar o ritual. Se tiver sucesso, o guardião de pedra se funde à porta ou ao portão e não pode ser removido sem ser destruído.
O taumaturgo pode possuir o guardião à distância gastando um ponto de sangue. Uma vez possuído, o conjurador pode observar o que acontece pelo olho do guardião e falar por sua boca. Gastando um ponto de Força de Vontade, o taumaturgo pode tentar (se possuir a habilidade) usar os dois primeiros níveis de Dominação, Presença ou Demência para afugentar intrusos. Fora isso, o guardião de pedra não pode atacar fisicamente nem bloquear a entrada de invasores, mas pode abrir a porta ou o portão a comando do taumaturgo.
Tal proteção tem um custo para o taumaturgo. O Guardião de Pedra exige um ponto de sangue por noite para manter sua vigilância. Se não for alimentado, o guardião de pedra dorme até ser reativado pelo taumaturgo com um ponto de sangue.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Vision of Shadow"] = {
					pt = [==[Lore of the Clans, pág. 126


4. Vision of Shadow


Sistema: A vampira faz a rolagem de conjuração para convocar a bola de sombra que usará para espiar um alvo. Se falhar, nada acontece; mas uma falha crítica a deixa confusa e desorientada, com –2 em todas as paradas de dados pelo resto da cena.
A Cainita então se concentra numa pessoa ou local que já tenha visto. Ao fazê-lo, a bola de sombra clareia e revela uma visão daquele lugar ou pessoa naquele exato momento, com som e tudo. Precisa haver sombras perto do alvo, e a visão vem da posição mais favorável entre essas sombras. A visão pode estar em qualquer lugar num raio igual ao Obtenebração + Ocultismo da conjuradora em milhas, ou 1,5 vez esse número em quilômetros.
A visão dura uma cena, ou até o alvo deixar a área. Se o alvo tiver capacidade de sentir esse tipo de escrutínio (com Auspícios ou poder semelhante), pode tentar uma rolagem de Percepção + Ocultismo (dificuldade 8) para saber que está sendo observado.
Efeito Colateral: Olhar longe demais deixa a Cainita menos atenta ao que acontece debaixo do próprio nariz. Pelo resto da noite após conjurar este ritual com sucesso, ela sofre -2 em todos os testes de Prontidão para notar eventos próximos.
Misticismo do Abismo (pág. 125): O Misticismo do Abismo é difícil e demorado de aprender, e tem um preço. Seus rituais costumam ter efeitos colaterais que criam Defeitos que a personagem não pode remover e que não dão pontos de bônus. Para aprender o poder, o vampiro precisa ter ao menos um ponto tanto em Obtenebração quanto em Ocultismo. Ele não pode aprender rituais do Abismo de nível superior ao menor entre seu Obtenebração e seu Ocultismo, e cada ritual custa um número de pontos de experiência igual a três vezes o nível do ritual. Os rituais do Abismo são conjurados com uma rolagem de Raciocínio + Ocultismo. A dificuldade é 3 + o nível do ritual conjurado. Só um sucesso é necessário para conjurar o ritual, mas o Narrador é encorajado a tornar as penalidades da falha especialmente horríveis.]==],
				},
				["4. Vision of St. Anthony"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 294


4. Vision of St. Anthony


Com este ritual, a necromante pode conceder a outros a Visão da Mortalha (como descrita na pág. 288) por um número de horas igual ao seu Vigor. Ela encanta um punhado de trigo infectado por ergot (um tipo comum de fungo tóxico) com um ritual de uma hora. Para cada sucesso na rolagem do ritual, ela cria três doses. O encantamento remove toda a toxicidade do ergot, mas, se ela tirar uma falha crítica, cria três doses de trigo altamente tóxico que infligem oito dados de dano letal a quem o ingerir, mortal ou vampiro.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["4. Ward versus Kindred"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 239


4. Ward versus Kindred


Sistema: A Proteção contra Membros se comporta exatamente como a Proteção contra Carniçais, mas afeta vampiros em vez de carniçais. O ritual exige um ponto do próprio sangue do conjurador e não afeta o conjurador.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Ward versus Vitae"] = {
					pt = [==[Rites of Blood, pág. 158


4. Ward versus Vitae


Sistema: Membros abaixo da Geração da conjuradora que toquem a proteção sofrem dois dados de dano letal a cada vez que o fizerem. Depois do primeiro toque, porém, um Membro que queira prosseguir precisa rolar Força de Vontade (dificuldade 7) ou gastar um ponto de Força de Vontade. Cada uso deste ritual custa um ponto de sangue e só pode proteger um objeto discreto: uma única janela, uma porta, um livro ou uma porta de automóvel. Objetos maiores podem ser protegidos, mas apenas se o ritual for conjurado múltiplas vezes.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["4. Warding Circle versus Kindred"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


4. Warding Circle versus Kindred


Sistema: Como o Círculo de Proteção contra Carniçais (p. 234), mas o círculo afeta vampiros. O ritual exige o mesmo componente material da Proteção contra Membros — o próprio sangue do conjurador — porém em quantidade maior, e não afeta o conjurador. A conjuradora determina o tamanho do círculo de proteção no momento da conjuração; o raio padrão é de 3 metros, e cada aumento de 3 metros eleva a dificuldade em um, até o máximo de 9. O ritual leva o tempo normal de conjuração se for de curto prazo (durando o resto da noite) ou uma noite se for de longo prazo (durando um ano e um dia).
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Abandon the Fetters"] = {
					pt = [==[Rites of Blood, pág. 154


5. Abandon the Fetters


Sistema: O taumaturgo precisa ter um ponto de sangue de si mesmo, do servo e do senhor do sujeito. (Se o conjurador for o próprio sujeito ou o senhor, nenhum sangue adicional é necessário.) A esfoladura causa três níveis de dano agravado inabsorvível ao sujeito, à medida que a carne é arrancada ou queimada. O vapor venenoso final inflige um nível adicional de dano agravado inabsorvível tanto ao conjurador quanto ao sujeito. O sujeito perde um ponto permanente de Força de Vontade mas, se o ritual for bem-sucedido, o laço de sangue se dissipa imediatamente. Porém, isso não oferece proteção contra a formação de outro laço posterior. Abandonar os Grilhões não pode ser usado para romper o vinculum de uma Vaulderie nem os efeitos do ritual Transubstanciação dos Sete (p. 151).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Ahriman’s Wight"] = {
					pt = [==[Rites of Blood, pág. 38


5. Ahriman’s Wight


Sistema: Depois de conjurar este ritual, a personagem ganha um número de níveis de ferimento “Sombra” adicionais, no nível de Vitalidade “Ferido”, igual aos seus pontos de Obtenebração. Contudo, se a personagem sofrer um ferimento que risque um desses níveis de Vitalidade Sombra, ela também perde um número correspondente de pontos de Obtenebração. Os pontos de Obtenebração perdidos dessa forma retornam depois de uma semana.
Efeito Colateral: Enquanto este ritual estiver em vigor, todas as rolagens fracassadas que usem a Consciência/Convicção do conjurador são consideradas falhas críticas.
Rituais Abissais (pág. 37): Os rituais a seguir não seguem as mesmas regras de outras formas de magia, em grande parte porque se apoiam numa Disciplina que não é de fato uma forma de feitiçaria. Para aprender Misticismo do Abismo, o Cainita precisa ter ao menos um ponto em Obtenebração e um ponto em Ocultismo. Essa personagem não pode aprender rituais do Abismo de nível superior ao seu Obtenebração ou ao seu Ocultismo (o que for menor). Conjurar rituais do Abismo exige uma rolagem bem-sucedida de Raciocínio + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para o ritual dar certo. Diferentemente dos rituais normais, cada ritual de Misticismo do Abismo custa 3 vezes o nível do ritual em pontos de experiência para ser aprendido. Todos os rituais de Misticismo do Abismo também têm efeitos colaterais permanentes; em nenhuma circunstância os Defeitos obtidos desses efeitos colaterais recompensam o vampiro com pontos de bônus ou de experiência, nem podem ser comprados de volta.]==],
				},
				["5. Asymmetrical Reproduction"] = {
					pt = [==[Rites of Blood, pág. 109


5. Asymmetrical Reproduction


Sistema: Este ritual leva três noites para ser completado, e o conjurador precisa possuir alguma quantidade de material genético do alvo (como células de pele ou um fio de cabelo), que é destruída na conjuração. O clone criado por este ritual é um duplicado perfeito, mas vivo, de seu alvo em todos os sentidos, incluindo todas as Qualidades, Disciplinas e traços de personalidade apropriados, mas possui apenas as memórias mais rudimentares do indivíduo que replica. Ao longo dos sete dias seguintes, a psicologia do clone fica cada vez mais psicótica, e suas Disciplinas ou outros poderes (conforme o caso) ficam violentamente instáveis, até que ele se torna quase irreconhecível em relação ao estado original. Se for deixado sobreviver, em algum momento depois da sétima noite o clone parte para uma matança violenta — que só termina com sua morte, de preferência depois da morte do indivíduo que ele foi criado para substituir.
Embora o clone seja uma criatura viva (e precise comer, dormir e respirar), se for a réplica de um vampiro, ele parece um vampiro para todos os meios comuns e sobrenaturais de detecção.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. At Our Command It Breathes"] = {
					pt = [==[Rites of Blood, pág. 106


5. At Our Command It Breathes


Sistema: O custo em sangue deste ritual é de 5 pontos para cada Cainita usado na fabricação da Gárgula. Depois de três meses de conjuração, na noite final do ritual, o taumaturgo precisa fazer uma rolagem enquanto o saco fetal é aberto. A rolagem é de Inteligência + Ocultismo (dificuldade 9, mas a rolagem exige três sucessos). Subtraia um dado para cada noite em que o taumaturgo não executou seus encantamentos. Um único sucesso permite a criação de uma Gárgula (se for uma personagem de jogador, ela precisa ser construída segundo as regras padrão de criação de personagem). A tentativa de usar este ritual, bem-sucedida ou não, retira um único ponto de moralidade do total de moralidade do usuário. Não importa que trilha a personagem professe: este ritual (e as atividades exigidas para executá-lo) é profunda e absolutamente abominável. Gárgulas criadas com este ritual são inférteis e não podem Abraçar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Beckon the Ingurgitant"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 37


5. Beckon the Ingurgitant


Sistema: A vampira precisa pintar uma espiral de vitae na área-alvo, gastando dois pontos de sangue por metro nas dimensões pretendidas do vórtice. O sangue então penetra na superfície pintada, sem deixar mancha. A Cainita precisa em seguida entoar cânticos e rezar ao Abismo por uma hora, à vista da área-alvo, gastando dois pontos temporários de Força de Vontade. Por fim, precisa rolar Manipulação + Ocultismo (dificuldade 6); cada sucesso permite ao vórtice ingurgitante permanecer por dois turnos. A falha faz com que nada aconteça; uma falha crítica impede a Mística do Abismo de convocar quaisquer entidades do Abismo por sete noites. Quando alguma criatura se posta bem perto do sigilo pintado, a Mística do Abismo sente a presença dela e sabe se é mortal ou vampiro. Gastando um ponto de sangue, a vampira força o vórtice ingurgitante a se formar na superfície e atacar o que estiver por perto, estrangulando e mastigando as vítimas antes de arrastá-las ao Abismo. Quem for levado ao Abismo permanece lá por um número de noites igual ao nível de Obtenebração da Mística do Abismo, sofrendo os efeitos listados em Evocation of the Oubliette (ver V20 Dark Ages pág. 274). As estatísticas do vórtice estão na pág. 34.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["5. Blood Contract"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 239


5. Blood Contract


Sistema: Este ritual é mais bem conduzido pelo Narrador, que pode levar os signatários do contrato de sangue a cumpri-lo por quaisquer meios necessários (não é inédito que demônios se materializem e imponham a adesão a certos contratos de sangue). O único modo de encerrar o ritual é cumprir os termos do contrato ou queimar o próprio documento — tentativas de acrescentar uma cláusula proibindo a queima do contrato resultaram na combustão espontânea do contrato ao término do ritual. Um ponto de sangue é consumido na criação do documento, e um ponto de sangue adicional é consumido por quem o assina.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Bloody Mary"] = {
					pt = [==[Rites of Blood, pág. 67


5. Bloody Mary


Sistema: Se o ritual for bem-sucedido, Bloody Mary possui o corpo do mortal e fica obrigada a servir o invocador por um mês lunar. Os sucessos na rolagem determinam quão leal Bloody Mary é durante a possessão, pois ela é um espírito de violência e assassinato e agarra quase qualquer oportunidade de matar enquanto veste um hospedeiro humano. Com um sucesso, ela obedece a contragosto qualquer ordem direta e se abstém de tentar prejudicar o invocador de qualquer forma, mas não tem lealdade real. Com cinco sucessos, seu instinto é obedecer a toda ordem sem questionar e evitar qualquer atividade que possa causar problemas ao invocador mais tarde. Se houver conflito entre o instinto de Bloody Mary de mutilar e matar e as necessidades do invocador, role os sucessos do vampiro na rolagem de invocação. Se houver qualquer sucesso, o jogador decide o que Mary vai fazer.
Enquanto Bloody Mary cavalga o receptáculo mortal, ela ganha o equivalente a Potência 2 e Fortitude 2. Ela sabe tudo o que ele sabia e pode se passar por ele sem esforço. Porém, os animais têm medo instintivo de qualquer mortal cavalgado por Bloody Mary, e personagens que obtenham sucesso numa rolagem de Percepção + Empatia (dificuldade 7) o acham assustador e desagradável. Para crianças, a dificuldade é apenas 5. Declarações de amor ou afeto feitas por qualquer pessoa próxima ao mortal exigem que o jogador role um número de dados igual aos sucessos da invocação (dificuldade 7). A falha significa que Bloody Mary entra em frenesi e ataca a pessoa amada. Quando o mês de servidão acaba, Bloody Mary vai embora, deixando para trás um mortal irremediavelmente insano. Como observado, este é um ritual sombrio, e todo feiticeiro que o realiza precisa fazer uma rolagem de Consciência se sua Humanidade for dois ou mais.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Cheat the Scale of Hades"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 311


5. Cheat the Scale of Hades


Ritual dos Seguidores de Set. Este ritual permite ao feiticeiro remover inteiramente o coração (assim como outros órgãos vitais) do próprio corpo e envolve sua carne num casulo protetor. O ritual leva três horas para ser concluído e só pode ser executado sobre si mesmo na escuridão da noite, depois de a lua se pôr, antes de ela nascer, ou durante a lua nova. O jogador faz uma rolagem estendida de Destreza + Medicina (dificuldade 7). Cada rolagem representa uma hora de atividade, e o ritual termina em fracasso se a lua ou o sol nascer antes de o jogador alcançar os sucessos necessários (cinco para remover um coração, doze para atingir a forma mumificada). Qualquer vampiro que testemunhe o processo está sujeito a Rötschreck (dificuldade 6). Depois que o feiticeiro remove o coração, o fígado e o cérebro, ele cai numa espécie de torpor. Seu vitae e sua carne morta-viva se combinam para envolvê-lo num sudário seco e escamoso que deixa uma pequena abertura em volta da boca, mas é quase impenetrável no resto. Um feiticeiro assim preservado pode permanecer em estase indefinidamente, e o vampiro amortalhado fica praticamente imune a danos, como se estivesse sob os efeitos do Stone Slumber (pág. 310). Contudo, os órgãos extraídos são extremamente vulneráveis, sobretudo o coração. Destruir um órgão causa um nível não absorvível de dano agravado ao vampiro, enquanto expor o coração à luz do sol ou queimá-lo destrói o vampiro instantaneamente numa terrível imolação. Só alimentar o feiticeiro com os órgãos removidos pode despertá-lo. Depois de ingerir seus órgãos, leva um minuto para o casulo em volta dele se desfazer em pó e uma hora para ele se erguer.
É possível empreender este ritual apenas parcialmente, parando na remoção do coração. Aliás, também é possível executar a primeira parte deste ritual sobre outro Cainita. Um vampiro consegue perfeitamente se movimentar sem coração e, como benefício adicional, torna-se imune ao empalamento padrão e à diablerie. Como o coração é a sede da emoção, a dificuldade de todas as rolagens para resistir ao frenesi fica dois pontos menor. Contudo, se um inimigo se apossar do coração dela (ou se o coração for removido pelo feiticeiro), a vampira está em maus lençóis. Além de fornecer uma poderosa conexão ritual com a vampira, uma simples chama ou um lampejo de luz do sol sobre o coração destrói o Cainita de imediato. Além disso, cravar uma estaca no coração a força ao torpor, e qualquer Cainita que beba mais de dois pontos de sangue dele passa direto ao sangue do coração, reduzindo a dificuldade da diablerie para 7.
Rituais de clã (pág. 302): Os rituais de clã são segredos ciosamente guardados, jamais compartilhados com quem não pertence ao clã ou linhagem que abriga seus mistérios.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["5. Chill of Oblivion"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 183


5. Chill of Oblivion


Realizado ao longo de 12 horas (reduzidas em uma hora por sucesso na rolagem de conjuração), este ritual infunde no necromante ou num sujeito voluntário o frio do túmulo. O componente material do ritual é um cubo de gelo de meio metro, que é derretido lentamente sobre o peito do sujeito (infligindo três níveis de dano contusivo a sujeitos mortais). O sujeito precisa ficar deitado nu sobre terra nua durante toda a duração do ritual. Uma vez completo o ritual, seus efeitos permanecem por um número de noites igual ao valor de Ocultismo do conjurador.
Um indivíduo afetado pelo Frio do Olvido trata o dano agravado de fogo e altas temperaturas como se fosse dano letal. Além disso, ele pode tentar extinguir qualquer fogo rolando Força de Vontade (dificuldade 9); cada sucesso reduz em 1 a dificuldade de absorção do fogo (ver p. 297), e um fogo com dificuldade de absorção 2 se reduz a brasas.
Porém, este ritual tem vários inconvenientes. Antes de tudo, a aura do sujeito fica entremeada de veias negras retorcidas que lembram as deixadas pela diablerie, e pode muito bem ser confundida com ela por qualquer observador que não conheça este ritual. O sujeito também irradia uma aura palpável de frio que se estende cerca de um braço de distância dele; isso pode ser extremamente desconcertante para mortais, embora não cause dano, e seus efeitos em jogo espelham os dos Defeitos Toque de Gelo (p. 494) e Presença Sinistra (p. 495). Por fim, o nimbo místico do ritual atrai fantasmas hostis ao sujeito, que podem atormentá-lo com atos insalubres.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["5. Cobra’s Favor"] = {
					pt = [==[Rites of Blood, pág. 154


5. Cobra’s Favor


Sistema: Derramando um ponto de sangue num recipiente preparado e combinando-o com as ervas e o veneno necessários, a taumaturga recita uma encantação, impelindo sua magia à poção até que ela fique negra como piche. A conjuradora precisa ingerir o elixir para que o ritual faça efeito, sofrendo um nível de dano agravado inabsorvível no processo. Depois disso, pela semana seguinte, qualquer coisa que consuma o sangue da conjuradora sofre um nível de dano agravado por ponto ingerido. Cada sucesso adicional na rolagem de ativação estende a duração do ritual por mais uma semana.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Commune with the Abyss"] = {
					pt = [==[Lore of the Clans, pág. 127


5. Commune with the Abyss


Sistema: Ao conjurar este ritual, a vampira puxa para dentro de si as sombras e a escuridão ao redor. Findas elas, a vampira cai num sono profundo semelhante ao torpor, do qual não consegue despertar. A personagem pode então fazer uma pergunta, que pode ser tão banal ou tão complicada quanto ela quiser. O Narrador atribui a essa pergunta um valor de um a dez conforme o quão obscura ou difícil ela seja de responder. O valor pode até ser maior que dez, se a pergunta for verdadeiramente momentosa.
A cada noite em que a vampira permanece em seu sono torpente, ela rola Inteligência + Ocultismo (dificuldade 9) e anota seus sucessos acumulados. Quando a soma dos sucessos igualar o valor da pergunta, a vampira desperta subitamente sabendo a resposta. Essa resposta é verdadeira e completa, e não vem escondida num enigma. O Abismo apenas esconde a verdade; não a confunde nem a guarda com ciúme.
Se a vampira não obtiver sucesso algum numa das rolagens, o intervalo entre as rolagens passa de dias para semanas. A falha continuada leva esse intervalo de semanas a meses, a anos, a milênios e ainda além. Diz-se que místicos antigos jazem há séculos contemplando as questões últimas do universo. Pode até haver cultos de Gehenna à espera do despertar deles.
Misticismo do Abismo (pág. 125): O Misticismo do Abismo é difícil e demorado de aprender, e tem um preço. Seus rituais costumam ter efeitos colaterais que criam Defeitos que a personagem não pode remover e que não dão pontos de bônus. Para aprender o poder, o vampiro precisa ter ao menos um ponto tanto em Obtenebração quanto em Ocultismo. Ele não pode aprender rituais do Abismo de nível superior ao menor entre seu Obtenebração e seu Ocultismo, e cada ritual custa um número de pontos de experiência igual a três vezes o nível do ritual. Os rituais do Abismo são conjurados com uma rolagem de Raciocínio + Ocultismo. A dificuldade é 3 + o nível do ritual conjurado. Só um sucesso é necessário para conjurar o ritual, mas o Narrador é encorajado a tornar as penalidades da falha especialmente horríveis.]==],
				},
				["5. Court of Hallowed Truth"] = {
					pt = [==[Rites of Blood, pág. 155


5. Court of Hallowed Truth


Sistema: Uma vez completo o ritual, todos os que entram na sala ficam obrigados a acatar o édito de dizer a verdade que ele impõe. Nenhuma falsidade pode ser proferida, e perguntas diretas do juiz ou da autoridade que preside são respondidas com franqueza, sem omissões nem engano. A magia persiste dentro da sala pelo prazo de uma semana. Cada sucesso adicional na rolagem de ativação estende a duração do ritual por mais uma semana.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Creation of the Shabti"] = {
					pt = [==[Rites of Blood, pág. 109


5. Creation of the Shabti


Sistema: A estátua precisa ter ao menos tamanho humano (embora possa ser até três vezes maior, e pode ter forma de bípede ou de animal egípcio) e precisa ser feita com ao menos Ofícios 4 (e ser proporcionalmente cara). O jogador do taumaturgo rola Carisma + Ocultismo (dificuldade 8). Uma vez criado o shabti, o espírito permanece até a próxima vez em que seu conjurador despertar (seja no poente seguinte, seja depois de cem anos de torpor). Nesse momento, a estátua se desfaz em pó e o espírito funerário é libertado.
Independentemente de tamanho ou forma, um shabti tem quatro níveis de Vitalidade, quatro de Força de Vontade, seis pontos em cada Atributo Físico e dois pontos em todos os demais atributos. Estes constructos podem gastar um ponto de Força de Vontade para se mover a passo de caminhada por um turno; de resto, ficam parados. Não podem ser alvo de poderes mentais e sociais, com a exceção de poderes que removem o espírito (como o roubo de alma), que destroem um shabti imediatamente.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["5. Dead Man’s Hand"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 183


5. Dead Man’s Hand


A necromante toma um trapo manchado com o sangue, o suor ou as lágrimas da vítima pretendida. Ela pega uma mão humana recém-decepada (que pode vir de um cadáver ou de um “doador” vivo) e a fecha em torno do trapo. Conforme a mão se decompõe, a vítima também se decompõe. Sua carne incha, fica cinzenta e depois verde, e então começa a se desprender. O cérebro da vítima permanece fresco até o fim, de modo que ele pode ver as larvas se contorcerem na carcaça putrefata de carne que um dia foi seu corpo saudável.
A necromante faz a rolagem padrão e gasta dois pontos de sangue para cada ponto de Vigor (e Fortitude) que a vítima possua. A vítima perde níveis de vitalidade conforme a tabela abaixo. Só a remoção do trapo da mão pode deter o processo. Se isso acontecer, os níveis de vitalidade retornam, também conforme a tabela abaixo.
Escoriado — 12 horas até a próxima perda
Machucado — 12 horas até a próxima perda
Ferido — Seis horas até a próxima perda
Muito Ferido — Três horas até a próxima perda
Espancado — Uma hora até a próxima perda
Aleijado — 30 minutos até a próxima perda
Incapacitado — 12 horas até a próxima perda
Personagens mortais que sofram mais de 12 horas de incapacitação morrem, enquanto Membros que permaneçam Incapacitados por mais de 12 horas sucumbem ao torpor.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["5. Dedicate the Haven"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 310


5. Dedicate the Haven


Os refúgios dos taumaturgos costumam abrigar documentos arcanos, recursos especiais e outros bens de vulto. Para defendê-los, os taumaturgos frequentemente conjuram Proteções sobre o local. O Dedicate the Haven consolida esse processo. A conjuradora precisa levar no mínimo uma hora caminhando em círculo no sentido anti-horário em volta de todo o terreno do refúgio, carregando um turíbulo fumegante que contém uma mistura em brasa de seu sangue, incenso e sálvia. Ao concluir, a taumaturga precisa retornar ao centro aproximado do refúgio e se banhar com o restante do sangue. Uma consagração cobre um único edifício; um conjunto de casas ou uma propriedade com terreno pode exigir várias conjurações para garantir proteção adequada. Uma vez consagrado, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio (assim especificado na descrição dos rituais individuais) conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["5. Enchant Talisman"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 239


5. Enchant Talisman


Sistema: Este ritual exige seis horas por noite durante um ciclo lunar completo, começando e terminando na lua nova. Ao longo desse tempo, a vampira prepara cuidadosamente seu talismã, entalhando nele runas Herméticas que significam seu nome verdadeiro e a soma total de seu conhecimento taumatúrgico. A jogadora gasta um ponto de sangue por noite e faz uma rolagem prolongada de Inteligência + Ocultismo (dificuldade 8), uma rolagem por semana. Se o trabalho de uma noite for perdido ou se as quatro rolagens não acumularem ao menos 20 sucessos líquidos, o talismã é arruinado e o processo precisa ser recomeçado.
Um talismã completo dá ao conjurador várias vantagens. Quando a personagem está segurando o talismã, a dificuldade de toda magia que a tenha como alvo aumenta em um. A jogadora recebe dois dados extras ao rolar usos da trilha principal da personagem e um dado extra ao rolar as conjurações de ritual da personagem. Se o talismã for usado como arma, ele dá à jogadora um dado adicional para acertar. Se a taumaturga for separada de seu talismã, uma rolagem bem-sucedida de Percepção + Ocultismo (dificuldade 7) lhe dá a localização dele.
Se um talismã estiver na posse de outro indivíduo, ele dá a esse indivíduo três dados adicionais ao usar qualquer forma de magia contra o dono do talismã. A critério do Narrador, rituais que tenham o conjurador como alvo e usem seu talismã como componente físico podem ter efeitos muito ampliados.
Um taumaturgo só pode ter um talismã por vez. A posse de um talismã não pode ser transferida — cada indivíduo precisa criar o seu.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Enochian Passage"] = {
					pt = [==[Rites of Blood, pág. 104


5. Enochian Passage


Ritual de Necromancia de Nível Cinco. A vampira pode passar fisicamente para as Terras das Sombras, aparecendo nos campos diante da mística cidade de Enoch. Isso exige que ela se “mate” simbolicamente cravando uma adaga de prata no próprio coração (causando ao menos dois níveis de ferimento letal) e caindo num corpo d’água fundo o bastante para cobrir seu corpo. Os membros da Tal’Mahe’Ra usam este ritual para ir a Enoch e, por isso, protegem-no raivosamente para que não caia nas mãos de mais ninguém.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["5. Escape to a True Friend"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 239


5. Escape to a True Friend


Sistema: Este ritual leva seis horas por noite durante seis noites para ser conjurado, reduzidas em uma noite para cada dois sucessos. Cada noite exige o sacrifício de três pontos do próprio sangue da conjuradora, que são derramados no círculo. Uma vez completo o círculo, o transporte pode ser tentado a qualquer momento. A conjuradora pode levar outro indivíduo consigo quando viaja, ou uma quantidade máxima de “carga” igual ao próprio peso.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Esilio"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 183


5. Esilio


Como o Tempesta Scudo, o Esilio é um ritual rápido e rústico. A necromante simplesmente profere cinco sílabas. Ninguém consegue identificar a língua da conjuração, mas, segundo a história obscura do ritual, a língua é a que Deus deu à humanidade antes da confusão de Babel. A lenda afirma ainda que, embora o significado específico das palavras esteja perdido, elas são o que o pai de Caim lhe disse ao exilá-lo em Nod.
Independentemente da verdade do assunto, as Palavras do Exílio não são proferidas levianamente. Quando o ritual é conjurado com êxito, ele abre um buraco na própria realidade — um rasgo entre as terras dos vivos e as profundezas mais escuras do Mundo Inferior. Esse rasgo é invisível à visão normal, mas para a Testemunha da Morte ou a Visão da Mortalha parece um vórtice negro se abrindo dentro do próprio corpo do vampiro (os pouquíssimos infelizes que olharam para dentro da fenda com níveis altos de Auspícios em geral não querem ou não conseguem falar sobre isso). Qualquer fantasma apertado contra o peito da Membro é instantaneamente feito em pedaços. Agarrar um fantasma desse modo exige uma manobra de Agarrão ou Placagem. Espíritos destruídos não voltam por ao menos um mês, se é que voltam. Um espectro destruído desse modo tende a retornar como Espectro, se retornar.
A necromante pode agarrar e destruir um número de espíritos igual ao número de sucessos que rolou. Depois disso, o vórtice se fecha. Ele se fecha ao fim da cena, se já não tiver se fechado.
É claro que usar o próprio corpo como portal entre o nosso mundo e o que algumas pessoas chamariam de Inferno não é nem simples nem saudável. Para começar, custa um ponto de sangue e um ponto de Força de Vontade (que não dá sucesso automático na rolagem do ritual). O mais importante é que cada sucesso rolado inflige um nível de dano letal inabsorvível à necromante. E o mais significativo: cada uso do Esilio reduz permanentemente a Humanidade do necromante em um ponto, se ele seguir essa moralidade, e pode impactar outras Trilhas a critério do Narrador.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["5. From Marduk’s Throat"] = {
					pt = [==[Lore of the Clans, pág. 31


5. From Marduk’s Throat


Novo Ritual Dur-An-Ki. Este ritual é o meio pelo qual os Assamitas conseguem continuar reduzindo sua Geração apesar das limitações impostas pela Maldição Tremere. É também o mecanismo pelo qual a casta dos feiticeiros mantém alguma influência e controle sobre o Clã apesar de seu pequeno número, pois a dificuldade do ritual faz com que só feiticeiros muito experientes possam usá-lo. O feiticeiro cria um substituto alquímico do sangue vampírico que permite ao Assamita que beba o bastante diminuir sua Geração. Os ingredientes incluem uma grande variedade de químicos, ervas e outros materiais exóticos, mas o ingrediente mais importante é sangue Cainita.
Para reduzir a Geração de quem bebe em um nível, a poção precisa incorporar um número de pontos de sangue de vampiros de Geração inferior à do bebedor igual a quatro vezes o valor máximo de pontos de sangue da Geração desejada. Por exemplo, uma Assamita que quisesse reduzir sua Geração de Oitava para Sétima precisaria obter vinte e oito pontos de sangue de Cainitas de Sétima Geração ou inferior. Não importa quanto vitae seja: o resultado do processo alquímico evapora até virar um material espesso e lodoso que o bebedor precisa consumir de uma só vez.
A poção é repugnante e exige que o bebedor role Força de Vontade com sucesso (dificuldade 9). Se essa rolagem for bem-sucedida, a Assamita precisa então assimilar o sangue em seu corpo. Isso exige uma rolagem estendida de Força de Vontade (dificuldade 9), buscando 15 sucessos para uma nova Geração. As falhas não interrompem o processo, mas causam seis dados de dano letal cada uma (absorvidos normalmente). A assimilação é tão dolorosa e desconcentrante que qualquer ataque feito contra ela nesse período enfrenta dificuldade de apenas 2.
Conjuração de ritual de Feitiçaria Assamita: a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20, pág. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9).]==],
				},
				["5. Ghost in the System"] = {
					pt = [==[Rites of Blood, pág. 69


5. Ghost in the System


Sistema: O ritual exige uma rolagem estendida de Inteligência + Ocultismo, com cada rolagem representando uma noite inteira dedicada a remodelar a Internet e a nada mais, exceto uma ou duas horas de alimentação. O Narrador determina quantos sucessos são necessários com base no número de “fatos da Internet” que precisam ser alterados para alcançar o resultado desejado. Mudar o diagnóstico médico de um único mortal ou registrar todos os cartões de crédito dela como roubados pode exigir apenas um ou dois sucessos, enquanto criar uma identidade inteiramente nova para um vampiro em fuga pode exigir de cinco a dez, dependendo de quão complicada e importante é a nova identidade. Usos particularmente bem-sucedidos deste ritual podem render pontos no Antecedente Identidade Alternativa (V20, p. 111).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Grasp the Ghostly"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 184


5. Grasp the Ghostly


Exigindo seis horas inteiras de cânticos, este ritual permite ao necromante trazer um objeto do Mundo Inferior para o mundo real. Não é simples, porém — um espectro pode se opor a ter seus bens roubados e revidar. Além disso, o objeto retirado precisa ser substituído por um item material de massa aproximadamente igual, do contrário o alvo do ritual volta de estalo à sua existência fantasmagórica anterior.
Objetos retirados do Mundo Inferior tendem a se desvanecer depois de cerca de um ano. Só itens recentemente destruídos no mundo real (chamados de “relíquias” pelos fantasmas) podem ser recapturados desse modo. Artefatos criados pelos próprios espectros nunca foram feitos para existir fora do Mundo Inferior, e desaparecem ao contato com o mundo dos vivos.
Conjuração de ritual necromântico (p. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["5. Mirror Prison"] = {
					pt = [==[Rites of Blood, pág. 29


5. Mirror Prison


Sistema: O taumaturgo precisa polir um espelho de prata com um ponto de seu sangue e as lágrimas de uma criança inocente. O taumaturgo precisa gastar um ponto de Força de Vontade, que é permanentemente absorvido pelo espelho.
Uma vez criado, o taumaturgo pode abrir um portal através do vidro tocando-o com um ponto de seu sangue. A abertura para a prisão-espelho dura o quanto o conjurador desejar. Prisioneiros incapacitados podem ser passados sem dificuldade, mas um alvo relutante exige uma rolagem resistida de Força para forçar a vítima através do portal.
Escapar do espelho exige que o prisioneiro derrote o conjurador numa rolagem resistida de Força de Vontade com dificuldade 8. Um prisioneiro só pode tentar escapar dessa forma uma vez a cada trinta dias. A cela comporta confortavelmente até três indivíduos. Uma pessoa lá dentro não pode ser localizada por vidência nem ser alvo de Clarividência (ou poderes semelhantes, a critério do Narrador). O prisioneiro não precisa de alimento nem de sono, pois permanece intocada pela passagem do tempo.
Se o espelho for destruído ou se o taumaturgo quiser cancelar o ritual, o ponto de Força de Vontade armazenado retorna a ela e todos os prisioneiros são libertados instantaneamente.
Se o conjurador gastar um ponto de sangue e tocar o espelho, ela pode aumentar ou diminuir a opacidade do vidro, permitindo que o prisioneiro veja fora de sua prisão conforme ela desejar. Se o espelho estiver transparente, o prisioneiro pode aparecer nele como uma cabeça flutuante para se comunicar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Mirror of Blood"] = {
					pt = [==[Rites of Blood, pág. 107


5. Mirror of Blood


Sistema: O custo em sangue deste ritual é de 3 pontos para cada criança a ser transformada em Irmão de Sangue. Depois de três meses de conjuração, na noite final do ritual, o taumaturgo precisa fazer dez rolagens — uma para cada criança envolvida no ritual. Essas rolagens são de Inteligência + Ocultismo (dificuldade 9). Se o taumaturgo obtiver ao menos um sucesso numa rolagem, aquela criança sobrevive. Se duas ou menos crianças sobreviverem ao processo, o ritual inteiro é um fracasso e todas as crianças morrem. Se três ou mais das dez crianças originais sobreviverem, o ritual é um sucesso. O número de crianças que sobrevivem é o número de Irmãos de Sangue na nova matilha unificada.
A tentativa de usar este ritual, bem-sucedida ou não, retira um único ponto de moralidade do total de moralidade do usuário, se ele estiver em Humanidade. Outras trilhas (em especial as que evitam matar) podem exigir uma perda de moralidade semelhante (ou maior). Irmãos de Sangue criados com este ritual são inférteis e não podem Abraçar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Nectar of the Bitter Rose"] = {
					pt = [==[Rites of Blood, pág. 155


5. Nectar of the Bitter Rose


Sistema: A taumaturga precisa conter a vítima de alguma forma enquanto conjura sobre ela este ritual de uma hora. Precisa entoar as encantações apropriadas enquanto sua coterie de aspirantes a diableristas escarnece da vítima por sua ruína iminente. Enquanto ela está distraída, a conjuradora identifica misticamente diferentes aspectos da alma e os separa simbolicamente do todo drenando a vitae do alvo em pequenas porções.
Ao término do ritual, a conjuradora e até cinco vampiros podem tentar obter os benefícios de diablerizar o sujeito. Cada aspirante a diablerista precisa fazer um desafio separado para reclamar o prêmio sombrio. O Néctar da Rosa Amarga não permite a um vampiro obter benefícios de diablerizar uma vítima de geração mais fraca ou mais alta — ele simplesmente permite que várias pessoas compartilhem uma diablerie.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Occlude the Western Road"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 43


5. Occlude the Western Road


A feiticeira executa o ritual que o próprio Haqim criou para manter a Cidade Santa de Alamut escondida do resto do mundo. Vestindo capa de viagem e sandálias, ela precisa pedir a bênção do Ancião para sua tarefa. O Ancião recita os ensinamentos de Haqim e instrui a feiticeira a manter seguros os caminhos para Alamut. A feiticeira então medita por uma hora. Na hora que antecede o nascer do sol, precisa tomar um frasco com sangue da poça no centro de Alamut e misturá-lo com poeira da Estrada Ocidental enquanto fala o nome de Alamut na língua da Primeira Cidade, sob o céu que aos poucos clareia. Ela desenha com o sangue um círculo em volta de si e implora ao sol que apague, ao nascer, todos os sinais de viagem de e para o local. A Cainita então unge a própria cabeça com o sangue e se deita esticada, de barriga para cima e braços abertos. Depois de outra encantação, ergue-se um vento constante, e nesse momento a feiticeira precisa correr para o abrigo antes de o sol despontar no horizonte. Quando dorme, ela é drenada de sangue, restando-lhe apenas um ponto ao despertar. O ritual da feiticeira apaga toda evidência de caminhos de e para o local. Quem chegar a um raio de oitocentos metros do local dá a volta, se for razoavelmente possível, ou passa direto sem notar nem a feiticeira nem o local que ela deseja proteger.
Este efeito dura um mês. Usado dentro de Alamut, afeta Alamut inteira.
Conjuração de ritual de Feitiçaria Assamita: o Tome of Secrets não declara rolagem própria para estes rituais; a Feitiçaria Assamita é mecanicamente idêntica à Taumaturgia (V20, pág. 440). Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["5. Orphic Sojourn"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 296


5. Orphic Sojourn


O Orphic Sojourn permite à necromante projetar a alma para fora do corpo e existir efetivamente como um fantasma pela duração do ritual.
O Orphic Sojourn exige que a vampira se vista com trajes fúnebres e se cerque de bens funerários. Ela se deita e medita do anoitecer até a meia-noite. Depois da meia-noite, está livre do corpo. Pode vagar pelo Submundo e interagir com os objetos e criaturas como se fosse um fantasma por um número de horas igual aos sucessos na rolagem do ritual. Quando o ritual expira, ela retorna imediatamente ao corpo. O Orphic Sojourn não pode ser usado para trazer objetos do Submundo.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["5. Paper Flesh"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 240


5. Paper Flesh


Sistema: Este ritual faz o Vigor e a Fortitude (se houver) do sujeito caírem para 1 cada. Para cada Geração abaixo da Oitava, o sujeito retém um ponto extra de Vigor ou Fortitude (mantendo Fortitude primeiro, embora ela não possa exceder seus valores originais). Por exemplo, uma vampira de Quarta Geração com Fortitude alvejada pela Carne de Papel cairia para um total de Vigor + Fortitude igual a 6 (supondo que o total fosse 6 ou mais originalmente). Este ritual dura uma noite.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Ravening Walls of Ceoris"] = {
					pt = [==[Dark Ages Companion, pág. 117


5. Ravening Walls of Ceoris


Nota: Este é um Ritual de Refúgio (ver Dedicate the Haven, V20 Dark Ages, pág. 310)
Este ritual leva o nome da fortaleza que ele foi usado para proteger pela primeira vez. A conjuradora derrama um ponto de sangue a cada 15 metros de comprimento de um muro de pedra (e gasta 15 minutos por trecho) enquanto invoca os nomes de espíritos da terra roubados do saber dos Tzimisce. Pelo resto da noite, qualquer um que toque ou escale o muro pela primeira vez é drenado de um ponto de sangue.
Imune aos efeitos do ritual, a conjuradora pode tocar o muro e colher o sangue roubado a uma taxa igual ao seu limite de gasto por Geração, como ação instantânea. Cada trecho de muro pode reter, a qualquer momento, tantos pontos de sangue quanto for o nível de Taumaturgia da conjuradora. O muro continua drenando o sangue excedente, mas o expele na forma de um lodo negro imundo que não serve de sustento.
Para cada ponto de Taumaturgia da conjuradora acima de 5, ela pode designar mais um Cainita como imune aos efeitos de drenagem do muro e capaz de colher sangue dele.
Ritual de Refúgio (V20 Dark Ages, pág. 310): Uma vez consagrado pelo Dedicate the Haven, o refúgio fica aberto a mais defesas: qualquer Ritual de Refúgio conjurado sobre ele se torna permanente e tem a dificuldade de conjuração reduzida em três.
Conjuração de ritual taumatúrgico (V20 Dark Ages, pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["5. Rickard Argentis’s Homunculus"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 116


5. Rickard Argentis’s Homunculus


Este ritual esquisito permite ao conjurador tomar a personalidade de um mortal abatido e investi-la numa entidade de sombra. O ritual precisa ser completado com um sacrifício humano. Ele cria um único Braço de Ahriman, estatisticamente normal como se criado pelo conjurador, exceto que pode ouvir, falar e agir por vontade própria. Ganha também Atributos Mentais e Carisma e Manipulação iguais aos do mortal abatido. A sombra se torna, para todos os efeitos, uma cópia da personalidade do mortal, mas sob laço de sangue completo com o conjurador. Ela persiste até ser abatida, mas precisa de um ponto de sangue por semana para sobreviver.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				["5. Rite of Marduk Slain and Risen"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 310


5. Rite of Marduk Slain and Risen


Ritual Assamita. O feiticeiro entra em contato com um vizir, que nomeia a vítima que um guerreiro pretende diablerizar. O feiticeiro então participa de uma cerimônia coletiva de uma hora com outros três participantes que conheçam o ritual. Todos vestem mantos e máscaras para reencenar cerimonialmente o mito de Marduk, assumindo os papéis de Marduk, Ea, Sarpanitu e a dragoa do caos, Tiamat. Se for bem-sucedido, e se o beneficiário diablerizar o alvo indicado antes do nascer do sol seguinte, o senhor da vítima, todos os filhos do senhor e da vítima, e qualquer vampiro que mantenha Juramento de Sangue com a vítima compartilham as sensações finais dela ao perecer. Cada sujeito afetado perde um ponto de sangue e três pontos de Força de Vontade, que vão para o diablerista (isso não pode exceder os máximos dos Traços). Se a reserva de sangue e a Força de Vontade do diablerista estiverem cheias, o excedente vai para o vizir e, depois dele, para o feiticeiro. Além disso, todos esses alvos colaterais perdem um ponto de Força de Vontade a cada dez minutos que passam na presença do diablerista, do vizir ou do feiticeiro, por sofrerem flashbacks da morte da vítima original. Este efeito dura 13 noites.
Rituais de clã (pág. 302): Os rituais de clã são segredos ciosamente guardados, jamais compartilhados com quem não pertence ao clã ou linhagem que abriga seus mistérios.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["5. Sanctuary"] = {
					pt = [==[Rites of Blood, pág. 29


5. Sanctuary


Sistema: Para completar este ritual, o taumaturgo precisa investir um ponto permanente de Força de Vontade na consagração do edifício alvo ao fim do ritual de três noites. Uma vez concluído, o véu de santuário envolve completamente os limites do edifício alvo. Todas as almas, vivas ou não, que não tenham sido especificamente convidadas pelo conjurador não conseguem entrar no edifício. Além disso, quem está dentro do edifício fica protegido contra todo uso de Animalismo, Auspícios, Dominação, Demência e Presença (e Disciplinas relacionadas, a critério do Narrador).
Essa proteção, porém, não vem sem preço. O véu de santuário só dura enquanto o terreno permanecer consagrado. Qualquer ato de violência cometido dentro do edifício o macula imediatamente, tornando impossível se beneficiar de novo de Sanctuary. Se o ritual for rompido, o conjurador percebe na hora, pois o ponto de Força de Vontade investido no edifício retorna a ela.
Se o edifício permanecer consagrado, a magia deste ritual continua por um ano para cada sucesso na rolagem de ativação. Depois disso, o conjurador precisa reinvestir o ponto de Força de Vontade ou deixar o santuário se dissipar.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Seeing With the Sky’s Eyes"] = {
					pt = [==[Rites of Blood, pág. 163


5. Seeing With the Sky’s Eyes


Sistema: Cada sucesso permite ao jogador fazer uma pergunta sobre a localização e as atividades atuais do alvo.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["5. Severed Hand"] = {
					pt = [==[Rites of Blood, pág. 155


5. Severed Hand


Sistema: Este ritual leva uma noite inteira para ser realizado, durante a qual o ferimento é tratado com diferentes compostos alquímicos para impedir o processo de regeneração. Embora os níveis de vitalidade possam se curar do modo normal, a parte do corpo decepada não pode ser restaurada à condição anterior sem cura mágica (como Obeah, V20, p. 457).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Shackles of Blood"] = {
					pt = [==[Rites of Blood, pág. 167


5. Shackles of Blood


Sistema: O laço falso dura um número de noites igual aos sucessos. Ao fim disso, o efeito cessa mas, se a wangateur criar de fato um laço de sangue verdadeiro com o alvo durante esse tempo, ele funciona como qualquer laço de sangue normal. Embora este ritual pareça desnecessariamente complicado em comparação com o laço de sangue por meios convencionais, ele tem uma vantagem potente — se a poção for dada a um mortal, qualquer vampiro que se alimentar daquele mortal nas 24 horas seguintes é afetado como se a tivesse bebido diretamente. Desse modo, uma wangateur ardilosa pode ganhar poder sobre um vampiro que nem sequer sabe que ela existe.
Mecânica de dados da magia de sangue (p. 130): para os fins deste livro, toda escola de magia de sangue funciona do mesmo modo — rolagens de Força de Vontade para poderes de trilha e rolagens de Inteligência + Ocultismo para todos os rituais, com dificuldade 3 + o nível do ritual. Narradores que prefiram as paradas de dados listadas em V20 ou em suplementos anteriores podem usá-las no lugar.]==],
				},
				["5. Skinwalker’s Belt"] = {
					pt = [==[Rites of Blood, pág. 63


5. Skinwalker’s Belt


Sistema: Cada sucesso significa que o artefato dura uma semana antes de se degradar. Ele pode ser mantido por outra duração equivalente untando-o com uma quantidade do sangue do ritualista igual à usada no ritual que o criou.
Depois de completado o ritual, o jogador do ritualista precisa rolar Inteligência + Ofícios para transformar a pele numa peça de roupa vestível. Uma falha pode ser rolada de novo, mas uma falha crítica destrói a pele. Só é preciso um sucesso, porém, para completar o processo. Mais sucessos significam apenas que o artefato fica esteticamente mais agradável. Para usar o Skinwalker’s Belt, o ritualista precisa tirar todas as outras roupas (inclusive joias) antes de vestir o artefato e murmurar um breve encantamento, com o que se transforma instantaneamente numa cópia perfeita do animal usado no ritual. Ele não pode usar Disciplinas nesta forma (nem mesmo Disciplinas físicas como Potência ou Fortitude) e não pode falar, exceto com quem tenha a capacidade sobrenatural de falar com animais. Ele mantém sua inteligência humana e continua sujeito ao frenesi.
Os efeitos da magia duram até ele desejar que terminem ou até o amanhecer. Nos dois casos, ele reverte instantaneamente à sua forma verdadeira, o que pode ser muito ruim se ele estiver num espaço pequeno vestindo o tamanho de um camundongo, ou a céu aberto quando volta a ser um homem nu que sofre dano agravado da luz do sol. O artefato conta como o equivalente a uma mecha de cabelo ou uma unha se cair nas mãos de outro mago de sangue (ver Princípio da Simpatia nas pp. 133-135).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Stone Slumber"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 310


5. Stone Slumber


Este ritual protege o conjurador transformando-o em pedra sólida. Ele precisa começar o ritual exatamente uma hora antes do nascer do sol e engolir meio litro de pedrinhas enquanto permanece completamente imóvel numa área aberta, voltado para o leste. Quando os primeiros raios do sol nascente o atingem, o corpo do conjurador se transforma em pedra mágica inquebrável. Se for bem-sucedido, o conjurador fica completamente protegido de todo dano físico, inclusive chama e calor. Nessa forma, a mente do conjurador fica dormente: ele está completamente alheio ao que o cerca e não pode acordar — Telepatia e outras Disciplinas mentais são inúteis. O ritual dura até 10 minutos depois do poente seguinte, e despertar na noite seguinte custa ao conjurador um ponto de sangue adicional.
Este é um Ritual de Gárgula (ver Enchant Talisman na pág. 309).
Rituais de Gárgula (pág. 309): Os taumaturgos Tremere podem conjurar o Enchant Talisman sobre uma Gárgula para encantá-la permanentemente com um ritual específico que a conjuradora conheça. Esse feito exige seis horas por noite e uma semana por nível do ritual. Uma vez conjurado com sucesso, o ritual permanentemente encantado numa Gárgula torna-se inerente a ela, como uma Disciplina, e pode ser ativado, desativado e reativado à vontade pela Gárgula com o gasto de um ponto de sangue. Se o ritual estiver vinculado a um item específico, passa a estar vinculado à própria Gárgula. Os rituais ativados por uma Gárgula não exigem rolagem de conjuração e duram uma cena ou até serem dispensados.
Conjuração de ritual taumatúrgico (pág. 302): Salvo indicação em contrário, a conjuração de rituais exige o gasto de um ponto de sangue, cinco minutos por nível de conjuração e uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Às vezes os rituais exigem ingredientes ou reagentes especiais para funcionar, indicados na descrição de cada um. Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme a rolagem do conjurador.]==],
				},
				["5. Stone of the True Form"] = {
					pt = [==[Rites of Blood, pág. 156


5. Stone of the True Form


Sistema: Ao longo de uma noite, a taumaturga precisa conjurar este ritual sobre uma pedra pequena e redonda, como uma bolinha de gude. Depois, a conjuradora pode usar essa pedra como gatilho para envolver seu alvo numa rolagem resistida de Força de Vontade (dificuldade igual ao Vigor de cada um). Se a conjuradora vencer por ao menos um sucesso, o sujeito muda imediatamente para sua forma natural por um turno. Cada sucesso além do primeiro estende o número de turnos em que o alvo fica incapaz de assumir qualquer forma que não a original. Se a pedra for estilhaçada, a vítima fica livre para mudar de forma, não importa quantos turnos restem de seu prazo na forma original.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. The Ferryman’s Recall"] = {
					pt = [==[Lore of the Clans, pág. 109


5. The Ferryman’s Recall


Sistema: O conjurador precisa ter acesso ao cadáver e a um dos grilhões do sujeito, talvez obtido com o Ritual do Grilhão Desenterrado (V20, pág. 181). O Ferryman’s Recall leva 8 horas (reduzidas em uma hora por sucesso na rolagem de conjuração) para ser executado.
O cadáver precisa estar relativamente intacto para o ritual funcionar, e o sujeito precisa ter sido carniçal antes de morrer. Se o necromante que executa o ritual não era o domitor, ele precisa ter um ponto de sangue do vitae do domitor. A Geração do Cainita que dá o Abraço (normalmente, mas nem sempre, o necromante que executa o ritual) determina quanto tempo pode ter se passado desde a morte do sujeito, pois um vitae mais poderoso tem efeito mais potente.
Décima Terceira Geração — 12 horas de morto
Décima Segunda Geração — 1 dia de morto
Décima Primeira Geração — 2 dias de morto
Décima Geração — 3 dias de morto
Nona Geração — 4 dias de morto
Oitava Geração — 5 dias de morto
Sétima Geração — 1 semana de morto
Sexta Geração — 2 semanas de morto
Primeiro, o corpo do sujeito precisa ser limpo e preparado, drenado por completo de sangue ou de fluido de embalsamamento. Depois o necromante pinta uma série de sigilos sobre o corpo, destinados a servir de marcadores para que o espírito do sujeito reaprenda a usar seu corpo. No clímax do ritual, a Cainita que executa o Abraço derrama seu vitae na boca do sujeito, e o Abraço prossegue normalmente. Quaisquer ferimentos sofridos antes do ritual (inclusive a causa da morte do sujeito e eventual decomposição) se fecham, mas não se curam por completo, deixando cicatrizes no corpo do recém-Abraçado. Além disso, o tempo do sujeito do outro lado do sudário deixa sua marca nele: dá-lhe a tez cinzenta dos Precursores do Ódio, além de dotá-lo de maior facilidade para a magia necromântica (ver a Qualidade Mortuario na pág. 106 para mais informações).
Conjuração de ritual necromântico (V20, pág. 177): Os tempos de conjuração dos rituais necrománticos variam muito; ver a descrição para os detalhes. O jogador rola Inteligência + Ocultismo (dificuldade 3 + o nível do ritual, máximo 9). O sucesso indica que o ritual transcorre sem percalços, a falha não produz efeito e uma falha crítica indica que algo deu terrivelmente errado.]==],
				},
				["5. The Inmost Tug"] = {
					pt = [==[Rites of Blood, pág. 158


5. The Inmost Tug


Sistema: Cada sucesso representa uma cena em que o servo é compelido a sentir por ele uma emoção à escolha do koldun.
Mecânica de dados da Feitiçaria Koldúnica (p. 156): a rolagem para ativar um ritual de Feitiçaria Koldúnica é Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual. As conexões metafísicas da escola com Kupala e com as terras permeadas por esse espírito aumentam a dificuldade em +1 em todas as rolagens de Feitiçaria Koldúnica feitas em favor de koldun que operam sua magia fora dos territórios da Europa Oriental.]==],
				},
				["5. The Pursuit of Apotheosis"] = {
					pt = [==[Rites of Blood, pág. 64


5. The Pursuit of Apotheosis


Sistema: O ritual funciona ou não funciona — sucessos adicionais não trazem recompensa extra. Para cada adorador mortal que morre como parte do ritual, o jogador precisa rolar um dado contra dificuldade 7. Cada sucesso dá ao jogador um ponto de experiência que pode ser usado para comprar traços novos ou melhorados pelos custos normais de experiência. Da perspectiva da personagem, esses novos Atributos, Habilidades e Disciplinas são resultado de um vislumbre momentâneo da divindade, pago com a morte de seguidores leais. Segundo alguns rumores, um número suficiente de sacrifícios bem-sucedidos também pode ser gasto para reduzir permanentemente a Geração de um vampiro. A veracidade desses rumores e o número de sucessos necessários para tal feito ficam a critério do Narrador. De todo modo, qualquer feiticeira que use este ritual descobre que sua aura fica riscada de marcas negras indistinguíveis das que resultam da diablerie.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Treasures of Hades"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 296


5. Treasures of Hades


Este ritual complexo e demorado permite a um necromante recuperar Relíquias do Submundo. O ritual exige que o necromante entoe cânticos por seis horas enquanto queima uma réplica da Relíquia (que não precisa ser bem-feita nem convincente). Ao término do ritual, a Relíquia aparece nas cinzas da réplica. Para convocar uma Relíquia, o celebrante precisa tê-la visto antes. Este ritual não pode ser usado para recuperar objetos que não sejam relíquias no Submundo, como as lâminas corta-almas dos reis fantasmas.
É improvável, contudo, que uma Relíquia útil possa ser levada sem que ninguém perceba. As Relíquias são mercadorias preciosas e ciosamente guardadas no Submundo, e os fantasmas têm um jeito estranho de rastrear necromantes intrometidos que saqueiam seus tesouros.
Objetos retirados do Submundo permanecem no mundo dos vivos até a Véspera de Todos os Santos, quando retornam às terras sem sol. Um necromante só pode convocar uma Relíquia específica uma vez a cada cem anos.
Conjuração de ritual necromântico (pág. 292): Para executar um ritual corretamente, o jogador precisa obter sucesso numa rolagem de Inteligência + Ocultismo com dificuldade igual a 3 + o nível do ritual, máximo 9. A falha não produz efeito, mas uma falha crítica pode produzir resultados desastrosos.]==],
				},
				["5. Ward versus Spirits"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 240


5. Ward versus Spirits


Sistema: A Proteção contra Espíritos se comporta exatamente como a Proteção contra Carniçais, mas afeta espíritos (inclusive os invocados ou dotados de forma física por Trilhas de Taumaturgia como o Domínio Elemental). O componente material da Proteção contra Espíritos é um punhado de sal marinho puro.
As outras versões desta proteção, também rituais de Nível Cinco, são a Proteção contra Fantasmas e a Proteção contra Demônios. Cada uma dessas três proteções de Nível Cinco afeta seu respectivo alvo tanto no plano físico quanto no espiritual. A Proteção contra Fantasmas exige um punhado de mármore pulverizado de uma lápide, enquanto a Proteção contra Demônios exige um frasco de água benta.
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Warding Circle versus Technology"] = {
					pt = [==[Rites of Blood, pág. 102


5. Warding Circle versus Technology


Sistema: O ritual exige três pontos de sangue mortal de indivíduos com ao menos 3 de inteligência. O conjurador determina o tamanho do círculo de proteção no momento da conjuração; o raio padrão é de 3 metros, e cada aumento de 3 metros eleva a dificuldade em um (um sucesso adicional é exigido para cada aumento além do número necessário para levar a dificuldade a 9). O jogador gasta um ponto de sangue para cada 3 metros de raio e rola. O ritual leva o tempo normal de conjuração se for de curta duração (durando o resto da noite) ou uma noite se for de longa duração (durando um ano e um dia).
Uma vez estabelecido, o círculo de proteção brilha num alaranjado acobreado tênue, fraco demais para ser visto sob luz normal, mas perceptível em condições de pouca luz ou na escuridão natural. Uma rolagem bem-sucedida de Inteligência + Ocultismo (dificuldade 8) o identifica como um círculo de proteção. Se uma tecnologia cruzar para dentro do círculo, o possuidor dela precisa obter mais sucessos numa rolagem de Força de Vontade (dificuldade igual ao índice de Taumaturgia do conjurador + 3) do que o conjurador obteve ao estabelecer a proteção. A falha indica que a proteção faz com que toda a tecnologia que o indivíduo carrega seja irrevogavelmente destruída; os dados não podem ser recuperados depois, e todas as partes do item se estilhaçam. Se a tecnologia sair do círculo e depois entrar de novo, o possuidor precisa repetir esta rolagem.
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Warding Circles versus Spirits, Ghosts, and Demons"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 234


5. Warding Circles versus Spirits, Ghosts, and Demons


Sistema: Como o Círculo de Proteção contra Carniçais (p. 234), mas o círculo afeta espíritos, fantasmas ou demônios, conforme qual dos três círculos for conjurado. Os componentes materiais são os da proteção de Nível Cinco correspondente, em quantidades maiores: sal marinho puro para espíritos, mármore pulverizado de lápide para fantasmas e água benta para demônios. A conjuradora determina o tamanho do círculo de proteção no momento da conjuração; o raio padrão é de 3 metros, e cada aumento de 3 metros eleva a dificuldade em um, até o máximo de 9. O ritual leva o tempo normal de conjuração se for de curto prazo (durando o resto da noite) ou uma noite se for de longo prazo (durando um ano e um dia).
Conjuração de ritual taumatúrgico (p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Way of the Wendigo"] = {
					pt = [==[Rites of Blood, pág. 30


5. Way of the Wendigo


Sistema: O taumaturgo procura uma vítima que ela acredite ser exemplo de uma virtude que admira, como inteligência, pureza ou reverência. Ela precisa ungir o sacrifício com óleo, sálvia e cinzas durante um ritual de uma hora. No clímax do ritual, o conjurador assassina a vítima com o fêmur de um enforcado e então consome sua carne.
O consumo da carne permite ao taumaturgo absorver a essência da vítima para repor as necessidades de seu corpo morto-vivo e de sua vontade. Ela sente uma onda de sonolência e fica com -1 em todas as paradas de dados pela hora seguinte. Porém, a cada dez minutos que o taumaturgo descansa, ela recupera um ponto de Força de Vontade e um nível de vitalidade. Ao fim da noite, se o taumaturgo não possuir a Qualidade Comer Comida (V20, p. 480), ela é obrigada a vomitar a carne excedente.
Este é um ritual horrendo em que o sacrifício precisa suportar, consciente, o conhecimento de que vai morrer e então ser devorado. Uma ação tão hedionda cobra seu preço da humanidade do taumaturgo, pois sua mente é inundada por lampejos da vida da vítima e experimenta a agonia de sua morte. O uso deste ritual retira automaticamente ao menos um ponto de Humanidade do índice de Humanidade da personagem (até o mínimo de 2). Além disso, o Narrador pode exigir uma rolagem de Consciência (dificuldade 8). A falha significa a perda de um ponto adicional de Humanidade (que pode cair abaixo de 2), enquanto uma falha crítica pode muito bem significar a perda de ainda mais.
O uso deste ritual exige uma rolagem de Autocontrole (dificuldade 8). A falha significa que o taumaturgo ganhou permanentemente o Defeito Vício: Carne Humana (V20, p. 482).
Conjuração de ritual taumatúrgico (V20, p. 228): Salvo indicação em contrário, um ritual exige cinco minutos por nível para ser conjurado. A conjuração de rituais exige uma rolagem bem-sucedida de Inteligência + Ocultismo, cuja dificuldade é igual a 3 + o nível do ritual (máximo 9). Só um sucesso é necessário para um ritual funcionar, embora certos feitiços possam exigir mais sucessos ou ter efeitos variáveis conforme o resultado da rolagem do conjurador.]==],
				},
				["5. Whispers in the Dark"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 273


5. Whispers in the Dark


Sistema: A conjuradora convoca e contrai um Noturno, como em Reflections of Hollow Revelation, até ele caber na palma da mão. Ela concentra os pensamentos numa única pergunta, à qual o Narrador atribui um valor de 1 a 10 conforme a importância ou a complexidade da resposta, sendo 1 conhecimento trivial e 10 algo verdadeiramente revelador.
Quando estiver pronta, a conjuradora engole o Noturno. Feito isso, a vampira cai em torpor enquanto sua consciência é catapultada para dentro do Abismo. Para cada noite passada em torpor, a jogadora rola Inteligência + Ocultismo com dificuldade 8. Os sucessos se acumulam ao longo de noites sucessivas até a jogadora ter sucessos iguais ao valor da pergunta.
É claro que tentar se comunicar com os pensamentos alienígenas do Abismo pode ser perigoso. Se a Mística não acumular sucesso algum na rolagem de uma noite, o intervalo entre as rolagens aumenta de uma noite para várias noites, depois para semanas, e assim por diante. Mesmo o uso bem-sucedido deste ritual deixa a mística alterada para sempre, pois ela nunca consegue expulsar por completo a fome alienígena do Abismo de sua alma. Depois de usar este ritual, ao lidar com não-místicos o vampiro reduz permanentemente em um a dificuldade de todas as rolagens de Intimidação e aumenta em um a dificuldade de todas as rolagens Sociais (dois ao lidar com humanos). Essa desvantagem não é cumulativa.
Diz a lenda que o motivo do sono cuidadosamente guardado de Lasombra no Castelo das Sombras é que ele jaz sonhando com uma forma de destruir a própria criação.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["6. Into the Chasm"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 273


6. Into the Chasm


Sistema: Como preparação, a Mística gasta uma hora e três pontos do próprio sangue pintando uma porta com glifos do Abismo. Ao terminar, rola Inteligência + Ocultismo, dificuldade 7. Numa falha crítica, um portal para o Abismo se abre na porta, mas só o bastante para despejar um número de Sombras Famintas igual ao número de 1 rolados. A falha faz os glifos brilharem e desaparecerem sem resultado. O sucesso resulta num portal aberto e estável, sem contragolpe, que permanece aberto por tantos turnos quantos forem os sucessos.
Depois que a personagem atravessa o portal, ela fala seu destino ao Abismo e rola Raciocínio + Obtenebração para abrir um portal de saída do Abismo, dificuldade 6. Cada tentativa fracassada aumenta a dificuldade, até o máximo de 10. Além disso, a Mística sofre um nível de dano letal que não pode ser curado enquanto ela estiver dentro do portal. Tentativas com falha crítica ainda atraem uma Sombra Faminta.
Não-místicos podem entrar num portal aberto para o Abismo gastando Força de Vontade. A Mística pode optar por guiá-los mantendo contato físico; caso contrário, a dificuldade deles para sair do Abismo é 8. Não-místicos não conseguem compreender o caos informe do Abismo e enxergam apenas escuridão total. O não-místico que tentar usar meios sobrenaturais de ampliar os sentidos dentro do Abismo precisa fazer uma rolagem de Força de Vontade ou ganha um Distúrbio imediatamente, pois o horrível nada do Abismo costuma ser demais para quem não é místico.
Cada vez que um vampiro atravessa o Abismo, ele arrisca contaminação permanente. Ao deixar o Abismo, cada personagem precisa rolar sua Força de Vontade contra uma dificuldade igual ao número de rolagens necessárias para sair do Abismo. A falha faz a personagem ganhar o Defeito Sombra Animada (ver pág. 427).
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["7. Evocation of the Oubliette"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 274


7. Evocation of the Oubliette


Com esta habilidade, o Místico faz as sombras próximas irromperem e devorarem uma vítima, mandando-a para o Abismo.
Abismo: O Místico passa um turno inteiro em concentração antes de gastar três pontos de sangue e rolar Percepção + Ocultismo (dificuldade 6) contra um alvo que precisa estar em sua linha de visão. Esse ataque não pode ser aparado, mas pode ser esquivado. Um ataque bem-sucedido faz a vítima ser arrastada para dentro do Abismo, onde permanece por um número de noites igual ao nível de Obtenebração do conjurador — embora o Místico possa gastar um ponto de sangue para trazê-la de volta antes.
O Abismo é uma experiência dilacerante para quem não é iniciado em seus mistérios. Qualquer personagem sem níveis de Misticismo do Abismo ganha, depois da experiência, um Distúrbio que só pode ser curado com o uso repetido de Força de Vontade. Uma falha crítica na conjuração faz o ritual voltar-se contra o próprio conjurador, arrastando-o para o Abismo por um número de horas igual ao seu nível de Obtenebração. Se a Força de Vontade do conjurador for menor que seu nível de Obtenebração, ele ganha um Distúrbio como se fosse um não-místico submetido a este poder.
Existe uma versão de nível 8 deste ritual, conhecida como Convocação do Abismo. Com ela, o Místico fala o nome da pessoa que deseja trazer até si. Essa pessoa é puxada para o Abismo, como acima, e é imediatamente cuspida no local onde está o Místico, sofrendo todos os efeitos acima referentes a viajar pelo Abismo.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["8. Cry That Slays the Light"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 274


8. Cry That Slays the Light


Sistema: Para aprender o Cry That Slays the Light, a vampira passa uma semana de noites em completo e absoluto silêncio, dedicando cada momento desperto à meditação sobre seu ódio à luz e à existência material. Se em algum momento o silêncio for quebrado, ela precisa recomeçar. Passada a semana, role Inteligência + Ocultismo, dificuldade 8. Numa falha crítica, a personagem é puxada para o Abismo por um século para cada 1 rolado. Ela permanece alerta e consciente, nunca caindo em torpor por inanição de sangue, e ganha um número de Distúrbios igual ao número de 1 rolados.
Num sucesso, a Mística adivinha a forma da palavra que encerra o Abismo. Essa palavra passa a fazer parte da Mística e não pode ser discernida por outra personagem através de Telepatia ou de qualquer outro meio sobrenatural. A Mística pode reter essa palavra pelo tempo que quiser — dias, anos, décadas — antes de libertá-la, e então o Abismo escurece o céu por uma hora. Durante essa hora, todos os vampiros ficam imunes ao Rötschreck e não precisam se preocupar com a luz do sol, mesmo ao meio-dia. Passada a hora, a palavra se apaga da mente da Mística e precisa ser reaprendida.
Mesmo quando bem-sucedido, permitir-se ser um conduto direto do Abismo traz um risco terrível. Depois de usar este poder, role um número de dados igual ao nível de Caminho da Mística, dificuldade 4. Cada sucesso permite à Mística reter dois pontos de seu nível de Caminho, se ela seguir o Caminho do Abismo, ou um ponto, se não seguir. Se o Caminho da Mística for reduzido a 0 dessa forma, o Abismo aniquila por completo a existência dela.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["8. Lord Aludian’s Claim"] = {
					pt = [==[Vampire: The Dark Ages 20th Anniversary Edition, pág. 274


8. Lord Aludian’s Claim


Na maioria dos rituais de Misticismo do Abismo, o vampiro abre um furo sutil na realidade, deixando passar temporariamente um desconhecido primordial e sombrio por esse portal. Esta expressão fenomenal do domínio tenebroso derruba as fronteiras entre os reinos da carne e da sombra de forma quase permanente, amaldiçoando uma área para que se torne indefinidamente um foco de pesadelos sombrios.
Este ritual exige uma rolagem estendida de Manipulação + Ocultismo, dificuldade 8. Cada rolagem representa uma hora, e você pode fazer tantas rolagens quantos forem os pontos de Força de Vontade da sua personagem. Cinco sucessos são necessários para reivindicar um diâmetro de cinco metros, que permite a passagem de uma sombra (ver pág. 272). Sucessos adicionais podem ser gastos para acrescentar mais cinco metros ao diâmetro ou permitir a passagem de mais uma sombra. Essas sombras podem se afastar das imediações do portal. O portal, porém, só sustenta o número total de intrusos determinado pela rolagem inicial. Sempre que uma sombra morre, ela retorna ao anoitecer. As sombras são completamente subservientes ao conjurador.
O portal só se fecha quando fechado voluntariamente, exposto à luz do sol ou à Fé Verdadeira. Uma personagem só pode ter um portal desses aberto por vez.
Aprendizado de ritual de Misticismo do Abismo (pág. 271): Os rituais de Misticismo do Abismo são diferentes de outras formas de ritual de magia de sangue, pois se baseiam no uso de uma Disciplina e não de magia. Personagens que queiram aprender rituais de Misticismo do Abismo precisam ter Ocultismo 3. O personagem não pode aprender um ritual de nível superior ao seu Obtenebração ou ao seu Ocultismo. Além disso, precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido. Muitos rituais de Misticismo do Abismo têm efeitos colaterais que conferem Defeitos; o personagem nunca recebe experiência nem pontos de bônus por Defeitos ganhos como efeito colateral de rituais de Misticismo do Abismo.]==],
				},
				["9. Boukephos’ Chosen Oubliette"] = {
					pt = [==[Dark Ages Tome of Secrets, pág. 38


9. Boukephos’ Chosen Oubliette


Sistema: A Mística do Abismo precisa pintar um círculo de piche em torno do perímetro de uma comunidade de superfície — seja um povoado, uma aldeia, uma vila ou uma cidade. Esse círculo se rompe se for cruzado por uma criança ou por um crente com Fé Verdadeira. Uma vez posto o círculo, a Mística do Abismo precisa tirar o próprio sangue no centro dele, sob o céu noturno, gastando três pontos de sangue enquanto empoça seu vitae na terra. A vampira então precisa gastar um ponto de Força de Vontade e obter sucesso num teste estendido de Inteligência + Ocultismo (dificuldade 8) com alvo de 8 sucessos para uma comunidade pequena, 15 para uma comunidade grande e 22 para um centro populacional enorme. Esses sucessos precisam ser acumulados no curso de uma única noite, e a praticante não pode ser perturbada, ou o ritual falha. No sucesso final, o círculo de piche em volta da comunidade ondula e forma ondas altas que se despencam sobre tudo o que houver dentro dele. Forma-se um Oubliette de superfície, e tudo dentro dele passa ao Abismo. Passada a noite e dissipado o Oubliette, só permanecem os que estavam dentro dele e obtiveram sucessos num teste de Força de Vontade (dificuldade 9), com um Distúrbio. Todos os demais são levados ao Abismo e lá permanecem por um número de noites igual ao nível de Obtenebração da Mística do Abismo, sofrendo os efeitos listados no Antecedente Oubliette. Uma falha crítica no ritual faz a Mística do Abismo desaparecer no coração do Abismo para sempre. A praticante não é recuperável.
Rituais de Misticismo do Abismo (pág. 35): Os Místicos do Abismo guardam seus segredos a sete chaves. Membros de outros grupos não podem acessar seus Rituais sem antes dedicar sua existência ao Abismo.
Aprendizado de ritual de Misticismo do Abismo (V20 Dark Ages, pág. 271): Os rituais de Misticismo do Abismo se baseiam no uso de uma Disciplina e não de magia, e cada ritual declara a rolagem dele. O personagem precisa ter Ocultismo 3, não pode aprender um ritual de nível superior ao seu Obtenebração ou Ocultismo, e precisa ter uma especialização de Ocultismo em Misticismo do Abismo, ou soma 1 à dificuldade de cada ritual. Cada ritual custa 3 pontos de experiência por nível para ser aprendido.]==],
				},
				-- <<< RITUAL_DESC_END
};
