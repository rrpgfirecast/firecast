require("fireDrive.lua");
require("rrpg.lua");
require("internet.lua");
	
function RRPG_ExibirFireDrive()
	local frm = GUI.newForm("frmFireDriveExplorer");		
	frm:show();
end;	
	
Firecast.Messaging.listen("HandleChatCommand",
	function(message)
		message.response = {handled = true};		
		
		RRPG_ExibirFireDrive();		
	end, {comando="fd"});
	
	
	