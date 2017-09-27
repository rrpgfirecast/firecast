local fireDrive = require("fireDrive.lua");
require("rrpg.lua");
require("internet.lua");

--[[
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};
		
		fireDrive.getFiles(message.parametro,
			function(fs)
				message.chat:escrever("\\\\Lista: ");	
				
				for i = 1, #fs, 1 do
					message.chat:escrever(fs[i].name .. "       " .. tableToStr(fs[i]));	
				end;
				
				message.chat:escrever("//Fim da Lista");
			end,
			
			function(errorMsg)
				message.chat:escrever("erro: " .. tostring(errorMsg));	
			end);
	end, {comando="fdlist"});
	
	
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};
		
		fireDrive.createDirectory(message.parametro,
			function(ret)
				message.chat:escrever("diretório criado: " .. tableToStr(ret));
			end,
			
			function(errMsg)
				message.chat:escrever("Erro ao criar diretório: " .. errMsg);
			end);		
	end, {comando="fdmkdir"});	
	
	
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};
		

		dialogs.openFile("Selecione arquivos para fazer upload", nil, true, 
						function(files)
									
							local f = files[1];						
							local destName = message.parametro or "";
							
							if destName == "" then
								detName = f.name;
							end;
							
							fireDrive.uploadFile(detName, f.stream,
							function(x)
								message.chat:escrever("Sucesso: " .. (tableToStr(x, true) or ""));
							end,
							
							function(x, i)
								message.chat:escrever(string.format("Progresso: %d / %d", x, i));
							end,
							
							function(x)
								message.chat:escrever("erro: " .. tostring(x));
							end);	
						end);	
		
		
	end, {comando="fdupload"});		
	
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};
				
		fireDrive.delete(message.parametro,
		function(x)
			message.chat:escrever("Sucesso ao deletar");
		end,
			
		function(x)
			message.chat:escrever("Erro ao deletar: " .. tostring(x));
		end, 'text/plain');	
		
	end, {comando="fddelete"});			
	
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};
				
		fireDrive.refresh(function(x)
			message.chat:escrever("Refrescado");
		end,
			
		function(x)
			message.chat:escrever("Erro ao refrescar: " .. tostring(x));
		end, 'text/plain');	
		
	end, {comando="fdrefresh"});		
	

rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};
				
		fireDrive.getFileInfo(message.parametro or "",
		function(x)
			if x ~= nil then
				message.chat:escrever("Informações do arquivo: " .. tableToStr(x));
			else
				message.chat:escrever("Arquivo não existe");
			end;
		end,
			
		function(x)
			message.chat:escrever("Erro ao obter informações do arquivo: " .. tostring(x));
		end, 'text/plain');	
		
	end, {comando="fdinfo"});	
	
]]	
	
function RRPG_ExibirFireDrive()
	local frm = gui.newForm("frmFireDriveExplorer");		
	frm:show();
end;	
	
rrpg.messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};		
		
		RRPG_ExibirFireDrive();		
	end, {comando="fd"});
	
	
	