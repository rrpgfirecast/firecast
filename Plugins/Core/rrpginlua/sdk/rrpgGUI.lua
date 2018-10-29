local objs = require("rrpgObjs.lua");
local ndb = require("ndb.lua");

gui = {}
GUI = gui;

local guiLoaders = {};

gui.guiLoaders = guiLoaders;


--[[ Objeto Control ]]--

local function controlFromHandle(handle)
	local ctrl = objs.hierarchyObjectFromHandle(handle);		
		
	function ctrl:setFocus() _obj_invoke(self.handle, "SetFocus");	end;	
	function ctrl:beginUpdate() _obj_invoke(self.handle, "BeginUpdate"); end
	function ctrl:endUpdate() _obj_invoke(self.handle, "EndUpdate"); end
	function ctrl:needRepaint() _obj_invoke(self.handle, "Repaint"); end
	
	
	function ctrl:getVisible() return _obj_getProp(self.handle, "Visible"); end;
	function ctrl:setVisible(visible) _obj_setProp(self.handle, "Visible", visible == true) end;
	
	
	function ctrl:getAlign() return _obj_getProp(self.handle, "Align"); end;
	function ctrl:setAlign(align) _obj_setProp(self.handle, "Align", align); end;	
	
	function ctrl:getEnabled()return  _obj_getProp(self.handle, "Enabled"); end;
	function ctrl:setEnabled(enabled) _obj_setProp(self.handle, "Enabled", enabled == true) end;	
	
	function ctrl:getLeft() return _obj_getProp(self.handle, "Position.X"); end;
	function ctrl:setLeft(left) _obj_setProp(self.handle, "Position.X", left) end;	
	
	function ctrl:getTop() return _obj_getProp(self.handle, "Position.Y"); end;
	function ctrl:setTop(top) _obj_setProp(self.handle, "Position.Y", top) end;		
	
	function ctrl:getBottom() return self:getTop() + self:getHeight(); end;
	function ctrl:setBottom(bottom) self:setTop(bottom - self:getHeight()); end;		
	
	function ctrl:getRight() return self:getLeft() + self:getWidth(); end;
	function ctrl:setRight(right) self:setLeft(right - self:getWidth()); end;				
	
	function ctrl:getWidth() return _obj_getProp(self.handle, "Width"); end;
	function ctrl:setWidth(width) _obj_setProp(self.handle, "Width", width) end;	
	
	function ctrl:getHeight() return _gui_getHeight(self.handle); end;
	function ctrl:setHeight(height) _gui_setHeight(self.handle, height) end;
	
	function ctrl:getHitTest() return _obj_getProp(self.handle, "HitTest"); end;
	function ctrl:setHitTest(hittest) _obj_setProp(self.handle, "HitTest", hittest == true) end;		
	
	function ctrl:getTabOrder() return _obj_getProp(self.handle, "TabOrder"); end;
	function ctrl:setTabOrder(tabOrder) _obj_setProp(self.handle, "TabOrder", tabOrder); end;	
	
	function ctrl:getOpacity() return _obj_getProp(self.handle, "Opacity"); end;
	function ctrl:setOpacity(opacity) _obj_setProp(self.handle, "Opacity", opacity); end;	
	
	function ctrl:getMargins() return _obj_getProp(self.handle, "Margins"); end;
	function ctrl:setMargins(margins) _gui_setMargins(self.handle, margins); end;		
	
	function ctrl:getPadding() return _obj_getProp(self.handle, "Padding"); end;
	function ctrl:setPadding(padding) _gui_setPadding(self.handle, padding); end;			
	
	function ctrl:getAnchors() return _obj_getProp(self.handle, "Anchors"); end;
	function ctrl:setAnchors(anchors) _obj_setProp(self.handle, "Anchors", anchors); end;		
	
	function ctrl:getCanFocus() return _obj_getProp(self.handle, "CanFocus"); end;
	function ctrl:setCanFocus(canFocus) _obj_setProp(self.handle, "CanFocus", canFocus); end;	
	
	function ctrl:getRotationAngle() return _obj_getProp(self.handle, "RotationAngle"); end;
	function ctrl:setRotationAngle(angle) _obj_setProp(self.handle, "RotationAngle", angle); end;		
	
	function ctrl:getRotationCenterX() return _obj_getProp(self.handle, "RotationCenter.X"); end;
	function ctrl:setRotationCenterX(x) _obj_setProp(self.handle, "RotationCenter.X", x); end;			
	
	function ctrl:getRotationCenterY() return _obj_getProp(self.handle, "RotationCenter.Y"); end;
	function ctrl:setRotationCenterY(y) _obj_setProp(self.handle, "RotationCenter.Y", y); end;			
	
	function ctrl:getScaleX() return _obj_getProp(self.handle, "Scale.X"); end;
	function ctrl:setScaleX(sX) _obj_setProp(self.handle, "Scale.X", sX); end;				
	
	function ctrl:getScaleY() return _obj_getProp(self.handle, "Scale.Y"); end;
	function ctrl:setScaleY(sY) _obj_setProp(self.handle, "Scale.Y", sY); end;					
	
	function ctrl:getScale() return self:getScaleX(); end;
	function ctrl:setScale(ss) self:beginUpdate(); self:setScaleX(ss); self:setScaleY(ss); self:endUpdate(); end;						
	
	function ctrl:isChildFocused() return _obj_getProp(self.handle, "IsChildFocused"); end;
	function ctrl:isFocused() return _obj_getProp(self.handle, "IsFocused"); end;	
	function ctrl:isMouseOver() return _obj_getProp(self.handle, "IsMouseOver"); end;
	function ctrl:isVisible() return self:getVisible(); end;	
	
	function ctrl:getCursor() return _obj_getProp(self.handle, "MouseCursor"); end;
	function ctrl:setCursor(v) _obj_setProp(self.handle, "MouseCursor", v); end;
	
	function ctrl:getHint() return _obj_getProp(self.handle, "Hint"); end;
	function ctrl:setHint(v) _gui_setHint(self.handle, v); end;	
	
	function ctrl:getEffect() return _obj_getProp(self.handle, "CompEffect"); end;
	function ctrl:setEffect(effect) _obj_setProp(self.handle, "CompEffect", effect); end;
	
	function ctrl:getEffectTriggers() return _obj_getProp(self.handle, "CompEffectTriggers"); end;
	function ctrl:setEffectTriggers(triggers) _obj_setProp(self.handle, "CompEffectTriggers", triggers); end;	
	
	function ctrl:getEffectParam() return _obj_getProp(self.handle, "CompEffectParam"); end;
	function ctrl:setEffectParam(param) _obj_setProp(self.handle, "CompEffectParam", param); end;	
	
	function ctrl:getEffectParam2() return _obj_getProp(self.handle, "CompEffectParam2"); end;
	function ctrl:setEffectParam2(param) _obj_setProp(self.handle, "CompEffectParam2", param); end;		
	
	function ctrl:getEffectParam3() return _obj_getProp(self.handle, "CompEffectParam3"); end;
	function ctrl:setEffectParam3(param) _obj_setProp(self.handle, "CompEffectParam3", param); end;			

	function ctrl:getEffectParam4() return _obj_getProp(self.handle, "CompEffectParam4"); end;
	function ctrl:setEffectParam4(param) _obj_setProp(self.handle, "CompEffectParam4", param); end;	
			
	function ctrl:findControlByName(controlName) return gui.findControlByName(controlName, self); end;
		
	if ctrl.props == nil then
		ctrl.props = {};
	end;
		
	ctrl.props["visible"] = {setter = "setVisible", getter = "getVisible", tipo = "bool"};
	ctrl.props["align"] = {setter = "setAlign", getter = "getAlign", tipo = "enum", 
						   values = {"none", "top", "left", "right",
						   			 "bottom", "client", "contents", "scale"}}	
						   			 				   			 
	ctrl.props["enabled"] = {setter = "setEnabled", getter = "getEnabled", tipo = "bool"};
	ctrl.props["left"] = {setter = "setLeft", getter = "getLeft", tipo = "double"};
	ctrl.props["top"] = {setter = "setTop", getter = "getTop", tipo = "double"};	
	ctrl.props["right"] = {setter = "setRight", getter = "getRight", tipo = "double"};
	ctrl.props["bottom"] = {setter = "setBottom", getter = "getBottom", tipo = "double"};		
	ctrl.props["width"] = {setter = "setWidth", getter = "getWidth", tipo = "double"};
	ctrl.props["height"] = {setter = "setHeight", getter = "getHeight", tipo = "double"};
	ctrl.props["hitTest"] = {setter = "setHitTest", getter = "getHitTest", tipo = "bool"};
	ctrl.props["tabOrder"] = {setter = "setTabOrder", getter = "getTabOrder", tipo = "int"};
	ctrl.props["opacity"] = {setter = "setOpacity", getter = "getOpacity", tipo = "double"};
	ctrl.props["margins"] = {setter = "setMargins", getter = "getMargins", tipo = "bounds"};
	ctrl.props["padding"] = {setter = "setPadding", getter = "getPadding", tipo = "bounds"};	
	ctrl.props["anchors"] = {setter = "setAnchors", getter = "getAnchors", tipo = "set",
							 values = {"left", "top", "right", "bottom"}};
							 
	ctrl.props["canFocus"] = {setter = "setCanFocus", getter = "getCanFocus", tipo="bool"};
	ctrl.props["rotationAngle"] = {setter = "setRotationAngle", getter = "getRotationAngle", tipo="double"};	
	ctrl.props["rotationCenterX"] = {setter = "setRotationCenterX", getter = "getRotationCenterX", tipo="double"};	
	ctrl.props["rotationCenterY"] = {setter = "setRotationCenterY", getter = "getRotationCenterY", tipo="double"};		
	ctrl.props["scaleX"] = {setter = "setScaleX", getter = "getScaleX", tipo="double"};			
	ctrl.props["scaleY"] = {setter = "setScaleY", getter = "getScaleY", tipo="double"};				
	ctrl.props["scale"] = {setter = "setScale", getter = "getScale", tipo="double"};				
	ctrl.props["parent"] = {setter = "setParent", getter = "getParent", tipo="table"};		
	ctrl.props["cursor"] = {setter = "setCursor", getter = "getCursor", tipo="enum",
							values={'default', 'arrow', 'handPoint', 'hourGlass',
   								    'IBeam', 'size', 'sizeNESW', 'sizeNS',
								    'sizeNWSE', 'sizeWE', 'upArrow',
								    'drag', 'noDrop', 'hSplit', 'vSplit',
								    'multiDrag', 'sqlWait', 'no', 'appStart',
								    'help', 'cross'}};				
	ctrl.props["hint"] = {setter = "setHint", getter = "getHint", tipo="string"};
	
	--[[
	ctrl.props["effect"] = {setter = "setEffect", getter = "getEffect", tipo="enum",
							values = {"none", "shadow", "blur", "glow",
									  "innerglow", "reflection", "wave",
									  "pixelate", "sepia", "paper", "hueajuste",
									  "bloom", "invert", "monochrome", "colortransparency"}}
	ctrl.props["effectTriggers"] = {setter = "setEffectTriggers", getter = "getEffectTriggers", tipo="set",
									values = {"IsChecked=True", "IsChecked=False",
										      "IsFocused=True", "IsFocused=False",
										      "IsMouseOver=True", "IsMouseOver=False",
										      "IsPressed=True", "IsPressed=False",
										      "IsSelected=True", "IsSelected=False"}}
										      
	ctrl.props["effectParam"] = {setter="setEffectParam", getter="getEffectParam", tipo="double"};
	ctrl.props["effectParam2"] = {setter="setEffectParam2", getter="getEffectParam2", tipo="double"};
	ctrl.props["effectParam3"] = {setter="setEffectParam3", getter="getEffectParam3", tipo="double"};
	ctrl.props["effectParam4"] = {setter="setEffectParam4", getter="getEffectParam4", tipo="double"};	]]--

	if ctrl.eves == nil then
		ctrl.eves = {};
	end;
	
	ctrl.eves["onResize"] = "";
	ctrl.eves["onClick"] = "";
	ctrl.eves["onDblClick"] = "";
	ctrl.eves["onMouseDown"] = "event";
	ctrl.eves["onMouseMove"] = "event";
	ctrl.eves["onMouseUp"] = "event";
	ctrl.eves["onMouseEnter"] = "";
	ctrl.eves["onMouseLeave"] = "";
	ctrl.eves["onEnter"] = "";
	ctrl.eves["onExit"] = "";
	ctrl.eves["onKeyDown"] = "event";
	ctrl.eves["onKeyUp"] = "event";
	ctrl.eves["onMenu"] = 'x, y';
	ctrl.eves["onStartDrag"] = 'drag, x, y';	
	ctrl.eves["onStartDrop"] = 'drop, x, y, drag';	
	--ctrl.eves["onTap"] = "x, y";
	
	ctrl:setParent(ctrl:getParent()); -- trabalhar as questões de referências
	
	return ctrl;
end

gui.controlFromHandle = controlFromHandle;

--[[ Objeto Layout ]]--

local function layoutFromHandle(handle)
	local layout = controlFromHandle(handle);
	
	function layout:getFrameStyle() return _obj_getProp(self.handle, "FrameStyle"); end;
	function layout:setFrameStyle(frameStyle) _obj_setProp(self.handle, "FrameStyle", frameStyle) end;		
	
	function layout:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
	function layout:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
	
	layout.props["frameStyle"] = {setter = "setFrameStyle", getter = "getFrameStyle", tipo = "url"};		
	layout.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};				
	return layout;	
end

function gui.newLayout()
  return gui.fromHandle(_obj_newObject("layout"));
end;

guiLoaders["layout"] = layoutFromHandle;

--[[ Objeto Form Layout ]]--

local function __atualizarLockPopupWithTopStack(lockPopup)
	local topStack = lockPopup.__topStackStatus;
	
	if topStack ~= nil then
		lockPopup.__label.text = topStack.msg;
		lockPopup.__label.visible = topStack.msg ~= "";
	end;
end;

local function __lockFormWithActivity(form, msg)
	local thePopup = rawget(form, "__lockWithActivityPopup");
	
	if thePopup == nil then
		-- criar o popup de lock
		thePopup = gui.newPopup();		
		thePopup.width = 280;
		thePopup.height = 50;		
		thePopup.cancelable = false;
		thePopup.drawContainer = false;
		thePopup.autoScopeNode = false;	
		
		thePopup.__indicator = gui.newActivityIndicator();
		thePopup.__indicator.align = "client";
		thePopup.__indicator.parent = thePopup;
		
		thePopup.__label = gui.newLabel();
		thePopup.__label.vertTextAlign = "leading";
		thePopup.__label.horzTextAlign = "center";
		thePopup.__label.autoSize = true;
		thePopup.__label.wordWrap = true;
		thePopup.__label.align = "bottom";
		thePopup.__label.parent = thePopup;
		thePopup.__label.fontSize = 15;
		
		thePopup.parent = form;	
		rawset(form, "__lockWithActivityPopup", thePopup);
	end;
	
	local stackStatus = {};
	stackStatus.msg = msg or "";
	stackStatus.anterior = thePopup.__topStackStatus;
	thePopup.__topStackStatus = stackStatus;
	
	__atualizarLockPopupWithTopStack(thePopup);
	
	if not stackStatus.anterior then
		-- Primeira chamada
		thePopup.__indicator.enabled = true;
		thePopup:show("center", form);
	end;
end;

local function __reallyCloseLockPopup(form, lockPopup)
	lockPopup.__indicator.enabled = false;	
	lockPopup:close();
	rawset(form, "__lockWithActivityPopup", nil); -- Permitir o garbage collector coletar
	
	setTimeout(function()
					lockPopup.parent = nil;
					lockPopup.__label.parent = nil;					
					lockPopup.__indicator.parent = nil;
			   end, 3000);
end;

local function __unlockFormWithActivity(form)
	local thePopup = rawget(form, "__lockWithActivityPopup");
	
	if thePopup == nil then
		return true;
	end;
	
	local topStack = thePopup.__topStackStatus;
	
	if topStack ~= nil then
		topStack = topStack.anterior;
		thePopup.__topStackStatus = topStack;
	end;
	
	if topStack ~= nil then
		__atualizarLockPopupWithTopStack(thePopup);
		return false;
	else
		__reallyCloseLockPopup(form, thePopup);
		return true;	
	end;
end;

local function formLayoutFromHandle(handle)
	local ctrl = layoutFromHandle(handle);
	
	rawset(ctrl, "__isFormFlag", true);
	
	function ctrl:getWidth() return _obj_getProp(self.handle, "FormWidth"); end;
	function ctrl:setWidth(v) _obj_setProp(self.handle, "FormWidth", v); end;
	
	function ctrl:getHeight() return _obj_getProp(self.handle, "FormHeight"); end;
	function ctrl:setHeight(v) _obj_setProp(self.handle, "FormHeight", v); end;

	function ctrl:getLeft() return _obj_getProp(self.handle, "FormLeft"); end;
	function ctrl:setLeft(v) _obj_setProp(self.handle, "FormLeft", v); end;
	
	function ctrl:getTop() return _obj_getProp(self.handle, "FormTop"); end;
	function ctrl:setTop(v) _obj_setProp(self.handle, "FormTop", v); end;	
		
	function ctrl:getTitle() return _obj_getProp(self.handle, "Title"); end;
	function ctrl:setTitle(title) _obj_setProp(self.handle, "Title", title) end;
	
	function ctrl:getDescription() return _obj_getProp(self.handle, "Description"); end;
	function ctrl:setDescription(desc) _obj_setProp(self.handle, "Description", desc) end;	
	
	function ctrl:getDataType() return _obj_getProp(self.handle, "DataType"); end;
	function ctrl:setDataType(dataType) _obj_setProp(self.handle, "DataType", dataType) end;	
	
	function ctrl:getFormType() return _obj_getProp(self.handle, "FormType"); end;
	function ctrl:setFormType(formType) _obj_setProp(self.handle, "FormType", formType) end;		
	
	function ctrl:getTheme() return _obj_getProp(self.handle, "Theme"); end;
	function ctrl:setTheme(theme) _obj_setProp(self.handle, "Theme", theme) end;	
		
	function ctrl:getLockWhileNodeIsLoading() return _obj_getProp(self.handle, "LockWhileNodeIsLoading"); end;
	function ctrl:setLockWhileNodeIsLoading(v) _obj_setProp(self.handle, "LockWhileNodeIsLoading", v) end;		
	
	function ctrl:getMinWidth() return _obj_getProp(self.handle, "MinWidth"); end;
	function ctrl:setMinWidth(v) _obj_setProp(self.handle, "MinWidth", v) end;		
	
	function ctrl:getMaxWidth() return _obj_getProp(self.handle, "MaxWidth"); end;
	function ctrl:setMaxWidth(v) _obj_setProp(self.handle, "MaxWidth", v) end;		
		
	function ctrl:setNodeObject(nodeObject) 
		rawset(self, "nodeObject", nodeObject);
		_gui_assignNodeObject(self.handle, ndb.getNodeHandle(nodeObject));
	end;
	
	function ctrl:getNodeObject() return rawget(self, "nodeObject") end;
	
	function ctrl:getNode() return self:getNodeObject(); end;
	function ctrl:setNode(node) self:setNodeObject(node); end;
	function ctrl:getScopeNode() return self:getNodeObject(); end;
	function ctrl:setScopeNode(node) self:setNodeObject(node); end;	
	
	function ctrl:lockWithActivity(msg) return __lockFormWithActivity(self, msg); end;	
	function ctrl:unlockWithActivity() return __unlockFormWithActivity(self); end;	
	
	ctrl.props["title"] = {setter = "setTitle", getter = "getTitle", tipo = "string"};
	ctrl.props["description"] = {setter = "setDescription", getter = "getDescription", tipo = "string"};	
	ctrl.props["dataType"] = {setter = "setDataType", getter = "getDataType", tipo = "string"};
	ctrl.props["formType"] = {setter = "setFormType", getter = "getDataType", tipo = "enum",
							  values = {"undefined", "sheetTemplate", "tablesDock"}};
	ctrl.props["theme"] = {setter = "setTheme", getter = "getTheme", tipo = "enum", 
						   values = {"default", "light", "dark"}};
	ctrl.props["lockWhileNodeIsLoading"] = {setter = "setLockWhileNodeIsLoading", getter = "getLockWhileNodeIsLoading", tipo = "bool"};						   
	ctrl.props["scopeNode"] = {setter = "setScopeNode", getter = "getScopeNode", tipo = "table"};						   	
	ctrl.props["minWidth"] = {setter = "setMinWidth", getter = "getMinWidth", tipo = "double"};	
	ctrl.props["maxWidth"] = {setter = "setMaxWidth", getter = "getMaxWidth", tipo = "double"};		
	ctrl.props["isShowing"] = {readProp = "IsShowing", tipo = "bool"};			
	
	ctrl.eves["onScopeNodeChanged"] = "";	
	ctrl.eves["onShow"] = "";
	ctrl.eves["onHide"] = "";
	ctrl.eves["onNodeReady"] = "";
	ctrl.eves["onNodeUnready"] = "";
	ctrl.eves["onNodeChanged"] = "";		
	return ctrl;	
end

function gui.newFormLayout()
  return gui.fromHandle(_obj_newObject("form"));
end;

guiLoaders["form"] = formLayoutFromHandle;

--[[ Objeto Popup Form ]]--

local function popupFormFromHandle(handle)
	local ctrl = formLayoutFromHandle(handle);
	
	function ctrl:getDrawContainer() return _obj_getProp(self.handle, "DrawContainer"); end;
	function ctrl:setDrawContainer(v) _obj_setProp(self.handle, "DrawContainer", v); end;	
	
	function ctrl:getCancelable() return _obj_getProp(self.handle, "Cancelable"); end;
	function ctrl:setCancelable(v) _obj_setProp(self.handle, "Cancelable", v); end;		
	
	function ctrl:getPlacement() return _obj_getProp(self.handle, "Placement"); end;
	function ctrl:setPlacement(v) _obj_setProp(self.handle, "Placement", v); end;		
	
	function ctrl:getResizable() return _obj_getProp(self.handle, "Resizable"); end;
	function ctrl:setResizable(v) _obj_setProp(self.handle, "Resizable", v); end;
	
	function ctrl:show() return gui.showPopup(self); end;
	function ctrl:close() return gui.closePopup(self); end;
	
	ctrl.props["drawContainer"] = {setter = "setDrawContainer", getter = "getDrawContainer", tipo = "bool"};	
	ctrl.props["cancelable"] = {setter = "setCancelable", getter = "getCancelable", tipo = "bool"};	
	ctrl.props["placement"] = {setter = "setPlacement", getter = "getPlacement", tipo = "enum",
							   values={"center", "bottom", "top", "left", "right", 
							           "topLeft", "topRight", "bottomLeft", "bottomRight", "mouse", "mouseCenter"}};		
	ctrl.props["resizable"] = {setter = "setResizable", getter = "getResizable", tipo = "bool"};									   
									   
	ctrl.eves["onCancelRequest"] = "";
	return ctrl;
end;	

guiLoaders["popupForm"] = popupFormFromHandle;

--[[ Objeto Flow Part ]]--

local function flowPartFromHandle(handle)
	local layout = layoutFromHandle(handle);
	
	function layout:getMinWidth() return _obj_getProp(self.handle, "MinWidth"); end;
	function layout:setMinWidth(value) _obj_setProp(self.handle, "MinWidth", value) end;	
	
	function layout:getMinScaledWidth() return _obj_getProp(self.handle, "MinScaledWidth"); end;
	function layout:setMinScaledWidth(value) _obj_setProp(self.handle, "MinScaledWidth", value) end;		
	
	function layout:getMaxWidth() return _obj_getProp(self.handle, "MaxWidth"); end;
	function layout:setMaxWidth(value) _obj_setProp(self.handle, "MaxWidth", value) end;	
	
	function layout:getMaxScaledWidth() return _obj_getProp(self.handle, "MaxScaledWidth"); end;
	function layout:setMaxScaledWidth(value) _obj_setProp(self.handle, "MaxScaledWidth", value) end;		
	
	function layout:getAvoidScale() return _obj_getProp(self.handle, "AvoidScale"); end;
	function layout:setAvoidScale(value) _obj_setProp(self.handle, "AvoidScale", value) end;			
	
	function layout:getVertAlign() return _obj_getProp(self.handle, "VerticalAlign"); end;
	function layout:setVertAlign(value) _obj_setProp(self.handle, "VerticalAlign", value) end;	

	function layout:getStepSizes() return _obj_getProp(self.handle, "StepSizes"); end;
	function layout:setStepSizes(value) _obj_setProp(self.handle, "StepSizes", value) end;	
	
	function layout:getAdjustHeightToLine() return _obj_getProp(self.handle, "AdjustHeightToLine"); end;
	function layout:setAdjustHeightToLine(value) _obj_setProp(self.handle, "AdjustHeightToLine", value) end;		
	
	layout.props["minWidth"] = {setter = "setMinWidth", getter = "getMinWidth", tipo = "double"};	
	layout.props["minScaledWidth"] = {setter = "setMinScaledWidth", getter = "getMinScaledWidth", tipo = "double"};		
	layout.props["maxWidth"] = {setter = "setMaxWidth", getter = "getMaxWidth", tipo = "double"};	
	layout.props["maxScaledWidth"] = {setter = "setMaxScaledWidth", getter = "getMaxScaledWidth", tipo = "double"};			
	layout.props["avoidScale"] = {setter = "setAvoidScale", getter = "getAvoidScale", tipo = "bool"};							
	layout.props["vertAlign"] = {setter = "setVertAlign", getter = "getVertAlign", tipo = "enum",
								 values={"leading", "center", "trailing"}};		
	layout.props["stepSizes"] = {setter = "setStepSizes", getter = "getStepSizes", tipo = "table"};								
	layout.props["adjustHeightToLine"] = {setter = "setAdjustHeightToLine", getter = "getAdjustHeightToLine", tipo = "bool"};								
	return layout;	
end

function gui.newFlowPart()
  return gui.fromHandle(_obj_newObject("flowPart"));
end;

guiLoaders["flowPart"] = flowPartFromHandle;

--[[ Objeto Flow Layout ]]--

local function flowLayoutFromHandle(handle)
	local layout = flowPartFromHandle(handle);
	
	function layout:getAutoHeight() return _obj_getProp(self.handle, "AutoHeight"); end;
	function layout:setAutoHeight(value) _obj_setProp(self.handle, "AutoHeight", value) end;
	
	function layout:getHorzAlign() return _obj_getProp(self.handle, "HorzAlign"); end;
	function layout:setHorzAlign(value) _obj_setProp(self.handle, "HorzAlign", value) end;		
	
	function layout:getMaxControlsPerLine() return _obj_getProp(self.handle, "MaxControlsPerLine"); end;
	function layout:setMaxControlsPerLine(value) _obj_setProp(self.handle, "MaxControlsPerLine", value) end;			
	
	function layout:getLineSpacing() return _obj_getProp(self.handle, "LineSpacing"); end;
	function layout:setLineSpacing(value) _obj_setProp(self.handle, "LineSpacing", value) end;				
	
	function layout:getOrientation() return _obj_getProp(self.handle, "Orientation"); end;
	function layout:setOrientation(value) _obj_setProp(self.handle, "Orientation", value) end;			

	function layout:getMaxColumns() return _obj_getProp(self.handle, "MaxColumns"); end;
	function layout:setMaxColumns(value) _obj_setProp(self.handle, "MaxColumns", value) end;	

	function layout:needRealign() _obj_invoke(self.handle, "NeedRealign"); end;
	
	layout.props["autoHeight"] = {setter = "setAutoHeight", getter = "getAutoHeight", tipo = "bool"};	
	layout.props["horzAlign"] = {setter = "setHorzAlign", getter = "getHorzAlign", tipo = "enum",
								 values={"leading", "center", "trailing", "justify"}};		
								 
	layout.props["maxControlsPerLine"] = {setter = "setMaxControlsPerLine", getter = "getMaxControlsPerLine", tipo = "int"};									 
	layout.props["lineSpacing"] = {setter = "setLineSpacing", getter = "getLineSpacing", tipo = "double"};									 	
	layout.props["orientation"] = {setter = "setOrientation", getter = "getOrientation", tipo = "enum",
							       values={"horizontal", "vertical"}};									 	
	layout.props["maxColumns"] = {setter = "setMaxColumns", getter = "getMaxColumns", tipo = "int"};									 								   
	layout.props["contentWidth"] = {readProp = "ContentWidth", tipo = "double"};		
	layout.props["contentHeight"] = {readProp = "ContentHeight", tipo = "double"};		
	
	layout.eves["onBeforeLayoutCalc"] = "";	
	layout.eves["onAfterLayoutCalc"] = "";		
	return layout;	
end

function gui.newFlowLayout()
  return gui.fromHandle(_obj_newObject("flowLayout"));
end;

guiLoaders["flowLayout"] = flowLayoutFromHandle;


--[[ Objeto Flow Line Break ]]--

local function flowLineBreakFromHandle(handle)
	local ctrl = controlFromHandle(handle);
	
	function ctrl:getHorzAlign() return _obj_getProp(self.handle, "HorzAlign"); end;
	function ctrl:setHorzAlign(value) _obj_setProp(self.handle, "HorzAlign", value) end;		
	
	function ctrl:getLineSpacing() return _obj_getProp(self.handle, "LineSpacing"); end;
	function ctrl:setLineSpacing(value) _obj_setProp(self.handle, "LineSpacing", value) end;		
	
	ctrl.props["horzAlign"] = {setter = "setHorzAlign", getter = "getHorzAlign", tipo = "enum",
								 values={"leading", "center", "trailing", "justify"}};		
		
	ctrl.props["lineSpacing"] = {setter = "setLineSpacing", getter = "getLineSpacing", tipo = "double"};									 			
	
	return ctrl;	
end

function gui.newFlowLineBreak()
  return gui.fromHandle(_obj_newObject("flowLineBreak"));
end;

guiLoaders["flowLineBreak"] = flowLineBreakFromHandle;


--[[ Objeto Form Layout ]]--

--[[ Text Controls]]--

local function _addFontPropertiesToObject(ctrl)
	function ctrl:getFontColor() return _obj_getProp(self.handle, "FontColor"); end;
	function ctrl:setFontColor(color) _gui_prepareForFontColorChange(self.handle); _obj_setProp(self.handle, "FontColor", color); end;

	function ctrl:getFontFamily() return _obj_getProp(self.handle, "Font.Family"); end;
	function ctrl:setFontFamily(family) _gui_prepareForFontFamilyChange(self.handle); _obj_setProp(self.handle, "Font.Family", family); end;			
	
	function ctrl:getFontSize() return _obj_getProp(self.handle, "Font.Size"); end;
	function ctrl:setFontSize(fontSize) _gui_prepareForFontSizeChange(self.handle); _obj_setProp(self.handle, "Font.Size", fontSize); end;
	
	function ctrl:getFontStyle() return _obj_getProp(self.handle, "Font.Style"); end;
	function ctrl:setFontStyle(fontStyle) _gui_prepareForFontStyleChange(self.handle); _obj_setProp(self.handle, "Font.Style", fontStyle); end;
	
	function ctrl:getFontHeight() return _gui_getFontHeight(self.handle); end;
	
	ctrl.props["fontColor"] = {setter = "setFontColor", getter = "getFontColor", tipo = "color"};
	ctrl.props["fontFamily"] = {setter = "setFontFamily", getter = "getFontFamily", tipo = "string"};
	ctrl.props["fontSize"] = {setter = "setFontSize", getter = "getFontSize", tipo = "double"};
	ctrl.props["fontStyle"] = {setter = "setFontStyle", getter = "getFontStyle", tipo = "set",
							   values = {"bold", "italic", "underline", "strikeout"}};	
							   
	return ctrl;							   
end;

local function _addTextStylePropsToObject(ctrl)
	function ctrl:getHorzTextAlign() return _obj_getProp(self.handle, "TextAlign"); end;
	function ctrl:setHorzTextAlign(textAlign) return _obj_setProp(self.handle, "TextAlign", textAlign); end;
	
	function ctrl:getVertTextAlign() return _obj_getProp(self.handle, "VertTextAlign"); end;
	function ctrl:setVertTextAlign(textAlign) return _obj_setProp(self.handle, "VertTextAlign", textAlign); end;

	function ctrl:getWordWrap() return _obj_getProp(self.handle, "WordWrap"); end;
	function ctrl:setWordWrap(wrap) return _obj_setProp(self.handle, "WordWrap", wrap == true); end;
	
	function ctrl:getTextTrimming() return _obj_getProp(self.handle, "Trimming"); end;
	function ctrl:setTextTrimming(trimming) return _obj_setProp(self.handle, "Trimming", trimming); end;	
	
	ctrl.props["horzTextAlign"] = {setter = "setHorzTextAlign", getter="getHorzTextAlign", tipo="enum",
								   values = {"center", "leading", "trailing"}};
								   
	ctrl.props["vertTextAlign"] = {setter = "setVertTextAlign", getter="getVertTextAlign", tipo="enum",
								   values = {"center", "leading", "trailing"}};								   

	ctrl.props["wordWrap"] = {setter = "setWordWrap", getter="getWordWrap", tipo="bool"};								   
	
	ctrl.props["textTrimming"] = {setter = "setTextTrimming", getter="getTextTrimming", tipo="enum",
								   values = {"none", "character", "word"}}	

	return ctrl;
end;

local function _addEditablePropsToObject(ctrl)
	function ctrl:getReadOnly() return _obj_getProp(self.handle, "ReadOnly"); end;
	function ctrl:setReadOnly(readonly) return _obj_setProp(self.handle, "ReadOnly", readonly); end;

	ctrl.props["readOnly"] = {setter="setReadOnly", getter="getReadOnly", tipo="bool"};
	ctrl.eves["onChange"] = "";
	
	return ctrl;
end

local function textControlFromHandle(handle)
	local ctrl = controlFromHandle(handle);	
	ctrl = _addFontPropertiesToObject(ctrl);
	ctrl = _addTextStylePropsToObject(ctrl);
	
	function ctrl:getText() return _obj_getProp(self.handle, "Text"); end;
	function ctrl:setText(text) return _obj_setProp(self.handle, "Text", text); end;
	
	function ctrl:getStyledSettings() return _obj_getProp(self.handle, "StyledSettings"); end;
	function ctrl:setStyledSettings(settings) return _obj_setProp(self.handle, "StyledSettings", settings); end;	
				
	ctrl.props["text"] = {setter = "setText", getter = "getText", tipo = "string"};
	ctrl.props["styledSettings"] = {setter = "setStyledSettings", getter = "getStyledSettings", tipo="set",
									values = {"family", "size", "style", "fontcolor", "other"}};
		
	return ctrl;	
end

--[[ Objeto Button ]]--

local function buttonFromHandle(handle)
	local button = textControlFromHandle(handle);		
	return button;	
end

function gui.newButton()
  return gui.fromHandle(_obj_newObject("button"));
end;

guiLoaders["button"] = buttonFromHandle;

--[[ Objeto Label ]]--

local function labelFromHandle(handle)
	local ctrl = textControlFromHandle(handle);		
	
	function ctrl:getAutoSize() return _obj_getProp(self.handle, "AutoSize"); end;
	function ctrl:setAutoSize(v) _obj_setProp(self.handle, "AutoSize", v); end;
	
	function ctrl:getField() return _gui_getFieldName(self.handle); end;
	function ctrl:setField(v) _gui_setFieldName(self.handle, v); end;
	
	function ctrl:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
	function ctrl:setFrameRegion(v) _obj_setProp(self.handle, "FrameRegion", v); end;	
					
	ctrl.props["autoSize"] = {setter = "setAutoSize", getter = "getAutoSize", tipo = "bool"};		
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
	ctrl.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};			
	ctrl.props["format"] = {writeProp = "StringFormat", readProp = "StringFormat", tipo = "string"};		
	ctrl.props["formatFloat"] = {writeProp = "StringFormatFloat", readProp = "StringFormatFloat", tipo = "string"};			
	return ctrl;	
end

function gui.newLabel()
  return gui.fromHandle(_obj_newObject("label"));
end;

guiLoaders["label"] = labelFromHandle;

--[[ Objeto CheckBox ]]--

local function checkBoxFromHandle(handle)
	local ctrl = textControlFromHandle(handle);		
	
	function ctrl:getChecked() return _obj_getProp(self.handle, "IsChecked"); end;
	function ctrl:setChecked(v) return _obj_setProp(self.handle, "IsChecked", v); end;
	
	function ctrl:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function ctrl:setField(v) return _obj_setProp(self.handle, "FieldName", v); end;
	
	
	ctrl.props["checked"] = {setter = "setChecked", getter = "getChecked", tipo = "bool"};
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};	
	
	ctrl.eves["onChange"] = "";	
	return ctrl;	
end

function gui.newCheckBox()
  return gui.fromHandle(_obj_newObject("checkBox"));
end;

guiLoaders["checkBox"] = checkBoxFromHandle;

--[[ Objeto RadioButton ]]--

local function radioButtonFromHandle(handle)
	local ctrl = textControlFromHandle(handle);		
	
	function ctrl:getChecked() return _obj_getProp(self.handle, "IsChecked"); end;
	function ctrl:setChecked(v) return _obj_setProp(self.handle, "IsChecked", v); end;
	
	function ctrl:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function ctrl:setField(v) return _obj_setProp(self.handle, "FieldName", v); end;
	
	function ctrl:getFieldValue() return _obj_getProp(self.handle, "FieldValue"); end;
	function ctrl:setFieldValue(v) return _obj_setProp(self.handle, "FieldValue", v); end;	
	
	function ctrl:getGroupName() return _obj_getProp(self.handle, "GroupName"); end;
	function ctrl:setGroupName(v) return _obj_setProp(self.handle, "GroupName", v); end;	
	
	
	ctrl.props["checked"] = {setter = "setChecked", getter = "getChecked", tipo = "bool"};
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};	
	ctrl.props["fieldValue"] = {setter = "setFieldValue", getter = "getFieldValue", tipo = "string"};	
	ctrl.props["groupName"] = {setter = "setGroupName", getter = "getGroupName", tipo = "string"};	
	
	ctrl.eves["onChange"] = "";	
	return ctrl;	
end

function gui.newRadioButton()
  return gui.fromHandle(_obj_newObject("radioButton"));
end;

guiLoaders["radioButton"] = radioButtonFromHandle;


--[[ Objeto ImageCheckBox ]]--

local function imageCheckBoxFromHandle(handle)
	local ctrl = controlFromHandle(handle);		
	
	function ctrl:getChecked() return _obj_getProp(self.handle, "IsChecked"); end;
	function ctrl:setChecked(v) _obj_setProp(self.handle, "IsChecked", v); end;
	
	function ctrl:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function ctrl:setField(v) _obj_setProp(self.handle, "FieldName", v); end;
	
	function ctrl:getImageChecked() return _obj_getProp(self.handle, "ImageChecked"); end;
	function ctrl:setImageChecked(v) _obj_setProp(self.handle, "ImageChecked", v); end;
	
	function ctrl:getImageUnchecked() return _obj_getProp(self.handle, "ImageUnchecked"); end;
	function ctrl:setImageUnchecked(v) _obj_setProp(self.handle, "ImageUnchecked", v); end;	
	
	function ctrl:getOptimize() return _obj_getProp(self.handle, "Optimize"); end;
	function ctrl:setOptimize(opt) return _obj_setProp(self.handle, "Optimize", opt); end;			
	
	function ctrl:getAutoChange() return _obj_getProp(self.handle, "AutoChange"); end;
	function ctrl:setAutoChange(v) return _obj_setProp(self.handle, "AutoChange", v); end;		
	
	ctrl.props["checked"] = {setter = "setChecked", getter = "getChecked", tipo = "bool"};
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
	ctrl.props["imageChecked"] = {setter = "setImageChecked", getter = "getImageChecked", tipo = "url"};		
	ctrl.props["checkedImage"] = {setter = "setImageChecked", getter = "getImageChecked", tipo = "url"};			
	ctrl.props["imageUnchecked"] = {setter = "setImageUnchecked", getter = "getImageUnchecked", tipo = "url"};			
	ctrl.props["uncheckedImage"] = {setter = "setImageUnchecked", getter = "getImageUnchecked", tipo = "url"};				
	ctrl.props["optimize"] = {setter = "setOptimize", getter = "getOptimize", tipo = "bool"};	
	ctrl.props["autoChange"] = {setter = "setAutoChange", getter = "getAutoChange", tipo = "bool"};	
	
	ctrl.eves["onChange"] = "";	
	return ctrl;	
end

function gui.newImageCheckBox()
  return gui.fromHandle(_obj_newObject("imageCheckBox"));
end;

guiLoaders["imageCheckBox"] = imageCheckBoxFromHandle;

--[[ Objeto Image ]]--

local function imageFromHandle(handle)
	local image = controlFromHandle(handle);		
	
	function image:getImageURL() return _obj_getProp(self.handle, "URLImagem"); end;
	function image:setImageURL(url) return _obj_setProp(self.handle, "URLImagem", url); end;
	
	function image:getURL() return _obj_getProp(self.handle, "URLImagem"); end;
	function image:setURL(url) return _obj_setProp(self.handle, "URLImagem", url); end;	
	
	function image:getSRC() return _obj_getProp(self.handle, "URLImagem"); end;
	function image:setSRC(src) return _obj_setProp(self.handle, "URLImagem", src); end;		
	
	function image:getShowStyle() return _obj_getProp(self.handle, "ShowStyle"); end;
	function image:setShowStyle(showStyle) return _obj_setProp(self.handle, "ShowStyle", showStyle); end;	

	function image:getStyle() return _obj_getProp(self.handle, "ShowStyle"); end;
	function image:setStyle(style) return _obj_setProp(self.handle, "ShowStyle", style); end;	

	function image:getCenter() return _obj_getProp(self.handle, "Center"); end;
	function image:setCenter(center) return _obj_setProp(self.handle, "Center", center); end;	
	
	function image:getOptimizeQuality() return _obj_getProp(self.handle, "OtimizarDesenho"); end;
	function image:setOptimizeQuality(opt) return _obj_setProp(self.handle, "OtimizarDesenho", opt); end;	
	function image:getOptimize() return _obj_getProp(self.handle, "OtimizarDesenho"); end;
	function image:setOptimize(opt) return _obj_setProp(self.handle, "OtimizarDesenho", opt); end;		
	
	function image:getShowProgress() return _obj_getProp(self.handle, "ExibirProgresso"); end;
	function image:setShowProgress(showProgress) return _obj_setProp(self.handle, "ExibirProgresso", showProgress); end;		
	
	function image:getURLWhileLoading() return _obj_getProp(self.handle, "NoImageURL"); end;
	function image:setURLWhileLoading(url) return _obj_setProp(self.handle, "NoImageURL", url); end;	
	
	function image:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function image:setField(v) _obj_setProp(self.handle, "FieldName", v); end;		
	
	function image:getEditable() return _obj_getProp(self.handle, "Editable"); end;
	function image:setEditable(v) _obj_setProp(self.handle, "Editable", v); end;		
	
	function image:getNaturalWidth() return _obj_getProp(self.handle, "NaturalWidth"); end;
	function image:getNaturalHeight() return _obj_getProp(self.handle, "NaturalHeight"); end;	
	
	image.props["imageURL"] = {setter = "setImageURL", getter="getImageURL", tipo="url"};
	image.props["url"] = {setter = "setURL", getter="getURL", tipo="url"};	
	image.props["src"] = {setter = "setSRC", getter="getSRC", tipo="url"};		
	image.props["URLWhileLoading"] = {setter = "setURLWhileLoading", getter="getURLWhileLoading", tipo="url"};
	
	image.props["showStyle"] = {setter = "setShowStyle", getter="getShowStyle", tipo="enum",
								values = {"proportional", "autoFit", "originalSize", "stretch"}};								
	image.props["style"] = {setter = "setStyle", getter="getStyle", tipo="enum",
								values = {"proportional", "autoFit", "originalSize", "stretch"}};	
	
	image.props["center"] = {setter = "setCenter", getter="getCenter", tipo="bool"};
	image.props["optimizeQuality"] = {setter = "setOptimizeQuality", getter="getOptimizeQuality", tipo="bool"};
	image.props["optimize"] = {setter = "setOptimize", getter="getOptimize", tipo="bool"};	
	image.props["showProgress"] = {setter = "setShowProgress", getter="getShowProgress", tipo="bool"};
	image.props["field"] = {setter = "setField", getter="getField", tipo="string"};	
	image.props["editable"] = {setter = "setEditable", getter="getEditable", tipo="bool"};		
	image.props["naturalAnimated"] = {readProp="NaturalAnimated", tipo="bool"};				
	image.props["naturalWidth"] = {getter="getNaturalWidth", tipo="double"};			
	image.props["naturalHeight"] = {getter="getNaturalHeight", tipo="double"};			
	image.props["animate"] = {readProp="Animate", writeProp="Animate", tipo="bool"};			
	
	image.eves["onPictureLoadedChange"] = "";
	image.eves["onLoad"] = "";	
	
	return image;	
end

function gui.newImage()
  return gui.fromHandle(_obj_newObject("image"));
end;

guiLoaders["image"] = imageFromHandle;


--[[ Objeto Edit ]]--

local function editFromHandle(handle)
	local edit = textControlFromHandle(handle);		
	edit = _addEditablePropsToObject(edit);
	
	function edit:getTextPrompt() return _obj_getProp(self.handle, "TextPrompt"); end;
	function edit:setTextPrompt(text) _obj_setProp(self.handle, "TextPrompt", text); end;
	
	function edit:getTransparent() _obj_getProp(self.handle, "Transparent"); end;
	function edit:setTransparent(transparent) _obj_setProp(self.handle, "Transparent", transparent); end;
			
	function edit:getIsPasswordEdit() return _obj_getProp(self.handle, "Password"); end;
	function edit:setIsPasswordEdit(isPasswordEdit) _obj_setProp(self.handle, "Password", isPasswordEdit); end;
	
	function edit:getKeyboardType() return _obj_getProp(self.handle, "KeyboardType"); end;
	function edit:setKeyboardType(kbtype) _obj_setProp(self.handle, "KeyboardType", kbtype); end;
	
	function edit:getEnterKeyType() return _obj_getProp(self.handle, "ReturnKeyType"); end;
	function edit:setEnterKeyType(enterType) _obj_setProp(self.handle, "ReturnKeyType", enterType); end;
	
	function edit:getField() return _gui_getFieldName(self.handle); end;
	function edit:setField(field) _gui_setFieldName(self.handle, field); end;
			
	function edit:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
	function edit:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
		
	function edit:getType() return _obj_getProp(self.handle, "EditType"); end;
	function edit:setType(v) _obj_setProp(self.handle, "EditType", v) end;		
	
	function edit:getMin() return _obj_getProp(self.handle, "MinValue"); end;
	function edit:setMin(v) _obj_setProp(self.handle, "MinValue", v) end;		
	
	function edit:getMax() return _obj_getProp(self.handle, "MaxValue"); end;
	function edit:setMax(v) _obj_setProp(self.handle, "MaxValue", v) end;		
	
	function edit:getDecimalPlaces() return _obj_getProp(self.handle, "DecimalPlaces"); end;
	function edit:setDecimalPlaces(v) _obj_setProp(self.handle, "DecimalPlaces", v) end;			
	
	function edit:getAsNumber() return _obj_getProp(self.handle, "AsNumber"); end;
	function edit:setAsNumber(v) _obj_setProp(self.handle, "AsNumber", v) end;			
			
	edit.props["textPrompt"] = {setter="setTextPrompt", getter="getTextPrompt", tipo="string"};
	edit.props["transparent"] = {setter="setTransparent", getter="getTransparent", tipo="bool"};	
	edit.props["isPasswordEdit"] = {setter="setIsPasswordEdit", getter="getIsPasswordEdit", tipo="bool"};
	
	edit.props["keyboardType"] = {setter="setKeyboardType", getter="getKeyboardType", tipo="enum",
								  values = {"default", "numbersAndPunctuation", "numberPad",
								            "phonePad", "alphabet", "url", "email"}};
											
	edit.props["enterKeyType"] = {setter="setEnterKeyType", getter="getEnterKeyType", tipo="enum",
								  values = {"default", "done", "go", "next", "search", "send"}};											
											
	edit.props["field"] = {setter="setField", getter="getField", tipo="string"};	
	edit.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};			
	edit.props["type"] = {setter = "setType", getter = "getType", tipo = "enum",
						  values = {"text", "number", "float"}};	
	edit.props["min"] = {setter = "setMin", getter = "getMin", tipo = "double"};								  
	edit.props["max"] = {setter = "setMax", getter = "getMax", tipo = "double"};			
	edit.props["decimalPlaces"] = {setter = "setDecimalPlaces", getter = "getDecimalPlaces", tipo = "int"};			
	edit.props["asNumber"] = {setter = "setAsNumber", getter = "getAsNumber", tipo = "double"};				
	
	edit.eves["onUserChange"] = "";	
	return edit;	
end

function gui.newEdit()
  return gui.fromHandle(_obj_newObject("edit"));
end;

guiLoaders["edit"] = editFromHandle;


--[[ Objeto ComboBox ]]--

local function comboBoxFromHandle(handle)	
	local edit = controlFromHandle(handle);
	edit = _addFontPropertiesToObject(edit);
	edit = _addTextStylePropsToObject(edit);	
		
	function edit:getTransparent() _obj_getProp(self.handle, "Transparent"); end;
	function edit:setTransparent(transparent) _obj_setProp(self.handle, "Transparent", transparent); end;
				
	function edit:getField() return _gui_getFieldName(self.handle); end;
	function edit:setField(field) _gui_setFieldName(self.handle, field); end;
			
	function edit:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
	function edit:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
				
	function edit:getText() return _obj_getProp(self.handle, "Text"); end;
	function edit:setText(v) _obj_setProp(self.handle, "Text", v) end;					
	
	function edit:getValue() return _obj_getProp(self.handle, "Value"); end;
	function edit:setValue(v) _obj_setProp(self.handle, "Value", v) end;						
				
	function edit:getItems() return _obj_getProp(self.handle, "Items"); end;
	function edit:setItems(v) _obj_setProp(self.handle, "Items", v) end;	

	function edit:getValues() return _obj_getProp(self.handle, "Values"); end;
	function edit:setValues(v) _obj_setProp(self.handle, "Values", v) end;	
				
	function edit:dropDown() _obj_invoke(self.handle, "InvokeDropDown"); end;
				
	edit.props["transparent"] = {setter="setTransparent", getter="getTransparent", tipo="bool"};													
	edit.props["field"] = {setter="setField", getter="getField", tipo="string"};	
	edit.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};			
	edit.props["items"] = {setter = "setItems", getter = "getItems", tipo = "table"};				
	edit.props["values"] = {setter = "setValues", getter = "getValues", tipo = "table"};				
	edit.props["text"] = {setter = "setText", getter = "getText", tipo = "string"};				
	edit.props["value"] = {setter = "setValue", getter = "getValue", tipo = "string"};				
	
	edit.eves["onChange"] = "";
	return edit;	
end

function gui.newComboBox()
  return gui.fromHandle(_obj_newObject("comboBox"));
end;

guiLoaders["comboBox"] = comboBoxFromHandle;

--[[ Objeto ColorComboBox ]]--

local function colorComboBoxFromHandle(handle)	
	local edit = controlFromHandle(handle);
		
	function edit:getColor() return _obj_getProp(self.handle, "Color"); end;
	function edit:setColor(v) _obj_setProp(self.handle, "Color", v); end;
	
	function edit:getUseAlpha() return _obj_getProp(self.handle, "UseAlpha"); end;
	function edit:setUseAlpha(v) _obj_setProp(self.handle, "UseAlpha", v); end;	
				
	function edit:getField() return _gui_getFieldName(self.handle); end;
	function edit:setField(field) _gui_setFieldName(self.handle, field); end;
			
	function edit:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
	function edit:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
					
	function edit:dropDown() _obj_invoke(self.handle, "InvokeDropDown"); end;
				
	edit.props["color"] = {setter="setColor", getter="getColor", tipo="color"};													
	edit.props["useAlpha"] = {setter = "setUseAlpha", getter = "getUseAlpha", tipo = "bool"};				
	edit.props["field"] = {setter="setField", getter="getField", tipo="string"};	
	edit.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};				
	
	
	edit.eves["onChange"] = "";
	edit.eves["onUserChange"] = "";
	return edit;	
end

function gui.newColorComboBox()
  return gui.fromHandle(_obj_newObject("colorComboBox"));
end;

guiLoaders["colorComboBox"] = colorComboBoxFromHandle;


--[[ Objeto TextEditor ]]--

local function textEditorFromHandle(handle)
	local editor = textControlFromHandle(handle);	
	editor = _addEditablePropsToObject(editor);
		
	function editor:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function editor:setField(v) _obj_setProp(self.handle, "FieldName", v); end;
	
	function editor:getTransparent() return _obj_getProp(self.handle, "Transparent"); end;
	function editor:setTransparent(v) _obj_setProp(self.handle, "Transparent", v); end;	
		
	editor.props["field"] = {setter="setField", getter="getField", tipo="string"};		
	editor.props["transparent"] = {setter="setTransparent", getter="getTransparent", tipo="bool"};	
	return editor;	
end

function gui.newTextEditor()
  return gui.fromHandle(_obj_newObject("textEditor"));
end;

guiLoaders["textEditor"] = textEditorFromHandle;

--[[ Objeto TabControl ]]--

local function tabControlFromHandle(handle)
	local ctrl = controlFromHandle(handle);	
		
	function ctrl:getTabIndex() return _obj_getProp(self.handle, "TabIndex"); end;
	function ctrl:setTabIndex(idx) _obj_setProp(self.handle, "TabIndex", idx); end;
		
	ctrl.props["tabIndex"] = {setter="setTabIndex", getter="getTabIndex", tipo="int"};			
	return ctrl;	
end

function gui.newTabControl()
  return gui.fromHandle(_obj_newObject("tabControl"));
end;

guiLoaders["tabControl"] = tabControlFromHandle;

--[[ Objeto Tab / TabItem ]]--

local function tabItemFromHandle(handle)
	local ctrl = controlFromHandle(handle);	
		
	function ctrl:getText() return _obj_getProp(self.handle, "Title"); end;
	function ctrl:setText(text) _obj_setProp(self.handle, "Title", text); end;
	
	function ctrl:getTitle() return _obj_getProp(self.handle, "Title"); end;
	function ctrl:setTitle(title) _obj_setProp(self.handle, "Title", title); end;	
	function ctrl:activate() _obj_invoke(self.handle, "Activate"); end;		
	
	ctrl.props["text"] = {setter="setText", getter="getText", tipo="string"};
	ctrl.props["title"] = {setter="setTitle", getter="getTitle", tipo="string"};
					
	return ctrl;	
end

function gui.newTabItemControl()
  return gui.fromHandle(_obj_newObject("tab"));
end;

function gui.newTab()
  return gui.newTabItemControl();
end;

guiLoaders["tab"] = tabItemFromHandle;

--[[ Objeto ScrollBox ]]--

local function scrollBoxFromHandle(handle)
	local ctrl = controlFromHandle(handle);	
					
	return ctrl;	
end

function gui.newScrollBox()
  return gui.fromHandle(_obj_newObject("scrollBox"));
end;

guiLoaders["scrollBox"] = scrollBoxFromHandle;

--[[ Objeto Shape ]]--

local function shapeFromHandle(handle)
	local ctrl = controlFromHandle(handle);	
					
	function ctrl:getColor() return _obj_getProp(self.handle, "Fill.Color"); end;
	function ctrl:setColor(color) _gui_shapeSetFillColor(self.handle, color); end;
	
	function ctrl:getStrokeColor() return _obj_getProp(self.handle, "Stroke.Color"); end;
	function ctrl:setStrokeColor(color) _gui_shapeSetStrokeColor(self.handle, color); end;
	
	function ctrl:getStrokeSize() return _obj_getProp(self.handle, "Stroke.Thickness"); end;
	function ctrl:setStrokeSize(size) _gui_shapeSetStrokeSize(self.handle, size); end;	
	
	function ctrl:getStrokeCap() return _obj_getProp(self.handle, "Stroke.Cap"); end;
	function ctrl:setStrokeCap(v) _gui_shapeSetStrokeCap(self.handle, v); end;		
	
	function ctrl:getStrokeJoin() return _obj_getProp(self.handle, "Stroke.Join"); end;
	function ctrl:setStrokeJoin(v) _gui_shapeSetStrokeCap(self.handle, v); end;			
	
	function ctrl:getStrokeDash() return _obj_getProp(self.handle, "Stroke.Dash"); end;
	function ctrl:setStrokeDash(v) _gui_shapeSetStrokeCap(self.handle, v); end;	
	
	ctrl.props["color"] = {setter="setColor", getter="getColor", tipo="color"};
	ctrl.props["strokeColor"] = {setter="setStrokeColor", getter="getStrokeColor", tipo="color"};
	ctrl.props["strokeSize"] = {setter="setStrokeSize", getter="getStrokeSize", tipo="double"};	
	
	ctrl.props["strokeCap"] = {setter="setStrokeCap", getter="getStrokeCap", tipo="enum",
							   values={"flat", "round"}};		
							   
	ctrl.props["strokeJoin"] = {setter="setStrokeJoin", getter="getStrokeJoin", tipo="enum",
							   values={"miter", "round", "bevel"}};

	ctrl.props["strokeDash"] = {setter="setStrokeDash", getter="getStrokeDash", tipo="enum",
							   values={"solid", "dash", "dot", "dashDot", "dashDotDot"}};		
		
	return ctrl;	
end

--[[ Objeto Rectangle ]]--

local function rectangleFromHandle(handle)
	local ctrl = shapeFromHandle(handle);	
		
	function ctrl:getCorners() return _obj_getProp(self.handle, "Corners"); end;
	function ctrl:setCorners(corners) _obj_setProp(self.handle, "Corners", corners); end;
	
	function ctrl:getCornerType() return _obj_getProp(self.handle, "CornerType"); end;
	function ctrl:setCornerType(cornerType) _obj_setProp(self.handle, "CornerType", cornerType); end;
	
	function ctrl:getSides() return _obj_getProp(self.handle, "CornerType"); end;
	function ctrl:setSides(sides) _obj_setProp(self.handle, "Sides", sides); end;	
	
	function ctrl:getXradius() return _obj_getProp(self.handle, "XRadius"); end;
	function ctrl:setXradius(xradius) _obj_setProp(self.handle, "XRadius", xradius); end;		
	
	function ctrl:getYradius() return _obj_getProp(self.handle, "YRadius"); end;
	function ctrl:setYradius(yradius) _obj_setProp(self.handle, "YRadius", yradius); end;			
				
	ctrl.props["corners"] = {setter="setCorners", getter="getCorners", tipo="set", 
							 values={"topLeft", "topRight", "bottomLeft", "bottomRight"}};
	
	ctrl.props["cornerType"] = {setter="setCornerType", getter="getCornerType", tipo="enum", 
							    values={"round", "bevel", "innerRound", "innerLine"}};
								
	ctrl.props["sides"] = {setter="setSides", getter="getSides", tipo="set", 
						   values={"top", "left", "bottom", "right"}};		
						   
	ctrl.props["xradius"] = {setter="setXradius", getter="getXradius", tipo="double"};						   
	ctrl.props["yradius"] = {setter="setYradius", getter="getYradius", tipo="double"};						   							 				
	return ctrl;	
end

function gui.newRectangle()
  return gui.fromHandle(_obj_newObject("rectangle"));
end;

guiLoaders["rectangle"] = rectangleFromHandle;

--[[ Objeto Path ]]--

local function pathFromHandle(handle)
	local ctrl = shapeFromHandle(handle);	
		
	function ctrl:getPathData() return _obj_getProp(self.handle, "PathData"); end;
	function ctrl:setPathData(v) _obj_setProp(self.handle, "PathData", v); end;
	
	function ctrl:getMode() return _obj_getProp(self.handle, "WrapMode"); end;
	function ctrl:setMode(v) _obj_setProp(self.handle, "WrapMode", v); end;	
	
	function ctrl:getRoundToPixel() return _obj_getProp(self.handle, "RoundToPixels"); end;
	function ctrl:setRoundToPixel(v) _obj_setProp(self.handle, "RoundToPixels", v); end;		
									   
	ctrl.props["data"] = {setter="setPathData", getter="getPathData", tipo="string"};						   
	ctrl.props["pathData"] = ctrl.props["data"];
	
	ctrl.props["mode"] = {setter="setMode", getter="getMode", tipo="enum",
						  values={"original", "fit", "stretch", "tile"}};						   							 				
	ctrl.props["wrapMode"] = ctrl.props["mode"];					   							 										  
	ctrl.props["roundToPixel"] = {setter="setRoundToPixel", getter="getRoundToPixel", tipo="bool"};						   							 					
	return ctrl;	
end

function gui.newPath()
  return gui.fromHandle(_obj_newObject("path"));
end;

guiLoaders["path"] = pathFromHandle;

--[[ Objeto HorzLine ]]--

local function horzLineFromHandle(handle)
	local ctrl = shapeFromHandle(handle);						   							 				
	return ctrl;	
end

function gui.newHorzLine()
  return gui.fromHandle(_obj_newObject("horzLine"));
end;

guiLoaders["horzLine"] = horzLineFromHandle;


--[[ Objeto Frame ]]--

local function frameFromHandle(handle)
	local ctrl = layoutFromHandle(handle);	
		
	function ctrl:getURL() return _obj_getProp(self.handle, "FrameURL"); end;
	function ctrl:setURL(url) _obj_setProp(self.handle, "FrameURL", url); end;			
	
	function ctrl:getFrameStyle() return _obj_getProp(self.handle, "FrameURL"); end;
	function ctrl:setFrameStyle(frameStyle) _obj_setProp(self.handle, "FrameURL", frameStyle); end;				
	
	function ctrl:getSrc() return _obj_getProp(self.handle, "FrameURL"); end;
	function ctrl:setSrc(url) _obj_setProp(self.handle, "FrameURL", url); end;					
					

	ctrl.props["url"] = {setter="setURL", getter="getURL", tipo="url"};
	ctrl.props["frameStyle"] = {setter="setFrameStyle", getter="getFrameStyle", tipo="url"};	
	ctrl.props["src"] = {setter="setSrc", getter="getSrc", tipo="url"};		
	return ctrl;	
end

function gui.newFrame()
  return gui.fromHandle(_obj_newObject("frame"));
end;

guiLoaders["frame"] = frameFromHandle;


--[[ Objeto DataLink ]]--

local function dataLinkFromHandle(handle)
	local ctrl = objs.hierarchyObjectFromHandle(handle);		
	
	function ctrl:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function ctrl:setField(v) return _obj_setProp(self.handle, "FieldName", v); end;
	
	function ctrl:getFields() return _obj_getProp(self.handle, "Fields"); end;
	function ctrl:setFields(v) return _obj_setProp(self.handle, "Fields", v); end;	
	
	function ctrl:getDefaultValue() return _obj_getProp(self.handle, "DefaultValue"); end;
	function ctrl:setDefaultValue(v) return _obj_setProp(self.handle, "DefaultValue", v); end;		
	
	function ctrl:getDefaultValues() return _obj_getProp(self.handle, "DefaultValues"); end;
	function ctrl:setDefaultValues(v) return _obj_setProp(self.handle, "DefaultValues", v); end;			
	
	function ctrl:beginUpdate() end;
	function ctrl:endUpdate() end;
					
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
	ctrl.props["fields"] = {setter = "setFields", getter = "getFields", tipo = "table"};			
	ctrl.props["defaultValue"] = {setter = "setDefaultValue", getter = "getDefaultValue", tipo = "string"};		
	ctrl.props["defaultValues"] = {setter = "setDefaultValues", getter = "getDefaultValues", tipo = "table"};			
	
	ctrl.eves["onChange"] = "field, oldValue, newValue";
	ctrl.eves["onPersistedChange"] = "field, oldValue, newValue";		
	ctrl.eves["onUserChange"] = "field, oldValue, newValue";	
	ctrl.eves["onChildAdded"] = "node";
	ctrl.eves["onChildRemoved"] = "node";
	return ctrl;	
end

function gui.newDataLink()
  return gui.fromHandle(_obj_newObject("dataLink"));
end;

guiLoaders["dataLink"] = dataLinkFromHandle;


--[[ Objeto Record List ]]--

local function recordListFromHandle(handle)
	local ctrl = layoutFromHandle(handle);
	
	function ctrl:getField() return _obj_getProp(self.handle, "FieldName"); end;
	function ctrl:setField(v) _obj_setProp(self.handle, "FieldName", v) end;		
	
	function ctrl:getItemHeight() return _obj_getProp(self.handle, "ItemHeight"); end;
	function ctrl:setItemHeight(v) _obj_setProp(self.handle, "ItemHeight", v) end;			
	
	function ctrl:getMinHeight() return _obj_getProp(self.handle, "MinHeight"); end;
	function ctrl:setMinHeight(v) _obj_setProp(self.handle, "MinHeight", v) end;		
	
	function ctrl:getMinQt() return _obj_getProp(self.handle, "MinQt"); end;
	function ctrl:setMinQt(v) _obj_setProp(self.handle, "MinQt", v) end;			
	
	function ctrl:getAutoHeight() return _obj_getProp(self.handle, "AutoHeight"); end;
	function ctrl:setAutoHeight(v) _obj_setProp(self.handle, "AutoHeight", v) end;			
	
	function ctrl:getTemplateForm() return _obj_getProp(self.handle, "TemplateForm"); end;
	function ctrl:setTemplateForm(v) _obj_setProp(self.handle, "TemplateForm", v); end;			
	
	function ctrl:getLayout() return _obj_getProp(self.handle, "RecordListLayout"); end;
	function ctrl:setLayout(v) _obj_setProp(self.handle, "RecordListLayout", v); end;	
	
	function ctrl:getSelectable() return _obj_getProp(self.handle, "SelectableList"); end;
	function ctrl:setSelectable(v) _obj_setProp(self.handle, "SelectableList", v); end;	
	
	function ctrl:append() return ndb.openNodeFacade(_obj_invokeEx(self.handle, "AppendItemEx")); end;
	
	function ctrl:getSelectedNode() return ndb.openNodeFacade(_gui_recordListGetSelectedNodeHandle(self.handle)); end;	
	function ctrl:setSelectedNode(node) _gui_recordListSetSelectedNodeHandle(self.handle, ndb.getNodeHandle(node)); end;

	function ctrl:getSelectedForm() return objs.tryFindFromHandle(_gui_recordListGetSelectedFormHandle(self.handle)); end;
	
	function ctrl:scrollToNode(node) _gui_recordListScrollToNodeHandle(self.handle, ndb.getNodeHandle(node)); end;
	function ctrl:sort() _obj_invoke(self.handle, "ReorganizarItens"); end;
	
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
	ctrl.props["templateForm"] = {setter = "setTemplateForm", getter = "getTemplateForm", tipo = "string"};				
	ctrl.props["itemHeight"] = {setter = "setItemHeight", getter = "getItemHeight", tipo = "double"};					
	ctrl.props["minHeight"] = {setter = "setMinHeight", getter = "getMinHeight", tipo = "double"};						
	ctrl.props["autoHeight"] = {setter = "setAutoHeight", getter = "getAutoHeight", tipo = "bool"};		
	ctrl.props["minQt"] = {setter = "setMinQt", getter = "getMinQt", tipo = "int"};		
	ctrl.props["layout"] = {setter = "setLayout", getter = "getLayout", tipo = "enum",
							values = {"vertical", "horizontal", "horizontalTiles", "verticalTiles"}};			
	ctrl.props["selectable"] = {setter = "setSelectable", getter = "getSelectable", tipo = "bool"};		
	
	ctrl.props["selectedNode"] = {getter = "getSelectedNode", setter="setSelectedNode", tipo = "table"};		
	ctrl.props["selectedForm"] = {getter = "getSelectedForm", tipo = "table"};		

	ctrl.eves["onSelect"] = "";
	ctrl.eves["onBeginEnumeration"] = "";
	ctrl.eves["onItemAdded"] = "node, form";
	ctrl.eves["onItemRemoved"] = "node, form";
	ctrl.eves["onEndEnumeration"] = "";
	ctrl.eves["onCompare"] = "nodeA, nodeB";
	return ctrl;	
end

function gui.newRecordList()
  return gui.fromHandle(_obj_newObject("recordList"));
end;

guiLoaders["recordList"] = recordListFromHandle;


--[[ Objeto DataScopeBox ]]--

local function dataScopeBoxFromHandle(handle)
	local ctrl = layoutFromHandle(handle);
	
	function ctrl:getNodeObject() return rawget(self, "__nodeObject"); end;
	
	function ctrl:setNodeObject(nodeObject) 
		rawset(self, "__nodeObject", nodeObject);
		_gui_assignNodeObject(self.handle, ndb.getNodeHandle(nodeObject));
	end;	
	
	ctrl.props["scopeNode"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};		
	ctrl.props["nodeObject"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};		
	ctrl.props["node"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};		
	
	if ctrl.eves == nil then
		ctrl.eves = {};
	end;
	
	ctrl.eves["onNodeReady"] = "";
	ctrl.eves["onNodeUnready"] = "";
	ctrl.eves["onNodeChanged"] = "";
	
	return ctrl;	
end

function gui.newDataScopeBox()
  return gui.fromHandle(_obj_newObject("dataScopeBox"));
end;

guiLoaders["dataScopeBox"] = dataScopeBoxFromHandle;

--[[ Objeto RichEdit ]]--

local function richEditFromHandle(handle)
	local ctrl = controlFromHandle(handle);
	
	function ctrl:getField() return _gui_getFieldName(self.handle); end;
	function ctrl:setField(v) _gui_setFieldName(self.handle, v); end;	
	
		
	ctrl.props["animateImages"] = {readProp = "CanAnimateImages", writeProp = "CanAnimateImages", tipo = "bool"};			
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
	ctrl.props["backgroundColor"] = {readProp = "BackgroundColor", writeProp = "BackgroundColor", tipo = "color"};
	ctrl.props["defaultFontColor"] = {readProp = "DefaultFontColor", writeProp = "DefaultFontColor", tipo = "color"};
	ctrl.props["defaultFontSize"] = {readProp = "DefaultFontSize", writeProp = "DefaultFontSize", tipo = "double"};	
	ctrl.props["showToolbar"] = {readProp = "ShowToolbar", writeProp = "ShowToolbar", tipo = "bool"};
	ctrl.props["readOnly"] = {readProp = "ReadOnly", writeProp = "ReadOnly", tipo = "bool"};
	ctrl.props["hideSelection"] = {readProp = "HideSelectionNoFocus", writeProp = "HideSelectionNoFocus", tipo = "bool"};	
	return ctrl;	
end

function gui.newRichEdit()
  return gui.fromHandle(_obj_newObject("richEdit"));
end;

guiLoaders["richEdit"] = richEditFromHandle;


--[[ Objeto Popup ]]--

local function popupFromHandle(handle)
	local ctrl = layoutFromHandle(handle);
	
	function ctrl:getCancelable() return _obj_getProp(self.handle, "Cancelavel"); end;
	function ctrl:setCancelable(v) _obj_setProp(self.handle, "Cancelavel", v) end;		
	
	function ctrl:getBackOpacity() return _obj_getProp(self.handle, "BackOpacity"); end;
	function ctrl:setBackOpacity(v) _obj_setProp(self.handle, "BackOpacity", v) end;			
	
	function ctrl:getDrawContainer() return _obj_getProp(self.handle, "DesenharPopupContainer"); end;
	function ctrl:setDrawContainer(v) _obj_setProp(self.handle, "DesenharPopupContainer", v) end;			
	
	function ctrl:setNodeObject(nodeObject) 
		rawset(self, "nodeObject", nodeObject);
		_gui_assignNodeObject(self.handle, ndb.getNodeHandle(nodeObject));
	end;
	
	function ctrl:getNodeObject() return rawget(self, "nodeObject") end;	
	
	function ctrl:showPopupEx(placement, control)
		if type(placement) ~= "string" then
			placement = "center";
		end;
	
		_obj_setProp(self.handle, "Placement", placement);
		
		if (type(control) == "table") and (control.handle ~= nil) then
			_obj_setProp(self.handle, "TargetControlHandle", control.handle);
		else
			_obj_setProp(self.handle, "TargetControlHandle", 0);
		end;
		
		_obj_invoke(self.handle, "ExibirPopup"); 
	end;
	
	ctrl.show = ctrl.showPopupEx;
	ctrl.showPopup = ctrl.showPopupEx;
	
	function ctrl:closePopup(cancelar, forcar) _obj_invoke(self.handle, "FecharPopup", cancelar == true, forcar == true); end;
	function ctrl:close(cancelar, forcar) _obj_invoke(self.handle, "FecharPopup", cancelar == true, forcar == true); end;
	
	ctrl.props["cancelable"] = {setter = "setCancelable", getter = "getCancelable", tipo = "bool"};		
	ctrl.props["backOpacity"] = {setter = "setBackOpacity", getter = "getBackOpacity", tipo = "double"};			
	ctrl.props["drawContainer"] = {setter = "setDrawContainer", getter = "getDrawContainer", tipo = "bool"};				
	ctrl.props["scopeNode"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};					
	ctrl.props["nodeObject"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};					
	ctrl.props["node"] = ctrl.props["nodeObject"];
	ctrl.props["scopeNode"] = ctrl.props["nodeObject"];
	ctrl.props["autoScopeNode"] = {writeProp = "AutoScopeNode", readProp = "AutoScopeNode", tipo = "bool"};

	ctrl.eves["onClose"] = "canceled";	
	ctrl.eves["onCanClose"] = "canceled";
	ctrl.eves["onCalculateSize"] = "dueToResize, width, height";
	
	ctrl.eves["onNodeReady"] = "";
	ctrl.eves["onNodeUnready"] = "";
	ctrl.eves["onNodeChanged"] = "";	
	return ctrl;	
end

function gui.newPopup()
  return gui.fromHandle(_obj_newObject("popup"));
end;

guiLoaders["popup"] = popupFromHandle;


--[[ Objeto Progress Bar ]]--

local function progressBarFromHandle(handle)
	local ctrl = controlFromHandle(handle);
	
	function ctrl:getColor() return _obj_getProp(self.handle, "Color"); end;
	function ctrl:setColor(v) _obj_setProp(self.handle, "Color", v) end;		
	
	function ctrl:getPosition() return _obj_getProp(self.handle, "Value"); end;
	function ctrl:setPosition(v) _obj_setProp(self.handle, "Value", v) end;		
	
	function ctrl:getMin() return _obj_getProp(self.handle, "Min"); end;
	function ctrl:setMin(v) _obj_setProp(self.handle, "Min", v) end;			
	
	function ctrl:getMax() return _obj_getProp(self.handle, "Max"); end;
	function ctrl:setMax(v) _obj_setProp(self.handle, "Max", v) end;				
	
	function ctrl:getField() return _obj_getProp(self.handle, "Field"); end;
	function ctrl:setField(v) _obj_setProp(self.handle, "Field", v); end;			
	
	function ctrl:getFieldMin() return _obj_getProp(self.handle, "FieldMin"); end;
	function ctrl:setFieldMin(v) _obj_setProp(self.handle, "FieldMin", v); end;		
	
	function ctrl:getFieldMax() return _obj_getProp(self.handle, "FieldMax"); end;
	function ctrl:setFieldMax(v) _obj_setProp(self.handle, "FieldMax", v); end;			
	
	function ctrl:getMouseGlow() return _obj_getProp(self.handle, "MouseGlow"); end;
	function ctrl:setMouseGlow(v) _obj_setProp(self.handle, "MouseGlow", v); end;				
	
	function ctrl:getColorMode() return _obj_getProp(self.handle, "ColorMode"); end;
	function ctrl:setColorMode(v) _obj_setProp(self.handle, "ColorMode", v); end;		
	
	ctrl.props["color"] = {setter = "setColor", getter = "getColor", tipo = "color"};		
	ctrl.props["position"] = {setter = "setPosition", getter = "getPosition", tipo = "double"};	
    ctrl.props["value"] = {setter = "setPosition", getter = "getPosition", tipo = "double"};		
	ctrl.props["min"] = {setter = "setMin", getter = "getMin", tipo = "double"};		
	ctrl.props["max"] = {setter = "setMax", getter = "getMax", tipo = "double"};			
	ctrl.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
	ctrl.props["fieldMin"] = {setter = "setFieldMin", getter = "getFieldMin", tipo = "string"};		
	ctrl.props["fieldMax"] = {setter = "setFieldMax", getter = "getFieldMax", tipo = "string"};			
	ctrl.props["mouseGlow"] = {setter = "setMouseGlow", getter = "getMouseGlow", tipo = "bool"};	
	ctrl.props["colorMode"] = {setter = "setColorMode", getter = "getColorMode", tipo = "enum", values={"default", "hl"}};		
	return ctrl;	
end

function gui.newProgressBar()
  return gui.fromHandle(_obj_newObject("progressBar"));
end;

guiLoaders["progressBar"] = progressBarFromHandle;

--[[ Objeto Timer ]]--

local function timerFromHandle(handle)
	return objs.__timerFromHandle(handle);
end

function gui.newTimer()
  return gui.fromHandle(_obj_newObject("timer"));
end;

guiLoaders["timer"] = timerFromHandle;


--[[ Objeto ActivityIndicator ]]--

local function activityIndicatorFromHandle(handle)
	local ctrl = controlFromHandle(handle);
	
	return ctrl;	
end

function gui.newActivityIndicator()
  return gui.fromHandle(_obj_newObject("activityIndicator"));
end;

guiLoaders["activityIndicator"] = activityIndicatorFromHandle;

--[[ Objeto InertialMovement ]]--

local __inertMovProps = {active = {tipo = "boolean", readProp = "Active", writeProp="Active"},
						 animated = {tipo = "boolean", readProp = "Animated", writeProp="Animated"},
						 decelerationRate = {tipo = "double", readProp = "DecelerationRate", writeProp="DecelerationRate"}
						 };
						 
local __inertMovMethods = 
						{
							setPos = function(m, x, y) _obj_invoke(m.handle, "SetPosition", x, y);	end,
							getPos = function (m) return _obj_invokeEx(m.handle, "ExGetPosition"); end,
							setBounds = function (m, minX, minY, maxX, maxY) _obj_invoke(m.handle, "SetBounds", minX, minY, maxX, maxY); end,
							pointerDown = function(m, x, y) _obj_invoke(m.handle, "PointerDown", x, y) end,
							pointerMove = function(m, x, y) _obj_invoke(m.handle, "PointerMove", x, y) end,
							pointerUp = function(m, x, y) _obj_invoke(m.handle, "PointerUp", x, y) end,
							pointerLeave = function(m) _obj_invoke(m.handle, "PointerLeave") end,
							pointerWheel = function(m, deltaX, deltaY) _obj_invoke(m.handle, "PointerWheel", deltaX, deltaY) end							
						};
								
local __inertMovEvents = {onChange = ""};	

local function inertialMovementFromHandle(handle)
	local obj = objs.objectFromHandle(handle);
	
	if obj.props == nil then
		obj.props = {};
	end;
	
	for k, v in pairs(__inertMovProps) do
		obj.props[k] = v;
	end;
	
	for k, v in pairs(__inertMovMethods) do
		rawset(obj, k, v);		
	end;	
	
	obj.eves = __inertMovEvents;		
	return obj;
end

function gui.newInertialMovement()
  return gui.fromHandle(_obj_newObject("TInertialMovement"));
end;

guiLoaders["TInertialMovement"] = inertialMovementFromHandle;


--[[ Objeto Drag n Drop ]]--

local Serializer = nil;

local __DragDropDataProps = {dataCount = {tipo = "int", readProp = "DataCount"}};

local __DragDropDataMethods = 
						{
							addData = function(d, dataType, dataValue)
										_obj_invokeEx(d.handle, "AddData", dataType, Serializer.packData(dataValue));	
									end,

							getData = function(d, dataType)
										return Serializer.unpackData(_obj_invokeEx(d.handle, "GetData", dataType));	
									end		
						};

local __DragProps = {actionCount = {tipo = "int", readProp = "ActionCount"}};
						 
local __DragMethods = 
						{
							addAction = function(d, dataType, callback) 
								if type(callback) == "function" then
									_gui_addDragAction(d.handle, dataType, callback);
								end;
							end	
						};
								
local __DragEvents = {};	

local __DropProps = {actionCount = {tipo = "int", readProp = "ActionCount"}};
						 
local __DropMethods = 
						{
							addAction = function(d, dataType, callback) 
								if type(callback) == "function" then
									_gui_addDropAction(d.handle, dataType, callback);
								end;
							end							
						};
								
local __DropEvents = {};	

local function dragDropDataObjectFromHandle(handle)
	if Serializer == nil then
		Serializer = require("utils.serializer.dlua");
	end;

	local obj = objs.objectFromHandle(handle);
	
	if obj.props == nil then
		obj.props = {};
	end;
	
	for k, v in pairs(__DragDropDataProps) do
		obj.props[k] = v;
	end;
	
	for k, v in pairs(__DragDropDataMethods) do
		rawset(obj, k, v);		
	end;	
		
	return obj;
end;

local function dragObjectFromHandle(handle)
	local obj = dragDropDataObjectFromHandle(handle);
		
	for k, v in pairs(__DragProps) do
		obj.props[k] = v;
	end;
	
	for k, v in pairs(__DragMethods) do
		rawset(obj, k, v);		
	end;	
	
	obj.eves = __DragEvents;		
	return obj;
end

function gui.newDrag()
  return gui.fromHandle(_obj_newObject("TDragObject"));
end;

guiLoaders["TDragObject"] = dragObjectFromHandle;

local function dropObjectFromHandle(handle)
	local obj = dragDropDataObjectFromHandle(handle);
		
	for k, v in pairs(__DropProps) do
		obj.props[k] = v;
	end;
	
	for k, v in pairs(__DropMethods) do
		rawset(obj, k, v);		
	end;	
	
	obj.eves = __DropEvents;		
	return obj;
end

function gui.newDrop()
  return gui.fromHandle(_obj_newObject("TDropObject"));
end;

guiLoaders["TDropObject"] = dropObjectFromHandle;

function __export__guiInitDropObject(dropUserData)
	local d = gui.newDrop();
	_gui_initDragDropDataObject(d.handle, dropUserData);
	return d;
end;

function __export__guiInitDragObject(dragUserData)
	local d = gui.newDrag();
	_gui_initDragDropDataObject(d.handle, dragUserData);
	return d;
end;

--[[ API gui ]]--

function gui.fromHandle(handle)
  if (handle == nil) then
  	return nil;
  end
   
  local ctrl = objs.tryFindFromHandle(handle);
 
  if (ctrl ~= nil) then
    return ctrl;
  end;
  
  local className = _obj_getClassName(handle);
 
  if (className == nil) then
 	return nil;
  end;
 
  local loader = guiLoaders[className];
 
  if (loader ~= nil) then
 	ctrl = loader(handle);
  else
 	ctrl = controlFromHandle(handle);
  end
 
  objs.registerHandle(handle, ctrl);
  return ctrl;
end;

function _export_gui_fromHandle(handle)
	return gui.fromHandle(handle);
end;

function gui.findControlByName(controlName, referenceControl)
	local parentMost;
	local p;

	if (type(referenceControl) ~= "table") or (referenceControl.handle == nil) then
		return nil;
	end;
	
	local child;
	
	child = referenceControl:findChildByName(controlName, true);
	
	if child ~= nil then
		return child;
	end;
	
	-- Else, vamos ir ate a RAIZ procurar a partir dela o objeto sem fazer analise recursiva
	
	parentMost = nil;
	p = referenceControl;
	
	while p ~= nil do
		if (type(p) == "table") and (p.findChildByName ~= nil) then
			parentMost = p;					
			child = parentMost:findChildByName(controlName, false, true); -- não fazer analise recursiva neste ponto ainda
			
			if child ~= nil then
				return child;
			end;
		end;	
	
		p = p:getParent();			
	end;
	
	if parentMost == nil then
		return nil;
	elseif parentMost.name == controlName then
		return parentMost;
	end;
	
	return parentMost:findChildByName(controlName, true);
end;

findControlByName = gui.findControlByName; 

function gui.newForm(formName)
  if (formName == nil) then
	return gui.newFormLayout();
  end;
 
  if (type(formName) == "string" and (rrpg ~= nil)) then
	  local formFactory = rrpg.forms[formName];
	  
	  if formFactory ~= nil then
		local frm = formFactory.newEditor();
		rawset(frm, "__formName", formName);			
		return frm;
	  else
		error("Form name not found: '" .. formName .. "'");
	  end;
  end;
  
  return nil;
end;

function gui.newPopupForm(formName)
  if (formName == nil) then
	return gui.fromHandle(_obj_newObject("popupForm"));
  end;
 
  if (type(formName) == "string" and (rrpg ~= nil)) then
	  local formFactory = rrpg.forms[formName];
	  
	  if (formFactory ~= nil) and (formFactory.formComponentName == "popupForm") then
		local frm = formFactory.newEditor();
		rawset(frm, "__formName", formName);			
		return frm;
	  else
		error("PopupForm name not found: '" .. formName .. "'");	
	  end;
  end;  
  
  return nil;
end;

local function formParameterToObjectForm(form)
	local retorno = nil;
	
	if (type(form) == "string") then
		retorno = gui.newForm(form);
	elseif (type(form) == "table") then
		local handle = rawget(form, "handle");
		
		if (handle ~= nil) and (rawget(form, "__isFormFlag")) then
			retorno = form;
		end;
	end;
	
	return retorno;
end;

local _popupFormShowers = {};
setmetatable(_popupFormShowers, {__mode="k"});  -- popupFormShowers possui chaves weak-reference

function gui.showPopup(form, options)
	if (form == nil) then
		error("invalid parameter - form is nil");
		return false;
	end;

	if type(options) ~= "table" then
		options = {};
	end;
	
	options.placement = options.placement or "center";	
	form = formParameterToObjectForm(form);
	
	if (form == nil) then
		return false;
	end;
		
	local popupShower = _popupFormShowers[form];
	
	if popupShower == nil then		
		popupShower = rrpgObjs.componentFromHandle(_obj_newObject('TLuaFiremonkeyPopupShower'));
		rrpgObjs.registerHandle(popupShower.handle, popupShower);
		_popupFormShowers[form] = popupShower;
		
		_obj_invoke(popupShower.handle, "SetFormHandle", form.handle);
	end;
	
	local closeListenerId = rawget(popupShower, "__closeListenerID");
	
	if closeListenerId ~= nil then
		popupShower:removeEventListener(closeListenerId);
		rawset(popupShower, "__closeListenerID", nil);
	end;
	
	if type(options.onClose) == "function" then
		closeListenerId = popupShower:addEventListener("OnPopupClose", options.onClose);
		rawset(popupShower, "__closeListenerID", closeListenerId);		
	end;
	
	_obj_setProp(popupShower.handle, "PopupPlacement", options.placement);	
	return _obj_invoke(popupShower.handle, "Show");
end;

function gui.closePopup(form)
	if type(form) == "table" then
		for k, v in pairs(_popupFormShowers) do
			if k == form then
				return _obj_invoke(v.handle, "Close");
			end;
		end;
	elseif type(form) == "string" then
		local fechouAlgum = false;
	
		for k, v in pairs(_popupFormShowers) do
			if (type(k) == "table") and (k.name == form) then
				fechouAlgum = fechouAlgum or _obj_invoke(v.handle, "Close");
			end;
		end;		
		
		return fechouAlgum;
	else
		return false;
	end;
end;

function gui.openInBrowser(url)
	if type(url) == "string" then
		local achado = url:find("https?://"); 
		
		if achado ~= 1 then
			url = "http://" .. url;
		end;
		
		return _gui_openInBrowser(url);	
	end;
end;

return gui;
