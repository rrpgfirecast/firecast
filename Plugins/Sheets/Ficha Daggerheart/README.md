# Ficha Daggerheart · Códice & Vigília (RRPG Firecast · SDK3)

Ficha de Daggerheart (Livro Básico + *Hope & Fear*) portada dos modelos **Códice** (claro) e **Vigília** (escuro)
do Figma. Os dois são **temas da mesma ficha**: o jogador troca pelo ícone ⚙ no topo da ficha (fica salvo na ficha).

## Como compilar e instalar
1. Instale o SDK3 do Firecast (ferramenta `rdk`) — https://sdk3.firecast.app
2. Abra um terminal nesta pasta e rode `rdk c` (compila) e `rdk i` (instala) — ou clique duas vezes em `rdk c i.bat`.
3. O pacote gerado fica em `output/Ficha Daggerheart Codice.rpk`.

`module.xml` usa o **mesmo id e dataType da ficha original** (`Beloved.daggerheart`), com versão 3.0.0: ao instalar,
ela substitui a 2.x e as fichas existentes abrem no layout novo (veja “v3.0.0 — migração”).

## Estrutura
| arquivo | conteúdo |
|---|---|
| `daggerheart.lfm` | ficha principal: cabeçalho, abas customizadas, Frente, Inventário, Cartas, Personagem, popup de tema |
| `item*.lfm` | formulários das listas (Experiências, Itens rápidos, Armas de reserva, Cofre de cartas, Diário de sessões) |
| `cardDataBase.xml` | banco de cartas (gerado de `fonte-gerador/db/banco_cartas.xlsx`): nome, ilustração, carta inteira, texto e — nas cartas de domínio — domínio, nível, Recall e tipo |
| `images/codice`, `images/vigilia` | marcadores (Esperança, PV, Estresse, armadura, ouro) e ícones em 2× por tema |
| `fonts/` | Inter e Bitter (SIL OFL). O Firecast só escolhe Regular/Itálico/Negrito por família, então a SemiBold do design vai embutida como o “Bold” de cada família |
| `../fonte-gerador/` | (fora da pasta do plugin) scripts Python que geram os `.lfm`. Não coloque dentro da pasta do plugin: o `rdk` tenta compilar os `.lua` de lá |

## Como o tema funciona
Cada cor/raio/imagem que muda entre Códice e Vigília é um *token* (`bg`, `surface`, `accent`, `rCard`…).
O gerador grava no Lua uma tabela `{controle, propriedade, token}`; `aplicarTema()` percorre essa tabela,
troca `form.theme` (light/dark dos controles nativos) e recalcula estados (aba ativa, atributo marcado, cartas na mão).
As listas observam o campo `temaFicha` da ficha e trocam junto.

## Correções em relação ao Figma (os ~5%)
- **Retrato do personagem** adicionado ao cabeçalho (o Firecast usa o avatar; o modelo não tinha).
- **Faixa “Estudo visual · RRPG Firecast”** removida (era moldura de apresentação do estudo).
- **Botões de rolagem**: cada atributo ganhou “Rolar” (2d12 Esperança × Medo); armas ganharam “Rolar ataque” e
  “Rolar dano” (dados de dano = Proficiência).
- **Contadores dinâmicos**: PV, Estresse e espaços de armadura mostram só as caixas até o máximo informado (até 12).
- **Experiências, itens rápidos, armas de reserva, cofre e diário** viraram listas reais (“+ Registrar …”).
- **Cartas**: a ilustração recortada do Figma não existe no Firecast (não há recorte de imagem), então a carta
  inteira aparece à esquerda, com zoom ao clicar; o texto da carta é um campo de anotação.
- **Cofre**: a busca por nome e o filtro por domínio do modelo foram omitidos (o `recordList` não filtra);
  no lugar, cada carta tem “Equipar” (vai para o primeiro espaço livre da mão) e a mão tem “Guardar ↓”.
- **Configurações** (ícone ⚙): tema, cores de Esperança/Medo e opção de gerenciar Esperança automaticamente
  (ganha em resultado com Esperança/crítico, gasta 1 por Experiência usada).

## Para testar no Firecast
- Trocar tema nas duas direções, com listas preenchidas.
- Rolar atributo com Experiência marcada; conferir cor e contagem de Esperança.
- Conferir largura estreita (celular) e as fontes Inter/Bitter.

## v1.1.0 — ajustes após o primeiro teste no Firecast
- Títulos de card e o nome DAGGERHEART não quebram mais em duas linhas (o `autoSize` do label quebrava o texto;
  agora a largura é calculada).
- Fontes SemiBold (Inter/Bitter) não carregavam no Firecast; agora são o “negrito” da família.
- Cards cortados nas laterais: removido o padding negativo das linhas de cards.
- Itens alinhados à direita (cofre, itens rápidos, experiências, cabeçalho) apareciam fora de ordem; cada linha
  agora aninha os itens para a ordem ficar garantida.
- Todos os campos editáveis ganharam fundo visível.
- Subclasse: três cartas (Fundação, Especialização, Maestria), cada uma com imagem, zoom, chat e limpar,
  como na ficha original (a 2ª aceita F/S e a 3ª F/S/M, para multiclasse).
- Retrato voltou para a esquerda do nome.

## v1.2.0 — cartas de domínio no formato de carta
- Cada espaço da mão agora tem a proporção de uma carta física (largura × 1,4), recalculada quando a janela muda
  de tamanho: ilustração em cima com nível (canto esquerdo) e custo de Recall (canto direito), título, domínio/tipo,
  seletor da carta, texto e ações no rodapé (Guardar · Chat · Consultar).
- 3 cartas por linha em telas largas, 2 em médias, 1 no celular.
- O código já aceita o banco de cartas no formato novo: `imagensDomainCards["[Domínio] Nome"]` pode ser uma URL
  (formato atual) ou uma tabela `{imagem=, nivel=, custo=, tipo=, texto=}`. Ao escolher a carta, nível, custo,
  tipo e texto são preenchidos automaticamente (só quando o usuário escolhe, nunca ao abrir a ficha).

## v1.3.0 — banco de cartas completo
- 210 cartas de domínio (Livro Básico + Hope & Fear), 24 ancestralidades, 15 comunidades, 6 transformações e
  26 subclasses × 3 cartas, com texto em inglês extraído dos livros (Domain Card Reference e capítulos de criação).
- Cada carta tem: **ilustração** (mostrada no card; dg-builder.com), **carta inteira** (botão Consultar; imgur da
  ficha original) e **texto**. Domínio também tem nível, Recall e tipo.
- Ao escolher uma carta, o texto (e nível/Recall/tipo, nas de domínio) é preenchido automaticamente. Abrir a ficha
  nunca sobrescreve anotações.
- Mixed Ancestry / Custom Transformation: card e Consultar mostram a imagem enviada pelo jogador.
- ⚙ Configurações → “Mostrar a carta inteira no lugar da ilustração”, caso as ilustrações (.webp) não carreguem.
- Para editar o banco: altere `fonte-gerador/db/banco_cartas.xlsx` e rode `python3 build.py <pasta>` (ou só
  `python3 db/gerar_banco.py db/banco_cartas.xlsx cardDataBase.xml`). Não altere a coluna “Chave”.

## v1.4.0 — retrato maior e Ação × Reação
- **Retrato** do personagem maior (116 px, antes 76), ao lado do nome; pronomes e ancestralidade · comunidade
  ganharam linhas próprias. Em telas estreitas o retrato diminui para 84 px para não espremer o nome.
- **Rolagens de atributo** agora têm dois botões: **Ação** (destacado) e **Reação**. Clicar no nome do atributo
  continua rolando uma ação; “Rolar ataque” das armas é sempre ação.
  - Ação: lembretes como antes (+1 Esperança · o Mestre ganha 1 Medo · crítico: ganhe 1 Esperança e limpe 1 Estresse)
    e ganho automático de Esperança, se ligado.
  - Reação (Livro Básico p. 99): o resultado mostra com Esperança/Medo, mas com o lembrete “reação: não gera
    Esperança nem Medo”; nada é ganho automaticamente. Crítico na reação lembra que o personagem ignora os efeitos
    que ainda o afetariam num sucesso (dano, Estresse…), sem ganhar Esperança nem limpar Estresse.
  - Experiências marcadas continuam somando e custando 1 Esperança também em reações.

## v1.5.0 — subclasse com classe → carta e regras de multiclasse
Cada espaço de subclasse agora tem duas listas, como os domínios: **Classe** e depois **Carta**. As opções seguem
o Livro Básico (p. 109–111): a carta de subclasse aprimorada só existe nos patamares 3 e 4, e a multiclasse
(que ocupa as duas marcações) risca uma dessas melhorias — por isso um personagem multiclasse nunca chega à Maestria.

| situação (marcada em Frente → Progressão) | Espaço 1 | Espaço 2 | Espaço 3 |
|---|---|---|---|
| sem multiclasse | Fundação de qualquer classe | Especialização da sua subclasse | Maestria da sua subclasse |
| multiclasse no patamar 3 | idem | **Fundação** de outra classe | **Especialização** da subclasse original *ou* da nova |
| multiclasse no patamar 4 | idem | Especialização da sua subclasse | **Fundação** de outra classe |

- O rótulo do espaço muda junto (ex.: “FUNDAÇÃO · MULTICLASSE”).
- Ao escolher a classe no espaço 1, o campo Classe do cabeçalho é preenchido se estiver vazio.
- Fichas antigas continuam funcionando: a classe é deduzida da carta já salva. Se uma carta salva deixar de ser
  válida (ex.: o jogador desmarcou a multiclasse), ela **não é apagada** — aparece com ⚠ para o jogador decidir.
- Observação de regra: o livro não diz explicitamente se a Especialização após multiclasse pode ser da subclasse
  nova; a ficha permite as duas e deixa a decisão com a mesa.

## v1.6.0 — cartas em português e Dados de Dualidade configuráveis
- **⚙ → Idioma das cartas**: *English (original)* ou *Português (dg-builder)*. Em português mudam o nome das cartas
  (títulos e listas, inclusive classes e subclasses), o texto e o **Consultar**.
  - O dg-builder não tem imagem da carta inteira em português (o site desenha a carta por cima da ilustração);
    por isso, em português, o Consultar monta a carta: ilustração, nome, domínio · nível · Recall · tipo e o texto
    traduzido. Em inglês continua mostrando a imagem da carta inteira.
  - O que fica salvo na ficha é sempre a carta (chave em inglês), então trocar de idioma não perde nada.
    Textos que o jogador já editou não são sobrescritos ao trocar.
  - Nomes em português ficam nas colunas `NomePT` / `TextoPT` da planilha `db/banco_cartas.xlsx`
    (210 domínios, 24 ancestralidades, 15 comunidades, 6 transformações, 78 cartas de subclasse e as classes).
- **⚙ → Dados de Dualidade**: escolha o dado de Esperança e o de Medo (d4 a d20; padrão d12). Com dados diferentes
  a rolagem vira `1dX+1dY`; o primeiro é sempre a Esperança. Quando não é 2d12, o título de Atributos avisa.
- Mensagens das rolagens conforme o ajuste do José (Resultado: …, crítico destacado, reação sem lembrete de crítico).

## v1.6.1 — cores de Esperança/Medo (contorno de bug do SDK3)
- O `colorComboBox` do SDK3 não funciona direito. As cores agora seguem a solução da ficha original: a amostra de
  cor abre uma lista de 30 cores prontas (comboBox comum, oculto), há um campo para digitar o hex (#RRGGBB) e o
  botão “Padrão”. A amostra, o campo e os pontos do cabeçalho se atualizam juntos.
- Cores salvas pelo seletor antigo com transparência (#AARRGGBB) passam a ser lidas corretamente no chat.

## v3.0.0 — migração da ficha original
- Id do plugin e `dataType` iguais aos da ficha original (`Beloved.daggerheart`); versão 3.0.0 (> 2.1.5), então o
  Firecast trata como atualização. As fichas guardam os dados pelo `dataType`, por isso abrem direto na ficha nova.
- 173 campos têm o mesmo nome nas duas fichas e são lidos como estão (atributos, PV, Estresse, Esperança, armadura,
  armas principal/secundária, ouro, cartas, progressão, descrição, anotações 1–5, retrato, cores…).
- Na primeira abertura, `migrarFichaAntiga()` converte o que mudou de formato (uma vez só, marca `migracaoV3`):
  Experiências 1–5 → lista de Experiências · Inventário (7 espaços) → itens rápidos · armas de inventário 1–2 →
  armas de reserva · caixas de Proficiência → número · texto das cartas já escolhidas é preenchido ·
  Ancestralidade/Comunidade (texto livre), Limiares (texto livre) e anotações 6–9 → acrescentados em “Outras notas”.
- **Nada é apagado**: os campos antigos continuam salvos, então voltar para a 2.x ainda mostra tudo.
- Fichas antigas passam a usar o tema Vigília e o “Gerenciar Esperança automaticamente” vem ligado (dá para
  desligar no ⚙).

## v3.1.0 — textos das cartas em parágrafos e com negrito
- Base: os arquivos enviados pelo José (nome/descrição/autores do module e as ilustrações de *A Soldier's Bond* e
  *Book of Exota*) — agora também na planilha e no gerador, então não se perdem no próximo build.
- Planilha: cada habilidade da carta virou um parágrafo próprio (135 textos, principalmente Codex, ancestralidades e
  subclasses; a linha “Spellcast Trait / Atributo de Conjuração” também). Corrigidos 3 textos em português com
  palavras grudadas e 5 com o nome de outra carta “vazado” no final.
- Exibição com **negrito** (richEdit + Talemark): nome de cada habilidade (“**Runic Lock:**”) e testes com
  dificuldade (“**Spellcast Roll (15)**”, “**teste de conjuração (13)**”). Vale para o texto no card, o Consultar em
  português e o “Chat ↗”. O texto continua salvo sem marcação.
- Para editar: lápis no canto do texto ou clique duplo; ao sair do campo o texto volta a ser exibido formatado.
  Espaço vazio já abre para digitar.
- Fichas existentes: textos de carta que o jogador não editou passam sozinhos para o formato em parágrafos ao abrir.
- A pasta do plugin passa a se chamar `Ficha Daggerheart` (como a do José).

## v3.1.1
- Removida a linha em branco no começo dos textos das cartas (o richEdit deixava um parágrafo vazio ao ser limpo).

## v3.1.2
- Linha em branco no começo dos textos: a correção da 3.1.1 não pegou. Causa: o `insertTalemark` cria um bloco novo
  e deixa um parágrafo vazio acima. Agora o texto é escrito direto no richEdit, trecho por trecho
  (`insertText` + `setSelectionFontStyle`), com parágrafos por `breakParagraph` e margem superior 0. O Talemark fica só
  como reserva caso a escrita direta falhe.
