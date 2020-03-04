-- /r2 bonus <+1,-1> txt
local bonus = tonumber(arg[1]);
local vant = tonumber(arg[2]);
local txt = arg[3];

while bonus==nil do
	bonus = tonumber(inputQuery("Bônus da Rolagem.", "0"));
end;

while vant==nil or vant==0 do
	vant = tonumber(inputQuery("Positivo para vantagem. Negativo para desvantagem.", "1"));
end;

local resultado, rolagem = rolar("2d20", txt);
local dice1 = rolagem.ops[1].resultados[1];
local dice2 = rolagem.ops[1].resultados[2];
local dice = 0;

if vant < 0 then
	dice = math.min(dice1, dice2);
elseif vant > 0 then
	dice = math.max(dice1, dice2);
end;

enviar("Resultado: " .. math.floor(dice + bonus) .. ", " .. "(" .. bonus .. ")");