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
-- Calculadora [RRPG 8] by thirteen
	-- Captação e tratamento do cálculo
	x = parametro:gsub("(%d+d%d+)", "rolar('%1')");
	func = assert(load("return " .. x));
	y = func();

	-- Formatando sinalizadores
	parametro = parametro:gsub("%*", " * ");
	parametro = parametro:gsub("/", " / ");
	parametro = parametro:gsub("+", " + ");
	parametro = parametro:gsub("-", " - ");
	parametro = parametro:gsub("%^", " ^ ");
	parametro = parametro:gsub("%s+", " ");

	-- Impressão do Resultado
	enviar("🎲 [§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]‎" .. parametro .. " [§K1]= [§K3]" .. y .." [§K1]{[§K7]".. parametro .."[§K1]}");