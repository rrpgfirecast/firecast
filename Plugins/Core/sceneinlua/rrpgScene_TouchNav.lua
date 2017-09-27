require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");

function TOUCH_NAV_Start(viewport)
	local ct = rawget(viewport, "_touchNavCount") or 0;	
	ct = ct + 1;
	rawset(viewport, "_touchNavCount", ct);
	
	if ct == 1 then
		local tn = {};	
			
		local listenerBeginZoom = 
			viewport:listen("onGestureBeginZoom", 
				function(x, y)
					return true;					
				end);
				
		local listenerZoom = 
			viewport:listen("onGestureZoom", 
				function(x, y, delta)
					local refX, refY = viewport:screenToWorld(x, y);
					local baseForFactor = math.min(viewport.width, viewport.height);					
					local scaleFactor = delta / baseForFactor;
					
					viewport.scale = viewport.scale + scaleFactor * viewport.scale;		
					local newScale = viewport.scale;
					
					viewport:beginUpdate();
					viewport.worldX = refX - (x / newScale);
					viewport.worldY = refY - (y / newScale);
					viewport:endUpdate();
					return true;
				end);				
				
		local listenerEndZoom = 
			viewport:listen("onGestureEndZoom", 
				function(x, y)
					return true;
				end);	

	
		tn.liberar = function()
			viewport:unlisten(listenerBeginZoom);
			viewport:unlisten(listenerZoom);
			viewport:unlisten(listenerEndZoom);		
		end;
		
		rawset(viewport, "_touchNav", tn)
	end;
end;

function TOUCH_NAV_Stop(viewport)
	local ct = rawget(viewport, "_touchNavCount") or 0;	
	ct = ct - 1;	
	rawset(viewport, "_touchNavCount", ct);
	
	if ct == 0 then
		local tn = rawget(viewport, "_touchNav");
		tn.liberar();		
		rawset(viewport, "_touchNav", nil);
	end;
end;