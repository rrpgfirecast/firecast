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
		
		local possuiaGridAntes = nil;
		local shapeMaker = nil;
		local realCellWidth = nil
		local realCellHeight = nil;
		
		local function updateGridSizes()
			realCellWidth = scene.grid.cellSize;
			realCellHeight = scene.grid.cellSize;
		end;
		
		updateGridSizes();
		
		local function pararDesenhoGrid()
			showMessage("Terminou o Desenho");
			updateGridSizes();
			
			local x, y, largura, altura = shapeMaker:getWorldBounds();						
								
			largura = math.ceil((largura * 10) + 0.5) / 10; 
			altura = math.ceil((altura * 10) + 0.5) / 10; 
											 
			showMessage(largura .. "x" .. altura);
			
			SC3UNDO_Capture(scene, 
				function()
					local novasCelulasX = scene.worldWidth;
					local novasCelulasY	= scene.worldHeight;
					
					novasCelulasX = math.ceil((novasCelulasX * 10) + 0.5) / 10;
					novasCelulasY = math.ceil((novasCelulasY * 10) + 0.5) / 10;
				
					scene.worldWidth = (novasCelulasX / largura) * realCellWidth;
					scene.worldHeight = (novasCelulasY / altura) * realCellHeight;		
					scene.grid.drawGrid = true;
				end);
		end;
		
		scene.viewport:addToolButton(SETTINGS_CATEGORY, 
		                             lang("scene.gridFineTuning.menu"), 
									 "/icos/gridFineTuning.png",
									 10,
									 {selectable=true, dontFocus=true, defaultOfCategory=false},			
			function()
				possuiaGridAntes = scene.grid.drawGrid;
				scene.grid.drawGrid = false;
				
				shapeMaker = SHAPEMaker_New(scene, SHAPE_RECTANGLE);
				shapeMaker.autoDraw = true;			
				shapeMaker.onStop = pararDesenhoGrid;
				shapeMaker.fillColor = "#FF000040";
				shapeMaker.strokeColor = "null"
				--shapeMaker.strokeColor = "#FF000040";
				shapeMaker.snapToGrid = false;
				shapeMaker.strokeSize = 0.05 * scene.grid.cellSize; 
				shapeMaker:start();				
			end, 
			
			function()
				--[[ Em construção ]]-- 
				scene.grid.drawGrid = possuiaGridAntes;
				
				if shapeMaker ~= nil then
					shapeMaker:abort();
					shapeMaker = nil;
				end;	
			end);				
	end);	