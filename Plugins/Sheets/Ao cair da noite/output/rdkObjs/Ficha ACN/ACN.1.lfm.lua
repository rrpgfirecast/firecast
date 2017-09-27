require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmACN1()
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
    obj:setName("frmACN1");
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

    function obj:_releaseEvents()
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

        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.radioButton37 ~= nil then self.radioButton37:destroy(); self.radioButton37 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.radioButton75 ~= nil then self.radioButton75:destroy(); self.radioButton75 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.radioButton48 ~= nil then self.radioButton48:destroy(); self.radioButton48 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.radioButton72 ~= nil then self.radioButton72:destroy(); self.radioButton72 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.radioButton63 ~= nil then self.radioButton63:destroy(); self.radioButton63 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.radioButton35 ~= nil then self.radioButton35:destroy(); self.radioButton35 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.radioButton54 ~= nil then self.radioButton54:destroy(); self.radioButton54 = nil; end;
        if self.radioButton56 ~= nil then self.radioButton56:destroy(); self.radioButton56 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.radioButton50 ~= nil then self.radioButton50:destroy(); self.radioButton50 = nil; end;
        if self.radioButton69 ~= nil then self.radioButton69:destroy(); self.radioButton69 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.radioButton88 ~= nil then self.radioButton88:destroy(); self.radioButton88 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.radioButton79 ~= nil then self.radioButton79:destroy(); self.radioButton79 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.radioButton41 ~= nil then self.radioButton41:destroy(); self.radioButton41 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.radioButton29 ~= nil then self.radioButton29:destroy(); self.radioButton29 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.radioButton85 ~= nil then self.radioButton85:destroy(); self.radioButton85 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.radioButton26 ~= nil then self.radioButton26:destroy(); self.radioButton26 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.radioButton22 ~= nil then self.radioButton22:destroy(); self.radioButton22 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.radioButton24 ~= nil then self.radioButton24:destroy(); self.radioButton24 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.radioButton66 ~= nil then self.radioButton66:destroy(); self.radioButton66 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.radioButton70 ~= nil then self.radioButton70:destroy(); self.radioButton70 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.radioButton18 ~= nil then self.radioButton18:destroy(); self.radioButton18 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.radioButton23 ~= nil then self.radioButton23:destroy(); self.radioButton23 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.radioButton34 ~= nil then self.radioButton34:destroy(); self.radioButton34 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.radioButton39 ~= nil then self.radioButton39:destroy(); self.radioButton39 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.radioButton19 ~= nil then self.radioButton19:destroy(); self.radioButton19 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.radioButton81 ~= nil then self.radioButton81:destroy(); self.radioButton81 = nil; end;
        if self.radioButton84 ~= nil then self.radioButton84:destroy(); self.radioButton84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.radioButton38 ~= nil then self.radioButton38:destroy(); self.radioButton38 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.radioButton67 ~= nil then self.radioButton67:destroy(); self.radioButton67 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.radioButton51 ~= nil then self.radioButton51:destroy(); self.radioButton51 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.radioButton21 ~= nil then self.radioButton21:destroy(); self.radioButton21 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.radioButton80 ~= nil then self.radioButton80:destroy(); self.radioButton80 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.radioButton31 ~= nil then self.radioButton31:destroy(); self.radioButton31 = nil; end;
        if self.radioButton53 ~= nil then self.radioButton53:destroy(); self.radioButton53 = nil; end;
        if self.radioButton52 ~= nil then self.radioButton52:destroy(); self.radioButton52 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.radioButton86 ~= nil then self.radioButton86:destroy(); self.radioButton86 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.radioButton49 ~= nil then self.radioButton49:destroy(); self.radioButton49 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.radioButton55 ~= nil then self.radioButton55:destroy(); self.radioButton55 = nil; end;
        if self.radioButton76 ~= nil then self.radioButton76:destroy(); self.radioButton76 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.radioButton77 ~= nil then self.radioButton77:destroy(); self.radioButton77 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.radioButton60 ~= nil then self.radioButton60:destroy(); self.radioButton60 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.radioButton82 ~= nil then self.radioButton82:destroy(); self.radioButton82 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.radioButton40 ~= nil then self.radioButton40:destroy(); self.radioButton40 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.radioButton30 ~= nil then self.radioButton30:destroy(); self.radioButton30 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.radioButton64 ~= nil then self.radioButton64:destroy(); self.radioButton64 = nil; end;
        if self.radioButton25 ~= nil then self.radioButton25:destroy(); self.radioButton25 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.radioButton59 ~= nil then self.radioButton59:destroy(); self.radioButton59 = nil; end;
        if self.radioButton73 ~= nil then self.radioButton73:destroy(); self.radioButton73 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.radioButton62 ~= nil then self.radioButton62:destroy(); self.radioButton62 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.radioButton43 ~= nil then self.radioButton43:destroy(); self.radioButton43 = nil; end;
        if self.radioButton36 ~= nil then self.radioButton36:destroy(); self.radioButton36 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.radioButton32 ~= nil then self.radioButton32:destroy(); self.radioButton32 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.radioButton90 ~= nil then self.radioButton90:destroy(); self.radioButton90 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.radioButton74 ~= nil then self.radioButton74:destroy(); self.radioButton74 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.radioButton46 ~= nil then self.radioButton46:destroy(); self.radioButton46 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.radioButton57 ~= nil then self.radioButton57:destroy(); self.radioButton57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.radioButton44 ~= nil then self.radioButton44:destroy(); self.radioButton44 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.radioButton87 ~= nil then self.radioButton87:destroy(); self.radioButton87 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.radioButton27 ~= nil then self.radioButton27:destroy(); self.radioButton27 = nil; end;
        if self.radioButton68 ~= nil then self.radioButton68:destroy(); self.radioButton68 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.radioButton33 ~= nil then self.radioButton33:destroy(); self.radioButton33 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.radioButton47 ~= nil then self.radioButton47:destroy(); self.radioButton47 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.radioButton65 ~= nil then self.radioButton65:destroy(); self.radioButton65 = nil; end;
        if self.radioButton20 ~= nil then self.radioButton20:destroy(); self.radioButton20 = nil; end;
        if self.radioButton28 ~= nil then self.radioButton28:destroy(); self.radioButton28 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.radioButton42 ~= nil then self.radioButton42:destroy(); self.radioButton42 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.radioButton83 ~= nil then self.radioButton83:destroy(); self.radioButton83 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.radioButton89 ~= nil then self.radioButton89:destroy(); self.radioButton89 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.radioButton61 ~= nil then self.radioButton61:destroy(); self.radioButton61 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.radioButton78 ~= nil then self.radioButton78:destroy(); self.radioButton78 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.radioButton71 ~= nil then self.radioButton71:destroy(); self.radioButton71 = nil; end;
        if self.radioButton45 ~= nil then self.radioButton45:destroy(); self.radioButton45 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.radioButton58 ~= nil then self.radioButton58:destroy(); self.radioButton58 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmACN1 = {
    newEditor = newfrmACN1, 
    new = newfrmACN1, 
    name = "frmACN1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmACN1 = _frmACN1;
rrpg.registrarForm(_frmACN1);

return _frmACN1;
