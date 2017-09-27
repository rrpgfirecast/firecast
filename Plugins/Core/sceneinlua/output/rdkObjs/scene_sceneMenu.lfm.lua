require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSceneMenu()
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
    obj:setName("frmSceneMenu");
    obj:setCancelable(true);
    obj:setDrawContainer(false);
    obj:setWidth(170);

		
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
	


    obj.flaLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flaLayout:setParent(obj);
    obj.flaLayout:setName("flaLayout");
    obj.flaLayout:setAlign("top");
    obj.flaLayout:setAutoHeight(true);


		
	
		require("rrpgScene_Clipboard.dlua");
		require("rrpgScene_Undo.dlua");
		
		local __Menuses = {self.flaLayout};
	
		for k, v in pairs(__Menuses) do
			local aLayout = v;
			aLayout.onAfterLayoutCalc = function() onLayoutResized(aLayout); end;				
		end;	
	
		newMenuSeparatorItem(self.flaLayout);
		local macEdit = newMultiActionMenuItem("", self.flaLayout, 4);
		local actPaste = macEdit:addActionButton("/icos/menuPaste.png", LANG("scene.menu.token.editCA.paste"));
		local actUndo = macEdit:addActionButton("/icos/menuUndo.png", LANG("scene.menu.token.editCA.undo"));	
		
		local btnProperties = newMenuItem(lang("scene.menu.sceneOptions"), self.flaLayout);		
		
		actPaste.onClick = function()
							SC3CLIPBOARD_Paste(theScene);
							self:close();
						  end;		
							
		actUndo.onClick = function()
							SC3UNDO_Undo(theScene);
							self:close();
						  end;			
		
		btnProperties.onClick = function()
							  -- Chamar outro popup aqui
							  local frm = gui.newForm("frmBoardProps");
							  frm:prepareForShow(theScene);									  
							  self:close();
							  frm:show();
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
			self:setActiveMenu(self.flaLayout);		
			theSelection = selection;
			theScene = scene;
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
            		theScene = nil;
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
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSceneMenu = {
    newEditor = newfrmSceneMenu, 
    new = newfrmSceneMenu, 
    name = "frmSceneMenu", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmSceneMenu = _frmSceneMenu;
rrpg.registrarForm(_frmSceneMenu);

return _frmSceneMenu;
