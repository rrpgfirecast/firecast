--[[Notas do programador:
    Esta macro está comentada em pt-br pelo publico que ela tem como alvo
    Desculpe, mas não segui as convensões de cleanCode do Lua como "is_X" para bool

    Alguns comentários foram feitos para ajudar não programadores editarem a macro e talvez aprenderem algo (uma vez que aprendi
    a programar desmontando uma macro de L5R do "santrovitsch@hotmail.com"), outros foram feitos para separar a macro em partes.

    se quiser me contactar por qualquer motivo (relacionado ou não com esta macro), 
    meu email é: [matheusberaldodias@gmail.com]
]]

------variaveis da macro------
--[[Aqui coloco as variaveis que vou usar ao longo da macro, ela foi separada por tipo de variavel para te ajudar a entender 
os diferentes tipos]]
local quantidadeExplodida = 0
local minimo = 10
local modificadorDadoADado = 0

local critico1 = false
local popup = false
local explodir = false
local asterisco = false
local barra = false
local plus = false

local valorAtributo = "não definido"
local valorPericia = "não definido"
local mensagem = "Rolando..."
local mensagemCritico = " yeeeey"

local input = parameter
local atributo = tostring(arg[1])
local pericia = tostring(arg[2])

local DadosRolados = {}
local Apostas = {Conjuntos = {}, Total = 0}
local Pericias = {"Mirar", "Atletismo", "Briga", "Convencer", "Empatia", "Esconder", "Intimidar", "Observar", "Atuar", "Cavalgar", "Navegar", "Erudição", "Seduzir", "Furto","Arte_da_Guerra", "Armas"}
local Atributos = {"Vigor", "Finesse", "Argúcia", "Determinação", "Panache"}

local sheetStr = utils.tableToStr(sheet)

local posicaoAsterisco = string.find(input,"*")
local posicaoBarra = string.find(input,"/")
local posicaoPlus = string.find(input, "+")

if input == "easteregg" then enviar("easteregg")end;




------funçoes------
function EnviarTutorial()
    escrever([[
    [§B][§K10]Comando: "/7s Atributo Perícia +x/z*"
    [Atributo]O atributo usado, em português e iniciando em caixa alta e acento
    [Perícia]O mesmo que o atributo (obs: use "Arte_da_Guerra", não reclame comigo, mas se o cara que fez a ficha não quis botar algo 
    mais de boa, eu que não vou)
    [§K11][+x] Para vantagens como "Liceu", soma "x" em todo dado rolado
    [/z] "z" será o número mínimo para gerar aposta (padrão: 10)
    [*] Explodir dados 10
    [§K2][Atenção!] Siga a ordem para evitar erros, mas apenas caso algum dos dois primeiros não for determinado, aparecerá um popup"
    [§K15][V1.0a]
    [Compatível somente com a ficha de 7thSea do GitHub do RRPG] 
    ]]);
end;

function CalcularApostas(n)
    --[[
        Aqui o programa vai primeiro analizar dado a dado, tirar os que passam do limite; e fazer o mesmo com duplas e trios.
        Se estiver aprendendo, perceba que eu coloquei um limitador de repetições que é metade e um terço do restante,
        isso evita que o loop for não repita mais que precisa.

        Aqui "n" diz para a macro por que número ela deve multiplicar o total de aposta, por conta da pericia lv4
    ]]
    minimo = tonumber(minimo)
    TirarUm(n);
    if #DadosRolados>1 then 
        for i=0, #DadosRolados/2 do
        TirarPar(n);
        end;
    end;
    if #DadosRolados>2 then
        for i=1, #DadosRolados/3 do
        TirarTrio(n);
        end;
    end;   
    --[[Para rolagens acima de 10, quartetos e quintetos sao tao raros que decidi não implementar]]
end;
function TirarUm(n)
    --[[Aqui, depois de organizar a lista, ela vê se o dado de posição "i" é maior que o mínimo, se for ela já inputa ela nos sucessos]]
    table.sort(DadosRolados)
    for i=#DadosRolados, 1, -1 do
        if DadosRolados[i] >= minimo then
            Apostas.Total = Apostas.Total+n

            table.insert(Apostas.Conjuntos, 1, math.floor(DadosRolados[i]))
            table.remove(DadosRolados, i)
        end;
    end;
end;
function TirarPar(n)
    --[[Aqui ela vê se o dado de posição "i"+"j" é maior que o mínimo, se for ela já inputa eles nos sucessos. Note que ela tenta somar
    o maior dado com o menor, otimizando a soma (acho interessante comentar por demorar para pensar na solução)]]
    for i=#DadosRolados, 1, -1 do
        for j=1, i-1, 1 do
            soma = DadosRolados[j]+DadosRolados[i]
            if soma >= minimo then
                Apostas.Total = Apostas.Total+n
                table.insert(Apostas.Conjuntos, 1, DadosRolados[i].. " + ".. DadosRolados[j])

                table.remove(DadosRolados, i)
                table.remove(DadosRolados, j)
                return; 
            end;
        end;
    end;
end;
if input == "easteregg" then enviar("anticopia") end;
function TirarTrio(n)
    --[[Acho que você ja deve ter entendido o padrão, tente analizar por si proprio/propria como ela funciona]]
    for i=#DadosRolados, 1, -1 do
        for j=1, i-2, 1 do
            if #DadosRolados > 2 then
                for k=j+1, i-1, 1 do
                        if DadosRolados[j]~= null and DadosRolados[k]~= null and DadosRolados[i] ~= null then
                        soma = DadosRolados[j]+DadosRolados[k]+DadosRolados[i]
                        if soma >= minimo then
                            Apostas.Total = Apostas.Total+n
                            table.insert(Apostas.Conjuntos, 1, DadosRolados[i].." + ".. DadosRolados[k].. " + ".. DadosRolados[j])

                            table.remove(DadosRolados, i)
                            table.remove(DadosRolados, j)
                            table.remove(DadosRolados, k)
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
function RerolarDado()
    --[[Aqui ela tira o menor dado da lista, rerola e soma o novo; adicionado pelo efeito da perícia de 3 nível]]
    antigoDado = DadosRolados[1]
    table.remove(DadosRolados, 1 )
    novoDado = rolar("1d10","rerolando pela perícia de nível maior que 3")
    table.insert( DadosRolados, math.floor(novoDado+modificadorDadoADado))
    table.sort(DadosRolados);
    enviar("[§K11](" ..antigoDado-modificadorDadoADado.. "->" ..novoDado..")")
    CalcularApostas(1);
end;
if input == "easteregg" then enviar("matheusberaldodias@gmail.com") return; end;

------recebendo o Input------
--[[Aqui ele confirma se as variaveis de posicao existem, se elas não existem quer dizer que a pessoa não deseja aquele elemento,
ou precisa de um popup para ajudar a selecionar]]
if atributo == "nil" or pericia == "nil" then
    popup = true
end;
if posicaoAsterisco ~= null then
    asterisco = true
end;
if posicaoBarra ~= null then
    barra = true
end;
if posicaoPlus ~= null then
    plus = true
end;

--[[Aqui ele envia o Popup caso nescessário, e se o input for "/7s help" ela envia o tutorial e fecha a macro]]

if input == "help" then
    EnviarTutorial()
    return;
end;
if popup == true then
    inutil, atributo = choose("Qual atributo?", Atributos)
    inutil, pericia = choose("Qual perícia?", Pericias)
end;


--[[Aqui ela determina os bônus de ferimento dramático, dando uma variavel e frase mais bonita para ele]]
if sheet.Dano_Critico_1 == true then
    critico1 = true 
    mensagem = "Dado extra pelo Ferimento Dramático"
end;
if sheet.Dano_Critico_3 == true then
    critico3 = true
    mensagemCritico = "(pelo Ferimento Dramático)"
end;



------gerando a Rolagem------
--[[Aqui ela busca na ficha qual o valor da pericia. Ja que o criador da ficha não colocou uma variavel para cada pericia, mas sim 
para cada nivel de pericia, eu vou testando de 1 a 5, e vejo qual foi o resultado mais alto marcado]]
for i=1, 5, 1 do
    strAtributo = atributo.."_"..i  
    if string.find(sheetStr, strAtributo) ~= null then
        valorAtributo = i
    end;
end;

for i=1, 5, 1 do
    strPericia = pericia.."_"..i  
    if string.find(sheetStr, strPericia) ~= null then
        valorPericia = i
    end;
end;

--[[Aqui, se a macro falhou em definir um atributo, ela define se foi um erro de digitação ou se a pericia vale 0
    nota: não analisa atributo pois o atributo não pode ser 0, já que se começa com todos em 2]]
if valorAtributo == "não definido" or valorPericia == "não definido" then
    local existe = false
    if valorPericia == "não definido" then
        for i=1, 16 do 
            if pericia == Pericias[i] then 
                existe = true
                valorPericia = 0
            end;
        end;
    end;
    if existe == false then 
        enviar("[§K4] Woopsie owo, looks like yuwu tipped wwong >///<") --Retirar este texto uwu caso você não goste da piada.
        return;
    end;
end;

--[[novamente, deixo para você deduzir o que esta parte faz :)]]
quantidade =  tonumber(valorAtributo) + tonumber(valorPericia)

if critico1 == true then
    quantidade = quantidade+1
end;

--[[mensagem de erro caso alguma parte acima falhe]]
if quantidade <= 0 then
    enviar("[§K4] Woopsie owo, looks like yuwu tipped wwong >///<") --Retirar este texto uwu caso você não goste da piada.
    return;
end;


--[[desmembrando o input e atribuindo explosoes, limites e somas]]
if plus == true then
    modificadorDadoADado = tonumber(string.sub(input,posicaoPlus+1,posicaoPlus+1))
end;

if asterisco == true then
    explodir = true;
    input = string.sub(input,0,posicaoAsterisco-1)
end;
if valorPericia>=5 or critico3 == true then
    explodir = true
end;

if barra == true then
    local tamanhoInput = string.len(input)
    minimo = string.sub(input,posicaoBarra+1,tamanhoInput)    
end;



------rolando------
--[[Depois de tudo isso, voce consegue entender esta parte, nao?]]
strRolagem = quantidade.."d10"
resultado, dado = rolar(strRolagem, mensagem); --rola os input

for i=1, quantidade, 1 do
    DadosRolados[i] = (math.floor(dado.ops[1].resultados[i]));
    table.sort(DadosRolados);
end;

--[[Aqui ela irá rolar um dado extra para cada explosão e adicionar o resultado na pool de dados]]
if explodir == true then
    for k=1, quantidade, 1 do
        if DadosRolados[k] == 10 then
            quantidadeExplodida = quantidadeExplodida+1
        end;
    end;
    if quantidadeExplodida~=0 then
        resultado, dadoExpl = rolar(quantidadeExplodida.."d10", "Explosões ".. mensagemCritico);
    end;
    for i=1, quantidadeExplodida, 1 do 
        table.insert(DadosRolados, 1, math.floor(dadoExpl.ops[1].resultados[i]))
    end; 
end;
table.sort(DadosRolados);
for j=1, quantidade+quantidadeExplodida, 1 do
    DadosRolados[j] = math.floor(DadosRolados[j]+modificadorDadoADado);
end;



------calculando apostas------
--[[...]]
if valorPericia>=4 then
    minimo = "15"
    CalcularApostas(2);
    minimo = "10"
end;
CalcularApostas(1);
if valorPericia>=3 and DadosRolados[1] ~= nil then
    RerolarDado();
end;
wait(10)



------mensagem final------
--[[Chegamos no final da macro, aqui ela vai enviar a mensagem final, sendo que avisará quando esta usando ou nao algum 
    bonus de pericia]]
enviar("[§K10]Resultado da Combinação [§K11]" .. atributo.." "..valorAtributo .." | ".. pericia.." "..valorPericia)
if valorPericia < 4 then
    enviar("[§K10]Apostas: [§K11]".. Apostas.Total);
else
    enviar("[§K10]Apostas (grau 4): [§K11]".. Apostas.Total);
end
wait(10)
if modificadorDadoADado ~= 0 then
    enviar("[§K10][+"..modificadorDadoADado.."] Conjuntos:[§K11] ".. string.sub(utils.tableToStr(Apostas.Conjuntos),2,-2))
    wait(10)
    enviar("[§K10][+"..modificadorDadoADado.."] Dados Sobrando:[§K11] ".. string.sub(utils.tableToStr(DadosRolados),2,-2))
else
    enviar("[§K10]Conjuntos:[§K11] ".. string.sub(utils.tableToStr(Apostas.Conjuntos),2,-2))
    wait(10)
    enviar("[§K10]Dados Sobrando:[§K11] ".. string.sub(utils.tableToStr(DadosRolados),2,-2))
end;
--[[Caso queira que as apostas sejam adicionadas sozinhas, tire o "--" e mude o "4" para o numero da barrinha  
    contando de cima para baixo]]
--meuJogador:requestSetBarValue(4, math.floor(Apostas.Total));




--Versão 1.0a
--[[Atualizações desde a 0.5: 
    -Agora ela reconhece trios de dados
    -Ela foi fortemente otimizada na hora de combinar dados, agora demanda menos da metade
    das combinações de antes
    -Agora ela reconhece o valor da rolagem de acordo com a combinação valor|perícia
    -Retirada de comentários e linhas obsoletas
    -Bonus de Perícia com grau maior que 3 é automático
    -Reconhece dano
    -Foi limpa
]]

