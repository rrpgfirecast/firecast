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
-- MACRO [PENDRAGON] RRPG8 by thirteen

local NA = math.floor(tonumber(arg[1]));
local OVER = "";
local realResult = 0;
if NA > 20 then
	OVER = tostring(" + ".. NA - 20);
end;



resultados = rolarLocal("1d20" .. OVER, "NA " .. NA);
if NA > 20 then
	resultados = resultados - (NA-20);
end;


local msg = "";
local pointer = "[§K14]";

for i = 1, 20 do
if i ~= NA then
	if NA > 20 and i == 20 then
		pointer = pointer.." ^  ";
	else
		pointer = pointer.."    ";
	end;
else
	pointer = pointer.." ^  ";
end;

	if i < resultados then
		if i == NA then
			msg = msg.."[§K0,9]    ";
		elseif i > NA then
			msg = msg.."[§K0,7]    ";
		else
			msg = msg.."[§K0,3]    ";
		end;
	elseif i == resultados then
		if i == NA then
			msg = msg.."[§K0,9]    ";
		elseif i > NA then
			msg = msg.."[§K0,7]    ";
		else
			msg = msg.."[§K0,3]    ";
		end;
	elseif i > resultados then
		if i == 20 and NA < 20 then
			msg = msg.."[§K0,15]    ";
		else
			msg = msg.."[§K0,14]    ";
		end;
	end;
end;

if resultados == 20 and NA < 20 then
msg = "[§K0,4]                                                                                ";
end;

if NA < 20 then
	if resultados < NA then
		enviar("🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]1d20"..OVER.."[§K1] = [§K3]" .. math.floor(resultados) .. " [§K1]{[§K7][" .. math.floor(resultados) .."][§K1]}, [§K3]Sucesso [§K14]<< NA ".. string.format("%02d",NA).." >>");
	elseif resultados == NA then
		enviar("🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]1d20"..OVER.."[§K1] = [§K3]" .. math.floor(resultados) .. " [§K1]{[§K7][" .. math.floor(resultados) .."][§K1]}, [§K9]Sucesso Crítico [§K14]<< NA ".. string.format("%02d",NA).." >>");
	elseif resultados > NA and resultados < 20 then
		enviar("🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]1d20"..OVER.."[§K1] = [§K3]" .. math.floor(resultados) .. " [§K1]{[§K7][" .. math.floor(resultados) .."][§K1]}, [§K7]Falha [§K14]<< NA ".. string.format("%02d",NA).." >>");
	else
		enviar("🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]1d20"..OVER.."[§K1] = [§K3]" .. math.floor(resultados) .. " [§K1]{[§K7][" .. math.floor(resultados) .."][§K1]}, [§K4]Falha Crítica [§K14]<< NA ".. string.format("%02d",NA).." >>");
	end;
else
	realResult = resultados + (NA-20);
	if realResult ~= 20 then
		enviar("🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]1d20"..OVER.."[§K1] = [§K3]" .. math.floor(realResult) .. " [§K1]{[§K7][" .. math.floor(resultados) .."][§K1]}, [§K3]Sucesso [§K14]<< NA ".. string.format("%02d",NA).." >>");
	else
		enviar("🎲[§K2]"..meuJogador.nick .."[§R][§K1] rolou [§K2]1d20"..OVER.."[§K1] = [§K3]" .. math.floor(realResult) .. " [§K1]{[§K7][" .. math.floor(resultados) .."][§K1]}, [§K9]Sucesso Crítico [§K14]<< NA ".. string.format("%02d",NA).." >>");
	end;
end;

enviar("###### " .. msg .. "[§R]");
enviar("###### " .. pointer);