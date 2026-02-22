-- Rola Nd6 e mantem os M maiores
local qtd = tonumber(arg[1]);
while qtd==nil or qtd < 1 do
  qtd = tonumber(inputQuery("Número de Dados:"))
end

local keep = tonumber(arg[2]);
while keep==nil or keep >= qtd do
  keep = tonumber(inputQuery("Número de Dados a manter:"))
end

local resultado, rolagem = rolar(qtd.."d6")
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

for i = #dados, #dados - keep + 1, -1 do
  texto = texto .. " " .. math.floor(dados[i]);
end; 

enviar("Os "..keep.." maiores números foram:" .. texto);