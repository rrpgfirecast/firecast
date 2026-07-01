# Modelo de dados atual e base para gerador de NPC

Este documento descreve a estrutura atual da ficha `Tails of Equestria` no
Firecast. Ele serve como referência para manutenção, backups e para a futura
criação de um gerador de NPC.

## 1. Como ler o backup XML

O backup possui três tipos de informação:

1. Atributos do elemento `<database>`: valores únicos da ficha, como nome,
   raça, dados de atributo, Energia e Bits.
2. Nós filhos, como `<talents>`, `<quirks>` e `<inventory>`: listas que podem
   possuir vários itens.
3. Nós `<__ndb__>` e atributos `t_*`: metadados internos do Firecast/NDB.

Os blocos `<__ndb__>`, seus IDs, `idGenerator` e atributos `t_*` não são regras
do personagem. Eles devem ser ignorados por leitores humanos e nunca devem ser
fabricados manualmente pelo futuro gerador de NPC.

O gerador deverá preencher os campos da ficha e criar itens usando Lua/NDB.
O próprio Firecast será responsável por produzir os metadados corretos quando
o usuário gerar um backup.

### Detalhes de serialização

- O arquivo é XML em UTF-8.
- No XML, booleanos aparecem como `True` ou `False`. Em Lua, use `true` ou
  `false`.
- Números aparecem entre aspas no XML porque são atributos, mas o NDB preserva
  seus tipos usando metadados internos.
- Campos sem valor podem ser completamente omitidos do backup.
- Textos com `&`, `<`, `>` ou aspas precisam ser escapados pelo serializador.
- O caminho seguro é sempre deixar `NDB.exportXML` e `NDB.importXML` cuidarem
  da serialização.

## 2. Resumo do personagem do backup analisado

### Identidade

- Personagem: Vini
- Jogador: MESTRE
- Nível: 3
- Raça: Pégaso
- Elemento da Harmonia: Riso
- Objetivo atual: impedir que Vini seja expulso da academia de voo com ajuda
  de seus amigos.

### Atributos e recursos

- Corpo: D4
- Mente: D6
- Charme: D10
- Energia: 10 / 10
- Amizade atual: 2
- Bits: 400
- Condição ativa: Cansado

O máximo automático de Energia é `Corpo + Mente`. Neste caso, `4 + 6 = 10`.

### Cutie Mark

- Talento especial: Bom de Lábia
- Dado: D6
- Efeito descrito: ajuda Vini a acalmar, distorcer levemente a verdade sem
  mentir ou convencer alguém durante uma conversa.
- A imagem usa enquadramento proporcional.

### Talentos

- Coração Intrépido: D4, Adquirido, ligado a Corpo.
- Arranjo de Nuvens: D4, Adquirido, ligado a Corpo.
- Toque de Cura: D4, Adquirido, ligado a Charme.

Nenhum dos talentos está marcado como usado nesta aventura.

### Caprichos

- Eueueueueu!: já marcado como tendo rendido Amizade.
- Bagunçado: ainda não marcado como tendo rendido Amizade.

### Alforge

- Roupas elegantes: 1 unidade, 100 Bits.
- Pomada de pônei: 5 unidades, 25 Bits.
- Kit de primeiros cascos: 3 unidades, 40 Bits.
- Chá calmante: 3 unidades, 8 Bits.
- Kit de pegadinha: 1 unidade, 20 Bits.

### Relações e história

- Existe um amigo ainda não preenchido, chamado `Novo Amigo`.
- A linha do tempo está vazia.
- O diário livre ainda não possui conteúdo.

## 3. Campos únicos da ficha

| Campo | Tipo lógico | Significado e comportamento |
| --- | --- | --- |
| `characterName` | texto | Nome apresentado nas rolagens e na ficha. |
| `playerName` | texto | Nome do jogador ou responsável pelo personagem. |
| `race` | texto/opção | Raça ou tipo da criatura. |
| `level` | inteiro | Nível atual. A ficha ainda não recalcula outros campos por nível. |
| `elementOfHarmony` | texto/opção | Valor que guia o personagem. |
| `portraitURL` | texto/URL | Imagem do retrato armazenada pelo Firecast. |
| `portraitImageStyle` | opção | Enquadramento do retrato. |
| `sceneObjective` | texto | Objetivo ou situação da cena atual. |
| `bodyDie` | dado | Corpo: força, resistência e ações físicas. |
| `mindDie` | dado | Mente: raciocínio, percepção e conhecimento. |
| `charmDie` | dado | Charme: presença, empatia e interação social. |
| `staminaCurrent` | número | Energia disponível atualmente. |
| `staminaMax` | número | Máximo efetivo de Energia. |
| `staminaMaxAuto` | número interno | Último máximo calculado automaticamente. |
| `friendshipCurrent` | número | Pontos de Amizade disponíveis. Atualmente não possui limite máximo. |
| `bits` | número | Dinheiro atual. Adicionar itens do catálogo não desconta Bits. |
| `cutieMarkURL` | texto/URL | Imagem da Cutie Mark. |
| `cutieMarkImageStyle` | opção | Enquadramento da Cutie Mark. |
| `cutieMarkTalent` | texto | Nome do talento especial representado pela Cutie Mark. |
| `cutieMarkDescription` | texto | Explicação narrativa ou mecânica do talento especial. |
| `cutieMarkDie` | dado | Dado rolado diretamente pelo botão da Cutie Mark. |
| `pendingDieReduction` | booleano | Indica que o próximo teste terá seus dados iniciais rebaixados. |
| `pendingDieReductionSource` | texto opcional | Nome do Capricho que causou a redução pendente. |
| `schemaVersion` | número interno | Versão da estrutura da ficha. Atualmente é `7`. |
| `talentsSeeded` | booleano interno | Impede que os talentos iniciais sejam criados repetidamente. |

### Valores válidos importantes

- Escala de dados: `D4`, `D6`, `D8`, `D10`, `D12`, `D20`.
- Raças do seletor: `Pônei terrestre`, `Unicórnio`, `Pégaso`,
  `Criatura personalizada`, `Alicórnio`.
- Elementos da Harmonia: `Bondade`, `Generosidade`, `Riso`, `Lealdade`,
  `Honestidade`, `Magia`.
- Estilos de imagem: `proportional`, `autoFit`, `originalSize`, `stretch`.

## 4. Condições

Todas as condições são booleanas. `True` significa ativa e `False` significa
inativa.

| Campo | Exibição |
| --- | --- |
| `conditionHappy` | Feliz |
| `conditionTired` | Cansado |
| `conditionScared` | Assustado |
| `conditionInspired` | Inspirado |
| `conditionHurt` | Machucado |
| `conditionConfused` | Confuso |
| `conditionHungry` | Com fome |
| `conditionWet` | Molhado |

Atualmente as condições são marcadores narrativos. Elas não alteram rolagens
automaticamente.

## 5. Coleções repetíveis

### `talents`

Cada `<item>` representa um Talento ou Coisa Incrível.

| Campo | Tipo | Significado |
| --- | --- | --- |
| `name` | texto | Nome do talento. |
| `description` | texto | Regra ou explicação do talento. |
| `die` | dado | Dado próprio do talento. |
| `kind` | texto/opção | Classificação, como Adquirido, Inerente ou Principal. |
| `linkedTrait` | opção | `Corpo`, `Mente`, `Charme` ou `Livre`. |
| `usedThisAdventure` | booleano | Marcador visual de uso nesta aventura. |

Quando um talento está ligado a Corpo, Mente ou Charme:

- Rolar o atributo oferece o talento ligado como opção.
- Rolar o talento também rola o atributo ligado.
- Os resultados não são somados; o maior resultado é usado.
- Cada dado pode ativar separadamente a Técnica do Casco Explosivo.

### `quirks`

Cada `<item>` representa um Capricho.

| Campo | Tipo | Significado |
| --- | --- | --- |
| `name` | texto | Nome do Capricho. |
| `trigger` | texto | Situação em que o Capricho atrapalha ou move a história. |
| `earnedFriendship` | booleano | Marca visual de que ele já rendeu Amizade. |

O botão de redução arma `pendingDieReduction` para o próximo teste. O marcador
`earnedFriendship` não aumenta automaticamente `friendshipCurrent`.

### `inventory`

Cada `<item>` representa algo no Alforge.

| Campo | Tipo | Significado |
| --- | --- | --- |
| `name` | texto | Nome do item. |
| `category` | texto | Tipo ou categoria livre do item. |
| `quantity` | inteiro | Quantidade carregada. |
| `cost` | inteiro | Custo de referência em Bits. |
| `quickUse` | texto | Utilidade, efeito ou forma rápida de uso. |

### `friends`

Cada `<item>` representa uma amizade, promessa ou vínculo.

| Campo | Tipo | Significado |
| --- | --- | --- |
| `name` | texto | Nome do amigo. |
| `relationship` | texto | Relação, promessa ou forma como se conheceram. |
| `description` | texto | Observação adicional sobre o vínculo. |

### `timeline`

Cada `<item>` representa um momento importante.

| Campo | Tipo | Significado |
| --- | --- | --- |
| `moment` | texto | Nome da aventura, sessão ou momento. |
| `event` | texto | O que aconteceu. |
| `impact` | texto | O que mudou depois do acontecimento. |

### `journalRich`

É o diário livre de aventura em formato rico do Firecast. Pode guardar texto
formatado e estruturas internas próprias. O futuro gerador de NPC deve deixá-lo
vazio por padrão.

## 6. Regras automáticas atualmente implementadas

### Energia

- Máximo sugerido: `bodyDie + mindDie`.
- Se o máximo ainda estiver seguindo o valor automático, ele acompanha mudanças
  em Corpo ou Mente.
- Se o máximo tiver sido personalizado ou importado, a ficha preserva esse
  valor.
- A Energia atual nunca ultrapassa o máximo e nunca fica abaixo de zero.

### Redução causada por Capricho

- A redução fica pendente até a próxima rolagem.
- No próximo teste, cada dado inicial desce um passo na escala.
- A redução é consumida depois desse teste.
- Dados posteriores gerados pelo Casco Explosivo sobem normalmente.

### Técnica do Casco Explosivo

- Se um dado mostrar seu valor máximo, o próximo dado da escala é rolado.
- A cadeia pode continuar até D20.
- O maior valor numérico de toda a rolagem é usado.
- Em testes de Atributo + Talento, os dois dados possuem cadeias independentes.

### Recursos sem automação completa

- Amizade não possui limite máximo automático.
- Marcar um Capricho como premiado não adiciona Amizade automaticamente.
- Adicionar um item do catálogo não desconta Bits.
- Condições não modificam testes automaticamente.
- Nível não recalcula atributos ou talentos automaticamente.

## 7. Estrutura recomendada para o futuro gerador de NPC

O gerador deverá trabalhar com um modelo lógico próprio e depois aplicar esse
modelo na ficha usando Lua/NDB. Exemplo conceitual:

```lua
local npc = {
    role = "Coadjuvante",
    characterName = "Brisa de Primavera",
    race = "Pégaso",
    level = 2,
    elementOfHarmony = "Bondade",
    sceneObjective = "Encontrar as nuvens desaparecidas antes da festa.",

    bodyDie = 6,
    mindDie = 4,
    charmDie = 8,
    friendshipCurrent = 2,
    bits = 40,

    cutieMarkTalent = "Ouvir o Vento",
    cutieMarkDescription = "Percebe mudanças no clima e caminhos seguros.",
    cutieMarkDie = 6,

    talents = {
        {
            name = "Voar",
            die = 6,
            kind = "Inerente",
            linkedTrait = "Corpo",
            description = "Move-se pelo céu e alcança lugares altos."
        }
    },

    quirks = {
        {
            name = "Super Tímido",
            trigger = "Tem dificuldade para falar diante de grupos."
        }
    },

    inventory = {
        {
            name = "Óculos de voo",
            category = "Viagem",
            quantity = 1,
            cost = 25,
            quickUse = "Protege os olhos durante voos rápidos."
        }
    }
};
```

### Campos que o gerador deve definir

- Identidade, raça, nível, elemento e objetivo.
- Corpo, Mente, Charme e recursos apropriados.
- Cutie Mark ou habilidade especial.
- Talentos e seus vínculos.
- Um ou mais Caprichos.
- Itens relevantes para a função narrativa.
- Condições iniciais somente quando fizer sentido.

### Campos que o gerador deve deixar para a ficha

- `staminaMaxAuto`.
- `schemaVersion`.
- `talentsSeeded`, conforme a estratégia usada para evitar talentos padrão.
- Todos os nós `<__ndb__>`, IDs e atributos `t_*`.
- URLs de imagens, exceto quando o usuário fornecer uma imagem.
- Diário, linha do tempo e amizades, salvo quando forem parte do conceito do NPC.

### Arquitetura sugerida

1. O usuário escolhe a função narrativa: figurante, coadjuvante, rival, mentor,
   ameaça ou criatura especial.
2. Escolhe o nível de desafio ou importância.
3. O gerador monta um modelo lógico de NPC.
4. Um popup mostra uma prévia antes de aplicar.
5. Ao confirmar, a ficha limpa ou substitui somente os campos escolhidos.
6. A criação das listas usa `recordList:append()` ou nós criados pela API NDB.
7. O backup existente pode ser usado antes da aplicação para permitir reversão.

Essa separação permitirá que o gerador evolua sem depender do formato interno
do XML exportado pelo Firecast.
