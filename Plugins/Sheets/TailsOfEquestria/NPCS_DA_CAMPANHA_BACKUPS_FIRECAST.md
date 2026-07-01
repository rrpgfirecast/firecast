# NPCs da Campanha — Backups Firecast

Este documento reúne as fichas completas dos personagens de **O Voo da Trapaça** e seus backups XML prontos para importar na ficha **Tails of Equestria — Firecast**.

## Como usar

1. Abra uma ficha vazia ou faça backup da ficha atual.
2. Abra **BACKUP DA FICHA**.
3. Copie somente o conteúdo do bloco XML do NPC desejado.
4. Cole no campo de backup e clique duas vezes em **RESTAURAR DO TEXTO**.

> Os backups não incluem links de retrato nem de Cutie Mark. Restaurar um backup substitui os dados atuais da ficha.

## Índice rápido

| NPC | Papel | Raça | Nível | Corpo | Mente | Charme | Energia |
|---|---|---|---|---|---|---|---|
| Vini | Aliado central | Pégaso | 3 | D4 | D6 | D10 | 10 |
| Nimbus Flash | Rival | Pégaso | 2 | D6 | D4 | D6 | 10 |
| Guarda Pluma Serena | Guarda da área restrita | Pégaso | 3 | D6 | D6 | D6 | 12 |
| Sr. Tomo Silencioso | Mentor e guardião do Acervo | Pégaso | 5 | D4 | D10 | D8 | 14 |
| Mestre de Voo Hélio | Autoridade da Academia | Pégaso | 6 | D8 | D8 | D8 | 16 |
| Monitora da Academia | Segurança e disciplina | Pégaso | 3 | D8 | D6 | D6 | 14 |
| Revoada de Livros Encrenqueiros | Ameaça mágica cômica | Criatura personalizada | 1 | D4 | D4 | D4 | 5 |
| Aurora Prisma | Monitora de segurança mágica | Unicórnio | 3 | D4 | D8 | D6 | 12 |
| Brisa Curta | Cadete informante | Pégaso | 1 | D4 | D6 | D6 | 10 |
| Engrenagem Doce | Manutenção e apoio prático | Pônei terrestre | 3 | D8 | D6 | D4 | 14 |
| Lume Marinho | Mensageiro e estudante visitante | Criatura personalizada | 2 | D6 | D6 | D6 | 12 |

---

## 1. Vini

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Aliado central | Pégaso | 3 | Riso | D4 | D6 | D10 | 10 | 2 | 400 |

**Objetivo de cena:** Vini precisa da ajuda de seus amigos para não ser expulso da academia de voo.

**Interpretação:** Engraçado por fora, assustado por dentro. Fala rápido quando fica nervoso.

**Cutie Mark / habilidade especial:** Bom de Lábia (D6) — Em uma conversa, Vini pode rolar o dado para acalmar, distorcer um pouco a verdade sem mentir ou convencer alguém, recebendo vantagem conforme o resultado.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Coração Intrépido | D4 | Adquirido | Corpo | Role junto em feitos corajosos pelos quais o pônei se esforça grandiosamente. |
| Arranjo de Nuvens | D4 | Adquirido | Corpo | Maneja o clima: move nuvens e cria chuva, neve, vento ou tempestades. |
| Toque de Cura | D4 | Adquirido | Charme | Uma vez por jogo, recupera a Energia de um aliado conforme o resultado. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Eueueueueu! | O pônei deseja ser o centro das atenções e se sente mal quando não é. |
| Bagunçado | A desorganização e a bagunça incomodam os outros e atrapalham tarefas. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Roupas elegantes | Moda | 1 | 100 | Um belo vestido ou terno arrojado para ocasiões especiais. |
| Pomada de pônei | Cura | 5 | 25 | Gaste um uso para recuperar 1 Energia ou tratar alergia/asma; uma vez ao dia por pônei. |
| Kit de primeiros cascos | Cura | 3 | 40 | Bandagens, compressas e doces calmantes para cuidados rápidos em viagem. |
| Chá calmante | Comida | 3 | 8 | Uma bebida quente para acalmar conversas tensas e noites agitadas. |
| Kit de pegadinha | Kit | 1 | 20 | Buzinas, máscaras e truques; aumenta um passo ao preparar uma piada. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="400" bodyDie="4" characterName="Vini" charmDie="10" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="True" conditionWet="False" cutieMarkDescription="Em uma conversa, Vini pode rolar o dado para acalmar, distorcer um pouco a verdade sem mentir ou convencer alguém, recebendo vantagem conforme o resultado." cutieMarkDie="6" cutieMarkImageStyle="proportional" cutieMarkTalent="Bom de Lábia" elementOfHarmony="Riso" friendshipCurrent="2" level="3" mindDie="6" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Vini precisa da ajuda de seus amigos para não ser expulso da academia de voo." schemaVersion="7" staminaCurrent="10" staminaMax="10" staminaMaxAuto="10" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Role junto em feitos corajosos pelos quais o pônei se esforça grandiosamente." die="4" kind="Adquirido" linkedTrait="Corpo" name="Coração Intrépido" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Maneja o clima: move nuvens e cria chuva, neve, vento ou tempestades." die="4" kind="Adquirido" linkedTrait="Corpo" name="Arranjo de Nuvens" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Uma vez por jogo, recupera a Energia de um aliado conforme o resultado." die="4" kind="Adquirido" linkedTrait="Charme" name="Toque de Cura" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="True" name="Eueueueueu!" trigger="O pônei deseja ser o centro das atenções e se sente mal quando não é.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Bagunçado" trigger="A desorganização e a bagunça incomodam os outros e atrapalham tarefas.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Moda" cost="100" name="Roupas elegantes" quantity="1" quickUse="Um belo vestido ou terno arrojado para ocasiões especiais.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Cura" cost="25" name="Pomada de pônei" quantity="5" quickUse="Gaste um uso para recuperar 1 Energia ou tratar alergia/asma; uma vez ao dia por pônei.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Cura" cost="40" name="Kit de primeiros cascos" quantity="3" quickUse="Bandagens, compressas e doces calmantes para cuidados rápidos em viagem.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Comida" cost="8" name="Chá calmante" quantity="3" quickUse="Uma bebida quente para acalmar conversas tensas e noites agitadas.">
      <__ndb__ id="16" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Kit" cost="20" name="Kit de pegadinha" quantity="1" quickUse="Buzinas, máscaras e truques; aumenta um passo ao preparar uma piada.">
      <__ndb__ id="17" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="17" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 2. Nimbus Flash

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Rival | Pégaso | 2 | Lealdade | D6 | D4 | D6 | 10 | 2 | 60 |

**Objetivo de cena:** Provar diante de todos que é o melhor cadete da Academia.

**Interpretação:** Arrogante e habilidoso. Fala com calma ensaiada e sorri quando acredita ter vantagem.

**Cutie Mark / habilidade especial:** Voo de Exibição (D8) — Transforma manobras precisas em apresentações capazes de prender a atenção de uma plateia.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Voar | D8 | Principal | Corpo | Executa manobras rápidas, precisas e vistosas. |
| Exibicionismo | D6 | Adquirido | Charme | Impressiona plateias e chama atenção para os próprios feitos. |
| Provocação | D6 | Adquirido | Charme | Desestabiliza rivais com comentários calculados. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Precisa ser o Melhor | Reage mal quando outra pessoa recebe mais atenção ou reconhecimento. |
| Orgulho Ensaiado | Tem dificuldade para admitir dúvidas, erros ou admiração por um rival. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Óculos de voo profissionais | Acessório | 1 | 75 | Ajudam durante manobras velozes e completam sua imagem de campeão. |
| Faixa de primeiro colocado | Lembrança | 1 | 10 | Nimbus a exibe quando precisa lembrar aos outros de uma vitória antiga. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="60" bodyDie="6" characterName="Nimbus Flash" charmDie="6" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Transforma manobras precisas em apresentações capazes de prender a atenção de uma plateia." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Voo de Exibição" elementOfHarmony="Lealdade" friendshipCurrent="2" level="2" mindDie="4" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Provar diante de todos que é o melhor cadete da Academia." schemaVersion="7" staminaCurrent="10" staminaMax="10" staminaMaxAuto="10" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Executa manobras rápidas, precisas e vistosas." die="8" kind="Principal" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Impressiona plateias e chama atenção para os próprios feitos." die="6" kind="Adquirido" linkedTrait="Charme" name="Exibicionismo" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Desestabiliza rivais com comentários calculados." die="6" kind="Adquirido" linkedTrait="Charme" name="Provocação" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Precisa ser o Melhor" trigger="Reage mal quando outra pessoa recebe mais atenção ou reconhecimento.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Orgulho Ensaiado" trigger="Tem dificuldade para admitir dúvidas, erros ou admiração por um rival.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Acessório" cost="75" name="Óculos de voo profissionais" quantity="1" quickUse="Ajudam durante manobras velozes e completam sua imagem de campeão.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Lembrança" cost="10" name="Faixa de primeiro colocado" quantity="1" quickUse="Nimbus a exibe quando precisa lembrar aos outros de uma vitória antiga.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="14" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 3. Guarda Pluma Serena

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Guarda da área restrita | Pégaso | 3 | Bondade | D6 | D6 | D6 | 12 | 3 | 80 |

**Objetivo de cena:** Terminar o turno sem incidentes, invasões ou relatórios adicionais.

**Interpretação:** Cordial, cansado e apaixonado por romances dramáticos. Bloqueia passagens, mas não agride estudantes.

**Cutie Mark / habilidade especial:** Leitura Vigilante (D8) — Percebe detalhes estranhos enquanto lê, patrulha ou escuta uma longa história.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Vigilância | D6 | Principal | Mente | Percebe movimentações suspeitas e mudanças no ambiente. |
| Voar | D6 | Inerente | Corpo | Realiza patrulhas e alcança rapidamente pontos de observação. |
| Conhecimento de Romances | D8 | Adquirido | Mente | Conhece histórias dramáticas, autores e teorias sobre finais controversos. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Sonolento no Turno | Longos períodos de silêncio fazem seus olhos pesarem. |
| Só Mais um Capítulo | Uma conversa interessante sobre livros pode fazê-lo esquecer o relógio. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Chave da área restrita | Segurança | 1 | 0 | Abre o corredor protegido da biblioteca. |
| Romance dramático | Livro | 1 | 10 | É sua leitura atual e a melhor maneira de iniciar uma conversa longa. |
| Apito de guarda | Segurança | 1 | 15 | Chama reforços sem precisar atacar estudantes. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="80" bodyDie="6" characterName="Guarda Pluma Serena" charmDie="6" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="True" conditionWet="False" cutieMarkDescription="Percebe detalhes estranhos enquanto lê, patrulha ou escuta uma longa história." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Leitura Vigilante" elementOfHarmony="Bondade" friendshipCurrent="3" level="3" mindDie="6" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Terminar o turno sem incidentes, invasões ou relatórios adicionais." schemaVersion="7" staminaCurrent="12" staminaMax="12" staminaMaxAuto="12" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Percebe movimentações suspeitas e mudanças no ambiente." die="6" kind="Principal" linkedTrait="Mente" name="Vigilância" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Realiza patrulhas e alcança rapidamente pontos de observação." die="6" kind="Inerente" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Conhece histórias dramáticas, autores e teorias sobre finais controversos." die="8" kind="Adquirido" linkedTrait="Mente" name="Conhecimento de Romances" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Sonolento no Turno" trigger="Longos períodos de silêncio fazem seus olhos pesarem.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Só Mais um Capítulo" trigger="Uma conversa interessante sobre livros pode fazê-lo esquecer o relógio.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Segurança" cost="0" name="Chave da área restrita" quantity="1" quickUse="Abre o corredor protegido da biblioteca.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Livro" cost="10" name="Romance dramático" quantity="1" quickUse="É sua leitura atual e a melhor maneira de iniciar uma conversa longa.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Segurança" cost="15" name="Apito de guarda" quantity="1" quickUse="Chama reforços sem precisar atacar estudantes.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="15" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 4. Sr. Tomo Silencioso

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Mentor e guardião do Acervo | Pégaso | 5 | Honestidade | D4 | D10 | D8 | 14 | 5 | 120 |

**Objetivo de cena:** Proteger o Acervo e ensinar responsabilidade a quem entrou nele.

**Interpretação:** Idoso, sábio e atento. Fala baixo, espera respostas completas e percebe muito mais do que demonstra.

**Cutie Mark / habilidade especial:** Memória das Estantes (D10) — Recorda livros, visitantes e pequenos detalhes como se cada um ocupasse uma prateleira em sua mente.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Conhecimento Enciclopédico | D10 | Principal | Mente | Domina história, magia, artefatos e os segredos registrados na biblioteca. |
| Audição Lendária | D10 | Adquirido | Mente | Percebe ruídos mínimos, sussurros e livros colocados na estante errada. |
| Autoridade Silenciosa | D8 | Adquirido | Charme | Faz estudantes confessarem sem elevar a voz. |
| Voar | D4 | Inerente | Corpo | Voa de modo lento, preciso e cuidadoso entre estantes altas. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Tudo em sua Seção | Interrompe até uma emergência para corrigir um livro claramente fora do lugar. |
| Resposta Completa | Não aceita meias verdades quando sabe que alguém pode explicar melhor. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Chave mestra do Acervo | Segurança | 1 | 0 | Abre as áreas mais antigas e protegidas da biblioteca. |
| Catálogo encantado | Livro mágico | 1 | 100 | Localiza obras, visitantes registrados e alterações recentes nas estantes. |
| Chá calmante | Comida | 3 | 8 | Transforma uma conversa tensa em uma explicação mais honesta. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="120" bodyDie="4" characterName="Sr. Tomo Silencioso" charmDie="8" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Recorda livros, visitantes e pequenos detalhes como se cada um ocupasse uma prateleira em sua mente." cutieMarkDie="10" cutieMarkImageStyle="proportional" cutieMarkTalent="Memória das Estantes" elementOfHarmony="Honestidade" friendshipCurrent="5" level="5" mindDie="10" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Proteger o Acervo e ensinar responsabilidade a quem entrou nele." schemaVersion="7" staminaCurrent="14" staminaMax="14" staminaMaxAuto="14" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Domina história, magia, artefatos e os segredos registrados na biblioteca." die="10" kind="Principal" linkedTrait="Mente" name="Conhecimento Enciclopédico" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Percebe ruídos mínimos, sussurros e livros colocados na estante errada." die="10" kind="Adquirido" linkedTrait="Mente" name="Audição Lendária" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Faz estudantes confessarem sem elevar a voz." die="8" kind="Adquirido" linkedTrait="Charme" name="Autoridade Silenciosa" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Voa de modo lento, preciso e cuidadoso entre estantes altas." die="4" kind="Inerente" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="7" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="8" />
  </friends>
  <timeline>
    <__ndb__ id="9" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Tudo em sua Seção" trigger="Interrompe até uma emergência para corrigir um livro claramente fora do lugar.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Resposta Completa" trigger="Não aceita meias verdades quando sabe que alguém pode explicar melhor.">
      <__ndb__ id="12" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="10" />
  </quirks>
  <inventory>
    <item category="Segurança" cost="0" name="Chave mestra do Acervo" quantity="1" quickUse="Abre as áreas mais antigas e protegidas da biblioteca.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Livro mágico" cost="100" name="Catálogo encantado" quantity="1" quickUse="Localiza obras, visitantes registrados e alterações recentes nas estantes.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Comida" cost="8" name="Chá calmante" quantity="3" quickUse="Transforma uma conversa tensa em uma explicação mais honesta.">
      <__ndb__ id="16" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="13" />
  </inventory>
  <__ndb__ id="1" idGenerator="16" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 5. Mestre de Voo Hélio

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Autoridade da Academia | Pégaso | 6 | Honestidade | D8 | D8 | D8 | 16 | 5 | 150 |

**Objetivo de cena:** Conduzir um teste justo e descobrir quem realmente está preparado para voar.

**Interpretação:** Firme, justo e econômico nas palavras. Interrompe conflitos sem humilhar estudantes.

**Cutie Mark / habilidade especial:** Mestre do Céu (D10) — Lê correntes de ar, postura e intenção durante qualquer manobra de voo.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Voar | D10 | Principal | Corpo | Executa e demonstra manobras de elite com absoluta precisão. |
| Liderança | D10 | Adquirido | Charme | Comanda monitores e acalma multidões em situações tensas. |
| Avaliação de Voo | D8 | Adquirido | Mente | Identifica habilidade, nervosismo, riscos e sinais de trapaça. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Respostas Diretas | Perde a paciência com rodeios quando uma decisão importante precisa ser tomada. |
| Padrão Elevado | Espera muito de estudantes promissores e às vezes esquece como a pressão afeta iniciantes. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Prancheta de avaliação | Academia | 1 | 15 | Registra notas, observações e infrações durante o teste. |
| Apito de instrutor | Academia | 1 | 20 | Interrompe voos e chama atenção imediatamente. |
| Cronômetro de precisão | Utilidade | 1 | 50 | Mede cada etapa do percurso de voo. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="150" bodyDie="8" characterName="Mestre de Voo Hélio" charmDie="8" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Lê correntes de ar, postura e intenção durante qualquer manobra de voo." cutieMarkDie="10" cutieMarkImageStyle="proportional" cutieMarkTalent="Mestre do Céu" elementOfHarmony="Honestidade" friendshipCurrent="5" level="6" mindDie="8" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Conduzir um teste justo e descobrir quem realmente está preparado para voar." schemaVersion="7" staminaCurrent="16" staminaMax="16" staminaMaxAuto="16" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Executa e demonstra manobras de elite com absoluta precisão." die="10" kind="Principal" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Comanda monitores e acalma multidões em situações tensas." die="10" kind="Adquirido" linkedTrait="Charme" name="Liderança" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Identifica habilidade, nervosismo, riscos e sinais de trapaça." die="8" kind="Adquirido" linkedTrait="Mente" name="Avaliação de Voo" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Respostas Diretas" trigger="Perde a paciência com rodeios quando uma decisão importante precisa ser tomada.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Padrão Elevado" trigger="Espera muito de estudantes promissores e às vezes esquece como a pressão afeta iniciantes.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Academia" cost="15" name="Prancheta de avaliação" quantity="1" quickUse="Registra notas, observações e infrações durante o teste.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Academia" cost="20" name="Apito de instrutor" quantity="1" quickUse="Interrompe voos e chama atenção imediatamente.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Utilidade" cost="50" name="Cronômetro de precisão" quantity="1" quickUse="Mede cada etapa do percurso de voo.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="15" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 6. Monitora da Academia

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Segurança e disciplina | Pégaso | 3 | Lealdade | D8 | D6 | D6 | 14 | 3 | 70 |

**Objetivo de cena:** Manter estudantes e visitantes seguros sem transformar erros em acidentes.

**Interpretação:** Atenta, profissional e protetora. Prioriza contenção e diálogo antes de qualquer confronto.

**Cutie Mark / habilidade especial:** Contenção Segura (D8) — Intercepta quedas, corridas e confusões sem ferir quem está envolvido.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Voar | D8 | Inerente | Corpo | Intercepta, persegue e alcança rapidamente estudantes em perigo. |
| Contenção Segura | D8 | Principal | Corpo | Imobiliza ou redireciona alguém sem causar ferimentos. |
| Disciplina | D6 | Adquirido | Charme | Controla multidões e explica regras com clareza. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Segue o Procedimento | Tenta cumprir cada etapa oficial mesmo quando uma solução improvisada seria mais rápida. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Rede de resgate | Ferramenta | 1 | 20 | Segura quedas e contém objetos ou estudantes sem machucar. |
| Manual de procedimentos | Livro | 1 | 20 | Tem uma regra para quase toda confusão possível. |
| Kit de primeiros cascos | Cura | 3 | 40 | Cuida rapidamente de pequenos acidentes durante o treinamento. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="70" bodyDie="8" characterName="Monitora da Academia" charmDie="6" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Intercepta quedas, corridas e confusões sem ferir quem está envolvido." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Contenção Segura" elementOfHarmony="Lealdade" friendshipCurrent="3" level="3" mindDie="6" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Manter estudantes e visitantes seguros sem transformar erros em acidentes." schemaVersion="7" staminaCurrent="14" staminaMax="14" staminaMaxAuto="14" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Intercepta, persegue e alcança rapidamente estudantes em perigo." die="8" kind="Inerente" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Imobiliza ou redireciona alguém sem causar ferimentos." die="8" kind="Principal" linkedTrait="Corpo" name="Contenção Segura" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Controla multidões e explica regras com clareza." die="6" kind="Adquirido" linkedTrait="Charme" name="Disciplina" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Segue o Procedimento" trigger="Tenta cumprir cada etapa oficial mesmo quando uma solução improvisada seria mais rápida.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Ferramenta" cost="20" name="Rede de resgate" quantity="1" quickUse="Segura quedas e contém objetos ou estudantes sem machucar.">
      <__ndb__ id="12" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Livro" cost="20" name="Manual de procedimentos" quantity="1" quickUse="Tem uma regra para quase toda confusão possível.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Cura" cost="40" name="Kit de primeiros cascos" quantity="3" quickUse="Cuida rapidamente de pequenos acidentes durante o treinamento.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="11" />
  </inventory>
  <__ndb__ id="1" idGenerator="14" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 7. Revoada de Livros Encrenqueiros

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Ameaça mágica cômica | Criatura personalizada | 1 | Magia | D4 | D4 | D4 | 5 | 0 | 0 |

**Objetivo de cena:** Fazer barulho suficiente para denunciar os invasores da biblioteca.

**Interpretação:** Uma pequena multidão de livros irritantes e teatrais, mais interessada em denunciar do que machucar.

**Cutie Mark / habilidade especial:** Alarme Encadernado (D6) — Cada capa, página e lombada coopera para criar uma confusão impossível de ignorar.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Livrada na Cabeça | D4 | Principal | Corpo | Causa no máximo 1 Energia ou deixa o alvo distraído. |
| Investida ao Sino | D6 | Adquirido | Corpo | Tenta atingir sinos, dutos e objetos barulhentos para aumentar o alarme. |
| Retorno à Estante | D4 | Inerente | Livre | Ao chegar a zero Energia, cai fechada e deixa de agir. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Dramáticas Demais | Preferem uma denúncia espetacular a uma ação realmente eficiente. |
| Respeitam Leitores | Hesitam diante de alguém que organiza, protege ou lê um dos livros com cuidado. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Páginas soltas | Parte da criatura | 12 | 0 | Podem cobrir olhos, deixar pistas ou ser recolocadas para acalmar um livro. |
| Marcadores de fita | Parte da criatura | 6 | 0 | Enroscam em objetos e podem ser usados criativamente pelos jogadores. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="0" bodyDie="4" characterName="Revoada de Livros Encrenqueiros" charmDie="4" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Cada capa, página e lombada coopera para criar uma confusão impossível de ignorar." cutieMarkDie="6" cutieMarkImageStyle="proportional" cutieMarkTalent="Alarme Encadernado" elementOfHarmony="Magia" friendshipCurrent="0" level="1" mindDie="4" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Criatura personalizada" sceneObjective="Fazer barulho suficiente para denunciar os invasores da biblioteca." schemaVersion="7" staminaCurrent="5" staminaMax="5" staminaMaxAuto="8" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Causa no máximo 1 Energia ou deixa o alvo distraído." die="4" kind="Principal" linkedTrait="Corpo" name="Livrada na Cabeça" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Tenta atingir sinos, dutos e objetos barulhentos para aumentar o alarme." die="6" kind="Adquirido" linkedTrait="Corpo" name="Investida ao Sino" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Ao chegar a zero Energia, cai fechada e deixa de agir." die="4" kind="Inerente" linkedTrait="Livre" name="Retorno à Estante" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Dramáticas Demais" trigger="Preferem uma denúncia espetacular a uma ação realmente eficiente.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Respeitam Leitores" trigger="Hesitam diante de alguém que organiza, protege ou lê um dos livros com cuidado.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Parte da criatura" cost="0" name="Páginas soltas" quantity="12" quickUse="Podem cobrir olhos, deixar pistas ou ser recolocadas para acalmar um livro.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Parte da criatura" cost="0" name="Marcadores de fita" quantity="6" quickUse="Enroscam em objetos e podem ser usados criativamente pelos jogadores.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="14" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 8. Aurora Prisma

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Monitora de segurança mágica | Unicórnio | 3 | Magia | D4 | D8 | D6 | 12 | 3 | 90 |

**Objetivo de cena:** Impedir que pequenos erros mágicos se transformem em perigos reais.

**Interpretação:** Curiosa, inteligente e discretamente travessa. Ajuda a esconder erros inofensivos, mas não ignora riscos.

**Cutie Mark / habilidade especial:** Segurança Mágica (D8) — Reconhece proteções, alarmes e falhas mágicas antes que saiam de controle.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Telecinese | D8 | Inerente | Mente | Move objetos, manipula mecanismos e contém pequenos acidentes mágicos. |
| Segurança Mágica | D8 | Principal | Mente | Compreende proteções mágicas, runas, alarmes e formas seguras de desativá-los. |
| Improvisação | D6 | Adquirido | Mente | Encontra soluções rápidas com os recursos disponíveis. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Curiosidade Profissional | Não consegue ignorar uma magia estranha ou um mecanismo ainda não compreendido. |
| Eu Não Vi Nada | Tolera travessuras inofensivas por tempo demais antes de intervir. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Giz de runas | Magia | 12 | 25 | Marca, corrige ou neutraliza pequenos círculos mágicos. |
| Lanterna prismática | Magia | 1 | 55 | Revela rastros e resíduos de magia recente. |
| Luvas isolantes | Segurança | 1 | 40 | Permitem manipular objetos encantados com menos risco. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="90" bodyDie="4" characterName="Aurora Prisma" charmDie="6" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Reconhece proteções, alarmes e falhas mágicas antes que saiam de controle." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Segurança Mágica" elementOfHarmony="Magia" friendshipCurrent="3" level="3" mindDie="8" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Unicórnio" sceneObjective="Impedir que pequenos erros mágicos se transformem em perigos reais." schemaVersion="7" staminaCurrent="12" staminaMax="12" staminaMaxAuto="12" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Move objetos, manipula mecanismos e contém pequenos acidentes mágicos." die="8" kind="Inerente" linkedTrait="Mente" name="Telecinese" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Compreende proteções mágicas, runas, alarmes e formas seguras de desativá-los." die="8" kind="Principal" linkedTrait="Mente" name="Segurança Mágica" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Encontra soluções rápidas com os recursos disponíveis." die="6" kind="Adquirido" linkedTrait="Mente" name="Improvisação" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Curiosidade Profissional" trigger="Não consegue ignorar uma magia estranha ou um mecanismo ainda não compreendido.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Eu Não Vi Nada" trigger="Tolera travessuras inofensivas por tempo demais antes de intervir.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Magia" cost="25" name="Giz de runas" quantity="12" quickUse="Marca, corrige ou neutraliza pequenos círculos mágicos.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Magia" cost="55" name="Lanterna prismática" quantity="1" quickUse="Revela rastros e resíduos de magia recente.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Segurança" cost="40" name="Luvas isolantes" quantity="1" quickUse="Permitem manipular objetos encantados com menos risco.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="15" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 9. Brisa Curta

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Cadete informante | Pégaso | 1 | Riso | D4 | D6 | D6 | 10 | 4 | 25 |

**Objetivo de cena:** Descobrir o que está acontecendo e ajudar antes que alguém perceba que ouviu tudo.

**Interpretação:** Entusiasmado, nervoso e incapaz de guardar rumores interessantes.

**Cutie Mark / habilidade especial:** Rumores da Academia (D8) — Conecta conversas, horários e pequenos detalhes até descobrir quem sabe o quê.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Voar | D6 | Inerente | Corpo | Voa bem o bastante para acompanhar colegas e entregar recados. |
| Rumores da Academia | D8 | Principal | Mente | Sabe novidades, horários e histórias que circulam entre os estudantes. |
| Esconder-se | D4 | Adquirido | Corpo | Tenta desaparecer quando percebe que ouviu algo que não deveria. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Não Guarda Segredo | Uma novidade interessante escapa antes que perceba que deveria ficar em silêncio. |
| Lugar Errado, Hora Certa | Aparece inesperadamente no meio de cenas importantes. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Caderninho de horários | Academia | 1 | 5 | Contém horários oficiais e várias anotações não oficiais. |
| Cupcake de emergência | Comida | 1 | 3 | Ajuda a convencer alguém a compartilhar uma informação. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="25" bodyDie="4" characterName="Brisa Curta" charmDie="6" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Conecta conversas, horários e pequenos detalhes até descobrir quem sabe o quê." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Rumores da Academia" elementOfHarmony="Riso" friendshipCurrent="4" level="1" mindDie="6" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pégaso" sceneObjective="Descobrir o que está acontecendo e ajudar antes que alguém perceba que ouviu tudo." schemaVersion="7" staminaCurrent="10" staminaMax="10" staminaMaxAuto="10" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Voa bem o bastante para acompanhar colegas e entregar recados." die="6" kind="Inerente" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Sabe novidades, horários e histórias que circulam entre os estudantes." die="8" kind="Principal" linkedTrait="Mente" name="Rumores da Academia" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Tenta desaparecer quando percebe que ouviu algo que não deveria." die="4" kind="Adquirido" linkedTrait="Corpo" name="Esconder-se" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Não Guarda Segredo" trigger="Uma novidade interessante escapa antes que perceba que deveria ficar em silêncio.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Lugar Errado, Hora Certa" trigger="Aparece inesperadamente no meio de cenas importantes.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Academia" cost="5" name="Caderninho de horários" quantity="1" quickUse="Contém horários oficiais e várias anotações não oficiais.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Comida" cost="3" name="Cupcake de emergência" quantity="1" quickUse="Ajuda a convencer alguém a compartilhar uma informação.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="14" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 10. Engrenagem Doce

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Manutenção e apoio prático | Pônei terrestre | 3 | Generosidade | D8 | D6 | D4 | 14 | 3 | 110 |

**Objetivo de cena:** Consertar a Academia e impedir que estudantes transformem pequenos danos em grandes reformas.

**Interpretação:** Paciente, inventiva e prática. Conserta qualquer coisa enquanto reclama de quem quebrou.

**Cutie Mark / habilidade especial:** Reparos Criativos (D8) — Transforma ferramentas comuns e materiais esquecidos em soluções resistentes.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Reparos | D8 | Principal | Mente | Conserta mecanismos, móveis, portas e equipamentos da Academia. |
| Coração Intrépido | D6 | Inerente | Corpo | Enfrenta trabalhos difíceis e acidentes sem recuar. |
| Ferramentas Improvisadas | D8 | Adquirido | Mente | Usa objetos próximos de formas práticas e inesperadas. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Não Piorem Isso | Fica impaciente quando alguém mexe em um problema antes de explicar o que aconteceu. |
| Guarda Tudo que Pode Servir | Carrega peças e objetos esquecidos porque talvez sejam úteis depois. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Caixa de ferramentas | Ferramenta | 1 | 80 | Contém ferramentas para reparos e soluções improvisadas. |
| Corda de 15 metros | Ferramenta | 1 | 5 | Prende, ergue ou estabiliza objetos durante um conserto. |
| Peças sobressalentes | Material | 8 | 30 | Substituem pequenas partes quebradas ou viram mecanismos improvisados. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="110" bodyDie="8" characterName="Engrenagem Doce" charmDie="4" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Transforma ferramentas comuns e materiais esquecidos em soluções resistentes." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Reparos Criativos" elementOfHarmony="Generosidade" friendshipCurrent="3" level="3" mindDie="6" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Pônei terrestre" sceneObjective="Consertar a Academia e impedir que estudantes transformem pequenos danos em grandes reformas." schemaVersion="7" staminaCurrent="14" staminaMax="14" staminaMaxAuto="14" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Conserta mecanismos, móveis, portas e equipamentos da Academia." die="8" kind="Principal" linkedTrait="Mente" name="Reparos" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Enfrenta trabalhos difíceis e acidentes sem recuar." die="6" kind="Inerente" linkedTrait="Corpo" name="Coração Intrépido" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Usa objetos próximos de formas práticas e inesperadas." die="8" kind="Adquirido" linkedTrait="Mente" name="Ferramentas Improvisadas" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Não Piorem Isso" trigger="Fica impaciente quando alguém mexe em um problema antes de explicar o que aconteceu.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Guarda Tudo que Pode Servir" trigger="Carrega peças e objetos esquecidos porque talvez sejam úteis depois.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Ferramenta" cost="80" name="Caixa de ferramentas" quantity="1" quickUse="Contém ferramentas para reparos e soluções improvisadas.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Ferramenta" cost="5" name="Corda de 15 metros" quantity="1" quickUse="Prende, ergue ou estabiliza objetos durante um conserto.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Material" cost="30" name="Peças sobressalentes" quantity="8" quickUse="Substituem pequenas partes quebradas ou viram mecanismos improvisados.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="15" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```

---

## 11. Lume Marinho

| Papel | Raça | Nível | Elemento | Corpo | Mente | Charme | Energia | Amizade | Bits |
|---|---|---|---|---|---|---|---|---|---|
| Mensageiro e estudante visitante | Criatura personalizada | 2 | Bondade | D6 | D6 | D6 | 12 | 4 | 55 |

**Objetivo de cena:** Entregar a mensagem certa sem piorar a confusão que encontrou.

**Interpretação:** Hipogrifo calmo, observador e prestativo. Frequentemente chega com a mensagem certa na hora errada.

**Cutie Mark / habilidade especial:** Mensageiro Preciso (D8) — Encontra destinatários e caminhos seguros mesmo quando todos parecem estar em movimento.

### Talentos

| Talento | Dado | Tipo | Vínculo | Uso |
|---|---|---|---|---|
| Voar | D8 | Inerente | Corpo | Cruza longas distâncias e se adapta bem a correntes de ar incomuns. |
| Localizar Destinatários | D6 | Principal | Mente | Segue pistas, rotinas e informações até encontrar a pessoa certa. |
| Diplomacia | D6 | Adquirido | Charme | Entrega notícias difíceis com calma e evita mal-entendidos. |

### Caprichos

| Capricho | Gatilho |
|---|---|
| Mensagem Primeiro | Insiste em concluir uma entrega mesmo quando chega no meio de uma situação delicada. |
| Educado Demais | Demora a interromper alguém, ainda que a informação seja urgente. |

### Alforge

| Item | Categoria | Qtd. | Bits | Uso rápido |
|---|---|---|---|---|
| Bolsa de mensageiro | Viagem | 1 | 45 | Protege cartas, pequenos pacotes e documentos da chuva e do vento. |
| Mapa ilustrado da Academia | Exploração | 1 | 15 | Ajuda a localizar salas, estudantes e rotas alternativas. |
| Selo de entrega urgente | Utilidade | 3 | 10 | Marca uma mensagem como prioritária e difícil de ignorar. |

### Backup XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<database bits="55" bodyDie="6" characterName="Lume Marinho" charmDie="6" conditionConfused="False" conditionHappy="False" conditionHungry="False" conditionHurt="False" conditionInspired="False" conditionScared="False" conditionTired="False" conditionWet="False" cutieMarkDescription="Encontra destinatários e caminhos seguros mesmo quando todos parecem estar em movimento." cutieMarkDie="8" cutieMarkImageStyle="proportional" cutieMarkTalent="Mensageiro Preciso" elementOfHarmony="Bondade" friendshipCurrent="4" level="2" mindDie="6" pendingDieReduction="False" playerName="MESTRE" portraitImageStyle="proportional" race="Criatura personalizada" sceneObjective="Entregar a mensagem certa sem piorar a confusão que encontrou." schemaVersion="7" staminaCurrent="12" staminaMax="12" staminaMaxAuto="12" talentsSeeded="True">
  <journalRich>
    <__ndb__ id="2" />
  </journalRich>
  <talents>
    <item description="Cruza longas distâncias e se adapta bem a correntes de ar incomuns." die="8" kind="Inerente" linkedTrait="Corpo" name="Voar" usedThisAdventure="False">
      <__ndb__ id="4" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Segue pistas, rotinas e informações até encontrar a pessoa certa." die="6" kind="Principal" linkedTrait="Mente" name="Localizar Destinatários" usedThisAdventure="False">
      <__ndb__ id="5" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <item description="Entrega notícias difíceis com calma e evita mal-entendidos." die="6" kind="Adquirido" linkedTrait="Charme" name="Diplomacia" usedThisAdventure="False">
      <__ndb__ id="6" t_description="S" t_die="6" t_kind="S" t_linkedTrait="S" t_name="S" t_usedThisAdventure="B" />
    </item>
    <__ndb__ id="3" />
  </talents>
  <friends>
    <__ndb__ id="7" />
  </friends>
  <timeline>
    <__ndb__ id="8" />
  </timeline>
  <quirks>
    <item earnedFriendship="False" name="Mensagem Primeiro" trigger="Insiste em concluir uma entrega mesmo quando chega no meio de uma situação delicada.">
      <__ndb__ id="10" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <item earnedFriendship="False" name="Educado Demais" trigger="Demora a interromper alguém, ainda que a informação seja urgente.">
      <__ndb__ id="11" t_earnedFriendship="B" t_name="S" t_trigger="S" />
    </item>
    <__ndb__ id="9" />
  </quirks>
  <inventory>
    <item category="Viagem" cost="45" name="Bolsa de mensageiro" quantity="1" quickUse="Protege cartas, pequenos pacotes e documentos da chuva e do vento.">
      <__ndb__ id="13" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Exploração" cost="15" name="Mapa ilustrado da Academia" quantity="1" quickUse="Ajuda a localizar salas, estudantes e rotas alternativas.">
      <__ndb__ id="14" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <item category="Utilidade" cost="10" name="Selo de entrega urgente" quantity="3" quickUse="Marca uma mensagem como prioritária e difícil de ignorar.">
      <__ndb__ id="15" t_category="S" t_cost="6" t_name="S" t_quantity="6" t_quickUse="S" />
    </item>
    <__ndb__ id="12" />
  </inventory>
  <__ndb__ id="1" idGenerator="15" t_bits="6" t_bodyDie="6" t_characterName="S" t_charmDie="6" t_conditionConfused="B" t_conditionHappy="B" t_conditionHungry="B" t_conditionHurt="B" t_conditionInspired="B" t_conditionScared="B" t_conditionTired="B" t_conditionWet="B" t_cutieMarkDescription="S" t_cutieMarkDie="6" t_cutieMarkImageStyle="S" t_cutieMarkTalent="S" t_elementOfHarmony="S" t_friendshipCurrent="6" t_level="I" t_mindDie="6" t_pendingDieReduction="B" t_playerName="S" t_portraitImageStyle="S" t_race="S" t_sceneObjective="S" t_schemaVersion="6" t_staminaCurrent="6" t_staminaMax="6" t_staminaMaxAuto="6" t_talentsSeeded="B" />
</database>
```
