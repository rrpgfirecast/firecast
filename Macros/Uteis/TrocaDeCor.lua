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
	-- Altera a cor do texto, adicionando travessões, quando colocado um caractere chave no texto.
	-- Exemplo: "/@ Ação @ fala do personagem @ mais ação." ➜ "— Ação — fala do personagem — mais ação."
	local texto = parametro;
	
	-- Código da cor das ações
	local corAcao = "14";
	
	-- Código da cor das falas
	local corFala = "1";
	
	-- Caractere desejado para troca
	local caractereTroca = "@";
	
	local novoTexto = "[§K" .. corAcao .. "]";

	-- Começo do Texto
	local dentroDoArroba = false;
	for letra in string.gmatch(texto, ".") do

	  if letra == caractereTroca then
		 dentroDoArroba = not dentroDoArroba;
		 if dentroDoArroba then
			-- Transição de Ação para Fala
			novoTexto = novoTexto .. "— [§K" .. corFala .. "]";
		 else
			-- Transição de Fala para Ação
			novoTexto = novoTexto .. "[§K" .. corAcao .. "] —";
		 end;    
	  else
		 novoTexto = novoTexto .. letra;
	  end;
	end;

	enviar(novoTexto);