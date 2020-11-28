require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMG()
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
    obj:setName("frmMG");
    obj:setHeight(60);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({bottom=2});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(664);
    obj.layout2:setWidth(432);
    obj.layout2:setHeight(43);
    obj.layout2:setName("layout2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(432);
    obj.edit1:setHeight(43);
    obj.edit1:setFontSize(16);
    obj.edit1:setField("_45_0");
    obj.edit1:setTransparent(false);
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(529);
    obj.layout3:setWidth(127);
    obj.layout3:setHeight(43);
    obj.layout3:setName("layout3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(0);
    obj.edit2:setWidth(127);
    obj.edit2:setHeight(43);
    obj.edit2:setFontSize(16);
    obj.edit2:setField("_46_0");
    obj.edit2:setTransparent(false);
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(397);
    obj.layout4:setWidth(125);
    obj.layout4:setHeight(43);
    obj.layout4:setName("layout4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(125);
    obj.edit3:setHeight(43);
    obj.edit3:setFontSize(16);
    obj.edit3:setField("_47_0");
    obj.edit3:setTransparent(false);
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(159);
    obj.layout5:setWidth(225);
    obj.layout5:setHeight(43);
    obj.layout5:setName("layout5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTransparent(false);
    obj.edit4:setFontSize(16);
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(228);
    obj.edit4:setHeight(43);
    obj.edit4:setField("magia");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(88);
    obj.layout6:setWidth(40);
    obj.layout6:setHeight(40);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setAlign("client");
    obj.edit5:setTransparent(false);
    obj.edit5:setFontSize(24);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setField("circ");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(55);
    obj.layout7:setWidth(23);
    obj.layout7:setHeight(22);
    obj.layout7:setName("layout7");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout7);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(23);
    obj.checkBox1:setHeight(23);
    obj.checkBox1:setField("_50_0");
    obj.checkBox1:setHitTest(true);
    obj.checkBox1:setHint("Memorizado");
    obj.checkBox1:setName("checkBox1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(55);
    obj.layout8:setTop(20);
    obj.layout8:setWidth(23);
    obj.layout8:setHeight(22);
    obj.layout8:setName("layout8");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout8);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(23);
    obj.checkBox2:setHeight(23);
    obj.checkBox2:setField("_50_1");
    obj.checkBox2:setHitTest(true);
    obj.checkBox2:setHint("Usado/Não memorizado");
    obj.checkBox2:setName("checkBox2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(4);
    obj.button1:setWidth(32);
    obj.button1:setText("X");
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
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMG()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMG();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMG = {
    newEditor = newfrmMG, 
    new = newfrmMG, 
    name = "frmMG", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMG = _frmMG;
Firecast.registrarForm(_frmMG);

return _frmMG;
