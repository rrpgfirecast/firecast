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
				
		scene.viewport:addToolButton(SETTINGS_CATEGORY, 
		                             lang("scene.gridFineTuning.setup"), 
									 "/icos/maisemenos.png",
									 15,
									 {selectable=true, defaultOfCategory=false},			
			
			function()
				possuiaGridAntes = scene.grid.drawGrid;
				scene.grid.drawGrid = true;
				FrmSquareShape_Close(scene)
				frmWorldIncrease_Show(scene);		
			end, 
			
			function()
				--[[ Em construção ]]-- 
				scene.grid.drawGrid = possuiaGridAntes;	
				
				
				frmWorldIncrease_Close(scene);

			end);

		function worldControlIncreaseHeight()
		scene.worldHeight = scene.worldHeight + 0.1;
		scene.grid.drawGrid = true;
		end;
		
		function worldControlDecreaseHeight()
		scene.worldHeight = scene.worldHeight - 0.1;
		end;
		
		function worldControlIncreaseWidth()
		scene.worldWidth = scene.worldWidth + 0.1;
		end;
		
		function worldControlDecreaseWidth()
		scene.worldWidth = scene.worldWidth - 0.1;
		end;
			
	end);	