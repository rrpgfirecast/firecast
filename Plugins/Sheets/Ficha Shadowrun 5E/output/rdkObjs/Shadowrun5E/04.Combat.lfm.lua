require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmCombat()
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
    obj:setName("frmCombat");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(540);
    obj.layout1:setHeight(340);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(540);
    obj.label1:setHeight(20);
    obj.label1:setText("RANGED WEAPONS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("WEAPON");
    obj.label2:setLeft(5);
    obj.label2:setTop(25);
    obj.label2:setWidth(150);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("DMG");
    obj.label3:setLeft(155);
    obj.label3:setTop(25);
    obj.label3:setWidth(40);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("ACC");
    obj.label4:setLeft(195);
    obj.label4:setTop(25);
    obj.label4:setWidth(40);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setText("AP");
    obj.label5:setLeft(235);
    obj.label5:setTop(25);
    obj.label5:setWidth(40);
    obj.label5:setHeight(20);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setText("MODE");
    obj.label6:setLeft(275);
    obj.label6:setTop(25);
    obj.label6:setWidth(40);
    obj.label6:setHeight(20);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setText("RC");
    obj.label7:setLeft(315);
    obj.label7:setTop(25);
    obj.label7:setWidth(40);
    obj.label7:setHeight(20);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setText("AMMO");
    obj.label8:setLeft(355);
    obj.label8:setTop(25);
    obj.label8:setWidth(40);
    obj.label8:setHeight(20);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(11);
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setText("PRICE");
    obj.label9:setLeft(395);
    obj.label9:setTop(25);
    obj.label9:setWidth(40);
    obj.label9:setHeight(20);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontSize(12);
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setText("WEIGHT");
    obj.label10:setLeft(435);
    obj.label10:setTop(25);
    obj.label10:setWidth(40);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.rclRangedWeapons = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclRangedWeapons:setParent(obj.layout1);
    obj.rclRangedWeapons:setName("rclRangedWeapons");
    obj.rclRangedWeapons:setField("rangedWeaponsList");
    obj.rclRangedWeapons:setTemplateForm("frmRanged");
    obj.rclRangedWeapons:setLeft(5);
    obj.rclRangedWeapons:setTop(50);
    obj.rclRangedWeapons:setWidth(530);
    obj.rclRangedWeapons:setHeight(280);
    obj.rclRangedWeapons:setLayout("vertical");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(545);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(450);
    obj.layout2:setHeight(340);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(5);
    obj.label11:setTop(0);
    obj.label11:setWidth(450);
    obj.label11:setHeight(20);
    obj.label11:setText("MELEE WEAPONS");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(5);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setText("WEAPON");
    obj.label12:setLeft(5);
    obj.label12:setTop(25);
    obj.label12:setWidth(150);
    obj.label12:setHeight(20);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setText("REACH");
    obj.label13:setLeft(155);
    obj.label13:setTop(25);
    obj.label13:setWidth(40);
    obj.label13:setHeight(20);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontSize(11);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setText("DMG");
    obj.label14:setLeft(195);
    obj.label14:setTop(25);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setText("ACC");
    obj.label15:setLeft(235);
    obj.label15:setTop(25);
    obj.label15:setWidth(40);
    obj.label15:setHeight(20);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setText("AP");
    obj.label16:setLeft(275);
    obj.label16:setTop(25);
    obj.label16:setWidth(40);
    obj.label16:setHeight(20);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setText("PRICE");
    obj.label17:setLeft(315);
    obj.label17:setTop(25);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setText("WEIGHT");
    obj.label18:setLeft(355);
    obj.label18:setTop(25);
    obj.label18:setWidth(40);
    obj.label18:setHeight(20);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(11);
    obj.label18:setName("label18");

    obj.rclMeleeWeapons = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMeleeWeapons:setParent(obj.layout2);
    obj.rclMeleeWeapons:setName("rclMeleeWeapons");
    obj.rclMeleeWeapons:setField("meleeWeaponsList");
    obj.rclMeleeWeapons:setTemplateForm("frmMelee");
    obj.rclMeleeWeapons:setLeft(5);
    obj.rclMeleeWeapons:setTop(50);
    obj.rclMeleeWeapons:setWidth(440);
    obj.rclMeleeWeapons:setHeight(280);
    obj.rclMeleeWeapons:setLayout("vertical");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(345);
    obj.layout3:setWidth(460);
    obj.layout3:setHeight(340);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(5);
    obj.label19:setTop(0);
    obj.label19:setWidth(460);
    obj.label19:setHeight(20);
    obj.label19:setText("AUGMENTATIONS");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setText("+");
    obj.button3:setLeft(5);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setText("AUGMENTATION");
    obj.label20:setLeft(5);
    obj.label20:setTop(25);
    obj.label20:setWidth(150);
    obj.label20:setHeight(20);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setText("RATING");
    obj.label21:setLeft(155);
    obj.label21:setTop(25);
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(11);
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setText("NOTES");
    obj.label22:setLeft(205);
    obj.label22:setTop(25);
    obj.label22:setWidth(100);
    obj.label22:setHeight(20);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setText("ESSENCE");
    obj.label23:setLeft(305);
    obj.label23:setTop(25);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(11);
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setText("PRICE");
    obj.label24:setLeft(355);
    obj.label24:setTop(25);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontSize(12);
    obj.label24:setName("label24");

    obj.rclAugmentations = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAugmentations:setParent(obj.layout3);
    obj.rclAugmentations:setName("rclAugmentations");
    obj.rclAugmentations:setField("augmentationsList");
    obj.rclAugmentations:setTemplateForm("frmAugmentation");
    obj.rclAugmentations:setLeft(5);
    obj.rclAugmentations:setTop(50);
    obj.rclAugmentations:setWidth(450);
    obj.rclAugmentations:setHeight(280);
    obj.rclAugmentations:setLayout("vertical");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(465);
    obj.layout4:setTop(345);
    obj.layout4:setWidth(360);
    obj.layout4:setHeight(340);
    obj.layout4:setName("layout4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(5);
    obj.label25:setTop(0);
    obj.label25:setWidth(360);
    obj.label25:setHeight(20);
    obj.label25:setText("ARMOR");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setText("+");
    obj.button4:setLeft(5);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setName("button4");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setText("ARMOR");
    obj.label26:setLeft(5);
    obj.label26:setTop(25);
    obj.label26:setWidth(100);
    obj.label26:setHeight(20);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setText("RATING");
    obj.label27:setLeft(105);
    obj.label27:setTop(25);
    obj.label27:setWidth(40);
    obj.label27:setHeight(20);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontSize(11);
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setText("NOTES");
    obj.label28:setLeft(145);
    obj.label28:setTop(25);
    obj.label28:setWidth(80);
    obj.label28:setHeight(20);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setText("PRICE");
    obj.label29:setLeft(225);
    obj.label29:setTop(25);
    obj.label29:setWidth(40);
    obj.label29:setHeight(20);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontSize(12);
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setText("WEIGHT");
    obj.label30:setLeft(265);
    obj.label30:setTop(25);
    obj.label30:setWidth(40);
    obj.label30:setHeight(20);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");

    obj.rclArmor = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmor:setParent(obj.layout4);
    obj.rclArmor:setName("rclArmor");
    obj.rclArmor:setField("armorList");
    obj.rclArmor:setTemplateForm("frmArmor");
    obj.rclArmor:setLeft(5);
    obj.rclArmor:setTop(50);
    obj.rclArmor:setWidth(350);
    obj.rclArmor:setHeight(280);
    obj.rclArmor:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclRangedWeapons:append();
        end, obj);

    obj._e_event1 = obj.rclRangedWeapons:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.ranged_weapon, nodeB.ranged_weapon);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclMeleeWeapons:append();
        end, obj);

    obj._e_event3 = obj.rclMeleeWeapons:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.melee_weapon, nodeB.melee_weapon);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclAugmentations:append();
        end, obj);

    obj._e_event5 = obj.rclAugmentations:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.augmentation_name, nodeB.augmentation_name);
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclArmor:append();
        end, obj);

    obj._e_event7 = obj.rclArmor:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.armor_name, nodeB.armor_name);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rclAugmentations ~= nil then self.rclAugmentations:destroy(); self.rclAugmentations = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rclRangedWeapons ~= nil then self.rclRangedWeapons:destroy(); self.rclRangedWeapons = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rclArmor ~= nil then self.rclArmor:destroy(); self.rclArmor = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rclMeleeWeapons ~= nil then self.rclMeleeWeapons:destroy(); self.rclMeleeWeapons = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
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
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmCombat()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmCombat();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmCombat = {
    newEditor = newfrmCombat, 
    new = newfrmCombat, 
    name = "frmCombat", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmCombat = _frmCombat;
Firecast.registrarForm(_frmCombat);

return _frmCombat;
