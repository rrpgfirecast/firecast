require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("gui.lua");

--[[   PLUGIN para fazer user drawings details ]]--	

local function getFrmSquareShape(scene, createIfDontExists)
	local frm = scene.__frmTeste;
	
	if frm == nil and createIfDontExists == nil then
		frm = GUI.newForm("frmSquareShape");
		scene.__frmTeste = frm;
	end;

	return frm;
end;

function FrmSquareShape_Show(scene)

	local frm = getFrmSquareShape(scene);
	scene.viewport:showForm(frm, {placement="topLeft"});
	return frm;
	
end;

function FrmSquareShape_Close(scene)
	local frm = getFrmSquareShape(scene, false);
	
		scene.viewport:closeForm(frm);

end;
	
	