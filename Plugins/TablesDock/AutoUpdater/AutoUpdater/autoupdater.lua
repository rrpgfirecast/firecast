require("rrpg.lua");
require("vhd.lua");
require("utils.lua");
require("internet.lua");


function getConfigWindow()
	local cfgForm = GUI.newForm("autoupdaterPopup");
	cfgForm.title = "Auto Updater";
	return cfgForm;
end

-- Implementação dos comandos
Firecast.Messaging.listen("HandleChatCommand", 
	function (message)
		if message.comando == "autoupdater" then
			local cfgForm = getConfigWindow();

			if (cfgForm) then
				cfgForm:show();
			end;

			message.response = {handled = true};
		end
	end);

Firecast.Messaging.listen("ListChatCommands",
		function(message)
				message.response = {{comando="/autoupdater", descricao="Abre o pop up do Auto Updaterr. "}};
		end);