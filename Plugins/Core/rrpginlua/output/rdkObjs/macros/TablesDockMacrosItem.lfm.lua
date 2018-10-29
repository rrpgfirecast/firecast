require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMacroItemTablesDock()
    local obj = GUI.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmMacroItemTablesDock");
    obj:setHeight(25);
    obj:setWidth(75);
    obj:setMargins({left=5,right=5,top=5,bottom=5});


	
		local function executarMacro()
			local msg = {};
			msg.mesa = self.mesa;
			msg.parametro = "";
			msg.chat = self.mesa.activeChat;
			globalExecutarMacro(sheet, msg);
		end;		
		
		local innerSpacing = 0;
	


    obj.labMacro = GUI.fromHandle(_obj_newObject("label"));
    obj.labMacro:setParent(obj);
    obj.labMacro:setName("labMacro");
    obj.labMacro:setField("macro");
    obj.labMacro:setWordWrap(false);
    obj.labMacro:setAutoSize(true);
    lfm_setPropAsString(obj.labMacro, "fontStyle",  "");
    obj.labMacro:setHitTest(true);
    obj.labMacro:setCursor("handPoint");
    obj.labMacro:setFontSize(13);


		if System.isMobile() then
			self.labMacro.fontSize = 20;
			innerspacing = 8;
		end;
		
		self.labMacro.left = innerSpacing;
		self.labMacro.top = innerSpacing;		
	


    obj._e_event0 = obj.labMacro:addEventListener("onResize",
        function (_)
            self.width = self.labMacro.width + innerSpacing * 2; self.height = self.labMacro.height + innerSpacing * 2;
        end, obj);

    obj._e_event1 = obj.labMacro:addEventListener("onMouseEnter",
        function (_)
            self.labMacro.fontStyle = {'underline'};
        end, obj);

    obj._e_event2 = obj.labMacro:addEventListener("onMouseLeave",
        function (_)
            self.labMacro.fontStyle = '';
        end, obj);

    obj._e_event3 = obj.labMacro:addEventListener("onClick",
        function (_)
            executarMacro()
        end, obj);

    function obj:_releaseEvents()
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

        if self.labMacro ~= nil then self.labMacro:destroy(); self.labMacro = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMacroItemTablesDock()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMacroItemTablesDock();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMacroItemTablesDock = {
    newEditor = newfrmMacroItemTablesDock, 
    new = newfrmMacroItemTablesDock, 
    name = "frmMacroItemTablesDock", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMacroItemTablesDock = _frmMacroItemTablesDock;
Firecast.registrarForm(_frmMacroItemTablesDock);

return _frmMacroItemTablesDock;
