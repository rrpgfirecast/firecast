--CRIADO POR CARDOSO--
--DISTRIBUICAO GRATUITA--
--santrovitsch@hotmail.com--

--PEGAR VALORES PARA TESTE--
dados = parameter;
dados = string.lower(dados);

--TESTAR SE PARAMETRO ESTA VAZIO--
if dados == "" then
	write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
	write("[§K4] x [§K1]= Número de dados para rolar");
	write("[§K5] y [§K1]= Número de dados para manter");
	write("[§K22] z [§K1]= Bônus somado ao resultado");
	write("[§K8] & [§K1]= Rolar novamente resultado 1");
	write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
	write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
	return;
end;

--TESTAR SE PARAMETRO CONTEM 3 CARACTERES--
dadostam = string.len(dados)
if dadostam < 3 then
	write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
	write("[§K4] x [§K1]= Número de dados para rolar");
	write("[§K5] y [§K1]= Número de dados para manter");
	write("[§K22] z [§K1]= Bônus somado ao resultado");
	write("[§K8] & [§K1]= Rolar novamente resultado 1");
	write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
	write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
	return;
end;

--TESTAR SE PARAMETRO CONTEM LETRA "k"--
posk=string.find(dados,"k");
if posk == null then
	write("Você esqueceu de usar a letra 'k'");
	return;
end;

--TESTAR SE PARAMETRO CONTEM CARACTERE "*" OU "&"--
explodir = 0;
enfase = 0;
posast = string.find(dados,"*");
poseco = string.find(dados,"&");
if posast ~= null then ast = 1; else ast = 0; end;
if poseco ~= null then eco = 1; else eco = 0; end;
if ast == 1 and eco == 0 then
	if dadostam < 4 then
		write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
		write("[§K4] x [§K1]= Número de dados para rolar");
		write("[§K5] y [§K1]= Número de dados para manter");
		write("[§K22] z [§K1]= Bônus somado ao resultado");
		write("[§K8] & [§K1]= Rolar novamente resultado 1");
		write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
		write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
		return;		
	elseif posast ~= dadostam then
		write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
		write("[§K4] x [§K1]= Número de dados para rolar");
		write("[§K5] y [§K1]= Número de dados para manter");
		write("[§K22] z [§K1]= Bônus somado ao resultado");
		write("[§K8] & [§K1]= Rolar novamente resultado 1");
		write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
		write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
		return;
	else
		explodir = 1;
		dados = string.sub(dados,0,posast-1);
	end;
elseif ast == 0 and eco == 1 then
	if dadostam < 4 then
		write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
		write("[§K4] x [§K1]= Número de dados para rolar");
		write("[§K5] y [§K1]= Número de dados para manter");
		write("[§K22] z [§K1]= Bônus somado ao resultado");
		write("[§K8] & [§K1]= Rolar novamente resultado 1");
		write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
		write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
		return;		
	elseif poseco ~= dadostam then
		write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
		write("[§K4] x [§K1]= Número de dados para rolar");
		write("[§K5] y [§K1]= Número de dados para manter");
		write("[§K22] z [§K1]= Bônus somado ao resultado");
		write("[§K8] & [§K1]= Rolar novamente resultado 1");
		write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
		write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
		return;
	else
		enfase = 1;
		dados = string.sub(dados,0,poseco-1);
	end;
elseif ast == 1 and eco == 1 then
	if dadostam < 5 then
		write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
		write("[§K4] x [§K1]= Número de dados para rolar");
		write("[§K5] y [§K1]= Número de dados para manter");
		write("[§K22] z [§K1]= Bônus somado ao resultado");
		write("[§K8] & [§K1]= Rolar novamente resultado 1");
		write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
		write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
		return;		
	elseif posast < dadostam-1 or poseco < dadostam-1 then
		write("Utilize: /r5 [§K4]x[§K1]k[§K5]y[§K22]+z[§K8]&[§K9]*");
		write("[§K4] x [§K1]= Número de dados para rolar");
		write("[§K5] y [§K1]= Número de dados para manter");
		write("[§K22] z [§K1]= Bônus somado ao resultado");
		write("[§K8] & [§K1]= Rolar novamente resultado 1");
		write("[§K9] * [§K1]= NÃO rolar novamente resultado 10");
		write("[§K9] * [§K1]e[§K8] & [§K1]podem estar em qualquer ordem, mas sempre no final");
		return;
	else
		explodir = 1;
		enfase = 1;
		if posast > poseco then
			dados = string.sub(dados,0,posast-2);
		else
			dados = string.sub(dados,0,poseco-2);
		end;
	end;
end;

--SEPARAR PARAMETROS--
lk = string.find(dados,"k"); --POSICAO DA LETRA "k"--
qtddados = string.sub(dados,1,lk-1);
if qtddados == "171" then send("DSC"); end;
lp = string.find(dados,"+"); --POSICAO DO CARACTERE "+"--
if lp == null then
	manter = string.sub(dados,lk+1);
	bonus = 0;
else
	manter = string.sub(dados,lk+1,lp-1);
	bonus = string.sub(dados,lp+1);
end;

--TESTAR SE VARIAVEIS SAO NUMERICAS--
if string.find(qtddados,"%d") == null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
elseif string.find(qtddados,"%a") ~= null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
else
	qtddados = tonumber(qtddados);
end;
if string.find(manter,"%d") == null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
elseif string.find(manter,"%a") ~= null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
else
	manter = tonumber(manter);
end;
if qtddados == 171 then send("Anti"); end;
if string.find(bonus,"%d") == null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
elseif string.find(bonus,"%a") ~= null then
	write("Você digitou uma letra onde deveria ser um número");
	return;
else
	bonus = tonumber(bonus);
end;

--VERIFICAR SE "qtddados" É "0"--
if qtddados == 0 then
	write("Não é possível rolar '0' dados");
	return;
end;

--VERIFICAR SE "manter" É MAIOR QUE "qtddados"--
if qtddados == 171 then send("Cópia"); return; end;
if manter > qtddados then
	manter = qtddados;
end;

--AVISAR SOBRE ROLAGEM QUE ESTA SENDO FEITA--
if bonus < 1 then
	if explodir == 0 and enfase == 0 then
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.." [§K3]Exp [§K15]Enf");
	elseif explodir == 0 and enfase == 1 then
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.." [§K3]Exp Enf");
	elseif explodir == 1 and enfase == 1 then
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.." [§K15]Exp [§K3]Enf");
	else
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.." [§K15]Exp Enf");
	end;
else
	if explodir == 0 and enfase == 0 then
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.."[§K3] + [§K1]"..bonus.." [§K3]Exp [§K15]Enf");
	elseif explodir == 0 and enfase == 1 then
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.."[§K3] + [§K1]"..bonus.." [§K3]Exp Enf");
	elseif explodir == 1 and enfase == 1 then
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.."[§K3] + [§K1]"..bonus.." [§K15]Exp [§K3]Enf");
	else
		send("[§K3]Rolando [§K1]"..qtddados.."[§K4]k[§K1]"..manter.."[§K3] + [§K1]"..bonus.." [§K17]Exp Enf");
	end;
end;

--ROLAR TESTE--
if explodir ~= 0 then
	txtrolar = qtddados.."d10";
	resultado, rolagem = rolar(txtrolar);
	vlrdados = {};
	for i=1, #rolagem.ops, 1 do
		op = rolagem.ops[i];
		for j=1, #op.resultados, 1 do
			if enfase == 1 then
				if op.resultados[j] == 1 then
					enfdado = rolar("1d10","Ênfase");
					vlrdados[#vlrdados+1] = enfdado;
				else
					vlrdados[#vlrdados+1] = op.resultados[j];
				end;
			else
				vlrdados[#vlrdados+1] = op.resultados[j];
			end;
		end;
	end;
	table.sort(vlrdados);
	texto = ""; 
	soma = 0;
	for i=#vlrdados, #vlrdados-manter+1, -1 do
		texto = texto.." "..math.floor(vlrdados[i]);
		soma = soma + math.floor(vlrdados[i]);
	end;
	if bonus > 0 then
		soma = soma + bonus;
		send("[§K3]Mantidos: [§K1]"..texto.."[§K3]   Bônus: [§K1]"..bonus.."   [§K3]Total: [§K1]"..soma);
	else
		send("[§K3]Mantidos: [§K1]"..texto.."   [§K3]Total: [§K1]"..soma);
	end;
else
	rolando = 1;
	txtrolar = qtddados.."d10";
	texto = ""; 
	soma = 0;
	while rolando == 1 do
		vlrdados = {};
		rolarnovo = 0;
		rolando = 0;
		if soma == 0 then resultado, rolagem = rolar(txtrolar);
		else resultado, rolagem = rolar(txtrolar,"Explosão"); end;
		for i=1, #rolagem.ops, 1 do
			op = rolagem.ops[i];
			for j=1, #op.resultados, 1 do
				if enfase == 1 then
					if op.resultados[j] == 1 then
						enfdado = rolar("1d10","Ênfase");
						vlrdados[#vlrdados+1] = enfdado;
					else
						vlrdados[#vlrdados+1] = op.resultados[j];
					end;
				else
					vlrdados[#vlrdados+1] = op.resultados[j];
				end;
			end;
		end;
		table.sort(vlrdados);
		for i=#vlrdados, #vlrdados-manter+1, -1 do
			roladavalor = math.floor(vlrdados[i]);
			texto = texto.." "..roladavalor;
			soma = soma + roladavalor;
			if roladavalor == 10 then
				rolarnovo = rolarnovo + 1;
				rolando = 1;
			end;
		end;
		txtrolar = rolarnovo.."d10";
		manter = rolarnovo;
	end
	if bonus > 0 then
		soma = soma + bonus;
		send("[§K3]Mantidos: [§K1]"..texto.."[§K3]   Bônus: [§K1]"..bonus.."   [§K3]Total: [§K1]"..soma);
	else
		send("[§K3]Mantidos: [§K1]"..texto.."   [§K3]Total: [§K1]"..soma);
	end;
end;
