require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_equips()
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
    obj:setName("equips");
    obj:setAlign("top");
    obj:setHeight(25);
    obj:setMargins({bottom=2});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setMargins({left=40});
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("nomeEquip");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("white");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setFontSize(14);
    obj.edit1:setHeight(25);
    obj.edit1:setWidth(230);
    obj.edit1:setTransparent(true);
    obj.edit1:setHint("Nome");
    obj.edit1:setName("edit1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("nomeEquip");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setAlign("left");
    obj.edit2:setField("qntEquip");
    obj.edit2:setFontColor("#868686");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setFontSize(14);
    obj.edit2:setHeight(25);
    obj.edit2:setWidth(50);
    obj.edit2:setTransparent(true);
    obj.edit2:setHint("Quantidade");
    obj.edit2:setName("edit2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("qntEquip");
    obj.dataLink2:setDefaultValue("0");
    obj.dataLink2:setName("dataLink2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setAlign("left");
    obj.edit3:setField("statusEquip");
    obj.edit3:setFontColor("#868686");
    obj.edit3:setFontFamily("Cambria");
    obj.edit3:setFontSize(14);
    obj.edit3:setHeight(25);
    obj.edit3:setWidth(255);
    obj.edit3:setTransparent(true);
    obj.edit3:setHint("Status");
    obj.edit3:setName("edit3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setField("statusEquip");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setAlign("left");
    obj.edit4:setField("valorEquip");
    obj.edit4:setFontColor("#868686");
    obj.edit4:setFontFamily("Cambria");
    obj.edit4:setFontSize(14);
    obj.edit4:setHeight(25);
    obj.edit4:setWidth(50);
    obj.edit4:setTransparent(true);
    obj.edit4:setHint("Valor");
    obj.edit4:setName("edit4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setField("valorEquip");
    obj.dataLink4:setDefaultValue("£ 0");
    obj.dataLink4:setName("dataLink4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setText("🞭");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setHint("Apagar Equipamento");
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newequips()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_equips();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _equips = {
    newEditor = newequips, 
    new = newequips, 
    name = "equips", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

equips = _equips;
Firecast.registrarForm(_equips);

return _equips;
