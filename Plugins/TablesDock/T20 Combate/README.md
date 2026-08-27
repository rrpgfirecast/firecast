# T20 Combate

Plugin para Firecast SDK 3.7 que adiciona uma janela acoplavel de iniciativa e condicoes para Tormenta20.

## Compatibilidade

- Firecast 8.12 ou superior / SDK 3.7.
- Ficha `fib.Tormenta20`.
- A janela acoplavel depende da disponibilidade de Table's Dock na mesa.

## Instalacao e atualizacoes

Depois que o plugin for aceito no catalogo oficial, instale o Plugin Auto Updater, abra-o no Firecast e procure por T20 Combate. As novas versoes aparecerao ali sem que o mestre precise reenviar o arquivo manualmente aos jogadores.
## Funcionalidades da versao 1.8.0
- Corrige a associacao do dano maximo ao combatente que o preparou, adiciona leitura alternativa da formula exibida pelo Firecast e publica no chat o valor rolado substituido pelo maximo.
- O menu `Mais acoes > Preparar dano maximo` maximiza todos os dados do proximo ataque ou magia: `1d8` vira 8 e `2d6+4` vira 16. Funciona para jogadores e mestre, combina com melhor de 2d20 e desliga apos um uso.
- Corrige expressoes como `1d20 + 16.0`: bonus de ataque agora e enviado ao Firecast no formato inteiro aceito pelo rolador de dados.
- Um 20 natural no ataque agora acerta automaticamente, mesmo quando o total fica abaixo da Defesa, e conta como critico.
- Resultados dentro da margem de ameaca so contam como critico se o total do ataque alcancar a Defesa do alvo.
- O menu `Mais acoes > Preparar melhor de 2d20` apenas prepara o recurso. A primeira rolagem acontece quando voce clica no dado do ataque da ficha; o plugin rola somente o d20 adicional, escolhe o melhor e resolve acerto, critico e dano.
- Jogadores podem preparar o melhor de 2d20 com personagens que controlam; o mestre pode prepara-lo para qualquer combatente. O modo e usado uma vez, desliga apos o ataque e pode ser cancelado pelo mesmo menu.

- Exibe os nomes diretamente do campo NOME_DO_PERSONAGEM da ficha FIB.
- O cabecalho compacto usa apenas duas fileiras, deixando iniciativa pessoal e controles de turno sempre visiveis.
- O painel do combatente possui controles de PM iguais aos de PV: -1, -5, +1, +5 e Definir.
- Alteracoes de PM atualizam a ficha, o tracker e a barra azul-clara do token imediatamente.
- Adicao de combatentes, iniciativa, ordem, tokens, areas e manutencao ficam organizados nos menus + Combatente e Mais acoes.
- A opcao Mais acoes > Remover todos do tracker fica no primeiro nivel do menu e pede confirmacao antes de limpar o combate.
- O menu Mais acoes possui Teste oposto, sem CD, comparando diretamente os dois resultados.
- Ataque x Ataque permite escolher um ataque cadastrado em cada ficha FIB e rola ambos automaticamente.
- Teste livre permite informar o nome do teste e o bonus de cada lado.
- Em empate, vence o maior bonus; se os bonus tambem forem iguais, o plugin rola novamente, conforme a regra de Tormenta20.
- Cada jogador pode adicionar e rolar a iniciativa do proprio personagem principal.
- Cada jogador pode adicionar, remover e limpar as condicoes dos proprios personagens.
- O mestre pode adicionar ate 50 copias de uma ficha de uma vez, nomeadas A, B, C etc.
- Cada copia de inimigo possui iniciativa, PV e condicoes independentes.
- Jogadores podem rolar a iniciativa dos proprios personagens e o mestre pode rolar todas de uma vez.
- A iniciativa do jogador pode ser rolada a qualquer momento, mesmo fora do proprio turno; o cliente do mestre valida o autor e aplica o resultado no tracker.
- Todos os clientes reorganizam automaticamente a ordem quando uma iniciativa, nome ou instancia muda.
- O mestre pode voltar um turno; ao avancar novamente, efeitos automaticos nao sao repetidos.
- Jogadores podem encerrar o proprio turno com confirmacao e validacao pelo cliente do mestre.
- Captura rolagens de Iniciativa feitas pela ficha FIB no chat.
- Ordena por resultado, modificador e nome.
- Controla rodada e turno atual.
- Permite rolar ou informar manualmente a Iniciativa de personagens e NPCs.
- Aplica as condicoes do livro basico e controla duracao por cena ou rodadas.
- Integra penalidades com os campos de pericias, Defesa e ataques da ficha FIB.
- Preserva bonus manuais usando deltas registrados separadamente.
- Resolve automaticamente Em Chamas, Sangrando e Confuso no inicio do turno.
- Vincula cada combatente a um token especifico, inclusive inimigos criados da mesma ficha.
- Renomeia apenas o token vinculado com o nome individual do combatente, como Goblin A ou Goblin B.
- Sincroniza a barra 1 com PV em verde, a barra 2 com PM em azul-claro quando houver PM e a barra 3 com Defesa em amarelo.
- Atualiza as barras quando PV, PM ou Defesa mudam no painel ou diretamente na ficha.
- Permite arrastar qualquer linha do tracker para o tabuleiro usando o personagem e o token configurados no Firecast.
- Ao soltar, nomeia, vincula e sincroniza automaticamente o novo token com a instancia correta.
- O vinculo manual usa avisos dentro do painel e nao bloqueia o clique no tabuleiro.
- Jogadores e mestre podem montar uma lista com varios tokens vinculados como alvos do mesmo combatente.
- A selecao permanece aberta para varios cliques e possui botoes para finalizar, remover um alvo ou limpar a lista.
- O botao Limpar tambem cancela o Modo magia e restaura o uso normal de Ataque x Defesa.
- Reconhece as rolagens de ataque e dano feitas pela ficha FIB no chat.
- No modo Ataque x Defesa, compara a mesma rolagem individualmente com a Defesa de cada alvo.
- O `Modo magia` usa o ataque e o dano configurados normalmente na ficha FIB e rola automaticamente Reflexos, Fortitude ou Vontade de cada alvo contra a CD informada.
- O sucesso na resistencia pode reduzir o dano a metade ou anular o dano, conforme o modo escolhido.
- Acertos e falhas descontam o dano correto dos PV e sincronizam imediatamente a barra verde de cada token.
- Publica no chat o resultado e os PV restantes separadamente para cada alvo.
- Um clique em qualquer linha do tracker abre imediatamente as opcoes daquele combatente, sem mudar o turno.
- Uma barra divisoria arrastavel ajusta o espaco entre os detalhes do combatente e a ordem de iniciativa.
- O tamanho escolhido e restaurado ao reabrir o painel; duplo clique na barra alterna entre lista ampliada e detalhes ampliados.
- O painel de detalhes possui rolagem vertical, garantindo acesso a Magias Configuradas mesmo em janelas menores.
- As magias da ficha do jogador sao carregadas localmente ao selecionar o personagem e atualizadas automaticamente quando forem cadastradas, editadas ou removidas.
- O arraste para o mapa continua disponivel pelo simbolo de arraste no lado esquerdo da linha.
- NPCs adicionados como grupo ou com ficha sem dono saem automaticamente do tracker ao chegar a 0 PV; personagens de jogadores permanecem.
- O token derrotado permanece no mapa com a barra de PV em zero.
- O token do turno atual recebe uma borda amarela cintilante visivel para a mesa.
- Ao mudar ou reiniciar o turno, a borda anterior desaparece automaticamente.
- O botao Buff/Debuff permite escolher explicitamente entre bonus e penalidade de Ataque, Dano, Defesa ou Todos.
- O efeito pode ser aplicado somente ao combatente selecionado ou a todos os seus alvos marcados.
- Buffs e debuffs podem durar ate o fim da cena, por uma quantidade de rodadas ou ate remocao manual.
- Cada alvo recebe um efeito independente; remover de um NPC nao altera os demais.
- Remover ou limpar buffs e debuffs atualiza imediatamente a lista de efeitos ativos, inclusive quando a alteracao parte do jogador ou ocorre por expiracao.
- Jogadores podem enviar efeitos para seus alvos, com validacao e aplicacao pelo cliente do mestre.
- Jogadores tambem podem selecionar diretamente outro combatente e usar + Buff/Debuff; o mestre valida a origem e aplica o efeito no alvo escolhido.
- Ataque e Defesa atualizam a ficha/calculos; Dano e somado automaticamente apenas quando o golpe acerta.
- O mestre possui acesso total ao painel: pode administrar iniciativa, PV, alvos, buffs, debuffs, condicoes, auras e tokens de qualquer combatente.
- O mestre pode vincular, desvincular e sincronizar inclusive os tokens e as fichas controlados pelos jogadores.
- O menu `+ Combatente > Ficha rapida de NPC` cria uma ficha `fib.Tormenta20` diretamente na biblioteca da mesa.
- O criador procura uma pasta chamada `Monstros` em toda a biblioteca e salva a nova ficha diretamente nela.
- O assistente pede nome, quantidade, PV, PM, Defesa, Iniciativa, resistencias, Constituicao, token e quantos ataques forem necessarios.
- O token pode ser escolhido entre as imagens ja enviadas ao Firecast, informado por URL ou deixado para depois.
- Varias copias entram no tracker como instancias independentes, mantendo PV, PM, iniciativa, condicoes e token separados.
- Habilidades de NPC podem ser cadastradas com nome, tipo de acao, descricao, custo em PM e rolagem opcional.
- As habilidades ficam salvas na ficha do monstro e podem ser consultadas, usadas, editadas ou removidas no painel de combate.

- Personagens de jogadores que chegam a 0 PV ou menos recebem automaticamente a condicao Caido.
- Ao cair, fazem Constituicao CD 15: sucesso estabiliza definitivamente; falha causa 1d6 de dano.
- Apos uma falha, o teste e repetido automaticamente no inicio do turno seguinte.
- PV de jogadores pode descer ate -10; ao chegar a -10 o personagem morre e permanece no tracker.
- Tokens de personagens mortos recebem um circulo escuro com X vermelho visivel para toda a mesa.
- Recuperar o personagem para mais de 0 PV limpa queda, estabilidade e o marcador automatico.
- A regra nao se aplica a NPCs, que continuam saindo do tracker ao chegar a 0 PV.
- Cria areas de magia independentes diretamente no tabuleiro, sem exigir ficha, combatente ou token vinculado.
- Suporta Esfera, Cilindro, Cone, Linha, Quadrado, Cubo e area retangular personalizada.
- Usa medidas em metros; linhas comecam com a largura padrao de 1,5m de Tormenta20.
- Permite configurar nome, cor e duracao por cena, rodadas ou remocao manual.
- Cone e Linha possuem direcao inicial e rotacao em passos de 45 graus ou angulo informado.
- As areas podem ser selecionadas e arrastadas ou movidas clicando em um novo ponto do mapa.
- Jogadores criam e administram as proprias areas; o mestre pode administrar todas.
- Areas criadas por jogadores sao marcadas como desenhos do proprio jogador, permitindo posicionar, mover, girar, editar e remover sem erro de permissao.
- Areas por rodadas sao atualizadas a cada nova rodada e areas de cena saem com `Fim da cena`.
- Cria auras visuais presas ao token, que acompanham o personagem quando ele se move no mapa.
- Permite configurar nome, cor e raio em metros, incluindo medidas decimais.
- A duracao pode ser ate o fim da cena, por rodadas ou manual.
- Auras por rodadas desaparecem automaticamente quando a duracao termina.
- Jogadores podem administrar as auras dos proprios personagens; o mestre pode administrar qualquer combatente.
- A opcao Editar permite mudar posteriormente o nome, a cor, o tamanho e a duracao.

Para jogadores, selecione o proprio personagem no tracker e role o painel de detalhes ate `MAGIAS CONFIGURADAS`. O resumo e a lista de `Usar magia` sao lidos diretamente da ficha do personagem; alteracoes feitas na ficha sao atualizadas automaticamente.

## Interface compacta

- `Minha iniciativa`: rola a iniciativa do personagem principal do jogador.
- `+ Combatente`: adiciona NPC da biblioteca, ficha rapida de NPC ou jogador; exclusivo do mestre.
- `Mais acoes`: abre iniciativa e ordem, teste oposto, remover todos do tracker, sincronizacao de tokens, areas de magia, reinicio do combate e fim da cena.
- `Voltar` e `Proximo`: controles de turno do mestre.
- `Encerrar meu turno`: permite ao jogador encerrar o proprio turno.
## Como ajustar o tamanho do tracker

Arraste a barra `ARRASTE PARA AJUSTAR`, localizada logo acima de `ORDEM DE INICIATIVA`, para cima ou para baixo. Arrastar para cima aumenta a lista de combatentes; arrastar para baixo aumenta o painel de detalhes. Um duplo clique na barra alterna rapidamente entre os dois tamanhos.

## Como usar Teste oposto

1. Selecione no tracker o combatente que iniciara o teste.
2. Marque o adversario com `+ Alvos`; se houver varios alvos, o plugin perguntara qual participa.
3. Abra `Mais acoes > Teste oposto`.
4. Escolha `Ataque x Ataque` para usar ataques cadastrados nas fichas ou `Teste livre` para informar os dois bonus.
5. O plugin rola os dois lados, compara os totais e publica o vencedor no chat. Nao existe CD.

Jogadores podem iniciar o teste usando os proprios personagens. A solicitacao e validada e resolvida pelo cliente do mestre, que escolhe os ataques ou informa os bonus quando necessario.

## Como criar uma ficha rapida de NPC

1. Clique em `+ Combatente` e escolha `Ficha rapida de NPC`; essa opcao e exclusiva do mestre.
2. Preencha os dados pedidos. Na etapa do token, escolha uma imagem ja enviada ao Firecast, informe uma URL ou use `Continuar sem token`.
3. Em `Ataques iniciais`, adicione quantos ataques quiser ou conclua a criacao.
4. A ficha e salva automaticamente na pasta `Monstros`. Se houver mais de uma, escolha o caminho; se nenhuma existir, o plugin oferece criar a pasta ou salvar na raiz.
5. A quantidade escolhida entra no tracker como copias independentes.
6. Selecione o NPC no tracker e use `+ Habilidade` para anotar poderes, acoes especiais, reacoes ou passivas.
7. Durante o combate, clique em `Ver/Usar`: `Ver descricao` abre a anotacao; `Usar e enviar ao chat` desconta o custo em PM, publica a habilidade e faz a rolagem opcional.

As habilidades ficam na ficha da biblioteca. Por isso, todas as copias daquele mesmo monstro enxergam a mesma lista de habilidades, mas cada copia continua com seus proprios PV, PM, iniciativa e condicoes.

## Como usar Auras

1. Vincule o combatente ao token do mapa.
2. Clique na linha do combatente no tracker e depois em `Auras`.
3. Escolha `Criar`, informe o nome e o raio em metros (por exemplo, `9`).
4. Escolha uma cor e uma duracao: cena, rodadas ou manual.
5. Use `Editar` para mudar tamanho, cor ou duracao; `Remover` apaga uma aura e `Limpar` apaga todas.

A aura e desenhada ao redor do token vinculado e acompanha seus movimentos. O jogador controla as auras dos personagens que possui; o mestre pode controlar todas.
## Queda e morte de personagens

A automacao vale somente para fichas de jogadores, nunca para copias independentes ou NPCs.

1. Ao chegar a 0 PV ou menos, o personagem recebe `Caido` e rola Constituicao contra CD 15.
2. Em um sucesso, fica estabilizado e nao realiza novos testes enquanto permanecer com 0 PV ou menos.
3. Em uma falha, sofre 1d6 de dano e repete o teste no inicio do proximo turno.
4. Ao chegar a -10 PV, fica morto e recebe um marcador escuro com X vermelho no token.
5. Definir ou curar o personagem para mais de 0 PV remove o estado automatico e o marcador.

O teste usa `ModCon` da ficha e considera as penalidades fisicas registradas pelo plugin. A barra verde do token permanece visualmente em zero enquanto o tracker e a ficha mostram o PV negativo.
## Como usar Areas de magia

1. Abra o mapa e escolha `Mais acoes > Areas de magia` no topo do painel.
2. Escolha `Criar nova area`, informe nome, forma, medidas, cor e duracao.
3. Para Cone ou Linha, escolha a direcao inicial.
4. Clique no mapa para definir o centro da area ou o ponto de origem de Cone e Linha.
5. Em `Administrar area existente`, use `Selecionar para arrastar`, `Mover clicando`, `Girar`, `Editar` ou `Remover`.

As areas ficam na camada de tokens, desenhadas atras dos personagens. Jogadores veem todas, mas administram somente as que criaram; o mestre administra qualquer area. O recurso e apenas visual e nao realiza o teste opcional de Percepcao ou Misticismo.
## Como vincular um token

1. Abra o tabuleiro da mesa e o painel `T20 Combate`.
2. Para criar um token novo, arraste a linha do combatente e solte no mapa. O Firecast usa o token configurado no personagem e o plugin faz o vinculo automaticamente.
3. Para um token que ja existe, selecione o combatente, clique em `Vincular token` e depois clique no token correspondente.
4. Repita para cada copia do inimigo. Cada vinculo e independente.

`Sinc. barras` atualiza o token selecionado. `Mais acoes > Sincronizar tokens` permite ao mestre atualizar todos os tokens vinculados de uma vez. Jogadores podem criar, vincular e sincronizar os proprios personagens quando controlam o token. O mestre pode fazer essas operacoes com qualquer personagem ou token da mesa, mesmo quando o dono e outro jogador.

## Como usar Buff/Debuff

1. Selecione o combatente que recebera o efeito ou que possui os alvos marcados.
2. Clique em `+ Buff/Debuff` e escolha `Buff` para bonus ou `Debuff` para penalidade.
3. Escolha Ataque, Dano, Defesa ou Todos e informe apenas o valor, como `2`; o plugin aplica o sinal correto.
4. Escolha a duracao: cena, rodadas ou ate remover manualmente.
5. Escolha `Combatente selecionado` ou `Todos os alvos marcados`.
6. Use `Remover efeito` para retirar um efeito especifico ou `Limpar efeitos` para retirar todos daquele combatente.

Quando aplicado nos alvos, cada um recebe sua propria copia do efeito. Jogadores podem aplicar nos alvos dos seus personagens; o cliente do mestre valida e executa a alteracao nas fichas e NPCs.
## Como usar alvos multiplos e dano em area

1. Vincule ao tracker os tokens do atacante e de todos os alvos.
2. Selecione o atacante e clique em `+ Alvos`.
3. Clique nos tokens desejados no mapa. A selecao continua aberta ate clicar em `Finalizar`.
4. Use `Remover` para retirar apenas um alvo ou `Limpar` para apagar a lista inteira.

Para ataques normais, inclusive magias que fazem teste de ataque, deixe o `Modo magia` desativado. Cadastre o ataque e o dano normalmente na ficha FIB e use o botao de dado; a ficha rola o ataque e depois o dano, e o plugin compara o resultado com a Defesa de cada alvo.

Para uma magia em area com resistencia:

1. Cadastre a magia como um ataque normal da ficha FIB e preencha obrigatoriamente os campos `Ataque` e `Dano`.
2. Clique em `Modo magia` e escolha Reflexos, Fortitude ou Vontade.
3. Escolha se o sucesso reduz o dano a metade ou anula o dano.
4. Informe a CD da magia.
5. Use o botao de dado do ataque na ficha. A ficha envia ataque e dano; o plugin usa o dano, rola a resistencia de cada alvo e aplica o resultado correto.

Se o campo `Dano` estiver vazio, o painel avisara que a rolagem de dano nao chegou. A preparacao vale para a proxima rolagem de dano. Em ataques de NPC, o mestre deve manter o atacante correto selecionado no tracker.
## Seguranca dos dados

O plugin nao altera atributos-base. Ele grava apenas sua parcela nos campos de outros bonus e guarda o delta aplicado em campos proprios. Ao remover as condicoes, essa parcela e restaurada.

Antes de desinstalar o plugin, use `Fim da cena` ou `Limpar todas` para retirar os modificadores ativos das fichas.

## Compilacao

Na primeira vez, prepare a pasta, verifique e compile:

```text
rdk -p
rdk -l
rdk -c
```

O pacote sera criado na pasta `output`.
