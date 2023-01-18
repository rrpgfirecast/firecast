--digite /att (minimo para ser rerolado) (maximo para ser rerolado)
total = 0;
total1 = 0;
total2 = 0;
total3 = 0;
total4 = 0;
total5 = 0;
total6 = 0;

while total6<8 do
    while total<8 do
        total = 0;
    local resultado, rolagem = rolar("4d6");
local dados = {}; 


for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];

        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
                        dados[#dados + 1] = op.resultados[j];
                end;
        end;
end; 

table.sort(dados); 

local texto = ""; 

for i = #dados, #dados - 2, -1 do
                tt =  dados[i];
                total = total + tt;
end;

local min = tonumber(arg[1])
local max = tonumber(arg[2])
if min == nil then
    min = 0
end

if max == nil then
    max = 99999
end

if (total<min or total>max) then
    enviar("Rerolando")
    total = 0
end;

end;
     if total1 == 0 then
        total1 = total;
else
     if total2 == 0 then
        total2 = total;
else
     if total3 == 0 then
        total3 = total;
 else
      if total4 == 0 then
         total4 = total;
else
      if total5 == 0 then
         total5 = total;
else
     if total6 == 0 then
        total6 = total;

end;
end;
end;
end;
end;
end;

total = 0;
end;

enviar("Os atributos são: [§K4] " .. total1 .. "  " .. total2  .. "  " .. total3 .. "  " .. total4 .. "  " .. total5 .. "  " .. total6 );