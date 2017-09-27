require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");

	
--[[   PLUGIN para fazer movimentação da tela / pan  ]]--	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local isMouseDown = false;
		local oldCursor;
		
		local function doMouseDown(event)
			isMouseDown = true;
			INERTIAL_pointerDown(scene.viewport, event);
		end;
			
		local function doMouseMove(event)	
			if isMouseDown then
				INERTIAL_pointerMove(scene.viewport, event);
			end;
		end;						

		local function doMouseUp(event)
			isMouseDown = false;
			INERTIAL_pointerUp(scene.viewport, event);
		end;				

		local listenerMouseDown;
		local listenerMouseMove;
		local listenerMouseUp;
		
		scene.viewport:setupToolCategory("pointer", lang("scene.pointerClass"), -10);
		scene.viewport:addToolButton("pointer", 
		                             lang("scene.panCursor"), 
									 "/icos/pan.png",
									 0,
									 {selectable=true},
									 
			function()
				-- Activated Select/Move
				listenerMouseDown = scene.viewport:listen("onMouseDown", doMouseDown);
				listenerMouseMove = scene.viewport:listen("onMouseMove", doMouseMove);
				listenerMouseUp = scene.viewport:listen("onMouseUp", doMouseUp);
				oldCursor = scene.viewport.cursor;
				scene.viewport.cursor = "size";
				INERTIAL_Start(scene.viewport);	
				TOUCH_NAV_Start(scene.viewport);
				
				MOVHIST_ToolEnable(scene, true);
			end,
			
			function()
				-- Deactivated Select/Move
				scene.viewport:unlisten(listenerMouseDown);
				scene.viewport:unlisten(listenerMouseMove);
				scene.viewport:unlisten(listenerMouseUp);	
				scene.viewport.cursor = oldCursor;	
				INERTIAL_Stop(scene.viewport);		
				TOUCH_NAV_Stop(scene.viewport);		
				MOVHIST_ToolEnable(scene, false);			
			end);											 										
	end);	