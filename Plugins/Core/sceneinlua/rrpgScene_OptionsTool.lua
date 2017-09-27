require("scene.lua");
require("utils.lua");
require("rrpgScene_InertialMov.lua");

local SETTINGS_CATEGORY = "settings";
	
---------- Ferramentas de Camadas	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		local btn_sceneProps;	
		local frmBoardProps = nil;
		local timeoutClearFrmBoard = nil;
			
		scene.viewport:setupToolCategory(SETTINGS_CATEGORY, lang("scene.toolcategory.settings"), -5);
		
		btn_sceneProps = 
			scene.viewport:addToolButton(SETTINGS_CATEGORY, 
										lang("scene.menu.sceneOptions"), 
										"/icos/scene_props.png",
										-5,
										{},
									 
				function()
					local frm;
					
					if timeoutClearFrmBoard ~= nil then
						clearTimeout(timeoutClearFrmBoard);						
						timeoutClearFrmBoard = nil;
					end;								
				
					if frmBoardProps == nil then				
						frm = gui.newForm("frmBoardProps");
					else
						frm = frmBoardProps;
					end
					
					if not frm.isShowing then
						frm:prepareForShow(scene);									  				    
						frm:show();
					end;
					
					frmBoardProps = frm;
					
					timeoutClearFrmBoard = setTimeout(
						function()
							frmBoardProps = nil;
						end, 5 * 60 * 1000);  -- 5 minutos
				end);								 
	end);	
