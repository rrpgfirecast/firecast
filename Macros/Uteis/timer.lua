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
-- MACRO TIMER by thirteen
local function SecondsToClock(seconds)
  local days = math.floor(seconds / 86400)
  seconds = seconds - days * 86400
  local hours = math.floor(seconds / 3600 )
  seconds = seconds - hours * 3600
  local minutes = math.floor(seconds / 60) 
  seconds = seconds - minutes * 60
  
  return string.format("%02d:%02d:%02d:%02d.",days,hours,minutes,seconds);
end;

if(arg[1] ~= nil and arg[2] ~= nil) then
	alarme = "";
	IdA = "";
	
	-- CAPTANDO TEMPO DO ALARME
	timer = arg[1];
	if (string.sub(timer, -1) == "s") then
		timer =  tonumber(string.match(timer, '%d[%d.,]*')) * 1000;
		alarme = "[§B][§K1]".. tostring(math.floor((timer)/1000)).."[§K14] segundos";
	elseif (string.sub(timer, -1) == "m") then
		timer =  tonumber(string.match(timer, '%d[%d.,]*')) * 60000;
		alarme = "[§B][§K1]".. tostring(math.floor((timer)/60000)).."[§K14] minutos";
	elseif (string.sub(timer, -1) == "h") then
		timer =  tonumber(string.match(timer, '%d[%d.,]*')) * 3600000;
		alarme = "[§B][§K1]".. tostring(math.floor((timer)/3600000)).."[§K14] horas";
	else
		escrever("[§K14][§B]Comando Inválido![§B] /[§K2][§B]timer[§K15][§B] <[§K14]Tempo[§K15]h/m/s> <[§K14]Intervalo de Avisos[§K15]h/m/s>.");
		return;
	end;
	
	-- CAPTANDO INTERVALOS DE AVISO
	interval = arg[2];
	if (string.sub(interval, -1) == "s") then
		interval =  tonumber(string.match(interval, '%d[%d.,]*')) * 1000;
		IdA = "[§B][§K1]".. tostring(math.floor((interval)/1000)).."[§K14] segundos";
	elseif (string.sub(interval, -1) == "m") then
		interval =  tonumber(string.match(interval, '%d[%d.,]*')) * 60000;
		IdA = "[§B][§K1]".. tostring(math.floor((interval)/60000)).."[§K14] minutos";
	elseif (string.sub(interval, -1) == "h") then
		interval =  tonumber(string.match(interval, '%d[%d.,]*')) * 3600000;
		IdA = "[§B][§K1]".. tostring(math.floor((interval)/3600000)).."[§K14] horas";
	else
		escrever("[§K14][§B]Comando Inválido![§B] /[§K2][§B]timer[§K15][§B] <[§K14]Tempo[§K15]h/m/s> <[§K14]Intervalo de Avisos[§K15]h/m/s>.");
		return;
	end;
	if(interval>timer) then interval = timer; IdA = alarme; end;
	enviar("⏳ [§B][§K2]Alarme: ".. alarme .."	[§B][§K2]Intervalo de Avisos: " .. IdA);
	wait(400);
	
	-- TIMER
	if(timer ~= interval) then
		for i = 0, timer, interval do
			if (timer-i > 0) then
				escrever("⏳ [§B][§K2]Tempo restante:[§B] [§K1]".. SecondsToClock((timer-i)/1000));
			else
				escrever("⏳ [§B][§K1]Tempo esgotado.");
				enviar("/rir"); 
			end;
			
			if((timer - i) > interval) then
				wait(interval);
			else
				wait(timer - i);
				enviar("/rir"); 
				break;
			end;
		end;
	else
		escrever("⏳ [§B][§K2]Tempo restante:[§B] [§K1]".. SecondsToClock((timer)/1000));	
		wait(interval);
		enviar("/rir"); 
	end;
else
	escrever("[§K14][§B]Comando Inválido![§B] /[§K2][§B]timer[§K15][§B] <[§K14]Tempo[§K15]h/m/s> <[§K14]Intervalo de Avisos[§K15]h/m/s>.");
end;