# Template Project
Esse template permite criar novos projetos de plugins de ficha para o RRPG com facilidade. Possui alguns exemplos uteis de objetos usados em varios tipos de ficha. Ele pode ser usado livremente por qualquer pessoa. As ultimas 3 abas são uteis para todos tipos de ficha, um espaço para anotações dos jogadores, outro para a historia e um ultimo para os creditos do criador do plugin. 

Eu recomendo usar o [sublime] para fazer as edições. Ao arrastar a pasta do projeto para o sublime ele deixa todos arquivos do projeto em uma janela lateral para facil acesso, além de varias outras funções uteis. 

Além do passo a passo aqui descrito você precisa ter o [SDK][rdk] do RRPG instalado. Consulte a API do SDK para aprender como usar todas suas funções e mais tutoriais. 

Passo a Passo:
1. Baixe o [template].
2. Extraia o template em uma pasta com o nome do projeto e arraste essa pasta para dentro do sublime. 
3. Abra o arquivo module.xml e altere o id do plugin. Você pode usar algo como "seuNome.nomePlugin".
4. Altere o "name" do plugin no module.xml para refletir o que ele faz, assim como sua descrição. 
5. Ainda no module.xml ponha seu login do RRPG como "author", ponha tambem seu contato abaixo.
6. Altere o nome da pasta "ProjectName" para o nome do seu projeto sem espaços. 
7. Abra o arquivo "compilar e instalar.bat"
7.1 Arquivos .bat podem ser perigosos para seu computador, evite abrir .bat desconhecidos. Se quiser verificar o que o .bat faz abra ele em um editor de texto e veja que comandos possuem. Esses possuem apenas os comandos "rdk p" e "rdk i" do proprio SDK do RRPG. 
8. Após o template ter sido compilado e instalado eu seu pc verifique a pasta "output". Ela vai conter seu plugin .rpk, esse arquivo deve ser destribuido para que outros instalem sua ficha. 
9. Agora vá em uma de suas mesas e crie uma ficha do tipo do plugin que criou. Experimente mexer no codigo, principalmente left, top, height e width para ver o que muda nos exemplos da ficha. Experimente criar novas abas e objetos. Compile novamente para ver o que muda na ficha.
 

   [template]: <https://github.com/VinnyAmbesek/PluginsRRPG/blob/master/Template/Template.rar>
   [sublime]: <https://www.sublimetext.com/>
   [rdk]: <http://www.rrpg.com.br/sdk3/RRPG%20SDK%203.html?Introducao.html>
