require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("rrpgScene_UserDrawingDetails.lua");

--[[   PLUGIN para fazer user drawings ]]--	

local SETTINGS_CATEGORY = "settings";

	
SceneLib.registerPlugin(
	function (scene, attachment)	
		require("rrpgScene_ShapesMaker.dlua");			
	
		scene.viewport:setupToolCategory(SETTINGS_CATEGORY, lang("scene.toolcategory.settings"), -5);
		
		local frmSincronizar = nil;
		
		scene.viewport:addToolButton(SETTINGS_CATEGORY, 
		                             lang("scene.gridFineTuning.setup"), 
									 "/icos/maisemenos.png",
									 15,
									 {selectable=true, defaultOfCategory=false},			
			
			function()
				possuiaGridAntes = scene.grid.drawGrid;
				scene.grid.drawGrid = true;
				
				if frmSincronizar == nil then
					frmSincronizar = GUI.newForm("frmWorldIncrease");
				end;
				
				scene.viewport:showForm(frmSincronizar, {placement="topLeft"});
			end, 
			
			function()
				--[[ Em construção ]]-- 
				scene.grid.drawGrid = possuiaGridAntes;
				
				if frmSincronizar ~= nil then
					scene.viewport:closeForm(frmSincronizar);
				end;				
			end);		
	end);	