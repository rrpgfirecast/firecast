require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmUserDrawingDetails()
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
    obj:setName("frmUserDrawingDetails");
    obj:setCancelable(true);
    obj:setDrawContainer(false);
    obj:setWidth(164);
    obj:setHeight(90);
    obj:setTheme("light");
    obj:setCursor("arrow");
    obj:setCanFocus(false);

		
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
	



		local DEFAULT_OPTIONS = {};
		local options = nil;
		local data = {};
		
		function self:popularData()
			if self.cbxFill.checked then
				data.fillColor = self.cmbFill.color;
			else
				data.fillColor = "None";
			end
			
			if self.cbxStroke.checked then
				data.strokeColor = self.cmbStroke.color;
			else
				data.strokeColor = "None";
			end;
			
			data.snapToGrid = self.cbxSnapToGrid.checked;
		end;		
		
		local function notificarChange()
			if options.onChange ~= nil then
				options.onChange(data);
			end;
		end;		
				
		local inChange = false;
				
		function self:doStrokeChanged(canCheck)		
			if inChange then
				return;
			end;
		
			inChange = true;
		
			if self.isShowing then				
				if canCheck then
					self.cbxStroke.checked = true;
				end;
				
				local r, g, b, a = colorToRGBA(self.cmbStroke.color);
				
				if self.cbxStroke.checked and (a ~= 1) then
					a = 1.0;
					self.cmbStroke.color = RGBAToColor(r, g, b, a);
				elseif not self.cbxStroke.checked and (a ~= 0) then
					a = 0.0;
					self.cmbStroke.color = RGBAToColor(r, g, b, a);
				end
												
				data.strokeColor = self.cmbStroke.color;
					
				notificarChange();		
			end;
			
			inChange = false;
		end;
		
		function self:doFillChanged(canCheck)	
			if inChange then
				return;
			end;
			
			inChange = true;
		
			if self.isShowing then
				if canCheck then
					self.cbxFill.checked = true;				
				end;
				
				local r, g, b, a = colorToRGBA(self.cmbFill.color);
				
				if self.cbxFill.checked and (a ~= 1) then
					a = 1.0;
					self.cmbFill.color = RGBAToColor(r, g, b, a);
				elseif not self.cbxFill.checked and (a ~= 0) then
					a = 0.0;
					self.cmbFill.color = RGBAToColor(r, g, b, a);
				end
				
				data.fillColor = self.cmbFill.color;
				
				notificarChange();
			end;
			
			inChange = false;
		end;	

		function self:doSnapToGridChanged()
			if inChange then
				return;
			end;
			
			inChange = true;
		
			if self.isShowing then				
				data.snapToGrid = self.cbxSnapToGrid.checked;				
				notificarChange();
			end;
			
			inChange = false;		
		end;

	


    obj.flaLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flaLayout:setParent(obj);
    obj.flaLayout:setName("flaLayout");
    obj.flaLayout:setAlign("client");

    obj.cbxStroke = gui.fromHandle(_obj_newObject("checkBox"));
    obj.cbxStroke:setParent(obj.flaLayout);
    obj.cbxStroke:setName("cbxStroke");
    obj.cbxStroke:setWidth(100);
    obj.cbxStroke:setHeight(30);
    obj.cbxStroke:setMargins({left=4, right=4});
    obj.cbxStroke:setFontSize(11);

    obj.cmbStroke = gui.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbStroke:setParent(obj.flaLayout);
    obj.cmbStroke:setName("cmbStroke");
    obj.cmbStroke:setUseAlpha(false);
    obj.cmbStroke:setHeight(30);
    obj.cmbStroke:setWidth(50);

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flaLayout);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.cbxFill = gui.fromHandle(_obj_newObject("checkBox"));
    obj.cbxFill:setParent(obj.flaLayout);
    obj.cbxFill:setName("cbxFill");
    obj.cbxFill:setWidth(100);
    obj.cbxFill:setHeight(30);
    obj.cbxFill:setMargins({left=4, right=4});
    obj.cbxFill:setFontSize(11);

    obj.cmbFill = gui.fromHandle(_obj_newObject("colorComboBox"));
    obj.cmbFill:setParent(obj.flaLayout);
    obj.cmbFill:setName("cmbFill");
    obj.cmbFill:setUseAlpha(false);
    obj.cmbFill:setHeight(30);
    obj.cmbFill:setWidth(50);

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flaLayout);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.cbxSnapToGrid = gui.fromHandle(_obj_newObject("checkBox"));
    obj.cbxSnapToGrid:setParent(obj.flaLayout);
    obj.cbxSnapToGrid:setName("cbxSnapToGrid");
    obj.cbxSnapToGrid:setWidth(100);
    obj.cbxSnapToGrid:setHeight(30);
    obj.cbxSnapToGrid:setMargins({left=4, right=4});
    obj.cbxSnapToGrid:setFontSize(11);


		self.cbxStroke.text = lang('userDrawing.stroke');
		self.cbxFill.text = lang('userDrawing.fill');
		self.cbxSnapToGrid.text = lang('scene.tokenEdit.snapToGrid');
	
		function self:prepareForShow(theOptions)
			inChange = true;
			self:beginUpdate();
			options = theOptions or DEFAULT_OPTIONS;
			
			local r, g, b, a;
			
			-- Stroke			
			r, g, b, a = colorToRGBA(options.strokeColor or "Black");

			if a < 0.99 then
				a = 0;
			else
				a = 1;
			end;
			
			self.cmbStroke.color = RGBAToColor(r, g, b, a);						
			self.cbxStroke.checked = a >= 0.99;
			self.cbxSnapToGrid.checked = options.snapToGrid == true;
						
			-- Fill			
			r, g, b, a = colorToRGBA(options.fillColor or "Null");
			
			if a < 0.99 then
				a = 0;
			else
				a = 1;
			end;
			
			self.cmbFill.color = RGBAToColor(r, g, b, a);						
			self.cbxFill.checked = a >= 0.99;
						
			data = {};
			self:popularData();
			self:endUpdate();
			inChange = false;
		end;
		
		function self:prepareForClose()
			options = DEFAULT_OPTIONS;
		end;
		


    obj._e_event0 = obj:addEventListener("onKeyUp",
        function (self, event)
        end, obj);

    obj._e_event1 = obj.cbxStroke:addEventListener("onChange",
        function (self)
            self:doStrokeChanged(false)
        end, obj);

    obj._e_event2 = obj.cmbStroke:addEventListener("onChange",
        function (self)
            self:doStrokeChanged(true)
        end, obj);

    obj._e_event3 = obj.cbxFill:addEventListener("onChange",
        function (self)
            self:doFillChanged(false)
        end, obj);

    obj._e_event4 = obj.cmbFill:addEventListener("onChange",
        function (self)
            self:doFillChanged(true)
        end, obj);

    obj._e_event5 = obj.cbxSnapToGrid:addEventListener("onChange",
        function (self)
            self:doSnapToGridChanged()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.cbxStroke ~= nil then self.cbxStroke:destroy(); self.cbxStroke = nil; end;
        if self.flaLayout ~= nil then self.flaLayout:destroy(); self.flaLayout = nil; end;
        if self.cbxFill ~= nil then self.cbxFill:destroy(); self.cbxFill = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.cmbStroke ~= nil then self.cmbStroke:destroy(); self.cmbStroke = nil; end;
        if self.cbxSnapToGrid ~= nil then self.cbxSnapToGrid:destroy(); self.cbxSnapToGrid = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.cmbFill ~= nil then self.cmbFill:destroy(); self.cmbFill = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmUserDrawingDetails = {
    newEditor = newfrmUserDrawingDetails, 
    new = newfrmUserDrawingDetails, 
    name = "frmUserDrawingDetails", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmUserDrawingDetails = _frmUserDrawingDetails;
rrpg.registrarForm(_frmUserDrawingDetails);

return _frmUserDrawingDetails;
