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
-- MACRO [STAR WARS - GENESIS SYSTEM] by thirteen
local rolls = 0;
local flagTypes = true;
local tableA = {"1 Success", "1 Success", "2 Successes", "1 Advantage", "1 Advantage", "1 Success and 1 Advantage", "2 Advantages"};
local tableB = {"Blank", "Blank", "1 Success", "1 Success and 1 Advantage", "2 Advantages", "1 Advantage"};
local tableC = {"Blank", "1 Failure", "1 Failure", "2 Failures", "2 Failures", "1 Threat", "1 Threat", "1 Failure and 1 Threat", "1 Failure and 1 Threat", "2 Threats", "2 Threats", "1 Despair"};
local tableD = {"Blank", "1 Failure", "2 Failures", "1 Threat", "1 Threat", "1 Threat", "2 Threats", "1 Failure and 1 Threat"};
local tableF = {"1 Dark Side Force Point", "1 Dark Side Force Point", "1 Dark Side Force Point", "1 Dark Side Force Point", "1 Dark Side Force Point", "1 Dark Side Force Point", "2 Dark Side Force Points", "1 Light Side Force Point", "1 Light Side Force Point", "2 Light Side Force Points", "2 Light Side Force Points", "2 Light Side Force Points"};
local tableP = {"Blank", "1 Success", "1 Success", "2 Successes", "2 Successes", "1 Advantage", "1 Success and 1 Advantage", "1 Success and 1 Advantage", "1 Success and 1 Advantage", "2 Advantages", "2 Advantages", "1 Triumph"};
local tableS = {"Blank", "Blank", "1 Failure", "1 Failure", "1 Threat", "1 Threat"};

function 

	if(#arg == 0) then
		write("[§K14]Utilize [§K1][§B]/sw[§B] [§K15]<[§K14]número de dados[§K15]>[§K15]<[§K14]tipo dos dados[§K15]>, exemplo: [§T]/sw 2B 3S[§T]	\n\n[§K3]A	Ability	\n[§K10]B	Boost	\n[§K #f05d5d]C	Challenge	\n[§K #9534eb]D	Difficulty	\n[§K #f0e56c]P	Profiency	\n[§K1]F	Force\n[§K15]S	Setback	");
	else
		for i = 1, #arg, 1 do
			if string.upper(string.sub(arg[i], 2, -1)) == "A" or string.upper(string.sub(arg[i], 2, -1)) == "B" or string.upper(string.sub(arg[i], 2, -1)) == "C" or string.upper(string.sub(arg[i], 2, -1)) == "D" or string.upper(string.sub(arg[i], 2, -1)) == "F" or string.upper(string.sub(arg[i], 2, -1)) == "P" or string.upper(string.sub(arg[i], 2, -1)) == "S" then
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
				local rollAtual = string.sub(arg[j], 1, 1) .. "d";
				local rollType = string.upper(string.sub(arg[j], 2, -1));
				
				if(rollType) == "A" then rollAtual = rollAtual .. "8";
				elseif(rollType) == "B" then rollAtual = rollAtual .. "6";
				elseif(rollType) == "C" then rollAtual = rollAtual .. "12";
				elseif(rollType) == "D" then rollAtual = rollAtual .. "8";
				elseif(rollType) == "P" then rollAtual = rollAtual .. "12";
				elseif(rollType) == "F" then rollAtual = rollAtual .. "12";
				elseif(rollType) == "S" then rollAtual = rollAtual .. "6";
				end;
				
				write(rollAtual);
				
			end;
		end;
	end;