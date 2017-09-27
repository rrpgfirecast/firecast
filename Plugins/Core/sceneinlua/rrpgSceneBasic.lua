require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");

--[[   PLUGIN de zoom  ]]--

SceneLib.registerPlugin(
	function (scene, attachment)		
		-- Mouse Wheel		
		scene.viewport.onFallbackMouseWheel = function(event)	
		    local handled;	
			local viewport = scene.viewport;	
			viewport:beginUpdate();
			
			tryFinally(
				function()
					local scale;						
					local d;					
				
					if event.ctrlKey then
						-- Zoom
						if event.delta > 0 then
							d = 1;
						else
							d = -1;
						end;	
																		
						local oldWorldCenterX = viewport.worldX + (viewport.width / viewport.scale) / 2;
						local oldWorldCenterY = viewport.worldY + (viewport.height / viewport.scale) / 2;
					
						viewport.scale = viewport.scale + d * viewport.scale * 0.25;							
						viewport.worldX = oldWorldCenterX - (viewport.width / viewport.scale) / 2; 
						viewport.worldY = oldWorldCenterY - (viewport.height / viewport.scale) / 2; 
					else			
						-- Movimento vertical
						if event.delta > 0 then
							d = -1;
						else
							d = 1;
						end;	
										
						local offset = viewport.height / 6;
						offset = offset * -1 * (event.delta / 120);		
						INERTIAL_pointerWheel(viewport, 0, offset);
					end;					

					handled = true;
				end,
				
				function()
					viewport:endUpdate();
				end);
								
			
			if handled == true then
				return true;				
			end;
		end;			
	end);
	