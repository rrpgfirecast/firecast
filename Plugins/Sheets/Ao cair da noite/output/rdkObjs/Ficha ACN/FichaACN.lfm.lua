require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaACN()
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
    obj:setName("frmFichaACN");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaACN");
    obj:setTitle("Ficha ACN");
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

    obj.frmACN1 = gui.fromHandle(_obj_newObject("form"));
    obj.frmACN1:setParent(obj.tab1);
    obj.frmACN1:setName("frmACN1");
    obj.frmACN1:setAlign("client");
    obj.frmACN1:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmACN1);
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
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
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
    obj.edit1:setField("nome");
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
    obj.label2:setText("Conceito");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("conceito");
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
    obj.label3:setText("Facção");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(110);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("faccao");
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
    obj.label4:setText("Ímpeto");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("impeto");
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
    obj.label5:setText("Comportamento");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(110);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("comportamento");
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
    obj.label6:setText("Direção");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("direcao");
    obj.edit6:setName("edit6");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(75);
    obj.layout8:setWidth(315);
    obj.layout8:setHeight(245);
    obj.layout8:setName("layout8");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(5);
    obj.label7:setTop(0);
    obj.label7:setWidth(315);
    obj.label7:setHeight(20);
    obj.label7:setText("ATRIBUTOS");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(250);
    obj.label8:setTop(80);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8:setText("Físicos");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setRotationAngle(90);
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9:setLeft(250);
    obj.label9:setTop(175);
    obj.label9:setWidth(100);
    obj.label9:setHeight(20);
    obj.label9:setText("Mentais");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setRotationAngle(90);
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setLeft(105);
    obj.label10:setTop(25);
    obj.label10:setWidth(315);
    obj.label10:setHeight(20);
    obj.label10:setText(" Total");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setLeft(150);
    obj.label11:setTop(25);
    obj.label11:setWidth(315);
    obj.label11:setHeight(20);
    obj.label11:setText("Base");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(185);
    obj.label12:setTop(25);
    obj.label12:setWidth(315);
    obj.label12:setHeight(20);
    obj.label12:setText(" Inic");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setLeft(220);
    obj.label13:setTop(25);
    obj.label13:setWidth(315);
    obj.label13:setHeight(20);
    obj.label13:setText(" Apr.");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setLeft(255);
    obj.label14:setTop(25);
    obj.label14:setWidth(315);
    obj.label14:setHeight(20);
    obj.label14:setText("  XP");
    obj.label14:setName("label14");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(315);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");

    obj.radioButton1 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout9);
    obj.radioButton1:setLeft(0);
    obj.radioButton1:setTop(0);
    obj.radioButton1:setGroupName("grupo1");
    obj.radioButton1:setField("dado1");
    obj.radioButton1:setFieldValue("testeforca");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout9);
    obj.radioButton2:setLeft(0);
    obj.radioButton2:setTop(13);
    obj.radioButton2:setGroupName("grupo2");
    obj.radioButton2:setField("dado2");
    obj.radioButton2:setFieldValue("testeforca");
    obj.radioButton2:setName("radioButton2");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setLeft(20);
    obj.label15:setTop(5);
    obj.label15:setWidth(85);
    obj.label15:setHeight(20);
    obj.label15:setText("Força");
    obj.label15:setName("label15");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setLeft(100);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(40);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout9);
    obj.label16:setLeft(100);
    obj.label16:setTop(3);
    obj.label16:setWidth(40);
    obj.label16:setHeight(20);
    obj.label16:setField("totalforca");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(145);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(25);
    obj.edit7:setType("number");
    obj.edit7:setField("baseforca");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(180);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setType("number");
    obj.edit8:setField("inicialforca");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setLeft(215);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setType("number");
    obj.edit9:setField("bonusforca");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout9);
    obj.edit10:setLeft(250);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setType("number");
    obj.edit10:setField("xpforca");
    obj.edit10:setName("edit10");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout9);
    obj.dataLink1:setFields({'baseforca', 'inicialforca', 'bonusforca', 'xpforca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink1:setName("dataLink1");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(80);
    obj.layout10:setWidth(315);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.radioButton3 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout10);
    obj.radioButton3:setLeft(0);
    obj.radioButton3:setTop(0);
    obj.radioButton3:setGroupName("grupo1");
    obj.radioButton3:setField("dado1");
    obj.radioButton3:setFieldValue("testeagilidade");
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout10);
    obj.radioButton4:setLeft(0);
    obj.radioButton4:setTop(13);
    obj.radioButton4:setGroupName("grupo2");
    obj.radioButton4:setField("dado2");
    obj.radioButton4:setFieldValue("testeagilidade");
    obj.radioButton4:setName("radioButton4");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout10);
    obj.label17:setLeft(20);
    obj.label17:setTop(5);
    obj.label17:setWidth(85);
    obj.label17:setHeight(20);
    obj.label17:setText("Agilidade");
    obj.label17:setName("label17");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout10);
    obj.rectangle4:setLeft(100);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(40);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout10);
    obj.label18:setLeft(100);
    obj.label18:setTop(3);
    obj.label18:setWidth(40);
    obj.label18:setHeight(20);
    obj.label18:setField("totalagilidade");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout10);
    obj.edit11:setLeft(145);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setType("number");
    obj.edit11:setField("baseagilidade");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout10);
    obj.edit12:setLeft(180);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setField("inicialagilidade");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout10);
    obj.edit13:setLeft(215);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setField("bonusagilidade");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout10);
    obj.edit14:setLeft(250);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setField("xpagilidade");
    obj.edit14:setName("edit14");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setFields({'baseagilidade', 'inicialagilidade', 'bonusagilidade', 'xpagilidade', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink2:setName("dataLink2");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(110);
    obj.layout11:setWidth(315);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.radioButton5 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout11);
    obj.radioButton5:setLeft(0);
    obj.radioButton5:setTop(0);
    obj.radioButton5:setGroupName("grupo1");
    obj.radioButton5:setField("dado1");
    obj.radioButton5:setFieldValue("testeresiliencia");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout11);
    obj.radioButton6:setLeft(0);
    obj.radioButton6:setTop(13);
    obj.radioButton6:setGroupName("grupo2");
    obj.radioButton6:setField("dado2");
    obj.radioButton6:setFieldValue("testeresiliencia");
    obj.radioButton6:setName("radioButton6");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout11);
    obj.label19:setLeft(20);
    obj.label19:setTop(5);
    obj.label19:setWidth(85);
    obj.label19:setHeight(20);
    obj.label19:setText("Resiliência");
    obj.label19:setName("label19");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout11);
    obj.rectangle5:setLeft(100);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout11);
    obj.label20:setLeft(100);
    obj.label20:setTop(3);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setField("totalresiliencia");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout11);
    obj.edit15:setLeft(145);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setField("baseresiliencia");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout11);
    obj.edit16:setLeft(180);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setField("inicialresiliencia");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout11);
    obj.edit17:setLeft(215);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setField("bonusresiliencia");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout11);
    obj.edit18:setLeft(250);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setField("xpresiliencia");
    obj.edit18:setName("edit18");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout11);
    obj.dataLink3:setFields({'baseresiliencia', 'inicialresiliencia', 'bonusresiliencia', 'xpresiliencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink3:setName("dataLink3");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(145);
    obj.horzLine1:setWidth(315);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(150);
    obj.layout12:setWidth(315);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.radioButton7 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout12);
    obj.radioButton7:setLeft(0);
    obj.radioButton7:setTop(0);
    obj.radioButton7:setGroupName("grupo1");
    obj.radioButton7:setField("dado1");
    obj.radioButton7:setFieldValue("testecarisma");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout12);
    obj.radioButton8:setLeft(0);
    obj.radioButton8:setTop(13);
    obj.radioButton8:setGroupName("grupo2");
    obj.radioButton8:setField("dado2");
    obj.radioButton8:setFieldValue("testecarisma");
    obj.radioButton8:setName("radioButton8");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout12);
    obj.label21:setLeft(20);
    obj.label21:setTop(5);
    obj.label21:setWidth(85);
    obj.label21:setHeight(20);
    obj.label21:setText("Carisma");
    obj.label21:setName("label21");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout12);
    obj.rectangle6:setLeft(100);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout12);
    obj.label22:setLeft(100);
    obj.label22:setTop(3);
    obj.label22:setWidth(40);
    obj.label22:setHeight(20);
    obj.label22:setField("totalcarisma");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout12);
    obj.edit19:setLeft(145);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setField("basecarisma");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout12);
    obj.edit20:setLeft(180);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setField("inicialcarisma");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout12);
    obj.edit21:setLeft(215);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setField("bonuscarisma");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout12);
    obj.edit22:setLeft(250);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setField("xpcarisma");
    obj.edit22:setName("edit22");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout12);
    obj.dataLink4:setFields({'basecarisma', 'inicialcarisma', 'bonuscarisma', 'xpcarisma', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink4:setName("dataLink4");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(180);
    obj.layout13:setWidth(315);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.radioButton9 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout13);
    obj.radioButton9:setLeft(0);
    obj.radioButton9:setTop(0);
    obj.radioButton9:setGroupName("grupo1");
    obj.radioButton9:setField("dado1");
    obj.radioButton9:setFieldValue("testepercepcao");
    obj.radioButton9:setName("radioButton9");

    obj.radioButton10 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout13);
    obj.radioButton10:setLeft(0);
    obj.radioButton10:setTop(13);
    obj.radioButton10:setGroupName("grupo2");
    obj.radioButton10:setField("dado2");
    obj.radioButton10:setFieldValue("testepercepcao");
    obj.radioButton10:setName("radioButton10");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout13);
    obj.label23:setLeft(20);
    obj.label23:setTop(5);
    obj.label23:setWidth(85);
    obj.label23:setHeight(20);
    obj.label23:setText("Percepção");
    obj.label23:setName("label23");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout13);
    obj.rectangle7:setLeft(100);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout13);
    obj.label24:setLeft(100);
    obj.label24:setTop(3);
    obj.label24:setWidth(40);
    obj.label24:setHeight(20);
    obj.label24:setField("totalpercepcao");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout13);
    obj.edit23:setLeft(145);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setField("basepercepcao");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout13);
    obj.edit24:setLeft(180);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setField("inicialpercepcao");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout13);
    obj.edit25:setLeft(215);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setType("number");
    obj.edit25:setField("bonuspercepcao");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout13);
    obj.edit26:setLeft(250);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setField("xppercepcao");
    obj.edit26:setName("edit26");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout13);
    obj.dataLink5:setFields({'basepercepcao', 'inicialpercepcao', 'bonuspercepcao', 'xppercepcao', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink5:setName("dataLink5");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(210);
    obj.layout14:setWidth(315);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.radioButton11 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.layout14);
    obj.radioButton11:setLeft(0);
    obj.radioButton11:setTop(0);
    obj.radioButton11:setGroupName("grupo1");
    obj.radioButton11:setField("dado1");
    obj.radioButton11:setFieldValue("testeperspicacia");
    obj.radioButton11:setName("radioButton11");

    obj.radioButton12 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.layout14);
    obj.radioButton12:setLeft(0);
    obj.radioButton12:setTop(13);
    obj.radioButton12:setGroupName("grupo2");
    obj.radioButton12:setField("dado2");
    obj.radioButton12:setFieldValue("testeperspicacia");
    obj.radioButton12:setName("radioButton12");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout14);
    obj.label25:setLeft(20);
    obj.label25:setTop(5);
    obj.label25:setWidth(85);
    obj.label25:setHeight(20);
    obj.label25:setText("Perspicácia");
    obj.label25:setName("label25");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout14);
    obj.rectangle8:setLeft(100);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout14);
    obj.label26:setLeft(100);
    obj.label26:setTop(3);
    obj.label26:setWidth(40);
    obj.label26:setHeight(20);
    obj.label26:setField("totalperspicacia");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout14);
    obj.edit27:setLeft(145);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setField("baseperspicacia");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout14);
    obj.edit28:setLeft(180);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setField("inicialperspicacia");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout14);
    obj.edit29:setLeft(215);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setField("bonusperspicacia");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout14);
    obj.edit30:setLeft(250);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setField("xpperspicacia");
    obj.edit30:setName("edit30");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout14);
    obj.dataLink6:setFields({'baseperspicacia', 'inicialperspicacia', 'bonusperspicacia', 'xpperspicacia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink6:setName("dataLink6");


				local function xpAtributo()
					if sheet~=nil then
						local mod = 0;
						local valores = {   ((tonumber(sheet.testeforca) or 0)*2 - (tonumber(sheet.xpforca) or 0)), 
											((tonumber(sheet.testeagilidade) or 0)*2 - (tonumber(sheet.xpagilidade) or 0)), 
											((tonumber(sheet.testeresiliencia) or 0)*2 - (tonumber(sheet.xpresiliencia) or 0)), 
											((tonumber(sheet.testecarisma) or 0)*2 - (tonumber(sheet.xpcarisma) or 0)), 
											((tonumber(sheet.testepercepcao) or 0)*2 - (tonumber(sheet.xppercepcao) or 0)),
											((tonumber(sheet.testeperspicacia) or 0)*2 - (tonumber(sheet.xpperspicacia) or 0)) };
						
						local limites = {	(tonumber(sheet.xpforca) or 0),
											(tonumber(sheet.xpagilidade) or 0),
											(tonumber(sheet.xpresiliencia) or 0),
											(tonumber(sheet.xpcarisma) or 0),
											(tonumber(sheet.xppercepcao) or 0),
											(tonumber(sheet.xpperspicacia) or 0)}
						
						for i=1, 6, 1 do
							for j=1, limites[i], 1 do
								mod = mod + (valores[i]+j)*3;
							end;
						end;
						sheet.XPatributos = mod;
						sheet.XPgasta = (tonumber(sheet.XPatributos) or 0) + 
										(tonumber(sheet.XPaegis) or 0) + 
										(tonumber(sheet.XPhistoricos) or 0) + 
										(tonumber(sheet.XPmisticos) or 0) + 
										(tonumber(sheet.XPaptidoes) or 0);
					end;
				end;
			


    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(325);
    obj.layout15:setWidth(315);
    obj.layout15:setHeight(185);
    obj.layout15:setName("layout15");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout15);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(15);
    obj.rectangle9:setYradius(15);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout15);
    obj.label27:setLeft(5);
    obj.label27:setTop(0);
    obj.label27:setWidth(315);
    obj.label27:setHeight(20);
    obj.label27:setText("EIDOLON");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout15);
    obj.label28:setLeft(105);
    obj.label28:setTop(25);
    obj.label28:setWidth(315);
    obj.label28:setHeight(20);
    obj.label28:setText(" Total");
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout15);
    obj.label29:setLeft(150);
    obj.label29:setTop(25);
    obj.label29:setWidth(315);
    obj.label29:setHeight(20);
    obj.label29:setText("Base");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout15);
    obj.label30:setLeft(185);
    obj.label30:setTop(25);
    obj.label30:setWidth(315);
    obj.label30:setHeight(20);
    obj.label30:setText(" Inic");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout15);
    obj.label31:setLeft(220);
    obj.label31:setTop(25);
    obj.label31:setWidth(315);
    obj.label31:setHeight(20);
    obj.label31:setText(" Apr.");
    obj.label31:setName("label31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout15);
    obj.label32:setLeft(255);
    obj.label32:setTop(25);
    obj.label32:setWidth(315);
    obj.label32:setHeight(20);
    obj.label32:setText("  XP");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout15);
    obj.label33:setLeft(250);
    obj.label33:setTop(80);
    obj.label33:setWidth(100);
    obj.label33:setHeight(20);
    obj.label33:setText("Aegis");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setRotationAngle(90);
    obj.label33:setName("label33");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(50);
    obj.layout16:setWidth(315);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.radioButton13 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.layout16);
    obj.radioButton13:setLeft(0);
    obj.radioButton13:setTop(0);
    obj.radioButton13:setGroupName("grupo1");
    obj.radioButton13:setField("dado1");
    obj.radioButton13:setFieldValue("testeconsciencia");
    obj.radioButton13:setName("radioButton13");

    obj.radioButton14 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.layout16);
    obj.radioButton14:setLeft(0);
    obj.radioButton14:setTop(13);
    obj.radioButton14:setGroupName("grupo2");
    obj.radioButton14:setField("dado2");
    obj.radioButton14:setFieldValue("testeconsciencia");
    obj.radioButton14:setName("radioButton14");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout16);
    obj.label34:setLeft(20);
    obj.label34:setTop(5);
    obj.label34:setWidth(85);
    obj.label34:setHeight(20);
    obj.label34:setText("Consciência");
    obj.label34:setName("label34");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout16);
    obj.rectangle10:setLeft(100);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout16);
    obj.label35:setLeft(100);
    obj.label35:setTop(3);
    obj.label35:setWidth(40);
    obj.label35:setHeight(20);
    obj.label35:setField("totalconsciencia");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout16);
    obj.edit31:setLeft(145);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(30);
    obj.edit31:setHeight(25);
    obj.edit31:setType("number");
    obj.edit31:setField("baseconsciencia");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout16);
    obj.edit32:setLeft(180);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setField("inicialconsciencia");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout16);
    obj.edit33:setLeft(215);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setField("bonusconsciencia");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout16);
    obj.edit34:setLeft(250);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setField("xpconsciencia");
    obj.edit34:setName("edit34");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout16);
    obj.dataLink7:setFields({'baseconsciencia', 'inicialconsciencia', 'bonusconsciencia', 'xpconsciencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink7:setName("dataLink7");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(80);
    obj.layout17:setWidth(315);
    obj.layout17:setHeight(30);
    obj.layout17:setName("layout17");

    obj.radioButton15 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton15:setParent(obj.layout17);
    obj.radioButton15:setLeft(0);
    obj.radioButton15:setTop(0);
    obj.radioButton15:setGroupName("grupo1");
    obj.radioButton15:setField("dado1");
    obj.radioButton15:setFieldValue("testeespirito");
    obj.radioButton15:setName("radioButton15");

    obj.radioButton16 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton16:setParent(obj.layout17);
    obj.radioButton16:setLeft(0);
    obj.radioButton16:setTop(13);
    obj.radioButton16:setGroupName("grupo2");
    obj.radioButton16:setField("dado2");
    obj.radioButton16:setFieldValue("testeespirito");
    obj.radioButton16:setName("radioButton16");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout17);
    obj.label36:setLeft(20);
    obj.label36:setTop(5);
    obj.label36:setWidth(85);
    obj.label36:setHeight(20);
    obj.label36:setText("Espírito");
    obj.label36:setName("label36");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setLeft(100);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout17);
    obj.label37:setLeft(100);
    obj.label37:setTop(3);
    obj.label37:setWidth(40);
    obj.label37:setHeight(20);
    obj.label37:setField("totalespirito");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout17);
    obj.edit35:setLeft(145);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setType("number");
    obj.edit35:setField("baseespirito");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout17);
    obj.edit36:setLeft(180);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setField("inicialespirito");
    obj.edit36:setName("edit36");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout17);
    obj.edit37:setLeft(215);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(25);
    obj.edit37:setType("number");
    obj.edit37:setField("bonusespirito");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout17);
    obj.edit38:setLeft(250);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setField("xpespirito");
    obj.edit38:setName("edit38");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout17);
    obj.dataLink8:setFields({'baseespirito', 'inicialespirito', 'bonusespirito', 'xpespirito', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink8:setName("dataLink8");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(110);
    obj.layout18:setWidth(315);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.radioButton17 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton17:setParent(obj.layout18);
    obj.radioButton17:setLeft(0);
    obj.radioButton17:setTop(0);
    obj.radioButton17:setGroupName("grupo1");
    obj.radioButton17:setField("dado1");
    obj.radioButton17:setFieldValue("testeperseveranca");
    obj.radioButton17:setName("radioButton17");

    obj.radioButton18 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton18:setParent(obj.layout18);
    obj.radioButton18:setLeft(0);
    obj.radioButton18:setTop(13);
    obj.radioButton18:setGroupName("grupo2");
    obj.radioButton18:setField("dado2");
    obj.radioButton18:setFieldValue("testeperseveranca");
    obj.radioButton18:setName("radioButton18");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout18);
    obj.label38:setLeft(20);
    obj.label38:setTop(5);
    obj.label38:setWidth(85);
    obj.label38:setHeight(20);
    obj.label38:setText("Perseverança");
    obj.label38:setName("label38");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout18);
    obj.rectangle12:setLeft(100);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout18);
    obj.label39:setLeft(100);
    obj.label39:setTop(3);
    obj.label39:setWidth(40);
    obj.label39:setHeight(20);
    obj.label39:setField("totalperseveranca");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout18);
    obj.edit39:setLeft(145);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(30);
    obj.edit39:setHeight(25);
    obj.edit39:setType("number");
    obj.edit39:setField("baseperseveranca");
    obj.edit39:setName("edit39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout18);
    obj.edit40:setLeft(180);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(30);
    obj.edit40:setHeight(25);
    obj.edit40:setType("number");
    obj.edit40:setField("inicialperseveranca");
    obj.edit40:setName("edit40");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout18);
    obj.edit41:setLeft(215);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(30);
    obj.edit41:setHeight(25);
    obj.edit41:setType("number");
    obj.edit41:setField("bonusperseveranca");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout18);
    obj.edit42:setLeft(250);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setType("number");
    obj.edit42:setField("xpperseveranca");
    obj.edit42:setName("edit42");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout18);
    obj.dataLink9:setFields({'baseperseveranca', 'inicialperseveranca', 'bonusperseveranca', 'xpperseveranca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink9:setName("dataLink9");

    obj.horzLine2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout15);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(145);
    obj.horzLine2:setWidth(315);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(150);
    obj.layout19:setWidth(315);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout19);
    obj.label40:setLeft(30);
    obj.label40:setTop(0);
    obj.label40:setWidth(85);
    obj.label40:setHeight(20);
    obj.label40:setText("Gladius");
    obj.label40:setName("label40");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout19);
    obj.edit43:setLeft(175);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setField("gladiusMin");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout19);
    obj.edit44:setLeft(210);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setType("number");
    obj.edit44:setField("gladiusMax");
    obj.edit44:setName("edit44");

    obj.progressBar1 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout19);
    obj.progressBar1:setLeft(100);
    obj.progressBar1:setTop(5);
    obj.progressBar1:setWidth(65);
    obj.progressBar1:setHeight(15);
    obj.progressBar1:setColor("blue");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setMax(1);
    obj.progressBar1:setField("gladius");
    obj.progressBar1:setName("progressBar1");


				local function xpAegis()
					if sheet~=nil then
						local mod = 0;
						local valores = {   ((tonumber(sheet.testeconsciencia) or 0) - (tonumber(sheet.xpconsciencia) or 0)), 
											((tonumber(sheet.testeespirito) or 0) - (tonumber(sheet.xpespirito) or 0)), 
											((tonumber(sheet.testeperseveranca) or 0) - (tonumber(sheet.xpperseveranca) or 0))};
						
						local limites = {	(tonumber(sheet.xpconsciencia) or 0),
											(tonumber(sheet.xpespirito) or 0),
											(tonumber(sheet.xpperseveranca) or 0)}
						
						for i=1, 3, 1 do
							for j=1, limites[i], 1 do
								mod = mod + (valores[i]+j);
							end;
						end;

						sheet.XPaegis = mod;
						sheet.XPgasta = (tonumber(sheet.XPatributos) or 0) + 
										(tonumber(sheet.XPaegis) or 0) + 
										(tonumber(sheet.XPhistoricos) or 0) + 
										(tonumber(sheet.XPmisticos) or 0) + 
										(tonumber(sheet.XPaptidoes) or 0);
					end;
				end;
			


    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(840);
    obj.layout20:setTop(530);
    obj.layout20:setWidth(200);
    obj.layout20:setHeight(65);
    obj.layout20:setName("layout20");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout20);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setXradius(15);
    obj.rectangle13:setYradius(15);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout20);
    obj.button1:setLeft(65);
    obj.button1:setTop(10);
    obj.button1:setWidth(70);
    obj.button1:setText("PADRÃO*");
    obj.button1:setName("button1");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout20);
    obj.label41:setLeft(35);
    obj.label41:setTop(35);
    obj.label41:setWidth(130);
    obj.label41:setHeight(20);
    obj.label41:setText("*Seta valores iniciais.");
    obj.label41:setName("label41");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setLeft(625);
    obj.layout21:setTop(530);
    obj.layout21:setWidth(210);
    obj.layout21:setHeight(65);
    obj.layout21:setName("layout21");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout21);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(15);
    obj.rectangle14:setYradius(15);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout21);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(200);
    obj.label42:setHeight(20);
    obj.label42:setText("XP");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout21);
    obj.rectangle15:setLeft(10);
    obj.rectangle15:setTop(25);
    obj.rectangle15:setWidth(35);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout21);
    obj.label43:setLeft(20);
    obj.label43:setTop(28);
    obj.label43:setWidth(30);
    obj.label43:setHeight(20);
    obj.label43:setField("XPgasta");
    obj.label43:setName("label43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout21);
    obj.label44:setLeft(48);
    obj.label44:setTop(25);
    obj.label44:setWidth(10);
    obj.label44:setHeight(20);
    obj.label44:setText("+");
    obj.label44:setName("label44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout21);
    obj.edit45:setLeft(60);
    obj.edit45:setTop(25);
    obj.edit45:setWidth(30);
    obj.edit45:setHeight(25);
    obj.edit45:setType("number");
    obj.edit45:setField("XPgasta2");
    obj.edit45:setName("edit45");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout21);
    obj.label45:setLeft(93);
    obj.label45:setTop(25);
    obj.label45:setWidth(10);
    obj.label45:setHeight(20);
    obj.label45:setText("=");
    obj.label45:setName("label45");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout21);
    obj.rectangle16:setLeft(105);
    obj.rectangle16:setTop(25);
    obj.rectangle16:setWidth(35);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout21);
    obj.label46:setLeft(115);
    obj.label46:setTop(28);
    obj.label46:setWidth(30);
    obj.label46:setHeight(20);
    obj.label46:setField("XPgastaTotal");
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout21);
    obj.label47:setLeft(148);
    obj.label47:setTop(25);
    obj.label47:setWidth(10);
    obj.label47:setHeight(20);
    obj.label47:setText("|");
    obj.label47:setName("label47");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout21);
    obj.edit46:setLeft(160);
    obj.edit46:setTop(25);
    obj.edit46:setWidth(30);
    obj.edit46:setHeight(25);
    obj.edit46:setType("number");
    obj.edit46:setField("XP");
    obj.edit46:setName("edit46");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout21);
    obj.dataLink10:setFields({'XPgasta', 'XPgasta2'});
    obj.dataLink10:setName("dataLink10");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(320);
    obj.layout22:setTop(75);
    obj.layout22:setWidth(300);
    obj.layout22:setHeight(320);
    obj.layout22:setName("layout22");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout22);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setXradius(15);
    obj.rectangle17:setYradius(15);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout22);
    obj.label48:setLeft(0);
    obj.label48:setTop(0);
    obj.label48:setWidth(300);
    obj.label48:setHeight(20);
    obj.label48:setText("HISTORICOS");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout22);
    obj.label49:setLeft(25);
    obj.label49:setTop(20);
    obj.label49:setWidth(315);
    obj.label49:setHeight(20);
    obj.label49:setText(" Nome");
    obj.label49:setName("label49");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout22);
    obj.label50:setLeft(135);
    obj.label50:setTop(20);
    obj.label50:setWidth(315);
    obj.label50:setHeight(20);
    obj.label50:setText("Total");
    obj.label50:setName("label50");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout22);
    obj.label51:setLeft(170);
    obj.label51:setTop(20);
    obj.label51:setWidth(315);
    obj.label51:setHeight(20);
    obj.label51:setText(" Inic");
    obj.label51:setName("label51");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout22);
    obj.label52:setLeft(202);
    obj.label52:setTop(20);
    obj.label52:setWidth(315);
    obj.label52:setHeight(20);
    obj.label52:setText(" Apr.");
    obj.label52:setName("label52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout22);
    obj.label53:setLeft(235);
    obj.label53:setTop(20);
    obj.label53:setWidth(315);
    obj.label53:setHeight(20);
    obj.label53:setText("  XP");
    obj.label53:setName("label53");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout22);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(40);
    obj.scrollBox2:setWidth(295);
    obj.scrollBox2:setHeight(260);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox2);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(0);
    obj.layout23:setWidth(270);
    obj.layout23:setHeight(35);
    obj.layout23:setName("layout23");

    obj.radioButton19 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton19:setParent(obj.layout23);
    obj.radioButton19:setLeft(0);
    obj.radioButton19:setTop(0);
    obj.radioButton19:setGroupName("grupo1");
    obj.radioButton19:setField("dado1");
    obj.radioButton19:setFieldValue("historicoTotal1_1");
    obj.radioButton19:setName("radioButton19");

    obj.radioButton20 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton20:setParent(obj.layout23);
    obj.radioButton20:setLeft(0);
    obj.radioButton20:setTop(15);
    obj.radioButton20:setGroupName("grupo2");
    obj.radioButton20:setField("dado2");
    obj.radioButton20:setFieldValue("historicoTotal1_1");
    obj.radioButton20:setName("radioButton20");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout23);
    obj.edit47:setLeft(20);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(100);
    obj.edit47:setHeight(25);
    obj.edit47:setField("historicoNome1_1");
    obj.edit47:setName("edit47");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout23);
    obj.rectangle18:setLeft(125);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(35);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("Black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout23);
    obj.label54:setLeft(135);
    obj.label54:setTop(3);
    obj.label54:setWidth(30);
    obj.label54:setHeight(20);
    obj.label54:setField("historicoTotal1_1");
    obj.label54:setName("label54");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout23);
    obj.edit48:setLeft(165);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setType("number");
    obj.edit48:setMin(0);
    obj.edit48:setField("historicoValor1_1");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout23);
    obj.edit49:setLeft(200);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(30);
    obj.edit49:setHeight(25);
    obj.edit49:setType("number");
    obj.edit49:setMin(0);
    obj.edit49:setField("historicoBonus1_1");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout23);
    obj.edit50:setLeft(235);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(30);
    obj.edit50:setHeight(25);
    obj.edit50:setType("number");
    obj.edit50:setMin(0);
    obj.edit50:setField("historicoXp1_1");
    obj.edit50:setName("edit50");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox2);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(35);
    obj.layout24:setWidth(270);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.radioButton21 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton21:setParent(obj.layout24);
    obj.radioButton21:setLeft(0);
    obj.radioButton21:setTop(0);
    obj.radioButton21:setGroupName("grupo1");
    obj.radioButton21:setField("dado1");
    obj.radioButton21:setFieldValue("historicoTotal1_2");
    obj.radioButton21:setName("radioButton21");

    obj.radioButton22 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton22:setParent(obj.layout24);
    obj.radioButton22:setLeft(0);
    obj.radioButton22:setTop(15);
    obj.radioButton22:setGroupName("grupo2");
    obj.radioButton22:setField("dado2");
    obj.radioButton22:setFieldValue("historicoTotal1_2");
    obj.radioButton22:setName("radioButton22");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout24);
    obj.edit51:setLeft(20);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(100);
    obj.edit51:setHeight(25);
    obj.edit51:setField("historicoNome1_2");
    obj.edit51:setName("edit51");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout24);
    obj.rectangle19:setLeft(125);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(35);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("Black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout24);
    obj.label55:setLeft(135);
    obj.label55:setTop(3);
    obj.label55:setWidth(30);
    obj.label55:setHeight(20);
    obj.label55:setField("historicoTotal1_2");
    obj.label55:setName("label55");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout24);
    obj.edit52:setLeft(165);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setType("number");
    obj.edit52:setMin(0);
    obj.edit52:setField("historicoValor1_2");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout24);
    obj.edit53:setLeft(200);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(30);
    obj.edit53:setHeight(25);
    obj.edit53:setType("number");
    obj.edit53:setMin(0);
    obj.edit53:setField("historicoBonus1_2");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout24);
    obj.edit54:setLeft(235);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setType("number");
    obj.edit54:setMin(0);
    obj.edit54:setField("historicoXp1_2");
    obj.edit54:setName("edit54");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox2);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(70);
    obj.layout25:setWidth(270);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.radioButton23 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton23:setParent(obj.layout25);
    obj.radioButton23:setLeft(0);
    obj.radioButton23:setTop(0);
    obj.radioButton23:setGroupName("grupo1");
    obj.radioButton23:setField("dado1");
    obj.radioButton23:setFieldValue("historicoTotal1_3");
    obj.radioButton23:setName("radioButton23");

    obj.radioButton24 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton24:setParent(obj.layout25);
    obj.radioButton24:setLeft(0);
    obj.radioButton24:setTop(15);
    obj.radioButton24:setGroupName("grupo2");
    obj.radioButton24:setField("dado2");
    obj.radioButton24:setFieldValue("historicoTotal1_3");
    obj.radioButton24:setName("radioButton24");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout25);
    obj.edit55:setLeft(20);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(100);
    obj.edit55:setHeight(25);
    obj.edit55:setField("historicoNome1_3");
    obj.edit55:setName("edit55");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout25);
    obj.rectangle20:setLeft(125);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(35);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("Black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout25);
    obj.label56:setLeft(135);
    obj.label56:setTop(3);
    obj.label56:setWidth(30);
    obj.label56:setHeight(20);
    obj.label56:setField("historicoTotal1_3");
    obj.label56:setName("label56");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout25);
    obj.edit56:setLeft(165);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(30);
    obj.edit56:setHeight(25);
    obj.edit56:setType("number");
    obj.edit56:setMin(0);
    obj.edit56:setField("historicoValor1_3");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout25);
    obj.edit57:setLeft(200);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(30);
    obj.edit57:setHeight(25);
    obj.edit57:setType("number");
    obj.edit57:setMin(0);
    obj.edit57:setField("historicoBonus1_3");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout25);
    obj.edit58:setLeft(235);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(30);
    obj.edit58:setHeight(25);
    obj.edit58:setType("number");
    obj.edit58:setMin(0);
    obj.edit58:setField("historicoXp1_3");
    obj.edit58:setName("edit58");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox2);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(105);
    obj.layout26:setWidth(270);
    obj.layout26:setHeight(35);
    obj.layout26:setName("layout26");

    obj.radioButton25 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton25:setParent(obj.layout26);
    obj.radioButton25:setLeft(0);
    obj.radioButton25:setTop(0);
    obj.radioButton25:setGroupName("grupo1");
    obj.radioButton25:setField("dado1");
    obj.radioButton25:setFieldValue("historicoTotal1_4");
    obj.radioButton25:setName("radioButton25");

    obj.radioButton26 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton26:setParent(obj.layout26);
    obj.radioButton26:setLeft(0);
    obj.radioButton26:setTop(15);
    obj.radioButton26:setGroupName("grupo2");
    obj.radioButton26:setField("dado2");
    obj.radioButton26:setFieldValue("historicoTotal1_4");
    obj.radioButton26:setName("radioButton26");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout26);
    obj.edit59:setLeft(20);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(100);
    obj.edit59:setHeight(25);
    obj.edit59:setField("historicoNome1_4");
    obj.edit59:setName("edit59");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout26);
    obj.rectangle21:setLeft(125);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(35);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("Black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout26);
    obj.label57:setLeft(135);
    obj.label57:setTop(3);
    obj.label57:setWidth(30);
    obj.label57:setHeight(20);
    obj.label57:setField("historicoTotal1_4");
    obj.label57:setName("label57");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout26);
    obj.edit60:setLeft(165);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(25);
    obj.edit60:setType("number");
    obj.edit60:setMin(0);
    obj.edit60:setField("historicoValor1_4");
    obj.edit60:setName("edit60");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout26);
    obj.edit61:setLeft(200);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(30);
    obj.edit61:setHeight(25);
    obj.edit61:setType("number");
    obj.edit61:setMin(0);
    obj.edit61:setField("historicoBonus1_4");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout26);
    obj.edit62:setLeft(235);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setType("number");
    obj.edit62:setMin(0);
    obj.edit62:setField("historicoXp1_4");
    obj.edit62:setName("edit62");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox2);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(140);
    obj.layout27:setWidth(270);
    obj.layout27:setHeight(35);
    obj.layout27:setName("layout27");

    obj.radioButton27 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton27:setParent(obj.layout27);
    obj.radioButton27:setLeft(0);
    obj.radioButton27:setTop(0);
    obj.radioButton27:setGroupName("grupo1");
    obj.radioButton27:setField("dado1");
    obj.radioButton27:setFieldValue("historicoTotal1_5");
    obj.radioButton27:setName("radioButton27");

    obj.radioButton28 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton28:setParent(obj.layout27);
    obj.radioButton28:setLeft(0);
    obj.radioButton28:setTop(15);
    obj.radioButton28:setGroupName("grupo2");
    obj.radioButton28:setField("dado2");
    obj.radioButton28:setFieldValue("historicoTotal1_5");
    obj.radioButton28:setName("radioButton28");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout27);
    obj.edit63:setLeft(20);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(100);
    obj.edit63:setHeight(25);
    obj.edit63:setField("historicoNome1_5");
    obj.edit63:setName("edit63");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout27);
    obj.rectangle22:setLeft(125);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(35);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("Black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout27);
    obj.label58:setLeft(135);
    obj.label58:setTop(3);
    obj.label58:setWidth(30);
    obj.label58:setHeight(20);
    obj.label58:setField("historicoTotal1_5");
    obj.label58:setName("label58");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout27);
    obj.edit64:setLeft(165);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(30);
    obj.edit64:setHeight(25);
    obj.edit64:setType("number");
    obj.edit64:setMin(0);
    obj.edit64:setField("historicoValor1_5");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout27);
    obj.edit65:setLeft(200);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(30);
    obj.edit65:setHeight(25);
    obj.edit65:setType("number");
    obj.edit65:setMin(0);
    obj.edit65:setField("historicoBonus1_5");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout27);
    obj.edit66:setLeft(235);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(30);
    obj.edit66:setHeight(25);
    obj.edit66:setType("number");
    obj.edit66:setMin(0);
    obj.edit66:setField("historicoXp1_5");
    obj.edit66:setName("edit66");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox2);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(175);
    obj.layout28:setWidth(270);
    obj.layout28:setHeight(35);
    obj.layout28:setName("layout28");

    obj.radioButton29 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton29:setParent(obj.layout28);
    obj.radioButton29:setLeft(0);
    obj.radioButton29:setTop(0);
    obj.radioButton29:setGroupName("grupo1");
    obj.radioButton29:setField("dado1");
    obj.radioButton29:setFieldValue("historicoTotal1_6");
    obj.radioButton29:setName("radioButton29");

    obj.radioButton30 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton30:setParent(obj.layout28);
    obj.radioButton30:setLeft(0);
    obj.radioButton30:setTop(15);
    obj.radioButton30:setGroupName("grupo2");
    obj.radioButton30:setField("dado2");
    obj.radioButton30:setFieldValue("historicoTotal1_6");
    obj.radioButton30:setName("radioButton30");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout28);
    obj.edit67:setLeft(20);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(100);
    obj.edit67:setHeight(25);
    obj.edit67:setField("historicoNome1_6");
    obj.edit67:setName("edit67");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout28);
    obj.rectangle23:setLeft(125);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout28);
    obj.label59:setLeft(135);
    obj.label59:setTop(3);
    obj.label59:setWidth(30);
    obj.label59:setHeight(20);
    obj.label59:setField("historicoTotal1_6");
    obj.label59:setName("label59");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout28);
    obj.edit68:setLeft(165);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(30);
    obj.edit68:setHeight(25);
    obj.edit68:setType("number");
    obj.edit68:setMin(0);
    obj.edit68:setField("historicoValor1_6");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout28);
    obj.edit69:setLeft(200);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(30);
    obj.edit69:setHeight(25);
    obj.edit69:setType("number");
    obj.edit69:setMin(0);
    obj.edit69:setField("historicoBonus1_6");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout28);
    obj.edit70:setLeft(235);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(30);
    obj.edit70:setHeight(25);
    obj.edit70:setType("number");
    obj.edit70:setMin(0);
    obj.edit70:setField("historicoXp1_6");
    obj.edit70:setName("edit70");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox2);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(210);
    obj.layout29:setWidth(270);
    obj.layout29:setHeight(35);
    obj.layout29:setName("layout29");

    obj.radioButton31 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton31:setParent(obj.layout29);
    obj.radioButton31:setLeft(0);
    obj.radioButton31:setTop(0);
    obj.radioButton31:setGroupName("grupo1");
    obj.radioButton31:setField("dado1");
    obj.radioButton31:setFieldValue("historicoTotal2_1");
    obj.radioButton31:setName("radioButton31");

    obj.radioButton32 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton32:setParent(obj.layout29);
    obj.radioButton32:setLeft(0);
    obj.radioButton32:setTop(15);
    obj.radioButton32:setGroupName("grupo2");
    obj.radioButton32:setField("dado2");
    obj.radioButton32:setFieldValue("historicoTotal2_1");
    obj.radioButton32:setName("radioButton32");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout29);
    obj.edit71:setLeft(20);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(100);
    obj.edit71:setHeight(25);
    obj.edit71:setField("historicoNome2_1");
    obj.edit71:setName("edit71");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout29);
    obj.rectangle24:setLeft(125);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout29);
    obj.label60:setLeft(135);
    obj.label60:setTop(3);
    obj.label60:setWidth(30);
    obj.label60:setHeight(20);
    obj.label60:setField("historicoTotal2_1");
    obj.label60:setName("label60");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout29);
    obj.edit72:setLeft(165);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(30);
    obj.edit72:setHeight(25);
    obj.edit72:setType("number");
    obj.edit72:setMin(0);
    obj.edit72:setField("historicoValor2_1");
    obj.edit72:setName("edit72");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout29);
    obj.edit73:setLeft(200);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(30);
    obj.edit73:setHeight(25);
    obj.edit73:setType("number");
    obj.edit73:setMin(0);
    obj.edit73:setField("historicoBonus2_1");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout29);
    obj.edit74:setLeft(235);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(30);
    obj.edit74:setHeight(25);
    obj.edit74:setType("number");
    obj.edit74:setMin(0);
    obj.edit74:setField("historicoXp2_1");
    obj.edit74:setName("edit74");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(245);
    obj.layout30:setWidth(270);
    obj.layout30:setHeight(35);
    obj.layout30:setName("layout30");

    obj.radioButton33 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton33:setParent(obj.layout30);
    obj.radioButton33:setLeft(0);
    obj.radioButton33:setTop(0);
    obj.radioButton33:setGroupName("grupo1");
    obj.radioButton33:setField("dado1");
    obj.radioButton33:setFieldValue("historicoTotal2_2");
    obj.radioButton33:setName("radioButton33");

    obj.radioButton34 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton34:setParent(obj.layout30);
    obj.radioButton34:setLeft(0);
    obj.radioButton34:setTop(15);
    obj.radioButton34:setGroupName("grupo2");
    obj.radioButton34:setField("dado2");
    obj.radioButton34:setFieldValue("historicoTotal2_2");
    obj.radioButton34:setName("radioButton34");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout30);
    obj.edit75:setLeft(20);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(100);
    obj.edit75:setHeight(25);
    obj.edit75:setField("historicoNome2_2");
    obj.edit75:setName("edit75");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout30);
    obj.rectangle25:setLeft(125);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(35);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("Black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout30);
    obj.label61:setLeft(135);
    obj.label61:setTop(3);
    obj.label61:setWidth(30);
    obj.label61:setHeight(20);
    obj.label61:setField("historicoTotal2_2");
    obj.label61:setName("label61");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout30);
    obj.edit76:setLeft(165);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(30);
    obj.edit76:setHeight(25);
    obj.edit76:setType("number");
    obj.edit76:setMin(0);
    obj.edit76:setField("historicoValor2_2");
    obj.edit76:setName("edit76");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout30);
    obj.edit77:setLeft(200);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(30);
    obj.edit77:setHeight(25);
    obj.edit77:setType("number");
    obj.edit77:setMin(0);
    obj.edit77:setField("historicoBonus2_2");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout30);
    obj.edit78:setLeft(235);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(30);
    obj.edit78:setHeight(25);
    obj.edit78:setType("number");
    obj.edit78:setMin(0);
    obj.edit78:setField("historicoXp2_2");
    obj.edit78:setName("edit78");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox2);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(280);
    obj.layout31:setWidth(270);
    obj.layout31:setHeight(35);
    obj.layout31:setName("layout31");

    obj.radioButton35 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton35:setParent(obj.layout31);
    obj.radioButton35:setLeft(0);
    obj.radioButton35:setTop(0);
    obj.radioButton35:setGroupName("grupo1");
    obj.radioButton35:setField("dado1");
    obj.radioButton35:setFieldValue("historicoTotal2_3");
    obj.radioButton35:setName("radioButton35");

    obj.radioButton36 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton36:setParent(obj.layout31);
    obj.radioButton36:setLeft(0);
    obj.radioButton36:setTop(15);
    obj.radioButton36:setGroupName("grupo2");
    obj.radioButton36:setField("dado2");
    obj.radioButton36:setFieldValue("historicoTotal2_3");
    obj.radioButton36:setName("radioButton36");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout31);
    obj.edit79:setLeft(20);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(100);
    obj.edit79:setHeight(25);
    obj.edit79:setField("historicoNome2_3");
    obj.edit79:setName("edit79");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout31);
    obj.rectangle26:setLeft(125);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout31);
    obj.label62:setLeft(135);
    obj.label62:setTop(3);
    obj.label62:setWidth(30);
    obj.label62:setHeight(20);
    obj.label62:setField("historicoTotal2_3");
    obj.label62:setName("label62");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout31);
    obj.edit80:setLeft(165);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(30);
    obj.edit80:setHeight(25);
    obj.edit80:setType("number");
    obj.edit80:setMin(0);
    obj.edit80:setField("historicoValor2_3");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout31);
    obj.edit81:setLeft(200);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(30);
    obj.edit81:setHeight(25);
    obj.edit81:setType("number");
    obj.edit81:setMin(0);
    obj.edit81:setField("historicoBonus2_3");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout31);
    obj.edit82:setLeft(235);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(30);
    obj.edit82:setHeight(25);
    obj.edit82:setType("number");
    obj.edit82:setMin(0);
    obj.edit82:setField("historicoXp2_3");
    obj.edit82:setName("edit82");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox2);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(315);
    obj.layout32:setWidth(270);
    obj.layout32:setHeight(35);
    obj.layout32:setName("layout32");

    obj.radioButton37 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton37:setParent(obj.layout32);
    obj.radioButton37:setLeft(0);
    obj.radioButton37:setTop(0);
    obj.radioButton37:setGroupName("grupo1");
    obj.radioButton37:setField("dado1");
    obj.radioButton37:setFieldValue("historicoTotal2_4");
    obj.radioButton37:setName("radioButton37");

    obj.radioButton38 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton38:setParent(obj.layout32);
    obj.radioButton38:setLeft(0);
    obj.radioButton38:setTop(15);
    obj.radioButton38:setGroupName("grupo2");
    obj.radioButton38:setField("dado2");
    obj.radioButton38:setFieldValue("historicoTotal2_4");
    obj.radioButton38:setName("radioButton38");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout32);
    obj.edit83:setLeft(20);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(100);
    obj.edit83:setHeight(25);
    obj.edit83:setField("historicoNome2_4");
    obj.edit83:setName("edit83");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout32);
    obj.rectangle27:setLeft(125);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("Black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout32);
    obj.label63:setLeft(135);
    obj.label63:setTop(3);
    obj.label63:setWidth(30);
    obj.label63:setHeight(20);
    obj.label63:setField("historicoTotal2_4");
    obj.label63:setName("label63");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout32);
    obj.edit84:setLeft(165);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(30);
    obj.edit84:setHeight(25);
    obj.edit84:setType("number");
    obj.edit84:setMin(0);
    obj.edit84:setField("historicoValor2_4");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout32);
    obj.edit85:setLeft(200);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(30);
    obj.edit85:setHeight(25);
    obj.edit85:setType("number");
    obj.edit85:setMin(0);
    obj.edit85:setField("historicoBonus2_4");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout32);
    obj.edit86:setLeft(235);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(30);
    obj.edit86:setHeight(25);
    obj.edit86:setType("number");
    obj.edit86:setMin(0);
    obj.edit86:setField("historicoXp2_4");
    obj.edit86:setName("edit86");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox2);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(350);
    obj.layout33:setWidth(270);
    obj.layout33:setHeight(35);
    obj.layout33:setName("layout33");

    obj.radioButton39 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton39:setParent(obj.layout33);
    obj.radioButton39:setLeft(0);
    obj.radioButton39:setTop(0);
    obj.radioButton39:setGroupName("grupo1");
    obj.radioButton39:setField("dado1");
    obj.radioButton39:setFieldValue("historicoTotal2_5");
    obj.radioButton39:setName("radioButton39");

    obj.radioButton40 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton40:setParent(obj.layout33);
    obj.radioButton40:setLeft(0);
    obj.radioButton40:setTop(15);
    obj.radioButton40:setGroupName("grupo2");
    obj.radioButton40:setField("dado2");
    obj.radioButton40:setFieldValue("historicoTotal2_5");
    obj.radioButton40:setName("radioButton40");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout33);
    obj.edit87:setLeft(20);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(100);
    obj.edit87:setHeight(25);
    obj.edit87:setField("historicoNome2_5");
    obj.edit87:setName("edit87");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout33);
    obj.rectangle28:setLeft(125);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout33);
    obj.label64:setLeft(135);
    obj.label64:setTop(3);
    obj.label64:setWidth(30);
    obj.label64:setHeight(20);
    obj.label64:setField("historicoTotal2_5");
    obj.label64:setName("label64");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout33);
    obj.edit88:setLeft(165);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(30);
    obj.edit88:setHeight(25);
    obj.edit88:setType("number");
    obj.edit88:setMin(0);
    obj.edit88:setField("historicoValor2_5");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout33);
    obj.edit89:setLeft(200);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(30);
    obj.edit89:setHeight(25);
    obj.edit89:setType("number");
    obj.edit89:setMin(0);
    obj.edit89:setField("historicoBonus2_5");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout33);
    obj.edit90:setLeft(235);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(30);
    obj.edit90:setHeight(25);
    obj.edit90:setType("number");
    obj.edit90:setMin(0);
    obj.edit90:setField("historicoXp2_5");
    obj.edit90:setName("edit90");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox2);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(385);
    obj.layout34:setWidth(270);
    obj.layout34:setHeight(35);
    obj.layout34:setName("layout34");

    obj.radioButton41 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton41:setParent(obj.layout34);
    obj.radioButton41:setLeft(0);
    obj.radioButton41:setTop(0);
    obj.radioButton41:setGroupName("grupo1");
    obj.radioButton41:setField("dado1");
    obj.radioButton41:setFieldValue("historicoTotal2_6");
    obj.radioButton41:setName("radioButton41");

    obj.radioButton42 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton42:setParent(obj.layout34);
    obj.radioButton42:setLeft(0);
    obj.radioButton42:setTop(15);
    obj.radioButton42:setGroupName("grupo2");
    obj.radioButton42:setField("dado2");
    obj.radioButton42:setFieldValue("historicoTotal2_6");
    obj.radioButton42:setName("radioButton42");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout34);
    obj.edit91:setLeft(20);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(100);
    obj.edit91:setHeight(25);
    obj.edit91:setField("historicoNome2_6");
    obj.edit91:setName("edit91");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout34);
    obj.rectangle29:setLeft(125);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout34);
    obj.label65:setLeft(135);
    obj.label65:setTop(3);
    obj.label65:setWidth(30);
    obj.label65:setHeight(20);
    obj.label65:setField("historicoTotal2_6");
    obj.label65:setName("label65");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout34);
    obj.edit92:setLeft(165);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(30);
    obj.edit92:setHeight(25);
    obj.edit92:setType("number");
    obj.edit92:setMin(0);
    obj.edit92:setField("historicoValor2_6");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout34);
    obj.edit93:setLeft(200);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(30);
    obj.edit93:setHeight(25);
    obj.edit93:setType("number");
    obj.edit93:setMin(0);
    obj.edit93:setField("historicoBonus2_6");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout34);
    obj.edit94:setLeft(235);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(30);
    obj.edit94:setHeight(25);
    obj.edit94:setType("number");
    obj.edit94:setMin(0);
    obj.edit94:setField("historicoXp2_6");
    obj.edit94:setName("edit94");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox2);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(420);
    obj.layout35:setWidth(270);
    obj.layout35:setHeight(35);
    obj.layout35:setName("layout35");

    obj.radioButton43 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton43:setParent(obj.layout35);
    obj.radioButton43:setLeft(0);
    obj.radioButton43:setTop(0);
    obj.radioButton43:setGroupName("grupo1");
    obj.radioButton43:setField("dado1");
    obj.radioButton43:setFieldValue("historicoTotal3_1");
    obj.radioButton43:setName("radioButton43");

    obj.radioButton44 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton44:setParent(obj.layout35);
    obj.radioButton44:setLeft(0);
    obj.radioButton44:setTop(15);
    obj.radioButton44:setGroupName("grupo2");
    obj.radioButton44:setField("dado2");
    obj.radioButton44:setFieldValue("historicoTotal3_1");
    obj.radioButton44:setName("radioButton44");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout35);
    obj.edit95:setLeft(20);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(100);
    obj.edit95:setHeight(25);
    obj.edit95:setField("historicoNome3_1");
    obj.edit95:setName("edit95");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout35);
    obj.rectangle30:setLeft(125);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout35);
    obj.label66:setLeft(135);
    obj.label66:setTop(3);
    obj.label66:setWidth(30);
    obj.label66:setHeight(20);
    obj.label66:setField("historicoTotal3_1");
    obj.label66:setName("label66");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout35);
    obj.edit96:setLeft(165);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(30);
    obj.edit96:setHeight(25);
    obj.edit96:setType("number");
    obj.edit96:setMin(0);
    obj.edit96:setField("historicoValor3_1");
    obj.edit96:setName("edit96");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout35);
    obj.edit97:setLeft(200);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(30);
    obj.edit97:setHeight(25);
    obj.edit97:setType("number");
    obj.edit97:setMin(0);
    obj.edit97:setField("historicoBonus3_1");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout35);
    obj.edit98:setLeft(235);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(30);
    obj.edit98:setHeight(25);
    obj.edit98:setType("number");
    obj.edit98:setMin(0);
    obj.edit98:setField("historicoXp3_1");
    obj.edit98:setName("edit98");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox2);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(455);
    obj.layout36:setWidth(270);
    obj.layout36:setHeight(35);
    obj.layout36:setName("layout36");

    obj.radioButton45 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton45:setParent(obj.layout36);
    obj.radioButton45:setLeft(0);
    obj.radioButton45:setTop(0);
    obj.radioButton45:setGroupName("grupo1");
    obj.radioButton45:setField("dado1");
    obj.radioButton45:setFieldValue("historicoTotal3_2");
    obj.radioButton45:setName("radioButton45");

    obj.radioButton46 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton46:setParent(obj.layout36);
    obj.radioButton46:setLeft(0);
    obj.radioButton46:setTop(15);
    obj.radioButton46:setGroupName("grupo2");
    obj.radioButton46:setField("dado2");
    obj.radioButton46:setFieldValue("historicoTotal3_2");
    obj.radioButton46:setName("radioButton46");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout36);
    obj.edit99:setLeft(20);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(100);
    obj.edit99:setHeight(25);
    obj.edit99:setField("historicoNome3_2");
    obj.edit99:setName("edit99");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout36);
    obj.rectangle31:setLeft(125);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout36);
    obj.label67:setLeft(135);
    obj.label67:setTop(3);
    obj.label67:setWidth(30);
    obj.label67:setHeight(20);
    obj.label67:setField("historicoTotal3_2");
    obj.label67:setName("label67");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout36);
    obj.edit100:setLeft(165);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(30);
    obj.edit100:setHeight(25);
    obj.edit100:setType("number");
    obj.edit100:setMin(0);
    obj.edit100:setField("historicoValor3_2");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout36);
    obj.edit101:setLeft(200);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(30);
    obj.edit101:setHeight(25);
    obj.edit101:setType("number");
    obj.edit101:setMin(0);
    obj.edit101:setField("historicoBonus3_2");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout36);
    obj.edit102:setLeft(235);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(30);
    obj.edit102:setHeight(25);
    obj.edit102:setType("number");
    obj.edit102:setMin(0);
    obj.edit102:setField("historicoXp3_2");
    obj.edit102:setName("edit102");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox2);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(490);
    obj.layout37:setWidth(270);
    obj.layout37:setHeight(35);
    obj.layout37:setName("layout37");

    obj.radioButton47 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton47:setParent(obj.layout37);
    obj.radioButton47:setLeft(0);
    obj.radioButton47:setTop(0);
    obj.radioButton47:setGroupName("grupo1");
    obj.radioButton47:setField("dado1");
    obj.radioButton47:setFieldValue("historicoTotal3_3");
    obj.radioButton47:setName("radioButton47");

    obj.radioButton48 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton48:setParent(obj.layout37);
    obj.radioButton48:setLeft(0);
    obj.radioButton48:setTop(15);
    obj.radioButton48:setGroupName("grupo2");
    obj.radioButton48:setField("dado2");
    obj.radioButton48:setFieldValue("historicoTotal3_3");
    obj.radioButton48:setName("radioButton48");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout37);
    obj.edit103:setLeft(20);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(100);
    obj.edit103:setHeight(25);
    obj.edit103:setField("historicoNome3_3");
    obj.edit103:setName("edit103");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout37);
    obj.rectangle32:setLeft(125);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout37);
    obj.label68:setLeft(135);
    obj.label68:setTop(3);
    obj.label68:setWidth(30);
    obj.label68:setHeight(20);
    obj.label68:setField("historicoTotal3_3");
    obj.label68:setName("label68");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout37);
    obj.edit104:setLeft(165);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(30);
    obj.edit104:setHeight(25);
    obj.edit104:setType("number");
    obj.edit104:setMin(0);
    obj.edit104:setField("historicoValor3_3");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout37);
    obj.edit105:setLeft(200);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(30);
    obj.edit105:setHeight(25);
    obj.edit105:setType("number");
    obj.edit105:setMin(0);
    obj.edit105:setField("historicoBonus3_3");
    obj.edit105:setName("edit105");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout37);
    obj.edit106:setLeft(235);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(30);
    obj.edit106:setHeight(25);
    obj.edit106:setType("number");
    obj.edit106:setMin(0);
    obj.edit106:setField("historicoXp3_3");
    obj.edit106:setName("edit106");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(525);
    obj.layout38:setWidth(270);
    obj.layout38:setHeight(35);
    obj.layout38:setName("layout38");

    obj.radioButton49 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton49:setParent(obj.layout38);
    obj.radioButton49:setLeft(0);
    obj.radioButton49:setTop(0);
    obj.radioButton49:setGroupName("grupo1");
    obj.radioButton49:setField("dado1");
    obj.radioButton49:setFieldValue("historicoTotal3_4");
    obj.radioButton49:setName("radioButton49");

    obj.radioButton50 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton50:setParent(obj.layout38);
    obj.radioButton50:setLeft(0);
    obj.radioButton50:setTop(15);
    obj.radioButton50:setGroupName("grupo2");
    obj.radioButton50:setField("dado2");
    obj.radioButton50:setFieldValue("historicoTotal3_4");
    obj.radioButton50:setName("radioButton50");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout38);
    obj.edit107:setLeft(20);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(100);
    obj.edit107:setHeight(25);
    obj.edit107:setField("historicoNome3_4");
    obj.edit107:setName("edit107");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout38);
    obj.rectangle33:setLeft(125);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout38);
    obj.label69:setLeft(135);
    obj.label69:setTop(3);
    obj.label69:setWidth(30);
    obj.label69:setHeight(20);
    obj.label69:setField("historicoTotal3_4");
    obj.label69:setName("label69");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout38);
    obj.edit108:setLeft(165);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(30);
    obj.edit108:setHeight(25);
    obj.edit108:setType("number");
    obj.edit108:setMin(0);
    obj.edit108:setField("historicoValor3_4");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout38);
    obj.edit109:setLeft(200);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(30);
    obj.edit109:setHeight(25);
    obj.edit109:setType("number");
    obj.edit109:setMin(0);
    obj.edit109:setField("historicoBonus3_4");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout38);
    obj.edit110:setLeft(235);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(30);
    obj.edit110:setHeight(25);
    obj.edit110:setType("number");
    obj.edit110:setMin(0);
    obj.edit110:setField("historicoXp3_4");
    obj.edit110:setName("edit110");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox2);
    obj.layout39:setLeft(5);
    obj.layout39:setTop(560);
    obj.layout39:setWidth(270);
    obj.layout39:setHeight(35);
    obj.layout39:setName("layout39");

    obj.radioButton51 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton51:setParent(obj.layout39);
    obj.radioButton51:setLeft(0);
    obj.radioButton51:setTop(0);
    obj.radioButton51:setGroupName("grupo1");
    obj.radioButton51:setField("dado1");
    obj.radioButton51:setFieldValue("historicoTotal3_5");
    obj.radioButton51:setName("radioButton51");

    obj.radioButton52 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton52:setParent(obj.layout39);
    obj.radioButton52:setLeft(0);
    obj.radioButton52:setTop(15);
    obj.radioButton52:setGroupName("grupo2");
    obj.radioButton52:setField("dado2");
    obj.radioButton52:setFieldValue("historicoTotal3_5");
    obj.radioButton52:setName("radioButton52");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout39);
    obj.edit111:setLeft(20);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(100);
    obj.edit111:setHeight(25);
    obj.edit111:setField("historicoNome3_5");
    obj.edit111:setName("edit111");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout39);
    obj.rectangle34:setLeft(125);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout39);
    obj.label70:setLeft(135);
    obj.label70:setTop(3);
    obj.label70:setWidth(30);
    obj.label70:setHeight(20);
    obj.label70:setField("historicoTotal3_5");
    obj.label70:setName("label70");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout39);
    obj.edit112:setLeft(165);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(30);
    obj.edit112:setHeight(25);
    obj.edit112:setType("number");
    obj.edit112:setMin(0);
    obj.edit112:setField("historicoValor3_5");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout39);
    obj.edit113:setLeft(200);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(30);
    obj.edit113:setHeight(25);
    obj.edit113:setType("number");
    obj.edit113:setMin(0);
    obj.edit113:setField("historicoBonus3_5");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout39);
    obj.edit114:setLeft(235);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(30);
    obj.edit114:setHeight(25);
    obj.edit114:setType("number");
    obj.edit114:setMin(0);
    obj.edit114:setField("historicoXp3_5");
    obj.edit114:setName("edit114");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox2);
    obj.layout40:setLeft(5);
    obj.layout40:setTop(595);
    obj.layout40:setWidth(270);
    obj.layout40:setHeight(35);
    obj.layout40:setName("layout40");

    obj.radioButton53 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton53:setParent(obj.layout40);
    obj.radioButton53:setLeft(0);
    obj.radioButton53:setTop(0);
    obj.radioButton53:setGroupName("grupo1");
    obj.radioButton53:setField("dado1");
    obj.radioButton53:setFieldValue("historicoTotal3_6");
    obj.radioButton53:setName("radioButton53");

    obj.radioButton54 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton54:setParent(obj.layout40);
    obj.radioButton54:setLeft(0);
    obj.radioButton54:setTop(15);
    obj.radioButton54:setGroupName("grupo2");
    obj.radioButton54:setField("dado2");
    obj.radioButton54:setFieldValue("historicoTotal3_6");
    obj.radioButton54:setName("radioButton54");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout40);
    obj.edit115:setLeft(20);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(100);
    obj.edit115:setHeight(25);
    obj.edit115:setField("historicoNome3_6");
    obj.edit115:setName("edit115");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout40);
    obj.rectangle35:setLeft(125);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout40);
    obj.label71:setLeft(135);
    obj.label71:setTop(3);
    obj.label71:setWidth(30);
    obj.label71:setHeight(20);
    obj.label71:setField("historicoTotal3_6");
    obj.label71:setName("label71");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout40);
    obj.edit116:setLeft(165);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(30);
    obj.edit116:setHeight(25);
    obj.edit116:setType("number");
    obj.edit116:setMin(0);
    obj.edit116:setField("historicoValor3_6");
    obj.edit116:setName("edit116");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout40);
    obj.edit117:setLeft(200);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(30);
    obj.edit117:setHeight(25);
    obj.edit117:setType("number");
    obj.edit117:setMin(0);
    obj.edit117:setField("historicoBonus3_6");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout40);
    obj.edit118:setLeft(235);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(30);
    obj.edit118:setHeight(25);
    obj.edit118:setType("number");
    obj.edit118:setMin(0);
    obj.edit118:setField("historicoXp3_6");
    obj.edit118:setName("edit118");


					local function xpHistoricos()
						if sheet~=nil then
							local mod = 0;
							local valores = {   ((tonumber(sheet.historicoTotal1_1) or 0) - (tonumber(sheet.historicoXp1_1) or 0)), 
												((tonumber(sheet.historicoTotal1_2) or 0) - (tonumber(sheet.historicoXp1_2) or 0)), 
												((tonumber(sheet.historicoTotal1_3) or 0) - (tonumber(sheet.historicoXp1_3) or 0)),
												((tonumber(sheet.historicoTotal1_4) or 0) - (tonumber(sheet.historicoXp1_4) or 0)),
												((tonumber(sheet.historicoTotal1_5) or 0) - (tonumber(sheet.historicoXp1_5) or 0)),
												((tonumber(sheet.historicoTotal1_6) or 0) - (tonumber(sheet.historicoXp1_6) or 0)),
												((tonumber(sheet.historicoTotal2_1) or 0) - (tonumber(sheet.historicoXp2_1) or 0)),
												((tonumber(sheet.historicoTotal2_2) or 0) - (tonumber(sheet.historicoXp2_2) or 0)),
												((tonumber(sheet.historicoTotal2_3) or 0) - (tonumber(sheet.historicoXp2_3) or 0)),
												((tonumber(sheet.historicoTotal2_4) or 0) - (tonumber(sheet.historicoXp2_4) or 0)),
												((tonumber(sheet.historicoTotal2_5) or 0) - (tonumber(sheet.historicoXp2_5) or 0)),
												((tonumber(sheet.historicoTotal2_6) or 0) - (tonumber(sheet.historicoXp2_6) or 0)),
												((tonumber(sheet.historicoTotal3_1) or 0) - (tonumber(sheet.historicoXp3_1) or 0)),
												((tonumber(sheet.historicoTotal3_2) or 0) - (tonumber(sheet.historicoXp3_2) or 0)),
												((tonumber(sheet.historicoTotal3_3) or 0) - (tonumber(sheet.historicoXp3_3) or 0)),
												((tonumber(sheet.historicoTotal3_4) or 0) - (tonumber(sheet.historicoXp3_4) or 0)),
												((tonumber(sheet.historicoTotal3_5) or 0) - (tonumber(sheet.historicoXp3_5) or 0)),
												((tonumber(sheet.historicoTotal3_6) or 0) - (tonumber(sheet.historicoXp3_6) or 0)),
												};
							
							local limites = {	(tonumber(sheet.historicoXp1_1) or 0),
												(tonumber(sheet.historicoXp1_2) or 0),
												(tonumber(sheet.historicoXp1_3) or 0),
												(tonumber(sheet.historicoXp1_4) or 0),
												(tonumber(sheet.historicoXp1_5) or 0),
												(tonumber(sheet.historicoXp1_6) or 0),
												(tonumber(sheet.historicoXp2_1) or 0),
												(tonumber(sheet.historicoXp2_2) or 0),
												(tonumber(sheet.historicoXp2_3) or 0),
												(tonumber(sheet.historicoXp2_4) or 0),
												(tonumber(sheet.historicoXp2_5) or 0),
												(tonumber(sheet.historicoXp2_6) or 0),
												(tonumber(sheet.historicoXp3_1) or 0),
												(tonumber(sheet.historicoXp3_2) or 0),
												(tonumber(sheet.historicoXp3_3) or 0),
												(tonumber(sheet.historicoXp3_4) or 0),
												(tonumber(sheet.historicoXp3_5) or 0),
												(tonumber(sheet.historicoXp3_6) or 0)
												};
							
							for i=1, 18, 1 do
								for j=1, limites[i], 1 do
									mod = mod + (valores[i]+j)*2;
								end;
							end;

							sheet.XPhistoricos = mod;
							sheet.XPgasta = (tonumber(sheet.XPatributos) or 0) + 
											(tonumber(sheet.XPaegis) or 0) + 
											(tonumber(sheet.XPhistoricos) or 0) + 
											(tonumber(sheet.XPmisticos) or 0) + 
											(tonumber(sheet.XPaptidoes) or 0);
						end;
					end;
				


    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.scrollBox1);
    obj.layout41:setLeft(320);
    obj.layout41:setTop(400);
    obj.layout41:setWidth(300);
    obj.layout41:setHeight(180);
    obj.layout41:setName("layout41");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout41);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setXradius(15);
    obj.rectangle36:setYradius(15);
    obj.rectangle36:setCornerType("round");
    obj.rectangle36:setName("rectangle36");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout41);
    obj.label72:setLeft(0);
    obj.label72:setTop(0);
    obj.label72:setWidth(300);
    obj.label72:setHeight(20);
    obj.label72:setText("HISTORICOS MISTICOS");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout41);
    obj.label73:setLeft(25);
    obj.label73:setTop(20);
    obj.label73:setWidth(315);
    obj.label73:setHeight(20);
    obj.label73:setText(" Nome");
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout41);
    obj.label74:setLeft(135);
    obj.label74:setTop(20);
    obj.label74:setWidth(315);
    obj.label74:setHeight(20);
    obj.label74:setText("Total");
    obj.label74:setName("label74");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout41);
    obj.label75:setLeft(170);
    obj.label75:setTop(20);
    obj.label75:setWidth(315);
    obj.label75:setHeight(20);
    obj.label75:setText(" Inic");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout41);
    obj.label76:setLeft(202);
    obj.label76:setTop(20);
    obj.label76:setWidth(315);
    obj.label76:setHeight(20);
    obj.label76:setText(" Apr.");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout41);
    obj.label77:setLeft(235);
    obj.label77:setTop(20);
    obj.label77:setWidth(315);
    obj.label77:setHeight(20);
    obj.label77:setText("  XP");
    obj.label77:setName("label77");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout41);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(40);
    obj.scrollBox3:setWidth(295);
    obj.scrollBox3:setHeight(120);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.scrollBox3);
    obj.layout42:setLeft(5);
    obj.layout42:setTop(0);
    obj.layout42:setWidth(270);
    obj.layout42:setHeight(35);
    obj.layout42:setName("layout42");

    obj.radioButton55 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton55:setParent(obj.layout42);
    obj.radioButton55:setLeft(0);
    obj.radioButton55:setTop(0);
    obj.radioButton55:setGroupName("grupo1");
    obj.radioButton55:setField("dado1");
    obj.radioButton55:setFieldValue("historicoTotal1_1_m");
    obj.radioButton55:setName("radioButton55");

    obj.radioButton56 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton56:setParent(obj.layout42);
    obj.radioButton56:setLeft(0);
    obj.radioButton56:setTop(15);
    obj.radioButton56:setGroupName("grupo2");
    obj.radioButton56:setField("dado2");
    obj.radioButton56:setFieldValue("historicoTotal1_1_m");
    obj.radioButton56:setName("radioButton56");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout42);
    obj.edit119:setLeft(20);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(100);
    obj.edit119:setHeight(25);
    obj.edit119:setField("historicoNome1_1_m");
    obj.edit119:setName("edit119");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout42);
    obj.rectangle37:setLeft(125);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout42);
    obj.label78:setLeft(135);
    obj.label78:setTop(3);
    obj.label78:setWidth(30);
    obj.label78:setHeight(20);
    obj.label78:setField("historicoTotal1_1_m");
    obj.label78:setName("label78");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout42);
    obj.edit120:setLeft(165);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(30);
    obj.edit120:setHeight(25);
    obj.edit120:setType("number");
    obj.edit120:setMin(0);
    obj.edit120:setField("historicoValor1_1_m");
    obj.edit120:setName("edit120");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout42);
    obj.edit121:setLeft(200);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(30);
    obj.edit121:setHeight(25);
    obj.edit121:setType("number");
    obj.edit121:setMin(0);
    obj.edit121:setField("historicoBonus1_1_m");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout42);
    obj.edit122:setLeft(235);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(30);
    obj.edit122:setHeight(25);
    obj.edit122:setType("number");
    obj.edit122:setMin(0);
    obj.edit122:setField("historicoXp1_1_m");
    obj.edit122:setName("edit122");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox3);
    obj.layout43:setLeft(5);
    obj.layout43:setTop(35);
    obj.layout43:setWidth(270);
    obj.layout43:setHeight(35);
    obj.layout43:setName("layout43");

    obj.radioButton57 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton57:setParent(obj.layout43);
    obj.radioButton57:setLeft(0);
    obj.radioButton57:setTop(0);
    obj.radioButton57:setGroupName("grupo1");
    obj.radioButton57:setField("dado1");
    obj.radioButton57:setFieldValue("historicoTotal1_2_m");
    obj.radioButton57:setName("radioButton57");

    obj.radioButton58 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton58:setParent(obj.layout43);
    obj.radioButton58:setLeft(0);
    obj.radioButton58:setTop(15);
    obj.radioButton58:setGroupName("grupo2");
    obj.radioButton58:setField("dado2");
    obj.radioButton58:setFieldValue("historicoTotal1_2_m");
    obj.radioButton58:setName("radioButton58");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout43);
    obj.edit123:setLeft(20);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(100);
    obj.edit123:setHeight(25);
    obj.edit123:setField("historicoNome1_2_m");
    obj.edit123:setName("edit123");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout43);
    obj.rectangle38:setLeft(125);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout43);
    obj.label79:setLeft(135);
    obj.label79:setTop(3);
    obj.label79:setWidth(30);
    obj.label79:setHeight(20);
    obj.label79:setField("historicoTotal1_2_m");
    obj.label79:setName("label79");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout43);
    obj.edit124:setLeft(165);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(30);
    obj.edit124:setHeight(25);
    obj.edit124:setType("number");
    obj.edit124:setMin(0);
    obj.edit124:setField("historicoValor1_2_m");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout43);
    obj.edit125:setLeft(200);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(30);
    obj.edit125:setHeight(25);
    obj.edit125:setType("number");
    obj.edit125:setMin(0);
    obj.edit125:setField("historicoBonus1_2_m");
    obj.edit125:setName("edit125");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout43);
    obj.edit126:setLeft(235);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(30);
    obj.edit126:setHeight(25);
    obj.edit126:setType("number");
    obj.edit126:setMin(0);
    obj.edit126:setField("historicoXp1_2_m");
    obj.edit126:setName("edit126");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox3);
    obj.layout44:setLeft(5);
    obj.layout44:setTop(70);
    obj.layout44:setWidth(270);
    obj.layout44:setHeight(35);
    obj.layout44:setName("layout44");

    obj.radioButton59 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton59:setParent(obj.layout44);
    obj.radioButton59:setLeft(0);
    obj.radioButton59:setTop(0);
    obj.radioButton59:setGroupName("grupo1");
    obj.radioButton59:setField("dado1");
    obj.radioButton59:setFieldValue("historicoTotal1_3_m");
    obj.radioButton59:setName("radioButton59");

    obj.radioButton60 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton60:setParent(obj.layout44);
    obj.radioButton60:setLeft(0);
    obj.radioButton60:setTop(15);
    obj.radioButton60:setGroupName("grupo2");
    obj.radioButton60:setField("dado2");
    obj.radioButton60:setFieldValue("historicoTotal1_3_m");
    obj.radioButton60:setName("radioButton60");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout44);
    obj.edit127:setLeft(20);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(100);
    obj.edit127:setHeight(25);
    obj.edit127:setField("historicoNome1_3_m");
    obj.edit127:setName("edit127");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout44);
    obj.rectangle39:setLeft(125);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout44);
    obj.label80:setLeft(135);
    obj.label80:setTop(3);
    obj.label80:setWidth(30);
    obj.label80:setHeight(20);
    obj.label80:setField("historicoTotal1_3_m");
    obj.label80:setName("label80");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout44);
    obj.edit128:setLeft(165);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(30);
    obj.edit128:setHeight(25);
    obj.edit128:setType("number");
    obj.edit128:setMin(0);
    obj.edit128:setField("historicoValor1_3_m");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout44);
    obj.edit129:setLeft(200);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(30);
    obj.edit129:setHeight(25);
    obj.edit129:setType("number");
    obj.edit129:setMin(0);
    obj.edit129:setField("historicoBonus1_3_m");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout44);
    obj.edit130:setLeft(235);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(30);
    obj.edit130:setHeight(25);
    obj.edit130:setType("number");
    obj.edit130:setMin(0);
    obj.edit130:setField("historicoXp1_3_m");
    obj.edit130:setName("edit130");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox3);
    obj.layout45:setLeft(5);
    obj.layout45:setTop(105);
    obj.layout45:setWidth(270);
    obj.layout45:setHeight(35);
    obj.layout45:setName("layout45");

    obj.radioButton61 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton61:setParent(obj.layout45);
    obj.radioButton61:setLeft(0);
    obj.radioButton61:setTop(0);
    obj.radioButton61:setGroupName("grupo1");
    obj.radioButton61:setField("dado1");
    obj.radioButton61:setFieldValue("historicoTotal1_4_m");
    obj.radioButton61:setName("radioButton61");

    obj.radioButton62 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton62:setParent(obj.layout45);
    obj.radioButton62:setLeft(0);
    obj.radioButton62:setTop(15);
    obj.radioButton62:setGroupName("grupo2");
    obj.radioButton62:setField("dado2");
    obj.radioButton62:setFieldValue("historicoTotal1_4_m");
    obj.radioButton62:setName("radioButton62");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout45);
    obj.edit131:setLeft(20);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(100);
    obj.edit131:setHeight(25);
    obj.edit131:setField("historicoNome1_4_m");
    obj.edit131:setName("edit131");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout45);
    obj.rectangle40:setLeft(125);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout45);
    obj.label81:setLeft(135);
    obj.label81:setTop(3);
    obj.label81:setWidth(30);
    obj.label81:setHeight(20);
    obj.label81:setField("historicoTotal1_4_m");
    obj.label81:setName("label81");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout45);
    obj.edit132:setLeft(165);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(30);
    obj.edit132:setHeight(25);
    obj.edit132:setType("number");
    obj.edit132:setMin(0);
    obj.edit132:setField("historicoValor1_4_m");
    obj.edit132:setName("edit132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout45);
    obj.edit133:setLeft(200);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(30);
    obj.edit133:setHeight(25);
    obj.edit133:setType("number");
    obj.edit133:setMin(0);
    obj.edit133:setField("historicoBonus1_4_m");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout45);
    obj.edit134:setLeft(235);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(30);
    obj.edit134:setHeight(25);
    obj.edit134:setType("number");
    obj.edit134:setMin(0);
    obj.edit134:setField("historicoXp1_4_m");
    obj.edit134:setName("edit134");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox3);
    obj.layout46:setLeft(5);
    obj.layout46:setTop(140);
    obj.layout46:setWidth(270);
    obj.layout46:setHeight(35);
    obj.layout46:setName("layout46");

    obj.radioButton63 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton63:setParent(obj.layout46);
    obj.radioButton63:setLeft(0);
    obj.radioButton63:setTop(0);
    obj.radioButton63:setGroupName("grupo1");
    obj.radioButton63:setField("dado1");
    obj.radioButton63:setFieldValue("historicoTotal1_5_m");
    obj.radioButton63:setName("radioButton63");

    obj.radioButton64 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton64:setParent(obj.layout46);
    obj.radioButton64:setLeft(0);
    obj.radioButton64:setTop(15);
    obj.radioButton64:setGroupName("grupo2");
    obj.radioButton64:setField("dado2");
    obj.radioButton64:setFieldValue("historicoTotal1_5_m");
    obj.radioButton64:setName("radioButton64");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout46);
    obj.edit135:setLeft(20);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(100);
    obj.edit135:setHeight(25);
    obj.edit135:setField("historicoNome1_5_m");
    obj.edit135:setName("edit135");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout46);
    obj.rectangle41:setLeft(125);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(35);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("Black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout46);
    obj.label82:setLeft(135);
    obj.label82:setTop(3);
    obj.label82:setWidth(30);
    obj.label82:setHeight(20);
    obj.label82:setField("historicoTotal1_5_m");
    obj.label82:setName("label82");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout46);
    obj.edit136:setLeft(165);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(30);
    obj.edit136:setHeight(25);
    obj.edit136:setType("number");
    obj.edit136:setMin(0);
    obj.edit136:setField("historicoValor1_5_m");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout46);
    obj.edit137:setLeft(200);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(25);
    obj.edit137:setType("number");
    obj.edit137:setMin(0);
    obj.edit137:setField("historicoBonus1_5_m");
    obj.edit137:setName("edit137");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout46);
    obj.edit138:setLeft(235);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(30);
    obj.edit138:setHeight(25);
    obj.edit138:setType("number");
    obj.edit138:setMin(0);
    obj.edit138:setField("historicoXp1_5_m");
    obj.edit138:setName("edit138");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox3);
    obj.layout47:setLeft(5);
    obj.layout47:setTop(175);
    obj.layout47:setWidth(270);
    obj.layout47:setHeight(35);
    obj.layout47:setName("layout47");

    obj.radioButton65 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton65:setParent(obj.layout47);
    obj.radioButton65:setLeft(0);
    obj.radioButton65:setTop(0);
    obj.radioButton65:setGroupName("grupo1");
    obj.radioButton65:setField("dado1");
    obj.radioButton65:setFieldValue("historicoTotal1_6_m");
    obj.radioButton65:setName("radioButton65");

    obj.radioButton66 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton66:setParent(obj.layout47);
    obj.radioButton66:setLeft(0);
    obj.radioButton66:setTop(15);
    obj.radioButton66:setGroupName("grupo2");
    obj.radioButton66:setField("dado2");
    obj.radioButton66:setFieldValue("historicoTotal1_6_m");
    obj.radioButton66:setName("radioButton66");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout47);
    obj.edit139:setLeft(20);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(100);
    obj.edit139:setHeight(25);
    obj.edit139:setField("historicoNome1_6_m");
    obj.edit139:setName("edit139");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout47);
    obj.rectangle42:setLeft(125);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(35);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("Black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout47);
    obj.label83:setLeft(135);
    obj.label83:setTop(3);
    obj.label83:setWidth(30);
    obj.label83:setHeight(20);
    obj.label83:setField("historicoTotal1_6_m");
    obj.label83:setName("label83");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout47);
    obj.edit140:setLeft(165);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(30);
    obj.edit140:setHeight(25);
    obj.edit140:setType("number");
    obj.edit140:setMin(0);
    obj.edit140:setField("historicoValor1_6_m");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout47);
    obj.edit141:setLeft(200);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(30);
    obj.edit141:setHeight(25);
    obj.edit141:setType("number");
    obj.edit141:setMin(0);
    obj.edit141:setField("historicoBonus1_6_m");
    obj.edit141:setName("edit141");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout47);
    obj.edit142:setLeft(235);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(30);
    obj.edit142:setHeight(25);
    obj.edit142:setType("number");
    obj.edit142:setMin(0);
    obj.edit142:setField("historicoXp1_6_m");
    obj.edit142:setName("edit142");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox3);
    obj.layout48:setLeft(5);
    obj.layout48:setTop(210);
    obj.layout48:setWidth(270);
    obj.layout48:setHeight(35);
    obj.layout48:setName("layout48");

    obj.radioButton67 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton67:setParent(obj.layout48);
    obj.radioButton67:setLeft(0);
    obj.radioButton67:setTop(0);
    obj.radioButton67:setGroupName("grupo1");
    obj.radioButton67:setField("dado1");
    obj.radioButton67:setFieldValue("historicoTotal2_1_m");
    obj.radioButton67:setName("radioButton67");

    obj.radioButton68 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton68:setParent(obj.layout48);
    obj.radioButton68:setLeft(0);
    obj.radioButton68:setTop(15);
    obj.radioButton68:setGroupName("grupo2");
    obj.radioButton68:setField("dado2");
    obj.radioButton68:setFieldValue("historicoTotal2_1_m");
    obj.radioButton68:setName("radioButton68");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout48);
    obj.edit143:setLeft(20);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(100);
    obj.edit143:setHeight(25);
    obj.edit143:setField("historicoNome2_1_m");
    obj.edit143:setName("edit143");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout48);
    obj.rectangle43:setLeft(125);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(35);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("Black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout48);
    obj.label84:setLeft(135);
    obj.label84:setTop(3);
    obj.label84:setWidth(30);
    obj.label84:setHeight(20);
    obj.label84:setField("historicoTotal2_1_m");
    obj.label84:setName("label84");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout48);
    obj.edit144:setLeft(165);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(30);
    obj.edit144:setHeight(25);
    obj.edit144:setType("number");
    obj.edit144:setMin(0);
    obj.edit144:setField("historicoValor2_1_m");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout48);
    obj.edit145:setLeft(200);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(30);
    obj.edit145:setHeight(25);
    obj.edit145:setType("number");
    obj.edit145:setMin(0);
    obj.edit145:setField("historicoBonus2_1_m");
    obj.edit145:setName("edit145");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout48);
    obj.edit146:setLeft(235);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(30);
    obj.edit146:setHeight(25);
    obj.edit146:setType("number");
    obj.edit146:setMin(0);
    obj.edit146:setField("historicoXp2_1_m");
    obj.edit146:setName("edit146");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox3);
    obj.layout49:setLeft(5);
    obj.layout49:setTop(245);
    obj.layout49:setWidth(270);
    obj.layout49:setHeight(35);
    obj.layout49:setName("layout49");

    obj.radioButton69 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton69:setParent(obj.layout49);
    obj.radioButton69:setLeft(0);
    obj.radioButton69:setTop(0);
    obj.radioButton69:setGroupName("grupo1");
    obj.radioButton69:setField("dado1");
    obj.radioButton69:setFieldValue("historicoTotal2_2_m");
    obj.radioButton69:setName("radioButton69");

    obj.radioButton70 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton70:setParent(obj.layout49);
    obj.radioButton70:setLeft(0);
    obj.radioButton70:setTop(15);
    obj.radioButton70:setGroupName("grupo2");
    obj.radioButton70:setField("dado2");
    obj.radioButton70:setFieldValue("historicoTotal2_2_m");
    obj.radioButton70:setName("radioButton70");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout49);
    obj.edit147:setLeft(20);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(100);
    obj.edit147:setHeight(25);
    obj.edit147:setField("historicoNome2_2_m");
    obj.edit147:setName("edit147");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout49);
    obj.rectangle44:setLeft(125);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(35);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("Black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout49);
    obj.label85:setLeft(135);
    obj.label85:setTop(3);
    obj.label85:setWidth(30);
    obj.label85:setHeight(20);
    obj.label85:setField("historicoTotal2_2_m");
    obj.label85:setName("label85");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout49);
    obj.edit148:setLeft(165);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(30);
    obj.edit148:setHeight(25);
    obj.edit148:setType("number");
    obj.edit148:setMin(0);
    obj.edit148:setField("historicoValor2_2_m");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout49);
    obj.edit149:setLeft(200);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(25);
    obj.edit149:setType("number");
    obj.edit149:setMin(0);
    obj.edit149:setField("historicoBonus2_2_m");
    obj.edit149:setName("edit149");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout49);
    obj.edit150:setLeft(235);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(30);
    obj.edit150:setHeight(25);
    obj.edit150:setType("number");
    obj.edit150:setMin(0);
    obj.edit150:setField("historicoXp2_2_m");
    obj.edit150:setName("edit150");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox3);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(280);
    obj.layout50:setWidth(270);
    obj.layout50:setHeight(35);
    obj.layout50:setName("layout50");

    obj.radioButton71 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton71:setParent(obj.layout50);
    obj.radioButton71:setLeft(0);
    obj.radioButton71:setTop(0);
    obj.radioButton71:setGroupName("grupo1");
    obj.radioButton71:setField("dado1");
    obj.radioButton71:setFieldValue("historicoTotal2_3_m");
    obj.radioButton71:setName("radioButton71");

    obj.radioButton72 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton72:setParent(obj.layout50);
    obj.radioButton72:setLeft(0);
    obj.radioButton72:setTop(15);
    obj.radioButton72:setGroupName("grupo2");
    obj.radioButton72:setField("dado2");
    obj.radioButton72:setFieldValue("historicoTotal2_3_m");
    obj.radioButton72:setName("radioButton72");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout50);
    obj.edit151:setLeft(20);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(100);
    obj.edit151:setHeight(25);
    obj.edit151:setField("historicoNome2_3_m");
    obj.edit151:setName("edit151");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout50);
    obj.rectangle45:setLeft(125);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(35);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("Black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout50);
    obj.label86:setLeft(135);
    obj.label86:setTop(3);
    obj.label86:setWidth(30);
    obj.label86:setHeight(20);
    obj.label86:setField("historicoTotal2_3_m");
    obj.label86:setName("label86");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout50);
    obj.edit152:setLeft(165);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(30);
    obj.edit152:setHeight(25);
    obj.edit152:setType("number");
    obj.edit152:setMin(0);
    obj.edit152:setField("historicoValor2_3_m");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout50);
    obj.edit153:setLeft(200);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(30);
    obj.edit153:setHeight(25);
    obj.edit153:setType("number");
    obj.edit153:setMin(0);
    obj.edit153:setField("historicoBonus2_3_m");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout50);
    obj.edit154:setLeft(235);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(30);
    obj.edit154:setHeight(25);
    obj.edit154:setType("number");
    obj.edit154:setMin(0);
    obj.edit154:setField("historicoXp2_3_m");
    obj.edit154:setName("edit154");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox3);
    obj.layout51:setLeft(5);
    obj.layout51:setTop(315);
    obj.layout51:setWidth(270);
    obj.layout51:setHeight(35);
    obj.layout51:setName("layout51");

    obj.radioButton73 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton73:setParent(obj.layout51);
    obj.radioButton73:setLeft(0);
    obj.radioButton73:setTop(0);
    obj.radioButton73:setGroupName("grupo1");
    obj.radioButton73:setField("dado1");
    obj.radioButton73:setFieldValue("historicoTotal2_4_m");
    obj.radioButton73:setName("radioButton73");

    obj.radioButton74 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton74:setParent(obj.layout51);
    obj.radioButton74:setLeft(0);
    obj.radioButton74:setTop(15);
    obj.radioButton74:setGroupName("grupo2");
    obj.radioButton74:setField("dado2");
    obj.radioButton74:setFieldValue("historicoTotal2_4_m");
    obj.radioButton74:setName("radioButton74");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout51);
    obj.edit155:setLeft(20);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(100);
    obj.edit155:setHeight(25);
    obj.edit155:setField("historicoNome2_4_m");
    obj.edit155:setName("edit155");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout51);
    obj.rectangle46:setLeft(125);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(35);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("Black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout51);
    obj.label87:setLeft(135);
    obj.label87:setTop(3);
    obj.label87:setWidth(30);
    obj.label87:setHeight(20);
    obj.label87:setField("historicoTotal2_4_m");
    obj.label87:setName("label87");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout51);
    obj.edit156:setLeft(165);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(30);
    obj.edit156:setHeight(25);
    obj.edit156:setType("number");
    obj.edit156:setMin(0);
    obj.edit156:setField("historicoValor2_4_m");
    obj.edit156:setName("edit156");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout51);
    obj.edit157:setLeft(200);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(30);
    obj.edit157:setHeight(25);
    obj.edit157:setType("number");
    obj.edit157:setMin(0);
    obj.edit157:setField("historicoBonus2_4_m");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout51);
    obj.edit158:setLeft(235);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(30);
    obj.edit158:setHeight(25);
    obj.edit158:setType("number");
    obj.edit158:setMin(0);
    obj.edit158:setField("historicoXp2_4_m");
    obj.edit158:setName("edit158");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox3);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(350);
    obj.layout52:setWidth(270);
    obj.layout52:setHeight(35);
    obj.layout52:setName("layout52");

    obj.radioButton75 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton75:setParent(obj.layout52);
    obj.radioButton75:setLeft(0);
    obj.radioButton75:setTop(0);
    obj.radioButton75:setGroupName("grupo1");
    obj.radioButton75:setField("dado1");
    obj.radioButton75:setFieldValue("historicoTotal2_5_m");
    obj.radioButton75:setName("radioButton75");

    obj.radioButton76 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton76:setParent(obj.layout52);
    obj.radioButton76:setLeft(0);
    obj.radioButton76:setTop(15);
    obj.radioButton76:setGroupName("grupo2");
    obj.radioButton76:setField("dado2");
    obj.radioButton76:setFieldValue("historicoTotal2_5_m");
    obj.radioButton76:setName("radioButton76");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout52);
    obj.edit159:setLeft(20);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(100);
    obj.edit159:setHeight(25);
    obj.edit159:setField("historicoNome2_5_m");
    obj.edit159:setName("edit159");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout52);
    obj.rectangle47:setLeft(125);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(35);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("Black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout52);
    obj.label88:setLeft(135);
    obj.label88:setTop(3);
    obj.label88:setWidth(30);
    obj.label88:setHeight(20);
    obj.label88:setField("historicoTotal2_5_m");
    obj.label88:setName("label88");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout52);
    obj.edit160:setLeft(165);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(30);
    obj.edit160:setHeight(25);
    obj.edit160:setType("number");
    obj.edit160:setMin(0);
    obj.edit160:setField("historicoValor2_5_m");
    obj.edit160:setName("edit160");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout52);
    obj.edit161:setLeft(200);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(30);
    obj.edit161:setHeight(25);
    obj.edit161:setType("number");
    obj.edit161:setMin(0);
    obj.edit161:setField("historicoBonus2_5_m");
    obj.edit161:setName("edit161");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout52);
    obj.edit162:setLeft(235);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(30);
    obj.edit162:setHeight(25);
    obj.edit162:setType("number");
    obj.edit162:setMin(0);
    obj.edit162:setField("historicoXp2_5_m");
    obj.edit162:setName("edit162");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox3);
    obj.layout53:setLeft(5);
    obj.layout53:setTop(385);
    obj.layout53:setWidth(270);
    obj.layout53:setHeight(35);
    obj.layout53:setName("layout53");

    obj.radioButton77 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton77:setParent(obj.layout53);
    obj.radioButton77:setLeft(0);
    obj.radioButton77:setTop(0);
    obj.radioButton77:setGroupName("grupo1");
    obj.radioButton77:setField("dado1");
    obj.radioButton77:setFieldValue("historicoTotal2_6_m");
    obj.radioButton77:setName("radioButton77");

    obj.radioButton78 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton78:setParent(obj.layout53);
    obj.radioButton78:setLeft(0);
    obj.radioButton78:setTop(15);
    obj.radioButton78:setGroupName("grupo2");
    obj.radioButton78:setField("dado2");
    obj.radioButton78:setFieldValue("historicoTotal2_6_m");
    obj.radioButton78:setName("radioButton78");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout53);
    obj.edit163:setLeft(20);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(100);
    obj.edit163:setHeight(25);
    obj.edit163:setField("historicoNome2_6_m");
    obj.edit163:setName("edit163");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout53);
    obj.rectangle48:setLeft(125);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(35);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout53);
    obj.label89:setLeft(135);
    obj.label89:setTop(3);
    obj.label89:setWidth(30);
    obj.label89:setHeight(20);
    obj.label89:setField("historicoTotal2_6_m");
    obj.label89:setName("label89");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout53);
    obj.edit164:setLeft(165);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(30);
    obj.edit164:setHeight(25);
    obj.edit164:setType("number");
    obj.edit164:setMin(0);
    obj.edit164:setField("historicoValor2_6_m");
    obj.edit164:setName("edit164");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout53);
    obj.edit165:setLeft(200);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(30);
    obj.edit165:setHeight(25);
    obj.edit165:setType("number");
    obj.edit165:setMin(0);
    obj.edit165:setField("historicoBonus2_6_m");
    obj.edit165:setName("edit165");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout53);
    obj.edit166:setLeft(235);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(30);
    obj.edit166:setHeight(25);
    obj.edit166:setType("number");
    obj.edit166:setMin(0);
    obj.edit166:setField("historicoXp2_6_m");
    obj.edit166:setName("edit166");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox3);
    obj.layout54:setLeft(5);
    obj.layout54:setTop(420);
    obj.layout54:setWidth(270);
    obj.layout54:setHeight(35);
    obj.layout54:setName("layout54");

    obj.radioButton79 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton79:setParent(obj.layout54);
    obj.radioButton79:setLeft(0);
    obj.radioButton79:setTop(0);
    obj.radioButton79:setGroupName("grupo1");
    obj.radioButton79:setField("dado1");
    obj.radioButton79:setFieldValue("historicoTotal3_1_m");
    obj.radioButton79:setName("radioButton79");

    obj.radioButton80 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton80:setParent(obj.layout54);
    obj.radioButton80:setLeft(0);
    obj.radioButton80:setTop(15);
    obj.radioButton80:setGroupName("grupo2");
    obj.radioButton80:setField("dado2");
    obj.radioButton80:setFieldValue("historicoTotal3_1_m");
    obj.radioButton80:setName("radioButton80");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout54);
    obj.edit167:setLeft(20);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(100);
    obj.edit167:setHeight(25);
    obj.edit167:setField("historicoNome3_1_m");
    obj.edit167:setName("edit167");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout54);
    obj.rectangle49:setLeft(125);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(35);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("Black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout54);
    obj.label90:setLeft(135);
    obj.label90:setTop(3);
    obj.label90:setWidth(30);
    obj.label90:setHeight(20);
    obj.label90:setField("historicoTotal3_1_m");
    obj.label90:setName("label90");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout54);
    obj.edit168:setLeft(165);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(30);
    obj.edit168:setHeight(25);
    obj.edit168:setType("number");
    obj.edit168:setMin(0);
    obj.edit168:setField("historicoValor3_1_m");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout54);
    obj.edit169:setLeft(200);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(30);
    obj.edit169:setHeight(25);
    obj.edit169:setType("number");
    obj.edit169:setMin(0);
    obj.edit169:setField("historicoBonus3_1_m");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout54);
    obj.edit170:setLeft(235);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(30);
    obj.edit170:setHeight(25);
    obj.edit170:setType("number");
    obj.edit170:setMin(0);
    obj.edit170:setField("historicoXp3_1_m");
    obj.edit170:setName("edit170");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox3);
    obj.layout55:setLeft(5);
    obj.layout55:setTop(455);
    obj.layout55:setWidth(270);
    obj.layout55:setHeight(35);
    obj.layout55:setName("layout55");

    obj.radioButton81 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton81:setParent(obj.layout55);
    obj.radioButton81:setLeft(0);
    obj.radioButton81:setTop(0);
    obj.radioButton81:setGroupName("grupo1");
    obj.radioButton81:setField("dado1");
    obj.radioButton81:setFieldValue("historicoTotal3_2_m");
    obj.radioButton81:setName("radioButton81");

    obj.radioButton82 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton82:setParent(obj.layout55);
    obj.radioButton82:setLeft(0);
    obj.radioButton82:setTop(15);
    obj.radioButton82:setGroupName("grupo2");
    obj.radioButton82:setField("dado2");
    obj.radioButton82:setFieldValue("historicoTotal3_2_m");
    obj.radioButton82:setName("radioButton82");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout55);
    obj.edit171:setLeft(20);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(100);
    obj.edit171:setHeight(25);
    obj.edit171:setField("historicoNome3_2_m");
    obj.edit171:setName("edit171");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout55);
    obj.rectangle50:setLeft(125);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(35);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("Black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout55);
    obj.label91:setLeft(135);
    obj.label91:setTop(3);
    obj.label91:setWidth(30);
    obj.label91:setHeight(20);
    obj.label91:setField("historicoTotal3_2_m");
    obj.label91:setName("label91");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout55);
    obj.edit172:setLeft(165);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(30);
    obj.edit172:setHeight(25);
    obj.edit172:setType("number");
    obj.edit172:setMin(0);
    obj.edit172:setField("historicoValor3_2_m");
    obj.edit172:setName("edit172");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout55);
    obj.edit173:setLeft(200);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(30);
    obj.edit173:setHeight(25);
    obj.edit173:setType("number");
    obj.edit173:setMin(0);
    obj.edit173:setField("historicoBonus3_2_m");
    obj.edit173:setName("edit173");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout55);
    obj.edit174:setLeft(235);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(30);
    obj.edit174:setHeight(25);
    obj.edit174:setType("number");
    obj.edit174:setMin(0);
    obj.edit174:setField("historicoXp3_2_m");
    obj.edit174:setName("edit174");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox3);
    obj.layout56:setLeft(5);
    obj.layout56:setTop(490);
    obj.layout56:setWidth(270);
    obj.layout56:setHeight(35);
    obj.layout56:setName("layout56");

    obj.radioButton83 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton83:setParent(obj.layout56);
    obj.radioButton83:setLeft(0);
    obj.radioButton83:setTop(0);
    obj.radioButton83:setGroupName("grupo1");
    obj.radioButton83:setField("dado1");
    obj.radioButton83:setFieldValue("historicoTotal3_3_m");
    obj.radioButton83:setName("radioButton83");

    obj.radioButton84 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton84:setParent(obj.layout56);
    obj.radioButton84:setLeft(0);
    obj.radioButton84:setTop(15);
    obj.radioButton84:setGroupName("grupo2");
    obj.radioButton84:setField("dado2");
    obj.radioButton84:setFieldValue("historicoTotal3_3_m");
    obj.radioButton84:setName("radioButton84");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout56);
    obj.edit175:setLeft(20);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(100);
    obj.edit175:setHeight(25);
    obj.edit175:setField("historicoNome3_3_m");
    obj.edit175:setName("edit175");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout56);
    obj.rectangle51:setLeft(125);
    obj.rectangle51:setTop(0);
    obj.rectangle51:setWidth(35);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("Black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout56);
    obj.label92:setLeft(135);
    obj.label92:setTop(3);
    obj.label92:setWidth(30);
    obj.label92:setHeight(20);
    obj.label92:setField("historicoTotal3_3_m");
    obj.label92:setName("label92");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout56);
    obj.edit176:setLeft(165);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(30);
    obj.edit176:setHeight(25);
    obj.edit176:setType("number");
    obj.edit176:setMin(0);
    obj.edit176:setField("historicoValor3_3_m");
    obj.edit176:setName("edit176");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout56);
    obj.edit177:setLeft(200);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(30);
    obj.edit177:setHeight(25);
    obj.edit177:setType("number");
    obj.edit177:setMin(0);
    obj.edit177:setField("historicoBonus3_3_m");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout56);
    obj.edit178:setLeft(235);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(30);
    obj.edit178:setHeight(25);
    obj.edit178:setType("number");
    obj.edit178:setMin(0);
    obj.edit178:setField("historicoXp3_3_m");
    obj.edit178:setName("edit178");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.scrollBox3);
    obj.layout57:setLeft(5);
    obj.layout57:setTop(525);
    obj.layout57:setWidth(270);
    obj.layout57:setHeight(35);
    obj.layout57:setName("layout57");

    obj.radioButton85 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton85:setParent(obj.layout57);
    obj.radioButton85:setLeft(0);
    obj.radioButton85:setTop(0);
    obj.radioButton85:setGroupName("grupo1");
    obj.radioButton85:setField("dado1");
    obj.radioButton85:setFieldValue("historicoTotal3_4_m");
    obj.radioButton85:setName("radioButton85");

    obj.radioButton86 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton86:setParent(obj.layout57);
    obj.radioButton86:setLeft(0);
    obj.radioButton86:setTop(15);
    obj.radioButton86:setGroupName("grupo2");
    obj.radioButton86:setField("dado2");
    obj.radioButton86:setFieldValue("historicoTotal3_4_m");
    obj.radioButton86:setName("radioButton86");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout57);
    obj.edit179:setLeft(20);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(100);
    obj.edit179:setHeight(25);
    obj.edit179:setField("historicoNome3_4_m");
    obj.edit179:setName("edit179");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout57);
    obj.rectangle52:setLeft(125);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(35);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("Black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout57);
    obj.label93:setLeft(135);
    obj.label93:setTop(3);
    obj.label93:setWidth(30);
    obj.label93:setHeight(20);
    obj.label93:setField("historicoTotal3_4_m");
    obj.label93:setName("label93");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout57);
    obj.edit180:setLeft(165);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(30);
    obj.edit180:setHeight(25);
    obj.edit180:setType("number");
    obj.edit180:setMin(0);
    obj.edit180:setField("historicoValor3_4_m");
    obj.edit180:setName("edit180");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout57);
    obj.edit181:setLeft(200);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(30);
    obj.edit181:setHeight(25);
    obj.edit181:setType("number");
    obj.edit181:setMin(0);
    obj.edit181:setField("historicoBonus3_4_m");
    obj.edit181:setName("edit181");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout57);
    obj.edit182:setLeft(235);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(30);
    obj.edit182:setHeight(25);
    obj.edit182:setType("number");
    obj.edit182:setMin(0);
    obj.edit182:setField("historicoXp3_4_m");
    obj.edit182:setName("edit182");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox3);
    obj.layout58:setLeft(5);
    obj.layout58:setTop(560);
    obj.layout58:setWidth(270);
    obj.layout58:setHeight(35);
    obj.layout58:setName("layout58");

    obj.radioButton87 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton87:setParent(obj.layout58);
    obj.radioButton87:setLeft(0);
    obj.radioButton87:setTop(0);
    obj.radioButton87:setGroupName("grupo1");
    obj.radioButton87:setField("dado1");
    obj.radioButton87:setFieldValue("historicoTotal3_5_m");
    obj.radioButton87:setName("radioButton87");

    obj.radioButton88 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton88:setParent(obj.layout58);
    obj.radioButton88:setLeft(0);
    obj.radioButton88:setTop(15);
    obj.radioButton88:setGroupName("grupo2");
    obj.radioButton88:setField("dado2");
    obj.radioButton88:setFieldValue("historicoTotal3_5_m");
    obj.radioButton88:setName("radioButton88");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout58);
    obj.edit183:setLeft(20);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(100);
    obj.edit183:setHeight(25);
    obj.edit183:setField("historicoNome3_5_m");
    obj.edit183:setName("edit183");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout58);
    obj.rectangle53:setLeft(125);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(35);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("Black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout58);
    obj.label94:setLeft(135);
    obj.label94:setTop(3);
    obj.label94:setWidth(30);
    obj.label94:setHeight(20);
    obj.label94:setField("historicoTotal3_5_m");
    obj.label94:setName("label94");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout58);
    obj.edit184:setLeft(165);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(30);
    obj.edit184:setHeight(25);
    obj.edit184:setType("number");
    obj.edit184:setMin(0);
    obj.edit184:setField("historicoValor3_5_m");
    obj.edit184:setName("edit184");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout58);
    obj.edit185:setLeft(200);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(30);
    obj.edit185:setHeight(25);
    obj.edit185:setType("number");
    obj.edit185:setMin(0);
    obj.edit185:setField("historicoBonus3_5_m");
    obj.edit185:setName("edit185");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout58);
    obj.edit186:setLeft(235);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(30);
    obj.edit186:setHeight(25);
    obj.edit186:setType("number");
    obj.edit186:setMin(0);
    obj.edit186:setField("historicoXp3_5_m");
    obj.edit186:setName("edit186");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox3);
    obj.layout59:setLeft(5);
    obj.layout59:setTop(595);
    obj.layout59:setWidth(270);
    obj.layout59:setHeight(35);
    obj.layout59:setName("layout59");

    obj.radioButton89 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton89:setParent(obj.layout59);
    obj.radioButton89:setLeft(0);
    obj.radioButton89:setTop(0);
    obj.radioButton89:setGroupName("grupo1");
    obj.radioButton89:setField("dado1");
    obj.radioButton89:setFieldValue("historicoTotal3_6_m");
    obj.radioButton89:setName("radioButton89");

    obj.radioButton90 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton90:setParent(obj.layout59);
    obj.radioButton90:setLeft(0);
    obj.radioButton90:setTop(15);
    obj.radioButton90:setGroupName("grupo2");
    obj.radioButton90:setField("dado2");
    obj.radioButton90:setFieldValue("historicoTotal3_6_m");
    obj.radioButton90:setName("radioButton90");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout59);
    obj.edit187:setLeft(20);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(100);
    obj.edit187:setHeight(25);
    obj.edit187:setField("historicoNome3_6_m");
    obj.edit187:setName("edit187");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout59);
    obj.rectangle54:setLeft(125);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(35);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("Black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout59);
    obj.label95:setLeft(135);
    obj.label95:setTop(3);
    obj.label95:setWidth(30);
    obj.label95:setHeight(20);
    obj.label95:setField("historicoTotal3_6_m");
    obj.label95:setName("label95");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout59);
    obj.edit188:setLeft(165);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(30);
    obj.edit188:setHeight(25);
    obj.edit188:setType("number");
    obj.edit188:setMin(0);
    obj.edit188:setField("historicoValor3_6_m");
    obj.edit188:setName("edit188");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout59);
    obj.edit189:setLeft(200);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(30);
    obj.edit189:setHeight(25);
    obj.edit189:setType("number");
    obj.edit189:setMin(0);
    obj.edit189:setField("historicoBonus3_6_m");
    obj.edit189:setName("edit189");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout59);
    obj.edit190:setLeft(235);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(30);
    obj.edit190:setHeight(25);
    obj.edit190:setType("number");
    obj.edit190:setMin(0);
    obj.edit190:setField("historicoXp3_6_m");
    obj.edit190:setName("edit190");


					local function xpMisticos()
						if sheet~=nil then
							local mod = 0;
							local valores = {   ((tonumber(sheet.historicoTotal1_1_m) or 0) - (tonumber(sheet.historicoXp1_1_m) or 0)), 
												((tonumber(sheet.historicoTotal1_2_m) or 0) - (tonumber(sheet.historicoXp1_2_m) or 0)), 
												((tonumber(sheet.historicoTotal1_3_m) or 0) - (tonumber(sheet.historicoXp1_3_m) or 0)),
												((tonumber(sheet.historicoTotal1_4_m) or 0) - (tonumber(sheet.historicoXp1_4_m) or 0)),
												((tonumber(sheet.historicoTotal1_5_m) or 0) - (tonumber(sheet.historicoXp1_5_m) or 0)),
												((tonumber(sheet.historicoTotal1_6_m) or 0) - (tonumber(sheet.historicoXp1_6_m) or 0)),
												((tonumber(sheet.historicoTotal2_1_m) or 0) - (tonumber(sheet.historicoXp2_1_m) or 0)),
												((tonumber(sheet.historicoTotal2_2_m) or 0) - (tonumber(sheet.historicoXp2_2_m) or 0)),
												((tonumber(sheet.historicoTotal2_3_m) or 0) - (tonumber(sheet.historicoXp2_3_m) or 0)),
												((tonumber(sheet.historicoTotal2_4_m) or 0) - (tonumber(sheet.historicoXp2_4_m) or 0)),
												((tonumber(sheet.historicoTotal2_5_m) or 0) - (tonumber(sheet.historicoXp2_5_m) or 0)),
												((tonumber(sheet.historicoTotal2_6_m) or 0) - (tonumber(sheet.historicoXp2_6_m) or 0)),
												((tonumber(sheet.historicoTotal3_1_m) or 0) - (tonumber(sheet.historicoXp3_1_m) or 0)),
												((tonumber(sheet.historicoTotal3_2_m) or 0) - (tonumber(sheet.historicoXp3_2_m) or 0)),
												((tonumber(sheet.historicoTotal3_3_m) or 0) - (tonumber(sheet.historicoXp3_3_m) or 0)),
												((tonumber(sheet.historicoTotal3_4_m) or 0) - (tonumber(sheet.historicoXp3_4_m) or 0)),
												((tonumber(sheet.historicoTotal3_5_m) or 0) - (tonumber(sheet.historicoXp3_5_m) or 0)),
												((tonumber(sheet.historicoTotal3_6_m) or 0) - (tonumber(sheet.historicoXp3_6_m) or 0)),
												};
							
							local limites = {	(tonumber(sheet.historicoXp1_1_m) or 0),
												(tonumber(sheet.historicoXp1_2_m) or 0),
												(tonumber(sheet.historicoXp1_3_m) or 0),
												(tonumber(sheet.historicoXp1_4_m) or 0),
												(tonumber(sheet.historicoXp1_5_m) or 0),
												(tonumber(sheet.historicoXp1_6_m) or 0),
												(tonumber(sheet.historicoXp2_1_m) or 0),
												(tonumber(sheet.historicoXp2_2_m) or 0),
												(tonumber(sheet.historicoXp2_3_m) or 0),
												(tonumber(sheet.historicoXp2_4_m) or 0),
												(tonumber(sheet.historicoXp2_5_m) or 0),
												(tonumber(sheet.historicoXp2_6_m) or 0),
												(tonumber(sheet.historicoXp3_1_m) or 0),
												(tonumber(sheet.historicoXp3_2_m) or 0),
												(tonumber(sheet.historicoXp3_3_m) or 0),
												(tonumber(sheet.historicoXp3_4_m) or 0),
												(tonumber(sheet.historicoXp3_5_m) or 0),
												(tonumber(sheet.historicoXp3_6_m) or 0)
												};
							
							for i=1, 18, 1 do
								for j=1, limites[i], 1 do
									mod = mod + (valores[i]+j)*5;
								end;
							end;

							sheet.XPmisticos = mod;
							sheet.XPgasta = (tonumber(sheet.XPatributos) or 0) + 
											(tonumber(sheet.XPaegis) or 0) + 
											(tonumber(sheet.XPhistoricos) or 0) + 
											(tonumber(sheet.XPmisticos) or 0) + 
											(tonumber(sheet.XPaptidoes) or 0);
						end;
					end;
				


    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.scrollBox1);
    obj.layout60:setLeft(625);
    obj.layout60:setTop(75);
    obj.layout60:setWidth(210);
    obj.layout60:setHeight(450);
    obj.layout60:setName("layout60");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout60);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setColor("black");
    obj.rectangle55:setXradius(15);
    obj.rectangle55:setYradius(15);
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setName("rectangle55");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout60);
    obj.label96:setLeft(5);
    obj.label96:setTop(0);
    obj.label96:setWidth(210);
    obj.label96:setHeight(20);
    obj.label96:setText("SAÚDE");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.horzLine3 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout60);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(25);
    obj.horzLine3:setWidth(210);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setLeft(0);
    obj.layout61:setTop(30);
    obj.layout61:setWidth(210);
    obj.layout61:setHeight(60);
    obj.layout61:setName("layout61");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout61);
    obj.label97:setLeft(10);
    obj.label97:setTop(0);
    obj.label97:setWidth(95);
    obj.label97:setHeight(20);
    obj.label97:setText("LEVE");
    obj.label97:setName("label97");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.layout61);
    obj.flowLayout1:setLeft(100);
    obj.flowLayout1:setTop(0);
    obj.flowLayout1:setHeight(100);
    obj.flowLayout1:setWidth(60);
    obj.flowLayout1:setName("flowLayout1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout1);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("check1_1_1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout1);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setField("check2_1_1");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowLayout1);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setField("check3_1_1");
    obj.checkBox3:setName("checkBox3");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout1);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowLayout1);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("check1_2_1");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowLayout1);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("check2_2_1");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowLayout1);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("check3_2_1");
    obj.checkBox6:setName("checkBox6");

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout1);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowLayout1);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("check1_3_1");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowLayout1);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("check2_3_1");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowLayout1);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setField("check3_3_1");
    obj.checkBox9:setName("checkBox9");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout1);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout61);
    obj.edit191:setLeft(170);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(30);
    obj.edit191:setHeight(25);
    obj.edit191:setField("penalidade1");
    obj.edit191:setName("edit191");


				local function isAny1()
					local mod = sheet.check1_1_1 or sheet.check2_1_1 or sheet.check3_1_1;
					local quantidade = tonumber(3);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_1 or sheet.check2_2_1 or sheet.check3_2_1;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_1 or sheet.check2_3_1 or sheet.check3_3_1;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_1 or sheet.check2_4_1 or sheet.check3_4_1;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_1 or sheet.check2_5_1 or sheet.check3_5_1;
					end;
					return mod;
				end;
			


    obj.horzLine4 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout60);
    obj.horzLine4:setLeft(0);
    obj.horzLine4:setTop(95);
    obj.horzLine4:setWidth(210);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setName("horzLine4");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout60);
    obj.layout62:setLeft(0);
    obj.layout62:setTop(100);
    obj.layout62:setWidth(210);
    obj.layout62:setHeight(40);
    obj.layout62:setName("layout62");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout62);
    obj.label98:setLeft(10);
    obj.label98:setTop(0);
    obj.label98:setWidth(95);
    obj.label98:setHeight(20);
    obj.label98:setText("MEDIO");
    obj.label98:setName("label98");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layout62);
    obj.flowLayout2:setLeft(100);
    obj.flowLayout2:setTop(0);
    obj.flowLayout2:setHeight(100);
    obj.flowLayout2:setWidth(60);
    obj.flowLayout2:setName("flowLayout2");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowLayout2);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setField("check1_1_2");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowLayout2);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setField("check2_1_2");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowLayout2);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setField("check3_1_2");
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak4 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout2);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowLayout2);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setField("check1_2_2");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowLayout2);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setField("check2_2_2");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowLayout2);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setField("check3_2_2");
    obj.checkBox15:setName("checkBox15");

    obj.flowLineBreak5 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout2);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout62);
    obj.edit192:setLeft(170);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(30);
    obj.edit192:setHeight(25);
    obj.edit192:setField("penalidade2");
    obj.edit192:setName("edit192");


				local function isAny2()
					local mod = sheet.check1_1_2 or sheet.check2_1_2 or sheet.check3_1_2;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_2 or sheet.check2_2_2 or sheet.check3_2_2;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_2 or sheet.check2_3_2 or sheet.check3_3_2;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_2 or sheet.check2_4_2 or sheet.check3_4_2;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_2 or sheet.check2_5_2 or sheet.check3_5_2;
					end;
					return mod;
				end;
			


    obj.horzLine5 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout60);
    obj.horzLine5:setLeft(0);
    obj.horzLine5:setTop(145);
    obj.horzLine5:setWidth(210);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setName("horzLine5");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout60);
    obj.layout63:setLeft(0);
    obj.layout63:setTop(150);
    obj.layout63:setWidth(210);
    obj.layout63:setHeight(40);
    obj.layout63:setName("layout63");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout63);
    obj.label99:setLeft(10);
    obj.label99:setTop(0);
    obj.label99:setWidth(95);
    obj.label99:setHeight(20);
    obj.label99:setText("SERIO");
    obj.label99:setName("label99");

    obj.flowLayout3 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.layout63);
    obj.flowLayout3:setLeft(100);
    obj.flowLayout3:setTop(0);
    obj.flowLayout3:setHeight(100);
    obj.flowLayout3:setWidth(60);
    obj.flowLayout3:setName("flowLayout3");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowLayout3);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setField("check1_1_3");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowLayout3);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setField("check2_1_3");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowLayout3);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setField("check3_1_3");
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout3);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowLayout3);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setField("check1_2_3");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowLayout3);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setField("check2_2_3");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowLayout3);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setWidth(20);
    obj.checkBox21:setField("check3_2_3");
    obj.checkBox21:setName("checkBox21");

    obj.flowLineBreak7 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout3);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout63);
    obj.edit193:setLeft(170);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(30);
    obj.edit193:setHeight(25);
    obj.edit193:setField("penalidade3");
    obj.edit193:setName("edit193");


				local function isAny3()
					local mod = sheet.check1_1_3 or sheet.check2_1_3 or sheet.check3_1_3;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_3 or sheet.check2_2_3 or sheet.check3_2_3;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_3 or sheet.check2_3_3 or sheet.check3_3_3;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_3 or sheet.check2_4_3 or sheet.check3_4_3;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_3 or sheet.check2_5_3 or sheet.check3_5_3;
					end;
					return mod;
				end;
			


    obj.horzLine6 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout60);
    obj.horzLine6:setLeft(0);
    obj.horzLine6:setTop(195);
    obj.horzLine6:setWidth(210);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setName("horzLine6");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout60);
    obj.layout64:setLeft(0);
    obj.layout64:setTop(200);
    obj.layout64:setWidth(210);
    obj.layout64:setHeight(40);
    obj.layout64:setName("layout64");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout64);
    obj.label100:setLeft(10);
    obj.label100:setTop(0);
    obj.label100:setWidth(95);
    obj.label100:setHeight(20);
    obj.label100:setText("GRAVE");
    obj.label100:setName("label100");

    obj.flowLayout4 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.layout64);
    obj.flowLayout4:setLeft(100);
    obj.flowLayout4:setTop(0);
    obj.flowLayout4:setHeight(100);
    obj.flowLayout4:setWidth(60);
    obj.flowLayout4:setName("flowLayout4");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowLayout4);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setField("check1_1_4");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowLayout4);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setField("check2_1_4");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowLayout4);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setField("check3_1_4");
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak8 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout4);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowLayout4);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setWidth(20);
    obj.checkBox25:setField("check1_2_4");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowLayout4);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setWidth(20);
    obj.checkBox26:setField("check2_2_4");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.flowLayout4);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setWidth(20);
    obj.checkBox27:setField("check3_2_4");
    obj.checkBox27:setName("checkBox27");

    obj.flowLineBreak9 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout4);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout64);
    obj.edit194:setLeft(170);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(30);
    obj.edit194:setHeight(25);
    obj.edit194:setField("penalidade4");
    obj.edit194:setName("edit194");


				local function isAny4()
					local mod = sheet.check1_1_4 or sheet.check2_1_4 or sheet.check3_1_4;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_4 or sheet.check2_2_4 or sheet.check3_2_4;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_4 or sheet.check2_3_4 or sheet.check3_3_4;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_4 or sheet.check2_4_4 or sheet.check3_4_4;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_4 or sheet.check2_5_4 or sheet.check3_5_4;
					end;
					return mod;
				end;
			


    obj.horzLine7 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout60);
    obj.horzLine7:setLeft(0);
    obj.horzLine7:setTop(245);
    obj.horzLine7:setWidth(210);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setName("horzLine7");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout60);
    obj.layout65:setLeft(0);
    obj.layout65:setTop(250);
    obj.layout65:setWidth(210);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout65);
    obj.label101:setLeft(10);
    obj.label101:setTop(0);
    obj.label101:setWidth(95);
    obj.label101:setHeight(20);
    obj.label101:setText("INCAPACITADO");
    obj.label101:setName("label101");

    obj.flowLayout5 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layout65);
    obj.flowLayout5:setLeft(100);
    obj.flowLayout5:setTop(0);
    obj.flowLayout5:setHeight(100);
    obj.flowLayout5:setWidth(60);
    obj.flowLayout5:setName("flowLayout5");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.flowLayout5);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setWidth(20);
    obj.checkBox28:setField("check1_1_5");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.flowLayout5);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setField("check2_1_5");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.flowLayout5);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setWidth(20);
    obj.checkBox30:setField("check3_1_5");
    obj.checkBox30:setName("checkBox30");

    obj.flowLineBreak10 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout5);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout65);
    obj.edit195:setLeft(170);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(30);
    obj.edit195:setHeight(25);
    obj.edit195:setField("penalidade5");
    obj.edit195:setName("edit195");


				local function isAny5()
					local mod = sheet.check1_1_5 or sheet.check2_1_5 or sheet.check3_1_5;
					local quantidade = tonumber(1);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_5 or sheet.check2_2_5 or sheet.check3_2_5;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_5 or sheet.check2_3_5 or sheet.check3_3_5;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_5 or sheet.check2_4_5 or sheet.check3_4_5;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_5 or sheet.check2_5_5 or sheet.check3_5_5;
					end;
					return mod;
				end;
			


    obj.horzLine8 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout60);
    obj.horzLine8:setLeft(0);
    obj.horzLine8:setTop(280);
    obj.horzLine8:setWidth(210);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setName("horzLine8");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout60);
    obj.layout66:setLeft(0);
    obj.layout66:setTop(285);
    obj.layout66:setWidth(210);
    obj.layout66:setHeight(100);
    obj.layout66:setName("layout66");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout66);
    obj.label102:setLeft(10);
    obj.label102:setTop(0);
    obj.label102:setWidth(95);
    obj.label102:setHeight(20);
    obj.label102:setText("INCOSCIENTE");
    obj.label102:setName("label102");

    obj.flowLayout6 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.layout66);
    obj.flowLayout6:setLeft(100);
    obj.flowLayout6:setTop(0);
    obj.flowLayout6:setHeight(100);
    obj.flowLayout6:setWidth(60);
    obj.flowLayout6:setName("flowLayout6");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.flowLayout6);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setWidth(20);
    obj.checkBox31:setField("check1_1_6");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.flowLayout6);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setWidth(20);
    obj.checkBox32:setField("check2_1_6");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.flowLayout6);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setWidth(20);
    obj.checkBox33:setField("check3_1_6");
    obj.checkBox33:setName("checkBox33");

    obj.flowLineBreak11 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout6);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.flowLayout6);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setWidth(20);
    obj.checkBox34:setField("check1_2_6");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.flowLayout6);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setWidth(20);
    obj.checkBox35:setField("check2_2_6");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.flowLayout6);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setWidth(20);
    obj.checkBox36:setField("check3_2_6");
    obj.checkBox36:setName("checkBox36");

    obj.flowLineBreak12 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout6);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.checkBox37 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.flowLayout6);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setWidth(20);
    obj.checkBox37:setField("check1_3_6");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.flowLayout6);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setWidth(20);
    obj.checkBox38:setField("check2_3_6");
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.flowLayout6);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setWidth(20);
    obj.checkBox39:setField("check3_3_6");
    obj.checkBox39:setName("checkBox39");

    obj.flowLineBreak13 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout6);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.checkBox40 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.flowLayout6);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setWidth(20);
    obj.checkBox40:setField("check1_4_6");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.flowLayout6);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setWidth(20);
    obj.checkBox41:setField("check2_4_6");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.flowLayout6);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setWidth(20);
    obj.checkBox42:setField("check3_4_6");
    obj.checkBox42:setName("checkBox42");

    obj.flowLineBreak14 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout6);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.checkBox43 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.flowLayout6);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setWidth(20);
    obj.checkBox43:setField("check1_5_6");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.flowLayout6);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setWidth(20);
    obj.checkBox44:setField("check2_5_6");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.flowLayout6);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setWidth(20);
    obj.checkBox45:setField("check3_5_6");
    obj.checkBox45:setName("checkBox45");

    obj.flowLineBreak15 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout6);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout66);
    obj.edit196:setLeft(170);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(30);
    obj.edit196:setHeight(25);
    obj.edit196:setField("penalidade6");
    obj.edit196:setName("edit196");


				local function isAny6()
					local mod = sheet.check1_1_6 or sheet.check2_1_6 or sheet.check3_1_6;
					local quantidade = tonumber(5);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_6 or sheet.check2_2_6 or sheet.check3_2_6;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_6 or sheet.check2_3_6 or sheet.check3_3_6;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_6 or sheet.check2_4_6 or sheet.check3_4_6;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_6 or sheet.check2_5_6 or sheet.check3_5_6;
					end;
					return mod;
				end;
			


    obj.horzLine9 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout60);
    obj.horzLine9:setLeft(0);
    obj.horzLine9:setTop(385);
    obj.horzLine9:setWidth(210);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setName("horzLine9");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout60);
    obj.label103:setLeft(5);
    obj.label103:setTop(415);
    obj.label103:setWidth(60);
    obj.label103:setHeight(20);
    obj.label103:setText("Absorção");
    obj.label103:setName("label103");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout60);
    obj.label104:setLeft(65);
    obj.label104:setTop(390);
    obj.label104:setWidth(30);
    obj.label104:setHeight(20);
    obj.label104:setText("Total");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout60);
    obj.rectangle56:setLeft(65);
    obj.rectangle56:setTop(415);
    obj.rectangle56:setWidth(30);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("Black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout60);
    obj.label105:setLeft(65);
    obj.label105:setTop(415);
    obj.label105:setWidth(30);
    obj.label105:setHeight(25);
    obj.label105:setField("absorcao");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout60);
    obj.label106:setLeft(100);
    obj.label106:setTop(390);
    obj.label106:setWidth(30);
    obj.label106:setHeight(20);
    obj.label106:setText(" Res.");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout60);
    obj.rectangle57:setLeft(100);
    obj.rectangle57:setTop(415);
    obj.rectangle57:setWidth(30);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("Black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout60);
    obj.label107:setLeft(100);
    obj.label107:setTop(415);
    obj.label107:setWidth(30);
    obj.label107:setHeight(25);
    obj.label107:setField("absRes");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout60);
    obj.dataLink11:setField("totalresiliencia");
    obj.dataLink11:setName("dataLink11");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout60);
    obj.label108:setLeft(135);
    obj.label108:setTop(390);
    obj.label108:setWidth(30);
    obj.label108:setHeight(20);
    obj.label108:setText("Arm");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout60);
    obj.rectangle58:setLeft(135);
    obj.rectangle58:setTop(415);
    obj.rectangle58:setWidth(30);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("Black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout60);
    obj.label109:setLeft(135);
    obj.label109:setTop(415);
    obj.label109:setWidth(30);
    obj.label109:setHeight(25);
    obj.label109:setField("indiceArmadura");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout60);
    obj.label110:setLeft(170);
    obj.label110:setTop(390);
    obj.label110:setWidth(30);
    obj.label110:setHeight(20);
    obj.label110:setText(" Out.");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout60);
    obj.edit197:setLeft(170);
    obj.edit197:setTop(415);
    obj.edit197:setWidth(30);
    obj.edit197:setHeight(25);
    obj.edit197:setType("number");
    obj.edit197:setField("absOutros");
    obj.edit197:setName("edit197");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout60);
    obj.dataLink12:setFields({'absRes', 'indiceArmadura', 'absOutros'});
    obj.dataLink12:setName("dataLink12");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox1);
    obj.layout67:setLeft(0);
    obj.layout67:setTop(515);
    obj.layout67:setWidth(315);
    obj.layout67:setHeight(70);
    obj.layout67:setName("layout67");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout67);
    obj.rectangle59:setAlign("client");
    obj.rectangle59:setColor("black");
    obj.rectangle59:setXradius(15);
    obj.rectangle59:setYradius(15);
    obj.rectangle59:setCornerType("round");
    obj.rectangle59:setName("rectangle59");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout67);
    obj.button2:setLeft(10);
    obj.button2:setTop(10);
    obj.button2:setWidth(70);
    obj.button2:setHeight(20);
    obj.button2:setText("Iniciativa");
    obj.button2:setName("button2");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout67);
    obj.rectangle60:setLeft(90);
    obj.rectangle60:setTop(10);
    obj.rectangle60:setWidth(35);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("Black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout67);
    obj.label111:setLeft(100);
    obj.label111:setTop(10);
    obj.label111:setWidth(30);
    obj.label111:setHeight(20);
    obj.label111:setField("iniciativa");
    obj.label111:setName("label111");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout67);
    obj.edit198:setLeft(135);
    obj.edit198:setTop(10);
    obj.edit198:setWidth(30);
    obj.edit198:setHeight(25);
    obj.edit198:setType("number");
    obj.edit198:setField("iniciativaBonus");
    obj.edit198:setName("edit198");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout67);
    obj.label112:setLeft(190);
    obj.label112:setTop(10);
    obj.label112:setWidth(100);
    obj.label112:setHeight(20);
    obj.label112:setField("ms");
    obj.label112:setName("label112");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout67);
    obj.label113:setLeft(10);
    obj.label113:setTop(40);
    obj.label113:setWidth(90);
    obj.label113:setHeight(20);
    obj.label113:setText("Velocidade");
    obj.label113:setName("label113");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout67);
    obj.rectangle61:setLeft(90);
    obj.rectangle61:setTop(40);
    obj.rectangle61:setWidth(35);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("Black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout67);
    obj.label114:setLeft(100);
    obj.label114:setTop(40);
    obj.label114:setWidth(30);
    obj.label114:setHeight(20);
    obj.label114:setField("velocidade");
    obj.label114:setName("label114");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout67);
    obj.edit199:setLeft(135);
    obj.edit199:setTop(40);
    obj.edit199:setWidth(30);
    obj.edit199:setHeight(25);
    obj.edit199:setType("number");
    obj.edit199:setField("velocidadeBonus");
    obj.edit199:setName("edit199");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout67);
    obj.label115:setLeft(190);
    obj.label115:setTop(40);
    obj.label115:setWidth(100);
    obj.label115:setHeight(20);
    obj.label115:setField("kmh");
    obj.label115:setName("label115");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout67);
    obj.dataLink13:setFields({'totalforca', 'totalagilidade', 'totalperspicacia', 'iniciativaBonus', 'velocidadeBonus'});
    obj.dataLink13:setName("dataLink13");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.scrollBox1);
    obj.layout68:setLeft(840);
    obj.layout68:setTop(455);
    obj.layout68:setWidth(300);
    obj.layout68:setHeight(70);
    obj.layout68:setName("layout68");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout68);
    obj.rectangle62:setLeft(0);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(300);
    obj.rectangle62:setHeight(70);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setXradius(15);
    obj.rectangle62:setYradius(15);
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setName("rectangle62");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout68);
    obj.rectangle63:setLeft(10);
    obj.rectangle63:setTop(30);
    obj.rectangle63:setWidth(35);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("Black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout68);
    obj.label116:setLeft(5);
    obj.label116:setTop(10);
    obj.label116:setWidth(50);
    obj.label116:setHeight(20);
    obj.label116:setText("Dado 1");
    obj.label116:setName("label116");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout68);
    obj.label117:setLeft(20);
    obj.label117:setTop(32);
    obj.label117:setWidth(30);
    obj.label117:setHeight(20);
    obj.label117:setField("num1");
    obj.label117:setText("val");
    obj.label117:setName("label117");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout68);
    obj.label118:setLeft(46);
    obj.label118:setTop(32);
    obj.label118:setWidth(10);
    obj.label118:setHeight(20);
    obj.label118:setText("+");
    obj.label118:setName("label118");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout68);
    obj.rectangle64:setLeft(55);
    obj.rectangle64:setTop(30);
    obj.rectangle64:setWidth(35);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("Black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout68);
    obj.label119:setLeft(50);
    obj.label119:setTop(10);
    obj.label119:setWidth(50);
    obj.label119:setHeight(20);
    obj.label119:setText("Dado 2");
    obj.label119:setName("label119");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout68);
    obj.label120:setLeft(65);
    obj.label120:setTop(32);
    obj.label120:setWidth(30);
    obj.label120:setHeight(20);
    obj.label120:setField("num2");
    obj.label120:setText("val");
    obj.label120:setName("label120");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout68);
    obj.label121:setLeft(92);
    obj.label121:setTop(32);
    obj.label121:setWidth(10);
    obj.label121:setHeight(20);
    obj.label121:setText("+");
    obj.label121:setName("label121");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout68);
    obj.label122:setLeft(105);
    obj.label122:setTop(10);
    obj.label122:setWidth(40);
    obj.label122:setHeight(20);
    obj.label122:setText("Especs");
    obj.label122:setName("label122");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout68);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'0', '1,5', '3'});
    obj.comboBox1:setValues({'0', '1', '2'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setField("especBonus");
    obj.comboBox1:setName("comboBox1");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout68);
    obj.label123:setLeft(160);
    obj.label123:setTop(10);
    obj.label123:setWidth(40);
    obj.label123:setHeight(20);
    obj.label123:setText("Extra");
    obj.label123:setName("label123");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout68);
    obj.edit200:setLeft(160);
    obj.edit200:setTop(30);
    obj.edit200:setWidth(30);
    obj.edit200:setHeight(25);
    obj.edit200:setField("extra");
    obj.edit200:setName("edit200");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout68);
    obj.label124:setLeft(195);
    obj.label124:setTop(10);
    obj.label124:setWidth(40);
    obj.label124:setHeight(20);
    obj.label124:setText("Dific.");
    obj.label124:setName("label124");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout68);
    obj.edit201:setLeft(195);
    obj.edit201:setTop(30);
    obj.edit201:setWidth(30);
    obj.edit201:setHeight(25);
    obj.edit201:setField("dificuldade");
    obj.edit201:setType("number");
    obj.edit201:setName("edit201");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout68);
    obj.button3:setLeft(230);
    obj.button3:setTop(30);
    obj.button3:setWidth(50);
    obj.button3:setText("ROLAR");
    obj.button3:setName("button3");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.scrollBox1);
    obj.rectangle65:setLeft(840);
    obj.rectangle65:setTop(90);
    obj.rectangle65:setWidth(350);
    obj.rectangle65:setHeight(350);
    obj.rectangle65:setColor("DimGray");
    obj.rectangle65:setXradius(5);
    obj.rectangle65:setYradius(5);
    obj.rectangle65:setCornerType("innerLine");
    obj.rectangle65:setName("rectangle65");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(840);
    obj.image1:setTop(90);
    obj.image1:setWidth(350);
    obj.image1:setHeight(350);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.scrollBox1);
    obj.label125:setLeft(0);
    obj.label125:setTop(595);
    obj.label125:setWidth(600);
    obj.label125:setHeight(20);
    obj.label125:setField("audit");
    obj.label125:setName("label125");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.scrollBox1);
    obj.dataLink14:setFields({'inicialconsciencia', 'inicialespirito', 'inicialperseveranca', 'inicialforca', 'inicialagilidade', 'inicialresiliencia', 'inicialcarisma', 'inicialpercepcao', 'inicialperspicacia', 'base0_1', 'base0_2', 'base0_3', 'base0_4', 'base0_5', 'base0_6', 'base0_7', 'base0_8', 'base0_9', 'base0_10', 'base0_11', 'base0_12', 'base1_1', 'base1_2', 'base1_3', 'base1_4', 'base1_5', 'base1_6', 'base1_7', 'base1_8', 'base1_9', 'base1_10', 'base1_11', 'base1_12', 'base2_1', 'base2_2', 'base2_3', 'base2_4', 'base2_5', 'base2_6', 'base2_7', 'base2_8', 'base2_9', 'base2_10', 'base2_11', 'base2_12', 'base3_1', 'base3_2', 'base3_3', 'base3_4', 'base3_5', 'base3_6', 'base3_7', 'base3_8', 'base3_9', 'base3_10', 'base3_11', 'base3_12', 'historicoValor1_1', 'historicoValor1_2', 'historicoValor1_3', 'historicoValor1_4', 'historicoValor1_5', 'historicoValor1_6', 'historicoValor2_1', 'historicoValor2_2', 'historicoValor2_3', 'historicoValor2_4', 'historicoValor2_5', 'historicoValor2_6', 'historicoValor3_1', 'historicoValor3_2', 'historicoValor3_3', 'historicoValor3_4', 'historicoValor3_5', 'historicoValor3_6'});
    obj.dataLink14:setName("dataLink14");


			local function rolar()
				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                local mod = (tonumber(sheet[sheet.dado1]) or 0) + (tonumber(sheet[sheet.dado2]) or 0) + (tonumber(sheet.extra) or 0);
                if sheet.especBonus=='1' then
                	mod = mod + 1.5;
                elseif sheet.especBonus=='2' then
                	mod = mod + 3;
                end;
				local pen = 0;
				if isAny6() then
					pen = tonumber(sheet.penalidade6) or 0;
				elseif isAny5() then
					pen = tonumber(sheet.penalidade5) or 0;
				elseif isAny4() then
					pen = tonumber(sheet.penalidade4) or 0;
				elseif isAny3() then
					pen = tonumber(sheet.penalidade3) or 0;
				elseif isAny2() then
					pen = tonumber(sheet.penalidade2) or 0;
				elseif isAny1() then
					pen = tonumber(sheet.penalidade1) or 0;
				end;
				mod = mod - pen;
				
                mod = math.floor(mod);

               	local mod1 = (tonumber(sheet.dificuldade) or 0);
               	dificuldade = mod1;

               	rolagem = rrpg.interpretarRolagem(mod .. "d10");
               	mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dificuldade: " .. mod1  .. " (" ..(sheet[sheet.dado1] or 0) .. " + " .. (sheet[sheet.dado2] or 0) .. " + " .. (sheet.especBonus or 0) .. "x especializaçao + " .. (sheet.extra or 0) .. " - " .. pen .. " dano)", 
					function (rolado)
						local sucessos = 0;
						local op = rolado.ops[1];

						for j=1, #op.resultados, 1 do
							if op.resultados[j] >= dificuldade then
						    	sucessos = sucessos +1;
							end;
						end;
						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
						mesaDoPersonagem.activeChat:enviarMensagem(sucessos .. " Sucesso(s)!");
					end);
			end;
		



			local function default()
				sheet.nome0_1 = "Armas Brancas";
				sheet.nome0_2 = "Arremesso";
				sheet.nome0_3 = "Briga";
				sheet.nome0_4 = "Esportes";
				sheet.nome0_5 = "Esquiva";
				sheet.nome0_6 = "Furtividade";
				sheet.nome0_7 = "Prestidigitação";
				sheet.nome0_8 = "Sobrevivência";
				sheet.nome1_1 = "Empatia";
				sheet.nome1_2 = "Emp. Animais";
				sheet.nome1_3 = "Etiqueta";
				sheet.nome1_4 = "Expressão";
				sheet.nome1_5 = "Intimidação";
				sheet.nome1_6 = "Investigação";
				sheet.nome1_7 = "Lábia";
				sheet.nome1_8 = "Liderança";
				sheet.nome1_9 = "Manha";
				sheet.nome1_10 = "Prontidão";
				sheet.nome2_1 = "Acrobacia";
				sheet.nome2_2 = "Armas de Fogo";
				sheet.nome2_3 = "Arte da Fuga";
				sheet.nome2_4 = "Artes Marciais";
				sheet.nome2_5 = "Conduçao";
				sheet.nome2_6 = "Oficios";
				sheet.nome2_7 = "Performace";
				sheet.nome2_8 = "Subterfúgio";
				sheet.nome3_1 = "Acadêmicos";
				sheet.nome3_2 = "Administração";
				sheet.nome3_3 = "Ciências";
				sheet.nome3_4 = "Computação";
				sheet.nome3_5 = "Cultura";
				sheet.nome3_6 = "Direito";
				sheet.nome3_7 = "Medicina";
				sheet.nome3_8 = "Ocultismo";
				sheet.nome3_9 = "Política";
				sheet.nome3_10 = "Tecnologia";
				
				sheet.baseforca = 3;
				sheet.baseagilidade = 3;
				sheet.baseresiliencia = 3;
				sheet.basecarisma = 3;
				sheet.basepercepcao = 3;
				sheet.baseperspicacia = 3;
				
				sheet.baseconsciencia = 1;
				sheet.baseespirito = 1;
				sheet.baseperseveranca = 1;
				
			end;
		


    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Aptidões");
    obj.tab2:setName("tab2");

    obj.frmACN2 = gui.fromHandle(_obj_newObject("form"));
    obj.frmACN2:setParent(obj.tab2);
    obj.frmACN2:setName("frmACN2");
    obj.frmACN2:setAlign("client");
    obj.frmACN2:setTheme("dark");
    obj.frmACN2:setMargins({top=1});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmACN2);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");


			local function xpAptidoes()
				if sheet~=nil then
					local mod = 0;
					local valores = {   ((tonumber(sheet.total0_1 ) or 0)*2 - (tonumber(sheet.xp0_1 ) or 0)), 
										((tonumber(sheet.total0_2 ) or 0)*2 - (tonumber(sheet.xp0_2 ) or 0)), 
										((tonumber(sheet.total0_3 ) or 0)*2 - (tonumber(sheet.xp0_3 ) or 0)),
										((tonumber(sheet.total0_4 ) or 0)*2 - (tonumber(sheet.xp0_4 ) or 0)),
										((tonumber(sheet.total0_5 ) or 0)*2 - (tonumber(sheet.xp0_5 ) or 0)),
										((tonumber(sheet.total0_6 ) or 0)*2 - (tonumber(sheet.xp0_6 ) or 0)),
										((tonumber(sheet.total0_7 ) or 0)*2 - (tonumber(sheet.xp0_7 ) or 0)),
										((tonumber(sheet.total0_8 ) or 0)*2 - (tonumber(sheet.xp0_8 ) or 0)),
										((tonumber(sheet.total0_9 ) or 0)*2 - (tonumber(sheet.xp0_9 ) or 0)),
										((tonumber(sheet.total0_10) or 0)*2 - (tonumber(sheet.xp0_10) or 0)),
										((tonumber(sheet.total0_11) or 0)*2 - (tonumber(sheet.xp0_11) or 0)),
										((tonumber(sheet.total0_12) or 0)*2 - (tonumber(sheet.xp0_12) or 0)),
										((tonumber(sheet.total1_1 ) or 0)*2 - (tonumber(sheet.xp1_1 ) or 0)),
										((tonumber(sheet.total1_2 ) or 0)*2 - (tonumber(sheet.xp1_2 ) or 0)),
										((tonumber(sheet.total1_3 ) or 0)*2 - (tonumber(sheet.xp1_3 ) or 0)),
										((tonumber(sheet.total1_4 ) or 0)*2 - (tonumber(sheet.xp1_4 ) or 0)),
										((tonumber(sheet.total1_5 ) or 0)*2 - (tonumber(sheet.xp1_5 ) or 0)),
										((tonumber(sheet.total1_6 ) or 0)*2 - (tonumber(sheet.xp1_6 ) or 0)),
										((tonumber(sheet.total1_7 ) or 0)*2 - (tonumber(sheet.xp1_7 ) or 0)),
										((tonumber(sheet.total1_8 ) or 0)*2 - (tonumber(sheet.xp1_8 ) or 0)),
										((tonumber(sheet.total1_9 ) or 0)*2 - (tonumber(sheet.xp1_9 ) or 0)),
										((tonumber(sheet.total1_10) or 0)*2 - (tonumber(sheet.xp1_10) or 0)),
										((tonumber(sheet.total1_11) or 0)*2 - (tonumber(sheet.xp1_11) or 0)),
										((tonumber(sheet.total1_12) or 0)*2 - (tonumber(sheet.xp1_12) or 0)),
										((tonumber(sheet.total2_1 ) or 0)*2 - (tonumber(sheet.xp2_1 ) or 0)),
										((tonumber(sheet.total2_2 ) or 0)*2 - (tonumber(sheet.xp2_2 ) or 0)),
										((tonumber(sheet.total2_3 ) or 0)*2 - (tonumber(sheet.xp2_3 ) or 0)),
										((tonumber(sheet.total2_4 ) or 0)*2 - (tonumber(sheet.xp2_4 ) or 0)),
										((tonumber(sheet.total2_5 ) or 0)*2 - (tonumber(sheet.xp2_5 ) or 0)),
										((tonumber(sheet.total2_6 ) or 0)*2 - (tonumber(sheet.xp2_6 ) or 0)),
										((tonumber(sheet.total2_7 ) or 0)*2 - (tonumber(sheet.xp2_7 ) or 0)),
										((tonumber(sheet.total2_8 ) or 0)*2 - (tonumber(sheet.xp2_8 ) or 0)),
										((tonumber(sheet.total2_9 ) or 0)*2 - (tonumber(sheet.xp2_9 ) or 0)),
										((tonumber(sheet.total2_10) or 0)*2 - (tonumber(sheet.xp2_10) or 0)),
										((tonumber(sheet.total2_11) or 0)*2 - (tonumber(sheet.xp2_11) or 0)),
										((tonumber(sheet.total2_12) or 0)*2 - (tonumber(sheet.xp2_12) or 0)),
										((tonumber(sheet.total3_1 ) or 0)*2 - (tonumber(sheet.xp3_1 ) or 0)),
										((tonumber(sheet.total3_2 ) or 0)*2 - (tonumber(sheet.xp3_2 ) or 0)),
										((tonumber(sheet.total3_3 ) or 0)*2 - (tonumber(sheet.xp3_3 ) or 0)),
										((tonumber(sheet.total3_4 ) or 0)*2 - (tonumber(sheet.xp3_4 ) or 0)),
										((tonumber(sheet.total3_5 ) or 0)*2 - (tonumber(sheet.xp3_5 ) or 0)),
										((tonumber(sheet.total3_6 ) or 0)*2 - (tonumber(sheet.xp3_6 ) or 0)),
										((tonumber(sheet.total3_7 ) or 0)*2 - (tonumber(sheet.xp3_7 ) or 0)),
										((tonumber(sheet.total3_8 ) or 0)*2 - (tonumber(sheet.xp3_8 ) or 0)),
										((tonumber(sheet.total3_9 ) or 0)*2 - (tonumber(sheet.xp3_9 ) or 0)),
										((tonumber(sheet.total3_10) or 0)*2 - (tonumber(sheet.xp3_10) or 0)),
										((tonumber(sheet.total3_11) or 0)*2 - (tonumber(sheet.xp3_11) or 0)),
										((tonumber(sheet.total3_12) or 0)*2 - (tonumber(sheet.xp3_12) or 0))
										};
					
					local limites = {	(tonumber(sheet.xp0_1 ) or 0),
										(tonumber(sheet.xp0_2 ) or 0),
										(tonumber(sheet.xp0_3 ) or 0),
										(tonumber(sheet.xp0_4 ) or 0),
										(tonumber(sheet.xp0_5 ) or 0),
										(tonumber(sheet.xp0_6 ) or 0),
										(tonumber(sheet.xp0_7 ) or 0),
										(tonumber(sheet.xp0_8 ) or 0),
										(tonumber(sheet.xp0_9 ) or 0),
										(tonumber(sheet.xp0_10) or 0),
										(tonumber(sheet.xp0_11) or 0),
										(tonumber(sheet.xp0_12) or 0),
										(tonumber(sheet.xp1_1 ) or 0),
										(tonumber(sheet.xp1_2 ) or 0),
										(tonumber(sheet.xp1_3 ) or 0),
										(tonumber(sheet.xp1_4 ) or 0),
										(tonumber(sheet.xp1_5 ) or 0),
										(tonumber(sheet.xp1_6 ) or 0),
										(tonumber(sheet.xp1_7 ) or 0),
										(tonumber(sheet.xp1_8 ) or 0),
										(tonumber(sheet.xp1_9 ) or 0),
										(tonumber(sheet.xp1_10) or 0),
										(tonumber(sheet.xp1_11) or 0),
										(tonumber(sheet.xp1_12) or 0),
										(tonumber(sheet.xp2_1 ) or 0),
										(tonumber(sheet.xp2_2 ) or 0),
										(tonumber(sheet.xp2_3 ) or 0),
										(tonumber(sheet.xp2_4 ) or 0),
										(tonumber(sheet.xp2_5 ) or 0),
										(tonumber(sheet.xp2_6 ) or 0),
										(tonumber(sheet.xp2_7 ) or 0),
										(tonumber(sheet.xp2_8 ) or 0),
										(tonumber(sheet.xp2_9 ) or 0),
										(tonumber(sheet.xp2_10) or 0),
										(tonumber(sheet.xp2_11) or 0),
										(tonumber(sheet.xp2_12) or 0),
										(tonumber(sheet.xp3_1 ) or 0),
										(tonumber(sheet.xp3_2 ) or 0),
										(tonumber(sheet.xp3_3 ) or 0),
										(tonumber(sheet.xp3_4 ) or 0),
										(tonumber(sheet.xp3_5 ) or 0),
										(tonumber(sheet.xp3_6 ) or 0),
										(tonumber(sheet.xp3_7 ) or 0),
										(tonumber(sheet.xp3_8 ) or 0),
										(tonumber(sheet.xp3_9 ) or 0),
										(tonumber(sheet.xp3_10) or 0),
										(tonumber(sheet.xp3_11) or 0),
										(tonumber(sheet.xp3_12) or 0)
										};
					
					for i=1, 48, 1 do
						for j=1, limites[i], 1 do
							mod = mod + math.max(math.floor((valores[i]+j)*1.5), 3);
						end;
					end;

					sheet.XPaptidoes = mod;
					sheet.XPgasta = (tonumber(sheet.XPatributos) or 0) + 
									(tonumber(sheet.XPaegis) or 0) + 
									(tonumber(sheet.XPhistoricos) or 0) + 
									(tonumber(sheet.XPmisticos) or 0) + 
									(tonumber(sheet.XPaptidoes) or 0);
				end;
			end;
		


    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox4);
    obj.layout69:setLeft(0);
    obj.layout69:setTop(0);
    obj.layout69:setWidth(280);
    obj.layout69:setHeight(630);
    obj.layout69:setName("layout69");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout69);
    obj.rectangle66:setLeft(0);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(280);
    obj.rectangle66:setHeight(630);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setXradius(15);
    obj.rectangle66:setYradius(15);
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setName("rectangle66");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout69);
    obj.label126:setLeft(5);
    obj.label126:setTop(0);
    obj.label126:setWidth(240);
    obj.label126:setHeight(20);
    obj.label126:setText("TALENTOS FISICOS");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout69);
    obj.label127:setLeft(25);
    obj.label127:setTop(25);
    obj.label127:setWidth(315);
    obj.label127:setHeight(20);
    obj.label127:setText(" Nome");
    obj.label127:setName("label127");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout69);
    obj.label128:setLeft(135);
    obj.label128:setTop(25);
    obj.label128:setWidth(315);
    obj.label128:setHeight(20);
    obj.label128:setText("Total");
    obj.label128:setName("label128");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout69);
    obj.label129:setLeft(170);
    obj.label129:setTop(25);
    obj.label129:setWidth(315);
    obj.label129:setHeight(20);
    obj.label129:setText(" Inic");
    obj.label129:setName("label129");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout69);
    obj.label130:setLeft(202);
    obj.label130:setTop(25);
    obj.label130:setWidth(315);
    obj.label130:setHeight(20);
    obj.label130:setText(" Apr.");
    obj.label130:setName("label130");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout69);
    obj.label131:setLeft(235);
    obj.label131:setTop(25);
    obj.label131:setWidth(315);
    obj.label131:setHeight(20);
    obj.label131:setText("  XP");
    obj.label131:setName("label131");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setLeft(5);
    obj.layout70:setTop(50);
    obj.layout70:setWidth(270);
    obj.layout70:setHeight(50);
    obj.layout70:setName("layout70");

    obj.radioButton91 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton91:setParent(obj.layout70);
    obj.radioButton91:setLeft(0);
    obj.radioButton91:setTop(0);
    obj.radioButton91:setGroupName("grupo1");
    obj.radioButton91:setField("dado1");
    obj.radioButton91:setFieldValue("total0_1");
    obj.radioButton91:setName("radioButton91");

    obj.radioButton92 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton92:setParent(obj.layout70);
    obj.radioButton92:setLeft(0);
    obj.radioButton92:setTop(15);
    obj.radioButton92:setGroupName("grupo2");
    obj.radioButton92:setField("dado2");
    obj.radioButton92:setFieldValue("total0_1");
    obj.radioButton92:setName("radioButton92");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout70);
    obj.edit202:setLeft(20);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(100);
    obj.edit202:setHeight(25);
    obj.edit202:setField("nome0_1");
    obj.edit202:setName("edit202");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout70);
    obj.rectangle67:setLeft(125);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(40);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("Black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout70);
    obj.label132:setLeft(125);
    obj.label132:setTop(3);
    obj.label132:setWidth(40);
    obj.label132:setHeight(20);
    obj.label132:setField("total20_1");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout70);
    obj.edit203:setLeft(170);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(30);
    obj.edit203:setHeight(25);
    obj.edit203:setType("number");
    obj.edit203:setMin(0);
    obj.edit203:setField("base0_1");
    obj.edit203:setName("edit203");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout70);
    obj.edit204:setLeft(205);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(30);
    obj.edit204:setHeight(25);
    obj.edit204:setType("number");
    obj.edit204:setMin(0);
    obj.edit204:setField("bonus0_1");
    obj.edit204:setName("edit204");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout70);
    obj.edit205:setLeft(240);
    obj.edit205:setTop(0);
    obj.edit205:setWidth(30);
    obj.edit205:setHeight(25);
    obj.edit205:setType("number");
    obj.edit205:setMin(0);
    obj.edit205:setField("xp0_1");
    obj.edit205:setName("edit205");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout70);
    obj.edit206:setLeft(20);
    obj.edit206:setTop(28);
    obj.edit206:setWidth(250);
    obj.edit206:setHeight(20);
    obj.edit206:setField("espec0_1");
    obj.edit206:setName("edit206");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout69);
    obj.layout71:setLeft(5);
    obj.layout71:setTop(100);
    obj.layout71:setWidth(270);
    obj.layout71:setHeight(50);
    obj.layout71:setName("layout71");

    obj.radioButton93 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton93:setParent(obj.layout71);
    obj.radioButton93:setLeft(0);
    obj.radioButton93:setTop(0);
    obj.radioButton93:setGroupName("grupo1");
    obj.radioButton93:setField("dado1");
    obj.radioButton93:setFieldValue("total0_2");
    obj.radioButton93:setName("radioButton93");

    obj.radioButton94 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton94:setParent(obj.layout71);
    obj.radioButton94:setLeft(0);
    obj.radioButton94:setTop(15);
    obj.radioButton94:setGroupName("grupo2");
    obj.radioButton94:setField("dado2");
    obj.radioButton94:setFieldValue("total0_2");
    obj.radioButton94:setName("radioButton94");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout71);
    obj.edit207:setLeft(20);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(100);
    obj.edit207:setHeight(25);
    obj.edit207:setField("nome0_2");
    obj.edit207:setName("edit207");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout71);
    obj.rectangle68:setLeft(125);
    obj.rectangle68:setTop(0);
    obj.rectangle68:setWidth(40);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("Black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout71);
    obj.label133:setLeft(125);
    obj.label133:setTop(3);
    obj.label133:setWidth(40);
    obj.label133:setHeight(20);
    obj.label133:setField("total20_2");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout71);
    obj.edit208:setLeft(170);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(30);
    obj.edit208:setHeight(25);
    obj.edit208:setType("number");
    obj.edit208:setMin(0);
    obj.edit208:setField("base0_2");
    obj.edit208:setName("edit208");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout71);
    obj.edit209:setLeft(205);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(30);
    obj.edit209:setHeight(25);
    obj.edit209:setType("number");
    obj.edit209:setMin(0);
    obj.edit209:setField("bonus0_2");
    obj.edit209:setName("edit209");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout71);
    obj.edit210:setLeft(240);
    obj.edit210:setTop(0);
    obj.edit210:setWidth(30);
    obj.edit210:setHeight(25);
    obj.edit210:setType("number");
    obj.edit210:setMin(0);
    obj.edit210:setField("xp0_2");
    obj.edit210:setName("edit210");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout71);
    obj.edit211:setLeft(20);
    obj.edit211:setTop(28);
    obj.edit211:setWidth(250);
    obj.edit211:setHeight(20);
    obj.edit211:setField("espec0_2");
    obj.edit211:setName("edit211");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout69);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(150);
    obj.layout72:setWidth(270);
    obj.layout72:setHeight(50);
    obj.layout72:setName("layout72");

    obj.radioButton95 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton95:setParent(obj.layout72);
    obj.radioButton95:setLeft(0);
    obj.radioButton95:setTop(0);
    obj.radioButton95:setGroupName("grupo1");
    obj.radioButton95:setField("dado1");
    obj.radioButton95:setFieldValue("total0_3");
    obj.radioButton95:setName("radioButton95");

    obj.radioButton96 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton96:setParent(obj.layout72);
    obj.radioButton96:setLeft(0);
    obj.radioButton96:setTop(15);
    obj.radioButton96:setGroupName("grupo2");
    obj.radioButton96:setField("dado2");
    obj.radioButton96:setFieldValue("total0_3");
    obj.radioButton96:setName("radioButton96");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout72);
    obj.edit212:setLeft(20);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(100);
    obj.edit212:setHeight(25);
    obj.edit212:setField("nome0_3");
    obj.edit212:setName("edit212");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout72);
    obj.rectangle69:setLeft(125);
    obj.rectangle69:setTop(0);
    obj.rectangle69:setWidth(40);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("Black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout72);
    obj.label134:setLeft(125);
    obj.label134:setTop(3);
    obj.label134:setWidth(40);
    obj.label134:setHeight(20);
    obj.label134:setField("total20_3");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout72);
    obj.edit213:setLeft(170);
    obj.edit213:setTop(0);
    obj.edit213:setWidth(30);
    obj.edit213:setHeight(25);
    obj.edit213:setType("number");
    obj.edit213:setMin(0);
    obj.edit213:setField("base0_3");
    obj.edit213:setName("edit213");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout72);
    obj.edit214:setLeft(205);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(30);
    obj.edit214:setHeight(25);
    obj.edit214:setType("number");
    obj.edit214:setMin(0);
    obj.edit214:setField("bonus0_3");
    obj.edit214:setName("edit214");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout72);
    obj.edit215:setLeft(240);
    obj.edit215:setTop(0);
    obj.edit215:setWidth(30);
    obj.edit215:setHeight(25);
    obj.edit215:setType("number");
    obj.edit215:setMin(0);
    obj.edit215:setField("xp0_3");
    obj.edit215:setName("edit215");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout72);
    obj.edit216:setLeft(20);
    obj.edit216:setTop(28);
    obj.edit216:setWidth(250);
    obj.edit216:setHeight(20);
    obj.edit216:setField("espec0_3");
    obj.edit216:setName("edit216");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout69);
    obj.layout73:setLeft(5);
    obj.layout73:setTop(200);
    obj.layout73:setWidth(270);
    obj.layout73:setHeight(50);
    obj.layout73:setName("layout73");

    obj.radioButton97 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton97:setParent(obj.layout73);
    obj.radioButton97:setLeft(0);
    obj.radioButton97:setTop(0);
    obj.radioButton97:setGroupName("grupo1");
    obj.radioButton97:setField("dado1");
    obj.radioButton97:setFieldValue("total0_4");
    obj.radioButton97:setName("radioButton97");

    obj.radioButton98 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton98:setParent(obj.layout73);
    obj.radioButton98:setLeft(0);
    obj.radioButton98:setTop(15);
    obj.radioButton98:setGroupName("grupo2");
    obj.radioButton98:setField("dado2");
    obj.radioButton98:setFieldValue("total0_4");
    obj.radioButton98:setName("radioButton98");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout73);
    obj.edit217:setLeft(20);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(100);
    obj.edit217:setHeight(25);
    obj.edit217:setField("nome0_4");
    obj.edit217:setName("edit217");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout73);
    obj.rectangle70:setLeft(125);
    obj.rectangle70:setTop(0);
    obj.rectangle70:setWidth(40);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("Black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout73);
    obj.label135:setLeft(125);
    obj.label135:setTop(3);
    obj.label135:setWidth(40);
    obj.label135:setHeight(20);
    obj.label135:setField("total20_4");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout73);
    obj.edit218:setLeft(170);
    obj.edit218:setTop(0);
    obj.edit218:setWidth(30);
    obj.edit218:setHeight(25);
    obj.edit218:setType("number");
    obj.edit218:setMin(0);
    obj.edit218:setField("base0_4");
    obj.edit218:setName("edit218");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout73);
    obj.edit219:setLeft(205);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(30);
    obj.edit219:setHeight(25);
    obj.edit219:setType("number");
    obj.edit219:setMin(0);
    obj.edit219:setField("bonus0_4");
    obj.edit219:setName("edit219");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout73);
    obj.edit220:setLeft(240);
    obj.edit220:setTop(0);
    obj.edit220:setWidth(30);
    obj.edit220:setHeight(25);
    obj.edit220:setType("number");
    obj.edit220:setMin(0);
    obj.edit220:setField("xp0_4");
    obj.edit220:setName("edit220");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout73);
    obj.edit221:setLeft(20);
    obj.edit221:setTop(28);
    obj.edit221:setWidth(250);
    obj.edit221:setHeight(20);
    obj.edit221:setField("espec0_4");
    obj.edit221:setName("edit221");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout69);
    obj.layout74:setLeft(5);
    obj.layout74:setTop(250);
    obj.layout74:setWidth(270);
    obj.layout74:setHeight(50);
    obj.layout74:setName("layout74");

    obj.radioButton99 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton99:setParent(obj.layout74);
    obj.radioButton99:setLeft(0);
    obj.radioButton99:setTop(0);
    obj.radioButton99:setGroupName("grupo1");
    obj.radioButton99:setField("dado1");
    obj.radioButton99:setFieldValue("total0_5");
    obj.radioButton99:setName("radioButton99");

    obj.radioButton100 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton100:setParent(obj.layout74);
    obj.radioButton100:setLeft(0);
    obj.radioButton100:setTop(15);
    obj.radioButton100:setGroupName("grupo2");
    obj.radioButton100:setField("dado2");
    obj.radioButton100:setFieldValue("total0_5");
    obj.radioButton100:setName("radioButton100");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout74);
    obj.edit222:setLeft(20);
    obj.edit222:setTop(0);
    obj.edit222:setWidth(100);
    obj.edit222:setHeight(25);
    obj.edit222:setField("nome0_5");
    obj.edit222:setName("edit222");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout74);
    obj.rectangle71:setLeft(125);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(40);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("Black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout74);
    obj.label136:setLeft(125);
    obj.label136:setTop(3);
    obj.label136:setWidth(40);
    obj.label136:setHeight(20);
    obj.label136:setField("total20_5");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout74);
    obj.edit223:setLeft(170);
    obj.edit223:setTop(0);
    obj.edit223:setWidth(30);
    obj.edit223:setHeight(25);
    obj.edit223:setType("number");
    obj.edit223:setMin(0);
    obj.edit223:setField("base0_5");
    obj.edit223:setName("edit223");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout74);
    obj.edit224:setLeft(205);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(30);
    obj.edit224:setHeight(25);
    obj.edit224:setType("number");
    obj.edit224:setMin(0);
    obj.edit224:setField("bonus0_5");
    obj.edit224:setName("edit224");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout74);
    obj.edit225:setLeft(240);
    obj.edit225:setTop(0);
    obj.edit225:setWidth(30);
    obj.edit225:setHeight(25);
    obj.edit225:setType("number");
    obj.edit225:setMin(0);
    obj.edit225:setField("xp0_5");
    obj.edit225:setName("edit225");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout74);
    obj.edit226:setLeft(20);
    obj.edit226:setTop(28);
    obj.edit226:setWidth(250);
    obj.edit226:setHeight(20);
    obj.edit226:setField("espec0_5");
    obj.edit226:setName("edit226");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout69);
    obj.layout75:setLeft(5);
    obj.layout75:setTop(300);
    obj.layout75:setWidth(270);
    obj.layout75:setHeight(50);
    obj.layout75:setName("layout75");

    obj.radioButton101 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton101:setParent(obj.layout75);
    obj.radioButton101:setLeft(0);
    obj.radioButton101:setTop(0);
    obj.radioButton101:setGroupName("grupo1");
    obj.radioButton101:setField("dado1");
    obj.radioButton101:setFieldValue("total0_6");
    obj.radioButton101:setName("radioButton101");

    obj.radioButton102 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton102:setParent(obj.layout75);
    obj.radioButton102:setLeft(0);
    obj.radioButton102:setTop(15);
    obj.radioButton102:setGroupName("grupo2");
    obj.radioButton102:setField("dado2");
    obj.radioButton102:setFieldValue("total0_6");
    obj.radioButton102:setName("radioButton102");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout75);
    obj.edit227:setLeft(20);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(100);
    obj.edit227:setHeight(25);
    obj.edit227:setField("nome0_6");
    obj.edit227:setName("edit227");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout75);
    obj.rectangle72:setLeft(125);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(40);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("Black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout75);
    obj.label137:setLeft(125);
    obj.label137:setTop(3);
    obj.label137:setWidth(40);
    obj.label137:setHeight(20);
    obj.label137:setField("total20_6");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout75);
    obj.edit228:setLeft(170);
    obj.edit228:setTop(0);
    obj.edit228:setWidth(30);
    obj.edit228:setHeight(25);
    obj.edit228:setType("number");
    obj.edit228:setMin(0);
    obj.edit228:setField("base0_6");
    obj.edit228:setName("edit228");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout75);
    obj.edit229:setLeft(205);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(30);
    obj.edit229:setHeight(25);
    obj.edit229:setType("number");
    obj.edit229:setMin(0);
    obj.edit229:setField("bonus0_6");
    obj.edit229:setName("edit229");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout75);
    obj.edit230:setLeft(240);
    obj.edit230:setTop(0);
    obj.edit230:setWidth(30);
    obj.edit230:setHeight(25);
    obj.edit230:setType("number");
    obj.edit230:setMin(0);
    obj.edit230:setField("xp0_6");
    obj.edit230:setName("edit230");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout75);
    obj.edit231:setLeft(20);
    obj.edit231:setTop(28);
    obj.edit231:setWidth(250);
    obj.edit231:setHeight(20);
    obj.edit231:setField("espec0_6");
    obj.edit231:setName("edit231");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout69);
    obj.layout76:setLeft(5);
    obj.layout76:setTop(350);
    obj.layout76:setWidth(270);
    obj.layout76:setHeight(50);
    obj.layout76:setName("layout76");

    obj.radioButton103 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton103:setParent(obj.layout76);
    obj.radioButton103:setLeft(0);
    obj.radioButton103:setTop(0);
    obj.radioButton103:setGroupName("grupo1");
    obj.radioButton103:setField("dado1");
    obj.radioButton103:setFieldValue("total0_7");
    obj.radioButton103:setName("radioButton103");

    obj.radioButton104 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton104:setParent(obj.layout76);
    obj.radioButton104:setLeft(0);
    obj.radioButton104:setTop(15);
    obj.radioButton104:setGroupName("grupo2");
    obj.radioButton104:setField("dado2");
    obj.radioButton104:setFieldValue("total0_7");
    obj.radioButton104:setName("radioButton104");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout76);
    obj.edit232:setLeft(20);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(100);
    obj.edit232:setHeight(25);
    obj.edit232:setField("nome0_7");
    obj.edit232:setName("edit232");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout76);
    obj.rectangle73:setLeft(125);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(40);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("Black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout76);
    obj.label138:setLeft(125);
    obj.label138:setTop(3);
    obj.label138:setWidth(40);
    obj.label138:setHeight(20);
    obj.label138:setField("total20_7");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout76);
    obj.edit233:setLeft(170);
    obj.edit233:setTop(0);
    obj.edit233:setWidth(30);
    obj.edit233:setHeight(25);
    obj.edit233:setType("number");
    obj.edit233:setMin(0);
    obj.edit233:setField("base0_7");
    obj.edit233:setName("edit233");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout76);
    obj.edit234:setLeft(205);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(30);
    obj.edit234:setHeight(25);
    obj.edit234:setType("number");
    obj.edit234:setMin(0);
    obj.edit234:setField("bonus0_7");
    obj.edit234:setName("edit234");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout76);
    obj.edit235:setLeft(240);
    obj.edit235:setTop(0);
    obj.edit235:setWidth(30);
    obj.edit235:setHeight(25);
    obj.edit235:setType("number");
    obj.edit235:setMin(0);
    obj.edit235:setField("xp0_7");
    obj.edit235:setName("edit235");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout76);
    obj.edit236:setLeft(20);
    obj.edit236:setTop(28);
    obj.edit236:setWidth(250);
    obj.edit236:setHeight(20);
    obj.edit236:setField("espec0_7");
    obj.edit236:setName("edit236");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout69);
    obj.layout77:setLeft(5);
    obj.layout77:setTop(400);
    obj.layout77:setWidth(270);
    obj.layout77:setHeight(50);
    obj.layout77:setName("layout77");

    obj.radioButton105 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton105:setParent(obj.layout77);
    obj.radioButton105:setLeft(0);
    obj.radioButton105:setTop(0);
    obj.radioButton105:setGroupName("grupo1");
    obj.radioButton105:setField("dado1");
    obj.radioButton105:setFieldValue("total0_8");
    obj.radioButton105:setName("radioButton105");

    obj.radioButton106 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton106:setParent(obj.layout77);
    obj.radioButton106:setLeft(0);
    obj.radioButton106:setTop(15);
    obj.radioButton106:setGroupName("grupo2");
    obj.radioButton106:setField("dado2");
    obj.radioButton106:setFieldValue("total0_8");
    obj.radioButton106:setName("radioButton106");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout77);
    obj.edit237:setLeft(20);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(100);
    obj.edit237:setHeight(25);
    obj.edit237:setField("nome0_8");
    obj.edit237:setName("edit237");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout77);
    obj.rectangle74:setLeft(125);
    obj.rectangle74:setTop(0);
    obj.rectangle74:setWidth(40);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("Black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout77);
    obj.label139:setLeft(125);
    obj.label139:setTop(3);
    obj.label139:setWidth(40);
    obj.label139:setHeight(20);
    obj.label139:setField("total20_8");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout77);
    obj.edit238:setLeft(170);
    obj.edit238:setTop(0);
    obj.edit238:setWidth(30);
    obj.edit238:setHeight(25);
    obj.edit238:setType("number");
    obj.edit238:setMin(0);
    obj.edit238:setField("base0_8");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout77);
    obj.edit239:setLeft(205);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(30);
    obj.edit239:setHeight(25);
    obj.edit239:setType("number");
    obj.edit239:setMin(0);
    obj.edit239:setField("bonus0_8");
    obj.edit239:setName("edit239");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout77);
    obj.edit240:setLeft(240);
    obj.edit240:setTop(0);
    obj.edit240:setWidth(30);
    obj.edit240:setHeight(25);
    obj.edit240:setType("number");
    obj.edit240:setMin(0);
    obj.edit240:setField("xp0_8");
    obj.edit240:setName("edit240");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout77);
    obj.edit241:setLeft(20);
    obj.edit241:setTop(28);
    obj.edit241:setWidth(250);
    obj.edit241:setHeight(20);
    obj.edit241:setField("espec0_8");
    obj.edit241:setName("edit241");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout69);
    obj.layout78:setLeft(5);
    obj.layout78:setTop(450);
    obj.layout78:setWidth(270);
    obj.layout78:setHeight(50);
    obj.layout78:setName("layout78");

    obj.radioButton107 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton107:setParent(obj.layout78);
    obj.radioButton107:setLeft(0);
    obj.radioButton107:setTop(0);
    obj.radioButton107:setGroupName("grupo1");
    obj.radioButton107:setField("dado1");
    obj.radioButton107:setFieldValue("total0_9");
    obj.radioButton107:setName("radioButton107");

    obj.radioButton108 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton108:setParent(obj.layout78);
    obj.radioButton108:setLeft(0);
    obj.radioButton108:setTop(15);
    obj.radioButton108:setGroupName("grupo2");
    obj.radioButton108:setField("dado2");
    obj.radioButton108:setFieldValue("total0_9");
    obj.radioButton108:setName("radioButton108");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout78);
    obj.edit242:setLeft(20);
    obj.edit242:setTop(0);
    obj.edit242:setWidth(100);
    obj.edit242:setHeight(25);
    obj.edit242:setField("nome0_9");
    obj.edit242:setName("edit242");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout78);
    obj.rectangle75:setLeft(125);
    obj.rectangle75:setTop(0);
    obj.rectangle75:setWidth(40);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("Black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout78);
    obj.label140:setLeft(125);
    obj.label140:setTop(3);
    obj.label140:setWidth(40);
    obj.label140:setHeight(20);
    obj.label140:setField("total20_9");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout78);
    obj.edit243:setLeft(170);
    obj.edit243:setTop(0);
    obj.edit243:setWidth(30);
    obj.edit243:setHeight(25);
    obj.edit243:setType("number");
    obj.edit243:setMin(0);
    obj.edit243:setField("base0_9");
    obj.edit243:setName("edit243");

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout78);
    obj.edit244:setLeft(205);
    obj.edit244:setTop(0);
    obj.edit244:setWidth(30);
    obj.edit244:setHeight(25);
    obj.edit244:setType("number");
    obj.edit244:setMin(0);
    obj.edit244:setField("bonus0_9");
    obj.edit244:setName("edit244");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout78);
    obj.edit245:setLeft(240);
    obj.edit245:setTop(0);
    obj.edit245:setWidth(30);
    obj.edit245:setHeight(25);
    obj.edit245:setType("number");
    obj.edit245:setMin(0);
    obj.edit245:setField("xp0_9");
    obj.edit245:setName("edit245");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout78);
    obj.edit246:setLeft(20);
    obj.edit246:setTop(28);
    obj.edit246:setWidth(250);
    obj.edit246:setHeight(20);
    obj.edit246:setField("espec0_9");
    obj.edit246:setName("edit246");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout69);
    obj.layout79:setLeft(5);
    obj.layout79:setTop(500);
    obj.layout79:setWidth(270);
    obj.layout79:setHeight(50);
    obj.layout79:setName("layout79");

    obj.radioButton109 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton109:setParent(obj.layout79);
    obj.radioButton109:setLeft(0);
    obj.radioButton109:setTop(0);
    obj.radioButton109:setGroupName("grupo1");
    obj.radioButton109:setField("dado1");
    obj.radioButton109:setFieldValue("total0_10");
    obj.radioButton109:setName("radioButton109");

    obj.radioButton110 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton110:setParent(obj.layout79);
    obj.radioButton110:setLeft(0);
    obj.radioButton110:setTop(15);
    obj.radioButton110:setGroupName("grupo2");
    obj.radioButton110:setField("dado2");
    obj.radioButton110:setFieldValue("total0_10");
    obj.radioButton110:setName("radioButton110");

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout79);
    obj.edit247:setLeft(20);
    obj.edit247:setTop(0);
    obj.edit247:setWidth(100);
    obj.edit247:setHeight(25);
    obj.edit247:setField("nome0_10");
    obj.edit247:setName("edit247");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout79);
    obj.rectangle76:setLeft(125);
    obj.rectangle76:setTop(0);
    obj.rectangle76:setWidth(40);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("Black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout79);
    obj.label141:setLeft(125);
    obj.label141:setTop(3);
    obj.label141:setWidth(40);
    obj.label141:setHeight(20);
    obj.label141:setField("total20_10");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout79);
    obj.edit248:setLeft(170);
    obj.edit248:setTop(0);
    obj.edit248:setWidth(30);
    obj.edit248:setHeight(25);
    obj.edit248:setType("number");
    obj.edit248:setMin(0);
    obj.edit248:setField("base0_10");
    obj.edit248:setName("edit248");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout79);
    obj.edit249:setLeft(205);
    obj.edit249:setTop(0);
    obj.edit249:setWidth(30);
    obj.edit249:setHeight(25);
    obj.edit249:setType("number");
    obj.edit249:setMin(0);
    obj.edit249:setField("bonus0_10");
    obj.edit249:setName("edit249");

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout79);
    obj.edit250:setLeft(240);
    obj.edit250:setTop(0);
    obj.edit250:setWidth(30);
    obj.edit250:setHeight(25);
    obj.edit250:setType("number");
    obj.edit250:setMin(0);
    obj.edit250:setField("xp0_10");
    obj.edit250:setName("edit250");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout79);
    obj.edit251:setLeft(20);
    obj.edit251:setTop(28);
    obj.edit251:setWidth(250);
    obj.edit251:setHeight(20);
    obj.edit251:setField("espec0_10");
    obj.edit251:setName("edit251");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout69);
    obj.layout80:setLeft(5);
    obj.layout80:setTop(550);
    obj.layout80:setWidth(270);
    obj.layout80:setHeight(50);
    obj.layout80:setName("layout80");

    obj.radioButton111 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton111:setParent(obj.layout80);
    obj.radioButton111:setLeft(0);
    obj.radioButton111:setTop(0);
    obj.radioButton111:setGroupName("grupo1");
    obj.radioButton111:setField("dado1");
    obj.radioButton111:setFieldValue("total0_11");
    obj.radioButton111:setName("radioButton111");

    obj.radioButton112 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton112:setParent(obj.layout80);
    obj.radioButton112:setLeft(0);
    obj.radioButton112:setTop(15);
    obj.radioButton112:setGroupName("grupo2");
    obj.radioButton112:setField("dado2");
    obj.radioButton112:setFieldValue("total0_11");
    obj.radioButton112:setName("radioButton112");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout80);
    obj.edit252:setLeft(20);
    obj.edit252:setTop(0);
    obj.edit252:setWidth(100);
    obj.edit252:setHeight(25);
    obj.edit252:setField("nome0_11");
    obj.edit252:setName("edit252");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout80);
    obj.rectangle77:setLeft(125);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(40);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("Black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout80);
    obj.label142:setLeft(125);
    obj.label142:setTop(3);
    obj.label142:setWidth(40);
    obj.label142:setHeight(20);
    obj.label142:setField("total20_11");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout80);
    obj.edit253:setLeft(170);
    obj.edit253:setTop(0);
    obj.edit253:setWidth(30);
    obj.edit253:setHeight(25);
    obj.edit253:setType("number");
    obj.edit253:setMin(0);
    obj.edit253:setField("base0_11");
    obj.edit253:setName("edit253");

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout80);
    obj.edit254:setLeft(205);
    obj.edit254:setTop(0);
    obj.edit254:setWidth(30);
    obj.edit254:setHeight(25);
    obj.edit254:setType("number");
    obj.edit254:setMin(0);
    obj.edit254:setField("bonus0_11");
    obj.edit254:setName("edit254");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout80);
    obj.edit255:setLeft(240);
    obj.edit255:setTop(0);
    obj.edit255:setWidth(30);
    obj.edit255:setHeight(25);
    obj.edit255:setType("number");
    obj.edit255:setMin(0);
    obj.edit255:setField("xp0_11");
    obj.edit255:setName("edit255");

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout80);
    obj.edit256:setLeft(20);
    obj.edit256:setTop(28);
    obj.edit256:setWidth(250);
    obj.edit256:setHeight(20);
    obj.edit256:setField("espec0_11");
    obj.edit256:setName("edit256");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout69);
    obj.layout81:setLeft(5);
    obj.layout81:setTop(600);
    obj.layout81:setWidth(270);
    obj.layout81:setHeight(50);
    obj.layout81:setName("layout81");

    obj.radioButton113 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton113:setParent(obj.layout81);
    obj.radioButton113:setLeft(0);
    obj.radioButton113:setTop(0);
    obj.radioButton113:setGroupName("grupo1");
    obj.radioButton113:setField("dado1");
    obj.radioButton113:setFieldValue("total0_12");
    obj.radioButton113:setName("radioButton113");

    obj.radioButton114 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton114:setParent(obj.layout81);
    obj.radioButton114:setLeft(0);
    obj.radioButton114:setTop(15);
    obj.radioButton114:setGroupName("grupo2");
    obj.radioButton114:setField("dado2");
    obj.radioButton114:setFieldValue("total0_12");
    obj.radioButton114:setName("radioButton114");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout81);
    obj.edit257:setLeft(20);
    obj.edit257:setTop(0);
    obj.edit257:setWidth(100);
    obj.edit257:setHeight(25);
    obj.edit257:setField("nome0_12");
    obj.edit257:setName("edit257");

    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout81);
    obj.rectangle78:setLeft(125);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(40);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("Black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout81);
    obj.label143:setLeft(125);
    obj.label143:setTop(3);
    obj.label143:setWidth(40);
    obj.label143:setHeight(20);
    obj.label143:setField("total20_12");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout81);
    obj.edit258:setLeft(170);
    obj.edit258:setTop(0);
    obj.edit258:setWidth(30);
    obj.edit258:setHeight(25);
    obj.edit258:setType("number");
    obj.edit258:setMin(0);
    obj.edit258:setField("base0_12");
    obj.edit258:setName("edit258");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout81);
    obj.edit259:setLeft(205);
    obj.edit259:setTop(0);
    obj.edit259:setWidth(30);
    obj.edit259:setHeight(25);
    obj.edit259:setType("number");
    obj.edit259:setMin(0);
    obj.edit259:setField("bonus0_12");
    obj.edit259:setName("edit259");

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout81);
    obj.edit260:setLeft(240);
    obj.edit260:setTop(0);
    obj.edit260:setWidth(30);
    obj.edit260:setHeight(25);
    obj.edit260:setType("number");
    obj.edit260:setMin(0);
    obj.edit260:setField("xp0_12");
    obj.edit260:setName("edit260");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout81);
    obj.edit261:setLeft(20);
    obj.edit261:setTop(28);
    obj.edit261:setWidth(250);
    obj.edit261:setHeight(20);
    obj.edit261:setField("espec0_12");
    obj.edit261:setName("edit261");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox4);
    obj.layout82:setLeft(300);
    obj.layout82:setTop(0);
    obj.layout82:setWidth(280);
    obj.layout82:setHeight(630);
    obj.layout82:setName("layout82");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout82);
    obj.rectangle79:setLeft(0);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(280);
    obj.rectangle79:setHeight(630);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setXradius(15);
    obj.rectangle79:setYradius(15);
    obj.rectangle79:setCornerType("round");
    obj.rectangle79:setName("rectangle79");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout82);
    obj.label144:setLeft(5);
    obj.label144:setTop(0);
    obj.label144:setWidth(240);
    obj.label144:setHeight(20);
    obj.label144:setText("CONHECIMENTOS FISICOS");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout82);
    obj.label145:setLeft(25);
    obj.label145:setTop(25);
    obj.label145:setWidth(315);
    obj.label145:setHeight(20);
    obj.label145:setText(" Nome");
    obj.label145:setName("label145");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout82);
    obj.label146:setLeft(135);
    obj.label146:setTop(25);
    obj.label146:setWidth(315);
    obj.label146:setHeight(20);
    obj.label146:setText("Total");
    obj.label146:setName("label146");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout82);
    obj.label147:setLeft(170);
    obj.label147:setTop(25);
    obj.label147:setWidth(315);
    obj.label147:setHeight(20);
    obj.label147:setText(" Inic");
    obj.label147:setName("label147");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout82);
    obj.label148:setLeft(202);
    obj.label148:setTop(25);
    obj.label148:setWidth(315);
    obj.label148:setHeight(20);
    obj.label148:setText(" Apr.");
    obj.label148:setName("label148");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout82);
    obj.label149:setLeft(235);
    obj.label149:setTop(25);
    obj.label149:setWidth(315);
    obj.label149:setHeight(20);
    obj.label149:setText("  XP");
    obj.label149:setName("label149");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setLeft(5);
    obj.layout83:setTop(50);
    obj.layout83:setWidth(270);
    obj.layout83:setHeight(50);
    obj.layout83:setName("layout83");

    obj.radioButton115 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton115:setParent(obj.layout83);
    obj.radioButton115:setLeft(0);
    obj.radioButton115:setTop(0);
    obj.radioButton115:setGroupName("grupo1");
    obj.radioButton115:setField("dado1");
    obj.radioButton115:setFieldValue("total2_1");
    obj.radioButton115:setName("radioButton115");

    obj.radioButton116 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton116:setParent(obj.layout83);
    obj.radioButton116:setLeft(0);
    obj.radioButton116:setTop(15);
    obj.radioButton116:setGroupName("grupo2");
    obj.radioButton116:setField("dado2");
    obj.radioButton116:setFieldValue("total2_1");
    obj.radioButton116:setName("radioButton116");

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout83);
    obj.edit262:setLeft(20);
    obj.edit262:setTop(0);
    obj.edit262:setWidth(100);
    obj.edit262:setHeight(25);
    obj.edit262:setField("nome2_1");
    obj.edit262:setName("edit262");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout83);
    obj.rectangle80:setLeft(125);
    obj.rectangle80:setTop(0);
    obj.rectangle80:setWidth(40);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("Black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout83);
    obj.label150:setLeft(125);
    obj.label150:setTop(3);
    obj.label150:setWidth(40);
    obj.label150:setHeight(20);
    obj.label150:setField("total22_1");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout83);
    obj.edit263:setLeft(170);
    obj.edit263:setTop(0);
    obj.edit263:setWidth(30);
    obj.edit263:setHeight(25);
    obj.edit263:setType("number");
    obj.edit263:setMin(0);
    obj.edit263:setField("base2_1");
    obj.edit263:setName("edit263");

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout83);
    obj.edit264:setLeft(205);
    obj.edit264:setTop(0);
    obj.edit264:setWidth(30);
    obj.edit264:setHeight(25);
    obj.edit264:setType("number");
    obj.edit264:setMin(0);
    obj.edit264:setField("bonus2_1");
    obj.edit264:setName("edit264");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout83);
    obj.edit265:setLeft(240);
    obj.edit265:setTop(0);
    obj.edit265:setWidth(30);
    obj.edit265:setHeight(25);
    obj.edit265:setType("number");
    obj.edit265:setMin(0);
    obj.edit265:setField("xp2_1");
    obj.edit265:setName("edit265");

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout83);
    obj.edit266:setLeft(20);
    obj.edit266:setTop(28);
    obj.edit266:setWidth(250);
    obj.edit266:setHeight(20);
    obj.edit266:setField("espec2_1");
    obj.edit266:setName("edit266");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout82);
    obj.layout84:setLeft(5);
    obj.layout84:setTop(100);
    obj.layout84:setWidth(270);
    obj.layout84:setHeight(50);
    obj.layout84:setName("layout84");

    obj.radioButton117 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton117:setParent(obj.layout84);
    obj.radioButton117:setLeft(0);
    obj.radioButton117:setTop(0);
    obj.radioButton117:setGroupName("grupo1");
    obj.radioButton117:setField("dado1");
    obj.radioButton117:setFieldValue("total2_2");
    obj.radioButton117:setName("radioButton117");

    obj.radioButton118 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton118:setParent(obj.layout84);
    obj.radioButton118:setLeft(0);
    obj.radioButton118:setTop(15);
    obj.radioButton118:setGroupName("grupo2");
    obj.radioButton118:setField("dado2");
    obj.radioButton118:setFieldValue("total2_2");
    obj.radioButton118:setName("radioButton118");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout84);
    obj.edit267:setLeft(20);
    obj.edit267:setTop(0);
    obj.edit267:setWidth(100);
    obj.edit267:setHeight(25);
    obj.edit267:setField("nome2_2");
    obj.edit267:setName("edit267");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout84);
    obj.rectangle81:setLeft(125);
    obj.rectangle81:setTop(0);
    obj.rectangle81:setWidth(40);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("Black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout84);
    obj.label151:setLeft(125);
    obj.label151:setTop(3);
    obj.label151:setWidth(40);
    obj.label151:setHeight(20);
    obj.label151:setField("total22_2");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout84);
    obj.edit268:setLeft(170);
    obj.edit268:setTop(0);
    obj.edit268:setWidth(30);
    obj.edit268:setHeight(25);
    obj.edit268:setType("number");
    obj.edit268:setMin(0);
    obj.edit268:setField("base2_2");
    obj.edit268:setName("edit268");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout84);
    obj.edit269:setLeft(205);
    obj.edit269:setTop(0);
    obj.edit269:setWidth(30);
    obj.edit269:setHeight(25);
    obj.edit269:setType("number");
    obj.edit269:setMin(0);
    obj.edit269:setField("bonus2_2");
    obj.edit269:setName("edit269");

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout84);
    obj.edit270:setLeft(240);
    obj.edit270:setTop(0);
    obj.edit270:setWidth(30);
    obj.edit270:setHeight(25);
    obj.edit270:setType("number");
    obj.edit270:setMin(0);
    obj.edit270:setField("xp2_2");
    obj.edit270:setName("edit270");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout84);
    obj.edit271:setLeft(20);
    obj.edit271:setTop(28);
    obj.edit271:setWidth(250);
    obj.edit271:setHeight(20);
    obj.edit271:setField("espec2_2");
    obj.edit271:setName("edit271");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout82);
    obj.layout85:setLeft(5);
    obj.layout85:setTop(150);
    obj.layout85:setWidth(270);
    obj.layout85:setHeight(50);
    obj.layout85:setName("layout85");

    obj.radioButton119 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton119:setParent(obj.layout85);
    obj.radioButton119:setLeft(0);
    obj.radioButton119:setTop(0);
    obj.radioButton119:setGroupName("grupo1");
    obj.radioButton119:setField("dado1");
    obj.radioButton119:setFieldValue("total2_3");
    obj.radioButton119:setName("radioButton119");

    obj.radioButton120 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton120:setParent(obj.layout85);
    obj.radioButton120:setLeft(0);
    obj.radioButton120:setTop(15);
    obj.radioButton120:setGroupName("grupo2");
    obj.radioButton120:setField("dado2");
    obj.radioButton120:setFieldValue("total2_3");
    obj.radioButton120:setName("radioButton120");

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout85);
    obj.edit272:setLeft(20);
    obj.edit272:setTop(0);
    obj.edit272:setWidth(100);
    obj.edit272:setHeight(25);
    obj.edit272:setField("nome2_3");
    obj.edit272:setName("edit272");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout85);
    obj.rectangle82:setLeft(125);
    obj.rectangle82:setTop(0);
    obj.rectangle82:setWidth(40);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("Black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout85);
    obj.label152:setLeft(125);
    obj.label152:setTop(3);
    obj.label152:setWidth(40);
    obj.label152:setHeight(20);
    obj.label152:setField("total22_3");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout85);
    obj.edit273:setLeft(170);
    obj.edit273:setTop(0);
    obj.edit273:setWidth(30);
    obj.edit273:setHeight(25);
    obj.edit273:setType("number");
    obj.edit273:setMin(0);
    obj.edit273:setField("base2_3");
    obj.edit273:setName("edit273");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout85);
    obj.edit274:setLeft(205);
    obj.edit274:setTop(0);
    obj.edit274:setWidth(30);
    obj.edit274:setHeight(25);
    obj.edit274:setType("number");
    obj.edit274:setMin(0);
    obj.edit274:setField("bonus2_3");
    obj.edit274:setName("edit274");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout85);
    obj.edit275:setLeft(240);
    obj.edit275:setTop(0);
    obj.edit275:setWidth(30);
    obj.edit275:setHeight(25);
    obj.edit275:setType("number");
    obj.edit275:setMin(0);
    obj.edit275:setField("xp2_3");
    obj.edit275:setName("edit275");

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout85);
    obj.edit276:setLeft(20);
    obj.edit276:setTop(28);
    obj.edit276:setWidth(250);
    obj.edit276:setHeight(20);
    obj.edit276:setField("espec2_3");
    obj.edit276:setName("edit276");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout82);
    obj.layout86:setLeft(5);
    obj.layout86:setTop(200);
    obj.layout86:setWidth(270);
    obj.layout86:setHeight(50);
    obj.layout86:setName("layout86");

    obj.radioButton121 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton121:setParent(obj.layout86);
    obj.radioButton121:setLeft(0);
    obj.radioButton121:setTop(0);
    obj.radioButton121:setGroupName("grupo1");
    obj.radioButton121:setField("dado1");
    obj.radioButton121:setFieldValue("total2_4");
    obj.radioButton121:setName("radioButton121");

    obj.radioButton122 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton122:setParent(obj.layout86);
    obj.radioButton122:setLeft(0);
    obj.radioButton122:setTop(15);
    obj.radioButton122:setGroupName("grupo2");
    obj.radioButton122:setField("dado2");
    obj.radioButton122:setFieldValue("total2_4");
    obj.radioButton122:setName("radioButton122");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout86);
    obj.edit277:setLeft(20);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(100);
    obj.edit277:setHeight(25);
    obj.edit277:setField("nome2_4");
    obj.edit277:setName("edit277");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout86);
    obj.rectangle83:setLeft(125);
    obj.rectangle83:setTop(0);
    obj.rectangle83:setWidth(40);
    obj.rectangle83:setHeight(25);
    obj.rectangle83:setColor("Black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout86);
    obj.label153:setLeft(125);
    obj.label153:setTop(3);
    obj.label153:setWidth(40);
    obj.label153:setHeight(20);
    obj.label153:setField("total22_4");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout86);
    obj.edit278:setLeft(170);
    obj.edit278:setTop(0);
    obj.edit278:setWidth(30);
    obj.edit278:setHeight(25);
    obj.edit278:setType("number");
    obj.edit278:setMin(0);
    obj.edit278:setField("base2_4");
    obj.edit278:setName("edit278");

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout86);
    obj.edit279:setLeft(205);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(30);
    obj.edit279:setHeight(25);
    obj.edit279:setType("number");
    obj.edit279:setMin(0);
    obj.edit279:setField("bonus2_4");
    obj.edit279:setName("edit279");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout86);
    obj.edit280:setLeft(240);
    obj.edit280:setTop(0);
    obj.edit280:setWidth(30);
    obj.edit280:setHeight(25);
    obj.edit280:setType("number");
    obj.edit280:setMin(0);
    obj.edit280:setField("xp2_4");
    obj.edit280:setName("edit280");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout86);
    obj.edit281:setLeft(20);
    obj.edit281:setTop(28);
    obj.edit281:setWidth(250);
    obj.edit281:setHeight(20);
    obj.edit281:setField("espec2_4");
    obj.edit281:setName("edit281");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout82);
    obj.layout87:setLeft(5);
    obj.layout87:setTop(250);
    obj.layout87:setWidth(270);
    obj.layout87:setHeight(50);
    obj.layout87:setName("layout87");

    obj.radioButton123 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton123:setParent(obj.layout87);
    obj.radioButton123:setLeft(0);
    obj.radioButton123:setTop(0);
    obj.radioButton123:setGroupName("grupo1");
    obj.radioButton123:setField("dado1");
    obj.radioButton123:setFieldValue("total2_5");
    obj.radioButton123:setName("radioButton123");

    obj.radioButton124 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton124:setParent(obj.layout87);
    obj.radioButton124:setLeft(0);
    obj.radioButton124:setTop(15);
    obj.radioButton124:setGroupName("grupo2");
    obj.radioButton124:setField("dado2");
    obj.radioButton124:setFieldValue("total2_5");
    obj.radioButton124:setName("radioButton124");

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout87);
    obj.edit282:setLeft(20);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(100);
    obj.edit282:setHeight(25);
    obj.edit282:setField("nome2_5");
    obj.edit282:setName("edit282");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout87);
    obj.rectangle84:setLeft(125);
    obj.rectangle84:setTop(0);
    obj.rectangle84:setWidth(40);
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("Black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout87);
    obj.label154:setLeft(125);
    obj.label154:setTop(3);
    obj.label154:setWidth(40);
    obj.label154:setHeight(20);
    obj.label154:setField("total22_5");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout87);
    obj.edit283:setLeft(170);
    obj.edit283:setTop(0);
    obj.edit283:setWidth(30);
    obj.edit283:setHeight(25);
    obj.edit283:setType("number");
    obj.edit283:setMin(0);
    obj.edit283:setField("base2_5");
    obj.edit283:setName("edit283");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout87);
    obj.edit284:setLeft(205);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(30);
    obj.edit284:setHeight(25);
    obj.edit284:setType("number");
    obj.edit284:setMin(0);
    obj.edit284:setField("bonus2_5");
    obj.edit284:setName("edit284");

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout87);
    obj.edit285:setLeft(240);
    obj.edit285:setTop(0);
    obj.edit285:setWidth(30);
    obj.edit285:setHeight(25);
    obj.edit285:setType("number");
    obj.edit285:setMin(0);
    obj.edit285:setField("xp2_5");
    obj.edit285:setName("edit285");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout87);
    obj.edit286:setLeft(20);
    obj.edit286:setTop(28);
    obj.edit286:setWidth(250);
    obj.edit286:setHeight(20);
    obj.edit286:setField("espec2_5");
    obj.edit286:setName("edit286");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout82);
    obj.layout88:setLeft(5);
    obj.layout88:setTop(300);
    obj.layout88:setWidth(270);
    obj.layout88:setHeight(50);
    obj.layout88:setName("layout88");

    obj.radioButton125 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton125:setParent(obj.layout88);
    obj.radioButton125:setLeft(0);
    obj.radioButton125:setTop(0);
    obj.radioButton125:setGroupName("grupo1");
    obj.radioButton125:setField("dado1");
    obj.radioButton125:setFieldValue("total2_6");
    obj.radioButton125:setName("radioButton125");

    obj.radioButton126 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton126:setParent(obj.layout88);
    obj.radioButton126:setLeft(0);
    obj.radioButton126:setTop(15);
    obj.radioButton126:setGroupName("grupo2");
    obj.radioButton126:setField("dado2");
    obj.radioButton126:setFieldValue("total2_6");
    obj.radioButton126:setName("radioButton126");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout88);
    obj.edit287:setLeft(20);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(100);
    obj.edit287:setHeight(25);
    obj.edit287:setField("nome2_6");
    obj.edit287:setName("edit287");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout88);
    obj.rectangle85:setLeft(125);
    obj.rectangle85:setTop(0);
    obj.rectangle85:setWidth(40);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("Black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout88);
    obj.label155:setLeft(125);
    obj.label155:setTop(3);
    obj.label155:setWidth(40);
    obj.label155:setHeight(20);
    obj.label155:setField("total22_6");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout88);
    obj.edit288:setLeft(170);
    obj.edit288:setTop(0);
    obj.edit288:setWidth(30);
    obj.edit288:setHeight(25);
    obj.edit288:setType("number");
    obj.edit288:setMin(0);
    obj.edit288:setField("base2_6");
    obj.edit288:setName("edit288");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout88);
    obj.edit289:setLeft(205);
    obj.edit289:setTop(0);
    obj.edit289:setWidth(30);
    obj.edit289:setHeight(25);
    obj.edit289:setType("number");
    obj.edit289:setMin(0);
    obj.edit289:setField("bonus2_6");
    obj.edit289:setName("edit289");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout88);
    obj.edit290:setLeft(240);
    obj.edit290:setTop(0);
    obj.edit290:setWidth(30);
    obj.edit290:setHeight(25);
    obj.edit290:setType("number");
    obj.edit290:setMin(0);
    obj.edit290:setField("xp2_6");
    obj.edit290:setName("edit290");

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout88);
    obj.edit291:setLeft(20);
    obj.edit291:setTop(28);
    obj.edit291:setWidth(250);
    obj.edit291:setHeight(20);
    obj.edit291:setField("espec2_6");
    obj.edit291:setName("edit291");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout82);
    obj.layout89:setLeft(5);
    obj.layout89:setTop(350);
    obj.layout89:setWidth(270);
    obj.layout89:setHeight(50);
    obj.layout89:setName("layout89");

    obj.radioButton127 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton127:setParent(obj.layout89);
    obj.radioButton127:setLeft(0);
    obj.radioButton127:setTop(0);
    obj.radioButton127:setGroupName("grupo1");
    obj.radioButton127:setField("dado1");
    obj.radioButton127:setFieldValue("total2_7");
    obj.radioButton127:setName("radioButton127");

    obj.radioButton128 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton128:setParent(obj.layout89);
    obj.radioButton128:setLeft(0);
    obj.radioButton128:setTop(15);
    obj.radioButton128:setGroupName("grupo2");
    obj.radioButton128:setField("dado2");
    obj.radioButton128:setFieldValue("total2_7");
    obj.radioButton128:setName("radioButton128");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout89);
    obj.edit292:setLeft(20);
    obj.edit292:setTop(0);
    obj.edit292:setWidth(100);
    obj.edit292:setHeight(25);
    obj.edit292:setField("nome2_7");
    obj.edit292:setName("edit292");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout89);
    obj.rectangle86:setLeft(125);
    obj.rectangle86:setTop(0);
    obj.rectangle86:setWidth(40);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("Black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout89);
    obj.label156:setLeft(125);
    obj.label156:setTop(3);
    obj.label156:setWidth(40);
    obj.label156:setHeight(20);
    obj.label156:setField("total22_7");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout89);
    obj.edit293:setLeft(170);
    obj.edit293:setTop(0);
    obj.edit293:setWidth(30);
    obj.edit293:setHeight(25);
    obj.edit293:setType("number");
    obj.edit293:setMin(0);
    obj.edit293:setField("base2_7");
    obj.edit293:setName("edit293");

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout89);
    obj.edit294:setLeft(205);
    obj.edit294:setTop(0);
    obj.edit294:setWidth(30);
    obj.edit294:setHeight(25);
    obj.edit294:setType("number");
    obj.edit294:setMin(0);
    obj.edit294:setField("bonus2_7");
    obj.edit294:setName("edit294");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout89);
    obj.edit295:setLeft(240);
    obj.edit295:setTop(0);
    obj.edit295:setWidth(30);
    obj.edit295:setHeight(25);
    obj.edit295:setType("number");
    obj.edit295:setMin(0);
    obj.edit295:setField("xp2_7");
    obj.edit295:setName("edit295");

    obj.edit296 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout89);
    obj.edit296:setLeft(20);
    obj.edit296:setTop(28);
    obj.edit296:setWidth(250);
    obj.edit296:setHeight(20);
    obj.edit296:setField("espec2_7");
    obj.edit296:setName("edit296");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout82);
    obj.layout90:setLeft(5);
    obj.layout90:setTop(400);
    obj.layout90:setWidth(270);
    obj.layout90:setHeight(50);
    obj.layout90:setName("layout90");

    obj.radioButton129 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton129:setParent(obj.layout90);
    obj.radioButton129:setLeft(0);
    obj.radioButton129:setTop(0);
    obj.radioButton129:setGroupName("grupo1");
    obj.radioButton129:setField("dado1");
    obj.radioButton129:setFieldValue("total2_8");
    obj.radioButton129:setName("radioButton129");

    obj.radioButton130 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton130:setParent(obj.layout90);
    obj.radioButton130:setLeft(0);
    obj.radioButton130:setTop(15);
    obj.radioButton130:setGroupName("grupo2");
    obj.radioButton130:setField("dado2");
    obj.radioButton130:setFieldValue("total2_8");
    obj.radioButton130:setName("radioButton130");

    obj.edit297 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout90);
    obj.edit297:setLeft(20);
    obj.edit297:setTop(0);
    obj.edit297:setWidth(100);
    obj.edit297:setHeight(25);
    obj.edit297:setField("nome2_8");
    obj.edit297:setName("edit297");

    obj.rectangle87 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout90);
    obj.rectangle87:setLeft(125);
    obj.rectangle87:setTop(0);
    obj.rectangle87:setWidth(40);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("Black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout90);
    obj.label157:setLeft(125);
    obj.label157:setTop(3);
    obj.label157:setWidth(40);
    obj.label157:setHeight(20);
    obj.label157:setField("total22_8");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.edit298 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout90);
    obj.edit298:setLeft(170);
    obj.edit298:setTop(0);
    obj.edit298:setWidth(30);
    obj.edit298:setHeight(25);
    obj.edit298:setType("number");
    obj.edit298:setMin(0);
    obj.edit298:setField("base2_8");
    obj.edit298:setName("edit298");

    obj.edit299 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout90);
    obj.edit299:setLeft(205);
    obj.edit299:setTop(0);
    obj.edit299:setWidth(30);
    obj.edit299:setHeight(25);
    obj.edit299:setType("number");
    obj.edit299:setMin(0);
    obj.edit299:setField("bonus2_8");
    obj.edit299:setName("edit299");

    obj.edit300 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout90);
    obj.edit300:setLeft(240);
    obj.edit300:setTop(0);
    obj.edit300:setWidth(30);
    obj.edit300:setHeight(25);
    obj.edit300:setType("number");
    obj.edit300:setMin(0);
    obj.edit300:setField("xp2_8");
    obj.edit300:setName("edit300");

    obj.edit301 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout90);
    obj.edit301:setLeft(20);
    obj.edit301:setTop(28);
    obj.edit301:setWidth(250);
    obj.edit301:setHeight(20);
    obj.edit301:setField("espec2_8");
    obj.edit301:setName("edit301");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout82);
    obj.layout91:setLeft(5);
    obj.layout91:setTop(450);
    obj.layout91:setWidth(270);
    obj.layout91:setHeight(50);
    obj.layout91:setName("layout91");

    obj.radioButton131 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton131:setParent(obj.layout91);
    obj.radioButton131:setLeft(0);
    obj.radioButton131:setTop(0);
    obj.radioButton131:setGroupName("grupo1");
    obj.radioButton131:setField("dado1");
    obj.radioButton131:setFieldValue("total2_9");
    obj.radioButton131:setName("radioButton131");

    obj.radioButton132 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton132:setParent(obj.layout91);
    obj.radioButton132:setLeft(0);
    obj.radioButton132:setTop(15);
    obj.radioButton132:setGroupName("grupo2");
    obj.radioButton132:setField("dado2");
    obj.radioButton132:setFieldValue("total2_9");
    obj.radioButton132:setName("radioButton132");

    obj.edit302 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout91);
    obj.edit302:setLeft(20);
    obj.edit302:setTop(0);
    obj.edit302:setWidth(100);
    obj.edit302:setHeight(25);
    obj.edit302:setField("nome2_9");
    obj.edit302:setName("edit302");

    obj.rectangle88 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout91);
    obj.rectangle88:setLeft(125);
    obj.rectangle88:setTop(0);
    obj.rectangle88:setWidth(40);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("Black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout91);
    obj.label158:setLeft(125);
    obj.label158:setTop(3);
    obj.label158:setWidth(40);
    obj.label158:setHeight(20);
    obj.label158:setField("total22_9");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.edit303 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout91);
    obj.edit303:setLeft(170);
    obj.edit303:setTop(0);
    obj.edit303:setWidth(30);
    obj.edit303:setHeight(25);
    obj.edit303:setType("number");
    obj.edit303:setMin(0);
    obj.edit303:setField("base2_9");
    obj.edit303:setName("edit303");

    obj.edit304 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout91);
    obj.edit304:setLeft(205);
    obj.edit304:setTop(0);
    obj.edit304:setWidth(30);
    obj.edit304:setHeight(25);
    obj.edit304:setType("number");
    obj.edit304:setMin(0);
    obj.edit304:setField("bonus2_9");
    obj.edit304:setName("edit304");

    obj.edit305 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout91);
    obj.edit305:setLeft(240);
    obj.edit305:setTop(0);
    obj.edit305:setWidth(30);
    obj.edit305:setHeight(25);
    obj.edit305:setType("number");
    obj.edit305:setMin(0);
    obj.edit305:setField("xp2_9");
    obj.edit305:setName("edit305");

    obj.edit306 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout91);
    obj.edit306:setLeft(20);
    obj.edit306:setTop(28);
    obj.edit306:setWidth(250);
    obj.edit306:setHeight(20);
    obj.edit306:setField("espec2_9");
    obj.edit306:setName("edit306");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout82);
    obj.layout92:setLeft(5);
    obj.layout92:setTop(500);
    obj.layout92:setWidth(270);
    obj.layout92:setHeight(50);
    obj.layout92:setName("layout92");

    obj.radioButton133 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton133:setParent(obj.layout92);
    obj.radioButton133:setLeft(0);
    obj.radioButton133:setTop(0);
    obj.radioButton133:setGroupName("grupo1");
    obj.radioButton133:setField("dado1");
    obj.radioButton133:setFieldValue("total2_10");
    obj.radioButton133:setName("radioButton133");

    obj.radioButton134 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton134:setParent(obj.layout92);
    obj.radioButton134:setLeft(0);
    obj.radioButton134:setTop(15);
    obj.radioButton134:setGroupName("grupo2");
    obj.radioButton134:setField("dado2");
    obj.radioButton134:setFieldValue("total2_10");
    obj.radioButton134:setName("radioButton134");

    obj.edit307 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout92);
    obj.edit307:setLeft(20);
    obj.edit307:setTop(0);
    obj.edit307:setWidth(100);
    obj.edit307:setHeight(25);
    obj.edit307:setField("nome2_10");
    obj.edit307:setName("edit307");

    obj.rectangle89 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout92);
    obj.rectangle89:setLeft(125);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setWidth(40);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("Black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout92);
    obj.label159:setLeft(125);
    obj.label159:setTop(3);
    obj.label159:setWidth(40);
    obj.label159:setHeight(20);
    obj.label159:setField("total22_10");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.edit308 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout92);
    obj.edit308:setLeft(170);
    obj.edit308:setTop(0);
    obj.edit308:setWidth(30);
    obj.edit308:setHeight(25);
    obj.edit308:setType("number");
    obj.edit308:setMin(0);
    obj.edit308:setField("base2_10");
    obj.edit308:setName("edit308");

    obj.edit309 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout92);
    obj.edit309:setLeft(205);
    obj.edit309:setTop(0);
    obj.edit309:setWidth(30);
    obj.edit309:setHeight(25);
    obj.edit309:setType("number");
    obj.edit309:setMin(0);
    obj.edit309:setField("bonus2_10");
    obj.edit309:setName("edit309");

    obj.edit310 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout92);
    obj.edit310:setLeft(240);
    obj.edit310:setTop(0);
    obj.edit310:setWidth(30);
    obj.edit310:setHeight(25);
    obj.edit310:setType("number");
    obj.edit310:setMin(0);
    obj.edit310:setField("xp2_10");
    obj.edit310:setName("edit310");

    obj.edit311 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout92);
    obj.edit311:setLeft(20);
    obj.edit311:setTop(28);
    obj.edit311:setWidth(250);
    obj.edit311:setHeight(20);
    obj.edit311:setField("espec2_10");
    obj.edit311:setName("edit311");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout82);
    obj.layout93:setLeft(5);
    obj.layout93:setTop(550);
    obj.layout93:setWidth(270);
    obj.layout93:setHeight(50);
    obj.layout93:setName("layout93");

    obj.radioButton135 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton135:setParent(obj.layout93);
    obj.radioButton135:setLeft(0);
    obj.radioButton135:setTop(0);
    obj.radioButton135:setGroupName("grupo1");
    obj.radioButton135:setField("dado1");
    obj.radioButton135:setFieldValue("total2_11");
    obj.radioButton135:setName("radioButton135");

    obj.radioButton136 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton136:setParent(obj.layout93);
    obj.radioButton136:setLeft(0);
    obj.radioButton136:setTop(15);
    obj.radioButton136:setGroupName("grupo2");
    obj.radioButton136:setField("dado2");
    obj.radioButton136:setFieldValue("total2_11");
    obj.radioButton136:setName("radioButton136");

    obj.edit312 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout93);
    obj.edit312:setLeft(20);
    obj.edit312:setTop(0);
    obj.edit312:setWidth(100);
    obj.edit312:setHeight(25);
    obj.edit312:setField("nome2_11");
    obj.edit312:setName("edit312");

    obj.rectangle90 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout93);
    obj.rectangle90:setLeft(125);
    obj.rectangle90:setTop(0);
    obj.rectangle90:setWidth(40);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("Black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout93);
    obj.label160:setLeft(125);
    obj.label160:setTop(3);
    obj.label160:setWidth(40);
    obj.label160:setHeight(20);
    obj.label160:setField("total22_11");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.edit313 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout93);
    obj.edit313:setLeft(170);
    obj.edit313:setTop(0);
    obj.edit313:setWidth(30);
    obj.edit313:setHeight(25);
    obj.edit313:setType("number");
    obj.edit313:setMin(0);
    obj.edit313:setField("base2_11");
    obj.edit313:setName("edit313");

    obj.edit314 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout93);
    obj.edit314:setLeft(205);
    obj.edit314:setTop(0);
    obj.edit314:setWidth(30);
    obj.edit314:setHeight(25);
    obj.edit314:setType("number");
    obj.edit314:setMin(0);
    obj.edit314:setField("bonus2_11");
    obj.edit314:setName("edit314");

    obj.edit315 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout93);
    obj.edit315:setLeft(240);
    obj.edit315:setTop(0);
    obj.edit315:setWidth(30);
    obj.edit315:setHeight(25);
    obj.edit315:setType("number");
    obj.edit315:setMin(0);
    obj.edit315:setField("xp2_11");
    obj.edit315:setName("edit315");

    obj.edit316 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout93);
    obj.edit316:setLeft(20);
    obj.edit316:setTop(28);
    obj.edit316:setWidth(250);
    obj.edit316:setHeight(20);
    obj.edit316:setField("espec2_11");
    obj.edit316:setName("edit316");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout82);
    obj.layout94:setLeft(5);
    obj.layout94:setTop(600);
    obj.layout94:setWidth(270);
    obj.layout94:setHeight(50);
    obj.layout94:setName("layout94");

    obj.radioButton137 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton137:setParent(obj.layout94);
    obj.radioButton137:setLeft(0);
    obj.radioButton137:setTop(0);
    obj.radioButton137:setGroupName("grupo1");
    obj.radioButton137:setField("dado1");
    obj.radioButton137:setFieldValue("total2_12");
    obj.radioButton137:setName("radioButton137");

    obj.radioButton138 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton138:setParent(obj.layout94);
    obj.radioButton138:setLeft(0);
    obj.radioButton138:setTop(15);
    obj.radioButton138:setGroupName("grupo2");
    obj.radioButton138:setField("dado2");
    obj.radioButton138:setFieldValue("total2_12");
    obj.radioButton138:setName("radioButton138");

    obj.edit317 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout94);
    obj.edit317:setLeft(20);
    obj.edit317:setTop(0);
    obj.edit317:setWidth(100);
    obj.edit317:setHeight(25);
    obj.edit317:setField("nome2_12");
    obj.edit317:setName("edit317");

    obj.rectangle91 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout94);
    obj.rectangle91:setLeft(125);
    obj.rectangle91:setTop(0);
    obj.rectangle91:setWidth(40);
    obj.rectangle91:setHeight(25);
    obj.rectangle91:setColor("Black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout94);
    obj.label161:setLeft(125);
    obj.label161:setTop(3);
    obj.label161:setWidth(40);
    obj.label161:setHeight(20);
    obj.label161:setField("total22_12");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.edit318 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout94);
    obj.edit318:setLeft(170);
    obj.edit318:setTop(0);
    obj.edit318:setWidth(30);
    obj.edit318:setHeight(25);
    obj.edit318:setType("number");
    obj.edit318:setMin(0);
    obj.edit318:setField("base2_12");
    obj.edit318:setName("edit318");

    obj.edit319 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout94);
    obj.edit319:setLeft(205);
    obj.edit319:setTop(0);
    obj.edit319:setWidth(30);
    obj.edit319:setHeight(25);
    obj.edit319:setType("number");
    obj.edit319:setMin(0);
    obj.edit319:setField("bonus2_12");
    obj.edit319:setName("edit319");

    obj.edit320 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout94);
    obj.edit320:setLeft(240);
    obj.edit320:setTop(0);
    obj.edit320:setWidth(30);
    obj.edit320:setHeight(25);
    obj.edit320:setType("number");
    obj.edit320:setMin(0);
    obj.edit320:setField("xp2_12");
    obj.edit320:setName("edit320");

    obj.edit321 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout94);
    obj.edit321:setLeft(20);
    obj.edit321:setTop(28);
    obj.edit321:setWidth(250);
    obj.edit321:setHeight(20);
    obj.edit321:setField("espec2_12");
    obj.edit321:setName("edit321");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.scrollBox4);
    obj.layout95:setLeft(600);
    obj.layout95:setTop(0);
    obj.layout95:setWidth(280);
    obj.layout95:setHeight(630);
    obj.layout95:setName("layout95");

    obj.rectangle92 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout95);
    obj.rectangle92:setLeft(0);
    obj.rectangle92:setTop(0);
    obj.rectangle92:setWidth(280);
    obj.rectangle92:setHeight(630);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setXradius(15);
    obj.rectangle92:setYradius(15);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setName("rectangle92");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout95);
    obj.label162:setLeft(5);
    obj.label162:setTop(0);
    obj.label162:setWidth(240);
    obj.label162:setHeight(20);
    obj.label162:setText("TALENTOS MENTAIS");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout95);
    obj.label163:setLeft(25);
    obj.label163:setTop(25);
    obj.label163:setWidth(315);
    obj.label163:setHeight(20);
    obj.label163:setText(" Nome");
    obj.label163:setName("label163");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout95);
    obj.label164:setLeft(135);
    obj.label164:setTop(25);
    obj.label164:setWidth(315);
    obj.label164:setHeight(20);
    obj.label164:setText("Total");
    obj.label164:setName("label164");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout95);
    obj.label165:setLeft(170);
    obj.label165:setTop(25);
    obj.label165:setWidth(315);
    obj.label165:setHeight(20);
    obj.label165:setText(" Inic");
    obj.label165:setName("label165");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout95);
    obj.label166:setLeft(202);
    obj.label166:setTop(25);
    obj.label166:setWidth(315);
    obj.label166:setHeight(20);
    obj.label166:setText(" Apr.");
    obj.label166:setName("label166");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout95);
    obj.label167:setLeft(235);
    obj.label167:setTop(25);
    obj.label167:setWidth(315);
    obj.label167:setHeight(20);
    obj.label167:setText("  XP");
    obj.label167:setName("label167");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout95);
    obj.layout96:setLeft(5);
    obj.layout96:setTop(50);
    obj.layout96:setWidth(270);
    obj.layout96:setHeight(50);
    obj.layout96:setName("layout96");

    obj.radioButton139 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton139:setParent(obj.layout96);
    obj.radioButton139:setLeft(0);
    obj.radioButton139:setTop(0);
    obj.radioButton139:setGroupName("grupo1");
    obj.radioButton139:setField("dado1");
    obj.radioButton139:setFieldValue("total1_1");
    obj.radioButton139:setName("radioButton139");

    obj.radioButton140 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton140:setParent(obj.layout96);
    obj.radioButton140:setLeft(0);
    obj.radioButton140:setTop(15);
    obj.radioButton140:setGroupName("grupo2");
    obj.radioButton140:setField("dado2");
    obj.radioButton140:setFieldValue("total1_1");
    obj.radioButton140:setName("radioButton140");

    obj.edit322 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout96);
    obj.edit322:setLeft(20);
    obj.edit322:setTop(0);
    obj.edit322:setWidth(100);
    obj.edit322:setHeight(25);
    obj.edit322:setField("nome1_1");
    obj.edit322:setName("edit322");

    obj.rectangle93 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout96);
    obj.rectangle93:setLeft(125);
    obj.rectangle93:setTop(0);
    obj.rectangle93:setWidth(40);
    obj.rectangle93:setHeight(25);
    obj.rectangle93:setColor("Black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout96);
    obj.label168:setLeft(125);
    obj.label168:setTop(3);
    obj.label168:setWidth(40);
    obj.label168:setHeight(20);
    obj.label168:setField("total21_1");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.edit323 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout96);
    obj.edit323:setLeft(170);
    obj.edit323:setTop(0);
    obj.edit323:setWidth(30);
    obj.edit323:setHeight(25);
    obj.edit323:setType("number");
    obj.edit323:setMin(0);
    obj.edit323:setField("base1_1");
    obj.edit323:setName("edit323");

    obj.edit324 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout96);
    obj.edit324:setLeft(205);
    obj.edit324:setTop(0);
    obj.edit324:setWidth(30);
    obj.edit324:setHeight(25);
    obj.edit324:setType("number");
    obj.edit324:setMin(0);
    obj.edit324:setField("bonus1_1");
    obj.edit324:setName("edit324");

    obj.edit325 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout96);
    obj.edit325:setLeft(240);
    obj.edit325:setTop(0);
    obj.edit325:setWidth(30);
    obj.edit325:setHeight(25);
    obj.edit325:setType("number");
    obj.edit325:setMin(0);
    obj.edit325:setField("xp1_1");
    obj.edit325:setName("edit325");

    obj.edit326 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout96);
    obj.edit326:setLeft(20);
    obj.edit326:setTop(28);
    obj.edit326:setWidth(250);
    obj.edit326:setHeight(20);
    obj.edit326:setField("espec1_1");
    obj.edit326:setName("edit326");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout95);
    obj.layout97:setLeft(5);
    obj.layout97:setTop(100);
    obj.layout97:setWidth(270);
    obj.layout97:setHeight(50);
    obj.layout97:setName("layout97");

    obj.radioButton141 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton141:setParent(obj.layout97);
    obj.radioButton141:setLeft(0);
    obj.radioButton141:setTop(0);
    obj.radioButton141:setGroupName("grupo1");
    obj.radioButton141:setField("dado1");
    obj.radioButton141:setFieldValue("total1_2");
    obj.radioButton141:setName("radioButton141");

    obj.radioButton142 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton142:setParent(obj.layout97);
    obj.radioButton142:setLeft(0);
    obj.radioButton142:setTop(15);
    obj.radioButton142:setGroupName("grupo2");
    obj.radioButton142:setField("dado2");
    obj.radioButton142:setFieldValue("total1_2");
    obj.radioButton142:setName("radioButton142");

    obj.edit327 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout97);
    obj.edit327:setLeft(20);
    obj.edit327:setTop(0);
    obj.edit327:setWidth(100);
    obj.edit327:setHeight(25);
    obj.edit327:setField("nome1_2");
    obj.edit327:setName("edit327");

    obj.rectangle94 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout97);
    obj.rectangle94:setLeft(125);
    obj.rectangle94:setTop(0);
    obj.rectangle94:setWidth(40);
    obj.rectangle94:setHeight(25);
    obj.rectangle94:setColor("Black");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setName("rectangle94");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout97);
    obj.label169:setLeft(125);
    obj.label169:setTop(3);
    obj.label169:setWidth(40);
    obj.label169:setHeight(20);
    obj.label169:setField("total21_2");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.edit328 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout97);
    obj.edit328:setLeft(170);
    obj.edit328:setTop(0);
    obj.edit328:setWidth(30);
    obj.edit328:setHeight(25);
    obj.edit328:setType("number");
    obj.edit328:setMin(0);
    obj.edit328:setField("base1_2");
    obj.edit328:setName("edit328");

    obj.edit329 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout97);
    obj.edit329:setLeft(205);
    obj.edit329:setTop(0);
    obj.edit329:setWidth(30);
    obj.edit329:setHeight(25);
    obj.edit329:setType("number");
    obj.edit329:setMin(0);
    obj.edit329:setField("bonus1_2");
    obj.edit329:setName("edit329");

    obj.edit330 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout97);
    obj.edit330:setLeft(240);
    obj.edit330:setTop(0);
    obj.edit330:setWidth(30);
    obj.edit330:setHeight(25);
    obj.edit330:setType("number");
    obj.edit330:setMin(0);
    obj.edit330:setField("xp1_2");
    obj.edit330:setName("edit330");

    obj.edit331 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout97);
    obj.edit331:setLeft(20);
    obj.edit331:setTop(28);
    obj.edit331:setWidth(250);
    obj.edit331:setHeight(20);
    obj.edit331:setField("espec1_2");
    obj.edit331:setName("edit331");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout95);
    obj.layout98:setLeft(5);
    obj.layout98:setTop(150);
    obj.layout98:setWidth(270);
    obj.layout98:setHeight(50);
    obj.layout98:setName("layout98");

    obj.radioButton143 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton143:setParent(obj.layout98);
    obj.radioButton143:setLeft(0);
    obj.radioButton143:setTop(0);
    obj.radioButton143:setGroupName("grupo1");
    obj.radioButton143:setField("dado1");
    obj.radioButton143:setFieldValue("total1_3");
    obj.radioButton143:setName("radioButton143");

    obj.radioButton144 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton144:setParent(obj.layout98);
    obj.radioButton144:setLeft(0);
    obj.radioButton144:setTop(15);
    obj.radioButton144:setGroupName("grupo2");
    obj.radioButton144:setField("dado2");
    obj.radioButton144:setFieldValue("total1_3");
    obj.radioButton144:setName("radioButton144");

    obj.edit332 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout98);
    obj.edit332:setLeft(20);
    obj.edit332:setTop(0);
    obj.edit332:setWidth(100);
    obj.edit332:setHeight(25);
    obj.edit332:setField("nome1_3");
    obj.edit332:setName("edit332");

    obj.rectangle95 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout98);
    obj.rectangle95:setLeft(125);
    obj.rectangle95:setTop(0);
    obj.rectangle95:setWidth(40);
    obj.rectangle95:setHeight(25);
    obj.rectangle95:setColor("Black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout98);
    obj.label170:setLeft(125);
    obj.label170:setTop(3);
    obj.label170:setWidth(40);
    obj.label170:setHeight(20);
    obj.label170:setField("total21_3");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.edit333 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout98);
    obj.edit333:setLeft(170);
    obj.edit333:setTop(0);
    obj.edit333:setWidth(30);
    obj.edit333:setHeight(25);
    obj.edit333:setType("number");
    obj.edit333:setMin(0);
    obj.edit333:setField("base1_3");
    obj.edit333:setName("edit333");

    obj.edit334 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout98);
    obj.edit334:setLeft(205);
    obj.edit334:setTop(0);
    obj.edit334:setWidth(30);
    obj.edit334:setHeight(25);
    obj.edit334:setType("number");
    obj.edit334:setMin(0);
    obj.edit334:setField("bonus1_3");
    obj.edit334:setName("edit334");

    obj.edit335 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout98);
    obj.edit335:setLeft(240);
    obj.edit335:setTop(0);
    obj.edit335:setWidth(30);
    obj.edit335:setHeight(25);
    obj.edit335:setType("number");
    obj.edit335:setMin(0);
    obj.edit335:setField("xp1_3");
    obj.edit335:setName("edit335");

    obj.edit336 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout98);
    obj.edit336:setLeft(20);
    obj.edit336:setTop(28);
    obj.edit336:setWidth(250);
    obj.edit336:setHeight(20);
    obj.edit336:setField("espec1_3");
    obj.edit336:setName("edit336");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout95);
    obj.layout99:setLeft(5);
    obj.layout99:setTop(200);
    obj.layout99:setWidth(270);
    obj.layout99:setHeight(50);
    obj.layout99:setName("layout99");

    obj.radioButton145 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton145:setParent(obj.layout99);
    obj.radioButton145:setLeft(0);
    obj.radioButton145:setTop(0);
    obj.radioButton145:setGroupName("grupo1");
    obj.radioButton145:setField("dado1");
    obj.radioButton145:setFieldValue("total1_4");
    obj.radioButton145:setName("radioButton145");

    obj.radioButton146 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton146:setParent(obj.layout99);
    obj.radioButton146:setLeft(0);
    obj.radioButton146:setTop(15);
    obj.radioButton146:setGroupName("grupo2");
    obj.radioButton146:setField("dado2");
    obj.radioButton146:setFieldValue("total1_4");
    obj.radioButton146:setName("radioButton146");

    obj.edit337 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout99);
    obj.edit337:setLeft(20);
    obj.edit337:setTop(0);
    obj.edit337:setWidth(100);
    obj.edit337:setHeight(25);
    obj.edit337:setField("nome1_4");
    obj.edit337:setName("edit337");

    obj.rectangle96 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout99);
    obj.rectangle96:setLeft(125);
    obj.rectangle96:setTop(0);
    obj.rectangle96:setWidth(40);
    obj.rectangle96:setHeight(25);
    obj.rectangle96:setColor("Black");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setName("rectangle96");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout99);
    obj.label171:setLeft(125);
    obj.label171:setTop(3);
    obj.label171:setWidth(40);
    obj.label171:setHeight(20);
    obj.label171:setField("total21_4");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.edit338 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout99);
    obj.edit338:setLeft(170);
    obj.edit338:setTop(0);
    obj.edit338:setWidth(30);
    obj.edit338:setHeight(25);
    obj.edit338:setType("number");
    obj.edit338:setMin(0);
    obj.edit338:setField("base1_4");
    obj.edit338:setName("edit338");

    obj.edit339 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout99);
    obj.edit339:setLeft(205);
    obj.edit339:setTop(0);
    obj.edit339:setWidth(30);
    obj.edit339:setHeight(25);
    obj.edit339:setType("number");
    obj.edit339:setMin(0);
    obj.edit339:setField("bonus1_4");
    obj.edit339:setName("edit339");

    obj.edit340 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout99);
    obj.edit340:setLeft(240);
    obj.edit340:setTop(0);
    obj.edit340:setWidth(30);
    obj.edit340:setHeight(25);
    obj.edit340:setType("number");
    obj.edit340:setMin(0);
    obj.edit340:setField("xp1_4");
    obj.edit340:setName("edit340");

    obj.edit341 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout99);
    obj.edit341:setLeft(20);
    obj.edit341:setTop(28);
    obj.edit341:setWidth(250);
    obj.edit341:setHeight(20);
    obj.edit341:setField("espec1_4");
    obj.edit341:setName("edit341");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout95);
    obj.layout100:setLeft(5);
    obj.layout100:setTop(250);
    obj.layout100:setWidth(270);
    obj.layout100:setHeight(50);
    obj.layout100:setName("layout100");

    obj.radioButton147 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton147:setParent(obj.layout100);
    obj.radioButton147:setLeft(0);
    obj.radioButton147:setTop(0);
    obj.radioButton147:setGroupName("grupo1");
    obj.radioButton147:setField("dado1");
    obj.radioButton147:setFieldValue("total1_5");
    obj.radioButton147:setName("radioButton147");

    obj.radioButton148 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton148:setParent(obj.layout100);
    obj.radioButton148:setLeft(0);
    obj.radioButton148:setTop(15);
    obj.radioButton148:setGroupName("grupo2");
    obj.radioButton148:setField("dado2");
    obj.radioButton148:setFieldValue("total1_5");
    obj.radioButton148:setName("radioButton148");

    obj.edit342 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout100);
    obj.edit342:setLeft(20);
    obj.edit342:setTop(0);
    obj.edit342:setWidth(100);
    obj.edit342:setHeight(25);
    obj.edit342:setField("nome1_5");
    obj.edit342:setName("edit342");

    obj.rectangle97 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout100);
    obj.rectangle97:setLeft(125);
    obj.rectangle97:setTop(0);
    obj.rectangle97:setWidth(40);
    obj.rectangle97:setHeight(25);
    obj.rectangle97:setColor("Black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout100);
    obj.label172:setLeft(125);
    obj.label172:setTop(3);
    obj.label172:setWidth(40);
    obj.label172:setHeight(20);
    obj.label172:setField("total21_5");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.edit343 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout100);
    obj.edit343:setLeft(170);
    obj.edit343:setTop(0);
    obj.edit343:setWidth(30);
    obj.edit343:setHeight(25);
    obj.edit343:setType("number");
    obj.edit343:setMin(0);
    obj.edit343:setField("base1_5");
    obj.edit343:setName("edit343");

    obj.edit344 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout100);
    obj.edit344:setLeft(205);
    obj.edit344:setTop(0);
    obj.edit344:setWidth(30);
    obj.edit344:setHeight(25);
    obj.edit344:setType("number");
    obj.edit344:setMin(0);
    obj.edit344:setField("bonus1_5");
    obj.edit344:setName("edit344");

    obj.edit345 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout100);
    obj.edit345:setLeft(240);
    obj.edit345:setTop(0);
    obj.edit345:setWidth(30);
    obj.edit345:setHeight(25);
    obj.edit345:setType("number");
    obj.edit345:setMin(0);
    obj.edit345:setField("xp1_5");
    obj.edit345:setName("edit345");

    obj.edit346 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout100);
    obj.edit346:setLeft(20);
    obj.edit346:setTop(28);
    obj.edit346:setWidth(250);
    obj.edit346:setHeight(20);
    obj.edit346:setField("espec1_5");
    obj.edit346:setName("edit346");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout95);
    obj.layout101:setLeft(5);
    obj.layout101:setTop(300);
    obj.layout101:setWidth(270);
    obj.layout101:setHeight(50);
    obj.layout101:setName("layout101");

    obj.radioButton149 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton149:setParent(obj.layout101);
    obj.radioButton149:setLeft(0);
    obj.radioButton149:setTop(0);
    obj.radioButton149:setGroupName("grupo1");
    obj.radioButton149:setField("dado1");
    obj.radioButton149:setFieldValue("total1_6");
    obj.radioButton149:setName("radioButton149");

    obj.radioButton150 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton150:setParent(obj.layout101);
    obj.radioButton150:setLeft(0);
    obj.radioButton150:setTop(15);
    obj.radioButton150:setGroupName("grupo2");
    obj.radioButton150:setField("dado2");
    obj.radioButton150:setFieldValue("total1_6");
    obj.radioButton150:setName("radioButton150");

    obj.edit347 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout101);
    obj.edit347:setLeft(20);
    obj.edit347:setTop(0);
    obj.edit347:setWidth(100);
    obj.edit347:setHeight(25);
    obj.edit347:setField("nome1_6");
    obj.edit347:setName("edit347");

    obj.rectangle98 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout101);
    obj.rectangle98:setLeft(125);
    obj.rectangle98:setTop(0);
    obj.rectangle98:setWidth(40);
    obj.rectangle98:setHeight(25);
    obj.rectangle98:setColor("Black");
    obj.rectangle98:setStrokeColor("white");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setName("rectangle98");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout101);
    obj.label173:setLeft(125);
    obj.label173:setTop(3);
    obj.label173:setWidth(40);
    obj.label173:setHeight(20);
    obj.label173:setField("total21_6");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.edit348 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout101);
    obj.edit348:setLeft(170);
    obj.edit348:setTop(0);
    obj.edit348:setWidth(30);
    obj.edit348:setHeight(25);
    obj.edit348:setType("number");
    obj.edit348:setMin(0);
    obj.edit348:setField("base1_6");
    obj.edit348:setName("edit348");

    obj.edit349 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout101);
    obj.edit349:setLeft(205);
    obj.edit349:setTop(0);
    obj.edit349:setWidth(30);
    obj.edit349:setHeight(25);
    obj.edit349:setType("number");
    obj.edit349:setMin(0);
    obj.edit349:setField("bonus1_6");
    obj.edit349:setName("edit349");

    obj.edit350 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout101);
    obj.edit350:setLeft(240);
    obj.edit350:setTop(0);
    obj.edit350:setWidth(30);
    obj.edit350:setHeight(25);
    obj.edit350:setType("number");
    obj.edit350:setMin(0);
    obj.edit350:setField("xp1_6");
    obj.edit350:setName("edit350");

    obj.edit351 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout101);
    obj.edit351:setLeft(20);
    obj.edit351:setTop(28);
    obj.edit351:setWidth(250);
    obj.edit351:setHeight(20);
    obj.edit351:setField("espec1_6");
    obj.edit351:setName("edit351");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout95);
    obj.layout102:setLeft(5);
    obj.layout102:setTop(350);
    obj.layout102:setWidth(270);
    obj.layout102:setHeight(50);
    obj.layout102:setName("layout102");

    obj.radioButton151 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton151:setParent(obj.layout102);
    obj.radioButton151:setLeft(0);
    obj.radioButton151:setTop(0);
    obj.radioButton151:setGroupName("grupo1");
    obj.radioButton151:setField("dado1");
    obj.radioButton151:setFieldValue("total1_7");
    obj.radioButton151:setName("radioButton151");

    obj.radioButton152 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton152:setParent(obj.layout102);
    obj.radioButton152:setLeft(0);
    obj.radioButton152:setTop(15);
    obj.radioButton152:setGroupName("grupo2");
    obj.radioButton152:setField("dado2");
    obj.radioButton152:setFieldValue("total1_7");
    obj.radioButton152:setName("radioButton152");

    obj.edit352 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout102);
    obj.edit352:setLeft(20);
    obj.edit352:setTop(0);
    obj.edit352:setWidth(100);
    obj.edit352:setHeight(25);
    obj.edit352:setField("nome1_7");
    obj.edit352:setName("edit352");

    obj.rectangle99 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout102);
    obj.rectangle99:setLeft(125);
    obj.rectangle99:setTop(0);
    obj.rectangle99:setWidth(40);
    obj.rectangle99:setHeight(25);
    obj.rectangle99:setColor("Black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout102);
    obj.label174:setLeft(125);
    obj.label174:setTop(3);
    obj.label174:setWidth(40);
    obj.label174:setHeight(20);
    obj.label174:setField("total21_7");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.edit353 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout102);
    obj.edit353:setLeft(170);
    obj.edit353:setTop(0);
    obj.edit353:setWidth(30);
    obj.edit353:setHeight(25);
    obj.edit353:setType("number");
    obj.edit353:setMin(0);
    obj.edit353:setField("base1_7");
    obj.edit353:setName("edit353");

    obj.edit354 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout102);
    obj.edit354:setLeft(205);
    obj.edit354:setTop(0);
    obj.edit354:setWidth(30);
    obj.edit354:setHeight(25);
    obj.edit354:setType("number");
    obj.edit354:setMin(0);
    obj.edit354:setField("bonus1_7");
    obj.edit354:setName("edit354");

    obj.edit355 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout102);
    obj.edit355:setLeft(240);
    obj.edit355:setTop(0);
    obj.edit355:setWidth(30);
    obj.edit355:setHeight(25);
    obj.edit355:setType("number");
    obj.edit355:setMin(0);
    obj.edit355:setField("xp1_7");
    obj.edit355:setName("edit355");

    obj.edit356 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout102);
    obj.edit356:setLeft(20);
    obj.edit356:setTop(28);
    obj.edit356:setWidth(250);
    obj.edit356:setHeight(20);
    obj.edit356:setField("espec1_7");
    obj.edit356:setName("edit356");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout95);
    obj.layout103:setLeft(5);
    obj.layout103:setTop(400);
    obj.layout103:setWidth(270);
    obj.layout103:setHeight(50);
    obj.layout103:setName("layout103");

    obj.radioButton153 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton153:setParent(obj.layout103);
    obj.radioButton153:setLeft(0);
    obj.radioButton153:setTop(0);
    obj.radioButton153:setGroupName("grupo1");
    obj.radioButton153:setField("dado1");
    obj.radioButton153:setFieldValue("total1_8");
    obj.radioButton153:setName("radioButton153");

    obj.radioButton154 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton154:setParent(obj.layout103);
    obj.radioButton154:setLeft(0);
    obj.radioButton154:setTop(15);
    obj.radioButton154:setGroupName("grupo2");
    obj.radioButton154:setField("dado2");
    obj.radioButton154:setFieldValue("total1_8");
    obj.radioButton154:setName("radioButton154");

    obj.edit357 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout103);
    obj.edit357:setLeft(20);
    obj.edit357:setTop(0);
    obj.edit357:setWidth(100);
    obj.edit357:setHeight(25);
    obj.edit357:setField("nome1_8");
    obj.edit357:setName("edit357");

    obj.rectangle100 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout103);
    obj.rectangle100:setLeft(125);
    obj.rectangle100:setTop(0);
    obj.rectangle100:setWidth(40);
    obj.rectangle100:setHeight(25);
    obj.rectangle100:setColor("Black");
    obj.rectangle100:setStrokeColor("white");
    obj.rectangle100:setStrokeSize(1);
    obj.rectangle100:setName("rectangle100");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout103);
    obj.label175:setLeft(125);
    obj.label175:setTop(3);
    obj.label175:setWidth(40);
    obj.label175:setHeight(20);
    obj.label175:setField("total21_8");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.edit358 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout103);
    obj.edit358:setLeft(170);
    obj.edit358:setTop(0);
    obj.edit358:setWidth(30);
    obj.edit358:setHeight(25);
    obj.edit358:setType("number");
    obj.edit358:setMin(0);
    obj.edit358:setField("base1_8");
    obj.edit358:setName("edit358");

    obj.edit359 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout103);
    obj.edit359:setLeft(205);
    obj.edit359:setTop(0);
    obj.edit359:setWidth(30);
    obj.edit359:setHeight(25);
    obj.edit359:setType("number");
    obj.edit359:setMin(0);
    obj.edit359:setField("bonus1_8");
    obj.edit359:setName("edit359");

    obj.edit360 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout103);
    obj.edit360:setLeft(240);
    obj.edit360:setTop(0);
    obj.edit360:setWidth(30);
    obj.edit360:setHeight(25);
    obj.edit360:setType("number");
    obj.edit360:setMin(0);
    obj.edit360:setField("xp1_8");
    obj.edit360:setName("edit360");

    obj.edit361 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout103);
    obj.edit361:setLeft(20);
    obj.edit361:setTop(28);
    obj.edit361:setWidth(250);
    obj.edit361:setHeight(20);
    obj.edit361:setField("espec1_8");
    obj.edit361:setName("edit361");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout95);
    obj.layout104:setLeft(5);
    obj.layout104:setTop(450);
    obj.layout104:setWidth(270);
    obj.layout104:setHeight(50);
    obj.layout104:setName("layout104");

    obj.radioButton155 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton155:setParent(obj.layout104);
    obj.radioButton155:setLeft(0);
    obj.radioButton155:setTop(0);
    obj.radioButton155:setGroupName("grupo1");
    obj.radioButton155:setField("dado1");
    obj.radioButton155:setFieldValue("total1_9");
    obj.radioButton155:setName("radioButton155");

    obj.radioButton156 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton156:setParent(obj.layout104);
    obj.radioButton156:setLeft(0);
    obj.radioButton156:setTop(15);
    obj.radioButton156:setGroupName("grupo2");
    obj.radioButton156:setField("dado2");
    obj.radioButton156:setFieldValue("total1_9");
    obj.radioButton156:setName("radioButton156");

    obj.edit362 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout104);
    obj.edit362:setLeft(20);
    obj.edit362:setTop(0);
    obj.edit362:setWidth(100);
    obj.edit362:setHeight(25);
    obj.edit362:setField("nome1_9");
    obj.edit362:setName("edit362");

    obj.rectangle101 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout104);
    obj.rectangle101:setLeft(125);
    obj.rectangle101:setTop(0);
    obj.rectangle101:setWidth(40);
    obj.rectangle101:setHeight(25);
    obj.rectangle101:setColor("Black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout104);
    obj.label176:setLeft(125);
    obj.label176:setTop(3);
    obj.label176:setWidth(40);
    obj.label176:setHeight(20);
    obj.label176:setField("total21_9");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.edit363 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout104);
    obj.edit363:setLeft(170);
    obj.edit363:setTop(0);
    obj.edit363:setWidth(30);
    obj.edit363:setHeight(25);
    obj.edit363:setType("number");
    obj.edit363:setMin(0);
    obj.edit363:setField("base1_9");
    obj.edit363:setName("edit363");

    obj.edit364 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout104);
    obj.edit364:setLeft(205);
    obj.edit364:setTop(0);
    obj.edit364:setWidth(30);
    obj.edit364:setHeight(25);
    obj.edit364:setType("number");
    obj.edit364:setMin(0);
    obj.edit364:setField("bonus1_9");
    obj.edit364:setName("edit364");

    obj.edit365 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout104);
    obj.edit365:setLeft(240);
    obj.edit365:setTop(0);
    obj.edit365:setWidth(30);
    obj.edit365:setHeight(25);
    obj.edit365:setType("number");
    obj.edit365:setMin(0);
    obj.edit365:setField("xp1_9");
    obj.edit365:setName("edit365");

    obj.edit366 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout104);
    obj.edit366:setLeft(20);
    obj.edit366:setTop(28);
    obj.edit366:setWidth(250);
    obj.edit366:setHeight(20);
    obj.edit366:setField("espec1_9");
    obj.edit366:setName("edit366");

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout95);
    obj.layout105:setLeft(5);
    obj.layout105:setTop(500);
    obj.layout105:setWidth(270);
    obj.layout105:setHeight(50);
    obj.layout105:setName("layout105");

    obj.radioButton157 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton157:setParent(obj.layout105);
    obj.radioButton157:setLeft(0);
    obj.radioButton157:setTop(0);
    obj.radioButton157:setGroupName("grupo1");
    obj.radioButton157:setField("dado1");
    obj.radioButton157:setFieldValue("total1_10");
    obj.radioButton157:setName("radioButton157");

    obj.radioButton158 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton158:setParent(obj.layout105);
    obj.radioButton158:setLeft(0);
    obj.radioButton158:setTop(15);
    obj.radioButton158:setGroupName("grupo2");
    obj.radioButton158:setField("dado2");
    obj.radioButton158:setFieldValue("total1_10");
    obj.radioButton158:setName("radioButton158");

    obj.edit367 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout105);
    obj.edit367:setLeft(20);
    obj.edit367:setTop(0);
    obj.edit367:setWidth(100);
    obj.edit367:setHeight(25);
    obj.edit367:setField("nome1_10");
    obj.edit367:setName("edit367");

    obj.rectangle102 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout105);
    obj.rectangle102:setLeft(125);
    obj.rectangle102:setTop(0);
    obj.rectangle102:setWidth(40);
    obj.rectangle102:setHeight(25);
    obj.rectangle102:setColor("Black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout105);
    obj.label177:setLeft(125);
    obj.label177:setTop(3);
    obj.label177:setWidth(40);
    obj.label177:setHeight(20);
    obj.label177:setField("total21_10");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.edit368 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout105);
    obj.edit368:setLeft(170);
    obj.edit368:setTop(0);
    obj.edit368:setWidth(30);
    obj.edit368:setHeight(25);
    obj.edit368:setType("number");
    obj.edit368:setMin(0);
    obj.edit368:setField("base1_10");
    obj.edit368:setName("edit368");

    obj.edit369 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout105);
    obj.edit369:setLeft(205);
    obj.edit369:setTop(0);
    obj.edit369:setWidth(30);
    obj.edit369:setHeight(25);
    obj.edit369:setType("number");
    obj.edit369:setMin(0);
    obj.edit369:setField("bonus1_10");
    obj.edit369:setName("edit369");

    obj.edit370 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout105);
    obj.edit370:setLeft(240);
    obj.edit370:setTop(0);
    obj.edit370:setWidth(30);
    obj.edit370:setHeight(25);
    obj.edit370:setType("number");
    obj.edit370:setMin(0);
    obj.edit370:setField("xp1_10");
    obj.edit370:setName("edit370");

    obj.edit371 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout105);
    obj.edit371:setLeft(20);
    obj.edit371:setTop(28);
    obj.edit371:setWidth(250);
    obj.edit371:setHeight(20);
    obj.edit371:setField("espec1_10");
    obj.edit371:setName("edit371");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout95);
    obj.layout106:setLeft(5);
    obj.layout106:setTop(550);
    obj.layout106:setWidth(270);
    obj.layout106:setHeight(50);
    obj.layout106:setName("layout106");

    obj.radioButton159 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton159:setParent(obj.layout106);
    obj.radioButton159:setLeft(0);
    obj.radioButton159:setTop(0);
    obj.radioButton159:setGroupName("grupo1");
    obj.radioButton159:setField("dado1");
    obj.radioButton159:setFieldValue("total1_11");
    obj.radioButton159:setName("radioButton159");

    obj.radioButton160 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton160:setParent(obj.layout106);
    obj.radioButton160:setLeft(0);
    obj.radioButton160:setTop(15);
    obj.radioButton160:setGroupName("grupo2");
    obj.radioButton160:setField("dado2");
    obj.radioButton160:setFieldValue("total1_11");
    obj.radioButton160:setName("radioButton160");

    obj.edit372 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout106);
    obj.edit372:setLeft(20);
    obj.edit372:setTop(0);
    obj.edit372:setWidth(100);
    obj.edit372:setHeight(25);
    obj.edit372:setField("nome1_11");
    obj.edit372:setName("edit372");

    obj.rectangle103 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout106);
    obj.rectangle103:setLeft(125);
    obj.rectangle103:setTop(0);
    obj.rectangle103:setWidth(40);
    obj.rectangle103:setHeight(25);
    obj.rectangle103:setColor("Black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout106);
    obj.label178:setLeft(125);
    obj.label178:setTop(3);
    obj.label178:setWidth(40);
    obj.label178:setHeight(20);
    obj.label178:setField("total21_11");
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.edit373 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout106);
    obj.edit373:setLeft(170);
    obj.edit373:setTop(0);
    obj.edit373:setWidth(30);
    obj.edit373:setHeight(25);
    obj.edit373:setType("number");
    obj.edit373:setMin(0);
    obj.edit373:setField("base1_11");
    obj.edit373:setName("edit373");

    obj.edit374 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout106);
    obj.edit374:setLeft(205);
    obj.edit374:setTop(0);
    obj.edit374:setWidth(30);
    obj.edit374:setHeight(25);
    obj.edit374:setType("number");
    obj.edit374:setMin(0);
    obj.edit374:setField("bonus1_11");
    obj.edit374:setName("edit374");

    obj.edit375 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout106);
    obj.edit375:setLeft(240);
    obj.edit375:setTop(0);
    obj.edit375:setWidth(30);
    obj.edit375:setHeight(25);
    obj.edit375:setType("number");
    obj.edit375:setMin(0);
    obj.edit375:setField("xp1_11");
    obj.edit375:setName("edit375");

    obj.edit376 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout106);
    obj.edit376:setLeft(20);
    obj.edit376:setTop(28);
    obj.edit376:setWidth(250);
    obj.edit376:setHeight(20);
    obj.edit376:setField("espec1_11");
    obj.edit376:setName("edit376");

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout95);
    obj.layout107:setLeft(5);
    obj.layout107:setTop(600);
    obj.layout107:setWidth(270);
    obj.layout107:setHeight(50);
    obj.layout107:setName("layout107");

    obj.radioButton161 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton161:setParent(obj.layout107);
    obj.radioButton161:setLeft(0);
    obj.radioButton161:setTop(0);
    obj.radioButton161:setGroupName("grupo1");
    obj.radioButton161:setField("dado1");
    obj.radioButton161:setFieldValue("total1_12");
    obj.radioButton161:setName("radioButton161");

    obj.radioButton162 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton162:setParent(obj.layout107);
    obj.radioButton162:setLeft(0);
    obj.radioButton162:setTop(15);
    obj.radioButton162:setGroupName("grupo2");
    obj.radioButton162:setField("dado2");
    obj.radioButton162:setFieldValue("total1_12");
    obj.radioButton162:setName("radioButton162");

    obj.edit377 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout107);
    obj.edit377:setLeft(20);
    obj.edit377:setTop(0);
    obj.edit377:setWidth(100);
    obj.edit377:setHeight(25);
    obj.edit377:setField("nome1_12");
    obj.edit377:setName("edit377");

    obj.rectangle104 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout107);
    obj.rectangle104:setLeft(125);
    obj.rectangle104:setTop(0);
    obj.rectangle104:setWidth(40);
    obj.rectangle104:setHeight(25);
    obj.rectangle104:setColor("Black");
    obj.rectangle104:setStrokeColor("white");
    obj.rectangle104:setStrokeSize(1);
    obj.rectangle104:setName("rectangle104");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout107);
    obj.label179:setLeft(125);
    obj.label179:setTop(3);
    obj.label179:setWidth(40);
    obj.label179:setHeight(20);
    obj.label179:setField("total21_12");
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");

    obj.edit378 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout107);
    obj.edit378:setLeft(170);
    obj.edit378:setTop(0);
    obj.edit378:setWidth(30);
    obj.edit378:setHeight(25);
    obj.edit378:setType("number");
    obj.edit378:setMin(0);
    obj.edit378:setField("base1_12");
    obj.edit378:setName("edit378");

    obj.edit379 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout107);
    obj.edit379:setLeft(205);
    obj.edit379:setTop(0);
    obj.edit379:setWidth(30);
    obj.edit379:setHeight(25);
    obj.edit379:setType("number");
    obj.edit379:setMin(0);
    obj.edit379:setField("bonus1_12");
    obj.edit379:setName("edit379");

    obj.edit380 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout107);
    obj.edit380:setLeft(240);
    obj.edit380:setTop(0);
    obj.edit380:setWidth(30);
    obj.edit380:setHeight(25);
    obj.edit380:setType("number");
    obj.edit380:setMin(0);
    obj.edit380:setField("xp1_12");
    obj.edit380:setName("edit380");

    obj.edit381 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout107);
    obj.edit381:setLeft(20);
    obj.edit381:setTop(28);
    obj.edit381:setWidth(250);
    obj.edit381:setHeight(20);
    obj.edit381:setField("espec1_12");
    obj.edit381:setName("edit381");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.scrollBox4);
    obj.layout108:setLeft(900);
    obj.layout108:setTop(0);
    obj.layout108:setWidth(280);
    obj.layout108:setHeight(630);
    obj.layout108:setName("layout108");

    obj.rectangle105 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout108);
    obj.rectangle105:setLeft(0);
    obj.rectangle105:setTop(0);
    obj.rectangle105:setWidth(280);
    obj.rectangle105:setHeight(630);
    obj.rectangle105:setColor("black");
    obj.rectangle105:setXradius(15);
    obj.rectangle105:setYradius(15);
    obj.rectangle105:setCornerType("round");
    obj.rectangle105:setName("rectangle105");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout108);
    obj.label180:setLeft(5);
    obj.label180:setTop(0);
    obj.label180:setWidth(240);
    obj.label180:setHeight(20);
    obj.label180:setText("CONHECIMENTOS MENTAIS");
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout108);
    obj.label181:setLeft(25);
    obj.label181:setTop(25);
    obj.label181:setWidth(315);
    obj.label181:setHeight(20);
    obj.label181:setText(" Nome");
    obj.label181:setName("label181");

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout108);
    obj.label182:setLeft(135);
    obj.label182:setTop(25);
    obj.label182:setWidth(315);
    obj.label182:setHeight(20);
    obj.label182:setText("Total");
    obj.label182:setName("label182");

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout108);
    obj.label183:setLeft(170);
    obj.label183:setTop(25);
    obj.label183:setWidth(315);
    obj.label183:setHeight(20);
    obj.label183:setText(" Inic");
    obj.label183:setName("label183");

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout108);
    obj.label184:setLeft(202);
    obj.label184:setTop(25);
    obj.label184:setWidth(315);
    obj.label184:setHeight(20);
    obj.label184:setText(" Apr.");
    obj.label184:setName("label184");

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout108);
    obj.label185:setLeft(235);
    obj.label185:setTop(25);
    obj.label185:setWidth(315);
    obj.label185:setHeight(20);
    obj.label185:setText("  XP");
    obj.label185:setName("label185");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setLeft(5);
    obj.layout109:setTop(50);
    obj.layout109:setWidth(270);
    obj.layout109:setHeight(50);
    obj.layout109:setName("layout109");

    obj.radioButton163 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton163:setParent(obj.layout109);
    obj.radioButton163:setLeft(0);
    obj.radioButton163:setTop(0);
    obj.radioButton163:setGroupName("grupo1");
    obj.radioButton163:setField("dado1");
    obj.radioButton163:setFieldValue("total3_1");
    obj.radioButton163:setName("radioButton163");

    obj.radioButton164 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton164:setParent(obj.layout109);
    obj.radioButton164:setLeft(0);
    obj.radioButton164:setTop(15);
    obj.radioButton164:setGroupName("grupo2");
    obj.radioButton164:setField("dado2");
    obj.radioButton164:setFieldValue("total3_1");
    obj.radioButton164:setName("radioButton164");

    obj.edit382 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout109);
    obj.edit382:setLeft(20);
    obj.edit382:setTop(0);
    obj.edit382:setWidth(100);
    obj.edit382:setHeight(25);
    obj.edit382:setField("nome3_1");
    obj.edit382:setName("edit382");

    obj.rectangle106 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout109);
    obj.rectangle106:setLeft(125);
    obj.rectangle106:setTop(0);
    obj.rectangle106:setWidth(40);
    obj.rectangle106:setHeight(25);
    obj.rectangle106:setColor("Black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout109);
    obj.label186:setLeft(125);
    obj.label186:setTop(3);
    obj.label186:setWidth(40);
    obj.label186:setHeight(20);
    obj.label186:setField("total23_1");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.edit383 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout109);
    obj.edit383:setLeft(170);
    obj.edit383:setTop(0);
    obj.edit383:setWidth(30);
    obj.edit383:setHeight(25);
    obj.edit383:setType("number");
    obj.edit383:setMin(0);
    obj.edit383:setField("base3_1");
    obj.edit383:setName("edit383");

    obj.edit384 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout109);
    obj.edit384:setLeft(205);
    obj.edit384:setTop(0);
    obj.edit384:setWidth(30);
    obj.edit384:setHeight(25);
    obj.edit384:setType("number");
    obj.edit384:setMin(0);
    obj.edit384:setField("bonus3_1");
    obj.edit384:setName("edit384");

    obj.edit385 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout109);
    obj.edit385:setLeft(240);
    obj.edit385:setTop(0);
    obj.edit385:setWidth(30);
    obj.edit385:setHeight(25);
    obj.edit385:setType("number");
    obj.edit385:setMin(0);
    obj.edit385:setField("xp3_1");
    obj.edit385:setName("edit385");

    obj.edit386 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout109);
    obj.edit386:setLeft(20);
    obj.edit386:setTop(28);
    obj.edit386:setWidth(250);
    obj.edit386:setHeight(20);
    obj.edit386:setField("espec3_1");
    obj.edit386:setName("edit386");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout108);
    obj.layout110:setLeft(5);
    obj.layout110:setTop(100);
    obj.layout110:setWidth(270);
    obj.layout110:setHeight(50);
    obj.layout110:setName("layout110");

    obj.radioButton165 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton165:setParent(obj.layout110);
    obj.radioButton165:setLeft(0);
    obj.radioButton165:setTop(0);
    obj.radioButton165:setGroupName("grupo1");
    obj.radioButton165:setField("dado1");
    obj.radioButton165:setFieldValue("total3_2");
    obj.radioButton165:setName("radioButton165");

    obj.radioButton166 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton166:setParent(obj.layout110);
    obj.radioButton166:setLeft(0);
    obj.radioButton166:setTop(15);
    obj.radioButton166:setGroupName("grupo2");
    obj.radioButton166:setField("dado2");
    obj.radioButton166:setFieldValue("total3_2");
    obj.radioButton166:setName("radioButton166");

    obj.edit387 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout110);
    obj.edit387:setLeft(20);
    obj.edit387:setTop(0);
    obj.edit387:setWidth(100);
    obj.edit387:setHeight(25);
    obj.edit387:setField("nome3_2");
    obj.edit387:setName("edit387");

    obj.rectangle107 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout110);
    obj.rectangle107:setLeft(125);
    obj.rectangle107:setTop(0);
    obj.rectangle107:setWidth(40);
    obj.rectangle107:setHeight(25);
    obj.rectangle107:setColor("Black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout110);
    obj.label187:setLeft(125);
    obj.label187:setTop(3);
    obj.label187:setWidth(40);
    obj.label187:setHeight(20);
    obj.label187:setField("total23_2");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.edit388 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout110);
    obj.edit388:setLeft(170);
    obj.edit388:setTop(0);
    obj.edit388:setWidth(30);
    obj.edit388:setHeight(25);
    obj.edit388:setType("number");
    obj.edit388:setMin(0);
    obj.edit388:setField("base3_2");
    obj.edit388:setName("edit388");

    obj.edit389 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout110);
    obj.edit389:setLeft(205);
    obj.edit389:setTop(0);
    obj.edit389:setWidth(30);
    obj.edit389:setHeight(25);
    obj.edit389:setType("number");
    obj.edit389:setMin(0);
    obj.edit389:setField("bonus3_2");
    obj.edit389:setName("edit389");

    obj.edit390 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout110);
    obj.edit390:setLeft(240);
    obj.edit390:setTop(0);
    obj.edit390:setWidth(30);
    obj.edit390:setHeight(25);
    obj.edit390:setType("number");
    obj.edit390:setMin(0);
    obj.edit390:setField("xp3_2");
    obj.edit390:setName("edit390");

    obj.edit391 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout110);
    obj.edit391:setLeft(20);
    obj.edit391:setTop(28);
    obj.edit391:setWidth(250);
    obj.edit391:setHeight(20);
    obj.edit391:setField("espec3_2");
    obj.edit391:setName("edit391");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout108);
    obj.layout111:setLeft(5);
    obj.layout111:setTop(150);
    obj.layout111:setWidth(270);
    obj.layout111:setHeight(50);
    obj.layout111:setName("layout111");

    obj.radioButton167 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton167:setParent(obj.layout111);
    obj.radioButton167:setLeft(0);
    obj.radioButton167:setTop(0);
    obj.radioButton167:setGroupName("grupo1");
    obj.radioButton167:setField("dado1");
    obj.radioButton167:setFieldValue("total3_3");
    obj.radioButton167:setName("radioButton167");

    obj.radioButton168 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton168:setParent(obj.layout111);
    obj.radioButton168:setLeft(0);
    obj.radioButton168:setTop(15);
    obj.radioButton168:setGroupName("grupo2");
    obj.radioButton168:setField("dado2");
    obj.radioButton168:setFieldValue("total3_3");
    obj.radioButton168:setName("radioButton168");

    obj.edit392 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout111);
    obj.edit392:setLeft(20);
    obj.edit392:setTop(0);
    obj.edit392:setWidth(100);
    obj.edit392:setHeight(25);
    obj.edit392:setField("nome3_3");
    obj.edit392:setName("edit392");

    obj.rectangle108 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout111);
    obj.rectangle108:setLeft(125);
    obj.rectangle108:setTop(0);
    obj.rectangle108:setWidth(40);
    obj.rectangle108:setHeight(25);
    obj.rectangle108:setColor("Black");
    obj.rectangle108:setStrokeColor("white");
    obj.rectangle108:setStrokeSize(1);
    obj.rectangle108:setName("rectangle108");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout111);
    obj.label188:setLeft(125);
    obj.label188:setTop(3);
    obj.label188:setWidth(40);
    obj.label188:setHeight(20);
    obj.label188:setField("total23_3");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.edit393 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout111);
    obj.edit393:setLeft(170);
    obj.edit393:setTop(0);
    obj.edit393:setWidth(30);
    obj.edit393:setHeight(25);
    obj.edit393:setType("number");
    obj.edit393:setMin(0);
    obj.edit393:setField("base3_3");
    obj.edit393:setName("edit393");

    obj.edit394 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout111);
    obj.edit394:setLeft(205);
    obj.edit394:setTop(0);
    obj.edit394:setWidth(30);
    obj.edit394:setHeight(25);
    obj.edit394:setType("number");
    obj.edit394:setMin(0);
    obj.edit394:setField("bonus3_3");
    obj.edit394:setName("edit394");

    obj.edit395 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout111);
    obj.edit395:setLeft(240);
    obj.edit395:setTop(0);
    obj.edit395:setWidth(30);
    obj.edit395:setHeight(25);
    obj.edit395:setType("number");
    obj.edit395:setMin(0);
    obj.edit395:setField("xp3_3");
    obj.edit395:setName("edit395");

    obj.edit396 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout111);
    obj.edit396:setLeft(20);
    obj.edit396:setTop(28);
    obj.edit396:setWidth(250);
    obj.edit396:setHeight(20);
    obj.edit396:setField("espec3_3");
    obj.edit396:setName("edit396");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout108);
    obj.layout112:setLeft(5);
    obj.layout112:setTop(200);
    obj.layout112:setWidth(270);
    obj.layout112:setHeight(50);
    obj.layout112:setName("layout112");

    obj.radioButton169 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton169:setParent(obj.layout112);
    obj.radioButton169:setLeft(0);
    obj.radioButton169:setTop(0);
    obj.radioButton169:setGroupName("grupo1");
    obj.radioButton169:setField("dado1");
    obj.radioButton169:setFieldValue("total3_4");
    obj.radioButton169:setName("radioButton169");

    obj.radioButton170 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton170:setParent(obj.layout112);
    obj.radioButton170:setLeft(0);
    obj.radioButton170:setTop(15);
    obj.radioButton170:setGroupName("grupo2");
    obj.radioButton170:setField("dado2");
    obj.radioButton170:setFieldValue("total3_4");
    obj.radioButton170:setName("radioButton170");

    obj.edit397 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout112);
    obj.edit397:setLeft(20);
    obj.edit397:setTop(0);
    obj.edit397:setWidth(100);
    obj.edit397:setHeight(25);
    obj.edit397:setField("nome3_4");
    obj.edit397:setName("edit397");

    obj.rectangle109 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout112);
    obj.rectangle109:setLeft(125);
    obj.rectangle109:setTop(0);
    obj.rectangle109:setWidth(40);
    obj.rectangle109:setHeight(25);
    obj.rectangle109:setColor("Black");
    obj.rectangle109:setStrokeColor("white");
    obj.rectangle109:setStrokeSize(1);
    obj.rectangle109:setName("rectangle109");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout112);
    obj.label189:setLeft(125);
    obj.label189:setTop(3);
    obj.label189:setWidth(40);
    obj.label189:setHeight(20);
    obj.label189:setField("total23_4");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.edit398 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout112);
    obj.edit398:setLeft(170);
    obj.edit398:setTop(0);
    obj.edit398:setWidth(30);
    obj.edit398:setHeight(25);
    obj.edit398:setType("number");
    obj.edit398:setMin(0);
    obj.edit398:setField("base3_4");
    obj.edit398:setName("edit398");

    obj.edit399 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout112);
    obj.edit399:setLeft(205);
    obj.edit399:setTop(0);
    obj.edit399:setWidth(30);
    obj.edit399:setHeight(25);
    obj.edit399:setType("number");
    obj.edit399:setMin(0);
    obj.edit399:setField("bonus3_4");
    obj.edit399:setName("edit399");

    obj.edit400 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout112);
    obj.edit400:setLeft(240);
    obj.edit400:setTop(0);
    obj.edit400:setWidth(30);
    obj.edit400:setHeight(25);
    obj.edit400:setType("number");
    obj.edit400:setMin(0);
    obj.edit400:setField("xp3_4");
    obj.edit400:setName("edit400");

    obj.edit401 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout112);
    obj.edit401:setLeft(20);
    obj.edit401:setTop(28);
    obj.edit401:setWidth(250);
    obj.edit401:setHeight(20);
    obj.edit401:setField("espec3_4");
    obj.edit401:setName("edit401");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout108);
    obj.layout113:setLeft(5);
    obj.layout113:setTop(250);
    obj.layout113:setWidth(270);
    obj.layout113:setHeight(50);
    obj.layout113:setName("layout113");

    obj.radioButton171 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton171:setParent(obj.layout113);
    obj.radioButton171:setLeft(0);
    obj.radioButton171:setTop(0);
    obj.radioButton171:setGroupName("grupo1");
    obj.radioButton171:setField("dado1");
    obj.radioButton171:setFieldValue("total3_5");
    obj.radioButton171:setName("radioButton171");

    obj.radioButton172 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton172:setParent(obj.layout113);
    obj.radioButton172:setLeft(0);
    obj.radioButton172:setTop(15);
    obj.radioButton172:setGroupName("grupo2");
    obj.radioButton172:setField("dado2");
    obj.radioButton172:setFieldValue("total3_5");
    obj.radioButton172:setName("radioButton172");

    obj.edit402 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout113);
    obj.edit402:setLeft(20);
    obj.edit402:setTop(0);
    obj.edit402:setWidth(100);
    obj.edit402:setHeight(25);
    obj.edit402:setField("nome3_5");
    obj.edit402:setName("edit402");

    obj.rectangle110 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout113);
    obj.rectangle110:setLeft(125);
    obj.rectangle110:setTop(0);
    obj.rectangle110:setWidth(40);
    obj.rectangle110:setHeight(25);
    obj.rectangle110:setColor("Black");
    obj.rectangle110:setStrokeColor("white");
    obj.rectangle110:setStrokeSize(1);
    obj.rectangle110:setName("rectangle110");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout113);
    obj.label190:setLeft(125);
    obj.label190:setTop(3);
    obj.label190:setWidth(40);
    obj.label190:setHeight(20);
    obj.label190:setField("total23_5");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.edit403 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout113);
    obj.edit403:setLeft(170);
    obj.edit403:setTop(0);
    obj.edit403:setWidth(30);
    obj.edit403:setHeight(25);
    obj.edit403:setType("number");
    obj.edit403:setMin(0);
    obj.edit403:setField("base3_5");
    obj.edit403:setName("edit403");

    obj.edit404 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout113);
    obj.edit404:setLeft(205);
    obj.edit404:setTop(0);
    obj.edit404:setWidth(30);
    obj.edit404:setHeight(25);
    obj.edit404:setType("number");
    obj.edit404:setMin(0);
    obj.edit404:setField("bonus3_5");
    obj.edit404:setName("edit404");

    obj.edit405 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout113);
    obj.edit405:setLeft(240);
    obj.edit405:setTop(0);
    obj.edit405:setWidth(30);
    obj.edit405:setHeight(25);
    obj.edit405:setType("number");
    obj.edit405:setMin(0);
    obj.edit405:setField("xp3_5");
    obj.edit405:setName("edit405");

    obj.edit406 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout113);
    obj.edit406:setLeft(20);
    obj.edit406:setTop(28);
    obj.edit406:setWidth(250);
    obj.edit406:setHeight(20);
    obj.edit406:setField("espec3_5");
    obj.edit406:setName("edit406");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout108);
    obj.layout114:setLeft(5);
    obj.layout114:setTop(300);
    obj.layout114:setWidth(270);
    obj.layout114:setHeight(50);
    obj.layout114:setName("layout114");

    obj.radioButton173 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton173:setParent(obj.layout114);
    obj.radioButton173:setLeft(0);
    obj.radioButton173:setTop(0);
    obj.radioButton173:setGroupName("grupo1");
    obj.radioButton173:setField("dado1");
    obj.radioButton173:setFieldValue("total3_6");
    obj.radioButton173:setName("radioButton173");

    obj.radioButton174 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton174:setParent(obj.layout114);
    obj.radioButton174:setLeft(0);
    obj.radioButton174:setTop(15);
    obj.radioButton174:setGroupName("grupo2");
    obj.radioButton174:setField("dado2");
    obj.radioButton174:setFieldValue("total3_6");
    obj.radioButton174:setName("radioButton174");

    obj.edit407 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout114);
    obj.edit407:setLeft(20);
    obj.edit407:setTop(0);
    obj.edit407:setWidth(100);
    obj.edit407:setHeight(25);
    obj.edit407:setField("nome3_6");
    obj.edit407:setName("edit407");

    obj.rectangle111 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout114);
    obj.rectangle111:setLeft(125);
    obj.rectangle111:setTop(0);
    obj.rectangle111:setWidth(40);
    obj.rectangle111:setHeight(25);
    obj.rectangle111:setColor("Black");
    obj.rectangle111:setStrokeColor("white");
    obj.rectangle111:setStrokeSize(1);
    obj.rectangle111:setName("rectangle111");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout114);
    obj.label191:setLeft(125);
    obj.label191:setTop(3);
    obj.label191:setWidth(40);
    obj.label191:setHeight(20);
    obj.label191:setField("total23_6");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.edit408 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout114);
    obj.edit408:setLeft(170);
    obj.edit408:setTop(0);
    obj.edit408:setWidth(30);
    obj.edit408:setHeight(25);
    obj.edit408:setType("number");
    obj.edit408:setMin(0);
    obj.edit408:setField("base3_6");
    obj.edit408:setName("edit408");

    obj.edit409 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout114);
    obj.edit409:setLeft(205);
    obj.edit409:setTop(0);
    obj.edit409:setWidth(30);
    obj.edit409:setHeight(25);
    obj.edit409:setType("number");
    obj.edit409:setMin(0);
    obj.edit409:setField("bonus3_6");
    obj.edit409:setName("edit409");

    obj.edit410 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout114);
    obj.edit410:setLeft(240);
    obj.edit410:setTop(0);
    obj.edit410:setWidth(30);
    obj.edit410:setHeight(25);
    obj.edit410:setType("number");
    obj.edit410:setMin(0);
    obj.edit410:setField("xp3_6");
    obj.edit410:setName("edit410");

    obj.edit411 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout114);
    obj.edit411:setLeft(20);
    obj.edit411:setTop(28);
    obj.edit411:setWidth(250);
    obj.edit411:setHeight(20);
    obj.edit411:setField("espec3_6");
    obj.edit411:setName("edit411");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout108);
    obj.layout115:setLeft(5);
    obj.layout115:setTop(350);
    obj.layout115:setWidth(270);
    obj.layout115:setHeight(50);
    obj.layout115:setName("layout115");

    obj.radioButton175 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton175:setParent(obj.layout115);
    obj.radioButton175:setLeft(0);
    obj.radioButton175:setTop(0);
    obj.radioButton175:setGroupName("grupo1");
    obj.radioButton175:setField("dado1");
    obj.radioButton175:setFieldValue("total3_7");
    obj.radioButton175:setName("radioButton175");

    obj.radioButton176 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton176:setParent(obj.layout115);
    obj.radioButton176:setLeft(0);
    obj.radioButton176:setTop(15);
    obj.radioButton176:setGroupName("grupo2");
    obj.radioButton176:setField("dado2");
    obj.radioButton176:setFieldValue("total3_7");
    obj.radioButton176:setName("radioButton176");

    obj.edit412 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout115);
    obj.edit412:setLeft(20);
    obj.edit412:setTop(0);
    obj.edit412:setWidth(100);
    obj.edit412:setHeight(25);
    obj.edit412:setField("nome3_7");
    obj.edit412:setName("edit412");

    obj.rectangle112 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout115);
    obj.rectangle112:setLeft(125);
    obj.rectangle112:setTop(0);
    obj.rectangle112:setWidth(40);
    obj.rectangle112:setHeight(25);
    obj.rectangle112:setColor("Black");
    obj.rectangle112:setStrokeColor("white");
    obj.rectangle112:setStrokeSize(1);
    obj.rectangle112:setName("rectangle112");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout115);
    obj.label192:setLeft(125);
    obj.label192:setTop(3);
    obj.label192:setWidth(40);
    obj.label192:setHeight(20);
    obj.label192:setField("total23_7");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.edit413 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout115);
    obj.edit413:setLeft(170);
    obj.edit413:setTop(0);
    obj.edit413:setWidth(30);
    obj.edit413:setHeight(25);
    obj.edit413:setType("number");
    obj.edit413:setMin(0);
    obj.edit413:setField("base3_7");
    obj.edit413:setName("edit413");

    obj.edit414 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout115);
    obj.edit414:setLeft(205);
    obj.edit414:setTop(0);
    obj.edit414:setWidth(30);
    obj.edit414:setHeight(25);
    obj.edit414:setType("number");
    obj.edit414:setMin(0);
    obj.edit414:setField("bonus3_7");
    obj.edit414:setName("edit414");

    obj.edit415 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout115);
    obj.edit415:setLeft(240);
    obj.edit415:setTop(0);
    obj.edit415:setWidth(30);
    obj.edit415:setHeight(25);
    obj.edit415:setType("number");
    obj.edit415:setMin(0);
    obj.edit415:setField("xp3_7");
    obj.edit415:setName("edit415");

    obj.edit416 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout115);
    obj.edit416:setLeft(20);
    obj.edit416:setTop(28);
    obj.edit416:setWidth(250);
    obj.edit416:setHeight(20);
    obj.edit416:setField("espec3_7");
    obj.edit416:setName("edit416");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout108);
    obj.layout116:setLeft(5);
    obj.layout116:setTop(400);
    obj.layout116:setWidth(270);
    obj.layout116:setHeight(50);
    obj.layout116:setName("layout116");

    obj.radioButton177 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton177:setParent(obj.layout116);
    obj.radioButton177:setLeft(0);
    obj.radioButton177:setTop(0);
    obj.radioButton177:setGroupName("grupo1");
    obj.radioButton177:setField("dado1");
    obj.radioButton177:setFieldValue("total3_8");
    obj.radioButton177:setName("radioButton177");

    obj.radioButton178 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton178:setParent(obj.layout116);
    obj.radioButton178:setLeft(0);
    obj.radioButton178:setTop(15);
    obj.radioButton178:setGroupName("grupo2");
    obj.radioButton178:setField("dado2");
    obj.radioButton178:setFieldValue("total3_8");
    obj.radioButton178:setName("radioButton178");

    obj.edit417 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout116);
    obj.edit417:setLeft(20);
    obj.edit417:setTop(0);
    obj.edit417:setWidth(100);
    obj.edit417:setHeight(25);
    obj.edit417:setField("nome3_8");
    obj.edit417:setName("edit417");

    obj.rectangle113 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout116);
    obj.rectangle113:setLeft(125);
    obj.rectangle113:setTop(0);
    obj.rectangle113:setWidth(40);
    obj.rectangle113:setHeight(25);
    obj.rectangle113:setColor("Black");
    obj.rectangle113:setStrokeColor("white");
    obj.rectangle113:setStrokeSize(1);
    obj.rectangle113:setName("rectangle113");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout116);
    obj.label193:setLeft(125);
    obj.label193:setTop(3);
    obj.label193:setWidth(40);
    obj.label193:setHeight(20);
    obj.label193:setField("total23_8");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.edit418 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout116);
    obj.edit418:setLeft(170);
    obj.edit418:setTop(0);
    obj.edit418:setWidth(30);
    obj.edit418:setHeight(25);
    obj.edit418:setType("number");
    obj.edit418:setMin(0);
    obj.edit418:setField("base3_8");
    obj.edit418:setName("edit418");

    obj.edit419 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout116);
    obj.edit419:setLeft(205);
    obj.edit419:setTop(0);
    obj.edit419:setWidth(30);
    obj.edit419:setHeight(25);
    obj.edit419:setType("number");
    obj.edit419:setMin(0);
    obj.edit419:setField("bonus3_8");
    obj.edit419:setName("edit419");

    obj.edit420 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout116);
    obj.edit420:setLeft(240);
    obj.edit420:setTop(0);
    obj.edit420:setWidth(30);
    obj.edit420:setHeight(25);
    obj.edit420:setType("number");
    obj.edit420:setMin(0);
    obj.edit420:setField("xp3_8");
    obj.edit420:setName("edit420");

    obj.edit421 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout116);
    obj.edit421:setLeft(20);
    obj.edit421:setTop(28);
    obj.edit421:setWidth(250);
    obj.edit421:setHeight(20);
    obj.edit421:setField("espec3_8");
    obj.edit421:setName("edit421");

    obj.layout117 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout108);
    obj.layout117:setLeft(5);
    obj.layout117:setTop(450);
    obj.layout117:setWidth(270);
    obj.layout117:setHeight(50);
    obj.layout117:setName("layout117");

    obj.radioButton179 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton179:setParent(obj.layout117);
    obj.radioButton179:setLeft(0);
    obj.radioButton179:setTop(0);
    obj.radioButton179:setGroupName("grupo1");
    obj.radioButton179:setField("dado1");
    obj.radioButton179:setFieldValue("total3_9");
    obj.radioButton179:setName("radioButton179");

    obj.radioButton180 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton180:setParent(obj.layout117);
    obj.radioButton180:setLeft(0);
    obj.radioButton180:setTop(15);
    obj.radioButton180:setGroupName("grupo2");
    obj.radioButton180:setField("dado2");
    obj.radioButton180:setFieldValue("total3_9");
    obj.radioButton180:setName("radioButton180");

    obj.edit422 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout117);
    obj.edit422:setLeft(20);
    obj.edit422:setTop(0);
    obj.edit422:setWidth(100);
    obj.edit422:setHeight(25);
    obj.edit422:setField("nome3_9");
    obj.edit422:setName("edit422");

    obj.rectangle114 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout117);
    obj.rectangle114:setLeft(125);
    obj.rectangle114:setTop(0);
    obj.rectangle114:setWidth(40);
    obj.rectangle114:setHeight(25);
    obj.rectangle114:setColor("Black");
    obj.rectangle114:setStrokeColor("white");
    obj.rectangle114:setStrokeSize(1);
    obj.rectangle114:setName("rectangle114");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout117);
    obj.label194:setLeft(125);
    obj.label194:setTop(3);
    obj.label194:setWidth(40);
    obj.label194:setHeight(20);
    obj.label194:setField("total23_9");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.edit423 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout117);
    obj.edit423:setLeft(170);
    obj.edit423:setTop(0);
    obj.edit423:setWidth(30);
    obj.edit423:setHeight(25);
    obj.edit423:setType("number");
    obj.edit423:setMin(0);
    obj.edit423:setField("base3_9");
    obj.edit423:setName("edit423");

    obj.edit424 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout117);
    obj.edit424:setLeft(205);
    obj.edit424:setTop(0);
    obj.edit424:setWidth(30);
    obj.edit424:setHeight(25);
    obj.edit424:setType("number");
    obj.edit424:setMin(0);
    obj.edit424:setField("bonus3_9");
    obj.edit424:setName("edit424");

    obj.edit425 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout117);
    obj.edit425:setLeft(240);
    obj.edit425:setTop(0);
    obj.edit425:setWidth(30);
    obj.edit425:setHeight(25);
    obj.edit425:setType("number");
    obj.edit425:setMin(0);
    obj.edit425:setField("xp3_9");
    obj.edit425:setName("edit425");

    obj.edit426 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout117);
    obj.edit426:setLeft(20);
    obj.edit426:setTop(28);
    obj.edit426:setWidth(250);
    obj.edit426:setHeight(20);
    obj.edit426:setField("espec3_9");
    obj.edit426:setName("edit426");

    obj.layout118 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout108);
    obj.layout118:setLeft(5);
    obj.layout118:setTop(500);
    obj.layout118:setWidth(270);
    obj.layout118:setHeight(50);
    obj.layout118:setName("layout118");

    obj.radioButton181 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton181:setParent(obj.layout118);
    obj.radioButton181:setLeft(0);
    obj.radioButton181:setTop(0);
    obj.radioButton181:setGroupName("grupo1");
    obj.radioButton181:setField("dado1");
    obj.radioButton181:setFieldValue("total3_10");
    obj.radioButton181:setName("radioButton181");

    obj.radioButton182 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton182:setParent(obj.layout118);
    obj.radioButton182:setLeft(0);
    obj.radioButton182:setTop(15);
    obj.radioButton182:setGroupName("grupo2");
    obj.radioButton182:setField("dado2");
    obj.radioButton182:setFieldValue("total3_10");
    obj.radioButton182:setName("radioButton182");

    obj.edit427 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout118);
    obj.edit427:setLeft(20);
    obj.edit427:setTop(0);
    obj.edit427:setWidth(100);
    obj.edit427:setHeight(25);
    obj.edit427:setField("nome3_10");
    obj.edit427:setName("edit427");

    obj.rectangle115 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout118);
    obj.rectangle115:setLeft(125);
    obj.rectangle115:setTop(0);
    obj.rectangle115:setWidth(40);
    obj.rectangle115:setHeight(25);
    obj.rectangle115:setColor("Black");
    obj.rectangle115:setStrokeColor("white");
    obj.rectangle115:setStrokeSize(1);
    obj.rectangle115:setName("rectangle115");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout118);
    obj.label195:setLeft(125);
    obj.label195:setTop(3);
    obj.label195:setWidth(40);
    obj.label195:setHeight(20);
    obj.label195:setField("total23_10");
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.edit428 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout118);
    obj.edit428:setLeft(170);
    obj.edit428:setTop(0);
    obj.edit428:setWidth(30);
    obj.edit428:setHeight(25);
    obj.edit428:setType("number");
    obj.edit428:setMin(0);
    obj.edit428:setField("base3_10");
    obj.edit428:setName("edit428");

    obj.edit429 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout118);
    obj.edit429:setLeft(205);
    obj.edit429:setTop(0);
    obj.edit429:setWidth(30);
    obj.edit429:setHeight(25);
    obj.edit429:setType("number");
    obj.edit429:setMin(0);
    obj.edit429:setField("bonus3_10");
    obj.edit429:setName("edit429");

    obj.edit430 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout118);
    obj.edit430:setLeft(240);
    obj.edit430:setTop(0);
    obj.edit430:setWidth(30);
    obj.edit430:setHeight(25);
    obj.edit430:setType("number");
    obj.edit430:setMin(0);
    obj.edit430:setField("xp3_10");
    obj.edit430:setName("edit430");

    obj.edit431 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout118);
    obj.edit431:setLeft(20);
    obj.edit431:setTop(28);
    obj.edit431:setWidth(250);
    obj.edit431:setHeight(20);
    obj.edit431:setField("espec3_10");
    obj.edit431:setName("edit431");

    obj.layout119 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout108);
    obj.layout119:setLeft(5);
    obj.layout119:setTop(550);
    obj.layout119:setWidth(270);
    obj.layout119:setHeight(50);
    obj.layout119:setName("layout119");

    obj.radioButton183 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton183:setParent(obj.layout119);
    obj.radioButton183:setLeft(0);
    obj.radioButton183:setTop(0);
    obj.radioButton183:setGroupName("grupo1");
    obj.radioButton183:setField("dado1");
    obj.radioButton183:setFieldValue("total3_11");
    obj.radioButton183:setName("radioButton183");

    obj.radioButton184 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton184:setParent(obj.layout119);
    obj.radioButton184:setLeft(0);
    obj.radioButton184:setTop(15);
    obj.radioButton184:setGroupName("grupo2");
    obj.radioButton184:setField("dado2");
    obj.radioButton184:setFieldValue("total3_11");
    obj.radioButton184:setName("radioButton184");

    obj.edit432 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout119);
    obj.edit432:setLeft(20);
    obj.edit432:setTop(0);
    obj.edit432:setWidth(100);
    obj.edit432:setHeight(25);
    obj.edit432:setField("nome3_11");
    obj.edit432:setName("edit432");

    obj.rectangle116 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout119);
    obj.rectangle116:setLeft(125);
    obj.rectangle116:setTop(0);
    obj.rectangle116:setWidth(40);
    obj.rectangle116:setHeight(25);
    obj.rectangle116:setColor("Black");
    obj.rectangle116:setStrokeColor("white");
    obj.rectangle116:setStrokeSize(1);
    obj.rectangle116:setName("rectangle116");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout119);
    obj.label196:setLeft(125);
    obj.label196:setTop(3);
    obj.label196:setWidth(40);
    obj.label196:setHeight(20);
    obj.label196:setField("total23_11");
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.edit433 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout119);
    obj.edit433:setLeft(170);
    obj.edit433:setTop(0);
    obj.edit433:setWidth(30);
    obj.edit433:setHeight(25);
    obj.edit433:setType("number");
    obj.edit433:setMin(0);
    obj.edit433:setField("base3_11");
    obj.edit433:setName("edit433");

    obj.edit434 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout119);
    obj.edit434:setLeft(205);
    obj.edit434:setTop(0);
    obj.edit434:setWidth(30);
    obj.edit434:setHeight(25);
    obj.edit434:setType("number");
    obj.edit434:setMin(0);
    obj.edit434:setField("bonus3_11");
    obj.edit434:setName("edit434");

    obj.edit435 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout119);
    obj.edit435:setLeft(240);
    obj.edit435:setTop(0);
    obj.edit435:setWidth(30);
    obj.edit435:setHeight(25);
    obj.edit435:setType("number");
    obj.edit435:setMin(0);
    obj.edit435:setField("xp3_11");
    obj.edit435:setName("edit435");

    obj.edit436 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout119);
    obj.edit436:setLeft(20);
    obj.edit436:setTop(28);
    obj.edit436:setWidth(250);
    obj.edit436:setHeight(20);
    obj.edit436:setField("espec3_11");
    obj.edit436:setName("edit436");

    obj.layout120 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout108);
    obj.layout120:setLeft(5);
    obj.layout120:setTop(600);
    obj.layout120:setWidth(270);
    obj.layout120:setHeight(50);
    obj.layout120:setName("layout120");

    obj.radioButton185 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton185:setParent(obj.layout120);
    obj.radioButton185:setLeft(0);
    obj.radioButton185:setTop(0);
    obj.radioButton185:setGroupName("grupo1");
    obj.radioButton185:setField("dado1");
    obj.radioButton185:setFieldValue("total3_12");
    obj.radioButton185:setName("radioButton185");

    obj.radioButton186 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton186:setParent(obj.layout120);
    obj.radioButton186:setLeft(0);
    obj.radioButton186:setTop(15);
    obj.radioButton186:setGroupName("grupo2");
    obj.radioButton186:setField("dado2");
    obj.radioButton186:setFieldValue("total3_12");
    obj.radioButton186:setName("radioButton186");

    obj.edit437 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout120);
    obj.edit437:setLeft(20);
    obj.edit437:setTop(0);
    obj.edit437:setWidth(100);
    obj.edit437:setHeight(25);
    obj.edit437:setField("nome3_12");
    obj.edit437:setName("edit437");

    obj.rectangle117 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout120);
    obj.rectangle117:setLeft(125);
    obj.rectangle117:setTop(0);
    obj.rectangle117:setWidth(40);
    obj.rectangle117:setHeight(25);
    obj.rectangle117:setColor("Black");
    obj.rectangle117:setStrokeColor("white");
    obj.rectangle117:setStrokeSize(1);
    obj.rectangle117:setName("rectangle117");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout120);
    obj.label197:setLeft(125);
    obj.label197:setTop(3);
    obj.label197:setWidth(40);
    obj.label197:setHeight(20);
    obj.label197:setField("total23_12");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.edit438 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout120);
    obj.edit438:setLeft(170);
    obj.edit438:setTop(0);
    obj.edit438:setWidth(30);
    obj.edit438:setHeight(25);
    obj.edit438:setType("number");
    obj.edit438:setMin(0);
    obj.edit438:setField("base3_12");
    obj.edit438:setName("edit438");

    obj.edit439 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout120);
    obj.edit439:setLeft(205);
    obj.edit439:setTop(0);
    obj.edit439:setWidth(30);
    obj.edit439:setHeight(25);
    obj.edit439:setType("number");
    obj.edit439:setMin(0);
    obj.edit439:setField("bonus3_12");
    obj.edit439:setName("edit439");

    obj.edit440 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout120);
    obj.edit440:setLeft(240);
    obj.edit440:setTop(0);
    obj.edit440:setWidth(30);
    obj.edit440:setHeight(25);
    obj.edit440:setType("number");
    obj.edit440:setMin(0);
    obj.edit440:setField("xp3_12");
    obj.edit440:setName("edit440");

    obj.edit441 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout120);
    obj.edit441:setLeft(20);
    obj.edit441:setTop(28);
    obj.edit441:setWidth(250);
    obj.edit441:setHeight(20);
    obj.edit441:setField("espec3_12");
    obj.edit441:setName("edit441");

    obj.layout121 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox4);
    obj.layout121:setLeft(1200);
    obj.layout121:setTop(0);
    obj.layout121:setWidth(110);
    obj.layout121:setHeight(230);
    obj.layout121:setName("layout121");

    obj.rectangle118 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout121);
    obj.rectangle118:setLeft(0);
    obj.rectangle118:setTop(0);
    obj.rectangle118:setWidth(110);
    obj.rectangle118:setHeight(230);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setXradius(15);
    obj.rectangle118:setYradius(15);
    obj.rectangle118:setCornerType("round");
    obj.rectangle118:setName("rectangle118");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout121);
    obj.label198:setLeft(5);
    obj.label198:setTop(10);
    obj.label198:setWidth(50);
    obj.label198:setHeight(20);
    obj.label198:setText("Dado 1");
    obj.label198:setName("label198");

    obj.rectangle119 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout121);
    obj.rectangle119:setLeft(50);
    obj.rectangle119:setTop(8);
    obj.rectangle119:setWidth(35);
    obj.rectangle119:setHeight(25);
    obj.rectangle119:setColor("Black");
    obj.rectangle119:setStrokeColor("white");
    obj.rectangle119:setStrokeSize(1);
    obj.rectangle119:setName("rectangle119");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout121);
    obj.label199:setLeft(60);
    obj.label199:setTop(10);
    obj.label199:setWidth(30);
    obj.label199:setHeight(20);
    obj.label199:setField("num1");
    obj.label199:setText("val");
    obj.label199:setName("label199");

    obj.label200 = gui.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout121);
    obj.label200:setLeft(63);
    obj.label200:setTop(35);
    obj.label200:setWidth(10);
    obj.label200:setHeight(20);
    obj.label200:setText("+");
    obj.label200:setName("label200");

    obj.label201 = gui.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout121);
    obj.label201:setLeft(5);
    obj.label201:setTop(60);
    obj.label201:setWidth(50);
    obj.label201:setHeight(20);
    obj.label201:setText("Dado 2");
    obj.label201:setName("label201");

    obj.rectangle120 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout121);
    obj.rectangle120:setLeft(50);
    obj.rectangle120:setTop(58);
    obj.rectangle120:setWidth(35);
    obj.rectangle120:setHeight(25);
    obj.rectangle120:setColor("Black");
    obj.rectangle120:setStrokeColor("white");
    obj.rectangle120:setStrokeSize(1);
    obj.rectangle120:setName("rectangle120");

    obj.label202 = gui.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout121);
    obj.label202:setLeft(60);
    obj.label202:setTop(60);
    obj.label202:setWidth(30);
    obj.label202:setHeight(20);
    obj.label202:setField("num2");
    obj.label202:setText("val");
    obj.label202:setName("label202");

    obj.label203 = gui.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout121);
    obj.label203:setLeft(63);
    obj.label203:setTop(85);
    obj.label203:setWidth(10);
    obj.label203:setHeight(20);
    obj.label203:setText("+");
    obj.label203:setName("label203");

    obj.label204 = gui.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout121);
    obj.label204:setLeft(5);
    obj.label204:setTop(110);
    obj.label204:setWidth(40);
    obj.label204:setHeight(20);
    obj.label204:setText("Especs");
    obj.label204:setName("label204");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout121);
    obj.comboBox2:setLeft(50);
    obj.comboBox2:setTop(110);
    obj.comboBox2:setWidth(50);
    obj.comboBox2:setItems({'0', '1,5', '3'});
    obj.comboBox2:setValues({'0', '1', '2'});
    obj.comboBox2:setValue("0");
    obj.comboBox2:setField("especBonus");
    obj.comboBox2:setName("comboBox2");

    obj.label205 = gui.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout121);
    obj.label205:setLeft(5);
    obj.label205:setTop(135);
    obj.label205:setWidth(40);
    obj.label205:setHeight(20);
    obj.label205:setText("Extra");
    obj.label205:setName("label205");

    obj.edit442 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout121);
    obj.edit442:setLeft(50);
    obj.edit442:setTop(135);
    obj.edit442:setWidth(30);
    obj.edit442:setHeight(25);
    obj.edit442:setField("extra");
    obj.edit442:setName("edit442");

    obj.label206 = gui.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout121);
    obj.label206:setLeft(5);
    obj.label206:setTop(165);
    obj.label206:setWidth(40);
    obj.label206:setHeight(20);
    obj.label206:setText("Dific.");
    obj.label206:setName("label206");

    obj.edit443 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout121);
    obj.edit443:setLeft(50);
    obj.edit443:setTop(165);
    obj.edit443:setWidth(30);
    obj.edit443:setHeight(25);
    obj.edit443:setField("dificuldade");
    obj.edit443:setType("number");
    obj.edit443:setName("edit443");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout121);
    obj.button4:setLeft(30);
    obj.button4:setTop(195);
    obj.button4:setWidth(50);
    obj.button4:setText("ROLAR");
    obj.button4:setName("button4");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmACN3 = gui.fromHandle(_obj_newObject("form"));
    obj.frmACN3:setParent(obj.tab3);
    obj.frmACN3:setName("frmACN3");
    obj.frmACN3:setAlign("client");
    obj.frmACN3:setTheme("dark");
    obj.frmACN3:setMargins({top=1});

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmACN3);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout122 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox5);
    obj.layout122:setLeft(0);
    obj.layout122:setTop(0);
    obj.layout122:setWidth(400);
    obj.layout122:setHeight(600);
    obj.layout122:setName("layout122");

    obj.rectangle121 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout122);
    obj.rectangle121:setLeft(0);
    obj.rectangle121:setTop(0);
    obj.rectangle121:setWidth(400);
    obj.rectangle121:setHeight(600);
    obj.rectangle121:setColor("black");
    obj.rectangle121:setXradius(15);
    obj.rectangle121:setYradius(15);
    obj.rectangle121:setCornerType("round");
    obj.rectangle121:setName("rectangle121");

    obj.label207 = gui.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout122);
    obj.label207:setLeft(0);
    obj.label207:setTop(0);
    obj.label207:setWidth(400);
    obj.label207:setHeight(20);
    obj.label207:setText("EQUIPAMENTOS");
    obj.label207:setHorzTextAlign("center");
    obj.label207:setName("label207");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout122);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(380);
    obj.textEditor1:setHeight(560);
    obj.textEditor1:setField("equipamentos");
    obj.textEditor1:setName("textEditor1");

    obj.layout123 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox5);
    obj.layout123:setLeft(410);
    obj.layout123:setTop(0);
    obj.layout123:setWidth(400);
    obj.layout123:setHeight(250);
    obj.layout123:setName("layout123");

    obj.rectangle122 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout123);
    obj.rectangle122:setLeft(0);
    obj.rectangle122:setTop(0);
    obj.rectangle122:setWidth(400);
    obj.rectangle122:setHeight(250);
    obj.rectangle122:setColor("black");
    obj.rectangle122:setXradius(15);
    obj.rectangle122:setYradius(15);
    obj.rectangle122:setCornerType("round");
    obj.rectangle122:setName("rectangle122");

    obj.label208 = gui.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout123);
    obj.label208:setLeft(0);
    obj.label208:setTop(0);
    obj.label208:setWidth(400);
    obj.label208:setHeight(20);
    obj.label208:setText("POSSES");
    obj.label208:setHorzTextAlign("center");
    obj.label208:setName("label208");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout123);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(210);
    obj.textEditor2:setField("bens");
    obj.textEditor2:setName("textEditor2");

    obj.layout124 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox5);
    obj.layout124:setLeft(820);
    obj.layout124:setTop(0);
    obj.layout124:setWidth(400);
    obj.layout124:setHeight(250);
    obj.layout124:setName("layout124");

    obj.rectangle123 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout124);
    obj.rectangle123:setLeft(0);
    obj.rectangle123:setTop(0);
    obj.rectangle123:setWidth(400);
    obj.rectangle123:setHeight(250);
    obj.rectangle123:setColor("black");
    obj.rectangle123:setXradius(15);
    obj.rectangle123:setYradius(15);
    obj.rectangle123:setCornerType("round");
    obj.rectangle123:setName("rectangle123");

    obj.label209 = gui.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout124);
    obj.label209:setLeft(0);
    obj.label209:setTop(0);
    obj.label209:setWidth(400);
    obj.label209:setHeight(20);
    obj.label209:setText("OUTROS");
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout124);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(210);
    obj.textEditor3:setField("outrosItens");
    obj.textEditor3:setName("textEditor3");

    obj.layout125 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox5);
    obj.layout125:setLeft(410);
    obj.layout125:setTop(260);
    obj.layout125:setWidth(810);
    obj.layout125:setHeight(245);
    obj.layout125:setName("layout125");

    obj.rectangle124 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.layout125);
    obj.rectangle124:setLeft(0);
    obj.rectangle124:setTop(0);
    obj.rectangle124:setWidth(810);
    obj.rectangle124:setHeight(245);
    obj.rectangle124:setColor("black");
    obj.rectangle124:setXradius(15);
    obj.rectangle124:setYradius(15);
    obj.rectangle124:setCornerType("round");
    obj.rectangle124:setName("rectangle124");

    obj.label210 = gui.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout125);
    obj.label210:setLeft(0);
    obj.label210:setTop(0);
    obj.label210:setWidth(810);
    obj.label210:setHeight(20);
    obj.label210:setText("ARMAS");
    obj.label210:setHorzTextAlign("center");
    obj.label210:setName("label210");

    obj.label211 = gui.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout125);
    obj.label211:setLeft(10);
    obj.label211:setTop(25);
    obj.label211:setWidth(150);
    obj.label211:setHeight(20);
    obj.label211:setText("Nome");
    obj.label211:setName("label211");

    obj.label212 = gui.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout125);
    obj.label212:setLeft(170);
    obj.label212:setTop(25);
    obj.label212:setWidth(150);
    obj.label212:setHeight(20);
    obj.label212:setText("Teste");
    obj.label212:setName("label212");

    obj.label213 = gui.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout125);
    obj.label213:setLeft(330);
    obj.label213:setTop(25);
    obj.label213:setWidth(35);
    obj.label213:setHeight(20);
    obj.label213:setText("Dific");
    obj.label213:setName("label213");

    obj.label214 = gui.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout125);
    obj.label214:setLeft(370);
    obj.label214:setTop(25);
    obj.label214:setWidth(40);
    obj.label214:setHeight(20);
    obj.label214:setText("Dano");
    obj.label214:setName("label214");

    obj.label215 = gui.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout125);
    obj.label215:setLeft(410);
    obj.label215:setTop(25);
    obj.label215:setWidth(35);
    obj.label215:setHeight(20);
    obj.label215:setText("Mun.");
    obj.label215:setName("label215");

    obj.label216 = gui.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout125);
    obj.label216:setLeft(450);
    obj.label216:setTop(25);
    obj.label216:setWidth(350);
    obj.label216:setHeight(20);
    obj.label216:setText("Outros");
    obj.label216:setName("label216");

    obj.edit444 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout125);
    obj.edit444:setLeft(10);
    obj.edit444:setTop(50);
    obj.edit444:setWidth(150);
    obj.edit444:setHeight(25);
    obj.edit444:setField("nome1");
    obj.edit444:setName("edit444");

    obj.edit445 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit445:setParent(obj.layout125);
    obj.edit445:setLeft(170);
    obj.edit445:setTop(50);
    obj.edit445:setWidth(150);
    obj.edit445:setHeight(25);
    obj.edit445:setField("teste1");
    obj.edit445:setName("edit445");

    obj.edit446 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit446:setParent(obj.layout125);
    obj.edit446:setLeft(330);
    obj.edit446:setTop(50);
    obj.edit446:setWidth(30);
    obj.edit446:setHeight(25);
    obj.edit446:setField("dificuldade1");
    obj.edit446:setName("edit446");

    obj.edit447 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit447:setParent(obj.layout125);
    obj.edit447:setLeft(370);
    obj.edit447:setTop(50);
    obj.edit447:setWidth(30);
    obj.edit447:setHeight(25);
    obj.edit447:setField("dano1");
    obj.edit447:setName("edit447");

    obj.edit448 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit448:setParent(obj.layout125);
    obj.edit448:setLeft(410);
    obj.edit448:setTop(50);
    obj.edit448:setWidth(30);
    obj.edit448:setHeight(25);
    obj.edit448:setField("municao1");
    obj.edit448:setName("edit448");

    obj.edit449 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit449:setParent(obj.layout125);
    obj.edit449:setLeft(450);
    obj.edit449:setTop(50);
    obj.edit449:setWidth(350);
    obj.edit449:setHeight(25);
    obj.edit449:setField("outros1");
    obj.edit449:setName("edit449");

    obj.edit450 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit450:setParent(obj.layout125);
    obj.edit450:setLeft(10);
    obj.edit450:setTop(80);
    obj.edit450:setWidth(150);
    obj.edit450:setHeight(25);
    obj.edit450:setField("nome2");
    obj.edit450:setName("edit450");

    obj.edit451 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit451:setParent(obj.layout125);
    obj.edit451:setLeft(170);
    obj.edit451:setTop(80);
    obj.edit451:setWidth(150);
    obj.edit451:setHeight(25);
    obj.edit451:setField("teste2");
    obj.edit451:setName("edit451");

    obj.edit452 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit452:setParent(obj.layout125);
    obj.edit452:setLeft(330);
    obj.edit452:setTop(80);
    obj.edit452:setWidth(30);
    obj.edit452:setHeight(25);
    obj.edit452:setField("dificuldade2");
    obj.edit452:setName("edit452");

    obj.edit453 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit453:setParent(obj.layout125);
    obj.edit453:setLeft(370);
    obj.edit453:setTop(80);
    obj.edit453:setWidth(30);
    obj.edit453:setHeight(25);
    obj.edit453:setField("dano2");
    obj.edit453:setName("edit453");

    obj.edit454 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit454:setParent(obj.layout125);
    obj.edit454:setLeft(410);
    obj.edit454:setTop(80);
    obj.edit454:setWidth(30);
    obj.edit454:setHeight(25);
    obj.edit454:setField("municao2");
    obj.edit454:setName("edit454");

    obj.edit455 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit455:setParent(obj.layout125);
    obj.edit455:setLeft(450);
    obj.edit455:setTop(80);
    obj.edit455:setWidth(350);
    obj.edit455:setHeight(25);
    obj.edit455:setField("outros2");
    obj.edit455:setName("edit455");

    obj.edit456 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit456:setParent(obj.layout125);
    obj.edit456:setLeft(10);
    obj.edit456:setTop(110);
    obj.edit456:setWidth(150);
    obj.edit456:setHeight(25);
    obj.edit456:setField("nome3");
    obj.edit456:setName("edit456");

    obj.edit457 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit457:setParent(obj.layout125);
    obj.edit457:setLeft(170);
    obj.edit457:setTop(110);
    obj.edit457:setWidth(150);
    obj.edit457:setHeight(25);
    obj.edit457:setField("teste3");
    obj.edit457:setName("edit457");

    obj.edit458 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit458:setParent(obj.layout125);
    obj.edit458:setLeft(330);
    obj.edit458:setTop(110);
    obj.edit458:setWidth(30);
    obj.edit458:setHeight(25);
    obj.edit458:setField("dificuldade3");
    obj.edit458:setName("edit458");

    obj.edit459 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit459:setParent(obj.layout125);
    obj.edit459:setLeft(370);
    obj.edit459:setTop(110);
    obj.edit459:setWidth(30);
    obj.edit459:setHeight(25);
    obj.edit459:setField("dano3");
    obj.edit459:setName("edit459");

    obj.edit460 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit460:setParent(obj.layout125);
    obj.edit460:setLeft(410);
    obj.edit460:setTop(110);
    obj.edit460:setWidth(30);
    obj.edit460:setHeight(25);
    obj.edit460:setField("municao3");
    obj.edit460:setName("edit460");

    obj.edit461 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit461:setParent(obj.layout125);
    obj.edit461:setLeft(450);
    obj.edit461:setTop(110);
    obj.edit461:setWidth(350);
    obj.edit461:setHeight(25);
    obj.edit461:setField("outros3");
    obj.edit461:setName("edit461");

    obj.edit462 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit462:setParent(obj.layout125);
    obj.edit462:setLeft(10);
    obj.edit462:setTop(140);
    obj.edit462:setWidth(150);
    obj.edit462:setHeight(25);
    obj.edit462:setField("nome4");
    obj.edit462:setName("edit462");

    obj.edit463 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit463:setParent(obj.layout125);
    obj.edit463:setLeft(170);
    obj.edit463:setTop(140);
    obj.edit463:setWidth(150);
    obj.edit463:setHeight(25);
    obj.edit463:setField("teste4");
    obj.edit463:setName("edit463");

    obj.edit464 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit464:setParent(obj.layout125);
    obj.edit464:setLeft(330);
    obj.edit464:setTop(140);
    obj.edit464:setWidth(30);
    obj.edit464:setHeight(25);
    obj.edit464:setField("dificuldade4");
    obj.edit464:setName("edit464");

    obj.edit465 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit465:setParent(obj.layout125);
    obj.edit465:setLeft(370);
    obj.edit465:setTop(140);
    obj.edit465:setWidth(30);
    obj.edit465:setHeight(25);
    obj.edit465:setField("dano4");
    obj.edit465:setName("edit465");

    obj.edit466 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit466:setParent(obj.layout125);
    obj.edit466:setLeft(410);
    obj.edit466:setTop(140);
    obj.edit466:setWidth(30);
    obj.edit466:setHeight(25);
    obj.edit466:setField("municao4");
    obj.edit466:setName("edit466");

    obj.edit467 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit467:setParent(obj.layout125);
    obj.edit467:setLeft(450);
    obj.edit467:setTop(140);
    obj.edit467:setWidth(350);
    obj.edit467:setHeight(25);
    obj.edit467:setField("outros4");
    obj.edit467:setName("edit467");

    obj.edit468 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit468:setParent(obj.layout125);
    obj.edit468:setLeft(10);
    obj.edit468:setTop(170);
    obj.edit468:setWidth(150);
    obj.edit468:setHeight(25);
    obj.edit468:setField("nome5");
    obj.edit468:setName("edit468");

    obj.edit469 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit469:setParent(obj.layout125);
    obj.edit469:setLeft(170);
    obj.edit469:setTop(170);
    obj.edit469:setWidth(150);
    obj.edit469:setHeight(25);
    obj.edit469:setField("teste5");
    obj.edit469:setName("edit469");

    obj.edit470 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit470:setParent(obj.layout125);
    obj.edit470:setLeft(330);
    obj.edit470:setTop(170);
    obj.edit470:setWidth(30);
    obj.edit470:setHeight(25);
    obj.edit470:setField("dificuldade5");
    obj.edit470:setName("edit470");

    obj.edit471 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit471:setParent(obj.layout125);
    obj.edit471:setLeft(370);
    obj.edit471:setTop(170);
    obj.edit471:setWidth(30);
    obj.edit471:setHeight(25);
    obj.edit471:setField("dano5");
    obj.edit471:setName("edit471");

    obj.edit472 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit472:setParent(obj.layout125);
    obj.edit472:setLeft(410);
    obj.edit472:setTop(170);
    obj.edit472:setWidth(30);
    obj.edit472:setHeight(25);
    obj.edit472:setField("municao5");
    obj.edit472:setName("edit472");

    obj.edit473 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit473:setParent(obj.layout125);
    obj.edit473:setLeft(450);
    obj.edit473:setTop(170);
    obj.edit473:setWidth(350);
    obj.edit473:setHeight(25);
    obj.edit473:setField("outros5");
    obj.edit473:setName("edit473");

    obj.edit474 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit474:setParent(obj.layout125);
    obj.edit474:setLeft(10);
    obj.edit474:setTop(200);
    obj.edit474:setWidth(150);
    obj.edit474:setHeight(25);
    obj.edit474:setField("nome6");
    obj.edit474:setName("edit474");

    obj.edit475 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit475:setParent(obj.layout125);
    obj.edit475:setLeft(170);
    obj.edit475:setTop(200);
    obj.edit475:setWidth(150);
    obj.edit475:setHeight(25);
    obj.edit475:setField("teste6");
    obj.edit475:setName("edit475");

    obj.edit476 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit476:setParent(obj.layout125);
    obj.edit476:setLeft(330);
    obj.edit476:setTop(200);
    obj.edit476:setWidth(30);
    obj.edit476:setHeight(25);
    obj.edit476:setField("dificuldade6");
    obj.edit476:setName("edit476");

    obj.edit477 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit477:setParent(obj.layout125);
    obj.edit477:setLeft(370);
    obj.edit477:setTop(200);
    obj.edit477:setWidth(30);
    obj.edit477:setHeight(25);
    obj.edit477:setField("dano6");
    obj.edit477:setName("edit477");

    obj.edit478 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit478:setParent(obj.layout125);
    obj.edit478:setLeft(410);
    obj.edit478:setTop(200);
    obj.edit478:setWidth(30);
    obj.edit478:setHeight(25);
    obj.edit478:setField("municao6");
    obj.edit478:setName("edit478");

    obj.edit479 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit479:setParent(obj.layout125);
    obj.edit479:setLeft(450);
    obj.edit479:setTop(200);
    obj.edit479:setWidth(350);
    obj.edit479:setHeight(25);
    obj.edit479:setField("outros6");
    obj.edit479:setName("edit479");

    obj.layout126 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox5);
    obj.layout126:setLeft(410);
    obj.layout126:setTop(515);
    obj.layout126:setWidth(400);
    obj.layout126:setHeight(85);
    obj.layout126:setName("layout126");

    obj.rectangle125 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.layout126);
    obj.rectangle125:setLeft(0);
    obj.rectangle125:setTop(0);
    obj.rectangle125:setWidth(400);
    obj.rectangle125:setHeight(85);
    obj.rectangle125:setColor("black");
    obj.rectangle125:setXradius(15);
    obj.rectangle125:setYradius(15);
    obj.rectangle125:setCornerType("round");
    obj.rectangle125:setName("rectangle125");

    obj.label217 = gui.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout126);
    obj.label217:setLeft(0);
    obj.label217:setTop(0);
    obj.label217:setWidth(400);
    obj.label217:setHeight(20);
    obj.label217:setText("PROTEÇÃO/ARMADURA");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setName("label217");

    obj.label218 = gui.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout126);
    obj.label218:setLeft(10);
    obj.label218:setTop(30);
    obj.label218:setWidth(45);
    obj.label218:setHeight(20);
    obj.label218:setText("Tipo");
    obj.label218:setName("label218");

    obj.edit480 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit480:setParent(obj.layout126);
    obj.edit480:setLeft(55);
    obj.edit480:setTop(25);
    obj.edit480:setWidth(135);
    obj.edit480:setHeight(25);
    obj.edit480:setField("tipoArmadura");
    obj.edit480:setName("edit480");

    obj.label219 = gui.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout126);
    obj.label219:setLeft(195);
    obj.label219:setTop(30);
    obj.label219:setWidth(40);
    obj.label219:setHeight(20);
    obj.label219:setText("Índice");
    obj.label219:setName("label219");

    obj.edit481 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit481:setParent(obj.layout126);
    obj.edit481:setLeft(240);
    obj.edit481:setTop(25);
    obj.edit481:setWidth(35);
    obj.edit481:setHeight(25);
    obj.edit481:setField("indiceArmadura");
    obj.edit481:setName("edit481");

    obj.label220 = gui.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout126);
    obj.label220:setLeft(285);
    obj.label220:setTop(30);
    obj.label220:setWidth(70);
    obj.label220:setHeight(20);
    obj.label220:setText("Penalidade");
    obj.label220:setName("label220");

    obj.edit482 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit482:setParent(obj.layout126);
    obj.edit482:setLeft(355);
    obj.edit482:setTop(25);
    obj.edit482:setWidth(30);
    obj.edit482:setHeight(25);
    obj.edit482:setField("penalidadeArmadura");
    obj.edit482:setName("edit482");

    obj.label221 = gui.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout126);
    obj.label221:setLeft(10);
    obj.label221:setTop(55);
    obj.label221:setWidth(45);
    obj.label221:setHeight(20);
    obj.label221:setText("Outros");
    obj.label221:setName("label221");

    obj.edit483 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit483:setParent(obj.layout126);
    obj.edit483:setLeft(55);
    obj.edit483:setTop(50);
    obj.edit483:setWidth(135);
    obj.edit483:setHeight(25);
    obj.edit483:setField("outrosArmadura");
    obj.edit483:setName("edit483");

    obj.label222 = gui.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout126);
    obj.label222:setLeft(195);
    obj.label222:setTop(55);
    obj.label222:setWidth(40);
    obj.label222:setHeight(20);
    obj.label222:setText("Força");
    obj.label222:setName("label222");

    obj.edit484 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit484:setParent(obj.layout126);
    obj.edit484:setLeft(240);
    obj.edit484:setTop(50);
    obj.edit484:setWidth(35);
    obj.edit484:setHeight(25);
    obj.edit484:setField("forcaMinArmadura");
    obj.edit484:setName("edit484");

    obj.label223 = gui.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout126);
    obj.label223:setLeft(285);
    obj.label223:setTop(55);
    obj.label223:setWidth(70);
    obj.label223:setHeight(20);
    obj.label223:setText("Eficácia");
    obj.label223:setName("label223");

    obj.edit485 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit485:setParent(obj.layout126);
    obj.edit485:setLeft(355);
    obj.edit485:setTop(50);
    obj.edit485:setWidth(30);
    obj.edit485:setHeight(25);
    obj.edit485:setField("eficaciaArmadura");
    obj.edit485:setName("edit485");

    obj.layout127 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox5);
    obj.layout127:setLeft(820);
    obj.layout127:setTop(515);
    obj.layout127:setWidth(400);
    obj.layout127:setHeight(85);
    obj.layout127:setName("layout127");

    obj.rectangle126 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout127);
    obj.rectangle126:setLeft(0);
    obj.rectangle126:setTop(0);
    obj.rectangle126:setWidth(400);
    obj.rectangle126:setHeight(85);
    obj.rectangle126:setColor("black");
    obj.rectangle126:setXradius(15);
    obj.rectangle126:setYradius(15);
    obj.rectangle126:setCornerType("round");
    obj.rectangle126:setName("rectangle126");

    obj.label224 = gui.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout127);
    obj.label224:setLeft(0);
    obj.label224:setTop(0);
    obj.label224:setWidth(400);
    obj.label224:setHeight(20);
    obj.label224:setText("PROTEÇÃO/ESCUDO");
    obj.label224:setHorzTextAlign("center");
    obj.label224:setName("label224");

    obj.label225 = gui.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout127);
    obj.label225:setLeft(10);
    obj.label225:setTop(30);
    obj.label225:setWidth(45);
    obj.label225:setHeight(20);
    obj.label225:setText("Tipo");
    obj.label225:setName("label225");

    obj.edit486 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit486:setParent(obj.layout127);
    obj.edit486:setLeft(55);
    obj.edit486:setTop(25);
    obj.edit486:setWidth(135);
    obj.edit486:setHeight(25);
    obj.edit486:setField("tipoEscudo");
    obj.edit486:setName("edit486");

    obj.label226 = gui.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout127);
    obj.label226:setLeft(195);
    obj.label226:setTop(30);
    obj.label226:setWidth(40);
    obj.label226:setHeight(20);
    obj.label226:setText("Aparar");
    obj.label226:setName("label226");

    obj.edit487 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit487:setParent(obj.layout127);
    obj.edit487:setLeft(240);
    obj.edit487:setTop(25);
    obj.edit487:setWidth(35);
    obj.edit487:setHeight(25);
    obj.edit487:setField("apararEscudo");
    obj.edit487:setName("edit487");

    obj.label227 = gui.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout127);
    obj.label227:setLeft(285);
    obj.label227:setTop(30);
    obj.label227:setWidth(70);
    obj.label227:setHeight(20);
    obj.label227:setText("Penalidade");
    obj.label227:setName("label227");

    obj.edit488 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit488:setParent(obj.layout127);
    obj.edit488:setLeft(355);
    obj.edit488:setTop(25);
    obj.edit488:setWidth(30);
    obj.edit488:setHeight(25);
    obj.edit488:setField("penalidadeEscudo");
    obj.edit488:setName("edit488");

    obj.label228 = gui.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout127);
    obj.label228:setLeft(10);
    obj.label228:setTop(55);
    obj.label228:setWidth(45);
    obj.label228:setHeight(20);
    obj.label228:setText("Outros");
    obj.label228:setName("label228");

    obj.edit489 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit489:setParent(obj.layout127);
    obj.edit489:setLeft(55);
    obj.edit489:setTop(50);
    obj.edit489:setWidth(135);
    obj.edit489:setHeight(25);
    obj.edit489:setField("outrosEscudo");
    obj.edit489:setName("edit489");

    obj.label229 = gui.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout127);
    obj.label229:setLeft(195);
    obj.label229:setTop(55);
    obj.label229:setWidth(40);
    obj.label229:setHeight(20);
    obj.label229:setText("Força");
    obj.label229:setName("label229");

    obj.edit490 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit490:setParent(obj.layout127);
    obj.edit490:setLeft(240);
    obj.edit490:setTop(50);
    obj.edit490:setWidth(35);
    obj.edit490:setHeight(25);
    obj.edit490:setField("forcaMinEscudo");
    obj.edit490:setName("edit490");

    obj.label230 = gui.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout127);
    obj.label230:setLeft(285);
    obj.label230:setTop(55);
    obj.label230:setWidth(70);
    obj.label230:setHeight(20);
    obj.label230:setText("Cobertura");
    obj.label230:setName("label230");

    obj.edit491 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit491:setParent(obj.layout127);
    obj.edit491:setLeft(355);
    obj.edit491:setTop(50);
    obj.edit491:setWidth(30);
    obj.edit491:setHeight(25);
    obj.edit491:setField("coberturaEscudo");
    obj.edit491:setName("edit491");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrições");
    obj.tab4:setName("tab4");

    obj.frmACN4 = gui.fromHandle(_obj_newObject("form"));
    obj.frmACN4:setParent(obj.tab4);
    obj.frmACN4:setName("frmACN4");
    obj.frmACN4:setAlign("client");
    obj.frmACN4:setTheme("dark");
    obj.frmACN4:setMargins({top=1});

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmACN4);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout128 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.scrollBox6);
    obj.layout128:setLeft(0);
    obj.layout128:setTop(0);
    obj.layout128:setWidth(960);
    obj.layout128:setHeight(70);
    obj.layout128:setName("layout128");

    obj.rectangle127 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout128);
    obj.rectangle127:setLeft(5);
    obj.rectangle127:setTop(0);
    obj.rectangle127:setWidth(950);
    obj.rectangle127:setHeight(70);
    obj.rectangle127:setColor("black");
    obj.rectangle127:setXradius(15);
    obj.rectangle127:setYradius(15);
    obj.rectangle127:setCornerType("round");
    obj.rectangle127:setName("rectangle127");

    obj.layout129 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout128);
    obj.layout129:setLeft(5);
    obj.layout129:setTop(5);
    obj.layout129:setWidth(310);
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.label231 = gui.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout129);
    obj.label231:setLeft(0);
    obj.label231:setTop(5);
    obj.label231:setWidth(100);
    obj.label231:setHeight(20);
    obj.label231:setText("Sexo");
    obj.label231:setHorzTextAlign("trailing");
    obj.label231:setName("label231");

    obj.edit492 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit492:setParent(obj.layout129);
    obj.edit492:setLeft(110);
    obj.edit492:setTop(0);
    obj.edit492:setWidth(200);
    obj.edit492:setHeight(25);
    obj.edit492:setField("desc_sexo");
    obj.edit492:setName("edit492");

    obj.layout130 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout128);
    obj.layout130:setLeft(320);
    obj.layout130:setTop(5);
    obj.layout130:setWidth(310);
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.label232 = gui.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout130);
    obj.label232:setLeft(0);
    obj.label232:setTop(5);
    obj.label232:setWidth(100);
    obj.label232:setHeight(20);
    obj.label232:setText("Altura");
    obj.label232:setHorzTextAlign("trailing");
    obj.label232:setName("label232");

    obj.edit493 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit493:setParent(obj.layout130);
    obj.edit493:setLeft(110);
    obj.edit493:setTop(0);
    obj.edit493:setWidth(200);
    obj.edit493:setHeight(25);
    obj.edit493:setField("desc_altura");
    obj.edit493:setName("edit493");

    obj.layout131 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout128);
    obj.layout131:setLeft(585);
    obj.layout131:setTop(5);
    obj.layout131:setWidth(310);
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.label233 = gui.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout131);
    obj.label233:setLeft(0);
    obj.label233:setTop(5);
    obj.label233:setWidth(100);
    obj.label233:setHeight(20);
    obj.label233:setText("Olhos");
    obj.label233:setHorzTextAlign("trailing");
    obj.label233:setName("label233");

    obj.edit494 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit494:setParent(obj.layout131);
    obj.edit494:setLeft(110);
    obj.edit494:setTop(0);
    obj.edit494:setWidth(200);
    obj.edit494:setHeight(25);
    obj.edit494:setField("desc_olhos");
    obj.edit494:setName("edit494");

    obj.layout132 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout128);
    obj.layout132:setLeft(5);
    obj.layout132:setTop(35);
    obj.layout132:setWidth(310);
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.label234 = gui.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout132);
    obj.label234:setLeft(0);
    obj.label234:setTop(5);
    obj.label234:setWidth(100);
    obj.label234:setHeight(20);
    obj.label234:setText("Raça");
    obj.label234:setHorzTextAlign("trailing");
    obj.label234:setName("label234");

    obj.edit495 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit495:setParent(obj.layout132);
    obj.edit495:setLeft(110);
    obj.edit495:setTop(0);
    obj.edit495:setWidth(200);
    obj.edit495:setHeight(25);
    obj.edit495:setField("desc_raca");
    obj.edit495:setName("edit495");

    obj.layout133 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout128);
    obj.layout133:setLeft(320);
    obj.layout133:setTop(35);
    obj.layout133:setWidth(310);
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.label235 = gui.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout133);
    obj.label235:setLeft(0);
    obj.label235:setTop(5);
    obj.label235:setWidth(100);
    obj.label235:setHeight(20);
    obj.label235:setText("Nascimento");
    obj.label235:setHorzTextAlign("trailing");
    obj.label235:setName("label235");

    obj.edit496 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit496:setParent(obj.layout133);
    obj.edit496:setLeft(110);
    obj.edit496:setTop(0);
    obj.edit496:setWidth(200);
    obj.edit496:setHeight(25);
    obj.edit496:setField("desc_nascimento");
    obj.edit496:setName("edit496");

    obj.layout134 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout128);
    obj.layout134:setLeft(585);
    obj.layout134:setTop(35);
    obj.layout134:setWidth(310);
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.label236 = gui.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout134);
    obj.label236:setLeft(0);
    obj.label236:setTop(5);
    obj.label236:setWidth(100);
    obj.label236:setHeight(20);
    obj.label236:setText("Cabelo");
    obj.label236:setHorzTextAlign("trailing");
    obj.label236:setName("label236");

    obj.edit497 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit497:setParent(obj.layout134);
    obj.edit497:setLeft(110);
    obj.edit497:setTop(0);
    obj.edit497:setWidth(200);
    obj.edit497:setHeight(25);
    obj.edit497:setField("desc_cabelo");
    obj.edit497:setName("edit497");

    obj.layout135 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.scrollBox6);
    obj.layout135:setLeft(0);
    obj.layout135:setTop(80);
    obj.layout135:setWidth(400);
    obj.layout135:setHeight(175);
    obj.layout135:setName("layout135");

    obj.rectangle128 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout135);
    obj.rectangle128:setLeft(0);
    obj.rectangle128:setTop(0);
    obj.rectangle128:setWidth(400);
    obj.rectangle128:setHeight(175);
    obj.rectangle128:setColor("black");
    obj.rectangle128:setXradius(15);
    obj.rectangle128:setYradius(15);
    obj.rectangle128:setCornerType("round");
    obj.rectangle128:setName("rectangle128");

    obj.label237 = gui.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout135);
    obj.label237:setLeft(0);
    obj.label237:setTop(0);
    obj.label237:setWidth(400);
    obj.label237:setHeight(20);
    obj.label237:setText("Aparencia");
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout135);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(135);
    obj.textEditor4:setField("aparencia");
    obj.textEditor4:setName("textEditor4");

    obj.layout136 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.scrollBox6);
    obj.layout136:setLeft(0);
    obj.layout136:setTop(260);
    obj.layout136:setWidth(400);
    obj.layout136:setHeight(175);
    obj.layout136:setName("layout136");

    obj.rectangle129 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout136);
    obj.rectangle129:setLeft(0);
    obj.rectangle129:setTop(0);
    obj.rectangle129:setWidth(400);
    obj.rectangle129:setHeight(175);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setXradius(15);
    obj.rectangle129:setYradius(15);
    obj.rectangle129:setCornerType("round");
    obj.rectangle129:setName("rectangle129");

    obj.label238 = gui.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout136);
    obj.label238:setLeft(0);
    obj.label238:setTop(0);
    obj.label238:setWidth(400);
    obj.label238:setHeight(20);
    obj.label238:setText("Personalidade");
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout136);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(135);
    obj.textEditor5:setField("personalidade");
    obj.textEditor5:setName("textEditor5");

    obj.layout137 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.scrollBox6);
    obj.layout137:setLeft(0);
    obj.layout137:setTop(440);
    obj.layout137:setWidth(400);
    obj.layout137:setHeight(175);
    obj.layout137:setName("layout137");

    obj.rectangle130 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout137);
    obj.rectangle130:setLeft(0);
    obj.rectangle130:setTop(0);
    obj.rectangle130:setWidth(400);
    obj.rectangle130:setHeight(175);
    obj.rectangle130:setColor("black");
    obj.rectangle130:setXradius(15);
    obj.rectangle130:setYradius(15);
    obj.rectangle130:setCornerType("round");
    obj.rectangle130:setName("rectangle130");

    obj.label239 = gui.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout137);
    obj.label239:setLeft(0);
    obj.label239:setTop(0);
    obj.label239:setWidth(400);
    obj.label239:setHeight(20);
    obj.label239:setText("Idiomas");
    obj.label239:setHorzTextAlign("center");
    obj.label239:setName("label239");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout137);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(135);
    obj.textEditor6:setField("idiomas");
    obj.textEditor6:setName("textEditor6");

    obj.layout138 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.scrollBox6);
    obj.layout138:setLeft(410);
    obj.layout138:setTop(80);
    obj.layout138:setWidth(600);
    obj.layout138:setHeight(535);
    obj.layout138:setName("layout138");

    obj.rectangle131 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.layout138);
    obj.rectangle131:setLeft(0);
    obj.rectangle131:setTop(0);
    obj.rectangle131:setWidth(600);
    obj.rectangle131:setHeight(535);
    obj.rectangle131:setColor("black");
    obj.rectangle131:setXradius(15);
    obj.rectangle131:setYradius(15);
    obj.rectangle131:setCornerType("round");
    obj.rectangle131:setName("rectangle131");

    obj.label240 = gui.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout138);
    obj.label240:setLeft(0);
    obj.label240:setTop(0);
    obj.label240:setWidth(600);
    obj.label240:setHeight(20);
    obj.label240:setText("Historia");
    obj.label240:setHorzTextAlign("center");
    obj.label240:setName("label240");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout138);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(580);
    obj.textEditor7:setHeight(495);
    obj.textEditor7:setField("historia");
    obj.textEditor7:setName("textEditor7");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmACN5 = gui.fromHandle(_obj_newObject("form"));
    obj.frmACN5:setParent(obj.tab5);
    obj.frmACN5:setName("frmACN5");
    obj.frmACN5:setAlign("client");
    obj.frmACN5:setTheme("dark");
    obj.frmACN5:setMargins({top=1});

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmACN5);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout139 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.scrollBox7);
    obj.layout139:setLeft(0);
    obj.layout139:setTop(0);
    obj.layout139:setWidth(400);
    obj.layout139:setHeight(580);
    obj.layout139:setName("layout139");

    obj.rectangle132 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout139);
    obj.rectangle132:setLeft(0);
    obj.rectangle132:setTop(0);
    obj.rectangle132:setWidth(400);
    obj.rectangle132:setHeight(580);
    obj.rectangle132:setColor("black");
    obj.rectangle132:setXradius(15);
    obj.rectangle132:setYradius(15);
    obj.rectangle132:setCornerType("round");
    obj.rectangle132:setName("rectangle132");

    obj.label241 = gui.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout139);
    obj.label241:setLeft(0);
    obj.label241:setTop(0);
    obj.label241:setWidth(400);
    obj.label241:setHeight(20);
    obj.label241:setText("Anotações");
    obj.label241:setHorzTextAlign("center");
    obj.label241:setName("label241");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout139);
    obj.textEditor8:setLeft(10);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(380);
    obj.textEditor8:setHeight(540);
    obj.textEditor8:setField("anotacoes1");
    obj.textEditor8:setName("textEditor8");

    obj.layout140 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.scrollBox7);
    obj.layout140:setLeft(410);
    obj.layout140:setTop(0);
    obj.layout140:setWidth(400);
    obj.layout140:setHeight(580);
    obj.layout140:setName("layout140");

    obj.rectangle133 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout140);
    obj.rectangle133:setLeft(0);
    obj.rectangle133:setTop(0);
    obj.rectangle133:setWidth(400);
    obj.rectangle133:setHeight(580);
    obj.rectangle133:setColor("black");
    obj.rectangle133:setXradius(15);
    obj.rectangle133:setYradius(15);
    obj.rectangle133:setCornerType("round");
    obj.rectangle133:setName("rectangle133");

    obj.label242 = gui.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout140);
    obj.label242:setLeft(0);
    obj.label242:setTop(0);
    obj.label242:setWidth(400);
    obj.label242:setHeight(20);
    obj.label242:setText("Anotações");
    obj.label242:setHorzTextAlign("center");
    obj.label242:setName("label242");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout140);
    obj.textEditor9:setLeft(10);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(380);
    obj.textEditor9:setHeight(540);
    obj.textEditor9:setField("anotacoes2");
    obj.textEditor9:setName("textEditor9");

    obj.layout141 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.scrollBox7);
    obj.layout141:setLeft(820);
    obj.layout141:setTop(0);
    obj.layout141:setWidth(400);
    obj.layout141:setHeight(580);
    obj.layout141:setName("layout141");

    obj.rectangle134 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout141);
    obj.rectangle134:setLeft(0);
    obj.rectangle134:setTop(0);
    obj.rectangle134:setWidth(400);
    obj.rectangle134:setHeight(580);
    obj.rectangle134:setColor("black");
    obj.rectangle134:setXradius(15);
    obj.rectangle134:setYradius(15);
    obj.rectangle134:setCornerType("round");
    obj.rectangle134:setName("rectangle134");

    obj.label243 = gui.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout141);
    obj.label243:setLeft(0);
    obj.label243:setTop(0);
    obj.label243:setWidth(400);
    obj.label243:setHeight(20);
    obj.label243:setText("Anotações");
    obj.label243:setHorzTextAlign("center");
    obj.label243:setName("label243");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout141);
    obj.textEditor10:setLeft(10);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(380);
    obj.textEditor10:setHeight(540);
    obj.textEditor10:setField("anotacoes3");
    obj.textEditor10:setName("textEditor10");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmACN6 = gui.fromHandle(_obj_newObject("form"));
    obj.frmACN6:setParent(obj.tab6);
    obj.frmACN6:setName("frmACN6");
    obj.frmACN6:setAlign("client");
    obj.frmACN6:setTheme("dark");
    obj.frmACN6:setMargins({top=1});

    obj.scrollBox8 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmACN6);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox8);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Ficha ACN/images/RPGmeister.jpg");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha ACN/images/SALEM.png");
    obj.image3:setName("image3");

    obj.layout142 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.scrollBox8);
    obj.layout142:setLeft(550);
    obj.layout142:setTop(300);
    obj.layout142:setWidth(200);
    obj.layout142:setHeight(150);
    obj.layout142:setName("layout142");

    obj.rectangle135 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout142);
    obj.rectangle135:setLeft(0);
    obj.rectangle135:setTop(0);
    obj.rectangle135:setWidth(200);
    obj.rectangle135:setHeight(150);
    obj.rectangle135:setColor("black");
    obj.rectangle135:setXradius(15);
    obj.rectangle135:setYradius(15);
    obj.rectangle135:setCornerType("round");
    obj.rectangle135:setName("rectangle135");

    obj.label244 = gui.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout142);
    obj.label244:setLeft(0);
    obj.label244:setTop(10);
    obj.label244:setWidth(200);
    obj.label244:setHeight(20);
    obj.label244:setText("Programador: Vinny (Ambesek)");
    obj.label244:setHorzTextAlign("center");
    obj.label244:setName("label244");

    obj.label245 = gui.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout142);
    obj.label245:setLeft(0);
    obj.label245:setTop(35);
    obj.label245:setWidth(200);
    obj.label245:setHeight(20);
    obj.label245:setText("Arte: Nefer (Nefertyne)");
    obj.label245:setHorzTextAlign("center");
    obj.label245:setName("label245");

    obj.label246 = gui.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout142);
    obj.label246:setLeft(0);
    obj.label246:setTop(60);
    obj.label246:setWidth(200);
    obj.label246:setHeight(20);
    obj.label246:setText("Consultor: Π (Pi)");
    obj.label246:setHorzTextAlign("center");
    obj.label246:setName("label246");

    obj.label247 = gui.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout142);
    obj.label247:setLeft(0);
    obj.label247:setTop(95);
    obj.label247:setWidth(200);
    obj.label247:setHeight(20);
    obj.label247:setText("Ficha feita para a mesa SALEM");
    obj.label247:setHorzTextAlign("center");
    obj.label247:setName("label247");

    obj.label248 = gui.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout142);
    obj.label248:setLeft(0);
    obj.label248:setTop(120);
    obj.label248:setWidth(200);
    obj.label248:setHeight(20);
    obj.label248:setText("Sistema: Ao Cair da Noite");
    obj.label248:setHorzTextAlign("center");
    obj.label248:setName("label248");

    obj.label249 = gui.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.scrollBox8);
    obj.label249:setLeft(755);
    obj.label249:setTop(300);
    obj.label249:setWidth(100);
    obj.label249:setHeight(20);
    obj.label249:setText("Versão Atual: ");
    obj.label249:setHorzTextAlign("center");
    obj.label249:setName("label249");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox8);
    obj.image4:setLeft(867);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao04.png");
    obj.image4:setName("image4");

    obj.label250 = gui.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.scrollBox8);
    obj.label250:setLeft(755);
    obj.label250:setTop(325);
    obj.label250:setWidth(100);
    obj.label250:setHeight(20);
    obj.label250:setText("Ultima Versão: ");
    obj.label250:setHorzTextAlign("center");
    obj.label250:setName("label250");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox8);
    obj.image5:setLeft(867);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20ACN%20releases/release.png");
    obj.image5:setName("image5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox8);
    obj.button5:setLeft(755);
    obj.button5:setTop(350);
    obj.button5:setWidth(100);
    obj.button5:setText("Change Log");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox8);
    obj.button6:setLeft(867);
    obj.button6:setTop(350);
    obj.button6:setWidth(100);
    obj.button6:setText("Atualizar");
    obj.button6:setName("button6");

    obj.label251 = gui.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.scrollBox8);
    obj.label251:setLeft(755);
    obj.label251:setTop(400);
    obj.label251:setWidth(200);
    obj.label251:setHeight(20);
    obj.label251:setText("Conheça as Mesas:");
    obj.label251:setName("label251");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox8);
    obj.button7:setLeft(755);
    obj.button7:setTop(425);
    obj.button7:setWidth(100);
    obj.button7:setText("RPGmeister");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox8);
    obj.button8:setLeft(867);
    obj.button8:setTop(425);
    obj.button8:setWidth(100);
    obj.button8:setText("SALEM");
    obj.button8:setName("button8");

    obj._e_event0 = obj.radioButton1:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event1 = obj.radioButton2:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseforca) or 0)+
            									(tonumber(sheet.inicialforca) or 0)+
            									(tonumber(sheet.bonusforca) or 0)+
            									(tonumber(sheet.xpforca) or 0);
            						if 2 > 1 then
            							local pen = 0;
            							if "forca"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalforca = mod .. " | " ..(mod / 2);
            							sheet.testeforca = mod / 2;
            						else
            							sheet.totalforca = mod;
            							sheet.testeforca = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event3 = obj.radioButton3:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event4 = obj.radioButton4:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseagilidade) or 0)+
            									(tonumber(sheet.inicialagilidade) or 0)+
            									(tonumber(sheet.bonusagilidade) or 0)+
            									(tonumber(sheet.xpagilidade) or 0);
            						if 2 > 1 then
            							local pen = 0;
            							if "agilidade"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalagilidade = mod .. " | " ..(mod / 2);
            							sheet.testeagilidade = mod / 2;
            						else
            							sheet.totalagilidade = mod;
            							sheet.testeagilidade = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event6 = obj.radioButton5:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event7 = obj.radioButton6:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseresiliencia) or 0)+
            									(tonumber(sheet.inicialresiliencia) or 0)+
            									(tonumber(sheet.bonusresiliencia) or 0)+
            									(tonumber(sheet.xpresiliencia) or 0);
            						if 2 > 1 then
            							local pen = 0;
            							if "resiliencia"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalresiliencia = mod .. " | " ..(mod / 2);
            							sheet.testeresiliencia = mod / 2;
            						else
            							sheet.totalresiliencia = mod;
            							sheet.testeresiliencia = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event9 = obj.radioButton7:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event10 = obj.radioButton8:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event11 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.basecarisma) or 0)+
            									(tonumber(sheet.inicialcarisma) or 0)+
            									(tonumber(sheet.bonuscarisma) or 0)+
            									(tonumber(sheet.xpcarisma) or 0);
            						if 2 > 1 then
            							local pen = 0;
            							if "carisma"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalcarisma = mod .. " | " ..(mod / 2);
            							sheet.testecarisma = mod / 2;
            						else
            							sheet.totalcarisma = mod;
            							sheet.testecarisma = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event12 = obj.radioButton9:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event13 = obj.radioButton10:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event14 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.basepercepcao) or 0)+
            									(tonumber(sheet.inicialpercepcao) or 0)+
            									(tonumber(sheet.bonuspercepcao) or 0)+
            									(tonumber(sheet.xppercepcao) or 0);
            						if 2 > 1 then
            							local pen = 0;
            							if "percepcao"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalpercepcao = mod .. " | " ..(mod / 2);
            							sheet.testepercepcao = mod / 2;
            						else
            							sheet.totalpercepcao = mod;
            							sheet.testepercepcao = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event15 = obj.radioButton11:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event16 = obj.radioButton12:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event17 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseperspicacia) or 0)+
            									(tonumber(sheet.inicialperspicacia) or 0)+
            									(tonumber(sheet.bonusperspicacia) or 0)+
            									(tonumber(sheet.xpperspicacia) or 0);
            						if 2 > 1 then
            							local pen = 0;
            							if "perspicacia"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalperspicacia = mod .. " | " ..(mod / 2);
            							sheet.testeperspicacia = mod / 2;
            						else
            							sheet.totalperspicacia = mod;
            							sheet.testeperspicacia = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event18 = obj.radioButton13:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event19 = obj.radioButton14:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event20 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseconsciencia) or 0)+
            									(tonumber(sheet.inicialconsciencia) or 0)+
            									(tonumber(sheet.bonusconsciencia) or 0)+
            									(tonumber(sheet.xpconsciencia) or 0);
            						if 1 > 1 then
            							local pen = 0;
            							if "consciencia"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalconsciencia = mod .. " | " ..(mod / 1);
            							sheet.testeconsciencia = mod / 1;
            						else
            							sheet.totalconsciencia = mod;
            							sheet.testeconsciencia = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event21 = obj.radioButton15:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event22 = obj.radioButton16:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event23 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseespirito) or 0)+
            									(tonumber(sheet.inicialespirito) or 0)+
            									(tonumber(sheet.bonusespirito) or 0)+
            									(tonumber(sheet.xpespirito) or 0);
            						if 1 > 1 then
            							local pen = 0;
            							if "espirito"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalespirito = mod .. " | " ..(mod / 1);
            							sheet.testeespirito = mod / 1;
            						else
            							sheet.totalespirito = mod;
            							sheet.testeespirito = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event24 = obj.radioButton17:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event25 = obj.radioButton18:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event26 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod = (tonumber(sheet.baseperseveranca) or 0)+
            									(tonumber(sheet.inicialperseveranca) or 0)+
            									(tonumber(sheet.bonusperseveranca) or 0)+
            									(tonumber(sheet.xpperseveranca) or 0);
            						if 1 > 1 then
            							local pen = 0;
            							if "perseveranca"=="agilidade" then
            								pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            									(tonumber(sheet.penalidadeEscudo) or 0);
            								mod = mod - pen;
            							end;
            							sheet.totalperseveranca = mod .. " | " ..(mod / 1);
            							sheet.testeperseveranca = mod / 1;
            						else
            							sheet.totalperseveranca = mod;
            							sheet.testeperseveranca = mod;
            						end;
            						xpAtributo();
            						xpAegis();
            					end;
        end, obj);

    obj._e_event27 = obj.edit43:addEventListener("onUserChange",
        function (self)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event28 = obj.edit44:addEventListener("onUserChange",
        function (self)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event29 = obj.button1:addEventListener("onClick",
        function (self)
            default();
        end, obj);

    obj._e_event30 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.XPgastaTotal = (tonumber(sheet.XPgasta) or 0) + (tonumber(sheet.XPgasta2) or 0);
            					end;
        end, obj);

    obj._e_event31 = obj.radioButton19:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event32 = obj.radioButton20:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event33 = obj.edit48:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            											(tonumber(sheet.historicoBonus1_1) or 0)+
            											(tonumber(sheet.historicoXp1_1) or 0);
            					sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event34 = obj.edit49:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            											(tonumber(sheet.historicoBonus1_1) or 0)+
            											(tonumber(sheet.historicoXp1_1) or 0);
            					sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event35 = obj.edit50:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            											(tonumber(sheet.historicoBonus1_1) or 0)+
            											(tonumber(sheet.historicoXp1_1) or 0);
            					sheet.historicoTotal1_1 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event36 = obj.radioButton21:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event37 = obj.radioButton22:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event38 = obj.edit52:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            											(tonumber(sheet.historicoBonus1_2) or 0)+
            											(tonumber(sheet.historicoXp1_2) or 0);
            					sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event39 = obj.edit53:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            											(tonumber(sheet.historicoBonus1_2) or 0)+
            											(tonumber(sheet.historicoXp1_2) or 0);
            					sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event40 = obj.edit54:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            											(tonumber(sheet.historicoBonus1_2) or 0)+
            											(tonumber(sheet.historicoXp1_2) or 0);
            					sheet.historicoTotal1_2 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event41 = obj.radioButton23:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event42 = obj.radioButton24:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event43 = obj.edit56:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            											(tonumber(sheet.historicoBonus1_3) or 0)+
            											(tonumber(sheet.historicoXp1_3) or 0);
            					sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event44 = obj.edit57:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            											(tonumber(sheet.historicoBonus1_3) or 0)+
            											(tonumber(sheet.historicoXp1_3) or 0);
            					sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event45 = obj.edit58:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            											(tonumber(sheet.historicoBonus1_3) or 0)+
            											(tonumber(sheet.historicoXp1_3) or 0);
            					sheet.historicoTotal1_3 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event46 = obj.radioButton25:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event47 = obj.radioButton26:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event48 = obj.edit60:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            											(tonumber(sheet.historicoBonus1_4) or 0)+
            											(tonumber(sheet.historicoXp1_4) or 0);
            					sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event49 = obj.edit61:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            											(tonumber(sheet.historicoBonus1_4) or 0)+
            											(tonumber(sheet.historicoXp1_4) or 0);
            					sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event50 = obj.edit62:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            											(tonumber(sheet.historicoBonus1_4) or 0)+
            											(tonumber(sheet.historicoXp1_4) or 0);
            					sheet.historicoTotal1_4 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event51 = obj.radioButton27:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event52 = obj.radioButton28:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event53 = obj.edit64:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            											(tonumber(sheet.historicoBonus1_5) or 0)+
            											(tonumber(sheet.historicoXp1_5) or 0);
            					sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event54 = obj.edit65:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            											(tonumber(sheet.historicoBonus1_5) or 0)+
            											(tonumber(sheet.historicoXp1_5) or 0);
            					sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event55 = obj.edit66:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            											(tonumber(sheet.historicoBonus1_5) or 0)+
            											(tonumber(sheet.historicoXp1_5) or 0);
            					sheet.historicoTotal1_5 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event56 = obj.radioButton29:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event57 = obj.radioButton30:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event58 = obj.edit68:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            											(tonumber(sheet.historicoBonus1_6) or 0)+
            											(tonumber(sheet.historicoXp1_6) or 0);
            					sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event59 = obj.edit69:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            											(tonumber(sheet.historicoBonus1_6) or 0)+
            											(tonumber(sheet.historicoXp1_6) or 0);
            					sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event60 = obj.edit70:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            											(tonumber(sheet.historicoBonus1_6) or 0)+
            											(tonumber(sheet.historicoXp1_6) or 0);
            					sheet.historicoTotal1_6 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event61 = obj.radioButton31:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event62 = obj.radioButton32:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event63 = obj.edit72:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            											(tonumber(sheet.historicoBonus2_1) or 0)+
            											(tonumber(sheet.historicoXp2_1) or 0);
            					sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event64 = obj.edit73:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            											(tonumber(sheet.historicoBonus2_1) or 0)+
            											(tonumber(sheet.historicoXp2_1) or 0);
            					sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event65 = obj.edit74:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            											(tonumber(sheet.historicoBonus2_1) or 0)+
            											(tonumber(sheet.historicoXp2_1) or 0);
            					sheet.historicoTotal2_1 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event66 = obj.radioButton33:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event67 = obj.radioButton34:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event68 = obj.edit76:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            											(tonumber(sheet.historicoBonus2_2) or 0)+
            											(tonumber(sheet.historicoXp2_2) or 0);
            					sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event69 = obj.edit77:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            											(tonumber(sheet.historicoBonus2_2) or 0)+
            											(tonumber(sheet.historicoXp2_2) or 0);
            					sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event70 = obj.edit78:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            											(tonumber(sheet.historicoBonus2_2) or 0)+
            											(tonumber(sheet.historicoXp2_2) or 0);
            					sheet.historicoTotal2_2 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event71 = obj.radioButton35:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event72 = obj.radioButton36:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event73 = obj.edit80:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            											(tonumber(sheet.historicoBonus2_3) or 0)+
            											(tonumber(sheet.historicoXp2_3) or 0);
            					sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event74 = obj.edit81:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            											(tonumber(sheet.historicoBonus2_3) or 0)+
            											(tonumber(sheet.historicoXp2_3) or 0);
            					sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event75 = obj.edit82:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            											(tonumber(sheet.historicoBonus2_3) or 0)+
            											(tonumber(sheet.historicoXp2_3) or 0);
            					sheet.historicoTotal2_3 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event76 = obj.radioButton37:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event77 = obj.radioButton38:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event78 = obj.edit84:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            											(tonumber(sheet.historicoBonus2_4) or 0)+
            											(tonumber(sheet.historicoXp2_4) or 0);
            					sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event79 = obj.edit85:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            											(tonumber(sheet.historicoBonus2_4) or 0)+
            											(tonumber(sheet.historicoXp2_4) or 0);
            					sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event80 = obj.edit86:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            											(tonumber(sheet.historicoBonus2_4) or 0)+
            											(tonumber(sheet.historicoXp2_4) or 0);
            					sheet.historicoTotal2_4 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event81 = obj.radioButton39:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event82 = obj.radioButton40:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event83 = obj.edit88:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            											(tonumber(sheet.historicoBonus2_5) or 0)+
            											(tonumber(sheet.historicoXp2_5) or 0);
            					sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event84 = obj.edit89:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            											(tonumber(sheet.historicoBonus2_5) or 0)+
            											(tonumber(sheet.historicoXp2_5) or 0);
            					sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event85 = obj.edit90:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            											(tonumber(sheet.historicoBonus2_5) or 0)+
            											(tonumber(sheet.historicoXp2_5) or 0);
            					sheet.historicoTotal2_5 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event86 = obj.radioButton41:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event87 = obj.radioButton42:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event88 = obj.edit92:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            											(tonumber(sheet.historicoBonus2_6) or 0)+
            											(tonumber(sheet.historicoXp2_6) or 0);
            					sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event89 = obj.edit93:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            											(tonumber(sheet.historicoBonus2_6) or 0)+
            											(tonumber(sheet.historicoXp2_6) or 0);
            					sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event90 = obj.edit94:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            											(tonumber(sheet.historicoBonus2_6) or 0)+
            											(tonumber(sheet.historicoXp2_6) or 0);
            					sheet.historicoTotal2_6 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event91 = obj.radioButton43:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event92 = obj.radioButton44:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event93 = obj.edit96:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            											(tonumber(sheet.historicoBonus3_1) or 0)+
            											(tonumber(sheet.historicoXp3_1) or 0);
            					sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event94 = obj.edit97:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            											(tonumber(sheet.historicoBonus3_1) or 0)+
            											(tonumber(sheet.historicoXp3_1) or 0);
            					sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event95 = obj.edit98:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            											(tonumber(sheet.historicoBonus3_1) or 0)+
            											(tonumber(sheet.historicoXp3_1) or 0);
            					sheet.historicoTotal3_1 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event96 = obj.radioButton45:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event97 = obj.radioButton46:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event98 = obj.edit100:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            											(tonumber(sheet.historicoBonus3_2) or 0)+
            											(tonumber(sheet.historicoXp3_2) or 0);
            					sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event99 = obj.edit101:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            											(tonumber(sheet.historicoBonus3_2) or 0)+
            											(tonumber(sheet.historicoXp3_2) or 0);
            					sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event100 = obj.edit102:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            											(tonumber(sheet.historicoBonus3_2) or 0)+
            											(tonumber(sheet.historicoXp3_2) or 0);
            					sheet.historicoTotal3_2 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event101 = obj.radioButton47:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event102 = obj.radioButton48:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event103 = obj.edit104:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            											(tonumber(sheet.historicoBonus3_3) or 0)+
            											(tonumber(sheet.historicoXp3_3) or 0);
            					sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event104 = obj.edit105:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            											(tonumber(sheet.historicoBonus3_3) or 0)+
            											(tonumber(sheet.historicoXp3_3) or 0);
            					sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event105 = obj.edit106:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            											(tonumber(sheet.historicoBonus3_3) or 0)+
            											(tonumber(sheet.historicoXp3_3) or 0);
            					sheet.historicoTotal3_3 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event106 = obj.radioButton49:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event107 = obj.radioButton50:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event108 = obj.edit108:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            											(tonumber(sheet.historicoBonus3_4) or 0)+
            											(tonumber(sheet.historicoXp3_4) or 0);
            					sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event109 = obj.edit109:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            											(tonumber(sheet.historicoBonus3_4) or 0)+
            											(tonumber(sheet.historicoXp3_4) or 0);
            					sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event110 = obj.edit110:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            											(tonumber(sheet.historicoBonus3_4) or 0)+
            											(tonumber(sheet.historicoXp3_4) or 0);
            					sheet.historicoTotal3_4 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event111 = obj.radioButton51:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event112 = obj.radioButton52:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event113 = obj.edit112:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            											(tonumber(sheet.historicoBonus3_5) or 0)+
            											(tonumber(sheet.historicoXp3_5) or 0);
            					sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event114 = obj.edit113:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            											(tonumber(sheet.historicoBonus3_5) or 0)+
            											(tonumber(sheet.historicoXp3_5) or 0);
            					sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event115 = obj.edit114:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            											(tonumber(sheet.historicoBonus3_5) or 0)+
            											(tonumber(sheet.historicoXp3_5) or 0);
            					sheet.historicoTotal3_5 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event116 = obj.radioButton53:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event117 = obj.radioButton54:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event118 = obj.edit116:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            											(tonumber(sheet.historicoBonus3_6) or 0)+
            											(tonumber(sheet.historicoXp3_6) or 0);
            					sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event119 = obj.edit117:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            											(tonumber(sheet.historicoBonus3_6) or 0)+
            											(tonumber(sheet.historicoXp3_6) or 0);
            					sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event120 = obj.edit118:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            											(tonumber(sheet.historicoBonus3_6) or 0)+
            											(tonumber(sheet.historicoXp3_6) or 0);
            					sheet.historicoTotal3_6 = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event121 = obj.radioButton55:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event122 = obj.radioButton56:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event123 = obj.edit120:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_1_m) or 0)+
            											(tonumber(sheet.historicoBonus1_1_m) or 0)+
            											(tonumber(sheet.historicoXp1_1_m) or 0);
            					sheet.historicoTotal1_1_m = mod;
        end, obj);

    obj._e_event124 = obj.edit121:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_1_m) or 0)+
            											(tonumber(sheet.historicoBonus1_1_m) or 0)+
            											(tonumber(sheet.historicoXp1_1_m) or 0);
            					sheet.historicoTotal1_1_m = mod;
        end, obj);

    obj._e_event125 = obj.edit122:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_1_m) or 0)+
            											(tonumber(sheet.historicoBonus1_1_m) or 0)+
            											(tonumber(sheet.historicoXp1_1_m) or 0);
            					sheet.historicoTotal1_1_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event126 = obj.radioButton57:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event127 = obj.radioButton58:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event128 = obj.edit124:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_2_m) or 0)+
            											(tonumber(sheet.historicoBonus1_2_m) or 0)+
            											(tonumber(sheet.historicoXp1_2_m) or 0);
            					sheet.historicoTotal1_2_m = mod;
        end, obj);

    obj._e_event129 = obj.edit125:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_2_m) or 0)+
            											(tonumber(sheet.historicoBonus1_2_m) or 0)+
            											(tonumber(sheet.historicoXp1_2_m) or 0);
            					sheet.historicoTotal1_2_m = mod;
        end, obj);

    obj._e_event130 = obj.edit126:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_2_m) or 0)+
            											(tonumber(sheet.historicoBonus1_2_m) or 0)+
            											(tonumber(sheet.historicoXp1_2_m) or 0);
            					sheet.historicoTotal1_2_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event131 = obj.radioButton59:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event132 = obj.radioButton60:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event133 = obj.edit128:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_3_m) or 0)+
            											(tonumber(sheet.historicoBonus1_3_m) or 0)+
            											(tonumber(sheet.historicoXp1_3_m) or 0);
            					sheet.historicoTotal1_3_m = mod;
        end, obj);

    obj._e_event134 = obj.edit129:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_3_m) or 0)+
            											(tonumber(sheet.historicoBonus1_3_m) or 0)+
            											(tonumber(sheet.historicoXp1_3_m) or 0);
            					sheet.historicoTotal1_3_m = mod;
        end, obj);

    obj._e_event135 = obj.edit130:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_3_m) or 0)+
            											(tonumber(sheet.historicoBonus1_3_m) or 0)+
            											(tonumber(sheet.historicoXp1_3_m) or 0);
            					sheet.historicoTotal1_3_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event136 = obj.radioButton61:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event137 = obj.radioButton62:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event138 = obj.edit132:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_4_m) or 0)+
            											(tonumber(sheet.historicoBonus1_4_m) or 0)+
            											(tonumber(sheet.historicoXp1_4_m) or 0);
            					sheet.historicoTotal1_4_m = mod;
        end, obj);

    obj._e_event139 = obj.edit133:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_4_m) or 0)+
            											(tonumber(sheet.historicoBonus1_4_m) or 0)+
            											(tonumber(sheet.historicoXp1_4_m) or 0);
            					sheet.historicoTotal1_4_m = mod;
        end, obj);

    obj._e_event140 = obj.edit134:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_4_m) or 0)+
            											(tonumber(sheet.historicoBonus1_4_m) or 0)+
            											(tonumber(sheet.historicoXp1_4_m) or 0);
            					sheet.historicoTotal1_4_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event141 = obj.radioButton63:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event142 = obj.radioButton64:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event143 = obj.edit136:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_5_m) or 0)+
            											(tonumber(sheet.historicoBonus1_5_m) or 0)+
            											(tonumber(sheet.historicoXp1_5_m) or 0);
            					sheet.historicoTotal1_5_m = mod;
        end, obj);

    obj._e_event144 = obj.edit137:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_5_m) or 0)+
            											(tonumber(sheet.historicoBonus1_5_m) or 0)+
            											(tonumber(sheet.historicoXp1_5_m) or 0);
            					sheet.historicoTotal1_5_m = mod;
        end, obj);

    obj._e_event145 = obj.edit138:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_5_m) or 0)+
            											(tonumber(sheet.historicoBonus1_5_m) or 0)+
            											(tonumber(sheet.historicoXp1_5_m) or 0);
            					sheet.historicoTotal1_5_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event146 = obj.radioButton65:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event147 = obj.radioButton66:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event148 = obj.edit140:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_6_m) or 0)+
            											(tonumber(sheet.historicoBonus1_6_m) or 0)+
            											(tonumber(sheet.historicoXp1_6_m) or 0);
            					sheet.historicoTotal1_6_m = mod;
        end, obj);

    obj._e_event149 = obj.edit141:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_6_m) or 0)+
            											(tonumber(sheet.historicoBonus1_6_m) or 0)+
            											(tonumber(sheet.historicoXp1_6_m) or 0);
            					sheet.historicoTotal1_6_m = mod;
        end, obj);

    obj._e_event150 = obj.edit142:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor1_6_m) or 0)+
            											(tonumber(sheet.historicoBonus1_6_m) or 0)+
            											(tonumber(sheet.historicoXp1_6_m) or 0);
            					sheet.historicoTotal1_6_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event151 = obj.radioButton67:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event152 = obj.radioButton68:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event153 = obj.edit144:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_1_m) or 0)+
            											(tonumber(sheet.historicoBonus2_1_m) or 0)+
            											(tonumber(sheet.historicoXp2_1_m) or 0);
            					sheet.historicoTotal2_1_m = mod;
        end, obj);

    obj._e_event154 = obj.edit145:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_1_m) or 0)+
            											(tonumber(sheet.historicoBonus2_1_m) or 0)+
            											(tonumber(sheet.historicoXp2_1_m) or 0);
            					sheet.historicoTotal2_1_m = mod;
        end, obj);

    obj._e_event155 = obj.edit146:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_1_m) or 0)+
            											(tonumber(sheet.historicoBonus2_1_m) or 0)+
            											(tonumber(sheet.historicoXp2_1_m) or 0);
            					sheet.historicoTotal2_1_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event156 = obj.radioButton69:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event157 = obj.radioButton70:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event158 = obj.edit148:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_2_m) or 0)+
            											(tonumber(sheet.historicoBonus2_2_m) or 0)+
            											(tonumber(sheet.historicoXp2_2_m) or 0);
            					sheet.historicoTotal2_2_m = mod;
        end, obj);

    obj._e_event159 = obj.edit149:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_2_m) or 0)+
            											(tonumber(sheet.historicoBonus2_2_m) or 0)+
            											(tonumber(sheet.historicoXp2_2_m) or 0);
            					sheet.historicoTotal2_2_m = mod;
        end, obj);

    obj._e_event160 = obj.edit150:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_2_m) or 0)+
            											(tonumber(sheet.historicoBonus2_2_m) or 0)+
            											(tonumber(sheet.historicoXp2_2_m) or 0);
            					sheet.historicoTotal2_2_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event161 = obj.radioButton71:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event162 = obj.radioButton72:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event163 = obj.edit152:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_3_m) or 0)+
            											(tonumber(sheet.historicoBonus2_3_m) or 0)+
            											(tonumber(sheet.historicoXp2_3_m) or 0);
            					sheet.historicoTotal2_3_m = mod;
        end, obj);

    obj._e_event164 = obj.edit153:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_3_m) or 0)+
            											(tonumber(sheet.historicoBonus2_3_m) or 0)+
            											(tonumber(sheet.historicoXp2_3_m) or 0);
            					sheet.historicoTotal2_3_m = mod;
        end, obj);

    obj._e_event165 = obj.edit154:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_3_m) or 0)+
            											(tonumber(sheet.historicoBonus2_3_m) or 0)+
            											(tonumber(sheet.historicoXp2_3_m) or 0);
            					sheet.historicoTotal2_3_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event166 = obj.radioButton73:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event167 = obj.radioButton74:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event168 = obj.edit156:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_4_m) or 0)+
            											(tonumber(sheet.historicoBonus2_4_m) or 0)+
            											(tonumber(sheet.historicoXp2_4_m) or 0);
            					sheet.historicoTotal2_4_m = mod;
        end, obj);

    obj._e_event169 = obj.edit157:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_4_m) or 0)+
            											(tonumber(sheet.historicoBonus2_4_m) or 0)+
            											(tonumber(sheet.historicoXp2_4_m) or 0);
            					sheet.historicoTotal2_4_m = mod;
        end, obj);

    obj._e_event170 = obj.edit158:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_4_m) or 0)+
            											(tonumber(sheet.historicoBonus2_4_m) or 0)+
            											(tonumber(sheet.historicoXp2_4_m) or 0);
            					sheet.historicoTotal2_4_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event171 = obj.radioButton75:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event172 = obj.radioButton76:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event173 = obj.edit160:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_5_m) or 0)+
            											(tonumber(sheet.historicoBonus2_5_m) or 0)+
            											(tonumber(sheet.historicoXp2_5_m) or 0);
            					sheet.historicoTotal2_5_m = mod;
        end, obj);

    obj._e_event174 = obj.edit161:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_5_m) or 0)+
            											(tonumber(sheet.historicoBonus2_5_m) or 0)+
            											(tonumber(sheet.historicoXp2_5_m) or 0);
            					sheet.historicoTotal2_5_m = mod;
        end, obj);

    obj._e_event175 = obj.edit162:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_5_m) or 0)+
            											(tonumber(sheet.historicoBonus2_5_m) or 0)+
            											(tonumber(sheet.historicoXp2_5_m) or 0);
            					sheet.historicoTotal2_5_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event176 = obj.radioButton77:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event177 = obj.radioButton78:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event178 = obj.edit164:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_6_m) or 0)+
            											(tonumber(sheet.historicoBonus2_6_m) or 0)+
            											(tonumber(sheet.historicoXp2_6_m) or 0);
            					sheet.historicoTotal2_6_m = mod;
        end, obj);

    obj._e_event179 = obj.edit165:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_6_m) or 0)+
            											(tonumber(sheet.historicoBonus2_6_m) or 0)+
            											(tonumber(sheet.historicoXp2_6_m) or 0);
            					sheet.historicoTotal2_6_m = mod;
        end, obj);

    obj._e_event180 = obj.edit166:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor2_6_m) or 0)+
            											(tonumber(sheet.historicoBonus2_6_m) or 0)+
            											(tonumber(sheet.historicoXp2_6_m) or 0);
            					sheet.historicoTotal2_6_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event181 = obj.radioButton79:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event182 = obj.radioButton80:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event183 = obj.edit168:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_1_m) or 0)+
            											(tonumber(sheet.historicoBonus3_1_m) or 0)+
            											(tonumber(sheet.historicoXp3_1_m) or 0);
            					sheet.historicoTotal3_1_m = mod;
        end, obj);

    obj._e_event184 = obj.edit169:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_1_m) or 0)+
            											(tonumber(sheet.historicoBonus3_1_m) or 0)+
            											(tonumber(sheet.historicoXp3_1_m) or 0);
            					sheet.historicoTotal3_1_m = mod;
        end, obj);

    obj._e_event185 = obj.edit170:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_1_m) or 0)+
            											(tonumber(sheet.historicoBonus3_1_m) or 0)+
            											(tonumber(sheet.historicoXp3_1_m) or 0);
            					sheet.historicoTotal3_1_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event186 = obj.radioButton81:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event187 = obj.radioButton82:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event188 = obj.edit172:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_2_m) or 0)+
            											(tonumber(sheet.historicoBonus3_2_m) or 0)+
            											(tonumber(sheet.historicoXp3_2_m) or 0);
            					sheet.historicoTotal3_2_m = mod;
        end, obj);

    obj._e_event189 = obj.edit173:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_2_m) or 0)+
            											(tonumber(sheet.historicoBonus3_2_m) or 0)+
            											(tonumber(sheet.historicoXp3_2_m) or 0);
            					sheet.historicoTotal3_2_m = mod;
        end, obj);

    obj._e_event190 = obj.edit174:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_2_m) or 0)+
            											(tonumber(sheet.historicoBonus3_2_m) or 0)+
            											(tonumber(sheet.historicoXp3_2_m) or 0);
            					sheet.historicoTotal3_2_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event191 = obj.radioButton83:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event192 = obj.radioButton84:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event193 = obj.edit176:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_3_m) or 0)+
            											(tonumber(sheet.historicoBonus3_3_m) or 0)+
            											(tonumber(sheet.historicoXp3_3_m) or 0);
            					sheet.historicoTotal3_3_m = mod;
        end, obj);

    obj._e_event194 = obj.edit177:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_3_m) or 0)+
            											(tonumber(sheet.historicoBonus3_3_m) or 0)+
            											(tonumber(sheet.historicoXp3_3_m) or 0);
            					sheet.historicoTotal3_3_m = mod;
        end, obj);

    obj._e_event195 = obj.edit178:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_3_m) or 0)+
            											(tonumber(sheet.historicoBonus3_3_m) or 0)+
            											(tonumber(sheet.historicoXp3_3_m) or 0);
            					sheet.historicoTotal3_3_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event196 = obj.radioButton85:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event197 = obj.radioButton86:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event198 = obj.edit180:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_4_m) or 0)+
            											(tonumber(sheet.historicoBonus3_4_m) or 0)+
            											(tonumber(sheet.historicoXp3_4_m) or 0);
            					sheet.historicoTotal3_4_m = mod;
        end, obj);

    obj._e_event199 = obj.edit181:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_4_m) or 0)+
            											(tonumber(sheet.historicoBonus3_4_m) or 0)+
            											(tonumber(sheet.historicoXp3_4_m) or 0);
            					sheet.historicoTotal3_4_m = mod;
        end, obj);

    obj._e_event200 = obj.edit182:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_4_m) or 0)+
            											(tonumber(sheet.historicoBonus3_4_m) or 0)+
            											(tonumber(sheet.historicoXp3_4_m) or 0);
            					sheet.historicoTotal3_4_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event201 = obj.radioButton87:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event202 = obj.radioButton88:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event203 = obj.edit184:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_5_m) or 0)+
            											(tonumber(sheet.historicoBonus3_5_m) or 0)+
            											(tonumber(sheet.historicoXp3_5_m) or 0);
            					sheet.historicoTotal3_5_m = mod;
        end, obj);

    obj._e_event204 = obj.edit185:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_5_m) or 0)+
            											(tonumber(sheet.historicoBonus3_5_m) or 0)+
            											(tonumber(sheet.historicoXp3_5_m) or 0);
            					sheet.historicoTotal3_5_m = mod;
        end, obj);

    obj._e_event205 = obj.edit186:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_5_m) or 0)+
            											(tonumber(sheet.historicoBonus3_5_m) or 0)+
            											(tonumber(sheet.historicoXp3_5_m) or 0);
            					sheet.historicoTotal3_5_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event206 = obj.radioButton89:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event207 = obj.radioButton90:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event208 = obj.edit188:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_6_m) or 0)+
            											(tonumber(sheet.historicoBonus3_6_m) or 0)+
            											(tonumber(sheet.historicoXp3_6_m) or 0);
            					sheet.historicoTotal3_6_m = mod;
        end, obj);

    obj._e_event209 = obj.edit189:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_6_m) or 0)+
            											(tonumber(sheet.historicoBonus3_6_m) or 0)+
            											(tonumber(sheet.historicoXp3_6_m) or 0);
            					sheet.historicoTotal3_6_m = mod;
        end, obj);

    obj._e_event210 = obj.edit190:addEventListener("onUserChange",
        function (self)
            local mod = (tonumber(sheet.historicoValor3_6_m) or 0)+
            											(tonumber(sheet.historicoBonus3_6_m) or 0)+
            											(tonumber(sheet.historicoXp3_6_m) or 0);
            					sheet.historicoTotal3_6_m = mod;
            					xpHistoricos();
            					xpMisticos();
        end, obj);

    obj._e_event211 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absRes = math.floor(tonumber(sheet.testeresiliencia) or 0);
            					end;
        end, obj);

    obj._e_event212 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absorcao = (tonumber(sheet.absRes) or 0) + (tonumber(sheet.absOutros) or 0) + (tonumber(sheet.indiceArmadura) or 0);
            					end;
        end, obj);

    obj._e_event213 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            					rolagem = rrpg.interpretarRolagem("1d10 + " .. (sheet.iniciativa or 0));
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (sheet.nome or 0));
        end, obj);

    obj._e_event214 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.iniciativa = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeperspicacia) or 0)) * 2 + (tonumber(sheet.iniciativaBonus) or 0);
            						sheet.velocidade = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeforca) or 0) + 2) * 2 + (tonumber(sheet.velocidadeBonus) or 0);
            						local mod = math.floor(((tonumber(sheet.velocidade) or 0)/3) * 100);
            						mod = mod / 100;
            						sheet.ms = mod .. "m/s";
            						sheet.kmh = ((tonumber(sheet.velocidade) or 0)*1.2) .. "Km/h";
            					end;
        end, obj);

    obj._e_event215 = obj.button3:addEventListener("onClick",
        function (self)
            rolar();
        end, obj);

    obj._e_event216 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local mod = "Atributos: ";
            					local fisicos = (tonumber(sheet.inicialforca) or 0) + (tonumber(sheet.inicialagilidade) or 0) + (tonumber(sheet.inicialresiliencia) or 0);
            					local mentais = (tonumber(sheet.inicialcarisma) or 0) + (tonumber(sheet.inicialpercepcao) or 0) + (tonumber(sheet.inicialperspicacia) or 0);
            					mod = mod .. fisicos .. "/" .. mentais .. ", Aptidões: ";
            					
            					fisicos = (tonumber(sheet.base0_1) or 0) + (tonumber(sheet.base0_2) or 0) + (tonumber(sheet.base0_3) or 0) + (tonumber(sheet.base0_4) or 0) + (tonumber(sheet.base0_5) or 0) + (tonumber(sheet.base0_6) or 0) + (tonumber(sheet.base0_7) or 0) + (tonumber(sheet.base0_8) or 0) + (tonumber(sheet.base0_9) or 0) + (tonumber(sheet.base0_10) or 0) + (tonumber(sheet.base0_11) or 0) + (tonumber(sheet.base0_12) or 0) + (tonumber(sheet.base2_1) or 0) + (tonumber(sheet.base2_2) or 0) + (tonumber(sheet.base2_3) or 0) + (tonumber(sheet.base2_4) or 0) + (tonumber(sheet.base2_5) or 0) + (tonumber(sheet.base2_6) or 0) + (tonumber(sheet.base2_7) or 0) + (tonumber(sheet.base2_8) or 0) + (tonumber(sheet.base2_9) or 0) + (tonumber(sheet.base2_10) or 0) + (tonumber(sheet.base2_11) or 0) + (tonumber(sheet.base2_12) or 0);
            					mentais = (tonumber(sheet.base1_1) or 0) + (tonumber(sheet.base1_2) or 0) + (tonumber(sheet.base1_3) or 0) + (tonumber(sheet.base1_4) or 0) + (tonumber(sheet.base1_5) or 0) + (tonumber(sheet.base1_6) or 0) + (tonumber(sheet.base1_7) or 0) + (tonumber(sheet.base1_8) or 0) + (tonumber(sheet.base1_9) or 0) + (tonumber(sheet.base1_10) or 0) + (tonumber(sheet.base1_11) or 0) + (tonumber(sheet.base1_12) or 0) + (tonumber(sheet.base3_1) or 0) + (tonumber(sheet.base3_2) or 0) + (tonumber(sheet.base3_3) or 0) + (tonumber(sheet.base3_4) or 0) + (tonumber(sheet.base3_5) or 0) + (tonumber(sheet.base3_6) or 0) + (tonumber(sheet.base3_7) or 0) + (tonumber(sheet.base3_8) or 0) + (tonumber(sheet.base3_9) or 0) + (tonumber(sheet.base3_10) or 0) + (tonumber(sheet.base3_11) or 0) + (tonumber(sheet.base3_12) or 0);
            					mod = mod .. fisicos .. "/" .. mentais .. ", Especializações: ?, Historico: ";
            					
            					local historico = (tonumber(sheet.historicoValor1_1) or 0) + (tonumber(sheet.historicoValor1_2) or 0) + (tonumber(sheet.historicoValor1_3) or 0) + (tonumber(sheet.historicoValor1_4) or 0) + (tonumber(sheet.historicoValor1_5) or 0) + (tonumber(sheet.historicoValor1_6) or 0) + (tonumber(sheet.historicoValor2_1) or 0) + (tonumber(sheet.historicoValor2_2) or 0) + (tonumber(sheet.historicoValor2_3) or 0) + (tonumber(sheet.historicoValor2_4) or 0) + (tonumber(sheet.historicoValor2_5) or 0) + (tonumber(sheet.historicoValor2_6) or 0) + (tonumber(sheet.historicoValor3_1) or 0) + (tonumber(sheet.historicoValor3_2) or 0) + (tonumber(sheet.historicoValor3_3) or 0) + (tonumber(sheet.historicoValor3_4) or 0) + (tonumber(sheet.historicoValor3_5) or 0) + (tonumber(sheet.historicoValor3_6) or 0);
            					
            					mod = mod .. historico .. ", Eidolon: ";
            					
            					local eidolon = (tonumber(sheet.inicialconsciencia) or 0) + (tonumber(sheet.inicialespirito) or 0) + (tonumber(sheet.inicialperseveranca) or 0);
            					
            					mod = mod .. eidolon;
            					
            					sheet.audit = mod;
            				end;
        end, obj);

    obj._e_event217 = obj.radioButton91:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event218 = obj.radioButton92:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event219 = obj.edit203:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_1) or 0)+
            												(tonumber(sheet.bonus0_1) or 0)+
            												(tonumber(sheet.xp0_1) or 0);
            						sheet.total0_1 = mod / 2;
            						sheet.total20_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event220 = obj.edit204:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_1) or 0)+
            												(tonumber(sheet.bonus0_1) or 0)+
            												(tonumber(sheet.xp0_1) or 0);
            						sheet.total0_1 = mod / 2;
            						sheet.total20_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event221 = obj.edit205:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_1) or 0)+
            												(tonumber(sheet.bonus0_1) or 0)+
            												(tonumber(sheet.xp0_1) or 0);
            						sheet.total0_1 = mod / 2;
            						sheet.total20_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event222 = obj.radioButton93:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event223 = obj.radioButton94:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event224 = obj.edit208:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_2) or 0)+
            												(tonumber(sheet.bonus0_2) or 0)+
            												(tonumber(sheet.xp0_2) or 0);
            						sheet.total0_2 = mod / 2;
            						sheet.total20_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event225 = obj.edit209:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_2) or 0)+
            												(tonumber(sheet.bonus0_2) or 0)+
            												(tonumber(sheet.xp0_2) or 0);
            						sheet.total0_2 = mod / 2;
            						sheet.total20_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event226 = obj.edit210:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_2) or 0)+
            												(tonumber(sheet.bonus0_2) or 0)+
            												(tonumber(sheet.xp0_2) or 0);
            						sheet.total0_2 = mod / 2;
            						sheet.total20_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event227 = obj.radioButton95:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event228 = obj.radioButton96:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event229 = obj.edit213:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_3) or 0)+
            												(tonumber(sheet.bonus0_3) or 0)+
            												(tonumber(sheet.xp0_3) or 0);
            						sheet.total0_3 = mod / 2;
            						sheet.total20_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event230 = obj.edit214:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_3) or 0)+
            												(tonumber(sheet.bonus0_3) or 0)+
            												(tonumber(sheet.xp0_3) or 0);
            						sheet.total0_3 = mod / 2;
            						sheet.total20_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event231 = obj.edit215:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_3) or 0)+
            												(tonumber(sheet.bonus0_3) or 0)+
            												(tonumber(sheet.xp0_3) or 0);
            						sheet.total0_3 = mod / 2;
            						sheet.total20_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event232 = obj.radioButton97:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event233 = obj.radioButton98:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event234 = obj.edit218:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_4) or 0)+
            												(tonumber(sheet.bonus0_4) or 0)+
            												(tonumber(sheet.xp0_4) or 0);
            						sheet.total0_4 = mod / 2;
            						sheet.total20_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event235 = obj.edit219:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_4) or 0)+
            												(tonumber(sheet.bonus0_4) or 0)+
            												(tonumber(sheet.xp0_4) or 0);
            						sheet.total0_4 = mod / 2;
            						sheet.total20_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event236 = obj.edit220:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_4) or 0)+
            												(tonumber(sheet.bonus0_4) or 0)+
            												(tonumber(sheet.xp0_4) or 0);
            						sheet.total0_4 = mod / 2;
            						sheet.total20_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event237 = obj.radioButton99:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event238 = obj.radioButton100:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event239 = obj.edit223:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_5) or 0)+
            												(tonumber(sheet.bonus0_5) or 0)+
            												(tonumber(sheet.xp0_5) or 0);
            						sheet.total0_5 = mod / 2;
            						sheet.total20_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event240 = obj.edit224:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_5) or 0)+
            												(tonumber(sheet.bonus0_5) or 0)+
            												(tonumber(sheet.xp0_5) or 0);
            						sheet.total0_5 = mod / 2;
            						sheet.total20_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event241 = obj.edit225:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_5) or 0)+
            												(tonumber(sheet.bonus0_5) or 0)+
            												(tonumber(sheet.xp0_5) or 0);
            						sheet.total0_5 = mod / 2;
            						sheet.total20_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event242 = obj.radioButton101:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event243 = obj.radioButton102:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event244 = obj.edit228:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_6) or 0)+
            												(tonumber(sheet.bonus0_6) or 0)+
            												(tonumber(sheet.xp0_6) or 0);
            						sheet.total0_6 = mod / 2;
            						sheet.total20_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event245 = obj.edit229:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_6) or 0)+
            												(tonumber(sheet.bonus0_6) or 0)+
            												(tonumber(sheet.xp0_6) or 0);
            						sheet.total0_6 = mod / 2;
            						sheet.total20_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event246 = obj.edit230:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_6) or 0)+
            												(tonumber(sheet.bonus0_6) or 0)+
            												(tonumber(sheet.xp0_6) or 0);
            						sheet.total0_6 = mod / 2;
            						sheet.total20_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event247 = obj.radioButton103:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event248 = obj.radioButton104:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event249 = obj.edit233:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_7) or 0)+
            												(tonumber(sheet.bonus0_7) or 0)+
            												(tonumber(sheet.xp0_7) or 0);
            						sheet.total0_7 = mod / 2;
            						sheet.total20_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event250 = obj.edit234:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_7) or 0)+
            												(tonumber(sheet.bonus0_7) or 0)+
            												(tonumber(sheet.xp0_7) or 0);
            						sheet.total0_7 = mod / 2;
            						sheet.total20_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event251 = obj.edit235:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_7) or 0)+
            												(tonumber(sheet.bonus0_7) or 0)+
            												(tonumber(sheet.xp0_7) or 0);
            						sheet.total0_7 = mod / 2;
            						sheet.total20_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event252 = obj.radioButton105:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event253 = obj.radioButton106:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event254 = obj.edit238:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_8) or 0)+
            												(tonumber(sheet.bonus0_8) or 0)+
            												(tonumber(sheet.xp0_8) or 0);
            						sheet.total0_8 = mod / 2;
            						sheet.total20_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event255 = obj.edit239:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_8) or 0)+
            												(tonumber(sheet.bonus0_8) or 0)+
            												(tonumber(sheet.xp0_8) or 0);
            						sheet.total0_8 = mod / 2;
            						sheet.total20_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event256 = obj.edit240:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_8) or 0)+
            												(tonumber(sheet.bonus0_8) or 0)+
            												(tonumber(sheet.xp0_8) or 0);
            						sheet.total0_8 = mod / 2;
            						sheet.total20_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event257 = obj.radioButton107:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event258 = obj.radioButton108:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event259 = obj.edit243:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_9) or 0)+
            												(tonumber(sheet.bonus0_9) or 0)+
            												(tonumber(sheet.xp0_9) or 0);
            						sheet.total0_9 = mod / 2;
            						sheet.total20_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event260 = obj.edit244:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_9) or 0)+
            												(tonumber(sheet.bonus0_9) or 0)+
            												(tonumber(sheet.xp0_9) or 0);
            						sheet.total0_9 = mod / 2;
            						sheet.total20_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event261 = obj.edit245:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_9) or 0)+
            												(tonumber(sheet.bonus0_9) or 0)+
            												(tonumber(sheet.xp0_9) or 0);
            						sheet.total0_9 = mod / 2;
            						sheet.total20_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event262 = obj.radioButton109:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event263 = obj.radioButton110:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event264 = obj.edit248:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_10) or 0)+
            												(tonumber(sheet.bonus0_10) or 0)+
            												(tonumber(sheet.xp0_10) or 0);
            						sheet.total0_10 = mod / 2;
            						sheet.total20_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event265 = obj.edit249:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_10) or 0)+
            												(tonumber(sheet.bonus0_10) or 0)+
            												(tonumber(sheet.xp0_10) or 0);
            						sheet.total0_10 = mod / 2;
            						sheet.total20_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event266 = obj.edit250:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_10) or 0)+
            												(tonumber(sheet.bonus0_10) or 0)+
            												(tonumber(sheet.xp0_10) or 0);
            						sheet.total0_10 = mod / 2;
            						sheet.total20_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event267 = obj.radioButton111:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event268 = obj.radioButton112:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event269 = obj.edit253:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_11) or 0)+
            												(tonumber(sheet.bonus0_11) or 0)+
            												(tonumber(sheet.xp0_11) or 0);
            						sheet.total0_11 = mod / 2;
            						sheet.total20_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event270 = obj.edit254:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_11) or 0)+
            												(tonumber(sheet.bonus0_11) or 0)+
            												(tonumber(sheet.xp0_11) or 0);
            						sheet.total0_11 = mod / 2;
            						sheet.total20_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event271 = obj.edit255:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_11) or 0)+
            												(tonumber(sheet.bonus0_11) or 0)+
            												(tonumber(sheet.xp0_11) or 0);
            						sheet.total0_11 = mod / 2;
            						sheet.total20_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event272 = obj.radioButton113:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event273 = obj.radioButton114:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event274 = obj.edit258:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_12) or 0)+
            												(tonumber(sheet.bonus0_12) or 0)+
            												(tonumber(sheet.xp0_12) or 0);
            						sheet.total0_12 = mod / 2;
            						sheet.total20_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event275 = obj.edit259:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_12) or 0)+
            												(tonumber(sheet.bonus0_12) or 0)+
            												(tonumber(sheet.xp0_12) or 0);
            						sheet.total0_12 = mod / 2;
            						sheet.total20_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event276 = obj.edit260:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_12) or 0)+
            												(tonumber(sheet.bonus0_12) or 0)+
            												(tonumber(sheet.xp0_12) or 0);
            						sheet.total0_12 = mod / 2;
            						sheet.total20_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event277 = obj.radioButton115:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event278 = obj.radioButton116:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event279 = obj.edit263:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_1) or 0)+
            												(tonumber(sheet.bonus2_1) or 0)+
            												(tonumber(sheet.xp2_1) or 0);
            						sheet.total2_1 = mod / 2;
            						sheet.total22_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event280 = obj.edit264:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_1) or 0)+
            												(tonumber(sheet.bonus2_1) or 0)+
            												(tonumber(sheet.xp2_1) or 0);
            						sheet.total2_1 = mod / 2;
            						sheet.total22_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event281 = obj.edit265:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_1) or 0)+
            												(tonumber(sheet.bonus2_1) or 0)+
            												(tonumber(sheet.xp2_1) or 0);
            						sheet.total2_1 = mod / 2;
            						sheet.total22_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event282 = obj.radioButton117:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event283 = obj.radioButton118:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event284 = obj.edit268:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_2) or 0)+
            												(tonumber(sheet.bonus2_2) or 0)+
            												(tonumber(sheet.xp2_2) or 0);
            						sheet.total2_2 = mod / 2;
            						sheet.total22_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event285 = obj.edit269:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_2) or 0)+
            												(tonumber(sheet.bonus2_2) or 0)+
            												(tonumber(sheet.xp2_2) or 0);
            						sheet.total2_2 = mod / 2;
            						sheet.total22_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event286 = obj.edit270:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_2) or 0)+
            												(tonumber(sheet.bonus2_2) or 0)+
            												(tonumber(sheet.xp2_2) or 0);
            						sheet.total2_2 = mod / 2;
            						sheet.total22_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event287 = obj.radioButton119:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event288 = obj.radioButton120:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event289 = obj.edit273:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_3) or 0)+
            												(tonumber(sheet.bonus2_3) or 0)+
            												(tonumber(sheet.xp2_3) or 0);
            						sheet.total2_3 = mod / 2;
            						sheet.total22_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event290 = obj.edit274:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_3) or 0)+
            												(tonumber(sheet.bonus2_3) or 0)+
            												(tonumber(sheet.xp2_3) or 0);
            						sheet.total2_3 = mod / 2;
            						sheet.total22_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event291 = obj.edit275:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_3) or 0)+
            												(tonumber(sheet.bonus2_3) or 0)+
            												(tonumber(sheet.xp2_3) or 0);
            						sheet.total2_3 = mod / 2;
            						sheet.total22_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event292 = obj.radioButton121:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event293 = obj.radioButton122:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event294 = obj.edit278:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_4) or 0)+
            												(tonumber(sheet.bonus2_4) or 0)+
            												(tonumber(sheet.xp2_4) or 0);
            						sheet.total2_4 = mod / 2;
            						sheet.total22_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event295 = obj.edit279:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_4) or 0)+
            												(tonumber(sheet.bonus2_4) or 0)+
            												(tonumber(sheet.xp2_4) or 0);
            						sheet.total2_4 = mod / 2;
            						sheet.total22_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event296 = obj.edit280:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_4) or 0)+
            												(tonumber(sheet.bonus2_4) or 0)+
            												(tonumber(sheet.xp2_4) or 0);
            						sheet.total2_4 = mod / 2;
            						sheet.total22_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event297 = obj.radioButton123:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event298 = obj.radioButton124:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event299 = obj.edit283:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_5) or 0)+
            												(tonumber(sheet.bonus2_5) or 0)+
            												(tonumber(sheet.xp2_5) or 0);
            						sheet.total2_5 = mod / 2;
            						sheet.total22_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event300 = obj.edit284:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_5) or 0)+
            												(tonumber(sheet.bonus2_5) or 0)+
            												(tonumber(sheet.xp2_5) or 0);
            						sheet.total2_5 = mod / 2;
            						sheet.total22_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event301 = obj.edit285:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_5) or 0)+
            												(tonumber(sheet.bonus2_5) or 0)+
            												(tonumber(sheet.xp2_5) or 0);
            						sheet.total2_5 = mod / 2;
            						sheet.total22_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event302 = obj.radioButton125:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event303 = obj.radioButton126:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event304 = obj.edit288:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_6) or 0)+
            												(tonumber(sheet.bonus2_6) or 0)+
            												(tonumber(sheet.xp2_6) or 0);
            						sheet.total2_6 = mod / 2;
            						sheet.total22_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event305 = obj.edit289:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_6) or 0)+
            												(tonumber(sheet.bonus2_6) or 0)+
            												(tonumber(sheet.xp2_6) or 0);
            						sheet.total2_6 = mod / 2;
            						sheet.total22_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event306 = obj.edit290:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_6) or 0)+
            												(tonumber(sheet.bonus2_6) or 0)+
            												(tonumber(sheet.xp2_6) or 0);
            						sheet.total2_6 = mod / 2;
            						sheet.total22_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event307 = obj.radioButton127:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event308 = obj.radioButton128:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event309 = obj.edit293:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_7) or 0)+
            												(tonumber(sheet.bonus2_7) or 0)+
            												(tonumber(sheet.xp2_7) or 0);
            						sheet.total2_7 = mod / 2;
            						sheet.total22_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event310 = obj.edit294:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_7) or 0)+
            												(tonumber(sheet.bonus2_7) or 0)+
            												(tonumber(sheet.xp2_7) or 0);
            						sheet.total2_7 = mod / 2;
            						sheet.total22_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event311 = obj.edit295:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_7) or 0)+
            												(tonumber(sheet.bonus2_7) or 0)+
            												(tonumber(sheet.xp2_7) or 0);
            						sheet.total2_7 = mod / 2;
            						sheet.total22_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event312 = obj.radioButton129:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event313 = obj.radioButton130:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event314 = obj.edit298:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_8) or 0)+
            												(tonumber(sheet.bonus2_8) or 0)+
            												(tonumber(sheet.xp2_8) or 0);
            						sheet.total2_8 = mod / 2;
            						sheet.total22_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event315 = obj.edit299:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_8) or 0)+
            												(tonumber(sheet.bonus2_8) or 0)+
            												(tonumber(sheet.xp2_8) or 0);
            						sheet.total2_8 = mod / 2;
            						sheet.total22_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event316 = obj.edit300:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_8) or 0)+
            												(tonumber(sheet.bonus2_8) or 0)+
            												(tonumber(sheet.xp2_8) or 0);
            						sheet.total2_8 = mod / 2;
            						sheet.total22_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event317 = obj.radioButton131:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event318 = obj.radioButton132:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event319 = obj.edit303:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_9) or 0)+
            												(tonumber(sheet.bonus2_9) or 0)+
            												(tonumber(sheet.xp2_9) or 0);
            						sheet.total2_9 = mod / 2;
            						sheet.total22_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event320 = obj.edit304:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_9) or 0)+
            												(tonumber(sheet.bonus2_9) or 0)+
            												(tonumber(sheet.xp2_9) or 0);
            						sheet.total2_9 = mod / 2;
            						sheet.total22_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event321 = obj.edit305:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_9) or 0)+
            												(tonumber(sheet.bonus2_9) or 0)+
            												(tonumber(sheet.xp2_9) or 0);
            						sheet.total2_9 = mod / 2;
            						sheet.total22_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event322 = obj.radioButton133:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event323 = obj.radioButton134:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event324 = obj.edit308:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_10) or 0)+
            												(tonumber(sheet.bonus2_10) or 0)+
            												(tonumber(sheet.xp2_10) or 0);
            						sheet.total2_10 = mod / 2;
            						sheet.total22_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event325 = obj.edit309:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_10) or 0)+
            												(tonumber(sheet.bonus2_10) or 0)+
            												(tonumber(sheet.xp2_10) or 0);
            						sheet.total2_10 = mod / 2;
            						sheet.total22_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event326 = obj.edit310:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_10) or 0)+
            												(tonumber(sheet.bonus2_10) or 0)+
            												(tonumber(sheet.xp2_10) or 0);
            						sheet.total2_10 = mod / 2;
            						sheet.total22_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event327 = obj.radioButton135:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event328 = obj.radioButton136:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event329 = obj.edit313:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_11) or 0)+
            												(tonumber(sheet.bonus2_11) or 0)+
            												(tonumber(sheet.xp2_11) or 0);
            						sheet.total2_11 = mod / 2;
            						sheet.total22_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event330 = obj.edit314:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_11) or 0)+
            												(tonumber(sheet.bonus2_11) or 0)+
            												(tonumber(sheet.xp2_11) or 0);
            						sheet.total2_11 = mod / 2;
            						sheet.total22_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event331 = obj.edit315:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_11) or 0)+
            												(tonumber(sheet.bonus2_11) or 0)+
            												(tonumber(sheet.xp2_11) or 0);
            						sheet.total2_11 = mod / 2;
            						sheet.total22_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event332 = obj.radioButton137:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event333 = obj.radioButton138:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event334 = obj.edit318:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_12) or 0)+
            												(tonumber(sheet.bonus2_12) or 0)+
            												(tonumber(sheet.xp2_12) or 0);
            						sheet.total2_12 = mod / 2;
            						sheet.total22_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event335 = obj.edit319:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_12) or 0)+
            												(tonumber(sheet.bonus2_12) or 0)+
            												(tonumber(sheet.xp2_12) or 0);
            						sheet.total2_12 = mod / 2;
            						sheet.total22_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event336 = obj.edit320:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_12) or 0)+
            												(tonumber(sheet.bonus2_12) or 0)+
            												(tonumber(sheet.xp2_12) or 0);
            						sheet.total2_12 = mod / 2;
            						sheet.total22_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event337 = obj.radioButton139:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event338 = obj.radioButton140:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event339 = obj.edit323:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_1) or 0)+
            												(tonumber(sheet.bonus1_1) or 0)+
            												(tonumber(sheet.xp1_1) or 0);
            						sheet.total1_1 = mod / 2;
            						sheet.total21_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event340 = obj.edit324:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_1) or 0)+
            												(tonumber(sheet.bonus1_1) or 0)+
            												(tonumber(sheet.xp1_1) or 0);
            						sheet.total1_1 = mod / 2;
            						sheet.total21_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event341 = obj.edit325:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_1) or 0)+
            												(tonumber(sheet.bonus1_1) or 0)+
            												(tonumber(sheet.xp1_1) or 0);
            						sheet.total1_1 = mod / 2;
            						sheet.total21_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event342 = obj.radioButton141:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event343 = obj.radioButton142:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event344 = obj.edit328:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_2) or 0)+
            												(tonumber(sheet.bonus1_2) or 0)+
            												(tonumber(sheet.xp1_2) or 0);
            						sheet.total1_2 = mod / 2;
            						sheet.total21_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event345 = obj.edit329:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_2) or 0)+
            												(tonumber(sheet.bonus1_2) or 0)+
            												(tonumber(sheet.xp1_2) or 0);
            						sheet.total1_2 = mod / 2;
            						sheet.total21_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event346 = obj.edit330:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_2) or 0)+
            												(tonumber(sheet.bonus1_2) or 0)+
            												(tonumber(sheet.xp1_2) or 0);
            						sheet.total1_2 = mod / 2;
            						sheet.total21_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event347 = obj.radioButton143:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event348 = obj.radioButton144:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event349 = obj.edit333:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_3) or 0)+
            												(tonumber(sheet.bonus1_3) or 0)+
            												(tonumber(sheet.xp1_3) or 0);
            						sheet.total1_3 = mod / 2;
            						sheet.total21_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event350 = obj.edit334:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_3) or 0)+
            												(tonumber(sheet.bonus1_3) or 0)+
            												(tonumber(sheet.xp1_3) or 0);
            						sheet.total1_3 = mod / 2;
            						sheet.total21_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event351 = obj.edit335:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_3) or 0)+
            												(tonumber(sheet.bonus1_3) or 0)+
            												(tonumber(sheet.xp1_3) or 0);
            						sheet.total1_3 = mod / 2;
            						sheet.total21_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event352 = obj.radioButton145:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event353 = obj.radioButton146:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event354 = obj.edit338:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_4) or 0)+
            												(tonumber(sheet.bonus1_4) or 0)+
            												(tonumber(sheet.xp1_4) or 0);
            						sheet.total1_4 = mod / 2;
            						sheet.total21_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event355 = obj.edit339:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_4) or 0)+
            												(tonumber(sheet.bonus1_4) or 0)+
            												(tonumber(sheet.xp1_4) or 0);
            						sheet.total1_4 = mod / 2;
            						sheet.total21_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event356 = obj.edit340:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_4) or 0)+
            												(tonumber(sheet.bonus1_4) or 0)+
            												(tonumber(sheet.xp1_4) or 0);
            						sheet.total1_4 = mod / 2;
            						sheet.total21_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event357 = obj.radioButton147:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event358 = obj.radioButton148:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event359 = obj.edit343:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_5) or 0)+
            												(tonumber(sheet.bonus1_5) or 0)+
            												(tonumber(sheet.xp1_5) or 0);
            						sheet.total1_5 = mod / 2;
            						sheet.total21_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event360 = obj.edit344:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_5) or 0)+
            												(tonumber(sheet.bonus1_5) or 0)+
            												(tonumber(sheet.xp1_5) or 0);
            						sheet.total1_5 = mod / 2;
            						sheet.total21_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event361 = obj.edit345:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_5) or 0)+
            												(tonumber(sheet.bonus1_5) or 0)+
            												(tonumber(sheet.xp1_5) or 0);
            						sheet.total1_5 = mod / 2;
            						sheet.total21_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event362 = obj.radioButton149:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event363 = obj.radioButton150:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event364 = obj.edit348:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_6) or 0)+
            												(tonumber(sheet.bonus1_6) or 0)+
            												(tonumber(sheet.xp1_6) or 0);
            						sheet.total1_6 = mod / 2;
            						sheet.total21_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event365 = obj.edit349:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_6) or 0)+
            												(tonumber(sheet.bonus1_6) or 0)+
            												(tonumber(sheet.xp1_6) or 0);
            						sheet.total1_6 = mod / 2;
            						sheet.total21_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event366 = obj.edit350:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_6) or 0)+
            												(tonumber(sheet.bonus1_6) or 0)+
            												(tonumber(sheet.xp1_6) or 0);
            						sheet.total1_6 = mod / 2;
            						sheet.total21_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event367 = obj.radioButton151:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event368 = obj.radioButton152:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event369 = obj.edit353:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_7) or 0)+
            												(tonumber(sheet.bonus1_7) or 0)+
            												(tonumber(sheet.xp1_7) or 0);
            						sheet.total1_7 = mod / 2;
            						sheet.total21_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event370 = obj.edit354:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_7) or 0)+
            												(tonumber(sheet.bonus1_7) or 0)+
            												(tonumber(sheet.xp1_7) or 0);
            						sheet.total1_7 = mod / 2;
            						sheet.total21_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event371 = obj.edit355:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_7) or 0)+
            												(tonumber(sheet.bonus1_7) or 0)+
            												(tonumber(sheet.xp1_7) or 0);
            						sheet.total1_7 = mod / 2;
            						sheet.total21_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event372 = obj.radioButton153:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event373 = obj.radioButton154:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event374 = obj.edit358:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_8) or 0)+
            												(tonumber(sheet.bonus1_8) or 0)+
            												(tonumber(sheet.xp1_8) or 0);
            						sheet.total1_8 = mod / 2;
            						sheet.total21_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event375 = obj.edit359:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_8) or 0)+
            												(tonumber(sheet.bonus1_8) or 0)+
            												(tonumber(sheet.xp1_8) or 0);
            						sheet.total1_8 = mod / 2;
            						sheet.total21_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event376 = obj.edit360:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_8) or 0)+
            												(tonumber(sheet.bonus1_8) or 0)+
            												(tonumber(sheet.xp1_8) or 0);
            						sheet.total1_8 = mod / 2;
            						sheet.total21_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event377 = obj.radioButton155:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event378 = obj.radioButton156:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event379 = obj.edit363:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_9) or 0)+
            												(tonumber(sheet.bonus1_9) or 0)+
            												(tonumber(sheet.xp1_9) or 0);
            						sheet.total1_9 = mod / 2;
            						sheet.total21_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event380 = obj.edit364:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_9) or 0)+
            												(tonumber(sheet.bonus1_9) or 0)+
            												(tonumber(sheet.xp1_9) or 0);
            						sheet.total1_9 = mod / 2;
            						sheet.total21_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event381 = obj.edit365:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_9) or 0)+
            												(tonumber(sheet.bonus1_9) or 0)+
            												(tonumber(sheet.xp1_9) or 0);
            						sheet.total1_9 = mod / 2;
            						sheet.total21_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event382 = obj.radioButton157:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event383 = obj.radioButton158:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event384 = obj.edit368:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_10) or 0)+
            												(tonumber(sheet.bonus1_10) or 0)+
            												(tonumber(sheet.xp1_10) or 0);
            						sheet.total1_10 = mod / 2;
            						sheet.total21_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event385 = obj.edit369:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_10) or 0)+
            												(tonumber(sheet.bonus1_10) or 0)+
            												(tonumber(sheet.xp1_10) or 0);
            						sheet.total1_10 = mod / 2;
            						sheet.total21_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event386 = obj.edit370:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_10) or 0)+
            												(tonumber(sheet.bonus1_10) or 0)+
            												(tonumber(sheet.xp1_10) or 0);
            						sheet.total1_10 = mod / 2;
            						sheet.total21_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event387 = obj.radioButton159:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event388 = obj.radioButton160:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event389 = obj.edit373:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_11) or 0)+
            												(tonumber(sheet.bonus1_11) or 0)+
            												(tonumber(sheet.xp1_11) or 0);
            						sheet.total1_11 = mod / 2;
            						sheet.total21_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event390 = obj.edit374:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_11) or 0)+
            												(tonumber(sheet.bonus1_11) or 0)+
            												(tonumber(sheet.xp1_11) or 0);
            						sheet.total1_11 = mod / 2;
            						sheet.total21_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event391 = obj.edit375:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_11) or 0)+
            												(tonumber(sheet.bonus1_11) or 0)+
            												(tonumber(sheet.xp1_11) or 0);
            						sheet.total1_11 = mod / 2;
            						sheet.total21_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event392 = obj.radioButton161:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event393 = obj.radioButton162:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event394 = obj.edit378:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_12) or 0)+
            												(tonumber(sheet.bonus1_12) or 0)+
            												(tonumber(sheet.xp1_12) or 0);
            						sheet.total1_12 = mod / 2;
            						sheet.total21_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event395 = obj.edit379:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_12) or 0)+
            												(tonumber(sheet.bonus1_12) or 0)+
            												(tonumber(sheet.xp1_12) or 0);
            						sheet.total1_12 = mod / 2;
            						sheet.total21_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event396 = obj.edit380:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_12) or 0)+
            												(tonumber(sheet.bonus1_12) or 0)+
            												(tonumber(sheet.xp1_12) or 0);
            						sheet.total1_12 = mod / 2;
            						sheet.total21_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event397 = obj.radioButton163:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event398 = obj.radioButton164:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event399 = obj.edit383:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_1) or 0)+
            												(tonumber(sheet.bonus3_1) or 0)+
            												(tonumber(sheet.xp3_1) or 0);
            						sheet.total3_1 = mod / 2;
            						sheet.total23_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event400 = obj.edit384:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_1) or 0)+
            												(tonumber(sheet.bonus3_1) or 0)+
            												(tonumber(sheet.xp3_1) or 0);
            						sheet.total3_1 = mod / 2;
            						sheet.total23_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event401 = obj.edit385:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_1) or 0)+
            												(tonumber(sheet.bonus3_1) or 0)+
            												(tonumber(sheet.xp3_1) or 0);
            						sheet.total3_1 = mod / 2;
            						sheet.total23_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event402 = obj.radioButton165:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event403 = obj.radioButton166:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event404 = obj.edit388:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_2) or 0)+
            												(tonumber(sheet.bonus3_2) or 0)+
            												(tonumber(sheet.xp3_2) or 0);
            						sheet.total3_2 = mod / 2;
            						sheet.total23_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event405 = obj.edit389:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_2) or 0)+
            												(tonumber(sheet.bonus3_2) or 0)+
            												(tonumber(sheet.xp3_2) or 0);
            						sheet.total3_2 = mod / 2;
            						sheet.total23_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event406 = obj.edit390:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_2) or 0)+
            												(tonumber(sheet.bonus3_2) or 0)+
            												(tonumber(sheet.xp3_2) or 0);
            						sheet.total3_2 = mod / 2;
            						sheet.total23_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event407 = obj.radioButton167:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event408 = obj.radioButton168:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event409 = obj.edit393:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_3) or 0)+
            												(tonumber(sheet.bonus3_3) or 0)+
            												(tonumber(sheet.xp3_3) or 0);
            						sheet.total3_3 = mod / 2;
            						sheet.total23_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event410 = obj.edit394:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_3) or 0)+
            												(tonumber(sheet.bonus3_3) or 0)+
            												(tonumber(sheet.xp3_3) or 0);
            						sheet.total3_3 = mod / 2;
            						sheet.total23_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event411 = obj.edit395:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_3) or 0)+
            												(tonumber(sheet.bonus3_3) or 0)+
            												(tonumber(sheet.xp3_3) or 0);
            						sheet.total3_3 = mod / 2;
            						sheet.total23_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event412 = obj.radioButton169:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event413 = obj.radioButton170:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event414 = obj.edit398:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_4) or 0)+
            												(tonumber(sheet.bonus3_4) or 0)+
            												(tonumber(sheet.xp3_4) or 0);
            						sheet.total3_4 = mod / 2;
            						sheet.total23_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event415 = obj.edit399:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_4) or 0)+
            												(tonumber(sheet.bonus3_4) or 0)+
            												(tonumber(sheet.xp3_4) or 0);
            						sheet.total3_4 = mod / 2;
            						sheet.total23_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event416 = obj.edit400:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_4) or 0)+
            												(tonumber(sheet.bonus3_4) or 0)+
            												(tonumber(sheet.xp3_4) or 0);
            						sheet.total3_4 = mod / 2;
            						sheet.total23_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event417 = obj.radioButton171:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event418 = obj.radioButton172:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event419 = obj.edit403:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_5) or 0)+
            												(tonumber(sheet.bonus3_5) or 0)+
            												(tonumber(sheet.xp3_5) or 0);
            						sheet.total3_5 = mod / 2;
            						sheet.total23_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event420 = obj.edit404:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_5) or 0)+
            												(tonumber(sheet.bonus3_5) or 0)+
            												(tonumber(sheet.xp3_5) or 0);
            						sheet.total3_5 = mod / 2;
            						sheet.total23_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event421 = obj.edit405:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_5) or 0)+
            												(tonumber(sheet.bonus3_5) or 0)+
            												(tonumber(sheet.xp3_5) or 0);
            						sheet.total3_5 = mod / 2;
            						sheet.total23_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event422 = obj.radioButton173:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event423 = obj.radioButton174:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event424 = obj.edit408:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_6) or 0)+
            												(tonumber(sheet.bonus3_6) or 0)+
            												(tonumber(sheet.xp3_6) or 0);
            						sheet.total3_6 = mod / 2;
            						sheet.total23_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event425 = obj.edit409:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_6) or 0)+
            												(tonumber(sheet.bonus3_6) or 0)+
            												(tonumber(sheet.xp3_6) or 0);
            						sheet.total3_6 = mod / 2;
            						sheet.total23_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event426 = obj.edit410:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_6) or 0)+
            												(tonumber(sheet.bonus3_6) or 0)+
            												(tonumber(sheet.xp3_6) or 0);
            						sheet.total3_6 = mod / 2;
            						sheet.total23_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event427 = obj.radioButton175:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event428 = obj.radioButton176:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event429 = obj.edit413:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_7) or 0)+
            												(tonumber(sheet.bonus3_7) or 0)+
            												(tonumber(sheet.xp3_7) or 0);
            						sheet.total3_7 = mod / 2;
            						sheet.total23_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event430 = obj.edit414:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_7) or 0)+
            												(tonumber(sheet.bonus3_7) or 0)+
            												(tonumber(sheet.xp3_7) or 0);
            						sheet.total3_7 = mod / 2;
            						sheet.total23_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event431 = obj.edit415:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_7) or 0)+
            												(tonumber(sheet.bonus3_7) or 0)+
            												(tonumber(sheet.xp3_7) or 0);
            						sheet.total3_7 = mod / 2;
            						sheet.total23_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event432 = obj.radioButton177:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event433 = obj.radioButton178:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event434 = obj.edit418:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_8) or 0)+
            												(tonumber(sheet.bonus3_8) or 0)+
            												(tonumber(sheet.xp3_8) or 0);
            						sheet.total3_8 = mod / 2;
            						sheet.total23_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event435 = obj.edit419:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_8) or 0)+
            												(tonumber(sheet.bonus3_8) or 0)+
            												(tonumber(sheet.xp3_8) or 0);
            						sheet.total3_8 = mod / 2;
            						sheet.total23_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event436 = obj.edit420:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_8) or 0)+
            												(tonumber(sheet.bonus3_8) or 0)+
            												(tonumber(sheet.xp3_8) or 0);
            						sheet.total3_8 = mod / 2;
            						sheet.total23_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event437 = obj.radioButton179:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event438 = obj.radioButton180:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event439 = obj.edit423:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_9) or 0)+
            												(tonumber(sheet.bonus3_9) or 0)+
            												(tonumber(sheet.xp3_9) or 0);
            						sheet.total3_9 = mod / 2;
            						sheet.total23_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event440 = obj.edit424:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_9) or 0)+
            												(tonumber(sheet.bonus3_9) or 0)+
            												(tonumber(sheet.xp3_9) or 0);
            						sheet.total3_9 = mod / 2;
            						sheet.total23_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event441 = obj.edit425:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_9) or 0)+
            												(tonumber(sheet.bonus3_9) or 0)+
            												(tonumber(sheet.xp3_9) or 0);
            						sheet.total3_9 = mod / 2;
            						sheet.total23_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event442 = obj.radioButton181:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event443 = obj.radioButton182:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event444 = obj.edit428:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_10) or 0)+
            												(tonumber(sheet.bonus3_10) or 0)+
            												(tonumber(sheet.xp3_10) or 0);
            						sheet.total3_10 = mod / 2;
            						sheet.total23_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event445 = obj.edit429:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_10) or 0)+
            												(tonumber(sheet.bonus3_10) or 0)+
            												(tonumber(sheet.xp3_10) or 0);
            						sheet.total3_10 = mod / 2;
            						sheet.total23_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event446 = obj.edit430:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_10) or 0)+
            												(tonumber(sheet.bonus3_10) or 0)+
            												(tonumber(sheet.xp3_10) or 0);
            						sheet.total3_10 = mod / 2;
            						sheet.total23_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event447 = obj.radioButton183:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event448 = obj.radioButton184:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event449 = obj.edit433:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_11) or 0)+
            												(tonumber(sheet.bonus3_11) or 0)+
            												(tonumber(sheet.xp3_11) or 0);
            						sheet.total3_11 = mod / 2;
            						sheet.total23_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event450 = obj.edit434:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_11) or 0)+
            												(tonumber(sheet.bonus3_11) or 0)+
            												(tonumber(sheet.xp3_11) or 0);
            						sheet.total3_11 = mod / 2;
            						sheet.total23_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event451 = obj.edit435:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_11) or 0)+
            												(tonumber(sheet.bonus3_11) or 0)+
            												(tonumber(sheet.xp3_11) or 0);
            						sheet.total3_11 = mod / 2;
            						sheet.total23_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event452 = obj.radioButton185:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event453 = obj.radioButton186:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event454 = obj.edit438:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_12) or 0)+
            												(tonumber(sheet.bonus3_12) or 0)+
            												(tonumber(sheet.xp3_12) or 0);
            						sheet.total3_12 = mod / 2;
            						sheet.total23_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event455 = obj.edit439:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_12) or 0)+
            												(tonumber(sheet.bonus3_12) or 0)+
            												(tonumber(sheet.xp3_12) or 0);
            						sheet.total3_12 = mod / 2;
            						sheet.total23_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event456 = obj.edit440:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_12) or 0)+
            												(tonumber(sheet.bonus3_12) or 0)+
            												(tonumber(sheet.xp3_12) or 0);
            						sheet.total3_12 = mod / 2;
            						sheet.total23_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event457 = obj.button4:addEventListener("onClick",
        function (self)
            rolar();
        end, obj);

    obj._e_event458 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20ACN%20releases/Change%20Log.txt')
        end, obj);

    obj._e_event459 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20ACN%20releases/Ficha%20ACN.rpk')
        end, obj);

    obj._e_event460 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event461 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=97151');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event461);
        __o_rrpgObjs.removeEventListenerById(self._e_event460);
        __o_rrpgObjs.removeEventListenerById(self._e_event459);
        __o_rrpgObjs.removeEventListenerById(self._e_event458);
        __o_rrpgObjs.removeEventListenerById(self._e_event457);
        __o_rrpgObjs.removeEventListenerById(self._e_event456);
        __o_rrpgObjs.removeEventListenerById(self._e_event455);
        __o_rrpgObjs.removeEventListenerById(self._e_event454);
        __o_rrpgObjs.removeEventListenerById(self._e_event453);
        __o_rrpgObjs.removeEventListenerById(self._e_event452);
        __o_rrpgObjs.removeEventListenerById(self._e_event451);
        __o_rrpgObjs.removeEventListenerById(self._e_event450);
        __o_rrpgObjs.removeEventListenerById(self._e_event449);
        __o_rrpgObjs.removeEventListenerById(self._e_event448);
        __o_rrpgObjs.removeEventListenerById(self._e_event447);
        __o_rrpgObjs.removeEventListenerById(self._e_event446);
        __o_rrpgObjs.removeEventListenerById(self._e_event445);
        __o_rrpgObjs.removeEventListenerById(self._e_event444);
        __o_rrpgObjs.removeEventListenerById(self._e_event443);
        __o_rrpgObjs.removeEventListenerById(self._e_event442);
        __o_rrpgObjs.removeEventListenerById(self._e_event441);
        __o_rrpgObjs.removeEventListenerById(self._e_event440);
        __o_rrpgObjs.removeEventListenerById(self._e_event439);
        __o_rrpgObjs.removeEventListenerById(self._e_event438);
        __o_rrpgObjs.removeEventListenerById(self._e_event437);
        __o_rrpgObjs.removeEventListenerById(self._e_event436);
        __o_rrpgObjs.removeEventListenerById(self._e_event435);
        __o_rrpgObjs.removeEventListenerById(self._e_event434);
        __o_rrpgObjs.removeEventListenerById(self._e_event433);
        __o_rrpgObjs.removeEventListenerById(self._e_event432);
        __o_rrpgObjs.removeEventListenerById(self._e_event431);
        __o_rrpgObjs.removeEventListenerById(self._e_event430);
        __o_rrpgObjs.removeEventListenerById(self._e_event429);
        __o_rrpgObjs.removeEventListenerById(self._e_event428);
        __o_rrpgObjs.removeEventListenerById(self._e_event427);
        __o_rrpgObjs.removeEventListenerById(self._e_event426);
        __o_rrpgObjs.removeEventListenerById(self._e_event425);
        __o_rrpgObjs.removeEventListenerById(self._e_event424);
        __o_rrpgObjs.removeEventListenerById(self._e_event423);
        __o_rrpgObjs.removeEventListenerById(self._e_event422);
        __o_rrpgObjs.removeEventListenerById(self._e_event421);
        __o_rrpgObjs.removeEventListenerById(self._e_event420);
        __o_rrpgObjs.removeEventListenerById(self._e_event419);
        __o_rrpgObjs.removeEventListenerById(self._e_event418);
        __o_rrpgObjs.removeEventListenerById(self._e_event417);
        __o_rrpgObjs.removeEventListenerById(self._e_event416);
        __o_rrpgObjs.removeEventListenerById(self._e_event415);
        __o_rrpgObjs.removeEventListenerById(self._e_event414);
        __o_rrpgObjs.removeEventListenerById(self._e_event413);
        __o_rrpgObjs.removeEventListenerById(self._e_event412);
        __o_rrpgObjs.removeEventListenerById(self._e_event411);
        __o_rrpgObjs.removeEventListenerById(self._e_event410);
        __o_rrpgObjs.removeEventListenerById(self._e_event409);
        __o_rrpgObjs.removeEventListenerById(self._e_event408);
        __o_rrpgObjs.removeEventListenerById(self._e_event407);
        __o_rrpgObjs.removeEventListenerById(self._e_event406);
        __o_rrpgObjs.removeEventListenerById(self._e_event405);
        __o_rrpgObjs.removeEventListenerById(self._e_event404);
        __o_rrpgObjs.removeEventListenerById(self._e_event403);
        __o_rrpgObjs.removeEventListenerById(self._e_event402);
        __o_rrpgObjs.removeEventListenerById(self._e_event401);
        __o_rrpgObjs.removeEventListenerById(self._e_event400);
        __o_rrpgObjs.removeEventListenerById(self._e_event399);
        __o_rrpgObjs.removeEventListenerById(self._e_event398);
        __o_rrpgObjs.removeEventListenerById(self._e_event397);
        __o_rrpgObjs.removeEventListenerById(self._e_event396);
        __o_rrpgObjs.removeEventListenerById(self._e_event395);
        __o_rrpgObjs.removeEventListenerById(self._e_event394);
        __o_rrpgObjs.removeEventListenerById(self._e_event393);
        __o_rrpgObjs.removeEventListenerById(self._e_event392);
        __o_rrpgObjs.removeEventListenerById(self._e_event391);
        __o_rrpgObjs.removeEventListenerById(self._e_event390);
        __o_rrpgObjs.removeEventListenerById(self._e_event389);
        __o_rrpgObjs.removeEventListenerById(self._e_event388);
        __o_rrpgObjs.removeEventListenerById(self._e_event387);
        __o_rrpgObjs.removeEventListenerById(self._e_event386);
        __o_rrpgObjs.removeEventListenerById(self._e_event385);
        __o_rrpgObjs.removeEventListenerById(self._e_event384);
        __o_rrpgObjs.removeEventListenerById(self._e_event383);
        __o_rrpgObjs.removeEventListenerById(self._e_event382);
        __o_rrpgObjs.removeEventListenerById(self._e_event381);
        __o_rrpgObjs.removeEventListenerById(self._e_event380);
        __o_rrpgObjs.removeEventListenerById(self._e_event379);
        __o_rrpgObjs.removeEventListenerById(self._e_event378);
        __o_rrpgObjs.removeEventListenerById(self._e_event377);
        __o_rrpgObjs.removeEventListenerById(self._e_event376);
        __o_rrpgObjs.removeEventListenerById(self._e_event375);
        __o_rrpgObjs.removeEventListenerById(self._e_event374);
        __o_rrpgObjs.removeEventListenerById(self._e_event373);
        __o_rrpgObjs.removeEventListenerById(self._e_event372);
        __o_rrpgObjs.removeEventListenerById(self._e_event371);
        __o_rrpgObjs.removeEventListenerById(self._e_event370);
        __o_rrpgObjs.removeEventListenerById(self._e_event369);
        __o_rrpgObjs.removeEventListenerById(self._e_event368);
        __o_rrpgObjs.removeEventListenerById(self._e_event367);
        __o_rrpgObjs.removeEventListenerById(self._e_event366);
        __o_rrpgObjs.removeEventListenerById(self._e_event365);
        __o_rrpgObjs.removeEventListenerById(self._e_event364);
        __o_rrpgObjs.removeEventListenerById(self._e_event363);
        __o_rrpgObjs.removeEventListenerById(self._e_event362);
        __o_rrpgObjs.removeEventListenerById(self._e_event361);
        __o_rrpgObjs.removeEventListenerById(self._e_event360);
        __o_rrpgObjs.removeEventListenerById(self._e_event359);
        __o_rrpgObjs.removeEventListenerById(self._e_event358);
        __o_rrpgObjs.removeEventListenerById(self._e_event357);
        __o_rrpgObjs.removeEventListenerById(self._e_event356);
        __o_rrpgObjs.removeEventListenerById(self._e_event355);
        __o_rrpgObjs.removeEventListenerById(self._e_event354);
        __o_rrpgObjs.removeEventListenerById(self._e_event353);
        __o_rrpgObjs.removeEventListenerById(self._e_event352);
        __o_rrpgObjs.removeEventListenerById(self._e_event351);
        __o_rrpgObjs.removeEventListenerById(self._e_event350);
        __o_rrpgObjs.removeEventListenerById(self._e_event349);
        __o_rrpgObjs.removeEventListenerById(self._e_event348);
        __o_rrpgObjs.removeEventListenerById(self._e_event347);
        __o_rrpgObjs.removeEventListenerById(self._e_event346);
        __o_rrpgObjs.removeEventListenerById(self._e_event345);
        __o_rrpgObjs.removeEventListenerById(self._e_event344);
        __o_rrpgObjs.removeEventListenerById(self._e_event343);
        __o_rrpgObjs.removeEventListenerById(self._e_event342);
        __o_rrpgObjs.removeEventListenerById(self._e_event341);
        __o_rrpgObjs.removeEventListenerById(self._e_event340);
        __o_rrpgObjs.removeEventListenerById(self._e_event339);
        __o_rrpgObjs.removeEventListenerById(self._e_event338);
        __o_rrpgObjs.removeEventListenerById(self._e_event337);
        __o_rrpgObjs.removeEventListenerById(self._e_event336);
        __o_rrpgObjs.removeEventListenerById(self._e_event335);
        __o_rrpgObjs.removeEventListenerById(self._e_event334);
        __o_rrpgObjs.removeEventListenerById(self._e_event333);
        __o_rrpgObjs.removeEventListenerById(self._e_event332);
        __o_rrpgObjs.removeEventListenerById(self._e_event331);
        __o_rrpgObjs.removeEventListenerById(self._e_event330);
        __o_rrpgObjs.removeEventListenerById(self._e_event329);
        __o_rrpgObjs.removeEventListenerById(self._e_event328);
        __o_rrpgObjs.removeEventListenerById(self._e_event327);
        __o_rrpgObjs.removeEventListenerById(self._e_event326);
        __o_rrpgObjs.removeEventListenerById(self._e_event325);
        __o_rrpgObjs.removeEventListenerById(self._e_event324);
        __o_rrpgObjs.removeEventListenerById(self._e_event323);
        __o_rrpgObjs.removeEventListenerById(self._e_event322);
        __o_rrpgObjs.removeEventListenerById(self._e_event321);
        __o_rrpgObjs.removeEventListenerById(self._e_event320);
        __o_rrpgObjs.removeEventListenerById(self._e_event319);
        __o_rrpgObjs.removeEventListenerById(self._e_event318);
        __o_rrpgObjs.removeEventListenerById(self._e_event317);
        __o_rrpgObjs.removeEventListenerById(self._e_event316);
        __o_rrpgObjs.removeEventListenerById(self._e_event315);
        __o_rrpgObjs.removeEventListenerById(self._e_event314);
        __o_rrpgObjs.removeEventListenerById(self._e_event313);
        __o_rrpgObjs.removeEventListenerById(self._e_event312);
        __o_rrpgObjs.removeEventListenerById(self._e_event311);
        __o_rrpgObjs.removeEventListenerById(self._e_event310);
        __o_rrpgObjs.removeEventListenerById(self._e_event309);
        __o_rrpgObjs.removeEventListenerById(self._e_event308);
        __o_rrpgObjs.removeEventListenerById(self._e_event307);
        __o_rrpgObjs.removeEventListenerById(self._e_event306);
        __o_rrpgObjs.removeEventListenerById(self._e_event305);
        __o_rrpgObjs.removeEventListenerById(self._e_event304);
        __o_rrpgObjs.removeEventListenerById(self._e_event303);
        __o_rrpgObjs.removeEventListenerById(self._e_event302);
        __o_rrpgObjs.removeEventListenerById(self._e_event301);
        __o_rrpgObjs.removeEventListenerById(self._e_event300);
        __o_rrpgObjs.removeEventListenerById(self._e_event299);
        __o_rrpgObjs.removeEventListenerById(self._e_event298);
        __o_rrpgObjs.removeEventListenerById(self._e_event297);
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
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
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.radioButton75 ~= nil then self.radioButton75:destroy(); self.radioButton75 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.radioButton93 ~= nil then self.radioButton93:destroy(); self.radioButton93 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.radioButton173 ~= nil then self.radioButton173:destroy(); self.radioButton173 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit480 ~= nil then self.edit480:destroy(); self.edit480 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.radioButton35 ~= nil then self.radioButton35:destroy(); self.radioButton35 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.radioButton56 ~= nil then self.radioButton56:destroy(); self.radioButton56 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit457 ~= nil then self.edit457:destroy(); self.edit457 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.edit462 ~= nil then self.edit462:destroy(); self.edit462 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.radioButton88 ~= nil then self.radioButton88:destroy(); self.radioButton88 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.radioButton41 ~= nil then self.radioButton41:destroy(); self.radioButton41 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.radioButton168 ~= nil then self.radioButton168:destroy(); self.radioButton168 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.edit464 ~= nil then self.edit464:destroy(); self.edit464 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.radioButton143 ~= nil then self.radioButton143:destroy(); self.radioButton143 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.edit466 ~= nil then self.edit466:destroy(); self.edit466 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.radioButton29 ~= nil then self.radioButton29:destroy(); self.radioButton29 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.radioButton123 ~= nil then self.radioButton123:destroy(); self.radioButton123 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.radioButton85 ~= nil then self.radioButton85:destroy(); self.radioButton85 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.radioButton26 ~= nil then self.radioButton26:destroy(); self.radioButton26 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.edit446 ~= nil then self.edit446:destroy(); self.edit446 = nil; end;
        if self.radioButton22 ~= nil then self.radioButton22:destroy(); self.radioButton22 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit465 ~= nil then self.edit465:destroy(); self.edit465 = nil; end;
        if self.edit475 ~= nil then self.edit475:destroy(); self.edit475 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.radioButton103 ~= nil then self.radioButton103:destroy(); self.radioButton103 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.radioButton138 ~= nil then self.radioButton138:destroy(); self.radioButton138 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.radioButton70 ~= nil then self.radioButton70:destroy(); self.radioButton70 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.radioButton118 ~= nil then self.radioButton118:destroy(); self.radioButton118 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.radioButton23 ~= nil then self.radioButton23:destroy(); self.radioButton23 = nil; end;
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
        if self.radioButton152 ~= nil then self.radioButton152:destroy(); self.radioButton152 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.radioButton148 ~= nil then self.radioButton148:destroy(); self.radioButton148 = nil; end;
        if self.radioButton39 ~= nil then self.radioButton39:destroy(); self.radioButton39 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.radioButton130 ~= nil then self.radioButton130:destroy(); self.radioButton130 = nil; end;
        if self.radioButton133 ~= nil then self.radioButton133:destroy(); self.radioButton133 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit489 ~= nil then self.edit489:destroy(); self.edit489 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.radioButton81 ~= nil then self.radioButton81:destroy(); self.radioButton81 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
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
        if self.edit473 ~= nil then self.edit473:destroy(); self.edit473 = nil; end;
        if self.edit490 ~= nil then self.edit490:destroy(); self.edit490 = nil; end;
        if self.radioButton38 ~= nil then self.radioButton38:destroy(); self.radioButton38 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.radioButton134 ~= nil then self.radioButton134:destroy(); self.radioButton134 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit483 ~= nil then self.edit483:destroy(); self.edit483 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.radioButton120 ~= nil then self.radioButton120:destroy(); self.radioButton120 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.radioButton128 ~= nil then self.radioButton128:destroy(); self.radioButton128 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.radioButton51 ~= nil then self.radioButton51:destroy(); self.radioButton51 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.radioButton126 ~= nil then self.radioButton126:destroy(); self.radioButton126 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.radioButton172 ~= nil then self.radioButton172:destroy(); self.radioButton172 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.radioButton80 ~= nil then self.radioButton80:destroy(); self.radioButton80 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.radioButton52 ~= nil then self.radioButton52:destroy(); self.radioButton52 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.radioButton86 ~= nil then self.radioButton86:destroy(); self.radioButton86 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.radioButton182 ~= nil then self.radioButton182:destroy(); self.radioButton182 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.radioButton55 ~= nil then self.radioButton55:destroy(); self.radioButton55 = nil; end;
        if self.radioButton76 ~= nil then self.radioButton76:destroy(); self.radioButton76 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.radioButton77 ~= nil then self.radioButton77:destroy(); self.radioButton77 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.radioButton60 ~= nil then self.radioButton60:destroy(); self.radioButton60 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.radioButton135 ~= nil then self.radioButton135:destroy(); self.radioButton135 = nil; end;
        if self.radioButton179 ~= nil then self.radioButton179:destroy(); self.radioButton179 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.radioButton82 ~= nil then self.radioButton82:destroy(); self.radioButton82 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.radioButton94 ~= nil then self.radioButton94:destroy(); self.radioButton94 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.radioButton104 ~= nil then self.radioButton104:destroy(); self.radioButton104 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
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
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit492 ~= nil then self.edit492:destroy(); self.edit492 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.radioButton154 ~= nil then self.radioButton154:destroy(); self.radioButton154 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit479 ~= nil then self.edit479:destroy(); self.edit479 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.radioButton162 ~= nil then self.radioButton162:destroy(); self.radioButton162 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.edit454 ~= nil then self.edit454:destroy(); self.edit454 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.radioButton127 ~= nil then self.radioButton127:destroy(); self.radioButton127 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.radioButton59 ~= nil then self.radioButton59:destroy(); self.radioButton59 = nil; end;
        if self.radioButton73 ~= nil then self.radioButton73:destroy(); self.radioButton73 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.radioButton171 ~= nil then self.radioButton171:destroy(); self.radioButton171 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit467 ~= nil then self.edit467:destroy(); self.edit467 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.radioButton116 ~= nil then self.radioButton116:destroy(); self.radioButton116 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.edit451 ~= nil then self.edit451:destroy(); self.edit451 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.radioButton62 ~= nil then self.radioButton62:destroy(); self.radioButton62 = nil; end;
        if self.radioButton141 ~= nil then self.radioButton141:destroy(); self.radioButton141 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.radioButton102 ~= nil then self.radioButton102:destroy(); self.radioButton102 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.radioButton176 ~= nil then self.radioButton176:destroy(); self.radioButton176 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.radioButton174 ~= nil then self.radioButton174:destroy(); self.radioButton174 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit449 ~= nil then self.edit449:destroy(); self.edit449 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.radioButton90 ~= nil then self.radioButton90:destroy(); self.radioButton90 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit481 ~= nil then self.edit481:destroy(); self.edit481 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.radioButton185 ~= nil then self.radioButton185:destroy(); self.radioButton185 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.radioButton46 ~= nil then self.radioButton46:destroy(); self.radioButton46 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.frmACN2 ~= nil then self.frmACN2:destroy(); self.frmACN2 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.frmACN5 ~= nil then self.frmACN5:destroy(); self.frmACN5 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.radioButton151 ~= nil then self.radioButton151:destroy(); self.radioButton151 = nil; end;
        if self.radioButton164 ~= nil then self.radioButton164:destroy(); self.radioButton164 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.radioButton158 ~= nil then self.radioButton158:destroy(); self.radioButton158 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.edit474 ~= nil then self.edit474:destroy(); self.edit474 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.radioButton110 ~= nil then self.radioButton110:destroy(); self.radioButton110 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.radioButton170 ~= nil then self.radioButton170:destroy(); self.radioButton170 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.radioButton167 ~= nil then self.radioButton167:destroy(); self.radioButton167 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.radioButton160 ~= nil then self.radioButton160:destroy(); self.radioButton160 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.radioButton87 ~= nil then self.radioButton87:destroy(); self.radioButton87 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.radioButton183 ~= nil then self.radioButton183:destroy(); self.radioButton183 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.radioButton68 ~= nil then self.radioButton68:destroy(); self.radioButton68 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.radioButton184 ~= nil then self.radioButton184:destroy(); self.radioButton184 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.radioButton47 ~= nil then self.radioButton47:destroy(); self.radioButton47 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.radioButton65 ~= nil then self.radioButton65:destroy(); self.radioButton65 = nil; end;
        if self.radioButton83 ~= nil then self.radioButton83:destroy(); self.radioButton83 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.frmACN3 ~= nil then self.frmACN3:destroy(); self.frmACN3 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.radioButton161 ~= nil then self.radioButton161:destroy(); self.radioButton161 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit461 ~= nil then self.edit461:destroy(); self.edit461 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit487 ~= nil then self.edit487:destroy(); self.edit487 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.radioButton61 ~= nil then self.radioButton61:destroy(); self.radioButton61 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.radioButton78 ~= nil then self.radioButton78:destroy(); self.radioButton78 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.radioButton71 ~= nil then self.radioButton71:destroy(); self.radioButton71 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.radioButton58 ~= nil then self.radioButton58:destroy(); self.radioButton58 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit495 ~= nil then self.edit495:destroy(); self.edit495 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit470 ~= nil then self.edit470:destroy(); self.edit470 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.radioButton37 ~= nil then self.radioButton37:destroy(); self.radioButton37 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.radioButton178 ~= nil then self.radioButton178:destroy(); self.radioButton178 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.radioButton181 ~= nil then self.radioButton181:destroy(); self.radioButton181 = nil; end;
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
        if self.radioButton99 ~= nil then self.radioButton99:destroy(); self.radioButton99 = nil; end;
        if self.radioButton48 ~= nil then self.radioButton48:destroy(); self.radioButton48 = nil; end;
        if self.radioButton72 ~= nil then self.radioButton72:destroy(); self.radioButton72 = nil; end;
        if self.edit456 ~= nil then self.edit456:destroy(); self.edit456 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.radioButton63 ~= nil then self.radioButton63:destroy(); self.radioButton63 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.radioButton100 ~= nil then self.radioButton100:destroy(); self.radioButton100 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.radioButton54 ~= nil then self.radioButton54:destroy(); self.radioButton54 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit445 ~= nil then self.edit445:destroy(); self.edit445 = nil; end;
        if self.edit488 ~= nil then self.edit488:destroy(); self.edit488 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.radioButton153 ~= nil then self.radioButton153:destroy(); self.radioButton153 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.radioButton50 ~= nil then self.radioButton50:destroy(); self.radioButton50 = nil; end;
        if self.radioButton69 ~= nil then self.radioButton69:destroy(); self.radioButton69 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.radioButton79 ~= nil then self.radioButton79:destroy(); self.radioButton79 = nil; end;
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
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit472 ~= nil then self.edit472:destroy(); self.edit472 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit452 ~= nil then self.edit452:destroy(); self.edit452 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.radioButton109 ~= nil then self.radioButton109:destroy(); self.radioButton109 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.radioButton98 ~= nil then self.radioButton98:destroy(); self.radioButton98 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit460 ~= nil then self.edit460:destroy(); self.edit460 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.radioButton149 ~= nil then self.radioButton149:destroy(); self.radioButton149 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.radioButton144 ~= nil then self.radioButton144:destroy(); self.radioButton144 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.radioButton24 ~= nil then self.radioButton24:destroy(); self.radioButton24 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.radioButton66 ~= nil then self.radioButton66:destroy(); self.radioButton66 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.edit493 ~= nil then self.edit493:destroy(); self.edit493 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.radioButton18 ~= nil then self.radioButton18:destroy(); self.radioButton18 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.radioButton34 ~= nil then self.radioButton34:destroy(); self.radioButton34 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.edit491 ~= nil then self.edit491:destroy(); self.edit491 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.radioButton136 ~= nil then self.radioButton136:destroy(); self.radioButton136 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.radioButton114 ~= nil then self.radioButton114:destroy(); self.radioButton114 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.radioButton140 ~= nil then self.radioButton140:destroy(); self.radioButton140 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit469 ~= nil then self.edit469:destroy(); self.edit469 = nil; end;
        if self.radioButton117 ~= nil then self.radioButton117:destroy(); self.radioButton117 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.radioButton19 ~= nil then self.radioButton19:destroy(); self.radioButton19 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.radioButton84 ~= nil then self.radioButton84:destroy(); self.radioButton84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.radioButton97 ~= nil then self.radioButton97:destroy(); self.radioButton97 = nil; end;
        if self.radioButton105 ~= nil then self.radioButton105:destroy(); self.radioButton105 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.radioButton124 ~= nil then self.radioButton124:destroy(); self.radioButton124 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.radioButton67 ~= nil then self.radioButton67:destroy(); self.radioButton67 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.radioButton21 ~= nil then self.radioButton21:destroy(); self.radioButton21 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.radioButton145 ~= nil then self.radioButton145:destroy(); self.radioButton145 = nil; end;
        if self.radioButton155 ~= nil then self.radioButton155:destroy(); self.radioButton155 = nil; end;
        if self.radioButton186 ~= nil then self.radioButton186:destroy(); self.radioButton186 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.radioButton31 ~= nil then self.radioButton31:destroy(); self.radioButton31 = nil; end;
        if self.radioButton53 ~= nil then self.radioButton53:destroy(); self.radioButton53 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.radioButton115 ~= nil then self.radioButton115:destroy(); self.radioButton115 = nil; end;
        if self.radioButton119 ~= nil then self.radioButton119:destroy(); self.radioButton119 = nil; end;
        if self.radioButton165 ~= nil then self.radioButton165:destroy(); self.radioButton165 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.radioButton125 ~= nil then self.radioButton125:destroy(); self.radioButton125 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.radioButton49 ~= nil then self.radioButton49:destroy(); self.radioButton49 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.radioButton177 ~= nil then self.radioButton177:destroy(); self.radioButton177 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.radioButton101 ~= nil then self.radioButton101:destroy(); self.radioButton101 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.radioButton163 ~= nil then self.radioButton163:destroy(); self.radioButton163 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.radioButton180 ~= nil then self.radioButton180:destroy(); self.radioButton180 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.frmACN4 ~= nil then self.frmACN4:destroy(); self.frmACN4 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
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
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.frmACN1 ~= nil then self.frmACN1:destroy(); self.frmACN1 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.radioButton129 ~= nil then self.radioButton129:destroy(); self.radioButton129 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.radioButton40 ~= nil then self.radioButton40:destroy(); self.radioButton40 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.radioButton92 ~= nil then self.radioButton92:destroy(); self.radioButton92 = nil; end;
        if self.radioButton96 ~= nil then self.radioButton96:destroy(); self.radioButton96 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.radioButton112 ~= nil then self.radioButton112:destroy(); self.radioButton112 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.radioButton156 ~= nil then self.radioButton156:destroy(); self.radioButton156 = nil; end;
        if self.edit463 ~= nil then self.edit463:destroy(); self.edit463 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit450 ~= nil then self.edit450:destroy(); self.edit450 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.radioButton30 ~= nil then self.radioButton30:destroy(); self.radioButton30 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.radioButton91 ~= nil then self.radioButton91:destroy(); self.radioButton91 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.radioButton64 ~= nil then self.radioButton64:destroy(); self.radioButton64 = nil; end;
        if self.radioButton25 ~= nil then self.radioButton25:destroy(); self.radioButton25 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.radioButton108 ~= nil then self.radioButton108:destroy(); self.radioButton108 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.edit447 ~= nil then self.edit447:destroy(); self.edit447 = nil; end;
        if self.edit478 ~= nil then self.edit478:destroy(); self.edit478 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit496 ~= nil then self.edit496:destroy(); self.edit496 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.radioButton146 ~= nil then self.radioButton146:destroy(); self.radioButton146 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit448 ~= nil then self.edit448:destroy(); self.edit448 = nil; end;
        if self.radioButton175 ~= nil then self.radioButton175:destroy(); self.radioButton175 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.radioButton139 ~= nil then self.radioButton139:destroy(); self.radioButton139 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.edit468 ~= nil then self.edit468:destroy(); self.edit468 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.radioButton121 ~= nil then self.radioButton121:destroy(); self.radioButton121 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.radioButton137 ~= nil then self.radioButton137:destroy(); self.radioButton137 = nil; end;
        if self.radioButton150 ~= nil then self.radioButton150:destroy(); self.radioButton150 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.radioButton43 ~= nil then self.radioButton43:destroy(); self.radioButton43 = nil; end;
        if self.radioButton36 ~= nil then self.radioButton36:destroy(); self.radioButton36 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.edit494 ~= nil then self.edit494:destroy(); self.edit494 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.radioButton32 ~= nil then self.radioButton32:destroy(); self.radioButton32 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.radioButton95 ~= nil then self.radioButton95:destroy(); self.radioButton95 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.radioButton166 ~= nil then self.radioButton166:destroy(); self.radioButton166 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.radioButton74 ~= nil then self.radioButton74:destroy(); self.radioButton74 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.edit485 ~= nil then self.edit485:destroy(); self.edit485 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.radioButton157 ~= nil then self.radioButton157:destroy(); self.radioButton157 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit455 ~= nil then self.edit455:destroy(); self.edit455 = nil; end;
        if self.edit453 ~= nil then self.edit453:destroy(); self.edit453 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.radioButton111 ~= nil then self.radioButton111:destroy(); self.radioButton111 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.radioButton159 ~= nil then self.radioButton159:destroy(); self.radioButton159 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.edit484 ~= nil then self.edit484:destroy(); self.edit484 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.radioButton169 ~= nil then self.radioButton169:destroy(); self.radioButton169 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.radioButton57 ~= nil then self.radioButton57:destroy(); self.radioButton57 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.radioButton44 ~= nil then self.radioButton44:destroy(); self.radioButton44 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.radioButton142 ~= nil then self.radioButton142:destroy(); self.radioButton142 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.frmACN6 ~= nil then self.frmACN6:destroy(); self.frmACN6 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.radioButton147 ~= nil then self.radioButton147:destroy(); self.radioButton147 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.edit497 ~= nil then self.edit497:destroy(); self.edit497 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.radioButton27 ~= nil then self.radioButton27:destroy(); self.radioButton27 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.radioButton106 ~= nil then self.radioButton106:destroy(); self.radioButton106 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.radioButton33 ~= nil then self.radioButton33:destroy(); self.radioButton33 = nil; end;
        if self.radioButton107 ~= nil then self.radioButton107:destroy(); self.radioButton107 = nil; end;
        if self.edit486 ~= nil then self.edit486:destroy(); self.edit486 = nil; end;
        if self.radioButton131 ~= nil then self.radioButton131:destroy(); self.radioButton131 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit477 ~= nil then self.edit477:destroy(); self.edit477 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit482 ~= nil then self.edit482:destroy(); self.edit482 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.radioButton132 ~= nil then self.radioButton132:destroy(); self.radioButton132 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.radioButton20 ~= nil then self.radioButton20:destroy(); self.radioButton20 = nil; end;
        if self.radioButton28 ~= nil then self.radioButton28:destroy(); self.radioButton28 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.radioButton42 ~= nil then self.radioButton42:destroy(); self.radioButton42 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.radioButton113 ~= nil then self.radioButton113:destroy(); self.radioButton113 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.radioButton89 ~= nil then self.radioButton89:destroy(); self.radioButton89 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.radioButton122 ~= nil then self.radioButton122:destroy(); self.radioButton122 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.radioButton45 ~= nil then self.radioButton45:destroy(); self.radioButton45 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit471 ~= nil then self.edit471:destroy(); self.edit471 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
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

local _frmFichaACN = {
    newEditor = newfrmFichaACN, 
    new = newfrmFichaACN, 
    name = "frmFichaACN", 
    dataType = "Ambesek.Nefertyne.FichaACN", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha ACN", 
    description=""};

frmFichaACN = _frmFichaACN;
rrpg.registrarForm(_frmFichaACN);
rrpg.registrarDataType(_frmFichaACN);

return _frmFichaACN;
