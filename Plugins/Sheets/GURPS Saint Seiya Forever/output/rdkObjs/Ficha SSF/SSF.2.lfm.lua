require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSSF2()
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
    obj:setName("frmSSF2");
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
    obj.layout1:setWidth(325);
    obj.layout1:setHeight(615);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(325);
    obj.label1:setHeight(20);
    obj.label1:setText("     NOME            NH        AT     +  BN       DF        PT");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(325);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(85);
    obj.edit1:setHeight(25);
    obj.edit1:setField("pericia_1_1");
    obj.edit1:setName("edit1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("pericia_1_1");
    obj.dataLink1:setDefaultValue("Atuação");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(90);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(40);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(90);
    obj.label2:setTop(3);
    obj.label2:setWidth(40);
    obj.label2:setHeight(20);
    obj.label2:setField("nh_1_1");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(130);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("atr_1_1");
    obj.comboBox1:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox1:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("atr_1_1");
    obj.dataLink2:setDefaultValue("IQ");
    obj.dataLink2:setName("dataLink2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(180);
    obj.label3:setTop(3);
    obj.label3:setWidth(10);
    obj.label3:setHeight(20);
    obj.label3:setText("+");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(190);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setType("number");
    obj.edit2:setField("bonus_1_1");
    obj.edit2:setName("edit2");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setLeft(220);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(55);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("dificuldade_1_1");
    obj.comboBox2:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox2:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout2);
    obj.dataLink3:setField("dificuldade_1_1");
    obj.dataLink3:setDefaultValue("M");
    obj.dataLink3:setName("dataLink3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(275);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(25);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(275);
    obj.label4:setTop(3);
    obj.label4:setWidth(25);
    obj.label4:setHeight(20);
    obj.label4:setField("xp_1_1");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(300);
    obj.button1:setTop(3);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("R");
    obj.button1:setName("button1");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout2);
    obj.dataLink4:setFields({'atr_1_1', 'dificuldade_1_1', 'bonus_1_1', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink4:setName("dataLink4");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(55);
    obj.layout3:setWidth(325);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(5);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(85);
    obj.edit3:setHeight(25);
    obj.edit3:setField("pericia_1_2");
    obj.edit3:setName("edit3");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout3);
    obj.dataLink5:setField("pericia_1_2");
    obj.dataLink5:setDefaultValue("Arremesso");
    obj.dataLink5:setName("dataLink5");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setLeft(90);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(40);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(90);
    obj.label5:setTop(3);
    obj.label5:setWidth(40);
    obj.label5:setHeight(20);
    obj.label5:setField("nh_1_2");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout3);
    obj.comboBox3:setLeft(130);
    obj.comboBox3:setTop(0);
    obj.comboBox3:setWidth(50);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("atr_1_2");
    obj.comboBox3:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox3:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout3);
    obj.dataLink6:setField("atr_1_2");
    obj.dataLink6:setDefaultValue("DX");
    obj.dataLink6:setName("dataLink6");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(180);
    obj.label6:setTop(3);
    obj.label6:setWidth(10);
    obj.label6:setHeight(20);
    obj.label6:setText("+");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(190);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setType("number");
    obj.edit4:setField("bonus_1_2");
    obj.edit4:setName("edit4");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout3);
    obj.comboBox4:setLeft(220);
    obj.comboBox4:setTop(0);
    obj.comboBox4:setWidth(55);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("dificuldade_1_2");
    obj.comboBox4:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox4:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout3);
    obj.dataLink7:setField("dificuldade_1_2");
    obj.dataLink7:setDefaultValue("M");
    obj.dataLink7:setName("dataLink7");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setLeft(275);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(25);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(275);
    obj.label7:setTop(3);
    obj.label7:setWidth(25);
    obj.label7:setHeight(20);
    obj.label7:setField("xp_1_2");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setLeft(300);
    obj.button2:setTop(3);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("R");
    obj.button2:setName("button2");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout3);
    obj.dataLink8:setFields({'atr_1_2', 'dificuldade_1_2', 'bonus_1_2', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink8:setName("dataLink8");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(80);
    obj.layout4:setWidth(325);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setLeft(5);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(85);
    obj.edit5:setHeight(25);
    obj.edit5:setField("pericia_1_3");
    obj.edit5:setName("edit5");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout4);
    obj.dataLink9:setField("pericia_1_3");
    obj.dataLink9:setDefaultValue("Arma de Arremesso");
    obj.dataLink9:setName("dataLink9");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setLeft(90);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(90);
    obj.label8:setTop(3);
    obj.label8:setWidth(40);
    obj.label8:setHeight(20);
    obj.label8:setField("nh_1_3");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout4);
    obj.comboBox5:setLeft(130);
    obj.comboBox5:setTop(0);
    obj.comboBox5:setWidth(50);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("atr_1_3");
    obj.comboBox5:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox5:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout4);
    obj.dataLink10:setField("atr_1_3");
    obj.dataLink10:setDefaultValue("DX");
    obj.dataLink10:setName("dataLink10");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9:setLeft(180);
    obj.label9:setTop(3);
    obj.label9:setWidth(10);
    obj.label9:setHeight(20);
    obj.label9:setText("+");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setLeft(190);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(25);
    obj.edit6:setType("number");
    obj.edit6:setField("bonus_1_3");
    obj.edit6:setName("edit6");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout4);
    obj.comboBox6:setLeft(220);
    obj.comboBox6:setTop(0);
    obj.comboBox6:setWidth(55);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("dificuldade_1_3");
    obj.comboBox6:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox6:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout4);
    obj.dataLink11:setField("dificuldade_1_3");
    obj.dataLink11:setDefaultValue("F");
    obj.dataLink11:setName("dataLink11");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout4);
    obj.rectangle7:setLeft(275);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(25);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setLeft(275);
    obj.label10:setTop(3);
    obj.label10:setWidth(25);
    obj.label10:setHeight(20);
    obj.label10:setField("xp_1_3");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setLeft(300);
    obj.button3:setTop(3);
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setText("R");
    obj.button3:setName("button3");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout4);
    obj.dataLink12:setFields({'atr_1_3', 'dificuldade_1_3', 'bonus_1_3', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink12:setName("dataLink12");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(105);
    obj.layout5:setWidth(325);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setLeft(5);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(85);
    obj.edit7:setHeight(25);
    obj.edit7:setField("pericia_1_4");
    obj.edit7:setName("edit7");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout5);
    obj.dataLink13:setField("pericia_1_4");
    obj.dataLink13:setDefaultValue("Alquimia (Arma S.)");
    obj.dataLink13:setName("dataLink13");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout5);
    obj.rectangle8:setLeft(90);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout5);
    obj.label11:setLeft(90);
    obj.label11:setTop(3);
    obj.label11:setWidth(40);
    obj.label11:setHeight(20);
    obj.label11:setField("nh_1_4");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout5);
    obj.comboBox7:setLeft(130);
    obj.comboBox7:setTop(0);
    obj.comboBox7:setWidth(50);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("atr_1_4");
    obj.comboBox7:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox7:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout5);
    obj.dataLink14:setField("atr_1_4");
    obj.dataLink14:setDefaultValue("IQ");
    obj.dataLink14:setName("dataLink14");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout5);
    obj.label12:setLeft(180);
    obj.label12:setTop(3);
    obj.label12:setWidth(10);
    obj.label12:setHeight(20);
    obj.label12:setText("+");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setLeft(190);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setType("number");
    obj.edit8:setField("bonus_1_4");
    obj.edit8:setName("edit8");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout5);
    obj.comboBox8:setLeft(220);
    obj.comboBox8:setTop(0);
    obj.comboBox8:setWidth(55);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("dificuldade_1_4");
    obj.comboBox8:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox8:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout5);
    obj.dataLink15:setField("dificuldade_1_4");
    obj.dataLink15:setDefaultValue("MD");
    obj.dataLink15:setName("dataLink15");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout5);
    obj.rectangle9:setLeft(275);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(25);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13:setLeft(275);
    obj.label13:setTop(3);
    obj.label13:setWidth(25);
    obj.label13:setHeight(20);
    obj.label13:setField("xp_1_4");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout5);
    obj.button4:setLeft(300);
    obj.button4:setTop(3);
    obj.button4:setWidth(20);
    obj.button4:setHeight(20);
    obj.button4:setText("R");
    obj.button4:setName("button4");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout5);
    obj.dataLink16:setFields({'atr_1_4', 'dificuldade_1_4', 'bonus_1_4', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink16:setName("dataLink16");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(130);
    obj.layout6:setWidth(325);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setLeft(5);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(85);
    obj.edit9:setHeight(25);
    obj.edit9:setField("pericia_1_5");
    obj.edit9:setName("edit9");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout6);
    obj.dataLink17:setField("pericia_1_5");
    obj.dataLink17:setDefaultValue("Armeiro (Arma S.)");
    obj.dataLink17:setName("dataLink17");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout6);
    obj.rectangle10:setLeft(90);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout6);
    obj.label14:setLeft(90);
    obj.label14:setTop(3);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setField("nh_1_5");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout6);
    obj.comboBox9:setLeft(130);
    obj.comboBox9:setTop(0);
    obj.comboBox9:setWidth(50);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setField("atr_1_5");
    obj.comboBox9:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox9:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout6);
    obj.dataLink18:setField("atr_1_5");
    obj.dataLink18:setDefaultValue("IQ");
    obj.dataLink18:setName("dataLink18");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout6);
    obj.label15:setLeft(180);
    obj.label15:setTop(3);
    obj.label15:setWidth(10);
    obj.label15:setHeight(20);
    obj.label15:setText("+");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(190);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setType("number");
    obj.edit10:setField("bonus_1_5");
    obj.edit10:setName("edit10");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout6);
    obj.comboBox10:setLeft(220);
    obj.comboBox10:setTop(0);
    obj.comboBox10:setWidth(55);
    obj.comboBox10:setHeight(25);
    obj.comboBox10:setField("dificuldade_1_5");
    obj.comboBox10:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox10:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox10:setName("comboBox10");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout6);
    obj.dataLink19:setField("dificuldade_1_5");
    obj.dataLink19:setDefaultValue("M");
    obj.dataLink19:setName("dataLink19");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout6);
    obj.rectangle11:setLeft(275);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(25);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout6);
    obj.label16:setLeft(275);
    obj.label16:setTop(3);
    obj.label16:setWidth(25);
    obj.label16:setHeight(20);
    obj.label16:setField("xp_1_5");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout6);
    obj.button5:setLeft(300);
    obj.button5:setTop(3);
    obj.button5:setWidth(20);
    obj.button5:setHeight(20);
    obj.button5:setText("R");
    obj.button5:setName("button5");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout6);
    obj.dataLink20:setFields({'atr_1_5', 'dificuldade_1_5', 'bonus_1_5', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink20:setName("dataLink20");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(155);
    obj.layout7:setWidth(325);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setLeft(5);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(85);
    obj.edit11:setHeight(25);
    obj.edit11:setField("pericia_1_6");
    obj.edit11:setName("edit11");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout7);
    obj.dataLink21:setField("pericia_1_6");
    obj.dataLink21:setDefaultValue("Acrobacia");
    obj.dataLink21:setName("dataLink21");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout7);
    obj.rectangle12:setLeft(90);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout7);
    obj.label17:setLeft(90);
    obj.label17:setTop(3);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setField("nh_1_6");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.comboBox11 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout7);
    obj.comboBox11:setLeft(130);
    obj.comboBox11:setTop(0);
    obj.comboBox11:setWidth(50);
    obj.comboBox11:setHeight(25);
    obj.comboBox11:setField("atr_1_6");
    obj.comboBox11:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox11:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox11:setName("comboBox11");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout7);
    obj.dataLink22:setField("atr_1_6");
    obj.dataLink22:setDefaultValue("DX");
    obj.dataLink22:setName("dataLink22");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout7);
    obj.label18:setLeft(180);
    obj.label18:setTop(3);
    obj.label18:setWidth(10);
    obj.label18:setHeight(20);
    obj.label18:setText("+");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout7);
    obj.edit12:setLeft(190);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setField("bonus_1_6");
    obj.edit12:setName("edit12");

    obj.comboBox12 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout7);
    obj.comboBox12:setLeft(220);
    obj.comboBox12:setTop(0);
    obj.comboBox12:setWidth(55);
    obj.comboBox12:setHeight(25);
    obj.comboBox12:setField("dificuldade_1_6");
    obj.comboBox12:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox12:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox12:setName("comboBox12");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout7);
    obj.dataLink23:setField("dificuldade_1_6");
    obj.dataLink23:setDefaultValue("D");
    obj.dataLink23:setName("dataLink23");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout7);
    obj.rectangle13:setLeft(275);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(25);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout7);
    obj.label19:setLeft(275);
    obj.label19:setTop(3);
    obj.label19:setWidth(25);
    obj.label19:setHeight(20);
    obj.label19:setField("xp_1_6");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout7);
    obj.button6:setLeft(300);
    obj.button6:setTop(3);
    obj.button6:setWidth(20);
    obj.button6:setHeight(20);
    obj.button6:setText("R");
    obj.button6:setName("button6");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout7);
    obj.dataLink24:setFields({'atr_1_6', 'dificuldade_1_6', 'bonus_1_6', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink24:setName("dataLink24");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(180);
    obj.layout8:setWidth(325);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout8);
    obj.edit13:setLeft(5);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(85);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pericia_1_7");
    obj.edit13:setName("edit13");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout8);
    obj.dataLink25:setField("pericia_1_7");
    obj.dataLink25:setDefaultValue("Bloqueio Mental");
    obj.dataLink25:setName("dataLink25");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout8);
    obj.rectangle14:setLeft(90);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(40);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout8);
    obj.label20:setLeft(90);
    obj.label20:setTop(3);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setField("nh_1_7");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.comboBox13 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout8);
    obj.comboBox13:setLeft(130);
    obj.comboBox13:setTop(0);
    obj.comboBox13:setWidth(50);
    obj.comboBox13:setHeight(25);
    obj.comboBox13:setField("atr_1_7");
    obj.comboBox13:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox13:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox13:setName("comboBox13");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout8);
    obj.dataLink26:setField("atr_1_7");
    obj.dataLink26:setDefaultValue("VT");
    obj.dataLink26:setName("dataLink26");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout8);
    obj.label21:setLeft(180);
    obj.label21:setTop(3);
    obj.label21:setWidth(10);
    obj.label21:setHeight(20);
    obj.label21:setText("+");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout8);
    obj.edit14:setLeft(190);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setField("bonus_1_7");
    obj.edit14:setName("edit14");

    obj.comboBox14 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout8);
    obj.comboBox14:setLeft(220);
    obj.comboBox14:setTop(0);
    obj.comboBox14:setWidth(55);
    obj.comboBox14:setHeight(25);
    obj.comboBox14:setField("dificuldade_1_7");
    obj.comboBox14:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox14:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox14:setName("comboBox14");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout8);
    obj.dataLink27:setField("dificuldade_1_7");
    obj.dataLink27:setDefaultValue("M");
    obj.dataLink27:setName("dataLink27");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout8);
    obj.rectangle15:setLeft(275);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(25);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout8);
    obj.label22:setLeft(275);
    obj.label22:setTop(3);
    obj.label22:setWidth(25);
    obj.label22:setHeight(20);
    obj.label22:setField("xp_1_7");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout8);
    obj.button7:setLeft(300);
    obj.button7:setTop(3);
    obj.button7:setWidth(20);
    obj.button7:setHeight(20);
    obj.button7:setText("R");
    obj.button7:setName("button7");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout8);
    obj.dataLink28:setFields({'atr_1_7', 'dificuldade_1_7', 'bonus_1_7', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink28:setName("dataLink28");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(205);
    obj.layout9:setWidth(325);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout9);
    obj.edit15:setLeft(5);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(85);
    obj.edit15:setHeight(25);
    obj.edit15:setField("pericia_1_8");
    obj.edit15:setName("edit15");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout9);
    obj.dataLink29:setField("pericia_1_8");
    obj.dataLink29:setDefaultValue("Briga");
    obj.dataLink29:setName("dataLink29");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout9);
    obj.rectangle16:setLeft(90);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout9);
    obj.label23:setLeft(90);
    obj.label23:setTop(3);
    obj.label23:setWidth(40);
    obj.label23:setHeight(20);
    obj.label23:setField("nh_1_8");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.comboBox15 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout9);
    obj.comboBox15:setLeft(130);
    obj.comboBox15:setTop(0);
    obj.comboBox15:setWidth(50);
    obj.comboBox15:setHeight(25);
    obj.comboBox15:setField("atr_1_8");
    obj.comboBox15:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox15:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout9);
    obj.dataLink30:setField("atr_1_8");
    obj.dataLink30:setDefaultValue("DX");
    obj.dataLink30:setName("dataLink30");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout9);
    obj.label24:setLeft(180);
    obj.label24:setTop(3);
    obj.label24:setWidth(10);
    obj.label24:setHeight(20);
    obj.label24:setText("+");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout9);
    obj.edit16:setLeft(190);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setField("bonus_1_8");
    obj.edit16:setName("edit16");

    obj.comboBox16 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout9);
    obj.comboBox16:setLeft(220);
    obj.comboBox16:setTop(0);
    obj.comboBox16:setWidth(55);
    obj.comboBox16:setHeight(25);
    obj.comboBox16:setField("dificuldade_1_8");
    obj.comboBox16:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox16:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox16:setName("comboBox16");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout9);
    obj.dataLink31:setField("dificuldade_1_8");
    obj.dataLink31:setDefaultValue("F");
    obj.dataLink31:setName("dataLink31");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout9);
    obj.rectangle17:setLeft(275);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(25);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout9);
    obj.label25:setLeft(275);
    obj.label25:setTop(3);
    obj.label25:setWidth(25);
    obj.label25:setHeight(20);
    obj.label25:setField("xp_1_8");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout9);
    obj.button8:setLeft(300);
    obj.button8:setTop(3);
    obj.button8:setWidth(20);
    obj.button8:setHeight(20);
    obj.button8:setText("R");
    obj.button8:setName("button8");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout9);
    obj.dataLink32:setFields({'atr_1_8', 'dificuldade_1_8', 'bonus_1_8', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink32:setName("dataLink32");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(230);
    obj.layout10:setWidth(325);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout10);
    obj.edit17:setLeft(5);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(85);
    obj.edit17:setHeight(25);
    obj.edit17:setField("pericia_1_9");
    obj.edit17:setName("edit17");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout10);
    obj.dataLink33:setField("pericia_1_9");
    obj.dataLink33:setDefaultValue("Caratê");
    obj.dataLink33:setName("dataLink33");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout10);
    obj.rectangle18:setLeft(90);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout10);
    obj.label26:setLeft(90);
    obj.label26:setTop(3);
    obj.label26:setWidth(40);
    obj.label26:setHeight(20);
    obj.label26:setField("nh_1_9");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.comboBox17 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout10);
    obj.comboBox17:setLeft(130);
    obj.comboBox17:setTop(0);
    obj.comboBox17:setWidth(50);
    obj.comboBox17:setHeight(25);
    obj.comboBox17:setField("atr_1_9");
    obj.comboBox17:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox17:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout10);
    obj.dataLink34:setField("atr_1_9");
    obj.dataLink34:setDefaultValue("DX");
    obj.dataLink34:setName("dataLink34");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout10);
    obj.label27:setLeft(180);
    obj.label27:setTop(3);
    obj.label27:setWidth(10);
    obj.label27:setHeight(20);
    obj.label27:setText("+");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout10);
    obj.edit18:setLeft(190);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setField("bonus_1_9");
    obj.edit18:setName("edit18");

    obj.comboBox18 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout10);
    obj.comboBox18:setLeft(220);
    obj.comboBox18:setTop(0);
    obj.comboBox18:setWidth(55);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("dificuldade_1_9");
    obj.comboBox18:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox18:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox18:setName("comboBox18");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout10);
    obj.dataLink35:setField("dificuldade_1_9");
    obj.dataLink35:setDefaultValue("D");
    obj.dataLink35:setName("dataLink35");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout10);
    obj.rectangle19:setLeft(275);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(25);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout10);
    obj.label28:setLeft(275);
    obj.label28:setTop(3);
    obj.label28:setWidth(25);
    obj.label28:setHeight(20);
    obj.label28:setField("xp_1_9");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout10);
    obj.button9:setLeft(300);
    obj.button9:setTop(3);
    obj.button9:setWidth(20);
    obj.button9:setHeight(20);
    obj.button9:setText("R");
    obj.button9:setName("button9");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout10);
    obj.dataLink36:setFields({'atr_1_9', 'dificuldade_1_9', 'bonus_1_9', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink36:setName("dataLink36");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(255);
    obj.layout11:setWidth(325);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout11);
    obj.edit19:setLeft(5);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(85);
    obj.edit19:setHeight(25);
    obj.edit19:setField("pericia_1_10");
    obj.edit19:setName("edit19");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout11);
    obj.dataLink37:setField("pericia_1_10");
    obj.dataLink37:setDefaultValue("Cativar");
    obj.dataLink37:setName("dataLink37");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout11);
    obj.rectangle20:setLeft(90);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout11);
    obj.label29:setLeft(90);
    obj.label29:setTop(3);
    obj.label29:setWidth(40);
    obj.label29:setHeight(20);
    obj.label29:setField("nh_1_10");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.comboBox19 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout11);
    obj.comboBox19:setLeft(130);
    obj.comboBox19:setTop(0);
    obj.comboBox19:setWidth(50);
    obj.comboBox19:setHeight(25);
    obj.comboBox19:setField("atr_1_10");
    obj.comboBox19:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox19:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox19:setName("comboBox19");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout11);
    obj.dataLink38:setField("atr_1_10");
    obj.dataLink38:setDefaultValue("VT");
    obj.dataLink38:setName("dataLink38");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout11);
    obj.label30:setLeft(180);
    obj.label30:setTop(3);
    obj.label30:setWidth(10);
    obj.label30:setHeight(20);
    obj.label30:setText("+");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout11);
    obj.edit20:setLeft(190);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setField("bonus_1_10");
    obj.edit20:setName("edit20");

    obj.comboBox20 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout11);
    obj.comboBox20:setLeft(220);
    obj.comboBox20:setTop(0);
    obj.comboBox20:setWidth(55);
    obj.comboBox20:setHeight(25);
    obj.comboBox20:setField("dificuldade_1_10");
    obj.comboBox20:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox20:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox20:setName("comboBox20");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout11);
    obj.dataLink39:setField("dificuldade_1_10");
    obj.dataLink39:setDefaultValue("D");
    obj.dataLink39:setName("dataLink39");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setLeft(275);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(25);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout11);
    obj.label31:setLeft(275);
    obj.label31:setTop(3);
    obj.label31:setWidth(25);
    obj.label31:setHeight(20);
    obj.label31:setField("xp_1_10");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout11);
    obj.button10:setLeft(300);
    obj.button10:setTop(3);
    obj.button10:setWidth(20);
    obj.button10:setHeight(20);
    obj.button10:setText("R");
    obj.button10:setName("button10");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout11);
    obj.dataLink40:setFields({'atr_1_10', 'dificuldade_1_10', 'bonus_1_10', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink40:setName("dataLink40");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(280);
    obj.layout12:setWidth(325);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout12);
    obj.edit21:setLeft(5);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(85);
    obj.edit21:setHeight(25);
    obj.edit21:setField("pericia_1_11");
    obj.edit21:setName("edit21");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout12);
    obj.dataLink41:setField("pericia_1_11");
    obj.dataLink41:setDefaultValue("Cartografia");
    obj.dataLink41:setName("dataLink41");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout12);
    obj.rectangle22:setLeft(90);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout12);
    obj.label32:setLeft(90);
    obj.label32:setTop(3);
    obj.label32:setWidth(40);
    obj.label32:setHeight(20);
    obj.label32:setField("nh_1_11");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.comboBox21 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout12);
    obj.comboBox21:setLeft(130);
    obj.comboBox21:setTop(0);
    obj.comboBox21:setWidth(50);
    obj.comboBox21:setHeight(25);
    obj.comboBox21:setField("atr_1_11");
    obj.comboBox21:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox21:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox21:setName("comboBox21");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout12);
    obj.dataLink42:setField("atr_1_11");
    obj.dataLink42:setDefaultValue("IQ");
    obj.dataLink42:setName("dataLink42");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout12);
    obj.label33:setLeft(180);
    obj.label33:setTop(3);
    obj.label33:setWidth(10);
    obj.label33:setHeight(20);
    obj.label33:setText("+");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout12);
    obj.edit22:setLeft(190);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setField("bonus_1_11");
    obj.edit22:setName("edit22");

    obj.comboBox22 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout12);
    obj.comboBox22:setLeft(220);
    obj.comboBox22:setTop(0);
    obj.comboBox22:setWidth(55);
    obj.comboBox22:setHeight(25);
    obj.comboBox22:setField("dificuldade_1_11");
    obj.comboBox22:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox22:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox22:setName("comboBox22");

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout12);
    obj.dataLink43:setField("dificuldade_1_11");
    obj.dataLink43:setDefaultValue("M");
    obj.dataLink43:setName("dataLink43");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout12);
    obj.rectangle23:setLeft(275);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(25);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout12);
    obj.label34:setLeft(275);
    obj.label34:setTop(3);
    obj.label34:setWidth(25);
    obj.label34:setHeight(20);
    obj.label34:setField("xp_1_11");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout12);
    obj.button11:setLeft(300);
    obj.button11:setTop(3);
    obj.button11:setWidth(20);
    obj.button11:setHeight(20);
    obj.button11:setText("R");
    obj.button11:setName("button11");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout12);
    obj.dataLink44:setFields({'atr_1_11', 'dificuldade_1_11', 'bonus_1_11', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink44:setName("dataLink44");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(305);
    obj.layout13:setWidth(325);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout13);
    obj.edit23:setLeft(5);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(85);
    obj.edit23:setHeight(25);
    obj.edit23:setField("pericia_1_12");
    obj.edit23:setName("edit23");

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout13);
    obj.dataLink45:setField("pericia_1_12");
    obj.dataLink45:setDefaultValue("Canto");
    obj.dataLink45:setName("dataLink45");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout13);
    obj.rectangle24:setLeft(90);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(40);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout13);
    obj.label35:setLeft(90);
    obj.label35:setTop(3);
    obj.label35:setWidth(40);
    obj.label35:setHeight(20);
    obj.label35:setField("nh_1_12");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.comboBox23 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout13);
    obj.comboBox23:setLeft(130);
    obj.comboBox23:setTop(0);
    obj.comboBox23:setWidth(50);
    obj.comboBox23:setHeight(25);
    obj.comboBox23:setField("atr_1_12");
    obj.comboBox23:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox23:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox23:setName("comboBox23");

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout13);
    obj.dataLink46:setField("atr_1_12");
    obj.dataLink46:setDefaultValue("HT");
    obj.dataLink46:setName("dataLink46");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout13);
    obj.label36:setLeft(180);
    obj.label36:setTop(3);
    obj.label36:setWidth(10);
    obj.label36:setHeight(20);
    obj.label36:setText("+");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout13);
    obj.edit24:setLeft(190);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setField("bonus_1_12");
    obj.edit24:setName("edit24");

    obj.comboBox24 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout13);
    obj.comboBox24:setLeft(220);
    obj.comboBox24:setTop(0);
    obj.comboBox24:setWidth(55);
    obj.comboBox24:setHeight(25);
    obj.comboBox24:setField("dificuldade_1_12");
    obj.comboBox24:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox24:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox24:setName("comboBox24");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout13);
    obj.dataLink47:setField("dificuldade_1_12");
    obj.dataLink47:setDefaultValue("F");
    obj.dataLink47:setName("dataLink47");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout13);
    obj.rectangle25:setLeft(275);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(25);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout13);
    obj.label37:setLeft(275);
    obj.label37:setTop(3);
    obj.label37:setWidth(25);
    obj.label37:setHeight(20);
    obj.label37:setField("xp_1_12");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout13);
    obj.button12:setLeft(300);
    obj.button12:setTop(3);
    obj.button12:setWidth(20);
    obj.button12:setHeight(20);
    obj.button12:setText("R");
    obj.button12:setName("button12");

    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout13);
    obj.dataLink48:setFields({'atr_1_12', 'dificuldade_1_12', 'bonus_1_12', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink48:setName("dataLink48");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(330);
    obj.layout14:setWidth(325);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout14);
    obj.edit25:setLeft(5);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(85);
    obj.edit25:setHeight(25);
    obj.edit25:setField("pericia_1_13");
    obj.edit25:setName("edit25");

    obj.dataLink49 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout14);
    obj.dataLink49:setField("pericia_1_13");
    obj.dataLink49:setDefaultValue("Controle Corporal");
    obj.dataLink49:setName("dataLink49");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout14);
    obj.rectangle26:setLeft(90);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(40);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout14);
    obj.label38:setLeft(90);
    obj.label38:setTop(3);
    obj.label38:setWidth(40);
    obj.label38:setHeight(20);
    obj.label38:setField("nh_1_13");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.comboBox25 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout14);
    obj.comboBox25:setLeft(130);
    obj.comboBox25:setTop(0);
    obj.comboBox25:setWidth(50);
    obj.comboBox25:setHeight(25);
    obj.comboBox25:setField("atr_1_13");
    obj.comboBox25:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox25:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox25:setName("comboBox25");

    obj.dataLink50 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout14);
    obj.dataLink50:setField("atr_1_13");
    obj.dataLink50:setDefaultValue("HT");
    obj.dataLink50:setName("dataLink50");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout14);
    obj.label39:setLeft(180);
    obj.label39:setTop(3);
    obj.label39:setWidth(10);
    obj.label39:setHeight(20);
    obj.label39:setText("+");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout14);
    obj.edit26:setLeft(190);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setField("bonus_1_13");
    obj.edit26:setName("edit26");

    obj.comboBox26 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout14);
    obj.comboBox26:setLeft(220);
    obj.comboBox26:setTop(0);
    obj.comboBox26:setWidth(55);
    obj.comboBox26:setHeight(25);
    obj.comboBox26:setField("dificuldade_1_13");
    obj.comboBox26:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox26:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox26:setName("comboBox26");

    obj.dataLink51 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout14);
    obj.dataLink51:setField("dificuldade_1_13");
    obj.dataLink51:setDefaultValue("MD");
    obj.dataLink51:setName("dataLink51");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout14);
    obj.rectangle27:setLeft(275);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(25);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout14);
    obj.label40:setLeft(275);
    obj.label40:setTop(3);
    obj.label40:setWidth(25);
    obj.label40:setHeight(20);
    obj.label40:setField("xp_1_13");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout14);
    obj.button13:setLeft(300);
    obj.button13:setTop(3);
    obj.button13:setWidth(20);
    obj.button13:setHeight(20);
    obj.button13:setText("R");
    obj.button13:setName("button13");

    obj.dataLink52 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout14);
    obj.dataLink52:setFields({'atr_1_13', 'dificuldade_1_13', 'bonus_1_13', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink52:setName("dataLink52");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(355);
    obj.layout15:setWidth(325);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout15);
    obj.edit27:setLeft(5);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(85);
    obj.edit27:setHeight(25);
    obj.edit27:setField("pericia_1_14");
    obj.edit27:setName("edit27");

    obj.dataLink53 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout15);
    obj.dataLink53:setField("pericia_1_14");
    obj.dataLink53:setDefaultValue("Controle da Respiração");
    obj.dataLink53:setName("dataLink53");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout15);
    obj.rectangle28:setLeft(90);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(40);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout15);
    obj.label41:setLeft(90);
    obj.label41:setTop(3);
    obj.label41:setWidth(40);
    obj.label41:setHeight(20);
    obj.label41:setField("nh_1_14");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.comboBox27 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout15);
    obj.comboBox27:setLeft(130);
    obj.comboBox27:setTop(0);
    obj.comboBox27:setWidth(50);
    obj.comboBox27:setHeight(25);
    obj.comboBox27:setField("atr_1_14");
    obj.comboBox27:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox27:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox27:setName("comboBox27");

    obj.dataLink54 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout15);
    obj.dataLink54:setField("atr_1_14");
    obj.dataLink54:setDefaultValue("HT");
    obj.dataLink54:setName("dataLink54");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout15);
    obj.label42:setLeft(180);
    obj.label42:setTop(3);
    obj.label42:setWidth(10);
    obj.label42:setHeight(20);
    obj.label42:setText("+");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout15);
    obj.edit28:setLeft(190);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setField("bonus_1_14");
    obj.edit28:setName("edit28");

    obj.comboBox28 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout15);
    obj.comboBox28:setLeft(220);
    obj.comboBox28:setTop(0);
    obj.comboBox28:setWidth(55);
    obj.comboBox28:setHeight(25);
    obj.comboBox28:setField("dificuldade_1_14");
    obj.comboBox28:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox28:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox28:setName("comboBox28");

    obj.dataLink55 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout15);
    obj.dataLink55:setField("dificuldade_1_14");
    obj.dataLink55:setDefaultValue("D");
    obj.dataLink55:setName("dataLink55");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout15);
    obj.rectangle29:setLeft(275);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(25);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout15);
    obj.label43:setLeft(275);
    obj.label43:setTop(3);
    obj.label43:setWidth(25);
    obj.label43:setHeight(20);
    obj.label43:setField("xp_1_14");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout15);
    obj.button14:setLeft(300);
    obj.button14:setTop(3);
    obj.button14:setWidth(20);
    obj.button14:setHeight(20);
    obj.button14:setText("R");
    obj.button14:setName("button14");

    obj.dataLink56 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout15);
    obj.dataLink56:setFields({'atr_1_14', 'dificuldade_1_14', 'bonus_1_14', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink56:setName("dataLink56");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout1);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(380);
    obj.layout16:setWidth(325);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout16);
    obj.edit29:setLeft(5);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(85);
    obj.edit29:setHeight(25);
    obj.edit29:setField("pericia_1_15");
    obj.edit29:setName("edit29");

    obj.dataLink57 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout16);
    obj.dataLink57:setField("pericia_1_15");
    obj.dataLink57:setDefaultValue("Conhecimento de Ervas");
    obj.dataLink57:setName("dataLink57");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout16);
    obj.rectangle30:setLeft(90);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(40);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout16);
    obj.label44:setLeft(90);
    obj.label44:setTop(3);
    obj.label44:setWidth(40);
    obj.label44:setHeight(20);
    obj.label44:setField("nh_1_15");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.comboBox29 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout16);
    obj.comboBox29:setLeft(130);
    obj.comboBox29:setTop(0);
    obj.comboBox29:setWidth(50);
    obj.comboBox29:setHeight(25);
    obj.comboBox29:setField("atr_1_15");
    obj.comboBox29:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox29:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox29:setName("comboBox29");

    obj.dataLink58 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout16);
    obj.dataLink58:setField("atr_1_15");
    obj.dataLink58:setDefaultValue("IQ");
    obj.dataLink58:setName("dataLink58");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout16);
    obj.label45:setLeft(180);
    obj.label45:setTop(3);
    obj.label45:setWidth(10);
    obj.label45:setHeight(20);
    obj.label45:setText("+");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout16);
    obj.edit30:setLeft(190);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setField("bonus_1_15");
    obj.edit30:setName("edit30");

    obj.comboBox30 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout16);
    obj.comboBox30:setLeft(220);
    obj.comboBox30:setTop(0);
    obj.comboBox30:setWidth(55);
    obj.comboBox30:setHeight(25);
    obj.comboBox30:setField("dificuldade_1_15");
    obj.comboBox30:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox30:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox30:setName("comboBox30");

    obj.dataLink59 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout16);
    obj.dataLink59:setField("dificuldade_1_15");
    obj.dataLink59:setDefaultValue("MD");
    obj.dataLink59:setName("dataLink59");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout16);
    obj.rectangle31:setLeft(275);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(25);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout16);
    obj.label46:setLeft(275);
    obj.label46:setTop(3);
    obj.label46:setWidth(25);
    obj.label46:setHeight(20);
    obj.label46:setField("xp_1_15");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout16);
    obj.button15:setLeft(300);
    obj.button15:setTop(3);
    obj.button15:setWidth(20);
    obj.button15:setHeight(20);
    obj.button15:setText("R");
    obj.button15:setName("button15");

    obj.dataLink60 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout16);
    obj.dataLink60:setFields({'atr_1_15', 'dificuldade_1_15', 'bonus_1_15', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink60:setName("dataLink60");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout1);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(405);
    obj.layout17:setWidth(325);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout17);
    obj.edit31:setLeft(5);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(85);
    obj.edit31:setHeight(25);
    obj.edit31:setField("pericia_1_16");
    obj.edit31:setName("edit31");

    obj.dataLink61 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout17);
    obj.dataLink61:setField("pericia_1_16");
    obj.dataLink61:setDefaultValue("Detecção de Mentiras");
    obj.dataLink61:setName("dataLink61");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout17);
    obj.rectangle32:setLeft(90);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(40);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout17);
    obj.label47:setLeft(90);
    obj.label47:setTop(3);
    obj.label47:setWidth(40);
    obj.label47:setHeight(20);
    obj.label47:setField("nh_1_16");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.comboBox31 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout17);
    obj.comboBox31:setLeft(130);
    obj.comboBox31:setTop(0);
    obj.comboBox31:setWidth(50);
    obj.comboBox31:setHeight(25);
    obj.comboBox31:setField("atr_1_16");
    obj.comboBox31:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox31:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox31:setName("comboBox31");

    obj.dataLink62 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout17);
    obj.dataLink62:setField("atr_1_16");
    obj.dataLink62:setDefaultValue("PR");
    obj.dataLink62:setName("dataLink62");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout17);
    obj.label48:setLeft(180);
    obj.label48:setTop(3);
    obj.label48:setWidth(10);
    obj.label48:setHeight(20);
    obj.label48:setText("+");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout17);
    obj.edit32:setLeft(190);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setField("bonus_1_16");
    obj.edit32:setName("edit32");

    obj.comboBox32 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout17);
    obj.comboBox32:setLeft(220);
    obj.comboBox32:setTop(0);
    obj.comboBox32:setWidth(55);
    obj.comboBox32:setHeight(25);
    obj.comboBox32:setField("dificuldade_1_16");
    obj.comboBox32:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox32:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox32:setName("comboBox32");

    obj.dataLink63 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout17);
    obj.dataLink63:setField("dificuldade_1_16");
    obj.dataLink63:setDefaultValue("D");
    obj.dataLink63:setName("dataLink63");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout17);
    obj.rectangle33:setLeft(275);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(25);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout17);
    obj.label49:setLeft(275);
    obj.label49:setTop(3);
    obj.label49:setWidth(25);
    obj.label49:setHeight(20);
    obj.label49:setField("xp_1_16");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout17);
    obj.button16:setLeft(300);
    obj.button16:setTop(3);
    obj.button16:setWidth(20);
    obj.button16:setHeight(20);
    obj.button16:setText("R");
    obj.button16:setName("button16");

    obj.dataLink64 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout17);
    obj.dataLink64:setFields({'atr_1_16', 'dificuldade_1_16', 'bonus_1_16', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink64:setName("dataLink64");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout1);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(430);
    obj.layout18:setWidth(325);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout18);
    obj.edit33:setLeft(5);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(85);
    obj.edit33:setHeight(25);
    obj.edit33:setField("pericia_1_17");
    obj.edit33:setName("edit33");

    obj.dataLink65 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout18);
    obj.dataLink65:setField("pericia_1_17");
    obj.dataLink65:setDefaultValue("Diplomacia");
    obj.dataLink65:setName("dataLink65");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout18);
    obj.rectangle34:setLeft(90);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(40);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout18);
    obj.label50:setLeft(90);
    obj.label50:setTop(3);
    obj.label50:setWidth(40);
    obj.label50:setHeight(20);
    obj.label50:setField("nh_1_17");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.comboBox33 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout18);
    obj.comboBox33:setLeft(130);
    obj.comboBox33:setTop(0);
    obj.comboBox33:setWidth(50);
    obj.comboBox33:setHeight(25);
    obj.comboBox33:setField("atr_1_17");
    obj.comboBox33:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox33:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox33:setName("comboBox33");

    obj.dataLink66 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout18);
    obj.dataLink66:setField("atr_1_17");
    obj.dataLink66:setDefaultValue("IQ");
    obj.dataLink66:setName("dataLink66");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout18);
    obj.label51:setLeft(180);
    obj.label51:setTop(3);
    obj.label51:setWidth(10);
    obj.label51:setHeight(20);
    obj.label51:setText("+");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout18);
    obj.edit34:setLeft(190);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setField("bonus_1_17");
    obj.edit34:setName("edit34");

    obj.comboBox34 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout18);
    obj.comboBox34:setLeft(220);
    obj.comboBox34:setTop(0);
    obj.comboBox34:setWidth(55);
    obj.comboBox34:setHeight(25);
    obj.comboBox34:setField("dificuldade_1_17");
    obj.comboBox34:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox34:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox34:setName("comboBox34");

    obj.dataLink67 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout18);
    obj.dataLink67:setField("dificuldade_1_17");
    obj.dataLink67:setDefaultValue("D");
    obj.dataLink67:setName("dataLink67");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout18);
    obj.rectangle35:setLeft(275);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(25);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout18);
    obj.label52:setLeft(275);
    obj.label52:setTop(3);
    obj.label52:setWidth(25);
    obj.label52:setHeight(20);
    obj.label52:setField("xp_1_17");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout18);
    obj.button17:setLeft(300);
    obj.button17:setTop(3);
    obj.button17:setWidth(20);
    obj.button17:setHeight(20);
    obj.button17:setText("R");
    obj.button17:setName("button17");

    obj.dataLink68 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout18);
    obj.dataLink68:setFields({'atr_1_17', 'dificuldade_1_17', 'bonus_1_17', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink68:setName("dataLink68");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout1);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(455);
    obj.layout19:setWidth(325);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout19);
    obj.edit35:setLeft(5);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(85);
    obj.edit35:setHeight(25);
    obj.edit35:setField("pericia_1_18");
    obj.edit35:setName("edit35");

    obj.dataLink69 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout19);
    obj.dataLink69:setField("pericia_1_18");
    obj.dataLink69:setDefaultValue("Diagnose");
    obj.dataLink69:setName("dataLink69");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout19);
    obj.rectangle36:setLeft(90);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(40);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout19);
    obj.label53:setLeft(90);
    obj.label53:setTop(3);
    obj.label53:setWidth(40);
    obj.label53:setHeight(20);
    obj.label53:setField("nh_1_18");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.comboBox35 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.layout19);
    obj.comboBox35:setLeft(130);
    obj.comboBox35:setTop(0);
    obj.comboBox35:setWidth(50);
    obj.comboBox35:setHeight(25);
    obj.comboBox35:setField("atr_1_18");
    obj.comboBox35:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox35:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox35:setName("comboBox35");

    obj.dataLink70 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout19);
    obj.dataLink70:setField("atr_1_18");
    obj.dataLink70:setDefaultValue("IQ");
    obj.dataLink70:setName("dataLink70");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout19);
    obj.label54:setLeft(180);
    obj.label54:setTop(3);
    obj.label54:setWidth(10);
    obj.label54:setHeight(20);
    obj.label54:setText("+");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout19);
    obj.edit36:setLeft(190);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setField("bonus_1_18");
    obj.edit36:setName("edit36");

    obj.comboBox36 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.layout19);
    obj.comboBox36:setLeft(220);
    obj.comboBox36:setTop(0);
    obj.comboBox36:setWidth(55);
    obj.comboBox36:setHeight(25);
    obj.comboBox36:setField("dificuldade_1_18");
    obj.comboBox36:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox36:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox36:setName("comboBox36");

    obj.dataLink71 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout19);
    obj.dataLink71:setField("dificuldade_1_18");
    obj.dataLink71:setDefaultValue("D");
    obj.dataLink71:setName("dataLink71");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout19);
    obj.rectangle37:setLeft(275);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(25);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout19);
    obj.label55:setLeft(275);
    obj.label55:setTop(3);
    obj.label55:setWidth(25);
    obj.label55:setHeight(20);
    obj.label55:setField("xp_1_18");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout19);
    obj.button18:setLeft(300);
    obj.button18:setTop(3);
    obj.button18:setWidth(20);
    obj.button18:setHeight(20);
    obj.button18:setText("R");
    obj.button18:setName("button18");

    obj.dataLink72 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout19);
    obj.dataLink72:setFields({'atr_1_18', 'dificuldade_1_18', 'bonus_1_18', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink72:setName("dataLink72");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout1);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(480);
    obj.layout20:setWidth(325);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout20);
    obj.edit37:setLeft(5);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(85);
    obj.edit37:setHeight(25);
    obj.edit37:setField("pericia_1_19");
    obj.edit37:setName("edit37");

    obj.dataLink73 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout20);
    obj.dataLink73:setField("pericia_1_19");
    obj.dataLink73:setDefaultValue("Dissimulação");
    obj.dataLink73:setName("dataLink73");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout20);
    obj.rectangle38:setLeft(90);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(40);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout20);
    obj.label56:setLeft(90);
    obj.label56:setTop(3);
    obj.label56:setWidth(40);
    obj.label56:setHeight(20);
    obj.label56:setField("nh_1_19");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.comboBox37 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.layout20);
    obj.comboBox37:setLeft(130);
    obj.comboBox37:setTop(0);
    obj.comboBox37:setWidth(50);
    obj.comboBox37:setHeight(25);
    obj.comboBox37:setField("atr_1_19");
    obj.comboBox37:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox37:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox37:setName("comboBox37");

    obj.dataLink74 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout20);
    obj.dataLink74:setField("atr_1_19");
    obj.dataLink74:setDefaultValue("IQ");
    obj.dataLink74:setName("dataLink74");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout20);
    obj.label57:setLeft(180);
    obj.label57:setTop(3);
    obj.label57:setWidth(10);
    obj.label57:setHeight(20);
    obj.label57:setText("+");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout20);
    obj.edit38:setLeft(190);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setField("bonus_1_19");
    obj.edit38:setName("edit38");

    obj.comboBox38 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox38:setParent(obj.layout20);
    obj.comboBox38:setLeft(220);
    obj.comboBox38:setTop(0);
    obj.comboBox38:setWidth(55);
    obj.comboBox38:setHeight(25);
    obj.comboBox38:setField("dificuldade_1_19");
    obj.comboBox38:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox38:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox38:setName("comboBox38");

    obj.dataLink75 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout20);
    obj.dataLink75:setField("dificuldade_1_19");
    obj.dataLink75:setDefaultValue("M");
    obj.dataLink75:setName("dataLink75");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout20);
    obj.rectangle39:setLeft(275);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(25);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout20);
    obj.label58:setLeft(275);
    obj.label58:setTop(3);
    obj.label58:setWidth(25);
    obj.label58:setHeight(20);
    obj.label58:setField("xp_1_19");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout20);
    obj.button19:setLeft(300);
    obj.button19:setTop(3);
    obj.button19:setWidth(20);
    obj.button19:setHeight(20);
    obj.button19:setText("R");
    obj.button19:setName("button19");

    obj.dataLink76 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout20);
    obj.dataLink76:setFields({'atr_1_19', 'dificuldade_1_19', 'bonus_1_19', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink76:setName("dataLink76");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout1);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(505);
    obj.layout21:setWidth(325);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout21);
    obj.edit39:setLeft(5);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(85);
    obj.edit39:setHeight(25);
    obj.edit39:setField("pericia_1_20");
    obj.edit39:setName("edit39");

    obj.dataLink77 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout21);
    obj.dataLink77:setField("pericia_1_20");
    obj.dataLink77:setDefaultValue("Escalada");
    obj.dataLink77:setName("dataLink77");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout21);
    obj.rectangle40:setLeft(90);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(40);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout21);
    obj.label59:setLeft(90);
    obj.label59:setTop(3);
    obj.label59:setWidth(40);
    obj.label59:setHeight(20);
    obj.label59:setField("nh_1_20");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.comboBox39 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox39:setParent(obj.layout21);
    obj.comboBox39:setLeft(130);
    obj.comboBox39:setTop(0);
    obj.comboBox39:setWidth(50);
    obj.comboBox39:setHeight(25);
    obj.comboBox39:setField("atr_1_20");
    obj.comboBox39:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox39:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox39:setName("comboBox39");

    obj.dataLink78 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout21);
    obj.dataLink78:setField("atr_1_20");
    obj.dataLink78:setDefaultValue("DX");
    obj.dataLink78:setName("dataLink78");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout21);
    obj.label60:setLeft(180);
    obj.label60:setTop(3);
    obj.label60:setWidth(10);
    obj.label60:setHeight(20);
    obj.label60:setText("+");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout21);
    obj.edit40:setLeft(190);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(30);
    obj.edit40:setHeight(25);
    obj.edit40:setType("number");
    obj.edit40:setField("bonus_1_20");
    obj.edit40:setName("edit40");

    obj.comboBox40 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox40:setParent(obj.layout21);
    obj.comboBox40:setLeft(220);
    obj.comboBox40:setTop(0);
    obj.comboBox40:setWidth(55);
    obj.comboBox40:setHeight(25);
    obj.comboBox40:setField("dificuldade_1_20");
    obj.comboBox40:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox40:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox40:setName("comboBox40");

    obj.dataLink79 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout21);
    obj.dataLink79:setField("dificuldade_1_20");
    obj.dataLink79:setDefaultValue("M");
    obj.dataLink79:setName("dataLink79");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout21);
    obj.rectangle41:setLeft(275);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(25);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout21);
    obj.label61:setLeft(275);
    obj.label61:setTop(3);
    obj.label61:setWidth(25);
    obj.label61:setHeight(20);
    obj.label61:setField("xp_1_20");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout21);
    obj.button20:setLeft(300);
    obj.button20:setTop(3);
    obj.button20:setWidth(20);
    obj.button20:setHeight(20);
    obj.button20:setText("R");
    obj.button20:setName("button20");

    obj.dataLink80 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout21);
    obj.dataLink80:setFields({'atr_1_20', 'dificuldade_1_20', 'bonus_1_20', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink80:setName("dataLink80");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout1);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(550);
    obj.layout22:setWidth(250);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout22);
    obj.label62:setLeft(5);
    obj.label62:setTop(5);
    obj.label62:setWidth(80);
    obj.label62:setHeight(20);
    obj.label62:setText("Modificador");
    obj.label62:setFontSize(10);
    obj.label62:setName("label62");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout22);
    obj.edit41:setLeft(60);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(40);
    obj.edit41:setHeight(25);
    obj.edit41:setField("mod");
    obj.edit41:setName("edit41");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox1);
    obj.layout23:setLeft(330);
    obj.layout23:setTop(0);
    obj.layout23:setWidth(325);
    obj.layout23:setHeight(615);
    obj.layout23:setName("layout23");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout23);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(15);
    obj.rectangle42:setYradius(15);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout23);
    obj.label63:setLeft(0);
    obj.label63:setTop(5);
    obj.label63:setWidth(325);
    obj.label63:setHeight(20);
    obj.label63:setText("     NOME            NH        AT     +  BN       DF        PT");
    obj.label63:setName("label63");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(30);
    obj.layout24:setWidth(325);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout24);
    obj.edit42:setLeft(5);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(85);
    obj.edit42:setHeight(25);
    obj.edit42:setField("pericia_2_1");
    obj.edit42:setName("edit42");

    obj.dataLink81 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout24);
    obj.dataLink81:setField("pericia_2_1");
    obj.dataLink81:setDefaultValue("Estratégia");
    obj.dataLink81:setName("dataLink81");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout24);
    obj.rectangle43:setLeft(90);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(40);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout24);
    obj.label64:setLeft(90);
    obj.label64:setTop(3);
    obj.label64:setWidth(40);
    obj.label64:setHeight(20);
    obj.label64:setField("nh_2_1");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.comboBox41 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox41:setParent(obj.layout24);
    obj.comboBox41:setLeft(130);
    obj.comboBox41:setTop(0);
    obj.comboBox41:setWidth(50);
    obj.comboBox41:setHeight(25);
    obj.comboBox41:setField("atr_2_1");
    obj.comboBox41:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox41:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox41:setName("comboBox41");

    obj.dataLink82 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout24);
    obj.dataLink82:setField("atr_2_1");
    obj.dataLink82:setDefaultValue("IQ");
    obj.dataLink82:setName("dataLink82");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout24);
    obj.label65:setLeft(180);
    obj.label65:setTop(3);
    obj.label65:setWidth(10);
    obj.label65:setHeight(20);
    obj.label65:setText("+");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout24);
    obj.edit43:setLeft(190);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setField("bonus_2_1");
    obj.edit43:setName("edit43");

    obj.comboBox42 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox42:setParent(obj.layout24);
    obj.comboBox42:setLeft(220);
    obj.comboBox42:setTop(0);
    obj.comboBox42:setWidth(55);
    obj.comboBox42:setHeight(25);
    obj.comboBox42:setField("dificuldade_2_1");
    obj.comboBox42:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox42:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox42:setName("comboBox42");

    obj.dataLink83 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout24);
    obj.dataLink83:setField("dificuldade_2_1");
    obj.dataLink83:setDefaultValue("D");
    obj.dataLink83:setName("dataLink83");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout24);
    obj.rectangle44:setLeft(275);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(25);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout24);
    obj.label66:setLeft(275);
    obj.label66:setTop(3);
    obj.label66:setWidth(25);
    obj.label66:setHeight(20);
    obj.label66:setField("xp_2_1");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout24);
    obj.button21:setLeft(300);
    obj.button21:setTop(3);
    obj.button21:setWidth(20);
    obj.button21:setHeight(20);
    obj.button21:setText("R");
    obj.button21:setName("button21");

    obj.dataLink84 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout24);
    obj.dataLink84:setFields({'atr_2_1', 'dificuldade_2_1', 'bonus_2_1', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink84:setName("dataLink84");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(55);
    obj.layout25:setWidth(325);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout25);
    obj.edit44:setLeft(5);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(85);
    obj.edit44:setHeight(25);
    obj.edit44:setField("pericia_2_2");
    obj.edit44:setName("edit44");

    obj.dataLink85 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout25);
    obj.dataLink85:setField("pericia_2_2");
    obj.dataLink85:setDefaultValue("Escudo");
    obj.dataLink85:setName("dataLink85");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout25);
    obj.rectangle45:setLeft(90);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(40);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout25);
    obj.label67:setLeft(90);
    obj.label67:setTop(3);
    obj.label67:setWidth(40);
    obj.label67:setHeight(20);
    obj.label67:setField("nh_2_2");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.comboBox43 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox43:setParent(obj.layout25);
    obj.comboBox43:setLeft(130);
    obj.comboBox43:setTop(0);
    obj.comboBox43:setWidth(50);
    obj.comboBox43:setHeight(25);
    obj.comboBox43:setField("atr_2_2");
    obj.comboBox43:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox43:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox43:setName("comboBox43");

    obj.dataLink86 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout25);
    obj.dataLink86:setField("atr_2_2");
    obj.dataLink86:setDefaultValue("DX");
    obj.dataLink86:setName("dataLink86");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout25);
    obj.label68:setLeft(180);
    obj.label68:setTop(3);
    obj.label68:setWidth(10);
    obj.label68:setHeight(20);
    obj.label68:setText("+");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout25);
    obj.edit45:setLeft(190);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(30);
    obj.edit45:setHeight(25);
    obj.edit45:setType("number");
    obj.edit45:setField("bonus_2_2");
    obj.edit45:setName("edit45");

    obj.comboBox44 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox44:setParent(obj.layout25);
    obj.comboBox44:setLeft(220);
    obj.comboBox44:setTop(0);
    obj.comboBox44:setWidth(55);
    obj.comboBox44:setHeight(25);
    obj.comboBox44:setField("dificuldade_2_2");
    obj.comboBox44:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox44:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox44:setName("comboBox44");

    obj.dataLink87 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout25);
    obj.dataLink87:setField("dificuldade_2_2");
    obj.dataLink87:setDefaultValue("F");
    obj.dataLink87:setName("dataLink87");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout25);
    obj.rectangle46:setLeft(275);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(25);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout25);
    obj.label69:setLeft(275);
    obj.label69:setTop(3);
    obj.label69:setWidth(25);
    obj.label69:setHeight(20);
    obj.label69:setField("xp_2_2");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout25);
    obj.button22:setLeft(300);
    obj.button22:setTop(3);
    obj.button22:setWidth(20);
    obj.button22:setHeight(20);
    obj.button22:setText("R");
    obj.button22:setName("button22");

    obj.dataLink88 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout25);
    obj.dataLink88:setFields({'atr_2_2', 'dificuldade_2_2', 'bonus_2_2', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink88:setName("dataLink88");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout23);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(80);
    obj.layout26:setWidth(325);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout26);
    obj.edit46:setLeft(5);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(85);
    obj.edit46:setHeight(25);
    obj.edit46:setField("pericia_2_3");
    obj.edit46:setName("edit46");

    obj.dataLink89 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout26);
    obj.dataLink89:setField("pericia_2_3");
    obj.dataLink89:setDefaultValue("Fisiologia");
    obj.dataLink89:setName("dataLink89");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout26);
    obj.rectangle47:setLeft(90);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(40);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout26);
    obj.label70:setLeft(90);
    obj.label70:setTop(3);
    obj.label70:setWidth(40);
    obj.label70:setHeight(20);
    obj.label70:setField("nh_2_3");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.comboBox45 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox45:setParent(obj.layout26);
    obj.comboBox45:setLeft(130);
    obj.comboBox45:setTop(0);
    obj.comboBox45:setWidth(50);
    obj.comboBox45:setHeight(25);
    obj.comboBox45:setField("atr_2_3");
    obj.comboBox45:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox45:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox45:setName("comboBox45");

    obj.dataLink90 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout26);
    obj.dataLink90:setField("atr_2_3");
    obj.dataLink90:setDefaultValue("IQ");
    obj.dataLink90:setName("dataLink90");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout26);
    obj.label71:setLeft(180);
    obj.label71:setTop(3);
    obj.label71:setWidth(10);
    obj.label71:setHeight(20);
    obj.label71:setText("+");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout26);
    obj.edit47:setLeft(190);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setType("number");
    obj.edit47:setField("bonus_2_3");
    obj.edit47:setName("edit47");

    obj.comboBox46 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox46:setParent(obj.layout26);
    obj.comboBox46:setLeft(220);
    obj.comboBox46:setTop(0);
    obj.comboBox46:setWidth(55);
    obj.comboBox46:setHeight(25);
    obj.comboBox46:setField("dificuldade_2_3");
    obj.comboBox46:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox46:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox46:setName("comboBox46");

    obj.dataLink91 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout26);
    obj.dataLink91:setField("dificuldade_2_3");
    obj.dataLink91:setDefaultValue("D");
    obj.dataLink91:setName("dataLink91");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout26);
    obj.rectangle48:setLeft(275);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(25);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout26);
    obj.label72:setLeft(275);
    obj.label72:setTop(3);
    obj.label72:setWidth(25);
    obj.label72:setHeight(20);
    obj.label72:setField("xp_2_3");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout26);
    obj.button23:setLeft(300);
    obj.button23:setTop(3);
    obj.button23:setWidth(20);
    obj.button23:setHeight(20);
    obj.button23:setText("R");
    obj.button23:setName("button23");

    obj.dataLink92 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout26);
    obj.dataLink92:setFields({'atr_2_3', 'dificuldade_2_3', 'bonus_2_3', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink92:setName("dataLink92");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout23);
    obj.layout27:setLeft(0);
    obj.layout27:setTop(105);
    obj.layout27:setWidth(325);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout27);
    obj.edit48:setLeft(5);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(85);
    obj.edit48:setHeight(25);
    obj.edit48:setField("pericia_2_4");
    obj.edit48:setName("edit48");

    obj.dataLink93 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout27);
    obj.dataLink93:setField("pericia_2_4");
    obj.dataLink93:setDefaultValue("Força Mental");
    obj.dataLink93:setName("dataLink93");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout27);
    obj.rectangle49:setLeft(90);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(40);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout27);
    obj.label73:setLeft(90);
    obj.label73:setTop(3);
    obj.label73:setWidth(40);
    obj.label73:setHeight(20);
    obj.label73:setField("nh_2_4");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.comboBox47 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox47:setParent(obj.layout27);
    obj.comboBox47:setLeft(130);
    obj.comboBox47:setTop(0);
    obj.comboBox47:setWidth(50);
    obj.comboBox47:setHeight(25);
    obj.comboBox47:setField("atr_2_4");
    obj.comboBox47:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox47:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox47:setName("comboBox47");

    obj.dataLink94 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout27);
    obj.dataLink94:setField("atr_2_4");
    obj.dataLink94:setDefaultValue("VT");
    obj.dataLink94:setName("dataLink94");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout27);
    obj.label74:setLeft(180);
    obj.label74:setTop(3);
    obj.label74:setWidth(10);
    obj.label74:setHeight(20);
    obj.label74:setText("+");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout27);
    obj.edit49:setLeft(190);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(30);
    obj.edit49:setHeight(25);
    obj.edit49:setType("number");
    obj.edit49:setField("bonus_2_4");
    obj.edit49:setName("edit49");

    obj.comboBox48 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox48:setParent(obj.layout27);
    obj.comboBox48:setLeft(220);
    obj.comboBox48:setTop(0);
    obj.comboBox48:setWidth(55);
    obj.comboBox48:setHeight(25);
    obj.comboBox48:setField("dificuldade_2_4");
    obj.comboBox48:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox48:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox48:setName("comboBox48");

    obj.dataLink95 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout27);
    obj.dataLink95:setField("dificuldade_2_4");
    obj.dataLink95:setDefaultValue("F");
    obj.dataLink95:setName("dataLink95");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout27);
    obj.rectangle50:setLeft(275);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(25);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout27);
    obj.label75:setLeft(275);
    obj.label75:setTop(3);
    obj.label75:setWidth(25);
    obj.label75:setHeight(20);
    obj.label75:setField("xp_2_4");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout27);
    obj.button24:setLeft(300);
    obj.button24:setTop(3);
    obj.button24:setWidth(20);
    obj.button24:setHeight(20);
    obj.button24:setText("R");
    obj.button24:setName("button24");

    obj.dataLink96 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout27);
    obj.dataLink96:setFields({'atr_2_4', 'dificuldade_2_4', 'bonus_2_4', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink96:setName("dataLink96");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout23);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(130);
    obj.layout28:setWidth(325);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout28);
    obj.edit50:setLeft(5);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(85);
    obj.edit50:setHeight(25);
    obj.edit50:setField("pericia_2_5");
    obj.edit50:setName("edit50");

    obj.dataLink97 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout28);
    obj.dataLink97:setField("pericia_2_5");
    obj.dataLink97:setDefaultValue("Furtividade");
    obj.dataLink97:setName("dataLink97");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout28);
    obj.rectangle51:setLeft(90);
    obj.rectangle51:setTop(0);
    obj.rectangle51:setWidth(40);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout28);
    obj.label76:setLeft(90);
    obj.label76:setTop(3);
    obj.label76:setWidth(40);
    obj.label76:setHeight(20);
    obj.label76:setField("nh_2_5");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.comboBox49 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox49:setParent(obj.layout28);
    obj.comboBox49:setLeft(130);
    obj.comboBox49:setTop(0);
    obj.comboBox49:setWidth(50);
    obj.comboBox49:setHeight(25);
    obj.comboBox49:setField("atr_2_5");
    obj.comboBox49:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox49:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox49:setName("comboBox49");

    obj.dataLink98 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout28);
    obj.dataLink98:setField("atr_2_5");
    obj.dataLink98:setDefaultValue("DX");
    obj.dataLink98:setName("dataLink98");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout28);
    obj.label77:setLeft(180);
    obj.label77:setTop(3);
    obj.label77:setWidth(10);
    obj.label77:setHeight(20);
    obj.label77:setText("+");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout28);
    obj.edit51:setLeft(190);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(30);
    obj.edit51:setHeight(25);
    obj.edit51:setType("number");
    obj.edit51:setField("bonus_2_5");
    obj.edit51:setName("edit51");

    obj.comboBox50 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox50:setParent(obj.layout28);
    obj.comboBox50:setLeft(220);
    obj.comboBox50:setTop(0);
    obj.comboBox50:setWidth(55);
    obj.comboBox50:setHeight(25);
    obj.comboBox50:setField("dificuldade_2_5");
    obj.comboBox50:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox50:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox50:setName("comboBox50");

    obj.dataLink99 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout28);
    obj.dataLink99:setField("dificuldade_2_5");
    obj.dataLink99:setDefaultValue("M");
    obj.dataLink99:setName("dataLink99");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout28);
    obj.rectangle52:setLeft(275);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(25);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout28);
    obj.label78:setLeft(275);
    obj.label78:setTop(3);
    obj.label78:setWidth(25);
    obj.label78:setHeight(20);
    obj.label78:setField("xp_2_5");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout28);
    obj.button25:setLeft(300);
    obj.button25:setTop(3);
    obj.button25:setWidth(20);
    obj.button25:setHeight(20);
    obj.button25:setText("R");
    obj.button25:setName("button25");

    obj.dataLink100 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout28);
    obj.dataLink100:setFields({'atr_2_5', 'dificuldade_2_5', 'bonus_2_5', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink100:setName("dataLink100");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout23);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(155);
    obj.layout29:setWidth(325);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout29);
    obj.edit52:setLeft(5);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(85);
    obj.edit52:setHeight(25);
    obj.edit52:setField("pericia_2_6");
    obj.edit52:setName("edit52");

    obj.dataLink101 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout29);
    obj.dataLink101:setField("pericia_2_6");
    obj.dataLink101:setDefaultValue("Fuga");
    obj.dataLink101:setName("dataLink101");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout29);
    obj.rectangle53:setLeft(90);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(40);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout29);
    obj.label79:setLeft(90);
    obj.label79:setTop(3);
    obj.label79:setWidth(40);
    obj.label79:setHeight(20);
    obj.label79:setField("nh_2_6");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.comboBox51 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox51:setParent(obj.layout29);
    obj.comboBox51:setLeft(130);
    obj.comboBox51:setTop(0);
    obj.comboBox51:setWidth(50);
    obj.comboBox51:setHeight(25);
    obj.comboBox51:setField("atr_2_6");
    obj.comboBox51:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox51:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox51:setName("comboBox51");

    obj.dataLink102 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout29);
    obj.dataLink102:setField("atr_2_6");
    obj.dataLink102:setDefaultValue("DX");
    obj.dataLink102:setName("dataLink102");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout29);
    obj.label80:setLeft(180);
    obj.label80:setTop(3);
    obj.label80:setWidth(10);
    obj.label80:setHeight(20);
    obj.label80:setText("+");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout29);
    obj.edit53:setLeft(190);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(30);
    obj.edit53:setHeight(25);
    obj.edit53:setType("number");
    obj.edit53:setField("bonus_2_6");
    obj.edit53:setName("edit53");

    obj.comboBox52 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox52:setParent(obj.layout29);
    obj.comboBox52:setLeft(220);
    obj.comboBox52:setTop(0);
    obj.comboBox52:setWidth(55);
    obj.comboBox52:setHeight(25);
    obj.comboBox52:setField("dificuldade_2_6");
    obj.comboBox52:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox52:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox52:setName("comboBox52");

    obj.dataLink103 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout29);
    obj.dataLink103:setField("dificuldade_2_6");
    obj.dataLink103:setDefaultValue("D");
    obj.dataLink103:setName("dataLink103");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout29);
    obj.rectangle54:setLeft(275);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(25);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout29);
    obj.label81:setLeft(275);
    obj.label81:setTop(3);
    obj.label81:setWidth(25);
    obj.label81:setHeight(20);
    obj.label81:setField("xp_2_6");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout29);
    obj.button26:setLeft(300);
    obj.button26:setTop(3);
    obj.button26:setWidth(20);
    obj.button26:setHeight(20);
    obj.button26:setText("R");
    obj.button26:setName("button26");

    obj.dataLink104 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout29);
    obj.dataLink104:setFields({'atr_2_6', 'dificuldade_2_6', 'bonus_2_6', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink104:setName("dataLink104");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout23);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(180);
    obj.layout30:setWidth(325);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout30);
    obj.edit54:setLeft(5);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(85);
    obj.edit54:setHeight(25);
    obj.edit54:setField("pericia_2_7");
    obj.edit54:setName("edit54");

    obj.dataLink105 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout30);
    obj.dataLink105:setField("pericia_2_7");
    obj.dataLink105:setDefaultValue("Geografia");
    obj.dataLink105:setName("dataLink105");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout30);
    obj.rectangle55:setLeft(90);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(40);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout30);
    obj.label82:setLeft(90);
    obj.label82:setTop(3);
    obj.label82:setWidth(40);
    obj.label82:setHeight(20);
    obj.label82:setField("nh_2_7");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.comboBox53 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox53:setParent(obj.layout30);
    obj.comboBox53:setLeft(130);
    obj.comboBox53:setTop(0);
    obj.comboBox53:setWidth(50);
    obj.comboBox53:setHeight(25);
    obj.comboBox53:setField("atr_2_7");
    obj.comboBox53:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox53:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox53:setName("comboBox53");

    obj.dataLink106 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout30);
    obj.dataLink106:setField("atr_2_7");
    obj.dataLink106:setDefaultValue("IQ");
    obj.dataLink106:setName("dataLink106");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout30);
    obj.label83:setLeft(180);
    obj.label83:setTop(3);
    obj.label83:setWidth(10);
    obj.label83:setHeight(20);
    obj.label83:setText("+");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout30);
    obj.edit55:setLeft(190);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(30);
    obj.edit55:setHeight(25);
    obj.edit55:setType("number");
    obj.edit55:setField("bonus_2_7");
    obj.edit55:setName("edit55");

    obj.comboBox54 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox54:setParent(obj.layout30);
    obj.comboBox54:setLeft(220);
    obj.comboBox54:setTop(0);
    obj.comboBox54:setWidth(55);
    obj.comboBox54:setHeight(25);
    obj.comboBox54:setField("dificuldade_2_7");
    obj.comboBox54:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox54:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox54:setName("comboBox54");

    obj.dataLink107 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout30);
    obj.dataLink107:setField("dificuldade_2_7");
    obj.dataLink107:setDefaultValue("D");
    obj.dataLink107:setName("dataLink107");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout30);
    obj.rectangle56:setLeft(275);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(25);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout30);
    obj.label84:setLeft(275);
    obj.label84:setTop(3);
    obj.label84:setWidth(25);
    obj.label84:setHeight(20);
    obj.label84:setField("xp_2_7");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout30);
    obj.button27:setLeft(300);
    obj.button27:setTop(3);
    obj.button27:setWidth(20);
    obj.button27:setHeight(20);
    obj.button27:setText("R");
    obj.button27:setName("button27");

    obj.dataLink108 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout30);
    obj.dataLink108:setFields({'atr_2_7', 'dificuldade_2_7', 'bonus_2_7', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink108:setName("dataLink108");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout23);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(205);
    obj.layout31:setWidth(325);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout31);
    obj.edit56:setLeft(5);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(85);
    obj.edit56:setHeight(25);
    obj.edit56:setField("pericia_2_8");
    obj.edit56:setName("edit56");

    obj.dataLink109 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout31);
    obj.dataLink109:setField("pericia_2_8");
    obj.dataLink109:setDefaultValue("História");
    obj.dataLink109:setName("dataLink109");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout31);
    obj.rectangle57:setLeft(90);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(40);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout31);
    obj.label85:setLeft(90);
    obj.label85:setTop(3);
    obj.label85:setWidth(40);
    obj.label85:setHeight(20);
    obj.label85:setField("nh_2_8");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.comboBox55 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox55:setParent(obj.layout31);
    obj.comboBox55:setLeft(130);
    obj.comboBox55:setTop(0);
    obj.comboBox55:setWidth(50);
    obj.comboBox55:setHeight(25);
    obj.comboBox55:setField("atr_2_8");
    obj.comboBox55:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox55:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox55:setName("comboBox55");

    obj.dataLink110 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout31);
    obj.dataLink110:setField("atr_2_8");
    obj.dataLink110:setDefaultValue("IQ");
    obj.dataLink110:setName("dataLink110");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout31);
    obj.label86:setLeft(180);
    obj.label86:setTop(3);
    obj.label86:setWidth(10);
    obj.label86:setHeight(20);
    obj.label86:setText("+");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout31);
    obj.edit57:setLeft(190);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(30);
    obj.edit57:setHeight(25);
    obj.edit57:setType("number");
    obj.edit57:setField("bonus_2_8");
    obj.edit57:setName("edit57");

    obj.comboBox56 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox56:setParent(obj.layout31);
    obj.comboBox56:setLeft(220);
    obj.comboBox56:setTop(0);
    obj.comboBox56:setWidth(55);
    obj.comboBox56:setHeight(25);
    obj.comboBox56:setField("dificuldade_2_8");
    obj.comboBox56:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox56:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox56:setName("comboBox56");

    obj.dataLink111 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout31);
    obj.dataLink111:setField("dificuldade_2_8");
    obj.dataLink111:setDefaultValue("D");
    obj.dataLink111:setName("dataLink111");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout31);
    obj.rectangle58:setLeft(275);
    obj.rectangle58:setTop(0);
    obj.rectangle58:setWidth(25);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout31);
    obj.label87:setLeft(275);
    obj.label87:setTop(3);
    obj.label87:setWidth(25);
    obj.label87:setHeight(20);
    obj.label87:setField("xp_2_8");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout31);
    obj.button28:setLeft(300);
    obj.button28:setTop(3);
    obj.button28:setWidth(20);
    obj.button28:setHeight(20);
    obj.button28:setText("R");
    obj.button28:setName("button28");

    obj.dataLink112 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout31);
    obj.dataLink112:setFields({'atr_2_8', 'dificuldade_2_8', 'bonus_2_8', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink112:setName("dataLink112");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout23);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(230);
    obj.layout32:setWidth(325);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout32);
    obj.edit58:setLeft(5);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(85);
    obj.edit58:setHeight(25);
    obj.edit58:setField("pericia_2_9");
    obj.edit58:setName("edit58");

    obj.dataLink113 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj.layout32);
    obj.dataLink113:setField("pericia_2_9");
    obj.dataLink113:setDefaultValue("Interrogatório");
    obj.dataLink113:setName("dataLink113");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout32);
    obj.rectangle59:setLeft(90);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(40);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout32);
    obj.label88:setLeft(90);
    obj.label88:setTop(3);
    obj.label88:setWidth(40);
    obj.label88:setHeight(20);
    obj.label88:setField("nh_2_9");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.comboBox57 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox57:setParent(obj.layout32);
    obj.comboBox57:setLeft(130);
    obj.comboBox57:setTop(0);
    obj.comboBox57:setWidth(50);
    obj.comboBox57:setHeight(25);
    obj.comboBox57:setField("atr_2_9");
    obj.comboBox57:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox57:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox57:setName("comboBox57");

    obj.dataLink114 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj.layout32);
    obj.dataLink114:setField("atr_2_9");
    obj.dataLink114:setDefaultValue("IQ");
    obj.dataLink114:setName("dataLink114");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout32);
    obj.label89:setLeft(180);
    obj.label89:setTop(3);
    obj.label89:setWidth(10);
    obj.label89:setHeight(20);
    obj.label89:setText("+");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout32);
    obj.edit59:setLeft(190);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(25);
    obj.edit59:setType("number");
    obj.edit59:setField("bonus_2_9");
    obj.edit59:setName("edit59");

    obj.comboBox58 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox58:setParent(obj.layout32);
    obj.comboBox58:setLeft(220);
    obj.comboBox58:setTop(0);
    obj.comboBox58:setWidth(55);
    obj.comboBox58:setHeight(25);
    obj.comboBox58:setField("dificuldade_2_9");
    obj.comboBox58:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox58:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox58:setName("comboBox58");

    obj.dataLink115 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink115:setParent(obj.layout32);
    obj.dataLink115:setField("dificuldade_2_9");
    obj.dataLink115:setDefaultValue("M");
    obj.dataLink115:setName("dataLink115");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout32);
    obj.rectangle60:setLeft(275);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(25);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout32);
    obj.label90:setLeft(275);
    obj.label90:setTop(3);
    obj.label90:setWidth(25);
    obj.label90:setHeight(20);
    obj.label90:setField("xp_2_9");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout32);
    obj.button29:setLeft(300);
    obj.button29:setTop(3);
    obj.button29:setWidth(20);
    obj.button29:setHeight(20);
    obj.button29:setText("R");
    obj.button29:setName("button29");

    obj.dataLink116 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink116:setParent(obj.layout32);
    obj.dataLink116:setFields({'atr_2_9', 'dificuldade_2_9', 'bonus_2_9', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink116:setName("dataLink116");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout23);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(255);
    obj.layout33:setWidth(325);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout33);
    obj.edit60:setLeft(5);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(85);
    obj.edit60:setHeight(25);
    obj.edit60:setField("pericia_2_10");
    obj.edit60:setName("edit60");

    obj.dataLink117 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink117:setParent(obj.layout33);
    obj.dataLink117:setField("pericia_2_10");
    obj.dataLink117:setDefaultValue("Intimidação");
    obj.dataLink117:setName("dataLink117");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout33);
    obj.rectangle61:setLeft(90);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(40);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout33);
    obj.label91:setLeft(90);
    obj.label91:setTop(3);
    obj.label91:setWidth(40);
    obj.label91:setHeight(20);
    obj.label91:setField("nh_2_10");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.comboBox59 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox59:setParent(obj.layout33);
    obj.comboBox59:setLeft(130);
    obj.comboBox59:setTop(0);
    obj.comboBox59:setWidth(50);
    obj.comboBox59:setHeight(25);
    obj.comboBox59:setField("atr_2_10");
    obj.comboBox59:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox59:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox59:setName("comboBox59");

    obj.dataLink118 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink118:setParent(obj.layout33);
    obj.dataLink118:setField("atr_2_10");
    obj.dataLink118:setDefaultValue("VT");
    obj.dataLink118:setName("dataLink118");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout33);
    obj.label92:setLeft(180);
    obj.label92:setTop(3);
    obj.label92:setWidth(10);
    obj.label92:setHeight(20);
    obj.label92:setText("+");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout33);
    obj.edit61:setLeft(190);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(30);
    obj.edit61:setHeight(25);
    obj.edit61:setType("number");
    obj.edit61:setField("bonus_2_10");
    obj.edit61:setName("edit61");

    obj.comboBox60 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox60:setParent(obj.layout33);
    obj.comboBox60:setLeft(220);
    obj.comboBox60:setTop(0);
    obj.comboBox60:setWidth(55);
    obj.comboBox60:setHeight(25);
    obj.comboBox60:setField("dificuldade_2_10");
    obj.comboBox60:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox60:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox60:setName("comboBox60");

    obj.dataLink119 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink119:setParent(obj.layout33);
    obj.dataLink119:setField("dificuldade_2_10");
    obj.dataLink119:setDefaultValue("M");
    obj.dataLink119:setName("dataLink119");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout33);
    obj.rectangle62:setLeft(275);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(25);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout33);
    obj.label93:setLeft(275);
    obj.label93:setTop(3);
    obj.label93:setWidth(25);
    obj.label93:setHeight(20);
    obj.label93:setField("xp_2_10");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout33);
    obj.button30:setLeft(300);
    obj.button30:setTop(3);
    obj.button30:setWidth(20);
    obj.button30:setHeight(20);
    obj.button30:setText("R");
    obj.button30:setName("button30");

    obj.dataLink120 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink120:setParent(obj.layout33);
    obj.dataLink120:setFields({'atr_2_10', 'dificuldade_2_10', 'bonus_2_10', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink120:setName("dataLink120");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout23);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(280);
    obj.layout34:setWidth(325);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout34);
    obj.edit62:setLeft(5);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(85);
    obj.edit62:setHeight(25);
    obj.edit62:setField("pericia_2_11");
    obj.edit62:setName("edit62");

    obj.dataLink121 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink121:setParent(obj.layout34);
    obj.dataLink121:setField("pericia_2_11");
    obj.dataLink121:setDefaultValue("Lábia");
    obj.dataLink121:setName("dataLink121");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout34);
    obj.rectangle63:setLeft(90);
    obj.rectangle63:setTop(0);
    obj.rectangle63:setWidth(40);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout34);
    obj.label94:setLeft(90);
    obj.label94:setTop(3);
    obj.label94:setWidth(40);
    obj.label94:setHeight(20);
    obj.label94:setField("nh_2_11");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.comboBox61 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox61:setParent(obj.layout34);
    obj.comboBox61:setLeft(130);
    obj.comboBox61:setTop(0);
    obj.comboBox61:setWidth(50);
    obj.comboBox61:setHeight(25);
    obj.comboBox61:setField("atr_2_11");
    obj.comboBox61:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox61:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox61:setName("comboBox61");

    obj.dataLink122 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink122:setParent(obj.layout34);
    obj.dataLink122:setField("atr_2_11");
    obj.dataLink122:setDefaultValue("IQ");
    obj.dataLink122:setName("dataLink122");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout34);
    obj.label95:setLeft(180);
    obj.label95:setTop(3);
    obj.label95:setWidth(10);
    obj.label95:setHeight(20);
    obj.label95:setText("+");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout34);
    obj.edit63:setLeft(190);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setType("number");
    obj.edit63:setField("bonus_2_11");
    obj.edit63:setName("edit63");

    obj.comboBox62 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox62:setParent(obj.layout34);
    obj.comboBox62:setLeft(220);
    obj.comboBox62:setTop(0);
    obj.comboBox62:setWidth(55);
    obj.comboBox62:setHeight(25);
    obj.comboBox62:setField("dificuldade_2_11");
    obj.comboBox62:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox62:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox62:setName("comboBox62");

    obj.dataLink123 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink123:setParent(obj.layout34);
    obj.dataLink123:setField("dificuldade_2_11");
    obj.dataLink123:setDefaultValue("M");
    obj.dataLink123:setName("dataLink123");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout34);
    obj.rectangle64:setLeft(275);
    obj.rectangle64:setTop(0);
    obj.rectangle64:setWidth(25);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout34);
    obj.label96:setLeft(275);
    obj.label96:setTop(3);
    obj.label96:setWidth(25);
    obj.label96:setHeight(20);
    obj.label96:setField("xp_2_11");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.button31 = gui.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout34);
    obj.button31:setLeft(300);
    obj.button31:setTop(3);
    obj.button31:setWidth(20);
    obj.button31:setHeight(20);
    obj.button31:setText("R");
    obj.button31:setName("button31");

    obj.dataLink124 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink124:setParent(obj.layout34);
    obj.dataLink124:setFields({'atr_2_11', 'dificuldade_2_11', 'bonus_2_11', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink124:setName("dataLink124");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout23);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(305);
    obj.layout35:setWidth(325);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout35);
    obj.edit64:setLeft(5);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(85);
    obj.edit64:setHeight(25);
    obj.edit64:setField("pericia_2_12");
    obj.edit64:setName("edit64");

    obj.dataLink125 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink125:setParent(obj.layout35);
    obj.dataLink125:setField("pericia_2_12");
    obj.dataLink125:setDefaultValue("Leitura Lábial");
    obj.dataLink125:setName("dataLink125");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout35);
    obj.rectangle65:setLeft(90);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(40);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout35);
    obj.label97:setLeft(90);
    obj.label97:setTop(3);
    obj.label97:setWidth(40);
    obj.label97:setHeight(20);
    obj.label97:setField("nh_2_12");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.comboBox63 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox63:setParent(obj.layout35);
    obj.comboBox63:setLeft(130);
    obj.comboBox63:setTop(0);
    obj.comboBox63:setWidth(50);
    obj.comboBox63:setHeight(25);
    obj.comboBox63:setField("atr_2_12");
    obj.comboBox63:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox63:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox63:setName("comboBox63");

    obj.dataLink126 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink126:setParent(obj.layout35);
    obj.dataLink126:setField("atr_2_12");
    obj.dataLink126:setDefaultValue("PR");
    obj.dataLink126:setName("dataLink126");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout35);
    obj.label98:setLeft(180);
    obj.label98:setTop(3);
    obj.label98:setWidth(10);
    obj.label98:setHeight(20);
    obj.label98:setText("+");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout35);
    obj.edit65:setLeft(190);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(30);
    obj.edit65:setHeight(25);
    obj.edit65:setType("number");
    obj.edit65:setField("bonus_2_12");
    obj.edit65:setName("edit65");

    obj.comboBox64 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox64:setParent(obj.layout35);
    obj.comboBox64:setLeft(220);
    obj.comboBox64:setTop(0);
    obj.comboBox64:setWidth(55);
    obj.comboBox64:setHeight(25);
    obj.comboBox64:setField("dificuldade_2_12");
    obj.comboBox64:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox64:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox64:setName("comboBox64");

    obj.dataLink127 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink127:setParent(obj.layout35);
    obj.dataLink127:setField("dificuldade_2_12");
    obj.dataLink127:setDefaultValue("M");
    obj.dataLink127:setName("dataLink127");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout35);
    obj.rectangle66:setLeft(275);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(25);
    obj.rectangle66:setHeight(25);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout35);
    obj.label99:setLeft(275);
    obj.label99:setTop(3);
    obj.label99:setWidth(25);
    obj.label99:setHeight(20);
    obj.label99:setField("xp_2_12");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.button32 = gui.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout35);
    obj.button32:setLeft(300);
    obj.button32:setTop(3);
    obj.button32:setWidth(20);
    obj.button32:setHeight(20);
    obj.button32:setText("R");
    obj.button32:setName("button32");

    obj.dataLink128 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink128:setParent(obj.layout35);
    obj.dataLink128:setFields({'atr_2_12', 'dificuldade_2_12', 'bonus_2_12', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink128:setName("dataLink128");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout23);
    obj.layout36:setLeft(0);
    obj.layout36:setTop(330);
    obj.layout36:setWidth(325);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout36);
    obj.edit66:setLeft(5);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(85);
    obj.edit66:setHeight(25);
    obj.edit66:setField("pericia_2_13");
    obj.edit66:setName("edit66");

    obj.dataLink129 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink129:setParent(obj.layout36);
    obj.dataLink129:setField("pericia_2_13");
    obj.dataLink129:setDefaultValue("Liderança");
    obj.dataLink129:setName("dataLink129");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout36);
    obj.rectangle67:setLeft(90);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(40);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout36);
    obj.label100:setLeft(90);
    obj.label100:setTop(3);
    obj.label100:setWidth(40);
    obj.label100:setHeight(20);
    obj.label100:setField("nh_2_13");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.comboBox65 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox65:setParent(obj.layout36);
    obj.comboBox65:setLeft(130);
    obj.comboBox65:setTop(0);
    obj.comboBox65:setWidth(50);
    obj.comboBox65:setHeight(25);
    obj.comboBox65:setField("atr_2_13");
    obj.comboBox65:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox65:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox65:setName("comboBox65");

    obj.dataLink130 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink130:setParent(obj.layout36);
    obj.dataLink130:setField("atr_2_13");
    obj.dataLink130:setDefaultValue("IQ");
    obj.dataLink130:setName("dataLink130");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout36);
    obj.label101:setLeft(180);
    obj.label101:setTop(3);
    obj.label101:setWidth(10);
    obj.label101:setHeight(20);
    obj.label101:setText("+");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout36);
    obj.edit67:setLeft(190);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(30);
    obj.edit67:setHeight(25);
    obj.edit67:setType("number");
    obj.edit67:setField("bonus_2_13");
    obj.edit67:setName("edit67");

    obj.comboBox66 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox66:setParent(obj.layout36);
    obj.comboBox66:setLeft(220);
    obj.comboBox66:setTop(0);
    obj.comboBox66:setWidth(55);
    obj.comboBox66:setHeight(25);
    obj.comboBox66:setField("dificuldade_2_13");
    obj.comboBox66:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox66:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox66:setName("comboBox66");

    obj.dataLink131 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink131:setParent(obj.layout36);
    obj.dataLink131:setField("dificuldade_2_13");
    obj.dataLink131:setDefaultValue("M");
    obj.dataLink131:setName("dataLink131");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout36);
    obj.rectangle68:setLeft(275);
    obj.rectangle68:setTop(0);
    obj.rectangle68:setWidth(25);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout36);
    obj.label102:setLeft(275);
    obj.label102:setTop(3);
    obj.label102:setWidth(25);
    obj.label102:setHeight(20);
    obj.label102:setField("xp_2_13");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.button33 = gui.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout36);
    obj.button33:setLeft(300);
    obj.button33:setTop(3);
    obj.button33:setWidth(20);
    obj.button33:setHeight(20);
    obj.button33:setText("R");
    obj.button33:setName("button33");

    obj.dataLink132 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink132:setParent(obj.layout36);
    obj.dataLink132:setFields({'atr_2_13', 'dificuldade_2_13', 'bonus_2_13', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink132:setName("dataLink132");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout23);
    obj.layout37:setLeft(0);
    obj.layout37:setTop(355);
    obj.layout37:setWidth(325);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout37);
    obj.edit68:setLeft(5);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(85);
    obj.edit68:setHeight(25);
    obj.edit68:setField("pericia_2_14");
    obj.edit68:setName("edit68");

    obj.dataLink133 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink133:setParent(obj.layout37);
    obj.dataLink133:setField("pericia_2_14");
    obj.dataLink133:setDefaultValue("Linguagem Corporal");
    obj.dataLink133:setName("dataLink133");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout37);
    obj.rectangle69:setLeft(90);
    obj.rectangle69:setTop(0);
    obj.rectangle69:setWidth(40);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout37);
    obj.label103:setLeft(90);
    obj.label103:setTop(3);
    obj.label103:setWidth(40);
    obj.label103:setHeight(20);
    obj.label103:setField("nh_2_14");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.comboBox67 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox67:setParent(obj.layout37);
    obj.comboBox67:setLeft(130);
    obj.comboBox67:setTop(0);
    obj.comboBox67:setWidth(50);
    obj.comboBox67:setHeight(25);
    obj.comboBox67:setField("atr_2_14");
    obj.comboBox67:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox67:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox67:setName("comboBox67");

    obj.dataLink134 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink134:setParent(obj.layout37);
    obj.dataLink134:setField("atr_2_14");
    obj.dataLink134:setDefaultValue("DX");
    obj.dataLink134:setName("dataLink134");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout37);
    obj.label104:setLeft(180);
    obj.label104:setTop(3);
    obj.label104:setWidth(10);
    obj.label104:setHeight(20);
    obj.label104:setText("+");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout37);
    obj.edit69:setLeft(190);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(30);
    obj.edit69:setHeight(25);
    obj.edit69:setType("number");
    obj.edit69:setField("bonus_2_14");
    obj.edit69:setName("edit69");

    obj.comboBox68 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox68:setParent(obj.layout37);
    obj.comboBox68:setLeft(220);
    obj.comboBox68:setTop(0);
    obj.comboBox68:setWidth(55);
    obj.comboBox68:setHeight(25);
    obj.comboBox68:setField("dificuldade_2_14");
    obj.comboBox68:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox68:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox68:setName("comboBox68");

    obj.dataLink135 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink135:setParent(obj.layout37);
    obj.dataLink135:setField("dificuldade_2_14");
    obj.dataLink135:setDefaultValue("D");
    obj.dataLink135:setName("dataLink135");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout37);
    obj.rectangle70:setLeft(275);
    obj.rectangle70:setTop(0);
    obj.rectangle70:setWidth(25);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout37);
    obj.label105:setLeft(275);
    obj.label105:setTop(3);
    obj.label105:setWidth(25);
    obj.label105:setHeight(20);
    obj.label105:setField("xp_2_14");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.button34 = gui.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout37);
    obj.button34:setLeft(300);
    obj.button34:setTop(3);
    obj.button34:setWidth(20);
    obj.button34:setHeight(20);
    obj.button34:setText("R");
    obj.button34:setName("button34");

    obj.dataLink136 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink136:setParent(obj.layout37);
    obj.dataLink136:setFields({'atr_2_14', 'dificuldade_2_14', 'bonus_2_14', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink136:setName("dataLink136");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout23);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(380);
    obj.layout38:setWidth(325);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout38);
    obj.edit70:setLeft(5);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(85);
    obj.edit70:setHeight(25);
    obj.edit70:setField("pericia_2_15");
    obj.edit70:setName("edit70");

    obj.dataLink137 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink137:setParent(obj.layout38);
    obj.dataLink137:setField("pericia_2_15");
    obj.dataLink137:setDefaultValue("Lutas às Cegas");
    obj.dataLink137:setName("dataLink137");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout38);
    obj.rectangle71:setLeft(90);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(40);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout38);
    obj.label106:setLeft(90);
    obj.label106:setTop(3);
    obj.label106:setWidth(40);
    obj.label106:setHeight(20);
    obj.label106:setField("nh_2_15");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.comboBox69 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox69:setParent(obj.layout38);
    obj.comboBox69:setLeft(130);
    obj.comboBox69:setTop(0);
    obj.comboBox69:setWidth(50);
    obj.comboBox69:setHeight(25);
    obj.comboBox69:setField("atr_2_15");
    obj.comboBox69:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox69:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox69:setName("comboBox69");

    obj.dataLink138 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink138:setParent(obj.layout38);
    obj.dataLink138:setField("atr_2_15");
    obj.dataLink138:setDefaultValue("PR");
    obj.dataLink138:setName("dataLink138");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout38);
    obj.label107:setLeft(180);
    obj.label107:setTop(3);
    obj.label107:setWidth(10);
    obj.label107:setHeight(20);
    obj.label107:setText("+");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout38);
    obj.edit71:setLeft(190);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(30);
    obj.edit71:setHeight(25);
    obj.edit71:setType("number");
    obj.edit71:setField("bonus_2_15");
    obj.edit71:setName("edit71");

    obj.comboBox70 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox70:setParent(obj.layout38);
    obj.comboBox70:setLeft(220);
    obj.comboBox70:setTop(0);
    obj.comboBox70:setWidth(55);
    obj.comboBox70:setHeight(25);
    obj.comboBox70:setField("dificuldade_2_15");
    obj.comboBox70:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox70:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox70:setName("comboBox70");

    obj.dataLink139 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink139:setParent(obj.layout38);
    obj.dataLink139:setField("dificuldade_2_15");
    obj.dataLink139:setDefaultValue("MD");
    obj.dataLink139:setName("dataLink139");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout38);
    obj.rectangle72:setLeft(275);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(25);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout38);
    obj.label108:setLeft(275);
    obj.label108:setTop(3);
    obj.label108:setWidth(25);
    obj.label108:setHeight(20);
    obj.label108:setField("xp_2_15");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.button35 = gui.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout38);
    obj.button35:setLeft(300);
    obj.button35:setTop(3);
    obj.button35:setWidth(20);
    obj.button35:setHeight(20);
    obj.button35:setText("R");
    obj.button35:setName("button35");

    obj.dataLink140 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink140:setParent(obj.layout38);
    obj.dataLink140:setFields({'atr_2_15', 'dificuldade_2_15', 'bonus_2_15', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink140:setName("dataLink140");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout23);
    obj.layout39:setLeft(0);
    obj.layout39:setTop(405);
    obj.layout39:setWidth(325);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout39);
    obj.edit72:setLeft(5);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(85);
    obj.edit72:setHeight(25);
    obj.edit72:setField("pericia_2_16");
    obj.edit72:setName("edit72");

    obj.dataLink141 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink141:setParent(obj.layout39);
    obj.dataLink141:setField("pericia_2_16");
    obj.dataLink141:setDefaultValue("Medicina (Cosmo)");
    obj.dataLink141:setName("dataLink141");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout39);
    obj.rectangle73:setLeft(90);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(40);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout39);
    obj.label109:setLeft(90);
    obj.label109:setTop(3);
    obj.label109:setWidth(40);
    obj.label109:setHeight(20);
    obj.label109:setField("nh_2_16");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.comboBox71 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox71:setParent(obj.layout39);
    obj.comboBox71:setLeft(130);
    obj.comboBox71:setTop(0);
    obj.comboBox71:setWidth(50);
    obj.comboBox71:setHeight(25);
    obj.comboBox71:setField("atr_2_16");
    obj.comboBox71:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox71:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox71:setName("comboBox71");

    obj.dataLink142 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink142:setParent(obj.layout39);
    obj.dataLink142:setField("atr_2_16");
    obj.dataLink142:setDefaultValue("IQ");
    obj.dataLink142:setName("dataLink142");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout39);
    obj.label110:setLeft(180);
    obj.label110:setTop(3);
    obj.label110:setWidth(10);
    obj.label110:setHeight(20);
    obj.label110:setText("+");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout39);
    obj.edit73:setLeft(190);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(30);
    obj.edit73:setHeight(25);
    obj.edit73:setType("number");
    obj.edit73:setField("bonus_2_16");
    obj.edit73:setName("edit73");

    obj.comboBox72 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox72:setParent(obj.layout39);
    obj.comboBox72:setLeft(220);
    obj.comboBox72:setTop(0);
    obj.comboBox72:setWidth(55);
    obj.comboBox72:setHeight(25);
    obj.comboBox72:setField("dificuldade_2_16");
    obj.comboBox72:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox72:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox72:setName("comboBox72");

    obj.dataLink143 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink143:setParent(obj.layout39);
    obj.dataLink143:setField("dificuldade_2_16");
    obj.dataLink143:setDefaultValue("D");
    obj.dataLink143:setName("dataLink143");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout39);
    obj.rectangle74:setLeft(275);
    obj.rectangle74:setTop(0);
    obj.rectangle74:setWidth(25);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout39);
    obj.label111:setLeft(275);
    obj.label111:setTop(3);
    obj.label111:setWidth(25);
    obj.label111:setHeight(20);
    obj.label111:setField("xp_2_16");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.button36 = gui.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout39);
    obj.button36:setLeft(300);
    obj.button36:setTop(3);
    obj.button36:setWidth(20);
    obj.button36:setHeight(20);
    obj.button36:setText("R");
    obj.button36:setName("button36");

    obj.dataLink144 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink144:setParent(obj.layout39);
    obj.dataLink144:setFields({'atr_2_16', 'dificuldade_2_16', 'bonus_2_16', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink144:setName("dataLink144");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout23);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(430);
    obj.layout40:setWidth(325);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout40);
    obj.edit74:setLeft(5);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(85);
    obj.edit74:setHeight(25);
    obj.edit74:setField("pericia_2_17");
    obj.edit74:setName("edit74");

    obj.dataLink145 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink145:setParent(obj.layout40);
    obj.dataLink145:setField("pericia_2_17");
    obj.dataLink145:setDefaultValue("Meditação");
    obj.dataLink145:setName("dataLink145");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout40);
    obj.rectangle75:setLeft(90);
    obj.rectangle75:setTop(0);
    obj.rectangle75:setWidth(40);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout40);
    obj.label112:setLeft(90);
    obj.label112:setTop(3);
    obj.label112:setWidth(40);
    obj.label112:setHeight(20);
    obj.label112:setField("nh_2_17");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.comboBox73 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox73:setParent(obj.layout40);
    obj.comboBox73:setLeft(130);
    obj.comboBox73:setTop(0);
    obj.comboBox73:setWidth(50);
    obj.comboBox73:setHeight(25);
    obj.comboBox73:setField("atr_2_17");
    obj.comboBox73:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox73:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox73:setName("comboBox73");

    obj.dataLink146 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink146:setParent(obj.layout40);
    obj.dataLink146:setField("atr_2_17");
    obj.dataLink146:setDefaultValue("VT");
    obj.dataLink146:setName("dataLink146");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout40);
    obj.label113:setLeft(180);
    obj.label113:setTop(3);
    obj.label113:setWidth(10);
    obj.label113:setHeight(20);
    obj.label113:setText("+");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout40);
    obj.edit75:setLeft(190);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(30);
    obj.edit75:setHeight(25);
    obj.edit75:setType("number");
    obj.edit75:setField("bonus_2_17");
    obj.edit75:setName("edit75");

    obj.comboBox74 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox74:setParent(obj.layout40);
    obj.comboBox74:setLeft(220);
    obj.comboBox74:setTop(0);
    obj.comboBox74:setWidth(55);
    obj.comboBox74:setHeight(25);
    obj.comboBox74:setField("dificuldade_2_17");
    obj.comboBox74:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox74:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox74:setName("comboBox74");

    obj.dataLink147 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink147:setParent(obj.layout40);
    obj.dataLink147:setField("dificuldade_2_17");
    obj.dataLink147:setDefaultValue("D");
    obj.dataLink147:setName("dataLink147");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout40);
    obj.rectangle76:setLeft(275);
    obj.rectangle76:setTop(0);
    obj.rectangle76:setWidth(25);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout40);
    obj.label114:setLeft(275);
    obj.label114:setTop(3);
    obj.label114:setWidth(25);
    obj.label114:setHeight(20);
    obj.label114:setField("xp_2_17");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.button37 = gui.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout40);
    obj.button37:setLeft(300);
    obj.button37:setTop(3);
    obj.button37:setWidth(20);
    obj.button37:setHeight(20);
    obj.button37:setText("R");
    obj.button37:setName("button37");

    obj.dataLink148 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink148:setParent(obj.layout40);
    obj.dataLink148:setFields({'atr_2_17', 'dificuldade_2_17', 'bonus_2_17', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink148:setName("dataLink148");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout23);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(455);
    obj.layout41:setWidth(325);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout41);
    obj.edit76:setLeft(5);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(85);
    obj.edit76:setHeight(25);
    obj.edit76:setField("pericia_2_18");
    obj.edit76:setName("edit76");

    obj.dataLink149 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink149:setParent(obj.layout41);
    obj.dataLink149:setField("pericia_2_18");
    obj.dataLink149:setDefaultValue("Natação");
    obj.dataLink149:setName("dataLink149");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout41);
    obj.rectangle77:setLeft(90);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(40);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout41);
    obj.label115:setLeft(90);
    obj.label115:setTop(3);
    obj.label115:setWidth(40);
    obj.label115:setHeight(20);
    obj.label115:setField("nh_2_18");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.comboBox75 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox75:setParent(obj.layout41);
    obj.comboBox75:setLeft(130);
    obj.comboBox75:setTop(0);
    obj.comboBox75:setWidth(50);
    obj.comboBox75:setHeight(25);
    obj.comboBox75:setField("atr_2_18");
    obj.comboBox75:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox75:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox75:setName("comboBox75");

    obj.dataLink150 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink150:setParent(obj.layout41);
    obj.dataLink150:setField("atr_2_18");
    obj.dataLink150:setDefaultValue("HT");
    obj.dataLink150:setName("dataLink150");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout41);
    obj.label116:setLeft(180);
    obj.label116:setTop(3);
    obj.label116:setWidth(10);
    obj.label116:setHeight(20);
    obj.label116:setText("+");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout41);
    obj.edit77:setLeft(190);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(30);
    obj.edit77:setHeight(25);
    obj.edit77:setType("number");
    obj.edit77:setField("bonus_2_18");
    obj.edit77:setName("edit77");

    obj.comboBox76 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox76:setParent(obj.layout41);
    obj.comboBox76:setLeft(220);
    obj.comboBox76:setTop(0);
    obj.comboBox76:setWidth(55);
    obj.comboBox76:setHeight(25);
    obj.comboBox76:setField("dificuldade_2_18");
    obj.comboBox76:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox76:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox76:setName("comboBox76");

    obj.dataLink151 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink151:setParent(obj.layout41);
    obj.dataLink151:setField("dificuldade_2_18");
    obj.dataLink151:setDefaultValue("F");
    obj.dataLink151:setName("dataLink151");

    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout41);
    obj.rectangle78:setLeft(275);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(25);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout41);
    obj.label117:setLeft(275);
    obj.label117:setTop(3);
    obj.label117:setWidth(25);
    obj.label117:setHeight(20);
    obj.label117:setField("xp_2_18");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.button38 = gui.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout41);
    obj.button38:setLeft(300);
    obj.button38:setTop(3);
    obj.button38:setWidth(20);
    obj.button38:setHeight(20);
    obj.button38:setText("R");
    obj.button38:setName("button38");

    obj.dataLink152 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink152:setParent(obj.layout41);
    obj.dataLink152:setFields({'atr_2_18', 'dificuldade_2_18', 'bonus_2_18', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink152:setName("dataLink152");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout23);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(480);
    obj.layout42:setWidth(325);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout42);
    obj.edit78:setLeft(5);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(85);
    obj.edit78:setHeight(25);
    obj.edit78:setField("pericia_2_19");
    obj.edit78:setName("edit78");

    obj.dataLink153 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink153:setParent(obj.layout42);
    obj.dataLink153:setField("pericia_2_19");
    obj.dataLink153:setDefaultValue("Naturalista");
    obj.dataLink153:setName("dataLink153");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout42);
    obj.rectangle79:setLeft(90);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(40);
    obj.rectangle79:setHeight(25);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout42);
    obj.label118:setLeft(90);
    obj.label118:setTop(3);
    obj.label118:setWidth(40);
    obj.label118:setHeight(20);
    obj.label118:setField("nh_2_19");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.comboBox77 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox77:setParent(obj.layout42);
    obj.comboBox77:setLeft(130);
    obj.comboBox77:setTop(0);
    obj.comboBox77:setWidth(50);
    obj.comboBox77:setHeight(25);
    obj.comboBox77:setField("atr_2_19");
    obj.comboBox77:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox77:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox77:setName("comboBox77");

    obj.dataLink154 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink154:setParent(obj.layout42);
    obj.dataLink154:setField("atr_2_19");
    obj.dataLink154:setDefaultValue("IQ");
    obj.dataLink154:setName("dataLink154");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout42);
    obj.label119:setLeft(180);
    obj.label119:setTop(3);
    obj.label119:setWidth(10);
    obj.label119:setHeight(20);
    obj.label119:setText("+");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout42);
    obj.edit79:setLeft(190);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(30);
    obj.edit79:setHeight(25);
    obj.edit79:setType("number");
    obj.edit79:setField("bonus_2_19");
    obj.edit79:setName("edit79");

    obj.comboBox78 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox78:setParent(obj.layout42);
    obj.comboBox78:setLeft(220);
    obj.comboBox78:setTop(0);
    obj.comboBox78:setWidth(55);
    obj.comboBox78:setHeight(25);
    obj.comboBox78:setField("dificuldade_2_19");
    obj.comboBox78:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox78:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox78:setName("comboBox78");

    obj.dataLink155 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink155:setParent(obj.layout42);
    obj.dataLink155:setField("dificuldade_2_19");
    obj.dataLink155:setDefaultValue("D");
    obj.dataLink155:setName("dataLink155");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout42);
    obj.rectangle80:setLeft(275);
    obj.rectangle80:setTop(0);
    obj.rectangle80:setWidth(25);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout42);
    obj.label120:setLeft(275);
    obj.label120:setTop(3);
    obj.label120:setWidth(25);
    obj.label120:setHeight(20);
    obj.label120:setField("xp_2_19");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.button39 = gui.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout42);
    obj.button39:setLeft(300);
    obj.button39:setTop(3);
    obj.button39:setWidth(20);
    obj.button39:setHeight(20);
    obj.button39:setText("R");
    obj.button39:setName("button39");

    obj.dataLink156 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink156:setParent(obj.layout42);
    obj.dataLink156:setFields({'atr_2_19', 'dificuldade_2_19', 'bonus_2_19', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink156:setName("dataLink156");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout23);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(505);
    obj.layout43:setWidth(325);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout43);
    obj.edit80:setLeft(5);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(85);
    obj.edit80:setHeight(25);
    obj.edit80:setField("pericia_2_20");
    obj.edit80:setName("edit80");

    obj.dataLink157 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink157:setParent(obj.layout43);
    obj.dataLink157:setField("pericia_2_20");
    obj.dataLink157:setDefaultValue("Observação");
    obj.dataLink157:setName("dataLink157");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout43);
    obj.rectangle81:setLeft(90);
    obj.rectangle81:setTop(0);
    obj.rectangle81:setWidth(40);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout43);
    obj.label121:setLeft(90);
    obj.label121:setTop(3);
    obj.label121:setWidth(40);
    obj.label121:setHeight(20);
    obj.label121:setField("nh_2_20");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.comboBox79 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox79:setParent(obj.layout43);
    obj.comboBox79:setLeft(130);
    obj.comboBox79:setTop(0);
    obj.comboBox79:setWidth(50);
    obj.comboBox79:setHeight(25);
    obj.comboBox79:setField("atr_2_20");
    obj.comboBox79:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox79:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox79:setName("comboBox79");

    obj.dataLink158 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink158:setParent(obj.layout43);
    obj.dataLink158:setField("atr_2_20");
    obj.dataLink158:setDefaultValue("PR");
    obj.dataLink158:setName("dataLink158");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout43);
    obj.label122:setLeft(180);
    obj.label122:setTop(3);
    obj.label122:setWidth(10);
    obj.label122:setHeight(20);
    obj.label122:setText("+");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout43);
    obj.edit81:setLeft(190);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(30);
    obj.edit81:setHeight(25);
    obj.edit81:setType("number");
    obj.edit81:setField("bonus_2_20");
    obj.edit81:setName("edit81");

    obj.comboBox80 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox80:setParent(obj.layout43);
    obj.comboBox80:setLeft(220);
    obj.comboBox80:setTop(0);
    obj.comboBox80:setWidth(55);
    obj.comboBox80:setHeight(25);
    obj.comboBox80:setField("dificuldade_2_20");
    obj.comboBox80:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox80:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox80:setName("comboBox80");

    obj.dataLink159 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink159:setParent(obj.layout43);
    obj.dataLink159:setField("dificuldade_2_20");
    obj.dataLink159:setDefaultValue("M");
    obj.dataLink159:setName("dataLink159");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout43);
    obj.rectangle82:setLeft(275);
    obj.rectangle82:setTop(0);
    obj.rectangle82:setWidth(25);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout43);
    obj.label123:setLeft(275);
    obj.label123:setTop(3);
    obj.label123:setWidth(25);
    obj.label123:setHeight(20);
    obj.label123:setField("xp_2_20");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.button40 = gui.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout43);
    obj.button40:setLeft(300);
    obj.button40:setTop(3);
    obj.button40:setWidth(20);
    obj.button40:setHeight(20);
    obj.button40:setText("R");
    obj.button40:setName("button40");

    obj.dataLink160 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink160:setParent(obj.layout43);
    obj.dataLink160:setFields({'atr_2_20', 'dificuldade_2_20', 'bonus_2_20', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink160:setName("dataLink160");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox1);
    obj.layout44:setLeft(660);
    obj.layout44:setTop(0);
    obj.layout44:setWidth(325);
    obj.layout44:setHeight(615);
    obj.layout44:setName("layout44");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout44);
    obj.rectangle83:setAlign("client");
    obj.rectangle83:setColor("black");
    obj.rectangle83:setXradius(15);
    obj.rectangle83:setYradius(15);
    obj.rectangle83:setCornerType("round");
    obj.rectangle83:setName("rectangle83");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout44);
    obj.label124:setLeft(0);
    obj.label124:setTop(5);
    obj.label124:setWidth(325);
    obj.label124:setHeight(20);
    obj.label124:setText("     NOME            NH        AT     +  BN       DF        PT");
    obj.label124:setName("label124");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(30);
    obj.layout45:setWidth(325);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout45);
    obj.edit82:setLeft(5);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(85);
    obj.edit82:setHeight(25);
    obj.edit82:setField("pericia_3_1");
    obj.edit82:setName("edit82");

    obj.dataLink161 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink161:setParent(obj.layout45);
    obj.dataLink161:setField("pericia_3_1");
    obj.dataLink161:setDefaultValue("Ocultismo");
    obj.dataLink161:setName("dataLink161");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout45);
    obj.rectangle84:setLeft(90);
    obj.rectangle84:setTop(0);
    obj.rectangle84:setWidth(40);
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout45);
    obj.label125:setLeft(90);
    obj.label125:setTop(3);
    obj.label125:setWidth(40);
    obj.label125:setHeight(20);
    obj.label125:setField("nh_3_1");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.comboBox81 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox81:setParent(obj.layout45);
    obj.comboBox81:setLeft(130);
    obj.comboBox81:setTop(0);
    obj.comboBox81:setWidth(50);
    obj.comboBox81:setHeight(25);
    obj.comboBox81:setField("atr_3_1");
    obj.comboBox81:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox81:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox81:setName("comboBox81");

    obj.dataLink162 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink162:setParent(obj.layout45);
    obj.dataLink162:setField("atr_3_1");
    obj.dataLink162:setDefaultValue("IQ");
    obj.dataLink162:setName("dataLink162");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout45);
    obj.label126:setLeft(180);
    obj.label126:setTop(3);
    obj.label126:setWidth(10);
    obj.label126:setHeight(20);
    obj.label126:setText("+");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout45);
    obj.edit83:setLeft(190);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(30);
    obj.edit83:setHeight(25);
    obj.edit83:setType("number");
    obj.edit83:setField("bonus_3_1");
    obj.edit83:setName("edit83");

    obj.comboBox82 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox82:setParent(obj.layout45);
    obj.comboBox82:setLeft(220);
    obj.comboBox82:setTop(0);
    obj.comboBox82:setWidth(55);
    obj.comboBox82:setHeight(25);
    obj.comboBox82:setField("dificuldade_3_1");
    obj.comboBox82:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox82:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox82:setName("comboBox82");

    obj.dataLink163 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink163:setParent(obj.layout45);
    obj.dataLink163:setField("dificuldade_3_1");
    obj.dataLink163:setDefaultValue("M");
    obj.dataLink163:setName("dataLink163");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout45);
    obj.rectangle85:setLeft(275);
    obj.rectangle85:setTop(0);
    obj.rectangle85:setWidth(25);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout45);
    obj.label127:setLeft(275);
    obj.label127:setTop(3);
    obj.label127:setWidth(25);
    obj.label127:setHeight(20);
    obj.label127:setField("xp_3_1");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.button41 = gui.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout45);
    obj.button41:setLeft(300);
    obj.button41:setTop(3);
    obj.button41:setWidth(20);
    obj.button41:setHeight(20);
    obj.button41:setText("R");
    obj.button41:setName("button41");

    obj.dataLink164 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink164:setParent(obj.layout45);
    obj.dataLink164:setFields({'atr_3_1', 'dificuldade_3_1', 'bonus_3_1', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink164:setName("dataLink164");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout44);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(55);
    obj.layout46:setWidth(325);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout46);
    obj.edit84:setLeft(5);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(85);
    obj.edit84:setHeight(25);
    obj.edit84:setField("pericia_3_2");
    obj.edit84:setName("edit84");

    obj.dataLink165 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink165:setParent(obj.layout46);
    obj.dataLink165:setField("pericia_3_2");
    obj.dataLink165:setDefaultValue("Primeiros Socorros");
    obj.dataLink165:setName("dataLink165");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout46);
    obj.rectangle86:setLeft(90);
    obj.rectangle86:setTop(0);
    obj.rectangle86:setWidth(40);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout46);
    obj.label128:setLeft(90);
    obj.label128:setTop(3);
    obj.label128:setWidth(40);
    obj.label128:setHeight(20);
    obj.label128:setField("nh_3_2");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.comboBox83 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox83:setParent(obj.layout46);
    obj.comboBox83:setLeft(130);
    obj.comboBox83:setTop(0);
    obj.comboBox83:setWidth(50);
    obj.comboBox83:setHeight(25);
    obj.comboBox83:setField("atr_3_2");
    obj.comboBox83:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox83:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox83:setName("comboBox83");

    obj.dataLink166 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink166:setParent(obj.layout46);
    obj.dataLink166:setField("atr_3_2");
    obj.dataLink166:setDefaultValue("IQ");
    obj.dataLink166:setName("dataLink166");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout46);
    obj.label129:setLeft(180);
    obj.label129:setTop(3);
    obj.label129:setWidth(10);
    obj.label129:setHeight(20);
    obj.label129:setText("+");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout46);
    obj.edit85:setLeft(190);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(30);
    obj.edit85:setHeight(25);
    obj.edit85:setType("number");
    obj.edit85:setField("bonus_3_2");
    obj.edit85:setName("edit85");

    obj.comboBox84 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox84:setParent(obj.layout46);
    obj.comboBox84:setLeft(220);
    obj.comboBox84:setTop(0);
    obj.comboBox84:setWidth(55);
    obj.comboBox84:setHeight(25);
    obj.comboBox84:setField("dificuldade_3_2");
    obj.comboBox84:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox84:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox84:setName("comboBox84");

    obj.dataLink167 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink167:setParent(obj.layout46);
    obj.dataLink167:setField("dificuldade_3_2");
    obj.dataLink167:setDefaultValue("F");
    obj.dataLink167:setName("dataLink167");

    obj.rectangle87 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout46);
    obj.rectangle87:setLeft(275);
    obj.rectangle87:setTop(0);
    obj.rectangle87:setWidth(25);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout46);
    obj.label130:setLeft(275);
    obj.label130:setTop(3);
    obj.label130:setWidth(25);
    obj.label130:setHeight(20);
    obj.label130:setField("xp_3_2");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.button42 = gui.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout46);
    obj.button42:setLeft(300);
    obj.button42:setTop(3);
    obj.button42:setWidth(20);
    obj.button42:setHeight(20);
    obj.button42:setText("R");
    obj.button42:setName("button42");

    obj.dataLink168 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink168:setParent(obj.layout46);
    obj.dataLink168:setFields({'atr_3_2', 'dificuldade_3_2', 'bonus_3_2', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink168:setName("dataLink168");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout44);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(80);
    obj.layout47:setWidth(325);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout47);
    obj.edit86:setLeft(5);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(85);
    obj.edit86:setHeight(25);
    obj.edit86:setField("pericia_3_3");
    obj.edit86:setName("edit86");

    obj.dataLink169 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink169:setParent(obj.layout47);
    obj.dataLink169:setField("pericia_3_3");
    obj.dataLink169:setDefaultValue("Persuadir");
    obj.dataLink169:setName("dataLink169");

    obj.rectangle88 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout47);
    obj.rectangle88:setLeft(90);
    obj.rectangle88:setTop(0);
    obj.rectangle88:setWidth(40);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout47);
    obj.label131:setLeft(90);
    obj.label131:setTop(3);
    obj.label131:setWidth(40);
    obj.label131:setHeight(20);
    obj.label131:setField("nh_3_3");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.comboBox85 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox85:setParent(obj.layout47);
    obj.comboBox85:setLeft(130);
    obj.comboBox85:setTop(0);
    obj.comboBox85:setWidth(50);
    obj.comboBox85:setHeight(25);
    obj.comboBox85:setField("atr_3_3");
    obj.comboBox85:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox85:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox85:setName("comboBox85");

    obj.dataLink170 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink170:setParent(obj.layout47);
    obj.dataLink170:setField("atr_3_3");
    obj.dataLink170:setDefaultValue("VT");
    obj.dataLink170:setName("dataLink170");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout47);
    obj.label132:setLeft(180);
    obj.label132:setTop(3);
    obj.label132:setWidth(10);
    obj.label132:setHeight(20);
    obj.label132:setText("+");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout47);
    obj.edit87:setLeft(190);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(30);
    obj.edit87:setHeight(25);
    obj.edit87:setType("number");
    obj.edit87:setField("bonus_3_3");
    obj.edit87:setName("edit87");

    obj.comboBox86 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox86:setParent(obj.layout47);
    obj.comboBox86:setLeft(220);
    obj.comboBox86:setTop(0);
    obj.comboBox86:setWidth(55);
    obj.comboBox86:setHeight(25);
    obj.comboBox86:setField("dificuldade_3_3");
    obj.comboBox86:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox86:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox86:setName("comboBox86");

    obj.dataLink171 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink171:setParent(obj.layout47);
    obj.dataLink171:setField("dificuldade_3_3");
    obj.dataLink171:setDefaultValue("D");
    obj.dataLink171:setName("dataLink171");

    obj.rectangle89 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout47);
    obj.rectangle89:setLeft(275);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setWidth(25);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout47);
    obj.label133:setLeft(275);
    obj.label133:setTop(3);
    obj.label133:setWidth(25);
    obj.label133:setHeight(20);
    obj.label133:setField("xp_3_3");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.button43 = gui.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout47);
    obj.button43:setLeft(300);
    obj.button43:setTop(3);
    obj.button43:setWidth(20);
    obj.button43:setHeight(20);
    obj.button43:setText("R");
    obj.button43:setName("button43");

    obj.dataLink172 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink172:setParent(obj.layout47);
    obj.dataLink172:setFields({'atr_3_3', 'dificuldade_3_3', 'bonus_3_3', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink172:setName("dataLink172");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout44);
    obj.layout48:setLeft(0);
    obj.layout48:setTop(105);
    obj.layout48:setWidth(325);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout48);
    obj.edit88:setLeft(5);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(85);
    obj.edit88:setHeight(25);
    obj.edit88:setField("pericia_3_4");
    obj.edit88:setName("edit88");

    obj.dataLink173 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink173:setParent(obj.layout48);
    obj.dataLink173:setField("pericia_3_4");
    obj.dataLink173:setDefaultValue("Postura Imóvel");
    obj.dataLink173:setName("dataLink173");

    obj.rectangle90 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout48);
    obj.rectangle90:setLeft(90);
    obj.rectangle90:setTop(0);
    obj.rectangle90:setWidth(40);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout48);
    obj.label134:setLeft(90);
    obj.label134:setTop(3);
    obj.label134:setWidth(40);
    obj.label134:setHeight(20);
    obj.label134:setField("nh_3_4");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.comboBox87 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox87:setParent(obj.layout48);
    obj.comboBox87:setLeft(130);
    obj.comboBox87:setTop(0);
    obj.comboBox87:setWidth(50);
    obj.comboBox87:setHeight(25);
    obj.comboBox87:setField("atr_3_4");
    obj.comboBox87:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox87:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox87:setName("comboBox87");

    obj.dataLink174 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink174:setParent(obj.layout48);
    obj.dataLink174:setField("atr_3_4");
    obj.dataLink174:setDefaultValue("DX");
    obj.dataLink174:setName("dataLink174");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout48);
    obj.label135:setLeft(180);
    obj.label135:setTop(3);
    obj.label135:setWidth(10);
    obj.label135:setHeight(20);
    obj.label135:setText("+");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout48);
    obj.edit89:setLeft(190);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(30);
    obj.edit89:setHeight(25);
    obj.edit89:setType("number");
    obj.edit89:setField("bonus_3_4");
    obj.edit89:setName("edit89");

    obj.comboBox88 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox88:setParent(obj.layout48);
    obj.comboBox88:setLeft(220);
    obj.comboBox88:setTop(0);
    obj.comboBox88:setWidth(55);
    obj.comboBox88:setHeight(25);
    obj.comboBox88:setField("dificuldade_3_4");
    obj.comboBox88:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox88:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox88:setName("comboBox88");

    obj.dataLink175 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink175:setParent(obj.layout48);
    obj.dataLink175:setField("dificuldade_3_4");
    obj.dataLink175:setDefaultValue("D");
    obj.dataLink175:setName("dataLink175");

    obj.rectangle91 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout48);
    obj.rectangle91:setLeft(275);
    obj.rectangle91:setTop(0);
    obj.rectangle91:setWidth(25);
    obj.rectangle91:setHeight(25);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout48);
    obj.label136:setLeft(275);
    obj.label136:setTop(3);
    obj.label136:setWidth(25);
    obj.label136:setHeight(20);
    obj.label136:setField("xp_3_4");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.button44 = gui.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout48);
    obj.button44:setLeft(300);
    obj.button44:setTop(3);
    obj.button44:setWidth(20);
    obj.button44:setHeight(20);
    obj.button44:setText("R");
    obj.button44:setName("button44");

    obj.dataLink176 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink176:setParent(obj.layout48);
    obj.dataLink176:setFields({'atr_3_4', 'dificuldade_3_4', 'bonus_3_4', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink176:setName("dataLink176");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout44);
    obj.layout49:setLeft(0);
    obj.layout49:setTop(130);
    obj.layout49:setWidth(325);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout49);
    obj.edit90:setLeft(5);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(85);
    obj.edit90:setHeight(25);
    obj.edit90:setField("pericia_3_5");
    obj.edit90:setName("edit90");

    obj.dataLink177 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink177:setParent(obj.layout49);
    obj.dataLink177:setField("pericia_3_5");
    obj.dataLink177:setDefaultValue("Perseguição");
    obj.dataLink177:setName("dataLink177");

    obj.rectangle92 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout49);
    obj.rectangle92:setLeft(90);
    obj.rectangle92:setTop(0);
    obj.rectangle92:setWidth(40);
    obj.rectangle92:setHeight(25);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setStrokeColor("white");
    obj.rectangle92:setStrokeSize(1);
    obj.rectangle92:setName("rectangle92");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout49);
    obj.label137:setLeft(90);
    obj.label137:setTop(3);
    obj.label137:setWidth(40);
    obj.label137:setHeight(20);
    obj.label137:setField("nh_3_5");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.comboBox89 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox89:setParent(obj.layout49);
    obj.comboBox89:setLeft(130);
    obj.comboBox89:setTop(0);
    obj.comboBox89:setWidth(50);
    obj.comboBox89:setHeight(25);
    obj.comboBox89:setField("atr_3_5");
    obj.comboBox89:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox89:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox89:setName("comboBox89");

    obj.dataLink178 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink178:setParent(obj.layout49);
    obj.dataLink178:setField("atr_3_5");
    obj.dataLink178:setDefaultValue("IQ");
    obj.dataLink178:setName("dataLink178");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout49);
    obj.label138:setLeft(180);
    obj.label138:setTop(3);
    obj.label138:setWidth(10);
    obj.label138:setHeight(20);
    obj.label138:setText("+");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout49);
    obj.edit91:setLeft(190);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(30);
    obj.edit91:setHeight(25);
    obj.edit91:setType("number");
    obj.edit91:setField("bonus_3_5");
    obj.edit91:setName("edit91");

    obj.comboBox90 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox90:setParent(obj.layout49);
    obj.comboBox90:setLeft(220);
    obj.comboBox90:setTop(0);
    obj.comboBox90:setWidth(55);
    obj.comboBox90:setHeight(25);
    obj.comboBox90:setField("dificuldade_3_5");
    obj.comboBox90:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox90:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox90:setName("comboBox90");

    obj.dataLink179 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink179:setParent(obj.layout49);
    obj.dataLink179:setField("dificuldade_3_5");
    obj.dataLink179:setDefaultValue("M");
    obj.dataLink179:setName("dataLink179");

    obj.rectangle93 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout49);
    obj.rectangle93:setLeft(275);
    obj.rectangle93:setTop(0);
    obj.rectangle93:setWidth(25);
    obj.rectangle93:setHeight(25);
    obj.rectangle93:setColor("black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout49);
    obj.label139:setLeft(275);
    obj.label139:setTop(3);
    obj.label139:setWidth(25);
    obj.label139:setHeight(20);
    obj.label139:setField("xp_3_5");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.button45 = gui.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout49);
    obj.button45:setLeft(300);
    obj.button45:setTop(3);
    obj.button45:setWidth(20);
    obj.button45:setHeight(20);
    obj.button45:setText("R");
    obj.button45:setName("button45");

    obj.dataLink180 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink180:setParent(obj.layout49);
    obj.dataLink180:setFields({'atr_3_5', 'dificuldade_3_5', 'bonus_3_5', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink180:setName("dataLink180");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout44);
    obj.layout50:setLeft(0);
    obj.layout50:setTop(155);
    obj.layout50:setWidth(325);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout50);
    obj.edit92:setLeft(5);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(85);
    obj.edit92:setHeight(25);
    obj.edit92:setField("pericia_3_6");
    obj.edit92:setName("edit92");

    obj.dataLink181 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink181:setParent(obj.layout50);
    obj.dataLink181:setField("pericia_3_6");
    obj.dataLink181:setDefaultValue("Rastreamento");
    obj.dataLink181:setName("dataLink181");

    obj.rectangle94 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout50);
    obj.rectangle94:setLeft(90);
    obj.rectangle94:setTop(0);
    obj.rectangle94:setWidth(40);
    obj.rectangle94:setHeight(25);
    obj.rectangle94:setColor("black");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setName("rectangle94");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout50);
    obj.label140:setLeft(90);
    obj.label140:setTop(3);
    obj.label140:setWidth(40);
    obj.label140:setHeight(20);
    obj.label140:setField("nh_3_6");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.comboBox91 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox91:setParent(obj.layout50);
    obj.comboBox91:setLeft(130);
    obj.comboBox91:setTop(0);
    obj.comboBox91:setWidth(50);
    obj.comboBox91:setHeight(25);
    obj.comboBox91:setField("atr_3_6");
    obj.comboBox91:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox91:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox91:setName("comboBox91");

    obj.dataLink182 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink182:setParent(obj.layout50);
    obj.dataLink182:setField("atr_3_6");
    obj.dataLink182:setDefaultValue("IQ");
    obj.dataLink182:setName("dataLink182");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout50);
    obj.label141:setLeft(180);
    obj.label141:setTop(3);
    obj.label141:setWidth(10);
    obj.label141:setHeight(20);
    obj.label141:setText("+");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout50);
    obj.edit93:setLeft(190);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(30);
    obj.edit93:setHeight(25);
    obj.edit93:setType("number");
    obj.edit93:setField("bonus_3_6");
    obj.edit93:setName("edit93");

    obj.comboBox92 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox92:setParent(obj.layout50);
    obj.comboBox92:setLeft(220);
    obj.comboBox92:setTop(0);
    obj.comboBox92:setWidth(55);
    obj.comboBox92:setHeight(25);
    obj.comboBox92:setField("dificuldade_3_6");
    obj.comboBox92:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox92:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox92:setName("comboBox92");

    obj.dataLink183 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink183:setParent(obj.layout50);
    obj.dataLink183:setField("dificuldade_3_6");
    obj.dataLink183:setDefaultValue("M");
    obj.dataLink183:setName("dataLink183");

    obj.rectangle95 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout50);
    obj.rectangle95:setLeft(275);
    obj.rectangle95:setTop(0);
    obj.rectangle95:setWidth(25);
    obj.rectangle95:setHeight(25);
    obj.rectangle95:setColor("black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout50);
    obj.label142:setLeft(275);
    obj.label142:setTop(3);
    obj.label142:setWidth(25);
    obj.label142:setHeight(20);
    obj.label142:setField("xp_3_6");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.button46 = gui.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout50);
    obj.button46:setLeft(300);
    obj.button46:setTop(3);
    obj.button46:setWidth(20);
    obj.button46:setHeight(20);
    obj.button46:setText("R");
    obj.button46:setName("button46");

    obj.dataLink184 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink184:setParent(obj.layout50);
    obj.dataLink184:setFields({'atr_3_6', 'dificuldade_3_6', 'bonus_3_6', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink184:setName("dataLink184");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout44);
    obj.layout51:setLeft(0);
    obj.layout51:setTop(180);
    obj.layout51:setWidth(325);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout51);
    obj.edit94:setLeft(5);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(85);
    obj.edit94:setHeight(25);
    obj.edit94:setField("pericia_3_7");
    obj.edit94:setName("edit94");

    obj.dataLink185 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink185:setParent(obj.layout51);
    obj.dataLink185:setField("pericia_3_7");
    obj.dataLink185:setDefaultValue("Salto");
    obj.dataLink185:setName("dataLink185");

    obj.rectangle96 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout51);
    obj.rectangle96:setLeft(90);
    obj.rectangle96:setTop(0);
    obj.rectangle96:setWidth(40);
    obj.rectangle96:setHeight(25);
    obj.rectangle96:setColor("black");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setName("rectangle96");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout51);
    obj.label143:setLeft(90);
    obj.label143:setTop(3);
    obj.label143:setWidth(40);
    obj.label143:setHeight(20);
    obj.label143:setField("nh_3_7");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.comboBox93 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox93:setParent(obj.layout51);
    obj.comboBox93:setLeft(130);
    obj.comboBox93:setTop(0);
    obj.comboBox93:setWidth(50);
    obj.comboBox93:setHeight(25);
    obj.comboBox93:setField("atr_3_7");
    obj.comboBox93:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox93:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox93:setName("comboBox93");

    obj.dataLink186 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink186:setParent(obj.layout51);
    obj.dataLink186:setField("atr_3_7");
    obj.dataLink186:setDefaultValue("DX");
    obj.dataLink186:setName("dataLink186");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout51);
    obj.label144:setLeft(180);
    obj.label144:setTop(3);
    obj.label144:setWidth(10);
    obj.label144:setHeight(20);
    obj.label144:setText("+");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout51);
    obj.edit95:setLeft(190);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(30);
    obj.edit95:setHeight(25);
    obj.edit95:setType("number");
    obj.edit95:setField("bonus_3_7");
    obj.edit95:setName("edit95");

    obj.comboBox94 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox94:setParent(obj.layout51);
    obj.comboBox94:setLeft(220);
    obj.comboBox94:setTop(0);
    obj.comboBox94:setWidth(55);
    obj.comboBox94:setHeight(25);
    obj.comboBox94:setField("dificuldade_3_7");
    obj.comboBox94:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox94:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox94:setName("comboBox94");

    obj.dataLink187 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink187:setParent(obj.layout51);
    obj.dataLink187:setField("dificuldade_3_7");
    obj.dataLink187:setDefaultValue("F");
    obj.dataLink187:setName("dataLink187");

    obj.rectangle97 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout51);
    obj.rectangle97:setLeft(275);
    obj.rectangle97:setTop(0);
    obj.rectangle97:setWidth(25);
    obj.rectangle97:setHeight(25);
    obj.rectangle97:setColor("black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout51);
    obj.label145:setLeft(275);
    obj.label145:setTop(3);
    obj.label145:setWidth(25);
    obj.label145:setHeight(20);
    obj.label145:setField("xp_3_7");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.button47 = gui.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout51);
    obj.button47:setLeft(300);
    obj.button47:setTop(3);
    obj.button47:setWidth(20);
    obj.button47:setHeight(20);
    obj.button47:setText("R");
    obj.button47:setName("button47");

    obj.dataLink188 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink188:setParent(obj.layout51);
    obj.dataLink188:setFields({'atr_3_7', 'dificuldade_3_7', 'bonus_3_7', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink188:setName("dataLink188");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout44);
    obj.layout52:setLeft(0);
    obj.layout52:setTop(205);
    obj.layout52:setWidth(325);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout52);
    obj.edit96:setLeft(5);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(85);
    obj.edit96:setHeight(25);
    obj.edit96:setField("pericia_3_8");
    obj.edit96:setName("edit96");

    obj.dataLink189 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink189:setParent(obj.layout52);
    obj.dataLink189:setField("pericia_3_8");
    obj.dataLink189:setDefaultValue("Sobrevivência");
    obj.dataLink189:setName("dataLink189");

    obj.rectangle98 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout52);
    obj.rectangle98:setLeft(90);
    obj.rectangle98:setTop(0);
    obj.rectangle98:setWidth(40);
    obj.rectangle98:setHeight(25);
    obj.rectangle98:setColor("black");
    obj.rectangle98:setStrokeColor("white");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setName("rectangle98");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout52);
    obj.label146:setLeft(90);
    obj.label146:setTop(3);
    obj.label146:setWidth(40);
    obj.label146:setHeight(20);
    obj.label146:setField("nh_3_8");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.comboBox95 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox95:setParent(obj.layout52);
    obj.comboBox95:setLeft(130);
    obj.comboBox95:setTop(0);
    obj.comboBox95:setWidth(50);
    obj.comboBox95:setHeight(25);
    obj.comboBox95:setField("atr_3_8");
    obj.comboBox95:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox95:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox95:setName("comboBox95");

    obj.dataLink190 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink190:setParent(obj.layout52);
    obj.dataLink190:setField("atr_3_8");
    obj.dataLink190:setDefaultValue("IQ");
    obj.dataLink190:setName("dataLink190");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout52);
    obj.label147:setLeft(180);
    obj.label147:setTop(3);
    obj.label147:setWidth(10);
    obj.label147:setHeight(20);
    obj.label147:setText("+");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout52);
    obj.edit97:setLeft(190);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(30);
    obj.edit97:setHeight(25);
    obj.edit97:setType("number");
    obj.edit97:setField("bonus_3_8");
    obj.edit97:setName("edit97");

    obj.comboBox96 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox96:setParent(obj.layout52);
    obj.comboBox96:setLeft(220);
    obj.comboBox96:setTop(0);
    obj.comboBox96:setWidth(55);
    obj.comboBox96:setHeight(25);
    obj.comboBox96:setField("dificuldade_3_8");
    obj.comboBox96:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox96:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox96:setName("comboBox96");

    obj.dataLink191 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink191:setParent(obj.layout52);
    obj.dataLink191:setField("dificuldade_3_8");
    obj.dataLink191:setDefaultValue("M");
    obj.dataLink191:setName("dataLink191");

    obj.rectangle99 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout52);
    obj.rectangle99:setLeft(275);
    obj.rectangle99:setTop(0);
    obj.rectangle99:setWidth(25);
    obj.rectangle99:setHeight(25);
    obj.rectangle99:setColor("black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout52);
    obj.label148:setLeft(275);
    obj.label148:setTop(3);
    obj.label148:setWidth(25);
    obj.label148:setHeight(20);
    obj.label148:setField("xp_3_8");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.button48 = gui.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout52);
    obj.button48:setLeft(300);
    obj.button48:setTop(3);
    obj.button48:setWidth(20);
    obj.button48:setHeight(20);
    obj.button48:setText("R");
    obj.button48:setName("button48");

    obj.dataLink192 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink192:setParent(obj.layout52);
    obj.dataLink192:setFields({'atr_3_8', 'dificuldade_3_8', 'bonus_3_8', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink192:setName("dataLink192");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout44);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(230);
    obj.layout53:setWidth(325);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout53);
    obj.edit98:setLeft(5);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(85);
    obj.edit98:setHeight(25);
    obj.edit98:setField("pericia_3_9");
    obj.edit98:setName("edit98");

    obj.dataLink193 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink193:setParent(obj.layout53);
    obj.dataLink193:setField("pericia_3_9");
    obj.dataLink193:setDefaultValue("Trato Social (Nobreza)");
    obj.dataLink193:setName("dataLink193");

    obj.rectangle100 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout53);
    obj.rectangle100:setLeft(90);
    obj.rectangle100:setTop(0);
    obj.rectangle100:setWidth(40);
    obj.rectangle100:setHeight(25);
    obj.rectangle100:setColor("black");
    obj.rectangle100:setStrokeColor("white");
    obj.rectangle100:setStrokeSize(1);
    obj.rectangle100:setName("rectangle100");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout53);
    obj.label149:setLeft(90);
    obj.label149:setTop(3);
    obj.label149:setWidth(40);
    obj.label149:setHeight(20);
    obj.label149:setField("nh_3_9");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.comboBox97 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox97:setParent(obj.layout53);
    obj.comboBox97:setLeft(130);
    obj.comboBox97:setTop(0);
    obj.comboBox97:setWidth(50);
    obj.comboBox97:setHeight(25);
    obj.comboBox97:setField("atr_3_9");
    obj.comboBox97:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox97:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox97:setName("comboBox97");

    obj.dataLink194 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink194:setParent(obj.layout53);
    obj.dataLink194:setField("atr_3_9");
    obj.dataLink194:setDefaultValue("IQ");
    obj.dataLink194:setName("dataLink194");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout53);
    obj.label150:setLeft(180);
    obj.label150:setTop(3);
    obj.label150:setWidth(10);
    obj.label150:setHeight(20);
    obj.label150:setText("+");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout53);
    obj.edit99:setLeft(190);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(30);
    obj.edit99:setHeight(25);
    obj.edit99:setType("number");
    obj.edit99:setField("bonus_3_9");
    obj.edit99:setName("edit99");

    obj.comboBox98 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox98:setParent(obj.layout53);
    obj.comboBox98:setLeft(220);
    obj.comboBox98:setTop(0);
    obj.comboBox98:setWidth(55);
    obj.comboBox98:setHeight(25);
    obj.comboBox98:setField("dificuldade_3_9");
    obj.comboBox98:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox98:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox98:setName("comboBox98");

    obj.dataLink195 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink195:setParent(obj.layout53);
    obj.dataLink195:setField("dificuldade_3_9");
    obj.dataLink195:setDefaultValue("F");
    obj.dataLink195:setName("dataLink195");

    obj.rectangle101 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout53);
    obj.rectangle101:setLeft(275);
    obj.rectangle101:setTop(0);
    obj.rectangle101:setWidth(25);
    obj.rectangle101:setHeight(25);
    obj.rectangle101:setColor("black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout53);
    obj.label151:setLeft(275);
    obj.label151:setTop(3);
    obj.label151:setWidth(25);
    obj.label151:setHeight(20);
    obj.label151:setField("xp_3_9");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.button49 = gui.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout53);
    obj.button49:setLeft(300);
    obj.button49:setTop(3);
    obj.button49:setWidth(20);
    obj.button49:setHeight(20);
    obj.button49:setText("R");
    obj.button49:setName("button49");

    obj.dataLink196 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink196:setParent(obj.layout53);
    obj.dataLink196:setFields({'atr_3_9', 'dificuldade_3_9', 'bonus_3_9', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink196:setName("dataLink196");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout44);
    obj.layout54:setLeft(0);
    obj.layout54:setTop(255);
    obj.layout54:setWidth(325);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout54);
    obj.edit100:setLeft(5);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(85);
    obj.edit100:setHeight(25);
    obj.edit100:setField("pericia_3_10");
    obj.edit100:setName("edit100");

    obj.dataLink197 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink197:setParent(obj.layout54);
    obj.dataLink197:setField("pericia_3_10");
    obj.dataLink197:setDefaultValue("Trato Social (Espectro)");
    obj.dataLink197:setName("dataLink197");

    obj.rectangle102 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout54);
    obj.rectangle102:setLeft(90);
    obj.rectangle102:setTop(0);
    obj.rectangle102:setWidth(40);
    obj.rectangle102:setHeight(25);
    obj.rectangle102:setColor("black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout54);
    obj.label152:setLeft(90);
    obj.label152:setTop(3);
    obj.label152:setWidth(40);
    obj.label152:setHeight(20);
    obj.label152:setField("nh_3_10");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.comboBox99 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox99:setParent(obj.layout54);
    obj.comboBox99:setLeft(130);
    obj.comboBox99:setTop(0);
    obj.comboBox99:setWidth(50);
    obj.comboBox99:setHeight(25);
    obj.comboBox99:setField("atr_3_10");
    obj.comboBox99:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox99:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox99:setName("comboBox99");

    obj.dataLink198 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink198:setParent(obj.layout54);
    obj.dataLink198:setField("atr_3_10");
    obj.dataLink198:setDefaultValue("IQ");
    obj.dataLink198:setName("dataLink198");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout54);
    obj.label153:setLeft(180);
    obj.label153:setTop(3);
    obj.label153:setWidth(10);
    obj.label153:setHeight(20);
    obj.label153:setText("+");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout54);
    obj.edit101:setLeft(190);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(30);
    obj.edit101:setHeight(25);
    obj.edit101:setType("number");
    obj.edit101:setField("bonus_3_10");
    obj.edit101:setName("edit101");

    obj.comboBox100 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox100:setParent(obj.layout54);
    obj.comboBox100:setLeft(220);
    obj.comboBox100:setTop(0);
    obj.comboBox100:setWidth(55);
    obj.comboBox100:setHeight(25);
    obj.comboBox100:setField("dificuldade_3_10");
    obj.comboBox100:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox100:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox100:setName("comboBox100");

    obj.dataLink199 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink199:setParent(obj.layout54);
    obj.dataLink199:setField("dificuldade_3_10");
    obj.dataLink199:setDefaultValue("F");
    obj.dataLink199:setName("dataLink199");

    obj.rectangle103 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout54);
    obj.rectangle103:setLeft(275);
    obj.rectangle103:setTop(0);
    obj.rectangle103:setWidth(25);
    obj.rectangle103:setHeight(25);
    obj.rectangle103:setColor("black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout54);
    obj.label154:setLeft(275);
    obj.label154:setTop(3);
    obj.label154:setWidth(25);
    obj.label154:setHeight(20);
    obj.label154:setField("xp_3_10");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.button50 = gui.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout54);
    obj.button50:setLeft(300);
    obj.button50:setTop(3);
    obj.button50:setWidth(20);
    obj.button50:setHeight(20);
    obj.button50:setText("R");
    obj.button50:setName("button50");

    obj.dataLink200 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink200:setParent(obj.layout54);
    obj.dataLink200:setFields({'atr_3_10', 'dificuldade_3_10', 'bonus_3_10', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink200:setName("dataLink200");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout44);
    obj.layout55:setLeft(0);
    obj.layout55:setTop(280);
    obj.layout55:setWidth(325);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout55);
    obj.edit102:setLeft(5);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(85);
    obj.edit102:setHeight(25);
    obj.edit102:setField("pericia_3_11");
    obj.edit102:setName("edit102");

    obj.dataLink201 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink201:setParent(obj.layout55);
    obj.dataLink201:setField("pericia_3_11");
    obj.dataLink201:setDefaultValue("Trato Social (Guerreiro)");
    obj.dataLink201:setName("dataLink201");

    obj.rectangle104 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout55);
    obj.rectangle104:setLeft(90);
    obj.rectangle104:setTop(0);
    obj.rectangle104:setWidth(40);
    obj.rectangle104:setHeight(25);
    obj.rectangle104:setColor("black");
    obj.rectangle104:setStrokeColor("white");
    obj.rectangle104:setStrokeSize(1);
    obj.rectangle104:setName("rectangle104");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout55);
    obj.label155:setLeft(90);
    obj.label155:setTop(3);
    obj.label155:setWidth(40);
    obj.label155:setHeight(20);
    obj.label155:setField("nh_3_11");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.comboBox101 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox101:setParent(obj.layout55);
    obj.comboBox101:setLeft(130);
    obj.comboBox101:setTop(0);
    obj.comboBox101:setWidth(50);
    obj.comboBox101:setHeight(25);
    obj.comboBox101:setField("atr_3_11");
    obj.comboBox101:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox101:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox101:setName("comboBox101");

    obj.dataLink202 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink202:setParent(obj.layout55);
    obj.dataLink202:setField("atr_3_11");
    obj.dataLink202:setDefaultValue("IQ");
    obj.dataLink202:setName("dataLink202");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout55);
    obj.label156:setLeft(180);
    obj.label156:setTop(3);
    obj.label156:setWidth(10);
    obj.label156:setHeight(20);
    obj.label156:setText("+");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout55);
    obj.edit103:setLeft(190);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(30);
    obj.edit103:setHeight(25);
    obj.edit103:setType("number");
    obj.edit103:setField("bonus_3_11");
    obj.edit103:setName("edit103");

    obj.comboBox102 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox102:setParent(obj.layout55);
    obj.comboBox102:setLeft(220);
    obj.comboBox102:setTop(0);
    obj.comboBox102:setWidth(55);
    obj.comboBox102:setHeight(25);
    obj.comboBox102:setField("dificuldade_3_11");
    obj.comboBox102:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox102:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox102:setName("comboBox102");

    obj.dataLink203 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink203:setParent(obj.layout55);
    obj.dataLink203:setField("dificuldade_3_11");
    obj.dataLink203:setDefaultValue("F");
    obj.dataLink203:setName("dataLink203");

    obj.rectangle105 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout55);
    obj.rectangle105:setLeft(275);
    obj.rectangle105:setTop(0);
    obj.rectangle105:setWidth(25);
    obj.rectangle105:setHeight(25);
    obj.rectangle105:setColor("black");
    obj.rectangle105:setStrokeColor("white");
    obj.rectangle105:setStrokeSize(1);
    obj.rectangle105:setName("rectangle105");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout55);
    obj.label157:setLeft(275);
    obj.label157:setTop(3);
    obj.label157:setWidth(25);
    obj.label157:setHeight(20);
    obj.label157:setField("xp_3_11");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.button51 = gui.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout55);
    obj.button51:setLeft(300);
    obj.button51:setTop(3);
    obj.button51:setWidth(20);
    obj.button51:setHeight(20);
    obj.button51:setText("R");
    obj.button51:setName("button51");

    obj.dataLink204 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink204:setParent(obj.layout55);
    obj.dataLink204:setFields({'atr_3_11', 'dificuldade_3_11', 'bonus_3_11', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink204:setName("dataLink204");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout44);
    obj.layout56:setLeft(0);
    obj.layout56:setTop(305);
    obj.layout56:setWidth(325);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout56);
    obj.edit104:setLeft(5);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(85);
    obj.edit104:setHeight(25);
    obj.edit104:setField("pericia_3_12");
    obj.edit104:setName("edit104");

    obj.dataLink205 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink205:setParent(obj.layout56);
    obj.dataLink205:setField("pericia_3_12");
    obj.dataLink205:setDefaultValue("Trato Social (Berserk)");
    obj.dataLink205:setName("dataLink205");

    obj.rectangle106 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout56);
    obj.rectangle106:setLeft(90);
    obj.rectangle106:setTop(0);
    obj.rectangle106:setWidth(40);
    obj.rectangle106:setHeight(25);
    obj.rectangle106:setColor("black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout56);
    obj.label158:setLeft(90);
    obj.label158:setTop(3);
    obj.label158:setWidth(40);
    obj.label158:setHeight(20);
    obj.label158:setField("nh_3_12");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.comboBox103 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox103:setParent(obj.layout56);
    obj.comboBox103:setLeft(130);
    obj.comboBox103:setTop(0);
    obj.comboBox103:setWidth(50);
    obj.comboBox103:setHeight(25);
    obj.comboBox103:setField("atr_3_12");
    obj.comboBox103:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox103:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox103:setName("comboBox103");

    obj.dataLink206 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink206:setParent(obj.layout56);
    obj.dataLink206:setField("atr_3_12");
    obj.dataLink206:setDefaultValue("IQ");
    obj.dataLink206:setName("dataLink206");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout56);
    obj.label159:setLeft(180);
    obj.label159:setTop(3);
    obj.label159:setWidth(10);
    obj.label159:setHeight(20);
    obj.label159:setText("+");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout56);
    obj.edit105:setLeft(190);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(30);
    obj.edit105:setHeight(25);
    obj.edit105:setType("number");
    obj.edit105:setField("bonus_3_12");
    obj.edit105:setName("edit105");

    obj.comboBox104 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox104:setParent(obj.layout56);
    obj.comboBox104:setLeft(220);
    obj.comboBox104:setTop(0);
    obj.comboBox104:setWidth(55);
    obj.comboBox104:setHeight(25);
    obj.comboBox104:setField("dificuldade_3_12");
    obj.comboBox104:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox104:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox104:setName("comboBox104");

    obj.dataLink207 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink207:setParent(obj.layout56);
    obj.dataLink207:setField("dificuldade_3_12");
    obj.dataLink207:setDefaultValue("F");
    obj.dataLink207:setName("dataLink207");

    obj.rectangle107 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout56);
    obj.rectangle107:setLeft(275);
    obj.rectangle107:setTop(0);
    obj.rectangle107:setWidth(25);
    obj.rectangle107:setHeight(25);
    obj.rectangle107:setColor("black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout56);
    obj.label160:setLeft(275);
    obj.label160:setTop(3);
    obj.label160:setWidth(25);
    obj.label160:setHeight(20);
    obj.label160:setField("xp_3_12");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.button52 = gui.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout56);
    obj.button52:setLeft(300);
    obj.button52:setTop(3);
    obj.button52:setWidth(20);
    obj.button52:setHeight(20);
    obj.button52:setText("R");
    obj.button52:setName("button52");

    obj.dataLink208 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink208:setParent(obj.layout56);
    obj.dataLink208:setFields({'atr_3_12', 'dificuldade_3_12', 'bonus_3_12', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink208:setName("dataLink208");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout44);
    obj.layout57:setLeft(0);
    obj.layout57:setTop(330);
    obj.layout57:setWidth(325);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout57);
    obj.edit106:setLeft(5);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(85);
    obj.edit106:setHeight(25);
    obj.edit106:setField("pericia_3_13");
    obj.edit106:setName("edit106");

    obj.dataLink209 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink209:setParent(obj.layout57);
    obj.dataLink209:setField("pericia_3_13");
    obj.dataLink209:setDefaultValue("Trato Social (Marinas)");
    obj.dataLink209:setName("dataLink209");

    obj.rectangle108 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout57);
    obj.rectangle108:setLeft(90);
    obj.rectangle108:setTop(0);
    obj.rectangle108:setWidth(40);
    obj.rectangle108:setHeight(25);
    obj.rectangle108:setColor("black");
    obj.rectangle108:setStrokeColor("white");
    obj.rectangle108:setStrokeSize(1);
    obj.rectangle108:setName("rectangle108");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout57);
    obj.label161:setLeft(90);
    obj.label161:setTop(3);
    obj.label161:setWidth(40);
    obj.label161:setHeight(20);
    obj.label161:setField("nh_3_13");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.comboBox105 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox105:setParent(obj.layout57);
    obj.comboBox105:setLeft(130);
    obj.comboBox105:setTop(0);
    obj.comboBox105:setWidth(50);
    obj.comboBox105:setHeight(25);
    obj.comboBox105:setField("atr_3_13");
    obj.comboBox105:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox105:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox105:setName("comboBox105");

    obj.dataLink210 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink210:setParent(obj.layout57);
    obj.dataLink210:setField("atr_3_13");
    obj.dataLink210:setDefaultValue("IQ");
    obj.dataLink210:setName("dataLink210");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout57);
    obj.label162:setLeft(180);
    obj.label162:setTop(3);
    obj.label162:setWidth(10);
    obj.label162:setHeight(20);
    obj.label162:setText("+");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout57);
    obj.edit107:setLeft(190);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(30);
    obj.edit107:setHeight(25);
    obj.edit107:setType("number");
    obj.edit107:setField("bonus_3_13");
    obj.edit107:setName("edit107");

    obj.comboBox106 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox106:setParent(obj.layout57);
    obj.comboBox106:setLeft(220);
    obj.comboBox106:setTop(0);
    obj.comboBox106:setWidth(55);
    obj.comboBox106:setHeight(25);
    obj.comboBox106:setField("dificuldade_3_13");
    obj.comboBox106:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox106:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox106:setName("comboBox106");

    obj.dataLink211 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink211:setParent(obj.layout57);
    obj.dataLink211:setField("dificuldade_3_13");
    obj.dataLink211:setDefaultValue("F");
    obj.dataLink211:setName("dataLink211");

    obj.rectangle109 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout57);
    obj.rectangle109:setLeft(275);
    obj.rectangle109:setTop(0);
    obj.rectangle109:setWidth(25);
    obj.rectangle109:setHeight(25);
    obj.rectangle109:setColor("black");
    obj.rectangle109:setStrokeColor("white");
    obj.rectangle109:setStrokeSize(1);
    obj.rectangle109:setName("rectangle109");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout57);
    obj.label163:setLeft(275);
    obj.label163:setTop(3);
    obj.label163:setWidth(25);
    obj.label163:setHeight(20);
    obj.label163:setField("xp_3_13");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.button53 = gui.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout57);
    obj.button53:setLeft(300);
    obj.button53:setTop(3);
    obj.button53:setWidth(20);
    obj.button53:setHeight(20);
    obj.button53:setText("R");
    obj.button53:setName("button53");

    obj.dataLink212 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink212:setParent(obj.layout57);
    obj.dataLink212:setFields({'atr_3_13', 'dificuldade_3_13', 'bonus_3_13', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink212:setName("dataLink212");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout44);
    obj.layout58:setLeft(0);
    obj.layout58:setTop(355);
    obj.layout58:setWidth(325);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout58);
    obj.edit108:setLeft(5);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(85);
    obj.edit108:setHeight(25);
    obj.edit108:setField("pericia_3_14");
    obj.edit108:setName("edit108");

    obj.dataLink213 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink213:setParent(obj.layout58);
    obj.dataLink213:setField("pericia_3_14");
    obj.dataLink213:setDefaultValue("Trato Social (Santos)");
    obj.dataLink213:setName("dataLink213");

    obj.rectangle110 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout58);
    obj.rectangle110:setLeft(90);
    obj.rectangle110:setTop(0);
    obj.rectangle110:setWidth(40);
    obj.rectangle110:setHeight(25);
    obj.rectangle110:setColor("black");
    obj.rectangle110:setStrokeColor("white");
    obj.rectangle110:setStrokeSize(1);
    obj.rectangle110:setName("rectangle110");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout58);
    obj.label164:setLeft(90);
    obj.label164:setTop(3);
    obj.label164:setWidth(40);
    obj.label164:setHeight(20);
    obj.label164:setField("nh_3_14");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.comboBox107 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox107:setParent(obj.layout58);
    obj.comboBox107:setLeft(130);
    obj.comboBox107:setTop(0);
    obj.comboBox107:setWidth(50);
    obj.comboBox107:setHeight(25);
    obj.comboBox107:setField("atr_3_14");
    obj.comboBox107:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox107:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox107:setName("comboBox107");

    obj.dataLink214 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink214:setParent(obj.layout58);
    obj.dataLink214:setField("atr_3_14");
    obj.dataLink214:setDefaultValue("IQ");
    obj.dataLink214:setName("dataLink214");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout58);
    obj.label165:setLeft(180);
    obj.label165:setTop(3);
    obj.label165:setWidth(10);
    obj.label165:setHeight(20);
    obj.label165:setText("+");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout58);
    obj.edit109:setLeft(190);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(30);
    obj.edit109:setHeight(25);
    obj.edit109:setType("number");
    obj.edit109:setField("bonus_3_14");
    obj.edit109:setName("edit109");

    obj.comboBox108 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox108:setParent(obj.layout58);
    obj.comboBox108:setLeft(220);
    obj.comboBox108:setTop(0);
    obj.comboBox108:setWidth(55);
    obj.comboBox108:setHeight(25);
    obj.comboBox108:setField("dificuldade_3_14");
    obj.comboBox108:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox108:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox108:setName("comboBox108");

    obj.dataLink215 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink215:setParent(obj.layout58);
    obj.dataLink215:setField("dificuldade_3_14");
    obj.dataLink215:setDefaultValue("F");
    obj.dataLink215:setName("dataLink215");

    obj.rectangle111 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout58);
    obj.rectangle111:setLeft(275);
    obj.rectangle111:setTop(0);
    obj.rectangle111:setWidth(25);
    obj.rectangle111:setHeight(25);
    obj.rectangle111:setColor("black");
    obj.rectangle111:setStrokeColor("white");
    obj.rectangle111:setStrokeSize(1);
    obj.rectangle111:setName("rectangle111");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout58);
    obj.label166:setLeft(275);
    obj.label166:setTop(3);
    obj.label166:setWidth(25);
    obj.label166:setHeight(20);
    obj.label166:setField("xp_3_14");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.button54 = gui.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout58);
    obj.button54:setLeft(300);
    obj.button54:setTop(3);
    obj.button54:setWidth(20);
    obj.button54:setHeight(20);
    obj.button54:setText("R");
    obj.button54:setName("button54");

    obj.dataLink216 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink216:setParent(obj.layout58);
    obj.dataLink216:setFields({'atr_3_14', 'dificuldade_3_14', 'bonus_3_14', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink216:setName("dataLink216");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout44);
    obj.layout59:setLeft(0);
    obj.layout59:setTop(380);
    obj.layout59:setWidth(325);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout59);
    obj.edit110:setLeft(5);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(85);
    obj.edit110:setHeight(25);
    obj.edit110:setField("pericia_3_15");
    obj.edit110:setName("edit110");

    obj.dataLink217 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink217:setParent(obj.layout59);
    obj.dataLink217:setField("pericia_3_15");
    obj.dataLink217:setDefaultValue("Teologia (Hipermito)");
    obj.dataLink217:setName("dataLink217");

    obj.rectangle112 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout59);
    obj.rectangle112:setLeft(90);
    obj.rectangle112:setTop(0);
    obj.rectangle112:setWidth(40);
    obj.rectangle112:setHeight(25);
    obj.rectangle112:setColor("black");
    obj.rectangle112:setStrokeColor("white");
    obj.rectangle112:setStrokeSize(1);
    obj.rectangle112:setName("rectangle112");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout59);
    obj.label167:setLeft(90);
    obj.label167:setTop(3);
    obj.label167:setWidth(40);
    obj.label167:setHeight(20);
    obj.label167:setField("nh_3_15");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.comboBox109 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox109:setParent(obj.layout59);
    obj.comboBox109:setLeft(130);
    obj.comboBox109:setTop(0);
    obj.comboBox109:setWidth(50);
    obj.comboBox109:setHeight(25);
    obj.comboBox109:setField("atr_3_15");
    obj.comboBox109:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox109:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox109:setName("comboBox109");

    obj.dataLink218 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink218:setParent(obj.layout59);
    obj.dataLink218:setField("atr_3_15");
    obj.dataLink218:setDefaultValue("IQ");
    obj.dataLink218:setName("dataLink218");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout59);
    obj.label168:setLeft(180);
    obj.label168:setTop(3);
    obj.label168:setWidth(10);
    obj.label168:setHeight(20);
    obj.label168:setText("+");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout59);
    obj.edit111:setLeft(190);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(30);
    obj.edit111:setHeight(25);
    obj.edit111:setType("number");
    obj.edit111:setField("bonus_3_15");
    obj.edit111:setName("edit111");

    obj.comboBox110 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox110:setParent(obj.layout59);
    obj.comboBox110:setLeft(220);
    obj.comboBox110:setTop(0);
    obj.comboBox110:setWidth(55);
    obj.comboBox110:setHeight(25);
    obj.comboBox110:setField("dificuldade_3_15");
    obj.comboBox110:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox110:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox110:setName("comboBox110");

    obj.dataLink219 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink219:setParent(obj.layout59);
    obj.dataLink219:setField("dificuldade_3_15");
    obj.dataLink219:setDefaultValue("D");
    obj.dataLink219:setName("dataLink219");

    obj.rectangle113 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout59);
    obj.rectangle113:setLeft(275);
    obj.rectangle113:setTop(0);
    obj.rectangle113:setWidth(25);
    obj.rectangle113:setHeight(25);
    obj.rectangle113:setColor("black");
    obj.rectangle113:setStrokeColor("white");
    obj.rectangle113:setStrokeSize(1);
    obj.rectangle113:setName("rectangle113");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout59);
    obj.label169:setLeft(275);
    obj.label169:setTop(3);
    obj.label169:setWidth(25);
    obj.label169:setHeight(20);
    obj.label169:setField("xp_3_15");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.button55 = gui.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout59);
    obj.button55:setLeft(300);
    obj.button55:setTop(3);
    obj.button55:setWidth(20);
    obj.button55:setHeight(20);
    obj.button55:setText("R");
    obj.button55:setName("button55");

    obj.dataLink220 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink220:setParent(obj.layout59);
    obj.dataLink220:setFields({'atr_3_15', 'dificuldade_3_15', 'bonus_3_15', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink220:setName("dataLink220");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout44);
    obj.layout60:setLeft(0);
    obj.layout60:setTop(405);
    obj.layout60:setWidth(325);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout60);
    obj.edit112:setLeft(5);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(85);
    obj.edit112:setHeight(25);
    obj.edit112:setField("pericia_3_16");
    obj.edit112:setName("edit112");

    obj.dataLink221 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink221:setParent(obj.layout60);
    obj.dataLink221:setField("pericia_3_16");
    obj.dataLink221:setDefaultValue("Técnica de Ataque 1");
    obj.dataLink221:setName("dataLink221");

    obj.rectangle114 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout60);
    obj.rectangle114:setLeft(90);
    obj.rectangle114:setTop(0);
    obj.rectangle114:setWidth(40);
    obj.rectangle114:setHeight(25);
    obj.rectangle114:setColor("black");
    obj.rectangle114:setStrokeColor("white");
    obj.rectangle114:setStrokeSize(1);
    obj.rectangle114:setName("rectangle114");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout60);
    obj.label170:setLeft(90);
    obj.label170:setTop(3);
    obj.label170:setWidth(40);
    obj.label170:setHeight(20);
    obj.label170:setField("nh_3_16");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.comboBox111 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox111:setParent(obj.layout60);
    obj.comboBox111:setLeft(130);
    obj.comboBox111:setTop(0);
    obj.comboBox111:setWidth(50);
    obj.comboBox111:setHeight(25);
    obj.comboBox111:setField("atr_3_16");
    obj.comboBox111:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox111:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox111:setName("comboBox111");

    obj.dataLink222 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink222:setParent(obj.layout60);
    obj.dataLink222:setField("atr_3_16");
    obj.dataLink222:setDefaultValue("DX");
    obj.dataLink222:setName("dataLink222");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout60);
    obj.label171:setLeft(180);
    obj.label171:setTop(3);
    obj.label171:setWidth(10);
    obj.label171:setHeight(20);
    obj.label171:setText("+");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout60);
    obj.edit113:setLeft(190);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(30);
    obj.edit113:setHeight(25);
    obj.edit113:setType("number");
    obj.edit113:setField("bonus_3_16");
    obj.edit113:setName("edit113");

    obj.comboBox112 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox112:setParent(obj.layout60);
    obj.comboBox112:setLeft(220);
    obj.comboBox112:setTop(0);
    obj.comboBox112:setWidth(55);
    obj.comboBox112:setHeight(25);
    obj.comboBox112:setField("dificuldade_3_16");
    obj.comboBox112:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox112:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox112:setName("comboBox112");

    obj.dataLink223 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink223:setParent(obj.layout60);
    obj.dataLink223:setField("dificuldade_3_16");
    obj.dataLink223:setDefaultValue("F");
    obj.dataLink223:setName("dataLink223");

    obj.rectangle115 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout60);
    obj.rectangle115:setLeft(275);
    obj.rectangle115:setTop(0);
    obj.rectangle115:setWidth(25);
    obj.rectangle115:setHeight(25);
    obj.rectangle115:setColor("black");
    obj.rectangle115:setStrokeColor("white");
    obj.rectangle115:setStrokeSize(1);
    obj.rectangle115:setName("rectangle115");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout60);
    obj.label172:setLeft(275);
    obj.label172:setTop(3);
    obj.label172:setWidth(25);
    obj.label172:setHeight(20);
    obj.label172:setField("xp_3_16");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.button56 = gui.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout60);
    obj.button56:setLeft(300);
    obj.button56:setTop(3);
    obj.button56:setWidth(20);
    obj.button56:setHeight(20);
    obj.button56:setText("R");
    obj.button56:setName("button56");

    obj.dataLink224 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink224:setParent(obj.layout60);
    obj.dataLink224:setFields({'atr_3_16', 'dificuldade_3_16', 'bonus_3_16', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink224:setName("dataLink224");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout44);
    obj.layout61:setLeft(0);
    obj.layout61:setTop(430);
    obj.layout61:setWidth(325);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout61);
    obj.edit114:setLeft(5);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(85);
    obj.edit114:setHeight(25);
    obj.edit114:setField("pericia_3_17");
    obj.edit114:setName("edit114");

    obj.dataLink225 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink225:setParent(obj.layout61);
    obj.dataLink225:setField("pericia_3_17");
    obj.dataLink225:setDefaultValue("Técnica de Ataque 2");
    obj.dataLink225:setName("dataLink225");

    obj.rectangle116 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout61);
    obj.rectangle116:setLeft(90);
    obj.rectangle116:setTop(0);
    obj.rectangle116:setWidth(40);
    obj.rectangle116:setHeight(25);
    obj.rectangle116:setColor("black");
    obj.rectangle116:setStrokeColor("white");
    obj.rectangle116:setStrokeSize(1);
    obj.rectangle116:setName("rectangle116");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout61);
    obj.label173:setLeft(90);
    obj.label173:setTop(3);
    obj.label173:setWidth(40);
    obj.label173:setHeight(20);
    obj.label173:setField("nh_3_17");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.comboBox113 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox113:setParent(obj.layout61);
    obj.comboBox113:setLeft(130);
    obj.comboBox113:setTop(0);
    obj.comboBox113:setWidth(50);
    obj.comboBox113:setHeight(25);
    obj.comboBox113:setField("atr_3_17");
    obj.comboBox113:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox113:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox113:setName("comboBox113");

    obj.dataLink226 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink226:setParent(obj.layout61);
    obj.dataLink226:setField("atr_3_17");
    obj.dataLink226:setDefaultValue("DX");
    obj.dataLink226:setName("dataLink226");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout61);
    obj.label174:setLeft(180);
    obj.label174:setTop(3);
    obj.label174:setWidth(10);
    obj.label174:setHeight(20);
    obj.label174:setText("+");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout61);
    obj.edit115:setLeft(190);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(30);
    obj.edit115:setHeight(25);
    obj.edit115:setType("number");
    obj.edit115:setField("bonus_3_17");
    obj.edit115:setName("edit115");

    obj.comboBox114 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox114:setParent(obj.layout61);
    obj.comboBox114:setLeft(220);
    obj.comboBox114:setTop(0);
    obj.comboBox114:setWidth(55);
    obj.comboBox114:setHeight(25);
    obj.comboBox114:setField("dificuldade_3_17");
    obj.comboBox114:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox114:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox114:setName("comboBox114");

    obj.dataLink227 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink227:setParent(obj.layout61);
    obj.dataLink227:setField("dificuldade_3_17");
    obj.dataLink227:setDefaultValue("F");
    obj.dataLink227:setName("dataLink227");

    obj.rectangle117 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout61);
    obj.rectangle117:setLeft(275);
    obj.rectangle117:setTop(0);
    obj.rectangle117:setWidth(25);
    obj.rectangle117:setHeight(25);
    obj.rectangle117:setColor("black");
    obj.rectangle117:setStrokeColor("white");
    obj.rectangle117:setStrokeSize(1);
    obj.rectangle117:setName("rectangle117");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout61);
    obj.label175:setLeft(275);
    obj.label175:setTop(3);
    obj.label175:setWidth(25);
    obj.label175:setHeight(20);
    obj.label175:setField("xp_3_17");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.button57 = gui.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout61);
    obj.button57:setLeft(300);
    obj.button57:setTop(3);
    obj.button57:setWidth(20);
    obj.button57:setHeight(20);
    obj.button57:setText("R");
    obj.button57:setName("button57");

    obj.dataLink228 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink228:setParent(obj.layout61);
    obj.dataLink228:setFields({'atr_3_17', 'dificuldade_3_17', 'bonus_3_17', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink228:setName("dataLink228");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout44);
    obj.layout62:setLeft(0);
    obj.layout62:setTop(455);
    obj.layout62:setWidth(325);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout62);
    obj.edit116:setLeft(5);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(85);
    obj.edit116:setHeight(25);
    obj.edit116:setField("pericia_3_18");
    obj.edit116:setName("edit116");

    obj.dataLink229 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink229:setParent(obj.layout62);
    obj.dataLink229:setField("pericia_3_18");
    obj.dataLink229:setDefaultValue("Técnica de Ataque 3");
    obj.dataLink229:setName("dataLink229");

    obj.rectangle118 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout62);
    obj.rectangle118:setLeft(90);
    obj.rectangle118:setTop(0);
    obj.rectangle118:setWidth(40);
    obj.rectangle118:setHeight(25);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setStrokeColor("white");
    obj.rectangle118:setStrokeSize(1);
    obj.rectangle118:setName("rectangle118");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout62);
    obj.label176:setLeft(90);
    obj.label176:setTop(3);
    obj.label176:setWidth(40);
    obj.label176:setHeight(20);
    obj.label176:setField("nh_3_18");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.comboBox115 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox115:setParent(obj.layout62);
    obj.comboBox115:setLeft(130);
    obj.comboBox115:setTop(0);
    obj.comboBox115:setWidth(50);
    obj.comboBox115:setHeight(25);
    obj.comboBox115:setField("atr_3_18");
    obj.comboBox115:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox115:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox115:setName("comboBox115");

    obj.dataLink230 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink230:setParent(obj.layout62);
    obj.dataLink230:setField("atr_3_18");
    obj.dataLink230:setDefaultValue("DX");
    obj.dataLink230:setName("dataLink230");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout62);
    obj.label177:setLeft(180);
    obj.label177:setTop(3);
    obj.label177:setWidth(10);
    obj.label177:setHeight(20);
    obj.label177:setText("+");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout62);
    obj.edit117:setLeft(190);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(30);
    obj.edit117:setHeight(25);
    obj.edit117:setType("number");
    obj.edit117:setField("bonus_3_18");
    obj.edit117:setName("edit117");

    obj.comboBox116 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox116:setParent(obj.layout62);
    obj.comboBox116:setLeft(220);
    obj.comboBox116:setTop(0);
    obj.comboBox116:setWidth(55);
    obj.comboBox116:setHeight(25);
    obj.comboBox116:setField("dificuldade_3_18");
    obj.comboBox116:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox116:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox116:setName("comboBox116");

    obj.dataLink231 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink231:setParent(obj.layout62);
    obj.dataLink231:setField("dificuldade_3_18");
    obj.dataLink231:setDefaultValue("F");
    obj.dataLink231:setName("dataLink231");

    obj.rectangle119 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout62);
    obj.rectangle119:setLeft(275);
    obj.rectangle119:setTop(0);
    obj.rectangle119:setWidth(25);
    obj.rectangle119:setHeight(25);
    obj.rectangle119:setColor("black");
    obj.rectangle119:setStrokeColor("white");
    obj.rectangle119:setStrokeSize(1);
    obj.rectangle119:setName("rectangle119");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout62);
    obj.label178:setLeft(275);
    obj.label178:setTop(3);
    obj.label178:setWidth(25);
    obj.label178:setHeight(20);
    obj.label178:setField("xp_3_18");
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.button58 = gui.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout62);
    obj.button58:setLeft(300);
    obj.button58:setTop(3);
    obj.button58:setWidth(20);
    obj.button58:setHeight(20);
    obj.button58:setText("R");
    obj.button58:setName("button58");

    obj.dataLink232 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink232:setParent(obj.layout62);
    obj.dataLink232:setFields({'atr_3_18', 'dificuldade_3_18', 'bonus_3_18', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink232:setName("dataLink232");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout44);
    obj.layout63:setLeft(0);
    obj.layout63:setTop(480);
    obj.layout63:setWidth(325);
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout63);
    obj.edit118:setLeft(5);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(85);
    obj.edit118:setHeight(25);
    obj.edit118:setField("pericia_3_19");
    obj.edit118:setName("edit118");

    obj.dataLink233 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink233:setParent(obj.layout63);
    obj.dataLink233:setField("pericia_3_19");
    obj.dataLink233:setDefaultValue("Técnica de Defesa 1");
    obj.dataLink233:setName("dataLink233");

    obj.rectangle120 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout63);
    obj.rectangle120:setLeft(90);
    obj.rectangle120:setTop(0);
    obj.rectangle120:setWidth(40);
    obj.rectangle120:setHeight(25);
    obj.rectangle120:setColor("black");
    obj.rectangle120:setStrokeColor("white");
    obj.rectangle120:setStrokeSize(1);
    obj.rectangle120:setName("rectangle120");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout63);
    obj.label179:setLeft(90);
    obj.label179:setTop(3);
    obj.label179:setWidth(40);
    obj.label179:setHeight(20);
    obj.label179:setField("nh_3_19");
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");

    obj.comboBox117 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox117:setParent(obj.layout63);
    obj.comboBox117:setLeft(130);
    obj.comboBox117:setTop(0);
    obj.comboBox117:setWidth(50);
    obj.comboBox117:setHeight(25);
    obj.comboBox117:setField("atr_3_19");
    obj.comboBox117:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox117:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox117:setName("comboBox117");

    obj.dataLink234 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink234:setParent(obj.layout63);
    obj.dataLink234:setField("atr_3_19");
    obj.dataLink234:setDefaultValue("DX");
    obj.dataLink234:setName("dataLink234");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout63);
    obj.label180:setLeft(180);
    obj.label180:setTop(3);
    obj.label180:setWidth(10);
    obj.label180:setHeight(20);
    obj.label180:setText("+");
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout63);
    obj.edit119:setLeft(190);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(30);
    obj.edit119:setHeight(25);
    obj.edit119:setType("number");
    obj.edit119:setField("bonus_3_19");
    obj.edit119:setName("edit119");

    obj.comboBox118 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox118:setParent(obj.layout63);
    obj.comboBox118:setLeft(220);
    obj.comboBox118:setTop(0);
    obj.comboBox118:setWidth(55);
    obj.comboBox118:setHeight(25);
    obj.comboBox118:setField("dificuldade_3_19");
    obj.comboBox118:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox118:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox118:setName("comboBox118");

    obj.dataLink235 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink235:setParent(obj.layout63);
    obj.dataLink235:setField("dificuldade_3_19");
    obj.dataLink235:setDefaultValue("D");
    obj.dataLink235:setName("dataLink235");

    obj.rectangle121 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout63);
    obj.rectangle121:setLeft(275);
    obj.rectangle121:setTop(0);
    obj.rectangle121:setWidth(25);
    obj.rectangle121:setHeight(25);
    obj.rectangle121:setColor("black");
    obj.rectangle121:setStrokeColor("white");
    obj.rectangle121:setStrokeSize(1);
    obj.rectangle121:setName("rectangle121");

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout63);
    obj.label181:setLeft(275);
    obj.label181:setTop(3);
    obj.label181:setWidth(25);
    obj.label181:setHeight(20);
    obj.label181:setField("xp_3_19");
    obj.label181:setHorzTextAlign("center");
    obj.label181:setName("label181");

    obj.button59 = gui.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout63);
    obj.button59:setLeft(300);
    obj.button59:setTop(3);
    obj.button59:setWidth(20);
    obj.button59:setHeight(20);
    obj.button59:setText("R");
    obj.button59:setName("button59");

    obj.dataLink236 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink236:setParent(obj.layout63);
    obj.dataLink236:setFields({'atr_3_19', 'dificuldade_3_19', 'bonus_3_19', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink236:setName("dataLink236");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout44);
    obj.layout64:setLeft(0);
    obj.layout64:setTop(505);
    obj.layout64:setWidth(325);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout64);
    obj.edit120:setLeft(5);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(85);
    obj.edit120:setHeight(25);
    obj.edit120:setField("pericia_3_20");
    obj.edit120:setName("edit120");

    obj.dataLink237 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink237:setParent(obj.layout64);
    obj.dataLink237:setField("pericia_3_20");
    obj.dataLink237:setDefaultValue("Técnica de Defesa 1");
    obj.dataLink237:setName("dataLink237");

    obj.rectangle122 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout64);
    obj.rectangle122:setLeft(90);
    obj.rectangle122:setTop(0);
    obj.rectangle122:setWidth(40);
    obj.rectangle122:setHeight(25);
    obj.rectangle122:setColor("black");
    obj.rectangle122:setStrokeColor("white");
    obj.rectangle122:setStrokeSize(1);
    obj.rectangle122:setName("rectangle122");

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout64);
    obj.label182:setLeft(90);
    obj.label182:setTop(3);
    obj.label182:setWidth(40);
    obj.label182:setHeight(20);
    obj.label182:setField("nh_3_20");
    obj.label182:setHorzTextAlign("center");
    obj.label182:setName("label182");

    obj.comboBox119 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox119:setParent(obj.layout64);
    obj.comboBox119:setLeft(130);
    obj.comboBox119:setTop(0);
    obj.comboBox119:setWidth(50);
    obj.comboBox119:setHeight(25);
    obj.comboBox119:setField("atr_3_20");
    obj.comboBox119:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox119:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox119:setName("comboBox119");

    obj.dataLink238 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink238:setParent(obj.layout64);
    obj.dataLink238:setField("atr_3_20");
    obj.dataLink238:setDefaultValue("DX");
    obj.dataLink238:setName("dataLink238");

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout64);
    obj.label183:setLeft(180);
    obj.label183:setTop(3);
    obj.label183:setWidth(10);
    obj.label183:setHeight(20);
    obj.label183:setText("+");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout64);
    obj.edit121:setLeft(190);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(30);
    obj.edit121:setHeight(25);
    obj.edit121:setType("number");
    obj.edit121:setField("bonus_3_20");
    obj.edit121:setName("edit121");

    obj.comboBox120 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox120:setParent(obj.layout64);
    obj.comboBox120:setLeft(220);
    obj.comboBox120:setTop(0);
    obj.comboBox120:setWidth(55);
    obj.comboBox120:setHeight(25);
    obj.comboBox120:setField("dificuldade_3_20");
    obj.comboBox120:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox120:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox120:setName("comboBox120");

    obj.dataLink239 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink239:setParent(obj.layout64);
    obj.dataLink239:setField("dificuldade_3_20");
    obj.dataLink239:setDefaultValue("D");
    obj.dataLink239:setName("dataLink239");

    obj.rectangle123 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout64);
    obj.rectangle123:setLeft(275);
    obj.rectangle123:setTop(0);
    obj.rectangle123:setWidth(25);
    obj.rectangle123:setHeight(25);
    obj.rectangle123:setColor("black");
    obj.rectangle123:setStrokeColor("white");
    obj.rectangle123:setStrokeSize(1);
    obj.rectangle123:setName("rectangle123");

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout64);
    obj.label184:setLeft(275);
    obj.label184:setTop(3);
    obj.label184:setWidth(25);
    obj.label184:setHeight(20);
    obj.label184:setField("xp_3_20");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.button60 = gui.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout64);
    obj.button60:setLeft(300);
    obj.button60:setTop(3);
    obj.button60:setWidth(20);
    obj.button60:setHeight(20);
    obj.button60:setText("R");
    obj.button60:setName("button60");

    obj.dataLink240 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink240:setParent(obj.layout64);
    obj.dataLink240:setFields({'atr_3_20', 'dificuldade_3_20', 'bonus_3_20', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink240:setName("dataLink240");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox1);
    obj.layout65:setLeft(990);
    obj.layout65:setTop(0);
    obj.layout65:setWidth(325);
    obj.layout65:setHeight(615);
    obj.layout65:setName("layout65");

    obj.rectangle124 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.layout65);
    obj.rectangle124:setAlign("client");
    obj.rectangle124:setColor("black");
    obj.rectangle124:setXradius(15);
    obj.rectangle124:setYradius(15);
    obj.rectangle124:setCornerType("round");
    obj.rectangle124:setName("rectangle124");

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout65);
    obj.label185:setLeft(0);
    obj.label185:setTop(5);
    obj.label185:setWidth(325);
    obj.label185:setHeight(20);
    obj.label185:setText("     NOME            NH        AT     +  BN       DF        PT");
    obj.label185:setName("label185");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setLeft(0);
    obj.layout66:setTop(30);
    obj.layout66:setWidth(325);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout66);
    obj.edit122:setLeft(5);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(85);
    obj.edit122:setHeight(25);
    obj.edit122:setField("pericia_4_1");
    obj.edit122:setName("edit122");

    obj.dataLink241 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink241:setParent(obj.layout66);
    obj.dataLink241:setField("pericia_4_1");
    obj.dataLink241:setDefaultValue("");
    obj.dataLink241:setName("dataLink241");

    obj.rectangle125 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.layout66);
    obj.rectangle125:setLeft(90);
    obj.rectangle125:setTop(0);
    obj.rectangle125:setWidth(40);
    obj.rectangle125:setHeight(25);
    obj.rectangle125:setColor("black");
    obj.rectangle125:setStrokeColor("white");
    obj.rectangle125:setStrokeSize(1);
    obj.rectangle125:setName("rectangle125");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout66);
    obj.label186:setLeft(90);
    obj.label186:setTop(3);
    obj.label186:setWidth(40);
    obj.label186:setHeight(20);
    obj.label186:setField("nh_4_1");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.comboBox121 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox121:setParent(obj.layout66);
    obj.comboBox121:setLeft(130);
    obj.comboBox121:setTop(0);
    obj.comboBox121:setWidth(50);
    obj.comboBox121:setHeight(25);
    obj.comboBox121:setField("atr_4_1");
    obj.comboBox121:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox121:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox121:setName("comboBox121");

    obj.dataLink242 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink242:setParent(obj.layout66);
    obj.dataLink242:setField("atr_4_1");
    obj.dataLink242:setDefaultValue("");
    obj.dataLink242:setName("dataLink242");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout66);
    obj.label187:setLeft(180);
    obj.label187:setTop(3);
    obj.label187:setWidth(10);
    obj.label187:setHeight(20);
    obj.label187:setText("+");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout66);
    obj.edit123:setLeft(190);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(30);
    obj.edit123:setHeight(25);
    obj.edit123:setType("number");
    obj.edit123:setField("bonus_4_1");
    obj.edit123:setName("edit123");

    obj.comboBox122 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox122:setParent(obj.layout66);
    obj.comboBox122:setLeft(220);
    obj.comboBox122:setTop(0);
    obj.comboBox122:setWidth(55);
    obj.comboBox122:setHeight(25);
    obj.comboBox122:setField("dificuldade_4_1");
    obj.comboBox122:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox122:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox122:setName("comboBox122");

    obj.dataLink243 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink243:setParent(obj.layout66);
    obj.dataLink243:setField("dificuldade_4_1");
    obj.dataLink243:setDefaultValue("");
    obj.dataLink243:setName("dataLink243");

    obj.rectangle126 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout66);
    obj.rectangle126:setLeft(275);
    obj.rectangle126:setTop(0);
    obj.rectangle126:setWidth(25);
    obj.rectangle126:setHeight(25);
    obj.rectangle126:setColor("black");
    obj.rectangle126:setStrokeColor("white");
    obj.rectangle126:setStrokeSize(1);
    obj.rectangle126:setName("rectangle126");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout66);
    obj.label188:setLeft(275);
    obj.label188:setTop(3);
    obj.label188:setWidth(25);
    obj.label188:setHeight(20);
    obj.label188:setField("xp_4_1");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.button61 = gui.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout66);
    obj.button61:setLeft(300);
    obj.button61:setTop(3);
    obj.button61:setWidth(20);
    obj.button61:setHeight(20);
    obj.button61:setText("R");
    obj.button61:setName("button61");

    obj.dataLink244 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink244:setParent(obj.layout66);
    obj.dataLink244:setFields({'atr_4_1', 'dificuldade_4_1', 'bonus_4_1', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink244:setName("dataLink244");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout65);
    obj.layout67:setLeft(0);
    obj.layout67:setTop(55);
    obj.layout67:setWidth(325);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout67);
    obj.edit124:setLeft(5);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(85);
    obj.edit124:setHeight(25);
    obj.edit124:setField("pericia_4_2");
    obj.edit124:setName("edit124");

    obj.dataLink245 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink245:setParent(obj.layout67);
    obj.dataLink245:setField("pericia_4_2");
    obj.dataLink245:setDefaultValue("");
    obj.dataLink245:setName("dataLink245");

    obj.rectangle127 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout67);
    obj.rectangle127:setLeft(90);
    obj.rectangle127:setTop(0);
    obj.rectangle127:setWidth(40);
    obj.rectangle127:setHeight(25);
    obj.rectangle127:setColor("black");
    obj.rectangle127:setStrokeColor("white");
    obj.rectangle127:setStrokeSize(1);
    obj.rectangle127:setName("rectangle127");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout67);
    obj.label189:setLeft(90);
    obj.label189:setTop(3);
    obj.label189:setWidth(40);
    obj.label189:setHeight(20);
    obj.label189:setField("nh_4_2");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.comboBox123 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox123:setParent(obj.layout67);
    obj.comboBox123:setLeft(130);
    obj.comboBox123:setTop(0);
    obj.comboBox123:setWidth(50);
    obj.comboBox123:setHeight(25);
    obj.comboBox123:setField("atr_4_2");
    obj.comboBox123:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox123:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox123:setName("comboBox123");

    obj.dataLink246 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink246:setParent(obj.layout67);
    obj.dataLink246:setField("atr_4_2");
    obj.dataLink246:setDefaultValue("");
    obj.dataLink246:setName("dataLink246");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout67);
    obj.label190:setLeft(180);
    obj.label190:setTop(3);
    obj.label190:setWidth(10);
    obj.label190:setHeight(20);
    obj.label190:setText("+");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout67);
    obj.edit125:setLeft(190);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(30);
    obj.edit125:setHeight(25);
    obj.edit125:setType("number");
    obj.edit125:setField("bonus_4_2");
    obj.edit125:setName("edit125");

    obj.comboBox124 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox124:setParent(obj.layout67);
    obj.comboBox124:setLeft(220);
    obj.comboBox124:setTop(0);
    obj.comboBox124:setWidth(55);
    obj.comboBox124:setHeight(25);
    obj.comboBox124:setField("dificuldade_4_2");
    obj.comboBox124:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox124:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox124:setName("comboBox124");

    obj.dataLink247 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink247:setParent(obj.layout67);
    obj.dataLink247:setField("dificuldade_4_2");
    obj.dataLink247:setDefaultValue("");
    obj.dataLink247:setName("dataLink247");

    obj.rectangle128 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout67);
    obj.rectangle128:setLeft(275);
    obj.rectangle128:setTop(0);
    obj.rectangle128:setWidth(25);
    obj.rectangle128:setHeight(25);
    obj.rectangle128:setColor("black");
    obj.rectangle128:setStrokeColor("white");
    obj.rectangle128:setStrokeSize(1);
    obj.rectangle128:setName("rectangle128");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout67);
    obj.label191:setLeft(275);
    obj.label191:setTop(3);
    obj.label191:setWidth(25);
    obj.label191:setHeight(20);
    obj.label191:setField("xp_4_2");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.button62 = gui.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout67);
    obj.button62:setLeft(300);
    obj.button62:setTop(3);
    obj.button62:setWidth(20);
    obj.button62:setHeight(20);
    obj.button62:setText("R");
    obj.button62:setName("button62");

    obj.dataLink248 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink248:setParent(obj.layout67);
    obj.dataLink248:setFields({'atr_4_2', 'dificuldade_4_2', 'bonus_4_2', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink248:setName("dataLink248");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout65);
    obj.layout68:setLeft(0);
    obj.layout68:setTop(80);
    obj.layout68:setWidth(325);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout68);
    obj.edit126:setLeft(5);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(85);
    obj.edit126:setHeight(25);
    obj.edit126:setField("pericia_4_3");
    obj.edit126:setName("edit126");

    obj.dataLink249 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink249:setParent(obj.layout68);
    obj.dataLink249:setField("pericia_4_3");
    obj.dataLink249:setDefaultValue("");
    obj.dataLink249:setName("dataLink249");

    obj.rectangle129 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout68);
    obj.rectangle129:setLeft(90);
    obj.rectangle129:setTop(0);
    obj.rectangle129:setWidth(40);
    obj.rectangle129:setHeight(25);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setStrokeColor("white");
    obj.rectangle129:setStrokeSize(1);
    obj.rectangle129:setName("rectangle129");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout68);
    obj.label192:setLeft(90);
    obj.label192:setTop(3);
    obj.label192:setWidth(40);
    obj.label192:setHeight(20);
    obj.label192:setField("nh_4_3");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.comboBox125 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox125:setParent(obj.layout68);
    obj.comboBox125:setLeft(130);
    obj.comboBox125:setTop(0);
    obj.comboBox125:setWidth(50);
    obj.comboBox125:setHeight(25);
    obj.comboBox125:setField("atr_4_3");
    obj.comboBox125:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox125:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox125:setName("comboBox125");

    obj.dataLink250 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink250:setParent(obj.layout68);
    obj.dataLink250:setField("atr_4_3");
    obj.dataLink250:setDefaultValue("");
    obj.dataLink250:setName("dataLink250");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout68);
    obj.label193:setLeft(180);
    obj.label193:setTop(3);
    obj.label193:setWidth(10);
    obj.label193:setHeight(20);
    obj.label193:setText("+");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout68);
    obj.edit127:setLeft(190);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(30);
    obj.edit127:setHeight(25);
    obj.edit127:setType("number");
    obj.edit127:setField("bonus_4_3");
    obj.edit127:setName("edit127");

    obj.comboBox126 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox126:setParent(obj.layout68);
    obj.comboBox126:setLeft(220);
    obj.comboBox126:setTop(0);
    obj.comboBox126:setWidth(55);
    obj.comboBox126:setHeight(25);
    obj.comboBox126:setField("dificuldade_4_3");
    obj.comboBox126:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox126:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox126:setName("comboBox126");

    obj.dataLink251 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink251:setParent(obj.layout68);
    obj.dataLink251:setField("dificuldade_4_3");
    obj.dataLink251:setDefaultValue("");
    obj.dataLink251:setName("dataLink251");

    obj.rectangle130 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout68);
    obj.rectangle130:setLeft(275);
    obj.rectangle130:setTop(0);
    obj.rectangle130:setWidth(25);
    obj.rectangle130:setHeight(25);
    obj.rectangle130:setColor("black");
    obj.rectangle130:setStrokeColor("white");
    obj.rectangle130:setStrokeSize(1);
    obj.rectangle130:setName("rectangle130");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout68);
    obj.label194:setLeft(275);
    obj.label194:setTop(3);
    obj.label194:setWidth(25);
    obj.label194:setHeight(20);
    obj.label194:setField("xp_4_3");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.button63 = gui.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout68);
    obj.button63:setLeft(300);
    obj.button63:setTop(3);
    obj.button63:setWidth(20);
    obj.button63:setHeight(20);
    obj.button63:setText("R");
    obj.button63:setName("button63");

    obj.dataLink252 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink252:setParent(obj.layout68);
    obj.dataLink252:setFields({'atr_4_3', 'dificuldade_4_3', 'bonus_4_3', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink252:setName("dataLink252");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout65);
    obj.layout69:setLeft(0);
    obj.layout69:setTop(105);
    obj.layout69:setWidth(325);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout69);
    obj.edit128:setLeft(5);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(85);
    obj.edit128:setHeight(25);
    obj.edit128:setField("pericia_4_4");
    obj.edit128:setName("edit128");

    obj.dataLink253 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink253:setParent(obj.layout69);
    obj.dataLink253:setField("pericia_4_4");
    obj.dataLink253:setDefaultValue("");
    obj.dataLink253:setName("dataLink253");

    obj.rectangle131 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.layout69);
    obj.rectangle131:setLeft(90);
    obj.rectangle131:setTop(0);
    obj.rectangle131:setWidth(40);
    obj.rectangle131:setHeight(25);
    obj.rectangle131:setColor("black");
    obj.rectangle131:setStrokeColor("white");
    obj.rectangle131:setStrokeSize(1);
    obj.rectangle131:setName("rectangle131");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout69);
    obj.label195:setLeft(90);
    obj.label195:setTop(3);
    obj.label195:setWidth(40);
    obj.label195:setHeight(20);
    obj.label195:setField("nh_4_4");
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.comboBox127 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox127:setParent(obj.layout69);
    obj.comboBox127:setLeft(130);
    obj.comboBox127:setTop(0);
    obj.comboBox127:setWidth(50);
    obj.comboBox127:setHeight(25);
    obj.comboBox127:setField("atr_4_4");
    obj.comboBox127:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox127:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox127:setName("comboBox127");

    obj.dataLink254 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink254:setParent(obj.layout69);
    obj.dataLink254:setField("atr_4_4");
    obj.dataLink254:setDefaultValue("");
    obj.dataLink254:setName("dataLink254");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout69);
    obj.label196:setLeft(180);
    obj.label196:setTop(3);
    obj.label196:setWidth(10);
    obj.label196:setHeight(20);
    obj.label196:setText("+");
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout69);
    obj.edit129:setLeft(190);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(30);
    obj.edit129:setHeight(25);
    obj.edit129:setType("number");
    obj.edit129:setField("bonus_4_4");
    obj.edit129:setName("edit129");

    obj.comboBox128 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox128:setParent(obj.layout69);
    obj.comboBox128:setLeft(220);
    obj.comboBox128:setTop(0);
    obj.comboBox128:setWidth(55);
    obj.comboBox128:setHeight(25);
    obj.comboBox128:setField("dificuldade_4_4");
    obj.comboBox128:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox128:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox128:setName("comboBox128");

    obj.dataLink255 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink255:setParent(obj.layout69);
    obj.dataLink255:setField("dificuldade_4_4");
    obj.dataLink255:setDefaultValue("");
    obj.dataLink255:setName("dataLink255");

    obj.rectangle132 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout69);
    obj.rectangle132:setLeft(275);
    obj.rectangle132:setTop(0);
    obj.rectangle132:setWidth(25);
    obj.rectangle132:setHeight(25);
    obj.rectangle132:setColor("black");
    obj.rectangle132:setStrokeColor("white");
    obj.rectangle132:setStrokeSize(1);
    obj.rectangle132:setName("rectangle132");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout69);
    obj.label197:setLeft(275);
    obj.label197:setTop(3);
    obj.label197:setWidth(25);
    obj.label197:setHeight(20);
    obj.label197:setField("xp_4_4");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.button64 = gui.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout69);
    obj.button64:setLeft(300);
    obj.button64:setTop(3);
    obj.button64:setWidth(20);
    obj.button64:setHeight(20);
    obj.button64:setText("R");
    obj.button64:setName("button64");

    obj.dataLink256 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink256:setParent(obj.layout69);
    obj.dataLink256:setFields({'atr_4_4', 'dificuldade_4_4', 'bonus_4_4', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink256:setName("dataLink256");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout65);
    obj.layout70:setLeft(0);
    obj.layout70:setTop(130);
    obj.layout70:setWidth(325);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout70);
    obj.edit130:setLeft(5);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(85);
    obj.edit130:setHeight(25);
    obj.edit130:setField("pericia_4_5");
    obj.edit130:setName("edit130");

    obj.dataLink257 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink257:setParent(obj.layout70);
    obj.dataLink257:setField("pericia_4_5");
    obj.dataLink257:setDefaultValue("");
    obj.dataLink257:setName("dataLink257");

    obj.rectangle133 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout70);
    obj.rectangle133:setLeft(90);
    obj.rectangle133:setTop(0);
    obj.rectangle133:setWidth(40);
    obj.rectangle133:setHeight(25);
    obj.rectangle133:setColor("black");
    obj.rectangle133:setStrokeColor("white");
    obj.rectangle133:setStrokeSize(1);
    obj.rectangle133:setName("rectangle133");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout70);
    obj.label198:setLeft(90);
    obj.label198:setTop(3);
    obj.label198:setWidth(40);
    obj.label198:setHeight(20);
    obj.label198:setField("nh_4_5");
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.comboBox129 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox129:setParent(obj.layout70);
    obj.comboBox129:setLeft(130);
    obj.comboBox129:setTop(0);
    obj.comboBox129:setWidth(50);
    obj.comboBox129:setHeight(25);
    obj.comboBox129:setField("atr_4_5");
    obj.comboBox129:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox129:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox129:setName("comboBox129");

    obj.dataLink258 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink258:setParent(obj.layout70);
    obj.dataLink258:setField("atr_4_5");
    obj.dataLink258:setDefaultValue("");
    obj.dataLink258:setName("dataLink258");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout70);
    obj.label199:setLeft(180);
    obj.label199:setTop(3);
    obj.label199:setWidth(10);
    obj.label199:setHeight(20);
    obj.label199:setText("+");
    obj.label199:setHorzTextAlign("center");
    obj.label199:setName("label199");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout70);
    obj.edit131:setLeft(190);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(30);
    obj.edit131:setHeight(25);
    obj.edit131:setType("number");
    obj.edit131:setField("bonus_4_5");
    obj.edit131:setName("edit131");

    obj.comboBox130 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox130:setParent(obj.layout70);
    obj.comboBox130:setLeft(220);
    obj.comboBox130:setTop(0);
    obj.comboBox130:setWidth(55);
    obj.comboBox130:setHeight(25);
    obj.comboBox130:setField("dificuldade_4_5");
    obj.comboBox130:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox130:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox130:setName("comboBox130");

    obj.dataLink259 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink259:setParent(obj.layout70);
    obj.dataLink259:setField("dificuldade_4_5");
    obj.dataLink259:setDefaultValue("");
    obj.dataLink259:setName("dataLink259");

    obj.rectangle134 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout70);
    obj.rectangle134:setLeft(275);
    obj.rectangle134:setTop(0);
    obj.rectangle134:setWidth(25);
    obj.rectangle134:setHeight(25);
    obj.rectangle134:setColor("black");
    obj.rectangle134:setStrokeColor("white");
    obj.rectangle134:setStrokeSize(1);
    obj.rectangle134:setName("rectangle134");

    obj.label200 = gui.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout70);
    obj.label200:setLeft(275);
    obj.label200:setTop(3);
    obj.label200:setWidth(25);
    obj.label200:setHeight(20);
    obj.label200:setField("xp_4_5");
    obj.label200:setHorzTextAlign("center");
    obj.label200:setName("label200");

    obj.button65 = gui.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout70);
    obj.button65:setLeft(300);
    obj.button65:setTop(3);
    obj.button65:setWidth(20);
    obj.button65:setHeight(20);
    obj.button65:setText("R");
    obj.button65:setName("button65");

    obj.dataLink260 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink260:setParent(obj.layout70);
    obj.dataLink260:setFields({'atr_4_5', 'dificuldade_4_5', 'bonus_4_5', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink260:setName("dataLink260");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout65);
    obj.layout71:setLeft(0);
    obj.layout71:setTop(155);
    obj.layout71:setWidth(325);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout71);
    obj.edit132:setLeft(5);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(85);
    obj.edit132:setHeight(25);
    obj.edit132:setField("pericia_4_6");
    obj.edit132:setName("edit132");

    obj.dataLink261 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink261:setParent(obj.layout71);
    obj.dataLink261:setField("pericia_4_6");
    obj.dataLink261:setDefaultValue("");
    obj.dataLink261:setName("dataLink261");

    obj.rectangle135 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout71);
    obj.rectangle135:setLeft(90);
    obj.rectangle135:setTop(0);
    obj.rectangle135:setWidth(40);
    obj.rectangle135:setHeight(25);
    obj.rectangle135:setColor("black");
    obj.rectangle135:setStrokeColor("white");
    obj.rectangle135:setStrokeSize(1);
    obj.rectangle135:setName("rectangle135");

    obj.label201 = gui.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout71);
    obj.label201:setLeft(90);
    obj.label201:setTop(3);
    obj.label201:setWidth(40);
    obj.label201:setHeight(20);
    obj.label201:setField("nh_4_6");
    obj.label201:setHorzTextAlign("center");
    obj.label201:setName("label201");

    obj.comboBox131 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox131:setParent(obj.layout71);
    obj.comboBox131:setLeft(130);
    obj.comboBox131:setTop(0);
    obj.comboBox131:setWidth(50);
    obj.comboBox131:setHeight(25);
    obj.comboBox131:setField("atr_4_6");
    obj.comboBox131:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox131:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox131:setName("comboBox131");

    obj.dataLink262 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink262:setParent(obj.layout71);
    obj.dataLink262:setField("atr_4_6");
    obj.dataLink262:setDefaultValue("");
    obj.dataLink262:setName("dataLink262");

    obj.label202 = gui.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout71);
    obj.label202:setLeft(180);
    obj.label202:setTop(3);
    obj.label202:setWidth(10);
    obj.label202:setHeight(20);
    obj.label202:setText("+");
    obj.label202:setHorzTextAlign("center");
    obj.label202:setName("label202");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout71);
    obj.edit133:setLeft(190);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(30);
    obj.edit133:setHeight(25);
    obj.edit133:setType("number");
    obj.edit133:setField("bonus_4_6");
    obj.edit133:setName("edit133");

    obj.comboBox132 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox132:setParent(obj.layout71);
    obj.comboBox132:setLeft(220);
    obj.comboBox132:setTop(0);
    obj.comboBox132:setWidth(55);
    obj.comboBox132:setHeight(25);
    obj.comboBox132:setField("dificuldade_4_6");
    obj.comboBox132:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox132:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox132:setName("comboBox132");

    obj.dataLink263 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink263:setParent(obj.layout71);
    obj.dataLink263:setField("dificuldade_4_6");
    obj.dataLink263:setDefaultValue("");
    obj.dataLink263:setName("dataLink263");

    obj.rectangle136 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout71);
    obj.rectangle136:setLeft(275);
    obj.rectangle136:setTop(0);
    obj.rectangle136:setWidth(25);
    obj.rectangle136:setHeight(25);
    obj.rectangle136:setColor("black");
    obj.rectangle136:setStrokeColor("white");
    obj.rectangle136:setStrokeSize(1);
    obj.rectangle136:setName("rectangle136");

    obj.label203 = gui.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout71);
    obj.label203:setLeft(275);
    obj.label203:setTop(3);
    obj.label203:setWidth(25);
    obj.label203:setHeight(20);
    obj.label203:setField("xp_4_6");
    obj.label203:setHorzTextAlign("center");
    obj.label203:setName("label203");

    obj.button66 = gui.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout71);
    obj.button66:setLeft(300);
    obj.button66:setTop(3);
    obj.button66:setWidth(20);
    obj.button66:setHeight(20);
    obj.button66:setText("R");
    obj.button66:setName("button66");

    obj.dataLink264 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink264:setParent(obj.layout71);
    obj.dataLink264:setFields({'atr_4_6', 'dificuldade_4_6', 'bonus_4_6', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink264:setName("dataLink264");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout65);
    obj.layout72:setLeft(0);
    obj.layout72:setTop(180);
    obj.layout72:setWidth(325);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout72);
    obj.edit134:setLeft(5);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(85);
    obj.edit134:setHeight(25);
    obj.edit134:setField("pericia_4_7");
    obj.edit134:setName("edit134");

    obj.dataLink265 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink265:setParent(obj.layout72);
    obj.dataLink265:setField("pericia_4_7");
    obj.dataLink265:setDefaultValue("");
    obj.dataLink265:setName("dataLink265");

    obj.rectangle137 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.layout72);
    obj.rectangle137:setLeft(90);
    obj.rectangle137:setTop(0);
    obj.rectangle137:setWidth(40);
    obj.rectangle137:setHeight(25);
    obj.rectangle137:setColor("black");
    obj.rectangle137:setStrokeColor("white");
    obj.rectangle137:setStrokeSize(1);
    obj.rectangle137:setName("rectangle137");

    obj.label204 = gui.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout72);
    obj.label204:setLeft(90);
    obj.label204:setTop(3);
    obj.label204:setWidth(40);
    obj.label204:setHeight(20);
    obj.label204:setField("nh_4_7");
    obj.label204:setHorzTextAlign("center");
    obj.label204:setName("label204");

    obj.comboBox133 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox133:setParent(obj.layout72);
    obj.comboBox133:setLeft(130);
    obj.comboBox133:setTop(0);
    obj.comboBox133:setWidth(50);
    obj.comboBox133:setHeight(25);
    obj.comboBox133:setField("atr_4_7");
    obj.comboBox133:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox133:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox133:setName("comboBox133");

    obj.dataLink266 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink266:setParent(obj.layout72);
    obj.dataLink266:setField("atr_4_7");
    obj.dataLink266:setDefaultValue("");
    obj.dataLink266:setName("dataLink266");

    obj.label205 = gui.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout72);
    obj.label205:setLeft(180);
    obj.label205:setTop(3);
    obj.label205:setWidth(10);
    obj.label205:setHeight(20);
    obj.label205:setText("+");
    obj.label205:setHorzTextAlign("center");
    obj.label205:setName("label205");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout72);
    obj.edit135:setLeft(190);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(30);
    obj.edit135:setHeight(25);
    obj.edit135:setType("number");
    obj.edit135:setField("bonus_4_7");
    obj.edit135:setName("edit135");

    obj.comboBox134 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox134:setParent(obj.layout72);
    obj.comboBox134:setLeft(220);
    obj.comboBox134:setTop(0);
    obj.comboBox134:setWidth(55);
    obj.comboBox134:setHeight(25);
    obj.comboBox134:setField("dificuldade_4_7");
    obj.comboBox134:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox134:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox134:setName("comboBox134");

    obj.dataLink267 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink267:setParent(obj.layout72);
    obj.dataLink267:setField("dificuldade_4_7");
    obj.dataLink267:setDefaultValue("");
    obj.dataLink267:setName("dataLink267");

    obj.rectangle138 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout72);
    obj.rectangle138:setLeft(275);
    obj.rectangle138:setTop(0);
    obj.rectangle138:setWidth(25);
    obj.rectangle138:setHeight(25);
    obj.rectangle138:setColor("black");
    obj.rectangle138:setStrokeColor("white");
    obj.rectangle138:setStrokeSize(1);
    obj.rectangle138:setName("rectangle138");

    obj.label206 = gui.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout72);
    obj.label206:setLeft(275);
    obj.label206:setTop(3);
    obj.label206:setWidth(25);
    obj.label206:setHeight(20);
    obj.label206:setField("xp_4_7");
    obj.label206:setHorzTextAlign("center");
    obj.label206:setName("label206");

    obj.button67 = gui.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout72);
    obj.button67:setLeft(300);
    obj.button67:setTop(3);
    obj.button67:setWidth(20);
    obj.button67:setHeight(20);
    obj.button67:setText("R");
    obj.button67:setName("button67");

    obj.dataLink268 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink268:setParent(obj.layout72);
    obj.dataLink268:setFields({'atr_4_7', 'dificuldade_4_7', 'bonus_4_7', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink268:setName("dataLink268");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout65);
    obj.layout73:setLeft(0);
    obj.layout73:setTop(205);
    obj.layout73:setWidth(325);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout73);
    obj.edit136:setLeft(5);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(85);
    obj.edit136:setHeight(25);
    obj.edit136:setField("pericia_4_8");
    obj.edit136:setName("edit136");

    obj.dataLink269 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink269:setParent(obj.layout73);
    obj.dataLink269:setField("pericia_4_8");
    obj.dataLink269:setDefaultValue("");
    obj.dataLink269:setName("dataLink269");

    obj.rectangle139 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.layout73);
    obj.rectangle139:setLeft(90);
    obj.rectangle139:setTop(0);
    obj.rectangle139:setWidth(40);
    obj.rectangle139:setHeight(25);
    obj.rectangle139:setColor("black");
    obj.rectangle139:setStrokeColor("white");
    obj.rectangle139:setStrokeSize(1);
    obj.rectangle139:setName("rectangle139");

    obj.label207 = gui.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout73);
    obj.label207:setLeft(90);
    obj.label207:setTop(3);
    obj.label207:setWidth(40);
    obj.label207:setHeight(20);
    obj.label207:setField("nh_4_8");
    obj.label207:setHorzTextAlign("center");
    obj.label207:setName("label207");

    obj.comboBox135 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox135:setParent(obj.layout73);
    obj.comboBox135:setLeft(130);
    obj.comboBox135:setTop(0);
    obj.comboBox135:setWidth(50);
    obj.comboBox135:setHeight(25);
    obj.comboBox135:setField("atr_4_8");
    obj.comboBox135:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox135:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox135:setName("comboBox135");

    obj.dataLink270 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink270:setParent(obj.layout73);
    obj.dataLink270:setField("atr_4_8");
    obj.dataLink270:setDefaultValue("");
    obj.dataLink270:setName("dataLink270");

    obj.label208 = gui.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout73);
    obj.label208:setLeft(180);
    obj.label208:setTop(3);
    obj.label208:setWidth(10);
    obj.label208:setHeight(20);
    obj.label208:setText("+");
    obj.label208:setHorzTextAlign("center");
    obj.label208:setName("label208");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout73);
    obj.edit137:setLeft(190);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(25);
    obj.edit137:setType("number");
    obj.edit137:setField("bonus_4_8");
    obj.edit137:setName("edit137");

    obj.comboBox136 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox136:setParent(obj.layout73);
    obj.comboBox136:setLeft(220);
    obj.comboBox136:setTop(0);
    obj.comboBox136:setWidth(55);
    obj.comboBox136:setHeight(25);
    obj.comboBox136:setField("dificuldade_4_8");
    obj.comboBox136:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox136:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox136:setName("comboBox136");

    obj.dataLink271 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink271:setParent(obj.layout73);
    obj.dataLink271:setField("dificuldade_4_8");
    obj.dataLink271:setDefaultValue("");
    obj.dataLink271:setName("dataLink271");

    obj.rectangle140 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.layout73);
    obj.rectangle140:setLeft(275);
    obj.rectangle140:setTop(0);
    obj.rectangle140:setWidth(25);
    obj.rectangle140:setHeight(25);
    obj.rectangle140:setColor("black");
    obj.rectangle140:setStrokeColor("white");
    obj.rectangle140:setStrokeSize(1);
    obj.rectangle140:setName("rectangle140");

    obj.label209 = gui.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout73);
    obj.label209:setLeft(275);
    obj.label209:setTop(3);
    obj.label209:setWidth(25);
    obj.label209:setHeight(20);
    obj.label209:setField("xp_4_8");
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.button68 = gui.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout73);
    obj.button68:setLeft(300);
    obj.button68:setTop(3);
    obj.button68:setWidth(20);
    obj.button68:setHeight(20);
    obj.button68:setText("R");
    obj.button68:setName("button68");

    obj.dataLink272 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink272:setParent(obj.layout73);
    obj.dataLink272:setFields({'atr_4_8', 'dificuldade_4_8', 'bonus_4_8', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink272:setName("dataLink272");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout65);
    obj.layout74:setLeft(0);
    obj.layout74:setTop(230);
    obj.layout74:setWidth(325);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout74);
    obj.edit138:setLeft(5);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(85);
    obj.edit138:setHeight(25);
    obj.edit138:setField("pericia_4_9");
    obj.edit138:setName("edit138");

    obj.dataLink273 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink273:setParent(obj.layout74);
    obj.dataLink273:setField("pericia_4_9");
    obj.dataLink273:setDefaultValue("");
    obj.dataLink273:setName("dataLink273");

    obj.rectangle141 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle141:setParent(obj.layout74);
    obj.rectangle141:setLeft(90);
    obj.rectangle141:setTop(0);
    obj.rectangle141:setWidth(40);
    obj.rectangle141:setHeight(25);
    obj.rectangle141:setColor("black");
    obj.rectangle141:setStrokeColor("white");
    obj.rectangle141:setStrokeSize(1);
    obj.rectangle141:setName("rectangle141");

    obj.label210 = gui.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout74);
    obj.label210:setLeft(90);
    obj.label210:setTop(3);
    obj.label210:setWidth(40);
    obj.label210:setHeight(20);
    obj.label210:setField("nh_4_9");
    obj.label210:setHorzTextAlign("center");
    obj.label210:setName("label210");

    obj.comboBox137 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox137:setParent(obj.layout74);
    obj.comboBox137:setLeft(130);
    obj.comboBox137:setTop(0);
    obj.comboBox137:setWidth(50);
    obj.comboBox137:setHeight(25);
    obj.comboBox137:setField("atr_4_9");
    obj.comboBox137:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox137:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox137:setName("comboBox137");

    obj.dataLink274 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink274:setParent(obj.layout74);
    obj.dataLink274:setField("atr_4_9");
    obj.dataLink274:setDefaultValue("");
    obj.dataLink274:setName("dataLink274");

    obj.label211 = gui.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout74);
    obj.label211:setLeft(180);
    obj.label211:setTop(3);
    obj.label211:setWidth(10);
    obj.label211:setHeight(20);
    obj.label211:setText("+");
    obj.label211:setHorzTextAlign("center");
    obj.label211:setName("label211");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout74);
    obj.edit139:setLeft(190);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(30);
    obj.edit139:setHeight(25);
    obj.edit139:setType("number");
    obj.edit139:setField("bonus_4_9");
    obj.edit139:setName("edit139");

    obj.comboBox138 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox138:setParent(obj.layout74);
    obj.comboBox138:setLeft(220);
    obj.comboBox138:setTop(0);
    obj.comboBox138:setWidth(55);
    obj.comboBox138:setHeight(25);
    obj.comboBox138:setField("dificuldade_4_9");
    obj.comboBox138:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox138:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox138:setName("comboBox138");

    obj.dataLink275 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink275:setParent(obj.layout74);
    obj.dataLink275:setField("dificuldade_4_9");
    obj.dataLink275:setDefaultValue("");
    obj.dataLink275:setName("dataLink275");

    obj.rectangle142 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle142:setParent(obj.layout74);
    obj.rectangle142:setLeft(275);
    obj.rectangle142:setTop(0);
    obj.rectangle142:setWidth(25);
    obj.rectangle142:setHeight(25);
    obj.rectangle142:setColor("black");
    obj.rectangle142:setStrokeColor("white");
    obj.rectangle142:setStrokeSize(1);
    obj.rectangle142:setName("rectangle142");

    obj.label212 = gui.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout74);
    obj.label212:setLeft(275);
    obj.label212:setTop(3);
    obj.label212:setWidth(25);
    obj.label212:setHeight(20);
    obj.label212:setField("xp_4_9");
    obj.label212:setHorzTextAlign("center");
    obj.label212:setName("label212");

    obj.button69 = gui.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout74);
    obj.button69:setLeft(300);
    obj.button69:setTop(3);
    obj.button69:setWidth(20);
    obj.button69:setHeight(20);
    obj.button69:setText("R");
    obj.button69:setName("button69");

    obj.dataLink276 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink276:setParent(obj.layout74);
    obj.dataLink276:setFields({'atr_4_9', 'dificuldade_4_9', 'bonus_4_9', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink276:setName("dataLink276");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout65);
    obj.layout75:setLeft(0);
    obj.layout75:setTop(255);
    obj.layout75:setWidth(325);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout75);
    obj.edit140:setLeft(5);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(85);
    obj.edit140:setHeight(25);
    obj.edit140:setField("pericia_4_10");
    obj.edit140:setName("edit140");

    obj.dataLink277 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink277:setParent(obj.layout75);
    obj.dataLink277:setField("pericia_4_10");
    obj.dataLink277:setDefaultValue("");
    obj.dataLink277:setName("dataLink277");

    obj.rectangle143 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle143:setParent(obj.layout75);
    obj.rectangle143:setLeft(90);
    obj.rectangle143:setTop(0);
    obj.rectangle143:setWidth(40);
    obj.rectangle143:setHeight(25);
    obj.rectangle143:setColor("black");
    obj.rectangle143:setStrokeColor("white");
    obj.rectangle143:setStrokeSize(1);
    obj.rectangle143:setName("rectangle143");

    obj.label213 = gui.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout75);
    obj.label213:setLeft(90);
    obj.label213:setTop(3);
    obj.label213:setWidth(40);
    obj.label213:setHeight(20);
    obj.label213:setField("nh_4_10");
    obj.label213:setHorzTextAlign("center");
    obj.label213:setName("label213");

    obj.comboBox139 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox139:setParent(obj.layout75);
    obj.comboBox139:setLeft(130);
    obj.comboBox139:setTop(0);
    obj.comboBox139:setWidth(50);
    obj.comboBox139:setHeight(25);
    obj.comboBox139:setField("atr_4_10");
    obj.comboBox139:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox139:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox139:setName("comboBox139");

    obj.dataLink278 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink278:setParent(obj.layout75);
    obj.dataLink278:setField("atr_4_10");
    obj.dataLink278:setDefaultValue("");
    obj.dataLink278:setName("dataLink278");

    obj.label214 = gui.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout75);
    obj.label214:setLeft(180);
    obj.label214:setTop(3);
    obj.label214:setWidth(10);
    obj.label214:setHeight(20);
    obj.label214:setText("+");
    obj.label214:setHorzTextAlign("center");
    obj.label214:setName("label214");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout75);
    obj.edit141:setLeft(190);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(30);
    obj.edit141:setHeight(25);
    obj.edit141:setType("number");
    obj.edit141:setField("bonus_4_10");
    obj.edit141:setName("edit141");

    obj.comboBox140 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox140:setParent(obj.layout75);
    obj.comboBox140:setLeft(220);
    obj.comboBox140:setTop(0);
    obj.comboBox140:setWidth(55);
    obj.comboBox140:setHeight(25);
    obj.comboBox140:setField("dificuldade_4_10");
    obj.comboBox140:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox140:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox140:setName("comboBox140");

    obj.dataLink279 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink279:setParent(obj.layout75);
    obj.dataLink279:setField("dificuldade_4_10");
    obj.dataLink279:setDefaultValue("");
    obj.dataLink279:setName("dataLink279");

    obj.rectangle144 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle144:setParent(obj.layout75);
    obj.rectangle144:setLeft(275);
    obj.rectangle144:setTop(0);
    obj.rectangle144:setWidth(25);
    obj.rectangle144:setHeight(25);
    obj.rectangle144:setColor("black");
    obj.rectangle144:setStrokeColor("white");
    obj.rectangle144:setStrokeSize(1);
    obj.rectangle144:setName("rectangle144");

    obj.label215 = gui.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout75);
    obj.label215:setLeft(275);
    obj.label215:setTop(3);
    obj.label215:setWidth(25);
    obj.label215:setHeight(20);
    obj.label215:setField("xp_4_10");
    obj.label215:setHorzTextAlign("center");
    obj.label215:setName("label215");

    obj.button70 = gui.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout75);
    obj.button70:setLeft(300);
    obj.button70:setTop(3);
    obj.button70:setWidth(20);
    obj.button70:setHeight(20);
    obj.button70:setText("R");
    obj.button70:setName("button70");

    obj.dataLink280 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink280:setParent(obj.layout75);
    obj.dataLink280:setFields({'atr_4_10', 'dificuldade_4_10', 'bonus_4_10', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink280:setName("dataLink280");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout65);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(280);
    obj.layout76:setWidth(325);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout76);
    obj.edit142:setLeft(5);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(85);
    obj.edit142:setHeight(25);
    obj.edit142:setField("pericia_4_11");
    obj.edit142:setName("edit142");

    obj.dataLink281 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink281:setParent(obj.layout76);
    obj.dataLink281:setField("pericia_4_11");
    obj.dataLink281:setDefaultValue("");
    obj.dataLink281:setName("dataLink281");

    obj.rectangle145 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle145:setParent(obj.layout76);
    obj.rectangle145:setLeft(90);
    obj.rectangle145:setTop(0);
    obj.rectangle145:setWidth(40);
    obj.rectangle145:setHeight(25);
    obj.rectangle145:setColor("black");
    obj.rectangle145:setStrokeColor("white");
    obj.rectangle145:setStrokeSize(1);
    obj.rectangle145:setName("rectangle145");

    obj.label216 = gui.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout76);
    obj.label216:setLeft(90);
    obj.label216:setTop(3);
    obj.label216:setWidth(40);
    obj.label216:setHeight(20);
    obj.label216:setField("nh_4_11");
    obj.label216:setHorzTextAlign("center");
    obj.label216:setName("label216");

    obj.comboBox141 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox141:setParent(obj.layout76);
    obj.comboBox141:setLeft(130);
    obj.comboBox141:setTop(0);
    obj.comboBox141:setWidth(50);
    obj.comboBox141:setHeight(25);
    obj.comboBox141:setField("atr_4_11");
    obj.comboBox141:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox141:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox141:setName("comboBox141");

    obj.dataLink282 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink282:setParent(obj.layout76);
    obj.dataLink282:setField("atr_4_11");
    obj.dataLink282:setDefaultValue("");
    obj.dataLink282:setName("dataLink282");

    obj.label217 = gui.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout76);
    obj.label217:setLeft(180);
    obj.label217:setTop(3);
    obj.label217:setWidth(10);
    obj.label217:setHeight(20);
    obj.label217:setText("+");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setName("label217");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout76);
    obj.edit143:setLeft(190);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(30);
    obj.edit143:setHeight(25);
    obj.edit143:setType("number");
    obj.edit143:setField("bonus_4_11");
    obj.edit143:setName("edit143");

    obj.comboBox142 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox142:setParent(obj.layout76);
    obj.comboBox142:setLeft(220);
    obj.comboBox142:setTop(0);
    obj.comboBox142:setWidth(55);
    obj.comboBox142:setHeight(25);
    obj.comboBox142:setField("dificuldade_4_11");
    obj.comboBox142:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox142:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox142:setName("comboBox142");

    obj.dataLink283 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink283:setParent(obj.layout76);
    obj.dataLink283:setField("dificuldade_4_11");
    obj.dataLink283:setDefaultValue("");
    obj.dataLink283:setName("dataLink283");

    obj.rectangle146 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle146:setParent(obj.layout76);
    obj.rectangle146:setLeft(275);
    obj.rectangle146:setTop(0);
    obj.rectangle146:setWidth(25);
    obj.rectangle146:setHeight(25);
    obj.rectangle146:setColor("black");
    obj.rectangle146:setStrokeColor("white");
    obj.rectangle146:setStrokeSize(1);
    obj.rectangle146:setName("rectangle146");

    obj.label218 = gui.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout76);
    obj.label218:setLeft(275);
    obj.label218:setTop(3);
    obj.label218:setWidth(25);
    obj.label218:setHeight(20);
    obj.label218:setField("xp_4_11");
    obj.label218:setHorzTextAlign("center");
    obj.label218:setName("label218");

    obj.button71 = gui.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout76);
    obj.button71:setLeft(300);
    obj.button71:setTop(3);
    obj.button71:setWidth(20);
    obj.button71:setHeight(20);
    obj.button71:setText("R");
    obj.button71:setName("button71");

    obj.dataLink284 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink284:setParent(obj.layout76);
    obj.dataLink284:setFields({'atr_4_11', 'dificuldade_4_11', 'bonus_4_11', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink284:setName("dataLink284");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout65);
    obj.layout77:setLeft(0);
    obj.layout77:setTop(305);
    obj.layout77:setWidth(325);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout77);
    obj.edit144:setLeft(5);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(85);
    obj.edit144:setHeight(25);
    obj.edit144:setField("pericia_4_12");
    obj.edit144:setName("edit144");

    obj.dataLink285 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink285:setParent(obj.layout77);
    obj.dataLink285:setField("pericia_4_12");
    obj.dataLink285:setDefaultValue("");
    obj.dataLink285:setName("dataLink285");

    obj.rectangle147 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle147:setParent(obj.layout77);
    obj.rectangle147:setLeft(90);
    obj.rectangle147:setTop(0);
    obj.rectangle147:setWidth(40);
    obj.rectangle147:setHeight(25);
    obj.rectangle147:setColor("black");
    obj.rectangle147:setStrokeColor("white");
    obj.rectangle147:setStrokeSize(1);
    obj.rectangle147:setName("rectangle147");

    obj.label219 = gui.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout77);
    obj.label219:setLeft(90);
    obj.label219:setTop(3);
    obj.label219:setWidth(40);
    obj.label219:setHeight(20);
    obj.label219:setField("nh_4_12");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setName("label219");

    obj.comboBox143 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox143:setParent(obj.layout77);
    obj.comboBox143:setLeft(130);
    obj.comboBox143:setTop(0);
    obj.comboBox143:setWidth(50);
    obj.comboBox143:setHeight(25);
    obj.comboBox143:setField("atr_4_12");
    obj.comboBox143:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox143:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox143:setName("comboBox143");

    obj.dataLink286 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink286:setParent(obj.layout77);
    obj.dataLink286:setField("atr_4_12");
    obj.dataLink286:setDefaultValue("");
    obj.dataLink286:setName("dataLink286");

    obj.label220 = gui.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout77);
    obj.label220:setLeft(180);
    obj.label220:setTop(3);
    obj.label220:setWidth(10);
    obj.label220:setHeight(20);
    obj.label220:setText("+");
    obj.label220:setHorzTextAlign("center");
    obj.label220:setName("label220");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout77);
    obj.edit145:setLeft(190);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(30);
    obj.edit145:setHeight(25);
    obj.edit145:setType("number");
    obj.edit145:setField("bonus_4_12");
    obj.edit145:setName("edit145");

    obj.comboBox144 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox144:setParent(obj.layout77);
    obj.comboBox144:setLeft(220);
    obj.comboBox144:setTop(0);
    obj.comboBox144:setWidth(55);
    obj.comboBox144:setHeight(25);
    obj.comboBox144:setField("dificuldade_4_12");
    obj.comboBox144:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox144:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox144:setName("comboBox144");

    obj.dataLink287 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink287:setParent(obj.layout77);
    obj.dataLink287:setField("dificuldade_4_12");
    obj.dataLink287:setDefaultValue("");
    obj.dataLink287:setName("dataLink287");

    obj.rectangle148 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle148:setParent(obj.layout77);
    obj.rectangle148:setLeft(275);
    obj.rectangle148:setTop(0);
    obj.rectangle148:setWidth(25);
    obj.rectangle148:setHeight(25);
    obj.rectangle148:setColor("black");
    obj.rectangle148:setStrokeColor("white");
    obj.rectangle148:setStrokeSize(1);
    obj.rectangle148:setName("rectangle148");

    obj.label221 = gui.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout77);
    obj.label221:setLeft(275);
    obj.label221:setTop(3);
    obj.label221:setWidth(25);
    obj.label221:setHeight(20);
    obj.label221:setField("xp_4_12");
    obj.label221:setHorzTextAlign("center");
    obj.label221:setName("label221");

    obj.button72 = gui.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout77);
    obj.button72:setLeft(300);
    obj.button72:setTop(3);
    obj.button72:setWidth(20);
    obj.button72:setHeight(20);
    obj.button72:setText("R");
    obj.button72:setName("button72");

    obj.dataLink288 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink288:setParent(obj.layout77);
    obj.dataLink288:setFields({'atr_4_12', 'dificuldade_4_12', 'bonus_4_12', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink288:setName("dataLink288");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout65);
    obj.layout78:setLeft(0);
    obj.layout78:setTop(330);
    obj.layout78:setWidth(325);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout78);
    obj.edit146:setLeft(5);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(85);
    obj.edit146:setHeight(25);
    obj.edit146:setField("pericia_4_13");
    obj.edit146:setName("edit146");

    obj.dataLink289 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink289:setParent(obj.layout78);
    obj.dataLink289:setField("pericia_4_13");
    obj.dataLink289:setDefaultValue("");
    obj.dataLink289:setName("dataLink289");

    obj.rectangle149 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle149:setParent(obj.layout78);
    obj.rectangle149:setLeft(90);
    obj.rectangle149:setTop(0);
    obj.rectangle149:setWidth(40);
    obj.rectangle149:setHeight(25);
    obj.rectangle149:setColor("black");
    obj.rectangle149:setStrokeColor("white");
    obj.rectangle149:setStrokeSize(1);
    obj.rectangle149:setName("rectangle149");

    obj.label222 = gui.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout78);
    obj.label222:setLeft(90);
    obj.label222:setTop(3);
    obj.label222:setWidth(40);
    obj.label222:setHeight(20);
    obj.label222:setField("nh_4_13");
    obj.label222:setHorzTextAlign("center");
    obj.label222:setName("label222");

    obj.comboBox145 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox145:setParent(obj.layout78);
    obj.comboBox145:setLeft(130);
    obj.comboBox145:setTop(0);
    obj.comboBox145:setWidth(50);
    obj.comboBox145:setHeight(25);
    obj.comboBox145:setField("atr_4_13");
    obj.comboBox145:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox145:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox145:setName("comboBox145");

    obj.dataLink290 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink290:setParent(obj.layout78);
    obj.dataLink290:setField("atr_4_13");
    obj.dataLink290:setDefaultValue("");
    obj.dataLink290:setName("dataLink290");

    obj.label223 = gui.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout78);
    obj.label223:setLeft(180);
    obj.label223:setTop(3);
    obj.label223:setWidth(10);
    obj.label223:setHeight(20);
    obj.label223:setText("+");
    obj.label223:setHorzTextAlign("center");
    obj.label223:setName("label223");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout78);
    obj.edit147:setLeft(190);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(30);
    obj.edit147:setHeight(25);
    obj.edit147:setType("number");
    obj.edit147:setField("bonus_4_13");
    obj.edit147:setName("edit147");

    obj.comboBox146 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox146:setParent(obj.layout78);
    obj.comboBox146:setLeft(220);
    obj.comboBox146:setTop(0);
    obj.comboBox146:setWidth(55);
    obj.comboBox146:setHeight(25);
    obj.comboBox146:setField("dificuldade_4_13");
    obj.comboBox146:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox146:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox146:setName("comboBox146");

    obj.dataLink291 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink291:setParent(obj.layout78);
    obj.dataLink291:setField("dificuldade_4_13");
    obj.dataLink291:setDefaultValue("");
    obj.dataLink291:setName("dataLink291");

    obj.rectangle150 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle150:setParent(obj.layout78);
    obj.rectangle150:setLeft(275);
    obj.rectangle150:setTop(0);
    obj.rectangle150:setWidth(25);
    obj.rectangle150:setHeight(25);
    obj.rectangle150:setColor("black");
    obj.rectangle150:setStrokeColor("white");
    obj.rectangle150:setStrokeSize(1);
    obj.rectangle150:setName("rectangle150");

    obj.label224 = gui.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout78);
    obj.label224:setLeft(275);
    obj.label224:setTop(3);
    obj.label224:setWidth(25);
    obj.label224:setHeight(20);
    obj.label224:setField("xp_4_13");
    obj.label224:setHorzTextAlign("center");
    obj.label224:setName("label224");

    obj.button73 = gui.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout78);
    obj.button73:setLeft(300);
    obj.button73:setTop(3);
    obj.button73:setWidth(20);
    obj.button73:setHeight(20);
    obj.button73:setText("R");
    obj.button73:setName("button73");

    obj.dataLink292 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink292:setParent(obj.layout78);
    obj.dataLink292:setFields({'atr_4_13', 'dificuldade_4_13', 'bonus_4_13', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink292:setName("dataLink292");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout65);
    obj.layout79:setLeft(0);
    obj.layout79:setTop(355);
    obj.layout79:setWidth(325);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout79);
    obj.edit148:setLeft(5);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(85);
    obj.edit148:setHeight(25);
    obj.edit148:setField("pericia_4_14");
    obj.edit148:setName("edit148");

    obj.dataLink293 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink293:setParent(obj.layout79);
    obj.dataLink293:setField("pericia_4_14");
    obj.dataLink293:setDefaultValue("");
    obj.dataLink293:setName("dataLink293");

    obj.rectangle151 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle151:setParent(obj.layout79);
    obj.rectangle151:setLeft(90);
    obj.rectangle151:setTop(0);
    obj.rectangle151:setWidth(40);
    obj.rectangle151:setHeight(25);
    obj.rectangle151:setColor("black");
    obj.rectangle151:setStrokeColor("white");
    obj.rectangle151:setStrokeSize(1);
    obj.rectangle151:setName("rectangle151");

    obj.label225 = gui.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout79);
    obj.label225:setLeft(90);
    obj.label225:setTop(3);
    obj.label225:setWidth(40);
    obj.label225:setHeight(20);
    obj.label225:setField("nh_4_14");
    obj.label225:setHorzTextAlign("center");
    obj.label225:setName("label225");

    obj.comboBox147 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox147:setParent(obj.layout79);
    obj.comboBox147:setLeft(130);
    obj.comboBox147:setTop(0);
    obj.comboBox147:setWidth(50);
    obj.comboBox147:setHeight(25);
    obj.comboBox147:setField("atr_4_14");
    obj.comboBox147:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox147:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox147:setName("comboBox147");

    obj.dataLink294 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink294:setParent(obj.layout79);
    obj.dataLink294:setField("atr_4_14");
    obj.dataLink294:setDefaultValue("");
    obj.dataLink294:setName("dataLink294");

    obj.label226 = gui.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout79);
    obj.label226:setLeft(180);
    obj.label226:setTop(3);
    obj.label226:setWidth(10);
    obj.label226:setHeight(20);
    obj.label226:setText("+");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setName("label226");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout79);
    obj.edit149:setLeft(190);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(25);
    obj.edit149:setType("number");
    obj.edit149:setField("bonus_4_14");
    obj.edit149:setName("edit149");

    obj.comboBox148 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox148:setParent(obj.layout79);
    obj.comboBox148:setLeft(220);
    obj.comboBox148:setTop(0);
    obj.comboBox148:setWidth(55);
    obj.comboBox148:setHeight(25);
    obj.comboBox148:setField("dificuldade_4_14");
    obj.comboBox148:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox148:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox148:setName("comboBox148");

    obj.dataLink295 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink295:setParent(obj.layout79);
    obj.dataLink295:setField("dificuldade_4_14");
    obj.dataLink295:setDefaultValue("");
    obj.dataLink295:setName("dataLink295");

    obj.rectangle152 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle152:setParent(obj.layout79);
    obj.rectangle152:setLeft(275);
    obj.rectangle152:setTop(0);
    obj.rectangle152:setWidth(25);
    obj.rectangle152:setHeight(25);
    obj.rectangle152:setColor("black");
    obj.rectangle152:setStrokeColor("white");
    obj.rectangle152:setStrokeSize(1);
    obj.rectangle152:setName("rectangle152");

    obj.label227 = gui.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout79);
    obj.label227:setLeft(275);
    obj.label227:setTop(3);
    obj.label227:setWidth(25);
    obj.label227:setHeight(20);
    obj.label227:setField("xp_4_14");
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.button74 = gui.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout79);
    obj.button74:setLeft(300);
    obj.button74:setTop(3);
    obj.button74:setWidth(20);
    obj.button74:setHeight(20);
    obj.button74:setText("R");
    obj.button74:setName("button74");

    obj.dataLink296 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink296:setParent(obj.layout79);
    obj.dataLink296:setFields({'atr_4_14', 'dificuldade_4_14', 'bonus_4_14', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink296:setName("dataLink296");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout65);
    obj.layout80:setLeft(0);
    obj.layout80:setTop(380);
    obj.layout80:setWidth(325);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout80);
    obj.edit150:setLeft(5);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(85);
    obj.edit150:setHeight(25);
    obj.edit150:setField("pericia_4_15");
    obj.edit150:setName("edit150");

    obj.dataLink297 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink297:setParent(obj.layout80);
    obj.dataLink297:setField("pericia_4_15");
    obj.dataLink297:setDefaultValue("");
    obj.dataLink297:setName("dataLink297");

    obj.rectangle153 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle153:setParent(obj.layout80);
    obj.rectangle153:setLeft(90);
    obj.rectangle153:setTop(0);
    obj.rectangle153:setWidth(40);
    obj.rectangle153:setHeight(25);
    obj.rectangle153:setColor("black");
    obj.rectangle153:setStrokeColor("white");
    obj.rectangle153:setStrokeSize(1);
    obj.rectangle153:setName("rectangle153");

    obj.label228 = gui.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout80);
    obj.label228:setLeft(90);
    obj.label228:setTop(3);
    obj.label228:setWidth(40);
    obj.label228:setHeight(20);
    obj.label228:setField("nh_4_15");
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.comboBox149 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox149:setParent(obj.layout80);
    obj.comboBox149:setLeft(130);
    obj.comboBox149:setTop(0);
    obj.comboBox149:setWidth(50);
    obj.comboBox149:setHeight(25);
    obj.comboBox149:setField("atr_4_15");
    obj.comboBox149:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox149:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox149:setName("comboBox149");

    obj.dataLink298 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink298:setParent(obj.layout80);
    obj.dataLink298:setField("atr_4_15");
    obj.dataLink298:setDefaultValue("");
    obj.dataLink298:setName("dataLink298");

    obj.label229 = gui.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout80);
    obj.label229:setLeft(180);
    obj.label229:setTop(3);
    obj.label229:setWidth(10);
    obj.label229:setHeight(20);
    obj.label229:setText("+");
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout80);
    obj.edit151:setLeft(190);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(30);
    obj.edit151:setHeight(25);
    obj.edit151:setType("number");
    obj.edit151:setField("bonus_4_15");
    obj.edit151:setName("edit151");

    obj.comboBox150 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox150:setParent(obj.layout80);
    obj.comboBox150:setLeft(220);
    obj.comboBox150:setTop(0);
    obj.comboBox150:setWidth(55);
    obj.comboBox150:setHeight(25);
    obj.comboBox150:setField("dificuldade_4_15");
    obj.comboBox150:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox150:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox150:setName("comboBox150");

    obj.dataLink299 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink299:setParent(obj.layout80);
    obj.dataLink299:setField("dificuldade_4_15");
    obj.dataLink299:setDefaultValue("");
    obj.dataLink299:setName("dataLink299");

    obj.rectangle154 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle154:setParent(obj.layout80);
    obj.rectangle154:setLeft(275);
    obj.rectangle154:setTop(0);
    obj.rectangle154:setWidth(25);
    obj.rectangle154:setHeight(25);
    obj.rectangle154:setColor("black");
    obj.rectangle154:setStrokeColor("white");
    obj.rectangle154:setStrokeSize(1);
    obj.rectangle154:setName("rectangle154");

    obj.label230 = gui.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout80);
    obj.label230:setLeft(275);
    obj.label230:setTop(3);
    obj.label230:setWidth(25);
    obj.label230:setHeight(20);
    obj.label230:setField("xp_4_15");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.button75 = gui.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout80);
    obj.button75:setLeft(300);
    obj.button75:setTop(3);
    obj.button75:setWidth(20);
    obj.button75:setHeight(20);
    obj.button75:setText("R");
    obj.button75:setName("button75");

    obj.dataLink300 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink300:setParent(obj.layout80);
    obj.dataLink300:setFields({'atr_4_15', 'dificuldade_4_15', 'bonus_4_15', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink300:setName("dataLink300");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout65);
    obj.layout81:setLeft(0);
    obj.layout81:setTop(405);
    obj.layout81:setWidth(325);
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout81);
    obj.edit152:setLeft(5);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(85);
    obj.edit152:setHeight(25);
    obj.edit152:setField("pericia_4_16");
    obj.edit152:setName("edit152");

    obj.dataLink301 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink301:setParent(obj.layout81);
    obj.dataLink301:setField("pericia_4_16");
    obj.dataLink301:setDefaultValue("");
    obj.dataLink301:setName("dataLink301");

    obj.rectangle155 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle155:setParent(obj.layout81);
    obj.rectangle155:setLeft(90);
    obj.rectangle155:setTop(0);
    obj.rectangle155:setWidth(40);
    obj.rectangle155:setHeight(25);
    obj.rectangle155:setColor("black");
    obj.rectangle155:setStrokeColor("white");
    obj.rectangle155:setStrokeSize(1);
    obj.rectangle155:setName("rectangle155");

    obj.label231 = gui.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout81);
    obj.label231:setLeft(90);
    obj.label231:setTop(3);
    obj.label231:setWidth(40);
    obj.label231:setHeight(20);
    obj.label231:setField("nh_4_16");
    obj.label231:setHorzTextAlign("center");
    obj.label231:setName("label231");

    obj.comboBox151 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox151:setParent(obj.layout81);
    obj.comboBox151:setLeft(130);
    obj.comboBox151:setTop(0);
    obj.comboBox151:setWidth(50);
    obj.comboBox151:setHeight(25);
    obj.comboBox151:setField("atr_4_16");
    obj.comboBox151:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox151:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox151:setName("comboBox151");

    obj.dataLink302 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink302:setParent(obj.layout81);
    obj.dataLink302:setField("atr_4_16");
    obj.dataLink302:setDefaultValue("");
    obj.dataLink302:setName("dataLink302");

    obj.label232 = gui.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout81);
    obj.label232:setLeft(180);
    obj.label232:setTop(3);
    obj.label232:setWidth(10);
    obj.label232:setHeight(20);
    obj.label232:setText("+");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout81);
    obj.edit153:setLeft(190);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(30);
    obj.edit153:setHeight(25);
    obj.edit153:setType("number");
    obj.edit153:setField("bonus_4_16");
    obj.edit153:setName("edit153");

    obj.comboBox152 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox152:setParent(obj.layout81);
    obj.comboBox152:setLeft(220);
    obj.comboBox152:setTop(0);
    obj.comboBox152:setWidth(55);
    obj.comboBox152:setHeight(25);
    obj.comboBox152:setField("dificuldade_4_16");
    obj.comboBox152:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox152:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox152:setName("comboBox152");

    obj.dataLink303 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink303:setParent(obj.layout81);
    obj.dataLink303:setField("dificuldade_4_16");
    obj.dataLink303:setDefaultValue("");
    obj.dataLink303:setName("dataLink303");

    obj.rectangle156 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle156:setParent(obj.layout81);
    obj.rectangle156:setLeft(275);
    obj.rectangle156:setTop(0);
    obj.rectangle156:setWidth(25);
    obj.rectangle156:setHeight(25);
    obj.rectangle156:setColor("black");
    obj.rectangle156:setStrokeColor("white");
    obj.rectangle156:setStrokeSize(1);
    obj.rectangle156:setName("rectangle156");

    obj.label233 = gui.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout81);
    obj.label233:setLeft(275);
    obj.label233:setTop(3);
    obj.label233:setWidth(25);
    obj.label233:setHeight(20);
    obj.label233:setField("xp_4_16");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setName("label233");

    obj.button76 = gui.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout81);
    obj.button76:setLeft(300);
    obj.button76:setTop(3);
    obj.button76:setWidth(20);
    obj.button76:setHeight(20);
    obj.button76:setText("R");
    obj.button76:setName("button76");

    obj.dataLink304 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink304:setParent(obj.layout81);
    obj.dataLink304:setFields({'atr_4_16', 'dificuldade_4_16', 'bonus_4_16', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink304:setName("dataLink304");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout65);
    obj.layout82:setLeft(0);
    obj.layout82:setTop(430);
    obj.layout82:setWidth(325);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout82);
    obj.edit154:setLeft(5);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(85);
    obj.edit154:setHeight(25);
    obj.edit154:setField("pericia_4_17");
    obj.edit154:setName("edit154");

    obj.dataLink305 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink305:setParent(obj.layout82);
    obj.dataLink305:setField("pericia_4_17");
    obj.dataLink305:setDefaultValue("");
    obj.dataLink305:setName("dataLink305");

    obj.rectangle157 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle157:setParent(obj.layout82);
    obj.rectangle157:setLeft(90);
    obj.rectangle157:setTop(0);
    obj.rectangle157:setWidth(40);
    obj.rectangle157:setHeight(25);
    obj.rectangle157:setColor("black");
    obj.rectangle157:setStrokeColor("white");
    obj.rectangle157:setStrokeSize(1);
    obj.rectangle157:setName("rectangle157");

    obj.label234 = gui.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout82);
    obj.label234:setLeft(90);
    obj.label234:setTop(3);
    obj.label234:setWidth(40);
    obj.label234:setHeight(20);
    obj.label234:setField("nh_4_17");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setName("label234");

    obj.comboBox153 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox153:setParent(obj.layout82);
    obj.comboBox153:setLeft(130);
    obj.comboBox153:setTop(0);
    obj.comboBox153:setWidth(50);
    obj.comboBox153:setHeight(25);
    obj.comboBox153:setField("atr_4_17");
    obj.comboBox153:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox153:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox153:setName("comboBox153");

    obj.dataLink306 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink306:setParent(obj.layout82);
    obj.dataLink306:setField("atr_4_17");
    obj.dataLink306:setDefaultValue("");
    obj.dataLink306:setName("dataLink306");

    obj.label235 = gui.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout82);
    obj.label235:setLeft(180);
    obj.label235:setTop(3);
    obj.label235:setWidth(10);
    obj.label235:setHeight(20);
    obj.label235:setText("+");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setName("label235");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout82);
    obj.edit155:setLeft(190);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(30);
    obj.edit155:setHeight(25);
    obj.edit155:setType("number");
    obj.edit155:setField("bonus_4_17");
    obj.edit155:setName("edit155");

    obj.comboBox154 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox154:setParent(obj.layout82);
    obj.comboBox154:setLeft(220);
    obj.comboBox154:setTop(0);
    obj.comboBox154:setWidth(55);
    obj.comboBox154:setHeight(25);
    obj.comboBox154:setField("dificuldade_4_17");
    obj.comboBox154:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox154:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox154:setName("comboBox154");

    obj.dataLink307 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink307:setParent(obj.layout82);
    obj.dataLink307:setField("dificuldade_4_17");
    obj.dataLink307:setDefaultValue("");
    obj.dataLink307:setName("dataLink307");

    obj.rectangle158 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle158:setParent(obj.layout82);
    obj.rectangle158:setLeft(275);
    obj.rectangle158:setTop(0);
    obj.rectangle158:setWidth(25);
    obj.rectangle158:setHeight(25);
    obj.rectangle158:setColor("black");
    obj.rectangle158:setStrokeColor("white");
    obj.rectangle158:setStrokeSize(1);
    obj.rectangle158:setName("rectangle158");

    obj.label236 = gui.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout82);
    obj.label236:setLeft(275);
    obj.label236:setTop(3);
    obj.label236:setWidth(25);
    obj.label236:setHeight(20);
    obj.label236:setField("xp_4_17");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.button77 = gui.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout82);
    obj.button77:setLeft(300);
    obj.button77:setTop(3);
    obj.button77:setWidth(20);
    obj.button77:setHeight(20);
    obj.button77:setText("R");
    obj.button77:setName("button77");

    obj.dataLink308 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink308:setParent(obj.layout82);
    obj.dataLink308:setFields({'atr_4_17', 'dificuldade_4_17', 'bonus_4_17', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink308:setName("dataLink308");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout65);
    obj.layout83:setLeft(0);
    obj.layout83:setTop(455);
    obj.layout83:setWidth(325);
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout83);
    obj.edit156:setLeft(5);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(85);
    obj.edit156:setHeight(25);
    obj.edit156:setField("pericia_4_18");
    obj.edit156:setName("edit156");

    obj.dataLink309 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink309:setParent(obj.layout83);
    obj.dataLink309:setField("pericia_4_18");
    obj.dataLink309:setDefaultValue("");
    obj.dataLink309:setName("dataLink309");

    obj.rectangle159 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle159:setParent(obj.layout83);
    obj.rectangle159:setLeft(90);
    obj.rectangle159:setTop(0);
    obj.rectangle159:setWidth(40);
    obj.rectangle159:setHeight(25);
    obj.rectangle159:setColor("black");
    obj.rectangle159:setStrokeColor("white");
    obj.rectangle159:setStrokeSize(1);
    obj.rectangle159:setName("rectangle159");

    obj.label237 = gui.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout83);
    obj.label237:setLeft(90);
    obj.label237:setTop(3);
    obj.label237:setWidth(40);
    obj.label237:setHeight(20);
    obj.label237:setField("nh_4_18");
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.comboBox155 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox155:setParent(obj.layout83);
    obj.comboBox155:setLeft(130);
    obj.comboBox155:setTop(0);
    obj.comboBox155:setWidth(50);
    obj.comboBox155:setHeight(25);
    obj.comboBox155:setField("atr_4_18");
    obj.comboBox155:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox155:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox155:setName("comboBox155");

    obj.dataLink310 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink310:setParent(obj.layout83);
    obj.dataLink310:setField("atr_4_18");
    obj.dataLink310:setDefaultValue("");
    obj.dataLink310:setName("dataLink310");

    obj.label238 = gui.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout83);
    obj.label238:setLeft(180);
    obj.label238:setTop(3);
    obj.label238:setWidth(10);
    obj.label238:setHeight(20);
    obj.label238:setText("+");
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout83);
    obj.edit157:setLeft(190);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(30);
    obj.edit157:setHeight(25);
    obj.edit157:setType("number");
    obj.edit157:setField("bonus_4_18");
    obj.edit157:setName("edit157");

    obj.comboBox156 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox156:setParent(obj.layout83);
    obj.comboBox156:setLeft(220);
    obj.comboBox156:setTop(0);
    obj.comboBox156:setWidth(55);
    obj.comboBox156:setHeight(25);
    obj.comboBox156:setField("dificuldade_4_18");
    obj.comboBox156:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox156:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox156:setName("comboBox156");

    obj.dataLink311 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink311:setParent(obj.layout83);
    obj.dataLink311:setField("dificuldade_4_18");
    obj.dataLink311:setDefaultValue("");
    obj.dataLink311:setName("dataLink311");

    obj.rectangle160 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle160:setParent(obj.layout83);
    obj.rectangle160:setLeft(275);
    obj.rectangle160:setTop(0);
    obj.rectangle160:setWidth(25);
    obj.rectangle160:setHeight(25);
    obj.rectangle160:setColor("black");
    obj.rectangle160:setStrokeColor("white");
    obj.rectangle160:setStrokeSize(1);
    obj.rectangle160:setName("rectangle160");

    obj.label239 = gui.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout83);
    obj.label239:setLeft(275);
    obj.label239:setTop(3);
    obj.label239:setWidth(25);
    obj.label239:setHeight(20);
    obj.label239:setField("xp_4_18");
    obj.label239:setHorzTextAlign("center");
    obj.label239:setName("label239");

    obj.button78 = gui.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout83);
    obj.button78:setLeft(300);
    obj.button78:setTop(3);
    obj.button78:setWidth(20);
    obj.button78:setHeight(20);
    obj.button78:setText("R");
    obj.button78:setName("button78");

    obj.dataLink312 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink312:setParent(obj.layout83);
    obj.dataLink312:setFields({'atr_4_18', 'dificuldade_4_18', 'bonus_4_18', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink312:setName("dataLink312");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout65);
    obj.layout84:setLeft(0);
    obj.layout84:setTop(480);
    obj.layout84:setWidth(325);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout84);
    obj.edit158:setLeft(5);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(85);
    obj.edit158:setHeight(25);
    obj.edit158:setField("pericia_4_19");
    obj.edit158:setName("edit158");

    obj.dataLink313 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink313:setParent(obj.layout84);
    obj.dataLink313:setField("pericia_4_19");
    obj.dataLink313:setDefaultValue("");
    obj.dataLink313:setName("dataLink313");

    obj.rectangle161 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle161:setParent(obj.layout84);
    obj.rectangle161:setLeft(90);
    obj.rectangle161:setTop(0);
    obj.rectangle161:setWidth(40);
    obj.rectangle161:setHeight(25);
    obj.rectangle161:setColor("black");
    obj.rectangle161:setStrokeColor("white");
    obj.rectangle161:setStrokeSize(1);
    obj.rectangle161:setName("rectangle161");

    obj.label240 = gui.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout84);
    obj.label240:setLeft(90);
    obj.label240:setTop(3);
    obj.label240:setWidth(40);
    obj.label240:setHeight(20);
    obj.label240:setField("nh_4_19");
    obj.label240:setHorzTextAlign("center");
    obj.label240:setName("label240");

    obj.comboBox157 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox157:setParent(obj.layout84);
    obj.comboBox157:setLeft(130);
    obj.comboBox157:setTop(0);
    obj.comboBox157:setWidth(50);
    obj.comboBox157:setHeight(25);
    obj.comboBox157:setField("atr_4_19");
    obj.comboBox157:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox157:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox157:setName("comboBox157");

    obj.dataLink314 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink314:setParent(obj.layout84);
    obj.dataLink314:setField("atr_4_19");
    obj.dataLink314:setDefaultValue("");
    obj.dataLink314:setName("dataLink314");

    obj.label241 = gui.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout84);
    obj.label241:setLeft(180);
    obj.label241:setTop(3);
    obj.label241:setWidth(10);
    obj.label241:setHeight(20);
    obj.label241:setText("+");
    obj.label241:setHorzTextAlign("center");
    obj.label241:setName("label241");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout84);
    obj.edit159:setLeft(190);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(30);
    obj.edit159:setHeight(25);
    obj.edit159:setType("number");
    obj.edit159:setField("bonus_4_19");
    obj.edit159:setName("edit159");

    obj.comboBox158 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox158:setParent(obj.layout84);
    obj.comboBox158:setLeft(220);
    obj.comboBox158:setTop(0);
    obj.comboBox158:setWidth(55);
    obj.comboBox158:setHeight(25);
    obj.comboBox158:setField("dificuldade_4_19");
    obj.comboBox158:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox158:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox158:setName("comboBox158");

    obj.dataLink315 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink315:setParent(obj.layout84);
    obj.dataLink315:setField("dificuldade_4_19");
    obj.dataLink315:setDefaultValue("");
    obj.dataLink315:setName("dataLink315");

    obj.rectangle162 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle162:setParent(obj.layout84);
    obj.rectangle162:setLeft(275);
    obj.rectangle162:setTop(0);
    obj.rectangle162:setWidth(25);
    obj.rectangle162:setHeight(25);
    obj.rectangle162:setColor("black");
    obj.rectangle162:setStrokeColor("white");
    obj.rectangle162:setStrokeSize(1);
    obj.rectangle162:setName("rectangle162");

    obj.label242 = gui.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout84);
    obj.label242:setLeft(275);
    obj.label242:setTop(3);
    obj.label242:setWidth(25);
    obj.label242:setHeight(20);
    obj.label242:setField("xp_4_19");
    obj.label242:setHorzTextAlign("center");
    obj.label242:setName("label242");

    obj.button79 = gui.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout84);
    obj.button79:setLeft(300);
    obj.button79:setTop(3);
    obj.button79:setWidth(20);
    obj.button79:setHeight(20);
    obj.button79:setText("R");
    obj.button79:setName("button79");

    obj.dataLink316 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink316:setParent(obj.layout84);
    obj.dataLink316:setFields({'atr_4_19', 'dificuldade_4_19', 'bonus_4_19', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink316:setName("dataLink316");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout65);
    obj.layout85:setLeft(0);
    obj.layout85:setTop(505);
    obj.layout85:setWidth(325);
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout85);
    obj.edit160:setLeft(5);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(85);
    obj.edit160:setHeight(25);
    obj.edit160:setField("pericia_4_20");
    obj.edit160:setName("edit160");

    obj.dataLink317 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink317:setParent(obj.layout85);
    obj.dataLink317:setField("pericia_4_20");
    obj.dataLink317:setDefaultValue("");
    obj.dataLink317:setName("dataLink317");

    obj.rectangle163 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle163:setParent(obj.layout85);
    obj.rectangle163:setLeft(90);
    obj.rectangle163:setTop(0);
    obj.rectangle163:setWidth(40);
    obj.rectangle163:setHeight(25);
    obj.rectangle163:setColor("black");
    obj.rectangle163:setStrokeColor("white");
    obj.rectangle163:setStrokeSize(1);
    obj.rectangle163:setName("rectangle163");

    obj.label243 = gui.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout85);
    obj.label243:setLeft(90);
    obj.label243:setTop(3);
    obj.label243:setWidth(40);
    obj.label243:setHeight(20);
    obj.label243:setField("nh_4_20");
    obj.label243:setHorzTextAlign("center");
    obj.label243:setName("label243");

    obj.comboBox159 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox159:setParent(obj.layout85);
    obj.comboBox159:setLeft(130);
    obj.comboBox159:setTop(0);
    obj.comboBox159:setWidth(50);
    obj.comboBox159:setHeight(25);
    obj.comboBox159:setField("atr_4_20");
    obj.comboBox159:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox159:setValues({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR'});
    obj.comboBox159:setName("comboBox159");

    obj.dataLink318 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink318:setParent(obj.layout85);
    obj.dataLink318:setField("atr_4_20");
    obj.dataLink318:setDefaultValue("");
    obj.dataLink318:setName("dataLink318");

    obj.label244 = gui.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout85);
    obj.label244:setLeft(180);
    obj.label244:setTop(3);
    obj.label244:setWidth(10);
    obj.label244:setHeight(20);
    obj.label244:setText("+");
    obj.label244:setHorzTextAlign("center");
    obj.label244:setName("label244");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout85);
    obj.edit161:setLeft(190);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(30);
    obj.edit161:setHeight(25);
    obj.edit161:setType("number");
    obj.edit161:setField("bonus_4_20");
    obj.edit161:setName("edit161");

    obj.comboBox160 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox160:setParent(obj.layout85);
    obj.comboBox160:setLeft(220);
    obj.comboBox160:setTop(0);
    obj.comboBox160:setWidth(55);
    obj.comboBox160:setHeight(25);
    obj.comboBox160:setField("dificuldade_4_20");
    obj.comboBox160:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox160:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox160:setName("comboBox160");

    obj.dataLink319 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink319:setParent(obj.layout85);
    obj.dataLink319:setField("dificuldade_4_20");
    obj.dataLink319:setDefaultValue("");
    obj.dataLink319:setName("dataLink319");

    obj.rectangle164 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle164:setParent(obj.layout85);
    obj.rectangle164:setLeft(275);
    obj.rectangle164:setTop(0);
    obj.rectangle164:setWidth(25);
    obj.rectangle164:setHeight(25);
    obj.rectangle164:setColor("black");
    obj.rectangle164:setStrokeColor("white");
    obj.rectangle164:setStrokeSize(1);
    obj.rectangle164:setName("rectangle164");

    obj.label245 = gui.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout85);
    obj.label245:setLeft(275);
    obj.label245:setTop(3);
    obj.label245:setWidth(25);
    obj.label245:setHeight(20);
    obj.label245:setField("xp_4_20");
    obj.label245:setHorzTextAlign("center");
    obj.label245:setName("label245");

    obj.button80 = gui.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout85);
    obj.button80:setLeft(300);
    obj.button80:setTop(3);
    obj.button80:setWidth(20);
    obj.button80:setHeight(20);
    obj.button80:setText("R");
    obj.button80:setName("button80");

    obj.dataLink320 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink320:setParent(obj.layout85);
    obj.dataLink320:setFields({'atr_4_20', 'dificuldade_4_20', 'bonus_4_20', 'total_st', 'total_dx', 'total_iq', 'total_ht', 'total_von', 'total_per'});
    obj.dataLink320:setName("dataLink320");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1335);
    obj.image1:setHeight(615);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20SSF%20releases/imagens/ABA0.png");
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_1 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_1";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_1 or 0) .." [NH" .. (sheet.nh_1_1 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event1 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_1=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_1=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_1=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_1=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_1) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_1) or 0);
            						sheet.xp_1_1 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_1=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_1=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_1=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_1=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_1=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_1=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_1) or 0);
            
            						local default1 = -5 ;
            						local default2 = "1_19";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 2;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 2;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_1 = mod;
            					end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_2 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_2";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_2 or 0) .." [NH" .. (sheet.nh_1_2 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event3 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_2=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_2=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_2=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_2=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_2) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_2) or 0);
            						sheet.xp_1_2 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_2=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_2=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_2=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_2=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_2=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_2=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_2) or 0);
            
            						local default1 = -2 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_2 = mod;
            					end;
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_3 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_3";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_3 or 0) .." [NH" .. (sheet.nh_1_3 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event5 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_3=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_3=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_3=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_3=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_3) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_3) or 0);
            						sheet.xp_1_3 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_3=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_3=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_3=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_3=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_3=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_3=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_3) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_3 = mod;
            					end;
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_4 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_4";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_4 or 0) .." [NH" .. (sheet.nh_1_4 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event7 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_4=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_4=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_4=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_4=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_4) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_4) or 0);
            						sheet.xp_1_4 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_4=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_4=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_4=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_4=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_4=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_4=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_4) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_4 = mod;
            					end;
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_5 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_5";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_5 or 0) .." [NH" .. (sheet.nh_1_5 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event9 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_5=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_5=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_5=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_5=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_5) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_5) or 0);
            						sheet.xp_1_5 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_5=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_5=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_5=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_5=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_5=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_5=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_5) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_5 = mod;
            					end;
        end, obj);

    obj._e_event10 = obj.button6:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_6 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_6";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_6 or 0) .." [NH" .. (sheet.nh_1_6 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event11 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_6=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_6=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_6=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_6=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_6) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_6) or 0);
            						sheet.xp_1_6 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_6=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_6=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_6=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_6=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_6=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_6=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_6) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_6 = mod;
            					end;
        end, obj);

    obj._e_event12 = obj.button7:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_7 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_7";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_7 or 0) .." [NH" .. (sheet.nh_1_7 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event13 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_7=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_7=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_7=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_7=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_7) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_7) or 0);
            						sheet.xp_1_7 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_7=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_7=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_7=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_7=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_7=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_7=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_7) or 0);
            
            						local default1 = -5 ;
            						local default2 = "2_17";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 5;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_7 = mod;
            					end;
        end, obj);

    obj._e_event14 = obj.button8:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_8 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_8";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_8 or 0) .." [NH" .. (sheet.nh_1_8 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event15 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_8=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_8=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_8=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_8=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_8) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_8) or 0);
            						sheet.xp_1_8 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_8=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_8=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_8=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_8=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_8=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_8=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_8) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_8 = mod;
            					end;
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_9 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_9";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_9 or 0) .." [NH" .. (sheet.nh_1_9 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event17 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_9=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_9=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_9=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_9=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_9) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_9) or 0);
            						sheet.xp_1_9 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_9=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_9=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_9=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_9=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_9=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_9=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_9) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_9 = mod;
            					end;
        end, obj);

    obj._e_event18 = obj.button10:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_10 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_10";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_10 or 0) .." [NH" .. (sheet.nh_1_10 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event19 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_10=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_10=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_10=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_10=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_10) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_10) or 0);
            						sheet.xp_1_10 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_10=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_10=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_10=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_10=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_10=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_10=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_10) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_10 = mod;
            					end;
        end, obj);

    obj._e_event20 = obj.button11:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_11 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_11";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_11 or 0) .." [NH" .. (sheet.nh_1_11 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event21 = obj.dataLink44:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_11=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_11=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_11=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_11=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_11) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_11) or 0);
            						sheet.xp_1_11 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_11=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_11=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_11=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_11=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_11=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_11=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_11) or 0);
            
            						local default1 = -5 ;
            						local default2 = "2_7";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 2;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_11 = mod;
            					end;
        end, obj);

    obj._e_event22 = obj.button12:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_12 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_12";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_12 or 0) .." [NH" .. (sheet.nh_1_12 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event23 = obj.dataLink48:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_12=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_12=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_12=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_12=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_12) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_12) or 0);
            						sheet.xp_1_12 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_12=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_12=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_12=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_12=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_12=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_12=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_12) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_12 = mod;
            					end;
        end, obj);

    obj._e_event24 = obj.button13:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_13 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_13";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_13 or 0) .." [NH" .. (sheet.nh_1_13 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event25 = obj.dataLink52:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_13=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_13=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_13=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_13=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_13) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_13) or 0);
            						sheet.xp_1_13 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_13=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_13=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_13=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_13=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_13=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_13=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_13) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_13 = mod;
            					end;
        end, obj);

    obj._e_event26 = obj.button14:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_14 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_14";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_14 or 0) .." [NH" .. (sheet.nh_1_14 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event27 = obj.dataLink56:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_14=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_14=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_14=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_14=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_14) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_14) or 0);
            						sheet.xp_1_14 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_14=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_14=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_14=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_14=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_14=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_14=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_14) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_14 = mod;
            					end;
        end, obj);

    obj._e_event28 = obj.button15:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_15 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_15";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_15 or 0) .." [NH" .. (sheet.nh_1_15 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event29 = obj.dataLink60:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_15=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_15=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_15=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_15=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_15) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_15) or 0);
            						sheet.xp_1_15 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_15=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_15=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_15=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_15=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_15=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_15=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_15) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_15 = mod;
            					end;
        end, obj);

    obj._e_event30 = obj.button16:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_16 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_16";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_16 or 0) .." [NH" .. (sheet.nh_1_16 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event31 = obj.dataLink64:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_16=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_16=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_16=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_16=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_16) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_16) or 0);
            						sheet.xp_1_16 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_16=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_16=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_16=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_16=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_16=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_16=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_16) or 0);
            
            						local default1 = -6 ;
            						local default2 = "2_14";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 4;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_16 = mod;
            					end;
        end, obj);

    obj._e_event32 = obj.button17:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_17 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_17";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_17 or 0) .." [NH" .. (sheet.nh_1_17 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event33 = obj.dataLink68:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_17=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_17=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_17=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_17=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_17) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_17) or 0);
            						sheet.xp_1_17 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_17=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_17=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_17=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_17=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_17=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_17=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_17) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_17 = mod;
            					end;
        end, obj);

    obj._e_event34 = obj.button18:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_18 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_18";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_18 or 0) .." [NH" .. (sheet.nh_1_18 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event35 = obj.dataLink72:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_18=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_18=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_18=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_18=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_18) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_18) or 0);
            						sheet.xp_1_18 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_18=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_18=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_18=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_18=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_18=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_18=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_18) or 0);
            
            						local default1 = -6 ;
            						local default2 = "2_16";
            						local default3 = "3_2";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 4;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 8;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_18 = mod;
            					end;
        end, obj);

    obj._e_event36 = obj.button19:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_19 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_19";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_19 or 0) .." [NH" .. (sheet.nh_1_19 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event37 = obj.dataLink76:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_19=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_19=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_19=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_19=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_19) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_19) or 0);
            						sheet.xp_1_19 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_19=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_19=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_19=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_19=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_19=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_19=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_19) or 0);
            
            						local default1 = -5 ;
            						local default2 = "1_1";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 2;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_19 = mod;
            					end;
        end, obj);

    obj._e_event38 = obj.button20:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_1_20 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "1_20";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_1_20 or 0) .." [NH" .. (sheet.nh_1_20 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event39 = obj.dataLink80:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_1_20=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_1_20=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_1_20=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_1_20=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_1_20) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_1_20) or 0);
            						sheet.xp_1_20 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_1_20=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_1_20=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_1_20=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_1_20=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_1_20=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_1_20=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_1_20) or 0);
            
            						local default1 = -5 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_1_20 = mod;
            					end;
        end, obj);

    obj._e_event40 = obj.button21:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_1 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_1";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_1 or 0) .." [NH" .. (sheet.nh_2_1 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event41 = obj.dataLink84:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_1=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_1=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_1=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_1=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_1) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_1) or 0);
            						sheet.xp_2_1 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_1=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_1=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_1=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_1=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_1=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_1=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_1) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_1 = mod;
            					end;
        end, obj);

    obj._e_event42 = obj.button22:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_2 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_2";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_2 or 0) .." [NH" .. (sheet.nh_2_2 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event43 = obj.dataLink88:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_2=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_2=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_2=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_2=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_2) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_2) or 0);
            						sheet.xp_2_2 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_2=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_2=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_2=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_2=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_2=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_2=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_2) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_2 = mod;
            					end;
        end, obj);

    obj._e_event44 = obj.button23:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_3 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_3";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_3 or 0) .." [NH" .. (sheet.nh_2_3 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event45 = obj.dataLink92:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_3=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_3=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_3=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_3=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_3) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_3) or 0);
            						sheet.xp_2_3 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_3=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_3=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_3=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_3=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_3=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_3=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_3) or 0);
            
            						local default1 = -6 ;
            						local default2 = "1_18";
            						local default3 = "2_16";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 5;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 5;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_3 = mod;
            					end;
        end, obj);

    obj._e_event46 = obj.button24:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_4 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_4";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_4 or 0) .." [NH" .. (sheet.nh_2_4 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event47 = obj.dataLink96:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_4=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_4=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_4=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_4=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_4) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_4) or 0);
            						sheet.xp_2_4 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_4=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_4=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_4=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_4=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_4=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_4=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_4) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_4 = mod;
            					end;
        end, obj);

    obj._e_event48 = obj.button25:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_5 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_5";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_5 or 0) .." [NH" .. (sheet.nh_2_5 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event49 = obj.dataLink100:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_5=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_5=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_5=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_5=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_5) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_5) or 0);
            						sheet.xp_2_5 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_5=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_5=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_5=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_5=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_5=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_5=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_5) or 0);
            
            						local default1 = -5 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_5 = mod;
            					end;
        end, obj);

    obj._e_event50 = obj.button26:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_6 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_6";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_6 or 0) .." [NH" .. (sheet.nh_2_6 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event51 = obj.dataLink104:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_6=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_6=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_6=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_6=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_6) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_6) or 0);
            						sheet.xp_2_6 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_6=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_6=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_6=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_6=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_6=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_6=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_6) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_6 = mod;
            					end;
        end, obj);

    obj._e_event52 = obj.button27:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_7 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_7";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_7 or 0) .." [NH" .. (sheet.nh_2_7 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event53 = obj.dataLink108:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_7=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_7=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_7=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_7=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_7) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_7) or 0);
            						sheet.xp_2_7 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_7=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_7=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_7=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_7=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_7=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_7=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_7) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_7 = mod;
            					end;
        end, obj);

    obj._e_event54 = obj.button28:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_8 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_8";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_8 or 0) .." [NH" .. (sheet.nh_2_8 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event55 = obj.dataLink112:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_8=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_8=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_8=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_8=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_8) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_8) or 0);
            						sheet.xp_2_8 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_8=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_8=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_8=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_8=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_8=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_8=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_8) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_8 = mod;
            					end;
        end, obj);

    obj._e_event56 = obj.button29:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_9 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_9";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_9 or 0) .." [NH" .. (sheet.nh_2_9 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event57 = obj.dataLink116:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_9=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_9=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_9=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_9=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_9) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_9) or 0);
            						sheet.xp_2_9 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_9=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_9=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_9=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_9=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_9=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_9=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_9) or 0);
            
            						local default1 = -5 ;
            						local default2 = "2_10";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 3;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_9 = mod;
            					end;
        end, obj);

    obj._e_event58 = obj.button30:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_10 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_10";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_10 or 0) .." [NH" .. (sheet.nh_2_10 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event59 = obj.dataLink120:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_10=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_10=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_10=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_10=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_10) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_10) or 0);
            						sheet.xp_2_10 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_10=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_10=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_10=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_10=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_10=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_10=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_10) or 0);
            
            						local default1 = -5 ;
            						local default2 = "1_19";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 3;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_10 = mod;
            					end;
        end, obj);

    obj._e_event60 = obj.button31:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_11 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_11";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_11 or 0) .." [NH" .. (sheet.nh_2_11 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event61 = obj.dataLink124:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_11=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_11=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_11=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_11=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_11) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_11) or 0);
            						sheet.xp_2_11 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_11=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_11=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_11=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_11=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_11=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_11=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_11) or 0);
            
            						local default1 = -5 ;
            						local default2 = "1_19";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 5;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_11 = mod;
            					end;
        end, obj);

    obj._e_event62 = obj.button32:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_12 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_12";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_12 or 0) .." [NH" .. (sheet.nh_2_12 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event63 = obj.dataLink128:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_12=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_12=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_12=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_12=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_12) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_12) or 0);
            						sheet.xp_2_12 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_12=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_12=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_12=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_12=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_12=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_12=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_12) or 0);
            
            						local default1 = -10 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_12 = mod;
            					end;
        end, obj);

    obj._e_event64 = obj.button33:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_13 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_13";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_13 or 0) .." [NH" .. (sheet.nh_2_13 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event65 = obj.dataLink132:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_13=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_13=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_13=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_13=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_13) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_13) or 0);
            						sheet.xp_2_13 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_13=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_13=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_13=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_13=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_13=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_13=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_13) or 0);
            
            						local default1 = -5 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_13 = mod;
            					end;
        end, obj);

    obj._e_event66 = obj.button34:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_14 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_14";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_14 or 0) .." [NH" .. (sheet.nh_2_14 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event67 = obj.dataLink136:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_14=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_14=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_14=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_14=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_14) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_14) or 0);
            						sheet.xp_2_14 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_14=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_14=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_14=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_14=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_14=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_14=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_14) or 0);
            
            						local default1 = -100 ;
            						local default2 = "1_16";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 4;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_14 = mod;
            					end;
        end, obj);

    obj._e_event68 = obj.button35:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_15 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_15";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_15 or 0) .." [NH" .. (sheet.nh_2_15 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event69 = obj.dataLink140:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_15=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_15=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_15=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_15=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_15) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_15) or 0);
            						sheet.xp_2_15 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_15=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_15=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_15=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_15=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_15=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_15=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_15) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_15 = mod;
            					end;
        end, obj);

    obj._e_event70 = obj.button36:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_16 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_16";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_16 or 0) .." [NH" .. (sheet.nh_2_16 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event71 = obj.dataLink144:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_16=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_16=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_16=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_16=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_16) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_16) or 0);
            						sheet.xp_2_16 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_16=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_16=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_16=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_16=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_16=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_16=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_16) or 0);
            
            						local default1 = -7 ;
            						local default2 = "3_2";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 11;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_16 = mod;
            					end;
        end, obj);

    obj._e_event72 = obj.button37:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_17 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_17";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_17 or 0) .." [NH" .. (sheet.nh_2_17 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event73 = obj.dataLink148:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_17=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_17=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_17=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_17=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_17) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_17) or 0);
            						sheet.xp_2_17 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_17=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_17=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_17=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_17=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_17=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_17=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_17) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_17 = mod;
            					end;
        end, obj);

    obj._e_event74 = obj.button38:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_18 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_18";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_18 or 0) .." [NH" .. (sheet.nh_2_18 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event75 = obj.dataLink152:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_18=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_18=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_18=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_18=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_18) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_18) or 0);
            						sheet.xp_2_18 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_18=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_18=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_18=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_18=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_18=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_18=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_18) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_18 = mod;
            					end;
        end, obj);

    obj._e_event76 = obj.button39:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_19 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_19";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_19 or 0) .." [NH" .. (sheet.nh_2_19 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event77 = obj.dataLink156:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_19=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_19=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_19=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_19=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_19) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_19) or 0);
            						sheet.xp_2_19 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_19=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_19=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_19=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_19=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_19=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_19=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_19) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_19 = mod;
            					end;
        end, obj);

    obj._e_event78 = obj.button40:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_2_20 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "2_20";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_2_20 or 0) .." [NH" .. (sheet.nh_2_20 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event79 = obj.dataLink160:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_2_20=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_2_20=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_2_20=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_2_20=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_2_20) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_2_20) or 0);
            						sheet.xp_2_20 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_2_20=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_2_20=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_2_20=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_2_20=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_2_20=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_2_20=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_2_20) or 0);
            
            						local default1 = -5 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_2_20 = mod;
            					end;
        end, obj);

    obj._e_event80 = obj.button41:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_1 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_1";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_1 or 0) .." [NH" .. (sheet.nh_3_1 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event81 = obj.dataLink164:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_1=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_1=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_1=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_1=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_1) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_1) or 0);
            						sheet.xp_3_1 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_1=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_1=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_1=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_1=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_1=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_1=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_1) or 0);
            
            						local default1 = -5 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_1 = mod;
            					end;
        end, obj);

    obj._e_event82 = obj.button42:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_2 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_2";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_2 or 0) .." [NH" .. (sheet.nh_3_2 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event83 = obj.dataLink168:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_2=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_2=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_2=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_2=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_2) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_2) or 0);
            						sheet.xp_3_2 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_2=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_2=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_2=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_2=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_2=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_2=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_2) or 0);
            
            						local default1 = -4 ;
            						local default2 = "2_16";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 4;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_2 = mod;
            					end;
        end, obj);

    obj._e_event84 = obj.button43:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_3 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_3";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_3 or 0) .." [NH" .. (sheet.nh_3_3 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event85 = obj.dataLink172:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_3=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_3=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_3=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_3=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_3) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_3) or 0);
            						sheet.xp_3_3 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_3=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_3=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_3=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_3=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_3=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_3=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_3) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_3 = mod;
            					end;
        end, obj);

    obj._e_event86 = obj.button44:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_4 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_4";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_4 or 0) .." [NH" .. (sheet.nh_3_4 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event87 = obj.dataLink176:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_4=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_4=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_4=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_4=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_4) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_4) or 0);
            						sheet.xp_3_4 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_4=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_4=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_4=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_4=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_4=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_4=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_4) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_4 = mod;
            					end;
        end, obj);

    obj._e_event88 = obj.button45:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_5 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_5";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_5 or 0) .." [NH" .. (sheet.nh_3_5 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event89 = obj.dataLink180:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_5=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_5=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_5=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_5=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_5) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_5) or 0);
            						sheet.xp_3_5 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_5=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_5=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_5=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_5=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_5=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_5=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_5) or 0);
            
            						local default1 = -5 ;
            						local default2 = "2_5";
            						local default3 = "2_20";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 4;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 5;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_5 = mod;
            					end;
        end, obj);

    obj._e_event90 = obj.button46:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_6 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_6";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_6 or 0) .." [NH" .. (sheet.nh_3_6 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event91 = obj.dataLink184:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_6=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_6=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_6=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_6=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_6) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_6) or 0);
            						sheet.xp_3_6 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_6=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_6=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_6=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_6=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_6=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_6=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_6) or 0);
            
            						local default1 = -5 ;
            						local default2 = "2_19";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 5;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_6 = mod;
            					end;
        end, obj);

    obj._e_event92 = obj.button47:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_7 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_7";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_7 or 0) .." [NH" .. (sheet.nh_3_7 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event93 = obj.dataLink188:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_7=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_7=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_7=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_7=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_7) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_7) or 0);
            						sheet.xp_3_7 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_7=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_7=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_7=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_7=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_7=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_7=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_7) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_7 = mod;
            					end;
        end, obj);

    obj._e_event94 = obj.button48:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_8 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_8";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_8 or 0) .." [NH" .. (sheet.nh_3_8 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event95 = obj.dataLink192:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_8=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_8=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_8=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_8=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_8) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_8) or 0);
            						sheet.xp_3_8 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_8=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_8=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_8=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_8=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_8=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_8=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_8) or 0);
            
            						local default1 = -5 ;
            						local default2 = "2_19";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 3;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_8 = mod;
            					end;
        end, obj);

    obj._e_event96 = obj.button49:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_9 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_9";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_9 or 0) .." [NH" .. (sheet.nh_3_9 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event97 = obj.dataLink196:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_9=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_9=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_9=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_9=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_9) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_9) or 0);
            						sheet.xp_3_9 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_9=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_9=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_9=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_9=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_9=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_9=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_9) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_9 = mod;
            					end;
        end, obj);

    obj._e_event98 = obj.button50:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_10 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_10";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_10 or 0) .." [NH" .. (sheet.nh_3_10 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event99 = obj.dataLink200:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_10=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_10=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_10=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_10=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_10) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_10) or 0);
            						sheet.xp_3_10 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_10=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_10=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_10=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_10=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_10=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_10=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_10) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_10 = mod;
            					end;
        end, obj);

    obj._e_event100 = obj.button51:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_11 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_11";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_11 or 0) .." [NH" .. (sheet.nh_3_11 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event101 = obj.dataLink204:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_11=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_11=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_11=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_11=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_11) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_11) or 0);
            						sheet.xp_3_11 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_11=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_11=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_11=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_11=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_11=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_11=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_11) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_11 = mod;
            					end;
        end, obj);

    obj._e_event102 = obj.button52:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_12 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_12";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_12 or 0) .." [NH" .. (sheet.nh_3_12 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event103 = obj.dataLink208:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_12=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_12=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_12=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_12=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_12) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_12) or 0);
            						sheet.xp_3_12 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_12=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_12=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_12=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_12=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_12=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_12=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_12) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_12 = mod;
            					end;
        end, obj);

    obj._e_event104 = obj.button53:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_13 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_13";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_13 or 0) .." [NH" .. (sheet.nh_3_13 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event105 = obj.dataLink212:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_13=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_13=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_13=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_13=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_13) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_13) or 0);
            						sheet.xp_3_13 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_13=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_13=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_13=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_13=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_13=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_13=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_13) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_13 = mod;
            					end;
        end, obj);

    obj._e_event106 = obj.button54:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_14 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_14";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_14 or 0) .." [NH" .. (sheet.nh_3_14 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event107 = obj.dataLink216:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_14=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_14=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_14=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_14=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_14) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_14) or 0);
            						sheet.xp_3_14 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_14=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_14=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_14=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_14=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_14=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_14=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_14) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_14 = mod;
            					end;
        end, obj);

    obj._e_event108 = obj.button55:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_15 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_15";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_15 or 0) .." [NH" .. (sheet.nh_3_15 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event109 = obj.dataLink220:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_15=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_15=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_15=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_15=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_15) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_15) or 0);
            						sheet.xp_3_15 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_15=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_15=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_15=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_15=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_15=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_15=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_15) or 0);
            
            						local default1 = -6 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_15 = mod;
            					end;
        end, obj);

    obj._e_event110 = obj.button56:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_16 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_16";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_16 or 0) .." [NH" .. (sheet.nh_3_16 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event111 = obj.dataLink224:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_16=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_16=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_16=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_16=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_16) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_16) or 0);
            						sheet.xp_3_16 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_16=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_16=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_16=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_16=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_16=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_16=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_16) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_16 = mod;
            					end;
        end, obj);

    obj._e_event112 = obj.button57:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_17 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_17";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_17 or 0) .." [NH" .. (sheet.nh_3_17 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event113 = obj.dataLink228:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_17=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_17=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_17=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_17=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_17) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_17) or 0);
            						sheet.xp_3_17 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_17=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_17=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_17=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_17=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_17=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_17=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_17) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_17 = mod;
            					end;
        end, obj);

    obj._e_event114 = obj.button58:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_18 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_18";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_18 or 0) .." [NH" .. (sheet.nh_3_18 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event115 = obj.dataLink232:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_18=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_18=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_18=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_18=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_18) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_18) or 0);
            						sheet.xp_3_18 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_18=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_18=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_18=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_18=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_18=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_18=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_18) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_18 = mod;
            					end;
        end, obj);

    obj._e_event116 = obj.button59:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_19 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_19";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_19 or 0) .." [NH" .. (sheet.nh_3_19 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event117 = obj.dataLink236:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_19=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_19=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_19=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_19=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_19) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_19) or 0);
            						sheet.xp_3_19 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_19=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_19=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_19=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_19=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_19=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_19=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_19) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_19 = mod;
            					end;
        end, obj);

    obj._e_event118 = obj.button60:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_3_20 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "3_20";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_3_20 or 0) .." [NH" .. (sheet.nh_3_20 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event119 = obj.dataLink240:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_3_20=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_3_20=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_3_20=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_3_20=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_3_20) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_3_20) or 0);
            						sheet.xp_3_20 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_3_20=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_3_20=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_3_20=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_3_20=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_3_20=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_3_20=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_3_20) or 0);
            
            						local default1 = -4 ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_3_20 = mod;
            					end;
        end, obj);

    obj._e_event120 = obj.button61:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_1 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_1";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_1 or 0) .." [NH" .. (sheet.nh_4_1 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event121 = obj.dataLink244:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_1=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_1=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_1=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_1=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_1) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_1) or 0);
            						sheet.xp_4_1 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_1=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_1=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_1=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_1=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_1=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_1=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_1) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_1 = mod;
            					end;
        end, obj);

    obj._e_event122 = obj.button62:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_2 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_2";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_2 or 0) .." [NH" .. (sheet.nh_4_2 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event123 = obj.dataLink248:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_2=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_2=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_2=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_2=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_2) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_2) or 0);
            						sheet.xp_4_2 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_2=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_2=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_2=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_2=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_2=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_2=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_2) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_2 = mod;
            					end;
        end, obj);

    obj._e_event124 = obj.button63:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_3 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_3";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_3 or 0) .." [NH" .. (sheet.nh_4_3 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event125 = obj.dataLink252:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_3=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_3=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_3=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_3=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_3) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_3) or 0);
            						sheet.xp_4_3 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_3=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_3=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_3=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_3=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_3=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_3=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_3) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_3 = mod;
            					end;
        end, obj);

    obj._e_event126 = obj.button64:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_4 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_4";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_4 or 0) .." [NH" .. (sheet.nh_4_4 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event127 = obj.dataLink256:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_4=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_4=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_4=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_4=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_4) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_4) or 0);
            						sheet.xp_4_4 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_4=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_4=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_4=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_4=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_4=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_4=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_4) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_4 = mod;
            					end;
        end, obj);

    obj._e_event128 = obj.button65:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_5 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_5";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_5 or 0) .." [NH" .. (sheet.nh_4_5 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event129 = obj.dataLink260:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_5=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_5=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_5=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_5=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_5) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_5) or 0);
            						sheet.xp_4_5 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_5=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_5=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_5=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_5=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_5=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_5=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_5) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_5 = mod;
            					end;
        end, obj);

    obj._e_event130 = obj.button66:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_6 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_6";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_6 or 0) .." [NH" .. (sheet.nh_4_6 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event131 = obj.dataLink264:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_6=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_6=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_6=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_6=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_6) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_6) or 0);
            						sheet.xp_4_6 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_6=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_6=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_6=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_6=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_6=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_6=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_6) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_6 = mod;
            					end;
        end, obj);

    obj._e_event132 = obj.button67:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_7 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_7";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_7 or 0) .." [NH" .. (sheet.nh_4_7 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event133 = obj.dataLink268:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_7=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_7=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_7=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_7=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_7) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_7) or 0);
            						sheet.xp_4_7 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_7=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_7=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_7=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_7=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_7=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_7=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_7) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_7 = mod;
            					end;
        end, obj);

    obj._e_event134 = obj.button68:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_8 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_8";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_8 or 0) .." [NH" .. (sheet.nh_4_8 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event135 = obj.dataLink272:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_8=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_8=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_8=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_8=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_8) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_8) or 0);
            						sheet.xp_4_8 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_8=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_8=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_8=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_8=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_8=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_8=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_8) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_8 = mod;
            					end;
        end, obj);

    obj._e_event136 = obj.button69:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_9 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_9";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_9 or 0) .." [NH" .. (sheet.nh_4_9 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event137 = obj.dataLink276:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_9=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_9=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_9=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_9=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_9) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_9) or 0);
            						sheet.xp_4_9 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_9=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_9=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_9=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_9=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_9=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_9=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_9) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_9 = mod;
            					end;
        end, obj);

    obj._e_event138 = obj.button70:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_10 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_10";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_10 or 0) .." [NH" .. (sheet.nh_4_10 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event139 = obj.dataLink280:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_10=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_10=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_10=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_10=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_10) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_10) or 0);
            						sheet.xp_4_10 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_10=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_10=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_10=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_10=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_10=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_10=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_10) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_10 = mod;
            					end;
        end, obj);

    obj._e_event140 = obj.button71:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_11 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_11";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_11 or 0) .." [NH" .. (sheet.nh_4_11 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event141 = obj.dataLink284:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_11=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_11=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_11=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_11=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_11) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_11) or 0);
            						sheet.xp_4_11 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_11=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_11=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_11=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_11=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_11=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_11=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_11) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_11 = mod;
            					end;
        end, obj);

    obj._e_event142 = obj.button72:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_12 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_12";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_12 or 0) .." [NH" .. (sheet.nh_4_12 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event143 = obj.dataLink288:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_12=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_12=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_12=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_12=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_12) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_12) or 0);
            						sheet.xp_4_12 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_12=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_12=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_12=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_12=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_12=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_12=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_12) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_12 = mod;
            					end;
        end, obj);

    obj._e_event144 = obj.button73:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_13 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_13";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_13 or 0) .." [NH" .. (sheet.nh_4_13 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event145 = obj.dataLink292:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_13=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_13=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_13=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_13=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_13) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_13) or 0);
            						sheet.xp_4_13 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_13=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_13=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_13=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_13=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_13=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_13=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_13) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_13 = mod;
            					end;
        end, obj);

    obj._e_event146 = obj.button74:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_14 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_14";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_14 or 0) .." [NH" .. (sheet.nh_4_14 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event147 = obj.dataLink296:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_14=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_14=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_14=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_14=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_14) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_14) or 0);
            						sheet.xp_4_14 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_14=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_14=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_14=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_14=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_14=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_14=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_14) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_14 = mod;
            					end;
        end, obj);

    obj._e_event148 = obj.button75:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_15 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_15";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_15 or 0) .." [NH" .. (sheet.nh_4_15 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event149 = obj.dataLink300:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_15=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_15=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_15=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_15=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_15) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_15) or 0);
            						sheet.xp_4_15 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_15=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_15=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_15=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_15=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_15=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_15=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_15) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_15 = mod;
            					end;
        end, obj);

    obj._e_event150 = obj.button76:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_16 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_16";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_16 or 0) .." [NH" .. (sheet.nh_4_16 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event151 = obj.dataLink304:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_16=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_16=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_16=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_16=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_16) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_16) or 0);
            						sheet.xp_4_16 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_16=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_16=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_16=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_16=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_16=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_16=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_16) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_16 = mod;
            					end;
        end, obj);

    obj._e_event152 = obj.button77:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_17 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_17";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_17 or 0) .." [NH" .. (sheet.nh_4_17 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event153 = obj.dataLink308:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_17=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_17=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_17=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_17=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_17) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_17) or 0);
            						sheet.xp_4_17 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_17=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_17=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_17=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_17=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_17=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_17=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_17) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_17 = mod;
            					end;
        end, obj);

    obj._e_event154 = obj.button78:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_18 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_18";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_18 or 0) .." [NH" .. (sheet.nh_4_18 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event155 = obj.dataLink312:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_18=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_18=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_18=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_18=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_18) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_18) or 0);
            						sheet.xp_4_18 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_18=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_18=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_18=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_18=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_18=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_18=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_18) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_18 = mod;
            					end;
        end, obj);

    obj._e_event156 = obj.button79:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_19 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_19";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_19 or 0) .." [NH" .. (sheet.nh_4_19 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event157 = obj.dataLink316:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_19=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_19=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_19=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_19=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_19) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_19) or 0);
            						sheet.xp_4_19 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_19=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_19=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_19=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_19=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_19=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_19=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_19) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_19 = mod;
            					end;
        end, obj);

    obj._e_event158 = obj.button80:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				
            					rolagem = rrpg.interpretarRolagem("3d6");
            					target = (sheet.nh_4_20 or 0) + (tonumber(sheet.mod) or 0);
            					local tecnica = "4_20";
            					if (tecnica=="3_16" or tecnica=="3_17" or tecnica=="3_18" or tecnica=="1_9") then
            						fulminante = true;
            					else 
            						fulminante = nil;
            					end;
            
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia_4_20 or 0) .." [NH" .. (sheet.nh_4_20 or 0) .. (sheet.sinal or "+") .. (sheet.mod or 0) .. "]", 
            						function (rolado)
            							pos(rolado);
            						end);
        end, obj);

    obj._e_event159 = obj.dataLink320:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local mod2 = 0;
            						local tabela_custo;
            
            						if sheet.dificuldade_4_20=="F" then
            							tabela_custo = {0, 0, 0, 0, 1, 2, 4, 8, 12, 16};
            						elseif sheet.dificuldade_4_20=="M" then
            							tabela_custo = {0, 0, 0, 1, 2, 4, 8, 12, 16, 20};
            						elseif sheet.dificuldade_4_20=="D" then
            							tabela_custo = {0, 0, 1, 2, 4, 8, 12, 16, 20, 24};
            						elseif sheet.dificuldade_4_20=="MD" then
            							tabela_custo = {0, 1, 2, 4, 8, 12, 16, 20, 24, 28};
            						else
            							tabela_custo = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            						end;
            
            						local mod3 = (tonumber(sheet.bonus_4_20) or -4) + 5;
            						local mod4 = 0;
            						if mod3>10 then
            							mod4 = (mod3-10)*4;
            							mod3 = 10;
            						end;
            
            						mod2 = tabela_custo[mod3] + mod4;
            
            						local xp = (tonumber(sheet.xp_4_20) or 0);
            						sheet.xp_4_20 = mod2;
            						sheet.xp_pericias = (tonumber(sheet.xp_pericias) or 0) - xp + mod2;
            
            						local mod = 0;
            						if sheet.atr_4_20=="ST" then
            							mod = (tonumber(sheet.total_st) or 0);
            						elseif sheet.atr_4_20=="DX" then
            							mod = (tonumber(sheet.total_dx) or 0);
            						elseif sheet.atr_4_20=="IQ" then
            							mod = (tonumber(sheet.total_iq) or 0);
            						elseif sheet.atr_4_20=="HT" then
            							mod = (tonumber(sheet.total_ht) or 0);
            						elseif sheet.atr_4_20=="VT" then
            							mod = (tonumber(sheet.total_von) or 0);
            						elseif sheet.atr_4_20=="PR" then
            							mod = (tonumber(sheet.total_per) or 0);
            						else
            							mod = 0;
            						end
            
            						local atr = mod;
            						mod = mod + (tonumber(sheet.bonus_4_20) or 0);
            
            						local default1 = nil ;
            						local default2 = "0_0";
            						local default3 = "0_0";
            
            						if mod2 == 0 then
            							if default1 == nil then
            								mod = 0;
            							else
            								default1 = atr + default1;
            								default2 = (tonumber(sheet["nh_" .. default2]) or 0) - 0;
            								default3 = (tonumber(sheet["nh_" .. default3]) or 0) - 0;
            
            								mod = math.max(default1, default2, default3);
            							end;
            						end;
            
            						sheet.nh_4_20 = mod;
            					end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink246 ~= nil then self.dataLink246:destroy(); self.dataLink246 = nil; end;
        if self.dataLink142 ~= nil then self.dataLink142:destroy(); self.dataLink142 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.dataLink206 ~= nil then self.dataLink206:destroy(); self.dataLink206 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.comboBox121 ~= nil then self.comboBox121:destroy(); self.comboBox121 = nil; end;
        if self.comboBox127 ~= nil then self.comboBox127:destroy(); self.comboBox127 = nil; end;
        if self.rectangle148 ~= nil then self.rectangle148:destroy(); self.rectangle148 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.comboBox65 ~= nil then self.comboBox65:destroy(); self.comboBox65 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.comboBox157 ~= nil then self.comboBox157:destroy(); self.comboBox157 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.dataLink284 ~= nil then self.dataLink284:destroy(); self.dataLink284 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.dataLink244 ~= nil then self.dataLink244:destroy(); self.dataLink244 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.comboBox113 ~= nil then self.comboBox113:destroy(); self.comboBox113 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.dataLink141 ~= nil then self.dataLink141:destroy(); self.dataLink141 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox147 ~= nil then self.comboBox147:destroy(); self.comboBox147 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.dataLink316 ~= nil then self.dataLink316:destroy(); self.dataLink316 = nil; end;
        if self.comboBox146 ~= nil then self.comboBox146:destroy(); self.comboBox146 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.dataLink174 ~= nil then self.dataLink174:destroy(); self.dataLink174 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink259 ~= nil then self.dataLink259:destroy(); self.dataLink259 = nil; end;
        if self.dataLink230 ~= nil then self.dataLink230:destroy(); self.dataLink230 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.comboBox58 ~= nil then self.comboBox58:destroy(); self.comboBox58 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.comboBox91 ~= nil then self.comboBox91:destroy(); self.comboBox91 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.dataLink186 ~= nil then self.dataLink186:destroy(); self.dataLink186 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.dataLink225 ~= nil then self.dataLink225:destroy(); self.dataLink225 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.comboBox60 ~= nil then self.comboBox60:destroy(); self.comboBox60 = nil; end;
        if self.dataLink247 ~= nil then self.dataLink247:destroy(); self.dataLink247 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.dataLink188 ~= nil then self.dataLink188:destroy(); self.dataLink188 = nil; end;
        if self.dataLink308 ~= nil then self.dataLink308:destroy(); self.dataLink308 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.comboBox67 ~= nil then self.comboBox67:destroy(); self.comboBox67 = nil; end;
        if self.comboBox135 ~= nil then self.comboBox135:destroy(); self.comboBox135 = nil; end;
        if self.dataLink160 ~= nil then self.dataLink160:destroy(); self.dataLink160 = nil; end;
        if self.dataLink183 ~= nil then self.dataLink183:destroy(); self.dataLink183 = nil; end;
        if self.comboBox38 ~= nil then self.comboBox38:destroy(); self.comboBox38 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.dataLink172 ~= nil then self.dataLink172:destroy(); self.dataLink172 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.dataLink208 ~= nil then self.dataLink208:destroy(); self.dataLink208 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink200 ~= nil then self.dataLink200:destroy(); self.dataLink200 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.comboBox122 ~= nil then self.comboBox122:destroy(); self.comboBox122 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.comboBox52 ~= nil then self.comboBox52:destroy(); self.comboBox52 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.dataLink227 ~= nil then self.dataLink227:destroy(); self.dataLink227 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle156 ~= nil then self.rectangle156:destroy(); self.rectangle156 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.dataLink277 ~= nil then self.dataLink277:destroy(); self.dataLink277 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink307 ~= nil then self.dataLink307:destroy(); self.dataLink307 = nil; end;
        if self.dataLink319 ~= nil then self.dataLink319:destroy(); self.dataLink319 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.dataLink242 ~= nil then self.dataLink242:destroy(); self.dataLink242 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink223 ~= nil then self.dataLink223:destroy(); self.dataLink223 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.dataLink272 ~= nil then self.dataLink272:destroy(); self.dataLink272 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.dataLink289 ~= nil then self.dataLink289:destroy(); self.dataLink289 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.dataLink258 ~= nil then self.dataLink258:destroy(); self.dataLink258 = nil; end;
        if self.dataLink256 ~= nil then self.dataLink256:destroy(); self.dataLink256 = nil; end;
        if self.comboBox123 ~= nil then self.comboBox123:destroy(); self.comboBox123 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.dataLink250 ~= nil then self.dataLink250:destroy(); self.dataLink250 = nil; end;
        if self.comboBox92 ~= nil then self.comboBox92:destroy(); self.comboBox92 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.comboBox111 ~= nil then self.comboBox111:destroy(); self.comboBox111 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.comboBox140 ~= nil then self.comboBox140:destroy(); self.comboBox140 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.dataLink251 ~= nil then self.dataLink251:destroy(); self.dataLink251 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.dataLink249 ~= nil then self.dataLink249:destroy(); self.dataLink249 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.dataLink318 ~= nil then self.dataLink318:destroy(); self.dataLink318 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.comboBox63 ~= nil then self.comboBox63:destroy(); self.comboBox63 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.dataLink201 ~= nil then self.dataLink201:destroy(); self.dataLink201 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.dataLink239 ~= nil then self.dataLink239:destroy(); self.dataLink239 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink128 ~= nil then self.dataLink128:destroy(); self.dataLink128 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.dataLink264 ~= nil then self.dataLink264:destroy(); self.dataLink264 = nil; end;
        if self.rectangle158 ~= nil then self.rectangle158:destroy(); self.rectangle158 = nil; end;
        if self.dataLink311 ~= nil then self.dataLink311:destroy(); self.dataLink311 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.comboBox136 ~= nil then self.comboBox136:destroy(); self.comboBox136 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink189 ~= nil then self.dataLink189:destroy(); self.dataLink189 = nil; end;
        if self.comboBox117 ~= nil then self.comboBox117:destroy(); self.comboBox117 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.dataLink120 ~= nil then self.dataLink120:destroy(); self.dataLink120 = nil; end;
        if self.dataLink281 ~= nil then self.dataLink281:destroy(); self.dataLink281 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.comboBox115 ~= nil then self.comboBox115:destroy(); self.comboBox115 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.dataLink173 ~= nil then self.dataLink173:destroy(); self.dataLink173 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.dataLink288 ~= nil then self.dataLink288:destroy(); self.dataLink288 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.dataLink287 ~= nil then self.dataLink287:destroy(); self.dataLink287 = nil; end;
        if self.comboBox39 ~= nil then self.comboBox39:destroy(); self.comboBox39 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.dataLink285 ~= nil then self.dataLink285:destroy(); self.dataLink285 = nil; end;
        if self.comboBox89 ~= nil then self.comboBox89:destroy(); self.comboBox89 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.dataLink161 ~= nil then self.dataLink161:destroy(); self.dataLink161 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.comboBox68 ~= nil then self.comboBox68:destroy(); self.comboBox68 = nil; end;
        if self.rectangle162 ~= nil then self.rectangle162:destroy(); self.rectangle162 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.comboBox108 ~= nil then self.comboBox108:destroy(); self.comboBox108 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink169 ~= nil then self.dataLink169:destroy(); self.dataLink169 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.dataLink155 ~= nil then self.dataLink155:destroy(); self.dataLink155 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.dataLink187 ~= nil then self.dataLink187:destroy(); self.dataLink187 = nil; end;
        if self.comboBox131 ~= nil then self.comboBox131:destroy(); self.comboBox131 = nil; end;
        if self.dataLink294 ~= nil then self.dataLink294:destroy(); self.dataLink294 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.comboBox129 ~= nil then self.comboBox129:destroy(); self.comboBox129 = nil; end;
        if self.dataLink270 ~= nil then self.dataLink270:destroy(); self.dataLink270 = nil; end;
        if self.dataLink290 ~= nil then self.dataLink290:destroy(); self.dataLink290 = nil; end;
        if self.comboBox148 ~= nil then self.comboBox148:destroy(); self.comboBox148 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.dataLink209 ~= nil then self.dataLink209:destroy(); self.dataLink209 = nil; end;
        if self.comboBox59 ~= nil then self.comboBox59:destroy(); self.comboBox59 = nil; end;
        if self.dataLink266 ~= nil then self.dataLink266:destroy(); self.dataLink266 = nil; end;
        if self.comboBox152 ~= nil then self.comboBox152:destroy(); self.comboBox152 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.comboBox107 ~= nil then self.comboBox107:destroy(); self.comboBox107 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.dataLink271 ~= nil then self.dataLink271:destroy(); self.dataLink271 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.comboBox150 ~= nil then self.comboBox150:destroy(); self.comboBox150 = nil; end;
        if self.comboBox158 ~= nil then self.comboBox158:destroy(); self.comboBox158 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.dataLink207 ~= nil then self.dataLink207:destroy(); self.dataLink207 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.rectangle146 ~= nil then self.rectangle146:destroy(); self.rectangle146 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.dataLink220 ~= nil then self.dataLink220:destroy(); self.dataLink220 = nil; end;
        if self.dataLink291 ~= nil then self.dataLink291:destroy(); self.dataLink291 = nil; end;
        if self.dataLink193 ~= nil then self.dataLink193:destroy(); self.dataLink193 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.dataLink133 ~= nil then self.dataLink133:destroy(); self.dataLink133 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink283 ~= nil then self.dataLink283:destroy(); self.dataLink283 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink199 ~= nil then self.dataLink199:destroy(); self.dataLink199 = nil; end;
        if self.comboBox74 ~= nil then self.comboBox74:destroy(); self.comboBox74 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.comboBox159 ~= nil then self.comboBox159:destroy(); self.comboBox159 = nil; end;
        if self.comboBox120 ~= nil then self.comboBox120:destroy(); self.comboBox120 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.dataLink182 ~= nil then self.dataLink182:destroy(); self.dataLink182 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.comboBox72 ~= nil then self.comboBox72:destroy(); self.comboBox72 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.dataLink241 ~= nil then self.dataLink241:destroy(); self.dataLink241 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.dataLink238 ~= nil then self.dataLink238:destroy(); self.dataLink238 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.dataLink117 ~= nil then self.dataLink117:destroy(); self.dataLink117 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.rectangle150 ~= nil then self.rectangle150:destroy(); self.rectangle150 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.comboBox114 ~= nil then self.comboBox114:destroy(); self.comboBox114 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.dataLink297 ~= nil then self.dataLink297:destroy(); self.dataLink297 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.comboBox160 ~= nil then self.comboBox160:destroy(); self.comboBox160 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.dataLink150 ~= nil then self.dataLink150:destroy(); self.dataLink150 = nil; end;
        if self.comboBox45 ~= nil then self.comboBox45:destroy(); self.comboBox45 = nil; end;
        if self.dataLink123 ~= nil then self.dataLink123:destroy(); self.dataLink123 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.dataLink274 ~= nil then self.dataLink274:destroy(); self.dataLink274 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.dataLink315 ~= nil then self.dataLink315:destroy(); self.dataLink315 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.dataLink269 ~= nil then self.dataLink269:destroy(); self.dataLink269 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle147 ~= nil then self.rectangle147:destroy(); self.rectangle147 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.comboBox142 ~= nil then self.comboBox142:destroy(); self.comboBox142 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.comboBox87 ~= nil then self.comboBox87:destroy(); self.comboBox87 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox81 ~= nil then self.comboBox81:destroy(); self.comboBox81 = nil; end;
        if self.dataLink127 ~= nil then self.dataLink127:destroy(); self.dataLink127 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.dataLink243 ~= nil then self.dataLink243:destroy(); self.dataLink243 = nil; end;
        if self.comboBox50 ~= nil then self.comboBox50:destroy(); self.comboBox50 = nil; end;
        if self.dataLink166 ~= nil then self.dataLink166:destroy(); self.dataLink166 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.comboBox116 ~= nil then self.comboBox116:destroy(); self.comboBox116 = nil; end;
        if self.comboBox134 ~= nil then self.comboBox134:destroy(); self.comboBox134 = nil; end;
        if self.rectangle159 ~= nil then self.rectangle159:destroy(); self.rectangle159 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.comboBox98 ~= nil then self.comboBox98:destroy(); self.comboBox98 = nil; end;
        if self.dataLink154 ~= nil then self.dataLink154:destroy(); self.dataLink154 = nil; end;
        if self.rectangle164 ~= nil then self.rectangle164:destroy(); self.rectangle164 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.dataLink181 ~= nil then self.dataLink181:destroy(); self.dataLink181 = nil; end;
        if self.dataLink135 ~= nil then self.dataLink135:destroy(); self.dataLink135 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.dataLink309 ~= nil then self.dataLink309:destroy(); self.dataLink309 = nil; end;
        if self.comboBox124 ~= nil then self.comboBox124:destroy(); self.comboBox124 = nil; end;
        if self.dataLink145 ~= nil then self.dataLink145:destroy(); self.dataLink145 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.dataLink116 ~= nil then self.dataLink116:destroy(); self.dataLink116 = nil; end;
        if self.dataLink231 ~= nil then self.dataLink231:destroy(); self.dataLink231 = nil; end;
        if self.dataLink304 ~= nil then self.dataLink304:destroy(); self.dataLink304 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.dataLink292 ~= nil then self.dataLink292:destroy(); self.dataLink292 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.dataLink152 ~= nil then self.dataLink152:destroy(); self.dataLink152 = nil; end;
        if self.comboBox94 ~= nil then self.comboBox94:destroy(); self.comboBox94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.dataLink171 ~= nil then self.dataLink171:destroy(); self.dataLink171 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.comboBox143 ~= nil then self.comboBox143:destroy(); self.comboBox143 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.rectangle152 ~= nil then self.rectangle152:destroy(); self.rectangle152 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.dataLink136 ~= nil then self.dataLink136:destroy(); self.dataLink136 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink184 ~= nil then self.dataLink184:destroy(); self.dataLink184 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.comboBox71 ~= nil then self.comboBox71:destroy(); self.comboBox71 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.dataLink279 ~= nil then self.dataLink279:destroy(); self.dataLink279 = nil; end;
        if self.comboBox145 ~= nil then self.comboBox145:destroy(); self.comboBox145 = nil; end;
        if self.rectangle154 ~= nil then self.rectangle154:destroy(); self.rectangle154 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.rectangle160 ~= nil then self.rectangle160:destroy(); self.rectangle160 = nil; end;
        if self.comboBox78 ~= nil then self.comboBox78:destroy(); self.comboBox78 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.dataLink164 ~= nil then self.dataLink164:destroy(); self.dataLink164 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.dataLink228 ~= nil then self.dataLink228:destroy(); self.dataLink228 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.comboBox93 ~= nil then self.comboBox93:destroy(); self.comboBox93 = nil; end;
        if self.comboBox125 ~= nil then self.comboBox125:destroy(); self.comboBox125 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink229 ~= nil then self.dataLink229:destroy(); self.dataLink229 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.comboBox88 ~= nil then self.comboBox88:destroy(); self.comboBox88 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.dataLink317 ~= nil then self.dataLink317:destroy(); self.dataLink317 = nil; end;
        if self.dataLink255 ~= nil then self.dataLink255:destroy(); self.dataLink255 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.dataLink278 ~= nil then self.dataLink278:destroy(); self.dataLink278 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.dataLink211 ~= nil then self.dataLink211:destroy(); self.dataLink211 = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.comboBox112 ~= nil then self.comboBox112:destroy(); self.comboBox112 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink144 ~= nil then self.dataLink144:destroy(); self.dataLink144 = nil; end;
        if self.comboBox64 ~= nil then self.comboBox64:destroy(); self.comboBox64 = nil; end;
        if self.comboBox106 ~= nil then self.comboBox106:destroy(); self.comboBox106 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.rectangle151 ~= nil then self.rectangle151:destroy(); self.rectangle151 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.rectangle161 ~= nil then self.rectangle161:destroy(); self.rectangle161 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.dataLink170 ~= nil then self.dataLink170:destroy(); self.dataLink170 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.dataLink157 ~= nil then self.dataLink157:destroy(); self.dataLink157 = nil; end;
        if self.dataLink159 ~= nil then self.dataLink159:destroy(); self.dataLink159 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.comboBox156 ~= nil then self.comboBox156:destroy(); self.comboBox156 = nil; end;
        if self.dataLink218 ~= nil then self.dataLink218:destroy(); self.dataLink218 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink118 ~= nil then self.dataLink118:destroy(); self.dataLink118 = nil; end;
        if self.dataLink302 ~= nil then self.dataLink302:destroy(); self.dataLink302 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.dataLink234 ~= nil then self.dataLink234:destroy(); self.dataLink234 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.dataLink265 ~= nil then self.dataLink265:destroy(); self.dataLink265 = nil; end;
        if self.comboBox138 ~= nil then self.comboBox138:destroy(); self.comboBox138 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.comboBox149 ~= nil then self.comboBox149:destroy(); self.comboBox149 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.dataLink257 ~= nil then self.dataLink257:destroy(); self.dataLink257 = nil; end;
        if self.dataLink293 ~= nil then self.dataLink293:destroy(); self.dataLink293 = nil; end;
        if self.dataLink232 ~= nil then self.dataLink232:destroy(); self.dataLink232 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.dataLink158 ~= nil then self.dataLink158:destroy(); self.dataLink158 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.comboBox95 ~= nil then self.comboBox95:destroy(); self.comboBox95 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.comboBox109 ~= nil then self.comboBox109:destroy(); self.comboBox109 = nil; end;
        if self.dataLink205 ~= nil then self.dataLink205:destroy(); self.dataLink205 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.rectangle144 ~= nil then self.rectangle144:destroy(); self.rectangle144 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.dataLink149 ~= nil then self.dataLink149:destroy(); self.dataLink149 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.dataLink301 ~= nil then self.dataLink301:destroy(); self.dataLink301 = nil; end;
        if self.dataLink185 ~= nil then self.dataLink185:destroy(); self.dataLink185 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.dataLink210 ~= nil then self.dataLink210:destroy(); self.dataLink210 = nil; end;
        if self.dataLink215 ~= nil then self.dataLink215:destroy(); self.dataLink215 = nil; end;
        if self.dataLink275 ~= nil then self.dataLink275:destroy(); self.dataLink275 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.comboBox137 ~= nil then self.comboBox137:destroy(); self.comboBox137 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.comboBox96 ~= nil then self.comboBox96:destroy(); self.comboBox96 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.dataLink213 ~= nil then self.dataLink213:destroy(); self.dataLink213 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.comboBox86 ~= nil then self.comboBox86:destroy(); self.comboBox86 = nil; end;
        if self.comboBox54 ~= nil then self.comboBox54:destroy(); self.comboBox54 = nil; end;
        if self.rectangle149 ~= nil then self.rectangle149:destroy(); self.rectangle149 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.comboBox101 ~= nil then self.comboBox101:destroy(); self.comboBox101 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.dataLink179 ~= nil then self.dataLink179:destroy(); self.dataLink179 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.dataLink273 ~= nil then self.dataLink273:destroy(); self.dataLink273 = nil; end;
        if self.dataLink147 ~= nil then self.dataLink147:destroy(); self.dataLink147 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.dataLink196 ~= nil then self.dataLink196:destroy(); self.dataLink196 = nil; end;
        if self.rectangle153 ~= nil then self.rectangle153:destroy(); self.rectangle153 = nil; end;
        if self.dataLink261 ~= nil then self.dataLink261:destroy(); self.dataLink261 = nil; end;
        if self.dataLink267 ~= nil then self.dataLink267:destroy(); self.dataLink267 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.dataLink202 ~= nil then self.dataLink202:destroy(); self.dataLink202 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.comboBox80 ~= nil then self.comboBox80:destroy(); self.comboBox80 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.comboBox104 ~= nil then self.comboBox104:destroy(); self.comboBox104 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.comboBox97 ~= nil then self.comboBox97:destroy(); self.comboBox97 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.comboBox69 ~= nil then self.comboBox69:destroy(); self.comboBox69 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.comboBox118 ~= nil then self.comboBox118:destroy(); self.comboBox118 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.rectangle143 ~= nil then self.rectangle143:destroy(); self.rectangle143 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.dataLink148 ~= nil then self.dataLink148:destroy(); self.dataLink148 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.rectangle155 ~= nil then self.rectangle155:destroy(); self.rectangle155 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.dataLink262 ~= nil then self.dataLink262:destroy(); self.dataLink262 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.comboBox49 ~= nil then self.comboBox49:destroy(); self.comboBox49 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle145 ~= nil then self.rectangle145:destroy(); self.rectangle145 = nil; end;
        if self.comboBox76 ~= nil then self.comboBox76:destroy(); self.comboBox76 = nil; end;
        if self.comboBox56 ~= nil then self.comboBox56:destroy(); self.comboBox56 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.comboBox77 ~= nil then self.comboBox77:destroy(); self.comboBox77 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.dataLink165 ~= nil then self.dataLink165:destroy(); self.dataLink165 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.comboBox144 ~= nil then self.comboBox144:destroy(); self.comboBox144 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.dataLink138 ~= nil then self.dataLink138:destroy(); self.dataLink138 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.dataLink153 ~= nil then self.dataLink153:destroy(); self.dataLink153 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.dataLink175 ~= nil then self.dataLink175:destroy(); self.dataLink175 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.dataLink286 ~= nil then self.dataLink286:destroy(); self.dataLink286 = nil; end;
        if self.dataLink151 ~= nil then self.dataLink151:destroy(); self.dataLink151 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.comboBox90 ~= nil then self.comboBox90:destroy(); self.comboBox90 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.dataLink194 ~= nil then self.dataLink194:destroy(); self.dataLink194 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink167 ~= nil then self.dataLink167:destroy(); self.dataLink167 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.comboBox51 ~= nil then self.comboBox51:destroy(); self.comboBox51 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.dataLink121 ~= nil then self.dataLink121:destroy(); self.dataLink121 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.dataLink252 ~= nil then self.dataLink252:destroy(); self.dataLink252 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.comboBox102 ~= nil then self.comboBox102:destroy(); self.comboBox102 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.comboBox99 ~= nil then self.comboBox99:destroy(); self.comboBox99 = nil; end;
        if self.comboBox47 ~= nil then self.comboBox47:destroy(); self.comboBox47 = nil; end;
        if self.dataLink204 ~= nil then self.dataLink204:destroy(); self.dataLink204 = nil; end;
        if self.dataLink300 ~= nil then self.dataLink300:destroy(); self.dataLink300 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.comboBox126 ~= nil then self.comboBox126:destroy(); self.comboBox126 = nil; end;
        if self.dataLink313 ~= nil then self.dataLink313:destroy(); self.dataLink313 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink119 ~= nil then self.dataLink119:destroy(); self.dataLink119 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.dataLink226 ~= nil then self.dataLink226:destroy(); self.dataLink226 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.rectangle157 ~= nil then self.rectangle157:destroy(); self.rectangle157 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.comboBox53 ~= nil then self.comboBox53:destroy(); self.comboBox53 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.dataLink217 ~= nil then self.dataLink217:destroy(); self.dataLink217 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.dataLink162 ~= nil then self.dataLink162:destroy(); self.dataLink162 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.comboBox153 ~= nil then self.comboBox153:destroy(); self.comboBox153 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink163 ~= nil then self.dataLink163:destroy(); self.dataLink163 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink310 ~= nil then self.dataLink310:destroy(); self.dataLink310 = nil; end;
        if self.dataLink320 ~= nil then self.dataLink320:destroy(); self.dataLink320 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.dataLink137 ~= nil then self.dataLink137:destroy(); self.dataLink137 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.dataLink248 ~= nil then self.dataLink248:destroy(); self.dataLink248 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.comboBox48 ~= nil then self.comboBox48:destroy(); self.comboBox48 = nil; end;
        if self.dataLink295 ~= nil then self.dataLink295:destroy(); self.dataLink295 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.comboBox110 ~= nil then self.comboBox110:destroy(); self.comboBox110 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.dataLink212 ~= nil then self.dataLink212:destroy(); self.dataLink212 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.comboBox85 ~= nil then self.comboBox85:destroy(); self.comboBox85 = nil; end;
        if self.comboBox154 ~= nil then self.comboBox154:destroy(); self.comboBox154 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.comboBox119 ~= nil then self.comboBox119:destroy(); self.comboBox119 = nil; end;
        if self.comboBox105 ~= nil then self.comboBox105:destroy(); self.comboBox105 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.dataLink254 ~= nil then self.dataLink254:destroy(); self.dataLink254 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.comboBox83 ~= nil then self.comboBox83:destroy(); self.comboBox83 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.dataLink190 ~= nil then self.dataLink190:destroy(); self.dataLink190 = nil; end;
        if self.dataLink126 ~= nil then self.dataLink126:destroy(); self.dataLink126 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox44 ~= nil then self.comboBox44:destroy(); self.comboBox44 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.comboBox66 ~= nil then self.comboBox66:destroy(); self.comboBox66 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.dataLink214 ~= nil then self.dataLink214:destroy(); self.dataLink214 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.dataLink240 ~= nil then self.dataLink240:destroy(); self.dataLink240 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.dataLink203 ~= nil then self.dataLink203:destroy(); self.dataLink203 = nil; end;
        if self.dataLink237 ~= nil then self.dataLink237:destroy(); self.dataLink237 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink130 ~= nil then self.dataLink130:destroy(); self.dataLink130 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.dataLink131 ~= nil then self.dataLink131:destroy(); self.dataLink131 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink122 ~= nil then self.dataLink122:destroy(); self.dataLink122 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.comboBox57 ~= nil then self.comboBox57:destroy(); self.comboBox57 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.dataLink143 ~= nil then self.dataLink143:destroy(); self.dataLink143 = nil; end;
        if self.comboBox75 ~= nil then self.comboBox75:destroy(); self.comboBox75 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.dataLink195 ~= nil then self.dataLink195:destroy(); self.dataLink195 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.dataLink253 ~= nil then self.dataLink253:destroy(); self.dataLink253 = nil; end;
        if self.comboBox128 ~= nil then self.comboBox128:destroy(); self.comboBox128 = nil; end;
        if self.comboBox133 ~= nil then self.comboBox133:destroy(); self.comboBox133 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.rectangle141 ~= nil then self.rectangle141:destroy(); self.rectangle141 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.dataLink115 ~= nil then self.dataLink115:destroy(); self.dataLink115 = nil; end;
        if self.dataLink298 ~= nil then self.dataLink298:destroy(); self.dataLink298 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.dataLink134 ~= nil then self.dataLink134:destroy(); self.dataLink134 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle142 ~= nil then self.rectangle142:destroy(); self.rectangle142 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.dataLink139 ~= nil then self.dataLink139:destroy(); self.dataLink139 = nil; end;
        if self.comboBox46 ~= nil then self.comboBox46:destroy(); self.comboBox46 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink233 ~= nil then self.dataLink233:destroy(); self.dataLink233 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.dataLink303 ~= nil then self.dataLink303:destroy(); self.dataLink303 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.dataLink192 ~= nil then self.dataLink192:destroy(); self.dataLink192 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle163 ~= nil then self.rectangle163:destroy(); self.rectangle163 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.comboBox151 ~= nil then self.comboBox151:destroy(); self.comboBox151 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.dataLink177 ~= nil then self.dataLink177:destroy(); self.dataLink177 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.comboBox132 ~= nil then self.comboBox132:destroy(); self.comboBox132 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink235 ~= nil then self.dataLink235:destroy(); self.dataLink235 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.dataLink191 ~= nil then self.dataLink191:destroy(); self.dataLink191 = nil; end;
        if self.dataLink198 ~= nil then self.dataLink198:destroy(); self.dataLink198 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.comboBox42 ~= nil then self.comboBox42:destroy(); self.comboBox42 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.dataLink268 ~= nil then self.dataLink268:destroy(); self.dataLink268 = nil; end;
        if self.dataLink282 ~= nil then self.dataLink282:destroy(); self.dataLink282 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.comboBox41 ~= nil then self.comboBox41:destroy(); self.comboBox41 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.dataLink129 ~= nil then self.dataLink129:destroy(); self.dataLink129 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.dataLink280 ~= nil then self.dataLink280:destroy(); self.dataLink280 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink156 ~= nil then self.dataLink156:destroy(); self.dataLink156 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.comboBox61 ~= nil then self.comboBox61:destroy(); self.comboBox61 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.comboBox43 ~= nil then self.comboBox43:destroy(); self.comboBox43 = nil; end;
        if self.dataLink140 ~= nil then self.dataLink140:destroy(); self.dataLink140 = nil; end;
        if self.dataLink219 ~= nil then self.dataLink219:destroy(); self.dataLink219 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.comboBox103 ~= nil then self.comboBox103:destroy(); self.comboBox103 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.comboBox155 ~= nil then self.comboBox155:destroy(); self.comboBox155 = nil; end;
        if self.dataLink314 ~= nil then self.dataLink314:destroy(); self.dataLink314 = nil; end;
        if self.comboBox73 ~= nil then self.comboBox73:destroy(); self.comboBox73 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.dataLink168 ~= nil then self.dataLink168:destroy(); self.dataLink168 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink197 ~= nil then self.dataLink197:destroy(); self.dataLink197 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.dataLink299 ~= nil then self.dataLink299:destroy(); self.dataLink299 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink132 ~= nil then self.dataLink132:destroy(); self.dataLink132 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.dataLink236 ~= nil then self.dataLink236:destroy(); self.dataLink236 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.dataLink221 ~= nil then self.dataLink221:destroy(); self.dataLink221 = nil; end;
        if self.dataLink305 ~= nil then self.dataLink305:destroy(); self.dataLink305 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.dataLink245 ~= nil then self.dataLink245:destroy(); self.dataLink245 = nil; end;
        if self.dataLink146 ~= nil then self.dataLink146:destroy(); self.dataLink146 = nil; end;
        if self.comboBox141 ~= nil then self.comboBox141:destroy(); self.comboBox141 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.dataLink125 ~= nil then self.dataLink125:destroy(); self.dataLink125 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.dataLink276 ~= nil then self.dataLink276:destroy(); self.dataLink276 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink224 ~= nil then self.dataLink224:destroy(); self.dataLink224 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.comboBox100 ~= nil then self.comboBox100:destroy(); self.comboBox100 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.dataLink176 ~= nil then self.dataLink176:destroy(); self.dataLink176 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.dataLink296 ~= nil then self.dataLink296:destroy(); self.dataLink296 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.comboBox70 ~= nil then self.comboBox70:destroy(); self.comboBox70 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.dataLink180 ~= nil then self.dataLink180:destroy(); self.dataLink180 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink124 ~= nil then self.dataLink124:destroy(); self.dataLink124 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.dataLink263 ~= nil then self.dataLink263:destroy(); self.dataLink263 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox55 ~= nil then self.comboBox55:destroy(); self.comboBox55 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.comboBox139 ~= nil then self.comboBox139:destroy(); self.comboBox139 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.comboBox130 ~= nil then self.comboBox130:destroy(); self.comboBox130 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.dataLink260 ~= nil then self.dataLink260:destroy(); self.dataLink260 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.dataLink216 ~= nil then self.dataLink216:destroy(); self.dataLink216 = nil; end;
        if self.dataLink306 ~= nil then self.dataLink306:destroy(); self.dataLink306 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.comboBox40 ~= nil then self.comboBox40:destroy(); self.comboBox40 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.comboBox84 ~= nil then self.comboBox84:destroy(); self.comboBox84 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink222 ~= nil then self.dataLink222:destroy(); self.dataLink222 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.comboBox62 ~= nil then self.comboBox62:destroy(); self.comboBox62 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.comboBox79 ~= nil then self.comboBox79:destroy(); self.comboBox79 = nil; end;
        if self.dataLink178 ~= nil then self.dataLink178:destroy(); self.dataLink178 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.dataLink312 ~= nil then self.dataLink312:destroy(); self.dataLink312 = nil; end;
        if self.comboBox82 ~= nil then self.comboBox82:destroy(); self.comboBox82 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSSF2 = {
    newEditor = newfrmSSF2, 
    new = newfrmSSF2, 
    name = "frmSSF2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSSF2 = _frmSSF2;
rrpg.registrarForm(_frmSSF2);

return _frmSSF2;
