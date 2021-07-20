require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDeckItem()
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
    obj:setName("frmDeckItem");
    obj:setWidth(250);
    obj:setHeight(25);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.location = GUI.fromHandle(_obj_newObject("label"));
    obj.location:setParent(obj.rectangle1);
    obj.location:setAlign("left");
    obj.location:setWidth(100);
    obj.location:setName("location");
    obj.location:setField("location");
    obj.location:setHorzTextAlign("center");
    obj.location:setHitTest(true);

    obj.card = GUI.fromHandle(_obj_newObject("label"));
    obj.card:setParent(obj.rectangle1);
    obj.card:setAlign("client");
    obj.card:setName("card");
    obj.card:setField("card");
    obj.card:setHorzTextAlign("center");
    obj.card:setHitTest(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("location");
    obj.dataLink1:setDefaultValue("Owner");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("card");
    obj.dataLink2:setDefaultValue("Card");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				self.location.hint = sheet.location;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				self.card.hint = sheet.card;
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

        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.location ~= nil then self.location:destroy(); self.location = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.card ~= nil then self.card:destroy(); self.card = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDeckItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDeckItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDeckItem = {
    newEditor = newfrmDeckItem, 
    new = newfrmDeckItem, 
    name = "frmDeckItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDeckItem = _frmDeckItem;
Firecast.registrarForm(_frmDeckItem);

return _frmDeckItem;
