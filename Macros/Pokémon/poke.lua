local num = arg[1];
if num == nil or num == "?" then
	escrever("Use: /poke <frase>");
	escrever("Cada numero entre 1 e 802 no inicio de uma palavra vai ser substituido por um pokemon.");
	escrever("Seguir o numero com -m -mx ou -my permite exibir mega evoluções.");
	escrever("Seguir o numero com -a permite exibir Alolan Forms.");
	return;
end;

local text = "";

for i=1, #arg, 1 do
	local token = arg[i];
	local num = string.sub(token, 1, 3);
	num = tonumber(num);
	local rest = string.sub(token, 4);
	if num ==nil then
		num = string.sub(token, 1, 2);
		num = tonumber(num);
		rest = string.sub(token, 3);
	end;
	if num ==nil then
		num = string.sub(token, 1, 1);
		num = tonumber(num);
		rest = string.sub(token, 2);
	end;
	if num ~=nil then
		if num>=1 and num <=802 then
			if num<10 then
				num = "00" .. num .. rest;
			elseif num<100 then
				num = "0" .. num .. rest;
			else
				num = "" .. num .. rest;
			end;
			arg[i] = "[§I http://www.serebii.net/pokedex-sm/icon/" .. num .. ".png]";
		end;
	end;
	text = text .. " " .. arg[i];
end;

enviar(text);