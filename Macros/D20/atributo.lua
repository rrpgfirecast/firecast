-- Rola 4d6 e remove o menor
local resultado, rolagem = rolar("4d6");
local dados = {}; 

-- coletar os resultados individuais de cada dado
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

local texto = ""; 

-- Pegar os ultimos 3, isto é, os 3 maiores.. de traz para frente

for i = #dados, #dados - 2, -1 do
                texto = texto .. " " .. dados[i];
end; 

enviar("Os 3 maiores números foram:" .. texto);