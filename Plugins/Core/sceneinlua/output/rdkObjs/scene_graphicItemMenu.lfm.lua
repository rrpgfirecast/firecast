require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGraphicItemMenu()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("popupForm"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmGraphicItemMenu");
    obj:setWidth(235);
    obj:setHeight(120);
    obj:setTitle("Menu");
    obj:setDrawContainer(false);

		
		local function newBaseMenuItem(flowLayout, rectAsClient)
			local item = {};
			item.backColor = "#00000000";
			item.hoverColor = "#70707070";				
			item.defaultBackColor = item.backColor;
			item.defaultHoverColor = item.hoverColor;
			item.defaultBackCheckedColor = "#A0A0A070";
			item.defaultHoverkCheckedColor = "#70707070";
			item.isHover = false;
		
			if rectAsClient == nil then
				rectAsClient = true;
			end;
		
			local fPart = gui.newFlowPart();
			fPart.minWidth = 10;
			fPart.maxWidth = 1000;
			fPart.parent = flowLayout;
			fPart.height = 36;
			fPart.margins = {left=3, right=3, bottom=1, top=1};
			item.flowPart = fPart;
			local fRect = nil;
			
			if rectAsClient then
				fRect = gui.newRectangle();
				fRect.align = "client";
				fRect.parent = fPart;
				fRect.color = item.backColor;
				fRect.strokeColor = item.backColor;
				item.rect = fRect;
				item.client = fRect;
			else
				item.client = fPart;
			end;
						
			local fHorzLine = gui.newHorzLine();
			fHorzLine.strokeColor = "gray";
			fHorzLine.align = "bottom";
			fHorzLine.parent = fPart;
			item.horzLine = fHorzLine;
			
			local fBreakLine = gui.newFlowLineBreak();
			fBreakLine.parent = flowLayout;
			item.breakLine = fBreakLine;
			
			function item:setColor(backColor, hoverColor)
				item.backColor = backColor or item.defaultBackColor;
				item.hoverColor = hoverColor or item.defaultHoverColor;
				
				if fRect ~= nil then
					if item.isHover then
						fRect.color = item.hoverColor;
					else
						fRect.color = item.backColor;
					end;
				end
			end;
			
			function item:setChecked(value)
				if value then
					item:setColor(item.defaultBackCheckedColor, item.defaultHoverCheckedColor);
				else
					item:setColor(nil, nil)
				end;
			end;
						
			return item;		
		end;
	
		local function newMenuSeparatorItem(flowLayout)
			local item = newBaseMenuItem(flowLayout);
			item.backColor = "#00000000";			
		
			local fPart = item.flowPart;
			fPart.height = 8;
			
			local fHorzLineSep = gui.newHorzLine();
			fHorzLineSep.strokeColor = "gray";
			fHorzLineSep.strokeSize = 3;
			fHorzLineSep.align = "top";
			fHorzLineSep.parent = fPart;
			item.horzLineSep = fHorzLineSep;	

			local fHorzLine = item.horzLine;
			
			local topMargin = (fPart.height - fHorzLine.height - fHorzLineSep.strokeSize) / 2;
			fHorzLineSep.margins = {top=topMargin};
			
			return fPart, item;
		end;
				
		local function newMenuItem(caption, flowLayout, onClick)
			local item = newBaseMenuItem(flowLayout);
			item.isHover = false;
		
			local fPart = item.flowPart;			
			local fRect = item.client;
			
			local fLabel = gui.newLabel();
			fLabel.align = "client";
			fLabel.parent = fRect;
			fLabel.hitTest = true;
			fLabel.text = caption;
			fLabel.cursor = "handPoint";
			item.label = fLabel;
			
			fLabel.onMouseEnter = function()
				fRect.color = item.hoverColor;
				item.isHover = true;
			end;
			
			fLabel.onMouseLeave = function()
				fRect.color = item.backColor;
				item.isHover = false;
			end;			
									
			rawset(fLabel, "setChecked", function(t, value) 
											item:setChecked(value);
			                             end);
			
			return fLabel, item;
		end;
		
		
		local function newMultiActionMenuItem(caption, flowLayout, maxActPorLinha)
			local item = newBaseMenuItem(flowLayout, false);
			item.isHover = false;
		
			maxActPorLinha = tonumber(maxActPorLinha) or 2;		
		
			local fPart = item.flowPart;			
			local fClient = item.client;
			fPart.height = fPart.height + 5;
			
			local fLabel = gui.newLabel();
			fLabel.align = "client";
			fLabel.width = 1;
			fLabel.wordWrap = false;
			fLabel.autoSize = true;			
			
			if caption ~= "" then
				fLabel.parent = fClient;
			end;
			
			fLabel.horzTextAlign = "trailing";
			fLabel.text = caption;
			fLabel.margins = {right=5};
			item.label = fLabel;
			
			local ACTION_WIDTH = 36;
			local ACTION_HEIGHT = 36;
			local ACTION_MARGIN = 2;
			local ALTURA_MINIMA = fPart.height; 
			
			local fFlowActions = gui.newFlowLayout();
			fFlowActions.orientation = "horizontal";
			
			if caption ~= "" then
				fFlowActions.align = "right";			
				fFlowActions.parent = fClient;
				fFlowActions.width = ACTION_WIDTH * maxActPorLinha + ACTION_MARGIN * (maxActPorLinha + 4);
			else
				fFlowActions.align = "client";			
				fFlowActions.parent = fClient;				
			end;
			
			local actionCount = 0;			
			

			function item:addActionBase(imageURL, hint)
				local action = {};		
				action.isHover = false;
				action.backColor = item.backColor;
				action.hoverColor = item.hoverColor;				
				action.defaultBackColor = item.defaultBackColor;
				action.defaultHoverColor = item.defaultHoverColor;
				action.defaultBackCheckedColor = item.defaultBackCheckedColor;
				action.defaultHoverkCheckedColor = item.defaultHoverkCheckedColor;				
				
				local fRect = gui.newRectangle();
				fRect.parent = fFlowActions;
				fRect.width = ACTION_WIDTH;
				fRect.height = ACTION_HEIGHT;				
				fRect.color = item.backColor;
				fRect.strokeColor = item.backColor;
				fRect.margins = {left=ACTION_MARGIN, right=ACTION_MARGIN};				
				action.rect = fRect;
				action.client = fRect;				
				
				local fImg = gui.newImage();								
				fImg.hitTest = true;
				fImg.cursor = "handPoint";
				fImg.align = "client";
				fImg.url = imageURL;
				fImg.hint = hint;
				fImg.parent = fRect;
				fImg.style = "autoFit";
				action.img = fImg;								
				
				fImg.onMouseEnter = function()
					fRect.color = action.hoverColor;
					action.isHover = true;
				end;
				
				fImg.onMouseLeave = function()
					fRect.color = action.backColor;
					action.isHover = false;
				end;			
								
				function action:setColor(backColor, hoverColor)
					action.backColor = backColor or action.defaultBackColor;
					action.hoverColor = hoverColor or action.defaultHoverColor;
					
					if action.isHover then
						fRect.color = action.hoverColor;
					else
						fRect.color = action.backColor;
					end;
				end;
				
				function action:setChecked(value)
					if value then
						action:setColor(action.defaultBackCheckedColor, action.defaultHoverCheckedColor);
					else
						action:setColor(nil, nil)
					end;
				end;
								
				rawset(fImg, "setChecked", function(t, value) 
												action:setChecked(value);
											 end);				
				
				actionCount = actionCount + 1;
				
				if actionCount > maxActPorLinha and (actionCount % maxActPorLinha == 1) then
					fPart.height = fPart.height + ACTION_HEIGHT;
				end;
				
				return action, fImg;
			end;
			
			function item:addCheckBoxAction(imageURL, hint)
				local action, fImg = item:addActionBase(imageURL, hint);
				
				local fImgCheckbox = gui.newImage();
				
				local fPai = fImg.parent;
				
				fImgCheckbox.width = fPai.width / 2.5;
				fImgCheckbox.height = fPai.height / 2.5;
				fImgCheckbox.left = fPai.width - fImgCheckbox.width;
				fImgCheckbox.top = fPai.height - fImgCheckbox.height;				

				fImgCheckbox.parent = fImg;
				fImgCheckbox.url = "/icos/checkboxOff.png";
				fImgCheckbox.style = "autoFit";
				
				function action:setChecked(value)
					if value then
						fImgCheckbox.url = "/icos/checkboxOn.png"
					else
						fImgCheckbox.url = "/icos/checkboxOff.png";
					end;
				end;				
				
				return fImg, action;
			end;
			
			function item:addRadioButtonAction(imageURL, hint)
				local action, fImg = item:addActionBase(imageURL, hint);
				
				local fImgRadio = gui.newImage();
				
				local fPai = fImg.parent;
				
				fImgRadio.width = fPai.width / 2.5;
				fImgRadio.height = fPai.height / 2.5;
				fImgRadio.left = fPai.width - fImgRadio.width;
				fImgRadio.top = fPai.height - fImgRadio.height;				

				fImgRadio.parent = fImg;
				fImgRadio.url = "/icos/radiobuttonOff.png";
				fImgRadio.style = "autoFit";
				
				function action:setChecked(value)
					if value then
						fImgRadio.url = "/icos/radiobuttonOn.png"
					else
						fImgRadio.url = "/icos/radiobuttonOff.png";
					end;
				end;				
				
				return fImg, action;
			end;			
			
			function item:addActionButton(imageURL, hint)
				local action, fImg = item:addActionBase(imageURL, hint);
						
				return fImg, action;
			end;			
			
			return item;
		end;		
	



		require("rrpgScene_Undo.dlua");
		require("scene_genericItemMenu.dlua");
		local currentMenuLayout = nil;
		local theSelection = nil;
		local theScene = nil;
		
		local function resizeForLayoutSize(aLayout)
			local h = aLayout.height;
			self.height = h + 5;
		end;
		
		local function onLayoutResized(aLayout)
			if aLayout == currentMenuLayout then
				resizeForLayoutSize(aLayout);
			end;
		end;
		
		local function alterarCamada(camada)
			if theSelection ~= nil then
				SC3UNDO_Capture(theScene,
					function()
						for k, v in pairs(theSelection) do
							v.layer = camada;
							v.selected = false;
						end;
					end);	
			end;
			
			self:close();
		end;
	


    obj.flaLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flaLayout:setParent(obj);
    obj.flaLayout:setName("flaLayout");
    obj.flaLayout:setAlign("top");
    obj.flaLayout:setAutoHeight(true);

    obj.flaCamadas = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flaCamadas:setParent(obj);
    obj.flaCamadas:setName("flaCamadas");
    obj.flaCamadas:setAlign("top");
    obj.flaCamadas:setAutoHeight(true);

    obj.flaImageOptions = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flaImageOptions:setParent(obj);
    obj.flaImageOptions:setName("flaImageOptions");
    obj.flaImageOptions:setAlign("top");
    obj.flaImageOptions:setAutoHeight(true);


		local __Menuses = {self.flaLayout, self.flaCamadas, self.flaImageOptions};
		require("rrpgScene_Clipboard.dlua");
		require("rrpgScene_Undo.dlua");
	
		for k, v in pairs(__Menuses) do
			local aLayout = v;
			aLayout.onAfterLayoutCalc = function() onLayoutResized(aLayout); end;				
		end;
			
		-- Menu Principal	
	
		local btnLayer = newMenuItem(lang("scene.tokenMenu.changeLayer"), self.flaLayout);		
		local macEdit = newMultiActionMenuItem("", self.flaLayout, 5);
		local actCopy = macEdit:addActionButton("/icos/menuCopy.png", LANG("scene.menu.token.editCA.copy"));
		local actPaste = macEdit:addActionButton("/icos/menuPaste.png", LANG("scene.menu.token.editCA.paste"));
		local actUndo = macEdit:addActionButton("/icos/menuUndo.png", LANG("scene.menu.token.editCA.undo"));				
		local actInvisible = macEdit:addCheckBoxAction("/icos/menuInvisible.png", LANG("scene.visibilityChange.ToGMOnly"));									
		
		local macOrganizar = newMultiActionMenuItem("", self.flaLayout, 5);
		local actBringToFront = macOrganizar:addActionButton("/icos/bringToFront.png", LANG("scene.organization.bringToFront"));		
		local actSendToBack = macOrganizar:addActionButton("/icos/sendToBack.png", LANG("scene.organization.sendToBack"));
		
		actBringToFront.onClick = function()
									GENERICItem_BringToFront(theScene, theSelection);
									self:close();
								  end;
								  
		actSendToBack.onClick = function()
									GENERICItem_SendToBack(theScene, theSelection);
									self:close();
								  end;								  
		
		local btnApagar = newMenuItem(lang("scene.remove.item"), self.flaLayout);				
				
		
		-- Menu Camadas
				
		local btnCamadaVoltar = newMenuItem(lang("scene.menu.backOption"), self.flaCamadas);
		local btnCamadaTokens, itmCamadaTokens = newMenuItem(lang("scene.layer.tokens.noprefix"), self.flaCamadas);
		local btnCamadaObjetos, itmCamadaObjetos = newMenuItem(lang("scene.layer.objects.noprefix"), self.flaCamadas);
		local btnCamadaBackground, itmCamadaBackground = newMenuItem(lang("scene.layer.background.noprefix"), self.flaCamadas);			
		
		btnLayer.onClick = function()
							  self:setActiveMenu(self.flaCamadas);
						   end;	
		
		btnCamadaVoltar.onClick = function()
							self:setActiveMenu(self.flaLayout);
						  end;	
			
		actCopy.onClick = function()
							SC3CLIPBOARD_Copy(theSelection);
							self:close();
						  end;	
						  
		actPaste.onClick = function()
							SC3CLIPBOARD_Paste(theScene);
							self:close();
						  end;		
							
		actUndo.onClick = function()
							SC3UNDO_Undo(theScene);
							self:close();
						  end;	
						  
		btnCamadaTokens.onClick = function() alterarCamada("tokens"); end;
		btnCamadaObjetos.onClick = function() alterarCamada("objects"); end;
		btnCamadaBackground.onClick = function() alterarCamada("background"); end;
		
		btnApagar.onClick = function()
								local sel = theSelection;								
								local msg;
								
								if #sel == 1 then
									msg = LANG("scene.ask.deleteOneItem");
								else
									msg = string.format(LANG("scene.ask.deleteMultiItem"), #sel);						
								end;
								
								self:close();
								
								dialogs.confirmYesNo(msg, 
									function(confirmado)
										if confirmado then
											SC3UNDO_Capture(theScene, 
												function()
													for i = 1, #sel, 1 do
														sel[i]:delete();
													end;
												end);
										end;
									end);			
							end;								
		
		function self:setActiveMenu(menu)
			currentMenuLayout = menu;
		
			for k, v in pairs(__Menuses) do
				if menu == v then
					v.visible = true;
				else
					v.visible = false;
				end;
			end;
			
			resizeForLayoutSize(menu)
		end;
		
		function self:prepareForShow(selection, scene)
			local firstItem = nil;
			local currentLayer = "tokens";
			theScene = scene;
			
			for k, v in pairs(selection) do
				firstItem = v;
				break;
			end;
			
			if firstItem ~= nil then
				currentLayer = firstItem.layer;
			end;
		
			itmCamadaTokens:setChecked(false);			
			itmCamadaObjetos:setChecked(false);
			itmCamadaBackground:setChecked(false);
					
			if currentLayer == "tokens" then
				itmCamadaTokens:setChecked(true);
			elseif currentLayer == "objects" then
				itmCamadaObjetos:setChecked(true);
			elseif currentLayer == "background" then
				itmCamadaBackground:setChecked(true);
			end;
		
			self:setActiveMenu(self.flaLayout);		
			theSelection = selection;
			
			local estaVisible = true;
			
			if #theSelection > 0 then
				local umDrawing = theSelection[1];
				
						local function createInvertBoolOptionCallback(propName)							
							local valorInicial = umDrawing[propName];
							local xScene = scene;
						
							return function()
										SC3UNDO_Capture(xScene,
											function()
												for i = 1, #theSelection, 1 do 
													theSelection[i][propName] = not valorInicial;
												end;	
											end);
										
										self:close();							
							       end;
						end;		
				
				-- Visibilidade
				estaVisible = umDrawing.visible;
				actInvisible:setChecked(not estaVisible);				
				actInvisible.onClick = createInvertBoolOptionCallback("visible");
			end;					
		end;	
	


    obj._e_event0 = obj:addEventListener("onKeyUp",
        function (self, event)
            if (event.keyCode == 0x89) or (event.keyCode == 0x1B) then
            			setTimeout(
            				function()
            					self:close();
            				end, 1);
            			
            			event.keyCode = 0;
            			event.key = "";
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (self)
            theSelection = nil;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flaLayout ~= nil then self.flaLayout:destroy(); self.flaLayout = nil; end;
        if self.flaCamadas ~= nil then self.flaCamadas:destroy(); self.flaCamadas = nil; end;
        if self.flaImageOptions ~= nil then self.flaImageOptions:destroy(); self.flaImageOptions = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGraphicItemMenu = {
    newEditor = newfrmGraphicItemMenu, 
    new = newfrmGraphicItemMenu, 
    name = "frmGraphicItemMenu", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Menu", 
    description=""};

frmGraphicItemMenu = _frmGraphicItemMenu;
rrpg.registrarForm(_frmGraphicItemMenu);

return _frmGraphicItemMenu;
