-- rolagem para Lot5R

-- Definindo quantidade de dados
local qtd = tonumber(arg[1]);
while qtd==nil do
    qtd = tonumber(inputQuery("Quantidade de dados: "));
end;
if qtd < 1 then 
    qtd=1;
end;

-- Definindo limite de dados
local limite = tonumber(arg[2]);
while limite==nil do
    limite = tonumber(inputQuery("Limite de dados: "));
end;
if limite > qtd then
    limite = qtd;
end

-- Rolando os dados
local resultado, rolagem = rolar(qtd .. "d10");

-- coletar os resultados individuais de cada dado
local dados = {}; 
for i = 1, #rolagem.ops, 1 do
    local op = rolagem.ops[i];

    if op.tipo == "dado" then
        for j = 1, #op.resultados, 1 do
            dados[#dados + 1] = op.resultados[j];
        end;
    end;
end; 

-- Ordenar os resultados, menores primeiro
table.sort(dados); 

-- eliminar os dados menores, de traz para frente
local ignore = qtd - limite + 1;
local texto = ""; 
local soma = 0;
for i = #dados, ignore, -1 do
    texto = texto .. " " .. math.floor(dados[i]);
    soma = soma + math.floor(dados[i]);
end; 

-- Exibir resultado
enviar("Os " .. limite .. " maiores números foram:" .. texto .. " [" .. soma .. "]");