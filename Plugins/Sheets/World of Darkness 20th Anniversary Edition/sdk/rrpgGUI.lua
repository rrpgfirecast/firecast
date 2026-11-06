local objs = require("rrpgObjs.lua");
local ndb = require("ndb.lua");
local System = require("system.lua");
local Async = require("async.lua");
local Utils = require("utils.lua");

local __delayedGridLib = nil;

gui = objs.objectFromHandle(_obj_newObject("TLuaGUIServices"));
GUI = gui;

gui.DEFAULT_FORM_CACHE_TIMEOUT = 60000;

local guiLoaders = {};
local guiClasses = {};

gui.guiLoaders = guiLoaders;
gui.guiClasses = guiClasses;

local function registerTag(class, tagName)
	assert(guiClasses[tagName] == nil, tagName);	
	assert(rawget(class, "tagName") == nil, tagName);

	guiLoaders[tagName] = class.fromHandle;
	guiClasses[tagName] = class;
	
	rawset(class, "tagName", tagName);		
	
	rawset(class, "new", 
		function()
			return class.fromHandle(_obj_newObject(tagName));						
		end);
	
	local constructorName = "new" ..  tagName:gsub("^%l", string.upper);	
	
	gui[constructorName] = 	
		function()
			return class.new();
		end;
end;

--[[ Objeto Control ]]--

gui.Control = objs.HierarchyObject.inherit();

function gui.Control:initialize() 	
	if self.props == nil then
		self.props = {};
	end;
			
	if self.eves == nil then
		self.eves = {};
	end;

	self:setParent(self:getParent()); 		
end;	

function gui.Control:setFocus() _obj_invoke(self.handle, "SetFocus"); end;	
function gui.Control:beginUpdate() _obj_invoke(self.handle, "BeginUpdate"); end;
function gui.Control:endUpdate() _obj_invoke(self.handle, "EndUpdate"); end;
function gui.Control:needRepaint() _obj_invoke(self.handle, "Repaint"); end;

function gui.Control:getVisible() return _obj_getProp(self.handle, "Visible"); end;

function gui.Control:setVisible(visible) 
	_obj_setProp(self.handle, "Visible", visible == true);
	
	if visible then
		local grid = self:tryGetGrid();
		
		if grid ~= nil then
			grid:invalidate();
		end;
	end;
end;	

function gui.Control:getAlign() return _obj_getProp(self.handle, "Align"); end;
function gui.Control:setAlign(align) _obj_setProp(self.handle, "Align", align); end;	

function gui.Control:getEnabled()return  _obj_getProp(self.handle, "Enabled"); end;
function gui.Control:setEnabled(enabled) _obj_setProp(self.handle, "Enabled", enabled == true) end;	

function gui.Control:getLeft() return _obj_getProp(self.handle, "Position.X"); end;
function gui.Control:setLeft(left) _obj_setProp(self.handle, "Position.X", left) end;	

function gui.Control:getTop() return _obj_getProp(self.handle, "Position.Y"); end;
function gui.Control:setTop(top) _obj_setProp(self.handle, "Position.Y", top) end;		

function gui.Control:getBottom() return self:getTop() + self:getHeight(); end;
function gui.Control:setBottom(bottom) self:setTop(bottom - self:getHeight()); end;		

function gui.Control:getRight() return self:getLeft() + self:getWidth(); end;
function gui.Control:setRight(right) self:setLeft(right - self:getWidth()); end;				

function gui.Control:getWidth() return _obj_getProp(self.handle, "Width"); end;
function gui.Control:setWidth(width) _obj_setProp(self.handle, "Width", width) end;	

function gui.Control:getHeight() return _gui_getHeight(self.handle); end;
function gui.Control:setHeight(height) _gui_setHeight(self.handle, height) end;

function gui.Control:getHitTest() return _obj_getProp(self.handle, "HitTest"); end;
function gui.Control:setHitTest(hittest) _obj_setProp(self.handle, "HitTest", hittest == true) end;		

function gui.Control:getTabOrder() return _obj_getProp(self.handle, "TabOrder"); end;
function gui.Control:setTabOrder(tabOrder) _obj_setProp(self.handle, "TabOrder", tabOrder); end;	

function gui.Control:getOpacity() return _obj_getProp(self.handle, "Opacity"); end;
function gui.Control:setOpacity(opacity) _obj_setProp(self.handle, "Opacity", opacity); end;	

function gui.Control:getMargins() return _obj_getProp(self.handle, "Margins"); end;
function gui.Control:setMargins(margins) _gui_setMargins(self.handle, margins); end;		

function gui.Control:getPadding() return _obj_getProp(self.handle, "Padding"); end;
function gui.Control:setPadding(padding) _gui_setPadding(self.handle, padding); end;			

function gui.Control:getAnchors() return _obj_getProp(self.handle, "Anchors"); end;
function gui.Control:setAnchors(anchors) _obj_setProp(self.handle, "Anchors", anchors); end;		

function gui.Control:getCanFocus() return _obj_getProp(self.handle, "CanFocus"); end;
function gui.Control:setCanFocus(canFocus) _obj_setProp(self.handle, "CanFocus", canFocus); end;	

function gui.Control:getRotationAngle() return _obj_getProp(self.handle, "RotationAngle"); end;
function gui.Control:setRotationAngle(angle) _obj_setProp(self.handle, "RotationAngle", angle); end;		

function gui.Control:getRotationCenterX() return _obj_getProp(self.handle, "RotationCenter.X"); end;
function gui.Control:setRotationCenterX(x) _obj_setProp(self.handle, "RotationCenter.X", x); end;			

function gui.Control:getRotationCenterY() return _obj_getProp(self.handle, "RotationCenter.Y"); end;
function gui.Control:setRotationCenterY(y) _obj_setProp(self.handle, "RotationCenter.Y", y); end;			

function gui.Control:getScaleX() return _obj_getProp(self.handle, "Scale.X"); end;
function gui.Control:setScaleX(sX) _obj_setProp(self.handle, "Scale.X", sX); end;				

function gui.Control:getScaleY() return _obj_getProp(self.handle, "Scale.Y"); end;
function gui.Control:setScaleY(sY) _obj_setProp(self.handle, "Scale.Y", sY); end;					

function gui.Control:getScale() return self:getScaleX(); end;
function gui.Control:setScale(ss) self:beginUpdate(); self:setScaleX(ss); self:setScaleY(ss); self:endUpdate(); end;						

function gui.Control:isChildFocused() return _obj_getProp(self.handle, "IsChildFocused"); end;
function gui.Control:isFocused() return _obj_getProp(self.handle, "IsFocused"); end;	
function gui.Control:isMouseOver() return _obj_getProp(self.handle, "IsMouseOver"); end;
function gui.Control:isVisible() return self:getVisible(); end;	

function gui.Control:getCursor() return _obj_getProp(self.handle, "MouseCursor"); end;
function gui.Control:setCursor(v) _obj_setProp(self.handle, "MouseCursor", v); end;

function gui.Control:getHint() return _obj_getProp(self.handle, "Hint"); end;
function gui.Control:setHint(v) _gui_setHint(self.handle, v); end;	

function gui.Control:getEffect() return _obj_getProp(self.handle, "CompEffect"); end;
function gui.Control:setEffect(effect) _obj_setProp(self.handle, "CompEffect", effect); end;

function gui.Control:getEffectTriggers() return _obj_getProp(self.handle, "CompEffectTriggers"); end;
function gui.Control:setEffectTriggers(triggers) _obj_setProp(self.handle, "CompEffectTriggers", triggers); end;	

function gui.Control:getEffectParam() return _obj_getProp(self.handle, "CompEffectParam"); end;
function gui.Control:setEffectParam(param) _obj_setProp(self.handle, "CompEffectParam", param); end;	

function gui.Control:getEffectParam2() return _obj_getProp(self.handle, "CompEffectParam2"); end;
function gui.Control:setEffectParam2(param) _obj_setProp(self.handle, "CompEffectParam2", param); end;		

function gui.Control:getEffectParam3() return _obj_getProp(self.handle, "CompEffectParam3"); end;
function gui.Control:setEffectParam3(param) _obj_setProp(self.handle, "CompEffectParam3", param); end;			

function gui.Control:getEffectParam4() return _obj_getProp(self.handle, "CompEffectParam4"); end;
function gui.Control:setEffectParam4(param) _obj_setProp(self.handle, "CompEffectParam4", param); end;	
		
function gui.Control:findControlByName(controlName) return gui.findControlByName(controlName, self); end;

function gui.Control:getGrid()
	local cachedGrid = rawget(self, "__cachedGrid");
	
	if cachedGrid == nil then
		if __delayedGridLib == nil then
			__delayedGridLib = require("rrpgGUI_grid.dlua");
			assert(__delayedGridLib ~= nil);
		end;
		
		cachedGrid = __delayedGridLib.new(self);						
		rawset(self, "__cachedGrid", cachedGrid);
	end;
	
	return cachedGrid;
end;

function gui.Control:tryGetGrid()
	return rawget(self, "__cachedGrid");
end;

function gui.Control:__objindex(key) 		
	if type(key) == "string" then
		if key == "g" then
			return true, self.grid.role;
		end;	
		
		local gridPropName = string.match(key, "^g%-(.+)$");
		
		if gridPropName ~= nil then
			return true, self.grid[gridPropName];
		end;
	end;
	
	return false;
end;	

function gui.Control:__objnewindex(key, value) 		
	if type(key) == "string" then
		if key == "g" then
			self.grid.role = value;
			return true;			
		end;	
		
		local gridPropName = string.match(key, "^g%-(.+)$");
		
		if gridPropName ~= nil then
			self.grid[gridPropName] = value;
			return true;
		end;
	end;
	
	return false;
end;	

gui.Control.props["visible"] = {setter = "setVisible", getter = "getVisible", tipo = "bool"};
gui.Control.props["align"] = {setter = "setAlign", getter = "getAlign", tipo = "enum", 
							   values = {"none", "top", "left", "right",
										 "bottom", "client", "contents", "scale"}}	
															 
gui.Control.props["enabled"] = {setter = "setEnabled", getter = "getEnabled", tipo = "bool"};
gui.Control.props["left"] = {setter = "setLeft", getter = "getLeft", tipo = "double"};
gui.Control.props["top"] = {setter = "setTop", getter = "getTop", tipo = "double"};	
gui.Control.props["right"] = {setter = "setRight", getter = "getRight", tipo = "double"};
gui.Control.props["bottom"] = {setter = "setBottom", getter = "getBottom", tipo = "double"};		
gui.Control.props["width"] = {setter = "setWidth", getter = "getWidth", tipo = "double"};
gui.Control.props["height"] = {setter = "setHeight", getter = "getHeight", tipo = "double"};
gui.Control.props["hitTest"] = {setter = "setHitTest", getter = "getHitTest", tipo = "bool"};
gui.Control.props["tabOrder"] = {setter = "setTabOrder", getter = "getTabOrder", tipo = "int"};
gui.Control.props["opacity"] = {setter = "setOpacity", getter = "getOpacity", tipo = "double"};
gui.Control.props["margins"] = {setter = "setMargins", getter = "getMargins", tipo = "bounds"};
gui.Control.props["padding"] = {setter = "setPadding", getter = "getPadding", tipo = "bounds"};	
gui.Control.props["anchors"] = {setter = "setAnchors", getter = "getAnchors", tipo = "set",
						 values = {"left", "top", "right", "bottom"}};
						 
gui.Control.props["canFocus"] = {setter = "setCanFocus", getter = "getCanFocus", tipo="bool"};
gui.Control.props["rotationAngle"] = {setter = "setRotationAngle", getter = "getRotationAngle", tipo="double"};	
gui.Control.props["rotationCenterX"] = {setter = "setRotationCenterX", getter = "getRotationCenterX", tipo="double"};	
gui.Control.props["rotationCenterY"] = {setter = "setRotationCenterY", getter = "getRotationCenterY", tipo="double"};		
gui.Control.props["scaleX"] = {setter = "setScaleX", getter = "getScaleX", tipo="double"};			
gui.Control.props["scaleY"] = {setter = "setScaleY", getter = "getScaleY", tipo="double"};				
gui.Control.props["scale"] = {setter = "setScale", getter = "getScale", tipo="double"};				
gui.Control.props["parent"] = {setter = "setParent", getter = "getParent", tipo="table"};	

gui.Control.props["cursor"] = {setter = "setCursor", getter = "getCursor", tipo="enum",
								values={'default', 'arrow', 'handPoint', 'hourGlass',
										'IBeam', 'size', 'sizeNESW', 'sizeNS',
										'sizeNWSE', 'sizeWE', 'upArrow',
										'drag', 'noDrop', 'hSplit', 'vSplit',
										'multiDrag', 'sqlWait', 'no', 'appStart',
										'help', 'cross'}};	
								
gui.Control.props["hint"] = {setter = "setHint", getter = "getHint", tipo="string"};
gui.Control.props["grid"] = {getter = "getGrid", tipo="table"};

gui.Control.props["cacheMode"] = {readProp = "CacheMode", writeProp = "CacheMode", tipo = "enum", 
								  values = {"none", "time"}};

gui.Control.eves["onResize"] = "";
gui.Control.eves["onClick"] = "event";
gui.Control.eves["onDblClick"] = "event";
gui.Control.eves["onMouseDown"] = "event";
gui.Control.eves["onMouseMove"] = "event";
gui.Control.eves["onMouseUp"] = "event";
gui.Control.eves["onMouseEnter"] = "";
gui.Control.eves["onMouseLeave"] = "";
gui.Control.eves["onEnter"] = "";
gui.Control.eves["onExit"] = "";
gui.Control.eves["onKeyDown"] = "event";
gui.Control.eves["onKeyUp"] = "event";
gui.Control.eves["onMenu"] = 'x, y, event';
gui.Control.eves["onStartDrag"] = 'drag, x, y, event';	
gui.Control.eves["onStartDrop"] = 'drop, x, y, drag, event';		

local function controlFromHandle(handle)
	return gui.Control.fromHandle(handle);				
end

gui.controlFromHandle = controlFromHandle;

--[[ Objeto Layout ]]--

gui.Layout = gui.Control.inherit();
registerTag(gui.Layout, 'layout');

function gui.Layout:getFrameStyle() return _obj_getProp(self.handle, "FrameStyle"); end;
function gui.Layout:setFrameStyle(frameStyle) _obj_setProp(self.handle, "FrameStyle", frameStyle) end;		

function gui.Layout:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
function gui.Layout:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;	

gui.Layout.props["frameStyle"] = {setter = "setFrameStyle", getter = "getFrameStyle", tipo = "url"};		
gui.Layout.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};	


--[[ Objeto Row ]]--

gui.Row = gui.Layout.inherit();
registerTag(gui.Row, 'row');

--[[ Objeto Col ]]--

gui.Col = gui.Layout.inherit();
registerTag(gui.Col, 'col');

--[[ Objeto Container ]]--

gui.Container = gui.Layout.inherit();
registerTag(gui.Container, 'container');

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

gui.Form = gui.Layout.inherit();
registerTag(gui.Form, 'form');

function gui.Form:initialize()
	rawset(self, "__isFormFlag", true);
end;

function gui.Form:getWidth() return _obj_getProp(self.handle, "FormWidth"); end;
function gui.Form:setWidth(v) _obj_setProp(self.handle, "FormWidth", v); end;

function gui.Form:getHeight() return _obj_getProp(self.handle, "FormHeight"); end;
function gui.Form:setHeight(v) _obj_setProp(self.handle, "FormHeight", v); end;

function gui.Form:getLeft() return _obj_getProp(self.handle, "FormLeft"); end;
function gui.Form:setLeft(v) _obj_setProp(self.handle, "FormLeft", v); end;

function gui.Form:getTop() return _obj_getProp(self.handle, "FormTop"); end;
function gui.Form:setTop(v) _obj_setProp(self.handle, "FormTop", v); end;	
	
function gui.Form:getTitle() return _obj_getProp(self.handle, "Title"); end;
function gui.Form:setTitle(title) _obj_setProp(self.handle, "Title", title) end;

function gui.Form:getDescription() return _obj_getProp(self.handle, "Description"); end;
function gui.Form:setDescription(desc) _obj_setProp(self.handle, "Description", desc) end;	

function gui.Form:getDataType() return _obj_getProp(self.handle, "DataType"); end;
function gui.Form:setDataType(dataType) _obj_setProp(self.handle, "DataType", dataType) end;	

function gui.Form:getFormType() return _obj_getProp(self.handle, "FormType"); end;
function gui.Form:setFormType(formType) _obj_setProp(self.handle, "FormType", formType) end;		

function gui.Form:getTheme() return _obj_getProp(self.handle, "Theme"); end;
function gui.Form:setTheme(theme) _obj_setProp(self.handle, "Theme", theme) end;	
	
function gui.Form:getLockWhileNodeIsLoading() return _obj_getProp(self.handle, "LockWhileNodeIsLoading"); end;
function gui.Form:setLockWhileNodeIsLoading(v) _obj_setProp(self.handle, "LockWhileNodeIsLoading", v) end;		

function gui.Form:getMinWidth() return _obj_getProp(self.handle, "MinWidth"); end;
function gui.Form:setMinWidth(v) _obj_setProp(self.handle, "MinWidth", v) end;		

function gui.Form:getMaxWidth() return _obj_getProp(self.handle, "MaxWidth"); end;
function gui.Form:setMaxWidth(v) _obj_setProp(self.handle, "MaxWidth", v) end;		
	
function gui.Form:setNodeObject(nodeObject) 
	rawset(self, "nodeObject", nodeObject);
	_gui_assignNodeObject(self.handle, ndb.getNodeHandle(nodeObject));
end;

function gui.Form:getNodeObject() return rawget(self, "nodeObject") end;
function gui.Form:getNode() return self:getNodeObject(); end;
function gui.Form:setNode(node) self:setNodeObject(node); end;
function gui.Form:getScopeNode() return self:getNodeObject(); end;
function gui.Form:setScopeNode(node) self:setNodeObject(node); end;	

function gui.Form:lockWithActivity(msg) return __lockFormWithActivity(self, msg); end;	
function gui.Form:unlockWithActivity() return __unlockFormWithActivity(self); end;	
	
gui.Form.props["title"] = {setter = "setTitle", getter = "getTitle", tipo = "string"};
gui.Form.props["description"] = {setter = "setDescription", getter = "getDescription", tipo = "string"};	
gui.Form.props["dataType"] = {setter = "setDataType", getter = "getDataType", tipo = "string"};
gui.Form.props["formType"] = {setter = "setFormType", getter = "getDataType", tipo = "enum",
                              values = {"undefined", "sheetTemplate", "tablesDock"}};
gui.Form.props["theme"] = {setter = "setTheme", getter = "getTheme", tipo = "enum", 
                           values = {"default", "light", "dark", "firecast"}};
gui.Form.props["lockWhileNodeIsLoading"] = {setter = "setLockWhileNodeIsLoading", getter = "getLockWhileNodeIsLoading", tipo = "bool"};						   
gui.Form.props["scopeNode"] = {setter = "setScopeNode", getter = "getScopeNode", tipo = "table"};						   	
gui.Form.props["minWidth"] = {setter = "setMinWidth", getter = "getMinWidth", tipo = "double"};	
gui.Form.props["maxWidth"] = {setter = "setMaxWidth", getter = "getMaxWidth", tipo = "double"};		
gui.Form.props["isShowing"] = {readProp = "IsShowing", tipo = "bool"};			

gui.Form.eves["onScopeNodeChanged"] = "";	
gui.Form.eves["onShow"] = "";
gui.Form.eves["onHide"] = "";
gui.Form.eves["onNodeReady"] = "";
gui.Form.eves["onNodeUnready"] = "";
gui.Form.eves["onNodeChanged"] = "";	

--[[ Objeto Popup Form ]]--

gui.PopupForm = gui.Form.inherit();
registerTag(gui.PopupForm, 'popupForm');

function gui.PopupForm:getDrawContainer() return _obj_getProp(self.handle, "DrawContainer"); end;
function gui.PopupForm:setDrawContainer(v) _obj_setProp(self.handle, "DrawContainer", v); end;	

function gui.PopupForm:getCancelable() return _obj_getProp(self.handle, "Cancelable"); end;
function gui.PopupForm:setCancelable(v) _obj_setProp(self.handle, "Cancelable", v); end;		

function gui.PopupForm:getPlacement() return _obj_getProp(self.handle, "Placement"); end;
function gui.PopupForm:setPlacement(v) _obj_setProp(self.handle, "Placement", v); end;		

function gui.PopupForm:getResizable() return _obj_getProp(self.handle, "Resizable"); end;
function gui.PopupForm:setResizable(v) _obj_setProp(self.handle, "Resizable", v); end;

function gui.PopupForm:show() return gui.showPopup(self); end;
function gui.PopupForm:close() return gui.closePopup(self); end;

gui.PopupForm.props["drawContainer"] = {setter = "setDrawContainer", getter = "getDrawContainer", tipo = "bool"};	
gui.PopupForm.props["cancelable"] = {setter = "setCancelable", getter = "getCancelable", tipo = "bool"};
gui.PopupForm.props["resizable"] = {setter = "setResizable", getter = "getResizable", tipo = "bool"};	
gui.PopupForm.props["movable"] = {readProp = "Movable", writeProp = "Movable", tipo = "bool"};	

gui.PopupForm.props["placement"] = {setter = "setPlacement", getter = "getPlacement", tipo = "enum",
                                    values = {"center", "bottom", "top", "left", "right", 
                                              "topLeft", "topRight", "bottomLeft", "bottomRight", "mouse", "mouseCenter"}};	
								   								   								   
gui.PopupForm.eves["onCancelRequest"] = "";

--[[ Objeto Flow Part ]]--

gui.FlowPart = gui.Layout.inherit();
registerTag(gui.FlowPart, 'flowPart');

function gui.FlowPart:getMinWidth() return _obj_getProp(self.handle, "MinWidth"); end;
function gui.FlowPart:setMinWidth(value) _obj_setProp(self.handle, "MinWidth", value) end;	

function gui.FlowPart:getMinScaledWidth() return _obj_getProp(self.handle, "MinScaledWidth"); end;
function gui.FlowPart:setMinScaledWidth(value) _obj_setProp(self.handle, "MinScaledWidth", value) end;		

function gui.FlowPart:getMaxWidth() return _obj_getProp(self.handle, "MaxWidth"); end;
function gui.FlowPart:setMaxWidth(value) _obj_setProp(self.handle, "MaxWidth", value) end;	

function gui.FlowPart:getMaxScaledWidth() return _obj_getProp(self.handle, "MaxScaledWidth"); end;
function gui.FlowPart:setMaxScaledWidth(value) _obj_setProp(self.handle, "MaxScaledWidth", value) end;		

function gui.FlowPart:getAvoidScale() return _obj_getProp(self.handle, "AvoidScale"); end;
function gui.FlowPart:setAvoidScale(value) _obj_setProp(self.handle, "AvoidScale", value) end;			

function gui.FlowPart:getVertAlign() return _obj_getProp(self.handle, "VerticalAlign"); end;
function gui.FlowPart:setVertAlign(value) _obj_setProp(self.handle, "VerticalAlign", value) end;	

function gui.FlowPart:getStepSizes() return _obj_getProp(self.handle, "StepSizes"); end;
function gui.FlowPart:setStepSizes(value) _obj_setProp(self.handle, "StepSizes", value) end;	

function gui.FlowPart:getAdjustHeightToLine() return _obj_getProp(self.handle, "AdjustHeightToLine"); end;
function gui.FlowPart:setAdjustHeightToLine(value) _obj_setProp(self.handle, "AdjustHeightToLine", value) end;		

gui.FlowPart.props["minWidth"] = {setter = "setMinWidth", getter = "getMinWidth", tipo = "double"};	
gui.FlowPart.props["minScaledWidth"] = {setter = "setMinScaledWidth", getter = "getMinScaledWidth", tipo = "double"};		
gui.FlowPart.props["maxWidth"] = {setter = "setMaxWidth", getter = "getMaxWidth", tipo = "double"};	
gui.FlowPart.props["maxScaledWidth"] = {setter = "setMaxScaledWidth", getter = "getMaxScaledWidth", tipo = "double"};			
gui.FlowPart.props["avoidScale"] = {setter = "setAvoidScale", getter = "getAvoidScale", tipo = "bool"};	
						
gui.FlowPart.props["vertAlign"] = {setter = "setVertAlign", getter = "getVertAlign", tipo = "enum",
							 values={"leading", "center", "trailing"}};		
							 
gui.FlowPart.props["stepSizes"] = {setter = "setStepSizes", getter = "getStepSizes", tipo = "table"};								
gui.FlowPart.props["adjustHeightToLine"] = {setter = "setAdjustHeightToLine", getter = "getAdjustHeightToLine", tipo = "bool"};		

--[[ Objeto Flow Layout ]]--

gui.FlowLayout = gui.FlowPart.inherit();
registerTag(gui.FlowLayout, 'flowLayout');

function gui.FlowLayout:getAutoHeight() return _obj_getProp(self.handle, "AutoHeight"); end;
function gui.FlowLayout:setAutoHeight(value) _obj_setProp(self.handle, "AutoHeight", value) end;

function gui.FlowLayout:getHorzAlign() return _obj_getProp(self.handle, "HorzAlign"); end;
function gui.FlowLayout:setHorzAlign(value) _obj_setProp(self.handle, "HorzAlign", value) end;		

function gui.FlowLayout:getMaxControlsPerLine() return _obj_getProp(self.handle, "MaxControlsPerLine"); end;
function gui.FlowLayout:setMaxControlsPerLine(value) _obj_setProp(self.handle, "MaxControlsPerLine", value) end;			

function gui.FlowLayout:getLineSpacing() return _obj_getProp(self.handle, "LineSpacing"); end;
function gui.FlowLayout:setLineSpacing(value) _obj_setProp(self.handle, "LineSpacing", value) end;				

function gui.FlowLayout:getOrientation() return _obj_getProp(self.handle, "Orientation"); end;
function gui.FlowLayout:setOrientation(value) _obj_setProp(self.handle, "Orientation", value) end;			

function gui.FlowLayout:getMaxColumns() return _obj_getProp(self.handle, "MaxColumns"); end;
function gui.FlowLayout:setMaxColumns(value) _obj_setProp(self.handle, "MaxColumns", value) end;	

function gui.FlowLayout:needRealign() _obj_invoke(self.handle, "NeedRealign"); end;

gui.FlowLayout.props["autoHeight"] = {setter = "setAutoHeight", getter = "getAutoHeight", tipo = "bool"};	
gui.FlowLayout.props["horzAlign"] = {setter = "setHorzAlign", getter = "getHorzAlign", tipo = "enum",
							 values={"leading", "center", "trailing", "justify"}};		
							 
gui.FlowLayout.props["maxControlsPerLine"] = {setter = "setMaxControlsPerLine", getter = "getMaxControlsPerLine", tipo = "int"};									 
gui.FlowLayout.props["lineSpacing"] = {setter = "setLineSpacing", getter = "getLineSpacing", tipo = "double"};									 	
gui.FlowLayout.props["orientation"] = {setter = "setOrientation", getter = "getOrientation", tipo = "enum",
							   values={"horizontal", "vertical"}};									 	
gui.FlowLayout.props["maxColumns"] = {setter = "setMaxColumns", getter = "getMaxColumns", tipo = "int"};									 								   
gui.FlowLayout.props["contentWidth"] = {readProp = "ContentWidth", tipo = "double"};		
gui.FlowLayout.props["contentHeight"] = {readProp = "ContentHeight", tipo = "double"};		

gui.FlowLayout.eves["onBeforeLayoutCalc"] = "";	
gui.FlowLayout.eves["onAfterLayoutCalc"] = "";		

--[[ Objeto Flow Line Break ]]--

gui.FlowLineBreak = gui.Control.inherit();
registerTag(gui.FlowLineBreak, 'flowLineBreak');

function gui.FlowLineBreak:getHorzAlign() return _obj_getProp(self.handle, "HorzAlign"); end;
function gui.FlowLineBreak:setHorzAlign(value) _obj_setProp(self.handle, "HorzAlign", value) end;		

function gui.FlowLineBreak:getLineSpacing() return _obj_getProp(self.handle, "LineSpacing"); end;
function gui.FlowLineBreak:setLineSpacing(value) _obj_setProp(self.handle, "LineSpacing", value) end;		

gui.FlowLineBreak.props["horzAlign"] = {setter = "setHorzAlign", getter = "getHorzAlign", tipo = "enum",
							 values={"leading", "center", "trailing", "justify"}};		
	
gui.FlowLineBreak.props["lineSpacing"] = {setter = "setLineSpacing", getter = "getLineSpacing", tipo = "double"};		

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

gui.TextControl = gui.Control.inherit();
_addFontPropertiesToObject(gui.TextControl);
_addTextStylePropsToObject(gui.TextControl);

function gui.TextControl:getText() return _obj_getProp(self.handle, "Text"); end;
function gui.TextControl:setText(text) return _obj_setProp(self.handle, "Text", text); end;

function gui.TextControl:getStyledSettings() return _obj_getProp(self.handle, "StyledSettings"); end;
function gui.TextControl:setStyledSettings(settings) return _obj_setProp(self.handle, "StyledSettings", settings); end;					

gui.TextControl.props["text"] = {setter = "setText", getter = "getText", tipo = "string"};
gui.TextControl.props["styledSettings"] = {setter = "setStyledSettings", getter = "getStyledSettings", tipo="set",
										   values = {"family", "size", "style", "fontcolor", "other"}};

--[[ Objeto Button ]]--

gui.Button = gui.TextControl.inherit();
registerTag(gui.Button, 'button');

--[[ Objeto Label ]]--

gui.Label = gui.TextControl.inherit();
registerTag(gui.Label, 'label');

function gui.Label:getAutoSize() return _obj_getProp(self.handle, "AutoSize"); end;
function gui.Label:setAutoSize(v) _obj_setProp(self.handle, "AutoSize", v); end;

function gui.Label:getField() return _gui_getFieldName(self.handle); end;
function gui.Label:setField(v) _gui_setFieldName(self.handle, v); end;

function gui.Label:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
function gui.Label:setFrameRegion(v) _obj_setProp(self.handle, "FrameRegion", v); end;	

gui.Label.props["autoSize"] = {setter = "setAutoSize", getter = "getAutoSize", tipo = "bool"};		
gui.Label.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
gui.Label.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};			
gui.Label.props["format"] = {writeProp = "StringFormat", readProp = "StringFormat", tipo = "string"};		
gui.Label.props["formatFloat"] = {writeProp = "StringFormatFloat", readProp = "StringFormatFloat", tipo = "string"};	

--[[ Objeto CheckBox ]]--

gui.CheckBox = gui.TextControl.inherit();
registerTag(gui.CheckBox, 'checkBox');

function gui.CheckBox:getChecked() return _obj_getProp(self.handle, "IsChecked"); end;
function gui.CheckBox:setChecked(v) return _obj_setProp(self.handle, "IsChecked", v); end;

function gui.CheckBox:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.CheckBox:setField(v) return _obj_setProp(self.handle, "FieldName", v); end;

gui.CheckBox.props["checked"] = {setter = "setChecked", getter = "getChecked", tipo = "bool"};
gui.CheckBox.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};	

gui.CheckBox.eves["onChange"] = "";	

--[[ Objeto RadioButton ]]--

gui.RadioButton = gui.TextControl.inherit();
registerTag(gui.RadioButton, 'radioButton');

function gui.RadioButton:getChecked() return _obj_getProp(self.handle, "IsChecked"); end;
function gui.RadioButton:setChecked(v) return _obj_setProp(self.handle, "IsChecked", v); end;

function gui.RadioButton:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.RadioButton:setField(v) return _obj_setProp(self.handle, "FieldName", v); end;

function gui.RadioButton:getFieldValue() return _obj_getProp(self.handle, "FieldValue"); end;
function gui.RadioButton:setFieldValue(v) return _obj_setProp(self.handle, "FieldValue", v); end;	

function gui.RadioButton:getGroupName() return _obj_getProp(self.handle, "GroupName"); end;
function gui.RadioButton:setGroupName(v) return _obj_setProp(self.handle, "GroupName", v); end;

gui.RadioButton.props["checked"] = {setter = "setChecked", getter = "getChecked", tipo = "bool"};
gui.RadioButton.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};	
gui.RadioButton.props["fieldValue"] = {setter = "setFieldValue", getter = "getFieldValue", tipo = "string"};	
gui.RadioButton.props["groupName"] = {setter = "setGroupName", getter = "getGroupName", tipo = "string"};	

gui.RadioButton.eves["onChange"] = "";	

--[[ Objeto ImageCheckBox ]]--

gui.ImageCheckBox = gui.Control.inherit();
registerTag(gui.ImageCheckBox, 'imageCheckBox');

function gui.ImageCheckBox:getChecked() return _obj_getProp(self.handle, "IsChecked"); end;
function gui.ImageCheckBox:setChecked(v) _obj_setProp(self.handle, "IsChecked", v); end;

function gui.ImageCheckBox:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.ImageCheckBox:setField(v) _obj_setProp(self.handle, "FieldName", v); end;

function gui.ImageCheckBox:getImageChecked() return _obj_getProp(self.handle, "ImageChecked"); end;
function gui.ImageCheckBox:setImageChecked(v) _obj_setProp(self.handle, "ImageChecked", v); end;

function gui.ImageCheckBox:getImageUnchecked() return _obj_getProp(self.handle, "ImageUnchecked"); end;
function gui.ImageCheckBox:setImageUnchecked(v) _obj_setProp(self.handle, "ImageUnchecked", v); end;	

function gui.ImageCheckBox:getOptimize() return _obj_getProp(self.handle, "Optimize"); end;
function gui.ImageCheckBox:setOptimize(opt) return _obj_setProp(self.handle, "Optimize", opt); end;			

function gui.ImageCheckBox:getAutoChange() return _obj_getProp(self.handle, "AutoChange"); end;
function gui.ImageCheckBox:setAutoChange(v) return _obj_setProp(self.handle, "AutoChange", v); end;		

gui.ImageCheckBox.props["checked"] = {setter = "setChecked", getter = "getChecked", tipo = "bool"};
gui.ImageCheckBox.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
gui.ImageCheckBox.props["imageChecked"] = {setter = "setImageChecked", getter = "getImageChecked", tipo = "url"};		
gui.ImageCheckBox.props["checkedImage"] = {setter = "setImageChecked", getter = "getImageChecked", tipo = "url"};			
gui.ImageCheckBox.props["imageUnchecked"] = {setter = "setImageUnchecked", getter = "getImageUnchecked", tipo = "url"};			
gui.ImageCheckBox.props["uncheckedImage"] = {setter = "setImageUnchecked", getter = "getImageUnchecked", tipo = "url"};				
gui.ImageCheckBox.props["optimize"] = {setter = "setOptimize", getter = "getOptimize", tipo = "bool"};	
gui.ImageCheckBox.props["autoChange"] = {setter = "setAutoChange", getter = "getAutoChange", tipo = "bool"};	

gui.ImageCheckBox.eves["onChange"] = "";	

--[[ Objeto Image ]]--

gui.Image = gui.Control.inherit();
registerTag(gui.Image, 'image');

function gui.Image:getImageURL() return _obj_getProp(self.handle, "URLImagem"); end;
function gui.Image:setImageURL(url) return _obj_setProp(self.handle, "URLImagem", url); end;

function gui.Image:getURL() return _obj_getProp(self.handle, "URLImagem"); end;
function gui.Image:setURL(url) return _obj_setProp(self.handle, "URLImagem", url); end;	

function gui.Image:getSRC() return _obj_getProp(self.handle, "URLImagem"); end;
function gui.Image:setSRC(src) return _obj_setProp(self.handle, "URLImagem", src); end;		

function gui.Image:getShowStyle() return _obj_getProp(self.handle, "ShowStyle"); end;
function gui.Image:setShowStyle(showStyle) return _obj_setProp(self.handle, "ShowStyle", showStyle); end;	

function gui.Image:getStyle() return _obj_getProp(self.handle, "ShowStyle"); end;
function gui.Image:setStyle(style) return _obj_setProp(self.handle, "ShowStyle", style); end;	

function gui.Image:getCenter() return _obj_getProp(self.handle, "Center"); end;
function gui.Image:setCenter(center) return _obj_setProp(self.handle, "Center", center); end;	

function gui.Image:getOptimizeQuality() return _obj_getProp(self.handle, "OtimizarDesenho"); end;
function gui.Image:setOptimizeQuality(opt) return _obj_setProp(self.handle, "OtimizarDesenho", opt); end;	
function gui.Image:getOptimize() return _obj_getProp(self.handle, "OtimizarDesenho"); end;
function gui.Image:setOptimize(opt) return _obj_setProp(self.handle, "OtimizarDesenho", opt); end;		

function gui.Image:getShowProgress() return _obj_getProp(self.handle, "ExibirProgresso"); end;
function gui.Image:setShowProgress(showProgress) return _obj_setProp(self.handle, "ExibirProgresso", showProgress); end;		

function gui.Image:getURLWhileLoading() return _obj_getProp(self.handle, "NoImageURL"); end;
function gui.Image:setURLWhileLoading(url) return _obj_setProp(self.handle, "NoImageURL", url); end;	

function gui.Image:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.Image:setField(v) _obj_setProp(self.handle, "FieldName", v); end;		

function gui.Image:getEditable() return _obj_getProp(self.handle, "Editable"); end;
function gui.Image:setEditable(v) _obj_setProp(self.handle, "Editable", v); end;		

function gui.Image:getNaturalWidth() return _obj_getProp(self.handle, "NaturalWidth"); end;
function gui.Image:getNaturalHeight() return _obj_getProp(self.handle, "NaturalHeight"); end;	

gui.Image.props["imageURL"] = {setter = "setImageURL", getter="getImageURL", tipo="url"};
gui.Image.props["url"] = {setter = "setURL", getter="getURL", tipo="url"};	
gui.Image.props["src"] = {setter = "setSRC", getter="getSRC", tipo="url"};		
gui.Image.props["URLWhileLoading"] = {setter = "setURLWhileLoading", getter="getURLWhileLoading", tipo="url"};

gui.Image.props["showStyle"] = {setter = "setShowStyle", getter="getShowStyle", tipo="enum",
							values = {"proportional", "autoFit", "originalSize", "stretch"}};								
gui.Image.props["style"] = {setter = "setStyle", getter="getStyle", tipo="enum",
							values = {"proportional", "autoFit", "originalSize", "stretch"}};	

gui.Image.props["center"] = {setter = "setCenter", getter="getCenter", tipo="bool"};
gui.Image.props["optimizeQuality"] = {setter = "setOptimizeQuality", getter="getOptimizeQuality", tipo="bool"};
gui.Image.props["optimize"] = {setter = "setOptimize", getter="getOptimize", tipo="bool"};	
gui.Image.props["showProgress"] = {setter = "setShowProgress", getter="getShowProgress", tipo="bool"};
gui.Image.props["field"] = {setter = "setField", getter="getField", tipo="string"};	
gui.Image.props["editable"] = {setter = "setEditable", getter="getEditable", tipo="bool"};		
gui.Image.props["naturalAnimated"] = {readProp="NaturalAnimated", tipo="bool"};				
gui.Image.props["naturalWidth"] = {getter="getNaturalWidth", tipo="double"};			
gui.Image.props["naturalHeight"] = {getter="getNaturalHeight", tipo="double"};			
gui.Image.props["animate"] = {readProp="Animate", writeProp="Animate", tipo="bool"};			

gui.Image.eves["onPictureLoadedChange"] = "";
gui.Image.eves["onLoad"] = "";

--[[ Objeto Edit ]]--

gui.Edit = gui.TextControl.inherit();
registerTag(gui.Edit, 'edit');

_addEditablePropsToObject(gui.Edit);

function gui.Edit:getTextPrompt() return _obj_getProp(self.handle, "TextPrompt"); end;
function gui.Edit:setTextPrompt(text) _obj_setProp(self.handle, "TextPrompt", text); end;

function gui.Edit:getTransparent() _obj_getProp(self.handle, "Transparent"); end;
function gui.Edit:setTransparent(transparent) _obj_setProp(self.handle, "Transparent", transparent); end;
		
function gui.Edit:getIsPasswordEdit() return _obj_getProp(self.handle, "Password"); end;
function gui.Edit:setIsPasswordEdit(isPasswordEdit) _obj_setProp(self.handle, "Password", isPasswordEdit); end;

function gui.Edit:getKeyboardType() return _obj_getProp(self.handle, "KeyboardType"); end;
function gui.Edit:setKeyboardType(kbtype) _obj_setProp(self.handle, "KeyboardType", kbtype); end;

function gui.Edit:getEnterKeyType() return _obj_getProp(self.handle, "ReturnKeyType"); end;
function gui.Edit:setEnterKeyType(enterType) _obj_setProp(self.handle, "ReturnKeyType", enterType); end;

function gui.Edit:getField() return _gui_getFieldName(self.handle); end;
function gui.Edit:setField(field) _gui_setFieldName(self.handle, field); end;
		
function gui.Edit:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
function gui.Edit:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
	
function gui.Edit:getType() return _obj_getProp(self.handle, "EditType"); end;
function gui.Edit:setType(v) _obj_setProp(self.handle, "EditType", v) end;		

function gui.Edit:getMin() return _obj_getProp(self.handle, "MinValue"); end;
function gui.Edit:setMin(v) _obj_setProp(self.handle, "MinValue", v) end;		

function gui.Edit:getMax() return _obj_getProp(self.handle, "MaxValue"); end;
function gui.Edit:setMax(v) _obj_setProp(self.handle, "MaxValue", v) end;		

function gui.Edit:getDecimalPlaces() return _obj_getProp(self.handle, "DecimalPlaces"); end;
function gui.Edit:setDecimalPlaces(v) _obj_setProp(self.handle, "DecimalPlaces", v) end;			

function gui.Edit:getAsNumber() return _obj_getProp(self.handle, "AsNumber"); end;
function gui.Edit:setAsNumber(v) _obj_setProp(self.handle, "AsNumber", v) end;			
		
gui.Edit.props["textPrompt"] = {setter="setTextPrompt", getter="getTextPrompt", tipo="string"};
gui.Edit.props["transparent"] = {setter="setTransparent", getter="getTransparent", tipo="bool"};	
gui.Edit.props["isPasswordEdit"] = {setter="setIsPasswordEdit", getter="getIsPasswordEdit", tipo="bool"};

gui.Edit.props["keyboardType"] = {setter="setKeyboardType", getter="getKeyboardType", tipo="enum",
									values = {"default", "numbersAndPunctuation", "numberPad",
											  "phonePad", "alphabet", "url", "email"}};
										
gui.Edit.props["enterKeyType"] = {setter="setEnterKeyType", getter="getEnterKeyType", tipo="enum",
								  values = {"default", "done", "go", "next", "search", "send"}};											
										
gui.Edit.props["field"] = {setter="setField", getter="getField", tipo="string"};	
gui.Edit.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};	
gui.Edit.props["type"] = {setter = "setType", getter = "getType", tipo = "enum", values = {"text", "number", "float"}};					  
gui.Edit.props["min"] = {setter = "setMin", getter = "getMin", tipo = "double"};								  
gui.Edit.props["max"] = {setter = "setMax", getter = "getMax", tipo = "double"};			
gui.Edit.props["decimalPlaces"] = {setter = "setDecimalPlaces", getter = "getDecimalPlaces", tipo = "int"};			
gui.Edit.props["asNumber"] = {setter = "setAsNumber", getter = "getAsNumber", tipo = "double"};				

gui.Edit.eves["onUserChange"] = "";	

--[[ Objeto ComboBox ]]--

gui.ComboBox = gui.Control.inherit();
registerTag(gui.ComboBox, 'comboBox');

_addFontPropertiesToObject(gui.ComboBox);
_addTextStylePropsToObject(gui.ComboBox);

function gui.ComboBox:getTransparent() _obj_getProp(self.handle, "Transparent"); end;
function gui.ComboBox:setTransparent(transparent) _obj_setProp(self.handle, "Transparent", transparent); end;
			
function gui.ComboBox:getField() return _gui_getFieldName(self.handle); end;
function gui.ComboBox:setField(field) _gui_setFieldName(self.handle, field); end;
		
function gui.ComboBox:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
function gui.ComboBox:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
			
function gui.ComboBox:getText() return _obj_getProp(self.handle, "Text"); end;
function gui.ComboBox:setText(v) _obj_setProp(self.handle, "Text", v) end;					

function gui.ComboBox:getValue() return _obj_getProp(self.handle, "Value"); end;
function gui.ComboBox:setValue(v) _obj_setProp(self.handle, "Value", v) end;						
			
function gui.ComboBox:getItems() return _obj_getProp(self.handle, "ItemsI18N"); end;
function gui.ComboBox:setItems(v) _obj_setProp(self.handle, "ItemsI18N", v) end;	

function gui.ComboBox:getValues() return _obj_getProp(self.handle, "Values"); end;
function gui.ComboBox:setValues(v) _obj_setProp(self.handle, "Values", v) end;	
			
function gui.ComboBox:dropDown() _obj_invoke(self.handle, "InvokeDropDown"); end;
			
gui.ComboBox.props["transparent"] = {setter="setTransparent", getter="getTransparent", tipo="bool"};													
gui.ComboBox.props["field"] = {setter="setField", getter="getField", tipo="string"};	
gui.ComboBox.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};			
gui.ComboBox.props["items"] = {setter = "setItems", getter = "getItems", tipo = "table"};				
gui.ComboBox.props["values"] = {setter = "setValues", getter = "getValues", tipo = "table"};				
gui.ComboBox.props["text"] = {setter = "setText", getter = "getText", tipo = "string"};				
gui.ComboBox.props["value"] = {setter = "setValue", getter = "getValue", tipo = "string"};				

gui.ComboBox.eves["onChange"] = "";

--[[ Objeto ColorComboBox ]]--

gui.ColorComboBox = gui.Control.inherit();
registerTag(gui.ColorComboBox, 'colorComboBox');

function gui.ColorComboBox:getColor() return _obj_getProp(self.handle, "Color"); end;
function gui.ColorComboBox:setColor(v) _obj_setProp(self.handle, "Color", v); end;

function gui.ColorComboBox:getUseAlpha() return _obj_getProp(self.handle, "UseAlpha"); end;
function gui.ColorComboBox:setUseAlpha(v) _obj_setProp(self.handle, "UseAlpha", v); end;	
			
function gui.ColorComboBox:getField() return _gui_getFieldName(self.handle); end;
function gui.ColorComboBox:setField(field) _gui_setFieldName(self.handle, field); end;
		
function gui.ColorComboBox:getFrameRegion() return _obj_getProp(self.handle, "FrameRegion"); end;
function gui.ColorComboBox:setFrameRegion(frameRegion) _obj_setProp(self.handle, "FrameRegion", frameRegion) end;			
				
function gui.ColorComboBox:dropDown() _obj_invoke(self.handle, "InvokeDropDown"); end;
			
gui.ColorComboBox.props["color"] = {setter="setColor", getter="getColor", tipo="color"};													
gui.ColorComboBox.props["useAlpha"] = {setter = "setUseAlpha", getter = "getUseAlpha", tipo = "bool"};				
gui.ColorComboBox.props["field"] = {setter="setField", getter="getField", tipo="string"};	
gui.ColorComboBox.props["frameRegion"] = {setter = "setFrameRegion", getter = "getFrameRegion", tipo = "string"};				

gui.ColorComboBox.eves["onChange"] = "";
gui.ColorComboBox.eves["onUserChange"] = "";

--[[ Objeto TextEditor ]]--

gui.TextEditor = gui.TextControl.inherit();
registerTag(gui.TextEditor, 'textEditor');

_addEditablePropsToObject(gui.TextEditor);

function gui.TextEditor:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.TextEditor:setField(v) _obj_setProp(self.handle, "FieldName", v); end;

function gui.TextEditor:getTransparent() return _obj_getProp(self.handle, "Transparent"); end;
function gui.TextEditor:setTransparent(v) _obj_setProp(self.handle, "Transparent", v); end;	
	
gui.TextEditor.props["field"] = {setter="setField", getter="getField", tipo="string"};		
gui.TextEditor.props["transparent"] = {setter="setTransparent", getter="getTransparent", tipo="bool"};	

--[[ Objeto TabControl ]]--

gui.TabControl = gui.Control.inherit();
registerTag(gui.TabControl, 'tabControl');

function gui.TabControl:getTabIndex() return _obj_getProp(self.handle, "TabIndex"); end;
function gui.TabControl :setTabIndex(idx) _obj_setProp(self.handle, "TabIndex", idx); end;
	
gui.TabControl .props["tabIndex"] = {setter="setTabIndex", getter="getTabIndex", tipo="int"};	

--[[ Objeto Tab / TabItem ]]--

gui.TabItem = gui.Control.inherit();
registerTag(gui.TabItem, 'tab');

function gui.TabItem:getText() return _obj_getProp(self.handle, "Title"); end;
function gui.TabItem:setText(text) _obj_setProp(self.handle, "Title", text); end;

function gui.TabItem:getTitle() return _obj_getProp(self.handle, "Title"); end;
function gui.TabItem:setTitle(title) _obj_setProp(self.handle, "Title", title); end;	
function gui.TabItem:activate() _obj_invoke(self.handle, "Activate"); end;		

gui.TabItem.props["text"] = {setter="setText", getter="getText", tipo="string"};
gui.TabItem.props["title"] = {setter="setTitle", getter="getTitle", tipo="string"};

--[[ Objeto ScrollBox ]]--

gui.ScrollBox = gui.Control.inherit();
registerTag(gui.ScrollBox, 'scrollBox');

--[[ Objeto Shape ]]--

gui.Shape = gui.Control.inherit();

function gui.Shape:getColor() return _obj_getProp(self.handle, "Fill.Color"); end;
function gui.Shape:setColor(color) _gui_shapeSetFillColor(self.handle, color); end;

function gui.Shape:getStrokeColor() return _obj_getProp(self.handle, "Stroke.Color"); end;
function gui.Shape:setStrokeColor(color) _gui_shapeSetStrokeColor(self.handle, color); end;

function gui.Shape:getStrokeSize() return _obj_getProp(self.handle, "Stroke.Thickness"); end;
function gui.Shape:setStrokeSize(size) _gui_shapeSetStrokeSize(self.handle, size); end;	

function gui.Shape:getStrokeCap() return _obj_getProp(self.handle, "Stroke.Cap"); end;
function gui.Shape:setStrokeCap(v) _gui_shapeSetStrokeCap(self.handle, v); end;		

function gui.Shape:getStrokeJoin() return _obj_getProp(self.handle, "Stroke.Join"); end;
function gui.Shape:setStrokeJoin(v) _gui_shapeSetStrokeCap(self.handle, v); end;			

function gui.Shape:getStrokeDash() return _obj_getProp(self.handle, "Stroke.Dash"); end;
function gui.Shape:setStrokeDash(v) _gui_shapeSetStrokeCap(self.handle, v); end;	

gui.Shape.props["color"] = {setter="setColor", getter="getColor", tipo="color"};
gui.Shape.props["strokeColor"] = {setter="setStrokeColor", getter="getStrokeColor", tipo="color"};
gui.Shape.props["strokeSize"] = {setter="setStrokeSize", getter="getStrokeSize", tipo="double"};	

gui.Shape.props["strokeCap"] = {setter="setStrokeCap", getter="getStrokeCap", tipo="enum",
						        values={"flat", "round"}};		
						   
gui.Shape.props["strokeJoin"] = {setter="setStrokeJoin", getter="getStrokeJoin", tipo="enum",
					             values={"miter", "round", "bevel"}};

gui.Shape.props["strokeDash"] = {setter="setStrokeDash", getter="getStrokeDash", tipo="enum",
						          values={"solid", "dash", "dot", "dashDot", "dashDotDot"}};	

--[[ Objeto Rectangle ]]--

gui.Rectangle = gui.Shape.inherit();
registerTag(gui.Rectangle, 'rectangle');

function gui.Rectangle:getCorners() return _obj_getProp(self.handle, "Corners"); end;
function gui.Rectangle:setCorners(corners) _obj_setProp(self.handle, "Corners", corners); end;

function gui.Rectangle:getCornerType() return _obj_getProp(self.handle, "CornerType"); end;
function gui.Rectangle:setCornerType(cornerType) _obj_setProp(self.handle, "CornerType", cornerType); end;

function gui.Rectangle:getSides() return _obj_getProp(self.handle, "CornerType"); end;
function gui.Rectangle:setSides(sides) _obj_setProp(self.handle, "Sides", sides); end;	

function gui.Rectangle:getXradius() return _obj_getProp(self.handle, "XRadius"); end;
function gui.Rectangle:setXradius(xradius) _obj_setProp(self.handle, "XRadius", xradius); end;		

function gui.Rectangle:getYradius() return _obj_getProp(self.handle, "YRadius"); end;
function gui.Rectangle:setYradius(yradius) _obj_setProp(self.handle, "YRadius", yradius); end;			
			
gui.Rectangle.props["corners"] = {setter="setCorners", getter="getCorners", tipo="set", 
						 values={"topLeft", "topRight", "bottomLeft", "bottomRight"}};

gui.Rectangle.props["cornerType"] = {setter="setCornerType", getter="getCornerType", tipo="enum", 
							values={"round", "bevel", "innerRound", "innerLine"}};
							
gui.Rectangle.props["sides"] = {setter="setSides", getter="getSides", tipo="set", 
					   values={"top", "left", "bottom", "right"}};		
					   
gui.Rectangle.props["xradius"] = {setter="setXradius", getter="getXradius", tipo="double"};						   
gui.Rectangle.props["yradius"] = {setter="setYradius", getter="getYradius", tipo="double"};		

--[[ Objeto Path ]]--

gui.Path = gui.Shape.inherit();
registerTag(gui.Path, 'path');

function gui.Path:getPathData() return _obj_getProp(self.handle, "PathData"); end;
function gui.Path:setPathData(v) _obj_setProp(self.handle, "PathData", v); end;

function gui.Path:getMode() return _obj_getProp(self.handle, "WrapMode"); end;
function gui.Path:setMode(v) _obj_setProp(self.handle, "WrapMode", v); end;	

function gui.Path:getRoundToPixel() return _obj_getProp(self.handle, "RoundToPixels"); end;
function gui.Path:setRoundToPixel(v) _obj_setProp(self.handle, "RoundToPixels", v); end;		
								   
gui.Path.props["data"] = {setter="setPathData", getter="getPathData", tipo="string"};						   
gui.Path.props["pathData"] = gui.Path.props["data"]

gui.Path.props["mode"] = {setter="setMode", getter="getMode", tipo="enum",
					      values={"original", "fit", "stretch", "tile"}};	
					  
gui.Path.props["wrapMode"] = gui.Path.props["mode"]				   							 										  
gui.Path.props["roundToPixel"] = {setter="setRoundToPixel", getter="getRoundToPixel", tipo="bool"};

--[[ Objeto HorzLine ]]--

gui.HorzLine = gui.Shape.inherit();
registerTag(gui.HorzLine, 'horzLine');

--[[ Objeto Frame ]]--

gui.Frame = gui.Layout.inherit();
registerTag(gui.Frame, 'frame');

function gui.Frame:getURL() return _obj_getProp(self.handle, "FrameURL"); end;
function gui.Frame:setURL(url) _obj_setProp(self.handle, "FrameURL", url); end;			

function gui.Frame:getFrameStyle() return _obj_getProp(self.handle, "FrameURL"); end;
function gui.Frame:setFrameStyle(frameStyle) _obj_setProp(self.handle, "FrameURL", frameStyle); end;				

function gui.Frame:getSrc() return _obj_getProp(self.handle, "FrameURL"); end;
function gui.Frame:setSrc(url) _obj_setProp(self.handle, "FrameURL", url); end;								

gui.Frame.props["url"] = {setter="setURL", getter="getURL", tipo="url"};
gui.Frame.props["frameStyle"] = {setter="setFrameStyle", getter="getFrameStyle", tipo="url"};	
gui.Frame.props["src"] = {setter="setSrc", getter="getSrc", tipo="url"};		


--[[ Objeto DataLink ]]--

gui.DataLink = objs.HierarchyObject.inherit();
registerTag(gui.DataLink, 'dataLink');

function gui.DataLink:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.DataLink:setField(v) return _obj_setProp(self.handle, "FieldName", v); end;

function gui.DataLink:getFields() return _obj_getProp(self.handle, "Fields"); end;
function gui.DataLink:setFields(v) return _obj_setProp(self.handle, "Fields", v); end;	

function gui.DataLink:getDefaultValue() return _obj_getProp(self.handle, "DefaultValue"); end;
function gui.DataLink:setDefaultValue(v) return _obj_setProp(self.handle, "DefaultValue", v); end;		

function gui.DataLink:getDefaultValues() return _obj_getProp(self.handle, "DefaultValues"); end;
function gui.DataLink:setDefaultValues(v) return _obj_setProp(self.handle, "DefaultValues", v); end;			

function gui.DataLink:beginUpdate() end;
function gui.DataLink:endUpdate() end;
				
gui.DataLink.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
gui.DataLink.props["fields"] = {setter = "setFields", getter = "getFields", tipo = "table"};			
gui.DataLink.props["defaultValue"] = {setter = "setDefaultValue", getter = "getDefaultValue", tipo = "string"};		
gui.DataLink.props["defaultValues"] = {setter = "setDefaultValues", getter = "getDefaultValues", tipo = "table"};			

gui.DataLink.eves["onChange"] = "field, oldValue, newValue";
gui.DataLink.eves["onPersistedChange"] = "field, oldValue, newValue";		
gui.DataLink.eves["onUserChange"] = "field, oldValue, newValue";	
gui.DataLink.eves["onChildAdded"] = "node";
gui.DataLink.eves["onChildRemoved"] = "node";

--[[ Objeto Record List ]]--

gui.RecordList = gui.Layout.inherit();
registerTag(gui.RecordList, 'recordList');

function gui.RecordList:getField() return _obj_getProp(self.handle, "FieldName"); end;
function gui.RecordList:setField(v) _obj_setProp(self.handle, "FieldName", v) end;		

function gui.RecordList:getItemHeight() return _obj_getProp(self.handle, "ItemHeight"); end;
function gui.RecordList:setItemHeight(v) _obj_setProp(self.handle, "ItemHeight", v) end;			

function gui.RecordList:getMinHeight() return _obj_getProp(self.handle, "MinHeight"); end;
function gui.RecordList:setMinHeight(v) _obj_setProp(self.handle, "MinHeight", v) end;		

function gui.RecordList:getMinQt() return _obj_getProp(self.handle, "MinQt"); end;
function gui.RecordList:setMinQt(v) _obj_setProp(self.handle, "MinQt", v) end;			

function gui.RecordList:getAutoHeight() return _obj_getProp(self.handle, "AutoHeight"); end;
function gui.RecordList:setAutoHeight(v) _obj_setProp(self.handle, "AutoHeight", v) end;			

function gui.RecordList:getTemplateForm() return _obj_getProp(self.handle, "TemplateForm"); end;
function gui.RecordList:setTemplateForm(v) _obj_setProp(self.handle, "TemplateForm", v); end;			

function gui.RecordList:getLayout() return _obj_getProp(self.handle, "RecordListLayout"); end;
function gui.RecordList:setLayout(v) _obj_setProp(self.handle, "RecordListLayout", v); end;	

function gui.RecordList:getSelectable() return _obj_getProp(self.handle, "SelectableList"); end;
function gui.RecordList:setSelectable(v) _obj_setProp(self.handle, "SelectableList", v); end;	

function gui.RecordList:append() return ndb.openNodeFacade(_obj_invokeEx(self.handle, "AppendItemEx")); end;

function gui.RecordList:getSelectedNode() return ndb.openNodeFacade(_gui_recordListGetSelectedNodeHandle(self.handle)); end;	
function gui.RecordList:setSelectedNode(node) _gui_recordListSetSelectedNodeHandle(self.handle, ndb.getNodeHandle(node)); end;

function gui.RecordList:getSelectedForm() return objs.tryFindFromHandle(_gui_recordListGetSelectedFormHandle(self.handle)); end;

function gui.RecordList:scrollToNode(node) _gui_recordListScrollToNodeHandle(self.handle, ndb.getNodeHandle(node)); end;
function gui.RecordList:sort() _obj_invoke(self.handle, "ReorganizarItens"); end;

function gui.RecordList:getChildren()
	local ret = {};
	local childCount = _obj_getProp(self.handle, "ChildFormCount");
	local child;
	local childHandle;
	local idxDest = 1;
		
	for i = 0, childCount - 1, 1 do
		childHandle = _gui_rcl_getChild(self.handle, i);
		
		if (childHandle ~= nil) then							
			child = gui.fromHandle(childHandle);
			
			if (type(child) == "table") then							
				ret[idxDest] = child;
				idxDest = idxDest + 1;
			end
		end;	
	end
	
	return ret;
end;

gui.RecordList.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
gui.RecordList.props["templateForm"] = {setter = "setTemplateForm", getter = "getTemplateForm", tipo = "string"};				
gui.RecordList.props["itemHeight"] = {setter = "setItemHeight", getter = "getItemHeight", tipo = "double"};					
gui.RecordList.props["minHeight"] = {setter = "setMinHeight", getter = "getMinHeight", tipo = "double"};						
gui.RecordList.props["autoHeight"] = {setter = "setAutoHeight", getter = "getAutoHeight", tipo = "bool"};		
gui.RecordList.props["minQt"] = {setter = "setMinQt", getter = "getMinQt", tipo = "int"};		
gui.RecordList.props["layout"] = {setter = "setLayout", getter = "getLayout", tipo = "enum",
						values = {"vertical", "horizontal", "horizontalTiles", "verticalTiles"}};			
gui.RecordList.props["selectable"] = {setter = "setSelectable", getter = "getSelectable", tipo = "bool"};		

gui.RecordList.props["selectedNode"] = {getter = "getSelectedNode", setter="setSelectedNode", tipo = "table"};		
gui.RecordList.props["selectedForm"] = {getter = "getSelectedForm", tipo = "table"};		

gui.RecordList.eves["onSelect"] = "";
gui.RecordList.eves["onBeginEnumeration"] = "";
gui.RecordList.eves["onItemAdded"] = "node, form";
gui.RecordList.eves["onItemRemoved"] = "node, form";
gui.RecordList.eves["onEndEnumeration"] = "";
gui.RecordList.eves["onCompare"] = "nodeA, nodeB";

--[[ Objeto GridRecordList ]]--

gui.GridRecordList = gui.Layout.inherit();	
registerTag(gui.GridRecordList, 'gridRecordList');		
				
function gui.GridRecordList:append() return ndb.openNodeFacade(_obj_invokeEx(self.handle, "AppendItemEx")); end;
function gui.GridRecordList:reorganize() _obj_invoke(self.handle, "Reorganize"); end;
function gui.GridRecordList:getChildren() return _gui_getChildrenObj(self.handle); end;
function gui.GridRecordList:getSelectedNode() return _obj_invokeEx(self.handle, "GetSelectedNodeEx"); end;	
function gui.GridRecordList:setSelectedNode(node) _obj_invokeEx(self.handle, "SetSelectedNodeEx", node); end;
function gui.GridRecordList:getSelectedForm() return _obj_invokeEx(self.handle, "GetSelectedFormEx"); end;
function gui.GridRecordList:scrollToNode(node) _obj_invokeEx(self.handle, "ScrollToNodeEx", node); end;

gui.GridRecordList.props["field"] = {writeProp = "DataFieldName", readProp = "DataFieldName", tipo = "string"};		
gui.GridRecordList.props["templateForm"] = {writeProp = "TemplateForm", readProp = "TemplateForm", tipo = "string"};				
gui.GridRecordList.props["minQt"] = {writeProp = "MinQuantity", readProp = "MinQuantity", tipo = "int"};		
gui.GridRecordList.props["selectable"] = {writeProp = "IsSelectableList", readProp = "IsSelectableList", tipo = "bool"};		
gui.GridRecordList.props["selectedNode"] = {getter = "getSelectedNode", setter="setSelectedNode", tipo = "table"};		
gui.GridRecordList.props["paging"] = {writeProp = "IsPagingEnabled", readProp = "IsPagingEnabled", tipo = "bool"};		
gui.GridRecordList.props["pageSize"] = {writeProp = "PageSize", readProp = "PageSize", tipo = "int"};
gui.GridRecordList.props["pageIndex"] = {writeProp = "PageIndex", readProp = "PageIndex", tipo = "int"};
gui.GridRecordList.props["filterFields"] = {writeProp = "FilteringFields", readProp = "FilteringFields", tipo = "table"};

gui.GridRecordList.props["selectedForm"] = {getter = "getSelectedForm", tipo = "table"};	
gui.GridRecordList.props["pageCount"] = {readProp = "PageCount", tipo = "int"};

gui.GridRecordList.eves["onSelect"] = "";
gui.GridRecordList.eves["onItemAdded"] = "node";
gui.GridRecordList.eves["onItemRemoved"] = "node";
gui.GridRecordList.eves["onItemFiltered"] = "node";
gui.GridRecordList.eves["onItemUnfiltered"] = "node";
gui.GridRecordList.eves["onItemShow"] = "node, form";
gui.GridRecordList.eves["onItemHide"] = "node, form";
gui.GridRecordList.eves["onCompare"] = "left, right";
gui.GridRecordList.eves["onFilter"] = "node";
gui.GridRecordList.eves["onGroupId"] = "node";
gui.GridRecordList.eves["onGroupCompare"] = "left, right";
gui.GridRecordList.eves["onGroupHeader"] = "id";
gui.GridRecordList.eves["onGroupShow"] = "id, header";
gui.GridRecordList.eves["onGroupHide"] = "id, header";
gui.GridRecordList.eves["onEmptyState"] = "";
gui.GridRecordList.eves["onPagingStateChange"] = "";
gui.GridRecordList.eves["onBeginOrganization"] = "";
gui.GridRecordList.eves["onEndOrganization"] = "";

--[[ Objeto GridRecordListPgCtrl ]]--

gui.GridRecordListPgNav = gui.Layout.inherit();
registerTag(gui.GridRecordListPgNav, 'gridRecordListPgNav');

function gui.GridRecordListPgNav:setTarget(value) _obj_invokeEx(self.handle, 'SetGridRecordList', value); end;
function gui.GridRecordListPgNav:getTarget() return _obj_invokeEx(self.handle, 'GetGridRecordList'); end;

gui.GridRecordListPgNav.props["target"] = {setter = "setTarget", getter = "getTarget", tipo = "obj", class=gui.GridRecordList};

--[[ Objeto DataScopeBox ]]--

gui.DataScopeBox = gui.Layout.inherit();
registerTag(gui.DataScopeBox, 'dataScopeBox');

function gui.DataScopeBox:getNodeObject() return rawget(self, "__nodeObject"); end;

function gui.DataScopeBox:setNodeObject(nodeObject) 
	rawset(self, "__nodeObject", nodeObject);
	_gui_assignNodeObject(self.handle, ndb.getNodeHandle(nodeObject));
end;	

gui.DataScopeBox.props["scopeNode"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};		
gui.DataScopeBox.props["nodeObject"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};		
gui.DataScopeBox.props["node"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};		

gui.DataScopeBox.eves["onNodeReady"] = "";
gui.DataScopeBox.eves["onNodeUnready"] = "";
gui.DataScopeBox.eves["onNodeChanged"] = "";

--[[ Objeto RichEdit ]]--

gui.RichEdit = gui.Control.inherit();
registerTag(gui.RichEdit, 'richEdit');

function gui.RichEdit:getField() return _gui_getFieldName(self.handle); end;
function gui.RichEdit:setField(v) _gui_setFieldName(self.handle, v); end;

function gui.RichEdit:beginEdit() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LBeginEdit") end; end;
function gui.RichEdit:endEdit() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEndEdit") end; end;

function gui.RichEdit:selectAll() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LSelectAll") end; end;
function gui.RichEdit:unselect() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LUnselect") end; end;	
function gui.RichEdit:getSelectionPosInChars() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionPosInChars"); else return 0, 0; end; end;
function gui.RichEdit:getSelectionPosInGlyphs() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionPosInGlyphs"); else return 0, 0; end; end;	
function gui.RichEdit:getIsSelectionForward() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetIsSelectionForward"); else return true; end; end;
function gui.RichEdit:getSelectionText() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionText"); else return ""; end; end;		
function gui.RichEdit:getSelectionURL() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionURL"); else return ""; end; end;			
function gui.RichEdit:getSelectionFontColor() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionFontColor"); else return "Black"; end; end;
function gui.RichEdit:getSelectionFontBkgColor() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionFontBkgColor"); else return "White"; end; end;
function gui.RichEdit:getSelectionFontSize() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionFontSize"); else return 14; end; end;
function gui.RichEdit:getSelectionFontFamily() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionFontFamily"); else return "Roboto"; end; end;
function gui.RichEdit:getSelectionFontStyle() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionFontStyle"); else return {}; end; end;
function gui.RichEdit:getSelectionFloat() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionFloat"); else return "none"; end; end;
function gui.RichEdit:getSelectionParaAlign() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetSelectionParaAlign"); else return "left"; end; end;
	
function gui.RichEdit:gotoStart(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoStart", holdSelection); end; end;
function gui.RichEdit:gotoEnd(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoEnd", holdSelection); end; end;
function gui.RichEdit:gotoNext(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoNext", holdSelection); end; end;
function gui.RichEdit:gotoPrevious(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoPrevious", holdSelection); end; end;
function gui.RichEdit:gotoStartOfLine(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoStartOfLine", holdSelection); end; end;
function gui.RichEdit:gotoEndOfLine(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoEndOfLine", holdSelection); end; end;
function gui.RichEdit:gotoNextWord(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoNextWord", holdSelection); end; end;
function gui.RichEdit:gotoPreviousWord(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoPreviousWord", holdSelection); end; end;
function gui.RichEdit:gotoLineUp(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoLineUp", holdSelection); end; end;
function gui.RichEdit:gotoLineDown(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoLineDown", holdSelection); end; end;
function gui.RichEdit:gotoPageUp(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoPageUp", holdSelection); end; end;
function gui.RichEdit:gotoPageDown(holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoPageDown", holdSelection); end; end;
function gui.RichEdit:gotoPositionInGlyphs(pos, holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoPositionInGlyphs", pos, holdSelection); end; end;
function gui.RichEdit:gotoPositionInChars(pos, holdSelection) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGotoPositionInChars", pos, holdSelection); end; end;

function gui.RichEdit:copySelectionToClipboard() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LCopySelectionToClipboard"); end; end;

function gui.RichEdit:deleteSelection() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_DeleteSelection"); end; end;		
function gui.RichEdit:insertText(text) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_InsertText", text); end; end;
function gui.RichEdit:insertTalemark(talemarkText, talemarkOptions, talemarkSheetStyle) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_InsertTalemark", talemarkText, talemarkOptions, talemarkSheetStyle); end; end;
function gui.RichEdit:insertImage(params) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_InsertImage", params); end; end;
function gui.RichEdit:breakLine() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_BreakLine"); end; end;
function gui.RichEdit:breakParagraph() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_BreakParagraph"); end; end;
function gui.RichEdit:indent(qty) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_Indent", qty); end; end;
function gui.RichEdit:pasteFromClipboard() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_PasteFromClipboard"); end; end;
function gui.RichEdit:cutSelectionToClipboard() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_CutSelectionToClipboard"); end; end;
function gui.RichEdit:setSelectionURL(url) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionURL", url); end; end;
function gui.RichEdit:setSelectionFontColor(color) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionFontColor", color); end; end;
function gui.RichEdit:setSelectionFontBkgColor(color) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionFontBkgColor", color); end; end;
function gui.RichEdit:setSelectionFontSize(size) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionFontSize", size); end; end;
function gui.RichEdit:setSelectionFontFamily(family) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionFontFamily", family); end; end;
function gui.RichEdit:setSelectionFontStyle(style) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionFontStyle", style); end; end;
function gui.RichEdit:setSelectionFloat(floatMode) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionFloat", floatMode); end; end;
function gui.RichEdit:setSelectionParaAlign(paraAlign) if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LEditOp_SetSelectionParaAlign", paraAlign); end; end;
	
function gui.RichEdit:getLengthInChars() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetLengthInChars"); else return 0; end; end;		
function gui.RichEdit:getLengthInGlyphs() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetLengthInGlyphs"); else return 0; end; end;
function gui.RichEdit:getText() if System.checkAPIVersion(87, 4) then return _obj_invokeEx(self.handle, "LGetText"); else return ""; end; end;	
		
gui.RichEdit.props["animateImages"] = {readProp = "CanAnimateImages", writeProp = "CanAnimateImages", tipo = "bool"};			
gui.RichEdit.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
gui.RichEdit.props["backgroundColor"] = {readProp = "BackgroundColor", writeProp = "BackgroundColor", tipo = "color"};
gui.RichEdit.props["defaultFontColor"] = {readProp = "DefaultFontColor", writeProp = "DefaultFontColor", tipo = "color"};
gui.RichEdit.props["defaultFontSize"] = {readProp = "DefaultFontSize", writeProp = "DefaultFontSize", tipo = "double"};	
gui.RichEdit.props["showToolbar"] = {readProp = "ShowToolbar", writeProp = "ShowToolbar", tipo = "bool"};
gui.RichEdit.props["readOnly"] = {readProp = "ReadOnly", writeProp = "ReadOnly", tipo = "bool"};
gui.RichEdit.props["hideSelection"] = {readProp = "HideSelectionNoFocus", writeProp = "HideSelectionNoFocus", tipo = "bool"};

--[[ Objeto Popup ]]--

gui.Popup = gui.Layout.inherit();
registerTag(gui.Popup, 'popup');

function gui.Popup:getCancelable() return _obj_getProp(self.handle, "Cancelavel"); end;
function gui.Popup:setCancelable(v) _obj_setProp(self.handle, "Cancelavel", v) end;		

function gui.Popup:getBackOpacity() return _obj_getProp(self.handle, "BackOpacity"); end;
function gui.Popup:setBackOpacity(v) _obj_setProp(self.handle, "BackOpacity", v) end;			

function gui.Popup:getDrawContainer() return _obj_getProp(self.handle, "DesenharPopupContainer"); end;
function gui.Popup:setDrawContainer(v) _obj_setProp(self.handle, "DesenharPopupContainer", v) end;			

function gui.Popup:setNodeObject(nodeObject) 
	rawset(self, "nodeObject", nodeObject);
	_gui_assignNodeObject(self.handle, ndb.getNodeHandle(nodeObject));
end;

function gui.Popup:getNodeObject() return rawget(self, "nodeObject") end;	

function gui.Popup:showPopupEx(placement, control)
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

gui.Popup.show = gui.Popup.showPopupEx;
gui.Popup.showPopup = gui.Popup.showPopupEx;

function gui.Popup:closePopup(cancelar, forcar) _obj_invoke(self.handle, "FecharPopup", cancelar == true, forcar == true); end;
function gui.Popup:close(cancelar, forcar) _obj_invoke(self.handle, "FecharPopup", cancelar == true, forcar == true); end;

gui.Popup.props["cancelable"] = {setter = "setCancelable", getter = "getCancelable", tipo = "bool"};		
gui.Popup.props["backOpacity"] = {setter = "setBackOpacity", getter = "getBackOpacity", tipo = "double"};			
gui.Popup.props["drawContainer"] = {setter = "setDrawContainer", getter = "getDrawContainer", tipo = "bool"};				
gui.Popup.props["scopeNode"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};					
gui.Popup.props["nodeObject"] = {setter = "setNodeObject", getter = "getNodeObject", tipo = "table"};					
gui.Popup.props["node"] = gui.Popup.props["nodeObject"];
gui.Popup.props["scopeNode"] = gui.Popup.props["nodeObject"];
gui.Popup.props["autoScopeNode"] = {writeProp = "AutoScopeNode", readProp = "AutoScopeNode", tipo = "bool"};

gui.Popup.eves["onClose"] = "canceled";	
gui.Popup.eves["onCanClose"] = "canceled";
gui.Popup.eves["onCalculateSize"] = "dueToResize, width, height";

gui.Popup.eves["onNodeReady"] = "";
gui.Popup.eves["onNodeUnready"] = "";
gui.Popup.eves["onNodeChanged"] = "";

--[[ Objeto Progress Bar ]]--

gui.ProgressBar = gui.Control.inherit();
registerTag(gui.ProgressBar, 'progressBar');

function gui.ProgressBar:getColor() return _obj_getProp(self.handle, "Color"); end;
function gui.ProgressBar:setColor(v) _obj_setProp(self.handle, "Color", v) end;		

function gui.ProgressBar:getPosition() return _obj_getProp(self.handle, "Value"); end;
function gui.ProgressBar:setPosition(v) _obj_setProp(self.handle, "Value", v) end;		

function gui.ProgressBar:getMin() return _obj_getProp(self.handle, "Min"); end;
function gui.ProgressBar:setMin(v) _obj_setProp(self.handle, "Min", v) end;			

function gui.ProgressBar:getMax() return _obj_getProp(self.handle, "Max"); end;
function gui.ProgressBar:setMax(v) _obj_setProp(self.handle, "Max", v) end;				

function gui.ProgressBar:getField() return _obj_getProp(self.handle, "Field"); end;
function gui.ProgressBar:setField(v) _obj_setProp(self.handle, "Field", v); end;			

function gui.ProgressBar:getFieldMin() return _obj_getProp(self.handle, "FieldMin"); end;
function gui.ProgressBar:setFieldMin(v) _obj_setProp(self.handle, "FieldMin", v); end;		

function gui.ProgressBar:getFieldMax() return _obj_getProp(self.handle, "FieldMax"); end;
function gui.ProgressBar:setFieldMax(v) _obj_setProp(self.handle, "FieldMax", v); end;			

function gui.ProgressBar:getMouseGlow() return _obj_getProp(self.handle, "MouseGlow"); end;
function gui.ProgressBar:setMouseGlow(v) _obj_setProp(self.handle, "MouseGlow", v); end;				

function gui.ProgressBar:getColorMode() return _obj_getProp(self.handle, "ColorMode"); end;
function gui.ProgressBar:setColorMode(v) _obj_setProp(self.handle, "ColorMode", v); end;		

gui.ProgressBar.props["color"] = {setter = "setColor", getter = "getColor", tipo = "color"};		
gui.ProgressBar.props["position"] = {setter = "setPosition", getter = "getPosition", tipo = "double"};	
gui.ProgressBar.props["value"] = {setter = "setPosition", getter = "getPosition", tipo = "double"};		
gui.ProgressBar.props["min"] = {setter = "setMin", getter = "getMin", tipo = "double"};		
gui.ProgressBar.props["max"] = {setter = "setMax", getter = "getMax", tipo = "double"};			
gui.ProgressBar.props["field"] = {setter = "setField", getter = "getField", tipo = "string"};		
gui.ProgressBar.props["fieldMin"] = {setter = "setFieldMin", getter = "getFieldMin", tipo = "string"};		
gui.ProgressBar.props["fieldMax"] = {setter = "setFieldMax", getter = "getFieldMax", tipo = "string"};			
gui.ProgressBar.props["mouseGlow"] = {setter = "setMouseGlow", getter = "getMouseGlow", tipo = "bool"};	
gui.ProgressBar.props["colorMode"] = {setter = "setColorMode", getter = "getColorMode", tipo = "enum", values={"default", "hl"}};	

--[[ Objeto Timer ]]--

gui.Timer = objs.Timer;
registerTag(gui.Timer, 'timer');


--[[ Objeto ActivityIndicator ]]--

gui.ActivityIndicator = gui.Control.inherit();
registerTag(gui.ActivityIndicator, 'activityIndicator');

--[[ Objeto InertialMovement ]]--

gui.InertialMovement = objs.newClass()
registerTag(gui.InertialMovement, 'TInertialMovement');

gui.newInertialMovement = gui.InertialMovement.new; 

function gui.InertialMovement:setPos(x, y) _obj_invoke(self.handle, "SetPosition", x, y); end;
function gui.InertialMovement:getPos() return _obj_invokeEx(self.handle, "ExGetPosition"); end;
function gui.InertialMovement:setBounds(minX, minY, maxX, maxY) _obj_invoke(self.handle, "SetBounds", minX, minY, maxX, maxY); end;
function gui.InertialMovement:pointerDown(x, y) _obj_invoke(self.handle, "PointerDown", x, y); end;
function gui.InertialMovement:pointerMove(x, y) _obj_invoke(self.handle, "PointerMove", x, y); end;
function gui.InertialMovement:pointerUp(x, y) _obj_invoke(self.handle, "PointerUp", x, y); end;
function gui.InertialMovement:pointerLeave() _obj_invoke(self.handle, "PointerLeave"); end;
function gui.InertialMovement:pointerWheel(deltaX, deltaY) _obj_invoke(self.handle, "PointerWheel", deltaX, deltaY); end;

gui.InertialMovement.props["active"] = {tipo = "boolean", readProp = "Active", writeProp="Active"};
gui.InertialMovement.props["animated"] = {tipo = "boolean", readProp = "Animated", writeProp="Animated"};
gui.InertialMovement.props["decelerationRate"] = {tipo = "double", readProp = "DecelerationRate", writeProp="DecelerationRate"};

gui.InertialMovement.eves["onChange"] = "";							

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
 
  objs.registerHandleIfNeeded(handle, ctrl);
  return ctrl;
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
	return gui.Form.new();
  end;
 
  if (type(formName) == "string" and (rrpg ~= nil)) then
	  local formFactory = rrpg.forms[formName];
	  
	  if formFactory ~= nil then
		local frm = formFactory.newEditor();
		assert(frm ~= nil);
		
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
		assert(frm ~= nil);
		
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
		rrpgObjs.registerHandleIfNeeded(popupShower.handle, popupShower);
		_popupFormShowers[form] = popupShower;
		
		local frmHandle = form.handle;
		_obj_invoke(popupShower.handle, "SetFormHandle", frmHandle);		
		
		popupShower:addEventListener("OnPopupClose", 
			function()
				local frmRef = objs.tryFindFromHandle(frmHandle);
				
				if frmRef ~= nil then
					_popupFormShowers[frmRef] = nil;
				end;
			end);
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

function gui.asyncOpenFirecastURI(uri, params)
	local promiseHandle = _obj_invokeEx(gui.handle, "AsyncOpenFirecastURI", uri, params);
	return Async.Promise.wrap(promiseHandle);
end;

function gui.toast(message)
	return _gui_toast(message);
end;

function gui.getShiftState()
	return _gui_getShiftState();
end;

-- [ Form cache control ]--

local __frmCachedByTime = {cacheName = {}, countByName = {}, genCacheId = 1};

function __frmCachedByTime:tryAcquireByName(name)
	if (type(name) ~= "string") or (name == "") then
		return nil;
	end;
	
	local formsWithSameName = self.cacheName[name];
	
	if formsWithSameName ~= nil then
		local form = nil;
		
		for k, v in pairs(formsWithSameName) do
			if (type(k) == "table") and (v ~= nil) then
				form = k;
				break;
			end;
		end;
		
		if form ~= nil then
			formsWithSameName[form] = nil;
			self.countByName[name] = (self.countByName[name] or 0) - 1;
			
			if self.countByName[name] <= 0 then
				self.cacheName[name] = nil;
				self.countByName[name] = nil;
			end;
			
			rawset(form, '__timeCacheId', nil);
			
			local timeoutId = rawget(form, '__timeCacheTimeoutId');
			
			if timeoutId ~= nil then
				Utils.clearTimeout(timeoutId);
				rawset(form, '__timeCacheTimeoutId', nil);			
			end;
			
			return form;
		else	
			return nil;
		end;
	else	
		return nil;
	end;
end;

function __frmCachedByTime:createTimeoutCallback(name, form, cacheId)
	return function()
		local currentCacheId = rawget(form, "__timeCacheId");	
		local formsWithSameName = self.cacheName[name];
		
		if (formsWithSameName ~= nil) and (currentCacheId == cacheId) then
			-- Remove from cache to let GC collect the form
			
			rawset(form, '__timeCacheId', nil);
			rawset(form, '__timeCacheTimeoutId', nil);
			
			formsWithSameName[form] = nil;
			self.countByName[name] = (self.countByName[name] or 0) - 1;
			
			if self.countByName[name] <= 0 then
				self.cacheName[name] = nil;
				self.countByName[name] = nil;
			end;			
		end;		
	end;
end;

function __frmCachedByTime:releaseByName(name, form)
	assert(form ~= nil);
		
	if (type(name) ~= "string") or (name == "") then
		return;
	end;
	
	if form.setNodeDatabase ~= nil then
		form:setNodeDatabase(nil);
	end;			
	
	form:setParent(nil);		
	
	local formsWithSameName = self.cacheName[name];
	
	if formsWithSameName == nil then
		formsWithSameName = {};
		self.cacheName[name] = formsWithSameName;
		self.countByName[name] = 0;
	end;
	
	formsWithSameName[form] = true;
	self.countByName[name] = (self.countByName[name] or 0) + 1;
	
	self.genCacheId = self.genCacheId + 1;
	
	local cacheId = self.genCacheId;
	rawset(form, '__timeCacheId', cacheId);
		
	local timeoutId = Utils.setTimeout(self:createTimeoutCallback(name, form, cacheId), gui.DEFAULT_FORM_CACHE_TIMEOUT);	
	rawset(form, '__timeCacheTimeoutId', timeoutId);
end;

-- [[ Exported functions ]] --

function _export_gui_fromHandle(handle)
	return gui.fromHandle(handle);
end;

function _export_gui_acquireForm(formName)
	if Firecast == nil then
		require('rrpg.lua');
	end;	
	
	assert(Firecast ~= nil);  
	local frmClass = Firecast.forms[formName];

	if frmClass ~= nil then
		local frm = nil;
		
		if frmClass.cacheMode == "time" then
			frm = __frmCachedByTime:tryAcquireByName(formName);			
		end;
		
		if frm ~= nil then
			return frm;
		end;
		
		frm = frmClass.newEditor();
		assert(frm ~= nil);	
		
		rawset(frm, "__cachedFrmClass", frmClass);	
		return frm;
	else
		return nil;
	end;
end;

function _export_gui_releaseForm(form)
	if form == nil then
		return;
	end;
	
	local cachedFrmClass = rawget(form, "__cachedFrmClass");
	local cacheMode;
	
	if cachedFrmClass ~= nil then
		cacheMode = cachedFrmClass.cacheMode;
	else	
		cacheMode = nil;
	end;
	
	if cacheMode == "time" then	
		__frmCachedByTime:releaseByName(cachedFrmClass.name, form);
	end;
end;

return gui;
