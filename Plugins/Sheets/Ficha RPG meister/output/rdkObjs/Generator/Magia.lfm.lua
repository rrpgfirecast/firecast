require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGeneratorMagia()
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
    obj:setName("frmGeneratorMagia");
    obj:setHeight(75);
    obj:setWidth(600);
    obj:setMargins({top=2});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(200);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("tipoMagia");
    obj.comboBox1:setItems({'Lista de Magias', 'Signos', 'Essencias'});
    obj.comboBox1:setValues({'3', '2', '4'});
    obj.comboBox1:setMargins({left=5});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout1);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setWidth(50);
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setField("atributoCD");
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox2:setMargins({left=5});
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout1);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setWidth(50);
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setField("atributoBonus");
    obj.comboBox3:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox3:setMargins({left=5});
    obj.comboBox3:setName("comboBox3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setAlign("left");
    obj.label1:setWidth(75);
    obj.label1:setText("Diarias");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setMargins({left=5});
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setWidth(40);
    obj.label2:setField("base0");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setMargins({left=5});
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setAlign("left");
    obj.label3:setWidth(40);
    obj.label3:setField("base1");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setMargins({left=5});
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("left");
    obj.label4:setWidth(40);
    obj.label4:setField("base2");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setMargins({left=5});
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setAlign("left");
    obj.label5:setWidth(40);
    obj.label5:setField("base3");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setMargins({left=5});
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setAlign("left");
    obj.label6:setWidth(40);
    obj.label6:setField("base4");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setMargins({left=5});
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setAlign("left");
    obj.label7:setWidth(40);
    obj.label7:setField("base5");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setMargins({left=5});
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setAlign("left");
    obj.label8:setWidth(40);
    obj.label8:setField("base6");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setAlign("left");
    obj.label9:setWidth(40);
    obj.label9:setField("base7");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setAlign("left");
    obj.label10:setWidth(40);
    obj.label10:setField("base8");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setAlign("left");
    obj.label11:setWidth(40);
    obj.label11:setField("base9");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setMargins({left=5,right=5});
    obj.label11:setName("label11");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setAlign("left");
    obj.label12:setWidth(75);
    obj.label12:setText("Conhecidas");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setMargins({left=5});
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setAlign("left");
    obj.label13:setWidth(40);
    obj.label13:setField("conhecidas0");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setMargins({left=5});
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setAlign("left");
    obj.label14:setWidth(40);
    obj.label14:setField("conhecidas1");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setMargins({left=5});
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setAlign("left");
    obj.label15:setWidth(40);
    obj.label15:setField("conhecidas2");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setMargins({left=5});
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setAlign("left");
    obj.label16:setWidth(40);
    obj.label16:setField("conhecidas3");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setMargins({left=5});
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setAlign("left");
    obj.label17:setWidth(40);
    obj.label17:setField("conhecidas4");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setMargins({left=5});
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setAlign("left");
    obj.label18:setWidth(40);
    obj.label18:setField("conhecidas5");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setMargins({left=5});
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setAlign("left");
    obj.label19:setWidth(40);
    obj.label19:setField("conhecidas6");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setMargins({left=5});
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setAlign("left");
    obj.label20:setWidth(40);
    obj.label20:setField("conhecidas7");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setMargins({left=5});
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setAlign("left");
    obj.label21:setWidth(40);
    obj.label21:setField("conhecidas8");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setMargins({left=5});
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setAlign("left");
    obj.label22:setWidth(40);
    obj.label22:setField("conhecidas9");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setMargins({left=5,right=5});
    obj.label22:setName("label22");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGeneratorMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGeneratorMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGeneratorMagia = {
    newEditor = newfrmGeneratorMagia, 
    new = newfrmGeneratorMagia, 
    name = "frmGeneratorMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneratorMagia = _frmGeneratorMagia;
Firecast.registrarForm(_frmGeneratorMagia);

return _frmGeneratorMagia;
