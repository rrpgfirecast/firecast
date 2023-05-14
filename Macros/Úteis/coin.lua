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
-- MACRO [COINTOSS] RRPG8 by thirteen	
	local pick = 0;
	
	-- INÍCIO DO ARREMESSO
	enviar("🎲 " .. meuJogador.nick .."[§R][§K14] arremessou uma moeda para cima.");

	-- ESCOLHA DO RESULTADO
	local indiceRoll, textoRoll = choose("Escolha uma face", {"𝐂𝐀𝐑𝐀 (𝟏)", "𝐂𝐎𝐑𝐎𝐀 (𝟐)"});
		if(indiceRoll == 1) then 
			pick = 1;
			enviar("🎲 " .. meuJogador.nick .."[§R][§K14] escolheu cara.");
		else 
			pick = 2;
			enviar("🎲 " .. meuJogador.nick .."[§R][§K14] escolheu coroa.");
		end;

	-- ROLAGEM E FEEDBACK
	local result = rolar("1d2", "Moeda");
		if(result == pick) then
			enviar("[§B][§K2]Resultado: [§B][§K3]Sucesso");
		else
			enviar("[§B][§K2]Resultado: [§B][§K7]Falha");		
		end;