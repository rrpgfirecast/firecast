require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVM20_4()
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
    obj:setName("frmVM20_4");
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
    obj.layout1:setWidth(800);
    obj.layout1:setHeight(270);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#FFFFFF00");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(800);
    obj.label1:setHeight(20);
    obj.label1:setText("MERITS AND FLAWS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(15);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(380);
    obj.layout2:setHeight(240);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(15);
    obj.label2:setTop(0);
    obj.label2:setWidth(200);
    obj.label2:setHeight(20);
    obj.label2:setText("Merit");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(215);
    obj.label3:setTop(0);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Type");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(315);
    obj.label4:setTop(0);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("Cost");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setLeft(15);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(350);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(24);
    obj.edit1:setField("merit_m1");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(200);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(24);
    obj.edit2:setField("type_m1");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(300);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(24);
    obj.edit3:setField("costy_m1");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setLeft(15);
    obj.layout4:setTop(50);
    obj.layout4:setWidth(350);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(24);
    obj.edit4:setField("merit_m2");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setLeft(200);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(24);
    obj.edit5:setField("type_m2");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setLeft(300);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(24);
    obj.edit6:setField("costy_m2");
    obj.edit6:setName("edit6");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setLeft(15);
    obj.layout5:setTop(75);
    obj.layout5:setWidth(350);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(24);
    obj.edit7:setField("merit_m3");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setLeft(200);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(24);
    obj.edit8:setField("type_m3");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(300);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(24);
    obj.edit9:setField("costy_m3");
    obj.edit9:setName("edit9");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setLeft(15);
    obj.layout6:setTop(100);
    obj.layout6:setWidth(350);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(24);
    obj.edit10:setField("merit_m4");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout6);
    obj.edit11:setLeft(200);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(100);
    obj.edit11:setHeight(24);
    obj.edit11:setField("type_m4");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout6);
    obj.edit12:setLeft(300);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(24);
    obj.edit12:setField("costy_m4");
    obj.edit12:setName("edit12");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setLeft(15);
    obj.layout7:setTop(125);
    obj.layout7:setWidth(350);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout7);
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(200);
    obj.edit13:setHeight(24);
    obj.edit13:setField("merit_m5");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout7);
    obj.edit14:setLeft(200);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(100);
    obj.edit14:setHeight(24);
    obj.edit14:setField("type_m5");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout7);
    obj.edit15:setLeft(300);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(24);
    obj.edit15:setField("costy_m5");
    obj.edit15:setName("edit15");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setLeft(15);
    obj.layout8:setTop(150);
    obj.layout8:setWidth(350);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(200);
    obj.edit16:setHeight(24);
    obj.edit16:setField("merit_m6");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout8);
    obj.edit17:setLeft(200);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(100);
    obj.edit17:setHeight(24);
    obj.edit17:setField("type_m6");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout8);
    obj.edit18:setLeft(300);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(24);
    obj.edit18:setField("costy_m6");
    obj.edit18:setName("edit18");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setLeft(15);
    obj.layout9:setTop(175);
    obj.layout9:setWidth(350);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout9);
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(200);
    obj.edit19:setHeight(24);
    obj.edit19:setField("merit_m7");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout9);
    obj.edit20:setLeft(200);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(100);
    obj.edit20:setHeight(24);
    obj.edit20:setField("type_m7");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout9);
    obj.edit21:setLeft(300);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(24);
    obj.edit21:setField("costy_m7");
    obj.edit21:setName("edit21");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setLeft(15);
    obj.layout10:setTop(200);
    obj.layout10:setWidth(350);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout10);
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(200);
    obj.edit22:setHeight(24);
    obj.edit22:setField("merit_m8");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout10);
    obj.edit23:setLeft(200);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(100);
    obj.edit23:setHeight(24);
    obj.edit23:setField("type_m8");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout10);
    obj.edit24:setLeft(300);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(24);
    obj.edit24:setField("costy_m8");
    obj.edit24:setName("edit24");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(405);
    obj.layout11:setTop(25);
    obj.layout11:setWidth(380);
    obj.layout11:setHeight(240);
    obj.layout11:setName("layout11");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout11);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setName("rectangle3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout11);
    obj.label5:setLeft(15);
    obj.label5:setTop(0);
    obj.label5:setWidth(200);
    obj.label5:setHeight(20);
    obj.label5:setText("Flaw");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout11);
    obj.label6:setLeft(215);
    obj.label6:setTop(0);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Type");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout11);
    obj.label7:setLeft(315);
    obj.label7:setTop(0);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("Cost");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setLeft(15);
    obj.layout12:setTop(25);
    obj.layout12:setWidth(350);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout12);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(200);
    obj.edit25:setHeight(24);
    obj.edit25:setField("merit_f1");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout12);
    obj.edit26:setLeft(200);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(100);
    obj.edit26:setHeight(24);
    obj.edit26:setField("type_f1");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout12);
    obj.edit27:setLeft(300);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(24);
    obj.edit27:setField("costy_f1");
    obj.edit27:setName("edit27");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setLeft(15);
    obj.layout13:setTop(50);
    obj.layout13:setWidth(350);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout13);
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(200);
    obj.edit28:setHeight(24);
    obj.edit28:setField("merit_f2");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout13);
    obj.edit29:setLeft(200);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(100);
    obj.edit29:setHeight(24);
    obj.edit29:setField("type_f2");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout13);
    obj.edit30:setLeft(300);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(24);
    obj.edit30:setField("costy_f2");
    obj.edit30:setName("edit30");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setLeft(15);
    obj.layout14:setTop(75);
    obj.layout14:setWidth(350);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout14);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(200);
    obj.edit31:setHeight(24);
    obj.edit31:setField("merit_f3");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout14);
    obj.edit32:setLeft(200);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(100);
    obj.edit32:setHeight(24);
    obj.edit32:setField("type_f3");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout14);
    obj.edit33:setLeft(300);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(24);
    obj.edit33:setField("costy_f3");
    obj.edit33:setName("edit33");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setLeft(15);
    obj.layout15:setTop(100);
    obj.layout15:setWidth(350);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout15);
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(24);
    obj.edit34:setField("merit_f4");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout15);
    obj.edit35:setLeft(200);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(100);
    obj.edit35:setHeight(24);
    obj.edit35:setField("type_f4");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout15);
    obj.edit36:setLeft(300);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(24);
    obj.edit36:setField("costy_f4");
    obj.edit36:setName("edit36");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setLeft(15);
    obj.layout16:setTop(125);
    obj.layout16:setWidth(350);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout16);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(200);
    obj.edit37:setHeight(24);
    obj.edit37:setField("merit_f5");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout16);
    obj.edit38:setLeft(200);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(100);
    obj.edit38:setHeight(24);
    obj.edit38:setField("type_f5");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout16);
    obj.edit39:setLeft(300);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(24);
    obj.edit39:setField("costy_f5");
    obj.edit39:setName("edit39");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout11);
    obj.layout17:setLeft(15);
    obj.layout17:setTop(150);
    obj.layout17:setWidth(350);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout17);
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(200);
    obj.edit40:setHeight(24);
    obj.edit40:setField("merit_f6");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout17);
    obj.edit41:setLeft(200);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(100);
    obj.edit41:setHeight(24);
    obj.edit41:setField("type_f6");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout17);
    obj.edit42:setLeft(300);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(24);
    obj.edit42:setField("costy_f6");
    obj.edit42:setName("edit42");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout11);
    obj.layout18:setLeft(15);
    obj.layout18:setTop(175);
    obj.layout18:setWidth(350);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout18);
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(200);
    obj.edit43:setHeight(24);
    obj.edit43:setField("merit_f7");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout18);
    obj.edit44:setLeft(200);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(100);
    obj.edit44:setHeight(24);
    obj.edit44:setField("type_f7");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout18);
    obj.edit45:setLeft(300);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(24);
    obj.edit45:setField("costy_f7");
    obj.edit45:setName("edit45");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout11);
    obj.layout19:setLeft(15);
    obj.layout19:setTop(200);
    obj.layout19:setWidth(350);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout19);
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(200);
    obj.edit46:setHeight(24);
    obj.edit46:setField("merit_f8");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout19);
    obj.edit47:setLeft(200);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(100);
    obj.edit47:setHeight(24);
    obj.edit47:setField("type_f8");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout19);
    obj.edit48:setLeft(300);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(24);
    obj.edit48:setField("costy_f8");
    obj.edit48:setName("edit48");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(810);
    obj.layout20:setTop(0);
    obj.layout20:setWidth(230);
    obj.layout20:setHeight(270);
    obj.layout20:setName("layout20");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout20);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setName("rectangle4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout20);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(230);
    obj.label8:setHeight(20);
    obj.label8:setText("EXPERIENCE");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(15);
    obj.layout21:setTop(25);
    obj.layout21:setWidth(200);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout21);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("Total");
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setName("label9");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout21);
    obj.edit49:setLeft(55);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(145);
    obj.edit49:setHeight(25);
    obj.edit49:setField("totalXP");
    obj.edit49:setName("edit49");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setLeft(15);
    obj.layout22:setTop(50);
    obj.layout22:setWidth(200);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout22);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("Spent");
    obj.label10:setHorzTextAlign("trailing");
    obj.label10:setName("label10");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout22);
    obj.edit50:setLeft(55);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(145);
    obj.edit50:setHeight(25);
    obj.edit50:setField("spentXP");
    obj.edit50:setName("edit50");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout20);
    obj.textEditor1:setLeft(15);
    obj.textEditor1:setTop(75);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(170);
    obj.textEditor1:setField("xpList");
    obj.textEditor1:setName("textEditor1");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox1);
    obj.layout23:setLeft(1050);
    obj.layout23:setTop(0);
    obj.layout23:setWidth(230);
    obj.layout23:setHeight(270);
    obj.layout23:setName("layout23");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout23);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("innerLine");
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout23);
    obj.label11:setLeft(0);
    obj.label11:setTop(0);
    obj.label11:setWidth(230);
    obj.label11:setHeight(20);
    obj.label11:setText("DERANGEMENTS");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout23);
    obj.textEditor2:setLeft(15);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(200);
    obj.textEditor2:setHeight(230);
    obj.textEditor2:setField("derangements");
    obj.textEditor2:setName("textEditor2");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox1);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(280);
    obj.layout24:setWidth(240);
    obj.layout24:setHeight(165);
    obj.layout24:setName("layout24");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout24);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setName("rectangle6");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout24);
    obj.label12:setLeft(0);
    obj.label12:setTop(0);
    obj.label12:setWidth(240);
    obj.label12:setHeight(20);
    obj.label12:setText("ALLIES");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout24);
    obj.textEditor3:setLeft(15);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(200);
    obj.textEditor3:setHeight(125);
    obj.textEditor3:setField("allies");
    obj.textEditor3:setName("textEditor3");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox1);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(455);
    obj.layout25:setWidth(240);
    obj.layout25:setHeight(165);
    obj.layout25:setName("layout25");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout25);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout25);
    obj.label13:setLeft(0);
    obj.label13:setTop(0);
    obj.label13:setWidth(240);
    obj.label13:setHeight(20);
    obj.label13:setText("MENTOR");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout25);
    obj.textEditor4:setLeft(15);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(200);
    obj.textEditor4:setHeight(125);
    obj.textEditor4:setField("mentor");
    obj.textEditor4:setName("textEditor4");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(250);
    obj.layout26:setTop(280);
    obj.layout26:setWidth(240);
    obj.layout26:setHeight(165);
    obj.layout26:setName("layout26");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout26);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("innerLine");
    obj.rectangle8:setName("rectangle8");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout26);
    obj.label14:setLeft(0);
    obj.label14:setTop(0);
    obj.label14:setWidth(240);
    obj.label14:setHeight(20);
    obj.label14:setText("CONTACTS");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout26);
    obj.textEditor5:setLeft(15);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(200);
    obj.textEditor5:setHeight(125);
    obj.textEditor5:setField("contacts");
    obj.textEditor5:setName("textEditor5");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(250);
    obj.layout27:setTop(455);
    obj.layout27:setWidth(240);
    obj.layout27:setHeight(165);
    obj.layout27:setName("layout27");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout27);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("innerLine");
    obj.rectangle9:setName("rectangle9");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout27);
    obj.label15:setLeft(0);
    obj.label15:setTop(0);
    obj.label15:setWidth(240);
    obj.label15:setHeight(20);
    obj.label15:setText("RESOURCES");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout27);
    obj.textEditor6:setLeft(15);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(200);
    obj.textEditor6:setHeight(125);
    obj.textEditor6:setField("resources");
    obj.textEditor6:setName("textEditor6");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox1);
    obj.layout28:setLeft(500);
    obj.layout28:setTop(280);
    obj.layout28:setWidth(240);
    obj.layout28:setHeight(165);
    obj.layout28:setName("layout28");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout28);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("innerLine");
    obj.rectangle10:setName("rectangle10");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout28);
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(240);
    obj.label16:setHeight(20);
    obj.label16:setText("FAME");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout28);
    obj.textEditor7:setLeft(15);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(200);
    obj.textEditor7:setHeight(125);
    obj.textEditor7:setField("fame");
    obj.textEditor7:setName("textEditor7");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox1);
    obj.layout29:setLeft(500);
    obj.layout29:setTop(455);
    obj.layout29:setWidth(240);
    obj.layout29:setHeight(165);
    obj.layout29:setName("layout29");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout29);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("innerLine");
    obj.rectangle11:setName("rectangle11");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout29);
    obj.label17:setLeft(0);
    obj.label17:setTop(0);
    obj.label17:setWidth(240);
    obj.label17:setHeight(20);
    obj.label17:setText("RETAINERS");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout29);
    obj.textEditor8:setLeft(15);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(200);
    obj.textEditor8:setHeight(125);
    obj.textEditor8:setField("retainers");
    obj.textEditor8:setName("textEditor8");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox1);
    obj.layout30:setLeft(750);
    obj.layout30:setTop(280);
    obj.layout30:setWidth(240);
    obj.layout30:setHeight(165);
    obj.layout30:setName("layout30");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout30);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(10);
    obj.rectangle12:setCornerType("innerLine");
    obj.rectangle12:setName("rectangle12");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout30);
    obj.label18:setLeft(0);
    obj.label18:setTop(0);
    obj.label18:setWidth(240);
    obj.label18:setHeight(20);
    obj.label18:setText("HERD");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout30);
    obj.textEditor9:setLeft(15);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(200);
    obj.textEditor9:setHeight(125);
    obj.textEditor9:setField("herd");
    obj.textEditor9:setName("textEditor9");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox1);
    obj.layout31:setLeft(750);
    obj.layout31:setTop(455);
    obj.layout31:setWidth(240);
    obj.layout31:setHeight(165);
    obj.layout31:setName("layout31");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout31);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setXradius(10);
    obj.rectangle13:setYradius(10);
    obj.rectangle13:setCornerType("innerLine");
    obj.rectangle13:setName("rectangle13");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout31);
    obj.label19:setLeft(0);
    obj.label19:setTop(0);
    obj.label19:setWidth(240);
    obj.label19:setHeight(20);
    obj.label19:setText("STATUS");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout31);
    obj.textEditor10:setLeft(15);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(200);
    obj.textEditor10:setHeight(125);
    obj.textEditor10:setField("status");
    obj.textEditor10:setName("textEditor10");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox1);
    obj.layout32:setLeft(1000);
    obj.layout32:setTop(280);
    obj.layout32:setWidth(240);
    obj.layout32:setHeight(165);
    obj.layout32:setName("layout32");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout32);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(10);
    obj.rectangle14:setCornerType("innerLine");
    obj.rectangle14:setName("rectangle14");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout32);
    obj.label20:setLeft(0);
    obj.label20:setTop(0);
    obj.label20:setWidth(240);
    obj.label20:setHeight(20);
    obj.label20:setText("INFLUENCE");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout32);
    obj.textEditor11:setLeft(15);
    obj.textEditor11:setTop(25);
    obj.textEditor11:setWidth(200);
    obj.textEditor11:setHeight(125);
    obj.textEditor11:setField("influence");
    obj.textEditor11:setName("textEditor11");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox1);
    obj.layout33:setLeft(1000);
    obj.layout33:setTop(455);
    obj.layout33:setWidth(240);
    obj.layout33:setHeight(165);
    obj.layout33:setName("layout33");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout33);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(10);
    obj.rectangle15:setYradius(10);
    obj.rectangle15:setCornerType("innerLine");
    obj.rectangle15:setName("rectangle15");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout33);
    obj.label21:setLeft(0);
    obj.label21:setTop(0);
    obj.label21:setWidth(240);
    obj.label21:setHeight(20);
    obj.label21:setText("OTHER");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout33);
    obj.textEditor12:setLeft(15);
    obj.textEditor12:setTop(25);
    obj.textEditor12:setWidth(200);
    obj.textEditor12:setHeight(125);
    obj.textEditor12:setField("other");
    obj.textEditor12:setName("textEditor12");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVM20_4()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVM20_4();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVM20_4 = {
    newEditor = newfrmVM20_4, 
    new = newfrmVM20_4, 
    name = "frmVM20_4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmVM20_4 = _frmVM20_4;
Firecast.registrarForm(_frmVM20_4);

return _frmVM20_4;
