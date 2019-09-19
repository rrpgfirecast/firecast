-- getRolagemAsString(rolagem): recebe um objeto Rolagem do SDK e retorna uma string descrevendo a rolagem
-- da mesma maneira que é mostrado no RRPG
function getRolagemAsString(rolagem)
	local total = 0;
	local lastTipoOp = "soma";
--	local modif = 0;
--	local dices = "{";
	local diceString = "{";
	for i,op in ipairs(rolagem.ops) do
		if(op.tipo == "dado") then
			diceString = diceString .. "[";
			for j,result in ipairs(op.resultados) do
				if(j > 1) then
					diceString = diceString .. ", ";
				end
				diceString = diceString .. string.format("%d",result)
				if(lastTipoOp == "subtracao") then
					total = total - result;
				else
					total = total + result;
				end
			end
			diceString = diceString .. "]";

		elseif(op.tipo == "imediato") then
			if(lastTipoOp == "subtracao") then
				total = total - op.valor;
			else
				total = total + op.valor;
			end
			diceString = diceString .. string.format("%d",op.valor);

		elseif(op.tipo == "soma") then
			lastTipoOp = op.tipo;
			diceString = diceString .. " + ";

		elseif(op.tipo == "subtracao") then
			lastTipoOp = op.tipo;
			diceString = diceString .. " - ";
		end
	end
	
	diceString = diceString .. "}";

	return string.format(rolagem.asString .. " = %d %s", total, diceString);
end

require("vhd.lua");
require("fireDrive.lua");

-- splitString(string, separador): separa uma string em uma lista de strings.
function splitString(str, pat)	
	local t = {};
	local fpat = "(.-)" .. pat;
	local last_end = 1;
	local s, e, cap = str:find(fpat, 1);

	t.strings = {};
	t.size = 0;

	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(t.strings,cap);
			t.size = t.size + 1;
		end

		last_end = e+1;
		s, e, cap = str:find(fpat, last_end);

	end

	if last_end <= #str then
		cap = str:sub(last_end)
		table.insert(t.strings, cap)
		t.size = t.size + 1;
	end

	return t;
end
