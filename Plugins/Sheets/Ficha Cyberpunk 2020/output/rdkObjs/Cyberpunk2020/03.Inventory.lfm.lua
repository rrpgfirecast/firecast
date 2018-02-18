require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmInventory()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmInventory");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(360);
    obj.layout1:setHeight(685);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("ITEM");
    obj.label1:setLeft(5);
    obj.label1:setTop(1);
    obj.label1:setWidth(150);
    obj.label1:setHeight(20);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("QTD");
    obj.label2:setLeft(155);
    obj.label2:setTop(1);
    obj.label2:setWidth(50);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("PREÇO");
    obj.label3:setLeft(205);
    obj.label3:setTop(1);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("PESO");
    obj.label4:setLeft(255);
    obj.label4:setTop(1);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(305);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.rclInventory = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventory:setParent(obj.layout1);
    obj.rclInventory:setName("rclInventory");
    obj.rclInventory:setField("inventoryList");
    obj.rclInventory:setTemplateForm("frmInventoryItem");
    obj.rclInventory:setLeft(5);
    obj.rclInventory:setTop(25);
    obj.rclInventory:setWidth(350);
    obj.rclInventory:setHeight(650);
    obj.rclInventory:setLayout("vertical");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(370);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(760);
    obj.layout2:setHeight(335);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setText("ARMA");
    obj.label5:setLeft(5);
    obj.label5:setTop(1);
    obj.label5:setWidth(150);
    obj.label5:setHeight(20);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setText("TIPO");
    obj.label6:setLeft(155);
    obj.label6:setTop(1);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setText("PRECISÃO");
    obj.label7:setLeft(205);
    obj.label7:setTop(1);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(11);
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setText("OCULT.");
    obj.label8:setLeft(255);
    obj.label8:setTop(1);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(12);
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setText("DISP.");
    obj.label9:setLeft(305);
    obj.label9:setTop(1);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setText("DANO");
    obj.label10:setLeft(355);
    obj.label10:setTop(1);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setText("Nº DISP.");
    obj.label11:setLeft(405);
    obj.label11:setTop(1);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(11);
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setText("CD TIRO");
    obj.label12:setLeft(455);
    obj.label12:setTop(1);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setText("CONF.");
    obj.label13:setLeft(505);
    obj.label13:setTop(1);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setText("ALCANCE");
    obj.label14:setLeft(555);
    obj.label14:setTop(1);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setText("PREÇO");
    obj.label15:setLeft(605);
    obj.label15:setTop(1);
    obj.label15:setWidth(50);
    obj.label15:setHeight(20);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setText("PESO");
    obj.label16:setLeft(655);
    obj.label16:setTop(1);
    obj.label16:setWidth(50);
    obj.label16:setHeight(20);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(705);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.rclInventoryWeapon = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventoryWeapon:setParent(obj.layout2);
    obj.rclInventoryWeapon:setName("rclInventoryWeapon");
    obj.rclInventoryWeapon:setField("weaponList");
    obj.rclInventoryWeapon:setTemplateForm("frmInventoryWeapon");
    obj.rclInventoryWeapon:setLeft(5);
    obj.rclInventoryWeapon:setTop(25);
    obj.rclInventoryWeapon:setWidth(750);
    obj.rclInventoryWeapon:setHeight(300);
    obj.rclInventoryWeapon:setLayout("vertical");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(370);
    obj.layout3:setTop(345);
    obj.layout3:setWidth(760);
    obj.layout3:setHeight(335);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setText("ARMADURA");
    obj.label17:setLeft(5);
    obj.label17:setTop(1);
    obj.label17:setWidth(150);
    obj.label17:setHeight(20);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setText("CABEÇA");
    obj.label18:setLeft(155);
    obj.label18:setTop(1);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setText("TORSO");
    obj.label19:setLeft(205);
    obj.label19:setTop(1);
    obj.label19:setWidth(50);
    obj.label19:setHeight(20);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setText("BRAÇO D");
    obj.label20:setLeft(255);
    obj.label20:setTop(1);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setFontSize(11);
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setText("BRAÇO E");
    obj.label21:setLeft(305);
    obj.label21:setTop(1);
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(11);
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setText("PERNA D");
    obj.label22:setLeft(355);
    obj.label22:setTop(1);
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setText("PERNA E");
    obj.label23:setLeft(405);
    obj.label23:setTop(1);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(11);
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setText("DETALHES");
    obj.label24:setLeft(455);
    obj.label24:setTop(1);
    obj.label24:setWidth(150);
    obj.label24:setHeight(20);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout3);
    obj.label25:setText("PREÇO");
    obj.label25:setLeft(605);
    obj.label25:setTop(1);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setText("PESO");
    obj.label26:setLeft(655);
    obj.label26:setTop(1);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setText("+");
    obj.button3:setLeft(705);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.rclInventoryArmor = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclInventoryArmor:setParent(obj.layout3);
    obj.rclInventoryArmor:setName("rclInventoryArmor");
    obj.rclInventoryArmor:setField("armorList");
    obj.rclInventoryArmor:setTemplateForm("frmInventoryArmor");
    obj.rclInventoryArmor:setLeft(5);
    obj.rclInventoryArmor:setTop(25);
    obj.rclInventoryArmor:setWidth(750);
    obj.rclInventoryArmor:setHeight(300);
    obj.rclInventoryArmor:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclInventory:append();
        end, obj);

    obj._e_event1 = obj.rclInventory:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclInventoryWeapon:append();
        end, obj);

    obj._e_event3 = obj.rclInventoryWeapon:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclInventoryArmor:append();
        end, obj);

    obj._e_event5 = obj.rclInventoryArmor:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rclInventoryArmor ~= nil then self.rclInventoryArmor:destroy(); self.rclInventoryArmor = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rclInventoryWeapon ~= nil then self.rclInventoryWeapon:destroy(); self.rclInventoryWeapon = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rclInventory ~= nil then self.rclInventory:destroy(); self.rclInventory = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmInventory = {
    newEditor = newfrmInventory, 
    new = newfrmInventory, 
    name = "frmInventory", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventory = _frmInventory;
rrpg.registrarForm(_frmInventory);

return _frmInventory;
