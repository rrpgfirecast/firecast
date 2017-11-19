-- Rolagem do Sistema O Um Anel
local x = tonumber(arg[1]);
if x==nil then
  x = tonumber(inputQuery("Quantidade de d6:")) or 1;
end;

local na = tonumber(arg[2]);
if na==nil then
  na = tonumber(inputQuery("NA:"));
end;
if na==nil then
	return;
end;

local n = tonumber(arg[3]);
if n==nil then
  n = tonumber(inputQuery("Modificador:")) or 0;
end;

local indice, texto = choose("Exausto?", {"Não", "Sim"}, 1);


local roll = "1d12 + " .. x .. "d6 + " .. n;

local resultado, rolagem = rolar(roll); 


local runa = false;
local olho = false;
local sucessos = 0;

for i=1, #rolagem.ops, 1 do 
	local op = rolagem.ops[i];

	if op.tipo == "dado" then

		if op.face == 12 then
			runa = op.resultados[1] == 12;
			olho = op.resultados[1] == 11;
		elseif op.face == 6 then
			
			for j=1, #op.resultados, 1 do
				if op.resultados[j] == 6 then
					sucessos = sucessos + 1;
				end;
				if indice == 2 and op.resultados[j] <= 3 then
					resultado = math.floor(resultado - op.resultados[j]);
				end;
			end;

		end;

	end;

end;

local sucesso = na <= resultado;

if olho then
	enviar("Olho de Sauron! Falha.");
elseif runa then
	enviar("Runa de Gandalf! Sucesso.");
elseif sucesso and sucessos>1 then
	enviar("Sucesso Extraordinario. Resultado "  .. resultado .. " >= NA" .. na .. " e " .. sucessos .. "x6.");
elseif sucesso and sucessos==1 then
	enviar("Sucesso Maior. Resultado "  .. resultado .. " >= NA" .. na .. " e " .. sucessos .. "x6.");
elseif sucesso then
	enviar("Sucesso. Resultado "  .. resultado .. " >= NA" .. na .. " e " .. sucessos .. "x6.");
else
	enviar("Falha. Resultado: " .. resultado .. " < NA" .. na);
end;