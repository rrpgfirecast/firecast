require("scene.lua");
require("utils.lua");

local GUI = nil;

local function getInertialMove(viewport)
	local mov = rawget(viewport, "__inertialMov");
	
	if mov == nil then
		if GUI == nil then
			GUI = require("gui.lua");
		end;
		
		mov = GUI.newInertialMovement();
		mov.decelerationRate = 5;
		rawset(viewport, "__inertialMov", mov);
		
		local oldMinX, oldMinY, oldMaxX, oldMaxY;
		local oldX, oldY;
		
		local function setPos(x, y)
			oldX = x;
			oldY = y;
			
			viewport:beginUpdate();
			viewport.worldX = x;
			viewport.worldY = y;
			viewport:endUpdate();
		end;
		
		mov.onChange = function()
			local x, y = mov:getPos();		
			local scale = viewport.scale;
			
			oldX = x;
			oldY = y;
			
			x = x / scale;
			y = y / scale;
			
			viewport:beginUpdate();
			viewport.worldX = x;
			viewport.worldY = y;
			viewport:endUpdate();
		end;	
		
		local function updateForViewportChange()
			local scale = viewport.scale;
			local newMinX, newMinY, newMaxX, newMaxY = viewport:getScrollBounds();
			newMinX = newMinX * scale;
			newMinY = newMinY * scale;
			newMaxX = newMaxX * scale;
			newMaxY = newMaxY * scale;
			
			if (newMinX ~= oldMinX) or (newMinY ~= oldMinY) or (newMaxX ~= oldMaxX) or (newMaxY ~= oldMaxY) then
				oldMinX = newMinX;
				oldMinY = newMinY;
				oldMaxX = newMaxX;
				oldMaxY = newMaxY;
				mov:setBounds(oldMinX, oldMinY, oldMaxX, oldMaxY);
			end;
			
			local newX = viewport.worldX * scale;
			local newY = viewport.worldY * scale;
			
			if  (oldX == nil) or (oldY == nil) or (math.abs(newX - oldX) > 3) or (math.abs(newY - oldY) > 3) then
				oldX = newX;
				oldY = newY;
				mov:setPos(oldX, oldY);
			end;
		end;
		
		local listenerVPChange = viewport:listen("onChange", updateForViewportChange);						
		updateForViewportChange();
	end;
	
	return mov;
end;

function INERTIAL_Start(viewport)
	local mov = getInertialMove(viewport);
	mov.active = true;
end;

function INERTIAL_pointerDown(viewport, event)
	local mov = getInertialMove(viewport);
	mov:pointerDown(event.x, event.y);
end;

function INERTIAL_pointerMove(viewport, event)
	local mov = getInertialMove(viewport);
	mov:pointerMove(event.x, event.y);
end;

function INERTIAL_pointerUp(viewport, event)
	local mov = getInertialMove(viewport);
	mov:pointerUp(event.x, event.y);
end;

function INERTIAL_pointerWheel(viewport, deltaX, deltaY)
	local mov = getInertialMove(viewport);
	mov:pointerWheel(deltaX, deltaY);
end;

function INERTIAL_Stop(viewport)
	-- fazer aqui
end;


function RIGHT_BUTTON_INERTIAL_MOV_Start(scene)
	local viewport = scene.viewport;
	INERTIAL_Start(scene.viewport);	
	local isMouseRightDown = false;
	
	scene.__RMDown = scene.viewport:addEventListener("onMouseDown",
		function(event)
			if event.button == "right" then
				INERTIAL_pointerDown(viewport, event);
				isMouseRightDown = true;
			end;
		end);
		
	scene.__RMUp = scene.viewport:addEventListener("onMouseUp",
		function(event)
			if event.button == "right" then
				isMouseRightDown = false;			
				INERTIAL_pointerUp(viewport, event);				
			end;
		end);		
		
	scene.__RMMove = scene.viewport:addEventListener("onMouseMove",
		function(event)
			if isMouseRightDown then	
				INERTIAL_pointerMove(viewport, event);				
			end;
		end);			
end;

function RIGHT_BUTTON_INERTIAL_MOV_Stop(scene)
	INERTIAL_Stop(scene.viewport);
	scene.viewport:removeEventListener(scene.__RMDown);
	scene.viewport:removeEventListener(scene.__RMUp);	
	scene.viewport:removeEventListener(scene.__RMMove);	
end;