-- Faz a rolagem seguindo as regras da V5
local dados = tonumber(arg[1]) or 1;
local fome = tonumber(arg[2]) or 0;

if dados < 1 then dados = 1 end;
if fome < 0 then fome = 0 end;

dados = dados - fome;
local dificuldade = 6;

local teste = dados .. "d10";
if fome > 0 then
	teste = teste .. "+" .. fome .. "d10";
end;

-- init
local resultado, rolagem = rolar(teste);
local sucessos = 0;
local dez = 0;
local um = 0;
local dezFome = 0;
local umFome = 0;

-- Dados normais
local op = rolagem.ops[1];
for j=1, #op.resultados, 1 do
  if op.resultados[j] >= dificuldade then
    sucessos = sucessos +1;
  end;
  if op.resultados[j] >= 10 then
    dez = dez +1;
  end;
  if op.resultados[j] <= 1 then
    um = um +1;
  end;
end;

-- Dados de fome
op = rolagem.ops[3];
if op ~= nil then
	for j=1, #op.resultados, 1 do
	  if op.resultados[j] >= dificuldade then
	    sucessos = sucessos +1;
	  end;
	  if op.resultados[j] >= 10 then
	    dezFome = dezFome +1;
	  end;
	  if op.resultados[j] <= 1 then
	    umFome = umFome +1;
	  end;
	end;
end;

local sucessos = sucessos + (math.floor( (dez+dezFome)/2 ) * 2);

local text = "Sucessos: " .. sucessos .. ".";

if (dez+dezFome)>= 2 and dezFome>=1 then
	text = text .. "Critico Bagunçado."
end;

if sucessos <= 0 and umFome >= 1 then
	text = text .. "Falha Bestial."
end;

enviar(text);