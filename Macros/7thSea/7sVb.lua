--[[Notas do programador:
    Esta macro está comentada em pt-br pelo publico que ela tem como alvo
    Desculpe, mas não segui as convensões de cleanCode do Lua como "is_X" para bool

    OS COMENTÁRIOS DA VERSÃO 'B' FORAM REMOVIDOS POR SEREM OBSOLETOS, VEJA A VERSÃO 'A' PARA UMA VERSÃO
    COM COMENTÁRIOS PARA INICIANTES EM PROGRAMAÇÃO (e ser integrada com a ficha)    

    se quiser me contactar por qualquer motivo (relacionado ou não com esta macro), 
    meu email é: [matheusberaldodias@gmail.com]
]]

local quantidadeExplodida = 0
local minimo = 10
local modificadorDadoADado = 0

local explodir = false
local asterisco = false
local barra = false
local plus = false

local mensagem = "Rolando..."
local mensagemCritico = " yeeeey"

local input = parameter
local quantidade = tonumber(arg[1])


local DadosRolados = {}
local Apostas = {Conjuntos = {}, Total = 0}

local posicaoAsterisco = string.find(input,"*")
local posicaoBarra = string.find(input,"/")
local posicaoPlus = string.find(input, "+")

if input == "easteregg" then enviar("easteregg")end;



function EnviarTutorial()
    escrever([[
    [§B][§K10]Comando: "/7s Dados +x/z*"
    [Dados]A quantidade de dados rolados
    [§K11][+x] Para vantagens como "Liceu", soma "x" em todo dado rolado
    [/z] "z" será o número mínimo para gerar aposta (padrão: 10)
    [*] Explodir dados 10
    [§K2][Atenção!] Siga a ordem para evitar erros, mas apenas caso algum dos dois primeiros não for determinado, aparecerá um popup"
    [§K15][V1.0b] 
    ]]);
end;

function CalcularApostas()
    minimo = tonumber(minimo)
    TirarUm();
    if #DadosRolados>2 then 
        for i=0, #DadosRolados/2 do
        TirarPar();
        end;
    end;
    if #DadosRolados>2 then
        for i=1, #DadosRolados/3 do
        TirarTrio();
        end;
    end;   
end;
function TirarUm()
    table.sort(DadosRolados)
    for i=#DadosRolados, 1, -1 do
        if DadosRolados[i] >= minimo then
            Apostas.Total = Apostas.Total+1

            table.insert(Apostas.Conjuntos, 1, math.floor(DadosRolados[i]))
            table.remove(DadosRolados, i)
        end;
    end;
end;
function TirarPar()
    for i=#DadosRolados, 1, -1 do
        for j=1, i-1, 1 do
            soma = DadosRolados[j]+DadosRolados[i]
            if soma >= minimo then
                Apostas.Total = Apostas.Total+1
                table.insert(Apostas.Conjuntos, 1, DadosRolados[i].. " + ".. DadosRolados[j])

                table.remove(DadosRolados, i)
                table.remove(DadosRolados, j)
                return; 
            end;
        end;
    end;
end;
if input == "easteregg" then enviar("anticopia") end;
function TirarTrio()
    for i=#DadosRolados, 1, -1 do
        for j=1, i-2, 1 do
            if #DadosRolados > 2 then
                for k=j+1, i-1, 1 do
                        if DadosRolados[j]~= null and DadosRolados[k]~= null and DadosRolados[i] ~= null then
                        soma = DadosRolados[j]+DadosRolados[k]+DadosRolados[i]
                        if soma >= minimo then
                            Apostas.Total = Apostas.Total+1
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
    antigoDado = DadosRolados[1]
    table.remove(DadosRolados, 1 )
    novoDado = rolar("1d10","rerolando pela perícia de nível maior que 3")
    table.insert( DadosRolados, math.floor(novoDado+modificadorDadoADado))
    table.sort(DadosRolados);
    enviar("[§K11](" ..antigoDado-modificadorDadoADado.. "->" ..novoDado..")")
    CalcularApostas();
end;
if input == "easteregg" then enviar("matheusberaldodias@gmail.com") return; end;

if posicaoAsterisco ~= null then
    asterisco = true
end;
if posicaoBarra ~= null then
    barra = true
end;
if posicaoPlus ~= null then
    plus = true
end;

if input == "help" then
    EnviarTutorial()
    return;
end;


if tonumber(quantidade) == nil then 
    enviar("[§K4] Woopsie owo, looks like yuwu tipped wwong >///<") --Retirar este texto uwu caso você não goste da piada.
    return;
elseif (tonumber(quantidade)>0)==false then
    enviar("[§K4] Woopsie owo, looks like yuwu tipped wwong >///<") --Retirar este texto uwu caso você não goste da piada.
    return;
end;


if plus == true then
    modificadorDadoADado = tonumber(string.sub(input,posicaoPlus+1,posicaoPlus+1))
end;

if asterisco == true then
    explodir = true;
    input = string.sub(input,0,posicaoAsterisco-1)
end;

if barra == true then
    local tamanhoInput = string.len(input)
    minimo = string.sub(input,posicaoBarra+1,tamanhoInput)    
end;


strRolagem = quantidade.."d10"
resultado, dado = rolar(strRolagem, mensagem); 

for i=1, quantidade, 1 do
    DadosRolados[i] = (math.floor(dado.ops[1].resultados[i]));
    table.sort(DadosRolados);
end;

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


CalcularApostas();

enviar("[§K10]Apostas: [§K11]".. Apostas.Total);
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



--Versão 1.0b
--[[Atualizações desde a 0.5: 
    -Agora ela reconhece trios de dados
    -Ela foi fortemente otimizada na hora de combinar dados, agora demanda menos da metade
    das combinações de antes
    -Foi limpa
]]

