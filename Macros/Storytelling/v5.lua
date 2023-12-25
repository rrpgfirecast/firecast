-- MACRO [V:AM - V5 2.0] RRPG8

	-- INICIALIZANDO E CAPTANDO VARIÁVEIS E ARGUMENTOS
    local dados = tonumber(arg[1]) or 1;
    local fome = tonumber(arg[2]) or 0;
    local teste = 0;
    local dificuldade = 6;
 
	-- TRATANDO VARIÁVEIS
    if dados < 1 then dados = 1 end;
    if fome < 0 then fome = 0 end;

	-- ANUNCIANDO ROLAGEM
    enviar("[§K3]Rolando: [§K1]" .. dados .. "[§K1]d10     [§K3]Fome: [§K1]" .. fome);

	-- DETERMINANDO ROLAGEM
    dados = dados - fome;
    if (dados > 0) then
    teste = "ord " .. dados .. "d10";
        if (fome > 0) then
            teste = teste .. "+" .. fome .. "d10";
        end;
    end;

    if (dados == 0) then
		teste = "ord " .. fome .. "d10";
    end;

    if (dados < 0) then
		fome = dados + fome;
		dados = 0;
		teste = "ord " .. fome .. "d10";
    end;
 
    -- INICIALIZANDO VARIÁVEIS DE ROLAGEM
    local resultado, rolagem = rolar(teste);
    local sucessos = 0;
    local dez = 0;
    local um = 0;
    local dezFome = 0;
    local umFome = 0;
	local somaDesempate = 0;
 
 
    -- DADOS NORMAIS
    if (dados > 0) then
      local op = rolagem.ops[2];
      for j=1, #op.resultados, 1 do
        if (op.resultados[j] >= dificuldade) then
          sucessos = sucessos +1;
		  somaDesempate = somaDesempate + op.resultados[j];
        end;
        if (op.resultados[j] >= 10) then
          dez = dez +1;
        end;
        if (op.resultados[j] <= 1) then
          um = um +1;
        end;
      end;
 
 
    -- DADOS DE FOME
      op = rolagem.ops[4];
      if op ~= nil then
          for j=1, #op.resultados, 1 do
            if (op.resultados[j] >= dificuldade) then
              sucessos = sucessos +1;
			  somaDesempate = somaDesempate + op.resultados[j];
            end;
            if (op.resultados[j] >= 10) then
              dezFome = dezFome +1;
            end;
            if (op.resultados[j] <= 1) then
              umFome = umFome +1;
            end;
          end;
        end;
    end;


    if(dados == 0) then
      op = rolagem.ops[2];
      if op ~= nil then
          for j=1, #op.resultados, 1 do
            if (op.resultados[j] >= dificuldade) then
              sucessos = sucessos +1;
			  somaDesempate = somaDesempate + op.resultados[j];
            end;
            if (op.resultados[j] >= 10) then
              dezFome = dezFome +1;
            end;
            if (op.resultados[j] <= 1) then
              umFome = umFome +1;
            end;
          end;
        end;
    end;


	-- TRATANDO RESULTADOS E IMPRESSÃO
	local textDesempate = "";
    local sucessos = sucessos + (math.floor( (dez+dezFome)/2 ) * 2);
	if(somaDesempate ~= 0) then textDesempate = " [§K#222222](".. string.format("%02d",somaDesempate) ..")"; end;
    local text = "[§K2]Sucessos: [§K1]" .. sucessos .. textDesempate;
 
    if (dez>= 2 and dezFome == 0) then
        text = text .. "     [§B][§K3]Crítico[§B]";
    end;
 
    if ((dez+dezFome)>= 2 and dezFome >= 1) then
        text = text .. "     [§B][§K7]Crítico Violento[§B]";
    end;
 
    if (sucessos == 0 and um >= 1 and umFome == 0) then
        text = text .. "     [§B][§K7]Falha Crítica[§B]";
    end;
 
    if (sucessos == 0 and umFome >= 1) then
        text = text .. "     [§B][§K#AD0000]Falha Bestial[§B]";
    end;
 
    enviar("\n"..text);
