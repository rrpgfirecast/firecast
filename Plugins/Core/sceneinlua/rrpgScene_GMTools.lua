require("scene.lua");
require("utils.lua");
require("gui.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_FowShapeDetails.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_Undo.dlua");


local GM_CATEGORY = 'gmTool';
	
---------- Ferramentas de Camadas	
	
SceneLib.registerPlugin(
	function (scene, attachment)			
		require("rrpgScene_ShapesMaker.dlua");	
		scene.viewport:setupToolCategory(GM_CATEGORY, lang("scene.gm.categoryTitle"), 9);	
	
		local installed = false;
		local btn_viewAsPlayer;	
		local btn_revealFoWAreas;
		local btn_hideFoWAreas;
		local btn_semiRevealFoWAreas;
		local btn_setExplorableFoWAreas;
		local btn_addWall;
		local btn_removeWall;
		
		local shapeMaker = nil;
		local lastShapeUsed = SHAPE_RECTANGLE;	
		local mustSeeWalls = false;		
		
		local frmFOW = nil;
									
		local function doRevealArea(shapeMaker, pol)
			SC3UNDO_Capture(scene,
					function()
						scene.fogOfWar.enabled = true;
						scene.fogOfWar:setArea(pol, "alwaysVisible");						
					end);						
		end;
		
		local function doHideArea(shapeMaker, pol)
			SC3UNDO_Capture(scene,
					function()
						scene.fogOfWar.enabled = true;
						scene.fogOfWar:setArea(pol, "alwaysHidden");					
					end);			
			
		end;			
		
		local function doSemiRevealArea(shapeMaker, pol)
			SC3UNDO_Capture(scene,
					function()
						scene.fogOfWar.enabled = true;
						scene.fogOfWar:setArea(pol, "semiVisible");
					end);		
			
		end;
		
		local function doSetExplorableArea(shapeMaker, pol)
			SC3UNDO_Capture(scene,
					function()
						scene.fogOfWar.enabled = true;
						scene.fogOfWar:setArea(pol, "explorable");
					end);					
		end;			
		
			local function getHollowPol(pol, thick)
				local novoPol = _scene3_math_hollowPolygon(pol, thick);							
				return novoPol;
			end;
		
		local function doAddWall(shapeMaker, pol)
			SC3UNDO_Capture(scene,
					function()
						scene.fogOfWar.enabled = true;
						scene.fogOfWar:addOpaqueArea(getHollowPol(pol, (0.08 / 1.5) * scene.grid.cellSize));
					end);						
		end;
		
		local function doRemoveWall(shapeMaker, pol)
			SC3UNDO_Capture(scene,
					function()
						scene.fogOfWar.enabled = true;
						scene.fogOfWar:removeOpaqueArea(pol);
					end);								
		end;
				
									
		local function startShapeMakerForArea(shape, fillable, shapeCallback)
			if shapeMaker ~= nil then
				shapeMaker:abort();
				shapeMaker = nil;
			end;				
		
			shapeMaker = SHAPEMaker_New(scene, shape);
			shapeMaker.autoDraw = true;			
			shapeMaker.onStop = function ()
									local pol = shapeMaker:forceGetPolygon();
									shapeCallback(shapeMaker, pol);
								end;
									
			if fillable then
				local r, g, b, a = colorToRGBA("yellow");
				shapeMaker.fillColor = RGBAToColor(r, g, b, 0.5);
			else
				shapeMaker.fillColor = "none";
			end;
			
			shapeMaker.strokeColor = "yellow";
			shapeMaker:start();
		end;
		
		local function createFowShapeToolButon(title, icon, shapeCallback, indice, fillable, activationCallback, deactivationCallback)
			return scene.viewport:addToolButton(GM_CATEGORY, 
										lang(title), 
										icon or "/icos/viewAsGM.png",
										indice,
										{selectable=true},
										 
										function()
											RIGHT_BUTTON_INERTIAL_MOV_Start(scene);
											
											if shapeCallback == doRemoveWall then
												lastShapeUsed = SHAPE_RECTANGLE;
											end;
											
											startShapeMakerForArea(lastShapeUsed, fillable, shapeCallback)											
										
											FoWShapeDetails_Show(scene , 
												{shape = lastShapeUsed, 
													onChange = function(data)
																	lastShapeUsed = data.shape;
																	startShapeMakerForArea(lastShapeUsed, fillable, shapeCallback);
															   end});
										
											if activationCallback ~= nil then
												activationCallback();
											end;
											
											SC3UNDO_AtivarUndoHotKey(scene, true);
										end,
										
										function()			
											SC3UNDO_AtivarUndoHotKey(scene, false);										
											RIGHT_BUTTON_INERTIAL_MOV_Stop(scene);
											FoWShapeDetails_Close(scene);
											
											if shapeMaker ~= nil then
												shapeMaker:abort();
												shapeMaker = nil;
											end;												
																				
											if deactivationCallback ~= nil then
												deactivationCallback();
											end;
										end);	
		end;					
					
		local function installTools()
			btn_viewAsPlayer = scene.viewport:addToolButton(GM_CATEGORY, 
										lang("scene.gm.viewAsPlayer"), 
										"/icos/viewAsGM.png",
										0,
										{dontFocus=true},
										 
										function()
											scene.isViewingAsGM = not scene.isViewingAsGM;
										end);		

			btn_setExplorableFoWAreas = createFowShapeToolButon("scene.fogOfWar.area.explorable", "/icos/explorableArea.png", doSetExplorableArea, 1, true);													
			btn_hideFoWAreas = createFowShapeToolButon("scene.fogOfWar.area.hidden", "/icos/hiddenAreas.png", doHideArea, 2, true);										
			btn_revealFoWAreas = createFowShapeToolButon("scene.fogOfWar.area.reveal", "/icos/shownAreas.png", doRevealArea, 3, true);		
			btn_semiRevealFoWAreas = createFowShapeToolButon("scene.fogOfWar.area.parcialRevealed", "/icos/partialShownAreas.png", doSemiRevealArea, 4, true);						
			
			btn_addWall = createFowShapeToolButon("scene.fogOfWar.area.wall", "/icos/paredes.png", doAddWall, 5, false,
														function()
															mustSeeWalls = true;
															scene.isViewingWalls = true;
														end, 
														function()
															mustSeeWalls = false;
															scene.isViewingWalls = false;
														end);
														
			btn_removeWall = createFowShapeToolButon("scene.fogOfWar.area.removeWall", "/icos/removerParedes.png", doRemoveWall, 6, true,
															function()
																mustSeeWalls = true;
																scene.isViewingWalls = true;
															end, 
															function()
																mustSeeWalls = false;
																scene.isViewingWalls = false;
															end);
		end;
		
		local function uninstallTools()
			scene.viewport:removeToolButton(btn_viewAsPlayer);
			scene.viewport:removeToolButton(btn_revealFoWAreas);
			scene.viewport:removeToolButton(btn_hideFoWAreas);
			scene.viewport:removeToolButton(btn_semiRevealFoWAreas);
			scene.viewport:removeToolButton(btn_setExplorableFoWAreas);
			scene.viewport:removeToolButton(btn_addWall);
			scene.viewport:removeToolButton(btn_removeWall);
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
				
				if scene.isViewingAsGM then
					scene.isViewingWalls = true;
				else		
					scene.isViewingWalls = mustSeeWalls;
				end;
			end;
		end;
		
		scene:listen("onGMStateChange", captureGMStateChanged);
		captureGMStateChanged();		
	end);	