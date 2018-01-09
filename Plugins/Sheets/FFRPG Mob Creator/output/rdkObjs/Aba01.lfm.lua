require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMOBFFRPG()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("MOB_CREATOR_FFRPG");
    obj:setTitle("Hitoshura - FFRPG Mob Creator");
    obj:setName("frmMOBFFRPG");
    obj:setTheme("dark");
    obj:setPadding({left=4, top=4, right=4, bottom=4});

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setLeft(20);
    obj.tabControl1:setTop(20);
    obj.tabControl1:setHeight(530);
    obj.tabControl1:setWidth(800);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("General");
    obj.tab1:setName("tab1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setLeft(10);
    obj.layout1:setTop(010);
    obj.layout1:setHeight(76);
    obj.layout1:setWidth(475);
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(000);
    obj.label1:setTop(000);
    obj.label1:setHeight(20);
    obj.label1:setWidth(60);
    obj.label1:setText("Name");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(065);
    obj.edit1:setTop(000);
    obj.edit1:setHeight(20);
    obj.edit1:setWidth(220);
    obj.edit1:setField("baseName");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(000);
    obj.label2:setTop(025);
    obj.label2:setHeight(20);
    obj.label2:setWidth(60);
    obj.label2:setText("Category");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setLeft(065);
    obj.comboBox1:setTop(025);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setWidth(220);
    obj.comboBox1:setField("baseCATEGORY");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Abnormal', 'Aerial', 'Amorph', 'Aquan', 'Arcana', 'Beast', 'Construct', 'Dragon', 'Fiend', 'Humanoid', 'Insect', 'Lizard', 'Plant', 'Undead'});
    obj.comboBox1:setValues({'Abnormal', 'Aerial', 'Amorph', 'Aquan', 'Arcana', 'Beast', 'Construct', 'Dragon', 'Fiend', 'Humanoid', 'Insect', 'Lizard', 'Plant', 'Undead'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(290);
    obj.label3:setTop(000);
    obj.label3:setHeight(20);
    obj.label3:setWidth(30);
    obj.label3:setText("Exp");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(325);
    obj.edit2:setTop(000);
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(40);
    obj.edit2:setField("ExpFinal");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(375);
    obj.label4:setTop(000);
    obj.label4:setHeight(20);
    obj.label4:setWidth(55);
    obj.label4:setText("Dividida");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(435);
    obj.edit3:setTop(000);
    obj.edit3:setHeight(20);
    obj.edit3:setWidth(40);
    obj.edit3:setField("ExpEach");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(290);
    obj.label5:setTop(025);
    obj.label5:setHeight(20);
    obj.label5:setWidth(30);
    obj.label5:setText("Gil");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setLeft(325);
    obj.edit4:setTop(025);
    obj.edit4:setHeight(20);
    obj.edit4:setWidth(40);
    obj.edit4:setField("GilFinal");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(375);
    obj.label6:setTop(025);
    obj.label6:setHeight(20);
    obj.label6:setWidth(55);
    obj.label6:setText("Dividido");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setLeft(435);
    obj.edit5:setTop(025);
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(40);
    obj.edit5:setField("GilEach");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(290);
    obj.label7:setTop(050);
    obj.label7:setHeight(20);
    obj.label7:setWidth(70);
    obj.label7:setText("Nº Players");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setLeft(375);
    obj.edit6:setTop(050);
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(40);
    obj.edit6:setField("NPlayers");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.tab1);
    obj.layout2:setLeft(10);
    obj.layout2:setTop(60);
    obj.layout2:setHeight(170);
    obj.layout2:setWidth(240);
    obj.layout2:setName("layout2");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(000);
    obj.label8:setTop(000);
    obj.label8:setHeight(20);
    obj.label8:setWidth(60);
    obj.label8:setText("Tipo");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setLeft(065);
    obj.comboBox2:setTop(000);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("baseTIPO");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Regular' , 'Notorious' , 'Boss' , 'End Boss'});
    obj.comboBox2:setValues({'Regular' , 'Notorious' , 'Boss' , 'End Boss'});
    obj.comboBox2:setName("comboBox2");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(180);
    obj.label9:setTop(000);
    obj.label9:setHeight(20);
    obj.label9:setWidth(20);
    obj.label9:setText("LV");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setLeft(205);
    obj.edit7:setTop(000);
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(30);
    obj.edit7:setField("valLV");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(000);
    obj.label10:setTop(025);
    obj.label10:setHeight(20);
    obj.label10:setWidth(60);
    obj.label10:setText("Base HP");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout2);
    obj.comboBox3:setLeft(065);
    obj.comboBox3:setTop(025);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setWidth(46);
    obj.comboBox3:setField("baseHP");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'1' , '1.5' , '2' , '4', '6', '8'});
    obj.comboBox3:setValues({'1' , '1.5' , '2' , '4', '6', '8'});
    obj.comboBox3:setName("comboBox3");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(000);
    obj.label11:setTop(050);
    obj.label11:setHeight(20);
    obj.label11:setWidth(60);
    obj.label11:setText("Base MP");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout2);
    obj.comboBox4:setLeft(065);
    obj.comboBox4:setTop(050);
    obj.comboBox4:setHeight(20);
    obj.comboBox4:setWidth(46);
    obj.comboBox4:setField("baseMP");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'0' , '0.5' , '1' , '1.5', '2', '4'});
    obj.comboBox4:setValues({'0' , '0.5' , '1' , '1.5', '2', '4'});
    obj.comboBox4:setName("comboBox4");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(120);
    obj.label12:setTop(025);
    obj.label12:setHeight(20);
    obj.label12:setWidth(60);
    obj.label12:setText("Armor");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout2);
    obj.comboBox5:setLeft(185);
    obj.comboBox5:setTop(025);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setWidth(46);
    obj.comboBox5:setField("baseArmor");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox5:setValues({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox5:setName("comboBox5");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(120);
    obj.label13:setTop(050);
    obj.label13:setHeight(20);
    obj.label13:setWidth(60);
    obj.label13:setText("M. Armor");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout2);
    obj.comboBox6:setLeft(185);
    obj.comboBox6:setTop(050);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setWidth(46);
    obj.comboBox6:setField("baseMArmor");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox6:setValues({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox6:setName("comboBox6");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.tab1);
    obj.layout3:setLeft(10);
    obj.layout3:setTop(280);
    obj.layout3:setHeight(100);
    obj.layout3:setWidth(320);
    obj.layout3:setName("layout3");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(000);
    obj.label14:setTop(000);
    obj.label14:setHeight(20);
    obj.label14:setWidth(55);
    obj.label14:setText("HP Atual");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setLeft(060);
    obj.edit8:setTop(000);
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(40);
    obj.edit8:setField("valAtHP");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(110);
    obj.label15:setTop(000);
    obj.label15:setHeight(20);
    obj.label15:setWidth(55);
    obj.label15:setText("HP Máx");
    obj.label15:setAutoSize(true);
    obj.label15:setName("label15");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setLeft(165);
    obj.edit9:setTop(000);
    obj.edit9:setHeight(20);
    obj.edit9:setWidth(40);
    obj.edit9:setField("valMaxHP");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(000);
    obj.label16:setTop(025);
    obj.label16:setHeight(20);
    obj.label16:setWidth(55);
    obj.label16:setText("MP Atual");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setLeft(060);
    obj.edit10:setTop(025);
    obj.edit10:setHeight(20);
    obj.edit10:setWidth(40);
    obj.edit10:setField("valAtMP");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(110);
    obj.label17:setTop(025);
    obj.label17:setHeight(20);
    obj.label17:setWidth(55);
    obj.label17:setText("MP Máx");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setLeft(165);
    obj.edit11:setTop(025);
    obj.edit11:setHeight(20);
    obj.edit11:setWidth(40);
    obj.edit11:setField("valMaxMP");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(000);
    obj.label18:setTop(050);
    obj.label18:setHeight(20);
    obj.label18:setWidth(55);
    obj.label18:setText("Exp Base");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setLeft(060);
    obj.edit12:setTop(050);
    obj.edit12:setHeight(20);
    obj.edit12:setWidth(40);
    obj.edit12:setField("baseEXP");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(110);
    obj.label19:setTop(050);
    obj.label19:setHeight(20);
    obj.label19:setWidth(55);
    obj.label19:setText("Exp Extra");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setLeft(165);
    obj.edit13:setTop(050);
    obj.edit13:setHeight(20);
    obj.edit13:setWidth(40);
    obj.edit13:setField("bonusEXP");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(000);
    obj.label20:setTop(075);
    obj.label20:setHeight(20);
    obj.label20:setWidth(55);
    obj.label20:setText("Gil Base");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setLeft(060);
    obj.edit14:setTop(075);
    obj.edit14:setHeight(20);
    obj.edit14:setWidth(40);
    obj.edit14:setField("baseGIL");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setLeft(110);
    obj.label21:setTop(075);
    obj.label21:setHeight(20);
    obj.label21:setWidth(55);
    obj.label21:setText("Gil Extra");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setLeft(165);
    obj.edit15:setTop(075);
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(40);
    obj.edit15:setField("bonusGIL");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.tab1);
    obj.layout4:setLeft(50);
    obj.layout4:setTop(160);
    obj.layout4:setHeight(170);
    obj.layout4:setWidth(150);
    obj.layout4:setName("layout4");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setLeft(000);
    obj.label22:setTop(000);
    obj.label22:setHeight(20);
    obj.label22:setWidth(30);
    obj.label22:setText("STR");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout4);
    obj.edit16:setLeft(035);
    obj.edit16:setTop(000);
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(30);
    obj.edit16:setField("valSTR");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout4);
    obj.label23:setLeft(000);
    obj.label23:setTop(025);
    obj.label23:setHeight(20);
    obj.label23:setWidth(30);
    obj.label23:setText("VIT");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout4);
    obj.edit17:setLeft(035);
    obj.edit17:setTop(025);
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(30);
    obj.edit17:setField("valVIT");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout4);
    obj.label24:setLeft(000);
    obj.label24:setTop(050);
    obj.label24:setHeight(20);
    obj.label24:setWidth(30);
    obj.label24:setText("AGI");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setLeft(035);
    obj.edit18:setTop(050);
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(30);
    obj.edit18:setField("valAGI");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(080);
    obj.label25:setTop(000);
    obj.label25:setHeight(20);
    obj.label25:setWidth(30);
    obj.label25:setText("SPD");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setLeft(115);
    obj.edit19:setTop(000);
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(30);
    obj.edit19:setField("valSPD");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(080);
    obj.label26:setTop(025);
    obj.label26:setHeight(20);
    obj.label26:setWidth(30);
    obj.label26:setText("MAG");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setLeft(115);
    obj.edit20:setTop(025);
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(30);
    obj.edit20:setField("valMAG");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(080);
    obj.label27:setTop(050);
    obj.label27:setHeight(20);
    obj.label27:setWidth(30);
    obj.label27:setText("SPR");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout4);
    obj.edit21:setLeft(115);
    obj.edit21:setTop(050);
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(30);
    obj.edit21:setField("valSPR");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(020);
    obj.label28:setTop(075);
    obj.label28:setHeight(20);
    obj.label28:setWidth(30);
    obj.label28:setText("Total");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(055);
    obj.label29:setTop(075);
    obj.label29:setHeight(20);
    obj.label29:setWidth(20);
    obj.label29:setField("SomaATT");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(075);
    obj.label30:setTop(075);
    obj.label30:setHeight(20);
    obj.label30:setWidth(4);
    obj.label30:setText("/");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout4);
    obj.label31:setLeft(079);
    obj.label31:setTop(075);
    obj.label31:setHeight(20);
    obj.label31:setWidth(30);
    obj.label31:setField("TeoricoATT");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.tab1);
    obj.layout5:setLeft(10);
    obj.layout5:setTop(390);
    obj.layout5:setHeight(100);
    obj.layout5:setWidth(300);
    obj.layout5:setName("layout5");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout5);
    obj.label32:setLeft(000);
    obj.label32:setTop(000);
    obj.label32:setHeight(20);
    obj.label32:setWidth(150);
    obj.label32:setText("Unique Trait");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout5);
    obj.label33:setLeft(160);
    obj.label33:setTop(000);
    obj.label33:setHeight(20);
    obj.label33:setWidth(30);
    obj.label33:setText("Exp");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setLeft(200);
    obj.label34:setTop(000);
    obj.label34:setHeight(20);
    obj.label34:setWidth(30);
    obj.label34:setText("Gil");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout5);
    obj.edit22:setLeft(000);
    obj.edit22:setTop(025);
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(150);
    obj.edit22:setField("Special1");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout5);
    obj.edit23:setLeft(160);
    obj.edit23:setTop(025);
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(30);
    obj.edit23:setField("Special1Exp");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout5);
    obj.edit24:setLeft(200);
    obj.edit24:setTop(025);
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(30);
    obj.edit24:setField("Special1Gil");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout5);
    obj.edit25:setLeft(000);
    obj.edit25:setTop(050);
    obj.edit25:setHeight(20);
    obj.edit25:setWidth(150);
    obj.edit25:setField("Special2");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout5);
    obj.edit26:setLeft(160);
    obj.edit26:setTop(050);
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(30);
    obj.edit26:setField("Special2Exp");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout5);
    obj.edit27:setLeft(200);
    obj.edit27:setTop(050);
    obj.edit27:setHeight(20);
    obj.edit27:setWidth(30);
    obj.edit27:setField("Special2Gil");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout5);
    obj.edit28:setLeft(000);
    obj.edit28:setTop(075);
    obj.edit28:setHeight(20);
    obj.edit28:setWidth(150);
    obj.edit28:setField("Special3");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout5);
    obj.edit29:setLeft(160);
    obj.edit29:setTop(075);
    obj.edit29:setHeight(20);
    obj.edit29:setWidth(30);
    obj.edit29:setField("Special3Exp");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout5);
    obj.edit30:setLeft(200);
    obj.edit30:setTop(075);
    obj.edit30:setHeight(20);
    obj.edit30:setWidth(30);
    obj.edit30:setField("Special3Gil");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.tab1);
    obj.layout6:setLeft(290);
    obj.layout6:setTop(100);
    obj.layout6:setHeight(200);
    obj.layout6:setWidth(140);
    obj.layout6:setName("layout6");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout6);
    obj.label35:setLeft(000);
    obj.label35:setTop(000);
    obj.label35:setHeight(20);
    obj.label35:setWidth(100);
    obj.label35:setText("Accuracy");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout6);
    obj.edit31:setLeft(105);
    obj.edit31:setTop(000);
    obj.edit31:setHeight(20);
    obj.edit31:setWidth(30);
    obj.edit31:setField("valACC");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout6);
    obj.label36:setLeft(000);
    obj.label36:setTop(025);
    obj.label36:setHeight(20);
    obj.label36:setWidth(100);
    obj.label36:setText("Magic Accuracy");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout6);
    obj.edit32:setLeft(105);
    obj.edit32:setTop(025);
    obj.edit32:setHeight(20);
    obj.edit32:setWidth(30);
    obj.edit32:setField("valMACC");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout6);
    obj.label37:setLeft(000);
    obj.label37:setTop(050);
    obj.label37:setHeight(20);
    obj.label37:setWidth(100);
    obj.label37:setText("Dexterity");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout6);
    obj.edit33:setLeft(105);
    obj.edit33:setTop(050);
    obj.edit33:setHeight(20);
    obj.edit33:setWidth(30);
    obj.edit33:setField("valDEX");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout6);
    obj.label38:setLeft(000);
    obj.label38:setTop(075);
    obj.label38:setHeight(20);
    obj.label38:setWidth(100);
    obj.label38:setText("Mind");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout6);
    obj.edit34:setLeft(105);
    obj.edit34:setTop(075);
    obj.edit34:setHeight(20);
    obj.edit34:setWidth(30);
    obj.edit34:setField("valMND");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout6);
    obj.label39:setLeft(000);
    obj.label39:setTop(100);
    obj.label39:setHeight(20);
    obj.label39:setWidth(100);
    obj.label39:setText("Armor");
    obj.label39:setAutoSize(true);
    obj.label39:setName("label39");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout6);
    obj.edit35:setLeft(105);
    obj.edit35:setTop(100);
    obj.edit35:setHeight(20);
    obj.edit35:setWidth(30);
    obj.edit35:setField("valARM");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout6);
    obj.label40:setLeft(000);
    obj.label40:setTop(125);
    obj.label40:setHeight(20);
    obj.label40:setWidth(100);
    obj.label40:setText("Magic Armor");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout6);
    obj.edit36:setLeft(105);
    obj.edit36:setTop(125);
    obj.edit36:setHeight(20);
    obj.edit36:setWidth(30);
    obj.edit36:setField("valMARM");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout6);
    obj.label41:setLeft(000);
    obj.label41:setTop(150);
    obj.label41:setHeight(20);
    obj.label41:setWidth(100);
    obj.label41:setText("Evasion");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout6);
    obj.edit37:setLeft(105);
    obj.edit37:setTop(150);
    obj.edit37:setHeight(20);
    obj.edit37:setWidth(30);
    obj.edit37:setField("valEVA");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(000);
    obj.label42:setTop(175);
    obj.label42:setHeight(20);
    obj.label42:setWidth(100);
    obj.label42:setText("Magic Evasion");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout6);
    obj.edit38:setLeft(105);
    obj.edit38:setTop(175);
    obj.edit38:setHeight(20);
    obj.edit38:setWidth(30);
    obj.edit38:setField("valMEVA");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.tab1);
    obj.layout7:setLeft(510);
    obj.layout7:setTop(40);
    obj.layout7:setHeight(300);
    obj.layout7:setWidth(300);
    obj.layout7:setName("layout7");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout7);
    obj.button1:setLeft(003);
    obj.button1:setTop(00);
    obj.button1:setHeight(20);
    obj.button1:setWidth(80);
    obj.button1:setText("Scan");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout7);
    obj.button2:setLeft(087);
    obj.button2:setTop(00);
    obj.button2:setHeight(20);
    obj.button2:setWidth(80);
    obj.button2:setText("Sensor");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout7);
    obj.button3:setLeft(172);
    obj.button3:setTop(00);
    obj.button3:setHeight(20);
    obj.button3:setWidth(80);
    obj.button3:setText("Peep");
    obj.button3:setName("button3");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout7);
    obj.rectangle1:setLeft(000);
    obj.rectangle1:setTop(25);
    obj.rectangle1:setWidth(256);
    obj.rectangle1:setHeight(256);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(5);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout7);
    obj.image1:setLeft(000);
    obj.image1:setTop(25);
    obj.image1:setWidth(256);
    obj.image1:setHeight(256);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.tab1);
    obj.layout8:setLeft(650);
    obj.layout8:setTop(010);
    obj.layout8:setHeight(76);
    obj.layout8:setWidth(475);
    obj.layout8:setName("layout8");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout8);
    obj.label43:setLeft(000);
    obj.label43:setTop(000);
    obj.label43:setHeight(20);
    obj.label43:setWidth(10);
    obj.label43:setText("E");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout8);
    obj.edit39:setLeft(015);
    obj.edit39:setTop(000);
    obj.edit39:setHeight(20);
    obj.edit39:setWidth(40);
    obj.edit39:setField("ExpFinal");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout8);
    obj.label44:setLeft(070);
    obj.label44:setTop(000);
    obj.label44:setHeight(20);
    obj.label44:setWidth(10);
    obj.label44:setText("G");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout8);
    obj.edit40:setLeft(95);
    obj.edit40:setTop(000);
    obj.edit40:setHeight(20);
    obj.edit40:setWidth(40);
    obj.edit40:setField("GilFinal");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.tab1);
    obj.layout9:setLeft(300);
    obj.layout9:setTop(350);
    obj.layout9:setHeight(120);
    obj.layout9:setWidth(500);
    obj.layout9:setName("layout9");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout9);
    obj.checkBox1:setLeft(000);
    obj.checkBox1:setTop(000);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setWidth(100);
    obj.checkBox1:setText("Agility Up");
    obj.checkBox1:setField("statAGIUP");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout9);
    obj.checkBox2:setLeft(000);
    obj.checkBox2:setTop(025);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setWidth(100);
    obj.checkBox2:setText("Agility Down");
    obj.checkBox2:setField("statAGIDOWN");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout9);
    obj.checkBox3:setLeft(000);
    obj.checkBox3:setTop(050);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setWidth(100);
    obj.checkBox3:setText("Agility Break");
    obj.checkBox3:setField("statAGIBREAK");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout9);
    obj.checkBox4:setLeft(000);
    obj.checkBox4:setTop(075);
    obj.checkBox4:setHeight(20);
    obj.checkBox4:setWidth(100);
    obj.checkBox4:setText("Blink");
    obj.checkBox4:setField("statBLINK");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout9);
    obj.checkBox5:setLeft(105);
    obj.checkBox5:setTop(000);
    obj.checkBox5:setHeight(20);
    obj.checkBox5:setWidth(100);
    obj.checkBox5:setText("Spirit Up");
    obj.checkBox5:setField("statSPIUP");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout9);
    obj.checkBox6:setLeft(105);
    obj.checkBox6:setTop(025);
    obj.checkBox6:setHeight(20);
    obj.checkBox6:setWidth(100);
    obj.checkBox6:setText("Spirit Down");
    obj.checkBox6:setField("statSPIDOWN");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout9);
    obj.checkBox7:setLeft(105);
    obj.checkBox7:setTop(050);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setWidth(100);
    obj.checkBox7:setText("Spirit Break");
    obj.checkBox7:setField("statSPIBREAK");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout9);
    obj.checkBox8:setLeft(105);
    obj.checkBox8:setTop(075);
    obj.checkBox8:setHeight(20);
    obj.checkBox8:setWidth(100);
    obj.checkBox8:setText("Immobilize");
    obj.checkBox8:setField("statIMMOBILIZE");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout9);
    obj.checkBox9:setLeft(210);
    obj.checkBox9:setTop(000);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setWidth(100);
    obj.checkBox9:setText("Armor Up");
    obj.checkBox9:setField("statARMUP");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout9);
    obj.checkBox10:setLeft(210);
    obj.checkBox10:setTop(025);
    obj.checkBox10:setHeight(20);
    obj.checkBox10:setWidth(100);
    obj.checkBox10:setText("Armor Down");
    obj.checkBox10:setField("statARMDOWN");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout9);
    obj.checkBox11:setLeft(210);
    obj.checkBox11:setTop(050);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setWidth(100);
    obj.checkBox11:setText("Armor Break");
    obj.checkBox11:setField("statARMBREAK");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout9);
    obj.checkBox12:setLeft(210);
    obj.checkBox12:setTop(075);
    obj.checkBox12:setHeight(20);
    obj.checkBox12:setWidth(100);
    obj.checkBox12:setText("Mini");
    obj.checkBox12:setField("statMINI");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout9);
    obj.checkBox13:setLeft(315);
    obj.checkBox13:setTop(000);
    obj.checkBox13:setHeight(20);
    obj.checkBox13:setWidth(100);
    obj.checkBox13:setText("Mental Up");
    obj.checkBox13:setField("statMENUP");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout9);
    obj.checkBox14:setLeft(315);
    obj.checkBox14:setTop(025);
    obj.checkBox14:setHeight(20);
    obj.checkBox14:setWidth(100);
    obj.checkBox14:setText("Mental Down");
    obj.checkBox14:setField("statMENDOWN");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout9);
    obj.checkBox15:setLeft(315);
    obj.checkBox15:setTop(050);
    obj.checkBox15:setHeight(20);
    obj.checkBox15:setWidth(100);
    obj.checkBox15:setText("Mental Break");
    obj.checkBox15:setField("statMENBREAK");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout9);
    obj.checkBox16:setLeft(315);
    obj.checkBox16:setTop(075);
    obj.checkBox16:setHeight(20);
    obj.checkBox16:setWidth(100);
    obj.checkBox16:setText("Toad");
    obj.checkBox16:setField("statTOAD");
    obj.checkBox16:setName("checkBox16");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Attacks");
    obj.tab2:setName("tab2");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.tab2);
    obj.layout10:setLeft(10);
    obj.layout10:setTop(10);
    obj.layout10:setHeight(500);
    obj.layout10:setWidth(780);
    obj.layout10:setName("layout10");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout10);
    obj.label45:setLeft(000);
    obj.label45:setTop(000);
    obj.label45:setHeight(20);
    obj.label45:setWidth(60);
    obj.label45:setText("Attack #1");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout10);
    obj.edit41:setLeft(80);
    obj.edit41:setTop(000);
    obj.edit41:setHeight(20);
    obj.edit41:setWidth(150);
    obj.edit41:setField("Atk1P1");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout10);
    obj.edit42:setLeft(240);
    obj.edit42:setTop(000);
    obj.edit42:setHeight(20);
    obj.edit42:setWidth(150);
    obj.edit42:setField("Atk1P2");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout10);
    obj.edit43:setLeft(400);
    obj.edit43:setTop(000);
    obj.edit43:setHeight(20);
    obj.edit43:setWidth(150);
    obj.edit43:setField("Atk1P3");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout10);
    obj.label46:setLeft(080);
    obj.label46:setTop(025);
    obj.label46:setHeight(20);
    obj.label46:setWidth(30);
    obj.label46:setText("Exp");
    obj.label46:setAutoSize(true);
    obj.label46:setName("label46");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout10);
    obj.edit44:setLeft(115);
    obj.edit44:setTop(025);
    obj.edit44:setHeight(20);
    obj.edit44:setWidth(30);
    obj.edit44:setField("Atk1P1Exp");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout10);
    obj.label47:setLeft(160);
    obj.label47:setTop(025);
    obj.label47:setHeight(20);
    obj.label47:setWidth(30);
    obj.label47:setText("Gil");
    obj.label47:setAutoSize(true);
    obj.label47:setName("label47");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout10);
    obj.edit45:setLeft(180);
    obj.edit45:setTop(025);
    obj.edit45:setHeight(20);
    obj.edit45:setWidth(30);
    obj.edit45:setField("Atk1P1Gil");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout10);
    obj.label48:setLeft(240);
    obj.label48:setTop(025);
    obj.label48:setHeight(20);
    obj.label48:setWidth(30);
    obj.label48:setText("Exp");
    obj.label48:setAutoSize(true);
    obj.label48:setName("label48");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout10);
    obj.edit46:setLeft(275);
    obj.edit46:setTop(025);
    obj.edit46:setHeight(20);
    obj.edit46:setWidth(30);
    obj.edit46:setField("Atk1P2Exp");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout10);
    obj.label49:setLeft(320);
    obj.label49:setTop(025);
    obj.label49:setHeight(20);
    obj.label49:setWidth(30);
    obj.label49:setText("Gil");
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout10);
    obj.edit47:setLeft(345);
    obj.edit47:setTop(025);
    obj.edit47:setHeight(20);
    obj.edit47:setWidth(30);
    obj.edit47:setField("Atk1P2Gil");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout10);
    obj.label50:setLeft(400);
    obj.label50:setTop(025);
    obj.label50:setHeight(20);
    obj.label50:setWidth(30);
    obj.label50:setText("Exp");
    obj.label50:setAutoSize(true);
    obj.label50:setName("label50");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout10);
    obj.edit48:setLeft(435);
    obj.edit48:setTop(025);
    obj.edit48:setHeight(20);
    obj.edit48:setWidth(30);
    obj.edit48:setField("Atk1P3Exp");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout10);
    obj.label51:setLeft(480);
    obj.label51:setTop(025);
    obj.label51:setHeight(20);
    obj.label51:setWidth(30);
    obj.label51:setText("Gil");
    obj.label51:setAutoSize(true);
    obj.label51:setName("label51");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout10);
    obj.edit49:setLeft(505);
    obj.edit49:setTop(025);
    obj.edit49:setHeight(20);
    obj.edit49:setWidth(30);
    obj.edit49:setField("Atk1P3Gil");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout10);
    obj.edit50:setLeft(080);
    obj.edit50:setTop(050);
    obj.edit50:setHeight(20);
    obj.edit50:setWidth(150);
    obj.edit50:setField("Atk1P4");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout10);
    obj.edit51:setLeft(240);
    obj.edit51:setTop(050);
    obj.edit51:setHeight(20);
    obj.edit51:setWidth(150);
    obj.edit51:setField("Atk1P5");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout10);
    obj.edit52:setLeft(400);
    obj.edit52:setTop(050);
    obj.edit52:setHeight(20);
    obj.edit52:setWidth(150);
    obj.edit52:setField("Atk1P6");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout10);
    obj.label52:setLeft(080);
    obj.label52:setTop(075);
    obj.label52:setHeight(20);
    obj.label52:setWidth(30);
    obj.label52:setText("Exp");
    obj.label52:setAutoSize(true);
    obj.label52:setName("label52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout10);
    obj.edit53:setLeft(115);
    obj.edit53:setTop(075);
    obj.edit53:setHeight(20);
    obj.edit53:setWidth(30);
    obj.edit53:setField("Atk1P4Exp");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout10);
    obj.label53:setLeft(160);
    obj.label53:setTop(075);
    obj.label53:setHeight(20);
    obj.label53:setWidth(30);
    obj.label53:setText("Gil");
    obj.label53:setAutoSize(true);
    obj.label53:setName("label53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout10);
    obj.edit54:setLeft(180);
    obj.edit54:setTop(075);
    obj.edit54:setHeight(20);
    obj.edit54:setWidth(30);
    obj.edit54:setField("Atk1P4Gil");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout10);
    obj.label54:setLeft(240);
    obj.label54:setTop(075);
    obj.label54:setHeight(20);
    obj.label54:setWidth(30);
    obj.label54:setText("Exp");
    obj.label54:setAutoSize(true);
    obj.label54:setName("label54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout10);
    obj.edit55:setLeft(275);
    obj.edit55:setTop(075);
    obj.edit55:setHeight(20);
    obj.edit55:setWidth(30);
    obj.edit55:setField("Atk1P5Exp");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout10);
    obj.label55:setLeft(320);
    obj.label55:setTop(075);
    obj.label55:setHeight(20);
    obj.label55:setWidth(30);
    obj.label55:setText("Gil");
    obj.label55:setAutoSize(true);
    obj.label55:setName("label55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout10);
    obj.edit56:setLeft(345);
    obj.edit56:setTop(075);
    obj.edit56:setHeight(20);
    obj.edit56:setWidth(30);
    obj.edit56:setField("Atk1P5Gil");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout10);
    obj.label56:setLeft(400);
    obj.label56:setTop(075);
    obj.label56:setHeight(20);
    obj.label56:setWidth(30);
    obj.label56:setText("Exp");
    obj.label56:setAutoSize(true);
    obj.label56:setName("label56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout10);
    obj.edit57:setLeft(435);
    obj.edit57:setTop(075);
    obj.edit57:setHeight(20);
    obj.edit57:setWidth(30);
    obj.edit57:setField("Atk1P6Exp");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout10);
    obj.label57:setLeft(480);
    obj.label57:setTop(075);
    obj.label57:setHeight(20);
    obj.label57:setWidth(30);
    obj.label57:setText("Gil");
    obj.label57:setAutoSize(true);
    obj.label57:setName("label57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout10);
    obj.edit58:setLeft(505);
    obj.edit58:setTop(075);
    obj.edit58:setHeight(20);
    obj.edit58:setWidth(30);
    obj.edit58:setField("Atk1P6Gil");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout10);
    obj.label58:setLeft(600);
    obj.label58:setTop(025);
    obj.label58:setHeight(20);
    obj.label58:setWidth(80);
    obj.label58:setText("Exp Final");
    obj.label58:setAutoSize(true);
    obj.label58:setName("label58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout10);
    obj.edit59:setLeft(685);
    obj.edit59:setTop(025);
    obj.edit59:setHeight(20);
    obj.edit59:setWidth(30);
    obj.edit59:setField("Atk1ExpF");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout10);
    obj.label59:setLeft(600);
    obj.label59:setTop(050);
    obj.label59:setHeight(20);
    obj.label59:setWidth(80);
    obj.label59:setText("Gil Final");
    obj.label59:setAutoSize(true);
    obj.label59:setName("label59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout10);
    obj.edit60:setLeft(685);
    obj.edit60:setTop(050);
    obj.edit60:setHeight(20);
    obj.edit60:setWidth(30);
    obj.edit60:setField("Atk1GilF");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.tab2);
    obj.layout11:setLeft(10);
    obj.layout11:setTop(120);
    obj.layout11:setHeight(500);
    obj.layout11:setWidth(780);
    obj.layout11:setName("layout11");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout11);
    obj.label60:setLeft(000);
    obj.label60:setTop(000);
    obj.label60:setHeight(20);
    obj.label60:setWidth(60);
    obj.label60:setText("Attack #2");
    obj.label60:setAutoSize(true);
    obj.label60:setName("label60");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout11);
    obj.edit61:setLeft(80);
    obj.edit61:setTop(000);
    obj.edit61:setHeight(20);
    obj.edit61:setWidth(150);
    obj.edit61:setField("Atk2P1");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout11);
    obj.edit62:setLeft(240);
    obj.edit62:setTop(000);
    obj.edit62:setHeight(20);
    obj.edit62:setWidth(150);
    obj.edit62:setField("Atk2P2");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout11);
    obj.edit63:setLeft(400);
    obj.edit63:setTop(000);
    obj.edit63:setHeight(20);
    obj.edit63:setWidth(150);
    obj.edit63:setField("Atk2P3");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout11);
    obj.label61:setLeft(080);
    obj.label61:setTop(025);
    obj.label61:setHeight(20);
    obj.label61:setWidth(30);
    obj.label61:setText("Exp");
    obj.label61:setAutoSize(true);
    obj.label61:setName("label61");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout11);
    obj.edit64:setLeft(115);
    obj.edit64:setTop(025);
    obj.edit64:setHeight(20);
    obj.edit64:setWidth(30);
    obj.edit64:setField("Atk2P1Exp");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout11);
    obj.label62:setLeft(160);
    obj.label62:setTop(025);
    obj.label62:setHeight(20);
    obj.label62:setWidth(30);
    obj.label62:setText("Gil");
    obj.label62:setAutoSize(true);
    obj.label62:setName("label62");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout11);
    obj.edit65:setLeft(180);
    obj.edit65:setTop(025);
    obj.edit65:setHeight(20);
    obj.edit65:setWidth(30);
    obj.edit65:setField("Atk2P1Gil");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout11);
    obj.label63:setLeft(240);
    obj.label63:setTop(025);
    obj.label63:setHeight(20);
    obj.label63:setWidth(30);
    obj.label63:setText("Exp");
    obj.label63:setAutoSize(true);
    obj.label63:setName("label63");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout11);
    obj.edit66:setLeft(275);
    obj.edit66:setTop(025);
    obj.edit66:setHeight(20);
    obj.edit66:setWidth(30);
    obj.edit66:setField("Atk2P2Exp");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout11);
    obj.label64:setLeft(320);
    obj.label64:setTop(025);
    obj.label64:setHeight(20);
    obj.label64:setWidth(30);
    obj.label64:setText("Gil");
    obj.label64:setAutoSize(true);
    obj.label64:setName("label64");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout11);
    obj.edit67:setLeft(345);
    obj.edit67:setTop(025);
    obj.edit67:setHeight(20);
    obj.edit67:setWidth(30);
    obj.edit67:setField("Atk2P2Gil");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout11);
    obj.label65:setLeft(400);
    obj.label65:setTop(025);
    obj.label65:setHeight(20);
    obj.label65:setWidth(30);
    obj.label65:setText("Exp");
    obj.label65:setAutoSize(true);
    obj.label65:setName("label65");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout11);
    obj.edit68:setLeft(435);
    obj.edit68:setTop(025);
    obj.edit68:setHeight(20);
    obj.edit68:setWidth(30);
    obj.edit68:setField("Atk2P3Exp");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout11);
    obj.label66:setLeft(480);
    obj.label66:setTop(025);
    obj.label66:setHeight(20);
    obj.label66:setWidth(30);
    obj.label66:setText("Gil");
    obj.label66:setAutoSize(true);
    obj.label66:setName("label66");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout11);
    obj.edit69:setLeft(505);
    obj.edit69:setTop(025);
    obj.edit69:setHeight(20);
    obj.edit69:setWidth(30);
    obj.edit69:setField("Atk2P3Gil");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout11);
    obj.edit70:setLeft(080);
    obj.edit70:setTop(050);
    obj.edit70:setHeight(20);
    obj.edit70:setWidth(150);
    obj.edit70:setField("Atk2P4");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout11);
    obj.edit71:setLeft(240);
    obj.edit71:setTop(050);
    obj.edit71:setHeight(20);
    obj.edit71:setWidth(150);
    obj.edit71:setField("Atk2P5");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout11);
    obj.edit72:setLeft(400);
    obj.edit72:setTop(050);
    obj.edit72:setHeight(20);
    obj.edit72:setWidth(150);
    obj.edit72:setField("Atk2P6");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout11);
    obj.label67:setLeft(080);
    obj.label67:setTop(075);
    obj.label67:setHeight(20);
    obj.label67:setWidth(30);
    obj.label67:setText("Exp");
    obj.label67:setAutoSize(true);
    obj.label67:setName("label67");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout11);
    obj.edit73:setLeft(115);
    obj.edit73:setTop(075);
    obj.edit73:setHeight(20);
    obj.edit73:setWidth(30);
    obj.edit73:setField("Atk2P4Exp");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout11);
    obj.label68:setLeft(160);
    obj.label68:setTop(075);
    obj.label68:setHeight(20);
    obj.label68:setWidth(30);
    obj.label68:setText("Gil");
    obj.label68:setAutoSize(true);
    obj.label68:setName("label68");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout11);
    obj.edit74:setLeft(180);
    obj.edit74:setTop(075);
    obj.edit74:setHeight(20);
    obj.edit74:setWidth(30);
    obj.edit74:setField("Atk2P4Gil");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout11);
    obj.label69:setLeft(240);
    obj.label69:setTop(075);
    obj.label69:setHeight(20);
    obj.label69:setWidth(30);
    obj.label69:setText("Exp");
    obj.label69:setAutoSize(true);
    obj.label69:setName("label69");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout11);
    obj.edit75:setLeft(275);
    obj.edit75:setTop(075);
    obj.edit75:setHeight(20);
    obj.edit75:setWidth(30);
    obj.edit75:setField("Atk2P5Exp");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout11);
    obj.label70:setLeft(320);
    obj.label70:setTop(075);
    obj.label70:setHeight(20);
    obj.label70:setWidth(30);
    obj.label70:setText("Gil");
    obj.label70:setAutoSize(true);
    obj.label70:setName("label70");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout11);
    obj.edit76:setLeft(345);
    obj.edit76:setTop(075);
    obj.edit76:setHeight(20);
    obj.edit76:setWidth(30);
    obj.edit76:setField("Atk2P5Gil");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout11);
    obj.label71:setLeft(400);
    obj.label71:setTop(075);
    obj.label71:setHeight(20);
    obj.label71:setWidth(30);
    obj.label71:setText("Exp");
    obj.label71:setAutoSize(true);
    obj.label71:setName("label71");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout11);
    obj.edit77:setLeft(435);
    obj.edit77:setTop(075);
    obj.edit77:setHeight(20);
    obj.edit77:setWidth(30);
    obj.edit77:setField("Atk2P6Exp");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout11);
    obj.label72:setLeft(480);
    obj.label72:setTop(075);
    obj.label72:setHeight(20);
    obj.label72:setWidth(30);
    obj.label72:setText("Gil");
    obj.label72:setAutoSize(true);
    obj.label72:setName("label72");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout11);
    obj.edit78:setLeft(505);
    obj.edit78:setTop(075);
    obj.edit78:setHeight(20);
    obj.edit78:setWidth(30);
    obj.edit78:setField("Atk2P6Gil");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout11);
    obj.label73:setLeft(600);
    obj.label73:setTop(025);
    obj.label73:setHeight(20);
    obj.label73:setWidth(80);
    obj.label73:setText("Exp Final");
    obj.label73:setAutoSize(true);
    obj.label73:setName("label73");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout11);
    obj.edit79:setLeft(685);
    obj.edit79:setTop(025);
    obj.edit79:setHeight(20);
    obj.edit79:setWidth(30);
    obj.edit79:setField("Atk2ExpF");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout11);
    obj.label74:setLeft(600);
    obj.label74:setTop(050);
    obj.label74:setHeight(20);
    obj.label74:setWidth(80);
    obj.label74:setText("Gil Final");
    obj.label74:setAutoSize(true);
    obj.label74:setName("label74");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout11);
    obj.edit80:setLeft(685);
    obj.edit80:setTop(050);
    obj.edit80:setHeight(20);
    obj.edit80:setWidth(30);
    obj.edit80:setField("Atk2GilF");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.tab2);
    obj.layout12:setLeft(10);
    obj.layout12:setTop(240);
    obj.layout12:setHeight(500);
    obj.layout12:setWidth(780);
    obj.layout12:setName("layout12");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout12);
    obj.label75:setLeft(000);
    obj.label75:setTop(000);
    obj.label75:setHeight(20);
    obj.label75:setWidth(60);
    obj.label75:setText("Attack #3");
    obj.label75:setAutoSize(true);
    obj.label75:setName("label75");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout12);
    obj.edit81:setLeft(80);
    obj.edit81:setTop(000);
    obj.edit81:setHeight(20);
    obj.edit81:setWidth(150);
    obj.edit81:setField("Atk3P1");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout12);
    obj.edit82:setLeft(240);
    obj.edit82:setTop(000);
    obj.edit82:setHeight(20);
    obj.edit82:setWidth(150);
    obj.edit82:setField("Atk3P2");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout12);
    obj.edit83:setLeft(400);
    obj.edit83:setTop(000);
    obj.edit83:setHeight(20);
    obj.edit83:setWidth(150);
    obj.edit83:setField("Atk3P3");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout12);
    obj.label76:setLeft(080);
    obj.label76:setTop(025);
    obj.label76:setHeight(20);
    obj.label76:setWidth(30);
    obj.label76:setText("Exp");
    obj.label76:setAutoSize(true);
    obj.label76:setName("label76");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout12);
    obj.edit84:setLeft(115);
    obj.edit84:setTop(025);
    obj.edit84:setHeight(20);
    obj.edit84:setWidth(30);
    obj.edit84:setField("Atk3P1Exp");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout12);
    obj.label77:setLeft(160);
    obj.label77:setTop(025);
    obj.label77:setHeight(20);
    obj.label77:setWidth(30);
    obj.label77:setText("Gil");
    obj.label77:setAutoSize(true);
    obj.label77:setName("label77");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout12);
    obj.edit85:setLeft(180);
    obj.edit85:setTop(025);
    obj.edit85:setHeight(20);
    obj.edit85:setWidth(30);
    obj.edit85:setField("Atk3P1Gil");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout12);
    obj.label78:setLeft(240);
    obj.label78:setTop(025);
    obj.label78:setHeight(20);
    obj.label78:setWidth(30);
    obj.label78:setText("Exp");
    obj.label78:setAutoSize(true);
    obj.label78:setName("label78");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout12);
    obj.edit86:setLeft(275);
    obj.edit86:setTop(025);
    obj.edit86:setHeight(20);
    obj.edit86:setWidth(30);
    obj.edit86:setField("Atk3P2Exp");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout12);
    obj.label79:setLeft(320);
    obj.label79:setTop(025);
    obj.label79:setHeight(20);
    obj.label79:setWidth(30);
    obj.label79:setText("Gil");
    obj.label79:setAutoSize(true);
    obj.label79:setName("label79");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout12);
    obj.edit87:setLeft(345);
    obj.edit87:setTop(025);
    obj.edit87:setHeight(20);
    obj.edit87:setWidth(30);
    obj.edit87:setField("Atk3P2Gil");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout12);
    obj.label80:setLeft(400);
    obj.label80:setTop(025);
    obj.label80:setHeight(20);
    obj.label80:setWidth(30);
    obj.label80:setText("Exp");
    obj.label80:setAutoSize(true);
    obj.label80:setName("label80");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout12);
    obj.edit88:setLeft(435);
    obj.edit88:setTop(025);
    obj.edit88:setHeight(20);
    obj.edit88:setWidth(30);
    obj.edit88:setField("Atk3P3Exp");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout12);
    obj.label81:setLeft(480);
    obj.label81:setTop(025);
    obj.label81:setHeight(20);
    obj.label81:setWidth(30);
    obj.label81:setText("Gil");
    obj.label81:setAutoSize(true);
    obj.label81:setName("label81");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout12);
    obj.edit89:setLeft(505);
    obj.edit89:setTop(025);
    obj.edit89:setHeight(20);
    obj.edit89:setWidth(30);
    obj.edit89:setField("Atk3P3Gil");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout12);
    obj.edit90:setLeft(080);
    obj.edit90:setTop(050);
    obj.edit90:setHeight(20);
    obj.edit90:setWidth(150);
    obj.edit90:setField("Atk3P4");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout12);
    obj.edit91:setLeft(240);
    obj.edit91:setTop(050);
    obj.edit91:setHeight(20);
    obj.edit91:setWidth(150);
    obj.edit91:setField("Atk3P5");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout12);
    obj.edit92:setLeft(400);
    obj.edit92:setTop(050);
    obj.edit92:setHeight(20);
    obj.edit92:setWidth(150);
    obj.edit92:setField("Atk3P6");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout12);
    obj.label82:setLeft(080);
    obj.label82:setTop(075);
    obj.label82:setHeight(20);
    obj.label82:setWidth(30);
    obj.label82:setText("Exp");
    obj.label82:setAutoSize(true);
    obj.label82:setName("label82");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout12);
    obj.edit93:setLeft(115);
    obj.edit93:setTop(075);
    obj.edit93:setHeight(20);
    obj.edit93:setWidth(30);
    obj.edit93:setField("Atk3P4Exp");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout12);
    obj.label83:setLeft(160);
    obj.label83:setTop(075);
    obj.label83:setHeight(20);
    obj.label83:setWidth(30);
    obj.label83:setText("Gil");
    obj.label83:setAutoSize(true);
    obj.label83:setName("label83");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout12);
    obj.edit94:setLeft(180);
    obj.edit94:setTop(075);
    obj.edit94:setHeight(20);
    obj.edit94:setWidth(30);
    obj.edit94:setField("Atk3P4Gil");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout12);
    obj.label84:setLeft(240);
    obj.label84:setTop(075);
    obj.label84:setHeight(20);
    obj.label84:setWidth(30);
    obj.label84:setText("Exp");
    obj.label84:setAutoSize(true);
    obj.label84:setName("label84");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout12);
    obj.edit95:setLeft(275);
    obj.edit95:setTop(075);
    obj.edit95:setHeight(20);
    obj.edit95:setWidth(30);
    obj.edit95:setField("Atk3P5Exp");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout12);
    obj.label85:setLeft(320);
    obj.label85:setTop(075);
    obj.label85:setHeight(20);
    obj.label85:setWidth(30);
    obj.label85:setText("Gil");
    obj.label85:setAutoSize(true);
    obj.label85:setName("label85");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout12);
    obj.edit96:setLeft(345);
    obj.edit96:setTop(075);
    obj.edit96:setHeight(20);
    obj.edit96:setWidth(30);
    obj.edit96:setField("Atk3P5Gil");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout12);
    obj.label86:setLeft(400);
    obj.label86:setTop(075);
    obj.label86:setHeight(20);
    obj.label86:setWidth(30);
    obj.label86:setText("Exp");
    obj.label86:setAutoSize(true);
    obj.label86:setName("label86");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout12);
    obj.edit97:setLeft(435);
    obj.edit97:setTop(075);
    obj.edit97:setHeight(20);
    obj.edit97:setWidth(30);
    obj.edit97:setField("Atk3P6Exp");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout12);
    obj.label87:setLeft(480);
    obj.label87:setTop(075);
    obj.label87:setHeight(20);
    obj.label87:setWidth(30);
    obj.label87:setText("Gil");
    obj.label87:setAutoSize(true);
    obj.label87:setName("label87");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout12);
    obj.edit98:setLeft(505);
    obj.edit98:setTop(075);
    obj.edit98:setHeight(20);
    obj.edit98:setWidth(30);
    obj.edit98:setField("Atk3P6Gil");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout12);
    obj.label88:setLeft(600);
    obj.label88:setTop(025);
    obj.label88:setHeight(20);
    obj.label88:setWidth(80);
    obj.label88:setText("Exp Final");
    obj.label88:setAutoSize(true);
    obj.label88:setName("label88");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout12);
    obj.edit99:setLeft(685);
    obj.edit99:setTop(025);
    obj.edit99:setHeight(20);
    obj.edit99:setWidth(30);
    obj.edit99:setField("Atk3ExpF");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout12);
    obj.label89:setLeft(600);
    obj.label89:setTop(050);
    obj.label89:setHeight(20);
    obj.label89:setWidth(80);
    obj.label89:setText("Gil Final");
    obj.label89:setAutoSize(true);
    obj.label89:setName("label89");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout12);
    obj.edit100:setLeft(685);
    obj.edit100:setTop(050);
    obj.edit100:setHeight(20);
    obj.edit100:setWidth(30);
    obj.edit100:setField("Atk3GilF");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.tab2);
    obj.layout13:setLeft(10);
    obj.layout13:setTop(360);
    obj.layout13:setHeight(500);
    obj.layout13:setWidth(780);
    obj.layout13:setName("layout13");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout13);
    obj.label90:setLeft(000);
    obj.label90:setTop(000);
    obj.label90:setHeight(20);
    obj.label90:setWidth(60);
    obj.label90:setText("Attack #4");
    obj.label90:setAutoSize(true);
    obj.label90:setName("label90");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout13);
    obj.edit101:setLeft(80);
    obj.edit101:setTop(000);
    obj.edit101:setHeight(20);
    obj.edit101:setWidth(150);
    obj.edit101:setField("Atk4P1");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout13);
    obj.edit102:setLeft(240);
    obj.edit102:setTop(000);
    obj.edit102:setHeight(20);
    obj.edit102:setWidth(150);
    obj.edit102:setField("Atk4P2");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout13);
    obj.edit103:setLeft(400);
    obj.edit103:setTop(000);
    obj.edit103:setHeight(20);
    obj.edit103:setWidth(150);
    obj.edit103:setField("Atk4P3");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout13);
    obj.label91:setLeft(080);
    obj.label91:setTop(025);
    obj.label91:setHeight(20);
    obj.label91:setWidth(30);
    obj.label91:setText("Exp");
    obj.label91:setAutoSize(true);
    obj.label91:setName("label91");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout13);
    obj.edit104:setLeft(115);
    obj.edit104:setTop(025);
    obj.edit104:setHeight(20);
    obj.edit104:setWidth(30);
    obj.edit104:setField("Atk4P1Exp");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout13);
    obj.label92:setLeft(160);
    obj.label92:setTop(025);
    obj.label92:setHeight(20);
    obj.label92:setWidth(30);
    obj.label92:setText("Gil");
    obj.label92:setAutoSize(true);
    obj.label92:setName("label92");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout13);
    obj.edit105:setLeft(180);
    obj.edit105:setTop(025);
    obj.edit105:setHeight(20);
    obj.edit105:setWidth(30);
    obj.edit105:setField("Atk4P1Gil");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout13);
    obj.label93:setLeft(240);
    obj.label93:setTop(025);
    obj.label93:setHeight(20);
    obj.label93:setWidth(30);
    obj.label93:setText("Exp");
    obj.label93:setAutoSize(true);
    obj.label93:setName("label93");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout13);
    obj.edit106:setLeft(275);
    obj.edit106:setTop(025);
    obj.edit106:setHeight(20);
    obj.edit106:setWidth(30);
    obj.edit106:setField("Atk4P2Exp");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout13);
    obj.label94:setLeft(320);
    obj.label94:setTop(025);
    obj.label94:setHeight(20);
    obj.label94:setWidth(30);
    obj.label94:setText("Gil");
    obj.label94:setAutoSize(true);
    obj.label94:setName("label94");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout13);
    obj.edit107:setLeft(345);
    obj.edit107:setTop(025);
    obj.edit107:setHeight(20);
    obj.edit107:setWidth(30);
    obj.edit107:setField("Atk4P2Gil");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout13);
    obj.label95:setLeft(400);
    obj.label95:setTop(025);
    obj.label95:setHeight(20);
    obj.label95:setWidth(30);
    obj.label95:setText("Exp");
    obj.label95:setAutoSize(true);
    obj.label95:setName("label95");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout13);
    obj.edit108:setLeft(435);
    obj.edit108:setTop(025);
    obj.edit108:setHeight(20);
    obj.edit108:setWidth(30);
    obj.edit108:setField("Atk4P3Exp");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout13);
    obj.label96:setLeft(480);
    obj.label96:setTop(025);
    obj.label96:setHeight(20);
    obj.label96:setWidth(30);
    obj.label96:setText("Gil");
    obj.label96:setAutoSize(true);
    obj.label96:setName("label96");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout13);
    obj.edit109:setLeft(505);
    obj.edit109:setTop(025);
    obj.edit109:setHeight(20);
    obj.edit109:setWidth(30);
    obj.edit109:setField("Atk4P3Gil");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout13);
    obj.edit110:setLeft(080);
    obj.edit110:setTop(050);
    obj.edit110:setHeight(20);
    obj.edit110:setWidth(150);
    obj.edit110:setField("Atk4P4");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout13);
    obj.edit111:setLeft(240);
    obj.edit111:setTop(050);
    obj.edit111:setHeight(20);
    obj.edit111:setWidth(150);
    obj.edit111:setField("Atk4P5");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setName("edit111");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout13);
    obj.edit112:setLeft(400);
    obj.edit112:setTop(050);
    obj.edit112:setHeight(20);
    obj.edit112:setWidth(150);
    obj.edit112:setField("Atk4P6");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setName("edit112");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout13);
    obj.label97:setLeft(080);
    obj.label97:setTop(075);
    obj.label97:setHeight(20);
    obj.label97:setWidth(30);
    obj.label97:setText("Exp");
    obj.label97:setAutoSize(true);
    obj.label97:setName("label97");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout13);
    obj.edit113:setLeft(115);
    obj.edit113:setTop(075);
    obj.edit113:setHeight(20);
    obj.edit113:setWidth(30);
    obj.edit113:setField("Atk4P4Exp");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout13);
    obj.label98:setLeft(160);
    obj.label98:setTop(075);
    obj.label98:setHeight(20);
    obj.label98:setWidth(30);
    obj.label98:setText("Gil");
    obj.label98:setAutoSize(true);
    obj.label98:setName("label98");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout13);
    obj.edit114:setLeft(180);
    obj.edit114:setTop(075);
    obj.edit114:setHeight(20);
    obj.edit114:setWidth(30);
    obj.edit114:setField("Atk4P4Gil");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout13);
    obj.label99:setLeft(240);
    obj.label99:setTop(075);
    obj.label99:setHeight(20);
    obj.label99:setWidth(30);
    obj.label99:setText("Exp");
    obj.label99:setAutoSize(true);
    obj.label99:setName("label99");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout13);
    obj.edit115:setLeft(275);
    obj.edit115:setTop(075);
    obj.edit115:setHeight(20);
    obj.edit115:setWidth(30);
    obj.edit115:setField("Atk4P5Exp");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout13);
    obj.label100:setLeft(320);
    obj.label100:setTop(075);
    obj.label100:setHeight(20);
    obj.label100:setWidth(30);
    obj.label100:setText("Gil");
    obj.label100:setAutoSize(true);
    obj.label100:setName("label100");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout13);
    obj.edit116:setLeft(345);
    obj.edit116:setTop(075);
    obj.edit116:setHeight(20);
    obj.edit116:setWidth(30);
    obj.edit116:setField("Atk4P5Gil");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout13);
    obj.label101:setLeft(400);
    obj.label101:setTop(075);
    obj.label101:setHeight(20);
    obj.label101:setWidth(30);
    obj.label101:setText("Exp");
    obj.label101:setAutoSize(true);
    obj.label101:setName("label101");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout13);
    obj.edit117:setLeft(435);
    obj.edit117:setTop(075);
    obj.edit117:setHeight(20);
    obj.edit117:setWidth(30);
    obj.edit117:setField("Atk4P6Exp");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout13);
    obj.label102:setLeft(480);
    obj.label102:setTop(075);
    obj.label102:setHeight(20);
    obj.label102:setWidth(30);
    obj.label102:setText("Gil");
    obj.label102:setAutoSize(true);
    obj.label102:setName("label102");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout13);
    obj.edit118:setLeft(505);
    obj.edit118:setTop(075);
    obj.edit118:setHeight(20);
    obj.edit118:setWidth(30);
    obj.edit118:setField("Atk4P6Gil");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout13);
    obj.label103:setLeft(600);
    obj.label103:setTop(025);
    obj.label103:setHeight(20);
    obj.label103:setWidth(80);
    obj.label103:setText("Exp Final");
    obj.label103:setAutoSize(true);
    obj.label103:setName("label103");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout13);
    obj.edit119:setLeft(685);
    obj.edit119:setTop(025);
    obj.edit119:setHeight(20);
    obj.edit119:setWidth(30);
    obj.edit119:setField("Atk4ExpF");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout13);
    obj.label104:setLeft(600);
    obj.label104:setTop(050);
    obj.label104:setHeight(20);
    obj.label104:setWidth(80);
    obj.label104:setText("Gil Final");
    obj.label104:setAutoSize(true);
    obj.label104:setName("label104");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout13);
    obj.edit120:setLeft(685);
    obj.edit120:setTop(050);
    obj.edit120:setHeight(20);
    obj.edit120:setWidth(30);
    obj.edit120:setField("Atk4GilF");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setName("edit120");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.tab2);
    obj.layout14:setLeft(650);
    obj.layout14:setTop(010);
    obj.layout14:setHeight(76);
    obj.layout14:setWidth(475);
    obj.layout14:setName("layout14");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout14);
    obj.label105:setLeft(000);
    obj.label105:setTop(000);
    obj.label105:setHeight(20);
    obj.label105:setWidth(10);
    obj.label105:setText("E");
    obj.label105:setAutoSize(true);
    obj.label105:setName("label105");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout14);
    obj.edit121:setLeft(015);
    obj.edit121:setTop(000);
    obj.edit121:setHeight(20);
    obj.edit121:setWidth(40);
    obj.edit121:setField("ExpFinal");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setName("edit121");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout14);
    obj.label106:setLeft(070);
    obj.label106:setTop(000);
    obj.label106:setHeight(20);
    obj.label106:setWidth(10);
    obj.label106:setText("G");
    obj.label106:setAutoSize(true);
    obj.label106:setName("label106");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout14);
    obj.edit122:setLeft(95);
    obj.edit122:setTop(000);
    obj.edit122:setHeight(20);
    obj.edit122:setWidth(40);
    obj.edit122:setField("GilFinal");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Action");
    obj.tab3:setName("tab3");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.tab3);
    obj.layout15:setLeft(10);
    obj.layout15:setTop(10);
    obj.layout15:setHeight(230);
    obj.layout15:setWidth(380);
    obj.layout15:setName("layout15");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout15);
    obj.label107:setLeft(000);
    obj.label107:setTop(000);
    obj.label107:setHeight(20);
    obj.label107:setWidth(100);
    obj.label107:setText("Add Status");
    obj.label107:setAutoSize(true);
    obj.label107:setHitTest(true);
    obj.label107:setHint("The monster can use an Ability Action to automatically add a positive Status Condition (4) to a Single target. \n XP and Gil values are given per Status added, and depend on the exact Status taken. \n Add Status can be used to add more than one Status Condition at a time, though it is recommended that this option be reserved for Boss monsters and creatures of Level 30 or above");
    obj.label107:setName("label107");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout15);
    obj.checkBox17:setLeft(000);
    obj.checkBox17:setTop(025);
    obj.checkBox17:setHeight(20);
    obj.checkBox17:setWidth(120);
    obj.checkBox17:setText("Float");
    obj.checkBox17:setField("addFloat");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout15);
    obj.checkBox18:setLeft(125);
    obj.checkBox18:setTop(025);
    obj.checkBox18:setHeight(20);
    obj.checkBox18:setWidth(120);
    obj.checkBox18:setText("Agility Up");
    obj.checkBox18:setField("addAgiUP");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout15);
    obj.checkBox19:setLeft(250);
    obj.checkBox19:setTop(025);
    obj.checkBox19:setHeight(20);
    obj.checkBox19:setWidth(120);
    obj.checkBox19:setText("Spirit Up");
    obj.checkBox19:setField("addSpiUP");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout15);
    obj.checkBox20:setLeft(000);
    obj.checkBox20:setTop(050);
    obj.checkBox20:setHeight(20);
    obj.checkBox20:setWidth(120);
    obj.checkBox20:setText("Earth Spikes");
    obj.checkBox20:setField("addGNDSpikes");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout15);
    obj.checkBox21:setLeft(125);
    obj.checkBox21:setTop(050);
    obj.checkBox21:setHeight(20);
    obj.checkBox21:setWidth(120);
    obj.checkBox21:setText("Fire Spikes");
    obj.checkBox21:setField("addFIRSpikes");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout15);
    obj.checkBox22:setLeft(250);
    obj.checkBox22:setTop(050);
    obj.checkBox22:setHeight(20);
    obj.checkBox22:setWidth(120);
    obj.checkBox22:setText("Water Spikes");
    obj.checkBox22:setField("addWATSpikes");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout15);
    obj.checkBox23:setLeft(000);
    obj.checkBox23:setTop(075);
    obj.checkBox23:setHeight(20);
    obj.checkBox23:setWidth(120);
    obj.checkBox23:setText("Wind Spikes");
    obj.checkBox23:setField("addWINSpikes");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout15);
    obj.checkBox24:setLeft(125);
    obj.checkBox24:setTop(075);
    obj.checkBox24:setHeight(20);
    obj.checkBox24:setWidth(120);
    obj.checkBox24:setText("Ice Spikes");
    obj.checkBox24:setField("addICESpikes");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout15);
    obj.checkBox25:setLeft(250);
    obj.checkBox25:setTop(075);
    obj.checkBox25:setHeight(20);
    obj.checkBox25:setWidth(120);
    obj.checkBox25:setText("Lightning Spikes");
    obj.checkBox25:setField("addELESpikes");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout15);
    obj.checkBox26:setLeft(000);
    obj.checkBox26:setTop(100);
    obj.checkBox26:setHeight(20);
    obj.checkBox26:setWidth(120);
    obj.checkBox26:setText("Holy Spikes");
    obj.checkBox26:setField("addHOLSpikes");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout15);
    obj.checkBox27:setLeft(125);
    obj.checkBox27:setTop(100);
    obj.checkBox27:setHeight(20);
    obj.checkBox27:setWidth(120);
    obj.checkBox27:setText("Shadow Spikes");
    obj.checkBox27:setField("addSHASpikes");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout15);
    obj.checkBox28:setLeft(250);
    obj.checkBox28:setTop(100);
    obj.checkBox28:setHeight(20);
    obj.checkBox28:setWidth(120);
    obj.checkBox28:setText("Protect");
    obj.checkBox28:setField("addProtect");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout15);
    obj.checkBox29:setLeft(000);
    obj.checkBox29:setTop(125);
    obj.checkBox29:setHeight(20);
    obj.checkBox29:setWidth(120);
    obj.checkBox29:setText("Shell");
    obj.checkBox29:setField("addShell");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout15);
    obj.checkBox30:setLeft(125);
    obj.checkBox30:setTop(125);
    obj.checkBox30:setHeight(20);
    obj.checkBox30:setWidth(120);
    obj.checkBox30:setText("Armor Up");
    obj.checkBox30:setField("addARMUP");
    obj.checkBox30:setName("checkBox30");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout15);
    obj.checkBox31:setLeft(250);
    obj.checkBox31:setTop(125);
    obj.checkBox31:setHeight(20);
    obj.checkBox31:setWidth(120);
    obj.checkBox31:setText("Mental Up");
    obj.checkBox31:setField("addMENUP");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout15);
    obj.checkBox32:setLeft(000);
    obj.checkBox32:setTop(150);
    obj.checkBox32:setHeight(20);
    obj.checkBox32:setWidth(120);
    obj.checkBox32:setText("Haste");
    obj.checkBox32:setField("addHaste");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout15);
    obj.checkBox33:setLeft(125);
    obj.checkBox33:setTop(150);
    obj.checkBox33:setHeight(20);
    obj.checkBox33:setWidth(120);
    obj.checkBox33:setText("Reflect");
    obj.checkBox33:setField("addReflect");
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout15);
    obj.checkBox34:setLeft(250);
    obj.checkBox34:setTop(150);
    obj.checkBox34:setHeight(20);
    obj.checkBox34:setWidth(120);
    obj.checkBox34:setText("Power Up");
    obj.checkBox34:setField("addPOWUP");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout15);
    obj.checkBox35:setLeft(000);
    obj.checkBox35:setTop(175);
    obj.checkBox35:setHeight(20);
    obj.checkBox35:setWidth(120);
    obj.checkBox35:setText("Magic Up");
    obj.checkBox35:setField("addMAGUP");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout15);
    obj.checkBox36:setLeft(125);
    obj.checkBox36:setTop(175);
    obj.checkBox36:setHeight(20);
    obj.checkBox36:setWidth(120);
    obj.checkBox36:setText("Regen");
    obj.checkBox36:setField("addRegen");
    obj.checkBox36:setName("checkBox36");

    obj.checkBox37 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout15);
    obj.checkBox37:setLeft(250);
    obj.checkBox37:setTop(175);
    obj.checkBox37:setHeight(20);
    obj.checkBox37:setWidth(120);
    obj.checkBox37:setText("Aura");
    obj.checkBox37:setField("addAura");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout15);
    obj.checkBox38:setLeft(000);
    obj.checkBox38:setTop(200);
    obj.checkBox38:setHeight(20);
    obj.checkBox38:setWidth(120);
    obj.checkBox38:setText("Vanish");
    obj.checkBox38:setField("addVanish");
    obj.checkBox38:setName("checkBox38");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.tab3);
    obj.layout16:setLeft(10);
    obj.layout16:setTop(250);
    obj.layout16:setHeight(230);
    obj.layout16:setWidth(380);
    obj.layout16:setName("layout16");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout16);
    obj.label108:setLeft(000);
    obj.label108:setTop(000);
    obj.label108:setHeight(20);
    obj.label108:setWidth(100);
    obj.label108:setText("Cannibalize");
    obj.label108:setAutoSize(true);
    obj.label108:setHitTest(true);
    obj.label108:setHint("The monster can consume other monsters to increase its own strength. \n A monster can Cannibalize a Single ally of a Level no higher than (Monster's Level / 2) at the cost of one Ability Action. \n This automatically reduces the target's HP to 0 – treat this as an Eject-type effect. XP and Gil values for Cannibalize depend on what effects it has. \n By default, the monster regains (Target's Current HP) Hit Points, but Cannibalize can instead bestow one positive Status Condition (4) on the monster. XP and Gil values are given per Status added, and depend on the exact Status taken:");
    obj.label108:setName("label108");

    obj.checkBox39 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout16);
    obj.checkBox39:setLeft(000);
    obj.checkBox39:setTop(025);
    obj.checkBox39:setHeight(20);
    obj.checkBox39:setWidth(120);
    obj.checkBox39:setText("Float");
    obj.checkBox39:setField("canFloat");
    obj.checkBox39:setName("checkBox39");

    obj.checkBox40 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout16);
    obj.checkBox40:setLeft(125);
    obj.checkBox40:setTop(025);
    obj.checkBox40:setHeight(20);
    obj.checkBox40:setWidth(120);
    obj.checkBox40:setText("Agility Up");
    obj.checkBox40:setField("canAgiUP");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout16);
    obj.checkBox41:setLeft(250);
    obj.checkBox41:setTop(025);
    obj.checkBox41:setHeight(20);
    obj.checkBox41:setWidth(120);
    obj.checkBox41:setText("Spirit Up");
    obj.checkBox41:setField("canSpiUP");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout16);
    obj.checkBox42:setLeft(000);
    obj.checkBox42:setTop(050);
    obj.checkBox42:setHeight(20);
    obj.checkBox42:setWidth(120);
    obj.checkBox42:setText("Earth Spikes");
    obj.checkBox42:setField("canGNDSpikes");
    obj.checkBox42:setName("checkBox42");

    obj.checkBox43 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout16);
    obj.checkBox43:setLeft(125);
    obj.checkBox43:setTop(050);
    obj.checkBox43:setHeight(20);
    obj.checkBox43:setWidth(120);
    obj.checkBox43:setText("Fire Spikes");
    obj.checkBox43:setField("canFIRSpikes");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout16);
    obj.checkBox44:setLeft(250);
    obj.checkBox44:setTop(050);
    obj.checkBox44:setHeight(20);
    obj.checkBox44:setWidth(120);
    obj.checkBox44:setText("Water Spikes");
    obj.checkBox44:setField("canWATSpikes");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout16);
    obj.checkBox45:setLeft(000);
    obj.checkBox45:setTop(075);
    obj.checkBox45:setHeight(20);
    obj.checkBox45:setWidth(120);
    obj.checkBox45:setText("Wind Spikes");
    obj.checkBox45:setField("canWINSpikes");
    obj.checkBox45:setName("checkBox45");

    obj.checkBox46 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout16);
    obj.checkBox46:setLeft(125);
    obj.checkBox46:setTop(075);
    obj.checkBox46:setHeight(20);
    obj.checkBox46:setWidth(120);
    obj.checkBox46:setText("Ice Spikes");
    obj.checkBox46:setField("canICESpikes");
    obj.checkBox46:setName("checkBox46");

    obj.checkBox47 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout16);
    obj.checkBox47:setLeft(250);
    obj.checkBox47:setTop(075);
    obj.checkBox47:setHeight(20);
    obj.checkBox47:setWidth(120);
    obj.checkBox47:setText("Lightning Spikes");
    obj.checkBox47:setField("canELESpikes");
    obj.checkBox47:setName("checkBox47");

    obj.checkBox48 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout16);
    obj.checkBox48:setLeft(000);
    obj.checkBox48:setTop(100);
    obj.checkBox48:setHeight(20);
    obj.checkBox48:setWidth(120);
    obj.checkBox48:setText("Holy Spikes");
    obj.checkBox48:setField("canHOLSpikes");
    obj.checkBox48:setName("checkBox48");

    obj.checkBox49 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout16);
    obj.checkBox49:setLeft(125);
    obj.checkBox49:setTop(100);
    obj.checkBox49:setHeight(20);
    obj.checkBox49:setWidth(120);
    obj.checkBox49:setText("Shadow Spikes");
    obj.checkBox49:setField("canSHASpikes");
    obj.checkBox49:setName("checkBox49");

    obj.checkBox50 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout16);
    obj.checkBox50:setLeft(250);
    obj.checkBox50:setTop(100);
    obj.checkBox50:setHeight(20);
    obj.checkBox50:setWidth(120);
    obj.checkBox50:setText("Protect");
    obj.checkBox50:setField("canProtect");
    obj.checkBox50:setName("checkBox50");

    obj.checkBox51 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout16);
    obj.checkBox51:setLeft(000);
    obj.checkBox51:setTop(125);
    obj.checkBox51:setHeight(20);
    obj.checkBox51:setWidth(120);
    obj.checkBox51:setText("Shell");
    obj.checkBox51:setField("canShell");
    obj.checkBox51:setName("checkBox51");

    obj.checkBox52 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout16);
    obj.checkBox52:setLeft(125);
    obj.checkBox52:setTop(125);
    obj.checkBox52:setHeight(20);
    obj.checkBox52:setWidth(120);
    obj.checkBox52:setText("Armor Up");
    obj.checkBox52:setField("canARMUP");
    obj.checkBox52:setName("checkBox52");

    obj.checkBox53 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout16);
    obj.checkBox53:setLeft(250);
    obj.checkBox53:setTop(125);
    obj.checkBox53:setHeight(20);
    obj.checkBox53:setWidth(120);
    obj.checkBox53:setText("Mental Up");
    obj.checkBox53:setField("canMENUP");
    obj.checkBox53:setName("checkBox53");

    obj.checkBox54 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout16);
    obj.checkBox54:setLeft(000);
    obj.checkBox54:setTop(150);
    obj.checkBox54:setHeight(20);
    obj.checkBox54:setWidth(120);
    obj.checkBox54:setText("Haste");
    obj.checkBox54:setField("canHaste");
    obj.checkBox54:setName("checkBox54");

    obj.checkBox55 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout16);
    obj.checkBox55:setLeft(125);
    obj.checkBox55:setTop(150);
    obj.checkBox55:setHeight(20);
    obj.checkBox55:setWidth(120);
    obj.checkBox55:setText("Reflect");
    obj.checkBox55:setField("canReflect");
    obj.checkBox55:setName("checkBox55");

    obj.checkBox56 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout16);
    obj.checkBox56:setLeft(250);
    obj.checkBox56:setTop(150);
    obj.checkBox56:setHeight(20);
    obj.checkBox56:setWidth(120);
    obj.checkBox56:setText("Power Up");
    obj.checkBox56:setField("canPOWUP");
    obj.checkBox56:setName("checkBox56");

    obj.checkBox57 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout16);
    obj.checkBox57:setLeft(000);
    obj.checkBox57:setTop(175);
    obj.checkBox57:setHeight(20);
    obj.checkBox57:setWidth(120);
    obj.checkBox57:setText("Magic Up");
    obj.checkBox57:setField("canMAGUP");
    obj.checkBox57:setName("checkBox57");

    obj.checkBox58 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout16);
    obj.checkBox58:setLeft(125);
    obj.checkBox58:setTop(175);
    obj.checkBox58:setHeight(20);
    obj.checkBox58:setWidth(120);
    obj.checkBox58:setText("Regen");
    obj.checkBox58:setField("canRegen");
    obj.checkBox58:setName("checkBox58");

    obj.checkBox59 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout16);
    obj.checkBox59:setLeft(250);
    obj.checkBox59:setTop(175);
    obj.checkBox59:setHeight(20);
    obj.checkBox59:setWidth(120);
    obj.checkBox59:setText("Aura");
    obj.checkBox59:setField("canAura");
    obj.checkBox59:setName("checkBox59");

    obj.checkBox60 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout16);
    obj.checkBox60:setLeft(000);
    obj.checkBox60:setTop(200);
    obj.checkBox60:setHeight(20);
    obj.checkBox60:setWidth(120);
    obj.checkBox60:setText("Vanish");
    obj.checkBox60:setField("canVanish");
    obj.checkBox60:setName("checkBox60");

    obj.checkBox61 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout16);
    obj.checkBox61:setLeft(125);
    obj.checkBox61:setTop(200);
    obj.checkBox61:setHeight(20);
    obj.checkBox61:setWidth(120);
    obj.checkBox61:setText("Heal HP");
    obj.checkBox61:setField("canHealHP");
    obj.checkBox61:setName("checkBox61");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.tab3);
    obj.layout17:setLeft(500);
    obj.layout17:setTop(20);
    obj.layout17:setHeight(430);
    obj.layout17:setWidth(300);
    obj.layout17:setName("layout17");

    obj.checkBox62 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout17);
    obj.checkBox62:setLeft(000);
    obj.checkBox62:setTop(000);
    obj.checkBox62:setHeight(20);
    obj.checkBox62:setWidth(100);
    obj.checkBox62:setText("Alarm");
    obj.checkBox62:setField("aaAlarm");
    obj.checkBox62:setHitTest(true);
    obj.checkBox62:setHint("The monster can use an Ability Action to summon an additional monster into battle. The new monster arrives on the battlefield at the beginning of the following Round, forming a Group with the original monster, and generates Initiative as normal. Once used, Alarm cannot be used again until the summoned monster has been defeated or incapacitated. \n The type of monster summoned by Alarm should be noted in the Ability’s description. Multiple monsters can be summoned through a single Alarm; in this case, multiply the XP and Gil Modifiers given below by the number of monsters summoned. It is generally recommended that any monsters summoned through Alarm be of equal or lower Level to the monster doing the summoning");
    obj.checkBox62:setName("checkBox62");

    obj.checkBox63 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout17);
    obj.checkBox63:setLeft(000);
    obj.checkBox63:setTop(025);
    obj.checkBox63:setHeight(20);
    obj.checkBox63:setWidth(100);
    obj.checkBox63:setText("Clone");
    obj.checkBox63:setField("aaClone");
    obj.checkBox63:setHitTest(true);
    obj.checkBox63:setHint("The monster can use an Ability Action to create a copy of one of its opponents to act as an active combatant in the current battle. \n The clone has all the Attributes, Combat Statistics, Equipment, and Abilities of the original character, and generates Initiative as normal, fighting on the monster’s behalf until killed or incapacitated. No XP or Gil is awarded for defeating opponents created by Clone.");
    obj.checkBox63:setName("checkBox63");

    obj.checkBox64 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout17);
    obj.checkBox64:setLeft(000);
    obj.checkBox64:setTop(050);
    obj.checkBox64:setHeight(20);
    obj.checkBox64:setWidth(100);
    obj.checkBox64:setText("Escape");
    obj.checkBox64:setField("aaEscape");
    obj.checkBox64:setHitTest(true);
    obj.checkBox64:setHint("The monster has the ability to make Escape Actions, allowing it to flee from battle. \n Monsters that successfully escape are not counted as defeated, and award no XP, Gil, or Items to the players. Escape is sealed by the Status Condition Immobilize.");
    obj.checkBox64:setName("checkBox64");

    obj.checkBox65 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout17);
    obj.checkBox65:setLeft(000);
    obj.checkBox65:setTop(075);
    obj.checkBox65:setHeight(20);
    obj.checkBox65:setWidth(100);
    obj.checkBox65:setText("Imprison");
    obj.checkBox65:setField("aaImprison");
    obj.checkBox65:setHitTest(true);
    obj.checkBox65:setHint("The monster is capable of seizing and imprisoning opponents in battle. Doing so requires the monster to use an Ability Action. Whilst imprisoned, the prisoner is afflicted with the Status Condition Immobilize – even if he would normally be Immune to it – and suffers 50% of any damage done to the monster after it has been modified for ARM or M. ARM. The prisoner's ARM and M. ARM can be used to further reduce this damage. \n By default, the prisoner is only released if the monster decides to let him go – this is done during the Status Phase, and costs no Actions to do – or if the monster is incapacitated. However, Imprison has a number of special Modifiers that can be added to give it more strategic depth.");
    obj.checkBox65:setName("checkBox65");

    obj.checkBox66 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout17);
    obj.checkBox66:setLeft(020);
    obj.checkBox66:setTop(100);
    obj.checkBox66:setHeight(20);
    obj.checkBox66:setWidth(140);
    obj.checkBox66:setText("Binding Prison");
    obj.checkBox66:setField("aaBPrison");
    obj.checkBox66:setHitTest(true);
    obj.checkBox66:setHint("A Binding Prison prevents the captured target from making Actions or generating Initiative for as long as he remains in the monster’s clutches");
    obj.checkBox66:setName("checkBox66");

    obj.checkBox67 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout17);
    obj.checkBox67:setLeft(020);
    obj.checkBox67:setTop(125);
    obj.checkBox67:setHeight(20);
    obj.checkBox67:setWidth(140);
    obj.checkBox67:setText("Insecure Prison");
    obj.checkBox67:setField("aaIPrison");
    obj.checkBox67:setHitTest(true);
    obj.checkBox67:setHint("An Insecure Prison gives the target the opportunity to make an Escape Action. The opposed roll for the Escape Action uses (Monster's AGI + Monster's Level) instead of the monster's SPD Rating..");
    obj.checkBox67:setName("checkBox67");

    obj.checkBox68 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout17);
    obj.checkBox68:setLeft(020);
    obj.checkBox68:setTop(150);
    obj.checkBox68:setHeight(20);
    obj.checkBox68:setWidth(140);
    obj.checkBox68:setText("Sheltered Prison");
    obj.checkBox68:setField("aaSPrison");
    obj.checkBox68:setHitTest(true);
    obj.checkBox68:setHint("A Sheltered Prison prevents the captured target from taking damage when the monster is damaged in battle.");
    obj.checkBox68:setName("checkBox68");

    obj.checkBox69 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout17);
    obj.checkBox69:setLeft(020);
    obj.checkBox69:setTop(175);
    obj.checkBox69:setHeight(20);
    obj.checkBox69:setWidth(140);
    obj.checkBox69:setText("Damaging Prison");
    obj.checkBox69:setField("aaDPrison");
    obj.checkBox69:setHitTest(true);
    obj.checkBox69:setHint("A target in a Damaging Prison loses 10% of his maximum Hit Points at the end of every Status Phase he still remains imprisoned for.");
    obj.checkBox69:setName("checkBox69");

    obj.checkBox70 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout17);
    obj.checkBox70:setLeft(020);
    obj.checkBox70:setTop(200);
    obj.checkBox70:setHeight(20);
    obj.checkBox70:setWidth(140);
    obj.checkBox70:setText("Vulnerable Prison");
    obj.checkBox70:setField("aaVPrison");
    obj.checkBox70:setHitTest(true);
    obj.checkBox70:setHint("A Vulnerable Prison releases the target released from the monster’s clutches once the monster suffers damage equal to 10% of the monster’s maximum Hit Points. This damage is cumulative, and does not have to be done in one attack.");
    obj.checkBox70:setName("checkBox70");

    obj.checkBox71 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout17);
    obj.checkBox71:setLeft(000);
    obj.checkBox71:setTop(225);
    obj.checkBox71:setHeight(20);
    obj.checkBox71:setWidth(100);
    obj.checkBox71:setText("Item Use");
    obj.checkBox71:setField("aaItemUse");
    obj.checkBox71:setHitTest(true);
    obj.checkBox71:setHint("The monster can make Item Actions, and has an Inventory of its own. Items made available to a monster via its Inventory are separate from the monster’s Treasure Tables; anything still left in the monster’s Inventory when it is defeated is awarded to the players alongside the usual treasure. \n Successful use of Steal liberates a random item from the monster’s Inventory until there is nothing left to steal; at this point, subsequent uses of Steal take items from the Treasure Table as normal. Item Use is sealed by the Status Condition Disable.");
    obj.checkBox71:setName("checkBox71");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout17);
    obj.label109:setLeft(000);
    obj.label109:setTop(250);
    obj.label109:setHeight(20);
    obj.label109:setWidth(100);
    obj.label109:setAutoSize(true);
    obj.label109:setText("Restore");
    obj.label109:setHitTest(true);
    obj.label109:setHint("The monster has the ability to regenerate even grievous damage. Through the use of an Ability Action, a monster with Restore can regenerate 25%, 50%, or 75% of its maximum Hit Points. \n Creatures under the Status Condition Zombie suffer the appropriate amount of damage instead.");
    obj.label109:setName("label109");

    obj.checkBox72 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout17);
    obj.checkBox72:setLeft(020);
    obj.checkBox72:setTop(275);
    obj.checkBox72:setHeight(20);
    obj.checkBox72:setWidth(140);
    obj.checkBox72:setText("25%");
    obj.checkBox72:setField("aaRestore25");
    obj.checkBox72:setName("checkBox72");

    obj.checkBox73 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout17);
    obj.checkBox73:setLeft(020);
    obj.checkBox73:setTop(300);
    obj.checkBox73:setHeight(20);
    obj.checkBox73:setWidth(140);
    obj.checkBox73:setText("50%");
    obj.checkBox73:setField("aaRestore50");
    obj.checkBox73:setName("checkBox73");

    obj.checkBox74 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout17);
    obj.checkBox74:setLeft(020);
    obj.checkBox74:setTop(325);
    obj.checkBox74:setHeight(20);
    obj.checkBox74:setWidth(140);
    obj.checkBox74:setText("75%");
    obj.checkBox74:setField("aaRestore75");
    obj.checkBox74:setName("checkBox74");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout17);
    obj.label110:setLeft(000);
    obj.label110:setTop(350);
    obj.label110:setHeight(20);
    obj.label110:setWidth(100);
    obj.label110:setAutoSize(true);
    obj.label110:setText("Steal Status");
    obj.label110:setHitTest(true);
    obj.label110:setHint("The monster is capable of stealing Status Conditions from another combatant. Steal Status requires an Ability Action to carry out, and transfers the newest Status Condition added to the target to the monster, duration included, canceling it on the target in the process. \n XP and Gil values depend on whether the monster will steal any Status Condition, or only the newest positive Status Condition added to the target. Steal Status may take multiple Status Conditions with just one Action; in this case, multiply the values given below by the maximum number of Status Conditions Steal Status can take. \n When dealing with Auto- or SOS- Status Conditions, Steal Status will add the Status Condition in question to the monster without canceling the original; Status Conditions stolen in this manner automatically have a Timer of (4).");
    obj.label110:setName("label110");

    obj.checkBox75 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout17);
    obj.checkBox75:setLeft(020);
    obj.checkBox75:setTop(375);
    obj.checkBox75:setHeight(20);
    obj.checkBox75:setWidth(140);
    obj.checkBox75:setText("Positive Only");
    obj.checkBox75:setField("aaSSPO");
    obj.checkBox75:setName("checkBox75");

    obj.checkBox76 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout17);
    obj.checkBox76:setLeft(020);
    obj.checkBox76:setTop(400);
    obj.checkBox76:setHeight(20);
    obj.checkBox76:setWidth(140);
    obj.checkBox76:setText("Positive or Negative");
    obj.checkBox76:setField("aaSSPN");
    obj.checkBox76:setName("checkBox76");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.tab3);
    obj.layout18:setLeft(650);
    obj.layout18:setTop(010);
    obj.layout18:setHeight(76);
    obj.layout18:setWidth(475);
    obj.layout18:setName("layout18");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout18);
    obj.label111:setLeft(000);
    obj.label111:setTop(000);
    obj.label111:setHeight(20);
    obj.label111:setWidth(10);
    obj.label111:setText("E");
    obj.label111:setAutoSize(true);
    obj.label111:setName("label111");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout18);
    obj.edit123:setLeft(015);
    obj.edit123:setTop(000);
    obj.edit123:setHeight(20);
    obj.edit123:setWidth(40);
    obj.edit123:setField("ExpFinal");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setName("edit123");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout18);
    obj.label112:setLeft(070);
    obj.label112:setTop(000);
    obj.label112:setHeight(20);
    obj.label112:setWidth(10);
    obj.label112:setText("G");
    obj.label112:setAutoSize(true);
    obj.label112:setName("label112");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout18);
    obj.edit124:setLeft(95);
    obj.edit124:setTop(000);
    obj.edit124:setHeight(20);
    obj.edit124:setWidth(40);
    obj.edit124:setField("GilFinal");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setName("edit124");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Spells");
    obj.tab4:setName("tab4");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.tab4);
    obj.layout19:setLeft(200);
    obj.layout19:setTop(60);
    obj.layout19:setHeight(300);
    obj.layout19:setWidth(400);
    obj.layout19:setName("layout19");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout19);
    obj.label113:setLeft(000);
    obj.label113:setTop(000);
    obj.label113:setHeight(20);
    obj.label113:setWidth(80);
    obj.label113:setText("Magia #1");
    obj.label113:setAutoSize(true);
    obj.label113:setName("label113");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout19);
    obj.comboBox7:setLeft(085);
    obj.comboBox7:setTop(000);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setWidth(130);
    obj.comboBox7:setField("SpellsTIPO1");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox7:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox7:setName("comboBox7");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout19);
    obj.edit125:setLeft(230);
    obj.edit125:setTop(000);
    obj.edit125:setHeight(20);
    obj.edit125:setWidth(150);
    obj.edit125:setField("SpellMAG1");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout19);
    obj.label114:setLeft(000);
    obj.label114:setTop(025);
    obj.label114:setHeight(20);
    obj.label114:setWidth(80);
    obj.label114:setText("Magia #2");
    obj.label114:setAutoSize(true);
    obj.label114:setName("label114");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout19);
    obj.comboBox8:setLeft(085);
    obj.comboBox8:setTop(025);
    obj.comboBox8:setHeight(20);
    obj.comboBox8:setWidth(130);
    obj.comboBox8:setField("SpellsTIPO2");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox8:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox8:setName("comboBox8");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout19);
    obj.edit126:setLeft(230);
    obj.edit126:setTop(025);
    obj.edit126:setHeight(20);
    obj.edit126:setWidth(150);
    obj.edit126:setField("SpellMAG2");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout19);
    obj.label115:setLeft(000);
    obj.label115:setTop(050);
    obj.label115:setHeight(20);
    obj.label115:setWidth(80);
    obj.label115:setText("Magia #3");
    obj.label115:setAutoSize(true);
    obj.label115:setName("label115");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout19);
    obj.comboBox9:setLeft(085);
    obj.comboBox9:setTop(050);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setWidth(130);
    obj.comboBox9:setField("SpellsTIPO3");
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox9:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox9:setName("comboBox9");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout19);
    obj.edit127:setLeft(230);
    obj.edit127:setTop(050);
    obj.edit127:setHeight(20);
    obj.edit127:setWidth(150);
    obj.edit127:setField("SpellMAG3");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setName("edit127");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout19);
    obj.label116:setLeft(000);
    obj.label116:setTop(075);
    obj.label116:setHeight(20);
    obj.label116:setWidth(80);
    obj.label116:setText("Magia #4");
    obj.label116:setAutoSize(true);
    obj.label116:setName("label116");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout19);
    obj.comboBox10:setLeft(085);
    obj.comboBox10:setTop(075);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setWidth(130);
    obj.comboBox10:setField("SpellsTIPO4");
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox10:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox10:setName("comboBox10");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout19);
    obj.edit128:setLeft(230);
    obj.edit128:setTop(075);
    obj.edit128:setHeight(20);
    obj.edit128:setWidth(150);
    obj.edit128:setField("SpellMAG4");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout19);
    obj.label117:setLeft(000);
    obj.label117:setTop(100);
    obj.label117:setHeight(20);
    obj.label117:setWidth(80);
    obj.label117:setText("Magia #5");
    obj.label117:setAutoSize(true);
    obj.label117:setName("label117");

    obj.comboBox11 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout19);
    obj.comboBox11:setLeft(085);
    obj.comboBox11:setTop(100);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setWidth(130);
    obj.comboBox11:setField("SpellsTIPO5");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox11:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox11:setName("comboBox11");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout19);
    obj.edit129:setLeft(230);
    obj.edit129:setTop(100);
    obj.edit129:setHeight(20);
    obj.edit129:setWidth(150);
    obj.edit129:setField("SpellMAG5");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout19);
    obj.label118:setLeft(000);
    obj.label118:setTop(125);
    obj.label118:setHeight(20);
    obj.label118:setWidth(80);
    obj.label118:setText("Magia #6");
    obj.label118:setAutoSize(true);
    obj.label118:setName("label118");

    obj.comboBox12 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout19);
    obj.comboBox12:setLeft(085);
    obj.comboBox12:setTop(125);
    obj.comboBox12:setHeight(20);
    obj.comboBox12:setWidth(130);
    obj.comboBox12:setField("SpellsTIPO6");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox12:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox12:setName("comboBox12");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout19);
    obj.edit130:setLeft(230);
    obj.edit130:setTop(125);
    obj.edit130:setHeight(20);
    obj.edit130:setWidth(150);
    obj.edit130:setField("SpellMAG6");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setName("edit130");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout19);
    obj.label119:setLeft(000);
    obj.label119:setTop(150);
    obj.label119:setHeight(20);
    obj.label119:setWidth(80);
    obj.label119:setText("Magia #7");
    obj.label119:setAutoSize(true);
    obj.label119:setName("label119");

    obj.comboBox13 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout19);
    obj.comboBox13:setLeft(085);
    obj.comboBox13:setTop(150);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setWidth(130);
    obj.comboBox13:setField("SpellsTIPO7");
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox13:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox13:setName("comboBox13");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout19);
    obj.edit131:setLeft(230);
    obj.edit131:setTop(150);
    obj.edit131:setHeight(20);
    obj.edit131:setWidth(150);
    obj.edit131:setField("SpellMAG7");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setName("edit131");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout19);
    obj.label120:setLeft(000);
    obj.label120:setTop(175);
    obj.label120:setHeight(20);
    obj.label120:setWidth(80);
    obj.label120:setText("Magia #8");
    obj.label120:setAutoSize(true);
    obj.label120:setName("label120");

    obj.comboBox14 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout19);
    obj.comboBox14:setLeft(085);
    obj.comboBox14:setTop(175);
    obj.comboBox14:setHeight(20);
    obj.comboBox14:setWidth(130);
    obj.comboBox14:setField("SpellsTIPO8");
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox14:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox14:setName("comboBox14");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout19);
    obj.edit132:setLeft(230);
    obj.edit132:setTop(175);
    obj.edit132:setHeight(20);
    obj.edit132:setWidth(150);
    obj.edit132:setField("SpellMAG8");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout19);
    obj.label121:setLeft(000);
    obj.label121:setTop(200);
    obj.label121:setHeight(20);
    obj.label121:setWidth(80);
    obj.label121:setText("Magia #9");
    obj.label121:setAutoSize(true);
    obj.label121:setName("label121");

    obj.comboBox15 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout19);
    obj.comboBox15:setLeft(085);
    obj.comboBox15:setTop(200);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setWidth(130);
    obj.comboBox15:setField("SpellsTIPO9");
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox15:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox15:setName("comboBox15");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout19);
    obj.edit133:setLeft(230);
    obj.edit133:setTop(200);
    obj.edit133:setHeight(20);
    obj.edit133:setWidth(150);
    obj.edit133:setField("SpellMAG9");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setName("edit133");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout19);
    obj.label122:setLeft(000);
    obj.label122:setTop(225);
    obj.label122:setHeight(20);
    obj.label122:setWidth(80);
    obj.label122:setText("Magia #10");
    obj.label122:setAutoSize(true);
    obj.label122:setName("label122");

    obj.comboBox16 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout19);
    obj.comboBox16:setLeft(085);
    obj.comboBox16:setTop(225);
    obj.comboBox16:setHeight(20);
    obj.comboBox16:setWidth(130);
    obj.comboBox16:setField("SpellsTIPO10");
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox16:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox16:setName("comboBox16");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout19);
    obj.edit134:setLeft(230);
    obj.edit134:setTop(225);
    obj.edit134:setHeight(20);
    obj.edit134:setWidth(150);
    obj.edit134:setField("SpellMAG10");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout19);
    obj.label123:setLeft(000);
    obj.label123:setTop(250);
    obj.label123:setHeight(20);
    obj.label123:setWidth(80);
    obj.label123:setText("Magia #11");
    obj.label123:setAutoSize(true);
    obj.label123:setName("label123");

    obj.comboBox17 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout19);
    obj.comboBox17:setLeft(085);
    obj.comboBox17:setTop(250);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setWidth(130);
    obj.comboBox17:setField("SpellsTIPO11");
    obj.comboBox17:setHorzTextAlign("center");
    obj.comboBox17:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox17:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox17:setName("comboBox17");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout19);
    obj.edit135:setLeft(230);
    obj.edit135:setTop(250);
    obj.edit135:setHeight(20);
    obj.edit135:setWidth(150);
    obj.edit135:setField("SpellMAG11");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout19);
    obj.label124:setLeft(000);
    obj.label124:setTop(275);
    obj.label124:setHeight(20);
    obj.label124:setWidth(80);
    obj.label124:setText("Magia #12");
    obj.label124:setAutoSize(true);
    obj.label124:setName("label124");

    obj.comboBox18 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout19);
    obj.comboBox18:setLeft(085);
    obj.comboBox18:setTop(275);
    obj.comboBox18:setHeight(20);
    obj.comboBox18:setWidth(130);
    obj.comboBox18:setField("SpellsTIPO12");
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', ''});
    obj.comboBox18:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox18:setName("comboBox18");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout19);
    obj.edit136:setLeft(230);
    obj.edit136:setTop(275);
    obj.edit136:setHeight(20);
    obj.edit136:setWidth(150);
    obj.edit136:setField("SpellMAG9");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setName("edit136");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.tab4);
    obj.layout20:setLeft(650);
    obj.layout20:setTop(010);
    obj.layout20:setHeight(76);
    obj.layout20:setWidth(475);
    obj.layout20:setName("layout20");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout20);
    obj.label125:setLeft(000);
    obj.label125:setTop(000);
    obj.label125:setHeight(20);
    obj.label125:setWidth(10);
    obj.label125:setText("E");
    obj.label125:setAutoSize(true);
    obj.label125:setName("label125");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout20);
    obj.edit137:setLeft(015);
    obj.edit137:setTop(000);
    obj.edit137:setHeight(20);
    obj.edit137:setWidth(40);
    obj.edit137:setField("ExpFinal");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout20);
    obj.label126:setLeft(070);
    obj.label126:setTop(000);
    obj.label126:setHeight(20);
    obj.label126:setWidth(10);
    obj.label126:setText("G");
    obj.label126:setAutoSize(true);
    obj.label126:setName("label126");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout20);
    obj.edit138:setLeft(95);
    obj.edit138:setTop(000);
    obj.edit138:setHeight(20);
    obj.edit138:setWidth(40);
    obj.edit138:setField("GilFinal");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Job");
    obj.tab5:setName("tab5");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.tab5);
    obj.layout21:setLeft(200);
    obj.layout21:setTop(60);
    obj.layout21:setHeight(300);
    obj.layout21:setWidth(400);
    obj.layout21:setName("layout21");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout21);
    obj.label127:setLeft(000);
    obj.label127:setTop(000);
    obj.label127:setHeight(20);
    obj.label127:setWidth(80);
    obj.label127:setText("Job Skill #1");
    obj.label127:setAutoSize(true);
    obj.label127:setName("label127");

    obj.comboBox19 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout21);
    obj.comboBox19:setLeft(085);
    obj.comboBox19:setTop(000);
    obj.comboBox19:setHeight(20);
    obj.comboBox19:setWidth(130);
    obj.comboBox19:setField("JSTipo1");
    obj.comboBox19:setHorzTextAlign("center");
    obj.comboBox19:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox19:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox19:setName("comboBox19");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout21);
    obj.edit139:setLeft(230);
    obj.edit139:setTop(000);
    obj.edit139:setHeight(20);
    obj.edit139:setWidth(150);
    obj.edit139:setField("JobSkill1");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setName("edit139");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout21);
    obj.label128:setLeft(000);
    obj.label128:setTop(025);
    obj.label128:setHeight(20);
    obj.label128:setWidth(80);
    obj.label128:setText("Job Skill #2");
    obj.label128:setAutoSize(true);
    obj.label128:setName("label128");

    obj.comboBox20 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout21);
    obj.comboBox20:setLeft(085);
    obj.comboBox20:setTop(025);
    obj.comboBox20:setHeight(20);
    obj.comboBox20:setWidth(130);
    obj.comboBox20:setField("JSTipo2");
    obj.comboBox20:setHorzTextAlign("center");
    obj.comboBox20:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox20:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox20:setName("comboBox20");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout21);
    obj.edit140:setLeft(230);
    obj.edit140:setTop(025);
    obj.edit140:setHeight(20);
    obj.edit140:setWidth(150);
    obj.edit140:setField("JobSkill2");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout21);
    obj.label129:setLeft(000);
    obj.label129:setTop(050);
    obj.label129:setHeight(20);
    obj.label129:setWidth(80);
    obj.label129:setText("Job Skill #3");
    obj.label129:setAutoSize(true);
    obj.label129:setName("label129");

    obj.comboBox21 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout21);
    obj.comboBox21:setLeft(085);
    obj.comboBox21:setTop(050);
    obj.comboBox21:setHeight(20);
    obj.comboBox21:setWidth(130);
    obj.comboBox21:setField("JSTipo3");
    obj.comboBox21:setHorzTextAlign("center");
    obj.comboBox21:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox21:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox21:setName("comboBox21");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout21);
    obj.edit141:setLeft(230);
    obj.edit141:setTop(050);
    obj.edit141:setHeight(20);
    obj.edit141:setWidth(150);
    obj.edit141:setField("JobSkill3");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout21);
    obj.label130:setLeft(000);
    obj.label130:setTop(075);
    obj.label130:setHeight(20);
    obj.label130:setWidth(80);
    obj.label130:setText("Job Skill #4");
    obj.label130:setAutoSize(true);
    obj.label130:setName("label130");

    obj.comboBox22 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout21);
    obj.comboBox22:setLeft(085);
    obj.comboBox22:setTop(075);
    obj.comboBox22:setHeight(20);
    obj.comboBox22:setWidth(130);
    obj.comboBox22:setField("JSTipo4");
    obj.comboBox22:setHorzTextAlign("center");
    obj.comboBox22:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox22:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox22:setName("comboBox22");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout21);
    obj.edit142:setLeft(230);
    obj.edit142:setTop(075);
    obj.edit142:setHeight(20);
    obj.edit142:setWidth(150);
    obj.edit142:setField("JobSkill4");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setName("edit142");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout21);
    obj.label131:setLeft(000);
    obj.label131:setTop(100);
    obj.label131:setHeight(20);
    obj.label131:setWidth(80);
    obj.label131:setText("Job Skill #5");
    obj.label131:setAutoSize(true);
    obj.label131:setName("label131");

    obj.comboBox23 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout21);
    obj.comboBox23:setLeft(085);
    obj.comboBox23:setTop(100);
    obj.comboBox23:setHeight(20);
    obj.comboBox23:setWidth(130);
    obj.comboBox23:setField("JSTipo5");
    obj.comboBox23:setHorzTextAlign("center");
    obj.comboBox23:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox23:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox23:setName("comboBox23");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout21);
    obj.edit143:setLeft(230);
    obj.edit143:setTop(100);
    obj.edit143:setHeight(20);
    obj.edit143:setWidth(150);
    obj.edit143:setField("JobSkill5");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout21);
    obj.label132:setLeft(000);
    obj.label132:setTop(125);
    obj.label132:setHeight(20);
    obj.label132:setWidth(80);
    obj.label132:setText("Job Skill #6");
    obj.label132:setAutoSize(true);
    obj.label132:setName("label132");

    obj.comboBox24 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout21);
    obj.comboBox24:setLeft(085);
    obj.comboBox24:setTop(125);
    obj.comboBox24:setHeight(20);
    obj.comboBox24:setWidth(130);
    obj.comboBox24:setField("JSTipo6");
    obj.comboBox24:setHorzTextAlign("center");
    obj.comboBox24:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox24:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox24:setName("comboBox24");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout21);
    obj.edit144:setLeft(230);
    obj.edit144:setTop(125);
    obj.edit144:setHeight(20);
    obj.edit144:setWidth(150);
    obj.edit144:setField("JobSkill6");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout21);
    obj.label133:setLeft(000);
    obj.label133:setTop(150);
    obj.label133:setHeight(20);
    obj.label133:setWidth(80);
    obj.label133:setText("Job Skill #7");
    obj.label133:setAutoSize(true);
    obj.label133:setName("label133");

    obj.comboBox25 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout21);
    obj.comboBox25:setLeft(085);
    obj.comboBox25:setTop(150);
    obj.comboBox25:setHeight(20);
    obj.comboBox25:setWidth(130);
    obj.comboBox25:setField("JSTipo7");
    obj.comboBox25:setHorzTextAlign("center");
    obj.comboBox25:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox25:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox25:setName("comboBox25");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout21);
    obj.edit145:setLeft(230);
    obj.edit145:setTop(150);
    obj.edit145:setHeight(20);
    obj.edit145:setWidth(150);
    obj.edit145:setField("JobSkill7");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setName("edit145");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout21);
    obj.label134:setLeft(000);
    obj.label134:setTop(175);
    obj.label134:setHeight(20);
    obj.label134:setWidth(80);
    obj.label134:setText("Job Skill #8");
    obj.label134:setAutoSize(true);
    obj.label134:setName("label134");

    obj.comboBox26 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout21);
    obj.comboBox26:setLeft(085);
    obj.comboBox26:setTop(175);
    obj.comboBox26:setHeight(20);
    obj.comboBox26:setWidth(130);
    obj.comboBox26:setField("JSTipo8");
    obj.comboBox26:setHorzTextAlign("center");
    obj.comboBox26:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox26:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox26:setName("comboBox26");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout21);
    obj.edit146:setLeft(230);
    obj.edit146:setTop(175);
    obj.edit146:setHeight(20);
    obj.edit146:setWidth(150);
    obj.edit146:setField("JobSkill8");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout21);
    obj.label135:setLeft(000);
    obj.label135:setTop(200);
    obj.label135:setHeight(20);
    obj.label135:setWidth(80);
    obj.label135:setText("Job Skill #9");
    obj.label135:setAutoSize(true);
    obj.label135:setName("label135");

    obj.comboBox27 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout21);
    obj.comboBox27:setLeft(085);
    obj.comboBox27:setTop(200);
    obj.comboBox27:setHeight(20);
    obj.comboBox27:setWidth(130);
    obj.comboBox27:setField("JSTipo9");
    obj.comboBox27:setHorzTextAlign("center");
    obj.comboBox27:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox27:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox27:setName("comboBox27");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout21);
    obj.edit147:setLeft(230);
    obj.edit147:setTop(200);
    obj.edit147:setHeight(20);
    obj.edit147:setWidth(150);
    obj.edit147:setField("JobSkill9");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setName("edit147");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout21);
    obj.label136:setLeft(000);
    obj.label136:setTop(225);
    obj.label136:setHeight(20);
    obj.label136:setWidth(80);
    obj.label136:setText("Job Skill #10");
    obj.label136:setAutoSize(true);
    obj.label136:setName("label136");

    obj.comboBox28 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout21);
    obj.comboBox28:setLeft(085);
    obj.comboBox28:setTop(225);
    obj.comboBox28:setHeight(20);
    obj.comboBox28:setWidth(130);
    obj.comboBox28:setField("JSTipo10");
    obj.comboBox28:setHorzTextAlign("center");
    obj.comboBox28:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox28:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox28:setName("comboBox28");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout21);
    obj.edit148:setLeft(230);
    obj.edit148:setTop(225);
    obj.edit148:setHeight(20);
    obj.edit148:setWidth(150);
    obj.edit148:setField("JobSkill10");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setName("edit148");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout21);
    obj.label137:setLeft(000);
    obj.label137:setTop(250);
    obj.label137:setHeight(20);
    obj.label137:setWidth(80);
    obj.label137:setText("Job Skill #11");
    obj.label137:setAutoSize(true);
    obj.label137:setName("label137");

    obj.comboBox29 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout21);
    obj.comboBox29:setLeft(085);
    obj.comboBox29:setTop(250);
    obj.comboBox29:setHeight(20);
    obj.comboBox29:setWidth(130);
    obj.comboBox29:setField("JSTipo11");
    obj.comboBox29:setHorzTextAlign("center");
    obj.comboBox29:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox29:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox29:setName("comboBox29");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout21);
    obj.edit149:setLeft(230);
    obj.edit149:setTop(250);
    obj.edit149:setHeight(20);
    obj.edit149:setWidth(150);
    obj.edit149:setField("JobSkill11");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout21);
    obj.label138:setLeft(000);
    obj.label138:setTop(275);
    obj.label138:setHeight(20);
    obj.label138:setWidth(80);
    obj.label138:setText("Job Skill #12");
    obj.label138:setAutoSize(true);
    obj.label138:setName("label138");

    obj.comboBox30 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout21);
    obj.comboBox30:setLeft(085);
    obj.comboBox30:setTop(275);
    obj.comboBox30:setHeight(20);
    obj.comboBox30:setWidth(130);
    obj.comboBox30:setField("JSTipo12");
    obj.comboBox30:setHorzTextAlign("center");
    obj.comboBox30:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', ''});
    obj.comboBox30:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox30:setName("comboBox30");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout21);
    obj.edit150:setLeft(230);
    obj.edit150:setTop(275);
    obj.edit150:setHeight(20);
    obj.edit150:setWidth(150);
    obj.edit150:setField("JobSkill9");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.tab5);
    obj.layout22:setLeft(650);
    obj.layout22:setTop(010);
    obj.layout22:setHeight(76);
    obj.layout22:setWidth(475);
    obj.layout22:setName("layout22");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout22);
    obj.label139:setLeft(000);
    obj.label139:setTop(000);
    obj.label139:setHeight(20);
    obj.label139:setWidth(10);
    obj.label139:setText("E");
    obj.label139:setAutoSize(true);
    obj.label139:setName("label139");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout22);
    obj.edit151:setLeft(015);
    obj.edit151:setTop(000);
    obj.edit151:setHeight(20);
    obj.edit151:setWidth(40);
    obj.edit151:setField("ExpFinal");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setName("edit151");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout22);
    obj.label140:setLeft(070);
    obj.label140:setTop(000);
    obj.label140:setHeight(20);
    obj.label140:setWidth(10);
    obj.label140:setText("G");
    obj.label140:setAutoSize(true);
    obj.label140:setName("label140");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout22);
    obj.edit152:setLeft(95);
    obj.edit152:setTop(000);
    obj.edit152:setHeight(20);
    obj.edit152:setWidth(40);
    obj.edit152:setField("GilFinal");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Movement");
    obj.tab6:setName("tab6");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.tab6);
    obj.layout23:setLeft(150);
    obj.layout23:setTop(20);
    obj.layout23:setHeight(310);
    obj.layout23:setWidth(300);
    obj.layout23:setName("layout23");

    obj.checkBox77 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout23);
    obj.checkBox77:setLeft(000);
    obj.checkBox77:setTop(000);
    obj.checkBox77:setHeight(20);
    obj.checkBox77:setWidth(100);
    obj.checkBox77:setText("Move-Burrow");
    obj.checkBox77:setField("maBurrow");
    obj.checkBox77:setHitTest(true);
    obj.checkBox77:setHint("The monster tunnels through the earth, although it may not be capable of attacking until it surfaces. Burrowing monsters ignore all terrain modifiers unless attempting to tunnel through water; in this case, normal modifiers are applied. While burrowing, a monster’s EVA, ARM, and M. ARM values are at +100%");
    obj.checkBox77:setName("checkBox77");

    obj.checkBox78 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout23);
    obj.checkBox78:setLeft(020);
    obj.checkBox78:setTop(025);
    obj.checkBox78:setHeight(20);
    obj.checkBox78:setWidth(100);
    obj.checkBox78:setText("SOS-Lose");
    obj.checkBox78:setField("maBurrowSOSL");
    obj.checkBox78:setName("checkBox78");

    obj.checkBox79 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout23);
    obj.checkBox79:setLeft(020);
    obj.checkBox79:setTop(050);
    obj.checkBox79:setHeight(20);
    obj.checkBox79:setWidth(100);
    obj.checkBox79:setText("SOS-Gain");
    obj.checkBox79:setField("maBurrowSOSG");
    obj.checkBox79:setName("checkBox79");

    obj.checkBox80 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout23);
    obj.checkBox80:setLeft(020);
    obj.checkBox80:setTop(075);
    obj.checkBox80:setHeight(20);
    obj.checkBox80:setWidth(100);
    obj.checkBox80:setText("MP Cost");
    obj.checkBox80:setField("maBurrowMP");
    obj.checkBox80:setName("checkBox80");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout23);
    obj.edit153:setLeft(125);
    obj.edit153:setTop(075);
    obj.edit153:setHeight(20);
    obj.edit153:setWidth(30);
    obj.edit153:setField("maBurrowMPCost");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");

    obj.checkBox81 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout23);
    obj.checkBox81:setLeft(000);
    obj.checkBox81:setTop(100);
    obj.checkBox81:setHeight(20);
    obj.checkBox81:setWidth(100);
    obj.checkBox81:setText("Move-Flight");
    obj.checkBox81:setField("maFlight");
    obj.checkBox81:setHitTest(true);
    obj.checkBox81:setHint("The monster is capable of flying, and is treated as if afflicted with a permanent Flight effect. Unlike the Status Condition of the same name, this Flight may not be dispelled or otherwise removed during the course of the battle, except through the use of effects like the Time Magic Spell Drag.");
    obj.checkBox81:setName("checkBox81");

    obj.checkBox82 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout23);
    obj.checkBox82:setLeft(020);
    obj.checkBox82:setTop(125);
    obj.checkBox82:setHeight(20);
    obj.checkBox82:setWidth(100);
    obj.checkBox82:setText("SOS-Lose");
    obj.checkBox82:setField("maFlightSOSL");
    obj.checkBox82:setName("checkBox82");

    obj.checkBox83 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout23);
    obj.checkBox83:setLeft(020);
    obj.checkBox83:setTop(150);
    obj.checkBox83:setHeight(20);
    obj.checkBox83:setWidth(100);
    obj.checkBox83:setText("SOS-Gain");
    obj.checkBox83:setField("maFlightSOSG");
    obj.checkBox83:setName("checkBox83");

    obj.checkBox84 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout23);
    obj.checkBox84:setLeft(020);
    obj.checkBox84:setTop(175);
    obj.checkBox84:setHeight(20);
    obj.checkBox84:setWidth(100);
    obj.checkBox84:setText("MP Cost");
    obj.checkBox84:setField("maFlightMP");
    obj.checkBox84:setName("checkBox84");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout23);
    obj.edit154:setLeft(125);
    obj.edit154:setTop(175);
    obj.edit154:setHeight(20);
    obj.edit154:setWidth(30);
    obj.edit154:setField("maFlightMPCost");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setName("edit154");

    obj.checkBox85 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout23);
    obj.checkBox85:setLeft(000);
    obj.checkBox85:setTop(200);
    obj.checkBox85:setHeight(20);
    obj.checkBox85:setWidth(100);
    obj.checkBox85:setText("Move-Ground");
    obj.checkBox85:setField("maGround");
    obj.checkBox85:setHitTest(true);
    obj.checkBox85:setHint("The monster has the ability to move on land. Standard Movement Ability for most monsters.");
    obj.checkBox85:setName("checkBox85");

    obj.checkBox86 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout23);
    obj.checkBox86:setLeft(020);
    obj.checkBox86:setTop(225);
    obj.checkBox86:setHeight(20);
    obj.checkBox86:setWidth(100);
    obj.checkBox86:setText("SOS-Lose");
    obj.checkBox86:setField("maGroundSOSL");
    obj.checkBox86:setName("checkBox86");

    obj.checkBox87 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout23);
    obj.checkBox87:setLeft(020);
    obj.checkBox87:setTop(250);
    obj.checkBox87:setHeight(20);
    obj.checkBox87:setWidth(100);
    obj.checkBox87:setText("SOS-Gain");
    obj.checkBox87:setField("maGroundSOSG");
    obj.checkBox87:setName("checkBox87");

    obj.checkBox88 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout23);
    obj.checkBox88:setLeft(020);
    obj.checkBox88:setTop(275);
    obj.checkBox88:setHeight(20);
    obj.checkBox88:setWidth(100);
    obj.checkBox88:setText("MP Cost");
    obj.checkBox88:setField("maGroundMP");
    obj.checkBox88:setName("checkBox88");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout23);
    obj.edit155:setLeft(125);
    obj.edit155:setTop(275);
    obj.edit155:setHeight(20);
    obj.edit155:setWidth(30);
    obj.edit155:setField("valLV");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setName("edit155");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.tab6);
    obj.layout24:setLeft(450);
    obj.layout24:setTop(20);
    obj.layout24:setHeight(430);
    obj.layout24:setWidth(300);
    obj.layout24:setName("layout24");

    obj.checkBox89 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout24);
    obj.checkBox89:setLeft(000);
    obj.checkBox89:setTop(000);
    obj.checkBox89:setHeight(20);
    obj.checkBox89:setWidth(100);
    obj.checkBox89:setText("Move-Float");
    obj.checkBox89:setField("maFloat");
    obj.checkBox89:setHitTest(true);
    obj.checkBox89:setHint("The monster levitates, hovering up to one meter off the ground as if afflicted with a permanent Float effect. Unlike the Status Condition of the same name, this Float may not be dispelled or otherwise removed during the course of the battle, except through the use of effects like the Time Magic Spell Drag");
    obj.checkBox89:setName("checkBox89");

    obj.checkBox90 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout24);
    obj.checkBox90:setLeft(020);
    obj.checkBox90:setTop(025);
    obj.checkBox90:setHeight(20);
    obj.checkBox90:setWidth(100);
    obj.checkBox90:setText("SOS-Lose");
    obj.checkBox90:setField("maFloatSOSL");
    obj.checkBox90:setName("checkBox90");

    obj.checkBox91 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout24);
    obj.checkBox91:setLeft(020);
    obj.checkBox91:setTop(050);
    obj.checkBox91:setHeight(20);
    obj.checkBox91:setWidth(100);
    obj.checkBox91:setText("SOS-Gain");
    obj.checkBox91:setField("maFloatSOSG");
    obj.checkBox91:setName("checkBox91");

    obj.checkBox92 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout24);
    obj.checkBox92:setLeft(020);
    obj.checkBox92:setTop(075);
    obj.checkBox92:setHeight(20);
    obj.checkBox92:setWidth(100);
    obj.checkBox92:setText("MP Cost");
    obj.checkBox92:setField("maFloatMP");
    obj.checkBox92:setName("checkBox92");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout24);
    obj.edit156:setLeft(125);
    obj.edit156:setTop(075);
    obj.edit156:setHeight(20);
    obj.edit156:setWidth(30);
    obj.edit156:setField("maFloatMPCost");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.checkBox93 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout24);
    obj.checkBox93:setLeft(000);
    obj.checkBox93:setTop(100);
    obj.checkBox93:setHeight(20);
    obj.checkBox93:setWidth(100);
    obj.checkBox93:setText("Move-Teleport");
    obj.checkBox93:setField("maTeleport");
    obj.checkBox93:setHitTest(true);
    obj.checkBox93:setHint("The monster is capable of displacing itself through space, moving from one location to the next in the blink of an eye. While this has no effect on a monster's movement range, it does confer two important advantages. \n Firstly, if the monster is targeted by a Singletarget Slow Action and teleports before it goes off, the Action has no effect – the monster is assumed to have relocated far enough away to avoid any ill effects. Secondly, the monster's SPD Rating is doubled when the players roll to Escape, making it significantly harder to run from. As it is a natural ability rather than a Spell, Move-Teleport cannot be sealed through the use of Status Conditions");
    obj.checkBox93:setName("checkBox93");

    obj.checkBox94 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout24);
    obj.checkBox94:setLeft(020);
    obj.checkBox94:setTop(125);
    obj.checkBox94:setHeight(20);
    obj.checkBox94:setWidth(100);
    obj.checkBox94:setText("SOS-Lose");
    obj.checkBox94:setField("maTeleportSOSL");
    obj.checkBox94:setName("checkBox94");

    obj.checkBox95 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout24);
    obj.checkBox95:setLeft(020);
    obj.checkBox95:setTop(150);
    obj.checkBox95:setHeight(20);
    obj.checkBox95:setWidth(100);
    obj.checkBox95:setText("SOS-Gain");
    obj.checkBox95:setField("maTeleportSOSG");
    obj.checkBox95:setName("checkBox95");

    obj.checkBox96 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout24);
    obj.checkBox96:setLeft(020);
    obj.checkBox96:setTop(175);
    obj.checkBox96:setHeight(20);
    obj.checkBox96:setWidth(100);
    obj.checkBox96:setText("MP Cost");
    obj.checkBox96:setField("maTeleportMP");
    obj.checkBox96:setName("checkBox96");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout24);
    obj.edit157:setLeft(125);
    obj.edit157:setTop(175);
    obj.edit157:setHeight(20);
    obj.edit157:setWidth(30);
    obj.edit157:setField("maTeleportMPCost");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setName("edit157");

    obj.checkBox97 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout24);
    obj.checkBox97:setLeft(000);
    obj.checkBox97:setTop(200);
    obj.checkBox97:setHeight(20);
    obj.checkBox97:setWidth(100);
    obj.checkBox97:setText("Move-Water");
    obj.checkBox97:setField("maWater");
    obj.checkBox97:setHitTest(true);
    obj.checkBox97:setHint("The monster has the ability to move on land. Standard Movement Ability for most monsters.");
    obj.checkBox97:setName("checkBox97");

    obj.checkBox98 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout24);
    obj.checkBox98:setLeft(020);
    obj.checkBox98:setTop(225);
    obj.checkBox98:setHeight(20);
    obj.checkBox98:setWidth(100);
    obj.checkBox98:setText("SOS-Lose");
    obj.checkBox98:setField("maWaterSOSL");
    obj.checkBox98:setName("checkBox98");

    obj.checkBox99 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout24);
    obj.checkBox99:setLeft(020);
    obj.checkBox99:setTop(250);
    obj.checkBox99:setHeight(20);
    obj.checkBox99:setWidth(100);
    obj.checkBox99:setText("SOS-Gain");
    obj.checkBox99:setField("maWaterSOSG");
    obj.checkBox99:setName("checkBox99");

    obj.checkBox100 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout24);
    obj.checkBox100:setLeft(020);
    obj.checkBox100:setTop(275);
    obj.checkBox100:setHeight(20);
    obj.checkBox100:setWidth(100);
    obj.checkBox100:setText("MP Cost");
    obj.checkBox100:setField("maWaterMP");
    obj.checkBox100:setName("checkBox100");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout24);
    obj.edit158:setLeft(125);
    obj.edit158:setTop(275);
    obj.edit158:setHeight(20);
    obj.edit158:setWidth(30);
    obj.edit158:setField("valLV");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setName("edit158");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.tab6);
    obj.layout25:setLeft(650);
    obj.layout25:setTop(010);
    obj.layout25:setHeight(76);
    obj.layout25:setWidth(475);
    obj.layout25:setName("layout25");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout25);
    obj.label141:setLeft(000);
    obj.label141:setTop(000);
    obj.label141:setHeight(20);
    obj.label141:setWidth(10);
    obj.label141:setText("E");
    obj.label141:setAutoSize(true);
    obj.label141:setName("label141");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout25);
    obj.edit159:setLeft(015);
    obj.edit159:setTop(000);
    obj.edit159:setHeight(20);
    obj.edit159:setWidth(40);
    obj.edit159:setField("ExpFinal");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setName("edit159");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout25);
    obj.label142:setLeft(070);
    obj.label142:setTop(000);
    obj.label142:setHeight(20);
    obj.label142:setWidth(10);
    obj.label142:setText("G");
    obj.label142:setAutoSize(true);
    obj.label142:setName("label142");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout25);
    obj.edit160:setLeft(95);
    obj.edit160:setTop(000);
    obj.edit160:setHeight(20);
    obj.edit160:setWidth(40);
    obj.edit160:setField("GilFinal");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setName("edit160");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Sup. 1");
    obj.tab7:setName("tab7");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.tab7);
    obj.layout26:setLeft(10);
    obj.layout26:setTop(10);
    obj.layout26:setHeight(326);
    obj.layout26:setWidth(380);
    obj.layout26:setName("layout26");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout26);
    obj.rectangle2:setLeft(000);
    obj.rectangle2:setTop(000);
    obj.rectangle2:setWidth(380);
    obj.rectangle2:setHeight(326);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(5);
    obj.rectangle2:setName("rectangle2");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout26);
    obj.label143:setLeft(000);
    obj.label143:setTop(000);
    obj.label143:setHeight(20);
    obj.label143:setWidth(100);
    obj.label143:setText("Auto-Status");
    obj.label143:setAutoSize(true);
    obj.label143:setHitTest(true);
    obj.label143:setHint("The monster is permanently under the effects of a certain Status Condition, and begins the battle with that Condition active. \n This Condition can be removed through the use of Spells or Abilities such as Dispel; but will be re-added during the next Status Phase and only fully cancelled once the monster is defeated. \n Auto-Status can be taken in conjunction with both positive and negative Status Conditions. XP and Gil values depend on the exact Status being taken:");
    obj.label143:setName("label143");

    obj.checkBox101 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout26);
    obj.checkBox101:setLeft(000);
    obj.checkBox101:setTop(025);
    obj.checkBox101:setHeight(20);
    obj.checkBox101:setWidth(110);
    obj.checkBox101:setText("Float");
    obj.checkBox101:setField("autoFloat");
    obj.checkBox101:setName("checkBox101");

    obj.checkBox102 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout26);
    obj.checkBox102:setLeft(115);
    obj.checkBox102:setTop(025);
    obj.checkBox102:setHeight(20);
    obj.checkBox102:setWidth(110);
    obj.checkBox102:setText("Agility Up");
    obj.checkBox102:setField("autoAgiUP");
    obj.checkBox102:setName("checkBox102");

    obj.checkBox103 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout26);
    obj.checkBox103:setLeft(240);
    obj.checkBox103:setTop(025);
    obj.checkBox103:setHeight(20);
    obj.checkBox103:setWidth(110);
    obj.checkBox103:setText("Spirit Up");
    obj.checkBox103:setField("autoSpiUP");
    obj.checkBox103:setName("checkBox103");

    obj.checkBox104 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout26);
    obj.checkBox104:setLeft(000);
    obj.checkBox104:setTop(050);
    obj.checkBox104:setHeight(20);
    obj.checkBox104:setWidth(110);
    obj.checkBox104:setText("Earth Spikes");
    obj.checkBox104:setField("autoGNDSpikes");
    obj.checkBox104:setName("checkBox104");

    obj.checkBox105 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout26);
    obj.checkBox105:setLeft(115);
    obj.checkBox105:setTop(050);
    obj.checkBox105:setHeight(20);
    obj.checkBox105:setWidth(110);
    obj.checkBox105:setText("Fire Spikes");
    obj.checkBox105:setField("autoFIRSpikes");
    obj.checkBox105:setName("checkBox105");

    obj.checkBox106 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout26);
    obj.checkBox106:setLeft(240);
    obj.checkBox106:setTop(050);
    obj.checkBox106:setHeight(20);
    obj.checkBox106:setWidth(110);
    obj.checkBox106:setText("Water Spikes");
    obj.checkBox106:setField("autoWATSpikes");
    obj.checkBox106:setName("checkBox106");

    obj.checkBox107 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout26);
    obj.checkBox107:setLeft(000);
    obj.checkBox107:setTop(075);
    obj.checkBox107:setHeight(20);
    obj.checkBox107:setWidth(110);
    obj.checkBox107:setText("Wind Spikes");
    obj.checkBox107:setField("autoWINSpikes");
    obj.checkBox107:setName("checkBox107");

    obj.checkBox108 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout26);
    obj.checkBox108:setLeft(115);
    obj.checkBox108:setTop(075);
    obj.checkBox108:setHeight(20);
    obj.checkBox108:setWidth(110);
    obj.checkBox108:setText("Ice Spikes");
    obj.checkBox108:setField("autoICESpikes");
    obj.checkBox108:setName("checkBox108");

    obj.checkBox109 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout26);
    obj.checkBox109:setLeft(240);
    obj.checkBox109:setTop(075);
    obj.checkBox109:setHeight(20);
    obj.checkBox109:setWidth(110);
    obj.checkBox109:setText("Lightning Spikes");
    obj.checkBox109:setField("autoELESpikes");
    obj.checkBox109:setName("checkBox109");

    obj.checkBox110 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout26);
    obj.checkBox110:setLeft(000);
    obj.checkBox110:setTop(100);
    obj.checkBox110:setHeight(20);
    obj.checkBox110:setWidth(110);
    obj.checkBox110:setText("Holy Spikes");
    obj.checkBox110:setField("autoHOLSpikes");
    obj.checkBox110:setName("checkBox110");

    obj.checkBox111 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout26);
    obj.checkBox111:setLeft(115);
    obj.checkBox111:setTop(100);
    obj.checkBox111:setHeight(20);
    obj.checkBox111:setWidth(110);
    obj.checkBox111:setText("Shadow Spikes");
    obj.checkBox111:setField("autoSHASpikes");
    obj.checkBox111:setName("checkBox111");

    obj.checkBox112 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.layout26);
    obj.checkBox112:setLeft(240);
    obj.checkBox112:setTop(100);
    obj.checkBox112:setHeight(20);
    obj.checkBox112:setWidth(110);
    obj.checkBox112:setText("Protect");
    obj.checkBox112:setField("autoProtect");
    obj.checkBox112:setName("checkBox112");

    obj.checkBox113 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.layout26);
    obj.checkBox113:setLeft(000);
    obj.checkBox113:setTop(125);
    obj.checkBox113:setHeight(20);
    obj.checkBox113:setWidth(110);
    obj.checkBox113:setText("Shell");
    obj.checkBox113:setField("autoShell");
    obj.checkBox113:setName("checkBox113");

    obj.checkBox114 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.layout26);
    obj.checkBox114:setLeft(115);
    obj.checkBox114:setTop(125);
    obj.checkBox114:setHeight(20);
    obj.checkBox114:setWidth(110);
    obj.checkBox114:setText("Armor Up");
    obj.checkBox114:setField("autoARMUP");
    obj.checkBox114:setName("checkBox114");

    obj.checkBox115 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.layout26);
    obj.checkBox115:setLeft(240);
    obj.checkBox115:setTop(125);
    obj.checkBox115:setHeight(20);
    obj.checkBox115:setWidth(110);
    obj.checkBox115:setText("Mental Up");
    obj.checkBox115:setField("autoMENUP");
    obj.checkBox115:setName("checkBox115");

    obj.checkBox116 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.layout26);
    obj.checkBox116:setLeft(000);
    obj.checkBox116:setTop(150);
    obj.checkBox116:setHeight(20);
    obj.checkBox116:setWidth(110);
    obj.checkBox116:setText("Haste");
    obj.checkBox116:setField("autoHaste");
    obj.checkBox116:setName("checkBox116");

    obj.checkBox117 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.layout26);
    obj.checkBox117:setLeft(115);
    obj.checkBox117:setTop(150);
    obj.checkBox117:setHeight(20);
    obj.checkBox117:setWidth(110);
    obj.checkBox117:setText("Reflect");
    obj.checkBox117:setField("autoReflect");
    obj.checkBox117:setName("checkBox117");

    obj.checkBox118 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.layout26);
    obj.checkBox118:setLeft(240);
    obj.checkBox118:setTop(150);
    obj.checkBox118:setHeight(20);
    obj.checkBox118:setWidth(110);
    obj.checkBox118:setText("Power Up");
    obj.checkBox118:setField("autoPOWUP");
    obj.checkBox118:setName("checkBox118");

    obj.checkBox119 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.layout26);
    obj.checkBox119:setLeft(000);
    obj.checkBox119:setTop(175);
    obj.checkBox119:setHeight(20);
    obj.checkBox119:setWidth(110);
    obj.checkBox119:setText("Magic Up");
    obj.checkBox119:setField("autoMAGUP");
    obj.checkBox119:setName("checkBox119");

    obj.checkBox120 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.layout26);
    obj.checkBox120:setLeft(115);
    obj.checkBox120:setTop(175);
    obj.checkBox120:setHeight(20);
    obj.checkBox120:setWidth(110);
    obj.checkBox120:setText("Regen");
    obj.checkBox120:setField("autoRegen");
    obj.checkBox120:setName("checkBox120");

    obj.checkBox121 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.layout26);
    obj.checkBox121:setLeft(240);
    obj.checkBox121:setTop(175);
    obj.checkBox121:setHeight(20);
    obj.checkBox121:setWidth(110);
    obj.checkBox121:setText("Aura");
    obj.checkBox121:setField("autoAura");
    obj.checkBox121:setName("checkBox121");

    obj.checkBox122 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.layout26);
    obj.checkBox122:setLeft(000);
    obj.checkBox122:setTop(200);
    obj.checkBox122:setHeight(20);
    obj.checkBox122:setWidth(110);
    obj.checkBox122:setText("Vanish");
    obj.checkBox122:setField("autoVanish");
    obj.checkBox122:setName("checkBox122");

    obj.checkBox123 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.layout26);
    obj.checkBox123:setLeft(115);
    obj.checkBox123:setTop(200);
    obj.checkBox123:setHeight(20);
    obj.checkBox123:setWidth(110);
    obj.checkBox123:setText("Berserk");
    obj.checkBox123:setField("autoBerserk");
    obj.checkBox123:setName("checkBox123");

    obj.checkBox124 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.layout26);
    obj.checkBox124:setLeft(240);
    obj.checkBox124:setTop(200);
    obj.checkBox124:setHeight(20);
    obj.checkBox124:setWidth(110);
    obj.checkBox124:setText("Blind");
    obj.checkBox124:setField("autoBlind");
    obj.checkBox124:setName("checkBox124");

    obj.checkBox125 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.layout26);
    obj.checkBox125:setLeft(000);
    obj.checkBox125:setTop(225);
    obj.checkBox125:setHeight(20);
    obj.checkBox125:setWidth(110);
    obj.checkBox125:setText("Poison");
    obj.checkBox125:setField("autoPoison");
    obj.checkBox125:setName("checkBox125");

    obj.checkBox126 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox126:setParent(obj.layout26);
    obj.checkBox126:setLeft(115);
    obj.checkBox126:setTop(225);
    obj.checkBox126:setHeight(20);
    obj.checkBox126:setWidth(110);
    obj.checkBox126:setText("Sleep");
    obj.checkBox126:setField("autoSleep");
    obj.checkBox126:setName("checkBox126");

    obj.checkBox127 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox127:setParent(obj.layout26);
    obj.checkBox127:setLeft(240);
    obj.checkBox127:setTop(225);
    obj.checkBox127:setHeight(20);
    obj.checkBox127:setWidth(110);
    obj.checkBox127:setText("Slow");
    obj.checkBox127:setField("autoSlow");
    obj.checkBox127:setName("checkBox127");

    obj.checkBox128 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox128:setParent(obj.layout26);
    obj.checkBox128:setLeft(000);
    obj.checkBox128:setTop(250);
    obj.checkBox128:setHeight(20);
    obj.checkBox128:setWidth(110);
    obj.checkBox128:setText("Zombie");
    obj.checkBox128:setField("autoZombie");
    obj.checkBox128:setName("checkBox128");

    obj.checkBox129 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox129:setParent(obj.layout26);
    obj.checkBox129:setLeft(115);
    obj.checkBox129:setTop(250);
    obj.checkBox129:setHeight(20);
    obj.checkBox129:setWidth(110);
    obj.checkBox129:setText("Confuse");
    obj.checkBox129:setField("autoConfuse");
    obj.checkBox129:setName("checkBox129");

    obj.checkBox130 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox130:setParent(obj.layout26);
    obj.checkBox130:setLeft(240);
    obj.checkBox130:setTop(250);
    obj.checkBox130:setHeight(20);
    obj.checkBox130:setWidth(110);
    obj.checkBox130:setText("Sap");
    obj.checkBox130:setField("autoSap");
    obj.checkBox130:setName("checkBox130");

    obj.checkBox131 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox131:setParent(obj.layout26);
    obj.checkBox131:setLeft(000);
    obj.checkBox131:setTop(275);
    obj.checkBox131:setHeight(20);
    obj.checkBox131:setWidth(110);
    obj.checkBox131:setText("Unaware");
    obj.checkBox131:setField("autoUnaware");
    obj.checkBox131:setName("checkBox131");

    obj.checkBox132 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox132:setParent(obj.layout26);
    obj.checkBox132:setLeft(115);
    obj.checkBox132:setTop(275);
    obj.checkBox132:setHeight(20);
    obj.checkBox132:setWidth(110);
    obj.checkBox132:setText("Mini");
    obj.checkBox132:setField("autoMini");
    obj.checkBox132:setName("checkBox132");

    obj.checkBox133 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox133:setParent(obj.layout26);
    obj.checkBox133:setLeft(240);
    obj.checkBox133:setTop(275);
    obj.checkBox133:setHeight(20);
    obj.checkBox133:setWidth(110);
    obj.checkBox133:setText("Toad");
    obj.checkBox133:setField("autoToad");
    obj.checkBox133:setName("checkBox133");

    obj.checkBox134 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox134:setParent(obj.layout26);
    obj.checkBox134:setLeft(000);
    obj.checkBox134:setTop(300);
    obj.checkBox134:setHeight(20);
    obj.checkBox134:setWidth(110);
    obj.checkBox134:setText("Venom");
    obj.checkBox134:setField("autoVenom");
    obj.checkBox134:setName("checkBox134");

    obj.checkBox135 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox135:setParent(obj.layout26);
    obj.checkBox135:setLeft(115);
    obj.checkBox135:setTop(300);
    obj.checkBox135:setHeight(20);
    obj.checkBox135:setWidth(110);
    obj.checkBox135:setText("Condemn");
    obj.checkBox135:setField("autoCondemn");
    obj.checkBox135:setName("checkBox135");

    obj.checkBox136 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox136:setParent(obj.layout26);
    obj.checkBox136:setLeft(240);
    obj.checkBox136:setTop(300);
    obj.checkBox136:setHeight(20);
    obj.checkBox136:setWidth(110);
    obj.checkBox136:setText("Petrify");
    obj.checkBox136:setField("autoPetrify");
    obj.checkBox136:setName("checkBox136");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.tab7);
    obj.layout27:setLeft(400);
    obj.layout27:setTop(10);
    obj.layout27:setHeight(326);
    obj.layout27:setWidth(380);
    obj.layout27:setName("layout27");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout27);
    obj.rectangle3:setLeft(000);
    obj.rectangle3:setTop(000);
    obj.rectangle3:setWidth(380);
    obj.rectangle3:setHeight(326);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(5);
    obj.rectangle3:setName("rectangle3");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout27);
    obj.label144:setLeft(000);
    obj.label144:setTop(000);
    obj.label144:setHeight(20);
    obj.label144:setWidth(100);
    obj.label144:setText("SOS-Status");
    obj.label144:setAutoSize(true);
    obj.label144:setHitTest(true);
    obj.label144:setHint(" The monster is subject to a certain Status Condition, activated when its current Hit Points reach 25% of their maximum value. \n As with Auto-Status, a Status Condition inflicted by SOS-Status can be removed through the use of Spells or Abilities such as Dispel; \n but will be re-added during the next Status Phase and only fully cancelled once the monster is defeated. Should the monster be healed to above 25% of its maximum Hit Points, the Condition will cancel automatically. \n SOS-Status can be taken in conjunction with both positive and negative Status Conditions. XP and Gil values depend on the exact Status being taken:");
    obj.label144:setName("label144");

    obj.checkBox137 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox137:setParent(obj.layout27);
    obj.checkBox137:setLeft(000);
    obj.checkBox137:setTop(025);
    obj.checkBox137:setHeight(20);
    obj.checkBox137:setWidth(110);
    obj.checkBox137:setText("Float");
    obj.checkBox137:setField("sosFloat");
    obj.checkBox137:setName("checkBox137");

    obj.checkBox138 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox138:setParent(obj.layout27);
    obj.checkBox138:setLeft(115);
    obj.checkBox138:setTop(025);
    obj.checkBox138:setHeight(20);
    obj.checkBox138:setWidth(110);
    obj.checkBox138:setText("Agility Up");
    obj.checkBox138:setField("sosAgiUP");
    obj.checkBox138:setName("checkBox138");

    obj.checkBox139 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.layout27);
    obj.checkBox139:setLeft(240);
    obj.checkBox139:setTop(025);
    obj.checkBox139:setHeight(20);
    obj.checkBox139:setWidth(110);
    obj.checkBox139:setText("Spirit Up");
    obj.checkBox139:setField("sosSpiUP");
    obj.checkBox139:setName("checkBox139");

    obj.checkBox140 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.layout27);
    obj.checkBox140:setLeft(000);
    obj.checkBox140:setTop(050);
    obj.checkBox140:setHeight(20);
    obj.checkBox140:setWidth(110);
    obj.checkBox140:setText("Earth Spikes");
    obj.checkBox140:setField("sosGNDSpikes");
    obj.checkBox140:setName("checkBox140");

    obj.checkBox141 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.layout27);
    obj.checkBox141:setLeft(115);
    obj.checkBox141:setTop(050);
    obj.checkBox141:setHeight(20);
    obj.checkBox141:setWidth(110);
    obj.checkBox141:setText("Fire Spikes");
    obj.checkBox141:setField("sosFIRSpikes");
    obj.checkBox141:setName("checkBox141");

    obj.checkBox142 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox142:setParent(obj.layout27);
    obj.checkBox142:setLeft(240);
    obj.checkBox142:setTop(050);
    obj.checkBox142:setHeight(20);
    obj.checkBox142:setWidth(110);
    obj.checkBox142:setText("Water Spikes");
    obj.checkBox142:setField("sosWATSpikes");
    obj.checkBox142:setName("checkBox142");

    obj.checkBox143 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox143:setParent(obj.layout27);
    obj.checkBox143:setLeft(000);
    obj.checkBox143:setTop(075);
    obj.checkBox143:setHeight(20);
    obj.checkBox143:setWidth(110);
    obj.checkBox143:setText("Wind Spikes");
    obj.checkBox143:setField("sosWINSpikes");
    obj.checkBox143:setName("checkBox143");

    obj.checkBox144 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox144:setParent(obj.layout27);
    obj.checkBox144:setLeft(115);
    obj.checkBox144:setTop(075);
    obj.checkBox144:setHeight(20);
    obj.checkBox144:setWidth(110);
    obj.checkBox144:setText("Ice Spikes");
    obj.checkBox144:setField("sosICESpikes");
    obj.checkBox144:setName("checkBox144");

    obj.checkBox145 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox145:setParent(obj.layout27);
    obj.checkBox145:setLeft(240);
    obj.checkBox145:setTop(075);
    obj.checkBox145:setHeight(20);
    obj.checkBox145:setWidth(110);
    obj.checkBox145:setText("Lightning Spikes");
    obj.checkBox145:setField("sosELESpikes");
    obj.checkBox145:setName("checkBox145");

    obj.checkBox146 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox146:setParent(obj.layout27);
    obj.checkBox146:setLeft(000);
    obj.checkBox146:setTop(100);
    obj.checkBox146:setHeight(20);
    obj.checkBox146:setWidth(110);
    obj.checkBox146:setText("Holy Spikes");
    obj.checkBox146:setField("sosHOLSpikes");
    obj.checkBox146:setName("checkBox146");

    obj.checkBox147 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox147:setParent(obj.layout27);
    obj.checkBox147:setLeft(115);
    obj.checkBox147:setTop(100);
    obj.checkBox147:setHeight(20);
    obj.checkBox147:setWidth(110);
    obj.checkBox147:setText("Shadow Spikes");
    obj.checkBox147:setField("sosSHASpikes");
    obj.checkBox147:setName("checkBox147");

    obj.checkBox148 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox148:setParent(obj.layout27);
    obj.checkBox148:setLeft(240);
    obj.checkBox148:setTop(100);
    obj.checkBox148:setHeight(20);
    obj.checkBox148:setWidth(110);
    obj.checkBox148:setText("Protect");
    obj.checkBox148:setField("sosProtect");
    obj.checkBox148:setName("checkBox148");

    obj.checkBox149 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox149:setParent(obj.layout27);
    obj.checkBox149:setLeft(000);
    obj.checkBox149:setTop(125);
    obj.checkBox149:setHeight(20);
    obj.checkBox149:setWidth(110);
    obj.checkBox149:setText("Shell");
    obj.checkBox149:setField("sosShell");
    obj.checkBox149:setName("checkBox149");

    obj.checkBox150 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox150:setParent(obj.layout27);
    obj.checkBox150:setLeft(115);
    obj.checkBox150:setTop(125);
    obj.checkBox150:setHeight(20);
    obj.checkBox150:setWidth(110);
    obj.checkBox150:setText("Armor Up");
    obj.checkBox150:setField("sosARMUP");
    obj.checkBox150:setName("checkBox150");

    obj.checkBox151 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox151:setParent(obj.layout27);
    obj.checkBox151:setLeft(240);
    obj.checkBox151:setTop(125);
    obj.checkBox151:setHeight(20);
    obj.checkBox151:setWidth(110);
    obj.checkBox151:setText("Mental Up");
    obj.checkBox151:setField("sosMENUP");
    obj.checkBox151:setName("checkBox151");

    obj.checkBox152 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox152:setParent(obj.layout27);
    obj.checkBox152:setLeft(000);
    obj.checkBox152:setTop(150);
    obj.checkBox152:setHeight(20);
    obj.checkBox152:setWidth(110);
    obj.checkBox152:setText("Haste");
    obj.checkBox152:setField("sosHaste");
    obj.checkBox152:setName("checkBox152");

    obj.checkBox153 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox153:setParent(obj.layout27);
    obj.checkBox153:setLeft(115);
    obj.checkBox153:setTop(150);
    obj.checkBox153:setHeight(20);
    obj.checkBox153:setWidth(110);
    obj.checkBox153:setText("Reflect");
    obj.checkBox153:setField("sosReflect");
    obj.checkBox153:setName("checkBox153");

    obj.checkBox154 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox154:setParent(obj.layout27);
    obj.checkBox154:setLeft(240);
    obj.checkBox154:setTop(150);
    obj.checkBox154:setHeight(20);
    obj.checkBox154:setWidth(110);
    obj.checkBox154:setText("Power Up");
    obj.checkBox154:setField("sosPOWUP");
    obj.checkBox154:setName("checkBox154");

    obj.checkBox155 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox155:setParent(obj.layout27);
    obj.checkBox155:setLeft(000);
    obj.checkBox155:setTop(175);
    obj.checkBox155:setHeight(20);
    obj.checkBox155:setWidth(110);
    obj.checkBox155:setText("Magic Up");
    obj.checkBox155:setField("sosMAGUP");
    obj.checkBox155:setName("checkBox155");

    obj.checkBox156 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox156:setParent(obj.layout27);
    obj.checkBox156:setLeft(115);
    obj.checkBox156:setTop(175);
    obj.checkBox156:setHeight(20);
    obj.checkBox156:setWidth(110);
    obj.checkBox156:setText("Regen");
    obj.checkBox156:setField("sosRegen");
    obj.checkBox156:setName("checkBox156");

    obj.checkBox157 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox157:setParent(obj.layout27);
    obj.checkBox157:setLeft(240);
    obj.checkBox157:setTop(175);
    obj.checkBox157:setHeight(20);
    obj.checkBox157:setWidth(110);
    obj.checkBox157:setText("Aura");
    obj.checkBox157:setField("sosAura");
    obj.checkBox157:setName("checkBox157");

    obj.checkBox158 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox158:setParent(obj.layout27);
    obj.checkBox158:setLeft(000);
    obj.checkBox158:setTop(200);
    obj.checkBox158:setHeight(20);
    obj.checkBox158:setWidth(110);
    obj.checkBox158:setText("Vanish");
    obj.checkBox158:setField("sosVanish");
    obj.checkBox158:setName("checkBox158");

    obj.checkBox159 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox159:setParent(obj.layout27);
    obj.checkBox159:setLeft(115);
    obj.checkBox159:setTop(200);
    obj.checkBox159:setHeight(20);
    obj.checkBox159:setWidth(110);
    obj.checkBox159:setText("Berserk");
    obj.checkBox159:setField("sosBerserk");
    obj.checkBox159:setName("checkBox159");

    obj.checkBox160 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox160:setParent(obj.layout27);
    obj.checkBox160:setLeft(240);
    obj.checkBox160:setTop(200);
    obj.checkBox160:setHeight(20);
    obj.checkBox160:setWidth(110);
    obj.checkBox160:setText("Blind");
    obj.checkBox160:setField("sosBlind");
    obj.checkBox160:setName("checkBox160");

    obj.checkBox161 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox161:setParent(obj.layout27);
    obj.checkBox161:setLeft(000);
    obj.checkBox161:setTop(225);
    obj.checkBox161:setHeight(20);
    obj.checkBox161:setWidth(110);
    obj.checkBox161:setText("Poison");
    obj.checkBox161:setField("sosPoison");
    obj.checkBox161:setName("checkBox161");

    obj.checkBox162 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox162:setParent(obj.layout27);
    obj.checkBox162:setLeft(115);
    obj.checkBox162:setTop(225);
    obj.checkBox162:setHeight(20);
    obj.checkBox162:setWidth(110);
    obj.checkBox162:setText("Sleep");
    obj.checkBox162:setField("sosSleep");
    obj.checkBox162:setName("checkBox162");

    obj.checkBox163 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox163:setParent(obj.layout27);
    obj.checkBox163:setLeft(240);
    obj.checkBox163:setTop(225);
    obj.checkBox163:setHeight(20);
    obj.checkBox163:setWidth(110);
    obj.checkBox163:setText("Slow");
    obj.checkBox163:setField("sosSlow");
    obj.checkBox163:setName("checkBox163");

    obj.checkBox164 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox164:setParent(obj.layout27);
    obj.checkBox164:setLeft(000);
    obj.checkBox164:setTop(250);
    obj.checkBox164:setHeight(20);
    obj.checkBox164:setWidth(110);
    obj.checkBox164:setText("Zombie");
    obj.checkBox164:setField("sosZombie");
    obj.checkBox164:setName("checkBox164");

    obj.checkBox165 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox165:setParent(obj.layout27);
    obj.checkBox165:setLeft(115);
    obj.checkBox165:setTop(250);
    obj.checkBox165:setHeight(20);
    obj.checkBox165:setWidth(110);
    obj.checkBox165:setText("Confuse");
    obj.checkBox165:setField("sosConfuse");
    obj.checkBox165:setName("checkBox165");

    obj.checkBox166 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox166:setParent(obj.layout27);
    obj.checkBox166:setLeft(240);
    obj.checkBox166:setTop(250);
    obj.checkBox166:setHeight(20);
    obj.checkBox166:setWidth(110);
    obj.checkBox166:setText("Sap");
    obj.checkBox166:setField("sosSap");
    obj.checkBox166:setName("checkBox166");

    obj.checkBox167 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox167:setParent(obj.layout27);
    obj.checkBox167:setLeft(000);
    obj.checkBox167:setTop(275);
    obj.checkBox167:setHeight(20);
    obj.checkBox167:setWidth(110);
    obj.checkBox167:setText("Unaware");
    obj.checkBox167:setField("sosUnaware");
    obj.checkBox167:setName("checkBox167");

    obj.checkBox168 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox168:setParent(obj.layout27);
    obj.checkBox168:setLeft(115);
    obj.checkBox168:setTop(275);
    obj.checkBox168:setHeight(20);
    obj.checkBox168:setWidth(110);
    obj.checkBox168:setText("Mini");
    obj.checkBox168:setField("sosMini");
    obj.checkBox168:setName("checkBox168");

    obj.checkBox169 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox169:setParent(obj.layout27);
    obj.checkBox169:setLeft(240);
    obj.checkBox169:setTop(275);
    obj.checkBox169:setHeight(20);
    obj.checkBox169:setWidth(110);
    obj.checkBox169:setText("Toad");
    obj.checkBox169:setField("sosToad");
    obj.checkBox169:setName("checkBox169");

    obj.checkBox170 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox170:setParent(obj.layout27);
    obj.checkBox170:setLeft(000);
    obj.checkBox170:setTop(300);
    obj.checkBox170:setHeight(20);
    obj.checkBox170:setWidth(110);
    obj.checkBox170:setText("Venom");
    obj.checkBox170:setField("sosVenom");
    obj.checkBox170:setName("checkBox170");

    obj.checkBox171 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox171:setParent(obj.layout27);
    obj.checkBox171:setLeft(115);
    obj.checkBox171:setTop(300);
    obj.checkBox171:setHeight(20);
    obj.checkBox171:setWidth(110);
    obj.checkBox171:setText("Condemn");
    obj.checkBox171:setField("sosCondemn");
    obj.checkBox171:setName("checkBox171");

    obj.checkBox172 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox172:setParent(obj.layout27);
    obj.checkBox172:setLeft(240);
    obj.checkBox172:setTop(300);
    obj.checkBox172:setHeight(20);
    obj.checkBox172:setWidth(110);
    obj.checkBox172:setText("Petrify");
    obj.checkBox172:setField("sosPetrify");
    obj.checkBox172:setName("checkBox172");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.tab7);
    obj.layout28:setLeft(10);
    obj.layout28:setTop(360);
    obj.layout28:setHeight(105);
    obj.layout28:setWidth(110);
    obj.layout28:setName("layout28");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout28);
    obj.rectangle4:setLeft(000);
    obj.rectangle4:setTop(000);
    obj.rectangle4:setWidth(110);
    obj.rectangle4:setHeight(105);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(5);
    obj.rectangle4:setName("rectangle4");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout28);
    obj.label145:setLeft(000);
    obj.label145:setTop(000);
    obj.label145:setHeight(20);
    obj.label145:setWidth(100);
    obj.label145:setText("Comeback");
    obj.label145:setAutoSize(true);
    obj.label145:setHitTest(true);
    obj.label145:setHint("The monster cannot be killed by normal means. Attacks can damage and even incapacitate it, but it is only a matter of time before the fell beast is back on its feet and ready for more action. \n If reduced to 0 or fewer HP in battle, a monster with Comeback is incapacitated as normal, but begins regenerating damage immediately. \n After a certain number of Rounds, regeneration is complete, and the monster comes back into the battle with 100% of its Hit Points and Magic Points restored. Comeback’s XP and Gil values depend on the number of Rounds the monster needs to regenerate");
    obj.label145:setName("label145");

    obj.checkBox173 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox173:setParent(obj.layout28);
    obj.checkBox173:setLeft(010);
    obj.checkBox173:setTop(025);
    obj.checkBox173:setHeight(20);
    obj.checkBox173:setWidth(100);
    obj.checkBox173:setText("2 rounds");
    obj.checkBox173:setField("Comeback2");
    obj.checkBox173:setName("checkBox173");

    obj.checkBox174 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox174:setParent(obj.layout28);
    obj.checkBox174:setLeft(010);
    obj.checkBox174:setTop(050);
    obj.checkBox174:setHeight(20);
    obj.checkBox174:setWidth(100);
    obj.checkBox174:setText("4 rounds");
    obj.checkBox174:setField("Comeback4");
    obj.checkBox174:setName("checkBox174");

    obj.checkBox175 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox175:setParent(obj.layout28);
    obj.checkBox175:setLeft(010);
    obj.checkBox175:setTop(075);
    obj.checkBox175:setHeight(20);
    obj.checkBox175:setWidth(100);
    obj.checkBox175:setText("6 rounds");
    obj.checkBox175:setField("Comeback6");
    obj.checkBox175:setName("checkBox175");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.tab7);
    obj.layout29:setLeft(200);
    obj.layout29:setTop(360);
    obj.layout29:setHeight(105);
    obj.layout29:setWidth(150);
    obj.layout29:setName("layout29");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout29);
    obj.rectangle5:setLeft(000);
    obj.rectangle5:setTop(000);
    obj.rectangle5:setWidth(150);
    obj.rectangle5:setHeight(105);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(5);
    obj.rectangle5:setName("rectangle5");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout29);
    obj.label146:setLeft(000);
    obj.label146:setTop(000);
    obj.label146:setHeight(20);
    obj.label146:setWidth(100);
    obj.label146:setText("Critical Attack");
    obj.label146:setAutoSize(true);
    obj.label146:setHitTest(true);
    obj.label146:setHint("By default, monsters' Attack Actions cannot land Critical Hits in combat. \n A monster with Critical Attack, however, is no longer subject to his restriction. Critical Attack’s XP and Gil values depend on the likelihood of a Critical Hit being landed");
    obj.label146:setName("label146");

    obj.checkBox176 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox176:setParent(obj.layout29);
    obj.checkBox176:setLeft(010);
    obj.checkBox176:setTop(025);
    obj.checkBox176:setHeight(20);
    obj.checkBox176:setWidth(150);
    obj.checkBox176:setText("Standard (1-10)");
    obj.checkBox176:setField("supCrit1");
    obj.checkBox176:setName("checkBox176");

    obj.checkBox177 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox177:setParent(obj.layout29);
    obj.checkBox177:setLeft(010);
    obj.checkBox177:setTop(050);
    obj.checkBox177:setHeight(20);
    obj.checkBox177:setWidth(150);
    obj.checkBox177:setText("Critical+ (1-20)");
    obj.checkBox177:setField("supCrit2");
    obj.checkBox177:setName("checkBox177");

    obj.checkBox178 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox178:setParent(obj.layout29);
    obj.checkBox178:setLeft(010);
    obj.checkBox178:setTop(075);
    obj.checkBox178:setHeight(20);
    obj.checkBox178:setWidth(150);
    obj.checkBox178:setText("Critical++ (1-30)");
    obj.checkBox178:setField("supCrit3");
    obj.checkBox178:setName("checkBox178");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.tab7);
    obj.layout30:setLeft(400);
    obj.layout30:setTop(360);
    obj.layout30:setHeight(100);
    obj.layout30:setWidth(380);
    obj.layout30:setName("layout30");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout30);
    obj.rectangle6:setLeft(000);
    obj.rectangle6:setTop(000);
    obj.rectangle6:setWidth(380);
    obj.rectangle6:setHeight(100);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(5);
    obj.rectangle6:setName("rectangle6");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout30);
    obj.label147:setLeft(000);
    obj.label147:setTop(000);
    obj.label147:setHeight(20);
    obj.label147:setWidth(200);
    obj.label147:setText("Elemental Potency");
    obj.label147:setAutoSize(true);
    obj.label147:setHitTest(true);
    obj.label147:setHint("The monster's elemental attacks are more potent than usual, circumventing natural and magical defenses with ease. \n Select an Element when taking this Ability; any time the monster deals damage associated with that Element, it will deal 125% damage unless the target has a Weakness to it, where it deals 150% as normal. \n Combatants with a Resistance to the Element in question take 100% damage; a Immunity reduces damage to 50%, while Absorbance reduces it to 0. XP and Gil modifiers are given per Element – having Potency towards Wind and Earth would carry a combined modifier of +120/+82");
    obj.label147:setName("label147");

    obj.checkBox179 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox179:setParent(obj.layout30);
    obj.checkBox179:setLeft(000);
    obj.checkBox179:setTop(025);
    obj.checkBox179:setHeight(20);
    obj.checkBox179:setWidth(110);
    obj.checkBox179:setText("Earth");
    obj.checkBox179:setField("potGND");
    obj.checkBox179:setName("checkBox179");

    obj.checkBox180 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox180:setParent(obj.layout30);
    obj.checkBox180:setLeft(115);
    obj.checkBox180:setTop(025);
    obj.checkBox180:setHeight(20);
    obj.checkBox180:setWidth(110);
    obj.checkBox180:setText("Fire");
    obj.checkBox180:setField("potFIR");
    obj.checkBox180:setName("checkBox180");

    obj.checkBox181 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox181:setParent(obj.layout30);
    obj.checkBox181:setLeft(240);
    obj.checkBox181:setTop(025);
    obj.checkBox181:setHeight(20);
    obj.checkBox181:setWidth(110);
    obj.checkBox181:setText("Water");
    obj.checkBox181:setField("potWAT");
    obj.checkBox181:setName("checkBox181");

    obj.checkBox182 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox182:setParent(obj.layout30);
    obj.checkBox182:setLeft(000);
    obj.checkBox182:setTop(050);
    obj.checkBox182:setHeight(20);
    obj.checkBox182:setWidth(110);
    obj.checkBox182:setText("Wind");
    obj.checkBox182:setField("potWIN");
    obj.checkBox182:setName("checkBox182");

    obj.checkBox183 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox183:setParent(obj.layout30);
    obj.checkBox183:setLeft(115);
    obj.checkBox183:setTop(050);
    obj.checkBox183:setHeight(20);
    obj.checkBox183:setWidth(110);
    obj.checkBox183:setText("Ice");
    obj.checkBox183:setField("potICE");
    obj.checkBox183:setName("checkBox183");

    obj.checkBox184 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox184:setParent(obj.layout30);
    obj.checkBox184:setLeft(240);
    obj.checkBox184:setTop(050);
    obj.checkBox184:setHeight(20);
    obj.checkBox184:setWidth(110);
    obj.checkBox184:setText("Lightning");
    obj.checkBox184:setField("potELE");
    obj.checkBox184:setName("checkBox184");

    obj.checkBox185 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox185:setParent(obj.layout30);
    obj.checkBox185:setLeft(000);
    obj.checkBox185:setTop(075);
    obj.checkBox185:setHeight(20);
    obj.checkBox185:setWidth(110);
    obj.checkBox185:setText("Holy");
    obj.checkBox185:setField("potHOL");
    obj.checkBox185:setName("checkBox185");

    obj.checkBox186 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox186:setParent(obj.layout30);
    obj.checkBox186:setLeft(115);
    obj.checkBox186:setTop(075);
    obj.checkBox186:setHeight(20);
    obj.checkBox186:setWidth(110);
    obj.checkBox186:setText("Shadow");
    obj.checkBox186:setField("potSHA");
    obj.checkBox186:setName("checkBox186");

    obj.checkBox187 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox187:setParent(obj.layout30);
    obj.checkBox187:setLeft(240);
    obj.checkBox187:setTop(075);
    obj.checkBox187:setHeight(20);
    obj.checkBox187:setWidth(110);
    obj.checkBox187:setText("Bio");
    obj.checkBox187:setField("potBIO");
    obj.checkBox187:setName("checkBox187");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.tab7);
    obj.layout31:setLeft(650);
    obj.layout31:setTop(010);
    obj.layout31:setHeight(76);
    obj.layout31:setWidth(475);
    obj.layout31:setName("layout31");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout31);
    obj.label148:setLeft(000);
    obj.label148:setTop(000);
    obj.label148:setHeight(20);
    obj.label148:setWidth(10);
    obj.label148:setText("E");
    obj.label148:setAutoSize(true);
    obj.label148:setName("label148");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout31);
    obj.edit161:setLeft(015);
    obj.edit161:setTop(000);
    obj.edit161:setHeight(20);
    obj.edit161:setWidth(40);
    obj.edit161:setField("ExpFinal");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setName("edit161");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout31);
    obj.label149:setLeft(070);
    obj.label149:setTop(000);
    obj.label149:setHeight(20);
    obj.label149:setWidth(10);
    obj.label149:setText("G");
    obj.label149:setAutoSize(true);
    obj.label149:setName("label149");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout31);
    obj.edit162:setLeft(95);
    obj.edit162:setTop(000);
    obj.edit162:setHeight(20);
    obj.edit162:setWidth(40);
    obj.edit162:setField("GilFinal");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setName("edit162");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Sup. 2");
    obj.tab8:setName("tab8");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.tab8);
    obj.layout32:setLeft(10);
    obj.layout32:setTop(10);
    obj.layout32:setHeight(100);
    obj.layout32:setWidth(380);
    obj.layout32:setName("layout32");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout32);
    obj.rectangle7:setLeft(000);
    obj.rectangle7:setTop(000);
    obj.rectangle7:setWidth(380);
    obj.rectangle7:setHeight(100);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(5);
    obj.rectangle7:setName("rectangle7");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout32);
    obj.label150:setLeft(000);
    obj.label150:setTop(000);
    obj.label150:setHeight(20);
    obj.label150:setWidth(200);
    obj.label150:setText("Elemental Weakness");
    obj.label150:setAutoSize(true);
    obj.label150:setHitTest(true);
    obj.label150:setHint("The monster is vulnerable towards one or more of the nine Combat Elements, and is considered to have a Weakness to it. \n Select which Element Elemental Weakness applies to when taking this Ability. \n Elemental Weakness cannot be taken in conjunction with a Resistance, Immunity, or Absorbance for the same Element. XP and Gil modifiers are given per Element – having Weaknesses towards Wind and Earth would carry a combined modifier of -18/-8");
    obj.label150:setName("label150");

    obj.checkBox188 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox188:setParent(obj.layout32);
    obj.checkBox188:setLeft(000);
    obj.checkBox188:setTop(025);
    obj.checkBox188:setHeight(20);
    obj.checkBox188:setWidth(110);
    obj.checkBox188:setText("Earth");
    obj.checkBox188:setField("weakGND");
    obj.checkBox188:setName("checkBox188");

    obj.checkBox189 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox189:setParent(obj.layout32);
    obj.checkBox189:setLeft(115);
    obj.checkBox189:setTop(025);
    obj.checkBox189:setHeight(20);
    obj.checkBox189:setWidth(110);
    obj.checkBox189:setText("Fire");
    obj.checkBox189:setField("weakFIR");
    obj.checkBox189:setName("checkBox189");

    obj.checkBox190 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox190:setParent(obj.layout32);
    obj.checkBox190:setLeft(240);
    obj.checkBox190:setTop(025);
    obj.checkBox190:setHeight(20);
    obj.checkBox190:setWidth(110);
    obj.checkBox190:setText("Water");
    obj.checkBox190:setField("weakWAT");
    obj.checkBox190:setName("checkBox190");

    obj.checkBox191 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox191:setParent(obj.layout32);
    obj.checkBox191:setLeft(000);
    obj.checkBox191:setTop(050);
    obj.checkBox191:setHeight(20);
    obj.checkBox191:setWidth(110);
    obj.checkBox191:setText("Wind");
    obj.checkBox191:setField("weakWIN");
    obj.checkBox191:setName("checkBox191");

    obj.checkBox192 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox192:setParent(obj.layout32);
    obj.checkBox192:setLeft(115);
    obj.checkBox192:setTop(050);
    obj.checkBox192:setHeight(20);
    obj.checkBox192:setWidth(110);
    obj.checkBox192:setText("Ice");
    obj.checkBox192:setField("weakICE");
    obj.checkBox192:setName("checkBox192");

    obj.checkBox193 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox193:setParent(obj.layout32);
    obj.checkBox193:setLeft(240);
    obj.checkBox193:setTop(050);
    obj.checkBox193:setHeight(20);
    obj.checkBox193:setWidth(110);
    obj.checkBox193:setText("Lightning");
    obj.checkBox193:setField("weakELE");
    obj.checkBox193:setName("checkBox193");

    obj.checkBox194 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox194:setParent(obj.layout32);
    obj.checkBox194:setLeft(000);
    obj.checkBox194:setTop(075);
    obj.checkBox194:setHeight(20);
    obj.checkBox194:setWidth(110);
    obj.checkBox194:setText("Holy");
    obj.checkBox194:setField("weakHOL");
    obj.checkBox194:setName("checkBox194");

    obj.checkBox195 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox195:setParent(obj.layout32);
    obj.checkBox195:setLeft(115);
    obj.checkBox195:setTop(075);
    obj.checkBox195:setHeight(20);
    obj.checkBox195:setWidth(110);
    obj.checkBox195:setText("Shadow");
    obj.checkBox195:setField("weakSHA");
    obj.checkBox195:setName("checkBox195");

    obj.checkBox196 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox196:setParent(obj.layout32);
    obj.checkBox196:setLeft(240);
    obj.checkBox196:setTop(075);
    obj.checkBox196:setHeight(20);
    obj.checkBox196:setWidth(110);
    obj.checkBox196:setText("Bio");
    obj.checkBox196:setField("weakBIO");
    obj.checkBox196:setName("checkBox196");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.tab8);
    obj.layout33:setLeft(400);
    obj.layout33:setTop(10);
    obj.layout33:setHeight(100);
    obj.layout33:setWidth(380);
    obj.layout33:setName("layout33");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout33);
    obj.rectangle8:setLeft(000);
    obj.rectangle8:setTop(000);
    obj.rectangle8:setWidth(380);
    obj.rectangle8:setHeight(100);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(5);
    obj.rectangle8:setName("rectangle8");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout33);
    obj.label151:setLeft(000);
    obj.label151:setTop(000);
    obj.label151:setHeight(20);
    obj.label151:setWidth(200);
    obj.label151:setText("Elemental Resistance");
    obj.label151:setAutoSize(true);
    obj.label151:setHitTest(true);
    obj.label151:setHint("The monster has an affinity towards one or more of the nine Combat Elements, and is considered to have a Resistance to it. \n Select which Element Elemental Resistance applies to when taking this Ability. Elemental Resistance cannot be taken in conjunction with a Weakness, Resistance, or Absorbance for the same Element. \n XP and Gil modifiers are given per Element – having Resistance towards Wind and Earth would carry a combined modifier of +14/+6");
    obj.label151:setName("label151");

    obj.checkBox197 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox197:setParent(obj.layout33);
    obj.checkBox197:setLeft(000);
    obj.checkBox197:setTop(025);
    obj.checkBox197:setHeight(20);
    obj.checkBox197:setWidth(110);
    obj.checkBox197:setText("Earth");
    obj.checkBox197:setField("resGND");
    obj.checkBox197:setName("checkBox197");

    obj.checkBox198 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox198:setParent(obj.layout33);
    obj.checkBox198:setLeft(115);
    obj.checkBox198:setTop(025);
    obj.checkBox198:setHeight(20);
    obj.checkBox198:setWidth(110);
    obj.checkBox198:setText("Fire");
    obj.checkBox198:setField("resFIR");
    obj.checkBox198:setName("checkBox198");

    obj.checkBox199 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox199:setParent(obj.layout33);
    obj.checkBox199:setLeft(240);
    obj.checkBox199:setTop(025);
    obj.checkBox199:setHeight(20);
    obj.checkBox199:setWidth(110);
    obj.checkBox199:setText("Water");
    obj.checkBox199:setField("resWAT");
    obj.checkBox199:setName("checkBox199");

    obj.checkBox200 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox200:setParent(obj.layout33);
    obj.checkBox200:setLeft(000);
    obj.checkBox200:setTop(050);
    obj.checkBox200:setHeight(20);
    obj.checkBox200:setWidth(110);
    obj.checkBox200:setText("Wind");
    obj.checkBox200:setField("resWIN");
    obj.checkBox200:setName("checkBox200");

    obj.checkBox201 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox201:setParent(obj.layout33);
    obj.checkBox201:setLeft(115);
    obj.checkBox201:setTop(050);
    obj.checkBox201:setHeight(20);
    obj.checkBox201:setWidth(110);
    obj.checkBox201:setText("Ice");
    obj.checkBox201:setField("resICE");
    obj.checkBox201:setName("checkBox201");

    obj.checkBox202 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox202:setParent(obj.layout33);
    obj.checkBox202:setLeft(240);
    obj.checkBox202:setTop(050);
    obj.checkBox202:setHeight(20);
    obj.checkBox202:setWidth(110);
    obj.checkBox202:setText("Lightning");
    obj.checkBox202:setField("resELE");
    obj.checkBox202:setName("checkBox202");

    obj.checkBox203 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox203:setParent(obj.layout33);
    obj.checkBox203:setLeft(000);
    obj.checkBox203:setTop(075);
    obj.checkBox203:setHeight(20);
    obj.checkBox203:setWidth(110);
    obj.checkBox203:setText("Holy");
    obj.checkBox203:setField("resHOL");
    obj.checkBox203:setName("checkBox203");

    obj.checkBox204 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox204:setParent(obj.layout33);
    obj.checkBox204:setLeft(115);
    obj.checkBox204:setTop(075);
    obj.checkBox204:setHeight(20);
    obj.checkBox204:setWidth(110);
    obj.checkBox204:setText("Shadow");
    obj.checkBox204:setField("resSHA");
    obj.checkBox204:setName("checkBox204");

    obj.checkBox205 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox205:setParent(obj.layout33);
    obj.checkBox205:setLeft(240);
    obj.checkBox205:setTop(075);
    obj.checkBox205:setHeight(20);
    obj.checkBox205:setWidth(110);
    obj.checkBox205:setText("Bio");
    obj.checkBox205:setField("resBIO");
    obj.checkBox205:setName("checkBox205");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.tab8);
    obj.layout34:setLeft(10);
    obj.layout34:setTop(120);
    obj.layout34:setHeight(100);
    obj.layout34:setWidth(380);
    obj.layout34:setName("layout34");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout34);
    obj.rectangle9:setLeft(000);
    obj.rectangle9:setTop(000);
    obj.rectangle9:setWidth(380);
    obj.rectangle9:setHeight(100);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(5);
    obj.rectangle9:setName("rectangle9");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout34);
    obj.label152:setLeft(000);
    obj.label152:setTop(000);
    obj.label152:setHeight(20);
    obj.label152:setWidth(200);
    obj.label152:setText("Elemental Immunity");
    obj.label152:setAutoSize(true);
    obj.label152:setHitTest(true);
    obj.label152:setHint("The monster has a strong affinity towards one or more of the nine Combat Elements, and is considered to have an Immunity to it. \nSelect which Element Elemental Immunity applies to when taking this Ability. Elemental Immunity cannot be taken in conjunction with a Weakness, Resistance, or Absorbance for the same Element. \n XP and Gil modifiers are given per Element – having Immunity towards Wind and Earth would carry a combined modifier of +30/+14.");
    obj.label152:setName("label152");

    obj.checkBox206 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox206:setParent(obj.layout34);
    obj.checkBox206:setLeft(000);
    obj.checkBox206:setTop(025);
    obj.checkBox206:setHeight(20);
    obj.checkBox206:setWidth(110);
    obj.checkBox206:setText("Earth");
    obj.checkBox206:setField("immGND");
    obj.checkBox206:setName("checkBox206");

    obj.checkBox207 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox207:setParent(obj.layout34);
    obj.checkBox207:setLeft(115);
    obj.checkBox207:setTop(025);
    obj.checkBox207:setHeight(20);
    obj.checkBox207:setWidth(110);
    obj.checkBox207:setText("Fire");
    obj.checkBox207:setField("immFIR");
    obj.checkBox207:setName("checkBox207");

    obj.checkBox208 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox208:setParent(obj.layout34);
    obj.checkBox208:setLeft(240);
    obj.checkBox208:setTop(025);
    obj.checkBox208:setHeight(20);
    obj.checkBox208:setWidth(110);
    obj.checkBox208:setText("Water");
    obj.checkBox208:setField("immWAT");
    obj.checkBox208:setName("checkBox208");

    obj.checkBox209 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox209:setParent(obj.layout34);
    obj.checkBox209:setLeft(000);
    obj.checkBox209:setTop(050);
    obj.checkBox209:setHeight(20);
    obj.checkBox209:setWidth(110);
    obj.checkBox209:setText("Wind");
    obj.checkBox209:setField("immWIN");
    obj.checkBox209:setName("checkBox209");

    obj.checkBox210 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox210:setParent(obj.layout34);
    obj.checkBox210:setLeft(115);
    obj.checkBox210:setTop(050);
    obj.checkBox210:setHeight(20);
    obj.checkBox210:setWidth(110);
    obj.checkBox210:setText("Ice");
    obj.checkBox210:setField("immICE");
    obj.checkBox210:setName("checkBox210");

    obj.checkBox211 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox211:setParent(obj.layout34);
    obj.checkBox211:setLeft(240);
    obj.checkBox211:setTop(050);
    obj.checkBox211:setHeight(20);
    obj.checkBox211:setWidth(110);
    obj.checkBox211:setText("Lightning");
    obj.checkBox211:setField("immELE");
    obj.checkBox211:setName("checkBox211");

    obj.checkBox212 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox212:setParent(obj.layout34);
    obj.checkBox212:setLeft(000);
    obj.checkBox212:setTop(075);
    obj.checkBox212:setHeight(20);
    obj.checkBox212:setWidth(110);
    obj.checkBox212:setText("Holy");
    obj.checkBox212:setField("immHOL");
    obj.checkBox212:setName("checkBox212");

    obj.checkBox213 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox213:setParent(obj.layout34);
    obj.checkBox213:setLeft(115);
    obj.checkBox213:setTop(075);
    obj.checkBox213:setHeight(20);
    obj.checkBox213:setWidth(110);
    obj.checkBox213:setText("Shadow");
    obj.checkBox213:setField("immSHA");
    obj.checkBox213:setName("checkBox213");

    obj.checkBox214 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox214:setParent(obj.layout34);
    obj.checkBox214:setLeft(240);
    obj.checkBox214:setTop(075);
    obj.checkBox214:setHeight(20);
    obj.checkBox214:setWidth(110);
    obj.checkBox214:setText("Bio");
    obj.checkBox214:setField("immBIO");
    obj.checkBox214:setName("checkBox214");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.tab8);
    obj.layout35:setLeft(400);
    obj.layout35:setTop(120);
    obj.layout35:setHeight(100);
    obj.layout35:setWidth(380);
    obj.layout35:setName("layout35");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout35);
    obj.rectangle10:setLeft(000);
    obj.rectangle10:setTop(000);
    obj.rectangle10:setWidth(380);
    obj.rectangle10:setHeight(100);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(5);
    obj.rectangle10:setName("rectangle10");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout35);
    obj.label153:setLeft(000);
    obj.label153:setTop(000);
    obj.label153:setHeight(20);
    obj.label153:setWidth(200);
    obj.label153:setText("Elemental Absorbance");
    obj.label153:setAutoSize(true);
    obj.label153:setHitTest(true);
    obj.label153:setHint("The monster has an extremely strong affinity towards one or more of the nine Combat Elements, and is considered to have an Absorbance to it. \n Select which Element Elemental Absorbance applies to when taking this Ability. \n Elemental Absorbance cannot be taken in conjunction with a Weakness, Resistance, or Immunity for the same Element. XP and Gil modifiers are given per Element – having Absorbance towards Wind and Earth would carry a combined modifier of +66/+30.");
    obj.label153:setName("label153");

    obj.checkBox215 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox215:setParent(obj.layout35);
    obj.checkBox215:setLeft(000);
    obj.checkBox215:setTop(025);
    obj.checkBox215:setHeight(20);
    obj.checkBox215:setWidth(110);
    obj.checkBox215:setText("Earth");
    obj.checkBox215:setField("absGND");
    obj.checkBox215:setName("checkBox215");

    obj.checkBox216 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox216:setParent(obj.layout35);
    obj.checkBox216:setLeft(115);
    obj.checkBox216:setTop(025);
    obj.checkBox216:setHeight(20);
    obj.checkBox216:setWidth(110);
    obj.checkBox216:setText("Fire");
    obj.checkBox216:setField("absFIR");
    obj.checkBox216:setName("checkBox216");

    obj.checkBox217 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox217:setParent(obj.layout35);
    obj.checkBox217:setLeft(240);
    obj.checkBox217:setTop(025);
    obj.checkBox217:setHeight(20);
    obj.checkBox217:setWidth(110);
    obj.checkBox217:setText("Water");
    obj.checkBox217:setField("absWAT");
    obj.checkBox217:setName("checkBox217");

    obj.checkBox218 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox218:setParent(obj.layout35);
    obj.checkBox218:setLeft(000);
    obj.checkBox218:setTop(050);
    obj.checkBox218:setHeight(20);
    obj.checkBox218:setWidth(110);
    obj.checkBox218:setText("Wind");
    obj.checkBox218:setField("absWIN");
    obj.checkBox218:setName("checkBox218");

    obj.checkBox219 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox219:setParent(obj.layout35);
    obj.checkBox219:setLeft(115);
    obj.checkBox219:setTop(050);
    obj.checkBox219:setHeight(20);
    obj.checkBox219:setWidth(110);
    obj.checkBox219:setText("Ice");
    obj.checkBox219:setField("absICE");
    obj.checkBox219:setName("checkBox219");

    obj.checkBox220 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox220:setParent(obj.layout35);
    obj.checkBox220:setLeft(240);
    obj.checkBox220:setTop(050);
    obj.checkBox220:setHeight(20);
    obj.checkBox220:setWidth(110);
    obj.checkBox220:setText("Lightning");
    obj.checkBox220:setField("absELE");
    obj.checkBox220:setName("checkBox220");

    obj.checkBox221 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox221:setParent(obj.layout35);
    obj.checkBox221:setLeft(000);
    obj.checkBox221:setTop(075);
    obj.checkBox221:setHeight(20);
    obj.checkBox221:setWidth(110);
    obj.checkBox221:setText("Holy");
    obj.checkBox221:setField("absHOL");
    obj.checkBox221:setName("checkBox221");

    obj.checkBox222 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox222:setParent(obj.layout35);
    obj.checkBox222:setLeft(115);
    obj.checkBox222:setTop(075);
    obj.checkBox222:setHeight(20);
    obj.checkBox222:setWidth(110);
    obj.checkBox222:setText("Shadow");
    obj.checkBox222:setField("absSHA");
    obj.checkBox222:setName("checkBox222");

    obj.checkBox223 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox223:setParent(obj.layout35);
    obj.checkBox223:setLeft(240);
    obj.checkBox223:setTop(075);
    obj.checkBox223:setHeight(20);
    obj.checkBox223:setWidth(110);
    obj.checkBox223:setText("Bio");
    obj.checkBox223:setField("absBIO");
    obj.checkBox223:setName("checkBox223");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.tab8);
    obj.layout36:setLeft(10);
    obj.layout36:setTop(260);
    obj.layout36:setHeight(400);
    obj.layout36:setWidth(380);
    obj.layout36:setName("layout36");

    obj.checkBox224 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox224:setParent(obj.layout36);
    obj.checkBox224:setLeft(000);
    obj.checkBox224:setTop(000);
    obj.checkBox224:setHeight(20);
    obj.checkBox224:setWidth(100);
    obj.checkBox224:setText("Bad Scan");
    obj.checkBox224:setField("speBadScan");
    obj.checkBox224:setHitTest(true);
    obj.checkBox224:setHint("If analyzed via the Scan Spell, the Equipment Ability Sensor, or any similar effect, the monster will return incorrect information intended to mislead the Party. \n How the Scan is ‘tampered’ with is left to the designer to decide, but should be noted in the monster’s writeup – one of the more obvious uses would have the monster register as having a Weakness to an Element they in fact Absorb, or vice versa, though there are other possibilities. \n Useless or not, scanning the monster still costs MP or Actions as usual.");
    obj.checkBox224:setName("checkBox224");

    obj.checkBox225 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox225:setParent(obj.layout36);
    obj.checkBox225:setLeft(000);
    obj.checkBox225:setTop(025);
    obj.checkBox225:setHeight(20);
    obj.checkBox225:setWidth(100);
    obj.checkBox225:setText("Can't Scan");
    obj.checkBox225:setField("speNoScan");
    obj.checkBox225:setHitTest(true);
    obj.checkBox225:setHint("The monster cannot be analyzed by means of the Scan Spell, the Equipment Ability Sensor, or any similar effect. \n Any attempts to do so cost Actions and MP as usual, but return no useful information.");
    obj.checkBox225:setName("checkBox225");

    obj.checkBox226 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox226:setParent(obj.layout36);
    obj.checkBox226:setLeft(000);
    obj.checkBox226:setTop(050);
    obj.checkBox226:setHeight(20);
    obj.checkBox226:setWidth(100);
    obj.checkBox226:setText("Evader");
    obj.checkBox226:setField("supEvader");
    obj.checkBox226:setHitTest(true);
    obj.checkBox226:setHint("A monster with this ability is extremely adept at evading harm. \n Attacks and Abilities that target the monster have their CoS halved, although Critical Hits may still be scored. \n Abilities that hit a target automatically only have a CoS of Accuracy, Evasion of affecting a monster with Evader. With Magic Abilities, this CoS is M. Accuracy, M.Evasion. Item accuracy remains unaffected.");
    obj.checkBox226:setName("checkBox226");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout36);
    obj.label154:setLeft(000);
    obj.label154:setTop(075);
    obj.label154:setHeight(20);
    obj.label154:setWidth(100);
    obj.label154:setText("Evasion+");
    obj.label154:setHitTest(true);
    obj.label154:setHint("Improves the monster’s ability to dodge physical attacks by increasing its base Evasion rating. The amount by which the monster’s EVA increases determines the XP and Gil modifiers");
    obj.label154:setName("label154");

    obj.checkBox227 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox227:setParent(obj.layout36);
    obj.checkBox227:setLeft(010);
    obj.checkBox227:setTop(100);
    obj.checkBox227:setHeight(20);
    obj.checkBox227:setWidth(120);
    obj.checkBox227:setText("Evasion +10%");
    obj.checkBox227:setField("supEva10");
    obj.checkBox227:setName("checkBox227");

    obj.checkBox228 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox228:setParent(obj.layout36);
    obj.checkBox228:setLeft(010);
    obj.checkBox228:setTop(125);
    obj.checkBox228:setHeight(20);
    obj.checkBox228:setWidth(120);
    obj.checkBox228:setText("Evasion +25%");
    obj.checkBox228:setField("supEva25");
    obj.checkBox228:setName("checkBox228");

    obj.checkBox229 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox229:setParent(obj.layout36);
    obj.checkBox229:setLeft(010);
    obj.checkBox229:setTop(150);
    obj.checkBox229:setHeight(20);
    obj.checkBox229:setWidth(120);
    obj.checkBox229:setText("Evasion +50%");
    obj.checkBox229:setField("supEva50");
    obj.checkBox229:setName("checkBox229");

    obj.checkBox230 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox230:setParent(obj.layout36);
    obj.checkBox230:setLeft(010);
    obj.checkBox230:setTop(175);
    obj.checkBox230:setHeight(20);
    obj.checkBox230:setWidth(120);
    obj.checkBox230:setText("Evasion +75%");
    obj.checkBox230:setField("supEva75");
    obj.checkBox230:setName("checkBox230");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.tab8);
    obj.layout37:setLeft(400);
    obj.layout37:setTop(260);
    obj.layout37:setHeight(400);
    obj.layout37:setWidth(380);
    obj.layout37:setName("layout37");

    obj.checkBox231 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox231:setParent(obj.layout37);
    obj.checkBox231:setLeft(000);
    obj.checkBox231:setTop(000);
    obj.checkBox231:setHeight(20);
    obj.checkBox231:setWidth(100);
    obj.checkBox231:setText("Heavy Armor");
    obj.checkBox231:setField("supHArm");
    obj.checkBox231:setHitTest(true);
    obj.checkBox231:setHint("The monster sports armor heavier than the norm, giving it better resistance against armor-piercing attacks. \n When a monster with Heavy Armor is struck by any attack or Ability which would normally ignore or reduce ARM, ARM is factored into the attack as normal. \n Note that this does not affect Status Conditions such as Armor Break and Meltdown, which continue to work as normal");
    obj.checkBox231:setName("checkBox231");

    obj.checkBox232 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox232:setParent(obj.layout37);
    obj.checkBox232:setLeft(000);
    obj.checkBox232:setTop(025);
    obj.checkBox232:setHeight(20);
    obj.checkBox232:setWidth(100);
    obj.checkBox232:setText("Low Evasion");
    obj.checkBox232:setField("supLEva");
    obj.checkBox232:setHitTest(true);
    obj.checkBox232:setHint("The monster is especially sluggish when it comes to dodging. As a result, the following formula is used to calculate the monster’s Evasion: \n ([Level / 2] + SPD + AGI) \n Because of the strong impact this can have on a monster's Gil and XP values, this option should not be used on low-Level monsters.");
    obj.checkBox232:setName("checkBox232");

    obj.checkBox233 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox233:setParent(obj.layout37);
    obj.checkBox233:setLeft(000);
    obj.checkBox233:setTop(050);
    obj.checkBox233:setHeight(20);
    obj.checkBox233:setWidth(100);
    obj.checkBox233:setText("Low Magic Evasion");
    obj.checkBox233:setField("supLMEva");
    obj.checkBox233:setHitTest(true);
    obj.checkBox233:setHint("The monster is highly vulnerable to the effects of spellcasting. As a result, the following formula is used to calculate the monster’s M. Evasion: \n ([Level / 2] + MAG + SPR) \n Because of the strong impact this can have on a monster's Gil and XP values, this option should not be used on low-Level monsters");
    obj.checkBox233:setName("checkBox233");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout37);
    obj.label155:setLeft(000);
    obj.label155:setTop(075);
    obj.label155:setHeight(20);
    obj.label155:setWidth(100);
    obj.label155:setText("Magic Evasion+");
    obj.label155:setHitTest(true);
    obj.label155:setHint("Improves the monster’s ability to dodge physical attacks by increasing its base Evasion rating. The amount by which the monster’s EVA increases determines the XP and Gil modifiers");
    obj.label155:setName("label155");

    obj.checkBox234 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox234:setParent(obj.layout37);
    obj.checkBox234:setLeft(010);
    obj.checkBox234:setTop(100);
    obj.checkBox234:setHeight(20);
    obj.checkBox234:setWidth(120);
    obj.checkBox234:setText("M. Evasion +10%");
    obj.checkBox234:setField("supMEva10");
    obj.checkBox234:setName("checkBox234");

    obj.checkBox235 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox235:setParent(obj.layout37);
    obj.checkBox235:setLeft(010);
    obj.checkBox235:setTop(125);
    obj.checkBox235:setHeight(20);
    obj.checkBox235:setWidth(120);
    obj.checkBox235:setText("M. Evasion +25%");
    obj.checkBox235:setField("supMEva25");
    obj.checkBox235:setName("checkBox235");

    obj.checkBox236 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox236:setParent(obj.layout37);
    obj.checkBox236:setLeft(010);
    obj.checkBox236:setTop(150);
    obj.checkBox236:setHeight(20);
    obj.checkBox236:setWidth(120);
    obj.checkBox236:setText("M. Evasion +50%");
    obj.checkBox236:setField("supMEva50");
    obj.checkBox236:setName("checkBox236");

    obj.checkBox237 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox237:setParent(obj.layout37);
    obj.checkBox237:setLeft(010);
    obj.checkBox237:setTop(175);
    obj.checkBox237:setHeight(20);
    obj.checkBox237:setWidth(120);
    obj.checkBox237:setText("M. Evasion +75%");
    obj.checkBox237:setField("supMEva75");
    obj.checkBox237:setName("checkBox237");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.tab8);
    obj.layout38:setLeft(650);
    obj.layout38:setTop(010);
    obj.layout38:setHeight(76);
    obj.layout38:setWidth(475);
    obj.layout38:setName("layout38");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout38);
    obj.label156:setLeft(000);
    obj.label156:setTop(000);
    obj.label156:setHeight(20);
    obj.label156:setWidth(10);
    obj.label156:setText("E");
    obj.label156:setAutoSize(true);
    obj.label156:setName("label156");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout38);
    obj.edit163:setLeft(015);
    obj.edit163:setTop(000);
    obj.edit163:setHeight(20);
    obj.edit163:setWidth(40);
    obj.edit163:setField("ExpFinal");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setName("edit163");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout38);
    obj.label157:setLeft(070);
    obj.label157:setTop(000);
    obj.label157:setHeight(20);
    obj.label157:setWidth(10);
    obj.label157:setText("G");
    obj.label157:setAutoSize(true);
    obj.label157:setName("label157");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout38);
    obj.edit164:setLeft(95);
    obj.edit164:setTop(000);
    obj.edit164:setHeight(20);
    obj.edit164:setWidth(40);
    obj.edit164:setField("GilFinal");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setName("edit164");

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Sup. 3");
    obj.tab9:setName("tab9");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.tab9);
    obj.layout39:setLeft(10);
    obj.layout39:setTop(10);
    obj.layout39:setHeight(380);
    obj.layout39:setWidth(380);
    obj.layout39:setName("layout39");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout39);
    obj.rectangle11:setLeft(000);
    obj.rectangle11:setTop(000);
    obj.rectangle11:setWidth(380);
    obj.rectangle11:setHeight(600);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(5);
    obj.rectangle11:setName("rectangle11");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout39);
    obj.label158:setLeft(000);
    obj.label158:setTop(000);
    obj.label158:setHeight(20);
    obj.label158:setWidth(200);
    obj.label158:setText("Status Resistance (Single)");
    obj.label158:setAutoSize(true);
    obj.label158:setHitTest(true);
    obj.label158:setHint("The monster is partially immune to the effects of a particular Status Condition. \n Any rolls to inflict this Status Condition have their CoS reduced by -50%. Gil and XP modifiers depend on the Class of Status Condition the monster is Immune to");
    obj.label158:setName("label158");

    obj.checkBox238 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox238:setParent(obj.layout39);
    obj.checkBox238:setLeft(000);
    obj.checkBox238:setTop(025);
    obj.checkBox238:setHeight(20);
    obj.checkBox238:setWidth(110);
    obj.checkBox238:setText("Berserk");
    obj.checkBox238:setField("resBerserk");
    obj.checkBox238:setName("checkBox238");

    obj.checkBox239 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox239:setParent(obj.layout39);
    obj.checkBox239:setLeft(115);
    obj.checkBox239:setTop(025);
    obj.checkBox239:setHeight(20);
    obj.checkBox239:setWidth(110);
    obj.checkBox239:setText("Blind");
    obj.checkBox239:setField("resBlind");
    obj.checkBox239:setName("checkBox239");

    obj.checkBox240 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox240:setParent(obj.layout39);
    obj.checkBox240:setLeft(240);
    obj.checkBox240:setTop(025);
    obj.checkBox240:setHeight(20);
    obj.checkBox240:setWidth(110);
    obj.checkBox240:setText("Immobilize");
    obj.checkBox240:setField("resImmobilize");
    obj.checkBox240:setName("checkBox240");

    obj.checkBox241 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox241:setParent(obj.layout39);
    obj.checkBox241:setLeft(000);
    obj.checkBox241:setTop(050);
    obj.checkBox241:setHeight(20);
    obj.checkBox241:setWidth(110);
    obj.checkBox241:setText("Poison");
    obj.checkBox241:setField("resPoison");
    obj.checkBox241:setName("checkBox241");

    obj.checkBox242 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox242:setParent(obj.layout39);
    obj.checkBox242:setLeft(115);
    obj.checkBox242:setTop(050);
    obj.checkBox242:setHeight(20);
    obj.checkBox242:setWidth(110);
    obj.checkBox242:setText("Sleep");
    obj.checkBox242:setField("resSleep");
    obj.checkBox242:setName("checkBox242");

    obj.checkBox243 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox243:setParent(obj.layout39);
    obj.checkBox243:setLeft(240);
    obj.checkBox243:setTop(050);
    obj.checkBox243:setHeight(20);
    obj.checkBox243:setWidth(110);
    obj.checkBox243:setText("Slow");
    obj.checkBox243:setField("resSlow");
    obj.checkBox243:setName("checkBox243");

    obj.checkBox244 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox244:setParent(obj.layout39);
    obj.checkBox244:setLeft(000);
    obj.checkBox244:setTop(075);
    obj.checkBox244:setHeight(20);
    obj.checkBox244:setWidth(110);
    obj.checkBox244:setText("Zombie");
    obj.checkBox244:setField("resZombie");
    obj.checkBox244:setName("checkBox244");

    obj.checkBox245 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox245:setParent(obj.layout39);
    obj.checkBox245:setLeft(115);
    obj.checkBox245:setTop(075);
    obj.checkBox245:setHeight(20);
    obj.checkBox245:setWidth(110);
    obj.checkBox245:setText("Lock");
    obj.checkBox245:setField("resLock");
    obj.checkBox245:setName("checkBox245");

    obj.checkBox246 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox246:setParent(obj.layout39);
    obj.checkBox246:setLeft(240);
    obj.checkBox246:setTop(075);
    obj.checkBox246:setHeight(20);
    obj.checkBox246:setWidth(110);
    obj.checkBox246:setText("Condemn");
    obj.checkBox246:setField("resCondemn");
    obj.checkBox246:setName("checkBox246");

    obj.checkBox247 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox247:setParent(obj.layout39);
    obj.checkBox247:setLeft(000);
    obj.checkBox247:setTop(100);
    obj.checkBox247:setHeight(20);
    obj.checkBox247:setWidth(110);
    obj.checkBox247:setText("Confuse");
    obj.checkBox247:setField("resConfuse");
    obj.checkBox247:setName("checkBox247");

    obj.checkBox248 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox248:setParent(obj.layout39);
    obj.checkBox248:setLeft(115);
    obj.checkBox248:setTop(100);
    obj.checkBox248:setHeight(20);
    obj.checkBox248:setWidth(110);
    obj.checkBox248:setText("Curse");
    obj.checkBox248:setField("resCurse");
    obj.checkBox248:setName("checkBox248");

    obj.checkBox249 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox249:setParent(obj.layout39);
    obj.checkBox249:setLeft(240);
    obj.checkBox249:setTop(100);
    obj.checkBox249:setHeight(20);
    obj.checkBox249:setWidth(110);
    obj.checkBox249:setText("Disable");
    obj.checkBox249:setField("resDisable");
    obj.checkBox249:setName("checkBox249");

    obj.checkBox250 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox250:setParent(obj.layout39);
    obj.checkBox250:setLeft(000);
    obj.checkBox250:setTop(125);
    obj.checkBox250:setHeight(20);
    obj.checkBox250:setWidth(110);
    obj.checkBox250:setText("Petrify");
    obj.checkBox250:setField("resPetrify");
    obj.checkBox250:setName("checkBox250");

    obj.checkBox251 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox251:setParent(obj.layout39);
    obj.checkBox251:setLeft(115);
    obj.checkBox251:setTop(125);
    obj.checkBox251:setHeight(20);
    obj.checkBox251:setWidth(110);
    obj.checkBox251:setText("Silence");
    obj.checkBox251:setField("resSilence");
    obj.checkBox251:setName("checkBox251");

    obj.checkBox252 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox252:setParent(obj.layout39);
    obj.checkBox252:setLeft(240);
    obj.checkBox252:setTop(125);
    obj.checkBox252:setHeight(20);
    obj.checkBox252:setWidth(110);
    obj.checkBox252:setText("Sap");
    obj.checkBox252:setField("resSap");
    obj.checkBox252:setName("checkBox252");

    obj.checkBox253 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox253:setParent(obj.layout39);
    obj.checkBox253:setLeft(000);
    obj.checkBox253:setTop(150);
    obj.checkBox253:setHeight(20);
    obj.checkBox253:setWidth(110);
    obj.checkBox253:setText("Unaware");
    obj.checkBox253:setField("resUnaware");
    obj.checkBox253:setName("checkBox253");

    obj.checkBox254 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox254:setParent(obj.layout39);
    obj.checkBox254:setLeft(115);
    obj.checkBox254:setTop(150);
    obj.checkBox254:setHeight(20);
    obj.checkBox254:setWidth(110);
    obj.checkBox254:setText("Eject");
    obj.checkBox254:setField("resEject");
    obj.checkBox254:setName("checkBox254");

    obj.checkBox255 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox255:setParent(obj.layout39);
    obj.checkBox255:setLeft(240);
    obj.checkBox255:setTop(150);
    obj.checkBox255:setHeight(20);
    obj.checkBox255:setWidth(110);
    obj.checkBox255:setText("Mini");
    obj.checkBox255:setField("resMini");
    obj.checkBox255:setName("checkBox255");

    obj.checkBox256 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox256:setParent(obj.layout39);
    obj.checkBox256:setLeft(000);
    obj.checkBox256:setTop(175);
    obj.checkBox256:setHeight(20);
    obj.checkBox256:setWidth(110);
    obj.checkBox256:setText("Strength Down");
    obj.checkBox256:setField("resSTRDown");
    obj.checkBox256:setName("checkBox256");

    obj.checkBox257 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox257:setParent(obj.layout39);
    obj.checkBox257:setLeft(115);
    obj.checkBox257:setTop(175);
    obj.checkBox257:setHeight(20);
    obj.checkBox257:setWidth(110);
    obj.checkBox257:setText("Agility Down");
    obj.checkBox257:setField("resAGIDown");
    obj.checkBox257:setName("checkBox257");

    obj.checkBox258 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox258:setParent(obj.layout39);
    obj.checkBox258:setLeft(240);
    obj.checkBox258:setTop(175);
    obj.checkBox258:setHeight(20);
    obj.checkBox258:setWidth(110);
    obj.checkBox258:setText("Magic Down");
    obj.checkBox258:setField("resMAGDown");
    obj.checkBox258:setName("checkBox258");

    obj.checkBox259 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox259:setParent(obj.layout39);
    obj.checkBox259:setLeft(000);
    obj.checkBox259:setTop(200);
    obj.checkBox259:setHeight(20);
    obj.checkBox259:setWidth(110);
    obj.checkBox259:setText("Mental Down");
    obj.checkBox259:setField("resMENDown");
    obj.checkBox259:setName("checkBox259");

    obj.checkBox260 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox260:setParent(obj.layout39);
    obj.checkBox260:setLeft(115);
    obj.checkBox260:setTop(200);
    obj.checkBox260:setHeight(20);
    obj.checkBox260:setWidth(110);
    obj.checkBox260:setText("Armor Down");
    obj.checkBox260:setField("resARMDown");
    obj.checkBox260:setName("checkBox260");

    obj.checkBox261 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox261:setParent(obj.layout39);
    obj.checkBox261:setLeft(240);
    obj.checkBox261:setTop(200);
    obj.checkBox261:setHeight(20);
    obj.checkBox261:setWidth(110);
    obj.checkBox261:setText("Spirit Down");
    obj.checkBox261:setField("resSPIDown");
    obj.checkBox261:setName("checkBox261");

    obj.checkBox262 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox262:setParent(obj.layout39);
    obj.checkBox262:setLeft(000);
    obj.checkBox262:setTop(225);
    obj.checkBox262:setHeight(20);
    obj.checkBox262:setWidth(110);
    obj.checkBox262:setText("Strength Break");
    obj.checkBox262:setField("resSTRBrk");
    obj.checkBox262:setName("checkBox262");

    obj.checkBox263 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox263:setParent(obj.layout39);
    obj.checkBox263:setLeft(115);
    obj.checkBox263:setTop(225);
    obj.checkBox263:setHeight(20);
    obj.checkBox263:setWidth(110);
    obj.checkBox263:setText("Agility Break");
    obj.checkBox263:setField("resAGIBrk");
    obj.checkBox263:setName("checkBox263");

    obj.checkBox264 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox264:setParent(obj.layout39);
    obj.checkBox264:setLeft(240);
    obj.checkBox264:setTop(225);
    obj.checkBox264:setHeight(20);
    obj.checkBox264:setWidth(110);
    obj.checkBox264:setText("Magic Break");
    obj.checkBox264:setField("resMAGBrk");
    obj.checkBox264:setName("checkBox264");

    obj.checkBox265 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox265:setParent(obj.layout39);
    obj.checkBox265:setLeft(000);
    obj.checkBox265:setTop(250);
    obj.checkBox265:setHeight(20);
    obj.checkBox265:setWidth(110);
    obj.checkBox265:setText("Mental Break");
    obj.checkBox265:setField("resMENBrk");
    obj.checkBox265:setName("checkBox265");

    obj.checkBox266 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox266:setParent(obj.layout39);
    obj.checkBox266:setLeft(115);
    obj.checkBox266:setTop(250);
    obj.checkBox266:setHeight(20);
    obj.checkBox266:setWidth(110);
    obj.checkBox266:setText("Armor Break");
    obj.checkBox266:setField("resARMBrk");
    obj.checkBox266:setName("checkBox266");

    obj.checkBox267 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox267:setParent(obj.layout39);
    obj.checkBox267:setLeft(240);
    obj.checkBox267:setTop(250);
    obj.checkBox267:setHeight(20);
    obj.checkBox267:setWidth(110);
    obj.checkBox267:setText("Spirit Break");
    obj.checkBox267:setField("resSPIBrk");
    obj.checkBox267:setName("checkBox267");

    obj.checkBox268 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox268:setParent(obj.layout39);
    obj.checkBox268:setLeft(000);
    obj.checkBox268:setTop(275);
    obj.checkBox268:setHeight(20);
    obj.checkBox268:setWidth(110);
    obj.checkBox268:setText("Stop");
    obj.checkBox268:setField("resStop");
    obj.checkBox268:setName("checkBox268");

    obj.checkBox269 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox269:setParent(obj.layout39);
    obj.checkBox269:setLeft(115);
    obj.checkBox269:setTop(275);
    obj.checkBox269:setHeight(20);
    obj.checkBox269:setWidth(110);
    obj.checkBox269:setText("Toad");
    obj.checkBox269:setField("resToad");
    obj.checkBox269:setName("checkBox269");

    obj.checkBox270 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox270:setParent(obj.layout39);
    obj.checkBox270:setLeft(240);
    obj.checkBox270:setTop(275);
    obj.checkBox270:setHeight(20);
    obj.checkBox270:setWidth(110);
    obj.checkBox270:setText("Venom");
    obj.checkBox270:setField("resVenom");
    obj.checkBox270:setName("checkBox270");

    obj.checkBox271 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox271:setParent(obj.layout39);
    obj.checkBox271:setLeft(000);
    obj.checkBox271:setTop(300);
    obj.checkBox271:setHeight(20);
    obj.checkBox271:setWidth(110);
    obj.checkBox271:setText("Element Weak");
    obj.checkBox271:setField("resElemWeak");
    obj.checkBox271:setName("checkBox271");

    obj.checkBox272 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox272:setParent(obj.layout39);
    obj.checkBox272:setLeft(115);
    obj.checkBox272:setTop(300);
    obj.checkBox272:setHeight(20);
    obj.checkBox272:setWidth(110);
    obj.checkBox272:setText("Charm");
    obj.checkBox272:setField("resCharm");
    obj.checkBox272:setName("checkBox272");

    obj.checkBox273 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox273:setParent(obj.layout39);
    obj.checkBox273:setLeft(240);
    obj.checkBox273:setTop(300);
    obj.checkBox273:setHeight(20);
    obj.checkBox273:setWidth(110);
    obj.checkBox273:setText("Death");
    obj.checkBox273:setField("resDeath");
    obj.checkBox273:setName("checkBox273");

    obj.checkBox274 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox274:setParent(obj.layout39);
    obj.checkBox274:setLeft(000);
    obj.checkBox274:setTop(325);
    obj.checkBox274:setHeight(20);
    obj.checkBox274:setWidth(110);
    obj.checkBox274:setText("Frozen");
    obj.checkBox274:setField("resFrozen");
    obj.checkBox274:setName("checkBox274");

    obj.checkBox275 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox275:setParent(obj.layout39);
    obj.checkBox275:setLeft(115);
    obj.checkBox275:setTop(325);
    obj.checkBox275:setHeight(20);
    obj.checkBox275:setWidth(110);
    obj.checkBox275:setText("Gravity");
    obj.checkBox275:setField("resGravity");
    obj.checkBox275:setName("checkBox275");

    obj.checkBox276 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox276:setParent(obj.layout39);
    obj.checkBox276:setLeft(240);
    obj.checkBox276:setTop(325);
    obj.checkBox276:setHeight(20);
    obj.checkBox276:setWidth(110);
    obj.checkBox276:setText("Heat");
    obj.checkBox276:setField("resHeat");
    obj.checkBox276:setName("checkBox276");

    obj.checkBox277 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox277:setParent(obj.layout39);
    obj.checkBox277:setLeft(000);
    obj.checkBox277:setTop(350);
    obj.checkBox277:setHeight(20);
    obj.checkBox277:setWidth(110);
    obj.checkBox277:setText("Meltdown");
    obj.checkBox277:setField("resMeltdown");
    obj.checkBox277:setName("checkBox277");

    obj.checkBox278 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox278:setParent(obj.layout39);
    obj.checkBox278:setLeft(115);
    obj.checkBox278:setTop(350);
    obj.checkBox278:setHeight(20);
    obj.checkBox278:setWidth(110);
    obj.checkBox278:setText("Stone");
    obj.checkBox278:setField("resStone");
    obj.checkBox278:setName("checkBox278");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.tab9);
    obj.layout40:setLeft(400);
    obj.layout40:setTop(10);
    obj.layout40:setHeight(380);
    obj.layout40:setWidth(380);
    obj.layout40:setName("layout40");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout40);
    obj.rectangle12:setLeft(000);
    obj.rectangle12:setTop(000);
    obj.rectangle12:setWidth(380);
    obj.rectangle12:setHeight(600);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(5);
    obj.rectangle12:setName("rectangle12");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout40);
    obj.label159:setLeft(000);
    obj.label159:setTop(000);
    obj.label159:setHeight(20);
    obj.label159:setWidth(200);
    obj.label159:setText("Status Immunity (Single)");
    obj.label159:setAutoSize(true);
    obj.label159:setHitTest(true);
    obj.label159:setHint("The monster is wholly immune to the effects of a particular Status Condition. \n Any rolls to inflict this Status Condition have a CoS of 0. Gil and XP modifiers depend on the Class of Status Condition the monster is Immune to:");
    obj.label159:setName("label159");

    obj.checkBox279 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox279:setParent(obj.layout40);
    obj.checkBox279:setLeft(000);
    obj.checkBox279:setTop(025);
    obj.checkBox279:setHeight(20);
    obj.checkBox279:setWidth(110);
    obj.checkBox279:setText("Berserk");
    obj.checkBox279:setField("immBerserk");
    obj.checkBox279:setName("checkBox279");

    obj.checkBox280 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox280:setParent(obj.layout40);
    obj.checkBox280:setLeft(115);
    obj.checkBox280:setTop(025);
    obj.checkBox280:setHeight(20);
    obj.checkBox280:setWidth(110);
    obj.checkBox280:setText("Blind");
    obj.checkBox280:setField("immBlind");
    obj.checkBox280:setName("checkBox280");

    obj.checkBox281 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox281:setParent(obj.layout40);
    obj.checkBox281:setLeft(240);
    obj.checkBox281:setTop(025);
    obj.checkBox281:setHeight(20);
    obj.checkBox281:setWidth(110);
    obj.checkBox281:setText("Immobilize");
    obj.checkBox281:setField("immImmobilize");
    obj.checkBox281:setName("checkBox281");

    obj.checkBox282 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox282:setParent(obj.layout40);
    obj.checkBox282:setLeft(000);
    obj.checkBox282:setTop(050);
    obj.checkBox282:setHeight(20);
    obj.checkBox282:setWidth(110);
    obj.checkBox282:setText("Poison");
    obj.checkBox282:setField("immPoison");
    obj.checkBox282:setName("checkBox282");

    obj.checkBox283 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox283:setParent(obj.layout40);
    obj.checkBox283:setLeft(115);
    obj.checkBox283:setTop(050);
    obj.checkBox283:setHeight(20);
    obj.checkBox283:setWidth(110);
    obj.checkBox283:setText("Sleep");
    obj.checkBox283:setField("immSleep");
    obj.checkBox283:setName("checkBox283");

    obj.checkBox284 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox284:setParent(obj.layout40);
    obj.checkBox284:setLeft(240);
    obj.checkBox284:setTop(050);
    obj.checkBox284:setHeight(20);
    obj.checkBox284:setWidth(110);
    obj.checkBox284:setText("Slow");
    obj.checkBox284:setField("immSlow");
    obj.checkBox284:setName("checkBox284");

    obj.checkBox285 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox285:setParent(obj.layout40);
    obj.checkBox285:setLeft(000);
    obj.checkBox285:setTop(075);
    obj.checkBox285:setHeight(20);
    obj.checkBox285:setWidth(110);
    obj.checkBox285:setText("Zombie");
    obj.checkBox285:setField("immZombie");
    obj.checkBox285:setName("checkBox285");

    obj.checkBox286 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox286:setParent(obj.layout40);
    obj.checkBox286:setLeft(115);
    obj.checkBox286:setTop(075);
    obj.checkBox286:setHeight(20);
    obj.checkBox286:setWidth(110);
    obj.checkBox286:setText("Lock");
    obj.checkBox286:setField("immLock");
    obj.checkBox286:setName("checkBox286");

    obj.checkBox287 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox287:setParent(obj.layout40);
    obj.checkBox287:setLeft(240);
    obj.checkBox287:setTop(075);
    obj.checkBox287:setHeight(20);
    obj.checkBox287:setWidth(110);
    obj.checkBox287:setText("Condemn");
    obj.checkBox287:setField("immCondemn");
    obj.checkBox287:setName("checkBox287");

    obj.checkBox288 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox288:setParent(obj.layout40);
    obj.checkBox288:setLeft(000);
    obj.checkBox288:setTop(100);
    obj.checkBox288:setHeight(20);
    obj.checkBox288:setWidth(110);
    obj.checkBox288:setText("Confuse");
    obj.checkBox288:setField("immConfuse");
    obj.checkBox288:setName("checkBox288");

    obj.checkBox289 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox289:setParent(obj.layout40);
    obj.checkBox289:setLeft(115);
    obj.checkBox289:setTop(100);
    obj.checkBox289:setHeight(20);
    obj.checkBox289:setWidth(110);
    obj.checkBox289:setText("Curse");
    obj.checkBox289:setField("immCurse");
    obj.checkBox289:setName("checkBox289");

    obj.checkBox290 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox290:setParent(obj.layout40);
    obj.checkBox290:setLeft(240);
    obj.checkBox290:setTop(100);
    obj.checkBox290:setHeight(20);
    obj.checkBox290:setWidth(110);
    obj.checkBox290:setText("Disable");
    obj.checkBox290:setField("immDisable");
    obj.checkBox290:setName("checkBox290");

    obj.checkBox291 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox291:setParent(obj.layout40);
    obj.checkBox291:setLeft(000);
    obj.checkBox291:setTop(125);
    obj.checkBox291:setHeight(20);
    obj.checkBox291:setWidth(110);
    obj.checkBox291:setText("Petrify");
    obj.checkBox291:setField("immPetrify");
    obj.checkBox291:setName("checkBox291");

    obj.checkBox292 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox292:setParent(obj.layout40);
    obj.checkBox292:setLeft(115);
    obj.checkBox292:setTop(125);
    obj.checkBox292:setHeight(20);
    obj.checkBox292:setWidth(110);
    obj.checkBox292:setText("Silence");
    obj.checkBox292:setField("immSilence");
    obj.checkBox292:setName("checkBox292");

    obj.checkBox293 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox293:setParent(obj.layout40);
    obj.checkBox293:setLeft(240);
    obj.checkBox293:setTop(125);
    obj.checkBox293:setHeight(20);
    obj.checkBox293:setWidth(110);
    obj.checkBox293:setText("Sap");
    obj.checkBox293:setField("immSap");
    obj.checkBox293:setName("checkBox293");

    obj.checkBox294 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox294:setParent(obj.layout40);
    obj.checkBox294:setLeft(000);
    obj.checkBox294:setTop(150);
    obj.checkBox294:setHeight(20);
    obj.checkBox294:setWidth(110);
    obj.checkBox294:setText("Unaware");
    obj.checkBox294:setField("immUnaware");
    obj.checkBox294:setName("checkBox294");

    obj.checkBox295 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox295:setParent(obj.layout40);
    obj.checkBox295:setLeft(115);
    obj.checkBox295:setTop(150);
    obj.checkBox295:setHeight(20);
    obj.checkBox295:setWidth(110);
    obj.checkBox295:setText("Eject");
    obj.checkBox295:setField("immEject");
    obj.checkBox295:setName("checkBox295");

    obj.checkBox296 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox296:setParent(obj.layout40);
    obj.checkBox296:setLeft(240);
    obj.checkBox296:setTop(150);
    obj.checkBox296:setHeight(20);
    obj.checkBox296:setWidth(110);
    obj.checkBox296:setText("Mini");
    obj.checkBox296:setField("immMini");
    obj.checkBox296:setName("checkBox296");

    obj.checkBox297 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox297:setParent(obj.layout40);
    obj.checkBox297:setLeft(000);
    obj.checkBox297:setTop(175);
    obj.checkBox297:setHeight(20);
    obj.checkBox297:setWidth(110);
    obj.checkBox297:setText("Strength Down");
    obj.checkBox297:setField("immSTRDown");
    obj.checkBox297:setName("checkBox297");

    obj.checkBox298 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox298:setParent(obj.layout40);
    obj.checkBox298:setLeft(115);
    obj.checkBox298:setTop(175);
    obj.checkBox298:setHeight(20);
    obj.checkBox298:setWidth(110);
    obj.checkBox298:setText("Agility Down");
    obj.checkBox298:setField("immAGIDown");
    obj.checkBox298:setName("checkBox298");

    obj.checkBox299 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox299:setParent(obj.layout40);
    obj.checkBox299:setLeft(240);
    obj.checkBox299:setTop(175);
    obj.checkBox299:setHeight(20);
    obj.checkBox299:setWidth(110);
    obj.checkBox299:setText("Magic Down");
    obj.checkBox299:setField("immMAGDown");
    obj.checkBox299:setName("checkBox299");

    obj.checkBox300 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox300:setParent(obj.layout40);
    obj.checkBox300:setLeft(000);
    obj.checkBox300:setTop(200);
    obj.checkBox300:setHeight(20);
    obj.checkBox300:setWidth(110);
    obj.checkBox300:setText("Mental Down");
    obj.checkBox300:setField("immMENDown");
    obj.checkBox300:setName("checkBox300");

    obj.checkBox301 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox301:setParent(obj.layout40);
    obj.checkBox301:setLeft(115);
    obj.checkBox301:setTop(200);
    obj.checkBox301:setHeight(20);
    obj.checkBox301:setWidth(110);
    obj.checkBox301:setText("Armor Down");
    obj.checkBox301:setField("immARMDown");
    obj.checkBox301:setName("checkBox301");

    obj.checkBox302 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox302:setParent(obj.layout40);
    obj.checkBox302:setLeft(240);
    obj.checkBox302:setTop(200);
    obj.checkBox302:setHeight(20);
    obj.checkBox302:setWidth(110);
    obj.checkBox302:setText("Spirit Down");
    obj.checkBox302:setField("immSPIDown");
    obj.checkBox302:setName("checkBox302");

    obj.checkBox303 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox303:setParent(obj.layout40);
    obj.checkBox303:setLeft(000);
    obj.checkBox303:setTop(225);
    obj.checkBox303:setHeight(20);
    obj.checkBox303:setWidth(110);
    obj.checkBox303:setText("Strength Break");
    obj.checkBox303:setField("immSTRBrk");
    obj.checkBox303:setName("checkBox303");

    obj.checkBox304 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox304:setParent(obj.layout40);
    obj.checkBox304:setLeft(115);
    obj.checkBox304:setTop(225);
    obj.checkBox304:setHeight(20);
    obj.checkBox304:setWidth(110);
    obj.checkBox304:setText("Agility Break");
    obj.checkBox304:setField("immAGIBrk");
    obj.checkBox304:setName("checkBox304");

    obj.checkBox305 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox305:setParent(obj.layout40);
    obj.checkBox305:setLeft(240);
    obj.checkBox305:setTop(225);
    obj.checkBox305:setHeight(20);
    obj.checkBox305:setWidth(110);
    obj.checkBox305:setText("Magic Break");
    obj.checkBox305:setField("immMAGBrk");
    obj.checkBox305:setName("checkBox305");

    obj.checkBox306 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox306:setParent(obj.layout40);
    obj.checkBox306:setLeft(000);
    obj.checkBox306:setTop(250);
    obj.checkBox306:setHeight(20);
    obj.checkBox306:setWidth(110);
    obj.checkBox306:setText("Mental Break");
    obj.checkBox306:setField("immMENBrk");
    obj.checkBox306:setName("checkBox306");

    obj.checkBox307 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox307:setParent(obj.layout40);
    obj.checkBox307:setLeft(115);
    obj.checkBox307:setTop(250);
    obj.checkBox307:setHeight(20);
    obj.checkBox307:setWidth(110);
    obj.checkBox307:setText("Armor Break");
    obj.checkBox307:setField("immARMBrk");
    obj.checkBox307:setName("checkBox307");

    obj.checkBox308 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox308:setParent(obj.layout40);
    obj.checkBox308:setLeft(240);
    obj.checkBox308:setTop(250);
    obj.checkBox308:setHeight(20);
    obj.checkBox308:setWidth(110);
    obj.checkBox308:setText("Spirit Break");
    obj.checkBox308:setField("immSPIBrk");
    obj.checkBox308:setName("checkBox308");

    obj.checkBox309 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox309:setParent(obj.layout40);
    obj.checkBox309:setLeft(000);
    obj.checkBox309:setTop(275);
    obj.checkBox309:setHeight(20);
    obj.checkBox309:setWidth(110);
    obj.checkBox309:setText("Stop");
    obj.checkBox309:setField("immStop");
    obj.checkBox309:setName("checkBox309");

    obj.checkBox310 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox310:setParent(obj.layout40);
    obj.checkBox310:setLeft(115);
    obj.checkBox310:setTop(275);
    obj.checkBox310:setHeight(20);
    obj.checkBox310:setWidth(110);
    obj.checkBox310:setText("Toad");
    obj.checkBox310:setField("immToad");
    obj.checkBox310:setName("checkBox310");

    obj.checkBox311 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox311:setParent(obj.layout40);
    obj.checkBox311:setLeft(240);
    obj.checkBox311:setTop(275);
    obj.checkBox311:setHeight(20);
    obj.checkBox311:setWidth(110);
    obj.checkBox311:setText("Venom");
    obj.checkBox311:setField("immVenom");
    obj.checkBox311:setName("checkBox311");

    obj.checkBox312 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox312:setParent(obj.layout40);
    obj.checkBox312:setLeft(000);
    obj.checkBox312:setTop(300);
    obj.checkBox312:setHeight(20);
    obj.checkBox312:setWidth(110);
    obj.checkBox312:setText("Element Weak");
    obj.checkBox312:setField("immElemWeak");
    obj.checkBox312:setName("checkBox312");

    obj.checkBox313 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox313:setParent(obj.layout40);
    obj.checkBox313:setLeft(115);
    obj.checkBox313:setTop(300);
    obj.checkBox313:setHeight(20);
    obj.checkBox313:setWidth(110);
    obj.checkBox313:setText("Charm");
    obj.checkBox313:setField("immCharm");
    obj.checkBox313:setName("checkBox313");

    obj.checkBox314 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox314:setParent(obj.layout40);
    obj.checkBox314:setLeft(240);
    obj.checkBox314:setTop(300);
    obj.checkBox314:setHeight(20);
    obj.checkBox314:setWidth(110);
    obj.checkBox314:setText("Death");
    obj.checkBox314:setField("immDeath");
    obj.checkBox314:setName("checkBox314");

    obj.checkBox315 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox315:setParent(obj.layout40);
    obj.checkBox315:setLeft(000);
    obj.checkBox315:setTop(325);
    obj.checkBox315:setHeight(20);
    obj.checkBox315:setWidth(110);
    obj.checkBox315:setText("Frozen");
    obj.checkBox315:setField("immFrozen");
    obj.checkBox315:setName("checkBox315");

    obj.checkBox316 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox316:setParent(obj.layout40);
    obj.checkBox316:setLeft(115);
    obj.checkBox316:setTop(325);
    obj.checkBox316:setHeight(20);
    obj.checkBox316:setWidth(110);
    obj.checkBox316:setText("Gravity");
    obj.checkBox316:setField("immGravity");
    obj.checkBox316:setName("checkBox316");

    obj.checkBox317 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox317:setParent(obj.layout40);
    obj.checkBox317:setLeft(240);
    obj.checkBox317:setTop(325);
    obj.checkBox317:setHeight(20);
    obj.checkBox317:setWidth(110);
    obj.checkBox317:setText("Heat");
    obj.checkBox317:setField("immHeat");
    obj.checkBox317:setName("checkBox317");

    obj.checkBox318 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox318:setParent(obj.layout40);
    obj.checkBox318:setLeft(000);
    obj.checkBox318:setTop(350);
    obj.checkBox318:setHeight(20);
    obj.checkBox318:setWidth(110);
    obj.checkBox318:setText("Meltdown");
    obj.checkBox318:setField("immMeltdown");
    obj.checkBox318:setName("checkBox318");

    obj.checkBox319 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox319:setParent(obj.layout40);
    obj.checkBox319:setLeft(115);
    obj.checkBox319:setTop(350);
    obj.checkBox319:setHeight(20);
    obj.checkBox319:setWidth(110);
    obj.checkBox319:setText("Stone");
    obj.checkBox319:setField("immStone");
    obj.checkBox319:setName("checkBox319");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.tab9);
    obj.layout41:setLeft(10);
    obj.layout41:setTop(400);
    obj.layout41:setHeight(97);
    obj.layout41:setWidth(380);
    obj.layout41:setName("layout41");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout41);
    obj.rectangle13:setLeft(000);
    obj.rectangle13:setTop(000);
    obj.rectangle13:setWidth(380);
    obj.rectangle13:setHeight(600);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(5);
    obj.rectangle13:setName("rectangle13");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout41);
    obj.label160:setLeft(000);
    obj.label160:setTop(000);
    obj.label160:setHeight(20);
    obj.label160:setWidth(200);
    obj.label160:setText("Status Resistance (Category)");
    obj.label160:setAutoSize(true);
    obj.label160:setHitTest(true);
    obj.label160:setHint("The monster is partially immune to the effects of one of the Status Condition categories outlined in Chapter 7. \n Any rolls to inflict a Status Condition belonging to this category have their CoS halved. Gil and XP modifiers depend on the exact category the monster resists");
    obj.label160:setName("label160");

    obj.checkBox320 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox320:setParent(obj.layout41);
    obj.checkBox320:setLeft(000);
    obj.checkBox320:setTop(025);
    obj.checkBox320:setHeight(20);
    obj.checkBox320:setWidth(110);
    obj.checkBox320:setText("Fatal");
    obj.checkBox320:setField("resFatal");
    obj.checkBox320:setName("checkBox320");

    obj.checkBox321 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox321:setParent(obj.layout41);
    obj.checkBox321:setLeft(115);
    obj.checkBox321:setTop(025);
    obj.checkBox321:setHeight(20);
    obj.checkBox321:setWidth(110);
    obj.checkBox321:setText("Mystify");
    obj.checkBox321:setField("resMystify");
    obj.checkBox321:setName("checkBox321");

    obj.checkBox322 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox322:setParent(obj.layout41);
    obj.checkBox322:setLeft(240);
    obj.checkBox322:setTop(025);
    obj.checkBox322:setHeight(20);
    obj.checkBox322:setWidth(110);
    obj.checkBox322:setText("Seal");
    obj.checkBox322:setField("resSeal");
    obj.checkBox322:setName("checkBox322");

    obj.checkBox323 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox323:setParent(obj.layout41);
    obj.checkBox323:setLeft(000);
    obj.checkBox323:setTop(050);
    obj.checkBox323:setHeight(20);
    obj.checkBox323:setWidth(110);
    obj.checkBox323:setText("Time");
    obj.checkBox323:setField("resTime");
    obj.checkBox323:setName("checkBox323");

    obj.checkBox324 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox324:setParent(obj.layout41);
    obj.checkBox324:setLeft(115);
    obj.checkBox324:setTop(050);
    obj.checkBox324:setHeight(20);
    obj.checkBox324:setWidth(110);
    obj.checkBox324:setText("Toxin");
    obj.checkBox324:setField("resToxin");
    obj.checkBox324:setName("checkBox324");

    obj.checkBox325 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox325:setParent(obj.layout41);
    obj.checkBox325:setLeft(240);
    obj.checkBox325:setTop(050);
    obj.checkBox325:setHeight(20);
    obj.checkBox325:setWidth(110);
    obj.checkBox325:setText("Transform");
    obj.checkBox325:setField("resTransform");
    obj.checkBox325:setName("checkBox325");

    obj.checkBox326 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox326:setParent(obj.layout41);
    obj.checkBox326:setLeft(000);
    obj.checkBox326:setTop(075);
    obj.checkBox326:setHeight(20);
    obj.checkBox326:setWidth(110);
    obj.checkBox326:setText("Weaken");
    obj.checkBox326:setField("resWeaken");
    obj.checkBox326:setName("checkBox326");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.tab9);
    obj.layout42:setLeft(400);
    obj.layout42:setTop(400);
    obj.layout42:setHeight(97);
    obj.layout42:setWidth(380);
    obj.layout42:setName("layout42");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout42);
    obj.rectangle14:setLeft(000);
    obj.rectangle14:setTop(000);
    obj.rectangle14:setWidth(380);
    obj.rectangle14:setHeight(600);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(5);
    obj.rectangle14:setName("rectangle14");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout42);
    obj.label161:setLeft(000);
    obj.label161:setTop(000);
    obj.label161:setHeight(20);
    obj.label161:setWidth(200);
    obj.label161:setText("Status Immunity (Category)");
    obj.label161:setAutoSize(true);
    obj.label161:setHitTest(true);
    obj.label161:setHint("The monster is wholly immune to the effects of one of the Status Condition categories outlined in Chapter 7. \n Any rolls to inflict a Status Condition belonging to this category have a CoS of 0. Gil and XP modifiers depend on the exact category the monster is Immune to");
    obj.label161:setName("label161");

    obj.checkBox327 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox327:setParent(obj.layout42);
    obj.checkBox327:setLeft(000);
    obj.checkBox327:setTop(025);
    obj.checkBox327:setHeight(20);
    obj.checkBox327:setWidth(110);
    obj.checkBox327:setText("Fatal");
    obj.checkBox327:setField("immFatal");
    obj.checkBox327:setName("checkBox327");

    obj.checkBox328 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox328:setParent(obj.layout42);
    obj.checkBox328:setLeft(115);
    obj.checkBox328:setTop(025);
    obj.checkBox328:setHeight(20);
    obj.checkBox328:setWidth(110);
    obj.checkBox328:setText("Mystify");
    obj.checkBox328:setField("immMystify");
    obj.checkBox328:setName("checkBox328");

    obj.checkBox329 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox329:setParent(obj.layout42);
    obj.checkBox329:setLeft(240);
    obj.checkBox329:setTop(025);
    obj.checkBox329:setHeight(20);
    obj.checkBox329:setWidth(110);
    obj.checkBox329:setText("Seal");
    obj.checkBox329:setField("immSeal");
    obj.checkBox329:setName("checkBox329");

    obj.checkBox330 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox330:setParent(obj.layout42);
    obj.checkBox330:setLeft(000);
    obj.checkBox330:setTop(050);
    obj.checkBox330:setHeight(20);
    obj.checkBox330:setWidth(110);
    obj.checkBox330:setText("Time");
    obj.checkBox330:setField("immTime");
    obj.checkBox330:setName("checkBox330");

    obj.checkBox331 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox331:setParent(obj.layout42);
    obj.checkBox331:setLeft(115);
    obj.checkBox331:setTop(050);
    obj.checkBox331:setHeight(20);
    obj.checkBox331:setWidth(110);
    obj.checkBox331:setText("Toxin");
    obj.checkBox331:setField("immToxin");
    obj.checkBox331:setName("checkBox331");

    obj.checkBox332 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox332:setParent(obj.layout42);
    obj.checkBox332:setLeft(240);
    obj.checkBox332:setTop(050);
    obj.checkBox332:setHeight(20);
    obj.checkBox332:setWidth(110);
    obj.checkBox332:setText("Transform");
    obj.checkBox332:setField("immTransform");
    obj.checkBox332:setName("checkBox332");

    obj.checkBox333 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox333:setParent(obj.layout42);
    obj.checkBox333:setLeft(000);
    obj.checkBox333:setTop(075);
    obj.checkBox333:setHeight(20);
    obj.checkBox333:setWidth(110);
    obj.checkBox333:setText("Weaken");
    obj.checkBox333:setField("immWeaken");
    obj.checkBox333:setName("checkBox333");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.tab9);
    obj.layout43:setLeft(650);
    obj.layout43:setTop(010);
    obj.layout43:setHeight(76);
    obj.layout43:setWidth(475);
    obj.layout43:setName("layout43");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout43);
    obj.label162:setLeft(000);
    obj.label162:setTop(000);
    obj.label162:setHeight(20);
    obj.label162:setWidth(10);
    obj.label162:setText("E");
    obj.label162:setAutoSize(true);
    obj.label162:setName("label162");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout43);
    obj.edit165:setLeft(015);
    obj.edit165:setTop(000);
    obj.edit165:setHeight(20);
    obj.edit165:setWidth(40);
    obj.edit165:setField("ExpFinal");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setName("edit165");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout43);
    obj.label163:setLeft(070);
    obj.label163:setTop(000);
    obj.label163:setHeight(20);
    obj.label163:setWidth(10);
    obj.label163:setText("G");
    obj.label163:setAutoSize(true);
    obj.label163:setName("label163");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout43);
    obj.edit166:setLeft(95);
    obj.edit166:setTop(000);
    obj.edit166:setHeight(20);
    obj.edit166:setWidth(40);
    obj.edit166:setField("GilFinal");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setName("edit166");

    obj.tab10 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Sup. 4");
    obj.tab10:setName("tab10");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.tab10);
    obj.layout44:setLeft(10);
    obj.layout44:setTop(10);
    obj.layout44:setHeight(360);
    obj.layout44:setWidth(390);
    obj.layout44:setName("layout44");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout44);
    obj.rectangle15:setLeft(000);
    obj.rectangle15:setTop(000);
    obj.rectangle15:setWidth(390);
    obj.rectangle15:setHeight(600);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(5);
    obj.rectangle15:setName("rectangle15");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout44);
    obj.label164:setLeft(000);
    obj.label164:setTop(000);
    obj.label164:setHeight(20);
    obj.label164:setWidth(200);
    obj.label164:setText("Weak Spot");
    obj.label164:setAutoSize(true);
    obj.label164:setHitTest(true);
    obj.label164:setHint("The monster is vulnerable to a certain kind of attack or effect. Select a single Ability, Item, or damage type as a vulnerability when adding Weak Spot to a monster, as well as one or more negative Status Conditions. \n If an attack or effect the monster is vulnerable to is used on it, the selected Status Condition – or Conditions – will automatically be added to the monster. XP and Gil modifiers for Weak Spot depend on the actual Condition inflicted, and are given per Status – to have a monster suffer from Confuse and Slow if struck by Lightning Elemental damage, for instance, incurs a modifier of -29/9.");
    obj.label164:setName("label164");

    obj.checkBox334 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox334:setParent(obj.layout44);
    obj.checkBox334:setLeft(000);
    obj.checkBox334:setTop(025);
    obj.checkBox334:setHeight(20);
    obj.checkBox334:setWidth(125);
    obj.checkBox334:setText("Berserk (4)");
    obj.checkBox334:setField("weakBerserk");
    obj.checkBox334:setName("checkBox334");

    obj.checkBox335 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox335:setParent(obj.layout44);
    obj.checkBox335:setLeft(130);
    obj.checkBox335:setTop(025);
    obj.checkBox335:setHeight(20);
    obj.checkBox335:setWidth(125);
    obj.checkBox335:setText("Blind (4)");
    obj.checkBox335:setField("weakBlind");
    obj.checkBox335:setName("checkBox335");

    obj.checkBox336 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox336:setParent(obj.layout44);
    obj.checkBox336:setLeft(255);
    obj.checkBox336:setTop(025);
    obj.checkBox336:setHeight(20);
    obj.checkBox336:setWidth(125);
    obj.checkBox336:setText("Curse (4)");
    obj.checkBox336:setField("weakCurse");
    obj.checkBox336:setName("checkBox336");

    obj.checkBox337 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox337:setParent(obj.layout44);
    obj.checkBox337:setLeft(000);
    obj.checkBox337:setTop(050);
    obj.checkBox337:setHeight(20);
    obj.checkBox337:setWidth(125);
    obj.checkBox337:setText("Disable (4)");
    obj.checkBox337:setField("weakDisable");
    obj.checkBox337:setName("checkBox337");

    obj.checkBox338 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox338:setParent(obj.layout44);
    obj.checkBox338:setLeft(130);
    obj.checkBox338:setTop(050);
    obj.checkBox338:setHeight(20);
    obj.checkBox338:setWidth(125);
    obj.checkBox338:setText("Immobilize (4)");
    obj.checkBox338:setField("weakImmobilize");
    obj.checkBox338:setName("checkBox338");

    obj.checkBox339 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox339:setParent(obj.layout44);
    obj.checkBox339:setLeft(255);
    obj.checkBox339:setTop(050);
    obj.checkBox339:setHeight(20);
    obj.checkBox339:setWidth(125);
    obj.checkBox339:setText("Poison (inf)");
    obj.checkBox339:setField("weakPoison");
    obj.checkBox339:setName("checkBox339");

    obj.checkBox340 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox340:setParent(obj.layout44);
    obj.checkBox340:setLeft(000);
    obj.checkBox340:setTop(075);
    obj.checkBox340:setHeight(20);
    obj.checkBox340:setWidth(125);
    obj.checkBox340:setText("Silence (4)");
    obj.checkBox340:setField("weakSilence");
    obj.checkBox340:setName("checkBox340");

    obj.checkBox341 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox341:setParent(obj.layout44);
    obj.checkBox341:setLeft(130);
    obj.checkBox341:setTop(075);
    obj.checkBox341:setHeight(20);
    obj.checkBox341:setWidth(125);
    obj.checkBox341:setText("Sleep (4)");
    obj.checkBox341:setField("weakSleep");
    obj.checkBox341:setName("checkBox341");

    obj.checkBox342 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox342:setParent(obj.layout44);
    obj.checkBox342:setLeft(255);
    obj.checkBox342:setTop(075);
    obj.checkBox342:setHeight(20);
    obj.checkBox342:setWidth(125);
    obj.checkBox342:setText("Slow (4)");
    obj.checkBox342:setField("weakSlow");
    obj.checkBox342:setName("checkBox342");

    obj.checkBox343 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox343:setParent(obj.layout44);
    obj.checkBox343:setLeft(000);
    obj.checkBox343:setTop(100);
    obj.checkBox343:setHeight(20);
    obj.checkBox343:setWidth(125);
    obj.checkBox343:setText("Condemned (4)");
    obj.checkBox343:setField("weakCondemn");
    obj.checkBox343:setName("checkBox343");

    obj.checkBox344 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox344:setParent(obj.layout44);
    obj.checkBox344:setLeft(130);
    obj.checkBox344:setTop(100);
    obj.checkBox344:setHeight(20);
    obj.checkBox344:setWidth(125);
    obj.checkBox344:setText("Confuse (4)");
    obj.checkBox344:setField("weakConfuse");
    obj.checkBox344:setName("checkBox344");

    obj.checkBox345 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox345:setParent(obj.layout44);
    obj.checkBox345:setLeft(255);
    obj.checkBox345:setTop(100);
    obj.checkBox345:setHeight(20);
    obj.checkBox345:setWidth(125);
    obj.checkBox345:setText("Petrify (4)");
    obj.checkBox345:setField("weakPetrify");
    obj.checkBox345:setName("checkBox345");

    obj.checkBox346 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox346:setParent(obj.layout44);
    obj.checkBox346:setLeft(000);
    obj.checkBox346:setTop(125);
    obj.checkBox346:setHeight(20);
    obj.checkBox346:setWidth(125);
    obj.checkBox346:setText("Strength Down (6)");
    obj.checkBox346:setField("weakSTRDown");
    obj.checkBox346:setName("checkBox346");

    obj.checkBox347 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox347:setParent(obj.layout44);
    obj.checkBox347:setLeft(130);
    obj.checkBox347:setTop(125);
    obj.checkBox347:setHeight(20);
    obj.checkBox347:setWidth(125);
    obj.checkBox347:setText("Agility Down (6)");
    obj.checkBox347:setField("weakAGIDown");
    obj.checkBox347:setName("checkBox347");

    obj.checkBox348 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox348:setParent(obj.layout44);
    obj.checkBox348:setLeft(255);
    obj.checkBox348:setTop(125);
    obj.checkBox348:setHeight(20);
    obj.checkBox348:setWidth(125);
    obj.checkBox348:setText("Magic Down (6)");
    obj.checkBox348:setField("weakMAGDown");
    obj.checkBox348:setName("checkBox348");

    obj.checkBox349 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox349:setParent(obj.layout44);
    obj.checkBox349:setLeft(000);
    obj.checkBox349:setTop(150);
    obj.checkBox349:setHeight(20);
    obj.checkBox349:setWidth(125);
    obj.checkBox349:setText("Mental Down (6)");
    obj.checkBox349:setField("weakMENDown");
    obj.checkBox349:setName("checkBox349");

    obj.checkBox350 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox350:setParent(obj.layout44);
    obj.checkBox350:setLeft(130);
    obj.checkBox350:setTop(150);
    obj.checkBox350:setHeight(20);
    obj.checkBox350:setWidth(125);
    obj.checkBox350:setText("Armor Down (6)");
    obj.checkBox350:setField("weakARMDown");
    obj.checkBox350:setName("checkBox350");

    obj.checkBox351 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox351:setParent(obj.layout44);
    obj.checkBox351:setLeft(255);
    obj.checkBox351:setTop(150);
    obj.checkBox351:setHeight(20);
    obj.checkBox351:setWidth(125);
    obj.checkBox351:setText("Spirit Down (6)");
    obj.checkBox351:setField("weakSPIDown");
    obj.checkBox351:setName("checkBox351");

    obj.checkBox352 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox352:setParent(obj.layout44);
    obj.checkBox352:setLeft(000);
    obj.checkBox352:setTop(175);
    obj.checkBox352:setHeight(20);
    obj.checkBox352:setWidth(125);
    obj.checkBox352:setText("Sap (4)");
    obj.checkBox352:setField("weakSap");
    obj.checkBox352:setName("checkBox352");

    obj.checkBox353 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox353:setParent(obj.layout44);
    obj.checkBox353:setLeft(130);
    obj.checkBox353:setTop(175);
    obj.checkBox353:setHeight(20);
    obj.checkBox353:setWidth(125);
    obj.checkBox353:setText("Unaware (1)");
    obj.checkBox353:setField("weakUnaware");
    obj.checkBox353:setName("checkBox353");

    obj.checkBox354 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox354:setParent(obj.layout44);
    obj.checkBox354:setLeft(255);
    obj.checkBox354:setTop(175);
    obj.checkBox354:setHeight(20);
    obj.checkBox354:setWidth(125);
    obj.checkBox354:setText("Eject");
    obj.checkBox354:setField("weakEject");
    obj.checkBox354:setName("checkBox354");

    obj.checkBox355 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox355:setParent(obj.layout44);
    obj.checkBox355:setLeft(000);
    obj.checkBox355:setTop(200);
    obj.checkBox355:setHeight(20);
    obj.checkBox355:setWidth(125);
    obj.checkBox355:setText("Mini (4)");
    obj.checkBox355:setField("weakMini");
    obj.checkBox355:setName("checkBox355");

    obj.checkBox356 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox356:setParent(obj.layout44);
    obj.checkBox356:setLeft(130);
    obj.checkBox356:setTop(200);
    obj.checkBox356:setHeight(20);
    obj.checkBox356:setWidth(125);
    obj.checkBox356:setText("Toad (4)");
    obj.checkBox356:setField("weakToad");
    obj.checkBox356:setName("checkBox356");

    obj.checkBox357 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox357:setParent(obj.layout44);
    obj.checkBox357:setLeft(255);
    obj.checkBox357:setTop(200);
    obj.checkBox357:setHeight(20);
    obj.checkBox357:setWidth(125);
    obj.checkBox357:setText("Strength Break (6)");
    obj.checkBox357:setField("weakSTRBrk");
    obj.checkBox357:setName("checkBox357");

    obj.checkBox358 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox358:setParent(obj.layout44);
    obj.checkBox358:setLeft(000);
    obj.checkBox358:setTop(225);
    obj.checkBox358:setHeight(20);
    obj.checkBox358:setWidth(125);
    obj.checkBox358:setText("Agility Break (6)");
    obj.checkBox358:setField("weakAGIBrk");
    obj.checkBox358:setName("checkBox358");

    obj.checkBox359 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox359:setParent(obj.layout44);
    obj.checkBox359:setLeft(130);
    obj.checkBox359:setTop(225);
    obj.checkBox359:setHeight(20);
    obj.checkBox359:setWidth(125);
    obj.checkBox359:setText("Magic Break (6)");
    obj.checkBox359:setField("weakMAGBrk");
    obj.checkBox359:setName("checkBox359");

    obj.checkBox360 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox360:setParent(obj.layout44);
    obj.checkBox360:setLeft(255);
    obj.checkBox360:setTop(225);
    obj.checkBox360:setHeight(20);
    obj.checkBox360:setWidth(125);
    obj.checkBox360:setText("Mental Break (6)");
    obj.checkBox360:setField("weakMENBrk");
    obj.checkBox360:setName("checkBox360");

    obj.checkBox361 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox361:setParent(obj.layout44);
    obj.checkBox361:setLeft(000);
    obj.checkBox361:setTop(250);
    obj.checkBox361:setHeight(20);
    obj.checkBox361:setWidth(125);
    obj.checkBox361:setText("Armor Break (6)");
    obj.checkBox361:setField("weakARMBrk");
    obj.checkBox361:setName("checkBox361");

    obj.checkBox362 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox362:setParent(obj.layout44);
    obj.checkBox362:setLeft(130);
    obj.checkBox362:setTop(250);
    obj.checkBox362:setHeight(20);
    obj.checkBox362:setWidth(125);
    obj.checkBox362:setText("Spirit Break (6)");
    obj.checkBox362:setField("weakSPIBrk");
    obj.checkBox362:setName("checkBox362");

    obj.checkBox363 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox363:setParent(obj.layout44);
    obj.checkBox363:setLeft(255);
    obj.checkBox363:setTop(250);
    obj.checkBox363:setHeight(20);
    obj.checkBox363:setWidth(125);
    obj.checkBox363:setText("Stop (4)");
    obj.checkBox363:setField("weakStop");
    obj.checkBox363:setName("checkBox363");

    obj.checkBox364 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox364:setParent(obj.layout44);
    obj.checkBox364:setLeft(000);
    obj.checkBox364:setTop(275);
    obj.checkBox364:setHeight(20);
    obj.checkBox364:setWidth(125);
    obj.checkBox364:setText("Venom (4)");
    obj.checkBox364:setField("weakVenom");
    obj.checkBox364:setName("checkBox364");

    obj.checkBox365 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox365:setParent(obj.layout44);
    obj.checkBox365:setLeft(130);
    obj.checkBox365:setTop(275);
    obj.checkBox365:setHeight(20);
    obj.checkBox365:setWidth(125);
    obj.checkBox365:setText("Zombie (inf)");
    obj.checkBox365:setField("weakZombie");
    obj.checkBox365:setName("checkBox365");

    obj.checkBox366 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox366:setParent(obj.layout44);
    obj.checkBox366:setLeft(255);
    obj.checkBox366:setTop(275);
    obj.checkBox366:setHeight(20);
    obj.checkBox366:setWidth(125);
    obj.checkBox366:setText("Charm (4)");
    obj.checkBox366:setField("weakCharm");
    obj.checkBox366:setName("checkBox366");

    obj.checkBox367 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox367:setParent(obj.layout44);
    obj.checkBox367:setLeft(000);
    obj.checkBox367:setTop(300);
    obj.checkBox367:setHeight(20);
    obj.checkBox367:setWidth(125);
    obj.checkBox367:setText("Death");
    obj.checkBox367:setField("weakDeath");
    obj.checkBox367:setName("checkBox367");

    obj.checkBox368 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox368:setParent(obj.layout44);
    obj.checkBox368:setLeft(130);
    obj.checkBox368:setTop(300);
    obj.checkBox368:setHeight(20);
    obj.checkBox368:setWidth(125);
    obj.checkBox368:setText("Frozen (4)");
    obj.checkBox368:setField("weakFrozen");
    obj.checkBox368:setName("checkBox368");

    obj.checkBox369 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox369:setParent(obj.layout44);
    obj.checkBox369:setLeft(255);
    obj.checkBox369:setTop(300);
    obj.checkBox369:setHeight(20);
    obj.checkBox369:setWidth(125);
    obj.checkBox369:setText("Heat (4)");
    obj.checkBox369:setField("weakHeat");
    obj.checkBox369:setName("checkBox369");

    obj.checkBox370 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox370:setParent(obj.layout44);
    obj.checkBox370:setLeft(000);
    obj.checkBox370:setTop(325);
    obj.checkBox370:setHeight(20);
    obj.checkBox370:setWidth(125);
    obj.checkBox370:setText("Meltdown (2)");
    obj.checkBox370:setField("weakMeltdown");
    obj.checkBox370:setName("checkBox370");

    obj.checkBox371 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox371:setParent(obj.layout44);
    obj.checkBox371:setLeft(130);
    obj.checkBox371:setTop(325);
    obj.checkBox371:setHeight(20);
    obj.checkBox371:setWidth(125);
    obj.checkBox371:setText("Stone (inf)");
    obj.checkBox371:setField("weakStone");
    obj.checkBox371:setName("checkBox371");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.tab10);
    obj.layout45:setLeft(420);
    obj.layout45:setTop(010);
    obj.layout45:setHeight(400);
    obj.layout45:setWidth(380);
    obj.layout45:setName("layout45");

    obj.checkBox372 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox372:setParent(obj.layout45);
    obj.checkBox372:setLeft(000);
    obj.checkBox372:setTop(000);
    obj.checkBox372:setHeight(20);
    obj.checkBox372:setWidth(150);
    obj.checkBox372:setText("Manabound");
    obj.checkBox372:setField("supMBound");
    obj.checkBox372:setHitTest(true);
    obj.checkBox372:setHint("As a creature of pure magic, the monster's mana is its lifeblood. \n A Manabound monster whose Magic Points reach 0 is treated as if its Hit Points had been reduced to 0");
    obj.checkBox372:setName("checkBox372");

    obj.checkBox373 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox373:setParent(obj.layout45);
    obj.checkBox373:setLeft(000);
    obj.checkBox373:setTop(025);
    obj.checkBox373:setHeight(20);
    obj.checkBox373:setWidth(150);
    obj.checkBox373:setText("Minion");
    obj.checkBox373:setField("supMinion");
    obj.checkBox373:setHitTest(true);
    obj.checkBox373:setHint("The monster’s existence is tied to another monster’s, usually a controlling or summoning influence. \n Select a specific monster as the designated ‘master’ when taking Minion; if that monster is reduced to 0 or fewer HP during the course of battle, all Minions attached to it are immediately reduced to 0 HP as well.");
    obj.checkBox373:setName("checkBox373");

    obj.checkBox374 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox374:setParent(obj.layout45);
    obj.checkBox374:setLeft(000);
    obj.checkBox374:setTop(050);
    obj.checkBox374:setHeight(20);
    obj.checkBox374:setWidth(150);
    obj.checkBox374:setText("Mystic Resistance");
    obj.checkBox374:setField("supMRes");
    obj.checkBox374:setHitTest(true);
    obj.checkBox374:setHint("The monster is capable of weathering significantly more magical damage than the norm, allowing it to resist even armorpiercing spells. \n When a monster with Mystic Resistance is struck by any attack or Ability which would normally ignore or reduce M. ARM, M. ARM is factored into the attack as normal. \n Note that this does not affect Status Conditions such as Spirit Break, which continue to work as normal.");
    obj.checkBox374:setName("checkBox374");

    obj.checkBox375 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox375:setParent(obj.layout45);
    obj.checkBox375:setLeft(000);
    obj.checkBox375:setTop(075);
    obj.checkBox375:setHeight(20);
    obj.checkBox375:setWidth(150);
    obj.checkBox375:setText("Null Drain");
    obj.checkBox375:setField("supNDrain");
    obj.checkBox375:setHitTest(true);
    obj.checkBox375:setHint("The monster is immune to attacks which draw on its vital or magical essences. \n Attacks or Abilities that drain HP or MP from a monster with Null Drain do damage as normal, but do not restore the attacker’s Hit Points or Magic Points.");
    obj.checkBox375:setName("checkBox375");

    obj.checkBox376 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox376:setParent(obj.layout45);
    obj.checkBox376:setLeft(000);
    obj.checkBox376:setTop(100);
    obj.checkBox376:setHeight(20);
    obj.checkBox376:setWidth(150);
    obj.checkBox376:setText("Resist Drain");
    obj.checkBox376:setField("supRDrain");
    obj.checkBox376:setHitTest(true);
    obj.checkBox376:setHint("The monster has improved resistance against attacks which draw on its vital or magical essences. \n Attacks or Abilities that drain HP or MP from a monster with Resist Drain do damage as normal, but only restore 50% of the Hit Points or Magic Points the attacker would normally regain from such an Action.");
    obj.checkBox376:setName("checkBox376");

    obj.checkBox377 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox377:setParent(obj.layout45);
    obj.checkBox377:setLeft(000);
    obj.checkBox377:setTop(125);
    obj.checkBox377:setHeight(20);
    obj.checkBox377:setWidth(150);
    obj.checkBox377:setText("X-Fight");
    obj.checkBox377:setField("supXFight");
    obj.checkBox377:setHitTest(true);
    obj.checkBox377:setHint("The monster can take two Attack Actions at the cost of just one Action in battle. \n Targets must be declared separately for each attack, though both may target the same combatant");
    obj.checkBox377:setName("checkBox377");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.tab10);
    obj.layout46:setLeft(650);
    obj.layout46:setTop(010);
    obj.layout46:setHeight(76);
    obj.layout46:setWidth(475);
    obj.layout46:setName("layout46");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout46);
    obj.label165:setLeft(000);
    obj.label165:setTop(000);
    obj.label165:setHeight(20);
    obj.label165:setWidth(10);
    obj.label165:setText("E");
    obj.label165:setAutoSize(true);
    obj.label165:setName("label165");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout46);
    obj.edit167:setLeft(015);
    obj.edit167:setTop(000);
    obj.edit167:setHeight(20);
    obj.edit167:setWidth(40);
    obj.edit167:setField("ExpFinal");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setName("edit167");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout46);
    obj.label166:setLeft(070);
    obj.label166:setTop(000);
    obj.label166:setHeight(20);
    obj.label166:setWidth(10);
    obj.label166:setText("G");
    obj.label166:setAutoSize(true);
    obj.label166:setName("label166");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout46);
    obj.edit168:setLeft(95);
    obj.edit168:setTop(000);
    obj.edit168:setHeight(20);
    obj.edit168:setWidth(40);
    obj.edit168:setField("GilFinal");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setName("edit168");

    obj.tab11 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Reaction");
    obj.tab11:setName("tab11");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.tab11);
    obj.layout47:setLeft(20);
    obj.layout47:setTop(10);
    obj.layout47:setHeight(500);
    obj.layout47:setWidth(300);
    obj.layout47:setName("layout47");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout47);
    obj.label167:setLeft(000);
    obj.label167:setTop(000);
    obj.label167:setHeight(20);
    obj.label167:setWidth(150);
    obj.label167:setText("Counterattack");
    obj.label167:setAutoSize(true);
    obj.label167:setHitTest(true);
    obj.label167:setHint("The monster is capable of responding to enemy attacks with a potent counter-assault. \n Counter Attack triggers when the monster takes Physical damage from an enemy Action, and allows the monster to immediately use a specific Attack, Spell, or Action Ability against that opponent at no Action cost. \n Select one Attack, Spell, or Action Ability to use in conjunction with Counter Attack when taking this Reaction Ability, or create a new one; the XP and Gil costs for Counter Attack depend on its CoS, and are added to the attack’s final value.");
    obj.label167:setName("label167");

    obj.checkBox378 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox378:setParent(obj.layout47);
    obj.checkBox378:setLeft(020);
    obj.checkBox378:setTop(025);
    obj.checkBox378:setHeight(20);
    obj.checkBox378:setWidth(80);
    obj.checkBox378:setText("50%");
    obj.checkBox378:setField("reCAtk50");
    obj.checkBox378:setName("checkBox378");

    obj.checkBox379 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox379:setParent(obj.layout47);
    obj.checkBox379:setLeft(020);
    obj.checkBox379:setTop(050);
    obj.checkBox379:setHeight(20);
    obj.checkBox379:setWidth(80);
    obj.checkBox379:setText("75%");
    obj.checkBox379:setField("reCAtk75");
    obj.checkBox379:setName("checkBox379");

    obj.checkBox380 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox380:setParent(obj.layout47);
    obj.checkBox380:setLeft(020);
    obj.checkBox380:setTop(075);
    obj.checkBox380:setHeight(20);
    obj.checkBox380:setWidth(80);
    obj.checkBox380:setText("100%");
    obj.checkBox380:setField("reCAtk100");
    obj.checkBox380:setName("checkBox380");

    obj.checkBox381 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox381:setParent(obj.layout47);
    obj.checkBox381:setLeft(095);
    obj.checkBox381:setTop(025);
    obj.checkBox381:setHeight(20);
    obj.checkBox381:setWidth(90);
    obj.checkBox381:setText("SOS-Lose");
    obj.checkBox381:setField("reCAtkSOSL");
    obj.checkBox381:setName("checkBox381");

    obj.checkBox382 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox382:setParent(obj.layout47);
    obj.checkBox382:setLeft(095);
    obj.checkBox382:setTop(050);
    obj.checkBox382:setHeight(20);
    obj.checkBox382:setWidth(90);
    obj.checkBox382:setText("SOS-Gain");
    obj.checkBox382:setField("reCAtkSOSG");
    obj.checkBox382:setName("checkBox382");

    obj.checkBox383 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox383:setParent(obj.layout47);
    obj.checkBox383:setLeft(095);
    obj.checkBox383:setTop(075);
    obj.checkBox383:setHeight(20);
    obj.checkBox383:setWidth(90);
    obj.checkBox383:setText("Unsealable");
    obj.checkBox383:setField("reCAtkUns");
    obj.checkBox383:setName("checkBox383");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout47);
    obj.label168:setLeft(000);
    obj.label168:setTop(100);
    obj.label168:setHeight(20);
    obj.label168:setWidth(150);
    obj.label168:setText("Counter Magic");
    obj.label168:setAutoSize(true);
    obj.label168:setHitTest(true);
    obj.label168:setHint("The monster is capable of responding to enemy magic with a potent counter-assault. \n Counter Magic has a CoS of either 30% or 60% of triggering when the monster takes Magical damage from an enemy Action, allowing the monster to immediately use a specific Attack, Spell, or Action Ability against that opponent at no Action cost. \n Select one Attack, Spell, or Action Ability to use in conjunction with Counter Magic when taking this Reaction Ability, or create a new one; the XP and Gil costs for Counter Magic are added to the attack’s final value.");
    obj.label168:setName("label168");

    obj.checkBox384 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox384:setParent(obj.layout47);
    obj.checkBox384:setLeft(020);
    obj.checkBox384:setTop(125);
    obj.checkBox384:setHeight(20);
    obj.checkBox384:setWidth(80);
    obj.checkBox384:setText("30%");
    obj.checkBox384:setField("reCMag50");
    obj.checkBox384:setName("checkBox384");

    obj.checkBox385 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox385:setParent(obj.layout47);
    obj.checkBox385:setLeft(020);
    obj.checkBox385:setTop(150);
    obj.checkBox385:setHeight(20);
    obj.checkBox385:setWidth(80);
    obj.checkBox385:setText("60%");
    obj.checkBox385:setField("reCMag75");
    obj.checkBox385:setName("checkBox385");

    obj.checkBox386 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox386:setParent(obj.layout47);
    obj.checkBox386:setLeft(020);
    obj.checkBox386:setTop(175);
    obj.checkBox386:setHeight(20);
    obj.checkBox386:setWidth(80);
    obj.checkBox386:setText("100%");
    obj.checkBox386:setField("reCMag100");
    obj.checkBox386:setName("checkBox386");

    obj.checkBox387 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox387:setParent(obj.layout47);
    obj.checkBox387:setLeft(095);
    obj.checkBox387:setTop(125);
    obj.checkBox387:setHeight(20);
    obj.checkBox387:setWidth(90);
    obj.checkBox387:setText("SOS-Lose");
    obj.checkBox387:setField("reCMagSOSL");
    obj.checkBox387:setName("checkBox387");

    obj.checkBox388 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox388:setParent(obj.layout47);
    obj.checkBox388:setLeft(095);
    obj.checkBox388:setTop(150);
    obj.checkBox388:setHeight(20);
    obj.checkBox388:setWidth(90);
    obj.checkBox388:setText("SOS-Gain");
    obj.checkBox388:setField("reCMagSOSG");
    obj.checkBox388:setName("checkBox388");

    obj.checkBox389 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox389:setParent(obj.layout47);
    obj.checkBox389:setLeft(095);
    obj.checkBox389:setTop(175);
    obj.checkBox389:setHeight(20);
    obj.checkBox389:setWidth(90);
    obj.checkBox389:setText("Unsealable");
    obj.checkBox389:setField("reCMagUns");
    obj.checkBox389:setName("checkBox389");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout47);
    obj.label169:setLeft(000);
    obj.label169:setTop(200);
    obj.label169:setHeight(20);
    obj.label169:setWidth(150);
    obj.label169:setText("Counter Stance");
    obj.label169:setAutoSize(true);
    obj.label169:setHitTest(true);
    obj.label169:setHint("By entering into a special defensive posture at the cost of an Action, the monster can intercept opponents’ attacks. \n Select an Attack, Action Ability, or Spell for Counter Stance to be attached to, as well as a damage type – Physical or Magical – to respond to. \n For as long as the Counter Stance remains in effect, the monster will counter with the chosen attack when it takes damage of the selected type from an opponent’s Action. \n The monster cannot make any other Actions while in a Counter Stance, but can come out of it as a free action on its turn");
    obj.label169:setName("label169");

    obj.checkBox390 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox390:setParent(obj.layout47);
    obj.checkBox390:setLeft(020);
    obj.checkBox390:setTop(225);
    obj.checkBox390:setHeight(20);
    obj.checkBox390:setWidth(80);
    obj.checkBox390:setText("Physical");
    obj.checkBox390:setField("reCStanPhys");
    obj.checkBox390:setName("checkBox390");

    obj.checkBox391 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox391:setParent(obj.layout47);
    obj.checkBox391:setLeft(020);
    obj.checkBox391:setTop(250);
    obj.checkBox391:setHeight(20);
    obj.checkBox391:setWidth(80);
    obj.checkBox391:setText("Magical");
    obj.checkBox391:setField("reCStanMag");
    obj.checkBox391:setName("checkBox391");

    obj.checkBox392 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox392:setParent(obj.layout47);
    obj.checkBox392:setLeft(095);
    obj.checkBox392:setTop(225);
    obj.checkBox392:setHeight(20);
    obj.checkBox392:setWidth(90);
    obj.checkBox392:setText("SOS-Lose");
    obj.checkBox392:setField("reCStanSOSL");
    obj.checkBox392:setName("checkBox392");

    obj.checkBox393 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox393:setParent(obj.layout47);
    obj.checkBox393:setLeft(095);
    obj.checkBox393:setTop(250);
    obj.checkBox393:setHeight(20);
    obj.checkBox393:setWidth(90);
    obj.checkBox393:setText("SOS-Gain");
    obj.checkBox393:setField("reCStanSOSG");
    obj.checkBox393:setName("checkBox393");

    obj.checkBox394 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox394:setParent(obj.layout47);
    obj.checkBox394:setLeft(095);
    obj.checkBox394:setTop(275);
    obj.checkBox394:setHeight(20);
    obj.checkBox394:setWidth(90);
    obj.checkBox394:setText("Unsealable");
    obj.checkBox394:setField("reCStanUns");
    obj.checkBox394:setName("checkBox394");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout47);
    obj.label170:setLeft(000);
    obj.label170:setTop(300);
    obj.label170:setHeight(20);
    obj.label170:setWidth(150);
    obj.label170:setText("Return Damage");
    obj.label170:setAutoSize(true);
    obj.label170:setHitTest(true);
    obj.label170:setHint("A certain percentage of all damage inflicted on the monster after modifying for ARM and M. ARM is automatically returned to the combatant that originally dealt it. \n The combatant's ARM and M. ARM can be used to further reduce this damage. \n XP and Gil modifiers depend on the exact percentage of damage returned.");
    obj.label170:setName("label170");

    obj.checkBox395 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox395:setParent(obj.layout47);
    obj.checkBox395:setLeft(020);
    obj.checkBox395:setTop(325);
    obj.checkBox395:setHeight(20);
    obj.checkBox395:setWidth(80);
    obj.checkBox395:setText("5%");
    obj.checkBox395:setField("reRD5");
    obj.checkBox395:setName("checkBox395");

    obj.checkBox396 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox396:setParent(obj.layout47);
    obj.checkBox396:setLeft(020);
    obj.checkBox396:setTop(350);
    obj.checkBox396:setHeight(20);
    obj.checkBox396:setWidth(80);
    obj.checkBox396:setText("10%");
    obj.checkBox396:setField("reRD10");
    obj.checkBox396:setName("checkBox396");

    obj.checkBox397 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox397:setParent(obj.layout47);
    obj.checkBox397:setLeft(020);
    obj.checkBox397:setTop(375);
    obj.checkBox397:setHeight(20);
    obj.checkBox397:setWidth(80);
    obj.checkBox397:setText("25%");
    obj.checkBox397:setField("reRD25");
    obj.checkBox397:setName("checkBox397");

    obj.checkBox398 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox398:setParent(obj.layout47);
    obj.checkBox398:setLeft(095);
    obj.checkBox398:setTop(325);
    obj.checkBox398:setHeight(20);
    obj.checkBox398:setWidth(90);
    obj.checkBox398:setText("SOS-Lose");
    obj.checkBox398:setField("reRDSOSL");
    obj.checkBox398:setName("checkBox398");

    obj.checkBox399 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox399:setParent(obj.layout47);
    obj.checkBox399:setLeft(095);
    obj.checkBox399:setTop(350);
    obj.checkBox399:setHeight(20);
    obj.checkBox399:setWidth(90);
    obj.checkBox399:setText("SOS-Gain");
    obj.checkBox399:setField("reRDSOSG");
    obj.checkBox399:setName("checkBox399");

    obj.checkBox400 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox400:setParent(obj.layout47);
    obj.checkBox400:setLeft(095);
    obj.checkBox400:setTop(375);
    obj.checkBox400:setHeight(20);
    obj.checkBox400:setWidth(90);
    obj.checkBox400:setText("Unsealable");
    obj.checkBox400:setField("reRDUns");
    obj.checkBox400:setName("checkBox400");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.tab11);
    obj.layout48:setLeft(350);
    obj.layout48:setTop(10);
    obj.layout48:setHeight(510);
    obj.layout48:setWidth(380);
    obj.layout48:setName("layout48");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout48);
    obj.rectangle16:setLeft(000);
    obj.rectangle16:setTop(000);
    obj.rectangle16:setWidth(380);
    obj.rectangle16:setHeight(255);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("black");
    obj.rectangle16:setStrokeSize(5);
    obj.rectangle16:setName("rectangle16");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout48);
    obj.label171:setLeft(000);
    obj.label171:setTop(000);
    obj.label171:setHeight(20);
    obj.label171:setWidth(100);
    obj.label171:setText("Counter Status");
    obj.label171:setAutoSize(true);
    obj.label171:setHitTest(true);
    obj.label171:setHint("The monster’s power increases in response to the attacks of its opponents. \n Power Up automatically adds a positive Status Condition (4) to the monster when it takes a specific kind of damage – Physical, Magical, or one of the nine kinds of Elemental – from an enemy Action. \n Specify which of the three triggers Counter Status, and select a corresponding Status Condition; XP and Gil values are given per Status added, and depend on the exact Status taken:");
    obj.label171:setName("label171");

    obj.checkBox401 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox401:setParent(obj.layout48);
    obj.checkBox401:setLeft(000);
    obj.checkBox401:setTop(025);
    obj.checkBox401:setHeight(20);
    obj.checkBox401:setWidth(110);
    obj.checkBox401:setText("Float");
    obj.checkBox401:setField("recCSFloat");
    obj.checkBox401:setName("checkBox401");

    obj.checkBox402 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox402:setParent(obj.layout48);
    obj.checkBox402:setLeft(115);
    obj.checkBox402:setTop(025);
    obj.checkBox402:setHeight(20);
    obj.checkBox402:setWidth(110);
    obj.checkBox402:setText("Agility Up");
    obj.checkBox402:setField("recCSAgiUP");
    obj.checkBox402:setName("checkBox402");

    obj.checkBox403 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox403:setParent(obj.layout48);
    obj.checkBox403:setLeft(240);
    obj.checkBox403:setTop(025);
    obj.checkBox403:setHeight(20);
    obj.checkBox403:setWidth(110);
    obj.checkBox403:setText("Spirit Up");
    obj.checkBox403:setField("recCSSpiUP");
    obj.checkBox403:setName("checkBox403");

    obj.checkBox404 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox404:setParent(obj.layout48);
    obj.checkBox404:setLeft(000);
    obj.checkBox404:setTop(050);
    obj.checkBox404:setHeight(20);
    obj.checkBox404:setWidth(110);
    obj.checkBox404:setText("Earth Spikes");
    obj.checkBox404:setField("recCSGNDSpikes");
    obj.checkBox404:setName("checkBox404");

    obj.checkBox405 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox405:setParent(obj.layout48);
    obj.checkBox405:setLeft(115);
    obj.checkBox405:setTop(050);
    obj.checkBox405:setHeight(20);
    obj.checkBox405:setWidth(110);
    obj.checkBox405:setText("Fire Spikes");
    obj.checkBox405:setField("recCSFIRSpikes");
    obj.checkBox405:setName("checkBox405");

    obj.checkBox406 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox406:setParent(obj.layout48);
    obj.checkBox406:setLeft(240);
    obj.checkBox406:setTop(050);
    obj.checkBox406:setHeight(20);
    obj.checkBox406:setWidth(110);
    obj.checkBox406:setText("Water Spikes");
    obj.checkBox406:setField("recCSWATSpikes");
    obj.checkBox406:setName("checkBox406");

    obj.checkBox407 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox407:setParent(obj.layout48);
    obj.checkBox407:setLeft(000);
    obj.checkBox407:setTop(075);
    obj.checkBox407:setHeight(20);
    obj.checkBox407:setWidth(110);
    obj.checkBox407:setText("Wind Spikes");
    obj.checkBox407:setField("recCSWINSpikes");
    obj.checkBox407:setName("checkBox407");

    obj.checkBox408 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox408:setParent(obj.layout48);
    obj.checkBox408:setLeft(115);
    obj.checkBox408:setTop(075);
    obj.checkBox408:setHeight(20);
    obj.checkBox408:setWidth(110);
    obj.checkBox408:setText("Ice Spikes");
    obj.checkBox408:setField("recCSICESpikes");
    obj.checkBox408:setName("checkBox408");

    obj.checkBox409 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox409:setParent(obj.layout48);
    obj.checkBox409:setLeft(240);
    obj.checkBox409:setTop(075);
    obj.checkBox409:setHeight(20);
    obj.checkBox409:setWidth(110);
    obj.checkBox409:setText("Lightning Spikes");
    obj.checkBox409:setField("recCSELESpikes");
    obj.checkBox409:setName("checkBox409");

    obj.checkBox410 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox410:setParent(obj.layout48);
    obj.checkBox410:setLeft(000);
    obj.checkBox410:setTop(100);
    obj.checkBox410:setHeight(20);
    obj.checkBox410:setWidth(110);
    obj.checkBox410:setText("Holy Spikes");
    obj.checkBox410:setField("recCSHOLSpikes");
    obj.checkBox410:setName("checkBox410");

    obj.checkBox411 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox411:setParent(obj.layout48);
    obj.checkBox411:setLeft(115);
    obj.checkBox411:setTop(100);
    obj.checkBox411:setHeight(20);
    obj.checkBox411:setWidth(110);
    obj.checkBox411:setText("Shadow Spikes");
    obj.checkBox411:setField("recCSSHASpikes");
    obj.checkBox411:setName("checkBox411");

    obj.checkBox412 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox412:setParent(obj.layout48);
    obj.checkBox412:setLeft(240);
    obj.checkBox412:setTop(100);
    obj.checkBox412:setHeight(20);
    obj.checkBox412:setWidth(110);
    obj.checkBox412:setText("Protect");
    obj.checkBox412:setField("recCSProtect");
    obj.checkBox412:setName("checkBox412");

    obj.checkBox413 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox413:setParent(obj.layout48);
    obj.checkBox413:setLeft(000);
    obj.checkBox413:setTop(125);
    obj.checkBox413:setHeight(20);
    obj.checkBox413:setWidth(110);
    obj.checkBox413:setText("Shell");
    obj.checkBox413:setField("recCSShell");
    obj.checkBox413:setName("checkBox413");

    obj.checkBox414 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox414:setParent(obj.layout48);
    obj.checkBox414:setLeft(115);
    obj.checkBox414:setTop(125);
    obj.checkBox414:setHeight(20);
    obj.checkBox414:setWidth(110);
    obj.checkBox414:setText("Armor Up");
    obj.checkBox414:setField("recCSARMUP");
    obj.checkBox414:setName("checkBox414");

    obj.checkBox415 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox415:setParent(obj.layout48);
    obj.checkBox415:setLeft(240);
    obj.checkBox415:setTop(125);
    obj.checkBox415:setHeight(20);
    obj.checkBox415:setWidth(110);
    obj.checkBox415:setText("Mental Up");
    obj.checkBox415:setField("recCSMENUP");
    obj.checkBox415:setName("checkBox415");

    obj.checkBox416 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox416:setParent(obj.layout48);
    obj.checkBox416:setLeft(000);
    obj.checkBox416:setTop(150);
    obj.checkBox416:setHeight(20);
    obj.checkBox416:setWidth(110);
    obj.checkBox416:setText("Haste");
    obj.checkBox416:setField("recCSHaste");
    obj.checkBox416:setName("checkBox416");

    obj.checkBox417 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox417:setParent(obj.layout48);
    obj.checkBox417:setLeft(115);
    obj.checkBox417:setTop(150);
    obj.checkBox417:setHeight(20);
    obj.checkBox417:setWidth(110);
    obj.checkBox417:setText("Reflect");
    obj.checkBox417:setField("recCSReflect");
    obj.checkBox417:setName("checkBox417");

    obj.checkBox418 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox418:setParent(obj.layout48);
    obj.checkBox418:setLeft(240);
    obj.checkBox418:setTop(150);
    obj.checkBox418:setHeight(20);
    obj.checkBox418:setWidth(110);
    obj.checkBox418:setText("Power Up");
    obj.checkBox418:setField("recCSPOWUP");
    obj.checkBox418:setName("checkBox418");

    obj.checkBox419 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox419:setParent(obj.layout48);
    obj.checkBox419:setLeft(000);
    obj.checkBox419:setTop(175);
    obj.checkBox419:setHeight(20);
    obj.checkBox419:setWidth(110);
    obj.checkBox419:setText("Magic Up");
    obj.checkBox419:setField("recCSMAGUP");
    obj.checkBox419:setName("checkBox419");

    obj.checkBox420 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox420:setParent(obj.layout48);
    obj.checkBox420:setLeft(115);
    obj.checkBox420:setTop(175);
    obj.checkBox420:setHeight(20);
    obj.checkBox420:setWidth(110);
    obj.checkBox420:setText("Regen");
    obj.checkBox420:setField("recCSRegen");
    obj.checkBox420:setName("checkBox420");

    obj.checkBox421 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox421:setParent(obj.layout48);
    obj.checkBox421:setLeft(240);
    obj.checkBox421:setTop(175);
    obj.checkBox421:setHeight(20);
    obj.checkBox421:setWidth(110);
    obj.checkBox421:setText("Aura");
    obj.checkBox421:setField("recCSAura");
    obj.checkBox421:setName("checkBox421");

    obj.checkBox422 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox422:setParent(obj.layout48);
    obj.checkBox422:setLeft(000);
    obj.checkBox422:setTop(200);
    obj.checkBox422:setHeight(20);
    obj.checkBox422:setWidth(110);
    obj.checkBox422:setText("Vanish");
    obj.checkBox422:setField("recCSVanish");
    obj.checkBox422:setName("checkBox422");

    obj.checkBox423 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox423:setParent(obj.layout48);
    obj.checkBox423:setLeft(000);
    obj.checkBox423:setTop(225);
    obj.checkBox423:setHeight(20);
    obj.checkBox423:setWidth(110);
    obj.checkBox423:setText("SOS Gain");
    obj.checkBox423:setField("recCSGain");
    obj.checkBox423:setName("checkBox423");

    obj.checkBox424 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox424:setParent(obj.layout48);
    obj.checkBox424:setLeft(115);
    obj.checkBox424:setTop(225);
    obj.checkBox424:setHeight(20);
    obj.checkBox424:setWidth(110);
    obj.checkBox424:setText("SOS Lose");
    obj.checkBox424:setField("recCSLose");
    obj.checkBox424:setName("checkBox424");

    obj.checkBox425 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox425:setParent(obj.layout48);
    obj.checkBox425:setLeft(240);
    obj.checkBox425:setTop(225);
    obj.checkBox425:setHeight(20);
    obj.checkBox425:setWidth(110);
    obj.checkBox425:setText("Unsealable");
    obj.checkBox425:setField("recCSUns");
    obj.checkBox425:setName("checkBox425");

    obj.checkBox426 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox426:setParent(obj.layout48);
    obj.checkBox426:setLeft(000);
    obj.checkBox426:setTop(280);
    obj.checkBox426:setHeight(20);
    obj.checkBox426:setWidth(150);
    obj.checkBox426:setText("Final Attack");
    obj.checkBox426:setField("reCFin");
    obj.checkBox426:setHitTest(true);
    obj.checkBox426:setHint(" Before dying, the monster can unleash one last attack on its opponents. \n Select an Attack, Action Ability, or Spell for Final Attack to be attached to; the monster will automatically use it upon being reduced to 0 or fewer HP, selecting targets as normal.");
    obj.checkBox426:setName("checkBox426");

    obj.checkBox427 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox427:setParent(obj.layout48);
    obj.checkBox427:setLeft(020);
    obj.checkBox427:setTop(305);
    obj.checkBox427:setHeight(20);
    obj.checkBox427:setWidth(90);
    obj.checkBox427:setText("Unsealable");
    obj.checkBox427:setField("reCFinUns");
    obj.checkBox427:setName("checkBox427");

    obj.checkBox428 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox428:setParent(obj.layout48);
    obj.checkBox428:setLeft(000);
    obj.checkBox428:setTop(330);
    obj.checkBox428:setHeight(20);
    obj.checkBox428:setWidth(150);
    obj.checkBox428:setText("Fission");
    obj.checkBox428:setField("reCFiss");
    obj.checkBox428:setHitTest(true);
    obj.checkBox428:setHint("The monster is capable of splitting into identical copies of itself. \n Select a damage type – Physical, one of the nine kinds of Elemental, or Magical – when adding Fission to a monster. \n If reduced to 0 or fewer HP by the selected damage type during the course of a Round, the monster will split into two copies during the Status Phase. \n Each copy is treated as if it were the monster revived with full HP and MP, and generates Initiative as normal. \n If defeated, the copies award XP and Gil equal to that of the original monster");
    obj.checkBox428:setName("checkBox428");

    obj.checkBox429 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox429:setParent(obj.layout48);
    obj.checkBox429:setLeft(020);
    obj.checkBox429:setTop(355);
    obj.checkBox429:setHeight(20);
    obj.checkBox429:setWidth(90);
    obj.checkBox429:setText("Unsealable");
    obj.checkBox429:setField("reCFissUns");
    obj.checkBox429:setName("checkBox429");

    obj.checkBox430 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox430:setParent(obj.layout48);
    obj.checkBox430:setLeft(000);
    obj.checkBox430:setTop(380);
    obj.checkBox430:setHeight(20);
    obj.checkBox430:setWidth(150);
    obj.checkBox430:setText("Rotating Weakness");
    obj.checkBox430:setField("reRotate");
    obj.checkBox430:setHitTest(true);
    obj.checkBox430:setHint("The monster’s vulnerabilities are always in flux. In order to take Rotating Weakness, the monster must have at least one Elemental Weakness already in place. \n If the monster takes damage from an Element it currently has a Weakness against during the course of a Round, the Weakness immediately changes; roll a d8 and consult the table below to determine which Element the monster now has a Weakness towards. \n If the Element rolled is the same as the one the monster currently has a Weakness towards, the monster's new Weakness will be Bio. \n Roll Weakness \n 1 Earth \n 2 Fire \n 3 Water \n 4 Wind \n 5 Ice \n 6 Lightning \n 7 Holy \n 8 Shadow \n A Weakness inflicted by Rotating Weakness takes precedence over Elemental Resistance, Elemental Immunity, and Elemental Absorbance, though Status Conditions still override it as normal.");
    obj.checkBox430:setName("checkBox430");

    obj.checkBox431 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox431:setParent(obj.layout48);
    obj.checkBox431:setLeft(020);
    obj.checkBox431:setTop(405);
    obj.checkBox431:setHeight(20);
    obj.checkBox431:setWidth(110);
    obj.checkBox431:setText("SOS Gain");
    obj.checkBox431:setField("reRotateGain");
    obj.checkBox431:setName("checkBox431");

    obj.checkBox432 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox432:setParent(obj.layout48);
    obj.checkBox432:setLeft(115);
    obj.checkBox432:setTop(405);
    obj.checkBox432:setHeight(20);
    obj.checkBox432:setWidth(110);
    obj.checkBox432:setText("SOS Lose");
    obj.checkBox432:setField("reRotateLose");
    obj.checkBox432:setName("checkBox432");

    obj.checkBox433 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox433:setParent(obj.layout48);
    obj.checkBox433:setLeft(200);
    obj.checkBox433:setTop(405);
    obj.checkBox433:setHeight(20);
    obj.checkBox433:setWidth(110);
    obj.checkBox433:setText("Unsealable");
    obj.checkBox433:setField("reRotateUns");
    obj.checkBox433:setName("checkBox433");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.tab11);
    obj.layout49:setLeft(650);
    obj.layout49:setTop(010);
    obj.layout49:setHeight(76);
    obj.layout49:setWidth(475);
    obj.layout49:setName("layout49");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout49);
    obj.label172:setLeft(000);
    obj.label172:setTop(000);
    obj.label172:setHeight(20);
    obj.label172:setWidth(10);
    obj.label172:setText("E");
    obj.label172:setAutoSize(true);
    obj.label172:setName("label172");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout49);
    obj.edit169:setLeft(015);
    obj.edit169:setTop(000);
    obj.edit169:setHeight(20);
    obj.edit169:setWidth(40);
    obj.edit169:setField("ExpFinal");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setName("edit169");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout49);
    obj.label173:setLeft(070);
    obj.label173:setTop(000);
    obj.label173:setHeight(20);
    obj.label173:setWidth(10);
    obj.label173:setText("G");
    obj.label173:setAutoSize(true);
    obj.label173:setName("label173");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout49);
    obj.edit170:setLeft(95);
    obj.edit170:setTop(000);
    obj.edit170:setHeight(20);
    obj.edit170:setWidth(40);
    obj.edit170:setField("GilFinal");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setName("edit170");

    obj.tab12 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl1);
    obj.tab12:setTitle("Field/Boss");
    obj.tab12:setName("tab12");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.tab12);
    obj.layout50:setLeft(110);
    obj.layout50:setTop(130);
    obj.layout50:setHeight(225);
    obj.layout50:setWidth(160);
    obj.layout50:setName("layout50");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout50);
    obj.label174:setLeft(000);
    obj.label174:setTop(000);
    obj.label174:setHeight(20);
    obj.label174:setWidth(100);
    obj.label174:setText("FIELD EFFECTS");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setHitTest(true);
    obj.label174:setHint("Field Effects are special Abilities that allow a monster to change the nature of the immediate battlefield to seal a party's powers or otherwise inconvenience them. \n A Field Effect takes a single Action to deploy. \n Its effects only harm the PCs and their allies; the only way to stop an Effect is by defeating the monster that deployed it. \n Because Field Effects can have a drastic impact on combat difficulty, it is recommended that they be restricted to Boss monsters and creatures summoned through Alarm or Slave Parts. \n Only one Field Effect may be active at any one time even if multiple monsters can use them, though the current Field Effect can be changed by expending an Action to deploy a new Effect.");
    obj.label174:setName("label174");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout50);
    obj.rectangle17:setLeft(000);
    obj.rectangle17:setTop(025);
    obj.rectangle17:setWidth(160);
    obj.rectangle17:setHeight(210);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("black");
    obj.rectangle17:setStrokeSize(5);
    obj.rectangle17:setName("rectangle17");

    obj.checkBox434 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox434:setParent(obj.layout50);
    obj.checkBox434:setLeft(000);
    obj.checkBox434:setTop(025);
    obj.checkBox434:setHeight(20);
    obj.checkBox434:setWidth(150);
    obj.checkBox434:setText("Attack Lock");
    obj.checkBox434:setField("fieldAttack");
    obj.checkBox434:setHitTest(true);
    obj.checkBox434:setHint("Basic attacks are locked down. \n No Attack Actions may be used for as long as Attack Lock remains active, \n though Abilities that take an Attack Action as a basis remain unaffected.");
    obj.checkBox434:setName("checkBox434");

    obj.checkBox435 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox435:setParent(obj.layout50);
    obj.checkBox435:setLeft(000);
    obj.checkBox435:setTop(050);
    obj.checkBox435:setHeight(20);
    obj.checkBox435:setWidth(150);
    obj.checkBox435:setText("HP Sap");
    obj.checkBox435:setField("fieldSap");
    obj.checkBox435:setHitTest(true);
    obj.checkBox435:setHint(" The surrounding area continuously drains the party's health, reducing their HP by 5% of its maximum value at the end of every Round. \n This Effect is cumulative with anything else that deals damage over time, such as the Status Condition Poison, and remains in effect as long as HP Sap is active.");
    obj.checkBox435:setName("checkBox435");

    obj.checkBox436 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox436:setParent(obj.layout50);
    obj.checkBox436:setLeft(000);
    obj.checkBox436:setTop(075);
    obj.checkBox436:setHeight(20);
    obj.checkBox436:setWidth(150);
    obj.checkBox436:setText("Item Lock");
    obj.checkBox436:setField("fieldItem");
    obj.checkBox436:setHitTest(true);
    obj.checkBox436:setHint("Item use is locked down. No Item Actions may be taken for as long as Item Lock remains active. \n This includes Abilities that use an Item Action as their basis, such as Auto-Potion");
    obj.checkBox436:setName("checkBox436");

    obj.checkBox437 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox437:setParent(obj.layout50);
    obj.checkBox437:setLeft(000);
    obj.checkBox437:setTop(100);
    obj.checkBox437:setHeight(20);
    obj.checkBox437:setWidth(150);
    obj.checkBox437:setText("Magic Lock");
    obj.checkBox437:setField("fieldMagic");
    obj.checkBox437:setHitTest(true);
    obj.checkBox437:setHint("All magical energy on the battlefield is sealed. \n No Magic Abilities may be used for as long as Magic Lock remains active.");
    obj.checkBox437:setName("checkBox437");

    obj.checkBox438 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox438:setParent(obj.layout50);
    obj.checkBox438:setLeft(000);
    obj.checkBox438:setTop(125);
    obj.checkBox438:setHeight(20);
    obj.checkBox438:setWidth(150);
    obj.checkBox438:setText("Magnetic Field");
    obj.checkBox438:setField("fieldMagnetic");
    obj.checkBox438:setHitTest(true);
    obj.checkBox438:setHint("A powerful magnetic field dominates the area, weighing down any combatant with metallic equipment. \n Characters wearing Mail, Helmets, Shields, or Gauntlets are afflicted with the Status Condition Slow, even if they would normally be immune to it; \n the same applies to characters wielding any Weapon other than Boomerangs, Bows, Flails, Gloves, Rods or Staves. Slow cannot be canceled for as long as Magnetic Field remains active.");
    obj.checkBox438:setName("checkBox438");

    obj.checkBox439 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox439:setParent(obj.layout50);
    obj.checkBox439:setLeft(000);
    obj.checkBox439:setTop(150);
    obj.checkBox439:setHeight(20);
    obj.checkBox439:setWidth(150);
    obj.checkBox439:setText("MP Sap");
    obj.checkBox439:setField("fieldMPSap");
    obj.checkBox439:setHitTest(true);
    obj.checkBox439:setHint("The surrounding area continuously drains the party's mana, reducing their MP by 5% of its maximum value at the end of every Round. \n This Effect is cumulative with anything else that deals damage over time, such as the Status Condition Venom, and remains in effect as long as MP Sap is active.");
    obj.checkBox439:setName("checkBox439");

    obj.checkBox440 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox440:setParent(obj.layout50);
    obj.checkBox440:setLeft(000);
    obj.checkBox440:setTop(175);
    obj.checkBox440:setHeight(20);
    obj.checkBox440:setWidth(150);
    obj.checkBox440:setText("Spell Lock");
    obj.checkBox440:setField("fieldSpell");
    obj.checkBox440:setHitTest(true);
    obj.checkBox440:setHint("A powerful anti-magic field disrupts all spellcasting in the area. \n No Spells may be used for as long as Spell Lock remains active");
    obj.checkBox440:setName("checkBox440");

    obj.checkBox441 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox441:setParent(obj.layout50);
    obj.checkBox441:setLeft(000);
    obj.checkBox441:setTop(200);
    obj.checkBox441:setHeight(20);
    obj.checkBox441:setWidth(150);
    obj.checkBox441:setText("Technique Lock");
    obj.checkBox441:setField("fieldTech");
    obj.checkBox441:setHitTest(true);
    obj.checkBox441:setHint("Non-magical techniques are locked down.  \n No Slow or Fast Abilities may be used for as long as Technique Lock remains active, though Magic Abilities continue to function as normal.");
    obj.checkBox441:setName("checkBox441");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.tab12);
    obj.layout51:setLeft(310);
    obj.layout51:setTop(130);
    obj.layout51:setHeight(210);
    obj.layout51:setWidth(300);
    obj.layout51:setName("layout51");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout51);
    obj.label175:setLeft(000);
    obj.label175:setTop(000);
    obj.label175:setHeight(20);
    obj.label175:setWidth(100);
    obj.label175:setText("BOSS EFFECTS");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout51);
    obj.rectangle18:setLeft(000);
    obj.rectangle18:setTop(025);
    obj.rectangle18:setWidth(300);
    obj.rectangle18:setHeight(175);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("black");
    obj.rectangle18:setStrokeSize(5);
    obj.rectangle18:setName("rectangle18");

    obj.checkBox442 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox442:setParent(obj.layout51);
    obj.checkBox442:setLeft(000);
    obj.checkBox442:setTop(025);
    obj.checkBox442:setHeight(20);
    obj.checkBox442:setWidth(100);
    obj.checkBox442:setText("Decoy");
    obj.checkBox442:setField("bossDecoy");
    obj.checkBox442:setHitTest(true);
    obj.checkBox442:setHint("For protection’s sake, the monster surrounds itself with doppelgangers, taking safety in numbers. \n A Decoy is entirely identical in appearance to the monster it replicates; not even a Scan Spell would be able to find a difference between the two. \n For this reason, Decoys are treated as a separate targets in combat, though they have no HP of their own and may make no Actions; the only way to destroy them is to eliminate their 'parent.' \n The Decoy's effects depend on how the Party direct its attacks. If the original monster is hit, it will take damage as normal, but striking a Decoy will result in an immediate counterattack; the monster itself suffers no ill effects. This attack takes the form of a Reaction Ability that must be assembled and paid for separately from the Decoy. \n XP and Gil values are given per Decoy assigned; a monster with three Decoys would incur XP and Gil modifiers of +60 and +75 respectively.");
    obj.checkBox442:setName("checkBox442");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout51);
    obj.edit171:setLeft(105);
    obj.edit171:setTop(025);
    obj.edit171:setHeight(20);
    obj.edit171:setWidth(30);
    obj.edit171:setField("bossDecoyNum");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setName("edit171");

    obj.checkBox443 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox443:setParent(obj.layout51);
    obj.checkBox443:setLeft(000);
    obj.checkBox443:setTop(050);
    obj.checkBox443:setHeight(20);
    obj.checkBox443:setWidth(100);
    obj.checkBox443:setText("Immunity-All");
    obj.checkBox443:setField("immStatus");
    obj.checkBox443:setHitTest(true);
    obj.checkBox443:setHint("The monster has Immunity to all negative Status Conditions – Fatal-type, Mystify-type, Seal-type, Time-type, Toxin-type, Transform-type, and Weaken-type. \n Any rolls to inflict a Status Condition have a CoS of 0");
    obj.checkBox443:setName("checkBox443");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout51);
    obj.label176:setLeft(000);
    obj.label176:setTop(75);
    obj.label176:setHeight(20);
    obj.label176:setWidth(100);
    obj.label176:setText("Slave Part");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setHitTest(true);
    obj.label176:setHint("Some bosses in the Final Fantasy games are so large that they are actually composed of multiple parts. \n In the FFRPG, this is simulated by giving a Boss Slave Parts. \n A Slave Part is created as if it were an individual monster with the Slave Part Ability, and is treated as an individual combatant with its own Initiative in combat. \n However, it cannot move under its own power – it moves where the Boss moves. \n Slave Parts are incapacitated as normal when they are reduced to 0 HP, though they award no Gil or Experience when defeated; instead, the XP and Gil values of a Boss's Slave Parts are added to the Boss's own. \n When the Boss is reduced to 0 HP, all of its Slave Parts are also reduced to 0 Hit Points, regardless of current HP, ARM, or M. ARM. Slave Parts come in three types:");
    obj.label176:setName("label176");

    obj.checkBox444 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox444:setParent(obj.layout51);
    obj.checkBox444:setLeft(020);
    obj.checkBox444:setTop(100);
    obj.checkBox444:setHeight(20);
    obj.checkBox444:setWidth(140);
    obj.checkBox444:setText("Normal Parts");
    obj.checkBox444:setField("bossSlaveN");
    obj.checkBox444:setHitTest(true);
    obj.checkBox444:setHint("Normal Parts begin the battle with the Boss, and are permanently incapacitated when reduced to 0 HP in combat.");
    obj.checkBox444:setName("checkBox444");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout51);
    obj.edit172:setLeft(165);
    obj.edit172:setTop(100);
    obj.edit172:setHeight(20);
    obj.edit172:setWidth(30);
    obj.edit172:setField("bossSlaveN1");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setName("edit172");

    obj.checkBox445 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox445:setParent(obj.layout51);
    obj.checkBox445:setLeft(020);
    obj.checkBox445:setTop(125);
    obj.checkBox445:setHeight(20);
    obj.checkBox445:setWidth(140);
    obj.checkBox445:setText("Summoned Parts");
    obj.checkBox445:setField("bossSlaveS");
    obj.checkBox445:setHitTest(true);
    obj.checkBox445:setHint("Summoned Parts must be brought into battle by the Boss at the cost of an Ability Action. \n If reduced to 0 or fewer Hit Points in combat, the controlling monster may revive them with full HP and MP at the cost of a second Action.");
    obj.checkBox445:setName("checkBox445");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout51);
    obj.edit173:setLeft(165);
    obj.edit173:setTop(125);
    obj.edit173:setHeight(20);
    obj.edit173:setWidth(30);
    obj.edit173:setField("bossSlaveN2");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");

    obj.checkBox446 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox446:setParent(obj.layout51);
    obj.checkBox446:setLeft(020);
    obj.checkBox446:setTop(150);
    obj.checkBox446:setHeight(20);
    obj.checkBox446:setWidth(140);
    obj.checkBox446:setText("Auto-Reviving Parts");
    obj.checkBox446:setField("bossSlaveAR");
    obj.checkBox446:setHitTest(true);
    obj.checkBox446:setHint("Auto-Reviving Parts revive with full Hit Points and Magic Points two Rounds after being incapacitated");
    obj.checkBox446:setName("checkBox446");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout51);
    obj.edit174:setLeft(165);
    obj.edit174:setTop(150);
    obj.edit174:setHeight(20);
    obj.edit174:setWidth(30);
    obj.edit174:setField("bossSlaveN3");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setName("edit174");

    obj.checkBox447 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox447:setParent(obj.layout51);
    obj.checkBox447:setLeft(000);
    obj.checkBox447:setTop(175);
    obj.checkBox447:setHeight(20);
    obj.checkBox447:setWidth(140);
    obj.checkBox447:setText("X-Action");
    obj.checkBox447:setField("bossXACtion");
    obj.checkBox447:setHitTest(true);
    obj.checkBox447:setHint("The monster can take two Actions for the cost of just one, provided neither of the two is Slow or on a Countdown. \n The Actions take effect one after the other; after the resolution of the second, the monster’s turn ends. In the interests of fairness, it is not recommended that X-Action be used for two consecutive Actions with Target: Group or two Actions targeting the same combatant.");
    obj.checkBox447:setName("checkBox447");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.tab12);
    obj.layout52:setLeft(650);
    obj.layout52:setTop(010);
    obj.layout52:setHeight(76);
    obj.layout52:setWidth(475);
    obj.layout52:setName("layout52");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout52);
    obj.label177:setLeft(000);
    obj.label177:setTop(000);
    obj.label177:setHeight(20);
    obj.label177:setWidth(10);
    obj.label177:setText("E");
    obj.label177:setAutoSize(true);
    obj.label177:setName("label177");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout52);
    obj.edit175:setLeft(015);
    obj.edit175:setTop(000);
    obj.edit175:setHeight(20);
    obj.edit175:setWidth(40);
    obj.edit175:setField("ExpFinal");
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setName("edit175");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout52);
    obj.label178:setLeft(070);
    obj.label178:setTop(000);
    obj.label178:setHeight(20);
    obj.label178:setWidth(10);
    obj.label178:setText("G");
    obj.label178:setAutoSize(true);
    obj.label178:setName("label178");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout52);
    obj.edit176:setLeft(95);
    obj.edit176:setTop(000);
    obj.edit176:setHeight(20);
    obj.edit176:setWidth(40);
    obj.edit176:setField("GilFinal");
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");

    obj.tab13 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl1);
    obj.tab13:setTitle("Notes");
    obj.tab13:setName("tab13");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.tab13);
    obj.layout53:setLeft(10);
    obj.layout53:setTop(10);
    obj.layout53:setHeight(480);
    obj.layout53:setWidth(380);
    obj.layout53:setName("layout53");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout53);
    obj.rectangle19:setLeft(000);
    obj.rectangle19:setTop(000);
    obj.rectangle19:setWidth(380);
    obj.rectangle19:setHeight(480);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("black");
    obj.rectangle19:setStrokeSize(5);
    obj.rectangle19:setName("rectangle19");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout53);
    obj.textEditor1:setLeft(000);
    obj.textEditor1:setTop(000);
    obj.textEditor1:setWidth(380);
    obj.textEditor1:setHeight(480);
    obj.textEditor1:setField("campoTextoGrande");
    obj.textEditor1:setName("textEditor1");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.tab13);
    obj.layout54:setLeft(400);
    obj.layout54:setTop(10);
    obj.layout54:setHeight(480);
    obj.layout54:setWidth(380);
    obj.layout54:setName("layout54");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout54);
    obj.rectangle20:setLeft(000);
    obj.rectangle20:setTop(000);
    obj.rectangle20:setWidth(380);
    obj.rectangle20:setHeight(480);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("black");
    obj.rectangle20:setStrokeSize(5);
    obj.rectangle20:setName("rectangle20");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout54);
    obj.textEditor2:setLeft(000);
    obj.textEditor2:setTop(000);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(480);
    obj.textEditor2:setField("campoTextoGrande2");
    obj.textEditor2:setName("textEditor2");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'baseTIPO', 'valSTR', 'valVIT', 'valAGI', 'valSPD', 'valMAG', 'valSPR', 'valLV', 'baseArmor', 'baseMArmor', 'baseHP', 'baseMP', 'immDeath', 'immCondemn', 'immFatal',
        'supEva10', 'supEva25', 'supEva50', 'supEva75', 'supMEva10', 'supMEva25', 'supMEva50', 'supMEva75', 'supLEva', 'supLMEva', 'statAGIUP', 'statAGIDOWN', 'statAGIBREAK', 'statBLINK', 'statIMM',
		'statSPIUP', 'statSPIDOWN', 'statSPIBREAK', 'statARMUP', 'statARMDOWN', 'statARMBREAK', 'statMENUP', 'statMENDOWN', 'statMENBREAK', 'statTOAD', 'statMINI'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'baseTIPO', 'valLV', 'baseArmor', 'baseMArmor', 'baseHP', 'baseMP', 'bonusEXP', 'bonusGIL', 'NPlayers', 
						'addFloat', 'addAgiUP', 'addSpiUP', 'addGNDSpikes', 'addFIRSpikes', 'addWATSpikes', 'addWINSpikes', 'addICESpikes', 'addELESpikes', 'addHOLSpikes', 'addSHASpikes',
						'addProtect', 'addShell', 'addARMUP', 'addMENUP', 'addHaste', 'addReflect', 'addPOWUP', 'addMAGUP', 'addRegen', 'addAura', 'addVanish', 'aaAlarm',
						'canFloat', 'canAgiUP', 'canSpiUP', 'canGNDSpikes', 'canFIRSpikes', 'canWATSpikes', 'canWINSpikes', 'canICESpikes', 'canELESpikes', 'canHOLSpikes', 'canSHASpikes',
						'canProtect', 'canShell', 'canARMUP', 'canMENUP', 'canHaste', 'canReflect', 'canPOWUP', 'canMAGUP', 'canRegen', 'canAura', 'canVanish', 'canHealHP',
						'aaAlarm', 'aaClone', 'aaEscape', 'aaImprison', 'aaBPrison', 'aaIPrison', 'aaSPrison', 'aaDPrison', 'aaVPrison', 'aaItemUse', 'aaRestore25',
						'aaRestore50', 'aaRestore75', 'aaSSPO', 'aaSSPN', 'SpellsTIPO1', 'SpellsTIPO2', 'SpellsTIPO3', 'SpellsTIPO4', 'SpellsTIPO5', 'SpellsTIPO6',
						'SpellsTIPO7', 'SpellsTIPO8', 'SpellsTIPO9', 'SpellsTIPO10', 'SpellsTIPO11', 'SpellsTIPO12', 'JSTipo1', 'JSTipo2', 'JSTipo3', 'weakBIO', 'resBIO', 'immBIO', 'absBIO','potBIO',
						'JSTipo4', 'JSTipo5', 'JSTipo6', 'JSTipo7', 'JSTipo8', 'JSTipo9', 'JSTipo10', 'JSTipo11', 'JSTipo12', 'maBurrow', 'maBurrowMP',
						'maBurrowSOSG', 'maBurrowSOSL', 'maFlight', 'maFlightMP', 'maFlightSOSG', 'maFlightSOSL', 'maFloat', 'maFloatMP', 'maFloatSOSG',
						'maFloatSOSL', 'maTeleport', 'maTeleportMP', 'maTeleportSOSG', 'maTeleportSOSL', 'autoFloat', 'autoAgiUP', 'autoSpiUP', 'autoGNDSpikes', 'autoFIRSpikes', 
						'autoWATSpikes', 'autoWINSpikes', 'autoICESpikes', 'autoELESpikes', 'autoHOLSpikes', 'autoSHASpikes','autoProtect', 'autoShell', 'autoARMUP', 'autoMENUP', 'autoHaste', 
						'autoReflect', 'autoPOWUP', 'autoMAGUP', 'autoRegen', 'autoAura', 'autoVanish', 'autoBerserk', 'autoBlind', 'autoPoison', 'autoSleep', 'autoSlow', 'autoZombie',
						'autoConfuse', 'autoSap', 'autoUnaware', 'autoMini', 'autoToad', 'autoVenom', 'autoCondemn', 'autoPetrify', 'sosFloat', 'sosAgiUP', 'sosSpiUP', 'sosGNDSpikes', 'sosFIRSpikes', 
						'sosWATSpikes', 'sosWINSpikes', 'sosICESpikes', 'sosELESpikes', 'sosHOLSpikes', 'sosSHASpikes','sosProtect', 'sosShell', 'sosARMUP', 'sosMENUP', 'sosHaste', 
						'sosReflect', 'sosPOWUP', 'sosMAGUP', 'sosRegen', 'sosAura', 'sosVanish', 'sosBerserk', 'sosBlind', 'sosPoison', 'sosSleep', 'sosSlow', 'sosZombie',
						'sosConfuse', 'sosSap', 'sosUnaware', 'sosMini', 'sosToad', 'sosVenom', 'sosCondemn', 'sosPetrify', 'Comeback2', 'Comeback4', 'Comeback6', 'bossSlaveN2', 'bossXACtion',
						'supCrit1', 'supCrit2', 'supCrit3', 'potELE', 'potFIR', 'potGND', 'potHOL', 'potICE', 'potSHA', 'potWAT', 'potWIN', 'weakELE', 'weakFIR', 'weakGND', 'weakHOL', 'weakICE', 
						'weakSHA', 'weakWAT', 'weakWIN', 'resELE', 'resFIR', 'resGND', 'resHOL', 'resICE', 'resSHA', 'resWAT', 'resWIN', 'immELE', 'immFIR', 'immGND', 'immHOL', 'immICE', 'immSHA', 
						'immWAT', 'immWIN', 'absELE', 'absFIR', 'absGND', 'absHOL', 'absICE', 'absSHA', 'absWAT', 'absWIN', 'bossDecoy', 'bossDecoyNum', 'immStatus', 'bossSlave', 'bossSlaveN1',
						'resBerserk', 'resBlind', 'resImmobilize', 'resPoison', 'resSleep', 'resSlow', 'resZombie', 'resLock', 'resCondemn', 'resConfuse', 'resCurse', 'resDisable', 'resPetrify',
						'resSilence', 'resSap', 'resUnaware', 'resEject', 'resMini', 'resSTRDown', 'resAGIDown', 'resMAGDown', 'resARMDown', 'resMENDown', 'resSPIDown', 'resSTRBrk', 'resAGIBrk', 
						'resMAGBrk', 'resARMBrk', 'resMENBrk', 'resSPIBrk', 'resStop', 'resToad', 'resVenom', 'resElemWeak', 'resCharm', 'resDeath', 'resFrozen', 'resGravity', 'resHeat', 'resMeltdown', 'resStone', 
						'immBerserk', 'immBlind', 'immImmobilize', 'immPoison', 'immSleep', 'immSlow', 'immZombie', 'immLock', 'immCondemn', 'immConfuse', 'immCurse', 'immDisable', 'immPetrify',
						'immSilence', 'immSap', 'immUnaware', 'immEject', 'immMini', 'immSTRDown', 'immAGIDown', 'immMAGDown', 'immARMDown', 'immMENDown', 'immSPIDown', 'immSTRBrk', 'immAGIBrk', 
						'immMAGBrk', 'immARMBrk', 'immMENBrk', 'immSPIBrk', 'immStop', 'immToad', 'immVenom', 'immElemWeak', 'immCharm', 'immDeath', 'immFrozen', 'immGravity', 'immHeat', 'immMeltdown', 'immStone',
						'weakBerserk', 'weakBlind', 'weakImmobilize', 'weakPoison', 'weakSleep', 'weakSlow', 'weakZombie', 'weakCondemn', 'weakConfuse', 'weakCurse', 'weakDisable', 'weakPetrify',
						'weakSilence', 'weakSap', 'weakUnaware', 'weakEject', 'weakMini', 'weakSTRDown', 'weakAGIDown', 'weakMAGDown', 'weakARMDown', 'weakMENDown', 'weakSPIDown', 'weakSTRBrk', 'weakAGIBrk', 
						'weakMAGBrk', 'weakARMBrk', 'weakMENBrk', 'weakSPIBrk', 'weakStop', 'weakToad', 'weakVenom', 'weakCharm', 'weakDeath', 'weakFrozen', 'weakHeat', 'weakMeltdown', 'weakStone',
						'resToxin', 'resFatal', 'resMystify', 'resSeal', 'resTime', 'resTransform', 'resWeaken', 'immToxin', 'immFatal', 'immMystify', 'immSeal', 'immTime', 'immTransform', 'immWeaken', 'immStatus',
						'fieldAttack', 'fieldItem', 'fieldMPSap', 'fieldMagic', 'fieldMagnetic', 'fieldSap', 'fieldSpell', 'fieldTech','recCSMAGUP', 'recCSRegen', 'recCSAura', 'recCSVanish',
						'reCAtk50', 'reCAtk75', 'reCAtk100', 'reCAtkSOSL', 'reCAtkSOSG', 'reCAtkUns', 'reCMag50', 'reCMag75', 'reCMag100', 'reCMagSOSL', 'reCMagSOSG', 'reCMagUns', 'reCStanPhys', 'reCStanMag',
						'reCStanSOSL', 'reCStanSOSG', 'reCStanUns', 'reRD5', 'reRD10', 'reRD25', 'reRDSOSL', 'reRDSOSG', 'reRDUns', 'reCFin', 'reCFinUns', 'reCFiss', 'reCFissUns', 'reRotate', 'reRotateGain',
						'reRotateLose', 'reRotateUns', 'recCSGain', 'recCSLose', 'recCSUns', 'recCSFloat', 'recCSAgiUP', 'recCSSpiUP', 'recCSGNDSpikes', 'recCSFIRSpikes', 'recCSWATSpikes', 'recCSWINSpikes',
						'recCSICESpikes', 'recCSELESpikes', 'recCSHOLSpikes', 'recCSSHASpikes', 'recCSProtect', 'recCSShell', 'recCSARMUP', 'recCSMENUP', 'recCSHaste', 'recCSReflect', 'recCSPOWUP',
						'Atk1ExpF', 'Atk2ExpF', 'Atk3ExpF', 'Atk4ExpF', 'Atk1GilF', 'Atk2GilF', 'Atk3GilF', 'Atk4GilF', 'Special1Exp', 'Special2Exp', 'Special3Exp', 'Special1Gil', 'Special2Gil', 'Special3Gil',
						'speBadScan', 'speNoScan', 'supEvader', 'supEva10', 'supEva25', 'supEva50', 'supEva75', 'supHArm', 'supLEva', 'supLMEva', 'supMEva10', 'supMEva25', 'supMEva50', 'supMEva75',
						'supMBound', 'supMinion', 'supNDrain', 'supRDrain', 'supXFight'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
            						mesa.activeChat:enviarMensagem("[§B]Scan[§B]");
            						mesa.activeChat:enviarMensagem("[§B]Nome: [§B]" .. (sheet.baseName or ""));
            						mesa.activeChat:enviarMensagem("[§B]Level: [§B]" .. (sheet.valLV or ""));
            						mesa.activeChat:enviarMensagem("[§B]HP: [§B]" .. (sheet.valAtHP or 0) .. "/" .. (sheet.valMaxHP or 0));
            						mesa.activeChat:enviarMensagem("[§B]MP: [§B]" .. (sheet.valAtMP or 0) .. "/" .. (sheet.valMaxMP or 0));
            						mesa.activeChat:enviarMensagem("[§B]Absorções Elementais: [§B]".. (sheet.MSGabsELE or "") .. (sheet.MSGabsFIR or "") .. (sheet.MSGabsGND or "") .. (sheet.MSGabsHOL or "") .. (sheet.MSGabsICE or "") .. (sheet.MSGabsSHA or "") .. (sheet.MSGabsWAT or "") .. (sheet.MSGabsWIN or "") .. (sheet.MSGabsBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Imunidades Elementais: [§B]" .. (sheet.MSGimmELE or "") .. (sheet.MSGimmFIR or "") .. (sheet.MSGimmGND or "") .. (sheet.MSGimmHOL or "") .. (sheet.MSGimmICE or "") .. (sheet.MSGimmSHA or "") .. (sheet.MSGimmWAT or "") .. (sheet.MSGimmWIN or "") .. (sheet.MSGimmBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Resistências Elementais: [§B]" .. (sheet.MSGresELE or "") .. (sheet.MSGresFIR or "") .. (sheet.MSGresGND or "") .. (sheet.MSGresHOL or "") .. (sheet.MSGresICE or "") .. (sheet.MSGresSHA or "") .. (sheet.MSGresWAT or "").. (sheet.MSGresWIN or "") .. (sheet.MSGresBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Fraquezas Elementais: [§B]" .. (sheet.MSGweakELE or "") .. (sheet.MSGweakFIR or "") .. (sheet.MSGweakGND or "") .. (sheet.MSGweakHOL or "") .. (sheet.MSGweakICE or "") .. (sheet.MSGweakSHA or "") .. (sheet.MSGweakWAT or "").. (sheet.MSGweakWIN or "") .. (sheet.MSGweakBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Resistências a Status: [§B]" .. (sheet.MSG_resFatal or "") .. (sheet.MSG_resMystify or "") .. (sheet.MSG_resToxin or "") .. (sheet.MSG_resSeal or "") .. (sheet.MSG_resTime or "") .. (sheet.MSG_resTransform or "") .. (sheet.MSG_resWeaken or "") .. (sheet.MSGresBerserk or "") .. (sheet.MSGresBlind or "") .. (sheet.MSGresImmobilize or "") .. (sheet.MSGresPoison or "") .. (sheet.MSGresSleep or "") .. (sheet.MSGresSlow or "") .. (sheet.MSGresZombie or "") .. (sheet.MSGresLock or "") .. (sheet.MSGresCondemn or "") .. (sheet.MSGresConfuse or "") .. (sheet.MSGresCurse or "") .. (sheet.MSGresDisable or "") .. (sheet.MSGresPetrify or "") .. (sheet.MSGresSilence or "") .. (sheet.MSGresSap or "") .. (sheet.MSGresUnaware or "") .. (sheet.MSGresEject or "") .. (sheet.MSGresMini or "") .. (sheet.MSGresSTRDown or "") .. (sheet.MSGresAGIDown or "") .. (sheet.MSGresMAGDown or "") .. (sheet.MSGresMENDown or "") .. (sheet.MSGresARMDown or "") .. (sheet.MSGresSPIDown or "") .. (sheet.MSGresSTRBrk or "") .. (sheet.MSGresAGIBrk or "") .. (sheet.MSGresMAGBrk or "") .. (sheet.MSGresMENBrk or "") .. (sheet.MSGresARMBrk or "") .. (sheet.MSGresSPIBrk or "") .. (sheet.MSGresStop or "") .. (sheet.MSGresToad or "") .. (sheet.MSGresVenom or "") .. (sheet.MSGresElemWeak or "") .. (sheet.MSGresCharm or "") .. (sheet.MSGresDeath or "") .. (sheet.MSGresFrozen or "") .. (sheet.MSGresGravity or "") .. (sheet.MSGresHeat or "") .. (sheet.MSGresMeltdown or "") .. (sheet.MSGresStone or ""));
            						mesa.activeChat:enviarMensagem("[§B]Imunidades a Status: [§B]" .. (sheet.MSG_immAll or "") .. (sheet.MSG_immFatal or "") .. (sheet.MSG_immMystify or "") .. (sheet.MSG_immToxin or "") .. (sheet.MSG_immSeal or "") .. (sheet.MSG_immTime or "") .. (sheet.MSG_immTransform or "") .. (sheet.MSG_immWeaken or "").. (sheet.MSGimmBerserk or "") .. (sheet.MSGimmBlind or "") .. (sheet.MSGimmImmobilize or "") .. (sheet.MSGimmPoison or "") .. (sheet.MSGimmSleep or "") .. (sheet.MSGimmSlow or "") .. (sheet.MSGimmZombie or "") .. (sheet.MSGimmLock or "") .. (sheet.MSGimmCondemn or "") .. (sheet.MSGimmConfuse or "") .. (sheet.MSGimmCurse or "") .. (sheet.MSGimmDisable or "") .. (sheet.MSGimmPetrify or "") .. (sheet.MSGimmSilence or "") .. (sheet.MSGimmSap or "") .. (sheet.MSGimmUnaware or "") .. (sheet.MSGimmEject or "") .. (sheet.MSGimmMini or "") .. (sheet.MSGimmSTRDown or "") .. (sheet.MSGimmAGIDown or "") .. (sheet.MSGimmMAGDown or "") .. (sheet.MSGimmMENDown or "") .. (sheet.MSGimmARMDown or "") .. (sheet.MSGimmSPIDown or "") .. (sheet.MSGimmSTRBrk or "") .. (sheet.MSGimmAGIBrk or "") .. (sheet.MSGimmMAGBrk or "") .. (sheet.MSGimmMENBrk or "") .. (sheet.MSGimmARMBrk or "") .. (sheet.MSGimmSPIBrk or "") .. (sheet.MSGimmStop or "") .. (sheet.MSGimmToad or "") .. (sheet.MSGimmVenom or "") .. (sheet.MSGimmElemWeak or "") .. (sheet.MSGimmCharm or "") .. (sheet.MSGimmDeath or "") .. (sheet.MSGimmFrozen or "") .. (sheet.MSGimmGravity or "") .. (sheet.MSGimmHeat or "") .. (sheet.MSGimmMeltdown or "") .. (sheet.MSGimmStone or ""));
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
            						mesa.activeChat:enviarMensagem("[§B]Sensor[§B]");
            						mesa.activeChat:enviarMensagem("[§B]Nome: [§B]" .. (sheet.baseName or ""));
            						mesa.activeChat:enviarMensagem("[§B]HP: [§B]" .. (sheet.valAtHP or 0) .. "/" .. (sheet.valMaxHP or 0));
            						mesa.activeChat:enviarMensagem("[§B]Absorções Elementais: [§B]".. (sheet.MSGabsELE or "") .. (sheet.MSGabsFIR or "") .. (sheet.MSGabsGND or "") .. (sheet.MSGabsHOL or "") .. (sheet.MSGabsICE or "") .. (sheet.MSGabsSHA or "") .. (sheet.MSGabsWAT or "") .. (sheet.MSGabsWIN or "") .. (sheet.MSGabsBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Imunidades Elementais: [§B]" .. (sheet.MSGimmELE or "") .. (sheet.MSGimmFIR or "") .. (sheet.MSGimmGND or "") .. (sheet.MSGimmHOL or "") .. (sheet.MSGimmICE or "") .. (sheet.MSGimmSHA or "") .. (sheet.MSGimmWAT or "") .. (sheet.MSGimmWIN or "") .. (sheet.MSGimmBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Resistências Elementais: [§B]" .. (sheet.MSGresELE or "") .. (sheet.MSGresFIR or "") .. (sheet.MSGresGND or "") .. (sheet.MSGresHOL or "") .. (sheet.MSGresICE or "") .. (sheet.MSGresSHA or "") .. (sheet.MSGresWAT or "").. (sheet.MSGresWIN or "") .. (sheet.MSGresBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Fraquezas Elementais: [§B]" .. (sheet.MSGweakELE or "") .. (sheet.MSGweakFIR or "") .. (sheet.MSGweakGND or "") .. (sheet.MSGweakHOL or "") .. (sheet.MSGweakICE or "") .. (sheet.MSGweakSHA or "") .. (sheet.MSGweakWAT or "").. (sheet.MSGweakWIN or "") .. (sheet.MSGweakBIO or ""));
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
            						mesa.activeChat:enviarMensagem("[§B]Peep[§B]");
            						mesa.activeChat:enviarMensagem("[§B]Nome: [§B]" .. (sheet.baseName or ""));
            						mesa.activeChat:enviarMensagem("[§B]Level: [§B]" .. (sheet.valLV or ""));
            						mesa.activeChat:enviarMensagem("[§B]HP: [§B]" .. (sheet.valAtHP or 0) .. "/" .. (sheet.valMaxHP or 0));
            						mesa.activeChat:enviarMensagem("[§B]MP: [§B]" .. (sheet.valAtMP or 0) .. "/" .. (sheet.valMaxMP or 0));
            						mesa.activeChat:enviarMensagem("[§B]Absorções Elementais: [§B]".. (sheet.MSGabsELE or "") .. (sheet.MSGabsFIR or "") .. (sheet.MSGabsGND or "") .. (sheet.MSGabsHOL or "") .. (sheet.MSGabsICE or "") .. (sheet.MSGabsSHA or "") .. (sheet.MSGabsWAT or "") .. (sheet.MSGabsWIN or "") .. (sheet.MSGabsBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Imunidades Elementais: [§B]" .. (sheet.MSGimmELE or "") .. (sheet.MSGimmFIR or "") .. (sheet.MSGimmGND or "") .. (sheet.MSGimmHOL or "") .. (sheet.MSGimmICE or "") .. (sheet.MSGimmSHA or "") .. (sheet.MSGimmWAT or "") .. (sheet.MSGimmWIN or "") .. (sheet.MSGimmBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Resistências Elementais: [§B]" .. (sheet.MSGresELE or "") .. (sheet.MSGresFIR or "") .. (sheet.MSGresGND or "") .. (sheet.MSGresHOL or "") .. (sheet.MSGresICE or "") .. (sheet.MSGresSHA or "") .. (sheet.MSGresWAT or "").. (sheet.MSGresWIN or "") .. (sheet.MSGresBIO or ""));
            						mesa.activeChat:enviarMensagem("[§B]Fraquezas Elementais: [§B]" .. (sheet.MSGweakELE or "") .. (sheet.MSGweakFIR or "") .. (sheet.MSGweakGND or "") .. (sheet.MSGweakHOL or "") .. (sheet.MSGweakICE or "") .. (sheet.MSGweakSHA or "") .. (sheet.MSGweakWAT or "").. (sheet.MSGweakWIN or "") .. (sheet.MSGweakBIO or ""));
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.TeoricoATT 		= (tonumber(sheet.valLV) or 0) + 35;				
                                sheet.SomaATT 			= (tonumber(sheet.valSTR) or 0) + (tonumber(sheet.valVIT) or 0)  + (tonumber(sheet.valAGI) or 0)  + (tonumber(sheet.valSPD) or 0)  + (tonumber(sheet.valMAG) or 0)  + (tonumber(sheet.valSPR) or 0);
            						if (sheet.statAGIUP == true)	then	sheet.ACC_MOD1 = (sheet.ACC_MOD1 or 1) +0.25;	end
            						if (sheet.statAGIDOWN == true)	then	sheet.ACC_MOD1 = (sheet.ACC_MOD1 or 1) -0.25;	end
            						if (sheet.statAGIBREAK == true)	then	sheet.ACC_MOD1 = (sheet.ACC_MOD1 or 1) -0.5;	end					
            					sheet.valACC 			= math.floor((80 + (tonumber(sheet.valLV) or 0) + (tonumber(sheet.valAGI) or 0)*2)*(sheet.ACC_MOD1 or 1));
            						sheet.ACC_MOD1 = 1;
            						if (sheet.statSPIUP == true)		then	sheet.MACC_MOD1 = (sheet.MACC_MOD1 or 1) +0.25;	end
            						if (sheet.statSPIDOWN == true)		then	sheet.MACC_MOD1 = (sheet.MACC_MOD1 or 1) -0.25;	end
            						if (sheet.statSPIBREAK == true)		then	sheet.MACC_MOD1 = (sheet.MACC_MOD1 or 1) -0.5;	end
            					sheet.valMACC 			= math.floor((100 + (tonumber(sheet.valLV) or 0) + (tonumber(sheet.valMAG) or 0)*2)*(sheet.MACC_MOD1 or 1));
            						sheet.MACC_MOD1 = 1;
            					sheet.valDEX 			= 50 + (tonumber(sheet.valLV) or 0) + (tonumber(sheet.valAGI) or 0)*2;
            					sheet.valMND 			= 50 + (tonumber(sheet.valLV) or 0) + (tonumber(sheet.valMAG) or 0)*2;
            						if (sheet.supLEva == true) 		then 	sheet.EVA_MOD1 = 0.5;							end
            						if (sheet.supEva10 == true)		then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.1;	end
            						if (sheet.supEva25 == true)		then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.25;	end
            						if (sheet.supEva50 == true)		then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.5;	end
            						if (sheet.supEva75 == true)		then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.75;	end
            						if (sheet.statAGIUP == true)	then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.25;	end
            						if (sheet.statAGIDOWN == true)	then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) -0.25;	end
            						if (sheet.statAGIBREAK == true)	then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) -0.5;	end
            						if (sheet.statIMM == true)		then	sheet.EVA_MOD2 = (sheet.EVA_MOD2 or 1) -0.5;	end
            						if (sheet.statBLINK == true)	then	sheet.EVA_MOD3 = 1;								end
            				sheet.valEVA = math.floor((((tonumber(sheet.valLV) or 1)*(sheet.EVA_MOD1 or 1)+(tonumber(sheet.valAGI) or 0)+(tonumber(sheet.valSPD) or 0) + ((sheet.EVA_MOD3 or 0)*20)))*(sheet.EVA_MOD2 or 1))	;				
            						sheet.EVA_MOD1 =1;				sheet.EVA_MOD2 =1;					sheet.EVA_MOD3 =0;
            						if (0 >= tonumber(sheet.valEVA)) then sheet.valEVA = 0 end
            						if (sheet.supLMEva == true) 		then 	sheet.MEVA_MOD1 = 0.5;							end
            						if (sheet.supMEva10 == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.1;	end
            						if (sheet.supMEva25 == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.25;	end
            						if (sheet.supMEva50 == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.5;	end
            						if (sheet.supMEva75 == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.75;	end
            						if (sheet.statSPIUP == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) +0.25;	end
            						if (sheet.statSPIDOWN == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) -0.25;	end
            						if (sheet.statSPIBREAK == true)		then	sheet.MEVA_MOD2 = (sheet.EVA_MOD2 or 1) -0.5;	end
            				sheet.valMEVA = math.floor(((tonumber(sheet.valLV) or 1)*(sheet.MEVA_MOD1 or 1)+(tonumber(sheet.valSPI) or 0)+(tonumber(sheet.valMAG) or 0))*(sheet.MEVA_MOD2 or 1))	;				
            						sheet.MEVA_MOD1 =1;				sheet.MEVA_MOD2 =1;
            						if (0 >= tonumber(sheet.valMEVA)) then sheet.valMEVA = 0 end
            						if (sheet.statARMUP == true)		then	sheet.ARM_MOD1 = (sheet.ARM_MOD1 or 1) +0.25;	end
            						if (sheet.statARMDOWN == true)		then	sheet.ARM_MOD1 = (sheet.ARM_MOD1 or 1) -0.25;	end
            						if (sheet.statARMBREAK == true)		then	sheet.ARM_MOD1 = (sheet.ARM_MOD1 or 1) -0.5;	end
            						if (sheet.statTOAD == true)			then	sheet.ARM_MOD1 = (sheet.ARM_MOD1 or 1) -0.5;	end
            						if (sheet.statMINI == true)			then	sheet.ARM_MOD1 = (sheet.ARM_MOD1 or 1) -0.5;	end
            					sheet.valARM 			= math.floor(((tonumber(sheet.baseArmor) or 0)*(tonumber(sheet.valLV) or 0) + math.floor((tonumber(sheet.valVIT) or 0)/2))*(sheet.ARM_MOD1 or 1));
            						if (0 >= tonumber(sheet.valARM)) then sheet.valARM = 0 end
            						sheet.ARM_MOD1 = 1;
            						if (sheet.statMENUP == true)		then	sheet.MEN_MOD1 = (sheet.MEN_MOD1 or 1) +0.25;	end
            						if (sheet.statMENDOWN == true)		then	sheet.MEN_MOD1 = (sheet.MEN_MOD1 or 1) -0.25;	end
            						if (sheet.statMENBREAK == true)	then		sheet.MEN_MOD1 = (sheet.MEN_MOD1 or 1) -0.5;	end
            						if (sheet.statTOAD == true)			then	sheet.MEN_MOD1 = (sheet.MEN_MOD1 or 1) -0.5;	end
            						if (sheet.statMINI == true)			then	sheet.MEN_MOD1 = (sheet.MEN_MOD1 or 1) -0.5;	end
            					sheet.valMARM 			= math.floor(((tonumber(sheet.baseMArmor) or 0)*(tonumber(sheet.valLV) or 0) + math.floor((tonumber(sheet.valSPR) or 0)/2))*(sheet.MEN_MOD1 or 1));
            						if (0 >= tonumber(sheet.valMARM)) then sheet.valMARM = 0 end
            						sheet.MEN_MOD1 = 1;
            					sheet.valMaxHP = math.floor((tonumber(sheet.baseHP) or 0)*(tonumber(sheet.valVIT) or 0)*(tonumber(sheet.valLV) or 0));
            					sheet.valMaxMP = math.floor((tonumber(sheet.baseMP) or 0)*(tonumber(sheet.valSPR) or 0)*(tonumber(sheet.valLV) or 0));									
            					if (sheet.baseTIPO) == "Regular" then
            						end
            					if (sheet.baseTIPO) == "Notorious" then	
            						sheet.valMaxHP = math.floor((sheet.valMaxHP)*1.5);
            						sheet.valMaxMP = math.floor((sheet.valMaxMP)*1.5);
            						sheet.immDeath = true;				
            						sheet.immCondemn = true;						
            						end
            					if (sheet.baseTIPO) == "Boss" then	
            						sheet.valMaxHP = math.floor((sheet.valMaxHP)*2);
            						sheet.valMaxMP = math.floor((sheet.valMaxMP)*2);
            						sheet.immFatal = true;
            						end
            					if (sheet.baseTIPO) == "End Boss" then	
            						sheet.valMaxHP = math.floor((sheet.valMaxHP)*4);
            						sheet.valMaxMP = math.floor((sheet.valMaxMP)*4);
            						sheet.immFatal = true;
            						end
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (sheet.baseTIPO) == "Regular" then		sheet.baseEXP = 40;							sheet.baseGIL = 15;							end;
            		if (sheet.baseTIPO) == "Notorious" then		sheet.baseEXP = 100;						sheet.baseGIL = 25;							end;
            		if (sheet.baseTIPO) == "Boss" then			sheet.baseEXP = 225;						sheet.baseGIL = 55;							end;
            		if (sheet.baseTIPO) == "End Boss" then		sheet.baseEXP = 350;						sheet.baseGIL = 90;							end;
            		if (sheet.baseHP) == "1" then		sheet.baseEXP = (sheet.baseEXP or 0) -16;			sheet.baseGIL = (sheet.baseGIL or 0) -6;	end;
            		if (sheet.baseHP) == "1.5" then		sheet.baseEXP = (sheet.baseEXP or 0) -8;			sheet.baseGIL = (sheet.baseGIL or 0) -3;	end;
            		if (sheet.baseHP) == "4" then		sheet.baseEXP = (sheet.baseEXP or 0) +18;			sheet.baseGIL = (sheet.baseGIL or 0) +8;	end;
            		if (sheet.baseHP) == "6" then		sheet.baseEXP = (sheet.baseEXP or 0) +40;			sheet.baseGIL = (sheet.baseGIL or 0) +19;	end;
            		if (sheet.baseHP) == "8" then		sheet.baseEXP = (sheet.baseEXP or 0) +60;			sheet.baseGIL = (sheet.baseGIL or 0) +30;	end;
            		if (sheet.baseMP) == "0.5" then		sheet.baseEXP = (sheet.baseEXP or 0) +8;			sheet.baseGIL = (sheet.baseGIL or 0) +3;	end;
            		if (sheet.baseMP) == "1" then		sheet.baseEXP = (sheet.baseEXP or 0) +15;			sheet.baseGIL = (sheet.baseGIL or 0) +7;	end;
            		if (sheet.baseMP) == "1.5" then		sheet.baseEXP = (sheet.baseEXP or 0) +22;			sheet.baseGIL = (sheet.baseGIL or 0) +10;	end;
            		if (sheet.baseMP) == "2" then		sheet.baseEXP = (sheet.baseEXP or 0) +35;			sheet.baseGIL = (sheet.baseGIL or 0) +16;	end;
            		if (sheet.baseMP) == "4" then		sheet.baseEXP = (sheet.baseEXP or 0) +50;			sheet.baseGIL = (sheet.baseGIL or 0) +28;	end;
            		if (sheet.baseArmor) == "0.5" then	sheet.baseEXP = (sheet.baseEXP or 0) -5;			sheet.baseGIL = (sheet.baseGIL or 0) -2;	end;
            		if (sheet.baseArmor) == "2" then	sheet.baseEXP = (sheet.baseEXP or 0) +10;			sheet.baseGIL = (sheet.baseGIL or 0) +5;	end;
            		if (sheet.baseArmor) == "4" then	sheet.baseEXP = (sheet.baseEXP or 0) +19;			sheet.baseGIL = (sheet.baseGIL or 0) +9;	end;
            		if (sheet.baseArmor) == "6" then	sheet.baseEXP = (sheet.baseEXP or 0) +26;			sheet.baseGIL = (sheet.baseGIL or 0) +18;	end;
            		if (sheet.baseMArmor) == "0.5" then	sheet.baseEXP = (sheet.baseEXP or 0) -5;			sheet.baseGIL = (sheet.baseGIL or 0) -2;	end;
            		if (sheet.baseMArmor) == "2" then	sheet.baseEXP = (sheet.baseEXP or 0) +10;			sheet.baseGIL = (sheet.baseGIL or 0) +5;	end;
            		if (sheet.baseMArmor) == "4" then	sheet.baseEXP = (sheet.baseEXP or 0) +19;			sheet.baseGIL = (sheet.baseGIL or 0) +9;	end;
            		if (sheet.baseMArmor) == "6" then	sheet.baseEXP = (sheet.baseEXP or 0) +26;			sheet.baseGIL = (sheet.baseGIL or 0) +18;	end;
            		if sheet.addFloat == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addAgiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addSpiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addGNDSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addFIRSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addWATSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addWINSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addICESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addELESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addHOLSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addSHASpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.addProtect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;	
            		if sheet.addShell == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;	
            		if sheet.addARMUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;	
            		if sheet.addMENUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;	
            		if sheet.addHaste == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.addReflect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.addPOWUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.addMAGUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.addRegen == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 38;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;	
            		if sheet.addAura == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 38;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;	
            		if sheet.addVanish == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 38;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;	
            		if sheet.canFloat == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canAgiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canSpiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canGNDSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canFIRSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canWATSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canWINSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canICESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canELESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canHOLSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canSHASpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.canProtect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.canShell == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.canARMUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.canMENUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.canHaste == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 22;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;
            		if sheet.canReflect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 22;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;	
            		if sheet.canPOWUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 22;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;	
            		if sheet.canMAGUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 22;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;	
            		if sheet.canRegen == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 11;	end;	
            		if sheet.canAura == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 11;	end;	
            		if sheet.canVanish == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 11;	end;
            		if sheet.canHealHP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 36;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;		
            		if sheet.aaAlarm == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 18;	end;		
            		if sheet.aaClone == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 32;	end;		
            		if sheet.aaEscape == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;		
            		if sheet.aaImprison == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 36;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	
            			if sheet.aaBPrison == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            			if sheet.aaIPrison == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 9;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;
            			if sheet.aaSPrison == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 9;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;
            			if sheet.aaDPrison == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 9;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            			if sheet.aaVPrison == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 12;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	end;
            			end;
            		if sheet.aaItemUse == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 00;	end;	
            		if sheet.aaRestore25 == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 20;			sheet.baseGIL = (sheet.baseGIL or 0) + 13;	end;	
            		if sheet.aaRestore50 == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 40;	end;
            		if sheet.aaRestore75 == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 100;			sheet.baseGIL = (sheet.baseGIL or 0) + 75;	end;		
            		if sheet.aaSSPO == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.aaSSPN == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.SpellsTIPO1 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO1 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO1 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO1 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO1 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO1 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO1 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO1 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO1 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO1 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO1 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO1 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO1 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO1 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO1 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO1 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO1 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO1 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO1 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO1 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO2 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO2 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO2 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO2 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO2 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO2 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO2 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO2 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO2 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO2 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO2 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO2 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO2 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO2 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO2 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO2 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO2 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO2 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO2 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO2 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO3 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO3 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO3 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO3 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO3 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO3 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO3 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO3 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO3 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO3 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO3 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO3 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO3 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO3 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO3 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO3 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO3 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO3 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO3 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO3 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO4 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO4 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO4 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO4 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO4 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO4 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO4 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO4 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO4 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO4 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO4 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO4 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO4 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO4 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO4 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO4 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO4 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO4 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO4 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO4 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;	
            		if sheet.SpellsTIPO5 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO5 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO5 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO5 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO5 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO5 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO5 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO5 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO5 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO5 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO5 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO5 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO5 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO5 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO5 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO5 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO5 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO5 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO5 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO5 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO6 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO6 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO6 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO6 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO6 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO6 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO6 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO6 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO6 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO6 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO6 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO6 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO6 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO6 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO6 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO6 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO6 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO6 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO6 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO6 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO7 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO7 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO7 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO7 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO7 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO7 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO7 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO7 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO7 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO7 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO7 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO7 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO7 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO7 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO7 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO7 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO7 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO7 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO7 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO7 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO8 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO8 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO8 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO8 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO8 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO8 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO8 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO8 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO8 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO8 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO8 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO8 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO8 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO8 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO8 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO8 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO8 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO8 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO8 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO8 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO9 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO9 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO9 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO9 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO9 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO9 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO9 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO9 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO9 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO9 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO9 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO9 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO9 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO9 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO9 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO9 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO9 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO9 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO9 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO9 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO10 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO10 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO10 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO10 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO10 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO10 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO10 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO10 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO10 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO10 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO10 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO10 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO10 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO10 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO10 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO10 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO10 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO10 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO10 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO10 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO11 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO11 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO11 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO11 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO11 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO11 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO11 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO11 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO11 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO11 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO11 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO11 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO11 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO11 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO11 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO11 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO11 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO11 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO11 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO11 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.SpellsTIPO12 == "Spell1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;
            		if sheet.SpellsTIPO12 == "Spell2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.SpellsTIPO12 == "Spell3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;
            		if sheet.SpellsTIPO12 == "Spell4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;
            		if sheet.SpellsTIPO12 == "Spell5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		if sheet.SpellsTIPO12 == "Spell6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO12 == "Spell7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO12 == "Spell8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;	
            		if sheet.SpellsTIPO12 == "Blue1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;	
            		if sheet.SpellsTIPO12 == "Blue2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;	
            		if sheet.SpellsTIPO12 == "Blue3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO12 == "Blue4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 21;	end;	
            		if sheet.SpellsTIPO12 == "Blue5" then		sheet.baseEXP = (sheet.baseEXP or 0) + 45;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;	
            		if sheet.SpellsTIPO12 == "Blue6" then		sheet.baseEXP = (sheet.baseEXP or 0) + 55;			sheet.baseGIL = (sheet.baseGIL or 0) + 37;	end;	
            		if sheet.SpellsTIPO12 == "Blue7" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO12 == "Blue8" then		sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 55;	end;
            		if sheet.SpellsTIPO12 == "Call1" then		sheet.baseEXP = (sheet.baseEXP or 0) + 27;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;	
            		if sheet.SpellsTIPO12 == "Call2" then		sheet.baseEXP = (sheet.baseEXP or 0) + 42;			sheet.baseGIL = (sheet.baseGIL or 0) + 29;	end;	
            		if sheet.SpellsTIPO12 == "Call3" then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 44;	end;
            		if sheet.SpellsTIPO12 == "Call4" then		sheet.baseEXP = (sheet.baseEXP or 0) + 88;			sheet.baseGIL = (sheet.baseGIL or 0) + 59;	end;
            		if sheet.JSTipo1 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo1 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo1 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo1 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo1 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo1 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo1 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo1 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo1 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo1 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo2 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo2 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo2 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo2 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo2 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo2 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo2 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo2 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo2 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo2 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo3 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo3 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo3 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo3 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo3 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo3 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo3 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo3 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo3 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo3 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo4 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo4 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo4 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo4 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo4 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo4 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo4 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo4 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo4 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo4 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo5 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo5 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo5 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo5 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo5 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo5 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo5 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo5 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo5 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo5 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo6 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo6 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo6 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo6 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo6 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo6 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo6 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo6 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo6 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo6 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo7 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo7 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo7 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo7 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo7 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo7 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo7 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo7 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo7 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo7 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo8 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo8 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo8 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo8 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo8 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo8 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo8 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo8 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo8 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo8 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo9 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo9 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo9 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo9 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo9 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo9 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo9 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo9 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo9 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo9 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo10 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo10 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo10 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo10 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo10 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo10 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo10 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo10 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo10 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo10 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo11 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo11 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo11 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo11 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo11 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo11 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo11 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo11 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo11 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo11 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.JSTipo12 == "JSNv1" then			sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.JSTipo12 == "JSNv2" then			sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.JSTipo12 == "JSNv3" then			sheet.baseEXP = (sheet.baseEXP or 0) + 26;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;
            		if sheet.JSTipo12 == "JSNv4" then			sheet.baseEXP = (sheet.baseEXP or 0) + 32;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;
            		if sheet.JSTipo12 == "JSNv5" then			sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.JSTipo12 == "JSNv6" then			sheet.baseEXP = (sheet.baseEXP or 0) + 53;			sheet.baseGIL = (sheet.baseGIL or 0) + 19;	end;
            		if sheet.JSTipo12 == "JSNv7" then			sheet.baseEXP = (sheet.baseEXP or 0) + 61;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;
            		if sheet.JSTipo12 == "JSNv8" then			sheet.baseEXP = (sheet.baseEXP or 0) + 70;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.JSTipo12 == "JSNv9" then			sheet.baseEXP = (sheet.baseEXP or 0) + 78;			sheet.baseGIL = (sheet.baseGIL or 0) + 28;	end;
            		if sheet.JSTipo12 == "JSNv10" then			sheet.baseEXP = (sheet.baseEXP or 0) + 86;			sheet.baseGIL = (sheet.baseGIL or 0) + 31;	end;
            		if sheet.maBurrow == true then
            			sheet.ajuste = 1;
            			if sheet.maBurrowSOSG == true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maBurrowSOSL == true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maBurrowMP == true then		sheet.maBurrowMPCost = math.floor(60*(sheet.ajuste)) + sheet.valLV;
            													sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(60*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(20*(sheet.ajuste));
            			end
            		if sheet.maFlight == true then
            			sheet.ajuste = 1;
            			if sheet.maFlightSOSG== true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maFlightSOSL == true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maFlightMP == true then		sheet.maFlightMPCost = math.floor(20*(sheet.ajuste)) + sheet.valLV;
            													sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(20*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(09*(sheet.ajuste));
            			end
            		if sheet.maFloat == true then
            			sheet.ajuste = 1;
            			if sheet.maFloatSOSG== true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maFloatSOSL == true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maFloatMP == true then			sheet.maFloatMPCost = math.floor(19*(sheet.ajuste)) + sheet.valLV;
            													sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(19*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(06*(sheet.ajuste));
            			end
            		if sheet.maTeleport == true then
            			sheet.ajuste = 1;
            			if sheet.maTeleportMP == true then			sheet.maTeleportMPCost = math.floor(60*(sheet.ajuste)) + sheet.valLV;
            														sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maTeleportSOSG== true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.maTeleportSOSL == true then		sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(60*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(40*(sheet.ajuste));
            			end
            		
            		if sheet.autoFloat == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoAgiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoSpiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoGNDSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoFIRSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoWATSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoWINSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoICESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoELESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoHOLSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoSHASpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.autoProtect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 30;			sheet.baseGIL = (sheet.baseGIL or 0) + 10;	end;	
            		if sheet.autoShell == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 30;			sheet.baseGIL = (sheet.baseGIL or 0) + 10;	end;	
            		if sheet.autoARMUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 30;			sheet.baseGIL = (sheet.baseGIL or 0) + 10;	end;	
            		if sheet.autoMENUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 30;			sheet.baseGIL = (sheet.baseGIL or 0) + 10;	end;	
            		if sheet.autoHaste == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if sheet.autoReflect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;	
            		if sheet.autoPOWUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;	
            		if sheet.autoMAGUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 44;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;	
            		if sheet.autoRegen == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;	
            		if sheet.autoAura == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;	
            		if sheet.autoVanish == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 64;			sheet.baseGIL = (sheet.baseGIL or 0) + 22;	end;		
            		if sheet.autoBerserk == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;		
            		if sheet.autoBlind == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if sheet.autoPoison == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if sheet.autoSleep == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;
            		if sheet.autoSlow == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if sheet.autoZombie == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if sheet.autoConfuse == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;			
            		if sheet.autoSap == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if sheet.autoUnaware == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if sheet.autoMini == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 16;	end;	
            		if sheet.autoToad == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 16;	end;
            		if sheet.autoVenom == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 16;	end;
            		if sheet.autoCondemn == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 64;			sheet.baseGIL = (sheet.baseGIL or 0) - 22;	end;
            		if sheet.autoPetrify == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 64;			sheet.baseGIL = (sheet.baseGIL or 0) - 22;	end;
            		if sheet.sosFloat == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosAgiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosSpiUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosGNDSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosFIRSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosWATSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosWINSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosICESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosELESpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosHOLSpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosSHASpikes == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 7;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	end;
            		if sheet.sosProtect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;	
            		if sheet.sosShell == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;	
            		if sheet.sosARMUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;	
            		if sheet.sosMENUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;	
            		if sheet.sosHaste == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 20;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;
            		if sheet.sosReflect == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 20;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;	
            		if sheet.sosPOWUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 20;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;	
            		if sheet.sosMAGUP == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 20;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	end;	
            		if sheet.sosRegen == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 36;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;	
            		if sheet.sosAura == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 36;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;	
            		if sheet.sosVanish == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 36;			sheet.baseGIL = (sheet.baseGIL or 0) + 12;	end;		
            		if sheet.sosBerserk == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 7;			sheet.baseGIL = (sheet.baseGIL or 0) - 02;	end;		
            		if sheet.sosBlind == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 7;			sheet.baseGIL = (sheet.baseGIL or 0) - 02;	end;	
            		if sheet.sosPoison == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 7;			sheet.baseGIL = (sheet.baseGIL or 0) - 02;	end;	
            		if sheet.sosSleep == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 7;			sheet.baseGIL = (sheet.baseGIL or 0) - 02;	end;
            		if sheet.sosSlow == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 7;			sheet.baseGIL = (sheet.baseGIL or 0) - 02;	end;	
            		if sheet.sosZombie == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 7;			sheet.baseGIL = (sheet.baseGIL or 0) - 02;	end;	
            		if sheet.sosConfuse == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 12;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	end;			
            		if sheet.sosSap == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 12;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	end;	
            		if sheet.sosUnaware == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 12;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	end;	
            		if sheet.sosMini == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 20;			sheet.baseGIL = (sheet.baseGIL or 0) - 08;	end;	
            		if sheet.sosToad == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 20;			sheet.baseGIL = (sheet.baseGIL or 0) - 08;	end;
            		if sheet.sosVenom == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 20;			sheet.baseGIL = (sheet.baseGIL or 0) - 08;	end;
            		if sheet.sosCondemn == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 36;			sheet.baseGIL = (sheet.baseGIL or 0) - 12;	end;
            		if sheet.sosPetrify == true then	sheet.baseEXP = (sheet.baseEXP or 0) - 36;			sheet.baseGIL = (sheet.baseGIL or 0) - 12;	end;
            		if sheet.Comeback2 == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 50;			sheet.baseGIL = (sheet.baseGIL or 0) + 18;	end;
            		if sheet.Comeback4 == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 37;			sheet.baseGIL = (sheet.baseGIL or 0) + 14;	end;		
            		if sheet.Comeback6 == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	end;		
            		if sheet.supCrit1 == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.supCrit2 == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 13;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	end;		
            		if sheet.supCrit3 == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;		
            		if sheet.potELE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potFIR == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potGND == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potHOL == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potICE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potSHA == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potWAT == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potWIN == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.potBIO == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 41;	end;
            		if sheet.weakELE == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakELE = "Lightning; " 	else 	sheet.MSGweakELE = ""; end;
            		if sheet.weakFIR == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakFIR = "Fire; " 		else 	sheet.MSGweakFIR = ""; end;
            		if sheet.weakGND == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakGND = "Earth; " 		else 	sheet.MSGweakGND = ""; end;
            		if sheet.weakHOL == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakHOL = "Holy; " 		else 	sheet.MSGweakHOL = ""; end;
            		if sheet.weakICE == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakICE = "Ice; " 			else 	sheet.MSGweakICE = ""; end;
            		if sheet.weakSHA == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakSHA = "Shadow; " 		else 	sheet.MSGweakSHA = ""; end;
            		if sheet.weakWAT == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakWAT = "Water; " 		else 	sheet.MSGweakWAT = ""; end;
            		if sheet.weakWIN == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakWIN = "Wind; " 		else 	sheet.MSGweakWIN = ""; end;
            		if sheet.weakBIO == true then		sheet.baseEXP = (sheet.baseEXP or 0) - 09;			sheet.baseGIL = (sheet.baseGIL or 0) - 04;	sheet.MSGweakBIO = "Bio; " 			else 	sheet.MSGweakBIO = ""; end;
            		if sheet.resELE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresELE = "Lightning; " 	else 	sheet.MSGresELE = ""; end;
            		if sheet.resFIR == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresFIR = "Fire; " 			else 	sheet.MSGresFIR = ""; end;
            		if sheet.resGND == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresGND = "Earth; " 		else 	sheet.MSGresGND = ""; end;
            		if sheet.resHOL == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresHOL = "Holy; " 			else 	sheet.MSGresHOL = ""; end;
            		if sheet.resICE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresICE = "Ice; " 			else 	sheet.MSGresICE = ""; end;
            		if sheet.resSHA == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresSHA = "Shadow; " 		else 	sheet.MSGresSHA = ""; end;
            		if sheet.resWAT == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresWAT = "Water; " 		else 	sheet.MSGresWAT = ""; end;
            		if sheet.resWIN == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresWIN = "Wind; " 			else 	sheet.MSGresWIN = ""; end;
            		if sheet.resBIO == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresBIO = "Bio; " 			else 	sheet.MSGresBIO = ""; end;
            		if sheet.immELE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmELE = "Lightning; " 	else 	sheet.MSGimmELE = ""; end;
            		if sheet.immFIR == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmFIR = "Fire; " 			else 	sheet.MSGimmFIR = ""; end;
            		if sheet.immGND == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmGND = "Earth; " 		else 	sheet.MSGimmGND = ""; end;
            		if sheet.immHOL == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmHOL = "Holy; " 			else 	sheet.MSGimmHOL = ""; end;
            		if sheet.immICE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmICE = "Ice; " 			else 	sheet.MSGimmICE = ""; end;
            		if sheet.immSHA == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmSHA = "Shadow; " 		else 	sheet.MSGimmSHA = ""; end;
            		if sheet.immWAT == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmWAT = "Water; " 		else 	sheet.MSGimmWAT = ""; end;
            		if sheet.immWIN == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmWIN = "Wind; " 			else 	sheet.MSGimmWIN = ""; end;
            		if sheet.immBIO == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSGimmBIO = "Bio; " 			else 	sheet.MSGimmBIO = ""; end;
            		if sheet.absELE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsELE = "Lightning; " 	else 	sheet.MSGabsELE = ""; end;
            		if sheet.absFIR == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsFIR = "Fire; " 			else 	sheet.MSGabsFIR = ""; end;
            		if sheet.absGND == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsGND = "Earth; " 		else 	sheet.MSGabsGND = ""; end;
            		if sheet.absHOL == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsHOL = "Holy; " 			else 	sheet.MSGabsHOL = ""; end;
            		if sheet.absICE == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsICE = "Ice; " 			else 	sheet.MSGabsICE = ""; end;
            		if sheet.absSHA == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsSHA = "Shadow; " 		else 	sheet.MSGabsSHA = ""; end;
            		if sheet.absWAT == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsWAT = "Water; " 		else 	sheet.MSGabsWAT = ""; end;
            		if sheet.absWIN == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsWIN = "Wind; " 			else 	sheet.MSGabsWIN = ""; end;
            		if sheet.absBIO == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 15;	sheet.MSGabsBIO = "Bio; " 			else 	sheet.MSGabsBIO = ""; end;
            		
            		if sheet.speBadScan == true then	sheet.baseEXP = (sheet.baseEXP or 0) + 14;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if sheet.speNoScan == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	end;
            		if sheet.supEvader == true then		sheet.baseEXP = (sheet.baseEXP or 0) + 35;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.supEva10 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.supEva25 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.supEva50 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 35;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.supEva75 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.supHArm == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.supLEva == true then 		sheet.baseEXP = (sheet.baseEXP or 0) - 33;			sheet.baseGIL = (sheet.baseGIL or 0) - 11;	end;
            		if sheet.supLMEva == true then 		sheet.baseEXP = (sheet.baseEXP or 0) - 33;			sheet.baseGIL = (sheet.baseGIL or 0) - 11;	end;
            		if sheet.supMEva10 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if sheet.supMEva25 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	end;
            		if sheet.supMEva50 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 35;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            		if sheet.supMEva75 == true then 		sheet.baseEXP = (sheet.baseEXP or 0) + 60;			sheet.baseGIL = (sheet.baseGIL or 0) + 25;	end;
            				
            		
            
            		
            		if ((not sheet.weakBerserk) and (sheet.resBerserk == true) and (not sheet.immBerserk) and (not sheet.resMystify) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresBerserk = "Berserk; " 			else 	sheet.MSGresBerserk = ""; end;
            		if ((not sheet.weakBlind) and (sheet.resBlind == true) and (not sheet.immBlind) and (not sheet.resSeal) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresBlind = "Blind; " 				else 	sheet.MSGresBlind = ""; end;			
            		if ((not sheet.weakImmobilize) and (sheet.resImmobilize == true) and (not sheet.immImmobilize) and (not sheet.resTime) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresImmobilize = "Immobilize; " 	else 	sheet.MSGresImmobilize = ""; end;				
            		if ((not sheet.weakPoison) and (sheet.resPoison == true) and (not sheet.immPoison) and (not sheet.resToxin) and (not sheet.immToxin) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresPoison = "Poison; " 			else 	sheet.MSGresPoison = ""; end;					
            		if ((not sheet.weakSleep) and (sheet.resSleep == true) and (not sheet.immSleep) and (not sheet.resSeal) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresSleep = "Sleep; " 				else 	sheet.MSGresSleep = ""; end;					
            		if ((not sheet.weakSlow) and (sheet.resSlow == true) and (not sheet.immSlow) and (not sheet.resTime) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresSlow = "Slow; " 				else 	sheet.MSGresSlow = ""; end;					
            		if ((not sheet.weakZombie) and (sheet.resZombie == true) and (not sheet.immZombie) and (not sheet.resTransform) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresZombie = "Zombie; " 			else 	sheet.MSGresZombie = ""; end;					
            		if ((sheet.resLock == true) and (not sheet.immLock) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 02;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresLock = "Lock; " 				else 	sheet.MSGresLock = ""; end;					
            		if ((not sheet.weakCondemn) and (sheet.resCondemn == true) and (not sheet.immCondemn) and (not sheet.resFatal) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresCondemn = "Condemn; " 			else 	sheet.MSGresCondemn = ""; end;					
            		if ((not sheet.weakConfuse) and (sheet.resConfuse == true) and (not sheet.immConfuse) and (not sheet.resMystify) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresConfuse = "Confuse; " 			else 	sheet.MSGresConfuse = ""; end;								
            		if ((not sheet.weakCurse) and (sheet.resCurse == true) and (not sheet.immCurse) and (not sheet.resSeal) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresCurse = "Curse; " 				else 	sheet.MSGresCurse = ""; end;		
            		if ((not sheet.weakDisable) and (sheet.resDisable == true) and (not sheet.immDisable) and (not sheet.resTime) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresDisable = "Disable; " 			else 	sheet.MSGresDisable = ""; end;		
            		if ((not sheet.weakPetrify) and (sheet.resPetrify == true) and (not sheet.immPetrify) and (not sheet.resTransform) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresPetrify = "Petrify; " 			else 	sheet.MSGresPetrify = ""; end;		
            		if ((not sheet.weakSilence) and (sheet.resSilence == true) and (not sheet.immSilence) and (not sheet.resSeal) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresSilence = "Silence; " 			else 	sheet.MSGresSilence = ""; end;		
            		if ((not sheet.weakSap) and (sheet.resSap == true) and (not sheet.immSap) and (not sheet.resTime) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresSap = "Sap; " 					else 	sheet.MSGresSap = ""; end;						
            		if ((not sheet.weakUnaware) and (sheet.resUnaware == true) and (not sheet.immUnaware) and (not sheet.resMystify) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 04;			sheet.baseGIL = (sheet.baseGIL or 0) + 01;	sheet.MSGresUnaware = "Unaware; " 			else 	sheet.MSGresUnaware = ""; end;						
            		if ((not sheet.weakEject) and (sheet.resEject == true) and (not sheet.immEject) and (not sheet.resFatal) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresEject = "Eject; " 				else 	sheet.MSGresEject = ""; end;						
            		if ((not sheet.weakMini) and (sheet.resMini == true) and (not sheet.immMini) and (not sheet.resTransform) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresMini = "Mini; " 				else 	sheet.MSGresMini = ""; end;								
            		if ((not sheet.weakSTRDown) and (sheet.resSTRDown == true) and (not sheet.immSTRDown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresSTRDown = "Strength Down; " 	else 	sheet.MSGresSTRDown = ""; end;								
            		if ((not sheet.weakAGIDown) and (sheet.resAGIDown == true) and (not sheet.immAGIDown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresAGIDown = "Agility Down; " 		else 	sheet.MSGresAGIDown = ""; end;		
            		if ((not sheet.weakMAGDown) and (sheet.resMAGDown == true) and (not sheet.immMAGDown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresMAGDown = "Magic Down; " 		else 	sheet.MSGresMAGDown = ""; end;		
            		if ((not sheet.weakMENDown) and (sheet.resMENDown == true) and (not sheet.immMENDown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresMENDown = "Mental Down; " 		else 	sheet.MSGresMENDown = ""; end;		
            		if ((not sheet.weakARMDown) and (sheet.resARMDown == true) and (not sheet.immARMDown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresARMDown = "Armor Down; " 		else 	sheet.MSGresARMDown = ""; end;		
            		if ((not sheet.weakSPIDown) and (sheet.resSPIDown == true) and (not sheet.immSPIDown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresSPIDown = "Spirit Down; " 		else 	sheet.MSGresSPIDown = ""; end;		
            		if ((not sheet.weakSTRBrk) and (sheet.resSTRBrk == true) and (not sheet.immSTRBrk) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresSTRBrk = "Strength Break; " 	else 	sheet.MSGresSTRBrk = ""; end;								
            		if ((not sheet.weakAGIBrk) and (sheet.resAGIBrk == true) and (not sheet.immAGIBrk) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresAGIBrk = "Agility Break; " 		else 	sheet.MSGresAGIBrk = ""; end;		
            		if ((not sheet.weakMAGBrk) and (sheet.resMAGBrk == true) and (not sheet.immMAGBrk) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresMAGBrk = "Magic Break; " 		else 	sheet.MSGresMAGBrk = ""; end;		
            		if ((not sheet.weakMENBrk) and (sheet.resMENBrk == true) and (not sheet.immMENBrk) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresMENBrk = "Mental Break; " 		else 	sheet.MSGresMENBrk = ""; end;		
            		if ((not sheet.weakARMBrk) and (sheet.resARMBrk == true) and (not sheet.immARMBrk) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresARMBrk = "Armor Break; " 		else 	sheet.MSGresARMBrk = ""; end;	
            		if ((not sheet.weakSPIBrk) and (sheet.resSPIBrk == true) and (not sheet.immSPIBrk) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresSPIBrk = "Spirit Break; " 		else 	sheet.MSGresSPIBrk = ""; end;		
            		if ((not sheet.weakStop) and (sheet.resStop == true) and (not sheet.immStop) and (not sheet.resTime) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresStop = "Stop; " 				else 	sheet.MSGresStop = ""; end;		
            		if ((not sheet.weakToad) and (sheet.resToad == true) and (not sheet.immToad) and (not sheet.resTransform) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresToad = "Toad; " 				else 	sheet.MSGresToad = ""; end;						
            		if ((not sheet.weakVenom) and (sheet.resVenom == true) and (not sheet.immVenom) and (not sheet.resToxin) and (not sheet.immToxin) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresVenom = "Venom; " 				else 	sheet.MSGresVenom = ""; end;						
            		if ((sheet.resElemWeak == true) and (not sheet.immElemWeak) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGresElemWeak = "Element Weakness; "	else 	sheet.MSGresElemWeak = ""; end;						
            		if ((not sheet.weakCharm) and (sheet.resCharm == true) and (not sheet.immCharm) and (not sheet.resMystify) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresCharm = "Charm; " 				else 	sheet.MSGresCharm = ""; end;						
            		if ((not sheet.weakDeath) and (sheet.resDeath == true) and (not sheet.immDeath) and (not sheet.resFatal) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresDeath = "Death; " 				else 	sheet.MSGresDeath = ""; end;		
            		if ((not sheet.weakFrozen) and (sheet.resFrozen == true) and (not sheet.immFrozen) and (not sheet.resFatal) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresFrozen = "Frozen; " 			else 	sheet.MSGresFrozen = ""; end;					
            		if ((sheet.resGravity == true) and (not sheet.immGravity) and (not sheet.resFatal) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresGravity = "Gravity; " 			else 	sheet.MSGresGravity = ""; end;	
            		if ((not sheet.weakHeat) and (sheet.resHeat == true) and (not sheet.immHeat) and (not sheet.resFatal) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresHeat = "Heat; " 					else 	sheet.MSGresHeat = ""; end;		
            		if ((not sheet.weakMeltdown) and (sheet.resMeltdown == true) and (not sheet.immMeltdown) and (not sheet.resWeaken) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresMeltdown = "Meltdown; " 		else 	sheet.MSGresMeltdown = ""; end;			
            		if ((not sheet.weakStone) and (sheet.resStone == true) and (not sheet.immStone) and (not sheet.resTransform) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 08;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGresStone = "Stone; " 				else 	sheet.MSGresStone = ""; end;			
            		
            		if ((not sheet.weakBerserk) and (sheet.immBerserk == true) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmBerserk = "Berserk; " 			else 	sheet.MSGimmBerserk = ""; end;		
            		if ((not sheet.weakBlind) and (sheet.immBlind == true) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmBlind = "Blind; " 				else 	sheet.MSGimmBlind = ""; end;					
            		if ((not sheet.weakImmobilize) and (sheet.immImmobilize == true) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmImmobilize = "Immobilize; " 	else 	sheet.MSGimmImmobilize = ""; end;					
            		if ((not sheet.weakPoison) and (sheet.immPoison == true) and (not sheet.immToxin) and (not sheet.immStatus)) 
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmPoison = "Poison; " 			else 	sheet.MSGimmPoison = ""; end;						
            		if ((not sheet.weakSleep) and (sheet.immSleep == true) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmSleep = "Sleep; " 				else 	sheet.MSGimmSleep = ""; end;						
            		if ((not sheet.weakSlow) and (sheet.immSlow == true) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmSlow = "Slow; " 				else 	sheet.MSGimmSlow = ""; end;						
            		if ((not sheet.weakZombie) and (sheet.immZombie == true) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmZombie = "Zombie; " 			else 	sheet.MSGimmZombie = ""; end;						
            		if ((sheet.immLock == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 05;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSGimmLock = "Lock; " 				else 	sheet.MSGimmLock = ""; end;						
            		if ((not sheet.weakCondemn) and (sheet.immCondemn == true) and (not sheet.immFatal) and (not sheet.immStatus) and (sheet.baseTIPO == "Regular"))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;												end						
            		if ((not sheet.weakCondemn) and (sheet.immCondemn == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then																									sheet.MSGimmCondemn = "Condemn; " 			else 	sheet.MSGimmCondemn = ""; end;						
            		if ((not sheet.weakConfuse) and (sheet.immConfuse == true) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmConfuse = "Confuse; " 			else 	sheet.MSGimmConfuse = ""; end;									
            		if ((not sheet.weakCurse) and (sheet.immCurse == true) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmCurse = "Curse; " 				else 	sheet.MSGimmCurse = ""; end;			
            		if ((not sheet.weakDisable) and (sheet.immDisable == true) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmDisable = "Disable; " 			else 	sheet.MSGimmDisable = ""; end;			
            		if ((not sheet.weakPetrify) and (sheet.immPetrify == true) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmPetrify = "Petrify; " 			else 	sheet.MSGimmPetrify = ""; end;			
            		if ((not sheet.weakSilence) and (sheet.immSilence == true) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmSilence = "Silence; " 			else 	sheet.MSGimmSilence = ""; end;			
            		if ((not sheet.weakSap) and (sheet.immSap == true) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmSap = "Sap; " 					else 	sheet.MSGimmSap = ""; end;							
            		if ((not sheet.weakUnaware) and (sheet.immUnaware == true) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSGimmUnaware = "Unaware; " 			else 	sheet.MSGimmUnaware = ""; end;							
            		if ((not sheet.weakEject) and (sheet.immEject == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmEject = "Eject; " 				else 	sheet.MSGimmEject = ""; end;					
            		if ((not sheet.weakMini) and (sheet.immMini == true) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmMini = "Mini; " 				else 	sheet.MSGimmMini = ""; end;								
            		if ((not sheet.weakSTRDown) and (sheet.immSTRDown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmSTRDown = "Strength Down; " 	else 	sheet.MSGimmSTRDown = ""; end;									
            		if ((not sheet.weakAGIDown) and (sheet.immAGIDown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmAGIDown = "Agility Down; " 		else 	sheet.MSGimmAGIDown = ""; end;			
            		if ((not sheet.weakMAGDown) and (sheet.immMAGDown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmMAGRDown = "Magic Down; " 		else 	sheet.MSGimmMAGRDown = ""; end;			
            		if ((not sheet.weakMENDown) and (sheet.immMENDown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmMENDown = "Mental Down; " 		else 	sheet.MSGimmMENDown = ""; end;			
            		if ((not sheet.weakARMDown) and (sheet.immARMDown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmARMDown = "Armor Down; " 		else 	sheet.MSGimmARMDown = ""; end;			
            		if ((not sheet.weakSPIDown) and (sheet.immSPIDown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmSPIDown = "Spirit Down; " 		else 	sheet.MSGimmSPIDown = ""; end;			
            		if ((not sheet.weakSTRBrk) and (sheet.immSTRBrk == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmSTRBrk = "Strength Break; " 	else 	sheet.MSGimmSTRBrk = ""; end;									
            		if ((not sheet.weakAGIBrk) and (sheet.immAGIBrk == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmAGIBrk = "Agility Break; " 		else 	sheet.MSGimmAGIBrk = ""; end;				
            		if ((not sheet.weakMAGBrk) and (sheet.immMAGBrk == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmMAGBrk = "Magic Break; " 		else 	sheet.MSGimmMAGBrk = ""; end;				
            		if ((not sheet.weakMENBrk) and (sheet.immMENBrk == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmMENBrk = "Mental Break; " 		else 	sheet.MSGimmMENBrk = ""; end;				
            		if ((not sheet.weakARMBrk) and (sheet.immARMBrk == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmARMBrk = "Armor Break; " 		else 	sheet.MSGimmARMBrk = ""; end;				
            		if ((not sheet.weakSPIBrk) and (sheet.immSPIBrk == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmSPIBrk = "Spirit Break; " 		else 	sheet.MSGimmSPIBrk = ""; end;				
            		if ((not sheet.weakStop) and (sheet.immStop == true) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmStop = "Stop; " 				else 	sheet.MSGimmStop = ""; end;				
            		if ((not sheet.weakToad) and (sheet.immToad == true) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmToad = "Toad; " 				else 	sheet.MSGimmToad = ""; end;							
            		if ((not sheet.weakVenom) and (sheet.immVenom == true) and (not sheet.immToxin) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmVenom = "Venom; " 				else 	sheet.MSGimmVenom = ""; end;							
            		if ((sheet.immElemWeak == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSGimmElemWeak = "Element Weakness; " else 	sheet.MSGimmElemWeak = ""; end;				
            		if ((not sheet.weakCharm) and (sheet.immCharm == true) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	sheet.MSGimmCharm = "Charm; " 				else 	sheet.MSGimmCharm = ""; end;							
            		if ((not sheet.weakDeath) and (sheet.immDeath == true) and (not sheet.immFatal) and (not sheet.immStatus) and (sheet.baseTIPO == "Regular"))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;								 				end;			
            		if ((not sheet.weakDeath) and (sheet.immDeath == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then																									sheet.MSGimmDeath = "Death; " 				else 	sheet.MSGimmDeath = ""; end;			
            		if ((not sheet.weakFrozen) and (sheet.immFrozen == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	sheet.MSGimmFrozen = "Frozen; " 			else 	sheet.MSGimmFrozen = ""; end;						
            		if ((sheet.immGravity == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	sheet.MSGimmGravity = "Gravity; " 			else 	sheet.MSGimmGravity = ""; end;		
            		if ((not sheet.weakHeat) and (sheet.immHeat == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	sheet.MSGimmHeat = "Heat; " 				else 	sheet.MSGimmHeat = ""; end;			
            		if ((not sheet.weakMeltdown) and (sheet.immMeltdown == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	sheet.MSGimmMeltdown = "Meltdown; " 		else 	sheet.MSGimmMeltdown = ""; end;			
            		if ((not sheet.weakStone) and (sheet.immStone == true) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 16;			sheet.baseGIL = (sheet.baseGIL or 0) + 06;	sheet.MSGimmStone = "Stone; " 				end		
            		if ((sheet.weakBerserk == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;
            		if ((sheet.weakBlind == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;			
            		if ((sheet.weakCurse == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;
            		if ((sheet.weakDisable == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;	
            		if ((sheet.weakImmobilize == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;				
            		if ((sheet.weakPoison == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;				
            		if ((sheet.weakSilence == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;	
            		if ((sheet.weakSleep == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;				
            		if ((sheet.weakSlow == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 10;			sheet.baseGIL = (sheet.baseGIL or 0) - 03;	end;
            		if ((sheet.weakCondemn == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;
            		if ((sheet.weakConfuse == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;
            		if ((sheet.weakPetrify == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if ((sheet.weakSTRDown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;							
            		if ((sheet.weakAGIDown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if ((sheet.weakMAGDown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if ((sheet.weakARMDown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if ((sheet.weakMENDown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;	
            		if ((sheet.weakSPIDown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;		
            		if ((sheet.weakSap == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;					
            		if ((sheet.weakUnaware == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 19;			sheet.baseGIL = (sheet.baseGIL or 0) - 06;	end;
            		if ((sheet.weakEject == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;
            		if ((sheet.weakMini == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;		
            		if ((sheet.weakToad == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if ((sheet.weakSTRBrk == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;							
            		if ((sheet.weakAGIBrk == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if ((sheet.weakMAGBrk == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if ((sheet.weakARMBrk == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if ((sheet.weakMENBrk == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if ((sheet.weakSPIBrk == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;	
            		if ((sheet.weakStop == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;		
            		if ((sheet.weakVenom == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;
            		if ((sheet.weakZombie == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;				
            		if ((sheet.weakCharm == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 15;	end;					
            		if ((sheet.weakDeath == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 15;	end;	
            		if ((sheet.weakFrozen == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 15;	end;				
            		if ((sheet.weakHeat == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 15;	end;	
            		if ((sheet.weakMeltdown == true))		then	sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 15;	end;	
            		if ((sheet.weakStone == true))			then	sheet.baseEXP = (sheet.baseEXP or 0) - 44;			sheet.baseGIL = (sheet.baseGIL or 0) - 15;	end;
            		if ((sheet.resFatal == true) and (not sheet.immFatal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 13;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSG_resFatal = "Fatal; "			else sheet.MSG_resFatal = ""			end;	
            		if ((sheet.resMystify == true) and (not sheet.immMystify) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	sheet.MSG_resMystify = "Mystify; "		else sheet.MSG_resMystify = ""			end;	
            		if ((sheet.resSeal == true) and (not sheet.immSeal) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 11;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	sheet.MSG_resSeal = "Seal; "			else sheet.MSG_resSeal = ""				end;				
            		if ((sheet.resTime == true) and (not sheet.immTime) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSG_resTime = "Time; "			else sheet.MSG_resTime = ""				end;			
            		if ((sheet.resToxin == true) and (not sheet.immToxin) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 06;			sheet.baseGIL = (sheet.baseGIL or 0) + 02;	sheet.MSG_resToxin = "Toxin; "			else sheet.MSG_resToxin = ""			end;			
            		if ((sheet.resTransform == true) and (not sheet.immTransform) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	sheet.MSG_resTransform = "Transform; "	else sheet.MSG_resTransform = ""		end;				
            		if ((sheet.resWeaken == true) and (not sheet.immWeaken) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 09;			sheet.baseGIL = (sheet.baseGIL or 0) + 04;	sheet.MSG_resWeaken = "Weaken; "		else sheet.MSG_resWeaken = ""			end;	
            		if ((sheet.immFatal == true) and (not sheet.immStatus) and (sheet.baseTIPO == "Regular" or sheet.baseTIPO == "Notorious"))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 25;			sheet.baseGIL = (sheet.baseGIL or 0) + 10;											end;
            		if ((sheet.immFatal == true) and (not sheet.immStatus))
            			then																									sheet.MSG_immFatal = "Fatal; "			else sheet.MSG_immFatal = ""			end;
            		if ((sheet.immMystify == true) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	sheet.MSG_immMystify = "Mystify; "		else sheet.MSG_immMystify = ""			end;
            		if ((sheet.immSeal == true) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 22;			sheet.baseGIL = (sheet.baseGIL or 0) + 09;	sheet.MSG_immSeal = "Seal; "			else sheet.MSG_immSeal = ""				end;		
            		if ((sheet.immTime == true) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 12;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSG_immTime = "Time; "			else sheet.MSG_immTime = ""				end;		
            		if ((sheet.immToxin == true) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 13;			sheet.baseGIL = (sheet.baseGIL or 0) + 05;	sheet.MSG_immToxin = "Toxin; "			else sheet.MSG_immToxin = ""			end;			
            		if ((sheet.immTransform == true) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 18;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	sheet.MSG_immTransform = "Transform; "	else sheet.MSG_immTransform = ""		end;				
            		if ((sheet.immWeaken == true) and (not sheet.immStatus))
            			then	sheet.baseEXP = (sheet.baseEXP or 0) + 19;			sheet.baseGIL = (sheet.baseGIL or 0) + 08;	sheet.MSG_immWeaken = "Weaken; ";		else sheet.MSG_immWeaken = ""			end;	
            
            		if (sheet.supMBound == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) - 30;			sheet.baseGIL = (sheet.baseGIL or 0) - 10;	end;
            		if (sheet.supMinion == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) - 20;			sheet.baseGIL = (sheet.baseGIL or 0) - 07;	end;
            		if (sheet.supMRes == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 10;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if (sheet.supNDrain == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 15;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if (sheet.supRDrain == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 07;			sheet.baseGIL = (sheet.baseGIL or 0) + 03;	end;
            		if (sheet.supXFight == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 50;			sheet.baseGIL = (sheet.baseGIL or 0) + 18;	end;
            		
            			
            		if (sheet.fieldAttack == true) then 	sheet.baseEXP = (sheet.baseEXP or 0) + 22;			sheet.baseGIL = (sheet.baseGIL or 0) + 07;	end;
            		if (sheet.fieldSap == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 48;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if (sheet.fieldItem == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 11;	end;
            		if (sheet.fieldMagic == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 48;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if (sheet.fieldMagnetic == true) then 	sheet.baseEXP = (sheet.baseEXP or 0) + 48;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if (sheet.fieldMPSap == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 48;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if (sheet.fieldSpell == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 33;			sheet.baseGIL = (sheet.baseGIL or 0) + 11;	end;
            		if (sheet.fieldTech == true) then 		sheet.baseEXP = (sheet.baseEXP or 0) + 48;			sheet.baseGIL = (sheet.baseGIL or 0) + 16;	end;
            		if (sheet.bossDecoy == true) then	sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(20*(sheet.bossDecoyNum or 1));			
            											sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(25*(sheet.bossDecoyNum or 1));	end;
            		if (sheet.immStatus == true) then 	sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	sheet.MSG_immAll = "All Status; "	else sheet.MSG_immAll = ""	end;
            		if ((sheet.bossSlaveN) == true or (sheet.bossSlaveS == true)) then	
            				sheet.baseEXP = (sheet.baseEXP or 0) - math.floor(30*(sheet.bossSlaveN1 or 0))- math.floor(10*(sheet.bossSlaveN2 or 0));			
            				sheet.baseGIL = (sheet.baseGIL or 0) - math.floor(10*(sheet.bossSlaveN1 or 0))- math.floor(05*(sheet.bossSlaveN2 or 0));	end;		
            		if (sheet.bossXACtion == true) then sheet.baseEXP = (sheet.baseEXP or 0) + 80;			sheet.baseGIL = (sheet.baseGIL or 0) + 30;	end;
            		
            		if ((sheet.reCAtk50 == true) and (not sheet.reCAtk75) and (not sheet.reCAtk100)) then
            			sheet.ajuste = 1;
            			if sheet.reCAtkSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCAtkSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCAtkUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(14*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(07*(sheet.ajuste));
            			end	
            		if ((sheet.reCAtk75 == true) and (not sheet.reCAtk100)) then
            			sheet.ajuste = 1;
            			if sheet.reCAtkSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCAtkSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCAtkUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(22*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(11*(sheet.ajuste));
            			end	
            		if ((sheet.reCAtk100 == true)) then
            			sheet.ajuste = 1;
            			if sheet.reCAtkSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCAtkSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCAtkUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(44*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(22*(sheet.ajuste));
            			end	
            		if ((sheet.reCMag50 == true) and (not sheet.reCMag75) and (not sheet.reCMag100)) then
            			sheet.ajuste = 1;
            			if sheet.reCMagSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCMagSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCMagUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(15*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(07*(sheet.ajuste));
            			end	
            		if ((sheet.reCMag75 == true) and (not sheet.reCMag100)) then
            			sheet.ajuste = 1;
            			if sheet.reCMagSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCMagSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCMagUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(24*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(12*(sheet.ajuste));
            			end	
            		if ((sheet.reCMag100 == true)) then
            			sheet.ajuste = 1;
            			if sheet.reCMagSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCMagSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCMagUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(48*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(24*(sheet.ajuste));
            			end	
            		if ((sheet.reCStanPhys == true)) then
            			sheet.ajuste = 1;
            			if sheet.reCStanSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCStanSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCStanUns == true then			sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(15*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(07*(sheet.ajuste));
            			end	
            		if ((sheet.reCStanMag == true)) then
            			sheet.ajuste = 1;
            			if sheet.reCStanSOSL == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCStanSOSG == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reCStanUns == true then			sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(15*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(07*(sheet.ajuste));
            			end				
            		if ((sheet.reRD5 == true) and (not sheet.reRD10) and (not sheet.reRD25)) then
            			sheet.ajuste = 1;
            			if sheet.reRDSOSL == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRDSOSG == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRDUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(25*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(07*(sheet.ajuste));
            			end	
            		if ((sheet.reRD10 == true) and (not sheet.reRD25)) then
            			sheet.ajuste = 1;
            			if sheet.reRDSOSL == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRDSOSG == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRDUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(10*(sheet.ajuste));
            			end	
            		if ((sheet.reRD25 == true)) then
            			sheet.ajuste = 1;
            			if sheet.reRDSOSL == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRDSOSG == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRDUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(50*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(17*(sheet.ajuste));
            			end	
            		if ((sheet.reCFin == true)) then
            			sheet.ajuste = 1;
            			if sheet.reCFinUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(20*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(10*(sheet.ajuste));
            			end	
            		if ((sheet.reCFiss == true)) then
            			sheet.ajuste = 1;
            			if sheet.reCFissUns == true then			sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(10*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(03*(sheet.ajuste));
            			end				
            		if ((sheet.reRotate == true)) then
            			sheet.ajuste = 1;
            			if sheet.reRotateGain == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRotateLose == true then			sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.reRotateUns == true then			sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(21*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(07*(sheet.ajuste));
            			end		
            		if ((sheet.recCSFloat == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSAgiUP == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSSpiUP == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSGNDSpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSFIRSpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSWATSpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSWINSpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSICESpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSELESpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSHOLSpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSSHASpikes == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(30*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(14*(sheet.ajuste));
            			end	
            		if ((sheet.recCSProtect == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(35*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(16*(sheet.ajuste));
            			end
            		if ((sheet.recCSShell == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(35*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(16*(sheet.ajuste));
            			end	
            		if ((sheet.recCSARMUP == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(35*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(16*(sheet.ajuste));
            			end	
            		if ((sheet.recCSMENUP == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(35*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(16*(sheet.ajuste));
            			end			
            		if ((sheet.recCSHaste == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(43*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(20*(sheet.ajuste));
            			end	
            		if ((sheet.recCSReflect == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(43*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(20*(sheet.ajuste));
            			end	
            		if ((sheet.recCSPOWUP == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(43*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(20*(sheet.ajuste));
            			end	
            		if ((sheet.recCSMAGUP == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(43*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(20*(sheet.ajuste));
            			end		
            		if ((sheet.recCSRegen == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(59*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(24*(sheet.ajuste));
            			end		
            		if ((sheet.recCSAura == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(59*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(24*(sheet.ajuste));	
            			end
            		if ((sheet.recCSVanish == true)) then
            			sheet.ajuste = 1;
            			if sheet.recCSGain == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSLose == true then				sheet.ajuste = (sheet.ajuste) - 0.25;	end
            			if sheet.recCSUns == true then				sheet.ajuste = (sheet.ajuste) + 2.00;	end
            			sheet.baseEXP = (sheet.baseEXP or 0) + math.floor(59*(sheet.ajuste));
            			sheet.baseGIL = (sheet.baseGIL or 0) + math.floor(24*(sheet.ajuste));	
            			end
            			
            		if ((tonumber(sheet.Atk1ExpF) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Atk1ExpF) or 0);	end
            		if ((tonumber(sheet.Atk2ExpF) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Atk2ExpF) or 0);	end
            		if ((tonumber(sheet.Atk3ExpF) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Atk3ExpF) or 0);	end
            		if ((tonumber(sheet.Atk4ExpF) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Atk4ExpF) or 0);	end	
            		if ((tonumber(sheet.Atk1GilF) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Atk1GilF) or 0);	end
            		if ((tonumber(sheet.Atk2GilF) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Atk2GilF) or 0);	end
            		if ((tonumber(sheet.Atk3GilF) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Atk3GilF) or 0);	end
            		if ((tonumber(sheet.Atk4GilF) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Atk4GilF) or 0);	end	
            					
            		if ((tonumber(sheet.Special1Exp) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Special1Exp) or 0);	end
            		if ((tonumber(sheet.Special2Exp) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Special2Exp) or 0);	end
            		if ((tonumber(sheet.Special3Exp) or 0) >= 0) then 			sheet.baseEXP = (sheet.baseEXP or 0) + (tonumber(sheet.Special3Exp) or 0);	end
            		if ((tonumber(sheet.Special1Gil) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Special1Gil) or 0);	end
            		if ((tonumber(sheet.Special2Gil) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Special2Gil) or 0);	end
            		if ((tonumber(sheet.Special3Gil) or 0) >= 0) then 			sheet.baseGIL = (sheet.baseGIL or 0) + (tonumber(sheet.Special3Gil) or 0);	end
            					
            	
            			
            		sheet.ExpFinal = ((sheet.baseEXP or 0)+(sheet.bonusEXP or 0))*(sheet.valLV or 0);
            		sheet.GilFinal = ((sheet.baseGIL or 0)+(sheet.bonusGIL or 0))*(sheet.valLV or 0);
            		sheet.ExpEach = math.floor((sheet.ExpFinal or 0)/(sheet.NPlayers or 1));
            		sheet.GilEach = math.floor((sheet.GilFinal or 0)/(sheet.NPlayers or 1));
        end, obj);

    function obj:_releaseEvents()
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

        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.checkBox427 ~= nil then self.checkBox427:destroy(); self.checkBox427 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.checkBox285 ~= nil then self.checkBox285:destroy(); self.checkBox285 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox304 ~= nil then self.checkBox304:destroy(); self.checkBox304 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.checkBox317 ~= nil then self.checkBox317:destroy(); self.checkBox317 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.checkBox180 ~= nil then self.checkBox180:destroy(); self.checkBox180 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.checkBox306 ~= nil then self.checkBox306:destroy(); self.checkBox306 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.checkBox378 ~= nil then self.checkBox378:destroy(); self.checkBox378 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.checkBox251 ~= nil then self.checkBox251:destroy(); self.checkBox251 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.checkBox360 ~= nil then self.checkBox360:destroy(); self.checkBox360 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.checkBox347 ~= nil then self.checkBox347:destroy(); self.checkBox347 = nil; end;
        if self.checkBox177 ~= nil then self.checkBox177:destroy(); self.checkBox177 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.checkBox445 ~= nil then self.checkBox445:destroy(); self.checkBox445 = nil; end;
        if self.checkBox329 ~= nil then self.checkBox329:destroy(); self.checkBox329 = nil; end;
        if self.checkBox391 ~= nil then self.checkBox391:destroy(); self.checkBox391 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.checkBox167 ~= nil then self.checkBox167:destroy(); self.checkBox167 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.checkBox350 ~= nil then self.checkBox350:destroy(); self.checkBox350 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.checkBox359 ~= nil then self.checkBox359:destroy(); self.checkBox359 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.checkBox204 ~= nil then self.checkBox204:destroy(); self.checkBox204 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.checkBox197 ~= nil then self.checkBox197:destroy(); self.checkBox197 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.checkBox333 ~= nil then self.checkBox333:destroy(); self.checkBox333 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.checkBox244 ~= nil then self.checkBox244:destroy(); self.checkBox244 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.checkBox175 ~= nil then self.checkBox175:destroy(); self.checkBox175 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.checkBox293 ~= nil then self.checkBox293:destroy(); self.checkBox293 = nil; end;
        if self.checkBox202 ~= nil then self.checkBox202:destroy(); self.checkBox202 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.checkBox222 ~= nil then self.checkBox222:destroy(); self.checkBox222 = nil; end;
        if self.checkBox288 ~= nil then self.checkBox288:destroy(); self.checkBox288 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox409 ~= nil then self.checkBox409:destroy(); self.checkBox409 = nil; end;
        if self.checkBox425 ~= nil then self.checkBox425:destroy(); self.checkBox425 = nil; end;
        if self.checkBox311 ~= nil then self.checkBox311:destroy(); self.checkBox311 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkBox162 ~= nil then self.checkBox162:destroy(); self.checkBox162 = nil; end;
        if self.checkBox144 ~= nil then self.checkBox144:destroy(); self.checkBox144 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.checkBox370 ~= nil then self.checkBox370:destroy(); self.checkBox370 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.checkBox195 ~= nil then self.checkBox195:destroy(); self.checkBox195 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.checkBox266 ~= nil then self.checkBox266:destroy(); self.checkBox266 = nil; end;
        if self.checkBox362 ~= nil then self.checkBox362:destroy(); self.checkBox362 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.checkBox254 ~= nil then self.checkBox254:destroy(); self.checkBox254 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.checkBox211 ~= nil then self.checkBox211:destroy(); self.checkBox211 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.checkBox176 ~= nil then self.checkBox176:destroy(); self.checkBox176 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox361 ~= nil then self.checkBox361:destroy(); self.checkBox361 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox189 ~= nil then self.checkBox189:destroy(); self.checkBox189 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.checkBox201 ~= nil then self.checkBox201:destroy(); self.checkBox201 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.checkBox365 ~= nil then self.checkBox365:destroy(); self.checkBox365 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.checkBox271 ~= nil then self.checkBox271:destroy(); self.checkBox271 = nil; end;
        if self.checkBox307 ~= nil then self.checkBox307:destroy(); self.checkBox307 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.checkBox371 ~= nil then self.checkBox371:destroy(); self.checkBox371 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.checkBox338 ~= nil then self.checkBox338:destroy(); self.checkBox338 = nil; end;
        if self.checkBox405 ~= nil then self.checkBox405:destroy(); self.checkBox405 = nil; end;
        if self.checkBox217 ~= nil then self.checkBox217:destroy(); self.checkBox217 = nil; end;
        if self.checkBox178 ~= nil then self.checkBox178:destroy(); self.checkBox178 = nil; end;
        if self.checkBox272 ~= nil then self.checkBox272:destroy(); self.checkBox272 = nil; end;
        if self.checkBox145 ~= nil then self.checkBox145:destroy(); self.checkBox145 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.checkBox233 ~= nil then self.checkBox233:destroy(); self.checkBox233 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.checkBox327 ~= nil then self.checkBox327:destroy(); self.checkBox327 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.checkBox223 ~= nil then self.checkBox223:destroy(); self.checkBox223 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.checkBox247 ~= nil then self.checkBox247:destroy(); self.checkBox247 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.checkBox226 ~= nil then self.checkBox226:destroy(); self.checkBox226 = nil; end;
        if self.checkBox410 ~= nil then self.checkBox410:destroy(); self.checkBox410 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.checkBox364 ~= nil then self.checkBox364:destroy(); self.checkBox364 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.checkBox402 ~= nil then self.checkBox402:destroy(); self.checkBox402 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.checkBox268 ~= nil then self.checkBox268:destroy(); self.checkBox268 = nil; end;
        if self.checkBox228 ~= nil then self.checkBox228:destroy(); self.checkBox228 = nil; end;
        if self.checkBox355 ~= nil then self.checkBox355:destroy(); self.checkBox355 = nil; end;
        if self.checkBox433 ~= nil then self.checkBox433:destroy(); self.checkBox433 = nil; end;
        if self.checkBox428 ~= nil then self.checkBox428:destroy(); self.checkBox428 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox199 ~= nil then self.checkBox199:destroy(); self.checkBox199 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.checkBox412 ~= nil then self.checkBox412:destroy(); self.checkBox412 = nil; end;
        if self.checkBox237 ~= nil then self.checkBox237:destroy(); self.checkBox237 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.checkBox300 ~= nil then self.checkBox300:destroy(); self.checkBox300 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.checkBox218 ~= nil then self.checkBox218:destroy(); self.checkBox218 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.checkBox264 ~= nil then self.checkBox264:destroy(); self.checkBox264 = nil; end;
        if self.checkBox384 ~= nil then self.checkBox384:destroy(); self.checkBox384 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.checkBox312 ~= nil then self.checkBox312:destroy(); self.checkBox312 = nil; end;
        if self.checkBox325 ~= nil then self.checkBox325:destroy(); self.checkBox325 = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox153 ~= nil then self.checkBox153:destroy(); self.checkBox153 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.checkBox159 ~= nil then self.checkBox159:destroy(); self.checkBox159 = nil; end;
        if self.checkBox319 ~= nil then self.checkBox319:destroy(); self.checkBox319 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.checkBox406 ~= nil then self.checkBox406:destroy(); self.checkBox406 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.checkBox280 ~= nil then self.checkBox280:destroy(); self.checkBox280 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.checkBox444 ~= nil then self.checkBox444:destroy(); self.checkBox444 = nil; end;
        if self.checkBox208 ~= nil then self.checkBox208:destroy(); self.checkBox208 = nil; end;
        if self.checkBox157 ~= nil then self.checkBox157:destroy(); self.checkBox157 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.checkBox239 ~= nil then self.checkBox239:destroy(); self.checkBox239 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.checkBox392 ~= nil then self.checkBox392:destroy(); self.checkBox392 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.checkBox404 ~= nil then self.checkBox404:destroy(); self.checkBox404 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.checkBox382 ~= nil then self.checkBox382:destroy(); self.checkBox382 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.checkBox174 ~= nil then self.checkBox174:destroy(); self.checkBox174 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.checkBox245 ~= nil then self.checkBox245:destroy(); self.checkBox245 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.checkBox191 ~= nil then self.checkBox191:destroy(); self.checkBox191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.checkBox183 ~= nil then self.checkBox183:destroy(); self.checkBox183 = nil; end;
        if self.checkBox424 ~= nil then self.checkBox424:destroy(); self.checkBox424 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.checkBox414 ~= nil then self.checkBox414:destroy(); self.checkBox414 = nil; end;
        if self.checkBox372 ~= nil then self.checkBox372:destroy(); self.checkBox372 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.checkBox188 ~= nil then self.checkBox188:destroy(); self.checkBox188 = nil; end;
        if self.checkBox240 ~= nil then self.checkBox240:destroy(); self.checkBox240 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.checkBox376 ~= nil then self.checkBox376:destroy(); self.checkBox376 = nil; end;
        if self.checkBox446 ~= nil then self.checkBox446:destroy(); self.checkBox446 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.checkBox192 ~= nil then self.checkBox192:destroy(); self.checkBox192 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.checkBox243 ~= nil then self.checkBox243:destroy(); self.checkBox243 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.checkBox413 ~= nil then self.checkBox413:destroy(); self.checkBox413 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.checkBox358 ~= nil then self.checkBox358:destroy(); self.checkBox358 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.checkBox259 ~= nil then self.checkBox259:destroy(); self.checkBox259 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.checkBox225 ~= nil then self.checkBox225:destroy(); self.checkBox225 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.checkBox286 ~= nil then self.checkBox286:destroy(); self.checkBox286 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.checkBox173 ~= nil then self.checkBox173:destroy(); self.checkBox173 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.checkBox166 ~= nil then self.checkBox166:destroy(); self.checkBox166 = nil; end;
        if self.checkBox420 ~= nil then self.checkBox420:destroy(); self.checkBox420 = nil; end;
        if self.checkBox227 ~= nil then self.checkBox227:destroy(); self.checkBox227 = nil; end;
        if self.checkBox373 ~= nil then self.checkBox373:destroy(); self.checkBox373 = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.checkBox344 ~= nil then self.checkBox344:destroy(); self.checkBox344 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.checkBox429 ~= nil then self.checkBox429:destroy(); self.checkBox429 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.checkBox336 ~= nil then self.checkBox336:destroy(); self.checkBox336 = nil; end;
        if self.checkBox435 ~= nil then self.checkBox435:destroy(); self.checkBox435 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.checkBox386 ~= nil then self.checkBox386:destroy(); self.checkBox386 = nil; end;
        if self.checkBox422 ~= nil then self.checkBox422:destroy(); self.checkBox422 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.checkBox151 ~= nil then self.checkBox151:destroy(); self.checkBox151 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.checkBox418 ~= nil then self.checkBox418:destroy(); self.checkBox418 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.checkBox316 ~= nil then self.checkBox316:destroy(); self.checkBox316 = nil; end;
        if self.checkBox403 ~= nil then self.checkBox403:destroy(); self.checkBox403 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox294 ~= nil then self.checkBox294:destroy(); self.checkBox294 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox273 ~= nil then self.checkBox273:destroy(); self.checkBox273 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.checkBox363 ~= nil then self.checkBox363:destroy(); self.checkBox363 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox187 ~= nil then self.checkBox187:destroy(); self.checkBox187 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.checkBox258 ~= nil then self.checkBox258:destroy(); self.checkBox258 = nil; end;
        if self.checkBox322 ~= nil then self.checkBox322:destroy(); self.checkBox322 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.checkBox436 ~= nil then self.checkBox436:destroy(); self.checkBox436 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.checkBox297 ~= nil then self.checkBox297:destroy(); self.checkBox297 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.checkBox155 ~= nil then self.checkBox155:destroy(); self.checkBox155 = nil; end;
        if self.checkBox190 ~= nil then self.checkBox190:destroy(); self.checkBox190 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.checkBox200 ~= nil then self.checkBox200:destroy(); self.checkBox200 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.checkBox440 ~= nil then self.checkBox440:destroy(); self.checkBox440 = nil; end;
        if self.checkBox154 ~= nil then self.checkBox154:destroy(); self.checkBox154 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.checkBox334 ~= nil then self.checkBox334:destroy(); self.checkBox334 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.checkBox430 ~= nil then self.checkBox430:destroy(); self.checkBox430 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.checkBox326 ~= nil then self.checkBox326:destroy(); self.checkBox326 = nil; end;
        if self.checkBox438 ~= nil then self.checkBox438:destroy(); self.checkBox438 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.checkBox357 ~= nil then self.checkBox357:destroy(); self.checkBox357 = nil; end;
        if self.checkBox423 ~= nil then self.checkBox423:destroy(); self.checkBox423 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.checkBox314 ~= nil then self.checkBox314:destroy(); self.checkBox314 = nil; end;
        if self.checkBox241 ~= nil then self.checkBox241:destroy(); self.checkBox241 = nil; end;
        if self.checkBox390 ~= nil then self.checkBox390:destroy(); self.checkBox390 = nil; end;
        if self.checkBox236 ~= nil then self.checkBox236:destroy(); self.checkBox236 = nil; end;
        if self.checkBox165 ~= nil then self.checkBox165:destroy(); self.checkBox165 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox302 ~= nil then self.checkBox302:destroy(); self.checkBox302 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.checkBox158 ~= nil then self.checkBox158:destroy(); self.checkBox158 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.checkBox298 ~= nil then self.checkBox298:destroy(); self.checkBox298 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.checkBox385 ~= nil then self.checkBox385:destroy(); self.checkBox385 = nil; end;
        if self.checkBox398 ~= nil then self.checkBox398:destroy(); self.checkBox398 = nil; end;
        if self.checkBox169 ~= nil then self.checkBox169:destroy(); self.checkBox169 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.checkBox232 ~= nil then self.checkBox232:destroy(); self.checkBox232 = nil; end;
        if self.checkBox432 ~= nil then self.checkBox432:destroy(); self.checkBox432 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.checkBox263 ~= nil then self.checkBox263:destroy(); self.checkBox263 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.checkBox224 ~= nil then self.checkBox224:destroy(); self.checkBox224 = nil; end;
        if self.checkBox255 ~= nil then self.checkBox255:destroy(); self.checkBox255 = nil; end;
        if self.checkBox395 ~= nil then self.checkBox395:destroy(); self.checkBox395 = nil; end;
        if self.checkBox353 ~= nil then self.checkBox353:destroy(); self.checkBox353 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox219 ~= nil then self.checkBox219:destroy(); self.checkBox219 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.checkBox305 ~= nil then self.checkBox305:destroy(); self.checkBox305 = nil; end;
        if self.checkBox341 ~= nil then self.checkBox341:destroy(); self.checkBox341 = nil; end;
        if self.checkBox407 ~= nil then self.checkBox407:destroy(); self.checkBox407 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.checkBox281 ~= nil then self.checkBox281:destroy(); self.checkBox281 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.checkBox267 ~= nil then self.checkBox267:destroy(); self.checkBox267 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.checkBox212 ~= nil then self.checkBox212:destroy(); self.checkBox212 = nil; end;
        if self.checkBox366 ~= nil then self.checkBox366:destroy(); self.checkBox366 = nil; end;
        if self.checkBox369 ~= nil then self.checkBox369:destroy(); self.checkBox369 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.checkBox246 ~= nil then self.checkBox246:destroy(); self.checkBox246 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.checkBox315 ~= nil then self.checkBox315:destroy(); self.checkBox315 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.checkBox383 ~= nil then self.checkBox383:destroy(); self.checkBox383 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.checkBox215 ~= nil then self.checkBox215:destroy(); self.checkBox215 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.checkBox380 ~= nil then self.checkBox380:destroy(); self.checkBox380 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.checkBox439 ~= nil then self.checkBox439:destroy(); self.checkBox439 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.checkBox343 ~= nil then self.checkBox343:destroy(); self.checkBox343 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.checkBox238 ~= nil then self.checkBox238:destroy(); self.checkBox238 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.checkBox330 ~= nil then self.checkBox330:destroy(); self.checkBox330 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.checkBox324 ~= nil then self.checkBox324:destroy(); self.checkBox324 = nil; end;
        if self.checkBox411 ~= nil then self.checkBox411:destroy(); self.checkBox411 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox275 ~= nil then self.checkBox275:destroy(); self.checkBox275 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.checkBox170 ~= nil then self.checkBox170:destroy(); self.checkBox170 = nil; end;
        if self.checkBox198 ~= nil then self.checkBox198:destroy(); self.checkBox198 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.checkBox214 ~= nil then self.checkBox214:destroy(); self.checkBox214 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.checkBox394 ~= nil then self.checkBox394:destroy(); self.checkBox394 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox234 ~= nil then self.checkBox234:destroy(); self.checkBox234 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox388 ~= nil then self.checkBox388:destroy(); self.checkBox388 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.checkBox203 ~= nil then self.checkBox203:destroy(); self.checkBox203 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.checkBox216 ~= nil then self.checkBox216:destroy(); self.checkBox216 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.checkBox146 ~= nil then self.checkBox146:destroy(); self.checkBox146 = nil; end;
        if self.checkBox279 ~= nil then self.checkBox279:destroy(); self.checkBox279 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox210 ~= nil then self.checkBox210:destroy(); self.checkBox210 = nil; end;
        if self.checkBox152 ~= nil then self.checkBox152:destroy(); self.checkBox152 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.checkBox290 ~= nil then self.checkBox290:destroy(); self.checkBox290 = nil; end;
        if self.checkBox308 ~= nil then self.checkBox308:destroy(); self.checkBox308 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.checkBox260 ~= nil then self.checkBox260:destroy(); self.checkBox260 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.checkBox296 ~= nil then self.checkBox296:destroy(); self.checkBox296 = nil; end;
        if self.checkBox342 ~= nil then self.checkBox342:destroy(); self.checkBox342 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.checkBox332 ~= nil then self.checkBox332:destroy(); self.checkBox332 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.checkBox349 ~= nil then self.checkBox349:destroy(); self.checkBox349 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.checkBox416 ~= nil then self.checkBox416:destroy(); self.checkBox416 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.checkBox377 ~= nil then self.checkBox377:destroy(); self.checkBox377 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.checkBox313 ~= nil then self.checkBox313:destroy(); self.checkBox313 = nil; end;
        if self.checkBox256 ~= nil then self.checkBox256:destroy(); self.checkBox256 = nil; end;
        if self.checkBox149 ~= nil then self.checkBox149:destroy(); self.checkBox149 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.checkBox346 ~= nil then self.checkBox346:destroy(); self.checkBox346 = nil; end;
        if self.checkBox345 ~= nil then self.checkBox345:destroy(); self.checkBox345 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.checkBox193 ~= nil then self.checkBox193:destroy(); self.checkBox193 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.checkBox147 ~= nil then self.checkBox147:destroy(); self.checkBox147 = nil; end;
        if self.checkBox339 ~= nil then self.checkBox339:destroy(); self.checkBox339 = nil; end;
        if self.checkBox231 ~= nil then self.checkBox231:destroy(); self.checkBox231 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.checkBox337 ~= nil then self.checkBox337:destroy(); self.checkBox337 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.checkBox230 ~= nil then self.checkBox230:destroy(); self.checkBox230 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox401 ~= nil then self.checkBox401:destroy(); self.checkBox401 = nil; end;
        if self.checkBox196 ~= nil then self.checkBox196:destroy(); self.checkBox196 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.checkBox381 ~= nil then self.checkBox381:destroy(); self.checkBox381 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.checkBox249 ~= nil then self.checkBox249:destroy(); self.checkBox249 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.checkBox277 ~= nil then self.checkBox277:destroy(); self.checkBox277 = nil; end;
        if self.checkBox182 ~= nil then self.checkBox182:destroy(); self.checkBox182 = nil; end;
        if self.checkBox303 ~= nil then self.checkBox303:destroy(); self.checkBox303 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.checkBox185 ~= nil then self.checkBox185:destroy(); self.checkBox185 = nil; end;
        if self.checkBox321 ~= nil then self.checkBox321:destroy(); self.checkBox321 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.checkBox229 ~= nil then self.checkBox229:destroy(); self.checkBox229 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.checkBox156 ~= nil then self.checkBox156:destroy(); self.checkBox156 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox287 ~= nil then self.checkBox287:destroy(); self.checkBox287 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.checkBox323 ~= nil then self.checkBox323:destroy(); self.checkBox323 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox163 ~= nil then self.checkBox163:destroy(); self.checkBox163 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkBox299 ~= nil then self.checkBox299:destroy(); self.checkBox299 = nil; end;
        if self.checkBox164 ~= nil then self.checkBox164:destroy(); self.checkBox164 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.checkBox194 ~= nil then self.checkBox194:destroy(); self.checkBox194 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox393 ~= nil then self.checkBox393:destroy(); self.checkBox393 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.checkBox220 ~= nil then self.checkBox220:destroy(); self.checkBox220 = nil; end;
        if self.checkBox320 ~= nil then self.checkBox320:destroy(); self.checkBox320 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.checkBox397 ~= nil then self.checkBox397:destroy(); self.checkBox397 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.checkBox150 ~= nil then self.checkBox150:destroy(); self.checkBox150 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.checkBox142 ~= nil then self.checkBox142:destroy(); self.checkBox142 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.checkBox179 ~= nil then self.checkBox179:destroy(); self.checkBox179 = nil; end;
        if self.checkBox261 ~= nil then self.checkBox261:destroy(); self.checkBox261 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.checkBox367 ~= nil then self.checkBox367:destroy(); self.checkBox367 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.checkBox301 ~= nil then self.checkBox301:destroy(); self.checkBox301 = nil; end;
        if self.checkBox235 ~= nil then self.checkBox235:destroy(); self.checkBox235 = nil; end;
        if self.checkBox276 ~= nil then self.checkBox276:destroy(); self.checkBox276 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.checkBox309 ~= nil then self.checkBox309:destroy(); self.checkBox309 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.checkBox399 ~= nil then self.checkBox399:destroy(); self.checkBox399 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox387 ~= nil then self.checkBox387:destroy(); self.checkBox387 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.checkBox252 ~= nil then self.checkBox252:destroy(); self.checkBox252 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.checkBox205 ~= nil then self.checkBox205:destroy(); self.checkBox205 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.checkBox389 ~= nil then self.checkBox389:destroy(); self.checkBox389 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.checkBox415 ~= nil then self.checkBox415:destroy(); self.checkBox415 = nil; end;
        if self.checkBox408 ~= nil then self.checkBox408:destroy(); self.checkBox408 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.checkBox379 ~= nil then self.checkBox379:destroy(); self.checkBox379 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.checkBox186 ~= nil then self.checkBox186:destroy(); self.checkBox186 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.checkBox265 ~= nil then self.checkBox265:destroy(); self.checkBox265 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.checkBox250 ~= nil then self.checkBox250:destroy(); self.checkBox250 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.checkBox437 ~= nil then self.checkBox437:destroy(); self.checkBox437 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.checkBox419 ~= nil then self.checkBox419:destroy(); self.checkBox419 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.checkBox295 ~= nil then self.checkBox295:destroy(); self.checkBox295 = nil; end;
        if self.checkBox318 ~= nil then self.checkBox318:destroy(); self.checkBox318 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.checkBox248 ~= nil then self.checkBox248:destroy(); self.checkBox248 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.checkBox374 ~= nil then self.checkBox374:destroy(); self.checkBox374 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.checkBox417 ~= nil then self.checkBox417:destroy(); self.checkBox417 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox282 ~= nil then self.checkBox282:destroy(); self.checkBox282 = nil; end;
        if self.checkBox400 ~= nil then self.checkBox400:destroy(); self.checkBox400 = nil; end;
        if self.checkBox171 ~= nil then self.checkBox171:destroy(); self.checkBox171 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.checkBox328 ~= nil then self.checkBox328:destroy(); self.checkBox328 = nil; end;
        if self.checkBox356 ~= nil then self.checkBox356:destroy(); self.checkBox356 = nil; end;
        if self.checkBox431 ~= nil then self.checkBox431:destroy(); self.checkBox431 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox242 ~= nil then self.checkBox242:destroy(); self.checkBox242 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.checkBox291 ~= nil then self.checkBox291:destroy(); self.checkBox291 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.checkBox148 ~= nil then self.checkBox148:destroy(); self.checkBox148 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.checkBox447 ~= nil then self.checkBox447:destroy(); self.checkBox447 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.checkBox274 ~= nil then self.checkBox274:destroy(); self.checkBox274 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.checkBox270 ~= nil then self.checkBox270:destroy(); self.checkBox270 = nil; end;
        if self.checkBox352 ~= nil then self.checkBox352:destroy(); self.checkBox352 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.checkBox168 ~= nil then self.checkBox168:destroy(); self.checkBox168 = nil; end;
        if self.checkBox340 ~= nil then self.checkBox340:destroy(); self.checkBox340 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.checkBox348 ~= nil then self.checkBox348:destroy(); self.checkBox348 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox172 ~= nil then self.checkBox172:destroy(); self.checkBox172 = nil; end;
        if self.checkBox354 ~= nil then self.checkBox354:destroy(); self.checkBox354 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.checkBox434 ~= nil then self.checkBox434:destroy(); self.checkBox434 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.checkBox213 ~= nil then self.checkBox213:destroy(); self.checkBox213 = nil; end;
        if self.checkBox331 ~= nil then self.checkBox331:destroy(); self.checkBox331 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.checkBox289 ~= nil then self.checkBox289:destroy(); self.checkBox289 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.checkBox441 ~= nil then self.checkBox441:destroy(); self.checkBox441 = nil; end;
        if self.checkBox160 ~= nil then self.checkBox160:destroy(); self.checkBox160 = nil; end;
        if self.checkBox181 ~= nil then self.checkBox181:destroy(); self.checkBox181 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.checkBox426 ~= nil then self.checkBox426:destroy(); self.checkBox426 = nil; end;
        if self.checkBox209 ~= nil then self.checkBox209:destroy(); self.checkBox209 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.checkBox221 ~= nil then self.checkBox221:destroy(); self.checkBox221 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.checkBox143 ~= nil then self.checkBox143:destroy(); self.checkBox143 = nil; end;
        if self.checkBox284 ~= nil then self.checkBox284:destroy(); self.checkBox284 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.checkBox262 ~= nil then self.checkBox262:destroy(); self.checkBox262 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.checkBox421 ~= nil then self.checkBox421:destroy(); self.checkBox421 = nil; end;
        if self.checkBox269 ~= nil then self.checkBox269:destroy(); self.checkBox269 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.checkBox253 ~= nil then self.checkBox253:destroy(); self.checkBox253 = nil; end;
        if self.checkBox351 ~= nil then self.checkBox351:destroy(); self.checkBox351 = nil; end;
        if self.checkBox396 ~= nil then self.checkBox396:destroy(); self.checkBox396 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.checkBox335 ~= nil then self.checkBox335:destroy(); self.checkBox335 = nil; end;
        if self.checkBox310 ~= nil then self.checkBox310:destroy(); self.checkBox310 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.checkBox161 ~= nil then self.checkBox161:destroy(); self.checkBox161 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.checkBox278 ~= nil then self.checkBox278:destroy(); self.checkBox278 = nil; end;
        if self.checkBox368 ~= nil then self.checkBox368:destroy(); self.checkBox368 = nil; end;
        if self.checkBox375 ~= nil then self.checkBox375:destroy(); self.checkBox375 = nil; end;
        if self.checkBox184 ~= nil then self.checkBox184:destroy(); self.checkBox184 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.checkBox292 ~= nil then self.checkBox292:destroy(); self.checkBox292 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.checkBox257 ~= nil then self.checkBox257:destroy(); self.checkBox257 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.checkBox207 ~= nil then self.checkBox207:destroy(); self.checkBox207 = nil; end;
        if self.checkBox283 ~= nil then self.checkBox283:destroy(); self.checkBox283 = nil; end;
        if self.checkBox443 ~= nil then self.checkBox443:destroy(); self.checkBox443 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.checkBox206 ~= nil then self.checkBox206:destroy(); self.checkBox206 = nil; end;
        if self.checkBox442 ~= nil then self.checkBox442:destroy(); self.checkBox442 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMOBFFRPG = {
    newEditor = newfrmMOBFFRPG, 
    new = newfrmMOBFFRPG, 
    name = "frmMOBFFRPG", 
    dataType = "MOB_CREATOR_FFRPG", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Hitoshura - FFRPG Mob Creator", 
    description=""};

frmMOBFFRPG = _frmMOBFFRPG;
rrpg.registrarForm(_frmMOBFFRPG);
rrpg.registrarDataType(_frmMOBFFRPG);

return _frmMOBFFRPG;
