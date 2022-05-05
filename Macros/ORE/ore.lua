--                                                            
--                                                            
--                                                            
--                                                            
--                                                            
--                    /@@@              ,,                    
--                  @@@@@@        ,@@@@@&@@@@.                
--                @@@@@@@@      @@&   *&@&@@%@                
--             ,@@@ %@@@@&    @@@@      @@@@#                 
--           @@@(   @%@%&    @@@@      @@@@@&@@%&%.           
--                  @@@@@           %@@&/  ,@@@@@@@@          
--                 (@&&%@          ,          &@@@&(&         
--                 #@@@@&        ,@#@         ,&@@*@#         
--                 @@@@@&      @@@@           @@@@@%          
--                .@@@@@.     @@@@@,         @@@#             
--                @@@@%@     ,@@&&@@@@@@@@@&&(                
--                @@@@@@        @&@@@@@@.                     
--               @@@@@@@*&@                                   
--               %@@%@@@@&                                    
--              %@@@&@                                        
--
--
--
--
-- MACRO [ORE] RRPG8 by thirteen
if(arg[1] ~= nil and tonumber(arg[1]) ~= nil) then
	-- INICIANDO VARIÁVEIS
	textResultado = "";
	textED = "";
	ED = 0;
	nResultados = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	dados = tonumber(arg[1]);
	if (dados > 10) then dados = 10; end;
	if(arg[2] ~= nil and tonumber(arg[2]) ~= nil and tonumber(arg[2]) > 0) then 
		ED = tonumber(arg[2]); dados = dados -1;
		textED = "+"..ED;
	end;
	local resultado, rolagem = rolar("ord "..dados.."d10"..textED);
	
   -- CONTABILIZANDO SUCESSOS
    if (dados > 0) then
      local op = rolagem.ops[2];
      for j=1, #op.resultados, 1 do
        nResultados[math.floor(op.resultados[j])] = nResultados[math.floor(op.resultados[j])] + 1;
      end;
	  if(ED > 0) then 
		nResultados[ED] = nResultados[ED] + 1; 
	end;
	end;	
	
	-- IMPRIMINDO RESULTADOS
	for i=1, #nResultados, 1 do
		if(nResultados[i]>1) then
			textResultado = textResultado .."[".. nResultados[i].."⨯"..tostring(i).."]";
			if (textResultado ~= "") then textResultado = textResultado .. ", " end;
		end;
	end;
	
	if(textResultado == "") then 
		textResultado = "[§K14]Nenhum conjunto"
		enviar("‎\n[§B][§K2]Conjuntos Disponíveis:[§B] " ..textResultado..""); 
	else 
		textResultado = textResultado:sub(1, -3);
		enviar("‎\n[§B][§K2]Conjuntos Disponíveis:[§B] [§K1]{[§K7]" ..textResultado.."[§K1]}");
	end;
else
	escrever("[§K14][§B]Comando Inválido![§B] /[§K2][§B]ore[§K14][§B] <[§K15]Total de Dados[§K14]> <[§K15]ED (Opcional)[§K14]>.");
end;