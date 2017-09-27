local objs = require("rrpgObjs.lua");
local ndb = require("ndb.lua");
local gui = require("gui.lua");
local plugins = require("plugins.lua");
require("NodeExplorer/PermissionsPopUp.lfm.lua");

permissions = {}

function permissions.show(nodeObj)
	local frm = gui.newForm("frmNodePermissions");
	frm:editar(nodeObj);
end;

plugins.listenPM("ndbHost:editPermissions",
	function(message)	
		local localNodeID = message.localNodeID;
		local node = ndb.loadNodeFromLocalID(localNodeID);
		
		if node ~= nil then
			permissions.show(node);
		end;
	end);


function RRPG_EditarPermissoesDeNode(localNodeID)
	local node = ndb.loadNodeFromLocalID(localNodeID);
	
	if node ~= nil then
		permissions.show(node);
	end;
end;	
	
return permissions;