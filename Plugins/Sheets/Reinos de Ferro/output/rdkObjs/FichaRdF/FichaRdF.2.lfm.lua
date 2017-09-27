require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmRDF2()
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
    obj:setName("frmRDF2");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(430);
    obj.layout1:setHeight(210);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(15);
    obj.label1:setTop(0);
    obj.label1:setWidth(400);
    obj.label1:setHeight(20);
    obj.label1:setText("ATAQUES CORPO A CORPO");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(150);
    obj.label2:setHeight(20);
    obj.label2:setText("NOME");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(150);
    obj.label3:setTop(5);
    obj.label3:setWidth(150);
    obj.label3:setHeight(20);
    obj.label3:setText("NOTAS");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(300);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("ACO");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(350);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("P+F");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout1);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(50);
    obj.scrollBox2:setWidth(425);
    obj.scrollBox2:setHeight(150);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox2);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(400);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("atqC_1");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(150);
    obj.edit2:setHeight(25);
    obj.edit2:setField("atqC_notas_1");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(300);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("atqC_aco_1");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(350);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("atqC_pf_1");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox2);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(25);
    obj.layout4:setWidth(400);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(150);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atqC_2");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setLeft(150);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(150);
    obj.edit6:setHeight(25);
    obj.edit6:setField("atqC_notas_2");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setLeft(300);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("atqC_aco_2");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(350);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("atqC_pf_2");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox2);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(50);
    obj.layout5:setWidth(400);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(150);
    obj.edit9:setHeight(25);
    obj.edit9:setField("atqC_3");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout5);
    obj.edit10:setLeft(150);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(150);
    obj.edit10:setHeight(25);
    obj.edit10:setField("atqC_notas_3");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout5);
    obj.edit11:setLeft(300);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("atqC_aco_3");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout5);
    obj.edit12:setLeft(350);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("atqC_pf_3");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox2);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(75);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout6);
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(150);
    obj.edit13:setHeight(25);
    obj.edit13:setField("atqC_4");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout6);
    obj.edit14:setLeft(150);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(150);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atqC_notas_4");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout6);
    obj.edit15:setLeft(300);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atqC_aco_4");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout6);
    obj.edit16:setLeft(350);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atqC_pf_4");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox2);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(100);
    obj.layout7:setWidth(400);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout7);
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(150);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atqC_5");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout7);
    obj.edit18:setLeft(150);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(150);
    obj.edit18:setHeight(25);
    obj.edit18:setField("atqC_notas_5");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout7);
    obj.edit19:setLeft(300);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("atqC_aco_5");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout7);
    obj.edit20:setLeft(350);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("atqC_pf_5");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox2);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(125);
    obj.layout8:setWidth(400);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout8);
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(150);
    obj.edit21:setHeight(25);
    obj.edit21:setField("atqC_6");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout8);
    obj.edit22:setLeft(150);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(150);
    obj.edit22:setHeight(25);
    obj.edit22:setField("atqC_notas_6");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout8);
    obj.edit23:setLeft(300);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("atqC_aco_6");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout8);
    obj.edit24:setLeft(350);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("atqC_pf_6");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox2);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(150);
    obj.layout9:setWidth(400);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout9);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(150);
    obj.edit25:setHeight(25);
    obj.edit25:setField("atqC_7");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout9);
    obj.edit26:setLeft(150);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(150);
    obj.edit26:setHeight(25);
    obj.edit26:setField("atqC_notas_7");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout9);
    obj.edit27:setLeft(300);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("atqC_aco_7");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout9);
    obj.edit28:setLeft(350);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setField("atqC_pf_7");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox2);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(175);
    obj.layout10:setWidth(400);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout10);
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(150);
    obj.edit29:setHeight(25);
    obj.edit29:setField("atqC_8");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout10);
    obj.edit30:setLeft(150);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(150);
    obj.edit30:setHeight(25);
    obj.edit30:setField("atqC_notas_8");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout10);
    obj.edit31:setLeft(300);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(25);
    obj.edit31:setField("atqC_aco_8");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout10);
    obj.edit32:setLeft(350);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("atqC_pf_8");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox2);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(200);
    obj.layout11:setWidth(400);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout11);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(150);
    obj.edit33:setHeight(25);
    obj.edit33:setField("atqC_9");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout11);
    obj.edit34:setLeft(150);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(150);
    obj.edit34:setHeight(25);
    obj.edit34:setField("atqC_notas_9");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout11);
    obj.edit35:setLeft(300);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("atqC_aco_9");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout11);
    obj.edit36:setLeft(350);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("atqC_pf_9");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox2);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(225);
    obj.layout12:setWidth(400);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout12);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(150);
    obj.edit37:setHeight(25);
    obj.edit37:setField("atqC_10");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout12);
    obj.edit38:setLeft(150);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(150);
    obj.edit38:setHeight(25);
    obj.edit38:setField("atqC_notas_10");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout12);
    obj.edit39:setLeft(300);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("atqC_aco_10");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout12);
    obj.edit40:setLeft(350);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("atqC_pf_10");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(440);
    obj.layout13:setTop(0);
    obj.layout13:setWidth(530);
    obj.layout13:setHeight(210);
    obj.layout13:setName("layout13");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout13);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout13);
    obj.label6:setLeft(15);
    obj.label6:setTop(0);
    obj.label6:setWidth(500);
    obj.label6:setHeight(20);
    obj.label6:setText("ATAQUES A DISTANCIA");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(25);
    obj.layout14:setWidth(500);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout14);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(150);
    obj.label7:setHeight(20);
    obj.label7:setText("NOME");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout14);
    obj.label8:setLeft(150);
    obj.label8:setTop(5);
    obj.label8:setWidth(150);
    obj.label8:setHeight(20);
    obj.label8:setText("NOTAS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout14);
    obj.label9:setLeft(300);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("ALC");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout14);
    obj.label10:setLeft(350);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("ADI");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout14);
    obj.label11:setLeft(400);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("POD");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout14);
    obj.label12:setLeft(450);
    obj.label12:setTop(5);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setText("MUN");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout13);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(50);
    obj.scrollBox3:setWidth(525);
    obj.scrollBox3:setHeight(150);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox3);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(0);
    obj.layout15:setWidth(500);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout15);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(150);
    obj.edit41:setHeight(25);
    obj.edit41:setField("atqD_1");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout15);
    obj.edit42:setLeft(150);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(150);
    obj.edit42:setHeight(25);
    obj.edit42:setField("atqD_notas_1");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout15);
    obj.edit43:setLeft(300);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(25);
    obj.edit43:setField("atqD_alc_1");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout15);
    obj.edit44:setLeft(350);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("atqD_adi_1");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout15);
    obj.edit45:setLeft(400);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(25);
    obj.edit45:setField("atqD_pod_1");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout15);
    obj.edit46:setLeft(450);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(25);
    obj.edit46:setField("atqD_mun_1");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox3);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(25);
    obj.layout16:setWidth(500);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout16);
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(150);
    obj.edit47:setHeight(25);
    obj.edit47:setField("atqD_2");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout16);
    obj.edit48:setLeft(150);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(150);
    obj.edit48:setHeight(25);
    obj.edit48:setField("atqD_notas_2");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout16);
    obj.edit49:setLeft(300);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(25);
    obj.edit49:setField("atqD_alc_2");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout16);
    obj.edit50:setLeft(350);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(25);
    obj.edit50:setField("atqD_adi_2");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout16);
    obj.edit51:setLeft(400);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setField("atqD_pod_2");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout16);
    obj.edit52:setLeft(450);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(25);
    obj.edit52:setField("atqD_mun_2");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox3);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(50);
    obj.layout17:setWidth(500);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout17);
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(150);
    obj.edit53:setHeight(25);
    obj.edit53:setField("atqD_3");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout17);
    obj.edit54:setLeft(150);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(150);
    obj.edit54:setHeight(25);
    obj.edit54:setField("atqD_notas_3");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout17);
    obj.edit55:setLeft(300);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(50);
    obj.edit55:setHeight(25);
    obj.edit55:setField("atqD_alc_3");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout17);
    obj.edit56:setLeft(350);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(25);
    obj.edit56:setField("atqD_adi_3");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout17);
    obj.edit57:setLeft(400);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(25);
    obj.edit57:setField("atqD_pod_3");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout17);
    obj.edit58:setLeft(450);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(50);
    obj.edit58:setHeight(25);
    obj.edit58:setField("atqD_mun_3");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox3);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(75);
    obj.layout18:setWidth(500);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout18);
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(150);
    obj.edit59:setHeight(25);
    obj.edit59:setField("atqD_4");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout18);
    obj.edit60:setLeft(150);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(150);
    obj.edit60:setHeight(25);
    obj.edit60:setField("atqD_notas_4");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout18);
    obj.edit61:setLeft(300);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(50);
    obj.edit61:setHeight(25);
    obj.edit61:setField("atqD_alc_4");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout18);
    obj.edit62:setLeft(350);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(50);
    obj.edit62:setHeight(25);
    obj.edit62:setField("atqD_adi_4");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout18);
    obj.edit63:setLeft(400);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(25);
    obj.edit63:setField("atqD_pod_4");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout18);
    obj.edit64:setLeft(450);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(50);
    obj.edit64:setHeight(25);
    obj.edit64:setField("atqD_mun_4");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox3);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(100);
    obj.layout19:setWidth(500);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout19);
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(150);
    obj.edit65:setHeight(25);
    obj.edit65:setField("atqD_5");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout19);
    obj.edit66:setLeft(150);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(150);
    obj.edit66:setHeight(25);
    obj.edit66:setField("atqD_notas_5");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout19);
    obj.edit67:setLeft(300);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(50);
    obj.edit67:setHeight(25);
    obj.edit67:setField("atqD_alc_5");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout19);
    obj.edit68:setLeft(350);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(50);
    obj.edit68:setHeight(25);
    obj.edit68:setField("atqD_adi_5");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout19);
    obj.edit69:setLeft(400);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(50);
    obj.edit69:setHeight(25);
    obj.edit69:setField("atqD_pod_5");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout19);
    obj.edit70:setLeft(450);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(50);
    obj.edit70:setHeight(25);
    obj.edit70:setField("atqD_mun_5");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox3);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(125);
    obj.layout20:setWidth(500);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout20);
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(150);
    obj.edit71:setHeight(25);
    obj.edit71:setField("atqD_6");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout20);
    obj.edit72:setLeft(150);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(150);
    obj.edit72:setHeight(25);
    obj.edit72:setField("atqD_notas_6");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout20);
    obj.edit73:setLeft(300);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(50);
    obj.edit73:setHeight(25);
    obj.edit73:setField("atqD_alc_6");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout20);
    obj.edit74:setLeft(350);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(50);
    obj.edit74:setHeight(25);
    obj.edit74:setField("atqD_adi_6");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout20);
    obj.edit75:setLeft(400);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(25);
    obj.edit75:setField("atqD_pod_6");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout20);
    obj.edit76:setLeft(450);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(50);
    obj.edit76:setHeight(25);
    obj.edit76:setField("atqD_mun_6");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox3);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(150);
    obj.layout21:setWidth(500);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout21);
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(150);
    obj.edit77:setHeight(25);
    obj.edit77:setField("atqD_7");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout21);
    obj.edit78:setLeft(150);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(150);
    obj.edit78:setHeight(25);
    obj.edit78:setField("atqD_notas_7");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout21);
    obj.edit79:setLeft(300);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(50);
    obj.edit79:setHeight(25);
    obj.edit79:setField("atqD_alc_7");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout21);
    obj.edit80:setLeft(350);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(25);
    obj.edit80:setField("atqD_adi_7");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout21);
    obj.edit81:setLeft(400);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(50);
    obj.edit81:setHeight(25);
    obj.edit81:setField("atqD_pod_7");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout21);
    obj.edit82:setLeft(450);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(50);
    obj.edit82:setHeight(25);
    obj.edit82:setField("atqD_mun_7");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox3);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(175);
    obj.layout22:setWidth(500);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout22);
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(150);
    obj.edit83:setHeight(25);
    obj.edit83:setField("atqD_8");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout22);
    obj.edit84:setLeft(150);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(150);
    obj.edit84:setHeight(25);
    obj.edit84:setField("atqD_notas_8");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout22);
    obj.edit85:setLeft(300);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(50);
    obj.edit85:setHeight(25);
    obj.edit85:setField("atqD_alc_8");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout22);
    obj.edit86:setLeft(350);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(50);
    obj.edit86:setHeight(25);
    obj.edit86:setField("atqD_adi_8");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout22);
    obj.edit87:setLeft(400);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("atqD_pod_8");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout22);
    obj.edit88:setLeft(450);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(50);
    obj.edit88:setHeight(25);
    obj.edit88:setField("atqD_mun_8");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox3);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(200);
    obj.layout23:setWidth(500);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout23);
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(150);
    obj.edit89:setHeight(25);
    obj.edit89:setField("atqD_9");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout23);
    obj.edit90:setLeft(150);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(150);
    obj.edit90:setHeight(25);
    obj.edit90:setField("atqD_notas_9");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout23);
    obj.edit91:setLeft(300);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(50);
    obj.edit91:setHeight(25);
    obj.edit91:setField("atqD_alc_9");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout23);
    obj.edit92:setLeft(350);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(50);
    obj.edit92:setHeight(25);
    obj.edit92:setField("atqD_adi_9");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout23);
    obj.edit93:setLeft(400);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(50);
    obj.edit93:setHeight(25);
    obj.edit93:setField("atqD_pod_9");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout23);
    obj.edit94:setLeft(450);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(50);
    obj.edit94:setHeight(25);
    obj.edit94:setField("atqD_mun_9");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox3);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(225);
    obj.layout24:setWidth(500);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout24);
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(150);
    obj.edit95:setHeight(25);
    obj.edit95:setField("atqD_10");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout24);
    obj.edit96:setLeft(150);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(150);
    obj.edit96:setHeight(25);
    obj.edit96:setField("atqD_notas_10");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout24);
    obj.edit97:setLeft(300);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(50);
    obj.edit97:setHeight(25);
    obj.edit97:setField("atqD_alc_10");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout24);
    obj.edit98:setLeft(350);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(50);
    obj.edit98:setHeight(25);
    obj.edit98:setField("atqD_adi_10");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout24);
    obj.edit99:setLeft(400);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(50);
    obj.edit99:setHeight(25);
    obj.edit99:setField("atqD_pod_10");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout24);
    obj.edit100:setLeft(450);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(50);
    obj.edit100:setHeight(25);
    obj.edit100:setField("atqD_mun_10");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox1);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(220);
    obj.layout25:setWidth(430);
    obj.layout25:setHeight(390);
    obj.layout25:setName("layout25");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout25);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout25);
    obj.label13:setLeft(15);
    obj.label13:setTop(0);
    obj.label13:setWidth(400);
    obj.label13:setHeight(20);
    obj.label13:setText("EQUIPAMENTO");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout25);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(420);
    obj.textEditor1:setHeight(360);
    obj.textEditor1:setField("equipamento");
    obj.textEditor1:setName("textEditor1");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(440);
    obj.layout26:setTop(220);
    obj.layout26:setWidth(460);
    obj.layout26:setHeight(110);
    obj.layout26:setName("layout26");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout26);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout26);
    obj.label14:setLeft(15);
    obj.label14:setTop(0);
    obj.label14:setWidth(400);
    obj.label14:setHeight(20);
    obj.label14:setText("ARMADURA");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(25);
    obj.layout27:setWidth(450);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout27);
    obj.label15:setLeft(0);
    obj.label15:setTop(5);
    obj.label15:setWidth(150);
    obj.label15:setHeight(20);
    obj.label15:setText("NOME");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout27);
    obj.label16:setLeft(150);
    obj.label16:setTop(5);
    obj.label16:setWidth(150);
    obj.label16:setHeight(20);
    obj.label16:setText("DESCRIÇÃO");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout27);
    obj.label17:setLeft(300);
    obj.label17:setTop(5);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("VEL");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout27);
    obj.label18:setLeft(350);
    obj.label18:setTop(5);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setText("DEF");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout27);
    obj.label19:setLeft(400);
    obj.label19:setTop(5);
    obj.label19:setWidth(50);
    obj.label19:setHeight(20);
    obj.label19:setText("ARM");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout26);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(50);
    obj.layout28:setWidth(500);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout28);
    obj.edit101:setLeft(0);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(150);
    obj.edit101:setHeight(25);
    obj.edit101:setField("arm_1");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout28);
    obj.edit102:setLeft(150);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(150);
    obj.edit102:setHeight(25);
    obj.edit102:setField("arm_notas_1");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout28);
    obj.edit103:setLeft(300);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(50);
    obj.edit103:setHeight(25);
    obj.edit103:setField("arm_alc_1");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout28);
    obj.edit104:setLeft(350);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(50);
    obj.edit104:setHeight(25);
    obj.edit104:setField("arm_adi_1");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout28);
    obj.edit105:setLeft(400);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(50);
    obj.edit105:setHeight(25);
    obj.edit105:setField("arm_pod_1");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout26);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(75);
    obj.layout29:setWidth(500);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout29);
    obj.edit106:setLeft(0);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(150);
    obj.edit106:setHeight(25);
    obj.edit106:setField("arm_2");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout29);
    obj.edit107:setLeft(150);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(150);
    obj.edit107:setHeight(25);
    obj.edit107:setField("arm_notas_2");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout29);
    obj.edit108:setLeft(300);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(50);
    obj.edit108:setHeight(25);
    obj.edit108:setField("arm_alc_2");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout29);
    obj.edit109:setLeft(350);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(50);
    obj.edit109:setHeight(25);
    obj.edit109:setField("arm_adi_2");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout29);
    obj.edit110:setLeft(400);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setField("arm_pod_2");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox1);
    obj.layout30:setLeft(440);
    obj.layout30:setTop(340);
    obj.layout30:setWidth(250);
    obj.layout30:setHeight(250);
    obj.layout30:setName("layout30");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout30);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout30);
    obj.label20:setLeft(5);
    obj.label20:setTop(0);
    obj.label20:setWidth(240);
    obj.label20:setHeight(20);
    obj.label20:setText("DINHEIRO");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout30);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(240);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("dinheiro");
    obj.textEditor2:setName("textEditor2");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmRDF2 = {
    newEditor = newfrmRDF2, 
    new = newfrmRDF2, 
    name = "frmRDF2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRDF2 = _frmRDF2;
rrpg.registrarForm(_frmRDF2);

return _frmRDF2;
