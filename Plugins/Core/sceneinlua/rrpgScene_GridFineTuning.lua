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
		
		local frmFineTuning = nil;
		
		scene.viewport:addToolButton(SETTINGS_CATEGORY, 
		                             lang("scene.gridFineTuning.setup"), 
									 "/icos/maisemenos.png",
									 15,
									 {selectable=true, defaultOfCategory=false},			
			
			function()
				possuiaGridAntes = scene.grid.drawGrid;
				scene.grid.drawGrid = true;
				
				if frmFineTuning == nil then
					frmFineTuning = GUI.newForm("frmWorldIncrease");
					frmFineTuning.sceneAlvo = scene;
				end;
				
				scene.viewport:showForm(frmFineTuning, {placement="topLeft"});
			end, 
			
			function()
				--[[ Em construção ]]-- 
				scene.grid.drawGrid = possuiaGridAntes;
				
				if frmFineTuning ~= nil then
					scene.viewport:closeForm(frmFineTuning);
				end;				
			end);		
	end);	