# Cangaço Trevoso — Firecast SDK/RDK 3.7b

**Versão 0.6.5 — remoção do diagnóstico de sincronização, sem alterar os campos e regras da ficha.**

## Correções visuais

- A arte da aba Geral agora mantém a resolução lógica fixa de 1672 x 941 px, exatamente igual à coordenada dos campos. Antes, o fundo esticava para a largura da janela e se deslocava em relação aos campos.
- Os 2 quadros de competências foram compactados de 760 para 444 px, eliminando grande área vazia e trazendo os botões de Rolar para perto dos valores.
- O background visual foi convertido de PNG para JPEG de alta qualidade e removemos um arquivo de moldura antigo e inutilizado para aliviar carregamento.

## Sincronização — o que foi mudado

- `iniciar()` não escreve nem recalcula dados ao abrir fichas já inicializadas (inclusive na visão do Mestre).
- A criação de uma ficha nova usa `NDB.beginUpdate` + `NDB.endUpdate` em sequência, realizando **um lote completo** em vez de dezenas de atualizações parciais.
- O inicializador só aplica padrões em campos vazios; jamais sobrescreve valores já preenchidos.
- Os complementos calculados só são gravados se tiverem realmente mudado.
- Não usamos transações pendentes nem NodeDatabase local. `sheetTemplate` / `recordList` mantêm o NodeDatabase remoto nativo do Firecast.

## Compatibilidade e instalação

- Mesmo `dataType` e mesmos `field` da versão anterior: fichas existentes preservadas.
- Exige **RDK/SDK 3.7b** para desenvolvimento/compilação. No `module.xml`, `sdkVersion="3.7"`.
- Para instalar: extraia o ZIP e use `rdk i` no diretório do projeto.
- Não foi possível compilar nem medir a latência real entre duas contas nesta sessão; o XML e os arquivos foram validados.

## Atualizações 0.6.4 e 0.6.5

- Mantido o `contact` obrigatório no manifesto e os alinhamentos aceitos no RDK 3.7b.
- Removido o botão **Testar sincronização**, o indicador de status, o observador NDB para diagnóstico e a gravação de `ct_sync_ping`.
- Mantidas as otimizações de inicialização e gravação, as mecânicas e todos os campos de jogo.


## Versão 0.6.9 — ajustes pontuais a partir do ZIP 0.6.5 fornecido

- Dropdown de competência removido apenas da seção de atributos e testes; os testes de competência no final da aba Geral permanecem.
- Testes rápidos de atributos e de complementos não recebem mais um bônus de competência oculto/selecionado anteriormente.
- Os títulos, rótulos e valores dos quatro atributos maiores estão em negrito.
- Removido o título visual superior “CANGAÇO TREVOSO | FICHA”.
- Demais arquivos, campos e mecânicas mantidos.
