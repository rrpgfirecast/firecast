-- Faz uma rolagem de ataque para cada valor fornecido
local invalid = #arg < 1;
local values = {};
for i=1, #arg, 1 do
  values[i] = tonumber(arg[i]);
  if values[i] == nil then
    invalid = true;
  end;
end;

if invalid then
  local aux = 0;
  local input = true;

  while input do
    values[aux+1] = tonumber(inputQuery("Bônus de Ataque. Deixe em branco pra terminar. ", nil, true));
    if values[aux+1] == nil then
      input = false;
    else
      aux = aux +1;
    end;
  end;
end;

for i=1, #values, 1 do
  local teste = "1d20+"..values[i];
  rolar(teste, "Ataque " .. i);
end;