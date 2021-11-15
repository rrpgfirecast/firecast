require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_paixoes()
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
    obj:setName("paixoes");
    obj:setAlign("top");
    obj:setHeight(25);
    obj:setWidth(292);
    obj:setMargins({bottom=2});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("nomePX");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("white");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setFontSize(14);
    obj.edit1:setHeight(25);
    obj.edit1:setWidth(217);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("nomePX");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setAlign("left");
    obj.edit2:setField("valorPX");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("white");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setFontSize(14);
    obj.edit2:setHeight(25);
    obj.edit2:setWidth(26);
    obj.edit2:setTransparent(true);
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(99);
    obj.edit2:setName("edit2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("valorPX");
    obj.dataLink2:setDefaultValue("0");
    obj.dataLink2:setName("dataLink2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setText("🞭");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setHint("Apagar Paixão");
    obj.button1:setName("button1");

    obj._e_event0 = obj.edit2:addEventListener("onExit",
        function (_)
            CalcularGloriaAnual();
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            ContabilizarPaixoes();
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet); CalcularGloriaAnual();
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newpaixoes()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_paixoes();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _paixoes = {
    newEditor = newpaixoes, 
    new = newpaixoes, 
    name = "paixoes", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

paixoes = _paixoes;
Firecast.registrarForm(_paixoes);

return _paixoes;
