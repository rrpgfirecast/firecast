require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmRdF()
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
    obj:setName("frmRdF");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaRdF");
    obj:setTitle("Ficha Reinos de Ferro");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmRDF1 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF1:setParent(obj.tab1);
    obj.frmRDF1:setName("frmRDF1");
    obj.frmRDF1:setAlign("client");
    obj.frmRDF1:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmRDF1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(5);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(950);
    obj.rectangle1:setHeight(70);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desc_nome");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(320);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Aquétipo");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desc_arquetipo");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(585);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Religião");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(110);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("desc_religiao");
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("Raça");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("desc_raca");
    obj.edit4:setName("edit4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(320);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Carreiras");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(110);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("desc_carreiras");
    obj.edit5:setName("edit5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(585);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Nível");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("nivel");
    obj.edit6:setName("edit6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setLeft(160);
    obj.label7:setTop(5);
    obj.label7:setWidth(40);
    obj.label7:setHeight(20);
    obj.label7:setText("XP");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setLeft(210);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(25);
    obj.edit7:setField("xp");
    obj.edit7:setName("edit7");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(80);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(400);
    obj.layout8:setName("layout8");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(250);
    obj.label8:setHeight(20);
    obj.label8:setText("ATRIBUTOS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(15);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(240);
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("FIS");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(0);
    obj.edit8:setTop(25);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("atr_fis");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setLeft(50);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("Max.");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setLeft(50);
    obj.edit9:setTop(25);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("atr_max_fis");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(130);
    obj.layout10:setTop(25);
    obj.layout10:setWidth(240);
    obj.layout10:setHeight(50);
    obj.layout10:setName("layout10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout10);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("VEL");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(25);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("atr_vel");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setLeft(50);
    obj.label12:setTop(5);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setText("Max.");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout10);
    obj.edit11:setLeft(50);
    obj.edit11:setTop(25);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("atr_max_vel");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(130);
    obj.layout11:setTop(75);
    obj.layout11:setWidth(290);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setLeft(0);
    obj.label13:setTop(5);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setText("FOR");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout11);
    obj.edit12:setLeft(0);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("atr_for");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setLeft(50);
    obj.label14:setTop(5);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setText("Max.");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout11);
    obj.edit13:setLeft(50);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("atr_max_for");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(130);
    obj.horzLine1:setWidth(300);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(15);
    obj.layout12:setTop(155);
    obj.layout12:setWidth(240);
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout12);
    obj.label15:setLeft(0);
    obj.label15:setTop(5);
    obj.label15:setWidth(50);
    obj.label15:setHeight(20);
    obj.label15:setText("AGI");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout12);
    obj.edit14:setLeft(0);
    obj.edit14:setTop(25);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atr_agi");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setLeft(50);
    obj.label16:setTop(5);
    obj.label16:setWidth(50);
    obj.label16:setHeight(20);
    obj.label16:setText("Max.");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout12);
    obj.edit15:setLeft(50);
    obj.edit15:setTop(25);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atr_max_agi");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(130);
    obj.layout13:setTop(130);
    obj.layout13:setWidth(240);
    obj.layout13:setHeight(50);
    obj.layout13:setName("layout13");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setLeft(0);
    obj.label17:setTop(5);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("DES");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout13);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(25);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atr_des");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setLeft(50);
    obj.label18:setTop(5);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setText("Max.");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout13);
    obj.edit17:setLeft(50);
    obj.edit17:setTop(25);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atr_max_des");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(130);
    obj.layout14:setTop(180);
    obj.layout14:setWidth(290);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setLeft(0);
    obj.label19:setTop(5);
    obj.label19:setWidth(50);
    obj.label19:setHeight(20);
    obj.label19:setText("MAE");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout14);
    obj.edit18:setLeft(0);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("atr_mae");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setLeft(50);
    obj.label20:setTop(5);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setText("Max.");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout14);
    obj.edit19:setLeft(50);
    obj.edit19:setTop(25);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("atr_max_mae");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.horzLine2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout8);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(235);
    obj.horzLine2:setWidth(300);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout8);
    obj.layout15:setLeft(15);
    obj.layout15:setTop(260);
    obj.layout15:setWidth(240);
    obj.layout15:setHeight(50);
    obj.layout15:setName("layout15");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout15);
    obj.label21:setLeft(0);
    obj.label21:setTop(5);
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setText("INT");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout15);
    obj.edit20:setLeft(0);
    obj.edit20:setTop(25);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("atr_int");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout15);
    obj.label22:setLeft(50);
    obj.label22:setTop(5);
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setText("Max.");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout15);
    obj.edit21:setLeft(50);
    obj.edit21:setTop(25);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("atr_max_int");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout8);
    obj.layout16:setLeft(130);
    obj.layout16:setTop(235);
    obj.layout16:setWidth(240);
    obj.layout16:setHeight(50);
    obj.layout16:setName("layout16");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout16);
    obj.label23:setLeft(0);
    obj.label23:setTop(5);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setText("ARC");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout16);
    obj.edit22:setLeft(0);
    obj.edit22:setTop(25);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("atr_arc");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout16);
    obj.label24:setLeft(50);
    obj.label24:setTop(5);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setText("Max.");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout16);
    obj.edit23:setLeft(50);
    obj.edit23:setTop(25);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("atr_max_arc");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout8);
    obj.layout17:setLeft(130);
    obj.layout17:setTop(285);
    obj.layout17:setWidth(290);
    obj.layout17:setHeight(50);
    obj.layout17:setName("layout17");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout17);
    obj.label25:setLeft(0);
    obj.label25:setTop(5);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("PER");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout17);
    obj.edit24:setLeft(0);
    obj.edit24:setTop(25);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("atr_per");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout17);
    obj.label26:setLeft(50);
    obj.label26:setTop(5);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setText("Max.");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout17);
    obj.edit25:setLeft(50);
    obj.edit25:setTop(25);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setField("atr_max_per");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.horzLine3 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout8);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(340);
    obj.horzLine3:setWidth(300);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout8);
    obj.layout18:setLeft(100);
    obj.layout18:setTop(340);
    obj.layout18:setWidth(240);
    obj.layout18:setHeight(50);
    obj.layout18:setName("layout18");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout18);
    obj.label27:setLeft(0);
    obj.label27:setTop(5);
    obj.label27:setWidth(50);
    obj.label27:setHeight(20);
    obj.label27:setText("VON");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout18);
    obj.edit26:setLeft(0);
    obj.edit26:setTop(25);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("bloco_von");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(490);
    obj.layout19:setWidth(250);
    obj.layout19:setHeight(120);
    obj.layout19:setName("layout19");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout19);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout19);
    obj.label28:setLeft(5);
    obj.label28:setTop(0);
    obj.label28:setWidth(240);
    obj.label28:setHeight(20);
    obj.label28:setText("FERIMENTOS PERMANENTES");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout19);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(90);
    obj.textEditor1:setField("ferimentos");
    obj.textEditor1:setName("textEditor1");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(260);
    obj.layout20:setTop(80);
    obj.layout20:setWidth(310);
    obj.layout20:setHeight(80);
    obj.layout20:setName("layout20");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout20);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout20);
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(310);
    obj.label29:setHeight(20);
    obj.label29:setText("DEFESA");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(25);
    obj.layout21:setWidth(50);
    obj.layout21:setHeight(50);
    obj.layout21:setName("layout21");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout21);
    obj.label30:setLeft(0);
    obj.label30:setTop(5);
    obj.label30:setWidth(50);
    obj.label30:setHeight(20);
    obj.label30:setText("VEL");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout21);
    obj.edit27:setLeft(0);
    obj.edit27:setTop(25);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("bloco_vel");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setLeft(55);
    obj.layout22:setTop(25);
    obj.layout22:setWidth(50);
    obj.layout22:setHeight(50);
    obj.layout22:setName("layout22");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout22);
    obj.label31:setLeft(0);
    obj.label31:setTop(5);
    obj.label31:setWidth(50);
    obj.label31:setHeight(20);
    obj.label31:setText("AGI");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout22);
    obj.edit28:setLeft(0);
    obj.edit28:setTop(25);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setField("bloco_agi");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setLeft(105);
    obj.layout23:setTop(25);
    obj.layout23:setWidth(50);
    obj.layout23:setHeight(50);
    obj.layout23:setName("layout23");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout23);
    obj.label32:setLeft(0);
    obj.label32:setTop(5);
    obj.label32:setWidth(50);
    obj.label32:setHeight(20);
    obj.label32:setText("PER");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout23);
    obj.edit29:setLeft(0);
    obj.edit29:setTop(25);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("bloco_per");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout20);
    obj.layout24:setLeft(155);
    obj.layout24:setTop(25);
    obj.layout24:setWidth(50);
    obj.layout24:setHeight(50);
    obj.layout24:setName("layout24");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout24);
    obj.label33:setLeft(0);
    obj.label33:setTop(5);
    obj.label33:setWidth(50);
    obj.label33:setHeight(20);
    obj.label33:setText("EQUIP");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout24);
    obj.edit30:setLeft(0);
    obj.edit30:setTop(25);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("bloco_equip");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout20);
    obj.layout25:setLeft(205);
    obj.layout25:setTop(25);
    obj.layout25:setWidth(50);
    obj.layout25:setHeight(50);
    obj.layout25:setName("layout25");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout25);
    obj.label34:setLeft(0);
    obj.label34:setTop(5);
    obj.label34:setWidth(50);
    obj.label34:setHeight(20);
    obj.label34:setText("OUTRO");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout25);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(25);
    obj.edit31:setField("bloco_out_def");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout20);
    obj.layout26:setLeft(255);
    obj.layout26:setTop(25);
    obj.layout26:setWidth(50);
    obj.layout26:setHeight(50);
    obj.layout26:setName("layout26");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout26);
    obj.label35:setLeft(0);
    obj.label35:setTop(5);
    obj.label35:setWidth(50);
    obj.label35:setHeight(20);
    obj.label35:setText("TOTAL");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout26);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(25);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout26);
    obj.label36:setLeft(0);
    obj.label36:setTop(25);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setField("defesa_total");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout20);
    obj.dataLink1:setFields({'bloco_vel', 'bloco_agi', 'bloco_per', 'bloco_equip', 'bloco_out_def'});
    obj.dataLink1:setName("dataLink1");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(260);
    obj.layout27:setTop(170);
    obj.layout27:setWidth(310);
    obj.layout27:setHeight(80);
    obj.layout27:setName("layout27");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout27);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout27);
    obj.label37:setLeft(0);
    obj.label37:setTop(0);
    obj.label37:setWidth(310);
    obj.label37:setHeight(20);
    obj.label37:setText("ARMADURA");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setLeft(30);
    obj.layout28:setTop(25);
    obj.layout28:setWidth(50);
    obj.layout28:setHeight(50);
    obj.layout28:setName("layout28");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout28);
    obj.label38:setLeft(0);
    obj.label38:setTop(5);
    obj.label38:setWidth(50);
    obj.label38:setHeight(20);
    obj.label38:setText("FIS");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout28);
    obj.edit32:setLeft(0);
    obj.edit32:setTop(25);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("bloco_fis");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29:setLeft(80);
    obj.layout29:setTop(25);
    obj.layout29:setWidth(50);
    obj.layout29:setHeight(50);
    obj.layout29:setName("layout29");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout29);
    obj.label39:setLeft(0);
    obj.label39:setTop(5);
    obj.label39:setWidth(50);
    obj.label39:setHeight(20);
    obj.label39:setText("ARM");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout29);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(25);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("bloco_arm");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout27);
    obj.layout30:setLeft(130);
    obj.layout30:setTop(25);
    obj.layout30:setWidth(50);
    obj.layout30:setHeight(50);
    obj.layout30:setName("layout30");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout30);
    obj.label40:setLeft(0);
    obj.label40:setTop(5);
    obj.label40:setWidth(50);
    obj.label40:setHeight(20);
    obj.label40:setText("ESC");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout30);
    obj.edit34:setLeft(0);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("bloco_esc");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setLeft(180);
    obj.layout31:setTop(25);
    obj.layout31:setWidth(50);
    obj.layout31:setHeight(50);
    obj.layout31:setName("layout31");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout31);
    obj.label41:setLeft(0);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(20);
    obj.label41:setText("OUTRO");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout31);
    obj.edit35:setLeft(0);
    obj.edit35:setTop(25);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("bloco_out_arm");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32:setLeft(230);
    obj.layout32:setTop(25);
    obj.layout32:setWidth(50);
    obj.layout32:setHeight(50);
    obj.layout32:setName("layout32");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout32);
    obj.label42:setLeft(0);
    obj.label42:setTop(5);
    obj.label42:setWidth(50);
    obj.label42:setHeight(20);
    obj.label42:setText("TOTAL");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout32);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(25);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout32);
    obj.label43:setLeft(0);
    obj.label43:setTop(25);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setField("armadura_total");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout27);
    obj.dataLink2:setFields({'bloco_fis', 'bloco_arm', 'bloco_esc', 'bloco_out_arm'});
    obj.dataLink2:setName("dataLink2");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox1);
    obj.layout33:setLeft(260);
    obj.layout33:setTop(260);
    obj.layout33:setWidth(310);
    obj.layout33:setHeight(80);
    obj.layout33:setName("layout33");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout33);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout33);
    obj.label44:setLeft(0);
    obj.label44:setTop(0);
    obj.label44:setWidth(310);
    obj.label44:setHeight(20);
    obj.label44:setText("INICIATIVA");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(25);
    obj.layout34:setWidth(50);
    obj.layout34:setHeight(50);
    obj.layout34:setName("layout34");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout34);
    obj.label45:setLeft(0);
    obj.label45:setTop(5);
    obj.label45:setWidth(50);
    obj.label45:setHeight(20);
    obj.label45:setText("VEL");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout34);
    obj.edit36:setLeft(0);
    obj.edit36:setTop(25);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("bloco_vel");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setLeft(55);
    obj.layout35:setTop(25);
    obj.layout35:setWidth(50);
    obj.layout35:setHeight(50);
    obj.layout35:setName("layout35");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout35);
    obj.label46:setLeft(0);
    obj.label46:setTop(5);
    obj.label46:setWidth(50);
    obj.label46:setHeight(20);
    obj.label46:setText("MAE");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout35);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(25);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("bloco_mae");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout33);
    obj.layout36:setLeft(105);
    obj.layout36:setTop(25);
    obj.layout36:setWidth(50);
    obj.layout36:setHeight(50);
    obj.layout36:setName("layout36");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout36);
    obj.label47:setLeft(0);
    obj.label47:setTop(5);
    obj.label47:setWidth(50);
    obj.label47:setHeight(20);
    obj.label47:setText("PER");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout36);
    obj.edit38:setLeft(0);
    obj.edit38:setTop(25);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("bloco_per");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37:setLeft(155);
    obj.layout37:setTop(25);
    obj.layout37:setWidth(50);
    obj.layout37:setHeight(50);
    obj.layout37:setName("layout37");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout37);
    obj.label48:setLeft(0);
    obj.label48:setTop(5);
    obj.label48:setWidth(50);
    obj.label48:setHeight(20);
    obj.label48:setText("EQUIP");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout37);
    obj.edit39:setLeft(0);
    obj.edit39:setTop(25);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("bloco_equip_ini");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout33);
    obj.layout38:setLeft(205);
    obj.layout38:setTop(25);
    obj.layout38:setWidth(50);
    obj.layout38:setHeight(50);
    obj.layout38:setName("layout38");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout38);
    obj.label49:setLeft(0);
    obj.label49:setTop(5);
    obj.label49:setWidth(50);
    obj.label49:setHeight(20);
    obj.label49:setText("OUTRO");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout38);
    obj.edit40:setLeft(0);
    obj.edit40:setTop(25);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("bloco_out_ini");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout33);
    obj.layout39:setLeft(255);
    obj.layout39:setTop(25);
    obj.layout39:setWidth(50);
    obj.layout39:setHeight(50);
    obj.layout39:setName("layout39");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout39);
    obj.label50:setLeft(0);
    obj.label50:setTop(5);
    obj.label50:setWidth(50);
    obj.label50:setHeight(20);
    obj.label50:setText("TOTAL");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout39);
    obj.rectangle9:setLeft(0);
    obj.rectangle9:setTop(25);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout39);
    obj.label51:setLeft(0);
    obj.label51:setTop(25);
    obj.label51:setWidth(50);
    obj.label51:setHeight(25);
    obj.label51:setField("iniciativa_total");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout33);
    obj.dataLink3:setFields({'bloco_vel', 'bloco_mae', 'bloco_per', 'bloco_equip_ini', 'bloco_out_ini'});
    obj.dataLink3:setName("dataLink3");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(260);
    obj.layout40:setTop(350);
    obj.layout40:setWidth(310);
    obj.layout40:setHeight(80);
    obj.layout40:setName("layout40");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout40);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout40);
    obj.label52:setLeft(0);
    obj.label52:setTop(0);
    obj.label52:setWidth(310);
    obj.label52:setHeight(20);
    obj.label52:setText("ALCANCE DE COMANDO");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setLeft(55);
    obj.layout41:setTop(25);
    obj.layout41:setWidth(50);
    obj.layout41:setHeight(50);
    obj.layout41:setName("layout41");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout41);
    obj.label53:setLeft(0);
    obj.label53:setTop(5);
    obj.label53:setWidth(50);
    obj.label53:setHeight(20);
    obj.label53:setText("INT");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(25);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("bloco_int");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setLeft(105);
    obj.layout42:setTop(25);
    obj.layout42:setWidth(50);
    obj.layout42:setHeight(50);
    obj.layout42:setName("layout42");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout42);
    obj.label54:setLeft(0);
    obj.label54:setTop(5);
    obj.label54:setWidth(50);
    obj.label54:setHeight(20);
    obj.label54:setText("CMD");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setLeft(0);
    obj.edit42:setTop(25);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("bloco_cmd");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setLeft(155);
    obj.layout43:setTop(25);
    obj.layout43:setWidth(50);
    obj.layout43:setHeight(50);
    obj.layout43:setName("layout43");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout43);
    obj.label55:setLeft(0);
    obj.label55:setTop(5);
    obj.label55:setWidth(50);
    obj.label55:setHeight(20);
    obj.label55:setText("OUTRO");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setLeft(0);
    obj.edit43:setTop(25);
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(25);
    obj.edit43:setField("bloco_out_cmd");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setLeft(205);
    obj.layout44:setTop(25);
    obj.layout44:setWidth(50);
    obj.layout44:setHeight(50);
    obj.layout44:setName("layout44");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout44);
    obj.label56:setLeft(0);
    obj.label56:setTop(5);
    obj.label56:setWidth(50);
    obj.label56:setHeight(20);
    obj.label56:setText("TOTAL");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout44);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setTop(25);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout44);
    obj.label57:setLeft(0);
    obj.label57:setTop(25);
    obj.label57:setWidth(50);
    obj.label57:setHeight(25);
    obj.label57:setField("cmd_total");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout40);
    obj.dataLink4:setFields({'bloco_int', 'bloco_cmd', 'bloco_out_cmd'});
    obj.dataLink4:setName("dataLink4");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox1);
    obj.layout45:setLeft(260);
    obj.layout45:setTop(440);
    obj.layout45:setWidth(310);
    obj.layout45:setHeight(165);
    obj.layout45:setName("layout45");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout45);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout45);
    obj.label58:setLeft(0);
    obj.label58:setTop(0);
    obj.label58:setWidth(310);
    obj.label58:setHeight(20);
    obj.label58:setText("PONTOS DE FAÇANHA");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout45);
    obj.edit44:setLeft(10);
    obj.edit44:setTop(25);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("facanha");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout45);
    obj.label59:setLeft(70);
    obj.label59:setTop(25);
    obj.label59:setWidth(230);
    obj.label59:setHeight(20);
    obj.label59:setText("Recebendo pontos de Façanha:");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout45);
    obj.label60:setLeft(70);
    obj.label60:setTop(45);
    obj.label60:setWidth(230);
    obj.label60:setHeight(20);
    obj.label60:setText("Destruir Inimigo, Sucesso Critico, Prêmio do Mestre.");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setFontSize(9);
    obj.label60:setName("label60");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout45);
    obj.label61:setLeft(70);
    obj.label61:setTop(80);
    obj.label61:setWidth(230);
    obj.label61:setHeight(20);
    obj.label61:setText("Gastando pontos de Façanha:");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout45);
    obj.label62:setLeft(50);
    obj.label62:setTop(100);
    obj.label62:setWidth(250);
    obj.label62:setHeight(20);
    obj.label62:setText("Ampliar teste de Pericia, Atirar e Correr, Corrida.");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setFontSize(9);
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout45);
    obj.label63:setLeft(50);
    obj.label63:setTop(120);
    obj.label63:setWidth(250);
    obj.label63:setHeight(20);
    obj.label63:setText("Ação Rapida, Recuperar Folego, Aparar, Esquiva, Refazer Teste.");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setFontSize(9);
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout45);
    obj.label64:setLeft(50);
    obj.label64:setTop(140);
    obj.label64:setWidth(250);
    obj.label64:setHeight(20);
    obj.label64:setText("Resistir efeito continuo/Imobilizar/Nocaute, Investida.");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setFontSize(9);
    obj.label64:setName("label64");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(579);
    obj.rectangle13:setTop(79);
    obj.rectangle13:setWidth(302);
    obj.rectangle13:setHeight(302);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(580);
    obj.image1:setTop(80);
    obj.image1:setWidth(300);
    obj.image1:setHeight(300);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox1);
    obj.layout46:setLeft(580);
    obj.layout46:setTop(390);
    obj.layout46:setWidth(302);
    obj.layout46:setHeight(210);
    obj.layout46:setName("layout46");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout46);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(5);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout46);
    obj.label65:setLeft(0);
    obj.label65:setTop(0);
    obj.label65:setWidth(302);
    obj.label65:setHeight(20);
    obj.label65:setText("ESPIRAL VITAL");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setLeft(6);
    obj.layout47:setTop(25);
    obj.layout47:setWidth(290);
    obj.layout47:setHeight(50);
    obj.layout47:setName("layout47");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout47);
    obj.label66:setLeft(0);
    obj.label66:setTop(15);
    obj.label66:setWidth(70);
    obj.label66:setHeight(20);
    obj.label66:setText("Fisico");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout47);
    obj.checkBox1:setLeft(75);
    obj.checkBox1:setTop(15);
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout47);
    obj.checkBox2:setLeft(90);
    obj.checkBox2:setTop(15);
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout47);
    obj.checkBox3:setLeft(105);
    obj.checkBox3:setTop(5);
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout47);
    obj.checkBox4:setLeft(105);
    obj.checkBox4:setTop(25);
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout47);
    obj.checkBox5:setLeft(120);
    obj.checkBox5:setTop(5);
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout47);
    obj.checkBox6:setLeft(120);
    obj.checkBox6:setTop(25);
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout47);
    obj.checkBox7:setLeft(135);
    obj.checkBox7:setTop(5);
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout47);
    obj.checkBox8:setLeft(135);
    obj.checkBox8:setTop(25);
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout47);
    obj.checkBox9:setLeft(150);
    obj.checkBox9:setTop(5);
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout47);
    obj.checkBox10:setLeft(150);
    obj.checkBox10:setTop(25);
    obj.checkBox10:setName("checkBox10");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout47);
    obj.label67:setLeft(165);
    obj.label67:setTop(5);
    obj.label67:setWidth(15);
    obj.label67:setHeight(15);
    obj.label67:setText("1");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout47);
    obj.label68:setLeft(165);
    obj.label68:setTop(25);
    obj.label68:setWidth(15);
    obj.label68:setHeight(15);
    obj.label68:setText("2");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout47);
    obj.label69:setLeft(190);
    obj.label69:setTop(15);
    obj.label69:setWidth(100);
    obj.label69:setHeight(20);
    obj.label69:setText("-2FOR");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setLeft(6);
    obj.layout48:setTop(75);
    obj.layout48:setWidth(290);
    obj.layout48:setHeight(50);
    obj.layout48:setName("layout48");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout48);
    obj.label70:setLeft(0);
    obj.label70:setTop(15);
    obj.label70:setWidth(70);
    obj.label70:setHeight(20);
    obj.label70:setText("Agilidade");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout48);
    obj.checkBox11:setLeft(75);
    obj.checkBox11:setTop(15);
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout48);
    obj.checkBox12:setLeft(90);
    obj.checkBox12:setTop(15);
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout48);
    obj.checkBox13:setLeft(105);
    obj.checkBox13:setTop(5);
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout48);
    obj.checkBox14:setLeft(105);
    obj.checkBox14:setTop(25);
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout48);
    obj.checkBox15:setLeft(120);
    obj.checkBox15:setTop(5);
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout48);
    obj.checkBox16:setLeft(120);
    obj.checkBox16:setTop(25);
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout48);
    obj.checkBox17:setLeft(135);
    obj.checkBox17:setTop(5);
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout48);
    obj.checkBox18:setLeft(135);
    obj.checkBox18:setTop(25);
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout48);
    obj.checkBox19:setLeft(150);
    obj.checkBox19:setTop(5);
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout48);
    obj.checkBox20:setLeft(150);
    obj.checkBox20:setTop(25);
    obj.checkBox20:setName("checkBox20");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout48);
    obj.label71:setLeft(165);
    obj.label71:setTop(5);
    obj.label71:setWidth(15);
    obj.label71:setHeight(15);
    obj.label71:setText("3");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout48);
    obj.label72:setLeft(165);
    obj.label72:setTop(25);
    obj.label72:setWidth(15);
    obj.label72:setHeight(15);
    obj.label72:setText("4");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout48);
    obj.label73:setLeft(190);
    obj.label73:setTop(15);
    obj.label73:setWidth(100);
    obj.label73:setHeight(20);
    obj.label73:setText("-2 Ataques");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout46);
    obj.layout49:setLeft(6);
    obj.layout49:setTop(125);
    obj.layout49:setWidth(290);
    obj.layout49:setHeight(50);
    obj.layout49:setName("layout49");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout49);
    obj.label74:setLeft(0);
    obj.label74:setTop(15);
    obj.label74:setWidth(70);
    obj.label74:setHeight(20);
    obj.label74:setText("Intelecto");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout49);
    obj.checkBox21:setLeft(75);
    obj.checkBox21:setTop(15);
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout49);
    obj.checkBox22:setLeft(90);
    obj.checkBox22:setTop(15);
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout49);
    obj.checkBox23:setLeft(105);
    obj.checkBox23:setTop(5);
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout49);
    obj.checkBox24:setLeft(105);
    obj.checkBox24:setTop(25);
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout49);
    obj.checkBox25:setLeft(120);
    obj.checkBox25:setTop(5);
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout49);
    obj.checkBox26:setLeft(120);
    obj.checkBox26:setTop(25);
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout49);
    obj.checkBox27:setLeft(135);
    obj.checkBox27:setTop(5);
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout49);
    obj.checkBox28:setLeft(135);
    obj.checkBox28:setTop(25);
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout49);
    obj.checkBox29:setLeft(150);
    obj.checkBox29:setTop(5);
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout49);
    obj.checkBox30:setLeft(150);
    obj.checkBox30:setTop(25);
    obj.checkBox30:setName("checkBox30");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout49);
    obj.label75:setLeft(165);
    obj.label75:setTop(5);
    obj.label75:setWidth(15);
    obj.label75:setHeight(15);
    obj.label75:setText("5");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout49);
    obj.label76:setLeft(165);
    obj.label76:setTop(25);
    obj.label76:setWidth(15);
    obj.label76:setHeight(15);
    obj.label76:setText("6");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout49);
    obj.label77:setLeft(190);
    obj.label77:setTop(15);
    obj.label77:setWidth(100);
    obj.label77:setHeight(20);
    obj.label77:setText("-2 DEF, X magia");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout46);
    obj.layout50:setLeft(6);
    obj.layout50:setTop(160);
    obj.layout50:setWidth(290);
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout50);
    obj.label78:setLeft(0);
    obj.label78:setTop(15);
    obj.label78:setWidth(100);
    obj.label78:setHeight(20);
    obj.label78:setText("Campo de Força");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout50);
    obj.checkBox31:setLeft(105);
    obj.checkBox31:setTop(15);
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout50);
    obj.checkBox32:setLeft(120);
    obj.checkBox32:setTop(15);
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout50);
    obj.checkBox33:setLeft(135);
    obj.checkBox33:setTop(15);
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout50);
    obj.checkBox34:setLeft(150);
    obj.checkBox34:setTop(15);
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout50);
    obj.checkBox35:setLeft(165);
    obj.checkBox35:setTop(15);
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout50);
    obj.checkBox36:setLeft(180);
    obj.checkBox36:setTop(15);
    obj.checkBox36:setName("checkBox36");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setAlign("client");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Equipamentos");
    obj.tab2:setName("tab2");

    obj.frmRDF2 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF2:setParent(obj.tab2);
    obj.frmRDF2:setName("frmRDF2");
    obj.frmRDF2:setAlign("client");
    obj.frmRDF2:setTheme("dark");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmRDF2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox2);
    obj.layout51:setLeft(0);
    obj.layout51:setTop(0);
    obj.layout51:setWidth(430);
    obj.layout51:setHeight(210);
    obj.layout51:setName("layout51");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout51);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(5);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout51);
    obj.label79:setLeft(15);
    obj.label79:setTop(0);
    obj.label79:setWidth(400);
    obj.label79:setHeight(20);
    obj.label79:setText("ATAQUES CORPO A CORPO");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(25);
    obj.layout52:setWidth(400);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout52);
    obj.label80:setLeft(0);
    obj.label80:setTop(5);
    obj.label80:setWidth(150);
    obj.label80:setHeight(20);
    obj.label80:setText("NOME");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout52);
    obj.label81:setLeft(150);
    obj.label81:setTop(5);
    obj.label81:setWidth(150);
    obj.label81:setHeight(20);
    obj.label81:setText("NOTAS");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout52);
    obj.label82:setLeft(300);
    obj.label82:setTop(5);
    obj.label82:setWidth(50);
    obj.label82:setHeight(20);
    obj.label82:setText("ACO");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout52);
    obj.label83:setLeft(350);
    obj.label83:setTop(5);
    obj.label83:setWidth(50);
    obj.label83:setHeight(20);
    obj.label83:setText("P+F");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout51);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(50);
    obj.scrollBox3:setWidth(425);
    obj.scrollBox3:setHeight(150);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox3);
    obj.layout53:setLeft(5);
    obj.layout53:setTop(0);
    obj.layout53:setWidth(400);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout53);
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(150);
    obj.edit45:setHeight(25);
    obj.edit45:setField("atqC_1");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout53);
    obj.edit46:setLeft(150);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(150);
    obj.edit46:setHeight(25);
    obj.edit46:setField("atqC_notas_1");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout53);
    obj.edit47:setLeft(300);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("atqC_aco_1");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout53);
    obj.edit48:setLeft(350);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(25);
    obj.edit48:setField("atqC_pf_1");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox3);
    obj.layout54:setLeft(5);
    obj.layout54:setTop(25);
    obj.layout54:setWidth(400);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout54);
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(150);
    obj.edit49:setHeight(25);
    obj.edit49:setField("atqC_2");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout54);
    obj.edit50:setLeft(150);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(150);
    obj.edit50:setHeight(25);
    obj.edit50:setField("atqC_notas_2");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout54);
    obj.edit51:setLeft(300);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setField("atqC_aco_2");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout54);
    obj.edit52:setLeft(350);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(25);
    obj.edit52:setField("atqC_pf_2");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox3);
    obj.layout55:setLeft(5);
    obj.layout55:setTop(50);
    obj.layout55:setWidth(400);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout55);
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(150);
    obj.edit53:setHeight(25);
    obj.edit53:setField("atqC_3");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout55);
    obj.edit54:setLeft(150);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(150);
    obj.edit54:setHeight(25);
    obj.edit54:setField("atqC_notas_3");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout55);
    obj.edit55:setLeft(300);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(50);
    obj.edit55:setHeight(25);
    obj.edit55:setField("atqC_aco_3");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout55);
    obj.edit56:setLeft(350);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(25);
    obj.edit56:setField("atqC_pf_3");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox3);
    obj.layout56:setLeft(5);
    obj.layout56:setTop(75);
    obj.layout56:setWidth(400);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout56);
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(150);
    obj.edit57:setHeight(25);
    obj.edit57:setField("atqC_4");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout56);
    obj.edit58:setLeft(150);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(150);
    obj.edit58:setHeight(25);
    obj.edit58:setField("atqC_notas_4");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout56);
    obj.edit59:setLeft(300);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(25);
    obj.edit59:setField("atqC_aco_4");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout56);
    obj.edit60:setLeft(350);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(50);
    obj.edit60:setHeight(25);
    obj.edit60:setField("atqC_pf_4");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.scrollBox3);
    obj.layout57:setLeft(5);
    obj.layout57:setTop(100);
    obj.layout57:setWidth(400);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout57);
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(150);
    obj.edit61:setHeight(25);
    obj.edit61:setField("atqC_5");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout57);
    obj.edit62:setLeft(150);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(150);
    obj.edit62:setHeight(25);
    obj.edit62:setField("atqC_notas_5");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout57);
    obj.edit63:setLeft(300);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(25);
    obj.edit63:setField("atqC_aco_5");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout57);
    obj.edit64:setLeft(350);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(50);
    obj.edit64:setHeight(25);
    obj.edit64:setField("atqC_pf_5");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox3);
    obj.layout58:setLeft(5);
    obj.layout58:setTop(125);
    obj.layout58:setWidth(400);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout58);
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(150);
    obj.edit65:setHeight(25);
    obj.edit65:setField("atqC_6");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout58);
    obj.edit66:setLeft(150);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(150);
    obj.edit66:setHeight(25);
    obj.edit66:setField("atqC_notas_6");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout58);
    obj.edit67:setLeft(300);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(50);
    obj.edit67:setHeight(25);
    obj.edit67:setField("atqC_aco_6");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout58);
    obj.edit68:setLeft(350);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(50);
    obj.edit68:setHeight(25);
    obj.edit68:setField("atqC_pf_6");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox3);
    obj.layout59:setLeft(5);
    obj.layout59:setTop(150);
    obj.layout59:setWidth(400);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout59);
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(150);
    obj.edit69:setHeight(25);
    obj.edit69:setField("atqC_7");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout59);
    obj.edit70:setLeft(150);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(150);
    obj.edit70:setHeight(25);
    obj.edit70:setField("atqC_notas_7");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout59);
    obj.edit71:setLeft(300);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(50);
    obj.edit71:setHeight(25);
    obj.edit71:setField("atqC_aco_7");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout59);
    obj.edit72:setLeft(350);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(25);
    obj.edit72:setField("atqC_pf_7");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.scrollBox3);
    obj.layout60:setLeft(5);
    obj.layout60:setTop(175);
    obj.layout60:setWidth(400);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout60);
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(150);
    obj.edit73:setHeight(25);
    obj.edit73:setField("atqC_8");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout60);
    obj.edit74:setLeft(150);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(150);
    obj.edit74:setHeight(25);
    obj.edit74:setField("atqC_notas_8");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout60);
    obj.edit75:setLeft(300);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(25);
    obj.edit75:setField("atqC_aco_8");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout60);
    obj.edit76:setLeft(350);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(50);
    obj.edit76:setHeight(25);
    obj.edit76:setField("atqC_pf_8");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.scrollBox3);
    obj.layout61:setLeft(5);
    obj.layout61:setTop(200);
    obj.layout61:setWidth(400);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout61);
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(150);
    obj.edit77:setHeight(25);
    obj.edit77:setField("atqC_9");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout61);
    obj.edit78:setLeft(150);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(150);
    obj.edit78:setHeight(25);
    obj.edit78:setField("atqC_notas_9");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout61);
    obj.edit79:setLeft(300);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(50);
    obj.edit79:setHeight(25);
    obj.edit79:setField("atqC_aco_9");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout61);
    obj.edit80:setLeft(350);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(25);
    obj.edit80:setField("atqC_pf_9");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox3);
    obj.layout62:setLeft(5);
    obj.layout62:setTop(225);
    obj.layout62:setWidth(400);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout62);
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(150);
    obj.edit81:setHeight(25);
    obj.edit81:setField("atqC_10");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout62);
    obj.edit82:setLeft(150);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(150);
    obj.edit82:setHeight(25);
    obj.edit82:setField("atqC_notas_10");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout62);
    obj.edit83:setLeft(300);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(50);
    obj.edit83:setHeight(25);
    obj.edit83:setField("atqC_aco_10");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout62);
    obj.edit84:setLeft(350);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(50);
    obj.edit84:setHeight(25);
    obj.edit84:setField("atqC_pf_10");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox2);
    obj.layout63:setLeft(440);
    obj.layout63:setTop(0);
    obj.layout63:setWidth(530);
    obj.layout63:setHeight(210);
    obj.layout63:setName("layout63");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout63);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout63);
    obj.label84:setLeft(15);
    obj.label84:setTop(0);
    obj.label84:setWidth(500);
    obj.label84:setHeight(20);
    obj.label84:setText("ATAQUES A DISTANCIA");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout63);
    obj.layout64:setLeft(5);
    obj.layout64:setTop(25);
    obj.layout64:setWidth(500);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout64);
    obj.label85:setLeft(0);
    obj.label85:setTop(5);
    obj.label85:setWidth(150);
    obj.label85:setHeight(20);
    obj.label85:setText("NOME");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout64);
    obj.label86:setLeft(150);
    obj.label86:setTop(5);
    obj.label86:setWidth(150);
    obj.label86:setHeight(20);
    obj.label86:setText("NOTAS");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout64);
    obj.label87:setLeft(300);
    obj.label87:setTop(5);
    obj.label87:setWidth(50);
    obj.label87:setHeight(20);
    obj.label87:setText("ALC");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout64);
    obj.label88:setLeft(350);
    obj.label88:setTop(5);
    obj.label88:setWidth(50);
    obj.label88:setHeight(20);
    obj.label88:setText("ADI");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout64);
    obj.label89:setLeft(400);
    obj.label89:setTop(5);
    obj.label89:setWidth(50);
    obj.label89:setHeight(20);
    obj.label89:setText("POD");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout64);
    obj.label90:setLeft(450);
    obj.label90:setTop(5);
    obj.label90:setWidth(50);
    obj.label90:setHeight(20);
    obj.label90:setText("MUN");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.layout63);
    obj.scrollBox4:setLeft(0);
    obj.scrollBox4:setTop(50);
    obj.scrollBox4:setWidth(525);
    obj.scrollBox4:setHeight(150);
    obj.scrollBox4:setName("scrollBox4");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox4);
    obj.layout65:setLeft(5);
    obj.layout65:setTop(0);
    obj.layout65:setWidth(500);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout65);
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(150);
    obj.edit85:setHeight(25);
    obj.edit85:setField("atqD_1");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout65);
    obj.edit86:setLeft(150);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(150);
    obj.edit86:setHeight(25);
    obj.edit86:setField("atqD_notas_1");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout65);
    obj.edit87:setLeft(300);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("atqD_alc_1");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout65);
    obj.edit88:setLeft(350);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(50);
    obj.edit88:setHeight(25);
    obj.edit88:setField("atqD_adi_1");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout65);
    obj.edit89:setLeft(400);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(50);
    obj.edit89:setHeight(25);
    obj.edit89:setField("atqD_pod_1");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout65);
    obj.edit90:setLeft(450);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(50);
    obj.edit90:setHeight(25);
    obj.edit90:setField("atqD_mun_1");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.scrollBox4);
    obj.layout66:setLeft(5);
    obj.layout66:setTop(25);
    obj.layout66:setWidth(500);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout66);
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(150);
    obj.edit91:setHeight(25);
    obj.edit91:setField("atqD_2");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout66);
    obj.edit92:setLeft(150);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(150);
    obj.edit92:setHeight(25);
    obj.edit92:setField("atqD_notas_2");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout66);
    obj.edit93:setLeft(300);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(50);
    obj.edit93:setHeight(25);
    obj.edit93:setField("atqD_alc_2");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout66);
    obj.edit94:setLeft(350);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(50);
    obj.edit94:setHeight(25);
    obj.edit94:setField("atqD_adi_2");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout66);
    obj.edit95:setLeft(400);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(50);
    obj.edit95:setHeight(25);
    obj.edit95:setField("atqD_pod_2");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout66);
    obj.edit96:setLeft(450);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(50);
    obj.edit96:setHeight(25);
    obj.edit96:setField("atqD_mun_2");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox4);
    obj.layout67:setLeft(5);
    obj.layout67:setTop(50);
    obj.layout67:setWidth(500);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout67);
    obj.edit97:setLeft(0);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(150);
    obj.edit97:setHeight(25);
    obj.edit97:setField("atqD_3");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout67);
    obj.edit98:setLeft(150);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(150);
    obj.edit98:setHeight(25);
    obj.edit98:setField("atqD_notas_3");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout67);
    obj.edit99:setLeft(300);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(50);
    obj.edit99:setHeight(25);
    obj.edit99:setField("atqD_alc_3");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout67);
    obj.edit100:setLeft(350);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(50);
    obj.edit100:setHeight(25);
    obj.edit100:setField("atqD_adi_3");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout67);
    obj.edit101:setLeft(400);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(50);
    obj.edit101:setHeight(25);
    obj.edit101:setField("atqD_pod_3");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout67);
    obj.edit102:setLeft(450);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(50);
    obj.edit102:setHeight(25);
    obj.edit102:setField("atqD_mun_3");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.scrollBox4);
    obj.layout68:setLeft(5);
    obj.layout68:setTop(75);
    obj.layout68:setWidth(500);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout68);
    obj.edit103:setLeft(0);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(150);
    obj.edit103:setHeight(25);
    obj.edit103:setField("atqD_4");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout68);
    obj.edit104:setLeft(150);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(150);
    obj.edit104:setHeight(25);
    obj.edit104:setField("atqD_notas_4");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout68);
    obj.edit105:setLeft(300);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(50);
    obj.edit105:setHeight(25);
    obj.edit105:setField("atqD_alc_4");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout68);
    obj.edit106:setLeft(350);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(25);
    obj.edit106:setField("atqD_adi_4");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout68);
    obj.edit107:setLeft(400);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(25);
    obj.edit107:setField("atqD_pod_4");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout68);
    obj.edit108:setLeft(450);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(50);
    obj.edit108:setHeight(25);
    obj.edit108:setField("atqD_mun_4");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox4);
    obj.layout69:setLeft(5);
    obj.layout69:setTop(100);
    obj.layout69:setWidth(500);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout69);
    obj.edit109:setLeft(0);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(150);
    obj.edit109:setHeight(25);
    obj.edit109:setField("atqD_5");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout69);
    obj.edit110:setLeft(150);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(150);
    obj.edit110:setHeight(25);
    obj.edit110:setField("atqD_notas_5");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout69);
    obj.edit111:setLeft(300);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(50);
    obj.edit111:setHeight(25);
    obj.edit111:setField("atqD_alc_5");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setName("edit111");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout69);
    obj.edit112:setLeft(350);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(50);
    obj.edit112:setHeight(25);
    obj.edit112:setField("atqD_adi_5");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout69);
    obj.edit113:setLeft(400);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setField("atqD_pod_5");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout69);
    obj.edit114:setLeft(450);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(25);
    obj.edit114:setField("atqD_mun_5");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.scrollBox4);
    obj.layout70:setLeft(5);
    obj.layout70:setTop(125);
    obj.layout70:setWidth(500);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout70);
    obj.edit115:setLeft(0);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(150);
    obj.edit115:setHeight(25);
    obj.edit115:setField("atqD_6");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout70);
    obj.edit116:setLeft(150);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(150);
    obj.edit116:setHeight(25);
    obj.edit116:setField("atqD_notas_6");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout70);
    obj.edit117:setLeft(300);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(50);
    obj.edit117:setHeight(25);
    obj.edit117:setField("atqD_alc_6");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout70);
    obj.edit118:setLeft(350);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(50);
    obj.edit118:setHeight(25);
    obj.edit118:setField("atqD_adi_6");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout70);
    obj.edit119:setLeft(400);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(50);
    obj.edit119:setHeight(25);
    obj.edit119:setField("atqD_pod_6");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout70);
    obj.edit120:setLeft(450);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(50);
    obj.edit120:setHeight(25);
    obj.edit120:setField("atqD_mun_6");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setName("edit120");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox4);
    obj.layout71:setLeft(5);
    obj.layout71:setTop(150);
    obj.layout71:setWidth(500);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout71);
    obj.edit121:setLeft(0);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(150);
    obj.edit121:setHeight(25);
    obj.edit121:setField("atqD_7");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout71);
    obj.edit122:setLeft(150);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(150);
    obj.edit122:setHeight(25);
    obj.edit122:setField("atqD_notas_7");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout71);
    obj.edit123:setLeft(300);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(50);
    obj.edit123:setHeight(25);
    obj.edit123:setField("atqD_alc_7");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout71);
    obj.edit124:setLeft(350);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(50);
    obj.edit124:setHeight(25);
    obj.edit124:setField("atqD_adi_7");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout71);
    obj.edit125:setLeft(400);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(25);
    obj.edit125:setField("atqD_pod_7");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout71);
    obj.edit126:setLeft(450);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(50);
    obj.edit126:setHeight(25);
    obj.edit126:setField("atqD_mun_7");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.scrollBox4);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(175);
    obj.layout72:setWidth(500);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout72);
    obj.edit127:setLeft(0);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(150);
    obj.edit127:setHeight(25);
    obj.edit127:setField("atqD_8");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setName("edit127");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout72);
    obj.edit128:setLeft(150);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(150);
    obj.edit128:setHeight(25);
    obj.edit128:setField("atqD_notas_8");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout72);
    obj.edit129:setLeft(300);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(50);
    obj.edit129:setHeight(25);
    obj.edit129:setField("atqD_alc_8");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout72);
    obj.edit130:setLeft(350);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(50);
    obj.edit130:setHeight(25);
    obj.edit130:setField("atqD_adi_8");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setName("edit130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout72);
    obj.edit131:setLeft(400);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(50);
    obj.edit131:setHeight(25);
    obj.edit131:setField("atqD_pod_8");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setName("edit131");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout72);
    obj.edit132:setLeft(450);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(50);
    obj.edit132:setHeight(25);
    obj.edit132:setField("atqD_mun_8");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.scrollBox4);
    obj.layout73:setLeft(5);
    obj.layout73:setTop(200);
    obj.layout73:setWidth(500);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout73);
    obj.edit133:setLeft(0);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(150);
    obj.edit133:setHeight(25);
    obj.edit133:setField("atqD_9");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout73);
    obj.edit134:setLeft(150);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(150);
    obj.edit134:setHeight(25);
    obj.edit134:setField("atqD_notas_9");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout73);
    obj.edit135:setLeft(300);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(50);
    obj.edit135:setHeight(25);
    obj.edit135:setField("atqD_alc_9");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout73);
    obj.edit136:setLeft(350);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(50);
    obj.edit136:setHeight(25);
    obj.edit136:setField("atqD_adi_9");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout73);
    obj.edit137:setLeft(400);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(50);
    obj.edit137:setHeight(25);
    obj.edit137:setField("atqD_pod_9");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout73);
    obj.edit138:setLeft(450);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(50);
    obj.edit138:setHeight(25);
    obj.edit138:setField("atqD_mun_9");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.scrollBox4);
    obj.layout74:setLeft(5);
    obj.layout74:setTop(225);
    obj.layout74:setWidth(500);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout74);
    obj.edit139:setLeft(0);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(150);
    obj.edit139:setHeight(25);
    obj.edit139:setField("atqD_10");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout74);
    obj.edit140:setLeft(150);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(150);
    obj.edit140:setHeight(25);
    obj.edit140:setField("atqD_notas_10");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout74);
    obj.edit141:setLeft(300);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(50);
    obj.edit141:setHeight(25);
    obj.edit141:setField("atqD_alc_10");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout74);
    obj.edit142:setLeft(350);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(50);
    obj.edit142:setHeight(25);
    obj.edit142:setField("atqD_adi_10");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout74);
    obj.edit143:setLeft(400);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(50);
    obj.edit143:setHeight(25);
    obj.edit143:setField("atqD_pod_10");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout74);
    obj.edit144:setLeft(450);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(50);
    obj.edit144:setHeight(25);
    obj.edit144:setField("atqD_mun_10");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.scrollBox2);
    obj.layout75:setLeft(0);
    obj.layout75:setTop(220);
    obj.layout75:setWidth(430);
    obj.layout75:setHeight(390);
    obj.layout75:setName("layout75");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout75);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setXradius(5);
    obj.rectangle17:setYradius(5);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout75);
    obj.label91:setLeft(15);
    obj.label91:setTop(0);
    obj.label91:setWidth(400);
    obj.label91:setHeight(20);
    obj.label91:setText("EQUIPAMENTO");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout75);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(420);
    obj.textEditor2:setHeight(360);
    obj.textEditor2:setField("equipamento");
    obj.textEditor2:setName("textEditor2");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.scrollBox2);
    obj.layout76:setLeft(440);
    obj.layout76:setTop(220);
    obj.layout76:setWidth(460);
    obj.layout76:setHeight(110);
    obj.layout76:setName("layout76");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout76);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout76);
    obj.label92:setLeft(15);
    obj.label92:setTop(0);
    obj.label92:setWidth(400);
    obj.label92:setHeight(20);
    obj.label92:setText("ARMADURA");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout76);
    obj.layout77:setLeft(5);
    obj.layout77:setTop(25);
    obj.layout77:setWidth(450);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout77);
    obj.label93:setLeft(0);
    obj.label93:setTop(5);
    obj.label93:setWidth(150);
    obj.label93:setHeight(20);
    obj.label93:setText("NOME");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout77);
    obj.label94:setLeft(150);
    obj.label94:setTop(5);
    obj.label94:setWidth(150);
    obj.label94:setHeight(20);
    obj.label94:setText("DESCRIÇÃO");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout77);
    obj.label95:setLeft(300);
    obj.label95:setTop(5);
    obj.label95:setWidth(50);
    obj.label95:setHeight(20);
    obj.label95:setText("VEL");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout77);
    obj.label96:setLeft(350);
    obj.label96:setTop(5);
    obj.label96:setWidth(50);
    obj.label96:setHeight(20);
    obj.label96:setText("DEF");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout77);
    obj.label97:setLeft(400);
    obj.label97:setTop(5);
    obj.label97:setWidth(50);
    obj.label97:setHeight(20);
    obj.label97:setText("ARM");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout76);
    obj.layout78:setLeft(5);
    obj.layout78:setTop(50);
    obj.layout78:setWidth(500);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout78);
    obj.edit145:setLeft(0);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(150);
    obj.edit145:setHeight(25);
    obj.edit145:setField("arm_1");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setName("edit145");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout78);
    obj.edit146:setLeft(150);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(150);
    obj.edit146:setHeight(25);
    obj.edit146:setField("arm_notas_1");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout78);
    obj.edit147:setLeft(300);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(50);
    obj.edit147:setHeight(25);
    obj.edit147:setField("arm_alc_1");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setName("edit147");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout78);
    obj.edit148:setLeft(350);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(50);
    obj.edit148:setHeight(25);
    obj.edit148:setField("arm_adi_1");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout78);
    obj.edit149:setLeft(400);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(50);
    obj.edit149:setHeight(25);
    obj.edit149:setField("arm_pod_1");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout76);
    obj.layout79:setLeft(5);
    obj.layout79:setTop(75);
    obj.layout79:setWidth(500);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout79);
    obj.edit150:setLeft(0);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(150);
    obj.edit150:setHeight(25);
    obj.edit150:setField("arm_2");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout79);
    obj.edit151:setLeft(150);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(150);
    obj.edit151:setHeight(25);
    obj.edit151:setField("arm_notas_2");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setName("edit151");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout79);
    obj.edit152:setLeft(300);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(50);
    obj.edit152:setHeight(25);
    obj.edit152:setField("arm_alc_2");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout79);
    obj.edit153:setLeft(350);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(50);
    obj.edit153:setHeight(25);
    obj.edit153:setField("arm_adi_2");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout79);
    obj.edit154:setLeft(400);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(50);
    obj.edit154:setHeight(25);
    obj.edit154:setField("arm_pod_2");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setName("edit154");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox2);
    obj.layout80:setLeft(440);
    obj.layout80:setTop(340);
    obj.layout80:setWidth(250);
    obj.layout80:setHeight(250);
    obj.layout80:setName("layout80");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout80);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(5);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setName("rectangle19");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout80);
    obj.label98:setLeft(5);
    obj.label98:setTop(0);
    obj.label98:setWidth(240);
    obj.label98:setHeight(20);
    obj.label98:setText("DINHEIRO");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout80);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(240);
    obj.textEditor3:setHeight(220);
    obj.textEditor3:setField("dinheiro");
    obj.textEditor3:setName("textEditor3");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox2);
    obj.image3:setAlign("client");
    obj.image3:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image3:setStyle("autoFit");
    obj.image3:setName("image3");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.frmRDF3 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF3:setParent(obj.tab3);
    obj.frmRDF3:setName("frmRDF3");
    obj.frmRDF3:setAlign("client");
    obj.frmRDF3:setTheme("dark");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmRDF3);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.scrollBox5);
    obj.layout81:setLeft(0);
    obj.layout81:setTop(0);
    obj.layout81:setWidth(400);
    obj.layout81:setHeight(610);
    obj.layout81:setName("layout81");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout81);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout81);
    obj.label99:setLeft(5);
    obj.label99:setTop(0);
    obj.label99:setWidth(390);
    obj.label99:setHeight(20);
    obj.label99:setText("PERICIAS");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout81);
    obj.layout82:setLeft(5);
    obj.layout82:setTop(25);
    obj.layout82:setWidth(500);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout82);
    obj.label100:setLeft(0);
    obj.label100:setTop(5);
    obj.label100:setWidth(150);
    obj.label100:setHeight(20);
    obj.label100:setText("NOME");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout82);
    obj.label101:setLeft(150);
    obj.label101:setTop(5);
    obj.label101:setWidth(50);
    obj.label101:setHeight(20);
    obj.label101:setText("Chave");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout82);
    obj.label102:setLeft(210);
    obj.label102:setTop(5);
    obj.label102:setWidth(40);
    obj.label102:setHeight(20);
    obj.label102:setText("ATR");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout82);
    obj.label103:setLeft(250);
    obj.label103:setTop(5);
    obj.label103:setWidth(40);
    obj.label103:setHeight(20);
    obj.label103:setText("NIV");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout82);
    obj.label104:setLeft(290);
    obj.label104:setTop(5);
    obj.label104:setWidth(40);
    obj.label104:setHeight(20);
    obj.label104:setText("OUT");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout82);
    obj.label105:setLeft(340);
    obj.label105:setTop(5);
    obj.label105:setWidth(50);
    obj.label105:setHeight(20);
    obj.label105:setText("TOTAL");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout81);
    obj.layout83:setLeft(0);
    obj.layout83:setTop(50);
    obj.layout83:setWidth(500);
    obj.layout83:setHeight(555);
    obj.layout83:setName("layout83");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout83);
    obj.layout84:setLeft(5);
    obj.layout84:setTop(0);
    obj.layout84:setWidth(500);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout84);
    obj.edit155:setLeft(0);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(150);
    obj.edit155:setHeight(25);
    obj.edit155:setField("per_1");
    obj.edit155:setName("edit155");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout84);
    obj.edit156:setLeft(150);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(50);
    obj.edit156:setHeight(25);
    obj.edit156:setField("per_chave_1");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout84);
    obj.edit157:setLeft(210);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(40);
    obj.edit157:setHeight(25);
    obj.edit157:setField("per_atr_1");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout84);
    obj.edit158:setLeft(250);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(40);
    obj.edit158:setHeight(25);
    obj.edit158:setField("per_niv_1");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setName("edit158");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout84);
    obj.edit159:setLeft(290);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(40);
    obj.edit159:setHeight(25);
    obj.edit159:setField("per_out_1");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setName("edit159");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout84);
    obj.rectangle21:setLeft(340);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout84);
    obj.label106:setLeft(340);
    obj.label106:setTop(0);
    obj.label106:setWidth(50);
    obj.label106:setHeight(25);
    obj.label106:setField("per_total_1");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout84);
    obj.dataLink5:setFields({'per_atr_1', 'per_niv_1', 'per_out_1'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout84);
    obj.dataLink6:setField("per_1");
    obj.dataLink6:setDefaultValue("Arma de Mão");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout84);
    obj.dataLink7:setField("per_chave_1");
    obj.dataLink7:setDefaultValue("MAE");
    obj.dataLink7:setName("dataLink7");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout83);
    obj.layout85:setLeft(5);
    obj.layout85:setTop(25);
    obj.layout85:setWidth(500);
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout85);
    obj.edit160:setLeft(0);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(150);
    obj.edit160:setHeight(25);
    obj.edit160:setField("per_2");
    obj.edit160:setName("edit160");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout85);
    obj.edit161:setLeft(150);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(50);
    obj.edit161:setHeight(25);
    obj.edit161:setField("per_chave_2");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setName("edit161");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout85);
    obj.edit162:setLeft(210);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(40);
    obj.edit162:setHeight(25);
    obj.edit162:setField("per_atr_2");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setName("edit162");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout85);
    obj.edit163:setLeft(250);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(40);
    obj.edit163:setHeight(25);
    obj.edit163:setField("per_niv_2");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout85);
    obj.edit164:setLeft(290);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(40);
    obj.edit164:setHeight(25);
    obj.edit164:setField("per_out_2");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setName("edit164");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout85);
    obj.rectangle22:setLeft(340);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout85);
    obj.label107:setLeft(340);
    obj.label107:setTop(0);
    obj.label107:setWidth(50);
    obj.label107:setHeight(25);
    obj.label107:setField("per_total_2");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout85);
    obj.dataLink8:setFields({'per_atr_2', 'per_niv_2', 'per_out_2'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout85);
    obj.dataLink9:setField("per_2");
    obj.dataLink9:setDefaultValue("Arma Grande");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout85);
    obj.dataLink10:setField("per_chave_2");
    obj.dataLink10:setDefaultValue("MAE");
    obj.dataLink10:setName("dataLink10");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout83);
    obj.layout86:setLeft(5);
    obj.layout86:setTop(50);
    obj.layout86:setWidth(500);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout86);
    obj.edit165:setLeft(0);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(150);
    obj.edit165:setHeight(25);
    obj.edit165:setField("per_3");
    obj.edit165:setName("edit165");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout86);
    obj.edit166:setLeft(150);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(50);
    obj.edit166:setHeight(25);
    obj.edit166:setField("per_chave_3");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setName("edit166");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout86);
    obj.edit167:setLeft(210);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(40);
    obj.edit167:setHeight(25);
    obj.edit167:setField("per_atr_3");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setName("edit167");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout86);
    obj.edit168:setLeft(250);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(40);
    obj.edit168:setHeight(25);
    obj.edit168:setField("per_niv_3");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout86);
    obj.edit169:setLeft(290);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(40);
    obj.edit169:setHeight(25);
    obj.edit169:setField("per_out_3");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setName("edit169");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout86);
    obj.rectangle23:setLeft(340);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout86);
    obj.label108:setLeft(340);
    obj.label108:setTop(0);
    obj.label108:setWidth(50);
    obj.label108:setHeight(25);
    obj.label108:setField("per_total_3");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout86);
    obj.dataLink11:setFields({'per_atr_3', 'per_niv_3', 'per_out_3'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout86);
    obj.dataLink12:setField("per_3");
    obj.dataLink12:setDefaultValue("Pistola");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout86);
    obj.dataLink13:setField("per_chave_3");
    obj.dataLink13:setDefaultValue("DES");
    obj.dataLink13:setName("dataLink13");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout83);
    obj.layout87:setLeft(5);
    obj.layout87:setTop(75);
    obj.layout87:setWidth(500);
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout87);
    obj.edit170:setLeft(0);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(150);
    obj.edit170:setHeight(25);
    obj.edit170:setField("per_4");
    obj.edit170:setName("edit170");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout87);
    obj.edit171:setLeft(150);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(50);
    obj.edit171:setHeight(25);
    obj.edit171:setField("per_chave_4");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setName("edit171");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout87);
    obj.edit172:setLeft(210);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(40);
    obj.edit172:setHeight(25);
    obj.edit172:setField("per_atr_4");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setName("edit172");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout87);
    obj.edit173:setLeft(250);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(40);
    obj.edit173:setHeight(25);
    obj.edit173:setField("per_niv_4");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout87);
    obj.edit174:setLeft(290);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(40);
    obj.edit174:setHeight(25);
    obj.edit174:setField("per_out_4");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setName("edit174");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout87);
    obj.rectangle24:setLeft(340);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout87);
    obj.label109:setLeft(340);
    obj.label109:setTop(0);
    obj.label109:setWidth(50);
    obj.label109:setHeight(25);
    obj.label109:setField("per_total_4");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout87);
    obj.dataLink14:setFields({'per_atr_4', 'per_niv_4', 'per_out_4'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout87);
    obj.dataLink15:setField("per_4");
    obj.dataLink15:setDefaultValue("Fuzil");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout87);
    obj.dataLink16:setField("per_chave_4");
    obj.dataLink16:setDefaultValue("DES");
    obj.dataLink16:setName("dataLink16");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout83);
    obj.layout88:setLeft(5);
    obj.layout88:setTop(100);
    obj.layout88:setWidth(500);
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout88);
    obj.edit175:setLeft(0);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(150);
    obj.edit175:setHeight(25);
    obj.edit175:setField("per_5");
    obj.edit175:setName("edit175");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout88);
    obj.edit176:setLeft(150);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(50);
    obj.edit176:setHeight(25);
    obj.edit176:setField("per_chave_5");
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout88);
    obj.edit177:setLeft(210);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(40);
    obj.edit177:setHeight(25);
    obj.edit177:setField("per_atr_5");
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout88);
    obj.edit178:setLeft(250);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(40);
    obj.edit178:setHeight(25);
    obj.edit178:setField("per_niv_5");
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setName("edit178");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout88);
    obj.edit179:setLeft(290);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(40);
    obj.edit179:setHeight(25);
    obj.edit179:setField("per_out_5");
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setName("edit179");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout88);
    obj.rectangle25:setLeft(340);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout88);
    obj.label110:setLeft(340);
    obj.label110:setTop(0);
    obj.label110:setWidth(50);
    obj.label110:setHeight(25);
    obj.label110:setField("per_total_5");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout88);
    obj.dataLink17:setFields({'per_atr_5', 'per_niv_5', 'per_out_5'});
    obj.dataLink17:setName("dataLink17");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout83);
    obj.layout89:setLeft(5);
    obj.layout89:setTop(125);
    obj.layout89:setWidth(500);
    obj.layout89:setHeight(25);
    obj.layout89:setName("layout89");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout89);
    obj.edit180:setLeft(0);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(150);
    obj.edit180:setHeight(25);
    obj.edit180:setField("per_6");
    obj.edit180:setName("edit180");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout89);
    obj.edit181:setLeft(150);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(50);
    obj.edit181:setHeight(25);
    obj.edit181:setField("per_chave_6");
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setName("edit181");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout89);
    obj.edit182:setLeft(210);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(40);
    obj.edit182:setHeight(25);
    obj.edit182:setField("per_atr_6");
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setName("edit182");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout89);
    obj.edit183:setLeft(250);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(40);
    obj.edit183:setHeight(25);
    obj.edit183:setField("per_niv_6");
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setName("edit183");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout89);
    obj.edit184:setLeft(290);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(40);
    obj.edit184:setHeight(25);
    obj.edit184:setField("per_out_6");
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setName("edit184");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout89);
    obj.rectangle26:setLeft(340);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout89);
    obj.label111:setLeft(340);
    obj.label111:setTop(0);
    obj.label111:setWidth(50);
    obj.label111:setHeight(25);
    obj.label111:setField("per_total_6");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout89);
    obj.dataLink18:setFields({'per_atr_6', 'per_niv_6', 'per_out_6'});
    obj.dataLink18:setName("dataLink18");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout83);
    obj.layout90:setLeft(5);
    obj.layout90:setTop(150);
    obj.layout90:setWidth(500);
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout90);
    obj.edit185:setLeft(0);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(150);
    obj.edit185:setHeight(25);
    obj.edit185:setField("per_7");
    obj.edit185:setName("edit185");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout90);
    obj.edit186:setLeft(150);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(50);
    obj.edit186:setHeight(25);
    obj.edit186:setField("per_chave_7");
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setName("edit186");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout90);
    obj.edit187:setLeft(210);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(40);
    obj.edit187:setHeight(25);
    obj.edit187:setField("per_atr_7");
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setName("edit187");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout90);
    obj.edit188:setLeft(250);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(40);
    obj.edit188:setHeight(25);
    obj.edit188:setField("per_niv_7");
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setName("edit188");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout90);
    obj.edit189:setLeft(290);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(40);
    obj.edit189:setHeight(25);
    obj.edit189:setField("per_out_7");
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setName("edit189");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout90);
    obj.rectangle27:setLeft(340);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout90);
    obj.label112:setLeft(340);
    obj.label112:setTop(0);
    obj.label112:setWidth(50);
    obj.label112:setHeight(25);
    obj.label112:setField("per_total_7");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout90);
    obj.dataLink19:setFields({'per_atr_7', 'per_niv_7', 'per_out_7'});
    obj.dataLink19:setName("dataLink19");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout83);
    obj.layout91:setLeft(5);
    obj.layout91:setTop(175);
    obj.layout91:setWidth(500);
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout91);
    obj.edit190:setLeft(0);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(150);
    obj.edit190:setHeight(25);
    obj.edit190:setField("per_8");
    obj.edit190:setName("edit190");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout91);
    obj.edit191:setLeft(150);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(50);
    obj.edit191:setHeight(25);
    obj.edit191:setField("per_chave_8");
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setName("edit191");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout91);
    obj.edit192:setLeft(210);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(40);
    obj.edit192:setHeight(25);
    obj.edit192:setField("per_atr_8");
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setName("edit192");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout91);
    obj.edit193:setLeft(250);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(40);
    obj.edit193:setHeight(25);
    obj.edit193:setField("per_niv_8");
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setName("edit193");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout91);
    obj.edit194:setLeft(290);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(40);
    obj.edit194:setHeight(25);
    obj.edit194:setField("per_out_8");
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setName("edit194");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout91);
    obj.rectangle28:setLeft(340);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout91);
    obj.label113:setLeft(340);
    obj.label113:setTop(0);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setField("per_total_8");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout91);
    obj.dataLink20:setFields({'per_atr_8', 'per_niv_8', 'per_out_8'});
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout91);
    obj.dataLink21:setField("per_8");
    obj.dataLink21:setDefaultValue("Detecção");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout91);
    obj.dataLink22:setField("per_chave_8");
    obj.dataLink22:setDefaultValue("PER");
    obj.dataLink22:setName("dataLink22");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout83);
    obj.layout92:setLeft(5);
    obj.layout92:setTop(200);
    obj.layout92:setWidth(500);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout92);
    obj.edit195:setLeft(0);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(150);
    obj.edit195:setHeight(25);
    obj.edit195:setField("per_9");
    obj.edit195:setName("edit195");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout92);
    obj.edit196:setLeft(150);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(50);
    obj.edit196:setHeight(25);
    obj.edit196:setField("per_chave_9");
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setName("edit196");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout92);
    obj.edit197:setLeft(210);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(40);
    obj.edit197:setHeight(25);
    obj.edit197:setField("per_atr_9");
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout92);
    obj.edit198:setLeft(250);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(40);
    obj.edit198:setHeight(25);
    obj.edit198:setField("per_niv_9");
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setName("edit198");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout92);
    obj.edit199:setLeft(290);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(40);
    obj.edit199:setHeight(25);
    obj.edit199:setField("per_out_9");
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setName("edit199");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout92);
    obj.rectangle29:setLeft(340);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout92);
    obj.label114:setLeft(340);
    obj.label114:setTop(0);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setField("per_total_9");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout92);
    obj.dataLink23:setFields({'per_atr_9', 'per_niv_9', 'per_out_9'});
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout92);
    obj.dataLink24:setField("per_9");
    obj.dataLink24:setDefaultValue("Esgueirar-se");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout92);
    obj.dataLink25:setField("per_chave_9");
    obj.dataLink25:setDefaultValue("AGI");
    obj.dataLink25:setName("dataLink25");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout83);
    obj.layout93:setLeft(5);
    obj.layout93:setTop(225);
    obj.layout93:setWidth(500);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout93);
    obj.edit200:setLeft(0);
    obj.edit200:setTop(0);
    obj.edit200:setWidth(150);
    obj.edit200:setHeight(25);
    obj.edit200:setField("per_10");
    obj.edit200:setName("edit200");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout93);
    obj.edit201:setLeft(150);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(50);
    obj.edit201:setHeight(25);
    obj.edit201:setField("per_chave_10");
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setName("edit201");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout93);
    obj.edit202:setLeft(210);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(40);
    obj.edit202:setHeight(25);
    obj.edit202:setField("per_atr_10");
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setName("edit202");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout93);
    obj.edit203:setLeft(250);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(40);
    obj.edit203:setHeight(25);
    obj.edit203:setField("per_niv_10");
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setName("edit203");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout93);
    obj.edit204:setLeft(290);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(40);
    obj.edit204:setHeight(25);
    obj.edit204:setField("per_out_10");
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setName("edit204");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout93);
    obj.rectangle30:setLeft(340);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(50);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout93);
    obj.label115:setLeft(340);
    obj.label115:setTop(0);
    obj.label115:setWidth(50);
    obj.label115:setHeight(25);
    obj.label115:setField("per_total_10");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout93);
    obj.dataLink26:setFields({'per_atr_10', 'per_niv_10', 'per_out_10'});
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout93);
    obj.dataLink27:setField("per_10");
    obj.dataLink27:setDefaultValue("Comandar");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout93);
    obj.dataLink28:setField("per_chave_10");
    obj.dataLink28:setDefaultValue("SOCIAL");
    obj.dataLink28:setName("dataLink28");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout83);
    obj.layout94:setLeft(5);
    obj.layout94:setTop(250);
    obj.layout94:setWidth(500);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout94);
    obj.edit205:setLeft(0);
    obj.edit205:setTop(0);
    obj.edit205:setWidth(150);
    obj.edit205:setHeight(25);
    obj.edit205:setField("per_11");
    obj.edit205:setName("edit205");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout94);
    obj.edit206:setLeft(150);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(50);
    obj.edit206:setHeight(25);
    obj.edit206:setField("per_chave_11");
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setName("edit206");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout94);
    obj.edit207:setLeft(210);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(40);
    obj.edit207:setHeight(25);
    obj.edit207:setField("per_atr_11");
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setName("edit207");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout94);
    obj.edit208:setLeft(250);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(40);
    obj.edit208:setHeight(25);
    obj.edit208:setField("per_niv_11");
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setName("edit208");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout94);
    obj.edit209:setLeft(290);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(40);
    obj.edit209:setHeight(25);
    obj.edit209:setField("per_out_11");
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setName("edit209");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout94);
    obj.rectangle31:setLeft(340);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(50);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout94);
    obj.label116:setLeft(340);
    obj.label116:setTop(0);
    obj.label116:setWidth(50);
    obj.label116:setHeight(25);
    obj.label116:setField("per_total_11");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout94);
    obj.dataLink29:setFields({'per_atr_11', 'per_niv_11', 'per_out_11'});
    obj.dataLink29:setName("dataLink29");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout83);
    obj.layout95:setLeft(5);
    obj.layout95:setTop(275);
    obj.layout95:setWidth(500);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout95);
    obj.edit210:setLeft(0);
    obj.edit210:setTop(0);
    obj.edit210:setWidth(150);
    obj.edit210:setHeight(25);
    obj.edit210:setField("per_12");
    obj.edit210:setName("edit210");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout95);
    obj.edit211:setLeft(150);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(50);
    obj.edit211:setHeight(25);
    obj.edit211:setField("per_chave_12");
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setName("edit211");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout95);
    obj.edit212:setLeft(210);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(40);
    obj.edit212:setHeight(25);
    obj.edit212:setField("per_atr_12");
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setName("edit212");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout95);
    obj.edit213:setLeft(250);
    obj.edit213:setTop(0);
    obj.edit213:setWidth(40);
    obj.edit213:setHeight(25);
    obj.edit213:setField("per_niv_12");
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setName("edit213");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout95);
    obj.edit214:setLeft(290);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(40);
    obj.edit214:setHeight(25);
    obj.edit214:setField("per_out_12");
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setName("edit214");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout95);
    obj.rectangle32:setLeft(340);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(50);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout95);
    obj.label117:setLeft(340);
    obj.label117:setTop(0);
    obj.label117:setWidth(50);
    obj.label117:setHeight(25);
    obj.label117:setField("per_total_12");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout95);
    obj.dataLink30:setFields({'per_atr_12', 'per_niv_12', 'per_out_12'});
    obj.dataLink30:setName("dataLink30");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout83);
    obj.layout96:setLeft(5);
    obj.layout96:setTop(300);
    obj.layout96:setWidth(500);
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout96);
    obj.edit215:setLeft(0);
    obj.edit215:setTop(0);
    obj.edit215:setWidth(150);
    obj.edit215:setHeight(25);
    obj.edit215:setField("per_13");
    obj.edit215:setName("edit215");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout96);
    obj.edit216:setLeft(150);
    obj.edit216:setTop(0);
    obj.edit216:setWidth(50);
    obj.edit216:setHeight(25);
    obj.edit216:setField("per_chave_13");
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setName("edit216");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout96);
    obj.edit217:setLeft(210);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(40);
    obj.edit217:setHeight(25);
    obj.edit217:setField("per_atr_13");
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setName("edit217");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout96);
    obj.edit218:setLeft(250);
    obj.edit218:setTop(0);
    obj.edit218:setWidth(40);
    obj.edit218:setHeight(25);
    obj.edit218:setField("per_niv_13");
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setName("edit218");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout96);
    obj.edit219:setLeft(290);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(40);
    obj.edit219:setHeight(25);
    obj.edit219:setField("per_out_13");
    obj.edit219:setHorzTextAlign("center");
    obj.edit219:setName("edit219");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout96);
    obj.rectangle33:setLeft(340);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(50);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout96);
    obj.label118:setLeft(340);
    obj.label118:setTop(0);
    obj.label118:setWidth(50);
    obj.label118:setHeight(25);
    obj.label118:setField("per_total_13");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout96);
    obj.dataLink31:setFields({'per_atr_13', 'per_niv_13', 'per_out_13'});
    obj.dataLink31:setName("dataLink31");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout83);
    obj.layout97:setLeft(5);
    obj.layout97:setTop(325);
    obj.layout97:setWidth(500);
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout97);
    obj.edit220:setLeft(0);
    obj.edit220:setTop(0);
    obj.edit220:setWidth(150);
    obj.edit220:setHeight(25);
    obj.edit220:setField("per_14");
    obj.edit220:setName("edit220");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout97);
    obj.edit221:setLeft(150);
    obj.edit221:setTop(0);
    obj.edit221:setWidth(50);
    obj.edit221:setHeight(25);
    obj.edit221:setField("per_chave_14");
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setName("edit221");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout97);
    obj.edit222:setLeft(210);
    obj.edit222:setTop(0);
    obj.edit222:setWidth(40);
    obj.edit222:setHeight(25);
    obj.edit222:setField("per_atr_14");
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setName("edit222");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout97);
    obj.edit223:setLeft(250);
    obj.edit223:setTop(0);
    obj.edit223:setWidth(40);
    obj.edit223:setHeight(25);
    obj.edit223:setField("per_niv_14");
    obj.edit223:setHorzTextAlign("center");
    obj.edit223:setName("edit223");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout97);
    obj.edit224:setLeft(290);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(40);
    obj.edit224:setHeight(25);
    obj.edit224:setField("per_out_14");
    obj.edit224:setHorzTextAlign("center");
    obj.edit224:setName("edit224");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout97);
    obj.rectangle34:setLeft(340);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(50);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout97);
    obj.label119:setLeft(340);
    obj.label119:setTop(0);
    obj.label119:setWidth(50);
    obj.label119:setHeight(25);
    obj.label119:setField("per_total_14");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout97);
    obj.dataLink32:setFields({'per_atr_14', 'per_niv_14', 'per_out_14'});
    obj.dataLink32:setName("dataLink32");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout83);
    obj.layout98:setLeft(5);
    obj.layout98:setTop(350);
    obj.layout98:setWidth(500);
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout98);
    obj.edit225:setLeft(0);
    obj.edit225:setTop(0);
    obj.edit225:setWidth(150);
    obj.edit225:setHeight(25);
    obj.edit225:setField("per_15");
    obj.edit225:setName("edit225");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout98);
    obj.edit226:setLeft(150);
    obj.edit226:setTop(0);
    obj.edit226:setWidth(50);
    obj.edit226:setHeight(25);
    obj.edit226:setField("per_chave_15");
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setName("edit226");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout98);
    obj.edit227:setLeft(210);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(40);
    obj.edit227:setHeight(25);
    obj.edit227:setField("per_atr_15");
    obj.edit227:setHorzTextAlign("center");
    obj.edit227:setName("edit227");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout98);
    obj.edit228:setLeft(250);
    obj.edit228:setTop(0);
    obj.edit228:setWidth(40);
    obj.edit228:setHeight(25);
    obj.edit228:setField("per_niv_15");
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setName("edit228");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout98);
    obj.edit229:setLeft(290);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(40);
    obj.edit229:setHeight(25);
    obj.edit229:setField("per_out_15");
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setName("edit229");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout98);
    obj.rectangle35:setLeft(340);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(50);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout98);
    obj.label120:setLeft(340);
    obj.label120:setTop(0);
    obj.label120:setWidth(50);
    obj.label120:setHeight(25);
    obj.label120:setField("per_total_15");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout98);
    obj.dataLink33:setFields({'per_atr_15', 'per_niv_15', 'per_out_15'});
    obj.dataLink33:setName("dataLink33");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout83);
    obj.layout99:setLeft(5);
    obj.layout99:setTop(375);
    obj.layout99:setWidth(500);
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout99);
    obj.edit230:setLeft(0);
    obj.edit230:setTop(0);
    obj.edit230:setWidth(150);
    obj.edit230:setHeight(25);
    obj.edit230:setField("per_16");
    obj.edit230:setName("edit230");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout99);
    obj.edit231:setLeft(150);
    obj.edit231:setTop(0);
    obj.edit231:setWidth(50);
    obj.edit231:setHeight(25);
    obj.edit231:setField("per_chave_16");
    obj.edit231:setHorzTextAlign("center");
    obj.edit231:setName("edit231");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout99);
    obj.edit232:setLeft(210);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(40);
    obj.edit232:setHeight(25);
    obj.edit232:setField("per_atr_16");
    obj.edit232:setHorzTextAlign("center");
    obj.edit232:setName("edit232");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout99);
    obj.edit233:setLeft(250);
    obj.edit233:setTop(0);
    obj.edit233:setWidth(40);
    obj.edit233:setHeight(25);
    obj.edit233:setField("per_niv_16");
    obj.edit233:setHorzTextAlign("center");
    obj.edit233:setName("edit233");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout99);
    obj.edit234:setLeft(290);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(40);
    obj.edit234:setHeight(25);
    obj.edit234:setField("per_out_16");
    obj.edit234:setHorzTextAlign("center");
    obj.edit234:setName("edit234");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout99);
    obj.rectangle36:setLeft(340);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(50);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout99);
    obj.label121:setLeft(340);
    obj.label121:setTop(0);
    obj.label121:setWidth(50);
    obj.label121:setHeight(25);
    obj.label121:setField("per_total_16");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout99);
    obj.dataLink34:setFields({'per_atr_16', 'per_niv_16', 'per_out_16'});
    obj.dataLink34:setName("dataLink34");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout83);
    obj.layout100:setLeft(5);
    obj.layout100:setTop(400);
    obj.layout100:setWidth(500);
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout100);
    obj.edit235:setLeft(0);
    obj.edit235:setTop(0);
    obj.edit235:setWidth(150);
    obj.edit235:setHeight(25);
    obj.edit235:setField("per_17");
    obj.edit235:setName("edit235");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout100);
    obj.edit236:setLeft(150);
    obj.edit236:setTop(0);
    obj.edit236:setWidth(50);
    obj.edit236:setHeight(25);
    obj.edit236:setField("per_chave_17");
    obj.edit236:setHorzTextAlign("center");
    obj.edit236:setName("edit236");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout100);
    obj.edit237:setLeft(210);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(40);
    obj.edit237:setHeight(25);
    obj.edit237:setField("per_atr_17");
    obj.edit237:setHorzTextAlign("center");
    obj.edit237:setName("edit237");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout100);
    obj.edit238:setLeft(250);
    obj.edit238:setTop(0);
    obj.edit238:setWidth(40);
    obj.edit238:setHeight(25);
    obj.edit238:setField("per_niv_17");
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout100);
    obj.edit239:setLeft(290);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(40);
    obj.edit239:setHeight(25);
    obj.edit239:setField("per_out_17");
    obj.edit239:setHorzTextAlign("center");
    obj.edit239:setName("edit239");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout100);
    obj.rectangle37:setLeft(340);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(50);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout100);
    obj.label122:setLeft(340);
    obj.label122:setTop(0);
    obj.label122:setWidth(50);
    obj.label122:setHeight(25);
    obj.label122:setField("per_total_17");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout100);
    obj.dataLink35:setFields({'per_atr_17', 'per_niv_17', 'per_out_17'});
    obj.dataLink35:setName("dataLink35");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout83);
    obj.layout101:setLeft(5);
    obj.layout101:setTop(425);
    obj.layout101:setWidth(500);
    obj.layout101:setHeight(25);
    obj.layout101:setName("layout101");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout101);
    obj.edit240:setLeft(0);
    obj.edit240:setTop(0);
    obj.edit240:setWidth(150);
    obj.edit240:setHeight(25);
    obj.edit240:setField("per_18");
    obj.edit240:setName("edit240");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout101);
    obj.edit241:setLeft(150);
    obj.edit241:setTop(0);
    obj.edit241:setWidth(50);
    obj.edit241:setHeight(25);
    obj.edit241:setField("per_chave_18");
    obj.edit241:setHorzTextAlign("center");
    obj.edit241:setName("edit241");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout101);
    obj.edit242:setLeft(210);
    obj.edit242:setTop(0);
    obj.edit242:setWidth(40);
    obj.edit242:setHeight(25);
    obj.edit242:setField("per_atr_18");
    obj.edit242:setHorzTextAlign("center");
    obj.edit242:setName("edit242");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout101);
    obj.edit243:setLeft(250);
    obj.edit243:setTop(0);
    obj.edit243:setWidth(40);
    obj.edit243:setHeight(25);
    obj.edit243:setField("per_niv_18");
    obj.edit243:setHorzTextAlign("center");
    obj.edit243:setName("edit243");

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout101);
    obj.edit244:setLeft(290);
    obj.edit244:setTop(0);
    obj.edit244:setWidth(40);
    obj.edit244:setHeight(25);
    obj.edit244:setField("per_out_18");
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setName("edit244");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout101);
    obj.rectangle38:setLeft(340);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(50);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout101);
    obj.label123:setLeft(340);
    obj.label123:setTop(0);
    obj.label123:setWidth(50);
    obj.label123:setHeight(25);
    obj.label123:setField("per_total_18");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout101);
    obj.dataLink36:setFields({'per_atr_18', 'per_niv_18', 'per_out_18'});
    obj.dataLink36:setName("dataLink36");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout83);
    obj.layout102:setLeft(5);
    obj.layout102:setTop(450);
    obj.layout102:setWidth(500);
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout102);
    obj.edit245:setLeft(0);
    obj.edit245:setTop(0);
    obj.edit245:setWidth(150);
    obj.edit245:setHeight(25);
    obj.edit245:setField("per_19");
    obj.edit245:setName("edit245");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout102);
    obj.edit246:setLeft(150);
    obj.edit246:setTop(0);
    obj.edit246:setWidth(50);
    obj.edit246:setHeight(25);
    obj.edit246:setField("per_chave_19");
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setName("edit246");

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout102);
    obj.edit247:setLeft(210);
    obj.edit247:setTop(0);
    obj.edit247:setWidth(40);
    obj.edit247:setHeight(25);
    obj.edit247:setField("per_atr_19");
    obj.edit247:setHorzTextAlign("center");
    obj.edit247:setName("edit247");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout102);
    obj.edit248:setLeft(250);
    obj.edit248:setTop(0);
    obj.edit248:setWidth(40);
    obj.edit248:setHeight(25);
    obj.edit248:setField("per_niv_19");
    obj.edit248:setHorzTextAlign("center");
    obj.edit248:setName("edit248");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout102);
    obj.edit249:setLeft(290);
    obj.edit249:setTop(0);
    obj.edit249:setWidth(40);
    obj.edit249:setHeight(25);
    obj.edit249:setField("per_out_19");
    obj.edit249:setHorzTextAlign("center");
    obj.edit249:setName("edit249");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout102);
    obj.rectangle39:setLeft(340);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(50);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout102);
    obj.label124:setLeft(340);
    obj.label124:setTop(0);
    obj.label124:setWidth(50);
    obj.label124:setHeight(25);
    obj.label124:setField("per_total_19");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout102);
    obj.dataLink37:setFields({'per_atr_19', 'per_niv_19', 'per_out_19'});
    obj.dataLink37:setName("dataLink37");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout83);
    obj.layout103:setLeft(5);
    obj.layout103:setTop(475);
    obj.layout103:setWidth(500);
    obj.layout103:setHeight(25);
    obj.layout103:setName("layout103");

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout103);
    obj.edit250:setLeft(0);
    obj.edit250:setTop(0);
    obj.edit250:setWidth(150);
    obj.edit250:setHeight(25);
    obj.edit250:setField("per_20");
    obj.edit250:setName("edit250");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout103);
    obj.edit251:setLeft(150);
    obj.edit251:setTop(0);
    obj.edit251:setWidth(50);
    obj.edit251:setHeight(25);
    obj.edit251:setField("per_chave_20");
    obj.edit251:setHorzTextAlign("center");
    obj.edit251:setName("edit251");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout103);
    obj.edit252:setLeft(210);
    obj.edit252:setTop(0);
    obj.edit252:setWidth(40);
    obj.edit252:setHeight(25);
    obj.edit252:setField("per_atr_20");
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setName("edit252");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout103);
    obj.edit253:setLeft(250);
    obj.edit253:setTop(0);
    obj.edit253:setWidth(40);
    obj.edit253:setHeight(25);
    obj.edit253:setField("per_niv_20");
    obj.edit253:setHorzTextAlign("center");
    obj.edit253:setName("edit253");

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout103);
    obj.edit254:setLeft(290);
    obj.edit254:setTop(0);
    obj.edit254:setWidth(40);
    obj.edit254:setHeight(25);
    obj.edit254:setField("per_out_20");
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setName("edit254");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout103);
    obj.rectangle40:setLeft(340);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(50);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout103);
    obj.label125:setLeft(340);
    obj.label125:setTop(0);
    obj.label125:setWidth(50);
    obj.label125:setHeight(25);
    obj.label125:setField("per_total_20");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout103);
    obj.dataLink38:setFields({'per_atr_20', 'per_niv_20', 'per_out_20'});
    obj.dataLink38:setName("dataLink38");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout83);
    obj.layout104:setLeft(5);
    obj.layout104:setTop(500);
    obj.layout104:setWidth(500);
    obj.layout104:setHeight(25);
    obj.layout104:setName("layout104");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout104);
    obj.edit255:setLeft(0);
    obj.edit255:setTop(0);
    obj.edit255:setWidth(150);
    obj.edit255:setHeight(25);
    obj.edit255:setField("per_21");
    obj.edit255:setName("edit255");

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout104);
    obj.edit256:setLeft(150);
    obj.edit256:setTop(0);
    obj.edit256:setWidth(50);
    obj.edit256:setHeight(25);
    obj.edit256:setField("per_chave_21");
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setName("edit256");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout104);
    obj.edit257:setLeft(210);
    obj.edit257:setTop(0);
    obj.edit257:setWidth(40);
    obj.edit257:setHeight(25);
    obj.edit257:setField("per_atr_21");
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setName("edit257");

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout104);
    obj.edit258:setLeft(250);
    obj.edit258:setTop(0);
    obj.edit258:setWidth(40);
    obj.edit258:setHeight(25);
    obj.edit258:setField("per_niv_21");
    obj.edit258:setHorzTextAlign("center");
    obj.edit258:setName("edit258");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout104);
    obj.edit259:setLeft(290);
    obj.edit259:setTop(0);
    obj.edit259:setWidth(40);
    obj.edit259:setHeight(25);
    obj.edit259:setField("per_out_21");
    obj.edit259:setHorzTextAlign("center");
    obj.edit259:setName("edit259");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout104);
    obj.rectangle41:setLeft(340);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(50);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout104);
    obj.label126:setLeft(340);
    obj.label126:setTop(0);
    obj.label126:setWidth(50);
    obj.label126:setHeight(25);
    obj.label126:setField("per_total_21");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout104);
    obj.dataLink39:setFields({'per_atr_21', 'per_niv_21', 'per_out_21'});
    obj.dataLink39:setName("dataLink39");

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout83);
    obj.layout105:setLeft(5);
    obj.layout105:setTop(525);
    obj.layout105:setWidth(500);
    obj.layout105:setHeight(25);
    obj.layout105:setName("layout105");

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout105);
    obj.edit260:setLeft(0);
    obj.edit260:setTop(0);
    obj.edit260:setWidth(150);
    obj.edit260:setHeight(25);
    obj.edit260:setField("per_22");
    obj.edit260:setName("edit260");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout105);
    obj.edit261:setLeft(150);
    obj.edit261:setTop(0);
    obj.edit261:setWidth(50);
    obj.edit261:setHeight(25);
    obj.edit261:setField("per_chave_22");
    obj.edit261:setHorzTextAlign("center");
    obj.edit261:setName("edit261");

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout105);
    obj.edit262:setLeft(210);
    obj.edit262:setTop(0);
    obj.edit262:setWidth(40);
    obj.edit262:setHeight(25);
    obj.edit262:setField("per_atr_22");
    obj.edit262:setHorzTextAlign("center");
    obj.edit262:setName("edit262");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout105);
    obj.edit263:setLeft(250);
    obj.edit263:setTop(0);
    obj.edit263:setWidth(40);
    obj.edit263:setHeight(25);
    obj.edit263:setField("per_niv_22");
    obj.edit263:setHorzTextAlign("center");
    obj.edit263:setName("edit263");

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout105);
    obj.edit264:setLeft(290);
    obj.edit264:setTop(0);
    obj.edit264:setWidth(40);
    obj.edit264:setHeight(25);
    obj.edit264:setField("per_out_22");
    obj.edit264:setHorzTextAlign("center");
    obj.edit264:setName("edit264");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout105);
    obj.rectangle42:setLeft(340);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(50);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout105);
    obj.label127:setLeft(340);
    obj.label127:setTop(0);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setField("per_total_22");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout105);
    obj.dataLink40:setFields({'per_atr_22', 'per_niv_22', 'per_out_22'});
    obj.dataLink40:setName("dataLink40");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.scrollBox5);
    obj.layout106:setLeft(410);
    obj.layout106:setTop(0);
    obj.layout106:setWidth(450);
    obj.layout106:setHeight(610);
    obj.layout106:setName("layout106");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout106);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(5);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout106);
    obj.label128:setLeft(5);
    obj.label128:setTop(0);
    obj.label128:setWidth(440);
    obj.label128:setHeight(20);
    obj.label128:setText("BENEFICIOS E HABILIDADES");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout106);
    obj.layout107:setLeft(5);
    obj.layout107:setTop(25);
    obj.layout107:setWidth(500);
    obj.layout107:setHeight(25);
    obj.layout107:setName("layout107");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout107);
    obj.label129:setLeft(0);
    obj.label129:setTop(5);
    obj.label129:setWidth(150);
    obj.label129:setHeight(20);
    obj.label129:setText("NOME");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout107);
    obj.label130:setLeft(150);
    obj.label130:setTop(5);
    obj.label130:setWidth(250);
    obj.label130:setHeight(20);
    obj.label130:setText("DESCRIÇÃO");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout107);
    obj.label131:setLeft(400);
    obj.label131:setTop(5);
    obj.label131:setWidth(40);
    obj.label131:setHeight(20);
    obj.label131:setText("PAG");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout106);
    obj.layout108:setLeft(0);
    obj.layout108:setTop(50);
    obj.layout108:setWidth(500);
    obj.layout108:setHeight(555);
    obj.layout108:setName("layout108");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setLeft(5);
    obj.layout109:setTop(0);
    obj.layout109:setWidth(500);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout109);
    obj.edit265:setLeft(0);
    obj.edit265:setTop(0);
    obj.edit265:setWidth(150);
    obj.edit265:setHeight(25);
    obj.edit265:setField("ben_1");
    obj.edit265:setName("edit265");

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout109);
    obj.edit266:setLeft(150);
    obj.edit266:setTop(0);
    obj.edit266:setWidth(250);
    obj.edit266:setHeight(25);
    obj.edit266:setField("ben_desc_1");
    obj.edit266:setName("edit266");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout109);
    obj.edit267:setLeft(400);
    obj.edit267:setTop(0);
    obj.edit267:setWidth(40);
    obj.edit267:setHeight(25);
    obj.edit267:setField("ben_pag_1");
    obj.edit267:setHorzTextAlign("center");
    obj.edit267:setName("edit267");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout108);
    obj.layout110:setLeft(5);
    obj.layout110:setTop(25);
    obj.layout110:setWidth(500);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout110);
    obj.edit268:setLeft(0);
    obj.edit268:setTop(0);
    obj.edit268:setWidth(150);
    obj.edit268:setHeight(25);
    obj.edit268:setField("ben_2");
    obj.edit268:setName("edit268");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout110);
    obj.edit269:setLeft(150);
    obj.edit269:setTop(0);
    obj.edit269:setWidth(250);
    obj.edit269:setHeight(25);
    obj.edit269:setField("ben_desc_2");
    obj.edit269:setName("edit269");

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout110);
    obj.edit270:setLeft(400);
    obj.edit270:setTop(0);
    obj.edit270:setWidth(40);
    obj.edit270:setHeight(25);
    obj.edit270:setField("ben_pag_2");
    obj.edit270:setHorzTextAlign("center");
    obj.edit270:setName("edit270");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout108);
    obj.layout111:setLeft(5);
    obj.layout111:setTop(50);
    obj.layout111:setWidth(500);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout111);
    obj.edit271:setLeft(0);
    obj.edit271:setTop(0);
    obj.edit271:setWidth(150);
    obj.edit271:setHeight(25);
    obj.edit271:setField("ben_3");
    obj.edit271:setName("edit271");

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout111);
    obj.edit272:setLeft(150);
    obj.edit272:setTop(0);
    obj.edit272:setWidth(250);
    obj.edit272:setHeight(25);
    obj.edit272:setField("ben_desc_3");
    obj.edit272:setName("edit272");

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout111);
    obj.edit273:setLeft(400);
    obj.edit273:setTop(0);
    obj.edit273:setWidth(40);
    obj.edit273:setHeight(25);
    obj.edit273:setField("ben_pag_3");
    obj.edit273:setHorzTextAlign("center");
    obj.edit273:setName("edit273");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout108);
    obj.layout112:setLeft(5);
    obj.layout112:setTop(75);
    obj.layout112:setWidth(500);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout112);
    obj.edit274:setLeft(0);
    obj.edit274:setTop(0);
    obj.edit274:setWidth(150);
    obj.edit274:setHeight(25);
    obj.edit274:setField("ben_4");
    obj.edit274:setName("edit274");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout112);
    obj.edit275:setLeft(150);
    obj.edit275:setTop(0);
    obj.edit275:setWidth(250);
    obj.edit275:setHeight(25);
    obj.edit275:setField("ben_desc_4");
    obj.edit275:setName("edit275");

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout112);
    obj.edit276:setLeft(400);
    obj.edit276:setTop(0);
    obj.edit276:setWidth(40);
    obj.edit276:setHeight(25);
    obj.edit276:setField("ben_pag_4");
    obj.edit276:setHorzTextAlign("center");
    obj.edit276:setName("edit276");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout108);
    obj.layout113:setLeft(5);
    obj.layout113:setTop(100);
    obj.layout113:setWidth(500);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout113);
    obj.edit277:setLeft(0);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(150);
    obj.edit277:setHeight(25);
    obj.edit277:setField("ben_5");
    obj.edit277:setName("edit277");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout113);
    obj.edit278:setLeft(150);
    obj.edit278:setTop(0);
    obj.edit278:setWidth(250);
    obj.edit278:setHeight(25);
    obj.edit278:setField("ben_desc_5");
    obj.edit278:setName("edit278");

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout113);
    obj.edit279:setLeft(400);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(40);
    obj.edit279:setHeight(25);
    obj.edit279:setField("ben_pag_5");
    obj.edit279:setHorzTextAlign("center");
    obj.edit279:setName("edit279");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout108);
    obj.layout114:setLeft(5);
    obj.layout114:setTop(125);
    obj.layout114:setWidth(500);
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout114);
    obj.edit280:setLeft(0);
    obj.edit280:setTop(0);
    obj.edit280:setWidth(150);
    obj.edit280:setHeight(25);
    obj.edit280:setField("ben_6");
    obj.edit280:setName("edit280");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout114);
    obj.edit281:setLeft(150);
    obj.edit281:setTop(0);
    obj.edit281:setWidth(250);
    obj.edit281:setHeight(25);
    obj.edit281:setField("ben_desc_6");
    obj.edit281:setName("edit281");

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout114);
    obj.edit282:setLeft(400);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(40);
    obj.edit282:setHeight(25);
    obj.edit282:setField("ben_pag_6");
    obj.edit282:setHorzTextAlign("center");
    obj.edit282:setName("edit282");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout108);
    obj.layout115:setLeft(5);
    obj.layout115:setTop(150);
    obj.layout115:setWidth(500);
    obj.layout115:setHeight(25);
    obj.layout115:setName("layout115");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout115);
    obj.edit283:setLeft(0);
    obj.edit283:setTop(0);
    obj.edit283:setWidth(150);
    obj.edit283:setHeight(25);
    obj.edit283:setField("ben_7");
    obj.edit283:setName("edit283");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout115);
    obj.edit284:setLeft(150);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(250);
    obj.edit284:setHeight(25);
    obj.edit284:setField("ben_desc_7");
    obj.edit284:setName("edit284");

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout115);
    obj.edit285:setLeft(400);
    obj.edit285:setTop(0);
    obj.edit285:setWidth(40);
    obj.edit285:setHeight(25);
    obj.edit285:setField("ben_pag_7");
    obj.edit285:setHorzTextAlign("center");
    obj.edit285:setName("edit285");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout108);
    obj.layout116:setLeft(5);
    obj.layout116:setTop(175);
    obj.layout116:setWidth(500);
    obj.layout116:setHeight(25);
    obj.layout116:setName("layout116");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout116);
    obj.edit286:setLeft(0);
    obj.edit286:setTop(0);
    obj.edit286:setWidth(150);
    obj.edit286:setHeight(25);
    obj.edit286:setField("ben_8");
    obj.edit286:setName("edit286");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout116);
    obj.edit287:setLeft(150);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(250);
    obj.edit287:setHeight(25);
    obj.edit287:setField("ben_desc_8");
    obj.edit287:setName("edit287");

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout116);
    obj.edit288:setLeft(400);
    obj.edit288:setTop(0);
    obj.edit288:setWidth(40);
    obj.edit288:setHeight(25);
    obj.edit288:setField("ben_pag_8");
    obj.edit288:setHorzTextAlign("center");
    obj.edit288:setName("edit288");

    obj.layout117 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout108);
    obj.layout117:setLeft(5);
    obj.layout117:setTop(200);
    obj.layout117:setWidth(500);
    obj.layout117:setHeight(25);
    obj.layout117:setName("layout117");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout117);
    obj.edit289:setLeft(0);
    obj.edit289:setTop(0);
    obj.edit289:setWidth(150);
    obj.edit289:setHeight(25);
    obj.edit289:setField("ben_9");
    obj.edit289:setName("edit289");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout117);
    obj.edit290:setLeft(150);
    obj.edit290:setTop(0);
    obj.edit290:setWidth(250);
    obj.edit290:setHeight(25);
    obj.edit290:setField("ben_desc_9");
    obj.edit290:setName("edit290");

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout117);
    obj.edit291:setLeft(400);
    obj.edit291:setTop(0);
    obj.edit291:setWidth(40);
    obj.edit291:setHeight(25);
    obj.edit291:setField("ben_pag_9");
    obj.edit291:setHorzTextAlign("center");
    obj.edit291:setName("edit291");

    obj.layout118 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout108);
    obj.layout118:setLeft(5);
    obj.layout118:setTop(225);
    obj.layout118:setWidth(500);
    obj.layout118:setHeight(25);
    obj.layout118:setName("layout118");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout118);
    obj.edit292:setLeft(0);
    obj.edit292:setTop(0);
    obj.edit292:setWidth(150);
    obj.edit292:setHeight(25);
    obj.edit292:setField("ben_10");
    obj.edit292:setName("edit292");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout118);
    obj.edit293:setLeft(150);
    obj.edit293:setTop(0);
    obj.edit293:setWidth(250);
    obj.edit293:setHeight(25);
    obj.edit293:setField("ben_desc_10");
    obj.edit293:setName("edit293");

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout118);
    obj.edit294:setLeft(400);
    obj.edit294:setTop(0);
    obj.edit294:setWidth(40);
    obj.edit294:setHeight(25);
    obj.edit294:setField("ben_pag_10");
    obj.edit294:setHorzTextAlign("center");
    obj.edit294:setName("edit294");

    obj.layout119 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout108);
    obj.layout119:setLeft(5);
    obj.layout119:setTop(250);
    obj.layout119:setWidth(500);
    obj.layout119:setHeight(25);
    obj.layout119:setName("layout119");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout119);
    obj.edit295:setLeft(0);
    obj.edit295:setTop(0);
    obj.edit295:setWidth(150);
    obj.edit295:setHeight(25);
    obj.edit295:setField("ben_11");
    obj.edit295:setName("edit295");

    obj.edit296 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout119);
    obj.edit296:setLeft(150);
    obj.edit296:setTop(0);
    obj.edit296:setWidth(250);
    obj.edit296:setHeight(25);
    obj.edit296:setField("ben_desc_11");
    obj.edit296:setName("edit296");

    obj.edit297 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout119);
    obj.edit297:setLeft(400);
    obj.edit297:setTop(0);
    obj.edit297:setWidth(40);
    obj.edit297:setHeight(25);
    obj.edit297:setField("ben_pag_11");
    obj.edit297:setHorzTextAlign("center");
    obj.edit297:setName("edit297");

    obj.layout120 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout108);
    obj.layout120:setLeft(5);
    obj.layout120:setTop(275);
    obj.layout120:setWidth(500);
    obj.layout120:setHeight(25);
    obj.layout120:setName("layout120");

    obj.edit298 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout120);
    obj.edit298:setLeft(0);
    obj.edit298:setTop(0);
    obj.edit298:setWidth(150);
    obj.edit298:setHeight(25);
    obj.edit298:setField("ben_12");
    obj.edit298:setName("edit298");

    obj.edit299 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout120);
    obj.edit299:setLeft(150);
    obj.edit299:setTop(0);
    obj.edit299:setWidth(250);
    obj.edit299:setHeight(25);
    obj.edit299:setField("ben_desc_12");
    obj.edit299:setName("edit299");

    obj.edit300 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout120);
    obj.edit300:setLeft(400);
    obj.edit300:setTop(0);
    obj.edit300:setWidth(40);
    obj.edit300:setHeight(25);
    obj.edit300:setField("ben_pag_12");
    obj.edit300:setHorzTextAlign("center");
    obj.edit300:setName("edit300");

    obj.layout121 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout108);
    obj.layout121:setLeft(5);
    obj.layout121:setTop(300);
    obj.layout121:setWidth(500);
    obj.layout121:setHeight(25);
    obj.layout121:setName("layout121");

    obj.edit301 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout121);
    obj.edit301:setLeft(0);
    obj.edit301:setTop(0);
    obj.edit301:setWidth(150);
    obj.edit301:setHeight(25);
    obj.edit301:setField("ben_13");
    obj.edit301:setName("edit301");

    obj.edit302 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout121);
    obj.edit302:setLeft(150);
    obj.edit302:setTop(0);
    obj.edit302:setWidth(250);
    obj.edit302:setHeight(25);
    obj.edit302:setField("ben_desc_13");
    obj.edit302:setName("edit302");

    obj.edit303 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout121);
    obj.edit303:setLeft(400);
    obj.edit303:setTop(0);
    obj.edit303:setWidth(40);
    obj.edit303:setHeight(25);
    obj.edit303:setField("ben_pag_13");
    obj.edit303:setHorzTextAlign("center");
    obj.edit303:setName("edit303");

    obj.layout122 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout108);
    obj.layout122:setLeft(5);
    obj.layout122:setTop(325);
    obj.layout122:setWidth(500);
    obj.layout122:setHeight(25);
    obj.layout122:setName("layout122");

    obj.edit304 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout122);
    obj.edit304:setLeft(0);
    obj.edit304:setTop(0);
    obj.edit304:setWidth(150);
    obj.edit304:setHeight(25);
    obj.edit304:setField("ben_14");
    obj.edit304:setName("edit304");

    obj.edit305 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout122);
    obj.edit305:setLeft(150);
    obj.edit305:setTop(0);
    obj.edit305:setWidth(250);
    obj.edit305:setHeight(25);
    obj.edit305:setField("ben_desc_14");
    obj.edit305:setName("edit305");

    obj.edit306 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout122);
    obj.edit306:setLeft(400);
    obj.edit306:setTop(0);
    obj.edit306:setWidth(40);
    obj.edit306:setHeight(25);
    obj.edit306:setField("ben_pag_14");
    obj.edit306:setHorzTextAlign("center");
    obj.edit306:setName("edit306");

    obj.layout123 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout108);
    obj.layout123:setLeft(5);
    obj.layout123:setTop(350);
    obj.layout123:setWidth(500);
    obj.layout123:setHeight(25);
    obj.layout123:setName("layout123");

    obj.edit307 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout123);
    obj.edit307:setLeft(0);
    obj.edit307:setTop(0);
    obj.edit307:setWidth(150);
    obj.edit307:setHeight(25);
    obj.edit307:setField("ben_15");
    obj.edit307:setName("edit307");

    obj.edit308 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout123);
    obj.edit308:setLeft(150);
    obj.edit308:setTop(0);
    obj.edit308:setWidth(250);
    obj.edit308:setHeight(25);
    obj.edit308:setField("ben_desc_15");
    obj.edit308:setName("edit308");

    obj.edit309 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout123);
    obj.edit309:setLeft(400);
    obj.edit309:setTop(0);
    obj.edit309:setWidth(40);
    obj.edit309:setHeight(25);
    obj.edit309:setField("ben_pag_15");
    obj.edit309:setHorzTextAlign("center");
    obj.edit309:setName("edit309");

    obj.layout124 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout108);
    obj.layout124:setLeft(5);
    obj.layout124:setTop(375);
    obj.layout124:setWidth(500);
    obj.layout124:setHeight(25);
    obj.layout124:setName("layout124");

    obj.edit310 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout124);
    obj.edit310:setLeft(0);
    obj.edit310:setTop(0);
    obj.edit310:setWidth(150);
    obj.edit310:setHeight(25);
    obj.edit310:setField("ben_16");
    obj.edit310:setName("edit310");

    obj.edit311 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout124);
    obj.edit311:setLeft(150);
    obj.edit311:setTop(0);
    obj.edit311:setWidth(250);
    obj.edit311:setHeight(25);
    obj.edit311:setField("ben_desc_16");
    obj.edit311:setName("edit311");

    obj.edit312 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout124);
    obj.edit312:setLeft(400);
    obj.edit312:setTop(0);
    obj.edit312:setWidth(40);
    obj.edit312:setHeight(25);
    obj.edit312:setField("ben_pag_16");
    obj.edit312:setHorzTextAlign("center");
    obj.edit312:setName("edit312");

    obj.layout125 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout108);
    obj.layout125:setLeft(5);
    obj.layout125:setTop(400);
    obj.layout125:setWidth(500);
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.edit313 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout125);
    obj.edit313:setLeft(0);
    obj.edit313:setTop(0);
    obj.edit313:setWidth(150);
    obj.edit313:setHeight(25);
    obj.edit313:setField("ben_17");
    obj.edit313:setName("edit313");

    obj.edit314 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout125);
    obj.edit314:setLeft(150);
    obj.edit314:setTop(0);
    obj.edit314:setWidth(250);
    obj.edit314:setHeight(25);
    obj.edit314:setField("ben_desc_17");
    obj.edit314:setName("edit314");

    obj.edit315 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout125);
    obj.edit315:setLeft(400);
    obj.edit315:setTop(0);
    obj.edit315:setWidth(40);
    obj.edit315:setHeight(25);
    obj.edit315:setField("ben_pag_17");
    obj.edit315:setHorzTextAlign("center");
    obj.edit315:setName("edit315");

    obj.layout126 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout108);
    obj.layout126:setLeft(5);
    obj.layout126:setTop(425);
    obj.layout126:setWidth(500);
    obj.layout126:setHeight(25);
    obj.layout126:setName("layout126");

    obj.edit316 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout126);
    obj.edit316:setLeft(0);
    obj.edit316:setTop(0);
    obj.edit316:setWidth(150);
    obj.edit316:setHeight(25);
    obj.edit316:setField("ben_18");
    obj.edit316:setName("edit316");

    obj.edit317 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout126);
    obj.edit317:setLeft(150);
    obj.edit317:setTop(0);
    obj.edit317:setWidth(250);
    obj.edit317:setHeight(25);
    obj.edit317:setField("ben_desc_18");
    obj.edit317:setName("edit317");

    obj.edit318 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout126);
    obj.edit318:setLeft(400);
    obj.edit318:setTop(0);
    obj.edit318:setWidth(40);
    obj.edit318:setHeight(25);
    obj.edit318:setField("ben_pag_18");
    obj.edit318:setHorzTextAlign("center");
    obj.edit318:setName("edit318");

    obj.layout127 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout108);
    obj.layout127:setLeft(5);
    obj.layout127:setTop(450);
    obj.layout127:setWidth(500);
    obj.layout127:setHeight(25);
    obj.layout127:setName("layout127");

    obj.edit319 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout127);
    obj.edit319:setLeft(0);
    obj.edit319:setTop(0);
    obj.edit319:setWidth(150);
    obj.edit319:setHeight(25);
    obj.edit319:setField("ben_19");
    obj.edit319:setName("edit319");

    obj.edit320 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout127);
    obj.edit320:setLeft(150);
    obj.edit320:setTop(0);
    obj.edit320:setWidth(250);
    obj.edit320:setHeight(25);
    obj.edit320:setField("ben_desc_19");
    obj.edit320:setName("edit320");

    obj.edit321 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout127);
    obj.edit321:setLeft(400);
    obj.edit321:setTop(0);
    obj.edit321:setWidth(40);
    obj.edit321:setHeight(25);
    obj.edit321:setField("ben_pag_19");
    obj.edit321:setHorzTextAlign("center");
    obj.edit321:setName("edit321");

    obj.layout128 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout108);
    obj.layout128:setLeft(5);
    obj.layout128:setTop(475);
    obj.layout128:setWidth(500);
    obj.layout128:setHeight(25);
    obj.layout128:setName("layout128");

    obj.edit322 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout128);
    obj.edit322:setLeft(0);
    obj.edit322:setTop(0);
    obj.edit322:setWidth(150);
    obj.edit322:setHeight(25);
    obj.edit322:setField("ben_20");
    obj.edit322:setName("edit322");

    obj.edit323 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout128);
    obj.edit323:setLeft(150);
    obj.edit323:setTop(0);
    obj.edit323:setWidth(250);
    obj.edit323:setHeight(25);
    obj.edit323:setField("ben_desc_20");
    obj.edit323:setName("edit323");

    obj.edit324 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout128);
    obj.edit324:setLeft(400);
    obj.edit324:setTop(0);
    obj.edit324:setWidth(40);
    obj.edit324:setHeight(25);
    obj.edit324:setField("ben_pag_20");
    obj.edit324:setHorzTextAlign("center");
    obj.edit324:setName("edit324");

    obj.layout129 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout108);
    obj.layout129:setLeft(5);
    obj.layout129:setTop(500);
    obj.layout129:setWidth(500);
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.edit325 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout129);
    obj.edit325:setLeft(0);
    obj.edit325:setTop(0);
    obj.edit325:setWidth(150);
    obj.edit325:setHeight(25);
    obj.edit325:setField("ben_21");
    obj.edit325:setName("edit325");

    obj.edit326 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout129);
    obj.edit326:setLeft(150);
    obj.edit326:setTop(0);
    obj.edit326:setWidth(250);
    obj.edit326:setHeight(25);
    obj.edit326:setField("ben_desc_21");
    obj.edit326:setName("edit326");

    obj.edit327 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout129);
    obj.edit327:setLeft(400);
    obj.edit327:setTop(0);
    obj.edit327:setWidth(40);
    obj.edit327:setHeight(25);
    obj.edit327:setField("ben_pag_21");
    obj.edit327:setHorzTextAlign("center");
    obj.edit327:setName("edit327");

    obj.layout130 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout108);
    obj.layout130:setLeft(5);
    obj.layout130:setTop(525);
    obj.layout130:setWidth(500);
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.edit328 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout130);
    obj.edit328:setLeft(0);
    obj.edit328:setTop(0);
    obj.edit328:setWidth(150);
    obj.edit328:setHeight(25);
    obj.edit328:setField("ben_22");
    obj.edit328:setName("edit328");

    obj.edit329 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout130);
    obj.edit329:setLeft(150);
    obj.edit329:setTop(0);
    obj.edit329:setWidth(250);
    obj.edit329:setHeight(25);
    obj.edit329:setField("ben_desc_22");
    obj.edit329:setName("edit329");

    obj.edit330 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout130);
    obj.edit330:setLeft(400);
    obj.edit330:setTop(0);
    obj.edit330:setWidth(40);
    obj.edit330:setHeight(25);
    obj.edit330:setField("ben_pag_22");
    obj.edit330:setHorzTextAlign("center");
    obj.edit330:setName("edit330");

    obj.layout131 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.scrollBox5);
    obj.layout131:setLeft(870);
    obj.layout131:setTop(0);
    obj.layout131:setWidth(250);
    obj.layout131:setHeight(200);
    obj.layout131:setName("layout131");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout131);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(5);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout131);
    obj.label132:setLeft(5);
    obj.label132:setTop(0);
    obj.label132:setWidth(240);
    obj.label132:setHeight(20);
    obj.label132:setText("CONEXÕES");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout131);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(240);
    obj.textEditor4:setHeight(170);
    obj.textEditor4:setField("conexoes");
    obj.textEditor4:setName("textEditor4");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox5);
    obj.image4:setAlign("client");
    obj.image4:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image4:setStyle("autoFit");
    obj.image4:setName("image4");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Poderes");
    obj.tab4:setName("tab4");

    obj.frmRDF4 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF4:setParent(obj.tab4);
    obj.frmRDF4:setName("frmRDF4");
    obj.frmRDF4:setAlign("client");
    obj.frmRDF4:setTheme("dark");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmRDF4);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout132 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.scrollBox6);
    obj.layout132:setLeft(0);
    obj.layout132:setTop(0);
    obj.layout132:setWidth(555);
    obj.layout132:setHeight(610);
    obj.layout132:setName("layout132");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout132);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(5);
    obj.rectangle45:setYradius(5);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout132);
    obj.label133:setLeft(5);
    obj.label133:setTop(0);
    obj.label133:setWidth(520);
    obj.label133:setHeight(20);
    obj.label133:setText("MAGIAS");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.layout133 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout132);
    obj.layout133:setLeft(5);
    obj.layout133:setTop(25);
    obj.layout133:setWidth(545);
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout133);
    obj.label134:setLeft(0);
    obj.label134:setTop(5);
    obj.label134:setWidth(100);
    obj.label134:setHeight(20);
    obj.label134:setText("Tradição Arcana");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.edit331 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout133);
    obj.edit331:setLeft(100);
    obj.edit331:setTop(0);
    obj.edit331:setWidth(400);
    obj.edit331:setHeight(25);
    obj.edit331:setField("tradicao_arcana");
    obj.edit331:setName("edit331");

    obj.layout134 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout132);
    obj.layout134:setLeft(5);
    obj.layout134:setTop(50);
    obj.layout134:setWidth(545);
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout134);
    obj.label135:setLeft(0);
    obj.label135:setTop(5);
    obj.label135:setWidth(200);
    obj.label135:setHeight(20);
    obj.label135:setText("NOME");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout134);
    obj.label136:setLeft(200);
    obj.label136:setTop(5);
    obj.label136:setWidth(50);
    obj.label136:setHeight(20);
    obj.label136:setText("CST");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout134);
    obj.label137:setLeft(250);
    obj.label137:setTop(5);
    obj.label137:setWidth(50);
    obj.label137:setHeight(20);
    obj.label137:setText("ALC");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout134);
    obj.label138:setLeft(300);
    obj.label138:setTop(5);
    obj.label138:setWidth(50);
    obj.label138:setHeight(20);
    obj.label138:setText("ADE");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout134);
    obj.label139:setLeft(350);
    obj.label139:setTop(5);
    obj.label139:setWidth(50);
    obj.label139:setHeight(20);
    obj.label139:setText("POD");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout134);
    obj.label140:setLeft(400);
    obj.label140:setTop(5);
    obj.label140:setWidth(50);
    obj.label140:setHeight(20);
    obj.label140:setText("MAN");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout134);
    obj.label141:setLeft(450);
    obj.label141:setTop(5);
    obj.label141:setWidth(50);
    obj.label141:setHeight(20);
    obj.label141:setText("OFE");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout134);
    obj.button1:setLeft(500);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.rclMagias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout132);
    obj.rclMagias:setLeft(5);
    obj.rclMagias:setTop(75);
    obj.rclMagias:setWidth(545);
    obj.rclMagias:setHeight(530);
    obj.rclMagias:setMinQt(1);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("frmRDF4_1");

    obj.layout135 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.scrollBox6);
    obj.layout135:setLeft(565);
    obj.layout135:setTop(0);
    obj.layout135:setWidth(565);
    obj.layout135:setHeight(610);
    obj.layout135:setName("layout135");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout135);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(5);
    obj.rectangle46:setYradius(5);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout135);
    obj.label142:setLeft(5);
    obj.label142:setTop(0);
    obj.label142:setWidth(555);
    obj.label142:setHeight(20);
    obj.label142:setText("MEKÂNICA");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.layout136 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout135);
    obj.layout136:setLeft(5);
    obj.layout136:setTop(25);
    obj.layout136:setWidth(275);
    obj.layout136:setHeight(145);
    obj.layout136:setName("layout136");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout136);
    obj.label143:setLeft(0);
    obj.label143:setTop(0);
    obj.label143:setWidth(275);
    obj.label143:setHeight(20);
    obj.label143:setText("Cárter");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout136);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(20);
    obj.textEditor5:setWidth(275);
    obj.textEditor5:setHeight(125);
    obj.textEditor5:setField("mek_carter");
    obj.textEditor5:setName("textEditor5");

    obj.layout137 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout135);
    obj.layout137:setLeft(285);
    obj.layout137:setTop(25);
    obj.layout137:setWidth(275);
    obj.layout137:setHeight(145);
    obj.layout137:setName("layout137");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout137);
    obj.label144:setLeft(0);
    obj.label144:setTop(0);
    obj.label144:setWidth(275);
    obj.label144:setHeight(20);
    obj.label144:setText("Placa Rúnica");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout137);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(20);
    obj.textEditor6:setWidth(275);
    obj.textEditor6:setHeight(125);
    obj.textEditor6:setField("mek_placa_runica");
    obj.textEditor6:setName("textEditor6");

    obj.layout138 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout135);
    obj.layout138:setLeft(5);
    obj.layout138:setTop(170);
    obj.layout138:setWidth(275);
    obj.layout138:setHeight(145);
    obj.layout138:setName("layout138");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout138);
    obj.label145:setLeft(0);
    obj.label145:setTop(0);
    obj.label145:setWidth(275);
    obj.label145:setHeight(20);
    obj.label145:setText("Capacitor");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout138);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(20);
    obj.textEditor7:setWidth(275);
    obj.textEditor7:setHeight(125);
    obj.textEditor7:setField("mek_capacitor");
    obj.textEditor7:setName("textEditor7");

    obj.layout139 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout135);
    obj.layout139:setLeft(285);
    obj.layout139:setTop(170);
    obj.layout139:setWidth(275);
    obj.layout139:setHeight(145);
    obj.layout139:setName("layout139");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout139);
    obj.label146:setLeft(0);
    obj.label146:setTop(0);
    obj.label146:setWidth(275);
    obj.label146:setHeight(20);
    obj.label146:setText("Placa Rúnica");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout139);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(20);
    obj.textEditor8:setWidth(275);
    obj.textEditor8:setHeight(125);
    obj.textEditor8:setField("mek_placa_runica2");
    obj.textEditor8:setName("textEditor8");

    obj.layout140 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout135);
    obj.layout140:setLeft(5);
    obj.layout140:setTop(315);
    obj.layout140:setWidth(275);
    obj.layout140:setHeight(145);
    obj.layout140:setName("layout140");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout140);
    obj.label147:setLeft(0);
    obj.label147:setTop(0);
    obj.label147:setWidth(275);
    obj.label147:setHeight(20);
    obj.label147:setText("Notas");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout140);
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(20);
    obj.textEditor9:setWidth(275);
    obj.textEditor9:setHeight(125);
    obj.textEditor9:setField("mek_notas");
    obj.textEditor9:setName("textEditor9");

    obj.layout141 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout135);
    obj.layout141:setLeft(285);
    obj.layout141:setTop(315);
    obj.layout141:setWidth(275);
    obj.layout141:setHeight(145);
    obj.layout141:setName("layout141");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout141);
    obj.label148:setLeft(0);
    obj.label148:setTop(0);
    obj.label148:setWidth(275);
    obj.label148:setHeight(20);
    obj.label148:setText("Beneficio");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout141);
    obj.textEditor10:setLeft(0);
    obj.textEditor10:setTop(20);
    obj.textEditor10:setWidth(275);
    obj.textEditor10:setHeight(125);
    obj.textEditor10:setField("mek_beneficio");
    obj.textEditor10:setName("textEditor10");

    obj.layout142 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout135);
    obj.layout142:setLeft(5);
    obj.layout142:setTop(460);
    obj.layout142:setWidth(275);
    obj.layout142:setHeight(145);
    obj.layout142:setName("layout142");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout142);
    obj.label149:setLeft(0);
    obj.label149:setTop(0);
    obj.label149:setWidth(275);
    obj.label149:setHeight(20);
    obj.label149:setText("Capacitores");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout142);
    obj.textEditor11:setLeft(0);
    obj.textEditor11:setTop(20);
    obj.textEditor11:setWidth(275);
    obj.textEditor11:setHeight(125);
    obj.textEditor11:setField("mek_capacitores");
    obj.textEditor11:setName("textEditor11");

    obj.layout143 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout135);
    obj.layout143:setLeft(285);
    obj.layout143:setTop(460);
    obj.layout143:setWidth(275);
    obj.layout143:setHeight(145);
    obj.layout143:setName("layout143");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout143);
    obj.label150:setLeft(0);
    obj.label150:setTop(0);
    obj.label150:setWidth(275);
    obj.label150:setHeight(20);
    obj.label150:setText("Cargas");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.textEditor12 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout143);
    obj.textEditor12:setLeft(0);
    obj.textEditor12:setTop(20);
    obj.textEditor12:setWidth(275);
    obj.textEditor12:setHeight(125);
    obj.textEditor12:setField("mek_cargas");
    obj.textEditor12:setName("textEditor12");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setAlign("client");
    obj.image5:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image5:setStyle("autoFit");
    obj.image5:setName("image5");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Steamjack");
    obj.tab5:setName("tab5");

    obj.frmRDF5 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF5:setParent(obj.tab5);
    obj.frmRDF5:setName("frmRDF5");
    obj.frmRDF5:setAlign("client");
    obj.frmRDF5:setTheme("dark");

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmRDF5);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout144 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.scrollBox7);
    obj.layout144:setLeft(0);
    obj.layout144:setTop(0);
    obj.layout144:setWidth(315);
    obj.layout144:setHeight(160);
    obj.layout144:setName("layout144");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout144);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("black");
    obj.rectangle47:setXradius(5);
    obj.rectangle47:setYradius(5);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

    obj.layout145 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout144);
    obj.layout145:setLeft(5);
    obj.layout145:setTop(5);
    obj.layout145:setWidth(300);
    obj.layout145:setHeight(25);
    obj.layout145:setName("layout145");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout145);
    obj.label151:setLeft(0);
    obj.label151:setTop(5);
    obj.label151:setWidth(100);
    obj.label151:setHeight(20);
    obj.label151:setText("Nome");
    obj.label151:setName("label151");

    obj.edit332 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout145);
    obj.edit332:setLeft(100);
    obj.edit332:setTop(0);
    obj.edit332:setWidth(200);
    obj.edit332:setHeight(25);
    obj.edit332:setField("sj_nome");
    obj.edit332:setName("edit332");

    obj.layout146 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout144);
    obj.layout146:setLeft(5);
    obj.layout146:setTop(30);
    obj.layout146:setWidth(300);
    obj.layout146:setHeight(25);
    obj.layout146:setName("layout146");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout146);
    obj.label152:setLeft(0);
    obj.label152:setTop(5);
    obj.label152:setWidth(100);
    obj.label152:setHeight(20);
    obj.label152:setText("Chassis");
    obj.label152:setName("label152");

    obj.edit333 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout146);
    obj.edit333:setLeft(100);
    obj.edit333:setTop(0);
    obj.edit333:setWidth(200);
    obj.edit333:setHeight(25);
    obj.edit333:setField("sj_chassis");
    obj.edit333:setName("edit333");

    obj.layout147 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout144);
    obj.layout147:setLeft(5);
    obj.layout147:setTop(55);
    obj.layout147:setWidth(300);
    obj.layout147:setHeight(25);
    obj.layout147:setName("layout147");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout147);
    obj.label153:setLeft(0);
    obj.label153:setTop(5);
    obj.label153:setWidth(100);
    obj.label153:setHeight(20);
    obj.label153:setText("Peso");
    obj.label153:setName("label153");

    obj.edit334 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout147);
    obj.edit334:setLeft(100);
    obj.edit334:setTop(0);
    obj.edit334:setWidth(200);
    obj.edit334:setHeight(25);
    obj.edit334:setField("sj_peso");
    obj.edit334:setName("edit334");

    obj.layout148 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout144);
    obj.layout148:setLeft(5);
    obj.layout148:setTop(80);
    obj.layout148:setWidth(300);
    obj.layout148:setHeight(25);
    obj.layout148:setName("layout148");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout148);
    obj.label154:setLeft(0);
    obj.label154:setTop(5);
    obj.label154:setWidth(100);
    obj.label154:setHeight(20);
    obj.label154:setText("Altura");
    obj.label154:setName("label154");

    obj.edit335 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout148);
    obj.edit335:setLeft(100);
    obj.edit335:setTop(0);
    obj.edit335:setWidth(200);
    obj.edit335:setHeight(25);
    obj.edit335:setField("sj_altura");
    obj.edit335:setName("edit335");

    obj.layout149 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout144);
    obj.layout149:setLeft(5);
    obj.layout149:setTop(105);
    obj.layout149:setWidth(300);
    obj.layout149:setHeight(25);
    obj.layout149:setName("layout149");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout149);
    obj.label155:setLeft(0);
    obj.label155:setTop(5);
    obj.label155:setWidth(100);
    obj.label155:setHeight(20);
    obj.label155:setText("Max. Comb.");
    obj.label155:setName("label155");

    obj.edit336 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout149);
    obj.edit336:setLeft(100);
    obj.edit336:setTop(0);
    obj.edit336:setWidth(200);
    obj.edit336:setHeight(25);
    obj.edit336:setField("sj_m_combustivel");
    obj.edit336:setName("edit336");

    obj.layout150 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout144);
    obj.layout150:setLeft(5);
    obj.layout150:setTop(130);
    obj.layout150:setWidth(300);
    obj.layout150:setHeight(25);
    obj.layout150:setName("layout150");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout150);
    obj.label156:setLeft(0);
    obj.label156:setTop(5);
    obj.label156:setWidth(100);
    obj.label156:setHeight(20);
    obj.label156:setText("Gasto Comb.");
    obj.label156:setName("label156");

    obj.edit337 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout150);
    obj.edit337:setLeft(100);
    obj.edit337:setTop(0);
    obj.edit337:setWidth(200);
    obj.edit337:setHeight(25);
    obj.edit337:setField("sj_g_combustivel");
    obj.edit337:setName("edit337");

    obj.layout151 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.scrollBox7);
    obj.layout151:setLeft(0);
    obj.layout151:setTop(165);
    obj.layout151:setWidth(210);
    obj.layout151:setHeight(130);
    obj.layout151:setName("layout151");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout151);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(5);
    obj.rectangle48:setYradius(5);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout151);
    obj.label157:setLeft(5);
    obj.label157:setTop(0);
    obj.label157:setWidth(200);
    obj.label157:setHeight(20);
    obj.label157:setText("ATRIBUTOS");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.layout152 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout151);
    obj.layout152:setLeft(5);
    obj.layout152:setTop(25);
    obj.layout152:setWidth(50);
    obj.layout152:setHeight(50);
    obj.layout152:setName("layout152");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout152);
    obj.label158:setLeft(0);
    obj.label158:setTop(5);
    obj.label158:setWidth(50);
    obj.label158:setHeight(20);
    obj.label158:setText("FIS");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.edit338 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout152);
    obj.edit338:setLeft(0);
    obj.edit338:setTop(25);
    obj.edit338:setWidth(50);
    obj.edit338:setHeight(25);
    obj.edit338:setField("sj_atr_fis");
    obj.edit338:setHorzTextAlign("center");
    obj.edit338:setName("edit338");

    obj.layout153 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout151);
    obj.layout153:setLeft(55);
    obj.layout153:setTop(25);
    obj.layout153:setWidth(50);
    obj.layout153:setHeight(50);
    obj.layout153:setName("layout153");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout153);
    obj.label159:setLeft(0);
    obj.label159:setTop(5);
    obj.label159:setWidth(50);
    obj.label159:setHeight(20);
    obj.label159:setText("VEL");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.edit339 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout153);
    obj.edit339:setLeft(0);
    obj.edit339:setTop(25);
    obj.edit339:setWidth(50);
    obj.edit339:setHeight(25);
    obj.edit339:setField("sj_atr_vel");
    obj.edit339:setHorzTextAlign("center");
    obj.edit339:setName("edit339");

    obj.layout154 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout151);
    obj.layout154:setLeft(105);
    obj.layout154:setTop(25);
    obj.layout154:setWidth(50);
    obj.layout154:setHeight(50);
    obj.layout154:setName("layout154");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout154);
    obj.label160:setLeft(0);
    obj.label160:setTop(5);
    obj.label160:setWidth(50);
    obj.label160:setHeight(20);
    obj.label160:setText("FOR");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.edit340 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout154);
    obj.edit340:setLeft(0);
    obj.edit340:setTop(25);
    obj.edit340:setWidth(50);
    obj.edit340:setHeight(25);
    obj.edit340:setField("sj_atr_for");
    obj.edit340:setHorzTextAlign("center");
    obj.edit340:setName("edit340");

    obj.layout155 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout151);
    obj.layout155:setLeft(155);
    obj.layout155:setTop(25);
    obj.layout155:setWidth(50);
    obj.layout155:setHeight(50);
    obj.layout155:setName("layout155");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout155);
    obj.label161:setLeft(0);
    obj.label161:setTop(5);
    obj.label161:setWidth(50);
    obj.label161:setHeight(20);
    obj.label161:setText("AGI");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.edit341 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout155);
    obj.edit341:setLeft(0);
    obj.edit341:setTop(25);
    obj.edit341:setWidth(50);
    obj.edit341:setHeight(25);
    obj.edit341:setField("sj_atr_agi");
    obj.edit341:setHorzTextAlign("center");
    obj.edit341:setName("edit341");

    obj.layout156 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout151);
    obj.layout156:setLeft(5);
    obj.layout156:setTop(75);
    obj.layout156:setWidth(50);
    obj.layout156:setHeight(50);
    obj.layout156:setName("layout156");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout156);
    obj.label162:setLeft(0);
    obj.label162:setTop(5);
    obj.label162:setWidth(50);
    obj.label162:setHeight(20);
    obj.label162:setText("DES");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.edit342 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout156);
    obj.edit342:setLeft(0);
    obj.edit342:setTop(25);
    obj.edit342:setWidth(50);
    obj.edit342:setHeight(25);
    obj.edit342:setField("sj_atr_des");
    obj.edit342:setHorzTextAlign("center");
    obj.edit342:setName("edit342");

    obj.layout157 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout151);
    obj.layout157:setLeft(55);
    obj.layout157:setTop(75);
    obj.layout157:setWidth(50);
    obj.layout157:setHeight(50);
    obj.layout157:setName("layout157");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout157);
    obj.label163:setLeft(0);
    obj.label163:setTop(5);
    obj.label163:setWidth(50);
    obj.label163:setHeight(20);
    obj.label163:setText("MAE");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.edit343 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout157);
    obj.edit343:setLeft(0);
    obj.edit343:setTop(25);
    obj.edit343:setWidth(50);
    obj.edit343:setHeight(25);
    obj.edit343:setField("sj_atr_mae");
    obj.edit343:setHorzTextAlign("center");
    obj.edit343:setName("edit343");

    obj.layout158 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout151);
    obj.layout158:setLeft(105);
    obj.layout158:setTop(75);
    obj.layout158:setWidth(50);
    obj.layout158:setHeight(50);
    obj.layout158:setName("layout158");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout158);
    obj.label164:setLeft(0);
    obj.label164:setTop(5);
    obj.label164:setWidth(50);
    obj.label164:setHeight(20);
    obj.label164:setText("INT");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.edit344 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout158);
    obj.edit344:setLeft(0);
    obj.edit344:setTop(25);
    obj.edit344:setWidth(50);
    obj.edit344:setHeight(25);
    obj.edit344:setField("sj_atr_int");
    obj.edit344:setHorzTextAlign("center");
    obj.edit344:setName("edit344");

    obj.layout159 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout151);
    obj.layout159:setLeft(155);
    obj.layout159:setTop(75);
    obj.layout159:setWidth(50);
    obj.layout159:setHeight(50);
    obj.layout159:setName("layout159");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout159);
    obj.label165:setLeft(0);
    obj.label165:setTop(5);
    obj.label165:setWidth(50);
    obj.label165:setHeight(20);
    obj.label165:setText("PER");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.edit345 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout159);
    obj.edit345:setLeft(0);
    obj.edit345:setTop(25);
    obj.edit345:setWidth(50);
    obj.edit345:setHeight(25);
    obj.edit345:setField("sj_atr_per");
    obj.edit345:setHorzTextAlign("center");
    obj.edit345:setName("edit345");

    obj.layout160 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.scrollBox7);
    obj.layout160:setLeft(215);
    obj.layout160:setTop(165);
    obj.layout160:setWidth(100);
    obj.layout160:setHeight(150);
    obj.layout160:setName("layout160");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout160);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout160);
    obj.label166:setLeft(5);
    obj.label166:setTop(0);
    obj.label166:setWidth(90);
    obj.label166:setHeight(20);
    obj.label166:setText("DANO");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.layout161 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout160);
    obj.layout161:setLeft(5);
    obj.layout161:setTop(25);
    obj.layout161:setWidth(200);
    obj.layout161:setHeight(25);
    obj.layout161:setName("layout161");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout161);
    obj.label167:setLeft(0);
    obj.label167:setTop(5);
    obj.label167:setWidth(15);
    obj.label167:setHeight(20);
    obj.label167:setText("1");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout161);
    obj.label168:setLeft(15);
    obj.label168:setTop(5);
    obj.label168:setWidth(15);
    obj.label168:setHeight(20);
    obj.label168:setText("2");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout161);
    obj.label169:setLeft(30);
    obj.label169:setTop(5);
    obj.label169:setWidth(15);
    obj.label169:setHeight(20);
    obj.label169:setText("3");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout161);
    obj.label170:setLeft(45);
    obj.label170:setTop(5);
    obj.label170:setWidth(15);
    obj.label170:setHeight(20);
    obj.label170:setText("4");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout161);
    obj.label171:setLeft(60);
    obj.label171:setTop(5);
    obj.label171:setWidth(15);
    obj.label171:setHeight(20);
    obj.label171:setText("5");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout161);
    obj.label172:setLeft(75);
    obj.label172:setTop(5);
    obj.label172:setWidth(15);
    obj.label172:setHeight(20);
    obj.label172:setText("3");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.layout162 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout160);
    obj.layout162:setLeft(5);
    obj.layout162:setTop(50);
    obj.layout162:setWidth(200);
    obj.layout162:setHeight(25);
    obj.layout162:setName("layout162");

    obj.checkBox37 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout162);
    obj.checkBox37:setLeft(0);
    obj.checkBox37:setTop(0);
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout162);
    obj.checkBox38:setLeft(15);
    obj.checkBox38:setTop(0);
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout162);
    obj.checkBox39:setLeft(30);
    obj.checkBox39:setTop(0);
    obj.checkBox39:setName("checkBox39");

    obj.checkBox40 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout162);
    obj.checkBox40:setLeft(45);
    obj.checkBox40:setTop(0);
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout162);
    obj.checkBox41:setLeft(60);
    obj.checkBox41:setTop(0);
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout162);
    obj.checkBox42:setLeft(75);
    obj.checkBox42:setTop(0);
    obj.checkBox42:setName("checkBox42");

    obj.layout163 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout160);
    obj.layout163:setLeft(5);
    obj.layout163:setTop(65);
    obj.layout163:setWidth(200);
    obj.layout163:setHeight(25);
    obj.layout163:setName("layout163");

    obj.checkBox43 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout163);
    obj.checkBox43:setLeft(0);
    obj.checkBox43:setTop(0);
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout163);
    obj.checkBox44:setLeft(15);
    obj.checkBox44:setTop(0);
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout163);
    obj.checkBox45:setLeft(30);
    obj.checkBox45:setTop(0);
    obj.checkBox45:setName("checkBox45");

    obj.checkBox46 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout163);
    obj.checkBox46:setLeft(45);
    obj.checkBox46:setTop(0);
    obj.checkBox46:setName("checkBox46");

    obj.checkBox47 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout163);
    obj.checkBox47:setLeft(60);
    obj.checkBox47:setTop(0);
    obj.checkBox47:setName("checkBox47");

    obj.checkBox48 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout163);
    obj.checkBox48:setLeft(75);
    obj.checkBox48:setTop(0);
    obj.checkBox48:setName("checkBox48");

    obj.layout164 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout160);
    obj.layout164:setLeft(5);
    obj.layout164:setTop(80);
    obj.layout164:setWidth(200);
    obj.layout164:setHeight(25);
    obj.layout164:setName("layout164");

    obj.checkBox49 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout164);
    obj.checkBox49:setLeft(0);
    obj.checkBox49:setTop(0);
    obj.checkBox49:setName("checkBox49");

    obj.checkBox50 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout164);
    obj.checkBox50:setLeft(15);
    obj.checkBox50:setTop(0);
    obj.checkBox50:setName("checkBox50");

    obj.checkBox51 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout164);
    obj.checkBox51:setLeft(30);
    obj.checkBox51:setTop(0);
    obj.checkBox51:setName("checkBox51");

    obj.checkBox52 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout164);
    obj.checkBox52:setLeft(45);
    obj.checkBox52:setTop(0);
    obj.checkBox52:setName("checkBox52");

    obj.checkBox53 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout164);
    obj.checkBox53:setLeft(60);
    obj.checkBox53:setTop(0);
    obj.checkBox53:setName("checkBox53");

    obj.checkBox54 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout164);
    obj.checkBox54:setLeft(75);
    obj.checkBox54:setTop(0);
    obj.checkBox54:setName("checkBox54");

    obj.layout165 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout160);
    obj.layout165:setLeft(5);
    obj.layout165:setTop(95);
    obj.layout165:setWidth(200);
    obj.layout165:setHeight(25);
    obj.layout165:setName("layout165");

    obj.checkBox55 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout165);
    obj.checkBox55:setLeft(0);
    obj.checkBox55:setTop(0);
    obj.checkBox55:setName("checkBox55");

    obj.checkBox56 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout165);
    obj.checkBox56:setLeft(15);
    obj.checkBox56:setTop(0);
    obj.checkBox56:setName("checkBox56");

    obj.checkBox57 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout165);
    obj.checkBox57:setLeft(30);
    obj.checkBox57:setTop(0);
    obj.checkBox57:setName("checkBox57");

    obj.checkBox58 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout165);
    obj.checkBox58:setLeft(45);
    obj.checkBox58:setTop(0);
    obj.checkBox58:setName("checkBox58");

    obj.checkBox59 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout165);
    obj.checkBox59:setLeft(60);
    obj.checkBox59:setTop(0);
    obj.checkBox59:setName("checkBox59");

    obj.checkBox60 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout165);
    obj.checkBox60:setLeft(75);
    obj.checkBox60:setTop(0);
    obj.checkBox60:setName("checkBox60");

    obj.layout166 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout160);
    obj.layout166:setLeft(5);
    obj.layout166:setTop(110);
    obj.layout166:setWidth(200);
    obj.layout166:setHeight(25);
    obj.layout166:setName("layout166");

    obj.checkBox61 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout166);
    obj.checkBox61:setLeft(0);
    obj.checkBox61:setTop(0);
    obj.checkBox61:setName("checkBox61");

    obj.checkBox62 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout166);
    obj.checkBox62:setLeft(15);
    obj.checkBox62:setTop(0);
    obj.checkBox62:setName("checkBox62");

    obj.checkBox63 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout166);
    obj.checkBox63:setLeft(30);
    obj.checkBox63:setTop(0);
    obj.checkBox63:setName("checkBox63");

    obj.checkBox64 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout166);
    obj.checkBox64:setLeft(45);
    obj.checkBox64:setTop(0);
    obj.checkBox64:setName("checkBox64");

    obj.checkBox65 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout166);
    obj.checkBox65:setLeft(60);
    obj.checkBox65:setTop(0);
    obj.checkBox65:setName("checkBox65");

    obj.checkBox66 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout166);
    obj.checkBox66:setLeft(75);
    obj.checkBox66:setTop(0);
    obj.checkBox66:setName("checkBox66");

    obj.layout167 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout160);
    obj.layout167:setLeft(5);
    obj.layout167:setTop(125);
    obj.layout167:setWidth(200);
    obj.layout167:setHeight(25);
    obj.layout167:setName("layout167");

    obj.checkBox67 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout167);
    obj.checkBox67:setLeft(0);
    obj.checkBox67:setTop(0);
    obj.checkBox67:setName("checkBox67");

    obj.checkBox68 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout167);
    obj.checkBox68:setLeft(15);
    obj.checkBox68:setTop(0);
    obj.checkBox68:setName("checkBox68");

    obj.checkBox69 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout167);
    obj.checkBox69:setLeft(30);
    obj.checkBox69:setTop(0);
    obj.checkBox69:setName("checkBox69");

    obj.checkBox70 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout167);
    obj.checkBox70:setLeft(45);
    obj.checkBox70:setTop(0);
    obj.checkBox70:setName("checkBox70");

    obj.checkBox71 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout167);
    obj.checkBox71:setLeft(60);
    obj.checkBox71:setTop(0);
    obj.checkBox71:setName("checkBox71");

    obj.checkBox72 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout167);
    obj.checkBox72:setLeft(75);
    obj.checkBox72:setTop(0);
    obj.checkBox72:setName("checkBox72");

    obj.layout168 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.scrollBox7);
    obj.layout168:setLeft(0);
    obj.layout168:setTop(320);
    obj.layout168:setWidth(315);
    obj.layout168:setHeight(130);
    obj.layout168:setName("layout168");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout168);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(5);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout168);
    obj.label173:setLeft(5);
    obj.label173:setTop(0);
    obj.label173:setWidth(305);
    obj.label173:setHeight(20);
    obj.label173:setText("CORTEX");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.layout169 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout168);
    obj.layout169:setLeft(5);
    obj.layout169:setTop(25);
    obj.layout169:setWidth(300);
    obj.layout169:setHeight(25);
    obj.layout169:setName("layout169");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout169);
    obj.label174:setLeft(0);
    obj.label174:setTop(5);
    obj.label174:setWidth(100);
    obj.label174:setHeight(20);
    obj.label174:setText("Marca");
    obj.label174:setName("label174");

    obj.edit346 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout169);
    obj.edit346:setLeft(100);
    obj.edit346:setTop(0);
    obj.edit346:setWidth(200);
    obj.edit346:setHeight(25);
    obj.edit346:setField("sj_marca");
    obj.edit346:setName("edit346");

    obj.layout170 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout168);
    obj.layout170:setLeft(5);
    obj.layout170:setTop(50);
    obj.layout170:setWidth(300);
    obj.layout170:setHeight(25);
    obj.layout170:setName("layout170");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout170);
    obj.label175:setLeft(0);
    obj.label175:setTop(5);
    obj.label175:setWidth(100);
    obj.label175:setHeight(20);
    obj.label175:setText("Notas");
    obj.label175:setName("label175");

    obj.edit347 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout170);
    obj.edit347:setLeft(100);
    obj.edit347:setTop(0);
    obj.edit347:setWidth(200);
    obj.edit347:setHeight(25);
    obj.edit347:setField("sj_nota");
    obj.edit347:setName("edit347");

    obj.layout171 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout168);
    obj.layout171:setLeft(5);
    obj.layout171:setTop(75);
    obj.layout171:setWidth(300);
    obj.layout171:setHeight(25);
    obj.layout171:setName("layout171");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout171);
    obj.label176:setLeft(0);
    obj.label176:setTop(5);
    obj.label176:setWidth(100);
    obj.label176:setHeight(20);
    obj.label176:setText("Bônus de Ataque");
    obj.label176:setName("label176");

    obj.edit348 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout171);
    obj.edit348:setLeft(100);
    obj.edit348:setTop(0);
    obj.edit348:setWidth(200);
    obj.edit348:setHeight(25);
    obj.edit348:setField("sj_luta");
    obj.edit348:setName("edit348");

    obj.layout172 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.layout168);
    obj.layout172:setLeft(5);
    obj.layout172:setTop(100);
    obj.layout172:setWidth(300);
    obj.layout172:setHeight(25);
    obj.layout172:setName("layout172");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout172);
    obj.label177:setLeft(0);
    obj.label177:setTop(5);
    obj.label177:setWidth(100);
    obj.label177:setHeight(20);
    obj.label177:setText("Idioma");
    obj.label177:setName("label177");

    obj.edit349 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout172);
    obj.edit349:setLeft(100);
    obj.edit349:setTop(0);
    obj.edit349:setWidth(200);
    obj.edit349:setHeight(25);
    obj.edit349:setField("sj_idioma");
    obj.edit349:setName("edit349");

    obj.layout173 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.scrollBox7);
    obj.layout173:setLeft(320);
    obj.layout173:setTop(0);
    obj.layout173:setWidth(530);
    obj.layout173:setHeight(210);
    obj.layout173:setName("layout173");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout173);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(5);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout173);
    obj.label178:setLeft(15);
    obj.label178:setTop(0);
    obj.label178:setWidth(500);
    obj.label178:setHeight(20);
    obj.label178:setText("ATAQUES A DISTANCIA");
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.layout174 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout173);
    obj.layout174:setLeft(5);
    obj.layout174:setTop(25);
    obj.layout174:setWidth(500);
    obj.layout174:setHeight(25);
    obj.layout174:setName("layout174");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout174);
    obj.label179:setLeft(0);
    obj.label179:setTop(5);
    obj.label179:setWidth(150);
    obj.label179:setHeight(20);
    obj.label179:setText("NOME");
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout174);
    obj.label180:setLeft(150);
    obj.label180:setTop(5);
    obj.label180:setWidth(150);
    obj.label180:setHeight(20);
    obj.label180:setText("NOTAS");
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout174);
    obj.label181:setLeft(300);
    obj.label181:setTop(5);
    obj.label181:setWidth(50);
    obj.label181:setHeight(20);
    obj.label181:setText("ALC");
    obj.label181:setHorzTextAlign("center");
    obj.label181:setName("label181");

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout174);
    obj.label182:setLeft(350);
    obj.label182:setTop(5);
    obj.label182:setWidth(50);
    obj.label182:setHeight(20);
    obj.label182:setText("ADI");
    obj.label182:setHorzTextAlign("center");
    obj.label182:setName("label182");

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout174);
    obj.label183:setLeft(400);
    obj.label183:setTop(5);
    obj.label183:setWidth(50);
    obj.label183:setHeight(20);
    obj.label183:setText("POD");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout174);
    obj.label184:setLeft(450);
    obj.label184:setTop(5);
    obj.label184:setWidth(50);
    obj.label184:setHeight(20);
    obj.label184:setText("MUN");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.scrollBox8 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.layout173);
    obj.scrollBox8:setLeft(0);
    obj.scrollBox8:setTop(50);
    obj.scrollBox8:setWidth(525);
    obj.scrollBox8:setHeight(150);
    obj.scrollBox8:setName("scrollBox8");

    obj.layout175 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.scrollBox8);
    obj.layout175:setLeft(5);
    obj.layout175:setTop(0);
    obj.layout175:setWidth(500);
    obj.layout175:setHeight(25);
    obj.layout175:setName("layout175");

    obj.edit350 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout175);
    obj.edit350:setLeft(0);
    obj.edit350:setTop(0);
    obj.edit350:setWidth(150);
    obj.edit350:setHeight(25);
    obj.edit350:setField("atqD_1");
    obj.edit350:setHorzTextAlign("center");
    obj.edit350:setName("edit350");

    obj.edit351 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout175);
    obj.edit351:setLeft(150);
    obj.edit351:setTop(0);
    obj.edit351:setWidth(150);
    obj.edit351:setHeight(25);
    obj.edit351:setField("atqD_notas_1");
    obj.edit351:setHorzTextAlign("center");
    obj.edit351:setName("edit351");

    obj.edit352 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout175);
    obj.edit352:setLeft(300);
    obj.edit352:setTop(0);
    obj.edit352:setWidth(50);
    obj.edit352:setHeight(25);
    obj.edit352:setField("atqD_alc_1");
    obj.edit352:setHorzTextAlign("center");
    obj.edit352:setName("edit352");

    obj.edit353 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout175);
    obj.edit353:setLeft(350);
    obj.edit353:setTop(0);
    obj.edit353:setWidth(50);
    obj.edit353:setHeight(25);
    obj.edit353:setField("atqD_adi_1");
    obj.edit353:setHorzTextAlign("center");
    obj.edit353:setName("edit353");

    obj.edit354 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout175);
    obj.edit354:setLeft(400);
    obj.edit354:setTop(0);
    obj.edit354:setWidth(50);
    obj.edit354:setHeight(25);
    obj.edit354:setField("atqD_pod_1");
    obj.edit354:setHorzTextAlign("center");
    obj.edit354:setName("edit354");

    obj.edit355 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout175);
    obj.edit355:setLeft(450);
    obj.edit355:setTop(0);
    obj.edit355:setWidth(50);
    obj.edit355:setHeight(25);
    obj.edit355:setField("atqD_mun_1");
    obj.edit355:setHorzTextAlign("center");
    obj.edit355:setName("edit355");

    obj.layout176 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.scrollBox8);
    obj.layout176:setLeft(5);
    obj.layout176:setTop(25);
    obj.layout176:setWidth(500);
    obj.layout176:setHeight(25);
    obj.layout176:setName("layout176");

    obj.edit356 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout176);
    obj.edit356:setLeft(0);
    obj.edit356:setTop(0);
    obj.edit356:setWidth(150);
    obj.edit356:setHeight(25);
    obj.edit356:setField("atqD_2");
    obj.edit356:setHorzTextAlign("center");
    obj.edit356:setName("edit356");

    obj.edit357 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout176);
    obj.edit357:setLeft(150);
    obj.edit357:setTop(0);
    obj.edit357:setWidth(150);
    obj.edit357:setHeight(25);
    obj.edit357:setField("atqD_notas_2");
    obj.edit357:setHorzTextAlign("center");
    obj.edit357:setName("edit357");

    obj.edit358 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout176);
    obj.edit358:setLeft(300);
    obj.edit358:setTop(0);
    obj.edit358:setWidth(50);
    obj.edit358:setHeight(25);
    obj.edit358:setField("atqD_alc_2");
    obj.edit358:setHorzTextAlign("center");
    obj.edit358:setName("edit358");

    obj.edit359 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout176);
    obj.edit359:setLeft(350);
    obj.edit359:setTop(0);
    obj.edit359:setWidth(50);
    obj.edit359:setHeight(25);
    obj.edit359:setField("atqD_adi_2");
    obj.edit359:setHorzTextAlign("center");
    obj.edit359:setName("edit359");

    obj.edit360 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout176);
    obj.edit360:setLeft(400);
    obj.edit360:setTop(0);
    obj.edit360:setWidth(50);
    obj.edit360:setHeight(25);
    obj.edit360:setField("atqD_pod_2");
    obj.edit360:setHorzTextAlign("center");
    obj.edit360:setName("edit360");

    obj.edit361 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout176);
    obj.edit361:setLeft(450);
    obj.edit361:setTop(0);
    obj.edit361:setWidth(50);
    obj.edit361:setHeight(25);
    obj.edit361:setField("atqD_mun_2");
    obj.edit361:setHorzTextAlign("center");
    obj.edit361:setName("edit361");

    obj.layout177 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.scrollBox8);
    obj.layout177:setLeft(5);
    obj.layout177:setTop(50);
    obj.layout177:setWidth(500);
    obj.layout177:setHeight(25);
    obj.layout177:setName("layout177");

    obj.edit362 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout177);
    obj.edit362:setLeft(0);
    obj.edit362:setTop(0);
    obj.edit362:setWidth(150);
    obj.edit362:setHeight(25);
    obj.edit362:setField("atqD_3");
    obj.edit362:setHorzTextAlign("center");
    obj.edit362:setName("edit362");

    obj.edit363 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout177);
    obj.edit363:setLeft(150);
    obj.edit363:setTop(0);
    obj.edit363:setWidth(150);
    obj.edit363:setHeight(25);
    obj.edit363:setField("atqD_notas_3");
    obj.edit363:setHorzTextAlign("center");
    obj.edit363:setName("edit363");

    obj.edit364 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout177);
    obj.edit364:setLeft(300);
    obj.edit364:setTop(0);
    obj.edit364:setWidth(50);
    obj.edit364:setHeight(25);
    obj.edit364:setField("atqD_alc_3");
    obj.edit364:setHorzTextAlign("center");
    obj.edit364:setName("edit364");

    obj.edit365 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout177);
    obj.edit365:setLeft(350);
    obj.edit365:setTop(0);
    obj.edit365:setWidth(50);
    obj.edit365:setHeight(25);
    obj.edit365:setField("atqD_adi_3");
    obj.edit365:setHorzTextAlign("center");
    obj.edit365:setName("edit365");

    obj.edit366 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout177);
    obj.edit366:setLeft(400);
    obj.edit366:setTop(0);
    obj.edit366:setWidth(50);
    obj.edit366:setHeight(25);
    obj.edit366:setField("atqD_pod_3");
    obj.edit366:setHorzTextAlign("center");
    obj.edit366:setName("edit366");

    obj.edit367 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout177);
    obj.edit367:setLeft(450);
    obj.edit367:setTop(0);
    obj.edit367:setWidth(50);
    obj.edit367:setHeight(25);
    obj.edit367:setField("atqD_mun_3");
    obj.edit367:setHorzTextAlign("center");
    obj.edit367:setName("edit367");

    obj.layout178 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.scrollBox8);
    obj.layout178:setLeft(5);
    obj.layout178:setTop(75);
    obj.layout178:setWidth(500);
    obj.layout178:setHeight(25);
    obj.layout178:setName("layout178");

    obj.edit368 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout178);
    obj.edit368:setLeft(0);
    obj.edit368:setTop(0);
    obj.edit368:setWidth(150);
    obj.edit368:setHeight(25);
    obj.edit368:setField("atqD_4");
    obj.edit368:setHorzTextAlign("center");
    obj.edit368:setName("edit368");

    obj.edit369 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout178);
    obj.edit369:setLeft(150);
    obj.edit369:setTop(0);
    obj.edit369:setWidth(150);
    obj.edit369:setHeight(25);
    obj.edit369:setField("atqD_notas_4");
    obj.edit369:setHorzTextAlign("center");
    obj.edit369:setName("edit369");

    obj.edit370 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout178);
    obj.edit370:setLeft(300);
    obj.edit370:setTop(0);
    obj.edit370:setWidth(50);
    obj.edit370:setHeight(25);
    obj.edit370:setField("atqD_alc_4");
    obj.edit370:setHorzTextAlign("center");
    obj.edit370:setName("edit370");

    obj.edit371 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout178);
    obj.edit371:setLeft(350);
    obj.edit371:setTop(0);
    obj.edit371:setWidth(50);
    obj.edit371:setHeight(25);
    obj.edit371:setField("atqD_adi_4");
    obj.edit371:setHorzTextAlign("center");
    obj.edit371:setName("edit371");

    obj.edit372 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout178);
    obj.edit372:setLeft(400);
    obj.edit372:setTop(0);
    obj.edit372:setWidth(50);
    obj.edit372:setHeight(25);
    obj.edit372:setField("atqD_pod_4");
    obj.edit372:setHorzTextAlign("center");
    obj.edit372:setName("edit372");

    obj.edit373 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout178);
    obj.edit373:setLeft(450);
    obj.edit373:setTop(0);
    obj.edit373:setWidth(50);
    obj.edit373:setHeight(25);
    obj.edit373:setField("atqD_mun_4");
    obj.edit373:setHorzTextAlign("center");
    obj.edit373:setName("edit373");

    obj.layout179 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.scrollBox8);
    obj.layout179:setLeft(5);
    obj.layout179:setTop(100);
    obj.layout179:setWidth(500);
    obj.layout179:setHeight(25);
    obj.layout179:setName("layout179");

    obj.edit374 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout179);
    obj.edit374:setLeft(0);
    obj.edit374:setTop(0);
    obj.edit374:setWidth(150);
    obj.edit374:setHeight(25);
    obj.edit374:setField("atqD_5");
    obj.edit374:setHorzTextAlign("center");
    obj.edit374:setName("edit374");

    obj.edit375 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout179);
    obj.edit375:setLeft(150);
    obj.edit375:setTop(0);
    obj.edit375:setWidth(150);
    obj.edit375:setHeight(25);
    obj.edit375:setField("atqD_notas_5");
    obj.edit375:setHorzTextAlign("center");
    obj.edit375:setName("edit375");

    obj.edit376 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout179);
    obj.edit376:setLeft(300);
    obj.edit376:setTop(0);
    obj.edit376:setWidth(50);
    obj.edit376:setHeight(25);
    obj.edit376:setField("atqD_alc_5");
    obj.edit376:setHorzTextAlign("center");
    obj.edit376:setName("edit376");

    obj.edit377 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout179);
    obj.edit377:setLeft(350);
    obj.edit377:setTop(0);
    obj.edit377:setWidth(50);
    obj.edit377:setHeight(25);
    obj.edit377:setField("atqD_adi_5");
    obj.edit377:setHorzTextAlign("center");
    obj.edit377:setName("edit377");

    obj.edit378 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout179);
    obj.edit378:setLeft(400);
    obj.edit378:setTop(0);
    obj.edit378:setWidth(50);
    obj.edit378:setHeight(25);
    obj.edit378:setField("atqD_pod_5");
    obj.edit378:setHorzTextAlign("center");
    obj.edit378:setName("edit378");

    obj.edit379 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout179);
    obj.edit379:setLeft(450);
    obj.edit379:setTop(0);
    obj.edit379:setWidth(50);
    obj.edit379:setHeight(25);
    obj.edit379:setField("atqD_mun_5");
    obj.edit379:setHorzTextAlign("center");
    obj.edit379:setName("edit379");

    obj.layout180 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.scrollBox8);
    obj.layout180:setLeft(5);
    obj.layout180:setTop(125);
    obj.layout180:setWidth(500);
    obj.layout180:setHeight(25);
    obj.layout180:setName("layout180");

    obj.edit380 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout180);
    obj.edit380:setLeft(0);
    obj.edit380:setTop(0);
    obj.edit380:setWidth(150);
    obj.edit380:setHeight(25);
    obj.edit380:setField("atqD_6");
    obj.edit380:setHorzTextAlign("center");
    obj.edit380:setName("edit380");

    obj.edit381 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout180);
    obj.edit381:setLeft(150);
    obj.edit381:setTop(0);
    obj.edit381:setWidth(150);
    obj.edit381:setHeight(25);
    obj.edit381:setField("atqD_notas_6");
    obj.edit381:setHorzTextAlign("center");
    obj.edit381:setName("edit381");

    obj.edit382 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout180);
    obj.edit382:setLeft(300);
    obj.edit382:setTop(0);
    obj.edit382:setWidth(50);
    obj.edit382:setHeight(25);
    obj.edit382:setField("atqD_alc_6");
    obj.edit382:setHorzTextAlign("center");
    obj.edit382:setName("edit382");

    obj.edit383 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout180);
    obj.edit383:setLeft(350);
    obj.edit383:setTop(0);
    obj.edit383:setWidth(50);
    obj.edit383:setHeight(25);
    obj.edit383:setField("atqD_adi_6");
    obj.edit383:setHorzTextAlign("center");
    obj.edit383:setName("edit383");

    obj.edit384 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout180);
    obj.edit384:setLeft(400);
    obj.edit384:setTop(0);
    obj.edit384:setWidth(50);
    obj.edit384:setHeight(25);
    obj.edit384:setField("atqD_pod_6");
    obj.edit384:setHorzTextAlign("center");
    obj.edit384:setName("edit384");

    obj.edit385 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout180);
    obj.edit385:setLeft(450);
    obj.edit385:setTop(0);
    obj.edit385:setWidth(50);
    obj.edit385:setHeight(25);
    obj.edit385:setField("atqD_mun_6");
    obj.edit385:setHorzTextAlign("center");
    obj.edit385:setName("edit385");

    obj.layout181 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.scrollBox8);
    obj.layout181:setLeft(5);
    obj.layout181:setTop(150);
    obj.layout181:setWidth(500);
    obj.layout181:setHeight(25);
    obj.layout181:setName("layout181");

    obj.edit386 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout181);
    obj.edit386:setLeft(0);
    obj.edit386:setTop(0);
    obj.edit386:setWidth(150);
    obj.edit386:setHeight(25);
    obj.edit386:setField("atqD_7");
    obj.edit386:setHorzTextAlign("center");
    obj.edit386:setName("edit386");

    obj.edit387 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout181);
    obj.edit387:setLeft(150);
    obj.edit387:setTop(0);
    obj.edit387:setWidth(150);
    obj.edit387:setHeight(25);
    obj.edit387:setField("atqD_notas_7");
    obj.edit387:setHorzTextAlign("center");
    obj.edit387:setName("edit387");

    obj.edit388 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout181);
    obj.edit388:setLeft(300);
    obj.edit388:setTop(0);
    obj.edit388:setWidth(50);
    obj.edit388:setHeight(25);
    obj.edit388:setField("atqD_alc_7");
    obj.edit388:setHorzTextAlign("center");
    obj.edit388:setName("edit388");

    obj.edit389 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout181);
    obj.edit389:setLeft(350);
    obj.edit389:setTop(0);
    obj.edit389:setWidth(50);
    obj.edit389:setHeight(25);
    obj.edit389:setField("atqD_adi_7");
    obj.edit389:setHorzTextAlign("center");
    obj.edit389:setName("edit389");

    obj.edit390 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout181);
    obj.edit390:setLeft(400);
    obj.edit390:setTop(0);
    obj.edit390:setWidth(50);
    obj.edit390:setHeight(25);
    obj.edit390:setField("atqD_pod_7");
    obj.edit390:setHorzTextAlign("center");
    obj.edit390:setName("edit390");

    obj.edit391 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout181);
    obj.edit391:setLeft(450);
    obj.edit391:setTop(0);
    obj.edit391:setWidth(50);
    obj.edit391:setHeight(25);
    obj.edit391:setField("atqD_mun_7");
    obj.edit391:setHorzTextAlign("center");
    obj.edit391:setName("edit391");

    obj.layout182 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.scrollBox8);
    obj.layout182:setLeft(5);
    obj.layout182:setTop(175);
    obj.layout182:setWidth(500);
    obj.layout182:setHeight(25);
    obj.layout182:setName("layout182");

    obj.edit392 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout182);
    obj.edit392:setLeft(0);
    obj.edit392:setTop(0);
    obj.edit392:setWidth(150);
    obj.edit392:setHeight(25);
    obj.edit392:setField("atqD_8");
    obj.edit392:setHorzTextAlign("center");
    obj.edit392:setName("edit392");

    obj.edit393 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout182);
    obj.edit393:setLeft(150);
    obj.edit393:setTop(0);
    obj.edit393:setWidth(150);
    obj.edit393:setHeight(25);
    obj.edit393:setField("atqD_notas_8");
    obj.edit393:setHorzTextAlign("center");
    obj.edit393:setName("edit393");

    obj.edit394 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout182);
    obj.edit394:setLeft(300);
    obj.edit394:setTop(0);
    obj.edit394:setWidth(50);
    obj.edit394:setHeight(25);
    obj.edit394:setField("atqD_alc_8");
    obj.edit394:setHorzTextAlign("center");
    obj.edit394:setName("edit394");

    obj.edit395 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout182);
    obj.edit395:setLeft(350);
    obj.edit395:setTop(0);
    obj.edit395:setWidth(50);
    obj.edit395:setHeight(25);
    obj.edit395:setField("atqD_adi_8");
    obj.edit395:setHorzTextAlign("center");
    obj.edit395:setName("edit395");

    obj.edit396 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout182);
    obj.edit396:setLeft(400);
    obj.edit396:setTop(0);
    obj.edit396:setWidth(50);
    obj.edit396:setHeight(25);
    obj.edit396:setField("atqD_pod_8");
    obj.edit396:setHorzTextAlign("center");
    obj.edit396:setName("edit396");

    obj.edit397 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout182);
    obj.edit397:setLeft(450);
    obj.edit397:setTop(0);
    obj.edit397:setWidth(50);
    obj.edit397:setHeight(25);
    obj.edit397:setField("atqD_mun_8");
    obj.edit397:setHorzTextAlign("center");
    obj.edit397:setName("edit397");

    obj.layout183 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.scrollBox8);
    obj.layout183:setLeft(5);
    obj.layout183:setTop(200);
    obj.layout183:setWidth(500);
    obj.layout183:setHeight(25);
    obj.layout183:setName("layout183");

    obj.edit398 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout183);
    obj.edit398:setLeft(0);
    obj.edit398:setTop(0);
    obj.edit398:setWidth(150);
    obj.edit398:setHeight(25);
    obj.edit398:setField("atqD_9");
    obj.edit398:setHorzTextAlign("center");
    obj.edit398:setName("edit398");

    obj.edit399 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout183);
    obj.edit399:setLeft(150);
    obj.edit399:setTop(0);
    obj.edit399:setWidth(150);
    obj.edit399:setHeight(25);
    obj.edit399:setField("atqD_notas_9");
    obj.edit399:setHorzTextAlign("center");
    obj.edit399:setName("edit399");

    obj.edit400 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout183);
    obj.edit400:setLeft(300);
    obj.edit400:setTop(0);
    obj.edit400:setWidth(50);
    obj.edit400:setHeight(25);
    obj.edit400:setField("atqD_alc_9");
    obj.edit400:setHorzTextAlign("center");
    obj.edit400:setName("edit400");

    obj.edit401 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout183);
    obj.edit401:setLeft(350);
    obj.edit401:setTop(0);
    obj.edit401:setWidth(50);
    obj.edit401:setHeight(25);
    obj.edit401:setField("atqD_adi_9");
    obj.edit401:setHorzTextAlign("center");
    obj.edit401:setName("edit401");

    obj.edit402 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout183);
    obj.edit402:setLeft(400);
    obj.edit402:setTop(0);
    obj.edit402:setWidth(50);
    obj.edit402:setHeight(25);
    obj.edit402:setField("atqD_pod_9");
    obj.edit402:setHorzTextAlign("center");
    obj.edit402:setName("edit402");

    obj.edit403 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout183);
    obj.edit403:setLeft(450);
    obj.edit403:setTop(0);
    obj.edit403:setWidth(50);
    obj.edit403:setHeight(25);
    obj.edit403:setField("atqD_mun_9");
    obj.edit403:setHorzTextAlign("center");
    obj.edit403:setName("edit403");

    obj.layout184 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.scrollBox8);
    obj.layout184:setLeft(5);
    obj.layout184:setTop(225);
    obj.layout184:setWidth(500);
    obj.layout184:setHeight(25);
    obj.layout184:setName("layout184");

    obj.edit404 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout184);
    obj.edit404:setLeft(0);
    obj.edit404:setTop(0);
    obj.edit404:setWidth(150);
    obj.edit404:setHeight(25);
    obj.edit404:setField("atqD_10");
    obj.edit404:setHorzTextAlign("center");
    obj.edit404:setName("edit404");

    obj.edit405 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout184);
    obj.edit405:setLeft(150);
    obj.edit405:setTop(0);
    obj.edit405:setWidth(150);
    obj.edit405:setHeight(25);
    obj.edit405:setField("atqD_notas_10");
    obj.edit405:setHorzTextAlign("center");
    obj.edit405:setName("edit405");

    obj.edit406 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout184);
    obj.edit406:setLeft(300);
    obj.edit406:setTop(0);
    obj.edit406:setWidth(50);
    obj.edit406:setHeight(25);
    obj.edit406:setField("atqD_alc_10");
    obj.edit406:setHorzTextAlign("center");
    obj.edit406:setName("edit406");

    obj.edit407 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout184);
    obj.edit407:setLeft(350);
    obj.edit407:setTop(0);
    obj.edit407:setWidth(50);
    obj.edit407:setHeight(25);
    obj.edit407:setField("atqD_adi_10");
    obj.edit407:setHorzTextAlign("center");
    obj.edit407:setName("edit407");

    obj.edit408 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout184);
    obj.edit408:setLeft(400);
    obj.edit408:setTop(0);
    obj.edit408:setWidth(50);
    obj.edit408:setHeight(25);
    obj.edit408:setField("atqD_pod_10");
    obj.edit408:setHorzTextAlign("center");
    obj.edit408:setName("edit408");

    obj.edit409 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout184);
    obj.edit409:setLeft(450);
    obj.edit409:setTop(0);
    obj.edit409:setWidth(50);
    obj.edit409:setHeight(25);
    obj.edit409:setField("atqD_mun_10");
    obj.edit409:setHorzTextAlign("center");
    obj.edit409:setName("edit409");

    obj.layout185 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.scrollBox7);
    obj.layout185:setLeft(855);
    obj.layout185:setTop(0);
    obj.layout185:setWidth(430);
    obj.layout185:setHeight(210);
    obj.layout185:setName("layout185");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout185);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setName("rectangle52");

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout185);
    obj.label185:setLeft(15);
    obj.label185:setTop(0);
    obj.label185:setWidth(400);
    obj.label185:setHeight(20);
    obj.label185:setText("ATAQUES CORPO A CORPO");
    obj.label185:setHorzTextAlign("center");
    obj.label185:setName("label185");

    obj.layout186 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.layout185);
    obj.layout186:setLeft(5);
    obj.layout186:setTop(25);
    obj.layout186:setWidth(400);
    obj.layout186:setHeight(25);
    obj.layout186:setName("layout186");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout186);
    obj.label186:setLeft(0);
    obj.label186:setTop(5);
    obj.label186:setWidth(150);
    obj.label186:setHeight(20);
    obj.label186:setText("NOME");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout186);
    obj.label187:setLeft(150);
    obj.label187:setTop(5);
    obj.label187:setWidth(150);
    obj.label187:setHeight(20);
    obj.label187:setText("NOTAS");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout186);
    obj.label188:setLeft(300);
    obj.label188:setTop(5);
    obj.label188:setWidth(50);
    obj.label188:setHeight(20);
    obj.label188:setText("ACO");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout186);
    obj.label189:setLeft(350);
    obj.label189:setTop(5);
    obj.label189:setWidth(50);
    obj.label189:setHeight(20);
    obj.label189:setText("P+F");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.scrollBox9 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.layout185);
    obj.scrollBox9:setLeft(0);
    obj.scrollBox9:setTop(50);
    obj.scrollBox9:setWidth(425);
    obj.scrollBox9:setHeight(150);
    obj.scrollBox9:setName("scrollBox9");

    obj.layout187 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.scrollBox9);
    obj.layout187:setLeft(5);
    obj.layout187:setTop(0);
    obj.layout187:setWidth(400);
    obj.layout187:setHeight(25);
    obj.layout187:setName("layout187");

    obj.edit410 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout187);
    obj.edit410:setLeft(0);
    obj.edit410:setTop(0);
    obj.edit410:setWidth(150);
    obj.edit410:setHeight(25);
    obj.edit410:setField("atqC_1");
    obj.edit410:setHorzTextAlign("center");
    obj.edit410:setName("edit410");

    obj.edit411 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout187);
    obj.edit411:setLeft(150);
    obj.edit411:setTop(0);
    obj.edit411:setWidth(150);
    obj.edit411:setHeight(25);
    obj.edit411:setField("atqC_notas_1");
    obj.edit411:setHorzTextAlign("center");
    obj.edit411:setName("edit411");

    obj.edit412 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout187);
    obj.edit412:setLeft(300);
    obj.edit412:setTop(0);
    obj.edit412:setWidth(50);
    obj.edit412:setHeight(25);
    obj.edit412:setField("atqC_aco_1");
    obj.edit412:setHorzTextAlign("center");
    obj.edit412:setName("edit412");

    obj.edit413 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout187);
    obj.edit413:setLeft(350);
    obj.edit413:setTop(0);
    obj.edit413:setWidth(50);
    obj.edit413:setHeight(25);
    obj.edit413:setField("atqC_pf_1");
    obj.edit413:setHorzTextAlign("center");
    obj.edit413:setName("edit413");

    obj.layout188 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.scrollBox9);
    obj.layout188:setLeft(5);
    obj.layout188:setTop(25);
    obj.layout188:setWidth(400);
    obj.layout188:setHeight(25);
    obj.layout188:setName("layout188");

    obj.edit414 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout188);
    obj.edit414:setLeft(0);
    obj.edit414:setTop(0);
    obj.edit414:setWidth(150);
    obj.edit414:setHeight(25);
    obj.edit414:setField("atqC_2");
    obj.edit414:setHorzTextAlign("center");
    obj.edit414:setName("edit414");

    obj.edit415 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout188);
    obj.edit415:setLeft(150);
    obj.edit415:setTop(0);
    obj.edit415:setWidth(150);
    obj.edit415:setHeight(25);
    obj.edit415:setField("atqC_notas_2");
    obj.edit415:setHorzTextAlign("center");
    obj.edit415:setName("edit415");

    obj.edit416 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout188);
    obj.edit416:setLeft(300);
    obj.edit416:setTop(0);
    obj.edit416:setWidth(50);
    obj.edit416:setHeight(25);
    obj.edit416:setField("atqC_aco_2");
    obj.edit416:setHorzTextAlign("center");
    obj.edit416:setName("edit416");

    obj.edit417 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout188);
    obj.edit417:setLeft(350);
    obj.edit417:setTop(0);
    obj.edit417:setWidth(50);
    obj.edit417:setHeight(25);
    obj.edit417:setField("atqC_pf_2");
    obj.edit417:setHorzTextAlign("center");
    obj.edit417:setName("edit417");

    obj.layout189 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.scrollBox9);
    obj.layout189:setLeft(5);
    obj.layout189:setTop(50);
    obj.layout189:setWidth(400);
    obj.layout189:setHeight(25);
    obj.layout189:setName("layout189");

    obj.edit418 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout189);
    obj.edit418:setLeft(0);
    obj.edit418:setTop(0);
    obj.edit418:setWidth(150);
    obj.edit418:setHeight(25);
    obj.edit418:setField("atqC_3");
    obj.edit418:setHorzTextAlign("center");
    obj.edit418:setName("edit418");

    obj.edit419 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout189);
    obj.edit419:setLeft(150);
    obj.edit419:setTop(0);
    obj.edit419:setWidth(150);
    obj.edit419:setHeight(25);
    obj.edit419:setField("atqC_notas_3");
    obj.edit419:setHorzTextAlign("center");
    obj.edit419:setName("edit419");

    obj.edit420 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout189);
    obj.edit420:setLeft(300);
    obj.edit420:setTop(0);
    obj.edit420:setWidth(50);
    obj.edit420:setHeight(25);
    obj.edit420:setField("atqC_aco_3");
    obj.edit420:setHorzTextAlign("center");
    obj.edit420:setName("edit420");

    obj.edit421 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout189);
    obj.edit421:setLeft(350);
    obj.edit421:setTop(0);
    obj.edit421:setWidth(50);
    obj.edit421:setHeight(25);
    obj.edit421:setField("atqC_pf_3");
    obj.edit421:setHorzTextAlign("center");
    obj.edit421:setName("edit421");

    obj.layout190 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.scrollBox9);
    obj.layout190:setLeft(5);
    obj.layout190:setTop(75);
    obj.layout190:setWidth(400);
    obj.layout190:setHeight(25);
    obj.layout190:setName("layout190");

    obj.edit422 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout190);
    obj.edit422:setLeft(0);
    obj.edit422:setTop(0);
    obj.edit422:setWidth(150);
    obj.edit422:setHeight(25);
    obj.edit422:setField("atqC_4");
    obj.edit422:setHorzTextAlign("center");
    obj.edit422:setName("edit422");

    obj.edit423 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout190);
    obj.edit423:setLeft(150);
    obj.edit423:setTop(0);
    obj.edit423:setWidth(150);
    obj.edit423:setHeight(25);
    obj.edit423:setField("atqC_notas_4");
    obj.edit423:setHorzTextAlign("center");
    obj.edit423:setName("edit423");

    obj.edit424 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout190);
    obj.edit424:setLeft(300);
    obj.edit424:setTop(0);
    obj.edit424:setWidth(50);
    obj.edit424:setHeight(25);
    obj.edit424:setField("atqC_aco_4");
    obj.edit424:setHorzTextAlign("center");
    obj.edit424:setName("edit424");

    obj.edit425 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout190);
    obj.edit425:setLeft(350);
    obj.edit425:setTop(0);
    obj.edit425:setWidth(50);
    obj.edit425:setHeight(25);
    obj.edit425:setField("atqC_pf_4");
    obj.edit425:setHorzTextAlign("center");
    obj.edit425:setName("edit425");

    obj.layout191 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.scrollBox9);
    obj.layout191:setLeft(5);
    obj.layout191:setTop(100);
    obj.layout191:setWidth(400);
    obj.layout191:setHeight(25);
    obj.layout191:setName("layout191");

    obj.edit426 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout191);
    obj.edit426:setLeft(0);
    obj.edit426:setTop(0);
    obj.edit426:setWidth(150);
    obj.edit426:setHeight(25);
    obj.edit426:setField("atqC_5");
    obj.edit426:setHorzTextAlign("center");
    obj.edit426:setName("edit426");

    obj.edit427 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout191);
    obj.edit427:setLeft(150);
    obj.edit427:setTop(0);
    obj.edit427:setWidth(150);
    obj.edit427:setHeight(25);
    obj.edit427:setField("atqC_notas_5");
    obj.edit427:setHorzTextAlign("center");
    obj.edit427:setName("edit427");

    obj.edit428 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout191);
    obj.edit428:setLeft(300);
    obj.edit428:setTop(0);
    obj.edit428:setWidth(50);
    obj.edit428:setHeight(25);
    obj.edit428:setField("atqC_aco_5");
    obj.edit428:setHorzTextAlign("center");
    obj.edit428:setName("edit428");

    obj.edit429 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout191);
    obj.edit429:setLeft(350);
    obj.edit429:setTop(0);
    obj.edit429:setWidth(50);
    obj.edit429:setHeight(25);
    obj.edit429:setField("atqC_pf_5");
    obj.edit429:setHorzTextAlign("center");
    obj.edit429:setName("edit429");

    obj.layout192 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.scrollBox9);
    obj.layout192:setLeft(5);
    obj.layout192:setTop(125);
    obj.layout192:setWidth(400);
    obj.layout192:setHeight(25);
    obj.layout192:setName("layout192");

    obj.edit430 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout192);
    obj.edit430:setLeft(0);
    obj.edit430:setTop(0);
    obj.edit430:setWidth(150);
    obj.edit430:setHeight(25);
    obj.edit430:setField("atqC_6");
    obj.edit430:setHorzTextAlign("center");
    obj.edit430:setName("edit430");

    obj.edit431 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout192);
    obj.edit431:setLeft(150);
    obj.edit431:setTop(0);
    obj.edit431:setWidth(150);
    obj.edit431:setHeight(25);
    obj.edit431:setField("atqC_notas_6");
    obj.edit431:setHorzTextAlign("center");
    obj.edit431:setName("edit431");

    obj.edit432 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout192);
    obj.edit432:setLeft(300);
    obj.edit432:setTop(0);
    obj.edit432:setWidth(50);
    obj.edit432:setHeight(25);
    obj.edit432:setField("atqC_aco_6");
    obj.edit432:setHorzTextAlign("center");
    obj.edit432:setName("edit432");

    obj.edit433 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout192);
    obj.edit433:setLeft(350);
    obj.edit433:setTop(0);
    obj.edit433:setWidth(50);
    obj.edit433:setHeight(25);
    obj.edit433:setField("atqC_pf_6");
    obj.edit433:setHorzTextAlign("center");
    obj.edit433:setName("edit433");

    obj.layout193 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.scrollBox9);
    obj.layout193:setLeft(5);
    obj.layout193:setTop(150);
    obj.layout193:setWidth(400);
    obj.layout193:setHeight(25);
    obj.layout193:setName("layout193");

    obj.edit434 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout193);
    obj.edit434:setLeft(0);
    obj.edit434:setTop(0);
    obj.edit434:setWidth(150);
    obj.edit434:setHeight(25);
    obj.edit434:setField("atqC_7");
    obj.edit434:setHorzTextAlign("center");
    obj.edit434:setName("edit434");

    obj.edit435 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout193);
    obj.edit435:setLeft(150);
    obj.edit435:setTop(0);
    obj.edit435:setWidth(150);
    obj.edit435:setHeight(25);
    obj.edit435:setField("atqC_notas_7");
    obj.edit435:setHorzTextAlign("center");
    obj.edit435:setName("edit435");

    obj.edit436 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout193);
    obj.edit436:setLeft(300);
    obj.edit436:setTop(0);
    obj.edit436:setWidth(50);
    obj.edit436:setHeight(25);
    obj.edit436:setField("atqC_aco_7");
    obj.edit436:setHorzTextAlign("center");
    obj.edit436:setName("edit436");

    obj.edit437 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout193);
    obj.edit437:setLeft(350);
    obj.edit437:setTop(0);
    obj.edit437:setWidth(50);
    obj.edit437:setHeight(25);
    obj.edit437:setField("atqC_pf_7");
    obj.edit437:setHorzTextAlign("center");
    obj.edit437:setName("edit437");

    obj.layout194 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.scrollBox9);
    obj.layout194:setLeft(5);
    obj.layout194:setTop(175);
    obj.layout194:setWidth(400);
    obj.layout194:setHeight(25);
    obj.layout194:setName("layout194");

    obj.edit438 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout194);
    obj.edit438:setLeft(0);
    obj.edit438:setTop(0);
    obj.edit438:setWidth(150);
    obj.edit438:setHeight(25);
    obj.edit438:setField("atqC_8");
    obj.edit438:setHorzTextAlign("center");
    obj.edit438:setName("edit438");

    obj.edit439 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout194);
    obj.edit439:setLeft(150);
    obj.edit439:setTop(0);
    obj.edit439:setWidth(150);
    obj.edit439:setHeight(25);
    obj.edit439:setField("atqC_notas_8");
    obj.edit439:setHorzTextAlign("center");
    obj.edit439:setName("edit439");

    obj.edit440 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout194);
    obj.edit440:setLeft(300);
    obj.edit440:setTop(0);
    obj.edit440:setWidth(50);
    obj.edit440:setHeight(25);
    obj.edit440:setField("atqC_aco_8");
    obj.edit440:setHorzTextAlign("center");
    obj.edit440:setName("edit440");

    obj.edit441 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout194);
    obj.edit441:setLeft(350);
    obj.edit441:setTop(0);
    obj.edit441:setWidth(50);
    obj.edit441:setHeight(25);
    obj.edit441:setField("atqC_pf_8");
    obj.edit441:setHorzTextAlign("center");
    obj.edit441:setName("edit441");

    obj.layout195 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.scrollBox9);
    obj.layout195:setLeft(5);
    obj.layout195:setTop(200);
    obj.layout195:setWidth(400);
    obj.layout195:setHeight(25);
    obj.layout195:setName("layout195");

    obj.edit442 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout195);
    obj.edit442:setLeft(0);
    obj.edit442:setTop(0);
    obj.edit442:setWidth(150);
    obj.edit442:setHeight(25);
    obj.edit442:setField("atqC_9");
    obj.edit442:setHorzTextAlign("center");
    obj.edit442:setName("edit442");

    obj.edit443 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout195);
    obj.edit443:setLeft(150);
    obj.edit443:setTop(0);
    obj.edit443:setWidth(150);
    obj.edit443:setHeight(25);
    obj.edit443:setField("atqC_notas_9");
    obj.edit443:setHorzTextAlign("center");
    obj.edit443:setName("edit443");

    obj.edit444 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout195);
    obj.edit444:setLeft(300);
    obj.edit444:setTop(0);
    obj.edit444:setWidth(50);
    obj.edit444:setHeight(25);
    obj.edit444:setField("atqC_aco_9");
    obj.edit444:setHorzTextAlign("center");
    obj.edit444:setName("edit444");

    obj.edit445 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit445:setParent(obj.layout195);
    obj.edit445:setLeft(350);
    obj.edit445:setTop(0);
    obj.edit445:setWidth(50);
    obj.edit445:setHeight(25);
    obj.edit445:setField("atqC_pf_9");
    obj.edit445:setHorzTextAlign("center");
    obj.edit445:setName("edit445");

    obj.layout196 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.scrollBox9);
    obj.layout196:setLeft(5);
    obj.layout196:setTop(225);
    obj.layout196:setWidth(400);
    obj.layout196:setHeight(25);
    obj.layout196:setName("layout196");

    obj.edit446 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit446:setParent(obj.layout196);
    obj.edit446:setLeft(0);
    obj.edit446:setTop(0);
    obj.edit446:setWidth(150);
    obj.edit446:setHeight(25);
    obj.edit446:setField("atqC_10");
    obj.edit446:setHorzTextAlign("center");
    obj.edit446:setName("edit446");

    obj.edit447 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit447:setParent(obj.layout196);
    obj.edit447:setLeft(150);
    obj.edit447:setTop(0);
    obj.edit447:setWidth(150);
    obj.edit447:setHeight(25);
    obj.edit447:setField("atqC_notas_10");
    obj.edit447:setHorzTextAlign("center");
    obj.edit447:setName("edit447");

    obj.edit448 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit448:setParent(obj.layout196);
    obj.edit448:setLeft(300);
    obj.edit448:setTop(0);
    obj.edit448:setWidth(50);
    obj.edit448:setHeight(25);
    obj.edit448:setField("atqC_aco_10");
    obj.edit448:setHorzTextAlign("center");
    obj.edit448:setName("edit448");

    obj.edit449 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit449:setParent(obj.layout196);
    obj.edit449:setLeft(350);
    obj.edit449:setTop(0);
    obj.edit449:setWidth(50);
    obj.edit449:setHeight(25);
    obj.edit449:setField("atqC_pf_10");
    obj.edit449:setHorzTextAlign("center");
    obj.edit449:setName("edit449");

    obj.layout197 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.scrollBox7);
    obj.layout197:setLeft(320);
    obj.layout197:setTop(215);
    obj.layout197:setWidth(310);
    obj.layout197:setHeight(80);
    obj.layout197:setName("layout197");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout197);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(5);
    obj.rectangle53:setYradius(5);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout197);
    obj.label190:setLeft(0);
    obj.label190:setTop(0);
    obj.label190:setWidth(310);
    obj.label190:setHeight(20);
    obj.label190:setText("DEFESA");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.layout198 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.layout197);
    obj.layout198:setLeft(5);
    obj.layout198:setTop(25);
    obj.layout198:setWidth(50);
    obj.layout198:setHeight(50);
    obj.layout198:setName("layout198");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout198);
    obj.label191:setLeft(0);
    obj.label191:setTop(5);
    obj.label191:setWidth(50);
    obj.label191:setHeight(20);
    obj.label191:setText("VEL");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.edit450 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit450:setParent(obj.layout198);
    obj.edit450:setLeft(0);
    obj.edit450:setTop(25);
    obj.edit450:setWidth(50);
    obj.edit450:setHeight(25);
    obj.edit450:setField("sj_atr_vel");
    obj.edit450:setHorzTextAlign("center");
    obj.edit450:setName("edit450");

    obj.layout199 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.layout197);
    obj.layout199:setLeft(55);
    obj.layout199:setTop(25);
    obj.layout199:setWidth(50);
    obj.layout199:setHeight(50);
    obj.layout199:setName("layout199");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout199);
    obj.label192:setLeft(0);
    obj.label192:setTop(5);
    obj.label192:setWidth(50);
    obj.label192:setHeight(20);
    obj.label192:setText("AGI");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.edit451 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit451:setParent(obj.layout199);
    obj.edit451:setLeft(0);
    obj.edit451:setTop(25);
    obj.edit451:setWidth(50);
    obj.edit451:setHeight(25);
    obj.edit451:setField("sj_atr_agi");
    obj.edit451:setHorzTextAlign("center");
    obj.edit451:setName("edit451");

    obj.layout200 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.layout197);
    obj.layout200:setLeft(105);
    obj.layout200:setTop(25);
    obj.layout200:setWidth(50);
    obj.layout200:setHeight(50);
    obj.layout200:setName("layout200");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout200);
    obj.label193:setLeft(0);
    obj.label193:setTop(5);
    obj.label193:setWidth(50);
    obj.label193:setHeight(20);
    obj.label193:setText("PER");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.edit452 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit452:setParent(obj.layout200);
    obj.edit452:setLeft(0);
    obj.edit452:setTop(25);
    obj.edit452:setWidth(50);
    obj.edit452:setHeight(25);
    obj.edit452:setField("sj_atr_per");
    obj.edit452:setHorzTextAlign("center");
    obj.edit452:setName("edit452");

    obj.layout201 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.layout197);
    obj.layout201:setLeft(155);
    obj.layout201:setTop(25);
    obj.layout201:setWidth(50);
    obj.layout201:setHeight(50);
    obj.layout201:setName("layout201");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout201);
    obj.label194:setLeft(0);
    obj.label194:setTop(5);
    obj.label194:setWidth(50);
    obj.label194:setHeight(20);
    obj.label194:setText("EQUIP");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.edit453 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit453:setParent(obj.layout201);
    obj.edit453:setLeft(0);
    obj.edit453:setTop(25);
    obj.edit453:setWidth(50);
    obj.edit453:setHeight(25);
    obj.edit453:setField("sj_atr_equip");
    obj.edit453:setHorzTextAlign("center");
    obj.edit453:setName("edit453");

    obj.layout202 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.layout197);
    obj.layout202:setLeft(205);
    obj.layout202:setTop(25);
    obj.layout202:setWidth(50);
    obj.layout202:setHeight(50);
    obj.layout202:setName("layout202");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout202);
    obj.label195:setLeft(0);
    obj.label195:setTop(5);
    obj.label195:setWidth(50);
    obj.label195:setHeight(20);
    obj.label195:setText("OUTRO");
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.edit454 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit454:setParent(obj.layout202);
    obj.edit454:setLeft(0);
    obj.edit454:setTop(25);
    obj.edit454:setWidth(50);
    obj.edit454:setHeight(25);
    obj.edit454:setField("sj_atr_out_def");
    obj.edit454:setHorzTextAlign("center");
    obj.edit454:setName("edit454");

    obj.layout203 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.layout197);
    obj.layout203:setLeft(255);
    obj.layout203:setTop(25);
    obj.layout203:setWidth(50);
    obj.layout203:setHeight(50);
    obj.layout203:setName("layout203");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout203);
    obj.label196:setLeft(0);
    obj.label196:setTop(5);
    obj.label196:setWidth(50);
    obj.label196:setHeight(20);
    obj.label196:setText("TOTAL");
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout203);
    obj.rectangle54:setLeft(0);
    obj.rectangle54:setTop(25);
    obj.rectangle54:setWidth(50);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout203);
    obj.label197:setLeft(0);
    obj.label197:setTop(25);
    obj.label197:setWidth(50);
    obj.label197:setHeight(25);
    obj.label197:setField("sj_defesa_total");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout197);
    obj.dataLink41:setFields({'sj_atr_vel', 'sj_atr_agi', 'sj_atr_per', 'sj_atr_equip', 'sj_atr_out_def'});
    obj.dataLink41:setName("dataLink41");

    obj.layout204 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.scrollBox7);
    obj.layout204:setLeft(320);
    obj.layout204:setTop(300);
    obj.layout204:setWidth(310);
    obj.layout204:setHeight(80);
    obj.layout204:setName("layout204");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout204);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setColor("black");
    obj.rectangle55:setXradius(5);
    obj.rectangle55:setYradius(5);
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setName("rectangle55");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout204);
    obj.label198:setLeft(0);
    obj.label198:setTop(0);
    obj.label198:setWidth(310);
    obj.label198:setHeight(20);
    obj.label198:setText("ARMADURA");
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.layout205 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.layout204);
    obj.layout205:setLeft(30);
    obj.layout205:setTop(25);
    obj.layout205:setWidth(50);
    obj.layout205:setHeight(50);
    obj.layout205:setName("layout205");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout205);
    obj.label199:setLeft(0);
    obj.label199:setTop(5);
    obj.label199:setWidth(50);
    obj.label199:setHeight(20);
    obj.label199:setText("FIS");
    obj.label199:setHorzTextAlign("center");
    obj.label199:setName("label199");

    obj.edit455 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit455:setParent(obj.layout205);
    obj.edit455:setLeft(0);
    obj.edit455:setTop(25);
    obj.edit455:setWidth(50);
    obj.edit455:setHeight(25);
    obj.edit455:setField("sj_atr_fis");
    obj.edit455:setHorzTextAlign("center");
    obj.edit455:setName("edit455");

    obj.layout206 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.layout204);
    obj.layout206:setLeft(80);
    obj.layout206:setTop(25);
    obj.layout206:setWidth(50);
    obj.layout206:setHeight(50);
    obj.layout206:setName("layout206");

    obj.label200 = gui.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout206);
    obj.label200:setLeft(0);
    obj.label200:setTop(5);
    obj.label200:setWidth(50);
    obj.label200:setHeight(20);
    obj.label200:setText("ARM");
    obj.label200:setHorzTextAlign("center");
    obj.label200:setName("label200");

    obj.edit456 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit456:setParent(obj.layout206);
    obj.edit456:setLeft(0);
    obj.edit456:setTop(25);
    obj.edit456:setWidth(50);
    obj.edit456:setHeight(25);
    obj.edit456:setField("sj_atr_arm");
    obj.edit456:setHorzTextAlign("center");
    obj.edit456:setName("edit456");

    obj.layout207 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.layout204);
    obj.layout207:setLeft(130);
    obj.layout207:setTop(25);
    obj.layout207:setWidth(50);
    obj.layout207:setHeight(50);
    obj.layout207:setName("layout207");

    obj.label201 = gui.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout207);
    obj.label201:setLeft(0);
    obj.label201:setTop(5);
    obj.label201:setWidth(50);
    obj.label201:setHeight(20);
    obj.label201:setText("ESC");
    obj.label201:setHorzTextAlign("center");
    obj.label201:setName("label201");

    obj.edit457 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit457:setParent(obj.layout207);
    obj.edit457:setLeft(0);
    obj.edit457:setTop(25);
    obj.edit457:setWidth(50);
    obj.edit457:setHeight(25);
    obj.edit457:setField("sj_atr_esc");
    obj.edit457:setHorzTextAlign("center");
    obj.edit457:setName("edit457");

    obj.layout208 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.layout204);
    obj.layout208:setLeft(180);
    obj.layout208:setTop(25);
    obj.layout208:setWidth(50);
    obj.layout208:setHeight(50);
    obj.layout208:setName("layout208");

    obj.label202 = gui.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout208);
    obj.label202:setLeft(0);
    obj.label202:setTop(5);
    obj.label202:setWidth(50);
    obj.label202:setHeight(20);
    obj.label202:setText("OUTRO");
    obj.label202:setHorzTextAlign("center");
    obj.label202:setName("label202");

    obj.edit458 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit458:setParent(obj.layout208);
    obj.edit458:setLeft(0);
    obj.edit458:setTop(25);
    obj.edit458:setWidth(50);
    obj.edit458:setHeight(25);
    obj.edit458:setField("sj_atr_out_arm");
    obj.edit458:setHorzTextAlign("center");
    obj.edit458:setName("edit458");

    obj.layout209 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.layout204);
    obj.layout209:setLeft(230);
    obj.layout209:setTop(25);
    obj.layout209:setWidth(50);
    obj.layout209:setHeight(50);
    obj.layout209:setName("layout209");

    obj.label203 = gui.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout209);
    obj.label203:setLeft(0);
    obj.label203:setTop(5);
    obj.label203:setWidth(50);
    obj.label203:setHeight(20);
    obj.label203:setText("TOTAL");
    obj.label203:setHorzTextAlign("center");
    obj.label203:setName("label203");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout209);
    obj.rectangle56:setLeft(0);
    obj.rectangle56:setTop(25);
    obj.rectangle56:setWidth(50);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label204 = gui.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout209);
    obj.label204:setLeft(0);
    obj.label204:setTop(25);
    obj.label204:setWidth(50);
    obj.label204:setHeight(25);
    obj.label204:setField("sj_armadura_total");
    obj.label204:setHorzTextAlign("center");
    obj.label204:setName("label204");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout204);
    obj.dataLink42:setFields({'sj_atr_fis', 'sj_atr_arm', 'sj_atr_esc', 'sj_atr_out_arm'});
    obj.dataLink42:setName("dataLink42");

    obj.layout210 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.scrollBox7);
    obj.layout210:setLeft(635);
    obj.layout210:setTop(215);
    obj.layout210:setWidth(410);
    obj.layout210:setHeight(180);
    obj.layout210:setName("layout210");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout210);
    obj.rectangle57:setAlign("client");
    obj.rectangle57:setColor("black");
    obj.rectangle57:setXradius(5);
    obj.rectangle57:setYradius(5);
    obj.rectangle57:setCornerType("round");
    obj.rectangle57:setName("rectangle57");

    obj.label205 = gui.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout210);
    obj.label205:setLeft(5);
    obj.label205:setTop(0);
    obj.label205:setWidth(400);
    obj.label205:setHeight(20);
    obj.label205:setText("DANO CATASTROFICO");
    obj.label205:setHorzTextAlign("center");
    obj.label205:setName("label205");

    obj.layout211 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.layout210);
    obj.layout211:setLeft(5);
    obj.layout211:setTop(25);
    obj.layout211:setWidth(500);
    obj.layout211:setHeight(25);
    obj.layout211:setName("layout211");

    obj.label206 = gui.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout211);
    obj.label206:setLeft(0);
    obj.label206:setTop(5);
    obj.label206:setWidth(100);
    obj.label206:setHeight(20);
    obj.label206:setText("DANO");
    obj.label206:setHorzTextAlign("center");
    obj.label206:setName("label206");

    obj.label207 = gui.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout211);
    obj.label207:setLeft(100);
    obj.label207:setTop(5);
    obj.label207:setWidth(300);
    obj.label207:setHeight(20);
    obj.label207:setText("DESCRIÇÃO");
    obj.label207:setHorzTextAlign("center");
    obj.label207:setName("label207");

    obj.layout212 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.layout210);
    obj.layout212:setLeft(0);
    obj.layout212:setTop(50);
    obj.layout212:setWidth(500);
    obj.layout212:setHeight(555);
    obj.layout212:setName("layout212");

    obj.layout213 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.layout212);
    obj.layout213:setLeft(5);
    obj.layout213:setTop(0);
    obj.layout213:setWidth(500);
    obj.layout213:setHeight(25);
    obj.layout213:setName("layout213");

    obj.edit459 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit459:setParent(obj.layout213);
    obj.edit459:setLeft(0);
    obj.edit459:setTop(0);
    obj.edit459:setWidth(100);
    obj.edit459:setHeight(25);
    obj.edit459:setField("dano_1");
    obj.edit459:setHorzTextAlign("center");
    obj.edit459:setName("edit459");

    obj.edit460 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit460:setParent(obj.layout213);
    obj.edit460:setLeft(100);
    obj.edit460:setTop(0);
    obj.edit460:setWidth(300);
    obj.edit460:setHeight(25);
    obj.edit460:setField("dano_desc_1");
    obj.edit460:setHorzTextAlign("center");
    obj.edit460:setName("edit460");

    obj.layout214 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.layout212);
    obj.layout214:setLeft(5);
    obj.layout214:setTop(25);
    obj.layout214:setWidth(500);
    obj.layout214:setHeight(25);
    obj.layout214:setName("layout214");

    obj.edit461 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit461:setParent(obj.layout214);
    obj.edit461:setLeft(0);
    obj.edit461:setTop(0);
    obj.edit461:setWidth(100);
    obj.edit461:setHeight(25);
    obj.edit461:setField("dano_2");
    obj.edit461:setHorzTextAlign("center");
    obj.edit461:setName("edit461");

    obj.edit462 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit462:setParent(obj.layout214);
    obj.edit462:setLeft(100);
    obj.edit462:setTop(0);
    obj.edit462:setWidth(300);
    obj.edit462:setHeight(25);
    obj.edit462:setField("dano_desc_2");
    obj.edit462:setHorzTextAlign("center");
    obj.edit462:setName("edit462");

    obj.layout215 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.layout212);
    obj.layout215:setLeft(5);
    obj.layout215:setTop(50);
    obj.layout215:setWidth(500);
    obj.layout215:setHeight(25);
    obj.layout215:setName("layout215");

    obj.edit463 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit463:setParent(obj.layout215);
    obj.edit463:setLeft(0);
    obj.edit463:setTop(0);
    obj.edit463:setWidth(100);
    obj.edit463:setHeight(25);
    obj.edit463:setField("dano_3");
    obj.edit463:setHorzTextAlign("center");
    obj.edit463:setName("edit463");

    obj.edit464 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit464:setParent(obj.layout215);
    obj.edit464:setLeft(100);
    obj.edit464:setTop(0);
    obj.edit464:setWidth(300);
    obj.edit464:setHeight(25);
    obj.edit464:setField("dano_desc_3");
    obj.edit464:setHorzTextAlign("center");
    obj.edit464:setName("edit464");

    obj.layout216 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.layout212);
    obj.layout216:setLeft(5);
    obj.layout216:setTop(75);
    obj.layout216:setWidth(500);
    obj.layout216:setHeight(25);
    obj.layout216:setName("layout216");

    obj.edit465 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit465:setParent(obj.layout216);
    obj.edit465:setLeft(0);
    obj.edit465:setTop(0);
    obj.edit465:setWidth(100);
    obj.edit465:setHeight(25);
    obj.edit465:setField("dano_4");
    obj.edit465:setHorzTextAlign("center");
    obj.edit465:setName("edit465");

    obj.edit466 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit466:setParent(obj.layout216);
    obj.edit466:setLeft(100);
    obj.edit466:setTop(0);
    obj.edit466:setWidth(300);
    obj.edit466:setHeight(25);
    obj.edit466:setField("dano_desc_4");
    obj.edit466:setHorzTextAlign("center");
    obj.edit466:setName("edit466");

    obj.layout217 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.layout212);
    obj.layout217:setLeft(5);
    obj.layout217:setTop(100);
    obj.layout217:setWidth(500);
    obj.layout217:setHeight(25);
    obj.layout217:setName("layout217");

    obj.edit467 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit467:setParent(obj.layout217);
    obj.edit467:setLeft(0);
    obj.edit467:setTop(0);
    obj.edit467:setWidth(100);
    obj.edit467:setHeight(25);
    obj.edit467:setField("dano_5");
    obj.edit467:setHorzTextAlign("center");
    obj.edit467:setName("edit467");

    obj.edit468 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit468:setParent(obj.layout217);
    obj.edit468:setLeft(100);
    obj.edit468:setTop(0);
    obj.edit468:setWidth(300);
    obj.edit468:setHeight(25);
    obj.edit468:setField("dano_desc_5");
    obj.edit468:setHorzTextAlign("center");
    obj.edit468:setName("edit468");

    obj.layout218 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.scrollBox7);
    obj.layout218:setLeft(635);
    obj.layout218:setTop(400);
    obj.layout218:setWidth(410);
    obj.layout218:setHeight(180);
    obj.layout218:setName("layout218");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout218);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setColor("black");
    obj.rectangle58:setXradius(5);
    obj.rectangle58:setYradius(5);
    obj.rectangle58:setCornerType("round");
    obj.rectangle58:setName("rectangle58");

    obj.label208 = gui.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout218);
    obj.label208:setLeft(5);
    obj.label208:setTop(0);
    obj.label208:setWidth(400);
    obj.label208:setHeight(20);
    obj.label208:setText("MECANISMOS E APRIMORAMENTOS");
    obj.label208:setHorzTextAlign("center");
    obj.label208:setName("label208");

    obj.layout219 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.layout218);
    obj.layout219:setLeft(5);
    obj.layout219:setTop(25);
    obj.layout219:setWidth(500);
    obj.layout219:setHeight(25);
    obj.layout219:setName("layout219");

    obj.label209 = gui.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout219);
    obj.label209:setLeft(0);
    obj.label209:setTop(5);
    obj.label209:setWidth(100);
    obj.label209:setHeight(20);
    obj.label209:setText("NOME");
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.label210 = gui.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout219);
    obj.label210:setLeft(100);
    obj.label210:setTop(5);
    obj.label210:setWidth(300);
    obj.label210:setHeight(20);
    obj.label210:setText("DESCRIÇÃO");
    obj.label210:setHorzTextAlign("center");
    obj.label210:setName("label210");

    obj.scrollBox10 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.layout218);
    obj.scrollBox10:setLeft(0);
    obj.scrollBox10:setTop(50);
    obj.scrollBox10:setWidth(405);
    obj.scrollBox10:setHeight(125);
    obj.scrollBox10:setName("scrollBox10");

    obj.layout220 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.scrollBox10);
    obj.layout220:setLeft(5);
    obj.layout220:setTop(0);
    obj.layout220:setWidth(380);
    obj.layout220:setHeight(25);
    obj.layout220:setName("layout220");

    obj.edit469 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit469:setParent(obj.layout220);
    obj.edit469:setLeft(0);
    obj.edit469:setTop(0);
    obj.edit469:setWidth(100);
    obj.edit469:setHeight(25);
    obj.edit469:setField("meca_1");
    obj.edit469:setHorzTextAlign("center");
    obj.edit469:setName("edit469");

    obj.edit470 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit470:setParent(obj.layout220);
    obj.edit470:setLeft(100);
    obj.edit470:setTop(0);
    obj.edit470:setWidth(280);
    obj.edit470:setHeight(25);
    obj.edit470:setField("meca_desc_1");
    obj.edit470:setHorzTextAlign("center");
    obj.edit470:setName("edit470");

    obj.layout221 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.scrollBox10);
    obj.layout221:setLeft(5);
    obj.layout221:setTop(25);
    obj.layout221:setWidth(380);
    obj.layout221:setHeight(25);
    obj.layout221:setName("layout221");

    obj.edit471 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit471:setParent(obj.layout221);
    obj.edit471:setLeft(0);
    obj.edit471:setTop(0);
    obj.edit471:setWidth(100);
    obj.edit471:setHeight(25);
    obj.edit471:setField("meca_2");
    obj.edit471:setHorzTextAlign("center");
    obj.edit471:setName("edit471");

    obj.edit472 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit472:setParent(obj.layout221);
    obj.edit472:setLeft(100);
    obj.edit472:setTop(0);
    obj.edit472:setWidth(280);
    obj.edit472:setHeight(25);
    obj.edit472:setField("meca_desc_2");
    obj.edit472:setHorzTextAlign("center");
    obj.edit472:setName("edit472");

    obj.layout222 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.scrollBox10);
    obj.layout222:setLeft(5);
    obj.layout222:setTop(50);
    obj.layout222:setWidth(380);
    obj.layout222:setHeight(25);
    obj.layout222:setName("layout222");

    obj.edit473 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit473:setParent(obj.layout222);
    obj.edit473:setLeft(0);
    obj.edit473:setTop(0);
    obj.edit473:setWidth(100);
    obj.edit473:setHeight(25);
    obj.edit473:setField("meca_3");
    obj.edit473:setHorzTextAlign("center");
    obj.edit473:setName("edit473");

    obj.edit474 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit474:setParent(obj.layout222);
    obj.edit474:setLeft(100);
    obj.edit474:setTop(0);
    obj.edit474:setWidth(280);
    obj.edit474:setHeight(25);
    obj.edit474:setField("meca_desc_3");
    obj.edit474:setHorzTextAlign("center");
    obj.edit474:setName("edit474");

    obj.layout223 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.scrollBox10);
    obj.layout223:setLeft(5);
    obj.layout223:setTop(75);
    obj.layout223:setWidth(380);
    obj.layout223:setHeight(25);
    obj.layout223:setName("layout223");

    obj.edit475 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit475:setParent(obj.layout223);
    obj.edit475:setLeft(0);
    obj.edit475:setTop(0);
    obj.edit475:setWidth(100);
    obj.edit475:setHeight(25);
    obj.edit475:setField("meca_4");
    obj.edit475:setHorzTextAlign("center");
    obj.edit475:setName("edit475");

    obj.edit476 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit476:setParent(obj.layout223);
    obj.edit476:setLeft(100);
    obj.edit476:setTop(0);
    obj.edit476:setWidth(280);
    obj.edit476:setHeight(25);
    obj.edit476:setField("meca_desc_4");
    obj.edit476:setHorzTextAlign("center");
    obj.edit476:setName("edit476");

    obj.layout224 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.scrollBox10);
    obj.layout224:setLeft(5);
    obj.layout224:setTop(100);
    obj.layout224:setWidth(380);
    obj.layout224:setHeight(25);
    obj.layout224:setName("layout224");

    obj.edit477 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit477:setParent(obj.layout224);
    obj.edit477:setLeft(0);
    obj.edit477:setTop(0);
    obj.edit477:setWidth(100);
    obj.edit477:setHeight(25);
    obj.edit477:setField("meca_5");
    obj.edit477:setHorzTextAlign("center");
    obj.edit477:setName("edit477");

    obj.edit478 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit478:setParent(obj.layout224);
    obj.edit478:setLeft(100);
    obj.edit478:setTop(0);
    obj.edit478:setWidth(280);
    obj.edit478:setHeight(25);
    obj.edit478:setField("meca_desc_5");
    obj.edit478:setHorzTextAlign("center");
    obj.edit478:setName("edit478");

    obj.layout225 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.scrollBox10);
    obj.layout225:setLeft(5);
    obj.layout225:setTop(125);
    obj.layout225:setWidth(380);
    obj.layout225:setHeight(25);
    obj.layout225:setName("layout225");

    obj.edit479 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit479:setParent(obj.layout225);
    obj.edit479:setLeft(0);
    obj.edit479:setTop(0);
    obj.edit479:setWidth(100);
    obj.edit479:setHeight(25);
    obj.edit479:setField("meca_6");
    obj.edit479:setHorzTextAlign("center");
    obj.edit479:setName("edit479");

    obj.edit480 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit480:setParent(obj.layout225);
    obj.edit480:setLeft(100);
    obj.edit480:setTop(0);
    obj.edit480:setWidth(280);
    obj.edit480:setHeight(25);
    obj.edit480:setField("meca_desc_6");
    obj.edit480:setHorzTextAlign("center");
    obj.edit480:setName("edit480");

    obj.layout226 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout226:setParent(obj.scrollBox10);
    obj.layout226:setLeft(5);
    obj.layout226:setTop(150);
    obj.layout226:setWidth(380);
    obj.layout226:setHeight(25);
    obj.layout226:setName("layout226");

    obj.edit481 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit481:setParent(obj.layout226);
    obj.edit481:setLeft(0);
    obj.edit481:setTop(0);
    obj.edit481:setWidth(100);
    obj.edit481:setHeight(25);
    obj.edit481:setField("meca_7");
    obj.edit481:setHorzTextAlign("center");
    obj.edit481:setName("edit481");

    obj.edit482 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit482:setParent(obj.layout226);
    obj.edit482:setLeft(100);
    obj.edit482:setTop(0);
    obj.edit482:setWidth(280);
    obj.edit482:setHeight(25);
    obj.edit482:setField("meca_desc_7");
    obj.edit482:setHorzTextAlign("center");
    obj.edit482:setName("edit482");

    obj.layout227 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout227:setParent(obj.scrollBox10);
    obj.layout227:setLeft(5);
    obj.layout227:setTop(175);
    obj.layout227:setWidth(380);
    obj.layout227:setHeight(25);
    obj.layout227:setName("layout227");

    obj.edit483 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit483:setParent(obj.layout227);
    obj.edit483:setLeft(0);
    obj.edit483:setTop(0);
    obj.edit483:setWidth(100);
    obj.edit483:setHeight(25);
    obj.edit483:setField("meca_8");
    obj.edit483:setHorzTextAlign("center");
    obj.edit483:setName("edit483");

    obj.edit484 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit484:setParent(obj.layout227);
    obj.edit484:setLeft(100);
    obj.edit484:setTop(0);
    obj.edit484:setWidth(280);
    obj.edit484:setHeight(25);
    obj.edit484:setField("meca_desc_8");
    obj.edit484:setHorzTextAlign("center");
    obj.edit484:setName("edit484");

    obj.layout228 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout228:setParent(obj.scrollBox10);
    obj.layout228:setLeft(5);
    obj.layout228:setTop(200);
    obj.layout228:setWidth(380);
    obj.layout228:setHeight(25);
    obj.layout228:setName("layout228");

    obj.edit485 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit485:setParent(obj.layout228);
    obj.edit485:setLeft(0);
    obj.edit485:setTop(0);
    obj.edit485:setWidth(100);
    obj.edit485:setHeight(25);
    obj.edit485:setField("meca_9");
    obj.edit485:setHorzTextAlign("center");
    obj.edit485:setName("edit485");

    obj.edit486 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit486:setParent(obj.layout228);
    obj.edit486:setLeft(100);
    obj.edit486:setTop(0);
    obj.edit486:setWidth(280);
    obj.edit486:setHeight(25);
    obj.edit486:setField("meca_desc_9");
    obj.edit486:setHorzTextAlign("center");
    obj.edit486:setName("edit486");

    obj.layout229 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout229:setParent(obj.scrollBox10);
    obj.layout229:setLeft(5);
    obj.layout229:setTop(225);
    obj.layout229:setWidth(380);
    obj.layout229:setHeight(25);
    obj.layout229:setName("layout229");

    obj.edit487 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit487:setParent(obj.layout229);
    obj.edit487:setLeft(0);
    obj.edit487:setTop(0);
    obj.edit487:setWidth(100);
    obj.edit487:setHeight(25);
    obj.edit487:setField("meca_10");
    obj.edit487:setHorzTextAlign("center");
    obj.edit487:setName("edit487");

    obj.edit488 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit488:setParent(obj.layout229);
    obj.edit488:setLeft(100);
    obj.edit488:setTop(0);
    obj.edit488:setWidth(280);
    obj.edit488:setHeight(25);
    obj.edit488:setField("meca_desc_10");
    obj.edit488:setHorzTextAlign("center");
    obj.edit488:setName("edit488");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.scrollBox7);
    obj.rectangle59:setLeft(1050);
    obj.rectangle59:setTop(215);
    obj.rectangle59:setWidth(252);
    obj.rectangle59:setHeight(252);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox7);
    obj.image6:setLeft(1050);
    obj.image6:setTop(216);
    obj.image6:setWidth(250);
    obj.image6:setHeight(250);
    obj.image6:setField("steamjack");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setName("image6");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox7);
    obj.image7:setAlign("client");
    obj.image7:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image7:setStyle("autoFit");
    obj.image7:setName("image7");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.frmRDF6 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF6:setParent(obj.tab6);
    obj.frmRDF6:setName("frmRDF6");
    obj.frmRDF6:setAlign("client");
    obj.frmRDF6:setTheme("dark");

    obj.scrollBox11 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.frmRDF6);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.layout230 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout230:setParent(obj.scrollBox11);
    obj.layout230:setLeft(0);
    obj.layout230:setTop(0);
    obj.layout230:setWidth(960);
    obj.layout230:setHeight(70);
    obj.layout230:setName("layout230");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout230);
    obj.rectangle60:setLeft(5);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(950);
    obj.rectangle60:setHeight(70);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setXradius(5);
    obj.rectangle60:setYradius(5);
    obj.rectangle60:setCornerType("round");
    obj.rectangle60:setName("rectangle60");

    obj.layout231 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout231:setParent(obj.layout230);
    obj.layout231:setLeft(5);
    obj.layout231:setTop(5);
    obj.layout231:setWidth(310);
    obj.layout231:setHeight(25);
    obj.layout231:setName("layout231");

    obj.label211 = gui.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout231);
    obj.label211:setLeft(0);
    obj.label211:setTop(5);
    obj.label211:setWidth(100);
    obj.label211:setHeight(20);
    obj.label211:setText("Sexo");
    obj.label211:setHorzTextAlign("trailing");
    obj.label211:setName("label211");

    obj.edit489 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit489:setParent(obj.layout231);
    obj.edit489:setLeft(110);
    obj.edit489:setTop(0);
    obj.edit489:setWidth(200);
    obj.edit489:setHeight(25);
    obj.edit489:setField("desc_sexo");
    obj.edit489:setName("edit489");

    obj.layout232 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout232:setParent(obj.layout230);
    obj.layout232:setLeft(320);
    obj.layout232:setTop(5);
    obj.layout232:setWidth(310);
    obj.layout232:setHeight(25);
    obj.layout232:setName("layout232");

    obj.label212 = gui.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout232);
    obj.label212:setLeft(0);
    obj.label212:setTop(5);
    obj.label212:setWidth(100);
    obj.label212:setHeight(20);
    obj.label212:setText("Altura");
    obj.label212:setHorzTextAlign("trailing");
    obj.label212:setName("label212");

    obj.edit490 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit490:setParent(obj.layout232);
    obj.edit490:setLeft(110);
    obj.edit490:setTop(0);
    obj.edit490:setWidth(200);
    obj.edit490:setHeight(25);
    obj.edit490:setField("desc_altura");
    obj.edit490:setName("edit490");

    obj.layout233 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout233:setParent(obj.layout230);
    obj.layout233:setLeft(585);
    obj.layout233:setTop(5);
    obj.layout233:setWidth(310);
    obj.layout233:setHeight(25);
    obj.layout233:setName("layout233");

    obj.label213 = gui.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout233);
    obj.label213:setLeft(0);
    obj.label213:setTop(5);
    obj.label213:setWidth(100);
    obj.label213:setHeight(20);
    obj.label213:setText("Olhos");
    obj.label213:setHorzTextAlign("trailing");
    obj.label213:setName("label213");

    obj.edit491 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit491:setParent(obj.layout233);
    obj.edit491:setLeft(110);
    obj.edit491:setTop(0);
    obj.edit491:setWidth(200);
    obj.edit491:setHeight(25);
    obj.edit491:setField("desc_olhos");
    obj.edit491:setName("edit491");

    obj.layout234 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout234:setParent(obj.layout230);
    obj.layout234:setLeft(5);
    obj.layout234:setTop(35);
    obj.layout234:setWidth(310);
    obj.layout234:setHeight(25);
    obj.layout234:setName("layout234");

    obj.label214 = gui.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout234);
    obj.label214:setLeft(0);
    obj.label214:setTop(5);
    obj.label214:setWidth(100);
    obj.label214:setHeight(20);
    obj.label214:setText("Idade");
    obj.label214:setHorzTextAlign("trailing");
    obj.label214:setName("label214");

    obj.edit492 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit492:setParent(obj.layout234);
    obj.edit492:setLeft(110);
    obj.edit492:setTop(0);
    obj.edit492:setWidth(200);
    obj.edit492:setHeight(25);
    obj.edit492:setField("desc_idade");
    obj.edit492:setName("edit492");

    obj.layout235 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout235:setParent(obj.layout230);
    obj.layout235:setLeft(320);
    obj.layout235:setTop(35);
    obj.layout235:setWidth(310);
    obj.layout235:setHeight(25);
    obj.layout235:setName("layout235");

    obj.label215 = gui.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout235);
    obj.label215:setLeft(0);
    obj.label215:setTop(5);
    obj.label215:setWidth(100);
    obj.label215:setHeight(20);
    obj.label215:setText("Peso");
    obj.label215:setHorzTextAlign("trailing");
    obj.label215:setName("label215");

    obj.edit493 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit493:setParent(obj.layout235);
    obj.edit493:setLeft(110);
    obj.edit493:setTop(0);
    obj.edit493:setWidth(200);
    obj.edit493:setHeight(25);
    obj.edit493:setField("desc_peso");
    obj.edit493:setName("edit493");

    obj.layout236 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout236:setParent(obj.layout230);
    obj.layout236:setLeft(585);
    obj.layout236:setTop(35);
    obj.layout236:setWidth(310);
    obj.layout236:setHeight(25);
    obj.layout236:setName("layout236");

    obj.label216 = gui.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout236);
    obj.label216:setLeft(0);
    obj.label216:setTop(5);
    obj.label216:setWidth(100);
    obj.label216:setHeight(20);
    obj.label216:setText("Cabelo");
    obj.label216:setHorzTextAlign("trailing");
    obj.label216:setName("label216");

    obj.edit494 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit494:setParent(obj.layout236);
    obj.edit494:setLeft(110);
    obj.edit494:setTop(0);
    obj.edit494:setWidth(200);
    obj.edit494:setHeight(25);
    obj.edit494:setField("desc_cabelo");
    obj.edit494:setName("edit494");

    obj.layout237 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout237:setParent(obj.scrollBox11);
    obj.layout237:setLeft(0);
    obj.layout237:setTop(80);
    obj.layout237:setWidth(400);
    obj.layout237:setHeight(175);
    obj.layout237:setName("layout237");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout237);
    obj.rectangle61:setLeft(0);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(400);
    obj.rectangle61:setHeight(175);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setXradius(5);
    obj.rectangle61:setYradius(5);
    obj.rectangle61:setCornerType("round");
    obj.rectangle61:setName("rectangle61");

    obj.label217 = gui.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout237);
    obj.label217:setLeft(0);
    obj.label217:setTop(0);
    obj.label217:setWidth(400);
    obj.label217:setHeight(20);
    obj.label217:setText("Aparencia");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setName("label217");

    obj.textEditor13 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout237);
    obj.textEditor13:setLeft(10);
    obj.textEditor13:setTop(25);
    obj.textEditor13:setWidth(380);
    obj.textEditor13:setHeight(135);
    obj.textEditor13:setField("aparencia");
    obj.textEditor13:setName("textEditor13");

    obj.layout238 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout238:setParent(obj.scrollBox11);
    obj.layout238:setLeft(0);
    obj.layout238:setTop(260);
    obj.layout238:setWidth(400);
    obj.layout238:setHeight(175);
    obj.layout238:setName("layout238");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout238);
    obj.rectangle62:setLeft(0);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(400);
    obj.rectangle62:setHeight(175);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setXradius(5);
    obj.rectangle62:setYradius(5);
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setName("rectangle62");

    obj.label218 = gui.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout238);
    obj.label218:setLeft(0);
    obj.label218:setTop(0);
    obj.label218:setWidth(400);
    obj.label218:setHeight(20);
    obj.label218:setText("Personalidade");
    obj.label218:setHorzTextAlign("center");
    obj.label218:setName("label218");

    obj.textEditor14 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout238);
    obj.textEditor14:setLeft(10);
    obj.textEditor14:setTop(25);
    obj.textEditor14:setWidth(380);
    obj.textEditor14:setHeight(135);
    obj.textEditor14:setField("personalidade");
    obj.textEditor14:setName("textEditor14");

    obj.layout239 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout239:setParent(obj.scrollBox11);
    obj.layout239:setLeft(0);
    obj.layout239:setTop(440);
    obj.layout239:setWidth(400);
    obj.layout239:setHeight(175);
    obj.layout239:setName("layout239");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout239);
    obj.rectangle63:setLeft(0);
    obj.rectangle63:setTop(0);
    obj.rectangle63:setWidth(400);
    obj.rectangle63:setHeight(175);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setXradius(5);
    obj.rectangle63:setYradius(5);
    obj.rectangle63:setCornerType("round");
    obj.rectangle63:setName("rectangle63");

    obj.label219 = gui.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout239);
    obj.label219:setLeft(0);
    obj.label219:setTop(0);
    obj.label219:setWidth(400);
    obj.label219:setHeight(20);
    obj.label219:setText("Idiomas");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setName("label219");

    obj.textEditor15 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout239);
    obj.textEditor15:setLeft(10);
    obj.textEditor15:setTop(25);
    obj.textEditor15:setWidth(380);
    obj.textEditor15:setHeight(135);
    obj.textEditor15:setField("idiomas");
    obj.textEditor15:setName("textEditor15");

    obj.layout240 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout240:setParent(obj.scrollBox11);
    obj.layout240:setLeft(410);
    obj.layout240:setTop(80);
    obj.layout240:setWidth(600);
    obj.layout240:setHeight(535);
    obj.layout240:setName("layout240");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout240);
    obj.rectangle64:setLeft(0);
    obj.rectangle64:setTop(0);
    obj.rectangle64:setWidth(600);
    obj.rectangle64:setHeight(535);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setXradius(5);
    obj.rectangle64:setYradius(5);
    obj.rectangle64:setCornerType("round");
    obj.rectangle64:setName("rectangle64");

    obj.label220 = gui.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout240);
    obj.label220:setLeft(0);
    obj.label220:setTop(0);
    obj.label220:setWidth(600);
    obj.label220:setHeight(20);
    obj.label220:setText("Historia");
    obj.label220:setHorzTextAlign("center");
    obj.label220:setName("label220");

    obj.textEditor16 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout240);
    obj.textEditor16:setLeft(10);
    obj.textEditor16:setTop(25);
    obj.textEditor16:setWidth(580);
    obj.textEditor16:setHeight(495);
    obj.textEditor16:setField("historia");
    obj.textEditor16:setName("textEditor16");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox11);
    obj.image8:setAlign("client");
    obj.image8:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image8:setStyle("autoFit");
    obj.image8:setName("image8");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.frmRDF7 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF7:setParent(obj.tab7);
    obj.frmRDF7:setName("frmRDF7");
    obj.frmRDF7:setAlign("client");
    obj.frmRDF7:setTheme("dark");

    obj.scrollBox12 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox12:setParent(obj.frmRDF7);
    obj.scrollBox12:setAlign("client");
    obj.scrollBox12:setName("scrollBox12");

    obj.layout241 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout241:setParent(obj.scrollBox12);
    obj.layout241:setLeft(0);
    obj.layout241:setTop(0);
    obj.layout241:setWidth(400);
    obj.layout241:setHeight(580);
    obj.layout241:setName("layout241");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout241);
    obj.rectangle65:setLeft(0);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(400);
    obj.rectangle65:setHeight(580);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setXradius(5);
    obj.rectangle65:setYradius(15);
    obj.rectangle65:setCornerType("round");
    obj.rectangle65:setName("rectangle65");

    obj.label221 = gui.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout241);
    obj.label221:setLeft(0);
    obj.label221:setTop(0);
    obj.label221:setWidth(400);
    obj.label221:setHeight(20);
    obj.label221:setText("Anotações");
    obj.label221:setHorzTextAlign("center");
    obj.label221:setName("label221");

    obj.textEditor17 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout241);
    obj.textEditor17:setLeft(10);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(380);
    obj.textEditor17:setHeight(540);
    obj.textEditor17:setField("anotacoes1");
    obj.textEditor17:setName("textEditor17");

    obj.layout242 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout242:setParent(obj.scrollBox12);
    obj.layout242:setLeft(410);
    obj.layout242:setTop(0);
    obj.layout242:setWidth(400);
    obj.layout242:setHeight(580);
    obj.layout242:setName("layout242");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout242);
    obj.rectangle66:setLeft(0);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(400);
    obj.rectangle66:setHeight(580);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setXradius(5);
    obj.rectangle66:setYradius(15);
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setName("rectangle66");

    obj.label222 = gui.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout242);
    obj.label222:setLeft(0);
    obj.label222:setTop(0);
    obj.label222:setWidth(400);
    obj.label222:setHeight(20);
    obj.label222:setText("Anotações");
    obj.label222:setHorzTextAlign("center");
    obj.label222:setName("label222");

    obj.textEditor18 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout242);
    obj.textEditor18:setLeft(10);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(380);
    obj.textEditor18:setHeight(540);
    obj.textEditor18:setField("anotacoes2");
    obj.textEditor18:setName("textEditor18");

    obj.layout243 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout243:setParent(obj.scrollBox12);
    obj.layout243:setLeft(820);
    obj.layout243:setTop(0);
    obj.layout243:setWidth(400);
    obj.layout243:setHeight(580);
    obj.layout243:setName("layout243");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout243);
    obj.rectangle67:setLeft(0);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(400);
    obj.rectangle67:setHeight(580);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setXradius(5);
    obj.rectangle67:setYradius(15);
    obj.rectangle67:setCornerType("round");
    obj.rectangle67:setName("rectangle67");

    obj.label223 = gui.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout243);
    obj.label223:setLeft(0);
    obj.label223:setTop(0);
    obj.label223:setWidth(400);
    obj.label223:setHeight(20);
    obj.label223:setText("Anotações");
    obj.label223:setHorzTextAlign("center");
    obj.label223:setName("label223");

    obj.textEditor19 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout243);
    obj.textEditor19:setLeft(10);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(380);
    obj.textEditor19:setHeight(540);
    obj.textEditor19:setField("anotacoes3");
    obj.textEditor19:setName("textEditor19");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox12);
    obj.image9:setAlign("client");
    obj.image9:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image9:setStyle("autoFit");
    obj.image9:setName("image9");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Creditos");
    obj.tab8:setName("tab8");

    obj.frmRDF8 = gui.fromHandle(_obj_newObject("form"));
    obj.frmRDF8:setParent(obj.tab8);
    obj.frmRDF8:setName("frmRDF8");
    obj.frmRDF8:setAlign("client");
    obj.frmRDF8:setTheme("dark");

    obj.scrollBox13 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox13:setParent(obj.frmRDF8);
    obj.scrollBox13:setAlign("client");
    obj.scrollBox13:setName("scrollBox13");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox13);
    obj.image10:setLeft(0);
    obj.image10:setTop(0);
    obj.image10:setWidth(450);
    obj.image10:setHeight(271);
    obj.image10:setStyle("autoFit");
    obj.image10:setSRC("/FichaRdF/images/RDF.png");
    obj.image10:setName("image10");

    obj.image11 = gui.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox13);
    obj.image11:setLeft(550);
    obj.image11:setTop(0);
    obj.image11:setWidth(250);
    obj.image11:setHeight(250);
    obj.image11:setStyle("autoFit");
    obj.image11:setSRC("/FichaRdF/images/RPGmeister.jpg");
    obj.image11:setName("image11");

    obj.layout244 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout244:setParent(obj.scrollBox13);
    obj.layout244:setLeft(850);
    obj.layout244:setTop(0);
    obj.layout244:setWidth(200);
    obj.layout244:setHeight(310);
    obj.layout244:setName("layout244");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout244);
    obj.rectangle68:setAlign("client");
    obj.rectangle68:setColor("black");
    obj.rectangle68:setXradius(5);
    obj.rectangle68:setYradius(15);
    obj.rectangle68:setCornerType("round");
    obj.rectangle68:setName("rectangle68");

    obj.label224 = gui.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout244);
    obj.label224:setLeft(0);
    obj.label224:setTop(10);
    obj.label224:setWidth(200);
    obj.label224:setHeight(20);
    obj.label224:setText("Programador: Vinny (Ambesek)");
    obj.label224:setHorzTextAlign("center");
    obj.label224:setName("label224");

    obj.label225 = gui.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout244);
    obj.label225:setLeft(0);
    obj.label225:setTop(35);
    obj.label225:setWidth(200);
    obj.label225:setHeight(20);
    obj.label225:setText("Arte: Nefer (Nefertyne)");
    obj.label225:setHorzTextAlign("center");
    obj.label225:setName("label225");

    obj.label226 = gui.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout244);
    obj.label226:setLeft(0);
    obj.label226:setTop(60);
    obj.label226:setWidth(200);
    obj.label226:setHeight(20);
    obj.label226:setText("Consultor: Thales Gagliardi(Tchaleko)");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setFontSize(11);
    obj.label226:setName("label226");

    obj.label227 = gui.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout244);
    obj.label227:setLeft(0);
    obj.label227:setTop(85);
    obj.label227:setWidth(200);
    obj.label227:setHeight(20);
    obj.label227:setText("Ficha feita para a mesa Confraria");
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.label228 = gui.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout244);
    obj.label228:setLeft(0);
    obj.label228:setTop(110);
    obj.label228:setWidth(200);
    obj.label228:setHeight(20);
    obj.label228:setText("do Dragão Ornitorrinco");
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.label229 = gui.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout244);
    obj.label229:setLeft(0);
    obj.label229:setTop(135);
    obj.label229:setWidth(200);
    obj.label229:setHeight(20);
    obj.label229:setText("Sistema: Reinos de Ferro");
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.label230 = gui.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout244);
    obj.label230:setLeft(0);
    obj.label230:setTop(160);
    obj.label230:setWidth(200);
    obj.label230:setHeight(20);
    obj.label230:setText("Colaboradores:");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.label231 = gui.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout244);
    obj.label231:setLeft(0);
    obj.label231:setTop(185);
    obj.label231:setWidth(200);
    obj.label231:setHeight(20);
    obj.label231:setText("Lucas Stobbe (Stobbe)");
    obj.label231:setHorzTextAlign("center");
    obj.label231:setName("label231");

    obj.label232 = gui.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout244);
    obj.label232:setLeft(0);
    obj.label232:setTop(210);
    obj.label232:setWidth(200);
    obj.label232:setHeight(20);
    obj.label232:setText("Felipe \"Tanaka\" (touhitsu)");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.label233 = gui.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout244);
    obj.label233:setLeft(0);
    obj.label233:setTop(235);
    obj.label233:setWidth(200);
    obj.label233:setHeight(20);
    obj.label233:setText("Pedro Marra (Baladash)");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setName("label233");

    obj.label234 = gui.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout244);
    obj.label234:setLeft(0);
    obj.label234:setTop(260);
    obj.label234:setWidth(200);
    obj.label234:setHeight(20);
    obj.label234:setText("Bruno \"Ventania\" (Lycan)");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setName("label234");

    obj.label235 = gui.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout244);
    obj.label235:setLeft(0);
    obj.label235:setTop(285);
    obj.label235:setWidth(200);
    obj.label235:setHeight(20);
    obj.label235:setText("Henrique Restivo (Psit)");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setName("label235");

    obj.label236 = gui.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.scrollBox13);
    obj.label236:setLeft(555);
    obj.label236:setTop(300);
    obj.label236:setWidth(100);
    obj.label236:setHeight(20);
    obj.label236:setText("Versão Atual: ");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.image12 = gui.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox13);
    obj.image12:setLeft(667);
    obj.image12:setTop(300);
    obj.image12:setWidth(100);
    obj.image12:setHeight(20);
    obj.image12:setStyle("autoFit");
    obj.image12:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RDF%20releases/release.png");
    obj.image12:setName("image12");

    obj.label237 = gui.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.scrollBox13);
    obj.label237:setLeft(555);
    obj.label237:setTop(325);
    obj.label237:setWidth(100);
    obj.label237:setHeight(20);
    obj.label237:setText("Ultima Versão: ");
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.image13 = gui.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.scrollBox13);
    obj.image13:setLeft(667);
    obj.image13:setTop(325);
    obj.image13:setWidth(100);
    obj.image13:setHeight(20);
    obj.image13:setStyle("autoFit");
    obj.image13:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao02.png");
    obj.image13:setName("image13");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox13);
    obj.button2:setLeft(555);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Change Log");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox13);
    obj.button3:setLeft(667);
    obj.button3:setTop(350);
    obj.button3:setWidth(100);
    obj.button3:setText("Atualizar");
    obj.button3:setName("button3");

    obj.label238 = gui.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.scrollBox13);
    obj.label238:setLeft(555);
    obj.label238:setTop(400);
    obj.label238:setWidth(200);
    obj.label238:setHeight(20);
    obj.label238:setText("Conheça as Mesas:");
    obj.label238:setName("label238");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox13);
    obj.button4:setLeft(555);
    obj.button4:setTop(425);
    obj.button4:setWidth(100);
    obj.button4:setText("RPGmeister");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox13);
    obj.button5:setLeft(667);
    obj.button5:setTop(425);
    obj.button5:setWidth(100);
    obj.button5:setText("Confraria");
    obj.button5:setName("button5");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.defesa_total = 	(tonumber(sheet.bloco_vel) or 0) + 
            	                                            (tonumber(sheet.bloco_agi) or 0) + 
            	                                            (tonumber(sheet.bloco_per) or 0) + 
            	                                            (tonumber(sheet.bloco_equip) or 0) + 
            	                                            (tonumber(sheet.bloco_out_def) or 0);
                            	end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.armadura_total = 	(tonumber(sheet.bloco_fis) or 0) + 
            	                                            (tonumber(sheet.bloco_arm) or 0) + 
            	                                            (tonumber(sheet.bloco_esc) or 0) + 
            	                                            (tonumber(sheet.bloco_out_arm) or 0);
                            	end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.iniciativa_total = 	(tonumber(sheet.bloco_vel) or 0) + 
            	                                            	(tonumber(sheet.bloco_mae) or 0) + 
            	                                            	(tonumber(sheet.bloco_per) or 0) + 
            	                                            	(tonumber(sheet.bloco_equip_ini) or 0) + 
            	                                            	(tonumber(sheet.bloco_out_ini) or 0);
                            	end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.cmd_total = 	(tonumber(sheet.bloco_int) or 0) + 
            	                                            	(tonumber(sheet.bloco_cmd) or 0) + 
            	                                            	(tonumber(sheet.bloco_out_cmd) or 0);
                            	end;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_1 = 	(tonumber(sheet.per_atr_1) or 0) + 
            	                                            	(tonumber(sheet.per_niv_1) or 0) + 
            	                                            	(tonumber(sheet.per_out_1) or 0);
                            	end;
        end, obj);

    obj._e_event5 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_2 = 	(tonumber(sheet.per_atr_2) or 0) + 
            	                                            	(tonumber(sheet.per_niv_2) or 0) + 
            	                                            	(tonumber(sheet.per_out_2) or 0);
                            	end;
        end, obj);

    obj._e_event6 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_3 = 	(tonumber(sheet.per_atr_3) or 0) + 
            	                                            	(tonumber(sheet.per_niv_3) or 0) + 
            	                                            	(tonumber(sheet.per_out_3) or 0);
                            	end;
        end, obj);

    obj._e_event7 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_4 = 	(tonumber(sheet.per_atr_4) or 0) + 
            	                                            	(tonumber(sheet.per_niv_4) or 0) + 
            	                                            	(tonumber(sheet.per_out_4) or 0);
                            	end;
        end, obj);

    obj._e_event8 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_5 = 	(tonumber(sheet.per_atr_5) or 0) + 
            	                                            	(tonumber(sheet.per_niv_5) or 0) + 
            	                                            	(tonumber(sheet.per_out_5) or 0);
                            	end;
        end, obj);

    obj._e_event9 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_6 = 	(tonumber(sheet.per_atr_6) or 0) + 
            	                                            	(tonumber(sheet.per_niv_6) or 0) + 
            	                                            	(tonumber(sheet.per_out_6) or 0);
                            	end;
        end, obj);

    obj._e_event10 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_7 = 	(tonumber(sheet.per_atr_7) or 0) + 
            	                                            	(tonumber(sheet.per_niv_7) or 0) + 
            	                                            	(tonumber(sheet.per_out_7) or 0);
                            	end;
        end, obj);

    obj._e_event11 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_8 = 	(tonumber(sheet.per_atr_8) or 0) + 
            	                                            	(tonumber(sheet.per_niv_8) or 0) + 
            	                                            	(tonumber(sheet.per_out_8) or 0);
                            	end;
        end, obj);

    obj._e_event12 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_9 = 	(tonumber(sheet.per_atr_9) or 0) + 
            	                                            	(tonumber(sheet.per_niv_9) or 0) + 
            	                                            	(tonumber(sheet.per_out_9) or 0);
                            	end;
        end, obj);

    obj._e_event13 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_10 = 	(tonumber(sheet.per_atr_10) or 0) + 
            	                                            	(tonumber(sheet.per_niv_10) or 0) + 
            	                                            	(tonumber(sheet.per_out_10) or 0);
                            	end;
        end, obj);

    obj._e_event14 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_11 = 	(tonumber(sheet.per_atr_11) or 0) + 
            	                                            	(tonumber(sheet.per_niv_11) or 0) + 
            	                                            	(tonumber(sheet.per_out_11) or 0);
                            	end;
        end, obj);

    obj._e_event15 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_12 = 	(tonumber(sheet.per_atr_12) or 0) + 
            	                                            	(tonumber(sheet.per_niv_12) or 0) + 
            	                                            	(tonumber(sheet.per_out_12) or 0);
                            	end;
        end, obj);

    obj._e_event16 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_13 = 	(tonumber(sheet.per_atr_13) or 0) + 
            	                                            	(tonumber(sheet.per_niv_13) or 0) + 
            	                                            	(tonumber(sheet.per_out_13) or 0);
                            	end;
        end, obj);

    obj._e_event17 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_14 = 	(tonumber(sheet.per_atr_14) or 0) + 
            	                                            	(tonumber(sheet.per_niv_14) or 0) + 
            	                                            	(tonumber(sheet.per_out_14) or 0);
                            	end;
        end, obj);

    obj._e_event18 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_15 = 	(tonumber(sheet.per_atr_15) or 0) + 
            	                                            	(tonumber(sheet.per_niv_15) or 0) + 
            	                                            	(tonumber(sheet.per_out_15) or 0);
                            	end;
        end, obj);

    obj._e_event19 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_16 = 	(tonumber(sheet.per_atr_16) or 0) + 
            	                                            	(tonumber(sheet.per_niv_16) or 0) + 
            	                                            	(tonumber(sheet.per_out_16) or 0);
                            	end;
        end, obj);

    obj._e_event20 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_17 = 	(tonumber(sheet.per_atr_17) or 0) + 
            	                                            	(tonumber(sheet.per_niv_17) or 0) + 
            	                                            	(tonumber(sheet.per_out_17) or 0);
                            	end;
        end, obj);

    obj._e_event21 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_18 = 	(tonumber(sheet.per_atr_18) or 0) + 
            	                                            	(tonumber(sheet.per_niv_18) or 0) + 
            	                                            	(tonumber(sheet.per_out_18) or 0);
                            	end;
        end, obj);

    obj._e_event22 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_19 = 	(tonumber(sheet.per_atr_19) or 0) + 
            	                                            	(tonumber(sheet.per_niv_19) or 0) + 
            	                                            	(tonumber(sheet.per_out_19) or 0);
                            	end;
        end, obj);

    obj._e_event23 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_20 = 	(tonumber(sheet.per_atr_20) or 0) + 
            	                                            	(tonumber(sheet.per_niv_20) or 0) + 
            	                                            	(tonumber(sheet.per_out_20) or 0);
                            	end;
        end, obj);

    obj._e_event24 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_21 = 	(tonumber(sheet.per_atr_21) or 0) + 
            	                                            	(tonumber(sheet.per_niv_21) or 0) + 
            	                                            	(tonumber(sheet.per_out_21) or 0);
                            	end;
        end, obj);

    obj._e_event25 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_22 = 	(tonumber(sheet.per_atr_22) or 0) + 
            	                                            	(tonumber(sheet.per_niv_22) or 0) + 
            	                                            	(tonumber(sheet.per_out_22) or 0);
                            	end;
        end, obj);

    obj._e_event26 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclMagias:append();
        end, obj);

    obj._e_event27 = obj.dataLink41:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.sj_defesa_total = 	(tonumber(sheet.sj_atr_vel) or 0) + 
            	                                            (tonumber(sheet.sj_atr_agi) or 0) + 
            	                                            (tonumber(sheet.sj_atr_per) or 0) + 
            	                                            (tonumber(sheet.sj_atr_equip) or 0) + 
            	                                            (tonumber(sheet.sj_atr_out_def) or 0);
                            	end;
        end, obj);

    obj._e_event28 = obj.dataLink42:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.sj_armadura_total = 	(tonumber(sheet.sj_atr_fis) or 0) + 
            	                                            (tonumber(sheet.sj_atr_arm) or 0) + 
            	                                            (tonumber(sheet.sj_atr_esc) or 0) + 
            	                                            (tonumber(sheet.sj_atr_out_arm) or 0);
                            	end;
        end, obj);

    obj._e_event29 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RDF%20releases/Change%20Log.txt')
        end, obj);

    obj._e_event30 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RDF%20releases/Ficha%20RdF.rpk')
        end, obj);

    obj._e_event31 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event32 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=69566');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
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

        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit480 ~= nil then self.edit480:destroy(); self.edit480 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit457 ~= nil then self.edit457:destroy(); self.edit457 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.frmRDF5 ~= nil then self.frmRDF5:destroy(); self.frmRDF5 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.frmRDF3 ~= nil then self.frmRDF3:destroy(); self.frmRDF3 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.edit462 ~= nil then self.edit462:destroy(); self.edit462 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit464 ~= nil then self.edit464:destroy(); self.edit464 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.edit466 ~= nil then self.edit466:destroy(); self.edit466 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.layout236 ~= nil then self.layout236:destroy(); self.layout236 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.edit446 ~= nil then self.edit446:destroy(); self.edit446 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.edit465 ~= nil then self.edit465:destroy(); self.edit465 = nil; end;
        if self.edit475 ~= nil then self.edit475:destroy(); self.edit475 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.layout229 ~= nil then self.layout229:destroy(); self.layout229 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit476 ~= nil then self.edit476:destroy(); self.edit476 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.layout241 ~= nil then self.layout241:destroy(); self.layout241 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.edit489 ~= nil then self.edit489:destroy(); self.edit489 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout244 ~= nil then self.layout244:destroy(); self.layout244 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.edit473 ~= nil then self.edit473:destroy(); self.edit473 = nil; end;
        if self.edit490 ~= nil then self.edit490:destroy(); self.edit490 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit483 ~= nil then self.edit483:destroy(); self.edit483 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit459 ~= nil then self.edit459:destroy(); self.edit459 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit492 ~= nil then self.edit492:destroy(); self.edit492 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.edit479 ~= nil then self.edit479:destroy(); self.edit479 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.edit454 ~= nil then self.edit454:destroy(); self.edit454 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit467 ~= nil then self.edit467:destroy(); self.edit467 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.edit451 ~= nil then self.edit451:destroy(); self.edit451 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout243 ~= nil then self.layout243:destroy(); self.layout243 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.frmRDF6 ~= nil then self.frmRDF6:destroy(); self.frmRDF6 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.edit449 ~= nil then self.edit449:destroy(); self.edit449 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit481 ~= nil then self.edit481:destroy(); self.edit481 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.layout234 ~= nil then self.layout234:destroy(); self.layout234 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.frmRDF7 ~= nil then self.frmRDF7:destroy(); self.frmRDF7 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.layout238 ~= nil then self.layout238:destroy(); self.layout238 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.edit474 ~= nil then self.edit474:destroy(); self.edit474 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.edit461 ~= nil then self.edit461:destroy(); self.edit461 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.frmRDF2 ~= nil then self.frmRDF2:destroy(); self.frmRDF2 = nil; end;
        if self.layout239 ~= nil then self.layout239:destroy(); self.layout239 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit487 ~= nil then self.edit487:destroy(); self.edit487 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit470 ~= nil then self.edit470:destroy(); self.edit470 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.edit430 ~= nil then self.edit430:destroy(); self.edit430 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit456 ~= nil then self.edit456:destroy(); self.edit456 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.edit445 ~= nil then self.edit445:destroy(); self.edit445 = nil; end;
        if self.edit488 ~= nil then self.edit488:destroy(); self.edit488 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.edit413 ~= nil then self.edit413:destroy(); self.edit413 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.edit472 ~= nil then self.edit472:destroy(); self.edit472 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.edit452 ~= nil then self.edit452:destroy(); self.edit452 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.edit460 ~= nil then self.edit460:destroy(); self.edit460 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.layout232 ~= nil then self.layout232:destroy(); self.layout232 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.layout235 ~= nil then self.layout235:destroy(); self.layout235 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.edit493 ~= nil then self.edit493:destroy(); self.edit493 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.edit491 ~= nil then self.edit491:destroy(); self.edit491 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit469 ~= nil then self.edit469:destroy(); self.edit469 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.scrollBox12 ~= nil then self.scrollBox12:destroy(); self.scrollBox12 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.layout242 ~= nil then self.layout242:destroy(); self.layout242 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.layout228 ~= nil then self.layout228:destroy(); self.layout228 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout230 ~= nil then self.layout230:destroy(); self.layout230 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout226 ~= nil then self.layout226:destroy(); self.layout226 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.edit432 ~= nil then self.edit432:destroy(); self.edit432 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.edit438 ~= nil then self.edit438:destroy(); self.edit438 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.layout227 ~= nil then self.layout227:destroy(); self.layout227 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.layout240 ~= nil then self.layout240:destroy(); self.layout240 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.scrollBox13 ~= nil then self.scrollBox13:destroy(); self.scrollBox13 = nil; end;
        if self.edit463 ~= nil then self.edit463:destroy(); self.edit463 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit450 ~= nil then self.edit450:destroy(); self.edit450 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit478 ~= nil then self.edit478:destroy(); self.edit478 = nil; end;
        if self.edit447 ~= nil then self.edit447:destroy(); self.edit447 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit448 ~= nil then self.edit448:destroy(); self.edit448 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.frmRDF1 ~= nil then self.frmRDF1:destroy(); self.frmRDF1 = nil; end;
        if self.edit468 ~= nil then self.edit468:destroy(); self.edit468 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit494 ~= nil then self.edit494:destroy(); self.edit494 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.edit485 ~= nil then self.edit485:destroy(); self.edit485 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.edit455 ~= nil then self.edit455:destroy(); self.edit455 = nil; end;
        if self.edit453 ~= nil then self.edit453:destroy(); self.edit453 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.edit484 ~= nil then self.edit484:destroy(); self.edit484 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.layout233 ~= nil then self.layout233:destroy(); self.layout233 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.frmRDF4 ~= nil then self.frmRDF4:destroy(); self.frmRDF4 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.layout231 ~= nil then self.layout231:destroy(); self.layout231 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.edit486 ~= nil then self.edit486:destroy(); self.edit486 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit482 ~= nil then self.edit482:destroy(); self.edit482 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit477 ~= nil then self.edit477:destroy(); self.edit477 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit471 ~= nil then self.edit471:destroy(); self.edit471 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.frmRDF8 ~= nil then self.frmRDF8:destroy(); self.frmRDF8 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout237 ~= nil then self.layout237:destroy(); self.layout237 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit458 ~= nil then self.edit458:destroy(); self.edit458 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmRdF = {
    newEditor = newfrmRdF, 
    new = newfrmRdF, 
    name = "frmRdF", 
    dataType = "Ambesek.Nefertyne.FichaRdF", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Reinos de Ferro", 
    description=""};

frmRdF = _frmRdF;
rrpg.registrarForm(_frmRdF);
rrpg.registrarDataType(_frmRdF);

return _frmRdF;
