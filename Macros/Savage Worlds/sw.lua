local selvagem = arg[2];
-- selvagem = inputQuery("Dado Selvagem: ", "", true);
local wild = selvagem~="" and selvagem~=nil and selvagem~="-";

local dados = arg[1];
-- dados = inputQuery("Rolagem: ");

local extra = arg[3];
-- extra = inputQuery("Penalides ou Redutores: ");
extra = tonumber(extra) or 0;

local show = arg[4] == "true";
if arg[4]==nil then show=true end;

local teste = dados;
if wild then
  teste = teste .. "+" .. selvagem;
end;

local msg = "";
if not show then msg = "Explosão" end;

local resultado, rolagem = rolar(teste, msg);
local r1 = 0;
local e1 = 0;
local t1 = "";
local r2 = 0;
local e2 = 0;
local t2 = "";

for i=1, #rolagem.ops, 1 do
  local op = rolagem.ops[i];
  if op.tipo == "dado" then
    for j=1, #op.resultados, 1 do
      if i == #rolagem.ops and wild then
        r2 = r2 + op.resultados[j] + extra;
        if op.resultados[j] == op.face then
          e2 = e2 +1;
        end;
      -- normal dice
      else
        r1 = r1 + op.resultados[j] + extra;
        if op.resultados[j] == op.face then
          e1 = e1 +1; -- eu sei qts explosões, preciso saber que faces tbm
        end;
      end;
    end;
    -- end for2
    -- save the faces
    if i == #rolagem.ops and wild and e2>0 then
      t2 = t2 .. e2 .. "d" .. op.face;
      e2 = 0;
    elseif e1>0 then
      if t1 ~= "" then t1 = t1 .. "+" end;
      t1 = t1 .. e1 .. "d" .. op.face;
      e1 = 0;
    end;
  end;
end;

local exp1=0;
local exp2 = 0;
if t1~="" or t2 ~= "" then
  if t2 == "" then t2 = "-" end;
  if t1 == "" then t1 = "-" end;
  exp1, exp2 = invoke("sw", t1 .. " " .. t2 .. " " .. extra .. " false");
end;

r1 = r1 + exp1;
r2 = r2 + exp2;

if show then
  enviar("Resultado: " .. math.floor(r1) .. " selvagem: " .. math.floor(r2));
end;

return r1, r2;