-- Macro para rolar dados no estilo de CofD por Gatan
-- Usagem: /macro n
-- Onde "macro" é o nome que você deu pra macro e "n" é um número entre 1 e 255.

--PEGAR VALORES PARA TESTE--
dados = parameter;
local aux = {};
explosao = 0;
sucessos = 0;
 
--VERIFICAR SE É UMA LETRA--
if string.find(dados,"%d") == null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
end;
 
--VERIFICAR SE "dados" É "0"--
if dados == 0 then
	write("Não é possível rolar '0' dados");
	return;
end;
 
--AVISAR A ROLAGEM--
send("[§K10]Rolando [§K1]"..dados.."[§K10] dados:");
 
--ROLAR--
txtrolar = "ord"..dados.."d10";
resultado, rolagem = rolar(txtrolar);
 
--REGISTRAR OS RESULTADOS EM UMA ARRAY--
for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       
 
        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
                        aux[#aux + 1] = op.resultados[j];
						if op.resultados[j] > 7 then
							sucessos = sucessos + 1;
						end;
						if op.resultados[j] == 10 then
							explosao = explosao + 1;
						end;
                end;
        end;
end;
 
--AVISAR O RESULTADO--
if (explosao == 0) then
	send("[§K10]Resultado: [§K1]"..sucessos.."[§K10] sucessos.");
else
	while (explosao > 0) do
		--ROLAR--
		txtrolar = "ord"..explosao.."d10";
		explosao = 0;
		resultado, rolagem = rolar(txtrolar);
 
		--REGISTRAR OS RESULTADOS EM UMA ARRAY--
		for i = 1, #rolagem.ops, 1 do
       		 local op = rolagem.ops[i];       
 
      		  if op.tipo == "dado" then
         		       for j = 1, #op.resultados, 1 do
            		            aux[#aux + 1] = op.resultados[j];
									if op.resultados[j] > 7 then
										sucessos = sucessos + 1;
									end;
									if op.resultados[j] == 10 then
										explosao = explosao + 1;
									end;
               		 end;
     		   end;
		end;
	end;	

	send("[§K10]Resultado: [§K1]"..sucessos.."[§K10] sucessos.");
end;
