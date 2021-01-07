# Auto Updater
Verifica por atualizações dos plugins no git do firecast. 

Verifica pelos plugins listados no [plugins.xml](https://github.com/rrpgfirecast/firecast/blob/master/Plugins/plugins.xml) e disponibiliza eles para atualizar e instalar. 

Quando for subir seu plugin respeite o sistema de versão para facilitar sua instalação. A versão de um programa deve ser Major.Minor.Fix, de forma que se você tem um plugin na versão 1.0.0 e faz um pequeno conserto deve mudar a versão para 1.0.1, mas se você fizer uma adição pequena ao programa deve mudar para 1.1.0 . Por último caso faça uma grande mudança a versão deve ir para 2.0.0 .

Os valores separados pelos pontos não precisam ser decimais. A menor versão possivel deve ser 0.0.1, já a maior versão possivel deve ser 65535.65535.65535 . Logo mantenha isso em mente quando estiver aumentando a versão de seus plugins. 

+ Add opção de abrir pagina
+ make open popup on command

Versão 0.7
* Botão que leva a pagina do projeto no github adicionado.
* Opção de abrir popup usando /autoupdater.
* Aumento da velocidade de carregamento.

Versão 0.6:
* Adicionado campo de filtro nos plugins disponíveis. 

Versão 0.2:
* Corrigido problema de vizualização em mesas onde o usuario não é mestre.
* Corrigido problema no download da lista de plugins.
* Adicionado titulo das colunas na aba disponível.
* Plugins vão tentar se instalar sozinhos e abrir no navegador apenas se falhar. 