require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");

local SETTINGS_CATEGORY = "settings";
	
---------- Ferramentas de Camadas	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local frmBoardProps = nil;
		local timeoutClearFrmBoard = nil;
		local installed = false;
		local btn_viewAsPlayer;	
			
		scene.viewport:setupToolCategory(SETTINGS_CATEGORY, lang("scene.toolcategory.settings"), -5);
		
		local function installTools()
			btn_viewAsPlayer = scene.viewport:addToolButton(SETTINGS_CATEGORY, 
										lang("scene.menu.sceneOptions"), 
										"/icos/scene_props.png",
										1,
										{defaultOfCategory=true},					 
										function()
											local frm;
											
											if timeoutClearFrmBoard ~= nil then
												clearTimeout(timeoutClearFrmBoard);						
												timeoutClearFrmBoard = nil;
											end;								
										
											if frmBoardProps == nil then				
												frm = GUI.newForm("frmBoardProps");
											else
												frm = frmBoardProps;
											end;
											
											if not frm.isShowing then
												frm:prepareForShow(scene);									  				    
												frm:show();
											end;
											
											frmBoardProps = frm;
											
											timeoutClearFrmBoard = setTimeout(
											function()
												frmBoardProps = nil;
											end, 5 * 60 * 1000);  -- 5 minutos
										end,		
										function()
											scene.isViewingAsGM = not scene.isViewingAsGM;										
										end);							
		end;		
		

		local function uninstallTools()
			scene.viewport:removeToolButton(btn_viewAsPlayer);
		end;
		
		local function captureGMStateChanged()
			if scene.isGM and not installed then
				installed = true;			
				installTools();
			elseif not scene.isGM and installed then
				installed = false;
				uninstallTools();
			end;
			
			if installed then
				scene.viewport:checkToolButton(btn_viewAsPlayer, not scene.isViewingAsGM);
			end;
		end;
		
		scene:listen("onGMStateChange", captureGMStateChanged);
		captureGMStateChanged();
	end);	
