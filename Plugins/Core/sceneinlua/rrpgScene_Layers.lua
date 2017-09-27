require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");

local LAYER_CATEGORY = 'layer';
	
---------- Ferramentas de Camadas	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local btn_tokensLayer;	
		local btn_objectsLayer;	
		local btn_bkgLayer;	
			
		local function checkLayerBtn(btnId)
			scene.viewport:checkToolButton(btnId, true);
			
			if btnId ~= btn_tokensLayer then
				scene.viewport:checkToolButton(btn_tokensLayer, false);
			end;		

			if btnId ~= btn_objectsLayer then
				scene.viewport:checkToolButton(btn_objectsLayer, false);
			end;	

			if btnId ~= btn_bkgLayer then
				scene.viewport:checkToolButton(btn_bkgLayer, false);
			end;				
		end;
			
		scene.viewport:setupToolCategory(LAYER_CATEGORY, lang("scene.layer.categoryTitle"), -9);
		
		btn_tokensLayer = 
			scene.viewport:addToolButton(LAYER_CATEGORY, 
										lang("scene.layer.tokens"), 
										"/icos/layer_token.png",
										-5,
										{},
									 
				function()
					scene.workingLayer = "tokens";
					scene.items:clearSelection();
				end);
		
		btn_objectsLayer = 
			scene.viewport:addToolButton(LAYER_CATEGORY, 
										lang("scene.layer.objects"), 
										"/icos/layer_obj.png",
										-4,
										{},
									 
				function()
					scene.workingLayer = "objects";
					scene.items:clearSelection();
				end);								 
				
		btn_bkgLayer = 
			scene.viewport:addToolButton(LAYER_CATEGORY, 
										lang("scene.layer.background"), 
										"/icos/layer_bkg.png",
										-3,
										{},
									 
				function()
					scene.workingLayer = "background";
					scene.items:clearSelection();
				end);				
				
		
		local function captureWorkingLayerChange()
			local workingLayer = scene.workingLayer;
			local layerShowMovementHistory = false;
		
			if workingLayer == "background" then
				checkLayerBtn(btn_bkgLayer);
			elseif workingLayer == "objects" then
				checkLayerBtn(btn_objectsLayer);
			elseif workingLayer == "tokens" then
				checkLayerBtn(btn_tokensLayer);
				layerShowMovementHistory = true;				
			end;
			
			MOVHIST_SetDrawEnabled(scene, "layer", layerShowMovementHistory);			
		end;
		
		scene:listen("onWorkingLayerChange", captureWorkingLayerChange);
		captureWorkingLayerChange();
	end);	