-- The seven Virtues, the pt half (SPEC I250c, V593, V210, V345 / T1452).
--
-- One entry per item of PICKER_LIST["virtue1"] and ["virtue2"] plus Courage, keyed in ENGLISH
-- because that is what the sheet saves (SPEC V24). Three blocks separated by two blank lines
-- (SPEC I21): source, name, body. The book title and the name in block 2 do not translate; only
-- p./pag. does. LF only (SPEC V345).
--
-- Written by hand from the books, no generator (SPEC Q162.9): the V20 entries from the Brazilian
-- V20 p.119-120 and p.314-315, cited by the title and page of the English edition (SPEC I21, Q162.4);
-- Reflection and Wisdom from the Classical Age book, whose only edition is this one.
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).

return {
				-- >>> VIRTUE_DESC_BEGIN (SPEC T1452)
				["Conscience"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 119


Conscience


A Consciência é a Característica que permite aos personagens avaliarem suas condutas quanto ao que é "certo" e "errado". O julgamento moral de um personagem, realizado por sua Consciência, se origina em sua atitude e perspectiva. A Consciência é o que evita que um personagem sucumba à Besta, ao definir os impulsos da Besta como inaceitáveis.

A Consciência afeta a dificuldade de muitas jogadas onde se tenta evitar cometer uma transgressão. Além disso, ela determina se um personagem perde ou não Humanidade ao cometer atos que não estão de acordo com seu código moral (veja "Degeneração", p. 309). Um personagem com um alto nível de Consciência sente remorso ao cometer transgressões, enquanto um personagem com baixo nível de Consciência pode ser um pouco mais cruel ou eticamente negligente.

Alguns vampiros substituem a Virtude Consciência pela Virtude Convicção (p. 314); a não ser que o seu Narrador diga que isso é aceitável, assuma que a Virtude Consciência está sendo usada.

• Não se Importa
•• Normal
••• Ético
•••• Íntegro
••••• Arrependido]==],
				},
				["Conviction"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 314


Conviction


A Virtude da Convicção quantifica a habilidade de um personagem em manter um senso de razão quando em face do desejo, sofrimento ou necessidade. Completamente inumana, a Convicção representa a reconciliação do ímpeto predador com a capacidade do personagem de cometer atrocidades.

Ao contrário da Consciência, que trata do remorso e da reparação pelas transgressões da Trilha, um personagem com Convicção reconhece sua falha e planeja superá-la. A Convicção é completamente inumana; o personagem que tem essa Característica não pode mais passar por humano, a não ser num exame apressado. As criaturas capazes de perceber a Besta (vampiros, lobisomens etc.) reconhecem imediatamente alguém que tenha a Virtude da Convicção pelo que ele realmente é: um monstro. Como ocorre com a Consciência, quando um personagem tem de fazer um teste de degeneração, a Convicção entra em cena.

• Seguro
•• Determinado
••• Confiante
•••• Brutal
••••• Completamente seguro de si]==],
				},
				["Reflection"] = {
					pt = [==[Vampire: The Classical Age 20th Anniversary Edition, pág. 161


Reflection


Enquanto Consciência trabalha com a racionalização por meio do julgamento da moral e Convicção trabalha com a dedicação do personagem a uma causa, Reflexão trabalha com o pensamento crítico, imparcial e que busca recolher os fatos para definir se um curso de ação era necessário ou não para a existência daquele vampiro.

Personagens com Reflexão tendem pensar sobre as consequências e sobre as possíveis reações. Assim que as ações acontecem, eles racionalizam aquilo. Depois, pode existir ou não alguma emoção baseada no que foi racionalizado. Fato é que personagens com Reflexão dificilmente tendem a sofrer efeitos de emoções e muitas vezes são nulos em relação às expressões emotivas. Seu julgamento é sobre o que realmente é certo ou errado.

• Indiferente
•• Normal
••• Pensativo
•••• Resoluto
••••• Racional]==],
				},
				["Self-Control"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 120


Self-Control


O Autocontrole define a disciplina de um personagem e o seu domínio sobre a Besta. Personagens com altos níveis de Autocontrole raramente sucumbem a impulsos emocionais e, desta forma, são capazes de conter seu lado negro mais prontamente do que personagens com baixos níveis de Autocontrole.

O Autocontrole é aplicado em jogo quando um personagem enfrenta a Besta na forma do frenesi (veja a pág. 298). Essa Virtude permite que o personagem resista ao frenesi. Observação: Um personagem nunca pode jogar mais dados em um teste de resistência ao frenesi do que o que ele possui em pontos de sangue — é difícil resistir à Besta quando se está com a mente nublada pela fome.

Assim como com a Consciência, o Autocontrole também pode ser substituído, neste caso pela Virtude Instinto (veja pág. 314). Novamente, a não ser que o Narrador especifique que o uso de outras Virtudes seja aceitável, assuma que o Autocontrole está sendo usado.

• Instável
•• Normal
••• Sóbrio
•••• Obstinado
••••• Autodomínio completo]==],
				},
				["Instinct"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 314


Instinct


A Virtude do Instinto refere-se à habilidade do personagem de controlar a Besta mais pela familiaridade do que pela rejeição. Ela permite que os personagens "curtam a onda" do frenesi e dos excessos emocionais mantendo um controle firme sobre suas paixões, ao invés de deixar que elas o controlem. Tão atávico quanto a Convicção, o Instinto é a Virtude de um monstro que aceita a sua natureza sem manter nenhum senso de compaixão humana.

O Instinto permite que o personagem domestique o poder destrutivo da Besta; um personagem com Instinto elevado é primal e turbulento. Um jogador faz testes de Instinto sempre que estiver tentando controlar o frenesi de seu personagem.

Quando um personagem que tem a Virtude do Instinto se depara com um frenesi, ele sempre entra em frenesi, a menos que a dificuldade do teste para evitá-lo seja menor do que seu nível de Instinto, caso em que ele pode optar por entrar em frenesi ou não. Depois disso, enquanto durar o frenesi, o personagem permanece sob o domínio total da Besta e deve ser interpretado pelo jogador (ou pelo Narrador) de maneira apropriada. Sempre que o jogador quiser que o personagem realize uma ação conscientemente (conhecido como "curtir a onda"), ele deve fazer um teste de Instinto contra a dificuldade para evitar o frenesi. Os frenesis afetam o personagem normalmente (inclusive ignorando-se as penalidades por ferimentos, etc.) embora algumas vezes ele possa exercer um certo controle enquanto está assim enfurecido.

• Intuitivo
•• Animalesco
••• Bestial
•••• Visceral
••••• Primal]==],
				},
				["Wisdom"] = {
					pt = [==[Vampire: The Classical Age 20th Anniversary Edition, pág. 161


Wisdom


O Auto-controle, reprime. O Instinto, liberta. A Sabedoria, compreende. Sabedoria não se baseia apenas em reprimir ou deixar-se levar. Personagens com Sabedoria conseguem definir quando é o melhor momento de agir emocionalmente ou não. Eles compreendem muito bem a situação ao redor a ponto de racionalizar suas emoções e permitir-se agir no momento apropriado. A grande vantagem da sabedoria é que esta atua como Autocontrole e como Instinto. Personagens com Sabedoria podem utilizar a Besta ao seu favor da mesma forma que podem reprimi-la. Esta é a grande vantagem de se obtê-la.

• Insensato
•• Normal
••• Compreensivo
•••• Experiente
••••• Sábio

A grande falha de personagens sábios é que por utilizarem do meio termo como escapatória da Besta, sem muita repreensão ou sem muita liberdade, os testes que utilizam Sabedoria para controlar suas emoções de qualquer maneira que seja aumentam em um a dificuldade.]==],
				},
				["Courage"] = {
					pt = [==[Vampire: The Masquerade 20th Anniversary Edition, pág. 120


Courage


Todos os personagens têm a Virtude Coragem, independente da Trilha escolhida por ele. A Coragem é a qualidade que permite que um personagem se levante contra o medo e enfrente adversários assustadores. É a bravura, o ânimo e o estoicismo combinados. Um personagem com um alto nível de Coragem enfrenta seus medos com a cabeça erguida, enquanto um personagem com um nível baixo pode fugir aterrorizado.

Os Membros usam a Coragem quando enfrentam circunstâncias endemicamente temidas por eles: fogo, luz do sol, Fé Verdadeira. Consulte a seção sobre Rötschreck para informações sobre as regras para se lidar com o medo dos personagens.

• Tímido
•• Normal
••• Audaz
•••• Determinado
••••• Heróico]==],
				},
				-- <<< VIRTUE_DESC_END
}
