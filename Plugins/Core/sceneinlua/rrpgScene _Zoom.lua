require("scene.lua");
require("utils.lua");

local ZOOM_CATEGORY = 'zoomTools';

SceneLib.registerPlugin(
	function (scene, attachment)			
				
		local function applyZoom(delta)		
			local viewport = scene.viewport;
			local oldWorldCenterX = viewport.worldX + (viewport.width / viewport.scale) / 2;
			local oldWorldCenterY = viewport.worldY + (viewport.height / viewport.scale) / 2;
		
			viewport.scale = viewport.scale + delta * viewport.scale * 0.25;							
			viewport.worldX = oldWorldCenterX - (viewport.width / viewport.scale) / 2; 
			viewport.worldY = oldWorldCenterY - (viewport.height / viewport.scale) / 2; 			
		end;
				
		scene.viewport:setupToolCategory(ZOOM_CATEGORY, lang("scene.zoom.category"), 10);
		scene.viewport:addToolButton(ZOOM_CATEGORY, 
		                             lang("scene.zoom.zoomIn"), 
									 "/icos/zoomIn.png",
									 -5,
									 {dontFocus=true}, 
									 function()
										applyZoom(1);
									 end);
									 
		scene.viewport:addToolButton(ZOOM_CATEGORY, 
		                             lang("scene.zoom.zoomOut"), 
									 "/icos/zoomOut.png",
									 -4,
									 {dontFocus=true}, 
									 function()
										applyZoom(-1);
									 end);					
				
	end);
	