require("scene.lua");
require("utils.lua");

SceneLib.registerPlugin(
	function (scene, attachment)
		local frmGeneratorOptions = nil;
		local frmMazeOptions = nil;
		local frmDungeonOptions = nil;
		local timeoutClearFrmGenerator = nil;

		scene.viewport:setupToolCategory("Gerador", lang("scene.generator.tabName"), 49);
		scene.viewport:addToolButton("Gerador", 
		                             lang("scene.generator.tabName"), 
									 "/icos/dice.png",
									 -5,
									 {},
					function()
						local frm;
					
						if timeoutClearFrmGenerator ~= nil then
							clearTimeout(timeoutClearFrmGenerator);						
							timeoutClearFrmGenerator = nil;
						end;								

						if frmGeneratorOptions == nil then				
							frm = GUI.newForm("frmGeneratorOptions");
						else
							frm = frmGeneratorOptions;
						end
						
						if (not frm.isShowing) and scene.isGM then
							frm:prepareForShow(scene);									  				    
							frm:show();
						else
							showMessage(lang("msg.apenas.mestre"));
						end;
						
						frmGeneratorOptions = frm;
						
						timeoutClearFrmGenerator = setTimeout(
							function()
								frmGeneratorOptions = nil;
							end, 5 * 60 * 1000);  -- 5 minutos
					end);

		scene.viewport:addToolButton("Gerador", 
		                             lang("scene.generator.maze"), 
									 "/icos/dice.png",
									 -5,
									 {},
					function()
						local frm;
					
						if timeoutClearFrmGenerator ~= nil then
							clearTimeout(timeoutClearFrmGenerator);						
							timeoutClearFrmGenerator = nil;
						end;								

						if frmMazeOptions == nil then				
							frm = GUI.newForm("frmMazeOptions");
						else
							frm = frmMazeOptions;
						end
						
						if (not frm.isShowing) and scene.isGM then
							frm:prepareForShow(scene);									  				    
							frm:show();
						else
							showMessage(lang("msg.apenas.mestre"));
						end;
						
						frmMazeOptions = frm;
						
						timeoutClearFrmGenerator = setTimeout(
							function()
								frmMazeOptions = nil;
							end, 5 * 60 * 1000);  -- 5 minutos
					end);

		scene.viewport:addToolButton("Gerador", 
		                             lang("scene.generator.dungeon"), 
									 "/icos/dice.png",
									 -5,
									 {},
					function()
						local frm;
					
						if timeoutClearFrmGenerator ~= nil then
							clearTimeout(timeoutClearFrmGenerator);						
							timeoutClearFrmGenerator = nil;
						end;								

						if frmDungeonOptions == nil then				
							frm = GUI.newForm("frmDungeonOptions");
						else
							frm = frmDungeonOptions;
						end
						
						if (not frm.isShowing) and scene.isGM then
							frm:prepareForShow(scene);
							frm:show();
						else
							showMessage(lang("msg.apenas.mestre"));
						end;
						
						frmDungeonOptions = frm;
						
						timeoutClearFrmGenerator = setTimeout(
							function()
								frmDungeonOptions = nil;
							end, 5 * 60 * 1000);  -- 5 minutos
					end);
				
	end);