require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("gui.lua");

--[[   PLUGIN para fazer user drawings details ]]--	

local function getFrmFowShapeDetailsForScene(scene, createIfDontExists)
	local frm = scene.__frmFoWShapeDetails;
	
	if frm == nil and createIfDontExists == nil then
		frm = gui.newForm("frmFoWShapeDetails");
		scene.__frmFoWShapeDetails = frm;
	end;

	return frm;
end;

function FoWShapeDetails_Show(scene, options)
	if options == nil then
		options = {};
	end;
	
	options.strokeColor = options.strokeColor or "black";
	options.fillColor = options.fillColor or "Null";

	local frm = getFrmFowShapeDetailsForScene(scene);
	frm:prepareForShow(options);
	scene.viewport:showForm(frm, {placement="topLeft"});
	return frm;
end;

function FoWShapeDetails_Close(scene)
	local frm = getFrmFowShapeDetailsForScene(scene, false);
	
	if frm ~= nil then
		frm:prepareForClose();
		scene.viewport:closeForm(frm);
	end;
end;
	
	