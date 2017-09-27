require("scene.lua");
require("utils.lua");
require("gui.lua");
require("rrpg.lua");

local WINDOW_CATEGORY = 'windowTool';
	
---------- Ferramentas de Camadas	
	
SceneLib.registerPlugin(
	function (scene, attachment)	
		scene.viewport:setupToolCategory(WINDOW_CATEGORY, lang("scene.windowTool.categoryTitle"), 15);	
	
		local installedGMButtons = false;
		local btn_cloneAsPopup;		
		local btn_alternAsTab;	
		local btn_sceneObrigatorio;
		
		local listenerSC3ObrigatorioChanged;
		
		if scene:processCommand("queryCanCloneAsPopupWindow") == "true" then		
			btn_cloneAsPopup = scene.viewport:addToolButton(WINDOW_CATEGORY, 
										lang("scene.windowTool.openPopupClone"), 
										"/icos/cloneWindow.png",
										0,
										{dontFocus=true},
										 
										function()
											scene:processCommand("doCloneAsPopupWindow");
										end);		
		end;
		
		if scene:processCommand("queryCanAlternBetweenTab") == "true" then		
			local estaComoAba = scene:processCommand("queryIsAsTab") == "true";
			
			btn_alternAsTab = scene.viewport:addToolButton(WINDOW_CATEGORY, 
										lang("scene.windowTool.alternAsTab"), 
										"/icos/comoAba.png",
										1,
										{dontFocus=true},
										 
										function()
											if estaComoAba then
												estaComoAba = false;
												scene.viewport:checkToolButton(btn_alternAsTab, false);
												scene:processCommand("showAsTab=false");
											else
												estaComoAba = true;
												scene.viewport:checkToolButton(btn_alternAsTab, true);
												scene:processCommand("showAsTab=true");
											end;										
										end);		
										
			if estaComoAba then
				scene.viewport:checkToolButton(btn_alternAsTab, true);
			end;
		end;		
		
		local function atualizarStateSceneObrigatorio()
			if btn_sceneObrigatorio ~= nil then
				if scene:processCommand("queryIsSceneObrigatorio") == "true" then 
					scene.viewport:checkToolButton(btn_sceneObrigatorio, true);
				else
					scene.viewport:checkToolButton(btn_sceneObrigatorio, false);
				end;
			end;
		end;
			
		local function installGMButtons()
			if scene:processCommand("queryCanSetAsSceneObrigatorio") == "true" then		
				btn_sceneObrigatorio = scene.viewport:addToolButton(WINDOW_CATEGORY, 
											lang("scene.windowTool.obrigatoryScene"), 
											"/icos/sceneObrigatorio.png",
											2,
											{dontFocus=true},
											 
											function()
												if scene:processCommand("queryIsSceneObrigatorio") == "true" then 
													scene:processCommand("setSceneObrigatorio=false");
													scene.viewport:checkToolButton(btn_sceneObrigatorio, false);
												else
													scene:processCommand("setSceneObrigatorio=true");
													scene.viewport:checkToolButton(btn_sceneObrigatorio, true);													
												end;
											end);	

				atualizarStateSceneObrigatorio();
				
				listenerSC3ObrigatorioChanged = rrpg.listen("SC3ObrigatorioChanged", 
													function(msg)
														atualizarStateSceneObrigatorio();
													end);
			else
				btn_sceneObrigatorio = nil;
			end;			
		end;
		
		local function uninstallGMButtons()
			if btn_sceneObrigatorio ~= nil then
				scene.viewport:removeToolButton(btn_sceneObrigatorio);
				btn_sceneObrigatorio = nil;
				
				rrpg.unlisten(listenerSC3ObrigatorioChanged);
				listenerSC3ObrigatorioChanged = nil;
			end;
		end;
			
		local function captureGMStateChanged()
			if scene.isGM and not installedGMButtons then
				installedGMButtons = true;			
				installGMButtons();
			elseif not scene.isGM and installedGMButtons then
				installedGMButtons = false;
				uninstallGMButtons();
			end;
		end;
		
		scene:listen("onGMStateChange", captureGMStateChanged);
		captureGMStateChanged();
		
		attachment.OnDettach = function ()
									uninstallGMButtons();
							   end;		
	end);	