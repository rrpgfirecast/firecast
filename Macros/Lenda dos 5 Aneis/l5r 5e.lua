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
-- MACRO [L5R - 5th edition] by thirteen
local rolls = 0;
local flagTypes = true;
local tableR = {"   ", "[§I https://imgur.com/FgolFB4.png][12][12] [§I https://imgur.com/UxOyFc4.png][12][12]", "[§I https://imgur.com/FgolFB4.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12] [§I https://imgur.com/UxOyFc4.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12]", "[§I https://imgur.com/T0tRvUt.png][12][12] [§I https://imgur.com/UxOyFc4.png][12][12]"};
local tableS = {"   ", "   ", "[§I https://imgur.com/FgolFB4.png][12][12]", "[§I https://imgur.com/FgolFB4.png][12][12]", "[§I https://imgur.com/FgolFB4.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12] [§I https://imgur.com/UxOyFc4.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12] [§I https://imgur.com/UxOyFc4.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12]", "[§I https://imgur.com/9wgzew3.png][12][12] [§I https://imgur.com/FgolFB4.png][12][12]", "[§I https://imgur.com/T0tRvUt.png][12][12] [§I https://imgur.com/UxOyFc4.png][12][12]", "[§I https://imgur.com/T0tRvUt.png][12][12]"};

function rolarL5R(a, b)
	local rollFinal = "";
	local description = "";
	local resultadoFinal = "";
	local mensagem = "";
	
	if(a) == "R" then rollFinal = b .. "d6"; description = "Ring Dies";
	elseif(a) == "S" then rollFinal = b .. "d12"; description = "Skill Dies";
	end;
	
	local resultado, rolagem = rolarLocal(rollFinal);
	
	mensagem = "🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]".. b .. " " .. description .. "[§K1] = [§K3]";
	
		for m = 1, b, 1 do
			if (m == math.floor(b)) then
				mensagem = mensagem .. math.floor(rolagem.ops[1].resultados[m]);
				
				if(a) == "R" then resultadoFinal = resultadoFinal .. tableR[math.floor(rolagem.ops[1].resultados[m])];
				elseif(a) == "S" then  resultadoFinal = resultadoFinal .. tableS[math.floor(rolagem.ops[1].resultados[m])];
				end;
			else
				mensagem = mensagem .. math.floor(rolagem.ops[1].resultados[m]) .. ", ";
				
				if(a) == "R" then resultadoFinal = resultadoFinal .. tableR[math.floor(rolagem.ops[1].resultados[m])] .. ", ";
				elseif(a) == "S" then  resultadoFinal = resultadoFinal .. tableS[math.floor(rolagem.ops[1].resultados[m])] .. ", ";
				end;
			end;
		end;
		
	mensagem = mensagem .. " [§K1]{[§K7][" .. resultadoFinal .. "][§K1]} [§K3][§K14]  << " .. description .. " >>";
	enviar(mensagem);
end;

	if(#arg == 0) then
		write("[§K14]Utilize [§K1][§B]/l5r[§B] [§K15]<[§K14]número de dados[§K15]>[§K15]<[§K14]tipo dos dados[§K15]>, exemplo: [§T]/L5R 2R 3S[§T]	\n\n[§K3]R	Ring Die	\n[§K10]S	Skill Die");
	else
		for i = 1, #arg, 1 do
			if string.upper(string.sub(arg[i], 2, -1)) == "R" or string.upper(string.sub(arg[i], 2, -1)) == "S" then
				flagTypes = true;
			else
				write("[§K4]Utilize um dos tipos de dados válidos!");
				flagTypes = false;
			end;
			
			if(flagTypes == false) then
				break;
			end;
		end;
		
		if(flagTypes == true) then
			for j = 1, #arg, 1 do
				local rollAtual = string.sub(arg[j], 1, 1);
				local rollType = string.upper(string.sub(arg[j], 2, -1));
				
				rolarL5R(rollType, rollAtual);
				
			end;
		end;
	end;