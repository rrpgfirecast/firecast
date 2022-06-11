require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVM20_3()
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
    obj:setName("frmVM20_3");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(630);
    obj.layout1:setHeight(330);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(630);
    obj.label1:setHeight(20);
    obj.label1:setText("COMBAT");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(15);
    obj.label2:setTop(25);
    obj.label2:setWidth(630);
    obj.label2:setHeight(20);
    obj.label2:setText("Weapon/Attack                                          Roll              Diff.    Damage   Range     Rate        Clip    Conceal");
    obj.label2:setName("label2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(15);
    obj.layout2:setTop(50);
    obj.layout2:setWidth(600);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(24);
    obj.edit1:setField("attack_1");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(200);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(24);
    obj.edit2:setField("roll_1");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(300);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(24);
    obj.edit3:setField("difficulty_1");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(350);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(24);
    obj.edit4:setField("damage_1");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(400);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(24);
    obj.edit5:setField("range_1");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(450);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(24);
    obj.edit6:setField("rate_1");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setLeft(500);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(24);
    obj.edit7:setField("clip_1");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setLeft(550);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(24);
    obj.edit8:setField("conceal_1");
    obj.edit8:setName("edit8");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(15);
    obj.layout3:setTop(75);
    obj.layout3:setWidth(600);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(24);
    obj.edit9:setField("attack_2");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setLeft(200);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(24);
    obj.edit10:setField("roll_2");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setLeft(300);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(24);
    obj.edit11:setField("difficulty_2");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setLeft(350);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(24);
    obj.edit12:setField("damage_2");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setLeft(400);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(24);
    obj.edit13:setField("range_2");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setLeft(450);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(24);
    obj.edit14:setField("rate_2");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setLeft(500);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(24);
    obj.edit15:setField("clip_2");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setLeft(550);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(24);
    obj.edit16:setField("conceal_2");
    obj.edit16:setName("edit16");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(15);
    obj.layout4:setTop(100);
    obj.layout4:setWidth(600);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout4);
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(200);
    obj.edit17:setHeight(24);
    obj.edit17:setField("attack_3");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setLeft(200);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(100);
    obj.edit18:setHeight(24);
    obj.edit18:setField("roll_3");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setLeft(300);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(24);
    obj.edit19:setField("difficulty_3");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setLeft(350);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(24);
    obj.edit20:setField("damage_3");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout4);
    obj.edit21:setLeft(400);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(24);
    obj.edit21:setField("range_3");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout4);
    obj.edit22:setLeft(450);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(24);
    obj.edit22:setField("rate_3");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout4);
    obj.edit23:setLeft(500);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(24);
    obj.edit23:setField("clip_3");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setLeft(550);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(24);
    obj.edit24:setField("conceal_3");
    obj.edit24:setName("edit24");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(15);
    obj.layout5:setTop(125);
    obj.layout5:setWidth(600);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout5);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(200);
    obj.edit25:setHeight(24);
    obj.edit25:setField("attack_4");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout5);
    obj.edit26:setLeft(200);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(100);
    obj.edit26:setHeight(24);
    obj.edit26:setField("roll_4");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout5);
    obj.edit27:setLeft(300);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(24);
    obj.edit27:setField("difficulty_4");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout5);
    obj.edit28:setLeft(350);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(24);
    obj.edit28:setField("damage_4");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout5);
    obj.edit29:setLeft(400);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(24);
    obj.edit29:setField("range_4");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout5);
    obj.edit30:setLeft(450);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(24);
    obj.edit30:setField("rate_4");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout5);
    obj.edit31:setLeft(500);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(24);
    obj.edit31:setField("clip_4");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout5);
    obj.edit32:setLeft(550);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(24);
    obj.edit32:setField("conceal_4");
    obj.edit32:setName("edit32");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(15);
    obj.layout6:setTop(150);
    obj.layout6:setWidth(600);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout6);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(200);
    obj.edit33:setHeight(24);
    obj.edit33:setField("attack_5");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout6);
    obj.edit34:setLeft(200);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(100);
    obj.edit34:setHeight(24);
    obj.edit34:setField("roll_5");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout6);
    obj.edit35:setLeft(300);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(24);
    obj.edit35:setField("difficulty_5");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout6);
    obj.edit36:setLeft(350);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(24);
    obj.edit36:setField("damage_5");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout6);
    obj.edit37:setLeft(400);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(24);
    obj.edit37:setField("range_5");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout6);
    obj.edit38:setLeft(450);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(24);
    obj.edit38:setField("rate_5");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout6);
    obj.edit39:setLeft(500);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(24);
    obj.edit39:setField("clip_5");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout6);
    obj.edit40:setLeft(550);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(24);
    obj.edit40:setField("conceal_5");
    obj.edit40:setName("edit40");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(15);
    obj.layout7:setTop(175);
    obj.layout7:setWidth(600);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout7);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(200);
    obj.edit41:setHeight(24);
    obj.edit41:setField("attack_6");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout7);
    obj.edit42:setLeft(200);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(100);
    obj.edit42:setHeight(24);
    obj.edit42:setField("roll_6");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout7);
    obj.edit43:setLeft(300);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(24);
    obj.edit43:setField("difficulty_6");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout7);
    obj.edit44:setLeft(350);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(24);
    obj.edit44:setField("damage_6");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout7);
    obj.edit45:setLeft(400);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(24);
    obj.edit45:setField("range_6");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout7);
    obj.edit46:setLeft(450);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(24);
    obj.edit46:setField("rate_6");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout7);
    obj.edit47:setLeft(500);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(24);
    obj.edit47:setField("clip_6");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout7);
    obj.edit48:setLeft(550);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(24);
    obj.edit48:setField("conceal_6");
    obj.edit48:setName("edit48");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(15);
    obj.layout8:setTop(200);
    obj.layout8:setWidth(600);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout8);
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(200);
    obj.edit49:setHeight(24);
    obj.edit49:setField("attack_7");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout8);
    obj.edit50:setLeft(200);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(100);
    obj.edit50:setHeight(24);
    obj.edit50:setField("roll_7");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout8);
    obj.edit51:setLeft(300);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(24);
    obj.edit51:setField("difficulty_7");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout8);
    obj.edit52:setLeft(350);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(24);
    obj.edit52:setField("damage_7");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout8);
    obj.edit53:setLeft(400);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(24);
    obj.edit53:setField("range_7");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout8);
    obj.edit54:setLeft(450);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(24);
    obj.edit54:setField("rate_7");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout8);
    obj.edit55:setLeft(500);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(50);
    obj.edit55:setHeight(24);
    obj.edit55:setField("clip_7");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout8);
    obj.edit56:setLeft(550);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(24);
    obj.edit56:setField("conceal_7");
    obj.edit56:setName("edit56");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(15);
    obj.layout9:setTop(225);
    obj.layout9:setWidth(600);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout9);
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(200);
    obj.edit57:setHeight(24);
    obj.edit57:setField("attack_8");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout9);
    obj.edit58:setLeft(200);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(100);
    obj.edit58:setHeight(24);
    obj.edit58:setField("roll_8");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout9);
    obj.edit59:setLeft(300);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(24);
    obj.edit59:setField("difficulty_8");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout9);
    obj.edit60:setLeft(350);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(50);
    obj.edit60:setHeight(24);
    obj.edit60:setField("damage_8");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout9);
    obj.edit61:setLeft(400);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(50);
    obj.edit61:setHeight(24);
    obj.edit61:setField("range_8");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout9);
    obj.edit62:setLeft(450);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(50);
    obj.edit62:setHeight(24);
    obj.edit62:setField("rate_8");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout9);
    obj.edit63:setLeft(500);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(24);
    obj.edit63:setField("clip_8");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout9);
    obj.edit64:setLeft(550);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(50);
    obj.edit64:setHeight(24);
    obj.edit64:setField("conceal_8");
    obj.edit64:setName("edit64");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(15);
    obj.layout10:setTop(250);
    obj.layout10:setWidth(600);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout10);
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(200);
    obj.edit65:setHeight(24);
    obj.edit65:setField("attack_9");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout10);
    obj.edit66:setLeft(200);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(100);
    obj.edit66:setHeight(24);
    obj.edit66:setField("roll_9");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout10);
    obj.edit67:setLeft(300);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(50);
    obj.edit67:setHeight(24);
    obj.edit67:setField("difficulty_9");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout10);
    obj.edit68:setLeft(350);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(50);
    obj.edit68:setHeight(24);
    obj.edit68:setField("damage_9");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout10);
    obj.edit69:setLeft(400);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(50);
    obj.edit69:setHeight(24);
    obj.edit69:setField("range_9");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout10);
    obj.edit70:setLeft(450);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(50);
    obj.edit70:setHeight(24);
    obj.edit70:setField("rate_9");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout10);
    obj.edit71:setLeft(500);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(50);
    obj.edit71:setHeight(24);
    obj.edit71:setField("clip_9");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout10);
    obj.edit72:setLeft(550);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(24);
    obj.edit72:setField("conceal_9");
    obj.edit72:setName("edit72");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(15);
    obj.layout11:setTop(275);
    obj.layout11:setWidth(600);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout11);
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(200);
    obj.edit73:setHeight(24);
    obj.edit73:setField("attack_10");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout11);
    obj.edit74:setLeft(200);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(100);
    obj.edit74:setHeight(24);
    obj.edit74:setField("roll_10");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout11);
    obj.edit75:setLeft(300);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(24);
    obj.edit75:setField("difficulty_10");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout11);
    obj.edit76:setLeft(350);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(50);
    obj.edit76:setHeight(24);
    obj.edit76:setField("damage_10");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout11);
    obj.edit77:setLeft(400);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(50);
    obj.edit77:setHeight(24);
    obj.edit77:setField("range_10");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout11);
    obj.edit78:setLeft(450);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(50);
    obj.edit78:setHeight(24);
    obj.edit78:setField("rate_10");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout11);
    obj.edit79:setLeft(500);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(50);
    obj.edit79:setHeight(24);
    obj.edit79:setField("clip_10");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout11);
    obj.edit80:setLeft(550);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(24);
    obj.edit80:setField("conceal_10");
    obj.edit80:setName("edit80");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox1);
    obj.layout12:setLeft(640);
    obj.layout12:setTop(0);
    obj.layout12:setWidth(230);
    obj.layout12:setHeight(330);
    obj.layout12:setName("layout12");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout12);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout12);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(230);
    obj.label3:setHeight(20);
    obj.label3:setText("HAVEN");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout12);
    obj.textEditor1:setLeft(15);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(290);
    obj.textEditor1:setField("haven");
    obj.textEditor1:setName("textEditor1");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(880);
    obj.layout13:setTop(0);
    obj.layout13:setWidth(230);
    obj.layout13:setHeight(230);
    obj.layout13:setName("layout13");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout13);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setName("rectangle3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout13);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(230);
    obj.label4:setHeight(20);
    obj.label4:setText("ARMOR");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setLeft(15);
    obj.layout14:setTop(25);
    obj.layout14:setWidth(200);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout14);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("Class");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout14);
    obj.edit81:setLeft(55);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(145);
    obj.edit81:setHeight(25);
    obj.edit81:setField("armorClass");
    obj.edit81:setName("edit81");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15:setLeft(15);
    obj.layout15:setTop(50);
    obj.layout15:setWidth(200);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout15);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("Rating");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout15);
    obj.edit82:setLeft(55);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(145);
    obj.edit82:setHeight(25);
    obj.edit82:setField("armorRating");
    obj.edit82:setName("edit82");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout13);
    obj.layout16:setLeft(15);
    obj.layout16:setTop(75);
    obj.layout16:setWidth(600);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout16);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("Penalty");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout16);
    obj.edit83:setLeft(55);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(145);
    obj.edit83:setHeight(25);
    obj.edit83:setField("armorPenalty");
    obj.edit83:setName("edit83");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout13);
    obj.textEditor2:setLeft(15);
    obj.textEditor2:setTop(100);
    obj.textEditor2:setWidth(200);
    obj.textEditor2:setHeight(115);
    obj.textEditor2:setField("armorDescription");
    obj.textEditor2:setName("textEditor2");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(340);
    obj.layout17:setWidth(230);
    obj.layout17:setHeight(230);
    obj.layout17:setName("layout17");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout17);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setName("rectangle4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout17);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(230);
    obj.label8:setHeight(20);
    obj.label8:setText("GEAR (CARRIED)");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout17);
    obj.textEditor3:setLeft(15);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(200);
    obj.textEditor3:setHeight(190);
    obj.textEditor3:setField("gear");
    obj.textEditor3:setName("textEditor3");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox1);
    obj.layout18:setLeft(240);
    obj.layout18:setTop(340);
    obj.layout18:setWidth(230);
    obj.layout18:setHeight(230);
    obj.layout18:setName("layout18");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout18);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("innerLine");
    obj.rectangle5:setName("rectangle5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout18);
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(230);
    obj.label9:setHeight(20);
    obj.label9:setText("EQUIPMENT (OWNED)");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout18);
    obj.textEditor4:setLeft(15);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(200);
    obj.textEditor4:setHeight(190);
    obj.textEditor4:setField("equipment");
    obj.textEditor4:setName("textEditor4");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setLeft(480);
    obj.layout19:setTop(340);
    obj.layout19:setWidth(230);
    obj.layout19:setHeight(230);
    obj.layout19:setName("layout19");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout19);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setName("rectangle6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout19);
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(230);
    obj.label10:setHeight(20);
    obj.label10:setText("TRANSPORTATION");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout19);
    obj.textEditor5:setLeft(15);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(200);
    obj.textEditor5:setHeight(190);
    obj.textEditor5:setField("transportation");
    obj.textEditor5:setName("textEditor5");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(720);
    obj.layout20:setTop(340);
    obj.layout20:setWidth(230);
    obj.layout20:setHeight(230);
    obj.layout20:setName("layout20");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout20);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout20);
    obj.label11:setLeft(0);
    obj.label11:setTop(0);
    obj.label11:setWidth(230);
    obj.label11:setHeight(20);
    obj.label11:setText("FEEDING GROUNDS");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout20);
    obj.textEditor6:setLeft(15);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(200);
    obj.textEditor6:setHeight(190);
    obj.textEditor6:setField("feeding");
    obj.textEditor6:setName("textEditor6");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVM20_3()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVM20_3();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVM20_3 = {
    newEditor = newfrmVM20_3, 
    new = newfrmVM20_3, 
    name = "frmVM20_3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmVM20_3 = _frmVM20_3;
Firecast.registrarForm(_frmVM20_3);

return _frmVM20_3;
