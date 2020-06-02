require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("gui.lua");

--[[   PLUGIN para fazer user drawings details ]]--	

local function getFrmDetailsForScene2(scene, createIfDontExists)
	local frm = scene.__frmTeste;
	
	if frm == nil and createIfDontExists == nil then
		frm = GUI.newForm("frmTeste");
		scene.__frmTeste = frm;
	end;

	return frm;
end;

function UserDrawingDetails_Show2(scene)


	local frm = getFrmDetailsForScene2(scene);
	scene.viewport:showForm(frm, {placement="topLeft"});
	return frm;
end;

function UserDrawingDetails_Close2(scene)
	local frm = getFrmDetailsForScene2(scene, false);
	
		scene.viewport:closeForm(frm);

end;
	
	