require("rrpg.lua");
require("dialogs.lua");
require("gui.lua");

function Firecast_GerenciarDados(configRoot)
	local node = ndb.loadNodeFromLocalID(configRoot);
		
		
		
	if node ~= nil then
		local frm = gui.newForm("frmConfigDice");
		frm:setNodeObject(node);
		frm:show();
	
		--permissions.show(node);
	end;
end;