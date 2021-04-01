require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMOBFFRPG()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("MOB_CREATOR_FFRPG");
    obj:setTitle("Hitoshura - FFRPG Mob Creator");
    obj:setName("frmMOBFFRPG");
    obj:setTheme("dark");
    obj:setPadding({left=4, top=4, right=4, bottom=4});

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setLeft(20);
    obj.tabControl1:setTop(20);
    obj.tabControl1:setHeight(650);
    obj.tabControl1:setWidth(1100);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("General");
    obj.tab1:setName("tab1");

    obj.frmGeneral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeneral:setParent(obj.tab1);
    obj.frmGeneral:setName("frmGeneral");
    obj.frmGeneral:setAlign("client");
    obj.frmGeneral:setTheme("dark");
    obj.frmGeneral:setMargins({top=1});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.frmGeneral);
    obj.layout1:setLeft(000);
    obj.layout1:setTop(000);
    obj.layout1:setHeight(650);
    obj.layout1:setWidth(1100);
    obj.layout1:setName("layout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setLeft(000);
    obj.image1:setTop(000);
    obj.image1:setHeight(650);
    obj.image1:setWidth(1100);
    obj.image1:setSRC("/img/wallpaper.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeneral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(30);
    obj.layout2:setTop(010);
    obj.layout2:setHeight(76);
    obj.layout2:setWidth(675);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(000);
    obj.label1:setTop(000);
    obj.label1:setHeight(20);
    obj.label1:setWidth(60);
    obj.label1:setText("Name");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(065);
    obj.edit1:setTop(000);
    obj.edit1:setHeight(20);
    obj.edit1:setWidth(240);
    obj.edit1:setField("baseName");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(000);
    obj.label2:setTop(025);
    obj.label2:setHeight(20);
    obj.label2:setWidth(60);
    obj.label2:setText("Category");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(065);
    obj.comboBox1:setTop(025);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setWidth(240);
    obj.comboBox1:setField("baseCATEGORY");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Abnormal', 'Aerial', 'Amorph', 'Aquan', 'Arcana', 'Beast', 'Construct', 'Dragon', 'Fiend', 'Humanoid', 'Insect', 'Lizard', 'Plant', 'Undead'});
    obj.comboBox1:setValues({'Abnormal', 'Aerial', 'Amorph', 'Aquan', 'Arcana', 'Beast', 'Construct', 'Dragon', 'Fiend', 'Humanoid', 'Insect', 'Lizard', 'Plant', 'Undead'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(390);
    obj.label3:setTop(000);
    obj.label3:setHeight(20);
    obj.label3:setWidth(30);
    obj.label3:setText("Exp");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(425);
    obj.edit2:setTop(000);
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(40);
    obj.edit2:setField("ExpFinal");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(475);
    obj.label4:setTop(000);
    obj.label4:setHeight(20);
    obj.label4:setWidth(55);
    obj.label4:setText("Dividida");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(535);
    obj.edit3:setTop(000);
    obj.edit3:setHeight(20);
    obj.edit3:setWidth(40);
    obj.edit3:setField("ExpEach");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(390);
    obj.label5:setTop(025);
    obj.label5:setHeight(20);
    obj.label5:setWidth(30);
    obj.label5:setText("Gil");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(425);
    obj.edit4:setTop(025);
    obj.edit4:setHeight(20);
    obj.edit4:setWidth(40);
    obj.edit4:setField("GilFinal");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(475);
    obj.label6:setTop(025);
    obj.label6:setHeight(20);
    obj.label6:setWidth(55);
    obj.label6:setText("Dividido");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(535);
    obj.edit5:setTop(025);
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(40);
    obj.edit5:setField("GilEach");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(390);
    obj.label7:setTop(050);
    obj.label7:setHeight(20);
    obj.label7:setWidth(70);
    obj.label7:setText("Nº Players");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(475);
    obj.edit6:setTop(050);
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(40);
    obj.edit6:setField("NPlayers");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(30);
    obj.layout3:setTop(60);
    obj.layout3:setHeight(170);
    obj.layout3:setWidth(320);
    obj.layout3:setName("layout3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(000);
    obj.label8:setTop(000);
    obj.label8:setHeight(20);
    obj.label8:setWidth(60);
    obj.label8:setText("Tipo");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setLeft(065);
    obj.comboBox2:setTop(000);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("baseTIPO");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Regular' , 'Notorious' , 'Boss' , 'End Boss'});
    obj.comboBox2:setValues({'Regular' , 'Notorious' , 'Boss' , 'End Boss'});
    obj.comboBox2:setName("comboBox2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(180);
    obj.label9:setTop(000);
    obj.label9:setHeight(20);
    obj.label9:setWidth(46);
    obj.label9:setText("LV");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(256);
    obj.edit7:setTop(000);
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(30);
    obj.edit7:setField("valLV");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setLeft(000);
    obj.label10:setTop(025);
    obj.label10:setHeight(20);
    obj.label10:setWidth(60);
    obj.label10:setText("Base HP");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout3);
    obj.comboBox3:setLeft(065);
    obj.comboBox3:setTop(025);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setWidth(46);
    obj.comboBox3:setField("baseHP");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'1' , '1.5' , '2' , '4', '6', '8'});
    obj.comboBox3:setValues({'1' , '1.5' , '2' , '4', '6', '8'});
    obj.comboBox3:setName("comboBox3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(000);
    obj.label11:setTop(050);
    obj.label11:setHeight(20);
    obj.label11:setWidth(60);
    obj.label11:setText("Base MP");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout3);
    obj.comboBox4:setLeft(065);
    obj.comboBox4:setTop(050);
    obj.comboBox4:setHeight(20);
    obj.comboBox4:setWidth(46);
    obj.comboBox4:setField("baseMP");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'0' , '0.5' , '1' , '1.5', '2', '4'});
    obj.comboBox4:setValues({'0' , '0.5' , '1' , '1.5', '2', '4'});
    obj.comboBox4:setName("comboBox4");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(180);
    obj.label12:setTop(025);
    obj.label12:setHeight(20);
    obj.label12:setWidth(60);
    obj.label12:setText("Armor");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout3);
    obj.comboBox5:setLeft(256);
    obj.comboBox5:setTop(025);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setWidth(46);
    obj.comboBox5:setField("baseArmor");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox5:setValues({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox5:setName("comboBox5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(180);
    obj.label13:setTop(050);
    obj.label13:setHeight(20);
    obj.label13:setWidth(60);
    obj.label13:setText("M. Armor");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout3);
    obj.comboBox6:setLeft(256);
    obj.comboBox6:setTop(050);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setWidth(46);
    obj.comboBox6:setField("baseMArmor");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox6:setValues({'0.5' , '1' , '2' , '4', '6'});
    obj.comboBox6:setName("comboBox6");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(70);
    obj.layout4:setTop(320);
    obj.layout4:setHeight(100);
    obj.layout4:setWidth(320);
    obj.layout4:setName("layout4");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setLeft(000);
    obj.label14:setTop(000);
    obj.label14:setHeight(20);
    obj.label14:setWidth(55);
    obj.label14:setText("HP Atual");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(060);
    obj.edit8:setTop(000);
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(40);
    obj.edit8:setField("valAtHP");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout4);
    obj.label15:setLeft(110);
    obj.label15:setTop(000);
    obj.label15:setHeight(20);
    obj.label15:setWidth(55);
    obj.label15:setText("HP Máx");
    obj.label15:setAutoSize(true);
    obj.label15:setName("label15");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout4);
    obj.edit9:setLeft(165);
    obj.edit9:setTop(000);
    obj.edit9:setHeight(20);
    obj.edit9:setWidth(40);
    obj.edit9:setField("valMaxHP");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout4);
    obj.label16:setLeft(000);
    obj.label16:setTop(025);
    obj.label16:setHeight(20);
    obj.label16:setWidth(55);
    obj.label16:setText("MP Atual");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout4);
    obj.edit10:setLeft(060);
    obj.edit10:setTop(025);
    obj.edit10:setHeight(20);
    obj.edit10:setWidth(40);
    obj.edit10:setField("valAtMP");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout4);
    obj.label17:setLeft(110);
    obj.label17:setTop(025);
    obj.label17:setHeight(20);
    obj.label17:setWidth(55);
    obj.label17:setText("MP Máx");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setLeft(165);
    obj.edit11:setTop(025);
    obj.edit11:setHeight(20);
    obj.edit11:setWidth(40);
    obj.edit11:setField("valMaxMP");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setLeft(000);
    obj.label18:setTop(050);
    obj.label18:setHeight(20);
    obj.label18:setWidth(55);
    obj.label18:setText("Exp Base");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setLeft(060);
    obj.edit12:setTop(050);
    obj.edit12:setHeight(20);
    obj.edit12:setWidth(40);
    obj.edit12:setField("baseEXP");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout4);
    obj.label19:setLeft(110);
    obj.label19:setTop(050);
    obj.label19:setHeight(20);
    obj.label19:setWidth(55);
    obj.label19:setText("Exp Extra");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setLeft(165);
    obj.edit13:setTop(050);
    obj.edit13:setHeight(20);
    obj.edit13:setWidth(40);
    obj.edit13:setField("bonusEXP");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout4);
    obj.label20:setLeft(000);
    obj.label20:setTop(075);
    obj.label20:setHeight(20);
    obj.label20:setWidth(55);
    obj.label20:setText("Gil Base");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setLeft(060);
    obj.edit14:setTop(075);
    obj.edit14:setHeight(20);
    obj.edit14:setWidth(40);
    obj.edit14:setField("baseGIL");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setLeft(110);
    obj.label21:setTop(075);
    obj.label21:setHeight(20);
    obj.label21:setWidth(55);
    obj.label21:setText("Gil Extra");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setLeft(165);
    obj.edit15:setTop(075);
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(40);
    obj.edit15:setField("bonusGIL");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(100);
    obj.layout5:setTop(160);
    obj.layout5:setHeight(170);
    obj.layout5:setWidth(150);
    obj.layout5:setName("layout5");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout5);
    obj.label22:setLeft(000);
    obj.label22:setTop(000);
    obj.label22:setHeight(20);
    obj.label22:setWidth(30);
    obj.label22:setText("STR");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setLeft(035);
    obj.edit16:setTop(000);
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(30);
    obj.edit16:setField("valSTR");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout5);
    obj.label23:setLeft(000);
    obj.label23:setTop(025);
    obj.label23:setHeight(20);
    obj.label23:setWidth(30);
    obj.label23:setText("VIT");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setLeft(035);
    obj.edit17:setTop(025);
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(30);
    obj.edit17:setField("valVIT");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout5);
    obj.label24:setLeft(000);
    obj.label24:setTop(050);
    obj.label24:setHeight(20);
    obj.label24:setWidth(30);
    obj.label24:setText("AGI");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout5);
    obj.edit18:setLeft(035);
    obj.edit18:setTop(050);
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(30);
    obj.edit18:setField("valAGI");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout5);
    obj.label25:setLeft(080);
    obj.label25:setTop(000);
    obj.label25:setHeight(20);
    obj.label25:setWidth(30);
    obj.label25:setText("SPD");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setLeft(115);
    obj.edit19:setTop(000);
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(30);
    obj.edit19:setField("valSPD");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout5);
    obj.label26:setLeft(080);
    obj.label26:setTop(025);
    obj.label26:setHeight(20);
    obj.label26:setWidth(30);
    obj.label26:setText("MAG");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout5);
    obj.edit20:setLeft(115);
    obj.edit20:setTop(025);
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(30);
    obj.edit20:setField("valMAG");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout5);
    obj.label27:setLeft(080);
    obj.label27:setTop(050);
    obj.label27:setHeight(20);
    obj.label27:setWidth(30);
    obj.label27:setText("SPR");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout5);
    obj.edit21:setLeft(115);
    obj.edit21:setTop(050);
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(30);
    obj.edit21:setField("valSPR");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout5);
    obj.label28:setLeft(020);
    obj.label28:setTop(075);
    obj.label28:setHeight(20);
    obj.label28:setWidth(30);
    obj.label28:setText("Total");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout5);
    obj.label29:setLeft(055);
    obj.label29:setTop(075);
    obj.label29:setHeight(20);
    obj.label29:setWidth(20);
    obj.label29:setField("SomaATT");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout5);
    obj.label30:setLeft(075);
    obj.label30:setTop(075);
    obj.label30:setHeight(20);
    obj.label30:setWidth(4);
    obj.label30:setText("/");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout5);
    obj.label31:setLeft(079);
    obj.label31:setTop(075);
    obj.label31:setHeight(20);
    obj.label31:setWidth(30);
    obj.label31:setField("TeoricoATT");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(780);
    obj.layout6:setTop(450);
    obj.layout6:setHeight(100);
    obj.layout6:setWidth(235);
    obj.layout6:setName("layout6");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout6);
    obj.label32:setLeft(000);
    obj.label32:setTop(000);
    obj.label32:setHeight(20);
    obj.label32:setWidth(150);
    obj.label32:setText("Unique Trait");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout6);
    obj.label33:setLeft(160);
    obj.label33:setTop(000);
    obj.label33:setHeight(20);
    obj.label33:setWidth(30);
    obj.label33:setText("Exp");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout6);
    obj.label34:setLeft(200);
    obj.label34:setTop(000);
    obj.label34:setHeight(20);
    obj.label34:setWidth(30);
    obj.label34:setText("Gil");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout6);
    obj.edit22:setLeft(000);
    obj.edit22:setTop(025);
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(150);
    obj.edit22:setField("Special1");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout6);
    obj.edit23:setLeft(160);
    obj.edit23:setTop(025);
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(30);
    obj.edit23:setField("Special1Exp");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout6);
    obj.edit24:setLeft(200);
    obj.edit24:setTop(025);
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(30);
    obj.edit24:setField("Special1Gil");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout6);
    obj.edit25:setLeft(000);
    obj.edit25:setTop(050);
    obj.edit25:setHeight(20);
    obj.edit25:setWidth(150);
    obj.edit25:setField("Special2");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout6);
    obj.edit26:setLeft(160);
    obj.edit26:setTop(050);
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(30);
    obj.edit26:setField("Special2Exp");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout6);
    obj.edit27:setLeft(200);
    obj.edit27:setTop(050);
    obj.edit27:setHeight(20);
    obj.edit27:setWidth(30);
    obj.edit27:setField("Special2Gil");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout6);
    obj.edit28:setLeft(000);
    obj.edit28:setTop(075);
    obj.edit28:setHeight(20);
    obj.edit28:setWidth(150);
    obj.edit28:setField("Special3");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout6);
    obj.edit29:setLeft(160);
    obj.edit29:setTop(075);
    obj.edit29:setHeight(20);
    obj.edit29:setWidth(30);
    obj.edit29:setField("Special3Exp");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout6);
    obj.edit30:setLeft(200);
    obj.edit30:setTop(075);
    obj.edit30:setHeight(20);
    obj.edit30:setWidth(30);
    obj.edit30:setField("Special3Gil");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(420);
    obj.layout7:setTop(150);
    obj.layout7:setHeight(200);
    obj.layout7:setWidth(140);
    obj.layout7:setName("layout7");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout7);
    obj.label35:setLeft(000);
    obj.label35:setTop(000);
    obj.label35:setHeight(20);
    obj.label35:setWidth(100);
    obj.label35:setText("Accuracy");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout7);
    obj.edit31:setLeft(105);
    obj.edit31:setTop(000);
    obj.edit31:setHeight(20);
    obj.edit31:setWidth(30);
    obj.edit31:setField("valACC");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout7);
    obj.label36:setLeft(000);
    obj.label36:setTop(025);
    obj.label36:setHeight(20);
    obj.label36:setWidth(100);
    obj.label36:setText("Magic Accuracy");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout7);
    obj.edit32:setLeft(105);
    obj.edit32:setTop(025);
    obj.edit32:setHeight(20);
    obj.edit32:setWidth(30);
    obj.edit32:setField("valMACC");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout7);
    obj.label37:setLeft(000);
    obj.label37:setTop(050);
    obj.label37:setHeight(20);
    obj.label37:setWidth(100);
    obj.label37:setText("Dexterity");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout7);
    obj.edit33:setLeft(105);
    obj.edit33:setTop(050);
    obj.edit33:setHeight(20);
    obj.edit33:setWidth(30);
    obj.edit33:setField("valDEX");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout7);
    obj.label38:setLeft(000);
    obj.label38:setTop(075);
    obj.label38:setHeight(20);
    obj.label38:setWidth(100);
    obj.label38:setText("Mind");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout7);
    obj.edit34:setLeft(105);
    obj.edit34:setTop(075);
    obj.edit34:setHeight(20);
    obj.edit34:setWidth(30);
    obj.edit34:setField("valMND");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout7);
    obj.label39:setLeft(000);
    obj.label39:setTop(100);
    obj.label39:setHeight(20);
    obj.label39:setWidth(100);
    obj.label39:setText("Armor");
    obj.label39:setAutoSize(true);
    obj.label39:setName("label39");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout7);
    obj.edit35:setLeft(105);
    obj.edit35:setTop(100);
    obj.edit35:setHeight(20);
    obj.edit35:setWidth(30);
    obj.edit35:setField("valARM");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout7);
    obj.label40:setLeft(000);
    obj.label40:setTop(125);
    obj.label40:setHeight(20);
    obj.label40:setWidth(100);
    obj.label40:setText("Magic Armor");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout7);
    obj.edit36:setLeft(105);
    obj.edit36:setTop(125);
    obj.edit36:setHeight(20);
    obj.edit36:setWidth(30);
    obj.edit36:setField("valMARM");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout7);
    obj.label41:setLeft(000);
    obj.label41:setTop(150);
    obj.label41:setHeight(20);
    obj.label41:setWidth(100);
    obj.label41:setText("Evasion");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout7);
    obj.edit37:setLeft(105);
    obj.edit37:setTop(150);
    obj.edit37:setHeight(20);
    obj.edit37:setWidth(30);
    obj.edit37:setField("valEVA");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout7);
    obj.label42:setLeft(000);
    obj.label42:setTop(175);
    obj.label42:setHeight(20);
    obj.label42:setWidth(100);
    obj.label42:setText("Magic Evasion");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout7);
    obj.edit38:setLeft(105);
    obj.edit38:setTop(175);
    obj.edit38:setHeight(20);
    obj.edit38:setWidth(30);
    obj.edit38:setField("valMEVA");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(700);
    obj.layout8:setTop(40);
    obj.layout8:setHeight(400);
    obj.layout8:setWidth(370);
    obj.layout8:setName("layout8");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout8);
    obj.button1:setLeft(53);
    obj.button1:setTop(00);
    obj.button1:setHeight(20);
    obj.button1:setWidth(80);
    obj.button1:setText("Scan");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout8);
    obj.button2:setLeft(137);
    obj.button2:setTop(00);
    obj.button2:setHeight(20);
    obj.button2:setWidth(80);
    obj.button2:setText("Sensor");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout8);
    obj.button3:setLeft(222);
    obj.button3:setTop(00);
    obj.button3:setHeight(20);
    obj.button3:setWidth(80);
    obj.button3:setText("Peep");
    obj.button3:setName("button3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout8);
    obj.rectangle1:setLeft(000);
    obj.rectangle1:setTop(25);
    obj.rectangle1:setWidth(360);
    obj.rectangle1:setHeight(360);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout8);
    obj.image2:setLeft(000);
    obj.image2:setTop(25);
    obj.image2:setWidth(360);
    obj.image2:setHeight(360);
    obj.image2:setField("imagemDoPersonagem");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setName("image2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox1);
    obj.layout9:setLeft(1000);
    obj.layout9:setTop(570);
    obj.layout9:setHeight(50);
    obj.layout9:setWidth(90);
    obj.layout9:setName("layout9");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout9);
    obj.label43:setLeft(000);
    obj.label43:setTop(000);
    obj.label43:setHeight(20);
    obj.label43:setWidth(30);
    obj.label43:setText("Exp");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout9);
    obj.edit39:setLeft(035);
    obj.edit39:setTop(000);
    obj.edit39:setHeight(20);
    obj.edit39:setWidth(50);
    obj.edit39:setField("ExpFinal");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout9);
    obj.label44:setLeft(000);
    obj.label44:setTop(025);
    obj.label44:setHeight(20);
    obj.label44:setWidth(30);
    obj.label44:setText("Gil");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout9);
    obj.edit40:setLeft(35);
    obj.edit40:setTop(025);
    obj.edit40:setHeight(20);
    obj.edit40:setWidth(50);
    obj.edit40:setField("GilFinal");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(300);
    obj.layout10:setTop(450);
    obj.layout10:setHeight(150);
    obj.layout10:setWidth(500);
    obj.layout10:setName("layout10");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout10);
    obj.checkBox1:setLeft(000);
    obj.checkBox1:setTop(000);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setWidth(100);
    obj.checkBox1:setText("Agility Up");
    obj.checkBox1:setField("statAGIUP");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout10);
    obj.checkBox2:setLeft(000);
    obj.checkBox2:setTop(025);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setWidth(100);
    obj.checkBox2:setText("Agility Down");
    obj.checkBox2:setField("statAGIDOWN");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout10);
    obj.checkBox3:setLeft(000);
    obj.checkBox3:setTop(050);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setWidth(100);
    obj.checkBox3:setText("Agility Break");
    obj.checkBox3:setField("statAGIBREAK");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout10);
    obj.checkBox4:setLeft(000);
    obj.checkBox4:setTop(075);
    obj.checkBox4:setHeight(20);
    obj.checkBox4:setWidth(100);
    obj.checkBox4:setText("Blink");
    obj.checkBox4:setField("statBLINK");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout10);
    obj.checkBox5:setLeft(105);
    obj.checkBox5:setTop(000);
    obj.checkBox5:setHeight(20);
    obj.checkBox5:setWidth(100);
    obj.checkBox5:setText("Spirit Up");
    obj.checkBox5:setField("statSPIUP");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout10);
    obj.checkBox6:setLeft(105);
    obj.checkBox6:setTop(025);
    obj.checkBox6:setHeight(20);
    obj.checkBox6:setWidth(100);
    obj.checkBox6:setText("Spirit Down");
    obj.checkBox6:setField("statSPIDOWN");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout10);
    obj.checkBox7:setLeft(105);
    obj.checkBox7:setTop(050);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setWidth(100);
    obj.checkBox7:setText("Spirit Break");
    obj.checkBox7:setField("statSPIBREAK");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout10);
    obj.checkBox8:setLeft(105);
    obj.checkBox8:setTop(075);
    obj.checkBox8:setHeight(20);
    obj.checkBox8:setWidth(100);
    obj.checkBox8:setText("Immobilize");
    obj.checkBox8:setField("statIMMOBILIZE");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout10);
    obj.checkBox9:setLeft(210);
    obj.checkBox9:setTop(000);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setWidth(100);
    obj.checkBox9:setText("Armor Up");
    obj.checkBox9:setField("statARMUP");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout10);
    obj.checkBox10:setLeft(210);
    obj.checkBox10:setTop(025);
    obj.checkBox10:setHeight(20);
    obj.checkBox10:setWidth(100);
    obj.checkBox10:setText("Armor Down");
    obj.checkBox10:setField("statARMDOWN");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout10);
    obj.checkBox11:setLeft(210);
    obj.checkBox11:setTop(050);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setWidth(100);
    obj.checkBox11:setText("Armor Break");
    obj.checkBox11:setField("statARMBREAK");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout10);
    obj.checkBox12:setLeft(210);
    obj.checkBox12:setTop(075);
    obj.checkBox12:setHeight(20);
    obj.checkBox12:setWidth(100);
    obj.checkBox12:setText("Mini");
    obj.checkBox12:setField("statMINI");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout10);
    obj.checkBox13:setLeft(315);
    obj.checkBox13:setTop(000);
    obj.checkBox13:setHeight(20);
    obj.checkBox13:setWidth(100);
    obj.checkBox13:setText("Mental Up");
    obj.checkBox13:setField("statMENUP");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout10);
    obj.checkBox14:setLeft(315);
    obj.checkBox14:setTop(025);
    obj.checkBox14:setHeight(20);
    obj.checkBox14:setWidth(100);
    obj.checkBox14:setText("Mental Down");
    obj.checkBox14:setField("statMENDOWN");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout10);
    obj.checkBox15:setLeft(315);
    obj.checkBox15:setTop(050);
    obj.checkBox15:setHeight(20);
    obj.checkBox15:setWidth(100);
    obj.checkBox15:setText("Mental Break");
    obj.checkBox15:setField("statMENBREAK");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout10);
    obj.checkBox16:setLeft(315);
    obj.checkBox16:setTop(075);
    obj.checkBox16:setHeight(20);
    obj.checkBox16:setWidth(100);
    obj.checkBox16:setText("Toad");
    obj.checkBox16:setField("statTOAD");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout10);
    obj.checkBox17:setLeft(000);
    obj.checkBox17:setTop(100);
    obj.checkBox17:setHeight(20);
    obj.checkBox17:setWidth(100);
    obj.checkBox17:setText("Blind");
    obj.checkBox17:setField("statBLIND");
    obj.checkBox17:setName("checkBox17");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Attacks");
    obj.tab2:setName("tab2");

    obj.frmAttack = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAttack:setParent(obj.tab2);
    obj.frmAttack:setName("frmAttack");
    obj.frmAttack:setAlign("client");
    obj.frmAttack:setTheme("dark");
    obj.frmAttack:setMargins({top=1});

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.frmAttack);
    obj.layout11:setLeft(000);
    obj.layout11:setTop(000);
    obj.layout11:setHeight(650);
    obj.layout11:setWidth(1100);
    obj.layout11:setName("layout11");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout11);
    obj.image3:setLeft(000);
    obj.image3:setTop(000);
    obj.image3:setHeight(650);
    obj.image3:setWidth(1100);
    obj.image3:setSRC("/img/wallpaper.png");
    obj.image3:setStyle("autoFit");
    obj.image3:setName("image3");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAttack);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox2);
    obj.layout12:setLeft(70);
    obj.layout12:setTop(20);
    obj.layout12:setHeight(275);
    obj.layout12:setWidth(250);
    obj.layout12:setName("layout12");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout12);
    obj.label45:setLeft(000);
    obj.label45:setTop(000);
    obj.label45:setHeight(20);
    obj.label45:setWidth(40);
    obj.label45:setText("Nome:");
    obj.label45:setAutoSize(true);
    obj.label45:setHorzTextAlign("leading");
    obj.label45:setName("label45");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout12);
    obj.edit41:setLeft(045);
    obj.edit41:setTop(000);
    obj.edit41:setHeight(20);
    obj.edit41:setWidth(195);
    obj.edit41:setField("Nome1");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout12);
    obj.label46:setLeft(000);
    obj.label46:setTop(025);
    obj.label46:setHeight(20);
    obj.label46:setWidth(150);
    obj.label46:setText("Modificador");
    obj.label46:setAutoSize(true);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout12);
    obj.label47:setLeft(155);
    obj.label47:setTop(025);
    obj.label47:setHeight(20);
    obj.label47:setWidth(40);
    obj.label47:setText("Exp");
    obj.label47:setAutoSize(true);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout12);
    obj.label48:setLeft(200);
    obj.label48:setTop(025);
    obj.label48:setHeight(20);
    obj.label48:setWidth(40);
    obj.label48:setText("Gil");
    obj.label48:setAutoSize(true);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout12);
    obj.edit42:setLeft(000);
    obj.edit42:setTop(050);
    obj.edit42:setHeight(20);
    obj.edit42:setWidth(150);
    obj.edit42:setField("Atk1P1");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout12);
    obj.edit43:setLeft(155);
    obj.edit43:setTop(050);
    obj.edit43:setHeight(20);
    obj.edit43:setWidth(40);
    obj.edit43:setField("Atk1P1Exp");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout12);
    obj.edit44:setLeft(200);
    obj.edit44:setTop(050);
    obj.edit44:setHeight(20);
    obj.edit44:setWidth(40);
    obj.edit44:setField("Atk1P1Gil");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout12);
    obj.edit45:setLeft(000);
    obj.edit45:setTop(075);
    obj.edit45:setHeight(20);
    obj.edit45:setWidth(150);
    obj.edit45:setField("Atk1P2");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout12);
    obj.edit46:setLeft(155);
    obj.edit46:setTop(075);
    obj.edit46:setHeight(20);
    obj.edit46:setWidth(40);
    obj.edit46:setField("Atk1P2Exp");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout12);
    obj.edit47:setLeft(200);
    obj.edit47:setTop(075);
    obj.edit47:setHeight(20);
    obj.edit47:setWidth(40);
    obj.edit47:setField("Atk1P2Gil");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout12);
    obj.edit48:setLeft(000);
    obj.edit48:setTop(100);
    obj.edit48:setHeight(20);
    obj.edit48:setWidth(150);
    obj.edit48:setField("Atk1P3");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout12);
    obj.edit49:setLeft(155);
    obj.edit49:setTop(100);
    obj.edit49:setHeight(20);
    obj.edit49:setWidth(40);
    obj.edit49:setField("Atk1P3Exp");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout12);
    obj.edit50:setLeft(200);
    obj.edit50:setTop(100);
    obj.edit50:setHeight(20);
    obj.edit50:setWidth(40);
    obj.edit50:setField("Atk1P3Gil");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout12);
    obj.edit51:setLeft(000);
    obj.edit51:setTop(125);
    obj.edit51:setHeight(20);
    obj.edit51:setWidth(150);
    obj.edit51:setField("Atk1P4");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout12);
    obj.edit52:setLeft(155);
    obj.edit52:setTop(125);
    obj.edit52:setHeight(20);
    obj.edit52:setWidth(40);
    obj.edit52:setField("Atk1P4Exp");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout12);
    obj.edit53:setLeft(200);
    obj.edit53:setTop(125);
    obj.edit53:setHeight(20);
    obj.edit53:setWidth(40);
    obj.edit53:setField("Atk1P4Gil");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout12);
    obj.edit54:setLeft(000);
    obj.edit54:setTop(150);
    obj.edit54:setHeight(20);
    obj.edit54:setWidth(150);
    obj.edit54:setField("Atk1P5");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout12);
    obj.edit55:setLeft(155);
    obj.edit55:setTop(150);
    obj.edit55:setHeight(20);
    obj.edit55:setWidth(40);
    obj.edit55:setField("Atk1P5Exp");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout12);
    obj.edit56:setLeft(200);
    obj.edit56:setTop(150);
    obj.edit56:setHeight(20);
    obj.edit56:setWidth(40);
    obj.edit56:setField("Atk1P5Gil");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout12);
    obj.edit57:setLeft(000);
    obj.edit57:setTop(175);
    obj.edit57:setHeight(20);
    obj.edit57:setWidth(150);
    obj.edit57:setField("Atk1P6");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout12);
    obj.edit58:setLeft(155);
    obj.edit58:setTop(175);
    obj.edit58:setHeight(20);
    obj.edit58:setWidth(40);
    obj.edit58:setField("Atk1P6Exp");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout12);
    obj.edit59:setLeft(200);
    obj.edit59:setTop(175);
    obj.edit59:setHeight(20);
    obj.edit59:setWidth(40);
    obj.edit59:setField("Atk1P6Gil");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout12);
    obj.edit60:setLeft(000);
    obj.edit60:setTop(200);
    obj.edit60:setHeight(20);
    obj.edit60:setWidth(150);
    obj.edit60:setField("Atk1P7");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout12);
    obj.edit61:setLeft(155);
    obj.edit61:setTop(200);
    obj.edit61:setHeight(20);
    obj.edit61:setWidth(40);
    obj.edit61:setField("Atk1P7Exp");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout12);
    obj.edit62:setLeft(200);
    obj.edit62:setTop(200);
    obj.edit62:setHeight(20);
    obj.edit62:setWidth(40);
    obj.edit62:setField("Atk1P7Gil");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout12);
    obj.edit63:setLeft(000);
    obj.edit63:setTop(225);
    obj.edit63:setHeight(20);
    obj.edit63:setWidth(150);
    obj.edit63:setField("Atk1P8");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout12);
    obj.edit64:setLeft(155);
    obj.edit64:setTop(225);
    obj.edit64:setHeight(20);
    obj.edit64:setWidth(40);
    obj.edit64:setField("Atk1P8Exp");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout12);
    obj.edit65:setLeft(200);
    obj.edit65:setTop(225);
    obj.edit65:setHeight(20);
    obj.edit65:setWidth(40);
    obj.edit65:setField("Atk1P8Gil");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout12);
    obj.edit66:setLeft(155);
    obj.edit66:setTop(250);
    obj.edit66:setHeight(20);
    obj.edit66:setWidth(40);
    obj.edit66:setField("Atk1ExpF");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout12);
    obj.edit67:setLeft(200);
    obj.edit67:setTop(250);
    obj.edit67:setHeight(20);
    obj.edit67:setWidth(40);
    obj.edit67:setField("Atk1GilF");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox2);
    obj.layout13:setLeft(420);
    obj.layout13:setTop(20);
    obj.layout13:setHeight(300);
    obj.layout13:setWidth(250);
    obj.layout13:setName("layout13");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout13);
    obj.label49:setLeft(000);
    obj.label49:setTop(000);
    obj.label49:setHeight(20);
    obj.label49:setWidth(40);
    obj.label49:setText("Nome:");
    obj.label49:setAutoSize(true);
    obj.label49:setHorzTextAlign("leading");
    obj.label49:setName("label49");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout13);
    obj.edit68:setLeft(045);
    obj.edit68:setTop(000);
    obj.edit68:setHeight(20);
    obj.edit68:setWidth(195);
    obj.edit68:setField("Nome2");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout13);
    obj.label50:setLeft(000);
    obj.label50:setTop(025);
    obj.label50:setHeight(20);
    obj.label50:setWidth(150);
    obj.label50:setText("Modificador");
    obj.label50:setAutoSize(true);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout13);
    obj.label51:setLeft(155);
    obj.label51:setTop(025);
    obj.label51:setHeight(20);
    obj.label51:setWidth(40);
    obj.label51:setText("Exp");
    obj.label51:setAutoSize(true);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout13);
    obj.label52:setLeft(200);
    obj.label52:setTop(025);
    obj.label52:setHeight(20);
    obj.label52:setWidth(40);
    obj.label52:setText("Gil");
    obj.label52:setAutoSize(true);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout13);
    obj.edit69:setLeft(000);
    obj.edit69:setTop(050);
    obj.edit69:setHeight(20);
    obj.edit69:setWidth(150);
    obj.edit69:setField("Atk2P1");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout13);
    obj.edit70:setLeft(155);
    obj.edit70:setTop(050);
    obj.edit70:setHeight(20);
    obj.edit70:setWidth(40);
    obj.edit70:setField("Atk2P1Exp");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout13);
    obj.edit71:setLeft(200);
    obj.edit71:setTop(050);
    obj.edit71:setHeight(20);
    obj.edit71:setWidth(40);
    obj.edit71:setField("Atk2P1Gil");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout13);
    obj.edit72:setLeft(000);
    obj.edit72:setTop(075);
    obj.edit72:setHeight(20);
    obj.edit72:setWidth(150);
    obj.edit72:setField("Atk2P2");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout13);
    obj.edit73:setLeft(155);
    obj.edit73:setTop(075);
    obj.edit73:setHeight(20);
    obj.edit73:setWidth(40);
    obj.edit73:setField("Atk2P2Exp");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout13);
    obj.edit74:setLeft(200);
    obj.edit74:setTop(075);
    obj.edit74:setHeight(20);
    obj.edit74:setWidth(40);
    obj.edit74:setField("Atk2P2Gil");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout13);
    obj.edit75:setLeft(000);
    obj.edit75:setTop(100);
    obj.edit75:setHeight(20);
    obj.edit75:setWidth(150);
    obj.edit75:setField("Atk2P3");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout13);
    obj.edit76:setLeft(155);
    obj.edit76:setTop(100);
    obj.edit76:setHeight(20);
    obj.edit76:setWidth(40);
    obj.edit76:setField("Atk2P3Exp");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout13);
    obj.edit77:setLeft(200);
    obj.edit77:setTop(100);
    obj.edit77:setHeight(20);
    obj.edit77:setWidth(40);
    obj.edit77:setField("Atk2P3Gil");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout13);
    obj.edit78:setLeft(000);
    obj.edit78:setTop(125);
    obj.edit78:setHeight(20);
    obj.edit78:setWidth(150);
    obj.edit78:setField("Atk2P4");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout13);
    obj.edit79:setLeft(155);
    obj.edit79:setTop(125);
    obj.edit79:setHeight(20);
    obj.edit79:setWidth(40);
    obj.edit79:setField("Atk2P4Exp");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout13);
    obj.edit80:setLeft(200);
    obj.edit80:setTop(125);
    obj.edit80:setHeight(20);
    obj.edit80:setWidth(40);
    obj.edit80:setField("Atk2P4Gil");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout13);
    obj.edit81:setLeft(000);
    obj.edit81:setTop(150);
    obj.edit81:setHeight(20);
    obj.edit81:setWidth(150);
    obj.edit81:setField("Atk2P5");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout13);
    obj.edit82:setLeft(155);
    obj.edit82:setTop(150);
    obj.edit82:setHeight(20);
    obj.edit82:setWidth(40);
    obj.edit82:setField("Atk2P5Exp");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout13);
    obj.edit83:setLeft(200);
    obj.edit83:setTop(150);
    obj.edit83:setHeight(20);
    obj.edit83:setWidth(40);
    obj.edit83:setField("Atk2P5Gil");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout13);
    obj.edit84:setLeft(000);
    obj.edit84:setTop(175);
    obj.edit84:setHeight(20);
    obj.edit84:setWidth(150);
    obj.edit84:setField("Atk2P6");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout13);
    obj.edit85:setLeft(155);
    obj.edit85:setTop(175);
    obj.edit85:setHeight(20);
    obj.edit85:setWidth(40);
    obj.edit85:setField("Atk2P6Exp");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout13);
    obj.edit86:setLeft(200);
    obj.edit86:setTop(175);
    obj.edit86:setHeight(20);
    obj.edit86:setWidth(40);
    obj.edit86:setField("Atk2P6Gil");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout13);
    obj.edit87:setLeft(000);
    obj.edit87:setTop(200);
    obj.edit87:setHeight(20);
    obj.edit87:setWidth(150);
    obj.edit87:setField("Atk2P7");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout13);
    obj.edit88:setLeft(155);
    obj.edit88:setTop(200);
    obj.edit88:setHeight(20);
    obj.edit88:setWidth(40);
    obj.edit88:setField("Atk2P7Exp");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout13);
    obj.edit89:setLeft(200);
    obj.edit89:setTop(200);
    obj.edit89:setHeight(20);
    obj.edit89:setWidth(40);
    obj.edit89:setField("Atk2P7Gil");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout13);
    obj.edit90:setLeft(000);
    obj.edit90:setTop(225);
    obj.edit90:setHeight(20);
    obj.edit90:setWidth(150);
    obj.edit90:setField("Atk2P8");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout13);
    obj.edit91:setLeft(155);
    obj.edit91:setTop(225);
    obj.edit91:setHeight(20);
    obj.edit91:setWidth(40);
    obj.edit91:setField("Atk2P8Exp");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout13);
    obj.edit92:setLeft(200);
    obj.edit92:setTop(225);
    obj.edit92:setHeight(20);
    obj.edit92:setWidth(40);
    obj.edit92:setField("Atk2P8Gil");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout13);
    obj.edit93:setLeft(155);
    obj.edit93:setTop(250);
    obj.edit93:setHeight(20);
    obj.edit93:setWidth(40);
    obj.edit93:setField("Atk2ExpF");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setType("number");
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout13);
    obj.edit94:setLeft(200);
    obj.edit94:setTop(250);
    obj.edit94:setHeight(20);
    obj.edit94:setWidth(40);
    obj.edit94:setField("Atk2GilF");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox2);
    obj.layout14:setLeft(770);
    obj.layout14:setTop(20);
    obj.layout14:setHeight(300);
    obj.layout14:setWidth(250);
    obj.layout14:setName("layout14");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout14);
    obj.label53:setLeft(000);
    obj.label53:setTop(000);
    obj.label53:setHeight(20);
    obj.label53:setWidth(40);
    obj.label53:setText("Nome:");
    obj.label53:setAutoSize(true);
    obj.label53:setHorzTextAlign("leading");
    obj.label53:setName("label53");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout14);
    obj.edit95:setLeft(045);
    obj.edit95:setTop(000);
    obj.edit95:setHeight(20);
    obj.edit95:setWidth(195);
    obj.edit95:setField("Nome3");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout14);
    obj.label54:setLeft(000);
    obj.label54:setTop(025);
    obj.label54:setHeight(20);
    obj.label54:setWidth(150);
    obj.label54:setText("Modificador");
    obj.label54:setAutoSize(true);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout14);
    obj.label55:setLeft(155);
    obj.label55:setTop(025);
    obj.label55:setHeight(20);
    obj.label55:setWidth(40);
    obj.label55:setText("Exp");
    obj.label55:setAutoSize(true);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout14);
    obj.label56:setLeft(200);
    obj.label56:setTop(025);
    obj.label56:setHeight(20);
    obj.label56:setWidth(40);
    obj.label56:setText("Gil");
    obj.label56:setAutoSize(true);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout14);
    obj.edit96:setLeft(000);
    obj.edit96:setTop(050);
    obj.edit96:setHeight(20);
    obj.edit96:setWidth(150);
    obj.edit96:setField("Atk3P1");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout14);
    obj.edit97:setLeft(155);
    obj.edit97:setTop(050);
    obj.edit97:setHeight(20);
    obj.edit97:setWidth(40);
    obj.edit97:setField("Atk3P1Exp");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout14);
    obj.edit98:setLeft(200);
    obj.edit98:setTop(050);
    obj.edit98:setHeight(20);
    obj.edit98:setWidth(40);
    obj.edit98:setField("Atk3P1Gil");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout14);
    obj.edit99:setLeft(000);
    obj.edit99:setTop(075);
    obj.edit99:setHeight(20);
    obj.edit99:setWidth(150);
    obj.edit99:setField("Atk3P2");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout14);
    obj.edit100:setLeft(155);
    obj.edit100:setTop(075);
    obj.edit100:setHeight(20);
    obj.edit100:setWidth(40);
    obj.edit100:setField("Atk3P2Exp");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout14);
    obj.edit101:setLeft(200);
    obj.edit101:setTop(075);
    obj.edit101:setHeight(20);
    obj.edit101:setWidth(40);
    obj.edit101:setField("Atk3P2Gil");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout14);
    obj.edit102:setLeft(000);
    obj.edit102:setTop(100);
    obj.edit102:setHeight(20);
    obj.edit102:setWidth(150);
    obj.edit102:setField("Atk3P3");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout14);
    obj.edit103:setLeft(155);
    obj.edit103:setTop(100);
    obj.edit103:setHeight(20);
    obj.edit103:setWidth(40);
    obj.edit103:setField("Atk3P3Exp");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout14);
    obj.edit104:setLeft(200);
    obj.edit104:setTop(100);
    obj.edit104:setHeight(20);
    obj.edit104:setWidth(40);
    obj.edit104:setField("Atk3P3Gil");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout14);
    obj.edit105:setLeft(000);
    obj.edit105:setTop(125);
    obj.edit105:setHeight(20);
    obj.edit105:setWidth(150);
    obj.edit105:setField("Atk3P4");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout14);
    obj.edit106:setLeft(155);
    obj.edit106:setTop(125);
    obj.edit106:setHeight(20);
    obj.edit106:setWidth(40);
    obj.edit106:setField("Atk3P4Exp");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout14);
    obj.edit107:setLeft(200);
    obj.edit107:setTop(125);
    obj.edit107:setHeight(20);
    obj.edit107:setWidth(40);
    obj.edit107:setField("Atk3P4Gil");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout14);
    obj.edit108:setLeft(000);
    obj.edit108:setTop(150);
    obj.edit108:setHeight(20);
    obj.edit108:setWidth(150);
    obj.edit108:setField("Atk3P5");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout14);
    obj.edit109:setLeft(155);
    obj.edit109:setTop(150);
    obj.edit109:setHeight(20);
    obj.edit109:setWidth(40);
    obj.edit109:setField("Atk3P5Exp");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout14);
    obj.edit110:setLeft(200);
    obj.edit110:setTop(150);
    obj.edit110:setHeight(20);
    obj.edit110:setWidth(40);
    obj.edit110:setField("Atk3P5Gil");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout14);
    obj.edit111:setLeft(000);
    obj.edit111:setTop(175);
    obj.edit111:setHeight(20);
    obj.edit111:setWidth(150);
    obj.edit111:setField("Atk3P6");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout14);
    obj.edit112:setLeft(155);
    obj.edit112:setTop(175);
    obj.edit112:setHeight(20);
    obj.edit112:setWidth(40);
    obj.edit112:setField("Atk3P6Exp");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout14);
    obj.edit113:setLeft(200);
    obj.edit113:setTop(175);
    obj.edit113:setHeight(20);
    obj.edit113:setWidth(40);
    obj.edit113:setField("Atk3P6Gil");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout14);
    obj.edit114:setLeft(000);
    obj.edit114:setTop(200);
    obj.edit114:setHeight(20);
    obj.edit114:setWidth(150);
    obj.edit114:setField("Atk3P7");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout14);
    obj.edit115:setLeft(155);
    obj.edit115:setTop(200);
    obj.edit115:setHeight(20);
    obj.edit115:setWidth(40);
    obj.edit115:setField("Atk3P7Exp");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout14);
    obj.edit116:setLeft(200);
    obj.edit116:setTop(200);
    obj.edit116:setHeight(20);
    obj.edit116:setWidth(40);
    obj.edit116:setField("Atk3P7Gil");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout14);
    obj.edit117:setLeft(000);
    obj.edit117:setTop(225);
    obj.edit117:setHeight(20);
    obj.edit117:setWidth(150);
    obj.edit117:setField("Atk3P8");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout14);
    obj.edit118:setLeft(155);
    obj.edit118:setTop(225);
    obj.edit118:setHeight(20);
    obj.edit118:setWidth(40);
    obj.edit118:setField("Atk3P8Exp");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout14);
    obj.edit119:setLeft(200);
    obj.edit119:setTop(225);
    obj.edit119:setHeight(20);
    obj.edit119:setWidth(40);
    obj.edit119:setField("Atk3P8Gil");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout14);
    obj.edit120:setLeft(155);
    obj.edit120:setTop(250);
    obj.edit120:setHeight(20);
    obj.edit120:setWidth(40);
    obj.edit120:setField("Atk3ExpF");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setType("number");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout14);
    obj.edit121:setLeft(200);
    obj.edit121:setTop(250);
    obj.edit121:setHeight(20);
    obj.edit121:setWidth(40);
    obj.edit121:setField("Atk3GilF");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setType("number");
    obj.edit121:setName("edit121");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox2);
    obj.layout15:setLeft(70);
    obj.layout15:setTop(300);
    obj.layout15:setHeight(275);
    obj.layout15:setWidth(250);
    obj.layout15:setName("layout15");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout15);
    obj.label57:setLeft(000);
    obj.label57:setTop(000);
    obj.label57:setHeight(20);
    obj.label57:setWidth(40);
    obj.label57:setText("Nome:");
    obj.label57:setAutoSize(true);
    obj.label57:setHorzTextAlign("leading");
    obj.label57:setName("label57");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout15);
    obj.edit122:setLeft(045);
    obj.edit122:setTop(000);
    obj.edit122:setHeight(20);
    obj.edit122:setWidth(195);
    obj.edit122:setField("Nome4");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout15);
    obj.label58:setLeft(000);
    obj.label58:setTop(025);
    obj.label58:setHeight(20);
    obj.label58:setWidth(150);
    obj.label58:setText("Modificador");
    obj.label58:setAutoSize(true);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout15);
    obj.label59:setLeft(155);
    obj.label59:setTop(025);
    obj.label59:setHeight(20);
    obj.label59:setWidth(40);
    obj.label59:setText("Exp");
    obj.label59:setAutoSize(true);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout15);
    obj.label60:setLeft(200);
    obj.label60:setTop(025);
    obj.label60:setHeight(20);
    obj.label60:setWidth(40);
    obj.label60:setText("Gil");
    obj.label60:setAutoSize(true);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout15);
    obj.edit123:setLeft(000);
    obj.edit123:setTop(050);
    obj.edit123:setHeight(20);
    obj.edit123:setWidth(150);
    obj.edit123:setField("Atk4P1");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout15);
    obj.edit124:setLeft(155);
    obj.edit124:setTop(050);
    obj.edit124:setHeight(20);
    obj.edit124:setWidth(40);
    obj.edit124:setField("Atk4P1Exp");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout15);
    obj.edit125:setLeft(200);
    obj.edit125:setTop(050);
    obj.edit125:setHeight(20);
    obj.edit125:setWidth(40);
    obj.edit125:setField("Atk4P1Gil");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout15);
    obj.edit126:setLeft(000);
    obj.edit126:setTop(075);
    obj.edit126:setHeight(20);
    obj.edit126:setWidth(150);
    obj.edit126:setField("Atk4P2");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout15);
    obj.edit127:setLeft(155);
    obj.edit127:setTop(075);
    obj.edit127:setHeight(20);
    obj.edit127:setWidth(40);
    obj.edit127:setField("Atk4P2Exp");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout15);
    obj.edit128:setLeft(200);
    obj.edit128:setTop(075);
    obj.edit128:setHeight(20);
    obj.edit128:setWidth(40);
    obj.edit128:setField("Atk4P2Gil");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout15);
    obj.edit129:setLeft(000);
    obj.edit129:setTop(100);
    obj.edit129:setHeight(20);
    obj.edit129:setWidth(150);
    obj.edit129:setField("Atk4P3");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout15);
    obj.edit130:setLeft(155);
    obj.edit130:setTop(100);
    obj.edit130:setHeight(20);
    obj.edit130:setWidth(40);
    obj.edit130:setField("Atk4P3Exp");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout15);
    obj.edit131:setLeft(200);
    obj.edit131:setTop(100);
    obj.edit131:setHeight(20);
    obj.edit131:setWidth(40);
    obj.edit131:setField("Atk4P3Gil");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout15);
    obj.edit132:setLeft(000);
    obj.edit132:setTop(125);
    obj.edit132:setHeight(20);
    obj.edit132:setWidth(150);
    obj.edit132:setField("Atk4P4");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout15);
    obj.edit133:setLeft(155);
    obj.edit133:setTop(125);
    obj.edit133:setHeight(20);
    obj.edit133:setWidth(40);
    obj.edit133:setField("Atk4P4Exp");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout15);
    obj.edit134:setLeft(200);
    obj.edit134:setTop(125);
    obj.edit134:setHeight(20);
    obj.edit134:setWidth(40);
    obj.edit134:setField("Atk4P4Gil");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout15);
    obj.edit135:setLeft(000);
    obj.edit135:setTop(150);
    obj.edit135:setHeight(20);
    obj.edit135:setWidth(150);
    obj.edit135:setField("Atk4P5");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout15);
    obj.edit136:setLeft(155);
    obj.edit136:setTop(150);
    obj.edit136:setHeight(20);
    obj.edit136:setWidth(40);
    obj.edit136:setField("Atk4P5Exp");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout15);
    obj.edit137:setLeft(200);
    obj.edit137:setTop(150);
    obj.edit137:setHeight(20);
    obj.edit137:setWidth(40);
    obj.edit137:setField("Atk4P5Gil");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout15);
    obj.edit138:setLeft(000);
    obj.edit138:setTop(175);
    obj.edit138:setHeight(20);
    obj.edit138:setWidth(150);
    obj.edit138:setField("Atk4P6");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout15);
    obj.edit139:setLeft(155);
    obj.edit139:setTop(175);
    obj.edit139:setHeight(20);
    obj.edit139:setWidth(40);
    obj.edit139:setField("Atk4P6Exp");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout15);
    obj.edit140:setLeft(200);
    obj.edit140:setTop(175);
    obj.edit140:setHeight(20);
    obj.edit140:setWidth(40);
    obj.edit140:setField("Atk4P6Gil");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout15);
    obj.edit141:setLeft(000);
    obj.edit141:setTop(200);
    obj.edit141:setHeight(20);
    obj.edit141:setWidth(150);
    obj.edit141:setField("Atk4P7");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout15);
    obj.edit142:setLeft(155);
    obj.edit142:setTop(200);
    obj.edit142:setHeight(20);
    obj.edit142:setWidth(40);
    obj.edit142:setField("Atk4P7Exp");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout15);
    obj.edit143:setLeft(200);
    obj.edit143:setTop(200);
    obj.edit143:setHeight(20);
    obj.edit143:setWidth(40);
    obj.edit143:setField("Atk4P7Gil");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout15);
    obj.edit144:setLeft(000);
    obj.edit144:setTop(225);
    obj.edit144:setHeight(20);
    obj.edit144:setWidth(150);
    obj.edit144:setField("Atk4P8");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout15);
    obj.edit145:setLeft(155);
    obj.edit145:setTop(225);
    obj.edit145:setHeight(20);
    obj.edit145:setWidth(40);
    obj.edit145:setField("Atk4P8Exp");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout15);
    obj.edit146:setLeft(200);
    obj.edit146:setTop(225);
    obj.edit146:setHeight(20);
    obj.edit146:setWidth(40);
    obj.edit146:setField("Atk4P8Gil");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout15);
    obj.edit147:setLeft(155);
    obj.edit147:setTop(250);
    obj.edit147:setHeight(20);
    obj.edit147:setWidth(40);
    obj.edit147:setField("Atk4ExpF");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setType("number");
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout15);
    obj.edit148:setLeft(200);
    obj.edit148:setTop(250);
    obj.edit148:setHeight(20);
    obj.edit148:setWidth(40);
    obj.edit148:setField("Atk4GilF");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setType("number");
    obj.edit148:setName("edit148");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox2);
    obj.layout16:setLeft(420);
    obj.layout16:setTop(300);
    obj.layout16:setHeight(300);
    obj.layout16:setWidth(250);
    obj.layout16:setName("layout16");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout16);
    obj.label61:setLeft(000);
    obj.label61:setTop(000);
    obj.label61:setHeight(20);
    obj.label61:setWidth(40);
    obj.label61:setText("Nome:");
    obj.label61:setAutoSize(true);
    obj.label61:setHorzTextAlign("leading");
    obj.label61:setName("label61");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout16);
    obj.edit149:setLeft(045);
    obj.edit149:setTop(000);
    obj.edit149:setHeight(20);
    obj.edit149:setWidth(195);
    obj.edit149:setField("Nome5");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout16);
    obj.label62:setLeft(000);
    obj.label62:setTop(025);
    obj.label62:setHeight(20);
    obj.label62:setWidth(150);
    obj.label62:setText("Modificador");
    obj.label62:setAutoSize(true);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout16);
    obj.label63:setLeft(155);
    obj.label63:setTop(025);
    obj.label63:setHeight(20);
    obj.label63:setWidth(40);
    obj.label63:setText("Exp");
    obj.label63:setAutoSize(true);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout16);
    obj.label64:setLeft(200);
    obj.label64:setTop(025);
    obj.label64:setHeight(20);
    obj.label64:setWidth(40);
    obj.label64:setText("Gil");
    obj.label64:setAutoSize(true);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout16);
    obj.edit150:setLeft(000);
    obj.edit150:setTop(050);
    obj.edit150:setHeight(20);
    obj.edit150:setWidth(150);
    obj.edit150:setField("Atk5P1");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout16);
    obj.edit151:setLeft(155);
    obj.edit151:setTop(050);
    obj.edit151:setHeight(20);
    obj.edit151:setWidth(40);
    obj.edit151:setField("Atk5P1Exp");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout16);
    obj.edit152:setLeft(200);
    obj.edit152:setTop(050);
    obj.edit152:setHeight(20);
    obj.edit152:setWidth(40);
    obj.edit152:setField("Atk5P1Gil");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout16);
    obj.edit153:setLeft(000);
    obj.edit153:setTop(075);
    obj.edit153:setHeight(20);
    obj.edit153:setWidth(150);
    obj.edit153:setField("Atk5P2");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout16);
    obj.edit154:setLeft(155);
    obj.edit154:setTop(075);
    obj.edit154:setHeight(20);
    obj.edit154:setWidth(40);
    obj.edit154:setField("Atk5P2Exp");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout16);
    obj.edit155:setLeft(200);
    obj.edit155:setTop(075);
    obj.edit155:setHeight(20);
    obj.edit155:setWidth(40);
    obj.edit155:setField("Atk5P2Gil");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout16);
    obj.edit156:setLeft(000);
    obj.edit156:setTop(100);
    obj.edit156:setHeight(20);
    obj.edit156:setWidth(150);
    obj.edit156:setField("Atk5P3");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout16);
    obj.edit157:setLeft(155);
    obj.edit157:setTop(100);
    obj.edit157:setHeight(20);
    obj.edit157:setWidth(40);
    obj.edit157:setField("Atk5P3Exp");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout16);
    obj.edit158:setLeft(200);
    obj.edit158:setTop(100);
    obj.edit158:setHeight(20);
    obj.edit158:setWidth(40);
    obj.edit158:setField("Atk5P3Gil");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout16);
    obj.edit159:setLeft(000);
    obj.edit159:setTop(125);
    obj.edit159:setHeight(20);
    obj.edit159:setWidth(150);
    obj.edit159:setField("Atk5P4");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setName("edit159");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout16);
    obj.edit160:setLeft(155);
    obj.edit160:setTop(125);
    obj.edit160:setHeight(20);
    obj.edit160:setWidth(40);
    obj.edit160:setField("Atk5P4Exp");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout16);
    obj.edit161:setLeft(200);
    obj.edit161:setTop(125);
    obj.edit161:setHeight(20);
    obj.edit161:setWidth(40);
    obj.edit161:setField("Atk5P4Gil");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout16);
    obj.edit162:setLeft(000);
    obj.edit162:setTop(150);
    obj.edit162:setHeight(20);
    obj.edit162:setWidth(150);
    obj.edit162:setField("Atk5P5");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout16);
    obj.edit163:setLeft(155);
    obj.edit163:setTop(150);
    obj.edit163:setHeight(20);
    obj.edit163:setWidth(40);
    obj.edit163:setField("Atk5P5Exp");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout16);
    obj.edit164:setLeft(200);
    obj.edit164:setTop(150);
    obj.edit164:setHeight(20);
    obj.edit164:setWidth(40);
    obj.edit164:setField("Atk5P5Gil");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout16);
    obj.edit165:setLeft(000);
    obj.edit165:setTop(175);
    obj.edit165:setHeight(20);
    obj.edit165:setWidth(150);
    obj.edit165:setField("Atk5P6");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setName("edit165");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout16);
    obj.edit166:setLeft(155);
    obj.edit166:setTop(175);
    obj.edit166:setHeight(20);
    obj.edit166:setWidth(40);
    obj.edit166:setField("Atk5P6Exp");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout16);
    obj.edit167:setLeft(200);
    obj.edit167:setTop(175);
    obj.edit167:setHeight(20);
    obj.edit167:setWidth(40);
    obj.edit167:setField("Atk5P6Gil");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout16);
    obj.edit168:setLeft(000);
    obj.edit168:setTop(200);
    obj.edit168:setHeight(20);
    obj.edit168:setWidth(150);
    obj.edit168:setField("Atk5P7");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout16);
    obj.edit169:setLeft(155);
    obj.edit169:setTop(200);
    obj.edit169:setHeight(20);
    obj.edit169:setWidth(40);
    obj.edit169:setField("Atk5P7Exp");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout16);
    obj.edit170:setLeft(200);
    obj.edit170:setTop(200);
    obj.edit170:setHeight(20);
    obj.edit170:setWidth(40);
    obj.edit170:setField("Atk5P7Gil");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout16);
    obj.edit171:setLeft(000);
    obj.edit171:setTop(225);
    obj.edit171:setHeight(20);
    obj.edit171:setWidth(150);
    obj.edit171:setField("Atk5P8");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setName("edit171");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout16);
    obj.edit172:setLeft(155);
    obj.edit172:setTop(225);
    obj.edit172:setHeight(20);
    obj.edit172:setWidth(40);
    obj.edit172:setField("Atk5P8Exp");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout16);
    obj.edit173:setLeft(200);
    obj.edit173:setTop(225);
    obj.edit173:setHeight(20);
    obj.edit173:setWidth(40);
    obj.edit173:setField("Atk5P8Gil");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout16);
    obj.edit174:setLeft(155);
    obj.edit174:setTop(250);
    obj.edit174:setHeight(20);
    obj.edit174:setWidth(40);
    obj.edit174:setField("Atk5ExpF");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setType("number");
    obj.edit174:setName("edit174");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout16);
    obj.edit175:setLeft(200);
    obj.edit175:setTop(250);
    obj.edit175:setHeight(20);
    obj.edit175:setWidth(40);
    obj.edit175:setField("Atk5GilF");
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setType("number");
    obj.edit175:setName("edit175");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox2);
    obj.layout17:setLeft(770);
    obj.layout17:setTop(300);
    obj.layout17:setHeight(300);
    obj.layout17:setWidth(250);
    obj.layout17:setName("layout17");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout17);
    obj.label65:setLeft(000);
    obj.label65:setTop(000);
    obj.label65:setHeight(20);
    obj.label65:setWidth(40);
    obj.label65:setText("Nome:");
    obj.label65:setAutoSize(true);
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setName("label65");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout17);
    obj.edit176:setLeft(045);
    obj.edit176:setTop(000);
    obj.edit176:setHeight(20);
    obj.edit176:setWidth(195);
    obj.edit176:setField("Nome6");
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout17);
    obj.label66:setLeft(000);
    obj.label66:setTop(025);
    obj.label66:setHeight(20);
    obj.label66:setWidth(150);
    obj.label66:setText("Modificador");
    obj.label66:setAutoSize(true);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout17);
    obj.label67:setLeft(155);
    obj.label67:setTop(025);
    obj.label67:setHeight(20);
    obj.label67:setWidth(40);
    obj.label67:setText("Exp");
    obj.label67:setAutoSize(true);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout17);
    obj.label68:setLeft(200);
    obj.label68:setTop(025);
    obj.label68:setHeight(20);
    obj.label68:setWidth(40);
    obj.label68:setText("Gil");
    obj.label68:setAutoSize(true);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout17);
    obj.edit177:setLeft(000);
    obj.edit177:setTop(050);
    obj.edit177:setHeight(20);
    obj.edit177:setWidth(150);
    obj.edit177:setField("Atk6P1");
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout17);
    obj.edit178:setLeft(155);
    obj.edit178:setTop(050);
    obj.edit178:setHeight(20);
    obj.edit178:setWidth(40);
    obj.edit178:setField("Atk6P1Exp");
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setName("edit178");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout17);
    obj.edit179:setLeft(200);
    obj.edit179:setTop(050);
    obj.edit179:setHeight(20);
    obj.edit179:setWidth(40);
    obj.edit179:setField("Atk6P1Gil");
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setName("edit179");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout17);
    obj.edit180:setLeft(000);
    obj.edit180:setTop(075);
    obj.edit180:setHeight(20);
    obj.edit180:setWidth(150);
    obj.edit180:setField("Atk6P2");
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setName("edit180");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout17);
    obj.edit181:setLeft(155);
    obj.edit181:setTop(075);
    obj.edit181:setHeight(20);
    obj.edit181:setWidth(40);
    obj.edit181:setField("Atk6P2Exp");
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setName("edit181");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout17);
    obj.edit182:setLeft(200);
    obj.edit182:setTop(075);
    obj.edit182:setHeight(20);
    obj.edit182:setWidth(40);
    obj.edit182:setField("Atk6P2Gil");
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setName("edit182");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout17);
    obj.edit183:setLeft(000);
    obj.edit183:setTop(100);
    obj.edit183:setHeight(20);
    obj.edit183:setWidth(150);
    obj.edit183:setField("Atk6P3");
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setName("edit183");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout17);
    obj.edit184:setLeft(155);
    obj.edit184:setTop(100);
    obj.edit184:setHeight(20);
    obj.edit184:setWidth(40);
    obj.edit184:setField("Atk6P3Exp");
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setName("edit184");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout17);
    obj.edit185:setLeft(200);
    obj.edit185:setTop(100);
    obj.edit185:setHeight(20);
    obj.edit185:setWidth(40);
    obj.edit185:setField("Atk6P3Gil");
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setName("edit185");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout17);
    obj.edit186:setLeft(000);
    obj.edit186:setTop(125);
    obj.edit186:setHeight(20);
    obj.edit186:setWidth(150);
    obj.edit186:setField("Atk6P4");
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setName("edit186");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout17);
    obj.edit187:setLeft(155);
    obj.edit187:setTop(125);
    obj.edit187:setHeight(20);
    obj.edit187:setWidth(40);
    obj.edit187:setField("Atk6P4Exp");
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout17);
    obj.edit188:setLeft(200);
    obj.edit188:setTop(125);
    obj.edit188:setHeight(20);
    obj.edit188:setWidth(40);
    obj.edit188:setField("Atk6P4Gil");
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setName("edit188");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout17);
    obj.edit189:setLeft(000);
    obj.edit189:setTop(150);
    obj.edit189:setHeight(20);
    obj.edit189:setWidth(150);
    obj.edit189:setField("Atk6P5");
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setName("edit189");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout17);
    obj.edit190:setLeft(155);
    obj.edit190:setTop(150);
    obj.edit190:setHeight(20);
    obj.edit190:setWidth(40);
    obj.edit190:setField("Atk6P5Exp");
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setName("edit190");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout17);
    obj.edit191:setLeft(200);
    obj.edit191:setTop(150);
    obj.edit191:setHeight(20);
    obj.edit191:setWidth(40);
    obj.edit191:setField("Atk6P5Gil");
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setName("edit191");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout17);
    obj.edit192:setLeft(000);
    obj.edit192:setTop(175);
    obj.edit192:setHeight(20);
    obj.edit192:setWidth(150);
    obj.edit192:setField("Atk6P6");
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setName("edit192");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout17);
    obj.edit193:setLeft(155);
    obj.edit193:setTop(175);
    obj.edit193:setHeight(20);
    obj.edit193:setWidth(40);
    obj.edit193:setField("Atk6P6Exp");
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout17);
    obj.edit194:setLeft(200);
    obj.edit194:setTop(175);
    obj.edit194:setHeight(20);
    obj.edit194:setWidth(40);
    obj.edit194:setField("Atk6P6Gil");
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setName("edit194");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout17);
    obj.edit195:setLeft(000);
    obj.edit195:setTop(200);
    obj.edit195:setHeight(20);
    obj.edit195:setWidth(150);
    obj.edit195:setField("Atk6P7");
    obj.edit195:setHorzTextAlign("center");
    obj.edit195:setName("edit195");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout17);
    obj.edit196:setLeft(155);
    obj.edit196:setTop(200);
    obj.edit196:setHeight(20);
    obj.edit196:setWidth(40);
    obj.edit196:setField("Atk6P7Exp");
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setName("edit196");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout17);
    obj.edit197:setLeft(200);
    obj.edit197:setTop(200);
    obj.edit197:setHeight(20);
    obj.edit197:setWidth(40);
    obj.edit197:setField("Atk6P7Gil");
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setName("edit197");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout17);
    obj.edit198:setLeft(000);
    obj.edit198:setTop(225);
    obj.edit198:setHeight(20);
    obj.edit198:setWidth(150);
    obj.edit198:setField("Atk6P8");
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setName("edit198");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout17);
    obj.edit199:setLeft(155);
    obj.edit199:setTop(225);
    obj.edit199:setHeight(20);
    obj.edit199:setWidth(40);
    obj.edit199:setField("Atk6P8Exp");
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setName("edit199");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout17);
    obj.edit200:setLeft(200);
    obj.edit200:setTop(225);
    obj.edit200:setHeight(20);
    obj.edit200:setWidth(40);
    obj.edit200:setField("Atk6P8Gil");
    obj.edit200:setHorzTextAlign("center");
    obj.edit200:setName("edit200");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout17);
    obj.edit201:setLeft(155);
    obj.edit201:setTop(250);
    obj.edit201:setHeight(20);
    obj.edit201:setWidth(40);
    obj.edit201:setField("Atk6ExpF");
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setType("number");
    obj.edit201:setName("edit201");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout17);
    obj.edit202:setLeft(200);
    obj.edit202:setTop(250);
    obj.edit202:setHeight(20);
    obj.edit202:setWidth(40);
    obj.edit202:setField("Atk6GilF");
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setType("number");
    obj.edit202:setName("edit202");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox2);
    obj.layout18:setLeft(1000);
    obj.layout18:setTop(570);
    obj.layout18:setHeight(50);
    obj.layout18:setWidth(90);
    obj.layout18:setName("layout18");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout18);
    obj.label69:setLeft(000);
    obj.label69:setTop(000);
    obj.label69:setHeight(20);
    obj.label69:setWidth(30);
    obj.label69:setText("Exp");
    obj.label69:setAutoSize(true);
    obj.label69:setName("label69");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout18);
    obj.edit203:setLeft(035);
    obj.edit203:setTop(000);
    obj.edit203:setHeight(20);
    obj.edit203:setWidth(50);
    obj.edit203:setField("ExpFinal");
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setName("edit203");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout18);
    obj.label70:setLeft(000);
    obj.label70:setTop(025);
    obj.label70:setHeight(20);
    obj.label70:setWidth(30);
    obj.label70:setText("Gil");
    obj.label70:setAutoSize(true);
    obj.label70:setName("label70");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout18);
    obj.edit204:setLeft(35);
    obj.edit204:setTop(025);
    obj.edit204:setHeight(20);
    obj.edit204:setWidth(50);
    obj.edit204:setField("GilFinal");
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setName("edit204");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Action");
    obj.tab3:setName("tab3");

    obj.frmAction = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAction:setParent(obj.tab3);
    obj.frmAction:setName("frmAction");
    obj.frmAction:setAlign("client");
    obj.frmAction:setTheme("dark");
    obj.frmAction:setMargins({top=1});

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.frmAction);
    obj.layout19:setLeft(000);
    obj.layout19:setTop(000);
    obj.layout19:setHeight(650);
    obj.layout19:setWidth(1100);
    obj.layout19:setName("layout19");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout19);
    obj.image4:setLeft(000);
    obj.image4:setTop(000);
    obj.image4:setHeight(650);
    obj.image4:setWidth(1100);
    obj.image4:setSRC("/img/wallpaper.png");
    obj.image4:setStyle("autoFit");
    obj.image4:setName("image4");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmAction);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox3);
    obj.layout20:setLeft(60);
    obj.layout20:setTop(100);
    obj.layout20:setHeight(325);
    obj.layout20:setWidth(380);
    obj.layout20:setName("layout20");

    obj.popAbilitynameAddstatus = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynameAddstatus:setParent(obj.layout20);
    obj.popAbilitynameAddstatus:setName("popAbilitynameAddstatus");
    obj.popAbilitynameAddstatus:setWidth(300);
    obj.popAbilitynameAddstatus:setHeight(200);
    obj.popAbilitynameAddstatus:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynameAddstatus, "autoScopeNode",  "false");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.popAbilitynameAddstatus);
    obj.label71:setLeft(05);
    obj.label71:setTop(5);
    obj.label71:setWidth(60);
    obj.label71:setHeight(20);
    obj.label71:setText("Descrição:");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popAbilitynameAddstatus);
    obj.textEditor1:setLeft(005);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setWidth(290);
    obj.textEditor1:setField("DescricaonameAddstatus");
    obj.textEditor1:setText("The monster can use an Ability Action to automatically add a positive Status Condition (4) to a Single target.  XP and Gil values are given per Status added, and depend on the exact Status taken.  Add Status can be used to add more than one Status Condition at a time, though it is recommended that this option be reserved for Boss monsters and creatures of Level 30 or above");
    obj.textEditor1:setName("textEditor1");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout20);
    obj.label72:setLeft(000);
    obj.label72:setTop(000);
    obj.label72:setHeight(20);
    obj.label72:setWidth(150);
    obj.label72:setText("Add Status");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setName("label72");

    obj.BotaonameAddstatus = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonameAddstatus:setParent(obj.layout20);
    obj.BotaonameAddstatus:setLeft(100);
    obj.BotaonameAddstatus:setTop(000);
    obj.BotaonameAddstatus:setWidth(23);
    obj.BotaonameAddstatus:setHeight(25);
    obj.BotaonameAddstatus:setText("i");
    obj.BotaonameAddstatus:setName("BotaonameAddstatus");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout20);
    obj.checkBox18:setLeft(000);
    obj.checkBox18:setTop(025);
    obj.checkBox18:setHeight(20);
    obj.checkBox18:setWidth(120);
    obj.checkBox18:setText("Float");
    obj.checkBox18:setField("addFloat");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout20);
    obj.checkBox19:setLeft(000);
    obj.checkBox19:setTop(050);
    obj.checkBox19:setHeight(20);
    obj.checkBox19:setWidth(120);
    obj.checkBox19:setText("Agility Up");
    obj.checkBox19:setField("addAgiUP");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout20);
    obj.checkBox20:setLeft(000);
    obj.checkBox20:setTop(075);
    obj.checkBox20:setHeight(20);
    obj.checkBox20:setWidth(120);
    obj.checkBox20:setText("Spirit Up");
    obj.checkBox20:setField("addSpiUP");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout20);
    obj.checkBox21:setLeft(000);
    obj.checkBox21:setTop(100);
    obj.checkBox21:setHeight(20);
    obj.checkBox21:setWidth(120);
    obj.checkBox21:setText("Fire Spikes");
    obj.checkBox21:setField("addFIRSpikes");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout20);
    obj.checkBox22:setLeft(000);
    obj.checkBox22:setTop(125);
    obj.checkBox22:setHeight(20);
    obj.checkBox22:setWidth(120);
    obj.checkBox22:setText("Ice Spikes");
    obj.checkBox22:setField("addICESpikes");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout20);
    obj.checkBox23:setLeft(000);
    obj.checkBox23:setTop(150);
    obj.checkBox23:setHeight(20);
    obj.checkBox23:setWidth(120);
    obj.checkBox23:setText("Water Spikes");
    obj.checkBox23:setField("addWATSpikes");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout20);
    obj.checkBox24:setLeft(000);
    obj.checkBox24:setTop(175);
    obj.checkBox24:setHeight(20);
    obj.checkBox24:setWidth(120);
    obj.checkBox24:setText("Lightning Spikes");
    obj.checkBox24:setField("addELESpikes");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout20);
    obj.checkBox25:setLeft(000);
    obj.checkBox25:setTop(200);
    obj.checkBox25:setHeight(20);
    obj.checkBox25:setWidth(120);
    obj.checkBox25:setText("Ground Spikes");
    obj.checkBox25:setField("addGNDSpikes");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout20);
    obj.checkBox26:setLeft(000);
    obj.checkBox26:setTop(225);
    obj.checkBox26:setHeight(20);
    obj.checkBox26:setWidth(120);
    obj.checkBox26:setText("Wind Spikes");
    obj.checkBox26:setField("addWINSpikes");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout20);
    obj.checkBox27:setLeft(000);
    obj.checkBox27:setTop(250);
    obj.checkBox27:setHeight(20);
    obj.checkBox27:setWidth(120);
    obj.checkBox27:setText("Bio Spikes");
    obj.checkBox27:setField("addBIOSpikes");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout20);
    obj.checkBox28:setLeft(000);
    obj.checkBox28:setTop(275);
    obj.checkBox28:setHeight(20);
    obj.checkBox28:setWidth(120);
    obj.checkBox28:setText("Shadow Spikes");
    obj.checkBox28:setField("addSHASpikes");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout20);
    obj.checkBox29:setLeft(000);
    obj.checkBox29:setTop(300);
    obj.checkBox29:setHeight(20);
    obj.checkBox29:setWidth(120);
    obj.checkBox29:setText("Holy Spikes");
    obj.checkBox29:setField("addHOLSpikes");
    obj.checkBox29:setName("checkBox29");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox3);
    obj.layout21:setLeft(200);
    obj.layout21:setTop(100);
    obj.layout21:setHeight(325);
    obj.layout21:setWidth(380);
    obj.layout21:setName("layout21");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout21);
    obj.checkBox30:setLeft(000);
    obj.checkBox30:setTop(025);
    obj.checkBox30:setHeight(20);
    obj.checkBox30:setWidth(120);
    obj.checkBox30:setText("Protect");
    obj.checkBox30:setField("addProtect");
    obj.checkBox30:setName("checkBox30");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout21);
    obj.checkBox31:setLeft(000);
    obj.checkBox31:setTop(050);
    obj.checkBox31:setHeight(20);
    obj.checkBox31:setWidth(120);
    obj.checkBox31:setText("Shell");
    obj.checkBox31:setField("addShell");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout21);
    obj.checkBox32:setLeft(000);
    obj.checkBox32:setTop(075);
    obj.checkBox32:setHeight(20);
    obj.checkBox32:setWidth(120);
    obj.checkBox32:setText("Armor Up");
    obj.checkBox32:setField("addARMUP");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout21);
    obj.checkBox33:setLeft(000);
    obj.checkBox33:setTop(100);
    obj.checkBox33:setHeight(20);
    obj.checkBox33:setWidth(120);
    obj.checkBox33:setText("Mental Up");
    obj.checkBox33:setField("addMENUP");
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout21);
    obj.checkBox34:setLeft(000);
    obj.checkBox34:setTop(125);
    obj.checkBox34:setHeight(20);
    obj.checkBox34:setWidth(120);
    obj.checkBox34:setText("Haste");
    obj.checkBox34:setField("addHaste");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout21);
    obj.checkBox35:setLeft(000);
    obj.checkBox35:setTop(150);
    obj.checkBox35:setHeight(20);
    obj.checkBox35:setWidth(120);
    obj.checkBox35:setText("Reflect");
    obj.checkBox35:setField("addReflect");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout21);
    obj.checkBox36:setLeft(000);
    obj.checkBox36:setTop(175);
    obj.checkBox36:setHeight(20);
    obj.checkBox36:setWidth(120);
    obj.checkBox36:setText("Power Up");
    obj.checkBox36:setField("addPOWUP");
    obj.checkBox36:setName("checkBox36");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout21);
    obj.checkBox37:setLeft(000);
    obj.checkBox37:setTop(200);
    obj.checkBox37:setHeight(20);
    obj.checkBox37:setWidth(120);
    obj.checkBox37:setText("Magic Up");
    obj.checkBox37:setField("addMAGUP");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout21);
    obj.checkBox38:setLeft(000);
    obj.checkBox38:setTop(225);
    obj.checkBox38:setHeight(20);
    obj.checkBox38:setWidth(120);
    obj.checkBox38:setText("Regen");
    obj.checkBox38:setField("addRegen");
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout21);
    obj.checkBox39:setLeft(000);
    obj.checkBox39:setTop(250);
    obj.checkBox39:setHeight(20);
    obj.checkBox39:setWidth(120);
    obj.checkBox39:setText("Aura");
    obj.checkBox39:setField("addAura");
    obj.checkBox39:setName("checkBox39");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout21);
    obj.checkBox40:setLeft(000);
    obj.checkBox40:setTop(275);
    obj.checkBox40:setHeight(20);
    obj.checkBox40:setWidth(120);
    obj.checkBox40:setText("Vanish");
    obj.checkBox40:setField("addVanish");
    obj.checkBox40:setName("checkBox40");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox3);
    obj.layout22:setLeft(350);
    obj.layout22:setTop(100);
    obj.layout22:setHeight(325);
    obj.layout22:setWidth(380);
    obj.layout22:setName("layout22");

    obj.popAbilitynameCannibalize = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynameCannibalize:setParent(obj.layout22);
    obj.popAbilitynameCannibalize:setName("popAbilitynameCannibalize");
    obj.popAbilitynameCannibalize:setWidth(300);
    obj.popAbilitynameCannibalize:setHeight(200);
    obj.popAbilitynameCannibalize:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynameCannibalize, "autoScopeNode",  "false");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.popAbilitynameCannibalize);
    obj.label73:setLeft(05);
    obj.label73:setTop(5);
    obj.label73:setWidth(60);
    obj.label73:setHeight(20);
    obj.label73:setText("Descrição:");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popAbilitynameCannibalize);
    obj.textEditor2:setLeft(005);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setWidth(290);
    obj.textEditor2:setField("DescricaonameCannibalize");
    obj.textEditor2:setText("The monster can consume other monsters to increase its own strength.  A monster can Cannibalize a Single ally of a Level no higher than (Monster's Level / 2) at the cost of one Ability Action.  This automatically reduces the target's HP to 0 – treat this as an Eject-type effect. XP and Gil values for Cannibalize depend on what effects it has.  By default, the monster regains (Target's Current HP) Hit Points, but Cannibalize can instead bestow one positive Status Condition (4) on the monster. XP and Gil values are given per Status added, and depend on the exact Status taken:");
    obj.textEditor2:setName("textEditor2");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout22);
    obj.label74:setLeft(000);
    obj.label74:setTop(000);
    obj.label74:setHeight(20);
    obj.label74:setWidth(150);
    obj.label74:setText("Cannibalize");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setName("label74");

    obj.BotaonameCannibalize = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonameCannibalize:setParent(obj.layout22);
    obj.BotaonameCannibalize:setLeft(100);
    obj.BotaonameCannibalize:setTop(000);
    obj.BotaonameCannibalize:setWidth(23);
    obj.BotaonameCannibalize:setHeight(25);
    obj.BotaonameCannibalize:setText("i");
    obj.BotaonameCannibalize:setName("BotaonameCannibalize");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout22);
    obj.checkBox41:setLeft(000);
    obj.checkBox41:setTop(025);
    obj.checkBox41:setHeight(20);
    obj.checkBox41:setWidth(120);
    obj.checkBox41:setText("Float");
    obj.checkBox41:setField("canFloat");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout22);
    obj.checkBox42:setLeft(000);
    obj.checkBox42:setTop(050);
    obj.checkBox42:setHeight(20);
    obj.checkBox42:setWidth(120);
    obj.checkBox42:setText("Agility Up");
    obj.checkBox42:setField("canAgiUP");
    obj.checkBox42:setName("checkBox42");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout22);
    obj.checkBox43:setLeft(000);
    obj.checkBox43:setTop(075);
    obj.checkBox43:setHeight(20);
    obj.checkBox43:setWidth(120);
    obj.checkBox43:setText("Spirit Up");
    obj.checkBox43:setField("canSpiUP");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout22);
    obj.checkBox44:setLeft(000);
    obj.checkBox44:setTop(100);
    obj.checkBox44:setHeight(20);
    obj.checkBox44:setWidth(120);
    obj.checkBox44:setText("Fire Spikes");
    obj.checkBox44:setField("canFIRSpikes");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout22);
    obj.checkBox45:setLeft(000);
    obj.checkBox45:setTop(125);
    obj.checkBox45:setHeight(20);
    obj.checkBox45:setWidth(120);
    obj.checkBox45:setText("Ice Spikes");
    obj.checkBox45:setField("canICESpikes");
    obj.checkBox45:setName("checkBox45");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout22);
    obj.checkBox46:setLeft(000);
    obj.checkBox46:setTop(150);
    obj.checkBox46:setHeight(20);
    obj.checkBox46:setWidth(120);
    obj.checkBox46:setText("Water Spikes");
    obj.checkBox46:setField("canWATSpikes");
    obj.checkBox46:setName("checkBox46");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout22);
    obj.checkBox47:setLeft(000);
    obj.checkBox47:setTop(175);
    obj.checkBox47:setHeight(20);
    obj.checkBox47:setWidth(120);
    obj.checkBox47:setText("Lightning Spikes");
    obj.checkBox47:setField("canELESpikes");
    obj.checkBox47:setName("checkBox47");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout22);
    obj.checkBox48:setLeft(000);
    obj.checkBox48:setTop(200);
    obj.checkBox48:setHeight(20);
    obj.checkBox48:setWidth(120);
    obj.checkBox48:setText("Ground Spikes");
    obj.checkBox48:setField("canGNDSpikes");
    obj.checkBox48:setName("checkBox48");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout22);
    obj.checkBox49:setLeft(000);
    obj.checkBox49:setTop(225);
    obj.checkBox49:setHeight(20);
    obj.checkBox49:setWidth(120);
    obj.checkBox49:setText("Wind Spikes");
    obj.checkBox49:setField("canWINSpikes");
    obj.checkBox49:setName("checkBox49");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout22);
    obj.checkBox50:setLeft(000);
    obj.checkBox50:setTop(250);
    obj.checkBox50:setHeight(20);
    obj.checkBox50:setWidth(120);
    obj.checkBox50:setText("Bio Spikes");
    obj.checkBox50:setField("canBIOSpikes");
    obj.checkBox50:setName("checkBox50");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout22);
    obj.checkBox51:setLeft(000);
    obj.checkBox51:setTop(275);
    obj.checkBox51:setHeight(20);
    obj.checkBox51:setWidth(120);
    obj.checkBox51:setText("Shadow Spikes");
    obj.checkBox51:setField("canSHASpikes");
    obj.checkBox51:setName("checkBox51");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout22);
    obj.checkBox52:setLeft(000);
    obj.checkBox52:setTop(300);
    obj.checkBox52:setHeight(20);
    obj.checkBox52:setWidth(120);
    obj.checkBox52:setText("Holy Spikes");
    obj.checkBox52:setField("canHOLSpikes");
    obj.checkBox52:setName("checkBox52");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox3);
    obj.layout23:setLeft(490);
    obj.layout23:setTop(100);
    obj.layout23:setHeight(325);
    obj.layout23:setWidth(380);
    obj.layout23:setName("layout23");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout23);
    obj.checkBox53:setLeft(000);
    obj.checkBox53:setTop(025);
    obj.checkBox53:setHeight(20);
    obj.checkBox53:setWidth(120);
    obj.checkBox53:setText("Protect");
    obj.checkBox53:setField("canProtect");
    obj.checkBox53:setName("checkBox53");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout23);
    obj.checkBox54:setLeft(000);
    obj.checkBox54:setTop(050);
    obj.checkBox54:setHeight(20);
    obj.checkBox54:setWidth(120);
    obj.checkBox54:setText("Shell");
    obj.checkBox54:setField("canShell");
    obj.checkBox54:setName("checkBox54");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout23);
    obj.checkBox55:setLeft(000);
    obj.checkBox55:setTop(075);
    obj.checkBox55:setHeight(20);
    obj.checkBox55:setWidth(120);
    obj.checkBox55:setText("Armor Up");
    obj.checkBox55:setField("canARMUP");
    obj.checkBox55:setName("checkBox55");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout23);
    obj.checkBox56:setLeft(000);
    obj.checkBox56:setTop(100);
    obj.checkBox56:setHeight(20);
    obj.checkBox56:setWidth(120);
    obj.checkBox56:setText("Mental Up");
    obj.checkBox56:setField("canMENUP");
    obj.checkBox56:setName("checkBox56");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout23);
    obj.checkBox57:setLeft(000);
    obj.checkBox57:setTop(125);
    obj.checkBox57:setHeight(20);
    obj.checkBox57:setWidth(120);
    obj.checkBox57:setText("Haste");
    obj.checkBox57:setField("canHaste");
    obj.checkBox57:setName("checkBox57");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout23);
    obj.checkBox58:setLeft(000);
    obj.checkBox58:setTop(150);
    obj.checkBox58:setHeight(20);
    obj.checkBox58:setWidth(120);
    obj.checkBox58:setText("Reflect");
    obj.checkBox58:setField("canReflect");
    obj.checkBox58:setName("checkBox58");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout23);
    obj.checkBox59:setLeft(000);
    obj.checkBox59:setTop(175);
    obj.checkBox59:setHeight(20);
    obj.checkBox59:setWidth(120);
    obj.checkBox59:setText("Power Up");
    obj.checkBox59:setField("canPOWUP");
    obj.checkBox59:setName("checkBox59");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout23);
    obj.checkBox60:setLeft(000);
    obj.checkBox60:setTop(200);
    obj.checkBox60:setHeight(20);
    obj.checkBox60:setWidth(120);
    obj.checkBox60:setText("Magic Up");
    obj.checkBox60:setField("canMAGUP");
    obj.checkBox60:setName("checkBox60");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout23);
    obj.checkBox61:setLeft(000);
    obj.checkBox61:setTop(225);
    obj.checkBox61:setHeight(20);
    obj.checkBox61:setWidth(120);
    obj.checkBox61:setText("Regen");
    obj.checkBox61:setField("canRegen");
    obj.checkBox61:setName("checkBox61");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout23);
    obj.checkBox62:setLeft(000);
    obj.checkBox62:setTop(250);
    obj.checkBox62:setHeight(20);
    obj.checkBox62:setWidth(120);
    obj.checkBox62:setText("Aura");
    obj.checkBox62:setField("canAura");
    obj.checkBox62:setName("checkBox62");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout23);
    obj.checkBox63:setLeft(000);
    obj.checkBox63:setTop(275);
    obj.checkBox63:setHeight(20);
    obj.checkBox63:setWidth(120);
    obj.checkBox63:setText("Vanish");
    obj.checkBox63:setField("canVanish");
    obj.checkBox63:setName("checkBox63");

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout23);
    obj.checkBox64:setLeft(000);
    obj.checkBox64:setTop(300);
    obj.checkBox64:setHeight(20);
    obj.checkBox64:setWidth(120);
    obj.checkBox64:setText("Regain HP");
    obj.checkBox64:setField("canHealHP");
    obj.checkBox64:setName("checkBox64");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox3);
    obj.layout24:setLeft(650);
    obj.layout24:setTop(50);
    obj.layout24:setHeight(430);
    obj.layout24:setWidth(400);
    obj.layout24:setName("layout24");

    obj.popAbilityaaAlarm = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaAlarm:setParent(obj.layout24);
    obj.popAbilityaaAlarm:setName("popAbilityaaAlarm");
    obj.popAbilityaaAlarm:setWidth(300);
    obj.popAbilityaaAlarm:setHeight(200);
    obj.popAbilityaaAlarm:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaAlarm, "autoScopeNode",  "false");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.popAbilityaaAlarm);
    obj.label75:setLeft(05);
    obj.label75:setTop(5);
    obj.label75:setWidth(60);
    obj.label75:setHeight(20);
    obj.label75:setText("Descrição:");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popAbilityaaAlarm);
    obj.textEditor3:setLeft(005);
    obj.textEditor3:setTop(30);
    obj.textEditor3:setHeight(165);
    obj.textEditor3:setWidth(290);
    obj.textEditor3:setField("DescricaoaaAlarm");
    obj.textEditor3:setText("The monster can use an Ability Action to summon an additional monster into battle. The new monster arrives on the battlefield at the beginning of the following Round, forming a Group with the original monster, and generates Initiative as normal. Once used, Alarm cannot be used again until the summoned monster has been defeated or incapacitated. The type of monster summoned by Alarm should be noted in the Ability’s description. Multiple monsters can be summoned through a single Alarm; in this case, multiply the XP and Gil Modifiers given below by the number of monsters summoned. It is generally recommended that any monsters summoned through Alarm be of equal or lower Level to the monster doing the summoning");
    obj.textEditor3:setName("textEditor3");

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout24);
    obj.checkBox65:setLeft(000);
    obj.checkBox65:setTop(000);
    obj.checkBox65:setHeight(20);
    obj.checkBox65:setWidth(150);
    obj.checkBox65:setText("Alarm");
    obj.checkBox65:setField("aaAlarm");
    lfm_setPropAsString(obj.checkBox65, "fontStyle",  "bold");
    obj.checkBox65:setName("checkBox65");

    obj.BotaoaaAlarm = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaAlarm:setParent(obj.layout24);
    obj.BotaoaaAlarm:setLeft(175);
    obj.BotaoaaAlarm:setTop(000);
    obj.BotaoaaAlarm:setWidth(23);
    obj.BotaoaaAlarm:setHeight(25);
    obj.BotaoaaAlarm:setText("i");
    obj.BotaoaaAlarm:setName("BotaoaaAlarm");

    obj.popAbilityaaClone = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaClone:setParent(obj.layout24);
    obj.popAbilityaaClone:setName("popAbilityaaClone");
    obj.popAbilityaaClone:setWidth(300);
    obj.popAbilityaaClone:setHeight(200);
    obj.popAbilityaaClone:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaClone, "autoScopeNode",  "false");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.popAbilityaaClone);
    obj.label76:setLeft(05);
    obj.label76:setTop(5);
    obj.label76:setWidth(60);
    obj.label76:setHeight(20);
    obj.label76:setText("Descrição:");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popAbilityaaClone);
    obj.textEditor4:setLeft(005);
    obj.textEditor4:setTop(30);
    obj.textEditor4:setHeight(165);
    obj.textEditor4:setWidth(290);
    obj.textEditor4:setField("DescricaoaaClone");
    obj.textEditor4:setText("The monster can use an Ability Action to create a copy of one of its opponents to act as an active combatant in the current battle.  The clone has all the Attributes, Combat Statistics, Equipment, and Abilities of the original character, and generates Initiative as normal, fighting on the monster’s behalf until killed or incapacitated. No XP or Gil is awarded for defeating opponents created by Clone.");
    obj.textEditor4:setName("textEditor4");

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout24);
    obj.checkBox66:setLeft(000);
    obj.checkBox66:setTop(025);
    obj.checkBox66:setHeight(20);
    obj.checkBox66:setWidth(150);
    obj.checkBox66:setText("Clone");
    obj.checkBox66:setField("aaClone");
    lfm_setPropAsString(obj.checkBox66, "fontStyle",  "bold");
    obj.checkBox66:setName("checkBox66");

    obj.BotaoaaClone = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaClone:setParent(obj.layout24);
    obj.BotaoaaClone:setLeft(175);
    obj.BotaoaaClone:setTop(025);
    obj.BotaoaaClone:setWidth(23);
    obj.BotaoaaClone:setHeight(25);
    obj.BotaoaaClone:setText("i");
    obj.BotaoaaClone:setName("BotaoaaClone");

    obj.popAbilityaaEscape = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaEscape:setParent(obj.layout24);
    obj.popAbilityaaEscape:setName("popAbilityaaEscape");
    obj.popAbilityaaEscape:setWidth(300);
    obj.popAbilityaaEscape:setHeight(200);
    obj.popAbilityaaEscape:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaEscape, "autoScopeNode",  "false");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.popAbilityaaEscape);
    obj.label77:setLeft(05);
    obj.label77:setTop(5);
    obj.label77:setWidth(60);
    obj.label77:setHeight(20);
    obj.label77:setText("Descrição:");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popAbilityaaEscape);
    obj.textEditor5:setLeft(005);
    obj.textEditor5:setTop(30);
    obj.textEditor5:setHeight(165);
    obj.textEditor5:setWidth(290);
    obj.textEditor5:setField("DescricaoaaEscape");
    obj.textEditor5:setText("The monster has the ability to make Escape Actions, allowing it to flee from battle.  Monsters that successfully escape are not counted as defeated, and award no XP, Gil, or Items to the players. Escape is sealed by the Status Condition Immobilize.");
    obj.textEditor5:setName("textEditor5");

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout24);
    obj.checkBox67:setLeft(000);
    obj.checkBox67:setTop(050);
    obj.checkBox67:setHeight(20);
    obj.checkBox67:setWidth(150);
    obj.checkBox67:setText("Escape");
    obj.checkBox67:setField("aaEscape");
    lfm_setPropAsString(obj.checkBox67, "fontStyle",  "bold");
    obj.checkBox67:setName("checkBox67");

    obj.BotaoaaEscape = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaEscape:setParent(obj.layout24);
    obj.BotaoaaEscape:setLeft(175);
    obj.BotaoaaEscape:setTop(050);
    obj.BotaoaaEscape:setWidth(23);
    obj.BotaoaaEscape:setHeight(25);
    obj.BotaoaaEscape:setText("i");
    obj.BotaoaaEscape:setName("BotaoaaEscape");

    obj.popAbilityaaImprison = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaImprison:setParent(obj.layout24);
    obj.popAbilityaaImprison:setName("popAbilityaaImprison");
    obj.popAbilityaaImprison:setWidth(300);
    obj.popAbilityaaImprison:setHeight(200);
    obj.popAbilityaaImprison:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaImprison, "autoScopeNode",  "false");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.popAbilityaaImprison);
    obj.label78:setLeft(05);
    obj.label78:setTop(5);
    obj.label78:setWidth(60);
    obj.label78:setHeight(20);
    obj.label78:setText("Descrição:");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.popAbilityaaImprison);
    obj.textEditor6:setLeft(005);
    obj.textEditor6:setTop(30);
    obj.textEditor6:setHeight(165);
    obj.textEditor6:setWidth(290);
    obj.textEditor6:setField("DescricaoaaImprison");
    obj.textEditor6:setText("The monster is capable of seizing and imprisoning opponents in battle. Doing so requires the monster to use an Ability Action. Whilst imprisoned, the prisoner is afflicted with the Status Condition Immobilize – even if he would normally be Immune to it – and suffers 50% of any damage done to the monster after it has been modified for ARM or M. ARM. The prisoner's ARM and M. ARM can be used to further reduce this damage.  By default, the prisoner is only released if the monster decides to let him go – this is done during the Status Phase, and costs no Actions to do – or if the monster is incapacitated. However, Imprison has a number of special Modifiers that can be added to give it more strategic depth.");
    obj.textEditor6:setName("textEditor6");

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout24);
    obj.checkBox68:setLeft(000);
    obj.checkBox68:setTop(075);
    obj.checkBox68:setHeight(20);
    obj.checkBox68:setWidth(150);
    obj.checkBox68:setText("Imprison");
    obj.checkBox68:setField("aaImprison");
    lfm_setPropAsString(obj.checkBox68, "fontStyle",  "bold");
    obj.checkBox68:setName("checkBox68");

    obj.BotaoaaImprison = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaImprison:setParent(obj.layout24);
    obj.BotaoaaImprison:setLeft(175);
    obj.BotaoaaImprison:setTop(075);
    obj.BotaoaaImprison:setWidth(23);
    obj.BotaoaaImprison:setHeight(25);
    obj.BotaoaaImprison:setText("i");
    obj.BotaoaaImprison:setName("BotaoaaImprison");

    obj.popAbilityaaBPrison = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaBPrison:setParent(obj.layout24);
    obj.popAbilityaaBPrison:setName("popAbilityaaBPrison");
    obj.popAbilityaaBPrison:setWidth(300);
    obj.popAbilityaaBPrison:setHeight(200);
    obj.popAbilityaaBPrison:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaBPrison, "autoScopeNode",  "false");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.popAbilityaaBPrison);
    obj.label79:setLeft(05);
    obj.label79:setTop(5);
    obj.label79:setWidth(60);
    obj.label79:setHeight(20);
    obj.label79:setText("Descrição:");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.popAbilityaaBPrison);
    obj.textEditor7:setLeft(005);
    obj.textEditor7:setTop(30);
    obj.textEditor7:setHeight(165);
    obj.textEditor7:setWidth(290);
    obj.textEditor7:setField("DescricaoaaBPrison");
    obj.textEditor7:setText("A Binding Prison prevents the captured target from making Actions or generating Initiative for as long as he remains in the monster’s clutches");
    obj.textEditor7:setName("textEditor7");

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout24);
    obj.checkBox69:setLeft(020);
    obj.checkBox69:setTop(100);
    obj.checkBox69:setHeight(20);
    obj.checkBox69:setWidth(150);
    obj.checkBox69:setText("Binding Prison");
    obj.checkBox69:setField("aaBPrison");
    obj.checkBox69:setName("checkBox69");

    obj.BotaoaaBPrison = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaBPrison:setParent(obj.layout24);
    obj.BotaoaaBPrison:setLeft(175);
    obj.BotaoaaBPrison:setTop(100);
    obj.BotaoaaBPrison:setWidth(23);
    obj.BotaoaaBPrison:setHeight(25);
    obj.BotaoaaBPrison:setText("i");
    obj.BotaoaaBPrison:setName("BotaoaaBPrison");

    obj.popAbilityaaIPrison = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaIPrison:setParent(obj.layout24);
    obj.popAbilityaaIPrison:setName("popAbilityaaIPrison");
    obj.popAbilityaaIPrison:setWidth(300);
    obj.popAbilityaaIPrison:setHeight(200);
    obj.popAbilityaaIPrison:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaIPrison, "autoScopeNode",  "false");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.popAbilityaaIPrison);
    obj.label80:setLeft(05);
    obj.label80:setTop(5);
    obj.label80:setWidth(60);
    obj.label80:setHeight(20);
    obj.label80:setText("Descrição:");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.popAbilityaaIPrison);
    obj.textEditor8:setLeft(005);
    obj.textEditor8:setTop(30);
    obj.textEditor8:setHeight(165);
    obj.textEditor8:setWidth(290);
    obj.textEditor8:setField("DescricaoaaIPrison");
    obj.textEditor8:setText("An Insecure Prison gives the target the opportunity to make an Escape Action. The opposed roll for the Escape Action uses (Monster's AGI + Monster's Level) instead of the monster's SPD Rating.");
    obj.textEditor8:setName("textEditor8");

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout24);
    obj.checkBox70:setLeft(020);
    obj.checkBox70:setTop(125);
    obj.checkBox70:setHeight(20);
    obj.checkBox70:setWidth(150);
    obj.checkBox70:setText("Insecure Prison");
    obj.checkBox70:setField("aaIPrison");
    obj.checkBox70:setName("checkBox70");

    obj.BotaoaaIPrison = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaIPrison:setParent(obj.layout24);
    obj.BotaoaaIPrison:setLeft(175);
    obj.BotaoaaIPrison:setTop(125);
    obj.BotaoaaIPrison:setWidth(23);
    obj.BotaoaaIPrison:setHeight(25);
    obj.BotaoaaIPrison:setText("i");
    obj.BotaoaaIPrison:setName("BotaoaaIPrison");

    obj.popAbilityaaSPrison = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaSPrison:setParent(obj.layout24);
    obj.popAbilityaaSPrison:setName("popAbilityaaSPrison");
    obj.popAbilityaaSPrison:setWidth(300);
    obj.popAbilityaaSPrison:setHeight(200);
    obj.popAbilityaaSPrison:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaSPrison, "autoScopeNode",  "false");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.popAbilityaaSPrison);
    obj.label81:setLeft(05);
    obj.label81:setTop(5);
    obj.label81:setWidth(60);
    obj.label81:setHeight(20);
    obj.label81:setText("Descrição:");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.popAbilityaaSPrison);
    obj.textEditor9:setLeft(005);
    obj.textEditor9:setTop(30);
    obj.textEditor9:setHeight(165);
    obj.textEditor9:setWidth(290);
    obj.textEditor9:setField("DescricaoaaSPrison");
    obj.textEditor9:setText("A Sheltered Prison prevents the captured target from taking damage when the monster is damaged in battle.");
    obj.textEditor9:setName("textEditor9");

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout24);
    obj.checkBox71:setLeft(020);
    obj.checkBox71:setTop(150);
    obj.checkBox71:setHeight(20);
    obj.checkBox71:setWidth(150);
    obj.checkBox71:setText("Sheltered Prison");
    obj.checkBox71:setField("aaSPrison");
    obj.checkBox71:setName("checkBox71");

    obj.BotaoaaSPrison = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaSPrison:setParent(obj.layout24);
    obj.BotaoaaSPrison:setLeft(175);
    obj.BotaoaaSPrison:setTop(150);
    obj.BotaoaaSPrison:setWidth(23);
    obj.BotaoaaSPrison:setHeight(25);
    obj.BotaoaaSPrison:setText("i");
    obj.BotaoaaSPrison:setName("BotaoaaSPrison");

    obj.popAbilityaaDPrison = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaDPrison:setParent(obj.layout24);
    obj.popAbilityaaDPrison:setName("popAbilityaaDPrison");
    obj.popAbilityaaDPrison:setWidth(300);
    obj.popAbilityaaDPrison:setHeight(200);
    obj.popAbilityaaDPrison:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaDPrison, "autoScopeNode",  "false");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.popAbilityaaDPrison);
    obj.label82:setLeft(05);
    obj.label82:setTop(5);
    obj.label82:setWidth(60);
    obj.label82:setHeight(20);
    obj.label82:setText("Descrição:");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.popAbilityaaDPrison);
    obj.textEditor10:setLeft(005);
    obj.textEditor10:setTop(30);
    obj.textEditor10:setHeight(165);
    obj.textEditor10:setWidth(290);
    obj.textEditor10:setField("DescricaoaaDPrison");
    obj.textEditor10:setText("A target in a Damaging Prison loses 10% of his maximum Hit Points at the end of every Status Phase he still remains imprisoned for.");
    obj.textEditor10:setName("textEditor10");

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout24);
    obj.checkBox72:setLeft(020);
    obj.checkBox72:setTop(175);
    obj.checkBox72:setHeight(20);
    obj.checkBox72:setWidth(150);
    obj.checkBox72:setText("Damaging Prison");
    obj.checkBox72:setField("aaDPrison");
    obj.checkBox72:setName("checkBox72");

    obj.BotaoaaDPrison = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaDPrison:setParent(obj.layout24);
    obj.BotaoaaDPrison:setLeft(175);
    obj.BotaoaaDPrison:setTop(175);
    obj.BotaoaaDPrison:setWidth(23);
    obj.BotaoaaDPrison:setHeight(25);
    obj.BotaoaaDPrison:setText("i");
    obj.BotaoaaDPrison:setName("BotaoaaDPrison");

    obj.popAbilityaaVPrison = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaVPrison:setParent(obj.layout24);
    obj.popAbilityaaVPrison:setName("popAbilityaaVPrison");
    obj.popAbilityaaVPrison:setWidth(300);
    obj.popAbilityaaVPrison:setHeight(200);
    obj.popAbilityaaVPrison:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaVPrison, "autoScopeNode",  "false");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.popAbilityaaVPrison);
    obj.label83:setLeft(05);
    obj.label83:setTop(5);
    obj.label83:setWidth(60);
    obj.label83:setHeight(20);
    obj.label83:setText("Descrição:");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.popAbilityaaVPrison);
    obj.textEditor11:setLeft(005);
    obj.textEditor11:setTop(30);
    obj.textEditor11:setHeight(165);
    obj.textEditor11:setWidth(290);
    obj.textEditor11:setField("DescricaoaaVPrison");
    obj.textEditor11:setText("A Vulnerable Prison releases the target released from the monster’s clutches once the monster suffers damage equal to 10% of the monster’s maximum Hit Points. This damage is cumulative, and does not have to be done in one attack.");
    obj.textEditor11:setName("textEditor11");

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout24);
    obj.checkBox73:setLeft(020);
    obj.checkBox73:setTop(200);
    obj.checkBox73:setHeight(20);
    obj.checkBox73:setWidth(150);
    obj.checkBox73:setText("Vulnerable Prison");
    obj.checkBox73:setField("aaVPrison");
    obj.checkBox73:setName("checkBox73");

    obj.BotaoaaVPrison = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaVPrison:setParent(obj.layout24);
    obj.BotaoaaVPrison:setLeft(175);
    obj.BotaoaaVPrison:setTop(200);
    obj.BotaoaaVPrison:setWidth(23);
    obj.BotaoaaVPrison:setHeight(25);
    obj.BotaoaaVPrison:setText("i");
    obj.BotaoaaVPrison:setName("BotaoaaVPrison");

    obj.popAbilityaaItemUse = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaItemUse:setParent(obj.layout24);
    obj.popAbilityaaItemUse:setName("popAbilityaaItemUse");
    obj.popAbilityaaItemUse:setWidth(300);
    obj.popAbilityaaItemUse:setHeight(200);
    obj.popAbilityaaItemUse:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaItemUse, "autoScopeNode",  "false");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.popAbilityaaItemUse);
    obj.label84:setLeft(05);
    obj.label84:setTop(5);
    obj.label84:setWidth(60);
    obj.label84:setHeight(20);
    obj.label84:setText("Descrição:");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.popAbilityaaItemUse);
    obj.textEditor12:setLeft(005);
    obj.textEditor12:setTop(30);
    obj.textEditor12:setHeight(165);
    obj.textEditor12:setWidth(290);
    obj.textEditor12:setField("DescricaoaaItemUse");
    obj.textEditor12:setText("The monster can make Item Actions, and has an Inventory of its own. Items made available to a monster via its Inventory are separate from the monster’s Treasure Tables; anything still left in the monster’s Inventory when it is defeated is awarded to the players alongside the usual treasure.  Successful use of Steal liberates a random item from the monster’s Inventory until there is nothing left to steal; at this point, subsequent uses of Steal take items from the Treasure Table as normal. Item Use is sealed by the Status Condition Disable.");
    obj.textEditor12:setName("textEditor12");

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout24);
    obj.checkBox74:setLeft(000);
    obj.checkBox74:setTop(225);
    obj.checkBox74:setHeight(20);
    obj.checkBox74:setWidth(150);
    obj.checkBox74:setText("Item Use");
    obj.checkBox74:setField("aaItemUse");
    lfm_setPropAsString(obj.checkBox74, "fontStyle",  "bold");
    obj.checkBox74:setName("checkBox74");

    obj.BotaoaaItemUse = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaItemUse:setParent(obj.layout24);
    obj.BotaoaaItemUse:setLeft(175);
    obj.BotaoaaItemUse:setTop(225);
    obj.BotaoaaItemUse:setWidth(23);
    obj.BotaoaaItemUse:setHeight(25);
    obj.BotaoaaItemUse:setText("i");
    obj.BotaoaaItemUse:setName("BotaoaaItemUse");

    obj.popAbilityaaRestore = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaRestore:setParent(obj.layout24);
    obj.popAbilityaaRestore:setName("popAbilityaaRestore");
    obj.popAbilityaaRestore:setWidth(300);
    obj.popAbilityaaRestore:setHeight(200);
    obj.popAbilityaaRestore:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaRestore, "autoScopeNode",  "false");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.popAbilityaaRestore);
    obj.label85:setLeft(05);
    obj.label85:setTop(5);
    obj.label85:setWidth(60);
    obj.label85:setHeight(20);
    obj.label85:setText("Descrição:");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.popAbilityaaRestore);
    obj.textEditor13:setLeft(005);
    obj.textEditor13:setTop(30);
    obj.textEditor13:setHeight(165);
    obj.textEditor13:setWidth(290);
    obj.textEditor13:setField("DescricaoaaRestore");
    obj.textEditor13:setText("The monster has the ability to regenerate even grievous damage. Through the use of an Ability Action, a monster with Restore can regenerate 25%, 50%, or 75% of its maximum Hit Points.  Creatures under the Status Condition Zombie suffer the appropriate amount of damage instead.");
    obj.textEditor13:setName("textEditor13");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout24);
    obj.label86:setLeft(000);
    obj.label86:setTop(250);
    obj.label86:setHeight(20);
    obj.label86:setWidth(170);
    obj.label86:setText("Restore");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");

    obj.BotaoaaRestore = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaRestore:setParent(obj.layout24);
    obj.BotaoaaRestore:setLeft(175);
    obj.BotaoaaRestore:setTop(250);
    obj.BotaoaaRestore:setWidth(23);
    obj.BotaoaaRestore:setHeight(25);
    obj.BotaoaaRestore:setText("i");
    obj.BotaoaaRestore:setName("BotaoaaRestore");

    obj.checkBox75 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout24);
    obj.checkBox75:setLeft(020);
    obj.checkBox75:setTop(275);
    obj.checkBox75:setHeight(20);
    obj.checkBox75:setWidth(150);
    obj.checkBox75:setText("25%");
    obj.checkBox75:setField("aaRestore25");
    obj.checkBox75:setName("checkBox75");

    obj.checkBox76 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout24);
    obj.checkBox76:setLeft(020);
    obj.checkBox76:setTop(300);
    obj.checkBox76:setHeight(20);
    obj.checkBox76:setWidth(150);
    obj.checkBox76:setText("50%");
    obj.checkBox76:setField("aaRestore50");
    obj.checkBox76:setName("checkBox76");

    obj.checkBox77 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout24);
    obj.checkBox77:setLeft(020);
    obj.checkBox77:setTop(325);
    obj.checkBox77:setHeight(20);
    obj.checkBox77:setWidth(150);
    obj.checkBox77:setText("75%");
    obj.checkBox77:setField("aaRestore75");
    obj.checkBox77:setName("checkBox77");

    obj.popAbilityaaSealStat = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityaaSealStat:setParent(obj.layout24);
    obj.popAbilityaaSealStat:setName("popAbilityaaSealStat");
    obj.popAbilityaaSealStat:setWidth(300);
    obj.popAbilityaaSealStat:setHeight(200);
    obj.popAbilityaaSealStat:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityaaSealStat, "autoScopeNode",  "false");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.popAbilityaaSealStat);
    obj.label87:setLeft(05);
    obj.label87:setTop(5);
    obj.label87:setWidth(60);
    obj.label87:setHeight(20);
    obj.label87:setText("Descrição:");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.popAbilityaaSealStat);
    obj.textEditor14:setLeft(005);
    obj.textEditor14:setTop(30);
    obj.textEditor14:setHeight(165);
    obj.textEditor14:setWidth(290);
    obj.textEditor14:setField("DescricaoaaSealStat");
    obj.textEditor14:setText("The monster is capable of stealing Status Conditions from another combatant. Steal Status requires an Ability Action to carry out, and transfers the newest Status Condition added to the target to the monster, duration included, canceling it on the target in the process.  XP and Gil values depend on whether the monster will steal any Status Condition, or only the newest positive Status Condition added to the target. Steal Status may take multiple Status Conditions with just one Action; in this case, multiply the values given below by the maximum number of Status Conditions Steal Status can take.  When dealing with Auto- or SOS- Status Conditions, Steal Status will add the Status Condition in question to the monster without canceling the original; Status Conditions stolen in this manner automatically have a Timer of (4).");
    obj.textEditor14:setName("textEditor14");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout24);
    obj.label88:setLeft(000);
    obj.label88:setTop(350);
    obj.label88:setHeight(20);
    obj.label88:setWidth(170);
    obj.label88:setText("Steal Status");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setName("label88");

    obj.BotaoaaSealStat = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoaaSealStat:setParent(obj.layout24);
    obj.BotaoaaSealStat:setLeft(175);
    obj.BotaoaaSealStat:setTop(350);
    obj.BotaoaaSealStat:setWidth(23);
    obj.BotaoaaSealStat:setHeight(25);
    obj.BotaoaaSealStat:setText("i");
    obj.BotaoaaSealStat:setName("BotaoaaSealStat");

    obj.checkBox78 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout24);
    obj.checkBox78:setLeft(020);
    obj.checkBox78:setTop(375);
    obj.checkBox78:setHeight(20);
    obj.checkBox78:setWidth(150);
    obj.checkBox78:setText("Positive Only");
    obj.checkBox78:setField("aaSSPO");
    obj.checkBox78:setName("checkBox78");

    obj.checkBox79 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout24);
    obj.checkBox79:setLeft(020);
    obj.checkBox79:setTop(400);
    obj.checkBox79:setHeight(20);
    obj.checkBox79:setWidth(150);
    obj.checkBox79:setText("Positive or Negative");
    obj.checkBox79:setField("aaSSPN");
    obj.checkBox79:setName("checkBox79");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox3);
    obj.layout25:setLeft(1000);
    obj.layout25:setTop(570);
    obj.layout25:setHeight(50);
    obj.layout25:setWidth(90);
    obj.layout25:setName("layout25");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout25);
    obj.label89:setLeft(000);
    obj.label89:setTop(000);
    obj.label89:setHeight(20);
    obj.label89:setWidth(30);
    obj.label89:setText("Exp");
    obj.label89:setAutoSize(true);
    obj.label89:setName("label89");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout25);
    obj.edit205:setLeft(035);
    obj.edit205:setTop(000);
    obj.edit205:setHeight(20);
    obj.edit205:setWidth(50);
    obj.edit205:setField("ExpFinal");
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setName("edit205");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout25);
    obj.label90:setLeft(000);
    obj.label90:setTop(025);
    obj.label90:setHeight(20);
    obj.label90:setWidth(30);
    obj.label90:setText("Gil");
    obj.label90:setAutoSize(true);
    obj.label90:setName("label90");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout25);
    obj.edit206:setLeft(35);
    obj.edit206:setTop(025);
    obj.edit206:setHeight(20);
    obj.edit206:setWidth(50);
    obj.edit206:setField("GilFinal");
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setName("edit206");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Spells/Jobs/Moves");
    obj.tab4:setName("tab4");

    obj.frmSpellsJobs = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSpellsJobs:setParent(obj.tab4);
    obj.frmSpellsJobs:setName("frmSpellsJobs");
    obj.frmSpellsJobs:setAlign("client");
    obj.frmSpellsJobs:setTheme("dark");
    obj.frmSpellsJobs:setMargins({top=1});

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.frmSpellsJobs);
    obj.layout26:setLeft(000);
    obj.layout26:setTop(000);
    obj.layout26:setHeight(650);
    obj.layout26:setWidth(1100);
    obj.layout26:setName("layout26");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout26);
    obj.image5:setLeft(000);
    obj.image5:setTop(000);
    obj.image5:setHeight(650);
    obj.image5:setWidth(1100);
    obj.image5:setSRC("/img/wallpaper.png");
    obj.image5:setStyle("autoFit");
    obj.image5:setName("image5");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmSpellsJobs);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox4);
    obj.layout27:setLeft(100);
    obj.layout27:setTop(60);
    obj.layout27:setHeight(300);
    obj.layout27:setWidth(400);
    obj.layout27:setName("layout27");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout27);
    obj.label91:setLeft(000);
    obj.label91:setTop(000);
    obj.label91:setHeight(20);
    obj.label91:setWidth(80);
    obj.label91:setText("Magia #1");
    obj.label91:setAutoSize(true);
    obj.label91:setName("label91");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout27);
    obj.comboBox7:setLeft(085);
    obj.comboBox7:setTop(000);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setWidth(130);
    obj.comboBox7:setField("SpellsTIPO1");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox7:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox7:setName("comboBox7");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout27);
    obj.edit207:setLeft(230);
    obj.edit207:setTop(000);
    obj.edit207:setHeight(20);
    obj.edit207:setWidth(150);
    obj.edit207:setField("SpellMAG1");
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setName("edit207");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout27);
    obj.dataLink1:setField("SpellsTIPO1");
    obj.dataLink1:setDefaultValue("None");
    obj.dataLink1:setName("dataLink1");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout27);
    obj.label92:setLeft(000);
    obj.label92:setTop(025);
    obj.label92:setHeight(20);
    obj.label92:setWidth(80);
    obj.label92:setText("Magia #2");
    obj.label92:setAutoSize(true);
    obj.label92:setName("label92");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout27);
    obj.comboBox8:setLeft(085);
    obj.comboBox8:setTop(025);
    obj.comboBox8:setHeight(20);
    obj.comboBox8:setWidth(130);
    obj.comboBox8:setField("SpellsTIPO2");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox8:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox8:setName("comboBox8");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout27);
    obj.edit208:setLeft(230);
    obj.edit208:setTop(025);
    obj.edit208:setHeight(20);
    obj.edit208:setWidth(150);
    obj.edit208:setField("SpellMAG2");
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setName("edit208");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout27);
    obj.dataLink2:setField("SpellsTIPO2");
    obj.dataLink2:setDefaultValue("None");
    obj.dataLink2:setName("dataLink2");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout27);
    obj.label93:setLeft(000);
    obj.label93:setTop(050);
    obj.label93:setHeight(20);
    obj.label93:setWidth(80);
    obj.label93:setText("Magia #3");
    obj.label93:setAutoSize(true);
    obj.label93:setName("label93");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout27);
    obj.comboBox9:setLeft(085);
    obj.comboBox9:setTop(050);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setWidth(130);
    obj.comboBox9:setField("SpellsTIPO3");
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox9:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox9:setName("comboBox9");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout27);
    obj.edit209:setLeft(230);
    obj.edit209:setTop(050);
    obj.edit209:setHeight(20);
    obj.edit209:setWidth(150);
    obj.edit209:setField("SpellMAG3");
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setName("edit209");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout27);
    obj.dataLink3:setField("SpellsTIPO3");
    obj.dataLink3:setDefaultValue("None");
    obj.dataLink3:setName("dataLink3");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout27);
    obj.label94:setLeft(000);
    obj.label94:setTop(075);
    obj.label94:setHeight(20);
    obj.label94:setWidth(80);
    obj.label94:setText("Magia #4");
    obj.label94:setAutoSize(true);
    obj.label94:setName("label94");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout27);
    obj.comboBox10:setLeft(085);
    obj.comboBox10:setTop(075);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setWidth(130);
    obj.comboBox10:setField("SpellsTIPO4");
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox10:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox10:setName("comboBox10");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout27);
    obj.edit210:setLeft(230);
    obj.edit210:setTop(075);
    obj.edit210:setHeight(20);
    obj.edit210:setWidth(150);
    obj.edit210:setField("SpellMAG4");
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setName("edit210");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout27);
    obj.dataLink4:setField("SpellsTIPO4");
    obj.dataLink4:setDefaultValue("None");
    obj.dataLink4:setName("dataLink4");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout27);
    obj.label95:setLeft(000);
    obj.label95:setTop(100);
    obj.label95:setHeight(20);
    obj.label95:setWidth(80);
    obj.label95:setText("Magia #5");
    obj.label95:setAutoSize(true);
    obj.label95:setName("label95");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout27);
    obj.comboBox11:setLeft(085);
    obj.comboBox11:setTop(100);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setWidth(130);
    obj.comboBox11:setField("SpellsTIPO5");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox11:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox11:setName("comboBox11");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout27);
    obj.edit211:setLeft(230);
    obj.edit211:setTop(100);
    obj.edit211:setHeight(20);
    obj.edit211:setWidth(150);
    obj.edit211:setField("SpellMAG5");
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setName("edit211");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout27);
    obj.dataLink5:setField("SpellsTIPO5");
    obj.dataLink5:setDefaultValue("None");
    obj.dataLink5:setName("dataLink5");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout27);
    obj.label96:setLeft(000);
    obj.label96:setTop(125);
    obj.label96:setHeight(20);
    obj.label96:setWidth(80);
    obj.label96:setText("Magia #6");
    obj.label96:setAutoSize(true);
    obj.label96:setName("label96");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout27);
    obj.comboBox12:setLeft(085);
    obj.comboBox12:setTop(125);
    obj.comboBox12:setHeight(20);
    obj.comboBox12:setWidth(130);
    obj.comboBox12:setField("SpellsTIPO6");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox12:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox12:setName("comboBox12");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout27);
    obj.edit212:setLeft(230);
    obj.edit212:setTop(125);
    obj.edit212:setHeight(20);
    obj.edit212:setWidth(150);
    obj.edit212:setField("SpellMAG6");
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setName("edit212");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout27);
    obj.dataLink6:setField("SpellsTIPO6");
    obj.dataLink6:setDefaultValue("None");
    obj.dataLink6:setName("dataLink6");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout27);
    obj.label97:setLeft(000);
    obj.label97:setTop(150);
    obj.label97:setHeight(20);
    obj.label97:setWidth(80);
    obj.label97:setText("Magia #7");
    obj.label97:setAutoSize(true);
    obj.label97:setName("label97");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout27);
    obj.comboBox13:setLeft(085);
    obj.comboBox13:setTop(150);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setWidth(130);
    obj.comboBox13:setField("SpellsTIPO7");
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox13:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox13:setName("comboBox13");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout27);
    obj.edit213:setLeft(230);
    obj.edit213:setTop(150);
    obj.edit213:setHeight(20);
    obj.edit213:setWidth(150);
    obj.edit213:setField("SpellMAG7");
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setName("edit213");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout27);
    obj.dataLink7:setField("SpellsTIPO7");
    obj.dataLink7:setDefaultValue("None");
    obj.dataLink7:setName("dataLink7");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout27);
    obj.label98:setLeft(000);
    obj.label98:setTop(175);
    obj.label98:setHeight(20);
    obj.label98:setWidth(80);
    obj.label98:setText("Magia #8");
    obj.label98:setAutoSize(true);
    obj.label98:setName("label98");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout27);
    obj.comboBox14:setLeft(085);
    obj.comboBox14:setTop(175);
    obj.comboBox14:setHeight(20);
    obj.comboBox14:setWidth(130);
    obj.comboBox14:setField("SpellsTIPO8");
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox14:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox14:setName("comboBox14");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout27);
    obj.edit214:setLeft(230);
    obj.edit214:setTop(175);
    obj.edit214:setHeight(20);
    obj.edit214:setWidth(150);
    obj.edit214:setField("SpellMAG8");
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setName("edit214");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout27);
    obj.dataLink8:setField("SpellsTIPO8");
    obj.dataLink8:setDefaultValue("None");
    obj.dataLink8:setName("dataLink8");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout27);
    obj.label99:setLeft(000);
    obj.label99:setTop(200);
    obj.label99:setHeight(20);
    obj.label99:setWidth(80);
    obj.label99:setText("Magia #9");
    obj.label99:setAutoSize(true);
    obj.label99:setName("label99");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout27);
    obj.comboBox15:setLeft(085);
    obj.comboBox15:setTop(200);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setWidth(130);
    obj.comboBox15:setField("SpellsTIPO9");
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox15:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox15:setName("comboBox15");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout27);
    obj.edit215:setLeft(230);
    obj.edit215:setTop(200);
    obj.edit215:setHeight(20);
    obj.edit215:setWidth(150);
    obj.edit215:setField("SpellMAG9");
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setName("edit215");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout27);
    obj.dataLink9:setField("SpellsTIPO9");
    obj.dataLink9:setDefaultValue("None");
    obj.dataLink9:setName("dataLink9");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout27);
    obj.label100:setLeft(000);
    obj.label100:setTop(225);
    obj.label100:setHeight(20);
    obj.label100:setWidth(80);
    obj.label100:setText("Magia #10");
    obj.label100:setAutoSize(true);
    obj.label100:setName("label100");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout27);
    obj.comboBox16:setLeft(085);
    obj.comboBox16:setTop(225);
    obj.comboBox16:setHeight(20);
    obj.comboBox16:setWidth(130);
    obj.comboBox16:setField("SpellsTIPO10");
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox16:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox16:setName("comboBox16");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout27);
    obj.edit216:setLeft(230);
    obj.edit216:setTop(225);
    obj.edit216:setHeight(20);
    obj.edit216:setWidth(150);
    obj.edit216:setField("SpellMAG10");
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setName("edit216");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout27);
    obj.dataLink10:setField("SpellsTIPO10");
    obj.dataLink10:setDefaultValue("None");
    obj.dataLink10:setName("dataLink10");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout27);
    obj.label101:setLeft(000);
    obj.label101:setTop(250);
    obj.label101:setHeight(20);
    obj.label101:setWidth(80);
    obj.label101:setText("Magia #11");
    obj.label101:setAutoSize(true);
    obj.label101:setName("label101");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout27);
    obj.comboBox17:setLeft(085);
    obj.comboBox17:setTop(250);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setWidth(130);
    obj.comboBox17:setField("SpellsTIPO11");
    obj.comboBox17:setHorzTextAlign("center");
    obj.comboBox17:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox17:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox17:setName("comboBox17");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout27);
    obj.edit217:setLeft(230);
    obj.edit217:setTop(250);
    obj.edit217:setHeight(20);
    obj.edit217:setWidth(150);
    obj.edit217:setField("SpellMAG11");
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setName("edit217");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout27);
    obj.dataLink11:setField("SpellsTIPO11");
    obj.dataLink11:setDefaultValue("None");
    obj.dataLink11:setName("dataLink11");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout27);
    obj.label102:setLeft(000);
    obj.label102:setTop(275);
    obj.label102:setHeight(20);
    obj.label102:setWidth(80);
    obj.label102:setText("Magia #12");
    obj.label102:setAutoSize(true);
    obj.label102:setName("label102");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout27);
    obj.comboBox18:setLeft(085);
    obj.comboBox18:setTop(275);
    obj.comboBox18:setHeight(20);
    obj.comboBox18:setWidth(130);
    obj.comboBox18:setField("SpellsTIPO12");
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setItems({'Level 1' , 'Level 2' , 'Level 3' , 'Level 4', 'Level 5', 'Level 6', 'Level 7', 'Level 8', 'Blue (1-9 MP)' , 'Blue (10-18 MP)' , 'Blue (19-27 MP)' , 'Blue (28-40 MP)', 'Blue (41-54 MP)', 'Blue (55-67 MP)', 'Blue (68-84 MP)', 'Blue (85+ MP)', 'Call (1-25 MP)' , 'Call (26-60 MP)' , 'Call (61-100 MP)' , 'Call (101+ MP)', 'None'});
    obj.comboBox18:setValues({'Spell1' , 'Spell2' , 'Spell3' , 'Spell4', 'Spell5', 'Spell6', 'Spell7', 'Spell8', 'Blue1' , 'Blue2' , 'Blue3' , 'Blue4', 'Blue5', 'Blue6', 'Blue7', 'Blue8', 'Call1' , 'Call2' , 'Call3' , 'Call4', 'None'});
    obj.comboBox18:setName("comboBox18");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout27);
    obj.edit218:setLeft(230);
    obj.edit218:setTop(275);
    obj.edit218:setHeight(20);
    obj.edit218:setWidth(150);
    obj.edit218:setField("SpellMAG12");
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setName("edit218");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout27);
    obj.dataLink12:setField("SpellsTIPO12");
    obj.dataLink12:setDefaultValue("None");
    obj.dataLink12:setName("dataLink12");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox4);
    obj.layout28:setLeft(600);
    obj.layout28:setTop(60);
    obj.layout28:setHeight(300);
    obj.layout28:setWidth(400);
    obj.layout28:setName("layout28");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout28);
    obj.label103:setLeft(000);
    obj.label103:setTop(000);
    obj.label103:setHeight(20);
    obj.label103:setWidth(80);
    obj.label103:setText("Job Skill #1");
    obj.label103:setAutoSize(true);
    obj.label103:setName("label103");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout28);
    obj.comboBox19:setLeft(085);
    obj.comboBox19:setTop(000);
    obj.comboBox19:setHeight(20);
    obj.comboBox19:setWidth(130);
    obj.comboBox19:setField("JSTipo1");
    obj.comboBox19:setHorzTextAlign("center");
    obj.comboBox19:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox19:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox19:setName("comboBox19");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout28);
    obj.edit219:setLeft(230);
    obj.edit219:setTop(000);
    obj.edit219:setHeight(20);
    obj.edit219:setWidth(150);
    obj.edit219:setField("JobSkill1");
    obj.edit219:setHorzTextAlign("center");
    obj.edit219:setName("edit219");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout28);
    obj.dataLink13:setField("JSTipo1");
    obj.dataLink13:setDefaultValue("None");
    obj.dataLink13:setName("dataLink13");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout28);
    obj.label104:setLeft(000);
    obj.label104:setTop(025);
    obj.label104:setHeight(20);
    obj.label104:setWidth(80);
    obj.label104:setText("Job Skill #2");
    obj.label104:setAutoSize(true);
    obj.label104:setName("label104");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout28);
    obj.comboBox20:setLeft(085);
    obj.comboBox20:setTop(025);
    obj.comboBox20:setHeight(20);
    obj.comboBox20:setWidth(130);
    obj.comboBox20:setField("JSTipo2");
    obj.comboBox20:setHorzTextAlign("center");
    obj.comboBox20:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox20:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox20:setName("comboBox20");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout28);
    obj.edit220:setLeft(230);
    obj.edit220:setTop(025);
    obj.edit220:setHeight(20);
    obj.edit220:setWidth(150);
    obj.edit220:setField("JobSkill2");
    obj.edit220:setHorzTextAlign("center");
    obj.edit220:setName("edit220");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout28);
    obj.dataLink14:setField("JSTipo2");
    obj.dataLink14:setDefaultValue("None");
    obj.dataLink14:setName("dataLink14");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout28);
    obj.label105:setLeft(000);
    obj.label105:setTop(050);
    obj.label105:setHeight(20);
    obj.label105:setWidth(80);
    obj.label105:setText("Job Skill #3");
    obj.label105:setAutoSize(true);
    obj.label105:setName("label105");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout28);
    obj.comboBox21:setLeft(085);
    obj.comboBox21:setTop(050);
    obj.comboBox21:setHeight(20);
    obj.comboBox21:setWidth(130);
    obj.comboBox21:setField("JSTipo3");
    obj.comboBox21:setHorzTextAlign("center");
    obj.comboBox21:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox21:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox21:setName("comboBox21");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout28);
    obj.edit221:setLeft(230);
    obj.edit221:setTop(050);
    obj.edit221:setHeight(20);
    obj.edit221:setWidth(150);
    obj.edit221:setField("JobSkill3");
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setName("edit221");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout28);
    obj.dataLink15:setField("JSTipo3");
    obj.dataLink15:setDefaultValue("None");
    obj.dataLink15:setName("dataLink15");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout28);
    obj.label106:setLeft(000);
    obj.label106:setTop(075);
    obj.label106:setHeight(20);
    obj.label106:setWidth(80);
    obj.label106:setText("Job Skill #4");
    obj.label106:setAutoSize(true);
    obj.label106:setName("label106");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout28);
    obj.comboBox22:setLeft(085);
    obj.comboBox22:setTop(075);
    obj.comboBox22:setHeight(20);
    obj.comboBox22:setWidth(130);
    obj.comboBox22:setField("JSTipo4");
    obj.comboBox22:setHorzTextAlign("center");
    obj.comboBox22:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox22:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox22:setName("comboBox22");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout28);
    obj.edit222:setLeft(230);
    obj.edit222:setTop(075);
    obj.edit222:setHeight(20);
    obj.edit222:setWidth(150);
    obj.edit222:setField("JobSkill4");
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setName("edit222");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout28);
    obj.dataLink16:setField("JSTipo4");
    obj.dataLink16:setDefaultValue("None");
    obj.dataLink16:setName("dataLink16");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout28);
    obj.label107:setLeft(000);
    obj.label107:setTop(100);
    obj.label107:setHeight(20);
    obj.label107:setWidth(80);
    obj.label107:setText("Job Skill #5");
    obj.label107:setAutoSize(true);
    obj.label107:setName("label107");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout28);
    obj.comboBox23:setLeft(085);
    obj.comboBox23:setTop(100);
    obj.comboBox23:setHeight(20);
    obj.comboBox23:setWidth(130);
    obj.comboBox23:setField("JSTipo5");
    obj.comboBox23:setHorzTextAlign("center");
    obj.comboBox23:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox23:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox23:setName("comboBox23");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout28);
    obj.edit223:setLeft(230);
    obj.edit223:setTop(100);
    obj.edit223:setHeight(20);
    obj.edit223:setWidth(150);
    obj.edit223:setField("JobSkill5");
    obj.edit223:setHorzTextAlign("center");
    obj.edit223:setName("edit223");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout28);
    obj.dataLink17:setField("JSTipo5");
    obj.dataLink17:setDefaultValue("None");
    obj.dataLink17:setName("dataLink17");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout28);
    obj.label108:setLeft(000);
    obj.label108:setTop(125);
    obj.label108:setHeight(20);
    obj.label108:setWidth(80);
    obj.label108:setText("Job Skill #6");
    obj.label108:setAutoSize(true);
    obj.label108:setName("label108");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout28);
    obj.comboBox24:setLeft(085);
    obj.comboBox24:setTop(125);
    obj.comboBox24:setHeight(20);
    obj.comboBox24:setWidth(130);
    obj.comboBox24:setField("JSTipo6");
    obj.comboBox24:setHorzTextAlign("center");
    obj.comboBox24:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox24:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox24:setName("comboBox24");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout28);
    obj.edit224:setLeft(230);
    obj.edit224:setTop(125);
    obj.edit224:setHeight(20);
    obj.edit224:setWidth(150);
    obj.edit224:setField("JobSkill6");
    obj.edit224:setHorzTextAlign("center");
    obj.edit224:setName("edit224");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout28);
    obj.dataLink18:setField("JSTipo6");
    obj.dataLink18:setDefaultValue("None");
    obj.dataLink18:setName("dataLink18");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout28);
    obj.label109:setLeft(000);
    obj.label109:setTop(150);
    obj.label109:setHeight(20);
    obj.label109:setWidth(80);
    obj.label109:setText("Job Skill #7");
    obj.label109:setAutoSize(true);
    obj.label109:setName("label109");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout28);
    obj.comboBox25:setLeft(085);
    obj.comboBox25:setTop(150);
    obj.comboBox25:setHeight(20);
    obj.comboBox25:setWidth(130);
    obj.comboBox25:setField("JSTipo7");
    obj.comboBox25:setHorzTextAlign("center");
    obj.comboBox25:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox25:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox25:setName("comboBox25");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout28);
    obj.edit225:setLeft(230);
    obj.edit225:setTop(150);
    obj.edit225:setHeight(20);
    obj.edit225:setWidth(150);
    obj.edit225:setField("JobSkill7");
    obj.edit225:setHorzTextAlign("center");
    obj.edit225:setName("edit225");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout28);
    obj.dataLink19:setField("JSTipo7");
    obj.dataLink19:setDefaultValue("None");
    obj.dataLink19:setName("dataLink19");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout28);
    obj.label110:setLeft(000);
    obj.label110:setTop(175);
    obj.label110:setHeight(20);
    obj.label110:setWidth(80);
    obj.label110:setText("Job Skill #8");
    obj.label110:setAutoSize(true);
    obj.label110:setName("label110");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout28);
    obj.comboBox26:setLeft(085);
    obj.comboBox26:setTop(175);
    obj.comboBox26:setHeight(20);
    obj.comboBox26:setWidth(130);
    obj.comboBox26:setField("JSTipo8");
    obj.comboBox26:setHorzTextAlign("center");
    obj.comboBox26:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox26:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox26:setName("comboBox26");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout28);
    obj.edit226:setLeft(230);
    obj.edit226:setTop(175);
    obj.edit226:setHeight(20);
    obj.edit226:setWidth(150);
    obj.edit226:setField("JobSkill8");
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setName("edit226");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout28);
    obj.dataLink20:setField("JSTipo8");
    obj.dataLink20:setDefaultValue("None");
    obj.dataLink20:setName("dataLink20");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout28);
    obj.label111:setLeft(000);
    obj.label111:setTop(200);
    obj.label111:setHeight(20);
    obj.label111:setWidth(80);
    obj.label111:setText("Job Skill #9");
    obj.label111:setAutoSize(true);
    obj.label111:setName("label111");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout28);
    obj.comboBox27:setLeft(085);
    obj.comboBox27:setTop(200);
    obj.comboBox27:setHeight(20);
    obj.comboBox27:setWidth(130);
    obj.comboBox27:setField("JSTipo9");
    obj.comboBox27:setHorzTextAlign("center");
    obj.comboBox27:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox27:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox27:setName("comboBox27");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout28);
    obj.edit227:setLeft(230);
    obj.edit227:setTop(200);
    obj.edit227:setHeight(20);
    obj.edit227:setWidth(150);
    obj.edit227:setField("JobSkill9");
    obj.edit227:setHorzTextAlign("center");
    obj.edit227:setName("edit227");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout28);
    obj.dataLink21:setField("JSTipo9");
    obj.dataLink21:setDefaultValue("None");
    obj.dataLink21:setName("dataLink21");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout28);
    obj.label112:setLeft(000);
    obj.label112:setTop(225);
    obj.label112:setHeight(20);
    obj.label112:setWidth(80);
    obj.label112:setText("Job Skill #10");
    obj.label112:setAutoSize(true);
    obj.label112:setName("label112");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout28);
    obj.comboBox28:setLeft(085);
    obj.comboBox28:setTop(225);
    obj.comboBox28:setHeight(20);
    obj.comboBox28:setWidth(130);
    obj.comboBox28:setField("JSTipo10");
    obj.comboBox28:setHorzTextAlign("center");
    obj.comboBox28:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox28:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox28:setName("comboBox28");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout28);
    obj.edit228:setLeft(230);
    obj.edit228:setTop(225);
    obj.edit228:setHeight(20);
    obj.edit228:setWidth(150);
    obj.edit228:setField("JobSkill10");
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setName("edit228");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout28);
    obj.dataLink22:setField("JSTipo10");
    obj.dataLink22:setDefaultValue("None");
    obj.dataLink22:setName("dataLink22");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout28);
    obj.label113:setLeft(000);
    obj.label113:setTop(250);
    obj.label113:setHeight(20);
    obj.label113:setWidth(80);
    obj.label113:setText("Job Skill #11");
    obj.label113:setAutoSize(true);
    obj.label113:setName("label113");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout28);
    obj.comboBox29:setLeft(085);
    obj.comboBox29:setTop(250);
    obj.comboBox29:setHeight(20);
    obj.comboBox29:setWidth(130);
    obj.comboBox29:setField("JSTipo11");
    obj.comboBox29:setHorzTextAlign("center");
    obj.comboBox29:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox29:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox29:setName("comboBox29");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout28);
    obj.edit229:setLeft(230);
    obj.edit229:setTop(250);
    obj.edit229:setHeight(20);
    obj.edit229:setWidth(150);
    obj.edit229:setField("JobSkill11");
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setName("edit229");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout28);
    obj.dataLink23:setField("JSTipo11");
    obj.dataLink23:setDefaultValue("None");
    obj.dataLink23:setName("dataLink23");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout28);
    obj.label114:setLeft(000);
    obj.label114:setTop(275);
    obj.label114:setHeight(20);
    obj.label114:setWidth(80);
    obj.label114:setText("Job Skill #12");
    obj.label114:setAutoSize(true);
    obj.label114:setName("label114");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout28);
    obj.comboBox30:setLeft(085);
    obj.comboBox30:setTop(275);
    obj.comboBox30:setHeight(20);
    obj.comboBox30:setWidth(130);
    obj.comboBox30:setField("JSTipo12");
    obj.comboBox30:setHorzTextAlign("center");
    obj.comboBox30:setItems({'Level 1-5' , 'Level 6-12' , 'Level 13-19' , 'Level 20-26', 'Level 27-33', 'Level 34-40', 'Level 41-47', 'Level 48-54', 'Level 55-61' , 'Level 62+', 'None'});
    obj.comboBox30:setValues({'JSNv1' , 'JSNv2' , 'JSNv3' , 'JSNv4', 'JSNv5', 'JSNv6', 'JSNv7', 'JSNv8', 'JSNv9' , 'JSNv10', 'None'});
    obj.comboBox30:setName("comboBox30");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout28);
    obj.edit230:setLeft(230);
    obj.edit230:setTop(275);
    obj.edit230:setHeight(20);
    obj.edit230:setWidth(150);
    obj.edit230:setField("JobSkill12");
    obj.edit230:setHorzTextAlign("center");
    obj.edit230:setName("edit230");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout28);
    obj.dataLink24:setField("JSTipo12");
    obj.dataLink24:setDefaultValue("None");
    obj.dataLink24:setName("dataLink24");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox4);
    obj.layout29:setLeft(100);
    obj.layout29:setTop(400);
    obj.layout29:setHeight(150);
    obj.layout29:setWidth(250);
    obj.layout29:setName("layout29");

    obj.popAbilitymaBurrow = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitymaBurrow:setParent(obj.layout29);
    obj.popAbilitymaBurrow:setName("popAbilitymaBurrow");
    obj.popAbilitymaBurrow:setWidth(300);
    obj.popAbilitymaBurrow:setHeight(200);
    obj.popAbilitymaBurrow:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitymaBurrow, "autoScopeNode",  "false");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.popAbilitymaBurrow);
    obj.label115:setLeft(05);
    obj.label115:setTop(5);
    obj.label115:setWidth(60);
    obj.label115:setHeight(20);
    obj.label115:setText("Descrição:");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.popAbilitymaBurrow);
    obj.textEditor15:setLeft(005);
    obj.textEditor15:setTop(30);
    obj.textEditor15:setHeight(165);
    obj.textEditor15:setWidth(290);
    obj.textEditor15:setField("DescricaomaBurrow");
    obj.textEditor15:setText("The monster tunnels through the earth, although it may not be capable of attacking until it surfaces. Burrowing monsters ignore all terrain modifiers unless attempting to tunnel through water; in this case, normal modifiers are applied. While burrowing, a monster’s EVA, ARM, and M. ARM values are at +100%");
    obj.textEditor15:setName("textEditor15");

    obj.checkBox80 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout29);
    obj.checkBox80:setLeft(000);
    obj.checkBox80:setTop(000);
    obj.checkBox80:setHeight(20);
    obj.checkBox80:setWidth(120);
    obj.checkBox80:setText("Move-Burrow");
    obj.checkBox80:setField("maBurrow");
    obj.checkBox80:setName("checkBox80");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout29);
    obj.dataLink25:setField("maGround");
    obj.dataLink25:setDefaultValue("True");
    obj.dataLink25:setName("dataLink25");

    obj.BotaomaBurrow = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaomaBurrow:setParent(obj.layout29);
    obj.BotaomaBurrow:setLeft(175);
    obj.BotaomaBurrow:setTop(000);
    obj.BotaomaBurrow:setWidth(23);
    obj.BotaomaBurrow:setHeight(25);
    obj.BotaomaBurrow:setText("i");
    obj.BotaomaBurrow:setName("BotaomaBurrow");

    obj.checkBox81 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout29);
    obj.checkBox81:setLeft(020);
    obj.checkBox81:setTop(025);
    obj.checkBox81:setHeight(20);
    obj.checkBox81:setWidth(100);
    obj.checkBox81:setText("SOS-Lose");
    obj.checkBox81:setField("maBurrowSOSL");
    obj.checkBox81:setName("checkBox81");

    obj.checkBox82 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout29);
    obj.checkBox82:setLeft(120);
    obj.checkBox82:setTop(025);
    obj.checkBox82:setHeight(20);
    obj.checkBox82:setWidth(100);
    obj.checkBox82:setText("SOS-Gain");
    obj.checkBox82:setField("maBurrowSOSG");
    obj.checkBox82:setName("checkBox82");

    obj.checkBox83 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout29);
    obj.checkBox83:setLeft(020);
    obj.checkBox83:setTop(050);
    obj.checkBox83:setHeight(20);
    obj.checkBox83:setWidth(100);
    obj.checkBox83:setText("MP Cost");
    obj.checkBox83:setField("maBurrowMP");
    obj.checkBox83:setName("checkBox83");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout29);
    obj.edit231:setLeft(120);
    obj.edit231:setTop(050);
    obj.edit231:setHeight(20);
    obj.edit231:setWidth(40);
    obj.edit231:setField("maBurrowMPCost");
    obj.edit231:setHorzTextAlign("center");
    obj.edit231:setEnabled(false);
    obj.edit231:setName("edit231");

    obj.popAbilitymaFlight = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitymaFlight:setParent(obj.layout29);
    obj.popAbilitymaFlight:setName("popAbilitymaFlight");
    obj.popAbilitymaFlight:setWidth(300);
    obj.popAbilitymaFlight:setHeight(200);
    obj.popAbilitymaFlight:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitymaFlight, "autoScopeNode",  "false");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.popAbilitymaFlight);
    obj.label116:setLeft(05);
    obj.label116:setTop(5);
    obj.label116:setWidth(60);
    obj.label116:setHeight(20);
    obj.label116:setText("Descrição:");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.popAbilitymaFlight);
    obj.textEditor16:setLeft(005);
    obj.textEditor16:setTop(30);
    obj.textEditor16:setHeight(165);
    obj.textEditor16:setWidth(290);
    obj.textEditor16:setField("DescricaomaFlight");
    obj.textEditor16:setText("The monster is capable of flying, and is treated as if afflicted with a permanent Flight effect. Unlike the Status Condition of the same name, this Flight may not be dispelled or otherwise removed during the course of the battle, except through the use of effects like the Time Magic Spell Drag.");
    obj.textEditor16:setName("textEditor16");

    obj.checkBox84 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout29);
    obj.checkBox84:setLeft(000);
    obj.checkBox84:setTop(075);
    obj.checkBox84:setHeight(20);
    obj.checkBox84:setWidth(120);
    obj.checkBox84:setText("Move-Flight");
    obj.checkBox84:setField("maFlight");
    obj.checkBox84:setName("checkBox84");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout29);
    obj.dataLink26:setField("maGround");
    obj.dataLink26:setDefaultValue("True");
    obj.dataLink26:setName("dataLink26");

    obj.BotaomaFlight = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaomaFlight:setParent(obj.layout29);
    obj.BotaomaFlight:setLeft(175);
    obj.BotaomaFlight:setTop(075);
    obj.BotaomaFlight:setWidth(23);
    obj.BotaomaFlight:setHeight(25);
    obj.BotaomaFlight:setText("i");
    obj.BotaomaFlight:setName("BotaomaFlight");

    obj.checkBox85 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout29);
    obj.checkBox85:setLeft(020);
    obj.checkBox85:setTop(100);
    obj.checkBox85:setHeight(20);
    obj.checkBox85:setWidth(100);
    obj.checkBox85:setText("SOS-Lose");
    obj.checkBox85:setField("maFlightSOSL");
    obj.checkBox85:setName("checkBox85");

    obj.checkBox86 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout29);
    obj.checkBox86:setLeft(120);
    obj.checkBox86:setTop(100);
    obj.checkBox86:setHeight(20);
    obj.checkBox86:setWidth(100);
    obj.checkBox86:setText("SOS-Gain");
    obj.checkBox86:setField("maFlightSOSG");
    obj.checkBox86:setName("checkBox86");

    obj.checkBox87 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout29);
    obj.checkBox87:setLeft(020);
    obj.checkBox87:setTop(125);
    obj.checkBox87:setHeight(20);
    obj.checkBox87:setWidth(100);
    obj.checkBox87:setText("MP Cost");
    obj.checkBox87:setField("maFlightMP");
    obj.checkBox87:setName("checkBox87");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout29);
    obj.edit232:setLeft(120);
    obj.edit232:setTop(125);
    obj.edit232:setHeight(20);
    obj.edit232:setWidth(40);
    obj.edit232:setField("maFlightMPCost");
    obj.edit232:setHorzTextAlign("center");
    obj.edit232:setEnabled(false);
    obj.edit232:setName("edit232");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox4);
    obj.layout30:setLeft(400);
    obj.layout30:setTop(400);
    obj.layout30:setHeight(150);
    obj.layout30:setWidth(250);
    obj.layout30:setName("layout30");

    obj.popAbilitymaGround = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitymaGround:setParent(obj.layout30);
    obj.popAbilitymaGround:setName("popAbilitymaGround");
    obj.popAbilitymaGround:setWidth(300);
    obj.popAbilitymaGround:setHeight(200);
    obj.popAbilitymaGround:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitymaGround, "autoScopeNode",  "false");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.popAbilitymaGround);
    obj.label117:setLeft(05);
    obj.label117:setTop(5);
    obj.label117:setWidth(60);
    obj.label117:setHeight(20);
    obj.label117:setText("Descrição:");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.popAbilitymaGround);
    obj.textEditor17:setLeft(005);
    obj.textEditor17:setTop(30);
    obj.textEditor17:setHeight(165);
    obj.textEditor17:setWidth(290);
    obj.textEditor17:setField("DescricaomaGround");
    obj.textEditor17:setText("The monster has the ability to move on land. Standard Movement Ability for most monsters.");
    obj.textEditor17:setName("textEditor17");

    obj.checkBox88 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout30);
    obj.checkBox88:setLeft(000);
    obj.checkBox88:setTop(000);
    obj.checkBox88:setHeight(20);
    obj.checkBox88:setWidth(120);
    obj.checkBox88:setText("Move-Ground");
    obj.checkBox88:setField("maGround");
    obj.checkBox88:setName("checkBox88");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout30);
    obj.dataLink27:setField("maGround");
    obj.dataLink27:setDefaultValue("True");
    obj.dataLink27:setName("dataLink27");

    obj.BotaomaGround = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaomaGround:setParent(obj.layout30);
    obj.BotaomaGround:setLeft(175);
    obj.BotaomaGround:setTop(000);
    obj.BotaomaGround:setWidth(23);
    obj.BotaomaGround:setHeight(25);
    obj.BotaomaGround:setText("i");
    obj.BotaomaGround:setName("BotaomaGround");

    obj.checkBox89 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout30);
    obj.checkBox89:setLeft(020);
    obj.checkBox89:setTop(025);
    obj.checkBox89:setHeight(20);
    obj.checkBox89:setWidth(100);
    obj.checkBox89:setText("SOS-Lose");
    obj.checkBox89:setField("maGroundSOSL");
    obj.checkBox89:setName("checkBox89");

    obj.checkBox90 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout30);
    obj.checkBox90:setLeft(120);
    obj.checkBox90:setTop(025);
    obj.checkBox90:setHeight(20);
    obj.checkBox90:setWidth(100);
    obj.checkBox90:setText("SOS-Gain");
    obj.checkBox90:setField("maGroundSOSG");
    obj.checkBox90:setName("checkBox90");

    obj.checkBox91 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout30);
    obj.checkBox91:setLeft(020);
    obj.checkBox91:setTop(050);
    obj.checkBox91:setHeight(20);
    obj.checkBox91:setWidth(100);
    obj.checkBox91:setText("MP Cost");
    obj.checkBox91:setField("maGroundMP");
    obj.checkBox91:setName("checkBox91");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout30);
    obj.edit233:setLeft(120);
    obj.edit233:setTop(050);
    obj.edit233:setHeight(20);
    obj.edit233:setWidth(40);
    obj.edit233:setField("valLV");
    obj.edit233:setHorzTextAlign("center");
    obj.edit233:setEnabled(false);
    obj.edit233:setName("edit233");

    obj.popAbilitymaFloat = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitymaFloat:setParent(obj.layout30);
    obj.popAbilitymaFloat:setName("popAbilitymaFloat");
    obj.popAbilitymaFloat:setWidth(300);
    obj.popAbilitymaFloat:setHeight(200);
    obj.popAbilitymaFloat:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitymaFloat, "autoScopeNode",  "false");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.popAbilitymaFloat);
    obj.label118:setLeft(05);
    obj.label118:setTop(5);
    obj.label118:setWidth(60);
    obj.label118:setHeight(20);
    obj.label118:setText("Descrição:");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.popAbilitymaFloat);
    obj.textEditor18:setLeft(005);
    obj.textEditor18:setTop(30);
    obj.textEditor18:setHeight(165);
    obj.textEditor18:setWidth(290);
    obj.textEditor18:setField("DescricaomaFloat");
    obj.textEditor18:setText("The monster levitates, hovering up to one meter off the ground as if afflicted with a permanent Float effect. Unlike the Status Condition of the same name, this Float may not be dispelled or otherwise removed during the course of the battle, except through the use of effects like the Time Magic Spell Drag.");
    obj.textEditor18:setName("textEditor18");

    obj.checkBox92 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout30);
    obj.checkBox92:setLeft(000);
    obj.checkBox92:setTop(075);
    obj.checkBox92:setHeight(20);
    obj.checkBox92:setWidth(120);
    obj.checkBox92:setText("Move-Float");
    obj.checkBox92:setField("maFloat");
    obj.checkBox92:setName("checkBox92");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout30);
    obj.dataLink28:setField("maGround");
    obj.dataLink28:setDefaultValue("True");
    obj.dataLink28:setName("dataLink28");

    obj.BotaomaFloat = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaomaFloat:setParent(obj.layout30);
    obj.BotaomaFloat:setLeft(175);
    obj.BotaomaFloat:setTop(075);
    obj.BotaomaFloat:setWidth(23);
    obj.BotaomaFloat:setHeight(25);
    obj.BotaomaFloat:setText("i");
    obj.BotaomaFloat:setName("BotaomaFloat");

    obj.checkBox93 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout30);
    obj.checkBox93:setLeft(020);
    obj.checkBox93:setTop(100);
    obj.checkBox93:setHeight(20);
    obj.checkBox93:setWidth(100);
    obj.checkBox93:setText("SOS-Lose");
    obj.checkBox93:setField("maFloatSOSL");
    obj.checkBox93:setName("checkBox93");

    obj.checkBox94 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout30);
    obj.checkBox94:setLeft(120);
    obj.checkBox94:setTop(100);
    obj.checkBox94:setHeight(20);
    obj.checkBox94:setWidth(100);
    obj.checkBox94:setText("SOS-Gain");
    obj.checkBox94:setField("maFloatSOSG");
    obj.checkBox94:setName("checkBox94");

    obj.checkBox95 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout30);
    obj.checkBox95:setLeft(020);
    obj.checkBox95:setTop(125);
    obj.checkBox95:setHeight(20);
    obj.checkBox95:setWidth(100);
    obj.checkBox95:setText("MP Cost");
    obj.checkBox95:setField("maFloatMP");
    obj.checkBox95:setName("checkBox95");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout30);
    obj.edit234:setLeft(120);
    obj.edit234:setTop(125);
    obj.edit234:setHeight(20);
    obj.edit234:setWidth(40);
    obj.edit234:setField("maFloatMPCost");
    obj.edit234:setHorzTextAlign("center");
    obj.edit234:setEnabled(false);
    obj.edit234:setName("edit234");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox4);
    obj.layout31:setLeft(700);
    obj.layout31:setTop(400);
    obj.layout31:setHeight(150);
    obj.layout31:setWidth(250);
    obj.layout31:setName("layout31");

    obj.popAbilitymaTeleport = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitymaTeleport:setParent(obj.layout31);
    obj.popAbilitymaTeleport:setName("popAbilitymaTeleport");
    obj.popAbilitymaTeleport:setWidth(300);
    obj.popAbilitymaTeleport:setHeight(200);
    obj.popAbilitymaTeleport:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitymaTeleport, "autoScopeNode",  "false");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.popAbilitymaTeleport);
    obj.label119:setLeft(05);
    obj.label119:setTop(5);
    obj.label119:setWidth(60);
    obj.label119:setHeight(20);
    obj.label119:setText("Descrição:");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.popAbilitymaTeleport);
    obj.textEditor19:setLeft(005);
    obj.textEditor19:setTop(30);
    obj.textEditor19:setHeight(165);
    obj.textEditor19:setWidth(290);
    obj.textEditor19:setField("DescricaomaTeleport");
    obj.textEditor19:setText("The monster is capable of displacing itself through space, moving from one location to the next in the blink of an eye. While this has no effect on a monster's movement range, it does confer two important advantages. \n Firstly, if the monster is targeted by a Singletarget Slow Action and teleports before it goes off, the Action has no effect – the monster is assumed to have relocated far enough away to avoid any ill effects. Secondly, the monster's SPD Rating is doubled when the players roll to Escape, making it significantly harder to run from. As it is a natural ability rather than a Spell, Move-Teleport cannot be sealed through the use of Status Conditions.");
    obj.textEditor19:setName("textEditor19");

    obj.checkBox96 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout31);
    obj.checkBox96:setLeft(000);
    obj.checkBox96:setTop(000);
    obj.checkBox96:setHeight(20);
    obj.checkBox96:setWidth(120);
    obj.checkBox96:setText("Move-Teleport");
    obj.checkBox96:setField("maTeleport");
    obj.checkBox96:setName("checkBox96");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout31);
    obj.dataLink29:setField("maGround");
    obj.dataLink29:setDefaultValue("True");
    obj.dataLink29:setName("dataLink29");

    obj.BotaomaTeleport = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaomaTeleport:setParent(obj.layout31);
    obj.BotaomaTeleport:setLeft(175);
    obj.BotaomaTeleport:setTop(000);
    obj.BotaomaTeleport:setWidth(23);
    obj.BotaomaTeleport:setHeight(25);
    obj.BotaomaTeleport:setText("i");
    obj.BotaomaTeleport:setName("BotaomaTeleport");

    obj.checkBox97 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout31);
    obj.checkBox97:setLeft(020);
    obj.checkBox97:setTop(025);
    obj.checkBox97:setHeight(20);
    obj.checkBox97:setWidth(100);
    obj.checkBox97:setText("SOS-Lose");
    obj.checkBox97:setField("maTeleportSOSL");
    obj.checkBox97:setName("checkBox97");

    obj.checkBox98 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout31);
    obj.checkBox98:setLeft(120);
    obj.checkBox98:setTop(025);
    obj.checkBox98:setHeight(20);
    obj.checkBox98:setWidth(100);
    obj.checkBox98:setText("SOS-Gain");
    obj.checkBox98:setField("maTeleportSOSG");
    obj.checkBox98:setName("checkBox98");

    obj.checkBox99 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout31);
    obj.checkBox99:setLeft(020);
    obj.checkBox99:setTop(050);
    obj.checkBox99:setHeight(20);
    obj.checkBox99:setWidth(100);
    obj.checkBox99:setText("MP Cost");
    obj.checkBox99:setField("maTeleportMP");
    obj.checkBox99:setName("checkBox99");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout31);
    obj.edit235:setLeft(120);
    obj.edit235:setTop(050);
    obj.edit235:setHeight(20);
    obj.edit235:setWidth(40);
    obj.edit235:setField("maTeleportMPCost");
    obj.edit235:setHorzTextAlign("center");
    obj.edit235:setEnabled(false);
    obj.edit235:setName("edit235");

    obj.popAbilitymaWater = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitymaWater:setParent(obj.layout31);
    obj.popAbilitymaWater:setName("popAbilitymaWater");
    obj.popAbilitymaWater:setWidth(300);
    obj.popAbilitymaWater:setHeight(200);
    obj.popAbilitymaWater:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitymaWater, "autoScopeNode",  "false");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.popAbilitymaWater);
    obj.label120:setLeft(05);
    obj.label120:setTop(5);
    obj.label120:setWidth(60);
    obj.label120:setHeight(20);
    obj.label120:setText("Descrição:");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.popAbilitymaWater);
    obj.textEditor20:setLeft(005);
    obj.textEditor20:setTop(30);
    obj.textEditor20:setHeight(165);
    obj.textEditor20:setWidth(290);
    obj.textEditor20:setField("DescricaomaWater");
    obj.textEditor20:setText("A monster with Move-Water is be able to effectively drift, float, and swim in a submarine environment, ignoring all penalties for moving through Shallow and Deep Water as well as being able to act Underwater without penalties. However, without the Move-Ground Movement Ability, they cannot venture onto dry land");
    obj.textEditor20:setName("textEditor20");

    obj.checkBox100 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout31);
    obj.checkBox100:setLeft(000);
    obj.checkBox100:setTop(075);
    obj.checkBox100:setHeight(20);
    obj.checkBox100:setWidth(120);
    obj.checkBox100:setText("Move-Water");
    obj.checkBox100:setField("maWater");
    obj.checkBox100:setName("checkBox100");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout31);
    obj.dataLink30:setField("maGround");
    obj.dataLink30:setDefaultValue("True");
    obj.dataLink30:setName("dataLink30");

    obj.BotaomaWater = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaomaWater:setParent(obj.layout31);
    obj.BotaomaWater:setLeft(175);
    obj.BotaomaWater:setTop(075);
    obj.BotaomaWater:setWidth(23);
    obj.BotaomaWater:setHeight(25);
    obj.BotaomaWater:setText("i");
    obj.BotaomaWater:setName("BotaomaWater");

    obj.checkBox101 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout31);
    obj.checkBox101:setLeft(020);
    obj.checkBox101:setTop(100);
    obj.checkBox101:setHeight(20);
    obj.checkBox101:setWidth(100);
    obj.checkBox101:setText("SOS-Lose");
    obj.checkBox101:setField("maWaterSOSL");
    obj.checkBox101:setName("checkBox101");

    obj.checkBox102 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout31);
    obj.checkBox102:setLeft(120);
    obj.checkBox102:setTop(100);
    obj.checkBox102:setHeight(20);
    obj.checkBox102:setWidth(100);
    obj.checkBox102:setText("SOS-Gain");
    obj.checkBox102:setField("maWaterSOSG");
    obj.checkBox102:setName("checkBox102");

    obj.checkBox103 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout31);
    obj.checkBox103:setLeft(020);
    obj.checkBox103:setTop(125);
    obj.checkBox103:setHeight(20);
    obj.checkBox103:setWidth(100);
    obj.checkBox103:setText("MP Cost");
    obj.checkBox103:setField("maWaterMP");
    obj.checkBox103:setName("checkBox103");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout31);
    obj.edit236:setLeft(120);
    obj.edit236:setTop(125);
    obj.edit236:setHeight(20);
    obj.edit236:setWidth(40);
    obj.edit236:setField("valLV");
    obj.edit236:setHorzTextAlign("center");
    obj.edit236:setEnabled(false);
    obj.edit236:setName("edit236");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox4);
    obj.layout32:setLeft(1000);
    obj.layout32:setTop(570);
    obj.layout32:setHeight(50);
    obj.layout32:setWidth(90);
    obj.layout32:setName("layout32");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout32);
    obj.label121:setLeft(000);
    obj.label121:setTop(000);
    obj.label121:setHeight(20);
    obj.label121:setWidth(30);
    obj.label121:setText("Exp");
    obj.label121:setAutoSize(true);
    obj.label121:setName("label121");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout32);
    obj.edit237:setLeft(035);
    obj.edit237:setTop(000);
    obj.edit237:setHeight(20);
    obj.edit237:setWidth(50);
    obj.edit237:setField("ExpFinal");
    obj.edit237:setHorzTextAlign("center");
    obj.edit237:setName("edit237");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout32);
    obj.label122:setLeft(000);
    obj.label122:setTop(025);
    obj.label122:setHeight(20);
    obj.label122:setWidth(30);
    obj.label122:setText("Gil");
    obj.label122:setAutoSize(true);
    obj.label122:setName("label122");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout32);
    obj.edit238:setLeft(35);
    obj.edit238:setTop(025);
    obj.edit238:setHeight(20);
    obj.edit238:setWidth(50);
    obj.edit238:setField("GilFinal");
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setName("edit238");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Support A");
    obj.tab5:setName("tab5");

    obj.frmSupportA = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSupportA:setParent(obj.tab5);
    obj.frmSupportA:setName("frmSupportA");
    obj.frmSupportA:setAlign("client");
    obj.frmSupportA:setTheme("dark");
    obj.frmSupportA:setMargins({top=1});

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.frmSupportA);
    obj.layout33:setLeft(000);
    obj.layout33:setTop(000);
    obj.layout33:setHeight(650);
    obj.layout33:setWidth(1100);
    obj.layout33:setName("layout33");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout33);
    obj.image6:setLeft(000);
    obj.image6:setTop(000);
    obj.image6:setHeight(650);
    obj.image6:setWidth(1100);
    obj.image6:setSRC("/img/wallpaper.png");
    obj.image6:setStyle("autoFit");
    obj.image6:setName("image6");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmSupportA);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox5);
    obj.layout34:setLeft(60);
    obj.layout34:setTop(20);
    obj.layout34:setHeight(500);
    obj.layout34:setWidth(380);
    obj.layout34:setName("layout34");

    obj.popAbilitynameAutoStat = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynameAutoStat:setParent(obj.layout34);
    obj.popAbilitynameAutoStat:setName("popAbilitynameAutoStat");
    obj.popAbilitynameAutoStat:setWidth(300);
    obj.popAbilitynameAutoStat:setHeight(200);
    obj.popAbilitynameAutoStat:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynameAutoStat, "autoScopeNode",  "false");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.popAbilitynameAutoStat);
    obj.label123:setLeft(05);
    obj.label123:setTop(5);
    obj.label123:setWidth(60);
    obj.label123:setHeight(20);
    obj.label123:setText("Descrição:");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.popAbilitynameAutoStat);
    obj.textEditor21:setLeft(005);
    obj.textEditor21:setTop(30);
    obj.textEditor21:setHeight(165);
    obj.textEditor21:setWidth(290);
    obj.textEditor21:setField("DescricaonameAutoStat");
    obj.textEditor21:setText("The monster is permanently under the effects of a certain Status Condition, and begins the battle with that Condition active.  This Condition can be removed through the use of Spells or Abilities such as Dispel; but will be re-added during the next Status Phase and only fully cancelled once the monster is defeated.  Auto-Status can be taken in conjunction with both positive and negative Status Conditions. XP and Gil values depend on the exact Status being taken:");
    obj.textEditor21:setName("textEditor21");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout34);
    obj.label124:setLeft(000);
    obj.label124:setTop(000);
    obj.label124:setHeight(20);
    obj.label124:setWidth(150);
    obj.label124:setText("Auto-Status");
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setName("label124");

    obj.BotaonameAutoStat = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonameAutoStat:setParent(obj.layout34);
    obj.BotaonameAutoStat:setLeft(100);
    obj.BotaonameAutoStat:setTop(000);
    obj.BotaonameAutoStat:setWidth(23);
    obj.BotaonameAutoStat:setHeight(25);
    obj.BotaonameAutoStat:setText("i");
    obj.BotaonameAutoStat:setName("BotaonameAutoStat");

    obj.checkBox104 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout34);
    obj.checkBox104:setLeft(000);
    obj.checkBox104:setTop(025);
    obj.checkBox104:setHeight(20);
    obj.checkBox104:setWidth(120);
    obj.checkBox104:setText("Float");
    obj.checkBox104:setField("autoFloat");
    obj.checkBox104:setName("checkBox104");

    obj.checkBox105 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout34);
    obj.checkBox105:setLeft(000);
    obj.checkBox105:setTop(050);
    obj.checkBox105:setHeight(20);
    obj.checkBox105:setWidth(120);
    obj.checkBox105:setText("Agility Up");
    obj.checkBox105:setField("autoAgiUP");
    obj.checkBox105:setName("checkBox105");

    obj.checkBox106 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout34);
    obj.checkBox106:setLeft(000);
    obj.checkBox106:setTop(075);
    obj.checkBox106:setHeight(20);
    obj.checkBox106:setWidth(120);
    obj.checkBox106:setText("Spirit Up");
    obj.checkBox106:setField("autoSpiUP");
    obj.checkBox106:setName("checkBox106");

    obj.checkBox107 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout34);
    obj.checkBox107:setLeft(000);
    obj.checkBox107:setTop(100);
    obj.checkBox107:setHeight(20);
    obj.checkBox107:setWidth(120);
    obj.checkBox107:setText("Fire Spikes");
    obj.checkBox107:setField("autoFIRSpikes");
    obj.checkBox107:setName("checkBox107");

    obj.checkBox108 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout34);
    obj.checkBox108:setLeft(000);
    obj.checkBox108:setTop(125);
    obj.checkBox108:setHeight(20);
    obj.checkBox108:setWidth(120);
    obj.checkBox108:setText("Ice Spikes");
    obj.checkBox108:setField("autoICESpikes");
    obj.checkBox108:setName("checkBox108");

    obj.checkBox109 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout34);
    obj.checkBox109:setLeft(000);
    obj.checkBox109:setTop(150);
    obj.checkBox109:setHeight(20);
    obj.checkBox109:setWidth(120);
    obj.checkBox109:setText("Water Spikes");
    obj.checkBox109:setField("autoWATSpikes");
    obj.checkBox109:setName("checkBox109");

    obj.checkBox110 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout34);
    obj.checkBox110:setLeft(000);
    obj.checkBox110:setTop(175);
    obj.checkBox110:setHeight(20);
    obj.checkBox110:setWidth(120);
    obj.checkBox110:setText("Lightning Spikes");
    obj.checkBox110:setField("autoELESpikes");
    obj.checkBox110:setName("checkBox110");

    obj.checkBox111 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout34);
    obj.checkBox111:setLeft(000);
    obj.checkBox111:setTop(200);
    obj.checkBox111:setHeight(20);
    obj.checkBox111:setWidth(120);
    obj.checkBox111:setText("Ground Spikes");
    obj.checkBox111:setField("autoGNDSpikes");
    obj.checkBox111:setName("checkBox111");

    obj.checkBox112 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.layout34);
    obj.checkBox112:setLeft(000);
    obj.checkBox112:setTop(225);
    obj.checkBox112:setHeight(20);
    obj.checkBox112:setWidth(120);
    obj.checkBox112:setText("Wind Spikes");
    obj.checkBox112:setField("autoWINSpikes");
    obj.checkBox112:setName("checkBox112");

    obj.checkBox113 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.layout34);
    obj.checkBox113:setLeft(000);
    obj.checkBox113:setTop(250);
    obj.checkBox113:setHeight(20);
    obj.checkBox113:setWidth(120);
    obj.checkBox113:setText("Bio Spikes");
    obj.checkBox113:setField("autoBIOSpikes");
    obj.checkBox113:setName("checkBox113");

    obj.checkBox114 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.layout34);
    obj.checkBox114:setLeft(000);
    obj.checkBox114:setTop(275);
    obj.checkBox114:setHeight(20);
    obj.checkBox114:setWidth(120);
    obj.checkBox114:setText("Shadow Spikes");
    obj.checkBox114:setField("autoSHASpikes");
    obj.checkBox114:setName("checkBox114");

    obj.checkBox115 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.layout34);
    obj.checkBox115:setLeft(000);
    obj.checkBox115:setTop(300);
    obj.checkBox115:setHeight(20);
    obj.checkBox115:setWidth(120);
    obj.checkBox115:setText("Holy Spikes");
    obj.checkBox115:setField("autoHOLSpikes");
    obj.checkBox115:setName("checkBox115");

    obj.checkBox116 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.layout34);
    obj.checkBox116:setLeft(000);
    obj.checkBox116:setTop(325);
    obj.checkBox116:setHeight(20);
    obj.checkBox116:setWidth(120);
    obj.checkBox116:setText("Protect");
    obj.checkBox116:setField("autoProtect");
    obj.checkBox116:setName("checkBox116");

    obj.checkBox117 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.layout34);
    obj.checkBox117:setLeft(000);
    obj.checkBox117:setTop(350);
    obj.checkBox117:setHeight(20);
    obj.checkBox117:setWidth(120);
    obj.checkBox117:setText("Shell");
    obj.checkBox117:setField("autoShell");
    obj.checkBox117:setName("checkBox117");

    obj.checkBox118 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.layout34);
    obj.checkBox118:setLeft(000);
    obj.checkBox118:setTop(375);
    obj.checkBox118:setHeight(20);
    obj.checkBox118:setWidth(120);
    obj.checkBox118:setText("Armor Up");
    obj.checkBox118:setField("autoARMUP");
    obj.checkBox118:setName("checkBox118");

    obj.checkBox119 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.layout34);
    obj.checkBox119:setLeft(000);
    obj.checkBox119:setTop(400);
    obj.checkBox119:setHeight(20);
    obj.checkBox119:setWidth(120);
    obj.checkBox119:setText("Mental Up");
    obj.checkBox119:setField("autoMENUP");
    obj.checkBox119:setName("checkBox119");

    obj.checkBox120 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.layout34);
    obj.checkBox120:setLeft(000);
    obj.checkBox120:setTop(425);
    obj.checkBox120:setHeight(20);
    obj.checkBox120:setWidth(120);
    obj.checkBox120:setText("Haste");
    obj.checkBox120:setField("autoHaste");
    obj.checkBox120:setName("checkBox120");

    obj.checkBox121 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.layout34);
    obj.checkBox121:setLeft(000);
    obj.checkBox121:setTop(450);
    obj.checkBox121:setHeight(20);
    obj.checkBox121:setWidth(120);
    obj.checkBox121:setText("Reflect");
    obj.checkBox121:setField("autoReflect");
    obj.checkBox121:setName("checkBox121");

    obj.checkBox122 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.layout34);
    obj.checkBox122:setLeft(000);
    obj.checkBox122:setTop(475);
    obj.checkBox122:setHeight(20);
    obj.checkBox122:setWidth(120);
    obj.checkBox122:setText("Power Up");
    obj.checkBox122:setField("autoPOWUP");
    obj.checkBox122:setName("checkBox122");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox5);
    obj.layout35:setLeft(200);
    obj.layout35:setTop(20);
    obj.layout35:setHeight(500);
    obj.layout35:setWidth(380);
    obj.layout35:setName("layout35");

    obj.checkBox123 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.layout35);
    obj.checkBox123:setLeft(000);
    obj.checkBox123:setTop(025);
    obj.checkBox123:setHeight(20);
    obj.checkBox123:setWidth(120);
    obj.checkBox123:setText("Magic Up");
    obj.checkBox123:setField("autoMAGUP");
    obj.checkBox123:setName("checkBox123");

    obj.checkBox124 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.layout35);
    obj.checkBox124:setLeft(000);
    obj.checkBox124:setTop(050);
    obj.checkBox124:setHeight(20);
    obj.checkBox124:setWidth(120);
    obj.checkBox124:setText("Regen");
    obj.checkBox124:setField("autoRegen");
    obj.checkBox124:setName("checkBox124");

    obj.checkBox125 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.layout35);
    obj.checkBox125:setLeft(000);
    obj.checkBox125:setTop(075);
    obj.checkBox125:setHeight(20);
    obj.checkBox125:setWidth(120);
    obj.checkBox125:setText("Aura");
    obj.checkBox125:setField("autoAura");
    obj.checkBox125:setName("checkBox125");

    obj.checkBox126 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox126:setParent(obj.layout35);
    obj.checkBox126:setLeft(000);
    obj.checkBox126:setTop(100);
    obj.checkBox126:setHeight(20);
    obj.checkBox126:setWidth(120);
    obj.checkBox126:setText("Vanish");
    obj.checkBox126:setField("autoVanish");
    obj.checkBox126:setName("checkBox126");

    obj.checkBox127 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox127:setParent(obj.layout35);
    obj.checkBox127:setLeft(000);
    obj.checkBox127:setTop(125);
    obj.checkBox127:setHeight(20);
    obj.checkBox127:setWidth(120);
    obj.checkBox127:setText("Berserk");
    obj.checkBox127:setField("autoBerserk");
    obj.checkBox127:setName("checkBox127");

    obj.checkBox128 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox128:setParent(obj.layout35);
    obj.checkBox128:setLeft(000);
    obj.checkBox128:setTop(150);
    obj.checkBox128:setHeight(20);
    obj.checkBox128:setWidth(120);
    obj.checkBox128:setText("Blind");
    obj.checkBox128:setField("autoBlind");
    obj.checkBox128:setName("checkBox128");

    obj.checkBox129 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox129:setParent(obj.layout35);
    obj.checkBox129:setLeft(000);
    obj.checkBox129:setTop(175);
    obj.checkBox129:setHeight(20);
    obj.checkBox129:setWidth(120);
    obj.checkBox129:setText("Poison");
    obj.checkBox129:setField("autoPoison");
    obj.checkBox129:setName("checkBox129");

    obj.checkBox130 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox130:setParent(obj.layout35);
    obj.checkBox130:setLeft(000);
    obj.checkBox130:setTop(200);
    obj.checkBox130:setHeight(20);
    obj.checkBox130:setWidth(120);
    obj.checkBox130:setText("Sleep");
    obj.checkBox130:setField("autoSleep");
    obj.checkBox130:setName("checkBox130");

    obj.checkBox131 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox131:setParent(obj.layout35);
    obj.checkBox131:setLeft(000);
    obj.checkBox131:setTop(225);
    obj.checkBox131:setHeight(20);
    obj.checkBox131:setWidth(120);
    obj.checkBox131:setText("Slow");
    obj.checkBox131:setField("autoSlow");
    obj.checkBox131:setName("checkBox131");

    obj.checkBox132 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox132:setParent(obj.layout35);
    obj.checkBox132:setLeft(000);
    obj.checkBox132:setTop(250);
    obj.checkBox132:setHeight(20);
    obj.checkBox132:setWidth(120);
    obj.checkBox132:setText("Zombie");
    obj.checkBox132:setField("autoZombie");
    obj.checkBox132:setName("checkBox132");

    obj.checkBox133 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox133:setParent(obj.layout35);
    obj.checkBox133:setLeft(000);
    obj.checkBox133:setTop(275);
    obj.checkBox133:setHeight(20);
    obj.checkBox133:setWidth(120);
    obj.checkBox133:setText("Confuse");
    obj.checkBox133:setField("autoConfuse");
    obj.checkBox133:setName("checkBox133");

    obj.checkBox134 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox134:setParent(obj.layout35);
    obj.checkBox134:setLeft(000);
    obj.checkBox134:setTop(300);
    obj.checkBox134:setHeight(20);
    obj.checkBox134:setWidth(120);
    obj.checkBox134:setText("Sap");
    obj.checkBox134:setField("autoSap");
    obj.checkBox134:setName("checkBox134");

    obj.checkBox135 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox135:setParent(obj.layout35);
    obj.checkBox135:setLeft(000);
    obj.checkBox135:setTop(325);
    obj.checkBox135:setHeight(20);
    obj.checkBox135:setWidth(120);
    obj.checkBox135:setText("Unaware");
    obj.checkBox135:setField("autoUnaware");
    obj.checkBox135:setName("checkBox135");

    obj.checkBox136 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox136:setParent(obj.layout35);
    obj.checkBox136:setLeft(000);
    obj.checkBox136:setTop(350);
    obj.checkBox136:setHeight(20);
    obj.checkBox136:setWidth(120);
    obj.checkBox136:setText("Mini");
    obj.checkBox136:setField("autoMini");
    obj.checkBox136:setName("checkBox136");

    obj.checkBox137 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox137:setParent(obj.layout35);
    obj.checkBox137:setLeft(000);
    obj.checkBox137:setTop(375);
    obj.checkBox137:setHeight(20);
    obj.checkBox137:setWidth(120);
    obj.checkBox137:setText("Toad");
    obj.checkBox137:setField("autoToad");
    obj.checkBox137:setName("checkBox137");

    obj.checkBox138 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox138:setParent(obj.layout35);
    obj.checkBox138:setLeft(000);
    obj.checkBox138:setTop(400);
    obj.checkBox138:setHeight(20);
    obj.checkBox138:setWidth(120);
    obj.checkBox138:setText("Venom");
    obj.checkBox138:setField("autoVenom");
    obj.checkBox138:setName("checkBox138");

    obj.checkBox139 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.layout35);
    obj.checkBox139:setLeft(000);
    obj.checkBox139:setTop(425);
    obj.checkBox139:setHeight(20);
    obj.checkBox139:setWidth(120);
    obj.checkBox139:setText("Condemn");
    obj.checkBox139:setField("autoCondemn");
    obj.checkBox139:setName("checkBox139");

    obj.checkBox140 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.layout35);
    obj.checkBox140:setLeft(000);
    obj.checkBox140:setTop(450);
    obj.checkBox140:setHeight(20);
    obj.checkBox140:setWidth(120);
    obj.checkBox140:setText("Petrify");
    obj.checkBox140:setField("autoPetrify");
    obj.checkBox140:setName("checkBox140");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox5);
    obj.layout36:setLeft(350);
    obj.layout36:setTop(20);
    obj.layout36:setHeight(500);
    obj.layout36:setWidth(380);
    obj.layout36:setName("layout36");

    obj.popAbilitynameSOSStat = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynameSOSStat:setParent(obj.layout36);
    obj.popAbilitynameSOSStat:setName("popAbilitynameSOSStat");
    obj.popAbilitynameSOSStat:setWidth(300);
    obj.popAbilitynameSOSStat:setHeight(200);
    obj.popAbilitynameSOSStat:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynameSOSStat, "autoScopeNode",  "false");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.popAbilitynameSOSStat);
    obj.label125:setLeft(05);
    obj.label125:setTop(5);
    obj.label125:setWidth(60);
    obj.label125:setHeight(20);
    obj.label125:setText("Descrição:");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.popAbilitynameSOSStat);
    obj.textEditor22:setLeft(005);
    obj.textEditor22:setTop(30);
    obj.textEditor22:setHeight(165);
    obj.textEditor22:setWidth(290);
    obj.textEditor22:setField("DescricaonameSOSStat");
    obj.textEditor22:setText("The monster is subject to a certain Status Condition, activated when its current Hit Points reach 25% of their maximum value.  As with Auto-Status, a Status Condition inflicted by SOS-Status can be removed through the use of Spells or Abilities such as Dispel;  but will be re-added during the next Status Phase and only fully cancelled once the monster is defeated. Should the monster be healed to above 25% of its maximum Hit Points, the Condition will cancel automatically.  SOS-Status can be taken in conjunction with both positive and negative Status Conditions. XP and Gil values depend on the exact Status being taken:");
    obj.textEditor22:setName("textEditor22");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout36);
    obj.label126:setLeft(000);
    obj.label126:setTop(000);
    obj.label126:setHeight(20);
    obj.label126:setWidth(150);
    obj.label126:setText("SOS-Status");
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setName("label126");

    obj.BotaonameSOSStat = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonameSOSStat:setParent(obj.layout36);
    obj.BotaonameSOSStat:setLeft(100);
    obj.BotaonameSOSStat:setTop(000);
    obj.BotaonameSOSStat:setWidth(23);
    obj.BotaonameSOSStat:setHeight(25);
    obj.BotaonameSOSStat:setText("i");
    obj.BotaonameSOSStat:setName("BotaonameSOSStat");

    obj.checkBox141 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.layout36);
    obj.checkBox141:setLeft(000);
    obj.checkBox141:setTop(025);
    obj.checkBox141:setHeight(20);
    obj.checkBox141:setWidth(120);
    obj.checkBox141:setText("Float");
    obj.checkBox141:setField("sosFloat");
    obj.checkBox141:setName("checkBox141");

    obj.checkBox142 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox142:setParent(obj.layout36);
    obj.checkBox142:setLeft(000);
    obj.checkBox142:setTop(050);
    obj.checkBox142:setHeight(20);
    obj.checkBox142:setWidth(120);
    obj.checkBox142:setText("Agility Up");
    obj.checkBox142:setField("sosAgiUP");
    obj.checkBox142:setName("checkBox142");

    obj.checkBox143 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox143:setParent(obj.layout36);
    obj.checkBox143:setLeft(000);
    obj.checkBox143:setTop(075);
    obj.checkBox143:setHeight(20);
    obj.checkBox143:setWidth(120);
    obj.checkBox143:setText("Spirit Up");
    obj.checkBox143:setField("sosSpiUP");
    obj.checkBox143:setName("checkBox143");

    obj.checkBox144 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox144:setParent(obj.layout36);
    obj.checkBox144:setLeft(000);
    obj.checkBox144:setTop(100);
    obj.checkBox144:setHeight(20);
    obj.checkBox144:setWidth(120);
    obj.checkBox144:setText("Fire Spikes");
    obj.checkBox144:setField("sosFIRSpikes");
    obj.checkBox144:setName("checkBox144");

    obj.checkBox145 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox145:setParent(obj.layout36);
    obj.checkBox145:setLeft(000);
    obj.checkBox145:setTop(125);
    obj.checkBox145:setHeight(20);
    obj.checkBox145:setWidth(120);
    obj.checkBox145:setText("Ice Spikes");
    obj.checkBox145:setField("sosICESpikes");
    obj.checkBox145:setName("checkBox145");

    obj.checkBox146 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox146:setParent(obj.layout36);
    obj.checkBox146:setLeft(000);
    obj.checkBox146:setTop(150);
    obj.checkBox146:setHeight(20);
    obj.checkBox146:setWidth(120);
    obj.checkBox146:setText("Water Spikes");
    obj.checkBox146:setField("sosWATSpikes");
    obj.checkBox146:setName("checkBox146");

    obj.checkBox147 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox147:setParent(obj.layout36);
    obj.checkBox147:setLeft(000);
    obj.checkBox147:setTop(175);
    obj.checkBox147:setHeight(20);
    obj.checkBox147:setWidth(120);
    obj.checkBox147:setText("Lightning Spikes");
    obj.checkBox147:setField("sosELESpikes");
    obj.checkBox147:setName("checkBox147");

    obj.checkBox148 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox148:setParent(obj.layout36);
    obj.checkBox148:setLeft(000);
    obj.checkBox148:setTop(200);
    obj.checkBox148:setHeight(20);
    obj.checkBox148:setWidth(120);
    obj.checkBox148:setText("Ground Spikes");
    obj.checkBox148:setField("sosGNDSpikes");
    obj.checkBox148:setName("checkBox148");

    obj.checkBox149 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox149:setParent(obj.layout36);
    obj.checkBox149:setLeft(000);
    obj.checkBox149:setTop(225);
    obj.checkBox149:setHeight(20);
    obj.checkBox149:setWidth(120);
    obj.checkBox149:setText("Wind Spikes");
    obj.checkBox149:setField("sosWINSpikes");
    obj.checkBox149:setName("checkBox149");

    obj.checkBox150 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox150:setParent(obj.layout36);
    obj.checkBox150:setLeft(000);
    obj.checkBox150:setTop(250);
    obj.checkBox150:setHeight(20);
    obj.checkBox150:setWidth(120);
    obj.checkBox150:setText("Bio Spikes");
    obj.checkBox150:setField("sosBIOSpikes");
    obj.checkBox150:setName("checkBox150");

    obj.checkBox151 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox151:setParent(obj.layout36);
    obj.checkBox151:setLeft(000);
    obj.checkBox151:setTop(275);
    obj.checkBox151:setHeight(20);
    obj.checkBox151:setWidth(120);
    obj.checkBox151:setText("Shadow Spikes");
    obj.checkBox151:setField("sosSHASpikes");
    obj.checkBox151:setName("checkBox151");

    obj.checkBox152 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox152:setParent(obj.layout36);
    obj.checkBox152:setLeft(000);
    obj.checkBox152:setTop(300);
    obj.checkBox152:setHeight(20);
    obj.checkBox152:setWidth(120);
    obj.checkBox152:setText("Holy Spikes");
    obj.checkBox152:setField("sosHOLSpikes");
    obj.checkBox152:setName("checkBox152");

    obj.checkBox153 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox153:setParent(obj.layout36);
    obj.checkBox153:setLeft(000);
    obj.checkBox153:setTop(325);
    obj.checkBox153:setHeight(20);
    obj.checkBox153:setWidth(120);
    obj.checkBox153:setText("Protect");
    obj.checkBox153:setField("sosProtect");
    obj.checkBox153:setName("checkBox153");

    obj.checkBox154 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox154:setParent(obj.layout36);
    obj.checkBox154:setLeft(000);
    obj.checkBox154:setTop(350);
    obj.checkBox154:setHeight(20);
    obj.checkBox154:setWidth(120);
    obj.checkBox154:setText("Shell");
    obj.checkBox154:setField("sosShell");
    obj.checkBox154:setName("checkBox154");

    obj.checkBox155 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox155:setParent(obj.layout36);
    obj.checkBox155:setLeft(000);
    obj.checkBox155:setTop(375);
    obj.checkBox155:setHeight(20);
    obj.checkBox155:setWidth(120);
    obj.checkBox155:setText("Armor Up");
    obj.checkBox155:setField("sosARMUP");
    obj.checkBox155:setName("checkBox155");

    obj.checkBox156 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox156:setParent(obj.layout36);
    obj.checkBox156:setLeft(000);
    obj.checkBox156:setTop(400);
    obj.checkBox156:setHeight(20);
    obj.checkBox156:setWidth(120);
    obj.checkBox156:setText("Mental Up");
    obj.checkBox156:setField("sosMENUP");
    obj.checkBox156:setName("checkBox156");

    obj.checkBox157 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox157:setParent(obj.layout36);
    obj.checkBox157:setLeft(000);
    obj.checkBox157:setTop(425);
    obj.checkBox157:setHeight(20);
    obj.checkBox157:setWidth(120);
    obj.checkBox157:setText("Haste");
    obj.checkBox157:setField("sosHaste");
    obj.checkBox157:setName("checkBox157");

    obj.checkBox158 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox158:setParent(obj.layout36);
    obj.checkBox158:setLeft(000);
    obj.checkBox158:setTop(450);
    obj.checkBox158:setHeight(20);
    obj.checkBox158:setWidth(120);
    obj.checkBox158:setText("Reflect");
    obj.checkBox158:setField("sosReflect");
    obj.checkBox158:setName("checkBox158");

    obj.checkBox159 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox159:setParent(obj.layout36);
    obj.checkBox159:setLeft(000);
    obj.checkBox159:setTop(475);
    obj.checkBox159:setHeight(20);
    obj.checkBox159:setWidth(120);
    obj.checkBox159:setText("Power Up");
    obj.checkBox159:setField("sosPOWUP");
    obj.checkBox159:setName("checkBox159");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox5);
    obj.layout37:setLeft(490);
    obj.layout37:setTop(20);
    obj.layout37:setHeight(500);
    obj.layout37:setWidth(380);
    obj.layout37:setName("layout37");

    obj.checkBox160 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox160:setParent(obj.layout37);
    obj.checkBox160:setLeft(000);
    obj.checkBox160:setTop(025);
    obj.checkBox160:setHeight(20);
    obj.checkBox160:setWidth(120);
    obj.checkBox160:setText("Magic Up");
    obj.checkBox160:setField("sosMAGUP");
    obj.checkBox160:setName("checkBox160");

    obj.checkBox161 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox161:setParent(obj.layout37);
    obj.checkBox161:setLeft(000);
    obj.checkBox161:setTop(050);
    obj.checkBox161:setHeight(20);
    obj.checkBox161:setWidth(120);
    obj.checkBox161:setText("Regen");
    obj.checkBox161:setField("sosRegen");
    obj.checkBox161:setName("checkBox161");

    obj.checkBox162 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox162:setParent(obj.layout37);
    obj.checkBox162:setLeft(000);
    obj.checkBox162:setTop(075);
    obj.checkBox162:setHeight(20);
    obj.checkBox162:setWidth(120);
    obj.checkBox162:setText("Aura");
    obj.checkBox162:setField("sosAura");
    obj.checkBox162:setName("checkBox162");

    obj.checkBox163 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox163:setParent(obj.layout37);
    obj.checkBox163:setLeft(000);
    obj.checkBox163:setTop(100);
    obj.checkBox163:setHeight(20);
    obj.checkBox163:setWidth(120);
    obj.checkBox163:setText("Vanish");
    obj.checkBox163:setField("sosVanish");
    obj.checkBox163:setName("checkBox163");

    obj.checkBox164 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox164:setParent(obj.layout37);
    obj.checkBox164:setLeft(000);
    obj.checkBox164:setTop(125);
    obj.checkBox164:setHeight(20);
    obj.checkBox164:setWidth(120);
    obj.checkBox164:setText("Berserk");
    obj.checkBox164:setField("sosBerserk");
    obj.checkBox164:setName("checkBox164");

    obj.checkBox165 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox165:setParent(obj.layout37);
    obj.checkBox165:setLeft(000);
    obj.checkBox165:setTop(150);
    obj.checkBox165:setHeight(20);
    obj.checkBox165:setWidth(120);
    obj.checkBox165:setText("Blind");
    obj.checkBox165:setField("sosBlind");
    obj.checkBox165:setName("checkBox165");

    obj.checkBox166 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox166:setParent(obj.layout37);
    obj.checkBox166:setLeft(000);
    obj.checkBox166:setTop(175);
    obj.checkBox166:setHeight(20);
    obj.checkBox166:setWidth(120);
    obj.checkBox166:setText("Poison");
    obj.checkBox166:setField("sosPoison");
    obj.checkBox166:setName("checkBox166");

    obj.checkBox167 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox167:setParent(obj.layout37);
    obj.checkBox167:setLeft(000);
    obj.checkBox167:setTop(200);
    obj.checkBox167:setHeight(20);
    obj.checkBox167:setWidth(120);
    obj.checkBox167:setText("Sleep");
    obj.checkBox167:setField("sosSleep");
    obj.checkBox167:setName("checkBox167");

    obj.checkBox168 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox168:setParent(obj.layout37);
    obj.checkBox168:setLeft(000);
    obj.checkBox168:setTop(225);
    obj.checkBox168:setHeight(20);
    obj.checkBox168:setWidth(120);
    obj.checkBox168:setText("Slow");
    obj.checkBox168:setField("sosSlow");
    obj.checkBox168:setName("checkBox168");

    obj.checkBox169 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox169:setParent(obj.layout37);
    obj.checkBox169:setLeft(000);
    obj.checkBox169:setTop(250);
    obj.checkBox169:setHeight(20);
    obj.checkBox169:setWidth(120);
    obj.checkBox169:setText("Zombie");
    obj.checkBox169:setField("sosZombie");
    obj.checkBox169:setName("checkBox169");

    obj.checkBox170 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox170:setParent(obj.layout37);
    obj.checkBox170:setLeft(000);
    obj.checkBox170:setTop(275);
    obj.checkBox170:setHeight(20);
    obj.checkBox170:setWidth(120);
    obj.checkBox170:setText("Confuse");
    obj.checkBox170:setField("sosConfuse");
    obj.checkBox170:setName("checkBox170");

    obj.checkBox171 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox171:setParent(obj.layout37);
    obj.checkBox171:setLeft(000);
    obj.checkBox171:setTop(300);
    obj.checkBox171:setHeight(20);
    obj.checkBox171:setWidth(120);
    obj.checkBox171:setText("Sap");
    obj.checkBox171:setField("sosSap");
    obj.checkBox171:setName("checkBox171");

    obj.checkBox172 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox172:setParent(obj.layout37);
    obj.checkBox172:setLeft(000);
    obj.checkBox172:setTop(325);
    obj.checkBox172:setHeight(20);
    obj.checkBox172:setWidth(120);
    obj.checkBox172:setText("Unaware");
    obj.checkBox172:setField("sosUnaware");
    obj.checkBox172:setName("checkBox172");

    obj.checkBox173 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox173:setParent(obj.layout37);
    obj.checkBox173:setLeft(000);
    obj.checkBox173:setTop(350);
    obj.checkBox173:setHeight(20);
    obj.checkBox173:setWidth(120);
    obj.checkBox173:setText("Mini");
    obj.checkBox173:setField("sosMini");
    obj.checkBox173:setName("checkBox173");

    obj.checkBox174 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox174:setParent(obj.layout37);
    obj.checkBox174:setLeft(000);
    obj.checkBox174:setTop(375);
    obj.checkBox174:setHeight(20);
    obj.checkBox174:setWidth(120);
    obj.checkBox174:setText("Toad");
    obj.checkBox174:setField("sosToad");
    obj.checkBox174:setName("checkBox174");

    obj.checkBox175 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox175:setParent(obj.layout37);
    obj.checkBox175:setLeft(000);
    obj.checkBox175:setTop(400);
    obj.checkBox175:setHeight(20);
    obj.checkBox175:setWidth(120);
    obj.checkBox175:setText("Venom");
    obj.checkBox175:setField("sosVenom");
    obj.checkBox175:setName("checkBox175");

    obj.checkBox176 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox176:setParent(obj.layout37);
    obj.checkBox176:setLeft(000);
    obj.checkBox176:setTop(425);
    obj.checkBox176:setHeight(20);
    obj.checkBox176:setWidth(120);
    obj.checkBox176:setText("Condemn");
    obj.checkBox176:setField("sosCondemn");
    obj.checkBox176:setName("checkBox176");

    obj.checkBox177 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox177:setParent(obj.layout37);
    obj.checkBox177:setLeft(000);
    obj.checkBox177:setTop(450);
    obj.checkBox177:setHeight(20);
    obj.checkBox177:setWidth(120);
    obj.checkBox177:setText("Petrify");
    obj.checkBox177:setField("sosPetrify");
    obj.checkBox177:setName("checkBox177");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox5);
    obj.layout38:setLeft(650);
    obj.layout38:setTop(20);
    obj.layout38:setHeight(600);
    obj.layout38:setWidth(400);
    obj.layout38:setName("layout38");

    obj.popAbilitynamComeback = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamComeback:setParent(obj.layout38);
    obj.popAbilitynamComeback:setName("popAbilitynamComeback");
    obj.popAbilitynamComeback:setWidth(300);
    obj.popAbilitynamComeback:setHeight(200);
    obj.popAbilitynamComeback:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamComeback, "autoScopeNode",  "false");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.popAbilitynamComeback);
    obj.label127:setLeft(05);
    obj.label127:setTop(5);
    obj.label127:setWidth(60);
    obj.label127:setHeight(20);
    obj.label127:setText("Descrição:");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.popAbilitynamComeback);
    obj.textEditor23:setLeft(005);
    obj.textEditor23:setTop(30);
    obj.textEditor23:setHeight(165);
    obj.textEditor23:setWidth(290);
    obj.textEditor23:setField("DescricaonamComeback");
    obj.textEditor23:setText("The monster cannot be killed by normal means. Attacks can damage and even incapacitate it, but it is only a matter of time before the fell beast is back on its feet and ready for more action.  If reduced to 0 or fewer HP in battle, a monster with Comeback is incapacitated as normal, but begins regenerating damage immediately.  After a certain number of Rounds, regeneration is complete, and the monster comes back into the battle with 100% of its Hit Points and Magic Points restored. Comeback’s XP and Gil values depend on the number of Rounds the monster needs to regenerate");
    obj.textEditor23:setName("textEditor23");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout38);
    obj.label128:setLeft(000);
    obj.label128:setTop(000);
    obj.label128:setHeight(20);
    obj.label128:setWidth(170);
    obj.label128:setText("Comeback");
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setName("label128");

    obj.BotaonamComeback = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamComeback:setParent(obj.layout38);
    obj.BotaonamComeback:setLeft(175);
    obj.BotaonamComeback:setTop(000);
    obj.BotaonamComeback:setWidth(23);
    obj.BotaonamComeback:setHeight(25);
    obj.BotaonamComeback:setText("i");
    obj.BotaonamComeback:setName("BotaonamComeback");

    obj.checkBox178 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox178:setParent(obj.layout38);
    obj.checkBox178:setLeft(020);
    obj.checkBox178:setTop(025);
    obj.checkBox178:setHeight(20);
    obj.checkBox178:setWidth(150);
    obj.checkBox178:setText("2 rounds");
    obj.checkBox178:setField("Comeback2");
    obj.checkBox178:setName("checkBox178");

    obj.checkBox179 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox179:setParent(obj.layout38);
    obj.checkBox179:setLeft(020);
    obj.checkBox179:setTop(050);
    obj.checkBox179:setHeight(20);
    obj.checkBox179:setWidth(150);
    obj.checkBox179:setText("4 rounds");
    obj.checkBox179:setField("Comeback4");
    obj.checkBox179:setName("checkBox179");

    obj.checkBox180 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox180:setParent(obj.layout38);
    obj.checkBox180:setLeft(020);
    obj.checkBox180:setTop(075);
    obj.checkBox180:setHeight(20);
    obj.checkBox180:setWidth(150);
    obj.checkBox180:setText("6 rounds");
    obj.checkBox180:setField("Comeback6");
    obj.checkBox180:setName("checkBox180");

    obj.popAbilitynamCritical = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamCritical:setParent(obj.layout38);
    obj.popAbilitynamCritical:setName("popAbilitynamCritical");
    obj.popAbilitynamCritical:setWidth(300);
    obj.popAbilitynamCritical:setHeight(200);
    obj.popAbilitynamCritical:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamCritical, "autoScopeNode",  "false");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.popAbilitynamCritical);
    obj.label129:setLeft(05);
    obj.label129:setTop(5);
    obj.label129:setWidth(60);
    obj.label129:setHeight(20);
    obj.label129:setText("Descrição:");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.popAbilitynamCritical);
    obj.textEditor24:setLeft(005);
    obj.textEditor24:setTop(30);
    obj.textEditor24:setHeight(165);
    obj.textEditor24:setWidth(290);
    obj.textEditor24:setField("DescricaonamCritical");
    obj.textEditor24:setText("By default, monsters' Attack Actions cannot land Critical Hits in combat.  A monster with Critical Attack, however, is no longer subject to his restriction. Critical Attack’s XP and Gil values depend on the likelihood of a Critical Hit being landed");
    obj.textEditor24:setName("textEditor24");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout38);
    obj.label130:setLeft(000);
    obj.label130:setTop(100);
    obj.label130:setHeight(20);
    obj.label130:setWidth(170);
    obj.label130:setText("Critical Attack");
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setName("label130");

    obj.BotaonamCritical = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamCritical:setParent(obj.layout38);
    obj.BotaonamCritical:setLeft(175);
    obj.BotaonamCritical:setTop(100);
    obj.BotaonamCritical:setWidth(23);
    obj.BotaonamCritical:setHeight(25);
    obj.BotaonamCritical:setText("i");
    obj.BotaonamCritical:setName("BotaonamCritical");

    obj.checkBox181 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox181:setParent(obj.layout38);
    obj.checkBox181:setLeft(020);
    obj.checkBox181:setTop(125);
    obj.checkBox181:setHeight(20);
    obj.checkBox181:setWidth(150);
    obj.checkBox181:setText("Standard (1-10)");
    obj.checkBox181:setField("supCrit1");
    obj.checkBox181:setName("checkBox181");

    obj.checkBox182 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox182:setParent(obj.layout38);
    obj.checkBox182:setLeft(020);
    obj.checkBox182:setTop(150);
    obj.checkBox182:setHeight(20);
    obj.checkBox182:setWidth(150);
    obj.checkBox182:setText("Critical+ (1-20");
    obj.checkBox182:setField("supCrit2");
    obj.checkBox182:setName("checkBox182");

    obj.checkBox183 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox183:setParent(obj.layout38);
    obj.checkBox183:setLeft(020);
    obj.checkBox183:setTop(175);
    obj.checkBox183:setHeight(20);
    obj.checkBox183:setWidth(150);
    obj.checkBox183:setText("Critical++ (1-30)");
    obj.checkBox183:setField("supCrit3");
    obj.checkBox183:setName("checkBox183");

    obj.popAbilitysupLEva = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupLEva:setParent(obj.layout38);
    obj.popAbilitysupLEva:setName("popAbilitysupLEva");
    obj.popAbilitysupLEva:setWidth(300);
    obj.popAbilitysupLEva:setHeight(200);
    obj.popAbilitysupLEva:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupLEva, "autoScopeNode",  "false");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.popAbilitysupLEva);
    obj.label131:setLeft(05);
    obj.label131:setTop(5);
    obj.label131:setWidth(60);
    obj.label131:setHeight(20);
    obj.label131:setText("Descrição:");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.popAbilitysupLEva);
    obj.textEditor25:setLeft(005);
    obj.textEditor25:setTop(30);
    obj.textEditor25:setHeight(165);
    obj.textEditor25:setWidth(290);
    obj.textEditor25:setField("DescricaosupLEva");
    obj.textEditor25:setText("The monster is especially sluggish when it comes to dodging. As a result, the following formula is used to calculate the monster’s Evasion:  ([Level / 2] + SPD + AGI)  Because of the strong impact this can have on a monster's Gil and XP values, this option should not be used on low-Level monsters.");
    obj.textEditor25:setName("textEditor25");

    obj.checkBox184 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox184:setParent(obj.layout38);
    obj.checkBox184:setLeft(000);
    obj.checkBox184:setTop(250);
    obj.checkBox184:setHeight(20);
    obj.checkBox184:setWidth(150);
    obj.checkBox184:setText("Low Evasion");
    obj.checkBox184:setField("supLEva");
    lfm_setPropAsString(obj.checkBox184, "fontStyle",  "bold");
    obj.checkBox184:setName("checkBox184");

    obj.BotaosupLEva = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupLEva:setParent(obj.layout38);
    obj.BotaosupLEva:setLeft(175);
    obj.BotaosupLEva:setTop(250);
    obj.BotaosupLEva:setWidth(23);
    obj.BotaosupLEva:setHeight(25);
    obj.BotaosupLEva:setText("i");
    obj.BotaosupLEva:setName("BotaosupLEva");

    obj.popAbilitysupLMEva = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupLMEva:setParent(obj.layout38);
    obj.popAbilitysupLMEva:setName("popAbilitysupLMEva");
    obj.popAbilitysupLMEva:setWidth(300);
    obj.popAbilitysupLMEva:setHeight(200);
    obj.popAbilitysupLMEva:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupLMEva, "autoScopeNode",  "false");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.popAbilitysupLMEva);
    obj.label132:setLeft(05);
    obj.label132:setTop(5);
    obj.label132:setWidth(60);
    obj.label132:setHeight(20);
    obj.label132:setText("Descrição:");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.textEditor26 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.popAbilitysupLMEva);
    obj.textEditor26:setLeft(005);
    obj.textEditor26:setTop(30);
    obj.textEditor26:setHeight(165);
    obj.textEditor26:setWidth(290);
    obj.textEditor26:setField("DescricaosupLMEva");
    obj.textEditor26:setText("The monster is highly vulnerable to the effects of spellcasting. As a result, the following formula is used to calculate the monster’s M. Evasion:  ([Level / 2] + MAG + SPR)  Because of the strong impact this can have on a monster's Gil and XP values, this option should not be used on low-Level monsters.");
    obj.textEditor26:setName("textEditor26");

    obj.checkBox185 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox185:setParent(obj.layout38);
    obj.checkBox185:setLeft(000);
    obj.checkBox185:setTop(275);
    obj.checkBox185:setHeight(20);
    obj.checkBox185:setWidth(150);
    obj.checkBox185:setText("Low Magic Evasion");
    obj.checkBox185:setField("supLMEva");
    lfm_setPropAsString(obj.checkBox185, "fontStyle",  "bold");
    obj.checkBox185:setName("checkBox185");

    obj.BotaosupLMEva = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupLMEva:setParent(obj.layout38);
    obj.BotaosupLMEva:setLeft(175);
    obj.BotaosupLMEva:setTop(275);
    obj.BotaosupLMEva:setWidth(23);
    obj.BotaosupLMEva:setHeight(25);
    obj.BotaosupLMEva:setText("i");
    obj.BotaosupLMEva:setName("BotaosupLMEva");

    obj.popAbilitynamEvader = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamEvader:setParent(obj.layout38);
    obj.popAbilitynamEvader:setName("popAbilitynamEvader");
    obj.popAbilitynamEvader:setWidth(300);
    obj.popAbilitynamEvader:setHeight(200);
    obj.popAbilitynamEvader:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamEvader, "autoScopeNode",  "false");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.popAbilitynamEvader);
    obj.label133:setLeft(05);
    obj.label133:setTop(5);
    obj.label133:setWidth(60);
    obj.label133:setHeight(20);
    obj.label133:setText("Descrição:");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.textEditor27 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.popAbilitynamEvader);
    obj.textEditor27:setLeft(005);
    obj.textEditor27:setTop(30);
    obj.textEditor27:setHeight(165);
    obj.textEditor27:setWidth(290);
    obj.textEditor27:setField("DescricaonamEvader");
    obj.textEditor27:setText("A monster with this ability is extremely adept at evading harm. Attacks and Abilities that target the monster have their CoS halved, although Critical Hits may still be scored. Abilities that hit a target automatically only have a CoS of Accuracy, Evasion of affecting a monster with Evader. With Magic Abilities, this CoS is M. Accuracy, M.Evasion. Item accuracy remains unaffected.");
    obj.textEditor27:setName("textEditor27");

    obj.checkBox186 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox186:setParent(obj.layout38);
    obj.checkBox186:setLeft(000);
    obj.checkBox186:setTop(300);
    obj.checkBox186:setHeight(20);
    obj.checkBox186:setWidth(150);
    obj.checkBox186:setText("Evader");
    obj.checkBox186:setField("namEvader");
    lfm_setPropAsString(obj.checkBox186, "fontStyle",  "bold");
    obj.checkBox186:setName("checkBox186");

    obj.BotaonamEvader = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamEvader:setParent(obj.layout38);
    obj.BotaonamEvader:setLeft(175);
    obj.BotaonamEvader:setTop(300);
    obj.BotaonamEvader:setWidth(23);
    obj.BotaonamEvader:setHeight(25);
    obj.BotaonamEvader:setText("i");
    obj.BotaonamEvader:setName("BotaonamEvader");

    obj.popAbilitynamEvasion = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamEvasion:setParent(obj.layout38);
    obj.popAbilitynamEvasion:setName("popAbilitynamEvasion");
    obj.popAbilitynamEvasion:setWidth(300);
    obj.popAbilitynamEvasion:setHeight(200);
    obj.popAbilitynamEvasion:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamEvasion, "autoScopeNode",  "false");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.popAbilitynamEvasion);
    obj.label134:setLeft(05);
    obj.label134:setTop(5);
    obj.label134:setWidth(60);
    obj.label134:setHeight(20);
    obj.label134:setText("Descrição:");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.textEditor28 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.popAbilitynamEvasion);
    obj.textEditor28:setLeft(005);
    obj.textEditor28:setTop(30);
    obj.textEditor28:setHeight(165);
    obj.textEditor28:setWidth(290);
    obj.textEditor28:setField("DescricaonamEvasion");
    obj.textEditor28:setText("Improves the monster’s ability to dodge physical attacks by increasing its base Evasion rating. The amount by which the monster’s EVA increases determines the XP and Gil modifiers");
    obj.textEditor28:setName("textEditor28");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout38);
    obj.label135:setLeft(000);
    obj.label135:setTop(350);
    obj.label135:setHeight(20);
    obj.label135:setWidth(170);
    obj.label135:setText("Evasion+");
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");
    obj.label135:setName("label135");

    obj.BotaonamEvasion = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamEvasion:setParent(obj.layout38);
    obj.BotaonamEvasion:setLeft(175);
    obj.BotaonamEvasion:setTop(350);
    obj.BotaonamEvasion:setWidth(23);
    obj.BotaonamEvasion:setHeight(25);
    obj.BotaonamEvasion:setText("i");
    obj.BotaonamEvasion:setName("BotaonamEvasion");

    obj.checkBox187 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox187:setParent(obj.layout38);
    obj.checkBox187:setLeft(020);
    obj.checkBox187:setTop(375);
    obj.checkBox187:setHeight(20);
    obj.checkBox187:setWidth(150);
    obj.checkBox187:setText("Evasion +10%");
    obj.checkBox187:setField("supEva10");
    obj.checkBox187:setName("checkBox187");

    obj.checkBox188 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox188:setParent(obj.layout38);
    obj.checkBox188:setLeft(020);
    obj.checkBox188:setTop(400);
    obj.checkBox188:setHeight(20);
    obj.checkBox188:setWidth(150);
    obj.checkBox188:setText("Evasion +25%");
    obj.checkBox188:setField("supEva25");
    obj.checkBox188:setName("checkBox188");

    obj.checkBox189 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox189:setParent(obj.layout38);
    obj.checkBox189:setLeft(020);
    obj.checkBox189:setTop(425);
    obj.checkBox189:setHeight(20);
    obj.checkBox189:setWidth(150);
    obj.checkBox189:setText("Evasion +50%");
    obj.checkBox189:setField("supEva50");
    obj.checkBox189:setName("checkBox189");

    obj.checkBox190 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox190:setParent(obj.layout38);
    obj.checkBox190:setLeft(020);
    obj.checkBox190:setTop(450);
    obj.checkBox190:setHeight(20);
    obj.checkBox190:setWidth(150);
    obj.checkBox190:setText("Evasion +75%");
    obj.checkBox190:setField("supEva75");
    obj.checkBox190:setName("checkBox190");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox5);
    obj.layout39:setLeft(870);
    obj.layout39:setTop(370);
    obj.layout39:setHeight(150);
    obj.layout39:setWidth(200);
    obj.layout39:setName("layout39");

    obj.popAbilitynamMEvasion = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamMEvasion:setParent(obj.layout39);
    obj.popAbilitynamMEvasion:setName("popAbilitynamMEvasion");
    obj.popAbilitynamMEvasion:setWidth(300);
    obj.popAbilitynamMEvasion:setHeight(200);
    obj.popAbilitynamMEvasion:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamMEvasion, "autoScopeNode",  "false");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.popAbilitynamMEvasion);
    obj.label136:setLeft(05);
    obj.label136:setTop(5);
    obj.label136:setWidth(60);
    obj.label136:setHeight(20);
    obj.label136:setText("Descrição:");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.textEditor29 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.popAbilitynamMEvasion);
    obj.textEditor29:setLeft(005);
    obj.textEditor29:setTop(30);
    obj.textEditor29:setHeight(165);
    obj.textEditor29:setWidth(290);
    obj.textEditor29:setField("DescricaonamMEvasion");
    obj.textEditor29:setText("The monster is more adept than usual at resisting incoming magical attacks, increasing its base M. EVA rating. The amount by which the monster’s M. EVA increases determines how much the monster’s value is increased by.");
    obj.textEditor29:setName("textEditor29");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout39);
    obj.label137:setLeft(000);
    obj.label137:setTop(000);
    obj.label137:setHeight(20);
    obj.label137:setWidth(170);
    obj.label137:setText("Magic Evasion+");
    lfm_setPropAsString(obj.label137, "fontStyle",  "bold");
    obj.label137:setName("label137");

    obj.BotaonamMEvasion = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamMEvasion:setParent(obj.layout39);
    obj.BotaonamMEvasion:setLeft(175);
    obj.BotaonamMEvasion:setTop(000);
    obj.BotaonamMEvasion:setWidth(23);
    obj.BotaonamMEvasion:setHeight(25);
    obj.BotaonamMEvasion:setText("i");
    obj.BotaonamMEvasion:setName("BotaonamMEvasion");

    obj.checkBox191 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox191:setParent(obj.layout39);
    obj.checkBox191:setLeft(020);
    obj.checkBox191:setTop(025);
    obj.checkBox191:setHeight(20);
    obj.checkBox191:setWidth(150);
    obj.checkBox191:setText("M.Evasion +10%");
    obj.checkBox191:setField("supMEva10");
    obj.checkBox191:setName("checkBox191");

    obj.checkBox192 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox192:setParent(obj.layout39);
    obj.checkBox192:setLeft(020);
    obj.checkBox192:setTop(050);
    obj.checkBox192:setHeight(20);
    obj.checkBox192:setWidth(150);
    obj.checkBox192:setText("M.Evasion +25%");
    obj.checkBox192:setField("supMEva25");
    obj.checkBox192:setName("checkBox192");

    obj.checkBox193 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox193:setParent(obj.layout39);
    obj.checkBox193:setLeft(020);
    obj.checkBox193:setTop(075);
    obj.checkBox193:setHeight(20);
    obj.checkBox193:setWidth(150);
    obj.checkBox193:setText("M.Evasion +50%");
    obj.checkBox193:setField("supMEva50");
    obj.checkBox193:setName("checkBox193");

    obj.checkBox194 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox194:setParent(obj.layout39);
    obj.checkBox194:setLeft(020);
    obj.checkBox194:setTop(100);
    obj.checkBox194:setHeight(20);
    obj.checkBox194:setWidth(150);
    obj.checkBox194:setText("M.Evasion +75%");
    obj.checkBox194:setField("supMEva75");
    obj.checkBox194:setName("checkBox194");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox5);
    obj.layout40:setLeft(1000);
    obj.layout40:setTop(570);
    obj.layout40:setHeight(50);
    obj.layout40:setWidth(90);
    obj.layout40:setName("layout40");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout40);
    obj.label138:setLeft(000);
    obj.label138:setTop(000);
    obj.label138:setHeight(20);
    obj.label138:setWidth(30);
    obj.label138:setText("Exp");
    obj.label138:setAutoSize(true);
    obj.label138:setName("label138");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout40);
    obj.edit239:setLeft(035);
    obj.edit239:setTop(000);
    obj.edit239:setHeight(20);
    obj.edit239:setWidth(50);
    obj.edit239:setField("ExpFinal");
    obj.edit239:setHorzTextAlign("center");
    obj.edit239:setName("edit239");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout40);
    obj.label139:setLeft(000);
    obj.label139:setTop(025);
    obj.label139:setHeight(20);
    obj.label139:setWidth(30);
    obj.label139:setText("Gil");
    obj.label139:setAutoSize(true);
    obj.label139:setName("label139");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout40);
    obj.edit240:setLeft(35);
    obj.edit240:setTop(025);
    obj.edit240:setHeight(20);
    obj.edit240:setWidth(50);
    obj.edit240:setField("GilFinal");
    obj.edit240:setHorzTextAlign("center");
    obj.edit240:setName("edit240");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Support B");
    obj.tab6:setName("tab6");

    obj.frmSupportB = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSupportB:setParent(obj.tab6);
    obj.frmSupportB:setName("frmSupportB");
    obj.frmSupportB:setAlign("client");
    obj.frmSupportB:setTheme("dark");
    obj.frmSupportB:setMargins({top=1});

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.frmSupportB);
    obj.layout41:setLeft(000);
    obj.layout41:setTop(000);
    obj.layout41:setHeight(650);
    obj.layout41:setWidth(1100);
    obj.layout41:setName("layout41");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout41);
    obj.image7:setLeft(000);
    obj.image7:setTop(000);
    obj.image7:setHeight(650);
    obj.image7:setWidth(1100);
    obj.image7:setSRC("/img/wallpaper.png");
    obj.image7:setStyle("autoFit");
    obj.image7:setName("image7");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmSupportB);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.scrollBox6);
    obj.layout42:setLeft(140);
    obj.layout42:setTop(20);
    obj.layout42:setHeight(500);
    obj.layout42:setWidth(380);
    obj.layout42:setName("layout42");

    obj.popAbilitynamElemPot = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamElemPot:setParent(obj.layout42);
    obj.popAbilitynamElemPot:setName("popAbilitynamElemPot");
    obj.popAbilitynamElemPot:setWidth(300);
    obj.popAbilitynamElemPot:setHeight(200);
    obj.popAbilitynamElemPot:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamElemPot, "autoScopeNode",  "false");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.popAbilitynamElemPot);
    obj.label140:setLeft(05);
    obj.label140:setTop(5);
    obj.label140:setWidth(60);
    obj.label140:setHeight(20);
    obj.label140:setText("Descrição:");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.textEditor30 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.popAbilitynamElemPot);
    obj.textEditor30:setLeft(005);
    obj.textEditor30:setTop(30);
    obj.textEditor30:setHeight(165);
    obj.textEditor30:setWidth(290);
    obj.textEditor30:setField("DescricaonamElemPot");
    obj.textEditor30:setText("The monster's elemental attacks are more potent than usual, circumventing natural and magical defenses with ease. Select an Element when taking this Ability; any time the monster deals damage associated with that Element, it will deal 125% damage unless the target has a Weakness to it, where it deals 150% as normal. Combatants with a Resistance to the Element in question take 100% damage; a Immunity reduces damage to 50%, while Absorbance reduces it to 0. XP and Gil modifiers are given per Element – having Potency towards Wind and Earth would carry a combined modifier of +120/+82");
    obj.textEditor30:setName("textEditor30");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout42);
    obj.label141:setLeft(000);
    obj.label141:setTop(000);
    obj.label141:setHeight(20);
    obj.label141:setWidth(150);
    obj.label141:setText("Potency");
    lfm_setPropAsString(obj.label141, "fontStyle",  "bold");
    obj.label141:setName("label141");

    obj.BotaonamElemPot = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamElemPot:setParent(obj.layout42);
    obj.BotaonamElemPot:setLeft(100);
    obj.BotaonamElemPot:setTop(000);
    obj.BotaonamElemPot:setWidth(23);
    obj.BotaonamElemPot:setHeight(25);
    obj.BotaonamElemPot:setText("i");
    obj.BotaonamElemPot:setName("BotaonamElemPot");

    obj.checkBox195 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox195:setParent(obj.layout42);
    obj.checkBox195:setLeft(000);
    obj.checkBox195:setTop(025);
    obj.checkBox195:setHeight(20);
    obj.checkBox195:setWidth(120);
    obj.checkBox195:setText("Fire");
    obj.checkBox195:setField("potFIR");
    obj.checkBox195:setName("checkBox195");

    obj.checkBox196 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox196:setParent(obj.layout42);
    obj.checkBox196:setLeft(000);
    obj.checkBox196:setTop(050);
    obj.checkBox196:setHeight(20);
    obj.checkBox196:setWidth(120);
    obj.checkBox196:setText("Ice");
    obj.checkBox196:setField("potICE");
    obj.checkBox196:setName("checkBox196");

    obj.checkBox197 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox197:setParent(obj.layout42);
    obj.checkBox197:setLeft(000);
    obj.checkBox197:setTop(075);
    obj.checkBox197:setHeight(20);
    obj.checkBox197:setWidth(120);
    obj.checkBox197:setText("Water");
    obj.checkBox197:setField("potWAT");
    obj.checkBox197:setName("checkBox197");

    obj.checkBox198 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox198:setParent(obj.layout42);
    obj.checkBox198:setLeft(000);
    obj.checkBox198:setTop(100);
    obj.checkBox198:setHeight(20);
    obj.checkBox198:setWidth(120);
    obj.checkBox198:setText("Lightning");
    obj.checkBox198:setField("potELE");
    obj.checkBox198:setName("checkBox198");

    obj.checkBox199 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox199:setParent(obj.layout42);
    obj.checkBox199:setLeft(000);
    obj.checkBox199:setTop(125);
    obj.checkBox199:setHeight(20);
    obj.checkBox199:setWidth(120);
    obj.checkBox199:setText("Ground");
    obj.checkBox199:setField("potGND");
    obj.checkBox199:setName("checkBox199");

    obj.checkBox200 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox200:setParent(obj.layout42);
    obj.checkBox200:setLeft(000);
    obj.checkBox200:setTop(150);
    obj.checkBox200:setHeight(20);
    obj.checkBox200:setWidth(120);
    obj.checkBox200:setText("Wind");
    obj.checkBox200:setField("potWIN");
    obj.checkBox200:setName("checkBox200");

    obj.checkBox201 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox201:setParent(obj.layout42);
    obj.checkBox201:setLeft(000);
    obj.checkBox201:setTop(175);
    obj.checkBox201:setHeight(20);
    obj.checkBox201:setWidth(120);
    obj.checkBox201:setText("Bio");
    obj.checkBox201:setField("potBIO");
    obj.checkBox201:setName("checkBox201");

    obj.checkBox202 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox202:setParent(obj.layout42);
    obj.checkBox202:setLeft(000);
    obj.checkBox202:setTop(200);
    obj.checkBox202:setHeight(20);
    obj.checkBox202:setWidth(120);
    obj.checkBox202:setText("Shadow");
    obj.checkBox202:setField("potSHA");
    obj.checkBox202:setName("checkBox202");

    obj.checkBox203 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox203:setParent(obj.layout42);
    obj.checkBox203:setLeft(000);
    obj.checkBox203:setTop(225);
    obj.checkBox203:setHeight(20);
    obj.checkBox203:setWidth(120);
    obj.checkBox203:setText("Holy");
    obj.checkBox203:setField("potHOL");
    obj.checkBox203:setName("checkBox203");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox6);
    obj.layout43:setLeft(280);
    obj.layout43:setTop(20);
    obj.layout43:setHeight(500);
    obj.layout43:setWidth(380);
    obj.layout43:setName("layout43");

    obj.popAbilitynamElemAbs = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamElemAbs:setParent(obj.layout43);
    obj.popAbilitynamElemAbs:setName("popAbilitynamElemAbs");
    obj.popAbilitynamElemAbs:setWidth(300);
    obj.popAbilitynamElemAbs:setHeight(200);
    obj.popAbilitynamElemAbs:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamElemAbs, "autoScopeNode",  "false");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.popAbilitynamElemAbs);
    obj.label142:setLeft(05);
    obj.label142:setTop(5);
    obj.label142:setWidth(60);
    obj.label142:setHeight(20);
    obj.label142:setText("Descrição:");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.textEditor31 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.popAbilitynamElemAbs);
    obj.textEditor31:setLeft(005);
    obj.textEditor31:setTop(30);
    obj.textEditor31:setHeight(165);
    obj.textEditor31:setWidth(290);
    obj.textEditor31:setField("DescricaonamElemAbs");
    obj.textEditor31:setText("The monster has an extremely strong affinity towards one or more of the nine Combat Elements, and is considered to have an Absorbance to it.  Select which Element Elemental Absorbance applies to when taking this Ability.  Elemental Absorbance cannot be taken in conjunction with a Weakness, Resistance, or Immunity for the same Element. XP and Gil modifiers are given per Element – having Absorbance towards Wind and Earth would carry a combined modifier of +66/+30.");
    obj.textEditor31:setName("textEditor31");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout43);
    obj.label143:setLeft(000);
    obj.label143:setTop(000);
    obj.label143:setHeight(20);
    obj.label143:setWidth(150);
    obj.label143:setText("Absorbance");
    lfm_setPropAsString(obj.label143, "fontStyle",  "bold");
    obj.label143:setName("label143");

    obj.BotaonamElemAbs = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamElemAbs:setParent(obj.layout43);
    obj.BotaonamElemAbs:setLeft(100);
    obj.BotaonamElemAbs:setTop(000);
    obj.BotaonamElemAbs:setWidth(23);
    obj.BotaonamElemAbs:setHeight(25);
    obj.BotaonamElemAbs:setText("i");
    obj.BotaonamElemAbs:setName("BotaonamElemAbs");

    obj.checkBox204 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox204:setParent(obj.layout43);
    obj.checkBox204:setLeft(000);
    obj.checkBox204:setTop(025);
    obj.checkBox204:setHeight(20);
    obj.checkBox204:setWidth(120);
    obj.checkBox204:setText("Fire");
    obj.checkBox204:setField("absFIR");
    obj.checkBox204:setName("checkBox204");

    obj.checkBox205 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox205:setParent(obj.layout43);
    obj.checkBox205:setLeft(000);
    obj.checkBox205:setTop(050);
    obj.checkBox205:setHeight(20);
    obj.checkBox205:setWidth(120);
    obj.checkBox205:setText("Ice");
    obj.checkBox205:setField("absICE");
    obj.checkBox205:setName("checkBox205");

    obj.checkBox206 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox206:setParent(obj.layout43);
    obj.checkBox206:setLeft(000);
    obj.checkBox206:setTop(075);
    obj.checkBox206:setHeight(20);
    obj.checkBox206:setWidth(120);
    obj.checkBox206:setText("Water");
    obj.checkBox206:setField("absWAT");
    obj.checkBox206:setName("checkBox206");

    obj.checkBox207 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox207:setParent(obj.layout43);
    obj.checkBox207:setLeft(000);
    obj.checkBox207:setTop(100);
    obj.checkBox207:setHeight(20);
    obj.checkBox207:setWidth(120);
    obj.checkBox207:setText("Lightning");
    obj.checkBox207:setField("absELE");
    obj.checkBox207:setName("checkBox207");

    obj.checkBox208 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox208:setParent(obj.layout43);
    obj.checkBox208:setLeft(000);
    obj.checkBox208:setTop(125);
    obj.checkBox208:setHeight(20);
    obj.checkBox208:setWidth(120);
    obj.checkBox208:setText("Ground");
    obj.checkBox208:setField("absGND");
    obj.checkBox208:setName("checkBox208");

    obj.checkBox209 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox209:setParent(obj.layout43);
    obj.checkBox209:setLeft(000);
    obj.checkBox209:setTop(150);
    obj.checkBox209:setHeight(20);
    obj.checkBox209:setWidth(120);
    obj.checkBox209:setText("Wind");
    obj.checkBox209:setField("absWIN");
    obj.checkBox209:setName("checkBox209");

    obj.checkBox210 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox210:setParent(obj.layout43);
    obj.checkBox210:setLeft(000);
    obj.checkBox210:setTop(175);
    obj.checkBox210:setHeight(20);
    obj.checkBox210:setWidth(120);
    obj.checkBox210:setText("Bio");
    obj.checkBox210:setField("absBIO");
    obj.checkBox210:setName("checkBox210");

    obj.checkBox211 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox211:setParent(obj.layout43);
    obj.checkBox211:setLeft(000);
    obj.checkBox211:setTop(200);
    obj.checkBox211:setHeight(20);
    obj.checkBox211:setWidth(120);
    obj.checkBox211:setText("Shadow");
    obj.checkBox211:setField("absSHA");
    obj.checkBox211:setName("checkBox211");

    obj.checkBox212 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox212:setParent(obj.layout43);
    obj.checkBox212:setLeft(000);
    obj.checkBox212:setTop(225);
    obj.checkBox212:setHeight(20);
    obj.checkBox212:setWidth(120);
    obj.checkBox212:setText("Holy");
    obj.checkBox212:setField("absHOL");
    obj.checkBox212:setName("checkBox212");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox6);
    obj.layout44:setLeft(420);
    obj.layout44:setTop(20);
    obj.layout44:setHeight(500);
    obj.layout44:setWidth(380);
    obj.layout44:setName("layout44");

    obj.popAbilitynamElemImm = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamElemImm:setParent(obj.layout44);
    obj.popAbilitynamElemImm:setName("popAbilitynamElemImm");
    obj.popAbilitynamElemImm:setWidth(300);
    obj.popAbilitynamElemImm:setHeight(200);
    obj.popAbilitynamElemImm:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamElemImm, "autoScopeNode",  "false");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.popAbilitynamElemImm);
    obj.label144:setLeft(05);
    obj.label144:setTop(5);
    obj.label144:setWidth(60);
    obj.label144:setHeight(20);
    obj.label144:setText("Descrição:");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.textEditor32 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor32:setParent(obj.popAbilitynamElemImm);
    obj.textEditor32:setLeft(005);
    obj.textEditor32:setTop(30);
    obj.textEditor32:setHeight(165);
    obj.textEditor32:setWidth(290);
    obj.textEditor32:setField("DescricaonamElemImm");
    obj.textEditor32:setText("The monster has a strong affinity towards one or more of the nine Combat Elements, and is considered to have an Immunity to it. Select which Element Elemental Immunity applies to when taking this Ability. Elemental Immunity cannot be taken in conjunction with a Weakness, Resistance, or Absorbance for the same Element.  XP and Gil modifiers are given per Element – having Immunity towards Wind and Earth would carry a combined modifier of +30/+14.");
    obj.textEditor32:setName("textEditor32");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout44);
    obj.label145:setLeft(000);
    obj.label145:setTop(000);
    obj.label145:setHeight(20);
    obj.label145:setWidth(150);
    obj.label145:setText("Immunity");
    lfm_setPropAsString(obj.label145, "fontStyle",  "bold");
    obj.label145:setName("label145");

    obj.BotaonamElemImm = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamElemImm:setParent(obj.layout44);
    obj.BotaonamElemImm:setLeft(100);
    obj.BotaonamElemImm:setTop(000);
    obj.BotaonamElemImm:setWidth(23);
    obj.BotaonamElemImm:setHeight(25);
    obj.BotaonamElemImm:setText("i");
    obj.BotaonamElemImm:setName("BotaonamElemImm");

    obj.checkBox213 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox213:setParent(obj.layout44);
    obj.checkBox213:setLeft(000);
    obj.checkBox213:setTop(025);
    obj.checkBox213:setHeight(20);
    obj.checkBox213:setWidth(120);
    obj.checkBox213:setText("Fire");
    obj.checkBox213:setField("immFIR");
    obj.checkBox213:setName("checkBox213");

    obj.checkBox214 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox214:setParent(obj.layout44);
    obj.checkBox214:setLeft(000);
    obj.checkBox214:setTop(050);
    obj.checkBox214:setHeight(20);
    obj.checkBox214:setWidth(120);
    obj.checkBox214:setText("Ice");
    obj.checkBox214:setField("immICE");
    obj.checkBox214:setName("checkBox214");

    obj.checkBox215 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox215:setParent(obj.layout44);
    obj.checkBox215:setLeft(000);
    obj.checkBox215:setTop(075);
    obj.checkBox215:setHeight(20);
    obj.checkBox215:setWidth(120);
    obj.checkBox215:setText("Water");
    obj.checkBox215:setField("immWAT");
    obj.checkBox215:setName("checkBox215");

    obj.checkBox216 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox216:setParent(obj.layout44);
    obj.checkBox216:setLeft(000);
    obj.checkBox216:setTop(100);
    obj.checkBox216:setHeight(20);
    obj.checkBox216:setWidth(120);
    obj.checkBox216:setText("Lightning");
    obj.checkBox216:setField("immELE");
    obj.checkBox216:setName("checkBox216");

    obj.checkBox217 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox217:setParent(obj.layout44);
    obj.checkBox217:setLeft(000);
    obj.checkBox217:setTop(125);
    obj.checkBox217:setHeight(20);
    obj.checkBox217:setWidth(120);
    obj.checkBox217:setText("Ground");
    obj.checkBox217:setField("immGND");
    obj.checkBox217:setName("checkBox217");

    obj.checkBox218 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox218:setParent(obj.layout44);
    obj.checkBox218:setLeft(000);
    obj.checkBox218:setTop(150);
    obj.checkBox218:setHeight(20);
    obj.checkBox218:setWidth(120);
    obj.checkBox218:setText("Wind");
    obj.checkBox218:setField("immWIN");
    obj.checkBox218:setName("checkBox218");

    obj.checkBox219 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox219:setParent(obj.layout44);
    obj.checkBox219:setLeft(000);
    obj.checkBox219:setTop(175);
    obj.checkBox219:setHeight(20);
    obj.checkBox219:setWidth(120);
    obj.checkBox219:setText("Bio");
    obj.checkBox219:setField("immBIO");
    obj.checkBox219:setName("checkBox219");

    obj.checkBox220 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox220:setParent(obj.layout44);
    obj.checkBox220:setLeft(000);
    obj.checkBox220:setTop(200);
    obj.checkBox220:setHeight(20);
    obj.checkBox220:setWidth(120);
    obj.checkBox220:setText("Shadow");
    obj.checkBox220:setField("immSHA");
    obj.checkBox220:setName("checkBox220");

    obj.checkBox221 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox221:setParent(obj.layout44);
    obj.checkBox221:setLeft(000);
    obj.checkBox221:setTop(225);
    obj.checkBox221:setHeight(20);
    obj.checkBox221:setWidth(120);
    obj.checkBox221:setText("Holy");
    obj.checkBox221:setField("immHOL");
    obj.checkBox221:setName("checkBox221");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox6);
    obj.layout45:setLeft(560);
    obj.layout45:setTop(20);
    obj.layout45:setHeight(500);
    obj.layout45:setWidth(380);
    obj.layout45:setName("layout45");

    obj.popAbilitynamElemRes = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamElemRes:setParent(obj.layout45);
    obj.popAbilitynamElemRes:setName("popAbilitynamElemRes");
    obj.popAbilitynamElemRes:setWidth(300);
    obj.popAbilitynamElemRes:setHeight(200);
    obj.popAbilitynamElemRes:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamElemRes, "autoScopeNode",  "false");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.popAbilitynamElemRes);
    obj.label146:setLeft(05);
    obj.label146:setTop(5);
    obj.label146:setWidth(60);
    obj.label146:setHeight(20);
    obj.label146:setText("Descrição:");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.textEditor33 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor33:setParent(obj.popAbilitynamElemRes);
    obj.textEditor33:setLeft(005);
    obj.textEditor33:setTop(30);
    obj.textEditor33:setHeight(165);
    obj.textEditor33:setWidth(290);
    obj.textEditor33:setField("DescricaonamElemRes");
    obj.textEditor33:setText("The monster has an affinity towards one or more of the nine Combat Elements, and is considered to have a Resistance to it.  Select which Element Elemental Resistance applies to when taking this Ability. Elemental Resistance cannot be taken in conjunction with a Weakness, Resistance, or Absorbance for the same Element.  XP and Gil modifiers are given per Element – having Resistance towards Wind and Earth would carry a combined modifier of +14/+6");
    obj.textEditor33:setName("textEditor33");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout45);
    obj.label147:setLeft(000);
    obj.label147:setTop(000);
    obj.label147:setHeight(20);
    obj.label147:setWidth(150);
    obj.label147:setText("Resistance");
    lfm_setPropAsString(obj.label147, "fontStyle",  "bold");
    obj.label147:setName("label147");

    obj.BotaonamElemRes = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamElemRes:setParent(obj.layout45);
    obj.BotaonamElemRes:setLeft(100);
    obj.BotaonamElemRes:setTop(000);
    obj.BotaonamElemRes:setWidth(23);
    obj.BotaonamElemRes:setHeight(25);
    obj.BotaonamElemRes:setText("i");
    obj.BotaonamElemRes:setName("BotaonamElemRes");

    obj.checkBox222 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox222:setParent(obj.layout45);
    obj.checkBox222:setLeft(000);
    obj.checkBox222:setTop(025);
    obj.checkBox222:setHeight(20);
    obj.checkBox222:setWidth(120);
    obj.checkBox222:setText("Fire");
    obj.checkBox222:setField("resFIR");
    obj.checkBox222:setName("checkBox222");

    obj.checkBox223 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox223:setParent(obj.layout45);
    obj.checkBox223:setLeft(000);
    obj.checkBox223:setTop(050);
    obj.checkBox223:setHeight(20);
    obj.checkBox223:setWidth(120);
    obj.checkBox223:setText("Ice");
    obj.checkBox223:setField("resICE");
    obj.checkBox223:setName("checkBox223");

    obj.checkBox224 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox224:setParent(obj.layout45);
    obj.checkBox224:setLeft(000);
    obj.checkBox224:setTop(075);
    obj.checkBox224:setHeight(20);
    obj.checkBox224:setWidth(120);
    obj.checkBox224:setText("Water");
    obj.checkBox224:setField("resWAT");
    obj.checkBox224:setName("checkBox224");

    obj.checkBox225 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox225:setParent(obj.layout45);
    obj.checkBox225:setLeft(000);
    obj.checkBox225:setTop(100);
    obj.checkBox225:setHeight(20);
    obj.checkBox225:setWidth(120);
    obj.checkBox225:setText("Lightning");
    obj.checkBox225:setField("resELE");
    obj.checkBox225:setName("checkBox225");

    obj.checkBox226 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox226:setParent(obj.layout45);
    obj.checkBox226:setLeft(000);
    obj.checkBox226:setTop(125);
    obj.checkBox226:setHeight(20);
    obj.checkBox226:setWidth(120);
    obj.checkBox226:setText("Ground");
    obj.checkBox226:setField("resGND");
    obj.checkBox226:setName("checkBox226");

    obj.checkBox227 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox227:setParent(obj.layout45);
    obj.checkBox227:setLeft(000);
    obj.checkBox227:setTop(150);
    obj.checkBox227:setHeight(20);
    obj.checkBox227:setWidth(120);
    obj.checkBox227:setText("Wind");
    obj.checkBox227:setField("resWIN");
    obj.checkBox227:setName("checkBox227");

    obj.checkBox228 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox228:setParent(obj.layout45);
    obj.checkBox228:setLeft(000);
    obj.checkBox228:setTop(175);
    obj.checkBox228:setHeight(20);
    obj.checkBox228:setWidth(120);
    obj.checkBox228:setText("Bio");
    obj.checkBox228:setField("resBIO");
    obj.checkBox228:setName("checkBox228");

    obj.checkBox229 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox229:setParent(obj.layout45);
    obj.checkBox229:setLeft(000);
    obj.checkBox229:setTop(200);
    obj.checkBox229:setHeight(20);
    obj.checkBox229:setWidth(120);
    obj.checkBox229:setText("Shadow");
    obj.checkBox229:setField("resSHA");
    obj.checkBox229:setName("checkBox229");

    obj.checkBox230 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox230:setParent(obj.layout45);
    obj.checkBox230:setLeft(000);
    obj.checkBox230:setTop(225);
    obj.checkBox230:setHeight(20);
    obj.checkBox230:setWidth(120);
    obj.checkBox230:setText("Holy");
    obj.checkBox230:setField("resHOL");
    obj.checkBox230:setName("checkBox230");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox6);
    obj.layout46:setLeft(700);
    obj.layout46:setTop(20);
    obj.layout46:setHeight(500);
    obj.layout46:setWidth(380);
    obj.layout46:setName("layout46");

    obj.popAbilitynamElemWk = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamElemWk:setParent(obj.layout46);
    obj.popAbilitynamElemWk:setName("popAbilitynamElemWk");
    obj.popAbilitynamElemWk:setWidth(300);
    obj.popAbilitynamElemWk:setHeight(200);
    obj.popAbilitynamElemWk:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamElemWk, "autoScopeNode",  "false");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.popAbilitynamElemWk);
    obj.label148:setLeft(05);
    obj.label148:setTop(5);
    obj.label148:setWidth(60);
    obj.label148:setHeight(20);
    obj.label148:setText("Descrição:");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.textEditor34 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor34:setParent(obj.popAbilitynamElemWk);
    obj.textEditor34:setLeft(005);
    obj.textEditor34:setTop(30);
    obj.textEditor34:setHeight(165);
    obj.textEditor34:setWidth(290);
    obj.textEditor34:setField("DescricaonamElemWk");
    obj.textEditor34:setText("The monster is vulnerable towards one or more of the nine Combat Elements, and is considered to have a Weakness to it.  Select which Element Elemental Weakness applies to when taking this Ability.  Elemental Weakness cannot be taken in conjunction with a Resistance, Immunity, or Absorbance for the same Element. XP and Gil modifiers are given per Element – having Weaknesses towards Wind and Earth would carry a combined modifier of -18/-8");
    obj.textEditor34:setName("textEditor34");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout46);
    obj.label149:setLeft(000);
    obj.label149:setTop(000);
    obj.label149:setHeight(20);
    obj.label149:setWidth(150);
    obj.label149:setText("Weakness");
    lfm_setPropAsString(obj.label149, "fontStyle",  "bold");
    obj.label149:setName("label149");

    obj.BotaonamElemWk = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamElemWk:setParent(obj.layout46);
    obj.BotaonamElemWk:setLeft(100);
    obj.BotaonamElemWk:setTop(000);
    obj.BotaonamElemWk:setWidth(23);
    obj.BotaonamElemWk:setHeight(25);
    obj.BotaonamElemWk:setText("i");
    obj.BotaonamElemWk:setName("BotaonamElemWk");

    obj.checkBox231 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox231:setParent(obj.layout46);
    obj.checkBox231:setLeft(000);
    obj.checkBox231:setTop(025);
    obj.checkBox231:setHeight(20);
    obj.checkBox231:setWidth(120);
    obj.checkBox231:setText("Fire");
    obj.checkBox231:setField("weakFIR");
    obj.checkBox231:setName("checkBox231");

    obj.checkBox232 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox232:setParent(obj.layout46);
    obj.checkBox232:setLeft(000);
    obj.checkBox232:setTop(050);
    obj.checkBox232:setHeight(20);
    obj.checkBox232:setWidth(120);
    obj.checkBox232:setText("Ice");
    obj.checkBox232:setField("weakICE");
    obj.checkBox232:setName("checkBox232");

    obj.checkBox233 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox233:setParent(obj.layout46);
    obj.checkBox233:setLeft(000);
    obj.checkBox233:setTop(075);
    obj.checkBox233:setHeight(20);
    obj.checkBox233:setWidth(120);
    obj.checkBox233:setText("Water");
    obj.checkBox233:setField("weakWAT");
    obj.checkBox233:setName("checkBox233");

    obj.checkBox234 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox234:setParent(obj.layout46);
    obj.checkBox234:setLeft(000);
    obj.checkBox234:setTop(100);
    obj.checkBox234:setHeight(20);
    obj.checkBox234:setWidth(120);
    obj.checkBox234:setText("Lightning");
    obj.checkBox234:setField("weakELE");
    obj.checkBox234:setName("checkBox234");

    obj.checkBox235 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox235:setParent(obj.layout46);
    obj.checkBox235:setLeft(000);
    obj.checkBox235:setTop(125);
    obj.checkBox235:setHeight(20);
    obj.checkBox235:setWidth(120);
    obj.checkBox235:setText("Ground");
    obj.checkBox235:setField("weakGND");
    obj.checkBox235:setName("checkBox235");

    obj.checkBox236 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox236:setParent(obj.layout46);
    obj.checkBox236:setLeft(000);
    obj.checkBox236:setTop(150);
    obj.checkBox236:setHeight(20);
    obj.checkBox236:setWidth(120);
    obj.checkBox236:setText("Wind");
    obj.checkBox236:setField("weakWIN");
    obj.checkBox236:setName("checkBox236");

    obj.checkBox237 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox237:setParent(obj.layout46);
    obj.checkBox237:setLeft(000);
    obj.checkBox237:setTop(175);
    obj.checkBox237:setHeight(20);
    obj.checkBox237:setWidth(120);
    obj.checkBox237:setText("Bio");
    obj.checkBox237:setField("weakBIO");
    obj.checkBox237:setName("checkBox237");

    obj.checkBox238 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox238:setParent(obj.layout46);
    obj.checkBox238:setLeft(000);
    obj.checkBox238:setTop(200);
    obj.checkBox238:setHeight(20);
    obj.checkBox238:setWidth(120);
    obj.checkBox238:setText("Shadow");
    obj.checkBox238:setField("weakSHA");
    obj.checkBox238:setName("checkBox238");

    obj.checkBox239 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox239:setParent(obj.layout46);
    obj.checkBox239:setLeft(000);
    obj.checkBox239:setTop(225);
    obj.checkBox239:setHeight(20);
    obj.checkBox239:setWidth(120);
    obj.checkBox239:setText("Holy");
    obj.checkBox239:setField("weakHOL");
    obj.checkBox239:setName("checkBox239");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox6);
    obj.layout47:setLeft(100);
    obj.layout47:setTop(350);
    obj.layout47:setHeight(100);
    obj.layout47:setWidth(200);
    obj.layout47:setName("layout47");

    obj.popAbilityspeBadScan = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityspeBadScan:setParent(obj.layout47);
    obj.popAbilityspeBadScan:setName("popAbilityspeBadScan");
    obj.popAbilityspeBadScan:setWidth(300);
    obj.popAbilityspeBadScan:setHeight(200);
    obj.popAbilityspeBadScan:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityspeBadScan, "autoScopeNode",  "false");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.popAbilityspeBadScan);
    obj.label150:setLeft(05);
    obj.label150:setTop(5);
    obj.label150:setWidth(60);
    obj.label150:setHeight(20);
    obj.label150:setText("Descrição:");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.textEditor35 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor35:setParent(obj.popAbilityspeBadScan);
    obj.textEditor35:setLeft(005);
    obj.textEditor35:setTop(30);
    obj.textEditor35:setHeight(165);
    obj.textEditor35:setWidth(290);
    obj.textEditor35:setField("DescricaospeBadScan");
    obj.textEditor35:setText("If analyzed via the Scan Spell, the Equipment Ability Sensor, or any similar effect, the monster will return incorrect information intended to mislead the Party.  How the Scan is ‘tampered’ with is left to the designer to decide, but should be noted in the monster’s writeup – one of the more obvious uses would have the monster register as having a Weakness to an Element they in fact Absorb, or vice versa, though there are other possibilities.  Useless or not, scanning the monster still costs MP or Actions as usual.");
    obj.textEditor35:setName("textEditor35");

    obj.checkBox240 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox240:setParent(obj.layout47);
    obj.checkBox240:setLeft(000);
    obj.checkBox240:setTop(000);
    obj.checkBox240:setHeight(20);
    obj.checkBox240:setWidth(150);
    obj.checkBox240:setText("Bad Scan");
    obj.checkBox240:setField("speBadScan");
    lfm_setPropAsString(obj.checkBox240, "fontStyle",  "bold");
    obj.checkBox240:setName("checkBox240");

    obj.BotaospeBadScan = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaospeBadScan:setParent(obj.layout47);
    obj.BotaospeBadScan:setLeft(175);
    obj.BotaospeBadScan:setTop(000);
    obj.BotaospeBadScan:setWidth(23);
    obj.BotaospeBadScan:setHeight(25);
    obj.BotaospeBadScan:setText("i");
    obj.BotaospeBadScan:setName("BotaospeBadScan");

    obj.popAbilityspeNoScan = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityspeNoScan:setParent(obj.layout47);
    obj.popAbilityspeNoScan:setName("popAbilityspeNoScan");
    obj.popAbilityspeNoScan:setWidth(300);
    obj.popAbilityspeNoScan:setHeight(200);
    obj.popAbilityspeNoScan:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityspeNoScan, "autoScopeNode",  "false");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.popAbilityspeNoScan);
    obj.label151:setLeft(05);
    obj.label151:setTop(5);
    obj.label151:setWidth(60);
    obj.label151:setHeight(20);
    obj.label151:setText("Descrição:");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.textEditor36 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor36:setParent(obj.popAbilityspeNoScan);
    obj.textEditor36:setLeft(005);
    obj.textEditor36:setTop(30);
    obj.textEditor36:setHeight(165);
    obj.textEditor36:setWidth(290);
    obj.textEditor36:setField("DescricaospeNoScan");
    obj.textEditor36:setText("The monster cannot be analyzed by means of the Scan Spell, the Equipment Ability Sensor, or any similar effect.  Any attempts to do so cost Actions and MP as usual, but return no useful information.");
    obj.textEditor36:setName("textEditor36");

    obj.checkBox241 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox241:setParent(obj.layout47);
    obj.checkBox241:setLeft(000);
    obj.checkBox241:setTop(025);
    obj.checkBox241:setHeight(20);
    obj.checkBox241:setWidth(150);
    obj.checkBox241:setText("Can't Scan");
    obj.checkBox241:setField("speNoScan");
    lfm_setPropAsString(obj.checkBox241, "fontStyle",  "bold");
    obj.checkBox241:setName("checkBox241");

    obj.BotaospeNoScan = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaospeNoScan:setParent(obj.layout47);
    obj.BotaospeNoScan:setLeft(175);
    obj.BotaospeNoScan:setTop(025);
    obj.BotaospeNoScan:setWidth(23);
    obj.BotaospeNoScan:setHeight(25);
    obj.BotaospeNoScan:setText("i");
    obj.BotaospeNoScan:setName("BotaospeNoScan");

    obj.popAbilitysupHArm = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupHArm:setParent(obj.layout47);
    obj.popAbilitysupHArm:setName("popAbilitysupHArm");
    obj.popAbilitysupHArm:setWidth(300);
    obj.popAbilitysupHArm:setHeight(200);
    obj.popAbilitysupHArm:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupHArm, "autoScopeNode",  "false");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.popAbilitysupHArm);
    obj.label152:setLeft(05);
    obj.label152:setTop(5);
    obj.label152:setWidth(60);
    obj.label152:setHeight(20);
    obj.label152:setText("Descrição:");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.textEditor37 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor37:setParent(obj.popAbilitysupHArm);
    obj.textEditor37:setLeft(005);
    obj.textEditor37:setTop(30);
    obj.textEditor37:setHeight(165);
    obj.textEditor37:setWidth(290);
    obj.textEditor37:setField("DescricaosupHArm");
    obj.textEditor37:setText("The monster sports armor heavier than the norm, giving it better resistance against armor-piercing attacks.  When a monster with Heavy Armor is struck by any attack or Ability which would normally ignore or reduce ARM, ARM is factored into the attack as normal.  Note that this does not affect Status Conditions such as Armor Break and Meltdown, which continue to work as normal.");
    obj.textEditor37:setName("textEditor37");

    obj.checkBox242 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox242:setParent(obj.layout47);
    obj.checkBox242:setLeft(000);
    obj.checkBox242:setTop(050);
    obj.checkBox242:setHeight(20);
    obj.checkBox242:setWidth(150);
    obj.checkBox242:setText("Heavy Armor");
    obj.checkBox242:setField("supHArm");
    lfm_setPropAsString(obj.checkBox242, "fontStyle",  "bold");
    obj.checkBox242:setName("checkBox242");

    obj.BotaosupHArm = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupHArm:setParent(obj.layout47);
    obj.BotaosupHArm:setLeft(175);
    obj.BotaosupHArm:setTop(050);
    obj.BotaosupHArm:setWidth(23);
    obj.BotaosupHArm:setHeight(25);
    obj.BotaosupHArm:setText("i");
    obj.BotaosupHArm:setName("BotaosupHArm");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox6);
    obj.layout48:setLeft(400);
    obj.layout48:setTop(350);
    obj.layout48:setHeight(100);
    obj.layout48:setWidth(200);
    obj.layout48:setName("layout48");

    obj.popAbilitysupMBound = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupMBound:setParent(obj.layout48);
    obj.popAbilitysupMBound:setName("popAbilitysupMBound");
    obj.popAbilitysupMBound:setWidth(300);
    obj.popAbilitysupMBound:setHeight(200);
    obj.popAbilitysupMBound:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupMBound, "autoScopeNode",  "false");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.popAbilitysupMBound);
    obj.label153:setLeft(05);
    obj.label153:setTop(5);
    obj.label153:setWidth(60);
    obj.label153:setHeight(20);
    obj.label153:setText("Descrição:");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.textEditor38 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor38:setParent(obj.popAbilitysupMBound);
    obj.textEditor38:setLeft(005);
    obj.textEditor38:setTop(30);
    obj.textEditor38:setHeight(165);
    obj.textEditor38:setWidth(290);
    obj.textEditor38:setField("DescricaosupMBound");
    obj.textEditor38:setText("As a creature of pure magic, the monster's mana is its lifeblood.  A Manabound monster whose Magic Points reach 0 is treated as if its Hit Points had been reduced to 0.");
    obj.textEditor38:setName("textEditor38");

    obj.checkBox243 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox243:setParent(obj.layout48);
    obj.checkBox243:setLeft(000);
    obj.checkBox243:setTop(000);
    obj.checkBox243:setHeight(20);
    obj.checkBox243:setWidth(150);
    obj.checkBox243:setText("Manabound");
    obj.checkBox243:setField("supMBound");
    lfm_setPropAsString(obj.checkBox243, "fontStyle",  "bold");
    obj.checkBox243:setName("checkBox243");

    obj.BotaosupMBound = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupMBound:setParent(obj.layout48);
    obj.BotaosupMBound:setLeft(175);
    obj.BotaosupMBound:setTop(000);
    obj.BotaosupMBound:setWidth(23);
    obj.BotaosupMBound:setHeight(25);
    obj.BotaosupMBound:setText("i");
    obj.BotaosupMBound:setName("BotaosupMBound");

    obj.popAbilitysupMinion = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupMinion:setParent(obj.layout48);
    obj.popAbilitysupMinion:setName("popAbilitysupMinion");
    obj.popAbilitysupMinion:setWidth(300);
    obj.popAbilitysupMinion:setHeight(200);
    obj.popAbilitysupMinion:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupMinion, "autoScopeNode",  "false");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.popAbilitysupMinion);
    obj.label154:setLeft(05);
    obj.label154:setTop(5);
    obj.label154:setWidth(60);
    obj.label154:setHeight(20);
    obj.label154:setText("Descrição:");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.textEditor39 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor39:setParent(obj.popAbilitysupMinion);
    obj.textEditor39:setLeft(005);
    obj.textEditor39:setTop(30);
    obj.textEditor39:setHeight(165);
    obj.textEditor39:setWidth(290);
    obj.textEditor39:setField("DescricaosupMinion");
    obj.textEditor39:setText("The monster’s existence is tied to another monster’s, usually a controlling or summoning influence.  Select a specific monster as the designated ‘master’ when taking Minion; if that monster is reduced to 0 or fewer HP during the course of battle, all Minions attached to it are immediately reduced to 0 HP as well..");
    obj.textEditor39:setName("textEditor39");

    obj.checkBox244 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox244:setParent(obj.layout48);
    obj.checkBox244:setLeft(000);
    obj.checkBox244:setTop(025);
    obj.checkBox244:setHeight(20);
    obj.checkBox244:setWidth(150);
    obj.checkBox244:setText("Minion");
    obj.checkBox244:setField("supMinion");
    lfm_setPropAsString(obj.checkBox244, "fontStyle",  "bold");
    obj.checkBox244:setName("checkBox244");

    obj.BotaosupMinion = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupMinion:setParent(obj.layout48);
    obj.BotaosupMinion:setLeft(175);
    obj.BotaosupMinion:setTop(025);
    obj.BotaosupMinion:setWidth(23);
    obj.BotaosupMinion:setHeight(25);
    obj.BotaosupMinion:setText("i");
    obj.BotaosupMinion:setName("BotaosupMinion");

    obj.popAbilitysupMRes = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupMRes:setParent(obj.layout48);
    obj.popAbilitysupMRes:setName("popAbilitysupMRes");
    obj.popAbilitysupMRes:setWidth(300);
    obj.popAbilitysupMRes:setHeight(200);
    obj.popAbilitysupMRes:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupMRes, "autoScopeNode",  "false");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.popAbilitysupMRes);
    obj.label155:setLeft(05);
    obj.label155:setTop(5);
    obj.label155:setWidth(60);
    obj.label155:setHeight(20);
    obj.label155:setText("Descrição:");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.textEditor40 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor40:setParent(obj.popAbilitysupMRes);
    obj.textEditor40:setLeft(005);
    obj.textEditor40:setTop(30);
    obj.textEditor40:setHeight(165);
    obj.textEditor40:setWidth(290);
    obj.textEditor40:setField("DescricaosupMRes");
    obj.textEditor40:setText("The monster is capable of weathering significantly more magical damage than the norm, allowing it to resist even armorpiercing spells.  When a monster with Mystic Resistance is struck by any attack or Ability which would normally ignore or reduce M. ARM, M. ARM is factored into the attack as normal.  Note that this does not affect Status Conditions such as Spirit Break, which continue to work as normal.");
    obj.textEditor40:setName("textEditor40");

    obj.checkBox245 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox245:setParent(obj.layout48);
    obj.checkBox245:setLeft(000);
    obj.checkBox245:setTop(050);
    obj.checkBox245:setHeight(20);
    obj.checkBox245:setWidth(150);
    obj.checkBox245:setText("Mystic Resistance");
    obj.checkBox245:setField("supMRes");
    lfm_setPropAsString(obj.checkBox245, "fontStyle",  "bold");
    obj.checkBox245:setName("checkBox245");

    obj.BotaosupMRes = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupMRes:setParent(obj.layout48);
    obj.BotaosupMRes:setLeft(175);
    obj.BotaosupMRes:setTop(050);
    obj.BotaosupMRes:setWidth(23);
    obj.BotaosupMRes:setHeight(25);
    obj.BotaosupMRes:setText("i");
    obj.BotaosupMRes:setName("BotaosupMRes");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox6);
    obj.layout49:setLeft(700);
    obj.layout49:setTop(350);
    obj.layout49:setHeight(100);
    obj.layout49:setWidth(200);
    obj.layout49:setName("layout49");

    obj.popAbilitysupNDrain = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupNDrain:setParent(obj.layout49);
    obj.popAbilitysupNDrain:setName("popAbilitysupNDrain");
    obj.popAbilitysupNDrain:setWidth(300);
    obj.popAbilitysupNDrain:setHeight(200);
    obj.popAbilitysupNDrain:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupNDrain, "autoScopeNode",  "false");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.popAbilitysupNDrain);
    obj.label156:setLeft(05);
    obj.label156:setTop(5);
    obj.label156:setWidth(60);
    obj.label156:setHeight(20);
    obj.label156:setText("Descrição:");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.textEditor41 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor41:setParent(obj.popAbilitysupNDrain);
    obj.textEditor41:setLeft(005);
    obj.textEditor41:setTop(30);
    obj.textEditor41:setHeight(165);
    obj.textEditor41:setWidth(290);
    obj.textEditor41:setField("DescricaosupNDrain");
    obj.textEditor41:setText("The monster is immune to attacks which draw on its vital or magical essences.  Attacks or Abilities that drain HP or MP from a monster with Null Drain do damage as normal, but do not restore the attacker’s Hit Points or Magic Points.");
    obj.textEditor41:setName("textEditor41");

    obj.checkBox246 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox246:setParent(obj.layout49);
    obj.checkBox246:setLeft(000);
    obj.checkBox246:setTop(000);
    obj.checkBox246:setHeight(20);
    obj.checkBox246:setWidth(150);
    obj.checkBox246:setText("Null Drain");
    obj.checkBox246:setField("supNDrain");
    lfm_setPropAsString(obj.checkBox246, "fontStyle",  "bold");
    obj.checkBox246:setName("checkBox246");

    obj.BotaosupNDrain = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupNDrain:setParent(obj.layout49);
    obj.BotaosupNDrain:setLeft(175);
    obj.BotaosupNDrain:setTop(000);
    obj.BotaosupNDrain:setWidth(23);
    obj.BotaosupNDrain:setHeight(25);
    obj.BotaosupNDrain:setText("i");
    obj.BotaosupNDrain:setName("BotaosupNDrain");

    obj.popAbilitysupRDrain = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupRDrain:setParent(obj.layout49);
    obj.popAbilitysupRDrain:setName("popAbilitysupRDrain");
    obj.popAbilitysupRDrain:setWidth(300);
    obj.popAbilitysupRDrain:setHeight(200);
    obj.popAbilitysupRDrain:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupRDrain, "autoScopeNode",  "false");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.popAbilitysupRDrain);
    obj.label157:setLeft(05);
    obj.label157:setTop(5);
    obj.label157:setWidth(60);
    obj.label157:setHeight(20);
    obj.label157:setText("Descrição:");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.textEditor42 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor42:setParent(obj.popAbilitysupRDrain);
    obj.textEditor42:setLeft(005);
    obj.textEditor42:setTop(30);
    obj.textEditor42:setHeight(165);
    obj.textEditor42:setWidth(290);
    obj.textEditor42:setField("DescricaosupRDrain");
    obj.textEditor42:setText("The monster has improved resistance against attacks which draw on its vital or magical essences.  Attacks or Abilities that drain HP or MP from a monster with Resist Drain do damage as normal, but only restore 50% of the Hit Points or Magic Points the attacker would normally regain from such an Action.");
    obj.textEditor42:setName("textEditor42");

    obj.checkBox247 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox247:setParent(obj.layout49);
    obj.checkBox247:setLeft(000);
    obj.checkBox247:setTop(025);
    obj.checkBox247:setHeight(20);
    obj.checkBox247:setWidth(150);
    obj.checkBox247:setText("Resist Drain");
    obj.checkBox247:setField("supRDrain");
    lfm_setPropAsString(obj.checkBox247, "fontStyle",  "bold");
    obj.checkBox247:setName("checkBox247");

    obj.BotaosupRDrain = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupRDrain:setParent(obj.layout49);
    obj.BotaosupRDrain:setLeft(175);
    obj.BotaosupRDrain:setTop(025);
    obj.BotaosupRDrain:setWidth(23);
    obj.BotaosupRDrain:setHeight(25);
    obj.BotaosupRDrain:setText("i");
    obj.BotaosupRDrain:setName("BotaosupRDrain");

    obj.popAbilitysupXFight = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitysupXFight:setParent(obj.layout49);
    obj.popAbilitysupXFight:setName("popAbilitysupXFight");
    obj.popAbilitysupXFight:setWidth(300);
    obj.popAbilitysupXFight:setHeight(200);
    obj.popAbilitysupXFight:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitysupXFight, "autoScopeNode",  "false");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.popAbilitysupXFight);
    obj.label158:setLeft(05);
    obj.label158:setTop(5);
    obj.label158:setWidth(60);
    obj.label158:setHeight(20);
    obj.label158:setText("Descrição:");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.textEditor43 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor43:setParent(obj.popAbilitysupXFight);
    obj.textEditor43:setLeft(005);
    obj.textEditor43:setTop(30);
    obj.textEditor43:setHeight(165);
    obj.textEditor43:setWidth(290);
    obj.textEditor43:setField("DescricaosupXFight");
    obj.textEditor43:setText("The monster can take two Attack Actions at the cost of just one Action in battle.  Targets must be declared separately for each attack, though both may target the same combatant.");
    obj.textEditor43:setName("textEditor43");

    obj.checkBox248 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox248:setParent(obj.layout49);
    obj.checkBox248:setLeft(000);
    obj.checkBox248:setTop(050);
    obj.checkBox248:setHeight(20);
    obj.checkBox248:setWidth(150);
    obj.checkBox248:setText("X-Fight");
    obj.checkBox248:setField("supXFight");
    lfm_setPropAsString(obj.checkBox248, "fontStyle",  "bold");
    obj.checkBox248:setName("checkBox248");

    obj.BotaosupXFight = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaosupXFight:setParent(obj.layout49);
    obj.BotaosupXFight:setLeft(175);
    obj.BotaosupXFight:setTop(050);
    obj.BotaosupXFight:setWidth(23);
    obj.BotaosupXFight:setHeight(25);
    obj.BotaosupXFight:setText("i");
    obj.BotaosupXFight:setName("BotaosupXFight");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox6);
    obj.layout50:setLeft(1000);
    obj.layout50:setTop(570);
    obj.layout50:setHeight(50);
    obj.layout50:setWidth(90);
    obj.layout50:setName("layout50");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout50);
    obj.label159:setLeft(000);
    obj.label159:setTop(000);
    obj.label159:setHeight(20);
    obj.label159:setWidth(30);
    obj.label159:setText("Exp");
    obj.label159:setAutoSize(true);
    obj.label159:setName("label159");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout50);
    obj.edit241:setLeft(035);
    obj.edit241:setTop(000);
    obj.edit241:setHeight(20);
    obj.edit241:setWidth(50);
    obj.edit241:setField("ExpFinal");
    obj.edit241:setHorzTextAlign("center");
    obj.edit241:setName("edit241");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout50);
    obj.label160:setLeft(000);
    obj.label160:setTop(025);
    obj.label160:setHeight(20);
    obj.label160:setWidth(30);
    obj.label160:setText("Gil");
    obj.label160:setAutoSize(true);
    obj.label160:setName("label160");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout50);
    obj.edit242:setLeft(35);
    obj.edit242:setTop(025);
    obj.edit242:setHeight(20);
    obj.edit242:setWidth(50);
    obj.edit242:setField("GilFinal");
    obj.edit242:setHorzTextAlign("center");
    obj.edit242:setName("edit242");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Support C");
    obj.tab7:setName("tab7");

    obj.frmSupportC = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSupportC:setParent(obj.tab7);
    obj.frmSupportC:setName("frmSupportC");
    obj.frmSupportC:setAlign("client");
    obj.frmSupportC:setTheme("dark");
    obj.frmSupportC:setMargins({top=1});

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.frmSupportC);
    obj.layout51:setLeft(000);
    obj.layout51:setTop(000);
    obj.layout51:setHeight(650);
    obj.layout51:setWidth(1100);
    obj.layout51:setName("layout51");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout51);
    obj.image8:setLeft(000);
    obj.image8:setTop(000);
    obj.image8:setHeight(650);
    obj.image8:setWidth(1100);
    obj.image8:setSRC("/img/wallpaper.png");
    obj.image8:setStyle("autoFit");
    obj.image8:setName("image8");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmSupportC);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox7);
    obj.layout52:setLeft(60);
    obj.layout52:setTop(20);
    obj.layout52:setHeight(550);
    obj.layout52:setWidth(380);
    obj.layout52:setName("layout52");

    obj.popAbilitynamStatweak = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamStatweak:setParent(obj.layout52);
    obj.popAbilitynamStatweak:setName("popAbilitynamStatweak");
    obj.popAbilitynamStatweak:setWidth(300);
    obj.popAbilitynamStatweak:setHeight(200);
    obj.popAbilitynamStatweak:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamStatweak, "autoScopeNode",  "false");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.popAbilitynamStatweak);
    obj.label161:setLeft(05);
    obj.label161:setTop(5);
    obj.label161:setWidth(60);
    obj.label161:setHeight(20);
    obj.label161:setText("Descrição:");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.textEditor44 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor44:setParent(obj.popAbilitynamStatweak);
    obj.textEditor44:setLeft(005);
    obj.textEditor44:setTop(30);
    obj.textEditor44:setHeight(165);
    obj.textEditor44:setWidth(290);
    obj.textEditor44:setField("DescricaonamStatweak");
    obj.textEditor44:setText("The monster is vulnerable to a certain kind of attack or effect. Select a single Ability, Item, or damage type as a vulnerability when adding Weak Spot to a monster, as well as one or more negative Status Conditions. \n If an attack or effect the monster is vulnerable to is used on it, the selected Status Condition – or Conditions – will automatically be added to the monster. XP and Gil modifiers for Weak Spot depend on the actual Condition inflicted, and are given per Status – to have a monster suffer from Confuse and Slow if struck by Lightning Elemental damage, for instance, incurs a modifier of -29/-9.");
    obj.textEditor44:setName("textEditor44");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout52);
    obj.label162:setLeft(000);
    obj.label162:setTop(000);
    obj.label162:setHeight(20);
    obj.label162:setWidth(170);
    obj.label162:setText("Status Weakness");
    lfm_setPropAsString(obj.label162, "fontStyle",  "bold");
    obj.label162:setName("label162");

    obj.BotaonamStatweak = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamStatweak:setParent(obj.layout52);
    obj.BotaonamStatweak:setLeft(175);
    obj.BotaonamStatweak:setTop(000);
    obj.BotaonamStatweak:setWidth(23);
    obj.BotaonamStatweak:setHeight(25);
    obj.BotaonamStatweak:setText("i");
    obj.BotaonamStatweak:setName("BotaonamStatweak");

    obj.checkBox249 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox249:setParent(obj.layout52);
    obj.checkBox249:setLeft(000);
    obj.checkBox249:setTop(025);
    obj.checkBox249:setHeight(20);
    obj.checkBox249:setWidth(120);
    obj.checkBox249:setText("Berserk (4)");
    obj.checkBox249:setField("weakBerserk");
    obj.checkBox249:setName("checkBox249");

    obj.checkBox250 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox250:setParent(obj.layout52);
    obj.checkBox250:setLeft(000);
    obj.checkBox250:setTop(050);
    obj.checkBox250:setHeight(20);
    obj.checkBox250:setWidth(120);
    obj.checkBox250:setText("Blind (4)");
    obj.checkBox250:setField("weakBlind");
    obj.checkBox250:setName("checkBox250");

    obj.checkBox251 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox251:setParent(obj.layout52);
    obj.checkBox251:setLeft(000);
    obj.checkBox251:setTop(075);
    obj.checkBox251:setHeight(20);
    obj.checkBox251:setWidth(120);
    obj.checkBox251:setText("Immobilize (4)");
    obj.checkBox251:setField("weakImmobilize");
    obj.checkBox251:setName("checkBox251");

    obj.checkBox252 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox252:setParent(obj.layout52);
    obj.checkBox252:setLeft(000);
    obj.checkBox252:setTop(100);
    obj.checkBox252:setHeight(20);
    obj.checkBox252:setWidth(120);
    obj.checkBox252:setText("Poison (∞)");
    obj.checkBox252:setField("weakPoison");
    obj.checkBox252:setName("checkBox252");

    obj.checkBox253 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox253:setParent(obj.layout52);
    obj.checkBox253:setLeft(000);
    obj.checkBox253:setTop(125);
    obj.checkBox253:setHeight(20);
    obj.checkBox253:setWidth(120);
    obj.checkBox253:setText("Sleep (4)");
    obj.checkBox253:setField("weakSleep");
    obj.checkBox253:setName("checkBox253");

    obj.checkBox254 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox254:setParent(obj.layout52);
    obj.checkBox254:setLeft(000);
    obj.checkBox254:setTop(150);
    obj.checkBox254:setHeight(20);
    obj.checkBox254:setWidth(120);
    obj.checkBox254:setText("Slow (4)");
    obj.checkBox254:setField("weakSlow");
    obj.checkBox254:setName("checkBox254");

    obj.checkBox255 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox255:setParent(obj.layout52);
    obj.checkBox255:setLeft(000);
    obj.checkBox255:setTop(175);
    obj.checkBox255:setHeight(20);
    obj.checkBox255:setWidth(120);
    obj.checkBox255:setText("Zombie (∞)");
    obj.checkBox255:setField("weakZombie");
    obj.checkBox255:setName("checkBox255");

    obj.checkBox256 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox256:setParent(obj.layout52);
    obj.checkBox256:setLeft(000);
    obj.checkBox256:setTop(225);
    obj.checkBox256:setHeight(20);
    obj.checkBox256:setWidth(120);
    obj.checkBox256:setText("Condemn (4)");
    obj.checkBox256:setField("weakCondemn");
    obj.checkBox256:setName("checkBox256");

    obj.checkBox257 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox257:setParent(obj.layout52);
    obj.checkBox257:setLeft(000);
    obj.checkBox257:setTop(250);
    obj.checkBox257:setHeight(20);
    obj.checkBox257:setWidth(120);
    obj.checkBox257:setText("Confuse (4)");
    obj.checkBox257:setField("weakConfuse");
    obj.checkBox257:setName("checkBox257");

    obj.checkBox258 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox258:setParent(obj.layout52);
    obj.checkBox258:setLeft(000);
    obj.checkBox258:setTop(275);
    obj.checkBox258:setHeight(20);
    obj.checkBox258:setWidth(120);
    obj.checkBox258:setText("Curse (4)");
    obj.checkBox258:setField("weakCurse");
    obj.checkBox258:setName("checkBox258");

    obj.checkBox259 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox259:setParent(obj.layout52);
    obj.checkBox259:setLeft(000);
    obj.checkBox259:setTop(300);
    obj.checkBox259:setHeight(20);
    obj.checkBox259:setWidth(120);
    obj.checkBox259:setText("Disable (4)");
    obj.checkBox259:setField("weakDisable");
    obj.checkBox259:setName("checkBox259");

    obj.checkBox260 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox260:setParent(obj.layout52);
    obj.checkBox260:setLeft(000);
    obj.checkBox260:setTop(325);
    obj.checkBox260:setHeight(20);
    obj.checkBox260:setWidth(120);
    obj.checkBox260:setText("Petrify (4)");
    obj.checkBox260:setField("weakPetrify");
    obj.checkBox260:setName("checkBox260");

    obj.checkBox261 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox261:setParent(obj.layout52);
    obj.checkBox261:setLeft(000);
    obj.checkBox261:setTop(350);
    obj.checkBox261:setHeight(20);
    obj.checkBox261:setWidth(120);
    obj.checkBox261:setText("Silence (4)");
    obj.checkBox261:setField("weakSilence");
    obj.checkBox261:setName("checkBox261");

    obj.checkBox262 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox262:setParent(obj.layout52);
    obj.checkBox262:setLeft(000);
    obj.checkBox262:setTop(375);
    obj.checkBox262:setHeight(20);
    obj.checkBox262:setWidth(120);
    obj.checkBox262:setText("Sap (4)");
    obj.checkBox262:setField("weakSap");
    obj.checkBox262:setName("checkBox262");

    obj.checkBox263 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox263:setParent(obj.layout52);
    obj.checkBox263:setLeft(000);
    obj.checkBox263:setTop(400);
    obj.checkBox263:setHeight(20);
    obj.checkBox263:setWidth(120);
    obj.checkBox263:setText("Unaware (1)");
    obj.checkBox263:setField("weakUnaware");
    obj.checkBox263:setName("checkBox263");

    obj.checkBox264 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox264:setParent(obj.layout52);
    obj.checkBox264:setLeft(000);
    obj.checkBox264:setTop(425);
    obj.checkBox264:setHeight(20);
    obj.checkBox264:setWidth(120);
    obj.checkBox264:setText("Eject");
    obj.checkBox264:setField("weakEject");
    obj.checkBox264:setName("checkBox264");

    obj.checkBox265 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox265:setParent(obj.layout52);
    obj.checkBox265:setLeft(000);
    obj.checkBox265:setTop(450);
    obj.checkBox265:setHeight(20);
    obj.checkBox265:setWidth(120);
    obj.checkBox265:setText("Mini (4)");
    obj.checkBox265:setField("weakMini");
    obj.checkBox265:setName("checkBox265");

    obj.checkBox266 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox266:setParent(obj.layout52);
    obj.checkBox266:setLeft(000);
    obj.checkBox266:setTop(475);
    obj.checkBox266:setHeight(20);
    obj.checkBox266:setWidth(120);
    obj.checkBox266:setText("Strength Down (6)");
    obj.checkBox266:setField("weakSTRDown");
    obj.checkBox266:setName("checkBox266");

    obj.checkBox267 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox267:setParent(obj.layout52);
    obj.checkBox267:setLeft(000);
    obj.checkBox267:setTop(500);
    obj.checkBox267:setHeight(20);
    obj.checkBox267:setWidth(120);
    obj.checkBox267:setText("Agility Down (6)");
    obj.checkBox267:setField("weakAGIDown");
    obj.checkBox267:setName("checkBox267");

    obj.checkBox268 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox268:setParent(obj.layout52);
    obj.checkBox268:setLeft(000);
    obj.checkBox268:setTop(525);
    obj.checkBox268:setHeight(20);
    obj.checkBox268:setWidth(120);
    obj.checkBox268:setText("Magic Down (6)");
    obj.checkBox268:setField("weakMAGDown");
    obj.checkBox268:setName("checkBox268");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox7);
    obj.layout53:setLeft(200);
    obj.layout53:setTop(20);
    obj.layout53:setHeight(550);
    obj.layout53:setWidth(380);
    obj.layout53:setName("layout53");

    obj.checkBox269 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox269:setParent(obj.layout53);
    obj.checkBox269:setLeft(000);
    obj.checkBox269:setTop(025);
    obj.checkBox269:setHeight(20);
    obj.checkBox269:setWidth(120);
    obj.checkBox269:setText("Mental Down (6)");
    obj.checkBox269:setField("weakMENDown");
    obj.checkBox269:setName("checkBox269");

    obj.checkBox270 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox270:setParent(obj.layout53);
    obj.checkBox270:setLeft(000);
    obj.checkBox270:setTop(050);
    obj.checkBox270:setHeight(20);
    obj.checkBox270:setWidth(120);
    obj.checkBox270:setText("Armor Down (6)");
    obj.checkBox270:setField("weakARMDown");
    obj.checkBox270:setName("checkBox270");

    obj.checkBox271 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox271:setParent(obj.layout53);
    obj.checkBox271:setLeft(000);
    obj.checkBox271:setTop(075);
    obj.checkBox271:setHeight(20);
    obj.checkBox271:setWidth(120);
    obj.checkBox271:setText("Spirit Down (6)");
    obj.checkBox271:setField("weakSPIDown");
    obj.checkBox271:setName("checkBox271");

    obj.checkBox272 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox272:setParent(obj.layout53);
    obj.checkBox272:setLeft(000);
    obj.checkBox272:setTop(100);
    obj.checkBox272:setHeight(20);
    obj.checkBox272:setWidth(120);
    obj.checkBox272:setText("Strength Break (6)");
    obj.checkBox272:setField("weakSTRBrk");
    obj.checkBox272:setName("checkBox272");

    obj.checkBox273 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox273:setParent(obj.layout53);
    obj.checkBox273:setLeft(000);
    obj.checkBox273:setTop(125);
    obj.checkBox273:setHeight(20);
    obj.checkBox273:setWidth(120);
    obj.checkBox273:setText("Agility Break (6)");
    obj.checkBox273:setField("weakAGIBrk");
    obj.checkBox273:setName("checkBox273");

    obj.checkBox274 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox274:setParent(obj.layout53);
    obj.checkBox274:setLeft(000);
    obj.checkBox274:setTop(150);
    obj.checkBox274:setHeight(20);
    obj.checkBox274:setWidth(120);
    obj.checkBox274:setText("Magic Break (6)");
    obj.checkBox274:setField("weakMAGBrk");
    obj.checkBox274:setName("checkBox274");

    obj.checkBox275 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox275:setParent(obj.layout53);
    obj.checkBox275:setLeft(000);
    obj.checkBox275:setTop(175);
    obj.checkBox275:setHeight(20);
    obj.checkBox275:setWidth(120);
    obj.checkBox275:setText("Mental Break (6)");
    obj.checkBox275:setField("weakMENBrk");
    obj.checkBox275:setName("checkBox275");

    obj.checkBox276 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox276:setParent(obj.layout53);
    obj.checkBox276:setLeft(000);
    obj.checkBox276:setTop(200);
    obj.checkBox276:setHeight(20);
    obj.checkBox276:setWidth(120);
    obj.checkBox276:setText("Armor Break (6)");
    obj.checkBox276:setField("weakARMBrk");
    obj.checkBox276:setName("checkBox276");

    obj.checkBox277 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox277:setParent(obj.layout53);
    obj.checkBox277:setLeft(000);
    obj.checkBox277:setTop(225);
    obj.checkBox277:setHeight(20);
    obj.checkBox277:setWidth(120);
    obj.checkBox277:setText("Spirit Break (6)");
    obj.checkBox277:setField("weakSPIBrk");
    obj.checkBox277:setName("checkBox277");

    obj.checkBox278 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox278:setParent(obj.layout53);
    obj.checkBox278:setLeft(000);
    obj.checkBox278:setTop(250);
    obj.checkBox278:setHeight(20);
    obj.checkBox278:setWidth(120);
    obj.checkBox278:setText("Stop (4)");
    obj.checkBox278:setField("weakStop");
    obj.checkBox278:setName("checkBox278");

    obj.checkBox279 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox279:setParent(obj.layout53);
    obj.checkBox279:setLeft(000);
    obj.checkBox279:setTop(275);
    obj.checkBox279:setHeight(20);
    obj.checkBox279:setWidth(120);
    obj.checkBox279:setText("Toad (4)");
    obj.checkBox279:setField("weakToad");
    obj.checkBox279:setName("checkBox279");

    obj.checkBox280 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox280:setParent(obj.layout53);
    obj.checkBox280:setLeft(000);
    obj.checkBox280:setTop(300);
    obj.checkBox280:setHeight(20);
    obj.checkBox280:setWidth(120);
    obj.checkBox280:setText("Venom (4)");
    obj.checkBox280:setField("weakVenom");
    obj.checkBox280:setName("checkBox280");

    obj.checkBox281 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox281:setParent(obj.layout53);
    obj.checkBox281:setLeft(000);
    obj.checkBox281:setTop(350);
    obj.checkBox281:setHeight(20);
    obj.checkBox281:setWidth(120);
    obj.checkBox281:setText("Charm (4)");
    obj.checkBox281:setField("weakCharm");
    obj.checkBox281:setName("checkBox281");

    obj.checkBox282 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox282:setParent(obj.layout53);
    obj.checkBox282:setLeft(000);
    obj.checkBox282:setTop(375);
    obj.checkBox282:setHeight(20);
    obj.checkBox282:setWidth(120);
    obj.checkBox282:setText("Death");
    obj.checkBox282:setField("weakDeath");
    obj.checkBox282:setName("checkBox282");

    obj.checkBox283 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox283:setParent(obj.layout53);
    obj.checkBox283:setLeft(000);
    obj.checkBox283:setTop(400);
    obj.checkBox283:setHeight(20);
    obj.checkBox283:setWidth(120);
    obj.checkBox283:setText("Frozen (4)");
    obj.checkBox283:setField("weakFrozen");
    obj.checkBox283:setName("checkBox283");

    obj.checkBox284 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox284:setParent(obj.layout53);
    obj.checkBox284:setLeft(000);
    obj.checkBox284:setTop(450);
    obj.checkBox284:setHeight(20);
    obj.checkBox284:setWidth(120);
    obj.checkBox284:setText("Heat (4)");
    obj.checkBox284:setField("weakHeat");
    obj.checkBox284:setName("checkBox284");

    obj.checkBox285 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox285:setParent(obj.layout53);
    obj.checkBox285:setLeft(000);
    obj.checkBox285:setTop(475);
    obj.checkBox285:setHeight(20);
    obj.checkBox285:setWidth(120);
    obj.checkBox285:setText("Meltdown (2)");
    obj.checkBox285:setField("weakMeltdown");
    obj.checkBox285:setName("checkBox285");

    obj.checkBox286 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox286:setParent(obj.layout53);
    obj.checkBox286:setLeft(000);
    obj.checkBox286:setTop(500);
    obj.checkBox286:setHeight(20);
    obj.checkBox286:setWidth(120);
    obj.checkBox286:setText("Stone (∞)");
    obj.checkBox286:setField("weakStone");
    obj.checkBox286:setName("checkBox286");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox7);
    obj.layout54:setLeft(350);
    obj.layout54:setTop(20);
    obj.layout54:setHeight(550);
    obj.layout54:setWidth(380);
    obj.layout54:setName("layout54");

    obj.popAbilitynamStatRes = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamStatRes:setParent(obj.layout54);
    obj.popAbilitynamStatRes:setName("popAbilitynamStatRes");
    obj.popAbilitynamStatRes:setWidth(300);
    obj.popAbilitynamStatRes:setHeight(200);
    obj.popAbilitynamStatRes:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamStatRes, "autoScopeNode",  "false");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.popAbilitynamStatRes);
    obj.label163:setLeft(05);
    obj.label163:setTop(5);
    obj.label163:setWidth(60);
    obj.label163:setHeight(20);
    obj.label163:setText("Descrição:");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.textEditor45 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor45:setParent(obj.popAbilitynamStatRes);
    obj.textEditor45:setLeft(005);
    obj.textEditor45:setTop(30);
    obj.textEditor45:setHeight(165);
    obj.textEditor45:setWidth(290);
    obj.textEditor45:setField("DescricaonamStatRes");
    obj.textEditor45:setText("The monster is partially immune to the effects of a particular Status Condition. \n Any rolls to inflict this Status Condition have their CoS reduced by -50%. Gil and XP modifiers depend on the Class of Status Condition the monster is Immune to");
    obj.textEditor45:setName("textEditor45");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout54);
    obj.label164:setLeft(000);
    obj.label164:setTop(000);
    obj.label164:setHeight(20);
    obj.label164:setWidth(170);
    obj.label164:setText("Status Resistance (Single)");
    lfm_setPropAsString(obj.label164, "fontStyle",  "bold");
    obj.label164:setName("label164");

    obj.BotaonamStatRes = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamStatRes:setParent(obj.layout54);
    obj.BotaonamStatRes:setLeft(175);
    obj.BotaonamStatRes:setTop(000);
    obj.BotaonamStatRes:setWidth(23);
    obj.BotaonamStatRes:setHeight(25);
    obj.BotaonamStatRes:setText("i");
    obj.BotaonamStatRes:setName("BotaonamStatRes");

    obj.checkBox287 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox287:setParent(obj.layout54);
    obj.checkBox287:setLeft(000);
    obj.checkBox287:setTop(025);
    obj.checkBox287:setHeight(20);
    obj.checkBox287:setWidth(120);
    obj.checkBox287:setText("Berserk");
    obj.checkBox287:setField("resBerserk");
    obj.checkBox287:setName("checkBox287");

    obj.checkBox288 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox288:setParent(obj.layout54);
    obj.checkBox288:setLeft(000);
    obj.checkBox288:setTop(050);
    obj.checkBox288:setHeight(20);
    obj.checkBox288:setWidth(120);
    obj.checkBox288:setText("Blind");
    obj.checkBox288:setField("resBlind");
    obj.checkBox288:setName("checkBox288");

    obj.checkBox289 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox289:setParent(obj.layout54);
    obj.checkBox289:setLeft(000);
    obj.checkBox289:setTop(075);
    obj.checkBox289:setHeight(20);
    obj.checkBox289:setWidth(120);
    obj.checkBox289:setText("Immobilize");
    obj.checkBox289:setField("resImmobilize");
    obj.checkBox289:setName("checkBox289");

    obj.checkBox290 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox290:setParent(obj.layout54);
    obj.checkBox290:setLeft(000);
    obj.checkBox290:setTop(100);
    obj.checkBox290:setHeight(20);
    obj.checkBox290:setWidth(120);
    obj.checkBox290:setText("Poison");
    obj.checkBox290:setField("resPoison");
    obj.checkBox290:setName("checkBox290");

    obj.checkBox291 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox291:setParent(obj.layout54);
    obj.checkBox291:setLeft(000);
    obj.checkBox291:setTop(125);
    obj.checkBox291:setHeight(20);
    obj.checkBox291:setWidth(120);
    obj.checkBox291:setText("Sleep");
    obj.checkBox291:setField("resSleep");
    obj.checkBox291:setName("checkBox291");

    obj.checkBox292 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox292:setParent(obj.layout54);
    obj.checkBox292:setLeft(000);
    obj.checkBox292:setTop(150);
    obj.checkBox292:setHeight(20);
    obj.checkBox292:setWidth(120);
    obj.checkBox292:setText("Slow");
    obj.checkBox292:setField("resSlow");
    obj.checkBox292:setName("checkBox292");

    obj.checkBox293 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox293:setParent(obj.layout54);
    obj.checkBox293:setLeft(000);
    obj.checkBox293:setTop(175);
    obj.checkBox293:setHeight(20);
    obj.checkBox293:setWidth(120);
    obj.checkBox293:setText("Zombie");
    obj.checkBox293:setField("resZombie");
    obj.checkBox293:setName("checkBox293");

    obj.checkBox294 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox294:setParent(obj.layout54);
    obj.checkBox294:setLeft(000);
    obj.checkBox294:setTop(200);
    obj.checkBox294:setHeight(20);
    obj.checkBox294:setWidth(120);
    obj.checkBox294:setText("Lock");
    obj.checkBox294:setField("resLock");
    obj.checkBox294:setName("checkBox294");

    obj.checkBox295 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox295:setParent(obj.layout54);
    obj.checkBox295:setLeft(000);
    obj.checkBox295:setTop(225);
    obj.checkBox295:setHeight(20);
    obj.checkBox295:setWidth(120);
    obj.checkBox295:setText("Condemn");
    obj.checkBox295:setField("resCondemn");
    obj.checkBox295:setName("checkBox295");

    obj.checkBox296 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox296:setParent(obj.layout54);
    obj.checkBox296:setLeft(000);
    obj.checkBox296:setTop(250);
    obj.checkBox296:setHeight(20);
    obj.checkBox296:setWidth(120);
    obj.checkBox296:setText("Confuse");
    obj.checkBox296:setField("resConfuse");
    obj.checkBox296:setName("checkBox296");

    obj.checkBox297 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox297:setParent(obj.layout54);
    obj.checkBox297:setLeft(000);
    obj.checkBox297:setTop(275);
    obj.checkBox297:setHeight(20);
    obj.checkBox297:setWidth(120);
    obj.checkBox297:setText("Curse");
    obj.checkBox297:setField("resCurse");
    obj.checkBox297:setName("checkBox297");

    obj.checkBox298 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox298:setParent(obj.layout54);
    obj.checkBox298:setLeft(000);
    obj.checkBox298:setTop(300);
    obj.checkBox298:setHeight(20);
    obj.checkBox298:setWidth(120);
    obj.checkBox298:setText("Disable");
    obj.checkBox298:setField("resDisable");
    obj.checkBox298:setName("checkBox298");

    obj.checkBox299 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox299:setParent(obj.layout54);
    obj.checkBox299:setLeft(000);
    obj.checkBox299:setTop(325);
    obj.checkBox299:setHeight(20);
    obj.checkBox299:setWidth(120);
    obj.checkBox299:setText("Petrify");
    obj.checkBox299:setField("resPetrify");
    obj.checkBox299:setName("checkBox299");

    obj.checkBox300 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox300:setParent(obj.layout54);
    obj.checkBox300:setLeft(000);
    obj.checkBox300:setTop(350);
    obj.checkBox300:setHeight(20);
    obj.checkBox300:setWidth(120);
    obj.checkBox300:setText("Silence");
    obj.checkBox300:setField("resSilence");
    obj.checkBox300:setName("checkBox300");

    obj.checkBox301 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox301:setParent(obj.layout54);
    obj.checkBox301:setLeft(000);
    obj.checkBox301:setTop(375);
    obj.checkBox301:setHeight(20);
    obj.checkBox301:setWidth(120);
    obj.checkBox301:setText("Sap");
    obj.checkBox301:setField("resSap");
    obj.checkBox301:setName("checkBox301");

    obj.checkBox302 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox302:setParent(obj.layout54);
    obj.checkBox302:setLeft(000);
    obj.checkBox302:setTop(400);
    obj.checkBox302:setHeight(20);
    obj.checkBox302:setWidth(120);
    obj.checkBox302:setText("Unaware");
    obj.checkBox302:setField("resUnaware");
    obj.checkBox302:setName("checkBox302");

    obj.checkBox303 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox303:setParent(obj.layout54);
    obj.checkBox303:setLeft(000);
    obj.checkBox303:setTop(425);
    obj.checkBox303:setHeight(20);
    obj.checkBox303:setWidth(120);
    obj.checkBox303:setText("Eject");
    obj.checkBox303:setField("resEject");
    obj.checkBox303:setName("checkBox303");

    obj.checkBox304 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox304:setParent(obj.layout54);
    obj.checkBox304:setLeft(000);
    obj.checkBox304:setTop(450);
    obj.checkBox304:setHeight(20);
    obj.checkBox304:setWidth(120);
    obj.checkBox304:setText("Mini");
    obj.checkBox304:setField("resMini");
    obj.checkBox304:setName("checkBox304");

    obj.checkBox305 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox305:setParent(obj.layout54);
    obj.checkBox305:setLeft(000);
    obj.checkBox305:setTop(475);
    obj.checkBox305:setHeight(20);
    obj.checkBox305:setWidth(120);
    obj.checkBox305:setText("Strength Down");
    obj.checkBox305:setField("resSTRDown");
    obj.checkBox305:setName("checkBox305");

    obj.checkBox306 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox306:setParent(obj.layout54);
    obj.checkBox306:setLeft(000);
    obj.checkBox306:setTop(500);
    obj.checkBox306:setHeight(20);
    obj.checkBox306:setWidth(120);
    obj.checkBox306:setText("Agility Down");
    obj.checkBox306:setField("resAGIDown");
    obj.checkBox306:setName("checkBox306");

    obj.checkBox307 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox307:setParent(obj.layout54);
    obj.checkBox307:setLeft(000);
    obj.checkBox307:setTop(525);
    obj.checkBox307:setHeight(20);
    obj.checkBox307:setWidth(120);
    obj.checkBox307:setText("Magic Down");
    obj.checkBox307:setField("resMAGDown");
    obj.checkBox307:setName("checkBox307");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox7);
    obj.layout55:setLeft(490);
    obj.layout55:setTop(20);
    obj.layout55:setHeight(550);
    obj.layout55:setWidth(380);
    obj.layout55:setName("layout55");

    obj.checkBox308 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox308:setParent(obj.layout55);
    obj.checkBox308:setLeft(000);
    obj.checkBox308:setTop(025);
    obj.checkBox308:setHeight(20);
    obj.checkBox308:setWidth(120);
    obj.checkBox308:setText("Mental Down");
    obj.checkBox308:setField("resMENDown");
    obj.checkBox308:setName("checkBox308");

    obj.checkBox309 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox309:setParent(obj.layout55);
    obj.checkBox309:setLeft(000);
    obj.checkBox309:setTop(050);
    obj.checkBox309:setHeight(20);
    obj.checkBox309:setWidth(120);
    obj.checkBox309:setText("Armor Down");
    obj.checkBox309:setField("resARMDown");
    obj.checkBox309:setName("checkBox309");

    obj.checkBox310 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox310:setParent(obj.layout55);
    obj.checkBox310:setLeft(000);
    obj.checkBox310:setTop(075);
    obj.checkBox310:setHeight(20);
    obj.checkBox310:setWidth(120);
    obj.checkBox310:setText("Spirit Down");
    obj.checkBox310:setField("resSPIDown");
    obj.checkBox310:setName("checkBox310");

    obj.checkBox311 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox311:setParent(obj.layout55);
    obj.checkBox311:setLeft(000);
    obj.checkBox311:setTop(100);
    obj.checkBox311:setHeight(20);
    obj.checkBox311:setWidth(120);
    obj.checkBox311:setText("Strength Break");
    obj.checkBox311:setField("resSTRBrk");
    obj.checkBox311:setName("checkBox311");

    obj.checkBox312 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox312:setParent(obj.layout55);
    obj.checkBox312:setLeft(000);
    obj.checkBox312:setTop(125);
    obj.checkBox312:setHeight(20);
    obj.checkBox312:setWidth(120);
    obj.checkBox312:setText("Agility Break");
    obj.checkBox312:setField("resAGIBrk");
    obj.checkBox312:setName("checkBox312");

    obj.checkBox313 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox313:setParent(obj.layout55);
    obj.checkBox313:setLeft(000);
    obj.checkBox313:setTop(150);
    obj.checkBox313:setHeight(20);
    obj.checkBox313:setWidth(120);
    obj.checkBox313:setText("Magic Break");
    obj.checkBox313:setField("resMAGBrk");
    obj.checkBox313:setName("checkBox313");

    obj.checkBox314 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox314:setParent(obj.layout55);
    obj.checkBox314:setLeft(000);
    obj.checkBox314:setTop(175);
    obj.checkBox314:setHeight(20);
    obj.checkBox314:setWidth(120);
    obj.checkBox314:setText("Mental Break");
    obj.checkBox314:setField("resMENBrk");
    obj.checkBox314:setName("checkBox314");

    obj.checkBox315 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox315:setParent(obj.layout55);
    obj.checkBox315:setLeft(000);
    obj.checkBox315:setTop(200);
    obj.checkBox315:setHeight(20);
    obj.checkBox315:setWidth(120);
    obj.checkBox315:setText("Armor Break");
    obj.checkBox315:setField("resARMBrk");
    obj.checkBox315:setName("checkBox315");

    obj.checkBox316 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox316:setParent(obj.layout55);
    obj.checkBox316:setLeft(000);
    obj.checkBox316:setTop(225);
    obj.checkBox316:setHeight(20);
    obj.checkBox316:setWidth(120);
    obj.checkBox316:setText("Spirit Break");
    obj.checkBox316:setField("resSPIBrk");
    obj.checkBox316:setName("checkBox316");

    obj.checkBox317 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox317:setParent(obj.layout55);
    obj.checkBox317:setLeft(000);
    obj.checkBox317:setTop(250);
    obj.checkBox317:setHeight(20);
    obj.checkBox317:setWidth(120);
    obj.checkBox317:setText("Stop");
    obj.checkBox317:setField("resStop");
    obj.checkBox317:setName("checkBox317");

    obj.checkBox318 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox318:setParent(obj.layout55);
    obj.checkBox318:setLeft(000);
    obj.checkBox318:setTop(275);
    obj.checkBox318:setHeight(20);
    obj.checkBox318:setWidth(120);
    obj.checkBox318:setText("Toad");
    obj.checkBox318:setField("resToad");
    obj.checkBox318:setName("checkBox318");

    obj.checkBox319 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox319:setParent(obj.layout55);
    obj.checkBox319:setLeft(000);
    obj.checkBox319:setTop(300);
    obj.checkBox319:setHeight(20);
    obj.checkBox319:setWidth(120);
    obj.checkBox319:setText("Venom");
    obj.checkBox319:setField("resVenom");
    obj.checkBox319:setName("checkBox319");

    obj.checkBox320 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox320:setParent(obj.layout55);
    obj.checkBox320:setLeft(000);
    obj.checkBox320:setTop(325);
    obj.checkBox320:setHeight(20);
    obj.checkBox320:setWidth(120);
    obj.checkBox320:setText("Element Weak");
    obj.checkBox320:setField("resElemWeak");
    obj.checkBox320:setName("checkBox320");

    obj.checkBox321 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox321:setParent(obj.layout55);
    obj.checkBox321:setLeft(000);
    obj.checkBox321:setTop(350);
    obj.checkBox321:setHeight(20);
    obj.checkBox321:setWidth(120);
    obj.checkBox321:setText("Charm");
    obj.checkBox321:setField("resCharm");
    obj.checkBox321:setName("checkBox321");

    obj.checkBox322 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox322:setParent(obj.layout55);
    obj.checkBox322:setLeft(000);
    obj.checkBox322:setTop(375);
    obj.checkBox322:setHeight(20);
    obj.checkBox322:setWidth(120);
    obj.checkBox322:setText("Death");
    obj.checkBox322:setField("resDeath");
    obj.checkBox322:setName("checkBox322");

    obj.checkBox323 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox323:setParent(obj.layout55);
    obj.checkBox323:setLeft(000);
    obj.checkBox323:setTop(400);
    obj.checkBox323:setHeight(20);
    obj.checkBox323:setWidth(120);
    obj.checkBox323:setText("Frozen");
    obj.checkBox323:setField("resFrozen");
    obj.checkBox323:setName("checkBox323");

    obj.checkBox324 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox324:setParent(obj.layout55);
    obj.checkBox324:setLeft(000);
    obj.checkBox324:setTop(425);
    obj.checkBox324:setHeight(20);
    obj.checkBox324:setWidth(120);
    obj.checkBox324:setText("Gravity");
    obj.checkBox324:setField("resGravity");
    obj.checkBox324:setName("checkBox324");

    obj.checkBox325 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox325:setParent(obj.layout55);
    obj.checkBox325:setLeft(000);
    obj.checkBox325:setTop(450);
    obj.checkBox325:setHeight(20);
    obj.checkBox325:setWidth(120);
    obj.checkBox325:setText("Heat");
    obj.checkBox325:setField("resHeat");
    obj.checkBox325:setName("checkBox325");

    obj.checkBox326 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox326:setParent(obj.layout55);
    obj.checkBox326:setLeft(000);
    obj.checkBox326:setTop(475);
    obj.checkBox326:setHeight(20);
    obj.checkBox326:setWidth(120);
    obj.checkBox326:setText("Meltdown");
    obj.checkBox326:setField("resMeltdown");
    obj.checkBox326:setName("checkBox326");

    obj.checkBox327 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox327:setParent(obj.layout55);
    obj.checkBox327:setLeft(000);
    obj.checkBox327:setTop(500);
    obj.checkBox327:setHeight(20);
    obj.checkBox327:setWidth(120);
    obj.checkBox327:setText("Stone");
    obj.checkBox327:setField("resStone");
    obj.checkBox327:setName("checkBox327");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox7);
    obj.layout56:setLeft(640);
    obj.layout56:setTop(20);
    obj.layout56:setHeight(550);
    obj.layout56:setWidth(200);
    obj.layout56:setName("layout56");

    obj.popAbilitynamStatimm = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamStatimm:setParent(obj.layout56);
    obj.popAbilitynamStatimm:setName("popAbilitynamStatimm");
    obj.popAbilitynamStatimm:setWidth(300);
    obj.popAbilitynamStatimm:setHeight(200);
    obj.popAbilitynamStatimm:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamStatimm, "autoScopeNode",  "false");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.popAbilitynamStatimm);
    obj.label165:setLeft(05);
    obj.label165:setTop(5);
    obj.label165:setWidth(60);
    obj.label165:setHeight(20);
    obj.label165:setText("Descrição:");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.textEditor46 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor46:setParent(obj.popAbilitynamStatimm);
    obj.textEditor46:setLeft(005);
    obj.textEditor46:setTop(30);
    obj.textEditor46:setHeight(165);
    obj.textEditor46:setWidth(290);
    obj.textEditor46:setField("DescricaonamStatimm");
    obj.textEditor46:setText("The monster is wholly immune to the effects of a particular Status Condition. \n Any rolls to inflict this Status Condition have a CoS of 0. Gil and XP modifiers depend on the Class of Status Condition the monster is Immune to:");
    obj.textEditor46:setName("textEditor46");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout56);
    obj.label166:setLeft(000);
    obj.label166:setTop(000);
    obj.label166:setHeight(20);
    obj.label166:setWidth(170);
    obj.label166:setText("Status Immunity (Single)");
    lfm_setPropAsString(obj.label166, "fontStyle",  "bold");
    obj.label166:setName("label166");

    obj.BotaonamStatimm = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamStatimm:setParent(obj.layout56);
    obj.BotaonamStatimm:setLeft(175);
    obj.BotaonamStatimm:setTop(000);
    obj.BotaonamStatimm:setWidth(23);
    obj.BotaonamStatimm:setHeight(25);
    obj.BotaonamStatimm:setText("i");
    obj.BotaonamStatimm:setName("BotaonamStatimm");

    obj.checkBox328 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox328:setParent(obj.layout56);
    obj.checkBox328:setLeft(000);
    obj.checkBox328:setTop(025);
    obj.checkBox328:setHeight(20);
    obj.checkBox328:setWidth(120);
    obj.checkBox328:setText("Berserk");
    obj.checkBox328:setField("immBerserk");
    obj.checkBox328:setName("checkBox328");

    obj.checkBox329 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox329:setParent(obj.layout56);
    obj.checkBox329:setLeft(000);
    obj.checkBox329:setTop(050);
    obj.checkBox329:setHeight(20);
    obj.checkBox329:setWidth(120);
    obj.checkBox329:setText("Blind");
    obj.checkBox329:setField("immBlind");
    obj.checkBox329:setName("checkBox329");

    obj.checkBox330 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox330:setParent(obj.layout56);
    obj.checkBox330:setLeft(000);
    obj.checkBox330:setTop(075);
    obj.checkBox330:setHeight(20);
    obj.checkBox330:setWidth(120);
    obj.checkBox330:setText("Immobilize");
    obj.checkBox330:setField("immImmobilize");
    obj.checkBox330:setName("checkBox330");

    obj.checkBox331 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox331:setParent(obj.layout56);
    obj.checkBox331:setLeft(000);
    obj.checkBox331:setTop(100);
    obj.checkBox331:setHeight(20);
    obj.checkBox331:setWidth(120);
    obj.checkBox331:setText("Poison");
    obj.checkBox331:setField("immPoison");
    obj.checkBox331:setName("checkBox331");

    obj.checkBox332 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox332:setParent(obj.layout56);
    obj.checkBox332:setLeft(000);
    obj.checkBox332:setTop(125);
    obj.checkBox332:setHeight(20);
    obj.checkBox332:setWidth(120);
    obj.checkBox332:setText("Sleep");
    obj.checkBox332:setField("immSleep");
    obj.checkBox332:setName("checkBox332");

    obj.checkBox333 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox333:setParent(obj.layout56);
    obj.checkBox333:setLeft(000);
    obj.checkBox333:setTop(150);
    obj.checkBox333:setHeight(20);
    obj.checkBox333:setWidth(120);
    obj.checkBox333:setText("Slow");
    obj.checkBox333:setField("immSlow");
    obj.checkBox333:setName("checkBox333");

    obj.checkBox334 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox334:setParent(obj.layout56);
    obj.checkBox334:setLeft(000);
    obj.checkBox334:setTop(175);
    obj.checkBox334:setHeight(20);
    obj.checkBox334:setWidth(120);
    obj.checkBox334:setText("Zombie");
    obj.checkBox334:setField("immZombie");
    obj.checkBox334:setName("checkBox334");

    obj.checkBox335 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox335:setParent(obj.layout56);
    obj.checkBox335:setLeft(000);
    obj.checkBox335:setTop(200);
    obj.checkBox335:setHeight(20);
    obj.checkBox335:setWidth(120);
    obj.checkBox335:setText("Lock");
    obj.checkBox335:setField("immLock");
    obj.checkBox335:setName("checkBox335");

    obj.checkBox336 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox336:setParent(obj.layout56);
    obj.checkBox336:setLeft(000);
    obj.checkBox336:setTop(225);
    obj.checkBox336:setHeight(20);
    obj.checkBox336:setWidth(120);
    obj.checkBox336:setText("Condemn");
    obj.checkBox336:setField("immCondemn");
    obj.checkBox336:setName("checkBox336");

    obj.checkBox337 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox337:setParent(obj.layout56);
    obj.checkBox337:setLeft(000);
    obj.checkBox337:setTop(250);
    obj.checkBox337:setHeight(20);
    obj.checkBox337:setWidth(120);
    obj.checkBox337:setText("Confuse");
    obj.checkBox337:setField("immConfuse");
    obj.checkBox337:setName("checkBox337");

    obj.checkBox338 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox338:setParent(obj.layout56);
    obj.checkBox338:setLeft(000);
    obj.checkBox338:setTop(275);
    obj.checkBox338:setHeight(20);
    obj.checkBox338:setWidth(120);
    obj.checkBox338:setText("Curse");
    obj.checkBox338:setField("immCurse");
    obj.checkBox338:setName("checkBox338");

    obj.checkBox339 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox339:setParent(obj.layout56);
    obj.checkBox339:setLeft(000);
    obj.checkBox339:setTop(300);
    obj.checkBox339:setHeight(20);
    obj.checkBox339:setWidth(120);
    obj.checkBox339:setText("Disable");
    obj.checkBox339:setField("immDisable");
    obj.checkBox339:setName("checkBox339");

    obj.checkBox340 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox340:setParent(obj.layout56);
    obj.checkBox340:setLeft(000);
    obj.checkBox340:setTop(325);
    obj.checkBox340:setHeight(20);
    obj.checkBox340:setWidth(120);
    obj.checkBox340:setText("Petrify");
    obj.checkBox340:setField("immPetrify");
    obj.checkBox340:setName("checkBox340");

    obj.checkBox341 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox341:setParent(obj.layout56);
    obj.checkBox341:setLeft(000);
    obj.checkBox341:setTop(350);
    obj.checkBox341:setHeight(20);
    obj.checkBox341:setWidth(120);
    obj.checkBox341:setText("Silence");
    obj.checkBox341:setField("immSilence");
    obj.checkBox341:setName("checkBox341");

    obj.checkBox342 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox342:setParent(obj.layout56);
    obj.checkBox342:setLeft(000);
    obj.checkBox342:setTop(375);
    obj.checkBox342:setHeight(20);
    obj.checkBox342:setWidth(120);
    obj.checkBox342:setText("Sap");
    obj.checkBox342:setField("immSap");
    obj.checkBox342:setName("checkBox342");

    obj.checkBox343 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox343:setParent(obj.layout56);
    obj.checkBox343:setLeft(000);
    obj.checkBox343:setTop(400);
    obj.checkBox343:setHeight(20);
    obj.checkBox343:setWidth(120);
    obj.checkBox343:setText("Unaware");
    obj.checkBox343:setField("immUnaware");
    obj.checkBox343:setName("checkBox343");

    obj.checkBox344 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox344:setParent(obj.layout56);
    obj.checkBox344:setLeft(000);
    obj.checkBox344:setTop(425);
    obj.checkBox344:setHeight(20);
    obj.checkBox344:setWidth(120);
    obj.checkBox344:setText("Eject");
    obj.checkBox344:setField("immEject");
    obj.checkBox344:setName("checkBox344");

    obj.checkBox345 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox345:setParent(obj.layout56);
    obj.checkBox345:setLeft(000);
    obj.checkBox345:setTop(450);
    obj.checkBox345:setHeight(20);
    obj.checkBox345:setWidth(120);
    obj.checkBox345:setText("Mini");
    obj.checkBox345:setField("immMini");
    obj.checkBox345:setName("checkBox345");

    obj.checkBox346 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox346:setParent(obj.layout56);
    obj.checkBox346:setLeft(000);
    obj.checkBox346:setTop(475);
    obj.checkBox346:setHeight(20);
    obj.checkBox346:setWidth(120);
    obj.checkBox346:setText("Strength Down");
    obj.checkBox346:setField("immSTRDown");
    obj.checkBox346:setName("checkBox346");

    obj.checkBox347 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox347:setParent(obj.layout56);
    obj.checkBox347:setLeft(000);
    obj.checkBox347:setTop(500);
    obj.checkBox347:setHeight(20);
    obj.checkBox347:setWidth(120);
    obj.checkBox347:setText("Agility Down");
    obj.checkBox347:setField("immAGIDown");
    obj.checkBox347:setName("checkBox347");

    obj.checkBox348 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox348:setParent(obj.layout56);
    obj.checkBox348:setLeft(000);
    obj.checkBox348:setTop(525);
    obj.checkBox348:setHeight(20);
    obj.checkBox348:setWidth(120);
    obj.checkBox348:setText("Magic Down");
    obj.checkBox348:setField("immMAGDown");
    obj.checkBox348:setName("checkBox348");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.scrollBox7);
    obj.layout57:setLeft(780);
    obj.layout57:setTop(20);
    obj.layout57:setHeight(550);
    obj.layout57:setWidth(200);
    obj.layout57:setName("layout57");

    obj.checkBox349 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox349:setParent(obj.layout57);
    obj.checkBox349:setLeft(000);
    obj.checkBox349:setTop(025);
    obj.checkBox349:setHeight(20);
    obj.checkBox349:setWidth(120);
    obj.checkBox349:setText("Mental Down");
    obj.checkBox349:setField("immMENDown");
    obj.checkBox349:setName("checkBox349");

    obj.checkBox350 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox350:setParent(obj.layout57);
    obj.checkBox350:setLeft(000);
    obj.checkBox350:setTop(050);
    obj.checkBox350:setHeight(20);
    obj.checkBox350:setWidth(120);
    obj.checkBox350:setText("Armor Down");
    obj.checkBox350:setField("immARMDown");
    obj.checkBox350:setName("checkBox350");

    obj.checkBox351 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox351:setParent(obj.layout57);
    obj.checkBox351:setLeft(000);
    obj.checkBox351:setTop(075);
    obj.checkBox351:setHeight(20);
    obj.checkBox351:setWidth(120);
    obj.checkBox351:setText("Spirit Down");
    obj.checkBox351:setField("immSPIDown");
    obj.checkBox351:setName("checkBox351");

    obj.checkBox352 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox352:setParent(obj.layout57);
    obj.checkBox352:setLeft(000);
    obj.checkBox352:setTop(100);
    obj.checkBox352:setHeight(20);
    obj.checkBox352:setWidth(120);
    obj.checkBox352:setText("Strength Break");
    obj.checkBox352:setField("immSTRBrk");
    obj.checkBox352:setName("checkBox352");

    obj.checkBox353 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox353:setParent(obj.layout57);
    obj.checkBox353:setLeft(000);
    obj.checkBox353:setTop(125);
    obj.checkBox353:setHeight(20);
    obj.checkBox353:setWidth(120);
    obj.checkBox353:setText("Agility Break");
    obj.checkBox353:setField("immAGIBrk");
    obj.checkBox353:setName("checkBox353");

    obj.checkBox354 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox354:setParent(obj.layout57);
    obj.checkBox354:setLeft(000);
    obj.checkBox354:setTop(150);
    obj.checkBox354:setHeight(20);
    obj.checkBox354:setWidth(120);
    obj.checkBox354:setText("Magic Break");
    obj.checkBox354:setField("immMAGBrk");
    obj.checkBox354:setName("checkBox354");

    obj.checkBox355 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox355:setParent(obj.layout57);
    obj.checkBox355:setLeft(000);
    obj.checkBox355:setTop(175);
    obj.checkBox355:setHeight(20);
    obj.checkBox355:setWidth(120);
    obj.checkBox355:setText("Mental Break");
    obj.checkBox355:setField("immMENBrk");
    obj.checkBox355:setName("checkBox355");

    obj.checkBox356 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox356:setParent(obj.layout57);
    obj.checkBox356:setLeft(000);
    obj.checkBox356:setTop(200);
    obj.checkBox356:setHeight(20);
    obj.checkBox356:setWidth(120);
    obj.checkBox356:setText("Armor Break");
    obj.checkBox356:setField("immARMBrk");
    obj.checkBox356:setName("checkBox356");

    obj.checkBox357 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox357:setParent(obj.layout57);
    obj.checkBox357:setLeft(000);
    obj.checkBox357:setTop(225);
    obj.checkBox357:setHeight(20);
    obj.checkBox357:setWidth(120);
    obj.checkBox357:setText("Spirit Break");
    obj.checkBox357:setField("immSPIBrk");
    obj.checkBox357:setName("checkBox357");

    obj.checkBox358 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox358:setParent(obj.layout57);
    obj.checkBox358:setLeft(000);
    obj.checkBox358:setTop(250);
    obj.checkBox358:setHeight(20);
    obj.checkBox358:setWidth(120);
    obj.checkBox358:setText("Stop");
    obj.checkBox358:setField("immStop");
    obj.checkBox358:setName("checkBox358");

    obj.checkBox359 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox359:setParent(obj.layout57);
    obj.checkBox359:setLeft(000);
    obj.checkBox359:setTop(275);
    obj.checkBox359:setHeight(20);
    obj.checkBox359:setWidth(120);
    obj.checkBox359:setText("Toad");
    obj.checkBox359:setField("immToad");
    obj.checkBox359:setName("checkBox359");

    obj.checkBox360 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox360:setParent(obj.layout57);
    obj.checkBox360:setLeft(000);
    obj.checkBox360:setTop(300);
    obj.checkBox360:setHeight(20);
    obj.checkBox360:setWidth(120);
    obj.checkBox360:setText("Venom");
    obj.checkBox360:setField("immVenom");
    obj.checkBox360:setName("checkBox360");

    obj.checkBox361 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox361:setParent(obj.layout57);
    obj.checkBox361:setLeft(000);
    obj.checkBox361:setTop(325);
    obj.checkBox361:setHeight(20);
    obj.checkBox361:setWidth(120);
    obj.checkBox361:setText("Element Weak");
    obj.checkBox361:setField("immElemWeak");
    obj.checkBox361:setName("checkBox361");

    obj.checkBox362 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox362:setParent(obj.layout57);
    obj.checkBox362:setLeft(000);
    obj.checkBox362:setTop(350);
    obj.checkBox362:setHeight(20);
    obj.checkBox362:setWidth(120);
    obj.checkBox362:setText("Charm");
    obj.checkBox362:setField("immCharm");
    obj.checkBox362:setName("checkBox362");

    obj.checkBox363 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox363:setParent(obj.layout57);
    obj.checkBox363:setLeft(000);
    obj.checkBox363:setTop(375);
    obj.checkBox363:setHeight(20);
    obj.checkBox363:setWidth(120);
    obj.checkBox363:setText("Death");
    obj.checkBox363:setField("immDeath");
    obj.checkBox363:setName("checkBox363");

    obj.checkBox364 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox364:setParent(obj.layout57);
    obj.checkBox364:setLeft(000);
    obj.checkBox364:setTop(400);
    obj.checkBox364:setHeight(20);
    obj.checkBox364:setWidth(120);
    obj.checkBox364:setText("Frozen");
    obj.checkBox364:setField("immFrozen");
    obj.checkBox364:setName("checkBox364");

    obj.checkBox365 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox365:setParent(obj.layout57);
    obj.checkBox365:setLeft(000);
    obj.checkBox365:setTop(425);
    obj.checkBox365:setHeight(20);
    obj.checkBox365:setWidth(120);
    obj.checkBox365:setText("Gravity");
    obj.checkBox365:setField("immGravity");
    obj.checkBox365:setName("checkBox365");

    obj.checkBox366 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox366:setParent(obj.layout57);
    obj.checkBox366:setLeft(000);
    obj.checkBox366:setTop(450);
    obj.checkBox366:setHeight(20);
    obj.checkBox366:setWidth(120);
    obj.checkBox366:setText("Heat");
    obj.checkBox366:setField("immHeat");
    obj.checkBox366:setName("checkBox366");

    obj.checkBox367 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox367:setParent(obj.layout57);
    obj.checkBox367:setLeft(000);
    obj.checkBox367:setTop(475);
    obj.checkBox367:setHeight(20);
    obj.checkBox367:setWidth(120);
    obj.checkBox367:setText("Meltdown");
    obj.checkBox367:setField("immMeltdown");
    obj.checkBox367:setName("checkBox367");

    obj.checkBox368 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox368:setParent(obj.layout57);
    obj.checkBox368:setLeft(000);
    obj.checkBox368:setTop(500);
    obj.checkBox368:setHeight(20);
    obj.checkBox368:setWidth(120);
    obj.checkBox368:setText("Stone");
    obj.checkBox368:setField("immStone");
    obj.checkBox368:setName("checkBox368");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox7);
    obj.layout58:setLeft(930);
    obj.layout58:setTop(20);
    obj.layout58:setHeight(200);
    obj.layout58:setWidth(150);
    obj.layout58:setName("layout58");

    obj.popAbilitynamStatresC = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamStatresC:setParent(obj.layout58);
    obj.popAbilitynamStatresC:setName("popAbilitynamStatresC");
    obj.popAbilitynamStatresC:setWidth(300);
    obj.popAbilitynamStatresC:setHeight(200);
    obj.popAbilitynamStatresC:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamStatresC, "autoScopeNode",  "false");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.popAbilitynamStatresC);
    obj.label167:setLeft(05);
    obj.label167:setTop(5);
    obj.label167:setWidth(60);
    obj.label167:setHeight(20);
    obj.label167:setText("Descrição:");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.textEditor47 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor47:setParent(obj.popAbilitynamStatresC);
    obj.textEditor47:setLeft(005);
    obj.textEditor47:setTop(30);
    obj.textEditor47:setHeight(165);
    obj.textEditor47:setWidth(290);
    obj.textEditor47:setField("DescricaonamStatresC");
    obj.textEditor47:setText("The monster is partially immune to the effects of one of the Status Condition categories outlined in Chapter 7. \n Any rolls to inflict a Status Condition belonging to this category have their CoS halved. Gil and XP modifiers depend on the exact category the monster resists");
    obj.textEditor47:setName("textEditor47");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout58);
    obj.label168:setLeft(000);
    obj.label168:setTop(000);
    obj.label168:setHeight(20);
    obj.label168:setWidth(150);
    obj.label168:setText("Cat. Resistance");
    lfm_setPropAsString(obj.label168, "fontStyle",  "bold");
    obj.label168:setName("label168");

    obj.BotaonamStatresC = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamStatresC:setParent(obj.layout58);
    obj.BotaonamStatresC:setLeft(100);
    obj.BotaonamStatresC:setTop(000);
    obj.BotaonamStatresC:setWidth(23);
    obj.BotaonamStatresC:setHeight(25);
    obj.BotaonamStatresC:setText("i");
    obj.BotaonamStatresC:setName("BotaonamStatresC");

    obj.checkBox369 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox369:setParent(obj.layout58);
    obj.checkBox369:setLeft(000);
    obj.checkBox369:setTop(025);
    obj.checkBox369:setHeight(20);
    obj.checkBox369:setWidth(120);
    obj.checkBox369:setText("Fatal");
    obj.checkBox369:setField("resFatal");
    obj.checkBox369:setName("checkBox369");

    obj.checkBox370 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox370:setParent(obj.layout58);
    obj.checkBox370:setLeft(000);
    obj.checkBox370:setTop(050);
    obj.checkBox370:setHeight(20);
    obj.checkBox370:setWidth(120);
    obj.checkBox370:setText("Mystify");
    obj.checkBox370:setField("resMystify");
    obj.checkBox370:setName("checkBox370");

    obj.checkBox371 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox371:setParent(obj.layout58);
    obj.checkBox371:setLeft(000);
    obj.checkBox371:setTop(075);
    obj.checkBox371:setHeight(20);
    obj.checkBox371:setWidth(120);
    obj.checkBox371:setText("Seal");
    obj.checkBox371:setField("resSeal");
    obj.checkBox371:setName("checkBox371");

    obj.checkBox372 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox372:setParent(obj.layout58);
    obj.checkBox372:setLeft(000);
    obj.checkBox372:setTop(100);
    obj.checkBox372:setHeight(20);
    obj.checkBox372:setWidth(120);
    obj.checkBox372:setText("Time");
    obj.checkBox372:setField("resTime");
    obj.checkBox372:setName("checkBox372");

    obj.checkBox373 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox373:setParent(obj.layout58);
    obj.checkBox373:setLeft(000);
    obj.checkBox373:setTop(125);
    obj.checkBox373:setHeight(20);
    obj.checkBox373:setWidth(120);
    obj.checkBox373:setText("Toxin");
    obj.checkBox373:setField("resToxin");
    obj.checkBox373:setName("checkBox373");

    obj.checkBox374 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox374:setParent(obj.layout58);
    obj.checkBox374:setLeft(000);
    obj.checkBox374:setTop(150);
    obj.checkBox374:setHeight(20);
    obj.checkBox374:setWidth(120);
    obj.checkBox374:setText("Transform");
    obj.checkBox374:setField("resTransform");
    obj.checkBox374:setName("checkBox374");

    obj.checkBox375 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox375:setParent(obj.layout58);
    obj.checkBox375:setLeft(000);
    obj.checkBox375:setTop(175);
    obj.checkBox375:setHeight(20);
    obj.checkBox375:setWidth(120);
    obj.checkBox375:setText("Weaken");
    obj.checkBox375:setField("resWeaken");
    obj.checkBox375:setName("checkBox375");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox7);
    obj.layout59:setLeft(930);
    obj.layout59:setTop(300);
    obj.layout59:setHeight(200);
    obj.layout59:setWidth(150);
    obj.layout59:setName("layout59");

    obj.popAbilitynamStatimmC = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynamStatimmC:setParent(obj.layout59);
    obj.popAbilitynamStatimmC:setName("popAbilitynamStatimmC");
    obj.popAbilitynamStatimmC:setWidth(300);
    obj.popAbilitynamStatimmC:setHeight(200);
    obj.popAbilitynamStatimmC:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynamStatimmC, "autoScopeNode",  "false");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.popAbilitynamStatimmC);
    obj.label169:setLeft(05);
    obj.label169:setTop(5);
    obj.label169:setWidth(60);
    obj.label169:setHeight(20);
    obj.label169:setText("Descrição:");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.textEditor48 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor48:setParent(obj.popAbilitynamStatimmC);
    obj.textEditor48:setLeft(005);
    obj.textEditor48:setTop(30);
    obj.textEditor48:setHeight(165);
    obj.textEditor48:setWidth(290);
    obj.textEditor48:setField("DescricaonamStatimmC");
    obj.textEditor48:setText("The monster is wholly immune to the effects of one of the Status Condition categories outlined in Chapter 7. \n Any rolls to inflict a Status Condition belonging to this category have a CoS of 0. Gil and XP modifiers depend on the exact category the monster is Immune to");
    obj.textEditor48:setName("textEditor48");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout59);
    obj.label170:setLeft(000);
    obj.label170:setTop(000);
    obj.label170:setHeight(20);
    obj.label170:setWidth(150);
    obj.label170:setText("Cat. Immunity");
    lfm_setPropAsString(obj.label170, "fontStyle",  "bold");
    obj.label170:setName("label170");

    obj.BotaonamStatimmC = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonamStatimmC:setParent(obj.layout59);
    obj.BotaonamStatimmC:setLeft(100);
    obj.BotaonamStatimmC:setTop(000);
    obj.BotaonamStatimmC:setWidth(23);
    obj.BotaonamStatimmC:setHeight(25);
    obj.BotaonamStatimmC:setText("i");
    obj.BotaonamStatimmC:setName("BotaonamStatimmC");

    obj.checkBox376 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox376:setParent(obj.layout59);
    obj.checkBox376:setLeft(000);
    obj.checkBox376:setTop(025);
    obj.checkBox376:setHeight(20);
    obj.checkBox376:setWidth(120);
    obj.checkBox376:setText("Fatal");
    obj.checkBox376:setField("immFatal");
    obj.checkBox376:setName("checkBox376");

    obj.checkBox377 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox377:setParent(obj.layout59);
    obj.checkBox377:setLeft(000);
    obj.checkBox377:setTop(050);
    obj.checkBox377:setHeight(20);
    obj.checkBox377:setWidth(120);
    obj.checkBox377:setText("Mystify");
    obj.checkBox377:setField("immMystify");
    obj.checkBox377:setName("checkBox377");

    obj.checkBox378 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox378:setParent(obj.layout59);
    obj.checkBox378:setLeft(000);
    obj.checkBox378:setTop(075);
    obj.checkBox378:setHeight(20);
    obj.checkBox378:setWidth(120);
    obj.checkBox378:setText("Seal");
    obj.checkBox378:setField("immSeal");
    obj.checkBox378:setName("checkBox378");

    obj.checkBox379 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox379:setParent(obj.layout59);
    obj.checkBox379:setLeft(000);
    obj.checkBox379:setTop(100);
    obj.checkBox379:setHeight(20);
    obj.checkBox379:setWidth(120);
    obj.checkBox379:setText("Time");
    obj.checkBox379:setField("immTime");
    obj.checkBox379:setName("checkBox379");

    obj.checkBox380 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox380:setParent(obj.layout59);
    obj.checkBox380:setLeft(000);
    obj.checkBox380:setTop(125);
    obj.checkBox380:setHeight(20);
    obj.checkBox380:setWidth(120);
    obj.checkBox380:setText("Toxin");
    obj.checkBox380:setField("immToxin");
    obj.checkBox380:setName("checkBox380");

    obj.checkBox381 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox381:setParent(obj.layout59);
    obj.checkBox381:setLeft(000);
    obj.checkBox381:setTop(150);
    obj.checkBox381:setHeight(20);
    obj.checkBox381:setWidth(120);
    obj.checkBox381:setText("Transform");
    obj.checkBox381:setField("immTransform");
    obj.checkBox381:setName("checkBox381");

    obj.checkBox382 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox382:setParent(obj.layout59);
    obj.checkBox382:setLeft(000);
    obj.checkBox382:setTop(175);
    obj.checkBox382:setHeight(20);
    obj.checkBox382:setWidth(120);
    obj.checkBox382:setText("Weaken");
    obj.checkBox382:setField("immWeaken");
    obj.checkBox382:setName("checkBox382");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.scrollBox7);
    obj.layout60:setLeft(1000);
    obj.layout60:setTop(570);
    obj.layout60:setHeight(50);
    obj.layout60:setWidth(90);
    obj.layout60:setName("layout60");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout60);
    obj.label171:setLeft(000);
    obj.label171:setTop(000);
    obj.label171:setHeight(20);
    obj.label171:setWidth(30);
    obj.label171:setText("Exp");
    obj.label171:setAutoSize(true);
    obj.label171:setName("label171");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout60);
    obj.edit243:setLeft(035);
    obj.edit243:setTop(000);
    obj.edit243:setHeight(20);
    obj.edit243:setWidth(50);
    obj.edit243:setField("ExpFinal");
    obj.edit243:setHorzTextAlign("center");
    obj.edit243:setName("edit243");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout60);
    obj.label172:setLeft(000);
    obj.label172:setTop(025);
    obj.label172:setHeight(20);
    obj.label172:setWidth(30);
    obj.label172:setText("Gil");
    obj.label172:setAutoSize(true);
    obj.label172:setName("label172");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout60);
    obj.edit244:setLeft(35);
    obj.edit244:setTop(025);
    obj.edit244:setHeight(20);
    obj.edit244:setWidth(50);
    obj.edit244:setField("GilFinal");
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setName("edit244");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Reaction");
    obj.tab8:setName("tab8");

    obj.frmReaction = GUI.fromHandle(_obj_newObject("form"));
    obj.frmReaction:setParent(obj.tab8);
    obj.frmReaction:setName("frmReaction");
    obj.frmReaction:setAlign("client");
    obj.frmReaction:setTheme("dark");
    obj.frmReaction:setMargins({top=1});

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.frmReaction);
    obj.layout61:setLeft(000);
    obj.layout61:setTop(000);
    obj.layout61:setHeight(650);
    obj.layout61:setWidth(1100);
    obj.layout61:setName("layout61");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout61);
    obj.image9:setLeft(000);
    obj.image9:setTop(000);
    obj.image9:setHeight(650);
    obj.image9:setWidth(1100);
    obj.image9:setSRC("/img/wallpaper.png");
    obj.image9:setStyle("autoFit");
    obj.image9:setName("image9");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmReaction);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox8);
    obj.layout62:setLeft(060);
    obj.layout62:setTop(050);
    obj.layout62:setHeight(100);
    obj.layout62:setWidth(200);
    obj.layout62:setName("layout62");

    obj.popAbilityreaCounterP = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreaCounterP:setParent(obj.layout62);
    obj.popAbilityreaCounterP:setName("popAbilityreaCounterP");
    obj.popAbilityreaCounterP:setWidth(300);
    obj.popAbilityreaCounterP:setHeight(200);
    obj.popAbilityreaCounterP:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreaCounterP, "autoScopeNode",  "false");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.popAbilityreaCounterP);
    obj.label173:setLeft(05);
    obj.label173:setTop(5);
    obj.label173:setWidth(60);
    obj.label173:setHeight(20);
    obj.label173:setText("Descrição:");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.textEditor49 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor49:setParent(obj.popAbilityreaCounterP);
    obj.textEditor49:setLeft(005);
    obj.textEditor49:setTop(30);
    obj.textEditor49:setHeight(165);
    obj.textEditor49:setWidth(290);
    obj.textEditor49:setField("DescricaoreaCounterP");
    obj.textEditor49:setText("The monster is capable of responding to enemy attacks with a potent counter-assault. \n Counter Attack triggers when the monster takes Physical damage from an enemy Action, and allows the monster to immediately use a specific Attack, Spell, or Action Ability against that opponent at no Action cost. \n Select one Attack, Spell, or Action Ability to use in conjunction with Counter Attack when taking this Reaction Ability, or create a new one; the XP and Gil costs for Counter Attack depend on its CoS, and are added to the attack’s final value.");
    obj.textEditor49:setName("textEditor49");

    obj.checkBox383 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox383:setParent(obj.layout62);
    obj.checkBox383:setLeft(000);
    obj.checkBox383:setTop(000);
    obj.checkBox383:setHeight(20);
    obj.checkBox383:setWidth(150);
    obj.checkBox383:setText("Counterattack");
    obj.checkBox383:setField("reaCounterP");
    lfm_setPropAsString(obj.checkBox383, "fontStyle",  "bold");
    obj.checkBox383:setName("checkBox383");

    obj.BotaoreaCounterP = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreaCounterP:setParent(obj.layout62);
    obj.BotaoreaCounterP:setLeft(175);
    obj.BotaoreaCounterP:setTop(000);
    obj.BotaoreaCounterP:setWidth(23);
    obj.BotaoreaCounterP:setHeight(25);
    obj.BotaoreaCounterP:setText("i");
    obj.BotaoreaCounterP:setName("BotaoreaCounterP");

    obj.checkBox384 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox384:setParent(obj.layout62);
    obj.checkBox384:setLeft(020);
    obj.checkBox384:setTop(025);
    obj.checkBox384:setHeight(20);
    obj.checkBox384:setWidth(150);
    obj.checkBox384:setText("50%");
    obj.checkBox384:setField("reCAtk50");
    obj.checkBox384:setName("checkBox384");

    obj.checkBox385 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox385:setParent(obj.layout62);
    obj.checkBox385:setLeft(020);
    obj.checkBox385:setTop(050);
    obj.checkBox385:setHeight(20);
    obj.checkBox385:setWidth(150);
    obj.checkBox385:setText("75%");
    obj.checkBox385:setField("reCAtk75");
    obj.checkBox385:setName("checkBox385");

    obj.checkBox386 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox386:setParent(obj.layout62);
    obj.checkBox386:setLeft(020);
    obj.checkBox386:setTop(075);
    obj.checkBox386:setHeight(20);
    obj.checkBox386:setWidth(150);
    obj.checkBox386:setText("100%");
    obj.checkBox386:setField("reCAtk100");
    obj.checkBox386:setName("checkBox386");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox8);
    obj.layout63:setLeft(160);
    obj.layout63:setTop(050);
    obj.layout63:setHeight(100);
    obj.layout63:setWidth(200);
    obj.layout63:setName("layout63");

    obj.checkBox387 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox387:setParent(obj.layout63);
    obj.checkBox387:setLeft(020);
    obj.checkBox387:setTop(25);
    obj.checkBox387:setHeight(20);
    obj.checkBox387:setWidth(150);
    obj.checkBox387:setText("SOS-Lose");
    obj.checkBox387:setField("reCAtkSOSL");
    obj.checkBox387:setName("checkBox387");

    obj.checkBox388 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox388:setParent(obj.layout63);
    obj.checkBox388:setLeft(020);
    obj.checkBox388:setTop(50);
    obj.checkBox388:setHeight(20);
    obj.checkBox388:setWidth(150);
    obj.checkBox388:setText("SOS-Gain");
    obj.checkBox388:setField("reCAtkSOSG");
    obj.checkBox388:setName("checkBox388");

    obj.checkBox389 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox389:setParent(obj.layout63);
    obj.checkBox389:setLeft(020);
    obj.checkBox389:setTop(75);
    obj.checkBox389:setHeight(20);
    obj.checkBox389:setWidth(150);
    obj.checkBox389:setText("Unsealable");
    obj.checkBox389:setField("reCAtkUns");
    obj.checkBox389:setName("checkBox389");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.scrollBox8);
    obj.layout64:setLeft(060);
    obj.layout64:setTop(175);
    obj.layout64:setHeight(100);
    obj.layout64:setWidth(200);
    obj.layout64:setName("layout64");

    obj.popAbilityreaCounterM = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreaCounterM:setParent(obj.layout64);
    obj.popAbilityreaCounterM:setName("popAbilityreaCounterM");
    obj.popAbilityreaCounterM:setWidth(300);
    obj.popAbilityreaCounterM:setHeight(200);
    obj.popAbilityreaCounterM:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreaCounterM, "autoScopeNode",  "false");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.popAbilityreaCounterM);
    obj.label174:setLeft(05);
    obj.label174:setTop(5);
    obj.label174:setWidth(60);
    obj.label174:setHeight(20);
    obj.label174:setText("Descrição:");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.textEditor50 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor50:setParent(obj.popAbilityreaCounterM);
    obj.textEditor50:setLeft(005);
    obj.textEditor50:setTop(30);
    obj.textEditor50:setHeight(165);
    obj.textEditor50:setWidth(290);
    obj.textEditor50:setField("DescricaoreaCounterM");
    obj.textEditor50:setText("The monster is capable of responding to enemy magic with a potent counter-assault. \n Counter Magic has a CoS of either 30% or 60% of triggering when the monster takes Magical damage from an enemy Action, allowing the monster to immediately use a specific Attack, Spell, or Action Ability against that opponent at no Action cost. \n Select one Attack, Spell, or Action Ability to use in conjunction with Counter Magic when taking this Reaction Ability, or create a new one; the XP and Gil costs for Counter Magic are added to the attack’s final value.");
    obj.textEditor50:setName("textEditor50");

    obj.checkBox390 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox390:setParent(obj.layout64);
    obj.checkBox390:setLeft(000);
    obj.checkBox390:setTop(00);
    obj.checkBox390:setHeight(20);
    obj.checkBox390:setWidth(150);
    obj.checkBox390:setText("Counter Magic");
    obj.checkBox390:setField("reaCounterM");
    lfm_setPropAsString(obj.checkBox390, "fontStyle",  "bold");
    obj.checkBox390:setName("checkBox390");

    obj.BotaoreaCounterM = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreaCounterM:setParent(obj.layout64);
    obj.BotaoreaCounterM:setLeft(175);
    obj.BotaoreaCounterM:setTop(00);
    obj.BotaoreaCounterM:setWidth(23);
    obj.BotaoreaCounterM:setHeight(25);
    obj.BotaoreaCounterM:setText("i");
    obj.BotaoreaCounterM:setName("BotaoreaCounterM");

    obj.checkBox391 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox391:setParent(obj.layout64);
    obj.checkBox391:setLeft(020);
    obj.checkBox391:setTop(25);
    obj.checkBox391:setHeight(20);
    obj.checkBox391:setWidth(150);
    obj.checkBox391:setText("30%");
    obj.checkBox391:setField("reCMag50");
    obj.checkBox391:setName("checkBox391");

    obj.checkBox392 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox392:setParent(obj.layout64);
    obj.checkBox392:setLeft(020);
    obj.checkBox392:setTop(50);
    obj.checkBox392:setHeight(20);
    obj.checkBox392:setWidth(150);
    obj.checkBox392:setText("60%");
    obj.checkBox392:setField("reCMag75");
    obj.checkBox392:setName("checkBox392");

    obj.checkBox393 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox393:setParent(obj.layout64);
    obj.checkBox393:setLeft(020);
    obj.checkBox393:setTop(75);
    obj.checkBox393:setHeight(20);
    obj.checkBox393:setWidth(150);
    obj.checkBox393:setText("100%");
    obj.checkBox393:setField("reCMag100");
    obj.checkBox393:setName("checkBox393");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox8);
    obj.layout65:setLeft(160);
    obj.layout65:setTop(175);
    obj.layout65:setHeight(100);
    obj.layout65:setWidth(200);
    obj.layout65:setName("layout65");

    obj.checkBox394 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox394:setParent(obj.layout65);
    obj.checkBox394:setLeft(020);
    obj.checkBox394:setTop(25);
    obj.checkBox394:setHeight(20);
    obj.checkBox394:setWidth(150);
    obj.checkBox394:setText("SOS-Lose");
    obj.checkBox394:setField("reCMagSOSL");
    obj.checkBox394:setName("checkBox394");

    obj.checkBox395 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox395:setParent(obj.layout65);
    obj.checkBox395:setLeft(020);
    obj.checkBox395:setTop(50);
    obj.checkBox395:setHeight(20);
    obj.checkBox395:setWidth(150);
    obj.checkBox395:setText("SOS-Gain");
    obj.checkBox395:setField("reCMagSOSG");
    obj.checkBox395:setName("checkBox395");

    obj.checkBox396 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox396:setParent(obj.layout65);
    obj.checkBox396:setLeft(020);
    obj.checkBox396:setTop(75);
    obj.checkBox396:setHeight(20);
    obj.checkBox396:setWidth(150);
    obj.checkBox396:setText("Unsealable");
    obj.checkBox396:setField("reCMagUns");
    obj.checkBox396:setName("checkBox396");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.scrollBox8);
    obj.layout66:setLeft(060);
    obj.layout66:setTop(300);
    obj.layout66:setHeight(100);
    obj.layout66:setWidth(200);
    obj.layout66:setName("layout66");

    obj.popAbilityreaCounterS = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreaCounterS:setParent(obj.layout66);
    obj.popAbilityreaCounterS:setName("popAbilityreaCounterS");
    obj.popAbilityreaCounterS:setWidth(300);
    obj.popAbilityreaCounterS:setHeight(200);
    obj.popAbilityreaCounterS:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreaCounterS, "autoScopeNode",  "false");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.popAbilityreaCounterS);
    obj.label175:setLeft(05);
    obj.label175:setTop(5);
    obj.label175:setWidth(60);
    obj.label175:setHeight(20);
    obj.label175:setText("Descrição:");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.textEditor51 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor51:setParent(obj.popAbilityreaCounterS);
    obj.textEditor51:setLeft(005);
    obj.textEditor51:setTop(30);
    obj.textEditor51:setHeight(165);
    obj.textEditor51:setWidth(290);
    obj.textEditor51:setField("DescricaoreaCounterS");
    obj.textEditor51:setText("By entering into a special defensive posture at the cost of an Action, the monster can intercept opponents’ attacks. \n Select an Attack, Action Ability, or Spell for Counter Stance to be attached to, as well as a damage type – Physical or Magical – to respond to. \n For as long as the Counter Stance remains in effect, the monster will counter with the chosen attack when it takes damage of the selected type from an opponent’s Action. \n The monster cannot make any other Actions while in a Counter Stance, but can come out of it as a free action on its turn.");
    obj.textEditor51:setName("textEditor51");

    obj.checkBox397 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox397:setParent(obj.layout66);
    obj.checkBox397:setLeft(000);
    obj.checkBox397:setTop(00);
    obj.checkBox397:setHeight(20);
    obj.checkBox397:setWidth(150);
    obj.checkBox397:setText("Counter Stance");
    obj.checkBox397:setField("reaCounterS");
    lfm_setPropAsString(obj.checkBox397, "fontStyle",  "bold");
    obj.checkBox397:setName("checkBox397");

    obj.BotaoreaCounterS = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreaCounterS:setParent(obj.layout66);
    obj.BotaoreaCounterS:setLeft(175);
    obj.BotaoreaCounterS:setTop(00);
    obj.BotaoreaCounterS:setWidth(23);
    obj.BotaoreaCounterS:setHeight(25);
    obj.BotaoreaCounterS:setText("i");
    obj.BotaoreaCounterS:setName("BotaoreaCounterS");

    obj.checkBox398 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox398:setParent(obj.layout66);
    obj.checkBox398:setLeft(020);
    obj.checkBox398:setTop(25);
    obj.checkBox398:setHeight(20);
    obj.checkBox398:setWidth(150);
    obj.checkBox398:setText("Physical");
    obj.checkBox398:setField("reCStanPhys");
    obj.checkBox398:setName("checkBox398");

    obj.checkBox399 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox399:setParent(obj.layout66);
    obj.checkBox399:setLeft(020);
    obj.checkBox399:setTop(50);
    obj.checkBox399:setHeight(20);
    obj.checkBox399:setWidth(150);
    obj.checkBox399:setText("Magical");
    obj.checkBox399:setField("reCStanMag");
    obj.checkBox399:setName("checkBox399");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox8);
    obj.layout67:setLeft(160);
    obj.layout67:setTop(300);
    obj.layout67:setHeight(100);
    obj.layout67:setWidth(200);
    obj.layout67:setName("layout67");

    obj.checkBox400 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox400:setParent(obj.layout67);
    obj.checkBox400:setLeft(020);
    obj.checkBox400:setTop(25);
    obj.checkBox400:setHeight(20);
    obj.checkBox400:setWidth(150);
    obj.checkBox400:setText("SOS-Lose");
    obj.checkBox400:setField("reCStanSOSL");
    obj.checkBox400:setName("checkBox400");

    obj.checkBox401 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox401:setParent(obj.layout67);
    obj.checkBox401:setLeft(020);
    obj.checkBox401:setTop(50);
    obj.checkBox401:setHeight(20);
    obj.checkBox401:setWidth(150);
    obj.checkBox401:setText("SOS-Gain");
    obj.checkBox401:setField("reCStanSOSG");
    obj.checkBox401:setName("checkBox401");

    obj.checkBox402 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox402:setParent(obj.layout67);
    obj.checkBox402:setLeft(020);
    obj.checkBox402:setTop(75);
    obj.checkBox402:setHeight(20);
    obj.checkBox402:setWidth(150);
    obj.checkBox402:setText("Unsealable");
    obj.checkBox402:setField("reCStanUns");
    obj.checkBox402:setName("checkBox402");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.scrollBox8);
    obj.layout68:setLeft(060);
    obj.layout68:setTop(425);
    obj.layout68:setHeight(100);
    obj.layout68:setWidth(200);
    obj.layout68:setName("layout68");

    obj.popAbilityreaCounterRD = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreaCounterRD:setParent(obj.layout68);
    obj.popAbilityreaCounterRD:setName("popAbilityreaCounterRD");
    obj.popAbilityreaCounterRD:setWidth(300);
    obj.popAbilityreaCounterRD:setHeight(200);
    obj.popAbilityreaCounterRD:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreaCounterRD, "autoScopeNode",  "false");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.popAbilityreaCounterRD);
    obj.label176:setLeft(05);
    obj.label176:setTop(5);
    obj.label176:setWidth(60);
    obj.label176:setHeight(20);
    obj.label176:setText("Descrição:");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.textEditor52 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor52:setParent(obj.popAbilityreaCounterRD);
    obj.textEditor52:setLeft(005);
    obj.textEditor52:setTop(30);
    obj.textEditor52:setHeight(165);
    obj.textEditor52:setWidth(290);
    obj.textEditor52:setField("DescricaoreaCounterRD");
    obj.textEditor52:setText("A certain percentage of all damage inflicted on the monster after modifying for ARM and M. ARM is automatically returned to the combatant that originally dealt it. \n The combatant's ARM and M. ARM can be used to further reduce this damage. \n XP and Gil modifiers depend on the exact percentage of damage returned.");
    obj.textEditor52:setName("textEditor52");

    obj.checkBox403 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox403:setParent(obj.layout68);
    obj.checkBox403:setLeft(000);
    obj.checkBox403:setTop(00);
    obj.checkBox403:setHeight(20);
    obj.checkBox403:setWidth(150);
    obj.checkBox403:setText("Return Damage");
    obj.checkBox403:setField("reaCounterRD");
    lfm_setPropAsString(obj.checkBox403, "fontStyle",  "bold");
    obj.checkBox403:setName("checkBox403");

    obj.BotaoreaCounterRD = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreaCounterRD:setParent(obj.layout68);
    obj.BotaoreaCounterRD:setLeft(175);
    obj.BotaoreaCounterRD:setTop(00);
    obj.BotaoreaCounterRD:setWidth(23);
    obj.BotaoreaCounterRD:setHeight(25);
    obj.BotaoreaCounterRD:setText("i");
    obj.BotaoreaCounterRD:setName("BotaoreaCounterRD");

    obj.checkBox404 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox404:setParent(obj.layout68);
    obj.checkBox404:setLeft(020);
    obj.checkBox404:setTop(25);
    obj.checkBox404:setHeight(20);
    obj.checkBox404:setWidth(150);
    obj.checkBox404:setText("5%");
    obj.checkBox404:setField("reRD5");
    obj.checkBox404:setName("checkBox404");

    obj.checkBox405 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox405:setParent(obj.layout68);
    obj.checkBox405:setLeft(020);
    obj.checkBox405:setTop(50);
    obj.checkBox405:setHeight(20);
    obj.checkBox405:setWidth(150);
    obj.checkBox405:setText("10%");
    obj.checkBox405:setField("reRD10");
    obj.checkBox405:setName("checkBox405");

    obj.checkBox406 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox406:setParent(obj.layout68);
    obj.checkBox406:setLeft(020);
    obj.checkBox406:setTop(75);
    obj.checkBox406:setHeight(20);
    obj.checkBox406:setWidth(150);
    obj.checkBox406:setText("25%");
    obj.checkBox406:setField("reRD25");
    obj.checkBox406:setName("checkBox406");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox8);
    obj.layout69:setLeft(160);
    obj.layout69:setTop(425);
    obj.layout69:setHeight(100);
    obj.layout69:setWidth(200);
    obj.layout69:setName("layout69");

    obj.checkBox407 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox407:setParent(obj.layout69);
    obj.checkBox407:setLeft(020);
    obj.checkBox407:setTop(25);
    obj.checkBox407:setHeight(20);
    obj.checkBox407:setWidth(150);
    obj.checkBox407:setText("SOS-Lose");
    obj.checkBox407:setField("reRDSOSL");
    obj.checkBox407:setName("checkBox407");

    obj.checkBox408 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox408:setParent(obj.layout69);
    obj.checkBox408:setLeft(020);
    obj.checkBox408:setTop(50);
    obj.checkBox408:setHeight(20);
    obj.checkBox408:setWidth(150);
    obj.checkBox408:setText("SOS-Gain");
    obj.checkBox408:setField("reRDSOSG");
    obj.checkBox408:setName("checkBox408");

    obj.checkBox409 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox409:setParent(obj.layout69);
    obj.checkBox409:setLeft(020);
    obj.checkBox409:setTop(75);
    obj.checkBox409:setHeight(20);
    obj.checkBox409:setWidth(150);
    obj.checkBox409:setText("Unsealable");
    obj.checkBox409:setField("reRDUns");
    obj.checkBox409:setName("checkBox409");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.scrollBox8);
    obj.layout70:setLeft(400);
    obj.layout70:setTop(120);
    obj.layout70:setHeight(400);
    obj.layout70:setWidth(200);
    obj.layout70:setName("layout70");

    obj.popAbilitynameCounterStat = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitynameCounterStat:setParent(obj.layout70);
    obj.popAbilitynameCounterStat:setName("popAbilitynameCounterStat");
    obj.popAbilitynameCounterStat:setWidth(300);
    obj.popAbilitynameCounterStat:setHeight(200);
    obj.popAbilitynameCounterStat:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitynameCounterStat, "autoScopeNode",  "false");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.popAbilitynameCounterStat);
    obj.label177:setLeft(05);
    obj.label177:setTop(5);
    obj.label177:setWidth(60);
    obj.label177:setHeight(20);
    obj.label177:setText("Descrição:");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.textEditor53 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor53:setParent(obj.popAbilitynameCounterStat);
    obj.textEditor53:setLeft(005);
    obj.textEditor53:setTop(30);
    obj.textEditor53:setHeight(165);
    obj.textEditor53:setWidth(290);
    obj.textEditor53:setField("DescricaonameCounterStat");
    obj.textEditor53:setText("The monster’s power increases in response to the attacks of its opponents. \n Power Up automatically adds a positive Status Condition (4) to the monster when it takes a specific kind of damage – Physical, Magical, or one of the nine kinds of Elemental – from an enemy Action. \n Specify which of the three triggers Counter Status, and select a corresponding Status Condition; XP and Gil values are given per Status added, and depend on the exact Status taken:");
    obj.textEditor53:setName("textEditor53");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout70);
    obj.label178:setLeft(000);
    obj.label178:setTop(000);
    obj.label178:setHeight(20);
    obj.label178:setWidth(150);
    obj.label178:setText("Counter Status");
    lfm_setPropAsString(obj.label178, "fontStyle",  "bold");
    obj.label178:setName("label178");

    obj.BotaonameCounterStat = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaonameCounterStat:setParent(obj.layout70);
    obj.BotaonameCounterStat:setLeft(100);
    obj.BotaonameCounterStat:setTop(000);
    obj.BotaonameCounterStat:setWidth(23);
    obj.BotaonameCounterStat:setHeight(25);
    obj.BotaonameCounterStat:setText("i");
    obj.BotaonameCounterStat:setName("BotaonameCounterStat");

    obj.checkBox410 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox410:setParent(obj.layout70);
    obj.checkBox410:setLeft(000);
    obj.checkBox410:setTop(025);
    obj.checkBox410:setHeight(20);
    obj.checkBox410:setWidth(120);
    obj.checkBox410:setText("Float");
    obj.checkBox410:setField("recCSFloat");
    obj.checkBox410:setName("checkBox410");

    obj.checkBox411 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox411:setParent(obj.layout70);
    obj.checkBox411:setLeft(000);
    obj.checkBox411:setTop(050);
    obj.checkBox411:setHeight(20);
    obj.checkBox411:setWidth(120);
    obj.checkBox411:setText("Agility Up");
    obj.checkBox411:setField("recCSAgiUP");
    obj.checkBox411:setName("checkBox411");

    obj.checkBox412 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox412:setParent(obj.layout70);
    obj.checkBox412:setLeft(000);
    obj.checkBox412:setTop(075);
    obj.checkBox412:setHeight(20);
    obj.checkBox412:setWidth(120);
    obj.checkBox412:setText("Spirit Up");
    obj.checkBox412:setField("recCSSpiUP");
    obj.checkBox412:setName("checkBox412");

    obj.checkBox413 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox413:setParent(obj.layout70);
    obj.checkBox413:setLeft(000);
    obj.checkBox413:setTop(100);
    obj.checkBox413:setHeight(20);
    obj.checkBox413:setWidth(120);
    obj.checkBox413:setText("Fire Spikes");
    obj.checkBox413:setField("recCSFIRSpikes");
    obj.checkBox413:setName("checkBox413");

    obj.checkBox414 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox414:setParent(obj.layout70);
    obj.checkBox414:setLeft(000);
    obj.checkBox414:setTop(125);
    obj.checkBox414:setHeight(20);
    obj.checkBox414:setWidth(120);
    obj.checkBox414:setText("Ice Spikes");
    obj.checkBox414:setField("recCSICESpikes");
    obj.checkBox414:setName("checkBox414");

    obj.checkBox415 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox415:setParent(obj.layout70);
    obj.checkBox415:setLeft(000);
    obj.checkBox415:setTop(150);
    obj.checkBox415:setHeight(20);
    obj.checkBox415:setWidth(120);
    obj.checkBox415:setText("Water Spikes");
    obj.checkBox415:setField("recCSWATSpikes");
    obj.checkBox415:setName("checkBox415");

    obj.checkBox416 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox416:setParent(obj.layout70);
    obj.checkBox416:setLeft(000);
    obj.checkBox416:setTop(175);
    obj.checkBox416:setHeight(20);
    obj.checkBox416:setWidth(120);
    obj.checkBox416:setText("Lightning Spikes");
    obj.checkBox416:setField("recCSELESpikes");
    obj.checkBox416:setName("checkBox416");

    obj.checkBox417 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox417:setParent(obj.layout70);
    obj.checkBox417:setLeft(000);
    obj.checkBox417:setTop(200);
    obj.checkBox417:setHeight(20);
    obj.checkBox417:setWidth(120);
    obj.checkBox417:setText("Ground Spikes");
    obj.checkBox417:setField("recCSGNDSpikes");
    obj.checkBox417:setName("checkBox417");

    obj.checkBox418 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox418:setParent(obj.layout70);
    obj.checkBox418:setLeft(000);
    obj.checkBox418:setTop(225);
    obj.checkBox418:setHeight(20);
    obj.checkBox418:setWidth(120);
    obj.checkBox418:setText("Wind Spikes");
    obj.checkBox418:setField("recCSWINSpikes");
    obj.checkBox418:setName("checkBox418");

    obj.checkBox419 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox419:setParent(obj.layout70);
    obj.checkBox419:setLeft(000);
    obj.checkBox419:setTop(250);
    obj.checkBox419:setHeight(20);
    obj.checkBox419:setWidth(120);
    obj.checkBox419:setText("Bio Spikes");
    obj.checkBox419:setField("recCBIOSpikes");
    obj.checkBox419:setName("checkBox419");

    obj.checkBox420 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox420:setParent(obj.layout70);
    obj.checkBox420:setLeft(000);
    obj.checkBox420:setTop(275);
    obj.checkBox420:setHeight(20);
    obj.checkBox420:setWidth(120);
    obj.checkBox420:setText("Shadow Spikes");
    obj.checkBox420:setField("recCSSHASpikes");
    obj.checkBox420:setName("checkBox420");

    obj.checkBox421 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox421:setParent(obj.layout70);
    obj.checkBox421:setLeft(000);
    obj.checkBox421:setTop(300);
    obj.checkBox421:setHeight(20);
    obj.checkBox421:setWidth(120);
    obj.checkBox421:setText("Holy Spikes");
    obj.checkBox421:setField("recCSHOLSpikes");
    obj.checkBox421:setName("checkBox421");

    obj.checkBox422 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox422:setParent(obj.layout70);
    obj.checkBox422:setLeft(000);
    obj.checkBox422:setTop(325);
    obj.checkBox422:setHeight(20);
    obj.checkBox422:setWidth(120);
    obj.checkBox422:setText("Protect");
    obj.checkBox422:setField("recCSProtect");
    obj.checkBox422:setName("checkBox422");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox8);
    obj.layout71:setLeft(540);
    obj.layout71:setTop(120);
    obj.layout71:setHeight(400);
    obj.layout71:setWidth(200);
    obj.layout71:setName("layout71");

    obj.checkBox423 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox423:setParent(obj.layout71);
    obj.checkBox423:setLeft(000);
    obj.checkBox423:setTop(25);
    obj.checkBox423:setHeight(20);
    obj.checkBox423:setWidth(120);
    obj.checkBox423:setText("Shell");
    obj.checkBox423:setField("recCSShell");
    obj.checkBox423:setName("checkBox423");

    obj.checkBox424 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox424:setParent(obj.layout71);
    obj.checkBox424:setLeft(000);
    obj.checkBox424:setTop(50);
    obj.checkBox424:setHeight(20);
    obj.checkBox424:setWidth(120);
    obj.checkBox424:setText("Armor Up");
    obj.checkBox424:setField("recCSARMUP");
    obj.checkBox424:setName("checkBox424");

    obj.checkBox425 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox425:setParent(obj.layout71);
    obj.checkBox425:setLeft(000);
    obj.checkBox425:setTop(75);
    obj.checkBox425:setHeight(20);
    obj.checkBox425:setWidth(120);
    obj.checkBox425:setText("Mental Up");
    obj.checkBox425:setField("recCSMENUP");
    obj.checkBox425:setName("checkBox425");

    obj.checkBox426 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox426:setParent(obj.layout71);
    obj.checkBox426:setLeft(000);
    obj.checkBox426:setTop(100);
    obj.checkBox426:setHeight(20);
    obj.checkBox426:setWidth(120);
    obj.checkBox426:setText("Haste");
    obj.checkBox426:setField("recCSHaste");
    obj.checkBox426:setName("checkBox426");

    obj.checkBox427 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox427:setParent(obj.layout71);
    obj.checkBox427:setLeft(000);
    obj.checkBox427:setTop(125);
    obj.checkBox427:setHeight(20);
    obj.checkBox427:setWidth(120);
    obj.checkBox427:setText("Reflect");
    obj.checkBox427:setField("recCSReflect");
    obj.checkBox427:setName("checkBox427");

    obj.checkBox428 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox428:setParent(obj.layout71);
    obj.checkBox428:setLeft(000);
    obj.checkBox428:setTop(150);
    obj.checkBox428:setHeight(20);
    obj.checkBox428:setWidth(120);
    obj.checkBox428:setText("Power Up");
    obj.checkBox428:setField("recCSPOWUP");
    obj.checkBox428:setName("checkBox428");

    obj.checkBox429 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox429:setParent(obj.layout71);
    obj.checkBox429:setLeft(000);
    obj.checkBox429:setTop(175);
    obj.checkBox429:setHeight(20);
    obj.checkBox429:setWidth(120);
    obj.checkBox429:setText("Magic Up");
    obj.checkBox429:setField("recCSMAGUP");
    obj.checkBox429:setName("checkBox429");

    obj.checkBox430 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox430:setParent(obj.layout71);
    obj.checkBox430:setLeft(000);
    obj.checkBox430:setTop(200);
    obj.checkBox430:setHeight(20);
    obj.checkBox430:setWidth(120);
    obj.checkBox430:setText("Regen");
    obj.checkBox430:setField("recCSRegen");
    obj.checkBox430:setName("checkBox430");

    obj.checkBox431 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox431:setParent(obj.layout71);
    obj.checkBox431:setLeft(000);
    obj.checkBox431:setTop(225);
    obj.checkBox431:setHeight(20);
    obj.checkBox431:setWidth(120);
    obj.checkBox431:setText("Aura");
    obj.checkBox431:setField("recCSAura");
    obj.checkBox431:setName("checkBox431");

    obj.checkBox432 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox432:setParent(obj.layout71);
    obj.checkBox432:setLeft(000);
    obj.checkBox432:setTop(250);
    obj.checkBox432:setHeight(20);
    obj.checkBox432:setWidth(120);
    obj.checkBox432:setText("Vanish");
    obj.checkBox432:setField("recCSVanish");
    obj.checkBox432:setName("checkBox432");

    obj.checkBox433 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox433:setParent(obj.layout71);
    obj.checkBox433:setLeft(000);
    obj.checkBox433:setTop(275);
    obj.checkBox433:setHeight(20);
    obj.checkBox433:setWidth(120);
    obj.checkBox433:setText("SOS Gain");
    obj.checkBox433:setField("recCSGain");
    obj.checkBox433:setName("checkBox433");

    obj.checkBox434 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox434:setParent(obj.layout71);
    obj.checkBox434:setLeft(000);
    obj.checkBox434:setTop(300);
    obj.checkBox434:setHeight(20);
    obj.checkBox434:setWidth(120);
    obj.checkBox434:setText("SOS Lose");
    obj.checkBox434:setField("recCSLose");
    obj.checkBox434:setName("checkBox434");

    obj.checkBox435 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox435:setParent(obj.layout71);
    obj.checkBox435:setLeft(000);
    obj.checkBox435:setTop(325);
    obj.checkBox435:setHeight(20);
    obj.checkBox435:setWidth(120);
    obj.checkBox435:setText("Unsealable");
    obj.checkBox435:setField("recCSUns");
    obj.checkBox435:setName("checkBox435");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.scrollBox8);
    obj.layout72:setLeft(750);
    obj.layout72:setTop(200);
    obj.layout72:setHeight(300);
    obj.layout72:setWidth(200);
    obj.layout72:setName("layout72");

    obj.popAbilityreCFin = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreCFin:setParent(obj.layout72);
    obj.popAbilityreCFin:setName("popAbilityreCFin");
    obj.popAbilityreCFin:setWidth(300);
    obj.popAbilityreCFin:setHeight(200);
    obj.popAbilityreCFin:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreCFin, "autoScopeNode",  "false");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.popAbilityreCFin);
    obj.label179:setLeft(05);
    obj.label179:setTop(5);
    obj.label179:setWidth(60);
    obj.label179:setHeight(20);
    obj.label179:setText("Descrição:");
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");

    obj.textEditor54 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor54:setParent(obj.popAbilityreCFin);
    obj.textEditor54:setLeft(005);
    obj.textEditor54:setTop(30);
    obj.textEditor54:setHeight(165);
    obj.textEditor54:setWidth(290);
    obj.textEditor54:setField("DescricaoreCFin");
    obj.textEditor54:setText("Before dying, the monster can unleash one last attack on its opponents. \n Select an Attack, Action Ability, or Spell for Final Attack to be attached to; the monster will automatically use it upon being reduced to 0 or fewer HP, selecting targets as normal.");
    obj.textEditor54:setName("textEditor54");

    obj.checkBox436 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox436:setParent(obj.layout72);
    obj.checkBox436:setLeft(000);
    obj.checkBox436:setTop(00);
    obj.checkBox436:setHeight(20);
    obj.checkBox436:setWidth(150);
    obj.checkBox436:setText("Final Attack");
    obj.checkBox436:setField("reCFin");
    lfm_setPropAsString(obj.checkBox436, "fontStyle",  "bold");
    obj.checkBox436:setName("checkBox436");

    obj.BotaoreCFin = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreCFin:setParent(obj.layout72);
    obj.BotaoreCFin:setLeft(175);
    obj.BotaoreCFin:setTop(00);
    obj.BotaoreCFin:setWidth(23);
    obj.BotaoreCFin:setHeight(25);
    obj.BotaoreCFin:setText("i");
    obj.BotaoreCFin:setName("BotaoreCFin");

    obj.checkBox437 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox437:setParent(obj.layout72);
    obj.checkBox437:setLeft(020);
    obj.checkBox437:setTop(25);
    obj.checkBox437:setHeight(20);
    obj.checkBox437:setWidth(150);
    obj.checkBox437:setText("Unsealable");
    obj.checkBox437:setField("reCFinUns");
    obj.checkBox437:setName("checkBox437");

    obj.popAbilityreCFissUns = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreCFissUns:setParent(obj.layout72);
    obj.popAbilityreCFissUns:setName("popAbilityreCFissUns");
    obj.popAbilityreCFissUns:setWidth(300);
    obj.popAbilityreCFissUns:setHeight(200);
    obj.popAbilityreCFissUns:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreCFissUns, "autoScopeNode",  "false");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.popAbilityreCFissUns);
    obj.label180:setLeft(05);
    obj.label180:setTop(5);
    obj.label180:setWidth(60);
    obj.label180:setHeight(20);
    obj.label180:setText("Descrição:");
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.textEditor55 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor55:setParent(obj.popAbilityreCFissUns);
    obj.textEditor55:setLeft(005);
    obj.textEditor55:setTop(30);
    obj.textEditor55:setHeight(165);
    obj.textEditor55:setWidth(290);
    obj.textEditor55:setField("DescricaoreCFissUns");
    obj.textEditor55:setText("The monster is capable of splitting into identical copies of itself. \n Select a damage type – Physical, one of the nine kinds of Elemental, or Magical – when adding Fission to a monster. \n If reduced to 0 or fewer HP by the selected damage type during the course of a Round, the monster will split into two copies during the Status Phase. \n Each copy is treated as if it were the monster revived with full HP and MP, and generates Initiative as normal. \n If defeated, the copies award XP and Gil equal to that of the original monster.");
    obj.textEditor55:setName("textEditor55");

    obj.checkBox438 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox438:setParent(obj.layout72);
    obj.checkBox438:setLeft(000);
    obj.checkBox438:setTop(50);
    obj.checkBox438:setHeight(20);
    obj.checkBox438:setWidth(150);
    obj.checkBox438:setText("Fission");
    obj.checkBox438:setField("reCFissUns");
    lfm_setPropAsString(obj.checkBox438, "fontStyle",  "bold");
    obj.checkBox438:setName("checkBox438");

    obj.BotaoreCFissUns = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreCFissUns:setParent(obj.layout72);
    obj.BotaoreCFissUns:setLeft(175);
    obj.BotaoreCFissUns:setTop(50);
    obj.BotaoreCFissUns:setWidth(23);
    obj.BotaoreCFissUns:setHeight(25);
    obj.BotaoreCFissUns:setText("i");
    obj.BotaoreCFissUns:setName("BotaoreCFissUns");

    obj.checkBox439 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox439:setParent(obj.layout72);
    obj.checkBox439:setLeft(020);
    obj.checkBox439:setTop(75);
    obj.checkBox439:setHeight(20);
    obj.checkBox439:setWidth(150);
    obj.checkBox439:setText("Unsealable");
    obj.checkBox439:setField("reCFissUns");
    obj.checkBox439:setName("checkBox439");

    obj.popAbilityreRotate = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityreRotate:setParent(obj.layout72);
    obj.popAbilityreRotate:setName("popAbilityreRotate");
    obj.popAbilityreRotate:setWidth(300);
    obj.popAbilityreRotate:setHeight(200);
    obj.popAbilityreRotate:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityreRotate, "autoScopeNode",  "false");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.popAbilityreRotate);
    obj.label181:setLeft(05);
    obj.label181:setTop(5);
    obj.label181:setWidth(60);
    obj.label181:setHeight(20);
    obj.label181:setText("Descrição:");
    obj.label181:setHorzTextAlign("center");
    obj.label181:setName("label181");

    obj.textEditor56 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor56:setParent(obj.popAbilityreRotate);
    obj.textEditor56:setLeft(005);
    obj.textEditor56:setTop(30);
    obj.textEditor56:setHeight(165);
    obj.textEditor56:setWidth(290);
    obj.textEditor56:setField("DescricaoreRotate");
    obj.textEditor56:setText("The monster’s vulnerabilities are always in flux. In order to take Rotating Weakness, the monster must have at least one Elemental Weakness already in place. \n If the monster takes damage from an Element it currently has a Weakness against during the course of a Round, the Weakness immediately changes; roll a d8 and consult the table below to determine which Element the monster now has a Weakness towards. \n If the Element rolled is the same as the one the monster currently has a Weakness towards, the monster's new Weakness will be Bio. \n Roll Weakness \n 1 Earth \n 2 Fire \n 3 Water \n 4 Wind \n 5 Ice \n 6 Lightning \n 7 Holy \n 8 Shadow \n A Weakness inflicted by Rotating Weakness takes precedence over Elemental Resistance, Elemental Immunity, and Elemental Absorbance, though Status Conditions still override it as normal.");
    obj.textEditor56:setName("textEditor56");

    obj.checkBox440 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox440:setParent(obj.layout72);
    obj.checkBox440:setLeft(000);
    obj.checkBox440:setTop(100);
    obj.checkBox440:setHeight(20);
    obj.checkBox440:setWidth(150);
    obj.checkBox440:setText("Rotating Weakness");
    obj.checkBox440:setField("reRotate");
    lfm_setPropAsString(obj.checkBox440, "fontStyle",  "bold");
    obj.checkBox440:setName("checkBox440");

    obj.BotaoreRotate = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoreRotate:setParent(obj.layout72);
    obj.BotaoreRotate:setLeft(175);
    obj.BotaoreRotate:setTop(100);
    obj.BotaoreRotate:setWidth(23);
    obj.BotaoreRotate:setHeight(25);
    obj.BotaoreRotate:setText("i");
    obj.BotaoreRotate:setName("BotaoreRotate");

    obj.checkBox441 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox441:setParent(obj.layout72);
    obj.checkBox441:setLeft(020);
    obj.checkBox441:setTop(125);
    obj.checkBox441:setHeight(20);
    obj.checkBox441:setWidth(150);
    obj.checkBox441:setText("SOS Gain");
    obj.checkBox441:setField("reRotateGain");
    obj.checkBox441:setName("checkBox441");

    obj.checkBox442 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox442:setParent(obj.layout72);
    obj.checkBox442:setLeft(020);
    obj.checkBox442:setTop(150);
    obj.checkBox442:setHeight(20);
    obj.checkBox442:setWidth(150);
    obj.checkBox442:setText("SOS Lose");
    obj.checkBox442:setField("reRotateLose");
    obj.checkBox442:setName("checkBox442");

    obj.checkBox443 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox443:setParent(obj.layout72);
    obj.checkBox443:setLeft(020);
    obj.checkBox443:setTop(175);
    obj.checkBox443:setHeight(20);
    obj.checkBox443:setWidth(150);
    obj.checkBox443:setText("Unsealable");
    obj.checkBox443:setField("reRotateUns");
    obj.checkBox443:setName("checkBox443");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.scrollBox8);
    obj.layout73:setLeft(1000);
    obj.layout73:setTop(570);
    obj.layout73:setHeight(50);
    obj.layout73:setWidth(90);
    obj.layout73:setName("layout73");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout73);
    obj.label182:setLeft(000);
    obj.label182:setTop(000);
    obj.label182:setHeight(20);
    obj.label182:setWidth(30);
    obj.label182:setText("Exp");
    obj.label182:setAutoSize(true);
    obj.label182:setName("label182");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout73);
    obj.edit245:setLeft(035);
    obj.edit245:setTop(000);
    obj.edit245:setHeight(20);
    obj.edit245:setWidth(50);
    obj.edit245:setField("ExpFinal");
    obj.edit245:setHorzTextAlign("center");
    obj.edit245:setName("edit245");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout73);
    obj.label183:setLeft(000);
    obj.label183:setTop(025);
    obj.label183:setHeight(20);
    obj.label183:setWidth(30);
    obj.label183:setText("Gil");
    obj.label183:setAutoSize(true);
    obj.label183:setName("label183");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout73);
    obj.edit246:setLeft(35);
    obj.edit246:setTop(025);
    obj.edit246:setHeight(20);
    obj.edit246:setWidth(50);
    obj.edit246:setField("GilFinal");
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setName("edit246");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Field/Boss");
    obj.tab9:setName("tab9");

    obj.frmBossField = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBossField:setParent(obj.tab9);
    obj.frmBossField:setName("frmBossField");
    obj.frmBossField:setAlign("client");
    obj.frmBossField:setTheme("dark");
    obj.frmBossField:setMargins({top=1});

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.frmBossField);
    obj.layout74:setLeft(000);
    obj.layout74:setTop(000);
    obj.layout74:setHeight(650);
    obj.layout74:setWidth(1100);
    obj.layout74:setName("layout74");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout74);
    obj.image10:setLeft(000);
    obj.image10:setTop(000);
    obj.image10:setHeight(650);
    obj.image10:setWidth(1100);
    obj.image10:setSRC("/img/wallpaper.png");
    obj.image10:setStyle("autoFit");
    obj.image10:setName("image10");

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmBossField);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.scrollBox9);
    obj.layout75:setLeft(100);
    obj.layout75:setTop(50);
    obj.layout75:setHeight(275);
    obj.layout75:setWidth(200);
    obj.layout75:setName("layout75");

    obj.popAbilitybossField = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitybossField:setParent(obj.layout75);
    obj.popAbilitybossField:setName("popAbilitybossField");
    obj.popAbilitybossField:setWidth(300);
    obj.popAbilitybossField:setHeight(200);
    obj.popAbilitybossField:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitybossField, "autoScopeNode",  "false");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.popAbilitybossField);
    obj.label184:setLeft(05);
    obj.label184:setTop(5);
    obj.label184:setWidth(60);
    obj.label184:setHeight(20);
    obj.label184:setText("Descrição:");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.textEditor57 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor57:setParent(obj.popAbilitybossField);
    obj.textEditor57:setLeft(005);
    obj.textEditor57:setTop(30);
    obj.textEditor57:setHeight(165);
    obj.textEditor57:setWidth(290);
    obj.textEditor57:setField("DescricaobossField");
    obj.textEditor57:setText("Field Effects are special Abilities that allow a monster to change the nature of the immediate battlefield to seal a party's powers or otherwise inconvenience them. A Field Effect takes a single Action to deploy. Its effects only harm the PCs and their allies; the only way to stop an Effect is by defeating the monster that deployed it. Because Field Effects can have a drastic impact on combat difficulty, it is recommended that they be restricted to Boss monsters and creatures summoned through Alarm or Slave Parts. Only one Field Effect may be active at any one time even if multiple monsters can use them, though the current Field Effect can be changed by expending an Action to deploy a new Effect..");
    obj.textEditor57:setName("textEditor57");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout75);
    obj.label185:setLeft(000);
    obj.label185:setTop(075);
    obj.label185:setHeight(20);
    obj.label185:setWidth(170);
    obj.label185:setText("Field Effects");
    lfm_setPropAsString(obj.label185, "fontStyle",  "bold");
    obj.label185:setName("label185");

    obj.BotaobossField = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaobossField:setParent(obj.layout75);
    obj.BotaobossField:setLeft(175);
    obj.BotaobossField:setTop(075);
    obj.BotaobossField:setWidth(23);
    obj.BotaobossField:setHeight(25);
    obj.BotaobossField:setText("i");
    obj.BotaobossField:setName("BotaobossField");

    obj.popAbilityfieldAttack = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldAttack:setParent(obj.layout75);
    obj.popAbilityfieldAttack:setName("popAbilityfieldAttack");
    obj.popAbilityfieldAttack:setWidth(300);
    obj.popAbilityfieldAttack:setHeight(200);
    obj.popAbilityfieldAttack:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldAttack, "autoScopeNode",  "false");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.popAbilityfieldAttack);
    obj.label186:setLeft(05);
    obj.label186:setTop(5);
    obj.label186:setWidth(60);
    obj.label186:setHeight(20);
    obj.label186:setText("Descrição:");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.textEditor58 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor58:setParent(obj.popAbilityfieldAttack);
    obj.textEditor58:setLeft(005);
    obj.textEditor58:setTop(30);
    obj.textEditor58:setHeight(165);
    obj.textEditor58:setWidth(290);
    obj.textEditor58:setField("DescricaofieldAttack");
    obj.textEditor58:setText("Basic attacks are locked down. \n No Attack Actions may be used for as long as Attack Lock remains active, \n though Abilities that take an Attack Action as a basis remain unaffected.");
    obj.textEditor58:setName("textEditor58");

    obj.checkBox444 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox444:setParent(obj.layout75);
    obj.checkBox444:setLeft(020);
    obj.checkBox444:setTop(100);
    obj.checkBox444:setHeight(20);
    obj.checkBox444:setWidth(150);
    obj.checkBox444:setText("Attack Lock");
    obj.checkBox444:setField("fieldAttack");
    obj.checkBox444:setName("checkBox444");

    obj.BotaofieldAttack = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldAttack:setParent(obj.layout75);
    obj.BotaofieldAttack:setLeft(175);
    obj.BotaofieldAttack:setTop(100);
    obj.BotaofieldAttack:setWidth(23);
    obj.BotaofieldAttack:setHeight(25);
    obj.BotaofieldAttack:setText("i");
    obj.BotaofieldAttack:setName("BotaofieldAttack");

    obj.popAbilityfieldSap = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldSap:setParent(obj.layout75);
    obj.popAbilityfieldSap:setName("popAbilityfieldSap");
    obj.popAbilityfieldSap:setWidth(300);
    obj.popAbilityfieldSap:setHeight(200);
    obj.popAbilityfieldSap:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldSap, "autoScopeNode",  "false");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.popAbilityfieldSap);
    obj.label187:setLeft(05);
    obj.label187:setTop(5);
    obj.label187:setWidth(60);
    obj.label187:setHeight(20);
    obj.label187:setText("Descrição:");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.textEditor59 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor59:setParent(obj.popAbilityfieldSap);
    obj.textEditor59:setLeft(005);
    obj.textEditor59:setTop(30);
    obj.textEditor59:setHeight(165);
    obj.textEditor59:setWidth(290);
    obj.textEditor59:setField("DescricaofieldSap");
    obj.textEditor59:setText("The surrounding area continuously drains the party's health, reducing their HP by 5% of its maximum value at the end of every Round. \n This Effect is cumulative with anything else that deals damage over time, such as the Status Condition Poison, and remains in effect as long as HP Sap is active.");
    obj.textEditor59:setName("textEditor59");

    obj.checkBox445 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox445:setParent(obj.layout75);
    obj.checkBox445:setLeft(020);
    obj.checkBox445:setTop(125);
    obj.checkBox445:setHeight(20);
    obj.checkBox445:setWidth(150);
    obj.checkBox445:setText("HP Sap");
    obj.checkBox445:setField("fieldSap");
    obj.checkBox445:setName("checkBox445");

    obj.BotaofieldSap = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldSap:setParent(obj.layout75);
    obj.BotaofieldSap:setLeft(175);
    obj.BotaofieldSap:setTop(125);
    obj.BotaofieldSap:setWidth(23);
    obj.BotaofieldSap:setHeight(25);
    obj.BotaofieldSap:setText("i");
    obj.BotaofieldSap:setName("BotaofieldSap");

    obj.popAbilityfieldItem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldItem:setParent(obj.layout75);
    obj.popAbilityfieldItem:setName("popAbilityfieldItem");
    obj.popAbilityfieldItem:setWidth(300);
    obj.popAbilityfieldItem:setHeight(200);
    obj.popAbilityfieldItem:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldItem, "autoScopeNode",  "false");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.popAbilityfieldItem);
    obj.label188:setLeft(05);
    obj.label188:setTop(5);
    obj.label188:setWidth(60);
    obj.label188:setHeight(20);
    obj.label188:setText("Descrição:");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.textEditor60 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor60:setParent(obj.popAbilityfieldItem);
    obj.textEditor60:setLeft(005);
    obj.textEditor60:setTop(30);
    obj.textEditor60:setHeight(165);
    obj.textEditor60:setWidth(290);
    obj.textEditor60:setField("DescricaofieldItem");
    obj.textEditor60:setText("Item use is locked down. No Item Actions may be taken for as long as Item Lock remains active. \n This includes Abilities that use an Item Action as their basis, such as Auto-Potion");
    obj.textEditor60:setName("textEditor60");

    obj.checkBox446 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox446:setParent(obj.layout75);
    obj.checkBox446:setLeft(020);
    obj.checkBox446:setTop(150);
    obj.checkBox446:setHeight(20);
    obj.checkBox446:setWidth(150);
    obj.checkBox446:setText("Item Lock");
    obj.checkBox446:setField("fieldItem");
    obj.checkBox446:setName("checkBox446");

    obj.BotaofieldItem = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldItem:setParent(obj.layout75);
    obj.BotaofieldItem:setLeft(175);
    obj.BotaofieldItem:setTop(150);
    obj.BotaofieldItem:setWidth(23);
    obj.BotaofieldItem:setHeight(25);
    obj.BotaofieldItem:setText("i");
    obj.BotaofieldItem:setName("BotaofieldItem");

    obj.popAbilityfieldMagic = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldMagic:setParent(obj.layout75);
    obj.popAbilityfieldMagic:setName("popAbilityfieldMagic");
    obj.popAbilityfieldMagic:setWidth(300);
    obj.popAbilityfieldMagic:setHeight(200);
    obj.popAbilityfieldMagic:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldMagic, "autoScopeNode",  "false");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.popAbilityfieldMagic);
    obj.label189:setLeft(05);
    obj.label189:setTop(5);
    obj.label189:setWidth(60);
    obj.label189:setHeight(20);
    obj.label189:setText("Descrição:");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.textEditor61 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor61:setParent(obj.popAbilityfieldMagic);
    obj.textEditor61:setLeft(005);
    obj.textEditor61:setTop(30);
    obj.textEditor61:setHeight(165);
    obj.textEditor61:setWidth(290);
    obj.textEditor61:setField("DescricaofieldMagic");
    obj.textEditor61:setText("All magical energy on the battlefield is sealed. \n No Magic Abilities may be used for as long as Magic Lock remains active.");
    obj.textEditor61:setName("textEditor61");

    obj.checkBox447 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox447:setParent(obj.layout75);
    obj.checkBox447:setLeft(020);
    obj.checkBox447:setTop(175);
    obj.checkBox447:setHeight(20);
    obj.checkBox447:setWidth(150);
    obj.checkBox447:setText("Magic Lock");
    obj.checkBox447:setField("fieldMagic");
    obj.checkBox447:setName("checkBox447");

    obj.BotaofieldMagic = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldMagic:setParent(obj.layout75);
    obj.BotaofieldMagic:setLeft(175);
    obj.BotaofieldMagic:setTop(175);
    obj.BotaofieldMagic:setWidth(23);
    obj.BotaofieldMagic:setHeight(25);
    obj.BotaofieldMagic:setText("i");
    obj.BotaofieldMagic:setName("BotaofieldMagic");

    obj.popAbilityfieldMagnetic = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldMagnetic:setParent(obj.layout75);
    obj.popAbilityfieldMagnetic:setName("popAbilityfieldMagnetic");
    obj.popAbilityfieldMagnetic:setWidth(300);
    obj.popAbilityfieldMagnetic:setHeight(200);
    obj.popAbilityfieldMagnetic:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldMagnetic, "autoScopeNode",  "false");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.popAbilityfieldMagnetic);
    obj.label190:setLeft(05);
    obj.label190:setTop(5);
    obj.label190:setWidth(60);
    obj.label190:setHeight(20);
    obj.label190:setText("Descrição:");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.textEditor62 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor62:setParent(obj.popAbilityfieldMagnetic);
    obj.textEditor62:setLeft(005);
    obj.textEditor62:setTop(30);
    obj.textEditor62:setHeight(165);
    obj.textEditor62:setWidth(290);
    obj.textEditor62:setField("DescricaofieldMagnetic");
    obj.textEditor62:setText("A powerful magnetic field dominates the area, weighing down any combatant with metallic equipment. \n Characters wearing Mail, Helmets, Shields, or Gauntlets are afflicted with the Status Condition Slow, even if they would normally be immune to it; \n the same applies to characters wielding any Weapon other than Boomerangs, Bows, Flails, Gloves, Rods or Staves. Slow cannot be canceled for as long as Magnetic Field remains active.");
    obj.textEditor62:setName("textEditor62");

    obj.checkBox448 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox448:setParent(obj.layout75);
    obj.checkBox448:setLeft(020);
    obj.checkBox448:setTop(200);
    obj.checkBox448:setHeight(20);
    obj.checkBox448:setWidth(150);
    obj.checkBox448:setText("Magnetic Field");
    obj.checkBox448:setField("fieldMagnetic");
    obj.checkBox448:setName("checkBox448");

    obj.BotaofieldMagnetic = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldMagnetic:setParent(obj.layout75);
    obj.BotaofieldMagnetic:setLeft(175);
    obj.BotaofieldMagnetic:setTop(200);
    obj.BotaofieldMagnetic:setWidth(23);
    obj.BotaofieldMagnetic:setHeight(25);
    obj.BotaofieldMagnetic:setText("i");
    obj.BotaofieldMagnetic:setName("BotaofieldMagnetic");

    obj.popAbilityfieldSpell = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldSpell:setParent(obj.layout75);
    obj.popAbilityfieldSpell:setName("popAbilityfieldSpell");
    obj.popAbilityfieldSpell:setWidth(300);
    obj.popAbilityfieldSpell:setHeight(200);
    obj.popAbilityfieldSpell:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldSpell, "autoScopeNode",  "false");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.popAbilityfieldSpell);
    obj.label191:setLeft(05);
    obj.label191:setTop(5);
    obj.label191:setWidth(60);
    obj.label191:setHeight(20);
    obj.label191:setText("Descrição:");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.textEditor63 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor63:setParent(obj.popAbilityfieldSpell);
    obj.textEditor63:setLeft(005);
    obj.textEditor63:setTop(30);
    obj.textEditor63:setHeight(165);
    obj.textEditor63:setWidth(290);
    obj.textEditor63:setField("DescricaofieldSpell");
    obj.textEditor63:setText("A powerful anti-magic field disrupts all spellcasting in the area. \n No Spells may be used for as long as Spell Lock remains active.");
    obj.textEditor63:setName("textEditor63");

    obj.checkBox449 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox449:setParent(obj.layout75);
    obj.checkBox449:setLeft(020);
    obj.checkBox449:setTop(225);
    obj.checkBox449:setHeight(20);
    obj.checkBox449:setWidth(150);
    obj.checkBox449:setText("Spell Lock");
    obj.checkBox449:setField("fieldSpell");
    obj.checkBox449:setName("checkBox449");

    obj.BotaofieldSpell = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldSpell:setParent(obj.layout75);
    obj.BotaofieldSpell:setLeft(175);
    obj.BotaofieldSpell:setTop(225);
    obj.BotaofieldSpell:setWidth(23);
    obj.BotaofieldSpell:setHeight(25);
    obj.BotaofieldSpell:setText("i");
    obj.BotaofieldSpell:setName("BotaofieldSpell");

    obj.popAbilityfieldTech = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityfieldTech:setParent(obj.layout75);
    obj.popAbilityfieldTech:setName("popAbilityfieldTech");
    obj.popAbilityfieldTech:setWidth(300);
    obj.popAbilityfieldTech:setHeight(200);
    obj.popAbilityfieldTech:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityfieldTech, "autoScopeNode",  "false");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.popAbilityfieldTech);
    obj.label192:setLeft(05);
    obj.label192:setTop(5);
    obj.label192:setWidth(60);
    obj.label192:setHeight(20);
    obj.label192:setText("Descrição:");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.textEditor64 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor64:setParent(obj.popAbilityfieldTech);
    obj.textEditor64:setLeft(005);
    obj.textEditor64:setTop(30);
    obj.textEditor64:setHeight(165);
    obj.textEditor64:setWidth(290);
    obj.textEditor64:setField("DescricaofieldTech");
    obj.textEditor64:setText("Non-magical techniques are locked down.  \n No Slow or Fast Abilities may be used for as long as Technique Lock remains active, though Magic Abilities continue to function as normal.");
    obj.textEditor64:setName("textEditor64");

    obj.checkBox450 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox450:setParent(obj.layout75);
    obj.checkBox450:setLeft(020);
    obj.checkBox450:setTop(250);
    obj.checkBox450:setHeight(20);
    obj.checkBox450:setWidth(150);
    obj.checkBox450:setText("Technique Lock");
    obj.checkBox450:setField("fieldTech");
    obj.checkBox450:setName("checkBox450");

    obj.BotaofieldTech = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaofieldTech:setParent(obj.layout75);
    obj.BotaofieldTech:setLeft(175);
    obj.BotaofieldTech:setTop(250);
    obj.BotaofieldTech:setWidth(23);
    obj.BotaofieldTech:setHeight(25);
    obj.BotaofieldTech:setText("i");
    obj.BotaofieldTech:setName("BotaofieldTech");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.scrollBox9);
    obj.layout76:setLeft(500);
    obj.layout76:setTop(150);
    obj.layout76:setHeight(275);
    obj.layout76:setWidth(400);
    obj.layout76:setName("layout76");

    obj.popAbilitybossDecoy = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitybossDecoy:setParent(obj.layout76);
    obj.popAbilitybossDecoy:setName("popAbilitybossDecoy");
    obj.popAbilitybossDecoy:setWidth(300);
    obj.popAbilitybossDecoy:setHeight(200);
    obj.popAbilitybossDecoy:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitybossDecoy, "autoScopeNode",  "false");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.popAbilitybossDecoy);
    obj.label193:setLeft(05);
    obj.label193:setTop(5);
    obj.label193:setWidth(60);
    obj.label193:setHeight(20);
    obj.label193:setText("Descrição:");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.textEditor65 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor65:setParent(obj.popAbilitybossDecoy);
    obj.textEditor65:setLeft(005);
    obj.textEditor65:setTop(30);
    obj.textEditor65:setHeight(165);
    obj.textEditor65:setWidth(290);
    obj.textEditor65:setField("DescricaobossDecoy");
    obj.textEditor65:setText("For protection’s sake, the monster surrounds itself with doppelgangers, taking safety in numbers. \n A Decoy is entirely identical in appearance to the monster it replicates; not even a Scan Spell would be able to find a difference between the two. \n For this reason, Decoys are treated as a separate targets in combat, though they have no HP of their own and may make no Actions; the only way to destroy them is to eliminate their 'parent.' \n The Decoy's effects depend on how the Party direct its attacks. If the original monster is hit, it will take damage as normal, but striking a Decoy will result in an immediate counterattack; the monster itself suffers no ill effects. This attack takes the form of a Reaction Ability that must be assembled and paid for separately from the Decoy. XP and Gil values are given per Decoy assigned; a monster with three Decoys would incur XP and Gil modifiers of +60 and +75 respectively.");
    obj.textEditor65:setName("textEditor65");

    obj.checkBox451 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox451:setParent(obj.layout76);
    obj.checkBox451:setLeft(000);
    obj.checkBox451:setTop(000);
    obj.checkBox451:setHeight(20);
    obj.checkBox451:setWidth(150);
    obj.checkBox451:setText("Decoy");
    obj.checkBox451:setField("bossDecoy");
    lfm_setPropAsString(obj.checkBox451, "fontStyle",  "bold");
    obj.checkBox451:setName("checkBox451");

    obj.BotaobossDecoy = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaobossDecoy:setParent(obj.layout76);
    obj.BotaobossDecoy:setLeft(175);
    obj.BotaobossDecoy:setTop(000);
    obj.BotaobossDecoy:setWidth(23);
    obj.BotaobossDecoy:setHeight(25);
    obj.BotaobossDecoy:setText("i");
    obj.BotaobossDecoy:setName("BotaobossDecoy");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout76);
    obj.edit247:setLeft(205);
    obj.edit247:setTop(000);
    obj.edit247:setHeight(20);
    obj.edit247:setWidth(30);
    obj.edit247:setField("bossDecoyNum");
    obj.edit247:setHorzTextAlign("center");
    obj.edit247:setHint("Número de Decoys");
    obj.edit247:setType("number");
    obj.edit247:setName("edit247");

    obj.popAbilityimmStatus = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilityimmStatus:setParent(obj.layout76);
    obj.popAbilityimmStatus:setName("popAbilityimmStatus");
    obj.popAbilityimmStatus:setWidth(300);
    obj.popAbilityimmStatus:setHeight(200);
    obj.popAbilityimmStatus:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilityimmStatus, "autoScopeNode",  "false");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.popAbilityimmStatus);
    obj.label194:setLeft(05);
    obj.label194:setTop(5);
    obj.label194:setWidth(60);
    obj.label194:setHeight(20);
    obj.label194:setText("Descrição:");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.textEditor66 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor66:setParent(obj.popAbilityimmStatus);
    obj.textEditor66:setLeft(005);
    obj.textEditor66:setTop(30);
    obj.textEditor66:setHeight(165);
    obj.textEditor66:setWidth(290);
    obj.textEditor66:setField("DescricaoimmStatus");
    obj.textEditor66:setText("The monster has Immunity to all negative Status Conditions – Fatal-type, Mystify-type, Seal-type, Time-type, Toxin-type, Transform-type, and Weaken-type. \n Any rolls to inflict a Status Condition have a CoS of 0");
    obj.textEditor66:setName("textEditor66");

    obj.checkBox452 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox452:setParent(obj.layout76);
    obj.checkBox452:setLeft(000);
    obj.checkBox452:setTop(025);
    obj.checkBox452:setHeight(20);
    obj.checkBox452:setWidth(150);
    obj.checkBox452:setText("Immunity-All");
    obj.checkBox452:setField("immStatus");
    lfm_setPropAsString(obj.checkBox452, "fontStyle",  "bold");
    obj.checkBox452:setName("checkBox452");

    obj.BotaoimmStatus = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoimmStatus:setParent(obj.layout76);
    obj.BotaoimmStatus:setLeft(175);
    obj.BotaoimmStatus:setTop(025);
    obj.BotaoimmStatus:setWidth(23);
    obj.BotaoimmStatus:setHeight(25);
    obj.BotaoimmStatus:setText("i");
    obj.BotaoimmStatus:setName("BotaoimmStatus");

    obj.popAbilitybossSlave = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitybossSlave:setParent(obj.layout76);
    obj.popAbilitybossSlave:setName("popAbilitybossSlave");
    obj.popAbilitybossSlave:setWidth(300);
    obj.popAbilitybossSlave:setHeight(200);
    obj.popAbilitybossSlave:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitybossSlave, "autoScopeNode",  "false");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.popAbilitybossSlave);
    obj.label195:setLeft(05);
    obj.label195:setTop(5);
    obj.label195:setWidth(60);
    obj.label195:setHeight(20);
    obj.label195:setText("Descrição:");
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.textEditor67 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor67:setParent(obj.popAbilitybossSlave);
    obj.textEditor67:setLeft(005);
    obj.textEditor67:setTop(30);
    obj.textEditor67:setHeight(165);
    obj.textEditor67:setWidth(290);
    obj.textEditor67:setField("DescricaobossSlave");
    obj.textEditor67:setText("Some bosses in the Final Fantasy games are so large that they are actually composed of multiple parts. \n In the FFRPG, this is simulated by giving a Boss Slave Parts. \n A Slave Part is created as if it were an individual monster with the Slave Part Ability, and is treated as an individual combatant with its own Initiative in combat. \n However, it cannot move under its own power – it moves where the Boss moves. \n Slave Parts are incapacitated as normal when they are reduced to 0 HP, though they award no Gil or Experience when defeated; instead, the XP and Gil values of a Boss's Slave Parts are added to the Boss's own. \n When the Boss is reduced to 0 HP, all of its Slave Parts are also reduced to 0 Hit Points, regardless of current HP, ARM, or M. ARM. Slave Parts come in three types:");
    obj.textEditor67:setName("textEditor67");

    obj.checkBox453 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox453:setParent(obj.layout76);
    obj.checkBox453:setLeft(000);
    obj.checkBox453:setTop(050);
    obj.checkBox453:setHeight(20);
    obj.checkBox453:setWidth(150);
    obj.checkBox453:setText("Slave Part");
    obj.checkBox453:setField("bossSlave");
    lfm_setPropAsString(obj.checkBox453, "fontStyle",  "bold");
    obj.checkBox453:setName("checkBox453");

    obj.BotaobossSlave = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaobossSlave:setParent(obj.layout76);
    obj.BotaobossSlave:setLeft(175);
    obj.BotaobossSlave:setTop(050);
    obj.BotaobossSlave:setWidth(23);
    obj.BotaobossSlave:setHeight(25);
    obj.BotaobossSlave:setText("i");
    obj.BotaobossSlave:setName("BotaobossSlave");

    obj.popAbilitybossSlaveN = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitybossSlaveN:setParent(obj.layout76);
    obj.popAbilitybossSlaveN:setName("popAbilitybossSlaveN");
    obj.popAbilitybossSlaveN:setWidth(300);
    obj.popAbilitybossSlaveN:setHeight(200);
    obj.popAbilitybossSlaveN:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitybossSlaveN, "autoScopeNode",  "false");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.popAbilitybossSlaveN);
    obj.label196:setLeft(05);
    obj.label196:setTop(5);
    obj.label196:setWidth(60);
    obj.label196:setHeight(20);
    obj.label196:setText("Descrição:");
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.textEditor68 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor68:setParent(obj.popAbilitybossSlaveN);
    obj.textEditor68:setLeft(005);
    obj.textEditor68:setTop(30);
    obj.textEditor68:setHeight(165);
    obj.textEditor68:setWidth(290);
    obj.textEditor68:setField("DescricaobossSlaveN");
    obj.textEditor68:setText("Normal Parts begin the battle with the Boss, and are permanently incapacitated when reduced to 0 HP in combat.");
    obj.textEditor68:setName("textEditor68");

    obj.checkBox454 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox454:setParent(obj.layout76);
    obj.checkBox454:setLeft(020);
    obj.checkBox454:setTop(075);
    obj.checkBox454:setHeight(20);
    obj.checkBox454:setWidth(150);
    obj.checkBox454:setText("Normal Parts");
    obj.checkBox454:setField("bossSlaveN");
    obj.checkBox454:setName("checkBox454");

    obj.BotaobossSlaveN = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaobossSlaveN:setParent(obj.layout76);
    obj.BotaobossSlaveN:setLeft(175);
    obj.BotaobossSlaveN:setTop(075);
    obj.BotaobossSlaveN:setWidth(23);
    obj.BotaobossSlaveN:setHeight(25);
    obj.BotaobossSlaveN:setText("i");
    obj.BotaobossSlaveN:setName("BotaobossSlaveN");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout76);
    obj.edit248:setLeft(205);
    obj.edit248:setTop(075);
    obj.edit248:setHeight(20);
    obj.edit248:setWidth(30);
    obj.edit248:setField("bossSlaveN1");
    obj.edit248:setHorzTextAlign("center");
    obj.edit248:setHint("número de partes");
    obj.edit248:setType("number");
    obj.edit248:setName("edit248");

    obj.popAbilitybossSlaveS = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitybossSlaveS:setParent(obj.layout76);
    obj.popAbilitybossSlaveS:setName("popAbilitybossSlaveS");
    obj.popAbilitybossSlaveS:setWidth(300);
    obj.popAbilitybossSlaveS:setHeight(200);
    obj.popAbilitybossSlaveS:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitybossSlaveS, "autoScopeNode",  "false");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.popAbilitybossSlaveS);
    obj.label197:setLeft(05);
    obj.label197:setTop(5);
    obj.label197:setWidth(60);
    obj.label197:setHeight(20);
    obj.label197:setText("Descrição:");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.textEditor69 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor69:setParent(obj.popAbilitybossSlaveS);
    obj.textEditor69:setLeft(005);
    obj.textEditor69:setTop(30);
    obj.textEditor69:setHeight(165);
    obj.textEditor69:setWidth(290);
    obj.textEditor69:setField("DescricaobossSlaveS");
    obj.textEditor69:setText("Summoned Parts must be brought into battle by the Boss at the cost of an Ability Action. \n If reduced to 0 or fewer Hit Points in combat, the controlling monster may revive them with full HP and MP at the cost of a second Action.");
    obj.textEditor69:setName("textEditor69");

    obj.checkBox455 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox455:setParent(obj.layout76);
    obj.checkBox455:setLeft(020);
    obj.checkBox455:setTop(100);
    obj.checkBox455:setHeight(20);
    obj.checkBox455:setWidth(150);
    obj.checkBox455:setText("Summoned Parts");
    obj.checkBox455:setField("bossSlaveS");
    obj.checkBox455:setName("checkBox455");

    obj.BotaobossSlaveS = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaobossSlaveS:setParent(obj.layout76);
    obj.BotaobossSlaveS:setLeft(175);
    obj.BotaobossSlaveS:setTop(100);
    obj.BotaobossSlaveS:setWidth(23);
    obj.BotaobossSlaveS:setHeight(25);
    obj.BotaobossSlaveS:setText("i");
    obj.BotaobossSlaveS:setName("BotaobossSlaveS");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout76);
    obj.edit249:setLeft(205);
    obj.edit249:setTop(100);
    obj.edit249:setHeight(20);
    obj.edit249:setWidth(30);
    obj.edit249:setField("bossSlaveN2");
    obj.edit249:setHorzTextAlign("center");
    obj.edit249:setHint("número de partes");
    obj.edit249:setType("number");
    obj.edit249:setName("edit249");

    obj.popAbilitybossSlaveAR = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbilitybossSlaveAR:setParent(obj.layout76);
    obj.popAbilitybossSlaveAR:setName("popAbilitybossSlaveAR");
    obj.popAbilitybossSlaveAR:setWidth(300);
    obj.popAbilitybossSlaveAR:setHeight(200);
    obj.popAbilitybossSlaveAR:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbilitybossSlaveAR, "autoScopeNode",  "false");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.popAbilitybossSlaveAR);
    obj.label198:setLeft(05);
    obj.label198:setTop(5);
    obj.label198:setWidth(60);
    obj.label198:setHeight(20);
    obj.label198:setText("Descrição:");
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.textEditor70 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor70:setParent(obj.popAbilitybossSlaveAR);
    obj.textEditor70:setLeft(005);
    obj.textEditor70:setTop(30);
    obj.textEditor70:setHeight(165);
    obj.textEditor70:setWidth(290);
    obj.textEditor70:setField("DescricaobossSlaveAR");
    obj.textEditor70:setText("Auto-Reviving Parts revive with full Hit Points and Magic Points two Rounds after being incapacitated.");
    obj.textEditor70:setName("textEditor70");

    obj.checkBox456 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox456:setParent(obj.layout76);
    obj.checkBox456:setLeft(020);
    obj.checkBox456:setTop(125);
    obj.checkBox456:setHeight(20);
    obj.checkBox456:setWidth(150);
    obj.checkBox456:setText("Auto-Reviving Parts");
    obj.checkBox456:setField("bossSlaveAR");
    obj.checkBox456:setName("checkBox456");

    obj.BotaobossSlaveAR = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaobossSlaveAR:setParent(obj.layout76);
    obj.BotaobossSlaveAR:setLeft(175);
    obj.BotaobossSlaveAR:setTop(125);
    obj.BotaobossSlaveAR:setWidth(23);
    obj.BotaobossSlaveAR:setHeight(25);
    obj.BotaobossSlaveAR:setText("i");
    obj.BotaobossSlaveAR:setName("BotaobossSlaveAR");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout76);
    obj.edit250:setLeft(205);
    obj.edit250:setTop(125);
    obj.edit250:setHeight(20);
    obj.edit250:setWidth(30);
    obj.edit250:setField("bossSlaveN3");
    obj.edit250:setHorzTextAlign("center");
    obj.edit250:setHint("número de partes");
    obj.edit250:setType("number");
    obj.edit250:setName("edit250");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox9);
    obj.layout77:setLeft(1000);
    obj.layout77:setTop(570);
    obj.layout77:setHeight(50);
    obj.layout77:setWidth(90);
    obj.layout77:setName("layout77");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout77);
    obj.label199:setLeft(000);
    obj.label199:setTop(000);
    obj.label199:setHeight(20);
    obj.label199:setWidth(30);
    obj.label199:setText("Exp");
    obj.label199:setAutoSize(true);
    obj.label199:setName("label199");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout77);
    obj.edit251:setLeft(035);
    obj.edit251:setTop(000);
    obj.edit251:setHeight(20);
    obj.edit251:setWidth(50);
    obj.edit251:setField("ExpFinal");
    obj.edit251:setHorzTextAlign("center");
    obj.edit251:setName("edit251");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout77);
    obj.label200:setLeft(000);
    obj.label200:setTop(025);
    obj.label200:setHeight(20);
    obj.label200:setWidth(30);
    obj.label200:setText("Gil");
    obj.label200:setAutoSize(true);
    obj.label200:setName("label200");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout77);
    obj.edit252:setLeft(35);
    obj.edit252:setTop(025);
    obj.edit252:setHeight(20);
    obj.edit252:setWidth(50);
    obj.edit252:setField("GilFinal");
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setName("edit252");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Notes");
    obj.tab10:setName("tab10");

    obj.frmNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmNotes:setParent(obj.tab10);
    obj.frmNotes:setName("frmNotes");
    obj.frmNotes:setAlign("client");
    obj.frmNotes:setTheme("dark");
    obj.frmNotes:setMargins({top=1});

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.frmNotes);
    obj.layout78:setLeft(000);
    obj.layout78:setTop(000);
    obj.layout78:setHeight(650);
    obj.layout78:setWidth(1100);
    obj.layout78:setName("layout78");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout78);
    obj.image11:setLeft(000);
    obj.image11:setTop(000);
    obj.image11:setHeight(650);
    obj.image11:setWidth(1100);
    obj.image11:setSRC("/img/wallpaper.png");
    obj.image11:setStyle("autoFit");
    obj.image11:setName("image11");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmNotes);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.textEditor71 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor71:setParent(obj.scrollBox10);
    obj.textEditor71:setLeft(040);
    obj.textEditor71:setTop(020);
    obj.textEditor71:setWidth(500);
    obj.textEditor71:setHeight(560);
    obj.textEditor71:setField("campoTextoGrande");
    obj.textEditor71:setName("textEditor71");

    obj.textEditor72 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor72:setParent(obj.scrollBox10);
    obj.textEditor72:setLeft(560);
    obj.textEditor72:setTop(020);
    obj.textEditor72:setWidth(500);
    obj.textEditor72:setHeight(560);
    obj.textEditor72:setField("campoTextoGrande2");
    obj.textEditor72:setName("textEditor72");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Macros");
    obj.tab11:setName("tab11");

    obj.frmMacros = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMacros:setParent(obj.tab11);
    obj.frmMacros:setName("frmMacros");
    obj.frmMacros:setAlign("client");
    obj.frmMacros:setTheme("dark");
    obj.frmMacros:setMargins({top=1});

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.frmMacros);
    obj.layout79:setLeft(000);
    obj.layout79:setTop(000);
    obj.layout79:setHeight(650);
    obj.layout79:setWidth(1100);
    obj.layout79:setName("layout79");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout79);
    obj.image12:setLeft(000);
    obj.image12:setTop(000);
    obj.image12:setHeight(650);
    obj.image12:setWidth(1100);
    obj.image12:setSRC("/img/wallpaper.png");
    obj.image12:setStyle("autoFit");
    obj.image12:setName("image12");


	local function setTarget(obj1, max1, name1)
		for i=1, max1, 1 do
			obj1[i] = sheet[name1 .. i] or "";	
		end;
	end;




	local function setSelect(obj2, max2, name2)
		for i=1, max2, 1 do
			obj2[i] = sheet[name2 .. i] or false;	
		end;
	end;




	local function getRollStatus(id, DadoStatus, PRECM, DEXTE, MIND, EXPER)
		local ret = 0;
		if id == 1 then ret = PRECM-50-DadoStatus;
		elseif id == 2 then ret = PRECM-DadoStatus;
		elseif id == 3 then ret = DEXTE-DadoStatus;
		elseif id == 4 then ret = MIND-DadoStatus;
		elseif id == 5 then ret = PRECM-50-DadoStatus;
		elseif id == 6 then ret = 30-DadoStatus;
		elseif id == 7 then ret = 60-DadoStatus;
		elseif id == 8 then ret = 90-DadoStatus; 
		end;
		return ret;
	end;



    obj.scrollBox11 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.frmMacros);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox11);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(30);
    obj.layout80:setMargins({bottom=4});
    obj.layout80:setName("layout80");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout80);
    obj.button4:setText("Novo Golpe");
    obj.button4:setWidth(150);
    obj.button4:setAlign("left");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout80);
    obj.button5:setText("Organizar");
    obj.button5:setWidth(150);
    obj.button5:setAlign("left");
    obj.button5:setName("button5");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.scrollBox11);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox11);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(900);
    obj.boxDetalhesDoItem:setMargins({left=4, right=8});

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.boxDetalhesDoItem);
    obj.tabControl2:setLeft(50);
    obj.tabControl2:setTop(00);
    obj.tabControl2:setHeight(530);
    obj.tabControl2:setWidth(840);
    obj.tabControl2:setName("tabControl2");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl2);
    obj.tab12:setTitle("Golpe 1");
    obj.tab12:setName("tab12");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.tab12);
    obj.layout81:setLeft(010);
    obj.layout81:setTop(10);
    obj.layout81:setWidth(580);
    obj.layout81:setHeight(560);
    obj.layout81:setName("layout81");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout81);
    obj.label201:setLeft(0);
    obj.label201:setTop(00);
    obj.label201:setWidth(60);
    obj.label201:setHeight(20);
    obj.label201:setText("Nome:");
    obj.label201:setAutoSize(true);
    lfm_setPropAsString(obj.label201, "fontStyle",  "bold");
    obj.label201:setName("label201");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout81);
    obj.edit253:setLeft(65);
    obj.edit253:setTop(00);
    obj.edit253:setWidth(140);
    obj.edit253:setHeight(20);
    obj.edit253:setField("campoNome");
    obj.edit253:setName("edit253");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout81);
    obj.label202:setLeft(0);
    obj.label202:setTop(25);
    obj.label202:setWidth(60);
    obj.label202:setHeight(20);
    obj.label202:setText("Alvo:");
    obj.label202:setAutoSize(true);
    lfm_setPropAsString(obj.label202, "fontStyle",  "bold");
    obj.label202:setName("label202");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout81);
    obj.comboBox31:setLeft(65);
    obj.comboBox31:setTop(25);
    obj.comboBox31:setWidth(140);
    obj.comboBox31:setHeight(20);
    obj.comboBox31:setField("catAlvo");
    obj.comboBox31:setHorzTextAlign("center");
    obj.comboBox31:setItems({'Único Inimigo', 'Único Aliado', 'Inimigo Aleatório', 'Grupo', 'Aliados', 'Todos', 'Aleatório'});
    obj.comboBox31:setValues({'1', '2', '3', '4', '5','6', '7'});
    obj.comboBox31:setName("comboBox31");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout81);
    obj.dataLink31:setField("catAlvo");
    obj.dataLink31:setDefaultValue("1");
    obj.dataLink31:setName("dataLink31");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout81);
    obj.label203:setLeft(0);
    obj.label203:setTop(50);
    obj.label203:setWidth(60);
    obj.label203:setHeight(20);
    obj.label203:setText("Acerto:");
    obj.label203:setAutoSize(true);
    lfm_setPropAsString(obj.label203, "fontStyle",  "bold");
    obj.label203:setName("label203");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout81);
    obj.comboBox32:setLeft(65);
    obj.comboBox32:setTop(50);
    obj.comboBox32:setWidth(140);
    obj.comboBox32:setHeight(20);
    obj.comboBox32:setField("catAcerto");
    obj.comboBox32:setHorzTextAlign("center");
    obj.comboBox32:setItems({'Precisão Física', 'Precisão Mágica', 'Automático', 'Precisão Física/2'});
    obj.comboBox32:setValues({'1', '2', '3','4'});
    obj.comboBox32:setName("comboBox32");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout81);
    obj.dataLink32:setField("catAcerto");
    obj.dataLink32:setDefaultValue("1");
    obj.dataLink32:setName("dataLink32");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout81);
    obj.label204:setLeft(0);
    obj.label204:setTop(75);
    obj.label204:setWidth(60);
    obj.label204:setHeight(20);
    obj.label204:setText("Tipo:");
    obj.label204:setAutoSize(true);
    lfm_setPropAsString(obj.label204, "fontStyle",  "bold");
    obj.label204:setName("label204");

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout81);
    obj.comboBox33:setLeft(65);
    obj.comboBox33:setTop(75);
    obj.comboBox33:setWidth(140);
    obj.comboBox33:setHeight(20);
    obj.comboBox33:setField("catTipo");
    obj.comboBox33:setHorzTextAlign("center");
    obj.comboBox33:setItems({'Não-Elemental', 'Arcano', 'Fogo', 'Gelo', 'Água', 'Eletricidade', 'Terra', 'Vento', 'Bio', 'Trevas', 'Sagrado', 'Recuperação'});
    obj.comboBox33:setValues({'1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11','12'});
    obj.comboBox33:setName("comboBox33");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout81);
    obj.dataLink33:setField("catTipo");
    obj.dataLink33:setDefaultValue("1");
    obj.dataLink33:setName("dataLink33");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.tab12);
    obj.layout82:setLeft(010);
    obj.layout82:setTop(60);
    obj.layout82:setWidth(580);
    obj.layout82:setHeight(560);
    obj.layout82:setName("layout82");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout82);
    obj.label205:setLeft(0);
    obj.label205:setTop(75);
    obj.label205:setWidth(105);
    obj.label205:setHeight(20);
    obj.label205:setText("Custo em MP:");
    obj.label205:setAutoSize(true);
    lfm_setPropAsString(obj.label205, "fontStyle",  "bold");
    obj.label205:setName("label205");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout82);
    obj.edit254:setLeft(110);
    obj.edit254:setTop(75);
    obj.edit254:setWidth(30);
    obj.edit254:setHeight(20);
    obj.edit254:setField("campoCustoMP");
    obj.edit254:setType("number");
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setName("edit254");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout82);
    obj.button6:setLeft(145);
    obj.button6:setTop(75);
    obj.button6:setText("Gastar");
    obj.button6:setWidth(60);
    obj.button6:setName("button6");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout82);
    obj.label206:setLeft(0);
    obj.label206:setTop(100);
    obj.label206:setWidth(105);
    obj.label206:setHeight(20);
    obj.label206:setText("Tempo de Carga:");
    obj.label206:setAutoSize(true);
    lfm_setPropAsString(obj.label206, "fontStyle",  "bold");
    obj.label206:setName("label206");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout82);
    obj.edit255:setLeft(110);
    obj.edit255:setTop(100);
    obj.edit255:setWidth(30);
    obj.edit255:setHeight(20);
    obj.edit255:setField("campoTC");
    obj.edit255:setType("number");
    obj.edit255:setHorzTextAlign("center");
    obj.edit255:setName("edit255");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout82);
    obj.button7:setLeft(145);
    obj.button7:setTop(100);
    obj.button7:setText("Carregar");
    obj.button7:setWidth(60);
    obj.button7:setName("button7");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.tab12);
    obj.layout83:setLeft(230);
    obj.layout83:setTop(60);
    obj.layout83:setWidth(300);
    obj.layout83:setHeight(300);
    obj.layout83:setName("layout83");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout83);
    obj.label207:setLeft(00);
    obj.label207:setTop(00);
    obj.label207:setWidth(80);
    obj.label207:setHeight(20);
    obj.label207:setText("Subtrai:");
    obj.label207:setHorzTextAlign("leading");
    obj.label207:setAutoSize(true);
    lfm_setPropAsString(obj.label207, "fontStyle",  "bold");
    obj.label207:setName("label207");

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout83);
    obj.comboBox34:setLeft(50);
    obj.comboBox34:setTop(00);
    obj.comboBox34:setWidth(80);
    obj.comboBox34:setHeight(20);
    obj.comboBox34:setField("fieldSubEVA");
    obj.comboBox34:setHorzTextAlign("center");
    obj.comboBox34:setItems({'EVA', 'EVAM', 'EVA/2', 'Nada'});
    obj.comboBox34:setValues({'1', '2', '3', '4'});
    obj.comboBox34:setName("comboBox34");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout83);
    obj.dataLink34:setField("fieldSubEVA");
    obj.dataLink34:setDefaultValue("1");
    obj.dataLink34:setName("dataLink34");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout83);
    obj.label208:setLeft(00);
    obj.label208:setTop(25);
    obj.label208:setWidth(80);
    obj.label208:setHeight(20);
    obj.label208:setText("Subtrai:");
    obj.label208:setHorzTextAlign("leading");
    obj.label208:setAutoSize(true);
    lfm_setPropAsString(obj.label208, "fontStyle",  "bold");
    obj.label208:setName("label208");

    obj.comboBox35 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.layout83);
    obj.comboBox35:setLeft(50);
    obj.comboBox35:setTop(25);
    obj.comboBox35:setWidth(80);
    obj.comboBox35:setHeight(20);
    obj.comboBox35:setField("fieldSubDEF");
    obj.comboBox35:setHorzTextAlign("center");
    obj.comboBox35:setItems({'ARM', 'ARMM', 'ARM/2', 'ARMM/2', 'Nada'});
    obj.comboBox35:setValues({'1', '2', '3', '4', '5'});
    obj.comboBox35:setName("comboBox35");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout83);
    obj.dataLink35:setField("fieldSubDEF");
    obj.dataLink35:setDefaultValue("1");
    obj.dataLink35:setName("dataLink35");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.tab12);
    obj.layout84:setLeft(230);
    obj.layout84:setTop(85);
    obj.layout84:setWidth(300);
    obj.layout84:setHeight(300);
    obj.layout84:setName("layout84");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout84);
    obj.label209:setLeft(00);
    obj.label209:setTop(50);
    obj.label209:setWidth(80);
    obj.label209:setHeight(20);
    obj.label209:setText("Custo HP%:");
    obj.label209:setHorzTextAlign("leading");
    obj.label209:setAutoSize(true);
    lfm_setPropAsString(obj.label209, "fontStyle",  "bold");
    obj.label209:setName("label209");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout84);
    obj.edit256:setTop(50);
    obj.edit256:setLeft(75);
    obj.edit256:setWidth(55);
    obj.edit256:setHeight(20);
    obj.edit256:setField("campoCustoHP");
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setName("edit256");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout84);
    obj.label210:setLeft(00);
    obj.label210:setTop(75);
    obj.label210:setWidth(80);
    obj.label210:setHeight(20);
    obj.label210:setText("Repetições:");
    obj.label210:setHorzTextAlign("leading");
    obj.label210:setAutoSize(true);
    lfm_setPropAsString(obj.label210, "fontStyle",  "bold");
    obj.label210:setName("label210");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout84);
    obj.edit257:setTop(75);
    obj.edit257:setLeft(75);
    obj.edit257:setWidth(55);
    obj.edit257:setHeight(20);
    obj.edit257:setField("campoRepeat");
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setType("number");
    obj.edit257:setName("edit257");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout84);
    obj.dataLink36:setField("campoRepeat");
    obj.dataLink36:setDefaultValue("1");
    obj.dataLink36:setName("dataLink36");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.tab12);
    obj.layout85:setLeft(365);
    obj.layout85:setTop(10);
    obj.layout85:setWidth(500);
    obj.layout85:setHeight(300);
    obj.layout85:setName("layout85");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout85);
    obj.label211:setLeft(25);
    obj.label211:setTop(00);
    obj.label211:setWidth(300);
    obj.label211:setHeight(20);
    obj.label211:setText("Status");
    obj.label211:setHorzTextAlign("center");
    obj.label211:setAutoSize(true);
    lfm_setPropAsString(obj.label211, "fontStyle",  "bold");
    obj.label211:setName("label211");

    obj.checkBox457 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox457:setParent(obj.layout85);
    obj.checkBox457:setTop(00);
    obj.checkBox457:setLeft(330);
    obj.checkBox457:setWidth(20);
    obj.checkBox457:setHeight(20);
    obj.checkBox457:setField("activeSRANDOM");
    obj.checkBox457:setName("checkBox457");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout85);
    obj.label212:setLeft(355);
    obj.label212:setTop(00);
    obj.label212:setWidth(150);
    obj.label212:setHeight(20);
    obj.label212:setText("Status Aleatório");
    obj.label212:setHorzTextAlign("leading");
    obj.label212:setAutoSize(true);
    lfm_setPropAsString(obj.label212, "fontStyle",  "bold");
    obj.label212:setName("label212");

    obj.checkBox458 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox458:setParent(obj.layout85);
    obj.checkBox458:setTop(25);
    obj.checkBox458:setLeft(0);
    obj.checkBox458:setWidth(20);
    obj.checkBox458:setHeight(20);
    obj.checkBox458:setField("activeStatus1");
    obj.checkBox458:setName("checkBox458");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout85);
    obj.edit258:setTop(25);
    obj.edit258:setLeft(25);
    obj.edit258:setWidth(250);
    obj.edit258:setHeight(20);
    obj.edit258:setField("nameStatus1");
    obj.edit258:setName("edit258");

    obj.comboBox36 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.layout85);
    obj.comboBox36:setTop(25);
    obj.comboBox36:setLeft(280);
    obj.comboBox36:setWidth(120);
    obj.comboBox36:setHeight(20);
    obj.comboBox36:setField("sourceStatus1");
    obj.comboBox36:setHorzTextAlign("center");
    obj.comboBox36:setItems({'PRECM-50', 'PRECM', 'Destreza', 'Mente', 'Expert', '30%', '60%', '90%', 'Auto'});
    obj.comboBox36:setValues({'1', '2', '3', '4', '5', '6','7','8','9'});
    obj.comboBox36:setName("comboBox36");

    obj.comboBox37 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.layout85);
    obj.comboBox37:setTop(25);
    obj.comboBox37:setLeft(405);
    obj.comboBox37:setWidth(65);
    obj.comboBox37:setHeight(20);
    obj.comboBox37:setField("reduceStatus1");
    obj.comboBox37:setHorzTextAlign("center");
    obj.comboBox37:setItems({'EVA', 'EVAM', '-'});
    obj.comboBox37:setValues({'1', '2', '3'});
    obj.comboBox37:setName("comboBox37");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout85);
    obj.dataLink37:setField("sourceStatus1");
    obj.dataLink37:setDefaultValue("1");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout85);
    obj.dataLink38:setField("reduceStatus1");
    obj.dataLink38:setDefaultValue("2");
    obj.dataLink38:setName("dataLink38");

    obj.checkBox459 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox459:setParent(obj.layout85);
    obj.checkBox459:setTop(50);
    obj.checkBox459:setLeft(0);
    obj.checkBox459:setWidth(20);
    obj.checkBox459:setHeight(20);
    obj.checkBox459:setField("activeStatus2");
    obj.checkBox459:setName("checkBox459");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout85);
    obj.edit259:setTop(50);
    obj.edit259:setLeft(25);
    obj.edit259:setWidth(250);
    obj.edit259:setHeight(20);
    obj.edit259:setField("nameStatus2");
    obj.edit259:setName("edit259");

    obj.comboBox38 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox38:setParent(obj.layout85);
    obj.comboBox38:setTop(50);
    obj.comboBox38:setLeft(280);
    obj.comboBox38:setWidth(120);
    obj.comboBox38:setHeight(20);
    obj.comboBox38:setField("sourceStatus2");
    obj.comboBox38:setHorzTextAlign("center");
    obj.comboBox38:setItems({'PRECM-50', 'PRECM', 'Destreza', 'Mente', 'Expert', '30%', '60%', '90%', 'Auto'});
    obj.comboBox38:setValues({'1', '2', '3', '4', '5', '6','7','8','9'});
    obj.comboBox38:setName("comboBox38");

    obj.comboBox39 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox39:setParent(obj.layout85);
    obj.comboBox39:setTop(50);
    obj.comboBox39:setLeft(405);
    obj.comboBox39:setWidth(65);
    obj.comboBox39:setHeight(20);
    obj.comboBox39:setField("reduceStatus2");
    obj.comboBox39:setHorzTextAlign("center");
    obj.comboBox39:setItems({'EVA', 'EVAM', '-'});
    obj.comboBox39:setValues({'1', '2', '3'});
    obj.comboBox39:setName("comboBox39");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout85);
    obj.dataLink39:setField("sourceStatus2");
    obj.dataLink39:setDefaultValue("1");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout85);
    obj.dataLink40:setField("reduceStatus2");
    obj.dataLink40:setDefaultValue("2");
    obj.dataLink40:setName("dataLink40");

    obj.checkBox460 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox460:setParent(obj.layout85);
    obj.checkBox460:setTop(75);
    obj.checkBox460:setLeft(0);
    obj.checkBox460:setWidth(20);
    obj.checkBox460:setHeight(20);
    obj.checkBox460:setField("activeStatus3");
    obj.checkBox460:setName("checkBox460");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout85);
    obj.edit260:setTop(75);
    obj.edit260:setLeft(25);
    obj.edit260:setWidth(250);
    obj.edit260:setHeight(20);
    obj.edit260:setField("nameStatus3");
    obj.edit260:setName("edit260");

    obj.comboBox40 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox40:setParent(obj.layout85);
    obj.comboBox40:setTop(75);
    obj.comboBox40:setLeft(280);
    obj.comboBox40:setWidth(120);
    obj.comboBox40:setHeight(20);
    obj.comboBox40:setField("sourceStatus3");
    obj.comboBox40:setHorzTextAlign("center");
    obj.comboBox40:setItems({'PRECM-50', 'PRECM', 'Destreza', 'Mente', 'Expert', '30%', '60%', '90%', 'Auto'});
    obj.comboBox40:setValues({'1', '2', '3', '4', '5', '6','7','8','9'});
    obj.comboBox40:setName("comboBox40");

    obj.comboBox41 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox41:setParent(obj.layout85);
    obj.comboBox41:setTop(75);
    obj.comboBox41:setLeft(405);
    obj.comboBox41:setWidth(65);
    obj.comboBox41:setHeight(20);
    obj.comboBox41:setField("reduceStatus3");
    obj.comboBox41:setHorzTextAlign("center");
    obj.comboBox41:setItems({'EVA', 'EVAM', '-'});
    obj.comboBox41:setValues({'1', '2', '3'});
    obj.comboBox41:setName("comboBox41");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout85);
    obj.dataLink41:setField("sourceStatus3");
    obj.dataLink41:setDefaultValue("1");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout85);
    obj.dataLink42:setField("reduceStatus3");
    obj.dataLink42:setDefaultValue("2");
    obj.dataLink42:setName("dataLink42");

    obj.checkBox461 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox461:setParent(obj.layout85);
    obj.checkBox461:setTop(100);
    obj.checkBox461:setLeft(0);
    obj.checkBox461:setWidth(20);
    obj.checkBox461:setHeight(20);
    obj.checkBox461:setField("activeStatus4");
    obj.checkBox461:setName("checkBox461");

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout85);
    obj.edit261:setTop(100);
    obj.edit261:setLeft(25);
    obj.edit261:setWidth(250);
    obj.edit261:setHeight(20);
    obj.edit261:setField("nameStatus4");
    obj.edit261:setName("edit261");

    obj.comboBox42 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox42:setParent(obj.layout85);
    obj.comboBox42:setTop(100);
    obj.comboBox42:setLeft(280);
    obj.comboBox42:setWidth(120);
    obj.comboBox42:setHeight(20);
    obj.comboBox42:setField("sourceStatus4");
    obj.comboBox42:setHorzTextAlign("center");
    obj.comboBox42:setItems({'PRECM-50', 'PRECM', 'Destreza', 'Mente', 'Expert', '30%', '60%', '90%', 'Auto'});
    obj.comboBox42:setValues({'1', '2', '3', '4', '5', '6','7','8','9'});
    obj.comboBox42:setName("comboBox42");

    obj.comboBox43 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox43:setParent(obj.layout85);
    obj.comboBox43:setTop(100);
    obj.comboBox43:setLeft(405);
    obj.comboBox43:setWidth(65);
    obj.comboBox43:setHeight(20);
    obj.comboBox43:setField("reduceStatus4");
    obj.comboBox43:setHorzTextAlign("center");
    obj.comboBox43:setItems({'EVA', 'EVAM', '-'});
    obj.comboBox43:setValues({'1', '2', '3'});
    obj.comboBox43:setName("comboBox43");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout85);
    obj.dataLink43:setField("sourceStatus4");
    obj.dataLink43:setDefaultValue("1");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout85);
    obj.dataLink44:setField("reduceStatus4");
    obj.dataLink44:setDefaultValue("2");
    obj.dataLink44:setName("dataLink44");

    obj.checkBox462 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox462:setParent(obj.layout85);
    obj.checkBox462:setTop(125);
    obj.checkBox462:setLeft(0);
    obj.checkBox462:setWidth(20);
    obj.checkBox462:setHeight(20);
    obj.checkBox462:setField("activeStatus5");
    obj.checkBox462:setName("checkBox462");

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout85);
    obj.edit262:setTop(125);
    obj.edit262:setLeft(25);
    obj.edit262:setWidth(250);
    obj.edit262:setHeight(20);
    obj.edit262:setField("nameStatus5");
    obj.edit262:setName("edit262");

    obj.comboBox44 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox44:setParent(obj.layout85);
    obj.comboBox44:setTop(125);
    obj.comboBox44:setLeft(280);
    obj.comboBox44:setWidth(120);
    obj.comboBox44:setHeight(20);
    obj.comboBox44:setField("sourceStatus5");
    obj.comboBox44:setHorzTextAlign("center");
    obj.comboBox44:setItems({'PRECM-50', 'PRECM', 'Destreza', 'Mente', 'Expert', '30%', '60%', '90%', 'Auto'});
    obj.comboBox44:setValues({'1', '2', '3', '4', '5', '6','7','8','9'});
    obj.comboBox44:setName("comboBox44");

    obj.comboBox45 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox45:setParent(obj.layout85);
    obj.comboBox45:setTop(125);
    obj.comboBox45:setLeft(405);
    obj.comboBox45:setWidth(65);
    obj.comboBox45:setHeight(20);
    obj.comboBox45:setField("reduceStatus5");
    obj.comboBox45:setHorzTextAlign("center");
    obj.comboBox45:setItems({'EVA', 'EVAM', '-'});
    obj.comboBox45:setValues({'1', '2', '3'});
    obj.comboBox45:setName("comboBox45");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout85);
    obj.dataLink45:setField("sourceStatus5");
    obj.dataLink45:setDefaultValue("1");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout85);
    obj.dataLink46:setField("reduceStatus5");
    obj.dataLink46:setDefaultValue("2");
    obj.dataLink46:setName("dataLink46");

    obj.checkBox463 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox463:setParent(obj.layout85);
    obj.checkBox463:setTop(150);
    obj.checkBox463:setLeft(0);
    obj.checkBox463:setWidth(20);
    obj.checkBox463:setHeight(20);
    obj.checkBox463:setField("activeStatus6");
    obj.checkBox463:setName("checkBox463");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout85);
    obj.edit263:setTop(150);
    obj.edit263:setLeft(25);
    obj.edit263:setWidth(250);
    obj.edit263:setHeight(20);
    obj.edit263:setField("nameStatus6");
    obj.edit263:setName("edit263");

    obj.comboBox46 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox46:setParent(obj.layout85);
    obj.comboBox46:setTop(150);
    obj.comboBox46:setLeft(280);
    obj.comboBox46:setWidth(120);
    obj.comboBox46:setHeight(20);
    obj.comboBox46:setField("sourceStatus6");
    obj.comboBox46:setHorzTextAlign("center");
    obj.comboBox46:setItems({'PRECM-50', 'PRECM', 'Destreza', 'Mente', 'Expert', '30%', '60%', '90%', 'Auto'});
    obj.comboBox46:setValues({'1', '2', '3', '4', '5', '6','7','8','9'});
    obj.comboBox46:setName("comboBox46");

    obj.comboBox47 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox47:setParent(obj.layout85);
    obj.comboBox47:setTop(150);
    obj.comboBox47:setLeft(405);
    obj.comboBox47:setWidth(65);
    obj.comboBox47:setHeight(20);
    obj.comboBox47:setField("reduceStatus6");
    obj.comboBox47:setHorzTextAlign("center");
    obj.comboBox47:setItems({'EVA', 'EVAM', '-'});
    obj.comboBox47:setValues({'1', '2', '3'});
    obj.comboBox47:setName("comboBox47");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout85);
    obj.dataLink47:setField("sourceStatus6");
    obj.dataLink47:setDefaultValue("1");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout85);
    obj.dataLink48:setField("reduceStatus6");
    obj.dataLink48:setDefaultValue("2");
    obj.dataLink48:setName("dataLink48");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.tab12);
    obj.layout86:setLeft(10);
    obj.layout86:setTop(215);
    obj.layout86:setWidth(400);
    obj.layout86:setHeight(300);
    obj.layout86:setName("layout86");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout86);
    obj.radioButton1:setTop(00);
    obj.radioButton1:setLeft(20);
    obj.radioButton1:setWidth(20);
    obj.radioButton1:setHeight(20);
    obj.radioButton1:setGroupName("AtkTypeG");
    obj.radioButton1:setField("AtkTypeF");
    obj.radioButton1:setFieldValue("1");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout86);
    obj.radioButton2:setTop(25);
    obj.radioButton2:setLeft(20);
    obj.radioButton2:setWidth(20);
    obj.radioButton2:setHeight(20);
    obj.radioButton2:setGroupName("AtkTypeG");
    obj.radioButton2:setField("AtkTypeF");
    obj.radioButton2:setFieldValue("2");
    obj.radioButton2:setName("radioButton2");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout86);
    obj.dataLink49:setField("AtkTypeF");
    obj.dataLink49:setDefaultValue("1");
    obj.dataLink49:setName("dataLink49");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout86);
    obj.label213:setLeft(25);
    obj.label213:setTop(00);
    obj.label213:setWidth(120);
    obj.label213:setHeight(20);
    obj.label213:setText("Sem Dano");
    obj.label213:setHorzTextAlign("center");
    obj.label213:setAutoSize(true);
    lfm_setPropAsString(obj.label213, "fontStyle",  "bold");
    obj.label213:setName("label213");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout86);
    obj.label214:setLeft(50);
    obj.label214:setTop(25);
    obj.label214:setWidth(40);
    obj.label214:setHeight(20);
    obj.label214:setText("Dado");
    obj.label214:setHorzTextAlign("center");
    obj.label214:setAutoSize(true);
    lfm_setPropAsString(obj.label214, "fontStyle",  "bold");
    obj.label214:setName("label214");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout86);
    obj.label215:setLeft(100);
    obj.label215:setTop(25);
    obj.label215:setWidth(40);
    obj.label215:setHeight(20);
    obj.label215:setText("Mult.");
    obj.label215:setHorzTextAlign("center");
    obj.label215:setAutoSize(true);
    lfm_setPropAsString(obj.label215, "fontStyle",  "bold");
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout86);
    obj.label216:setLeft(150);
    obj.label216:setTop(25);
    obj.label216:setWidth(40);
    obj.label216:setHeight(20);
    obj.label216:setText("Atrib.");
    obj.label216:setHorzTextAlign("center");
    obj.label216:setAutoSize(true);
    lfm_setPropAsString(obj.label216, "fontStyle",  "bold");
    obj.label216:setName("label216");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout86);
    obj.label217:setLeft(92);
    obj.label217:setTop(50);
    obj.label217:setWidth(5);
    obj.label217:setHeight(20);
    obj.label217:setText("+");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setAutoSize(true);
    lfm_setPropAsString(obj.label217, "fontStyle",  "bold");
    obj.label217:setName("label217");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout86);
    obj.label218:setLeft(142);
    obj.label218:setTop(50);
    obj.label218:setWidth(5);
    obj.label218:setHeight(20);
    obj.label218:setText("x");
    obj.label218:setHorzTextAlign("center");
    obj.label218:setAutoSize(true);
    lfm_setPropAsString(obj.label218, "fontStyle",  "bold");
    obj.label218:setName("label218");

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout86);
    obj.edit264:setTop(50);
    obj.edit264:setLeft(50);
    obj.edit264:setWidth(40);
    obj.edit264:setHeight(20);
    obj.edit264:setField("dadoGolpe");
    obj.edit264:setName("edit264");

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout86);
    obj.edit265:setTop(50);
    obj.edit265:setLeft(100);
    obj.edit265:setWidth(40);
    obj.edit265:setHeight(20);
    obj.edit265:setField("multGolpe");
    obj.edit265:setName("edit265");

    obj.comboBox48 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox48:setParent(obj.layout86);
    obj.comboBox48:setTop(50);
    obj.comboBox48:setLeft(150);
    obj.comboBox48:setWidth(60);
    obj.comboBox48:setHeight(20);
    obj.comboBox48:setField("atribGolpe");
    obj.comboBox48:setHorzTextAlign("center");
    obj.comboBox48:setItems({'FOR', 'AGI', 'MAG'});
    obj.comboBox48:setValues({'1', '2', '3'});
    obj.comboBox48:setName("comboBox48");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout86);
    obj.dataLink50:setField("atribGolpe");
    obj.dataLink50:setDefaultValue("3");
    obj.dataLink50:setName("dataLink50");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout86);
    obj.label219:setLeft(230);
    obj.label219:setTop(50);
    obj.label219:setWidth(105);
    obj.label219:setHeight(20);
    obj.label219:setText("Margem Crít.%:");
    obj.label219:setAutoSize(true);
    lfm_setPropAsString(obj.label219, "fontStyle",  "bold");
    obj.label219:setName("label219");

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout86);
    obj.edit266:setLeft(330);
    obj.edit266:setTop(50);
    obj.edit266:setWidth(30);
    obj.edit266:setHeight(20);
    obj.edit266:setField("campoMargem");
    obj.edit266:setType("number");
    obj.edit266:setHorzTextAlign("center");
    obj.edit266:setName("edit266");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.tab12);
    obj.layout87:setLeft(25);
    obj.layout87:setTop(300);
    obj.layout87:setWidth(300);
    obj.layout87:setHeight(300);
    obj.layout87:setName("layout87");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout87);
    obj.label220:setTop(00);
    obj.label220:setLeft(60);
    obj.label220:setWidth(140);
    obj.label220:setHeight(20);
    obj.label220:setText("Fator Multiplicativo");
    obj.label220:setHorzTextAlign("leading");
    obj.label220:setAutoSize(true);
    lfm_setPropAsString(obj.label220, "fontStyle",  "bold");
    obj.label220:setName("label220");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout87);
    obj.radioButton3:setTop(25);
    obj.radioButton3:setLeft(0);
    obj.radioButton3:setWidth(20);
    obj.radioButton3:setHeight(20);
    obj.radioButton3:setGroupName("AtkPercent");
    obj.radioButton3:setField("PAtkField");
    obj.radioButton3:setFieldValue("0.25");
    obj.radioButton3:setName("radioButton3");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout87);
    obj.label221:setTop(25);
    obj.label221:setLeft(25);
    obj.label221:setWidth(40);
    obj.label221:setHeight(20);
    obj.label221:setText("25%");
    obj.label221:setHorzTextAlign("leading");
    obj.label221:setAutoSize(true);
    lfm_setPropAsString(obj.label221, "fontStyle",  "bold");
    obj.label221:setName("label221");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout87);
    obj.dataLink51:setField("PAtkField");
    obj.dataLink51:setDefaultValue("1");
    obj.dataLink51:setName("dataLink51");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout87);
    obj.radioButton4:setTop(50);
    obj.radioButton4:setLeft(0);
    obj.radioButton4:setWidth(20);
    obj.radioButton4:setHeight(20);
    obj.radioButton4:setGroupName("AtkPercent");
    obj.radioButton4:setField("PAtkField");
    obj.radioButton4:setFieldValue("0.50");
    obj.radioButton4:setName("radioButton4");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout87);
    obj.label222:setTop(50);
    obj.label222:setLeft(25);
    obj.label222:setWidth(40);
    obj.label222:setHeight(20);
    obj.label222:setText("50%");
    obj.label222:setHorzTextAlign("leading");
    obj.label222:setAutoSize(true);
    lfm_setPropAsString(obj.label222, "fontStyle",  "bold");
    obj.label222:setName("label222");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout87);
    obj.dataLink52:setField("PAtkField");
    obj.dataLink52:setDefaultValue("1");
    obj.dataLink52:setName("dataLink52");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout87);
    obj.radioButton5:setTop(75);
    obj.radioButton5:setLeft(0);
    obj.radioButton5:setWidth(20);
    obj.radioButton5:setHeight(20);
    obj.radioButton5:setGroupName("AtkPercent");
    obj.radioButton5:setField("PAtkField");
    obj.radioButton5:setFieldValue("0.75");
    obj.radioButton5:setName("radioButton5");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout87);
    obj.label223:setTop(75);
    obj.label223:setLeft(25);
    obj.label223:setWidth(40);
    obj.label223:setHeight(20);
    obj.label223:setText("75%");
    obj.label223:setHorzTextAlign("leading");
    obj.label223:setAutoSize(true);
    lfm_setPropAsString(obj.label223, "fontStyle",  "bold");
    obj.label223:setName("label223");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout87);
    obj.dataLink53:setField("PAtkField");
    obj.dataLink53:setDefaultValue("1");
    obj.dataLink53:setName("dataLink53");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout87);
    obj.radioButton6:setTop(100);
    obj.radioButton6:setLeft(0);
    obj.radioButton6:setWidth(20);
    obj.radioButton6:setHeight(20);
    obj.radioButton6:setGroupName("AtkPercent");
    obj.radioButton6:setField("PAtkField");
    obj.radioButton6:setFieldValue("1");
    obj.radioButton6:setName("radioButton6");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout87);
    obj.label224:setTop(100);
    obj.label224:setLeft(25);
    obj.label224:setWidth(40);
    obj.label224:setHeight(20);
    obj.label224:setText("100%");
    obj.label224:setHorzTextAlign("leading");
    obj.label224:setAutoSize(true);
    lfm_setPropAsString(obj.label224, "fontStyle",  "bold");
    obj.label224:setName("label224");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout87);
    obj.dataLink54:setField("PAtkField");
    obj.dataLink54:setDefaultValue("1");
    obj.dataLink54:setName("dataLink54");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout87);
    obj.radioButton7:setTop(125);
    obj.radioButton7:setLeft(0);
    obj.radioButton7:setWidth(20);
    obj.radioButton7:setHeight(20);
    obj.radioButton7:setGroupName("AtkPercent");
    obj.radioButton7:setField("PAtkField");
    obj.radioButton7:setFieldValue("1.25");
    obj.radioButton7:setName("radioButton7");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout87);
    obj.label225:setTop(125);
    obj.label225:setLeft(25);
    obj.label225:setWidth(40);
    obj.label225:setHeight(20);
    obj.label225:setText("125%");
    obj.label225:setHorzTextAlign("leading");
    obj.label225:setAutoSize(true);
    lfm_setPropAsString(obj.label225, "fontStyle",  "bold");
    obj.label225:setName("label225");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout87);
    obj.dataLink55:setField("PAtkField");
    obj.dataLink55:setDefaultValue("1");
    obj.dataLink55:setName("dataLink55");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout87);
    obj.radioButton8:setTop(150);
    obj.radioButton8:setLeft(0);
    obj.radioButton8:setWidth(20);
    obj.radioButton8:setHeight(20);
    obj.radioButton8:setGroupName("AtkPercent");
    obj.radioButton8:setField("PAtkField");
    obj.radioButton8:setFieldValue("1.50");
    obj.radioButton8:setName("radioButton8");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout87);
    obj.label226:setTop(150);
    obj.label226:setLeft(25);
    obj.label226:setWidth(40);
    obj.label226:setHeight(20);
    obj.label226:setText("150%");
    obj.label226:setHorzTextAlign("leading");
    obj.label226:setAutoSize(true);
    lfm_setPropAsString(obj.label226, "fontStyle",  "bold");
    obj.label226:setName("label226");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout87);
    obj.dataLink56:setField("PAtkField");
    obj.dataLink56:setDefaultValue("1");
    obj.dataLink56:setName("dataLink56");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.tab12);
    obj.layout88:setLeft(100);
    obj.layout88:setTop(300);
    obj.layout88:setWidth(100);
    obj.layout88:setHeight(300);
    obj.layout88:setName("layout88");

    obj.radioButton9 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout88);
    obj.radioButton9:setTop(025);
    obj.radioButton9:setLeft(0);
    obj.radioButton9:setWidth(20);
    obj.radioButton9:setHeight(20);
    obj.radioButton9:setGroupName("AtkPercent");
    obj.radioButton9:setField("PAtkField");
    obj.radioButton9:setFieldValue("1.75");
    obj.radioButton9:setName("radioButton9");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout88);
    obj.label227:setTop(025);
    obj.label227:setLeft(25);
    obj.label227:setWidth(40);
    obj.label227:setHeight(20);
    obj.label227:setText("175%");
    obj.label227:setHorzTextAlign("leading");
    obj.label227:setAutoSize(true);
    lfm_setPropAsString(obj.label227, "fontStyle",  "bold");
    obj.label227:setName("label227");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout88);
    obj.dataLink57:setField("PAtkField");
    obj.dataLink57:setDefaultValue("1");
    obj.dataLink57:setName("dataLink57");

    obj.radioButton10 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout88);
    obj.radioButton10:setTop(050);
    obj.radioButton10:setLeft(0);
    obj.radioButton10:setWidth(20);
    obj.radioButton10:setHeight(20);
    obj.radioButton10:setGroupName("AtkPercent");
    obj.radioButton10:setField("PAtkField");
    obj.radioButton10:setFieldValue("2.00");
    obj.radioButton10:setName("radioButton10");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout88);
    obj.label228:setTop(050);
    obj.label228:setLeft(25);
    obj.label228:setWidth(40);
    obj.label228:setHeight(20);
    obj.label228:setText("200%");
    obj.label228:setHorzTextAlign("leading");
    obj.label228:setAutoSize(true);
    lfm_setPropAsString(obj.label228, "fontStyle",  "bold");
    obj.label228:setName("label228");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout88);
    obj.dataLink58:setField("PAtkField");
    obj.dataLink58:setDefaultValue("1");
    obj.dataLink58:setName("dataLink58");

    obj.radioButton11 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.layout88);
    obj.radioButton11:setTop(075);
    obj.radioButton11:setLeft(0);
    obj.radioButton11:setWidth(20);
    obj.radioButton11:setHeight(20);
    obj.radioButton11:setGroupName("AtkPercent");
    obj.radioButton11:setField("PAtkField");
    obj.radioButton11:setFieldValue("2.25");
    obj.radioButton11:setName("radioButton11");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout88);
    obj.label229:setTop(075);
    obj.label229:setLeft(25);
    obj.label229:setWidth(40);
    obj.label229:setHeight(20);
    obj.label229:setText("225%");
    obj.label229:setHorzTextAlign("leading");
    obj.label229:setAutoSize(true);
    lfm_setPropAsString(obj.label229, "fontStyle",  "bold");
    obj.label229:setName("label229");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout88);
    obj.dataLink59:setField("PAtkField");
    obj.dataLink59:setDefaultValue("1");
    obj.dataLink59:setName("dataLink59");

    obj.radioButton12 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.layout88);
    obj.radioButton12:setTop(100);
    obj.radioButton12:setLeft(0);
    obj.radioButton12:setWidth(20);
    obj.radioButton12:setHeight(20);
    obj.radioButton12:setGroupName("AtkPercent");
    obj.radioButton12:setField("PAtkField");
    obj.radioButton12:setFieldValue("2.50");
    obj.radioButton12:setName("radioButton12");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout88);
    obj.label230:setTop(100);
    obj.label230:setLeft(25);
    obj.label230:setWidth(40);
    obj.label230:setHeight(20);
    obj.label230:setText("250%");
    obj.label230:setHorzTextAlign("leading");
    obj.label230:setAutoSize(true);
    lfm_setPropAsString(obj.label230, "fontStyle",  "bold");
    obj.label230:setName("label230");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout88);
    obj.dataLink60:setField("PAtkField");
    obj.dataLink60:setDefaultValue("1");
    obj.dataLink60:setName("dataLink60");

    obj.radioButton13 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.layout88);
    obj.radioButton13:setTop(125);
    obj.radioButton13:setLeft(0);
    obj.radioButton13:setWidth(20);
    obj.radioButton13:setHeight(20);
    obj.radioButton13:setGroupName("AtkPercent");
    obj.radioButton13:setField("PAtkField");
    obj.radioButton13:setFieldValue("2.75");
    obj.radioButton13:setName("radioButton13");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout88);
    obj.label231:setTop(125);
    obj.label231:setLeft(25);
    obj.label231:setWidth(40);
    obj.label231:setHeight(20);
    obj.label231:setText("275%");
    obj.label231:setHorzTextAlign("leading");
    obj.label231:setAutoSize(true);
    lfm_setPropAsString(obj.label231, "fontStyle",  "bold");
    obj.label231:setName("label231");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout88);
    obj.dataLink61:setField("PAtkField");
    obj.dataLink61:setDefaultValue("1");
    obj.dataLink61:setName("dataLink61");

    obj.radioButton14 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.layout88);
    obj.radioButton14:setTop(150);
    obj.radioButton14:setLeft(0);
    obj.radioButton14:setWidth(20);
    obj.radioButton14:setHeight(20);
    obj.radioButton14:setGroupName("AtkPercent");
    obj.radioButton14:setField("PAtkField");
    obj.radioButton14:setFieldValue("3.00");
    obj.radioButton14:setName("radioButton14");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout88);
    obj.label232:setTop(150);
    obj.label232:setLeft(25);
    obj.label232:setWidth(40);
    obj.label232:setHeight(20);
    obj.label232:setText("300%");
    obj.label232:setHorzTextAlign("leading");
    obj.label232:setAutoSize(true);
    lfm_setPropAsString(obj.label232, "fontStyle",  "bold");
    obj.label232:setName("label232");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout88);
    obj.dataLink62:setField("PAtkField");
    obj.dataLink62:setDefaultValue("1");
    obj.dataLink62:setName("dataLink62");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.tab12);
    obj.layout89:setLeft(175);
    obj.layout89:setTop(300);
    obj.layout89:setWidth(100);
    obj.layout89:setHeight(300);
    obj.layout89:setName("layout89");

    obj.radioButton15 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton15:setParent(obj.layout89);
    obj.radioButton15:setTop(025);
    obj.radioButton15:setLeft(0);
    obj.radioButton15:setWidth(20);
    obj.radioButton15:setHeight(20);
    obj.radioButton15:setGroupName("AtkPercent");
    obj.radioButton15:setField("PAtkField");
    obj.radioButton15:setFieldValue("3.25");
    obj.radioButton15:setName("radioButton15");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout89);
    obj.label233:setTop(025);
    obj.label233:setLeft(25);
    obj.label233:setWidth(40);
    obj.label233:setHeight(20);
    obj.label233:setText("325%");
    obj.label233:setHorzTextAlign("leading");
    obj.label233:setAutoSize(true);
    lfm_setPropAsString(obj.label233, "fontStyle",  "bold");
    obj.label233:setName("label233");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout89);
    obj.dataLink63:setField("PAtkField");
    obj.dataLink63:setDefaultValue("1");
    obj.dataLink63:setName("dataLink63");

    obj.radioButton16 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton16:setParent(obj.layout89);
    obj.radioButton16:setTop(050);
    obj.radioButton16:setLeft(0);
    obj.radioButton16:setWidth(20);
    obj.radioButton16:setHeight(20);
    obj.radioButton16:setGroupName("AtkPercent");
    obj.radioButton16:setField("PAtkField");
    obj.radioButton16:setFieldValue("3.50");
    obj.radioButton16:setName("radioButton16");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout89);
    obj.label234:setTop(050);
    obj.label234:setLeft(25);
    obj.label234:setWidth(40);
    obj.label234:setHeight(20);
    obj.label234:setText("350%");
    obj.label234:setHorzTextAlign("leading");
    obj.label234:setAutoSize(true);
    lfm_setPropAsString(obj.label234, "fontStyle",  "bold");
    obj.label234:setName("label234");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout89);
    obj.dataLink64:setField("PAtkField");
    obj.dataLink64:setDefaultValue("1");
    obj.dataLink64:setName("dataLink64");

    obj.radioButton17 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton17:setParent(obj.layout89);
    obj.radioButton17:setTop(075);
    obj.radioButton17:setLeft(0);
    obj.radioButton17:setWidth(20);
    obj.radioButton17:setHeight(20);
    obj.radioButton17:setGroupName("AtkPercent");
    obj.radioButton17:setField("PAtkField");
    obj.radioButton17:setFieldValue("3.75");
    obj.radioButton17:setName("radioButton17");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout89);
    obj.label235:setTop(075);
    obj.label235:setLeft(25);
    obj.label235:setWidth(40);
    obj.label235:setHeight(20);
    obj.label235:setText("375%");
    obj.label235:setHorzTextAlign("leading");
    obj.label235:setAutoSize(true);
    lfm_setPropAsString(obj.label235, "fontStyle",  "bold");
    obj.label235:setName("label235");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout89);
    obj.dataLink65:setField("PAtkField");
    obj.dataLink65:setDefaultValue("1");
    obj.dataLink65:setName("dataLink65");

    obj.radioButton18 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton18:setParent(obj.layout89);
    obj.radioButton18:setTop(100);
    obj.radioButton18:setLeft(0);
    obj.radioButton18:setWidth(20);
    obj.radioButton18:setHeight(20);
    obj.radioButton18:setGroupName("AtkPercent");
    obj.radioButton18:setField("PAtkField");
    obj.radioButton18:setFieldValue("4.00");
    obj.radioButton18:setName("radioButton18");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout89);
    obj.label236:setTop(100);
    obj.label236:setLeft(25);
    obj.label236:setWidth(40);
    obj.label236:setHeight(20);
    obj.label236:setText("400%");
    obj.label236:setHorzTextAlign("leading");
    obj.label236:setAutoSize(true);
    lfm_setPropAsString(obj.label236, "fontStyle",  "bold");
    obj.label236:setName("label236");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout89);
    obj.dataLink66:setField("PAtkField");
    obj.dataLink66:setDefaultValue("1");
    obj.dataLink66:setName("dataLink66");

    obj.radioButton19 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton19:setParent(obj.layout89);
    obj.radioButton19:setTop(125);
    obj.radioButton19:setLeft(0);
    obj.radioButton19:setWidth(20);
    obj.radioButton19:setHeight(20);
    obj.radioButton19:setGroupName("AtkPercent");
    obj.radioButton19:setField("PAtkField");
    obj.radioButton19:setFieldValue("4.25");
    obj.radioButton19:setName("radioButton19");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout89);
    obj.label237:setTop(125);
    obj.label237:setLeft(25);
    obj.label237:setWidth(40);
    obj.label237:setHeight(20);
    obj.label237:setText("425%");
    obj.label237:setHorzTextAlign("leading");
    obj.label237:setAutoSize(true);
    lfm_setPropAsString(obj.label237, "fontStyle",  "bold");
    obj.label237:setName("label237");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout89);
    obj.dataLink67:setField("PAtkField");
    obj.dataLink67:setDefaultValue("1");
    obj.dataLink67:setName("dataLink67");

    obj.radioButton20 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton20:setParent(obj.layout89);
    obj.radioButton20:setTop(150);
    obj.radioButton20:setLeft(0);
    obj.radioButton20:setWidth(20);
    obj.radioButton20:setHeight(20);
    obj.radioButton20:setGroupName("AtkPercent");
    obj.radioButton20:setField("PAtkField");
    obj.radioButton20:setFieldValue("4.50");
    obj.radioButton20:setName("radioButton20");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout89);
    obj.label238:setTop(150);
    obj.label238:setLeft(25);
    obj.label238:setWidth(40);
    obj.label238:setHeight(20);
    obj.label238:setText("450%");
    obj.label238:setHorzTextAlign("leading");
    obj.label238:setAutoSize(true);
    lfm_setPropAsString(obj.label238, "fontStyle",  "bold");
    obj.label238:setName("label238");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout89);
    obj.dataLink68:setField("PAtkField");
    obj.dataLink68:setDefaultValue("1");
    obj.dataLink68:setName("dataLink68");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.tab12);
    obj.layout90:setLeft(250);
    obj.layout90:setTop(300);
    obj.layout90:setWidth(500);
    obj.layout90:setHeight(300);
    obj.layout90:setName("layout90");

    obj.checkBox464 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox464:setParent(obj.layout90);
    obj.checkBox464:setTop(25);
    obj.checkBox464:setLeft(00);
    obj.checkBox464:setWidth(20);
    obj.checkBox464:setHeight(20);
    obj.checkBox464:setField("activeBDM");
    obj.checkBox464:setName("checkBox464");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout90);
    obj.label239:setLeft(25);
    obj.label239:setTop(25);
    obj.label239:setWidth(150);
    obj.label239:setHeight(20);
    obj.label239:setText("B. Dam. Limit");
    obj.label239:setHorzTextAlign("leading");
    obj.label239:setAutoSize(true);
    lfm_setPropAsString(obj.label239, "fontStyle",  "bold");
    obj.label239:setName("label239");

    obj.checkBox465 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox465:setParent(obj.layout90);
    obj.checkBox465:setTop(50);
    obj.checkBox465:setLeft(00);
    obj.checkBox465:setWidth(20);
    obj.checkBox465:setHeight(20);
    obj.checkBox465:setField("activeTripleCrit");
    obj.checkBox465:setName("checkBox465");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout90);
    obj.label240:setLeft(25);
    obj.label240:setTop(50);
    obj.label240:setWidth(150);
    obj.label240:setHeight(20);
    obj.label240:setText("Triple Critical");
    obj.label240:setHorzTextAlign("leading");
    obj.label240:setAutoSize(true);
    lfm_setPropAsString(obj.label240, "fontStyle",  "bold");
    obj.label240:setName("label240");

    obj.checkBox466 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox466:setParent(obj.layout90);
    obj.checkBox466:setTop(75);
    obj.checkBox466:setLeft(00);
    obj.checkBox466:setWidth(20);
    obj.checkBox466:setHeight(20);
    obj.checkBox466:setField("activeConsMP");
    obj.checkBox466:setName("checkBox466");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout90);
    obj.label241:setLeft(25);
    obj.label241:setTop(75);
    obj.label241:setWidth(150);
    obj.label241:setHeight(20);
    obj.label241:setText("Consumir MP");
    obj.label241:setHorzTextAlign("leading");
    obj.label241:setAutoSize(true);
    lfm_setPropAsString(obj.label241, "fontStyle",  "bold");
    obj.label241:setName("label241");

    obj.checkBox467 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox467:setParent(obj.layout90);
    obj.checkBox467:setTop(100);
    obj.checkBox467:setLeft(00);
    obj.checkBox467:setWidth(20);
    obj.checkBox467:setHeight(20);
    obj.checkBox467:setField("activeConsHP");
    obj.checkBox467:setName("checkBox467");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout90);
    obj.label242:setLeft(25);
    obj.label242:setTop(100);
    obj.label242:setWidth(150);
    obj.label242:setHeight(20);
    obj.label242:setText("Consumir HP");
    obj.label242:setHorzTextAlign("leading");
    obj.label242:setAutoSize(true);
    lfm_setPropAsString(obj.label242, "fontStyle",  "bold");
    obj.label242:setName("label242");

    obj.checkBox468 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox468:setParent(obj.layout90);
    obj.checkBox468:setTop(125);
    obj.checkBox468:setLeft(00);
    obj.checkBox468:setWidth(20);
    obj.checkBox468:setHeight(20);
    obj.checkBox468:setField("activeSamCur");
    obj.checkBox468:setName("checkBox468");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout90);
    obj.label243:setLeft(25);
    obj.label243:setTop(125);
    obj.label243:setWidth(150);
    obj.label243:setHeight(20);
    obj.label243:setText("Exaurir");
    obj.label243:setHorzTextAlign("leading");
    obj.label243:setAutoSize(true);
    lfm_setPropAsString(obj.label243, "fontStyle",  "bold");
    obj.label243:setName("label243");

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout90);
    obj.edit267:setLeft(80);
    obj.edit267:setTop(125);
    obj.edit267:setWidth(30);
    obj.edit267:setHeight(20);
    obj.edit267:setField("campoCurse");
    obj.edit267:setType("number");
    obj.edit267:setHorzTextAlign("center");
    obj.edit267:setName("edit267");

    obj.checkBox469 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox469:setParent(obj.layout90);
    obj.checkBox469:setTop(150);
    obj.checkBox469:setLeft(00);
    obj.checkBox469:setWidth(20);
    obj.checkBox469:setHeight(20);
    obj.checkBox469:setField("checkAmmo");
    obj.checkBox469:setName("checkBox469");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout90);
    obj.label244:setLeft(25);
    obj.label244:setTop(150);
    obj.label244:setWidth(150);
    obj.label244:setHeight(20);
    obj.label244:setText("Munição Especial");
    obj.label244:setHorzTextAlign("leading");
    obj.label244:setAutoSize(true);
    lfm_setPropAsString(obj.label244, "fontStyle",  "bold");
    obj.label244:setName("label244");

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout90);
    obj.edit268:setLeft(25);
    obj.edit268:setTop(175);
    obj.edit268:setWidth(100);
    obj.edit268:setHeight(20);
    obj.edit268:setField("campoAmmo");
    obj.edit268:setHorzTextAlign("center");
    obj.edit268:setName("edit268");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.tab12);
    obj.button8:setLeft(230);
    obj.button8:setTop(10);
    obj.button8:setWidth(130);
    obj.button8:setHeight(45);
    obj.button8:setText("USAR");
    obj.button8:setFontSize(11);
    lfm_setPropAsString(obj.button8, "fontStyle",  "bold");
    obj.button8:setName("button8");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.scrollBox11);
    obj.layout91:setLeft(630);
    obj.layout91:setTop(250);
    obj.layout91:setWidth(225);
    obj.layout91:setHeight(300);
    obj.layout91:setName("layout91");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout91);
    obj.label245:setLeft(50);
    obj.label245:setTop(00);
    obj.label245:setWidth(150);
    obj.label245:setHeight(20);
    obj.label245:setText("Inimigos");
    obj.label245:setHorzTextAlign("center");
    obj.label245:setAutoSize(true);
    lfm_setPropAsString(obj.label245, "fontStyle",  "bold");
    obj.label245:setName("label245");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout91);
    obj.label246:setLeft(0);
    obj.label246:setTop(00);
    obj.label246:setWidth(20);
    obj.label246:setHeight(20);
    obj.label246:setText("S");
    obj.label246:setHorzTextAlign("center");
    obj.label246:setAutoSize(true);
    lfm_setPropAsString(obj.label246, "fontStyle",  "bold");
    obj.label246:setName("label246");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout91);
    obj.label247:setLeft(25);
    obj.label247:setTop(00);
    obj.label247:setWidth(20);
    obj.label247:setHeight(20);
    obj.label247:setText("G");
    obj.label247:setHorzTextAlign("center");
    obj.label247:setAutoSize(true);
    lfm_setPropAsString(obj.label247, "fontStyle",  "bold");
    obj.label247:setName("label247");

    obj.radioButton21 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton21:setParent(obj.layout91);
    obj.radioButton21:setTop(025);
    obj.radioButton21:setLeft(00);
    obj.radioButton21:setWidth(20);
    obj.radioButton21:setHeight(20);
    obj.radioButton21:setGroupName("singleGA");
    obj.radioButton21:setField("singleGB");
    obj.radioButton21:setFieldValue("1");
    obj.radioButton21:setName("radioButton21");

    obj.checkBox470 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox470:setParent(obj.layout91);
    obj.checkBox470:setTop(025);
    obj.checkBox470:setLeft(25);
    obj.checkBox470:setWidth(20);
    obj.checkBox470:setHeight(20);
    obj.checkBox470:setField("ValidTarget1");
    obj.checkBox470:setName("checkBox470");

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout91);
    obj.edit269:setTop(025);
    obj.edit269:setLeft(50);
    obj.edit269:setWidth(150);
    obj.edit269:setHeight(20);
    obj.edit269:setField("nameEnemy1");
    obj.edit269:setName("edit269");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout91);
    obj.dataLink69:setField("singleGB");
    obj.dataLink69:setDefaultValue("1");
    obj.dataLink69:setName("dataLink69");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout91);
    obj.dataLink70:setField("ValidTarget1");
    obj.dataLink70:setDefaultValue("true");
    obj.dataLink70:setName("dataLink70");

    obj.radioButton22 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton22:setParent(obj.layout91);
    obj.radioButton22:setTop(050);
    obj.radioButton22:setLeft(00);
    obj.radioButton22:setWidth(20);
    obj.radioButton22:setHeight(20);
    obj.radioButton22:setGroupName("singleGA");
    obj.radioButton22:setField("singleGB");
    obj.radioButton22:setFieldValue("2");
    obj.radioButton22:setName("radioButton22");

    obj.checkBox471 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox471:setParent(obj.layout91);
    obj.checkBox471:setTop(050);
    obj.checkBox471:setLeft(25);
    obj.checkBox471:setWidth(20);
    obj.checkBox471:setHeight(20);
    obj.checkBox471:setField("ValidTarget2");
    obj.checkBox471:setName("checkBox471");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout91);
    obj.edit270:setTop(050);
    obj.edit270:setLeft(50);
    obj.edit270:setWidth(150);
    obj.edit270:setHeight(20);
    obj.edit270:setField("nameEnemy2");
    obj.edit270:setName("edit270");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout91);
    obj.dataLink71:setField("singleGB");
    obj.dataLink71:setDefaultValue("1");
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout91);
    obj.dataLink72:setField("ValidTarget2");
    obj.dataLink72:setDefaultValue("true");
    obj.dataLink72:setName("dataLink72");

    obj.radioButton23 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton23:setParent(obj.layout91);
    obj.radioButton23:setTop(075);
    obj.radioButton23:setLeft(00);
    obj.radioButton23:setWidth(20);
    obj.radioButton23:setHeight(20);
    obj.radioButton23:setGroupName("singleGA");
    obj.radioButton23:setField("singleGB");
    obj.radioButton23:setFieldValue("3");
    obj.radioButton23:setName("radioButton23");

    obj.checkBox472 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox472:setParent(obj.layout91);
    obj.checkBox472:setTop(075);
    obj.checkBox472:setLeft(25);
    obj.checkBox472:setWidth(20);
    obj.checkBox472:setHeight(20);
    obj.checkBox472:setField("ValidTarget3");
    obj.checkBox472:setName("checkBox472");

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout91);
    obj.edit271:setTop(075);
    obj.edit271:setLeft(50);
    obj.edit271:setWidth(150);
    obj.edit271:setHeight(20);
    obj.edit271:setField("nameEnemy3");
    obj.edit271:setName("edit271");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout91);
    obj.dataLink73:setField("singleGB");
    obj.dataLink73:setDefaultValue("1");
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout91);
    obj.dataLink74:setField("ValidTarget3");
    obj.dataLink74:setDefaultValue("true");
    obj.dataLink74:setName("dataLink74");

    obj.radioButton24 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton24:setParent(obj.layout91);
    obj.radioButton24:setTop(100);
    obj.radioButton24:setLeft(00);
    obj.radioButton24:setWidth(20);
    obj.radioButton24:setHeight(20);
    obj.radioButton24:setGroupName("singleGA");
    obj.radioButton24:setField("singleGB");
    obj.radioButton24:setFieldValue("4");
    obj.radioButton24:setName("radioButton24");

    obj.checkBox473 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox473:setParent(obj.layout91);
    obj.checkBox473:setTop(100);
    obj.checkBox473:setLeft(25);
    obj.checkBox473:setWidth(20);
    obj.checkBox473:setHeight(20);
    obj.checkBox473:setField("ValidTarget4");
    obj.checkBox473:setName("checkBox473");

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout91);
    obj.edit272:setTop(100);
    obj.edit272:setLeft(50);
    obj.edit272:setWidth(150);
    obj.edit272:setHeight(20);
    obj.edit272:setField("nameEnemy4");
    obj.edit272:setName("edit272");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout91);
    obj.dataLink75:setField("singleGB");
    obj.dataLink75:setDefaultValue("1");
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout91);
    obj.dataLink76:setField("ValidTarget4");
    obj.dataLink76:setDefaultValue("true");
    obj.dataLink76:setName("dataLink76");

    obj.radioButton25 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton25:setParent(obj.layout91);
    obj.radioButton25:setTop(125);
    obj.radioButton25:setLeft(00);
    obj.radioButton25:setWidth(20);
    obj.radioButton25:setHeight(20);
    obj.radioButton25:setGroupName("singleGA");
    obj.radioButton25:setField("singleGB");
    obj.radioButton25:setFieldValue("5");
    obj.radioButton25:setName("radioButton25");

    obj.checkBox474 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox474:setParent(obj.layout91);
    obj.checkBox474:setTop(125);
    obj.checkBox474:setLeft(25);
    obj.checkBox474:setWidth(20);
    obj.checkBox474:setHeight(20);
    obj.checkBox474:setField("ValidTarget5");
    obj.checkBox474:setName("checkBox474");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout91);
    obj.edit273:setTop(125);
    obj.edit273:setLeft(50);
    obj.edit273:setWidth(150);
    obj.edit273:setHeight(20);
    obj.edit273:setField("nameEnemy5");
    obj.edit273:setName("edit273");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout91);
    obj.dataLink77:setField("singleGB");
    obj.dataLink77:setDefaultValue("1");
    obj.dataLink77:setName("dataLink77");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout91);
    obj.dataLink78:setField("ValidTarget5");
    obj.dataLink78:setDefaultValue("true");
    obj.dataLink78:setName("dataLink78");

    obj.radioButton26 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton26:setParent(obj.layout91);
    obj.radioButton26:setTop(150);
    obj.radioButton26:setLeft(00);
    obj.radioButton26:setWidth(20);
    obj.radioButton26:setHeight(20);
    obj.radioButton26:setGroupName("singleGA");
    obj.radioButton26:setField("singleGB");
    obj.radioButton26:setFieldValue("6");
    obj.radioButton26:setName("radioButton26");

    obj.checkBox475 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox475:setParent(obj.layout91);
    obj.checkBox475:setTop(150);
    obj.checkBox475:setLeft(25);
    obj.checkBox475:setWidth(20);
    obj.checkBox475:setHeight(20);
    obj.checkBox475:setField("ValidTarget6");
    obj.checkBox475:setName("checkBox475");

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout91);
    obj.edit274:setTop(150);
    obj.edit274:setLeft(50);
    obj.edit274:setWidth(150);
    obj.edit274:setHeight(20);
    obj.edit274:setField("nameEnemy6");
    obj.edit274:setName("edit274");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout91);
    obj.dataLink79:setField("singleGB");
    obj.dataLink79:setDefaultValue("1");
    obj.dataLink79:setName("dataLink79");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout91);
    obj.dataLink80:setField("ValidTarget6");
    obj.dataLink80:setDefaultValue("true");
    obj.dataLink80:setName("dataLink80");

    obj.radioButton27 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton27:setParent(obj.layout91);
    obj.radioButton27:setTop(175);
    obj.radioButton27:setLeft(00);
    obj.radioButton27:setWidth(20);
    obj.radioButton27:setHeight(20);
    obj.radioButton27:setGroupName("singleGA");
    obj.radioButton27:setField("singleGB");
    obj.radioButton27:setFieldValue("7");
    obj.radioButton27:setName("radioButton27");

    obj.checkBox476 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox476:setParent(obj.layout91);
    obj.checkBox476:setTop(175);
    obj.checkBox476:setLeft(25);
    obj.checkBox476:setWidth(20);
    obj.checkBox476:setHeight(20);
    obj.checkBox476:setField("ValidTarget7");
    obj.checkBox476:setName("checkBox476");

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout91);
    obj.edit275:setTop(175);
    obj.edit275:setLeft(50);
    obj.edit275:setWidth(150);
    obj.edit275:setHeight(20);
    obj.edit275:setField("nameEnemy7");
    obj.edit275:setName("edit275");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout91);
    obj.dataLink81:setField("singleGB");
    obj.dataLink81:setDefaultValue("1");
    obj.dataLink81:setName("dataLink81");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout91);
    obj.dataLink82:setField("ValidTarget7");
    obj.dataLink82:setDefaultValue("true");
    obj.dataLink82:setName("dataLink82");

    obj.radioButton28 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton28:setParent(obj.layout91);
    obj.radioButton28:setTop(200);
    obj.radioButton28:setLeft(00);
    obj.radioButton28:setWidth(20);
    obj.radioButton28:setHeight(20);
    obj.radioButton28:setGroupName("singleGA");
    obj.radioButton28:setField("singleGB");
    obj.radioButton28:setFieldValue("8");
    obj.radioButton28:setName("radioButton28");

    obj.checkBox477 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox477:setParent(obj.layout91);
    obj.checkBox477:setTop(200);
    obj.checkBox477:setLeft(25);
    obj.checkBox477:setWidth(20);
    obj.checkBox477:setHeight(20);
    obj.checkBox477:setField("ValidTarget8");
    obj.checkBox477:setName("checkBox477");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout91);
    obj.edit276:setTop(200);
    obj.edit276:setLeft(50);
    obj.edit276:setWidth(150);
    obj.edit276:setHeight(20);
    obj.edit276:setField("nameEnemy8");
    obj.edit276:setName("edit276");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout91);
    obj.dataLink83:setField("singleGB");
    obj.dataLink83:setDefaultValue("1");
    obj.dataLink83:setName("dataLink83");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout91);
    obj.dataLink84:setField("ValidTarget8");
    obj.dataLink84:setDefaultValue("true");
    obj.dataLink84:setName("dataLink84");

    obj.radioButton29 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton29:setParent(obj.layout91);
    obj.radioButton29:setTop(225);
    obj.radioButton29:setLeft(00);
    obj.radioButton29:setWidth(20);
    obj.radioButton29:setHeight(20);
    obj.radioButton29:setGroupName("singleGA");
    obj.radioButton29:setField("singleGB");
    obj.radioButton29:setFieldValue("9");
    obj.radioButton29:setName("radioButton29");

    obj.checkBox478 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox478:setParent(obj.layout91);
    obj.checkBox478:setTop(225);
    obj.checkBox478:setLeft(25);
    obj.checkBox478:setWidth(20);
    obj.checkBox478:setHeight(20);
    obj.checkBox478:setField("ValidTarget9");
    obj.checkBox478:setName("checkBox478");

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout91);
    obj.edit277:setTop(225);
    obj.edit277:setLeft(50);
    obj.edit277:setWidth(150);
    obj.edit277:setHeight(20);
    obj.edit277:setField("nameEnemy9");
    obj.edit277:setName("edit277");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout91);
    obj.dataLink85:setField("singleGB");
    obj.dataLink85:setDefaultValue("1");
    obj.dataLink85:setName("dataLink85");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout91);
    obj.dataLink86:setField("ValidTarget9");
    obj.dataLink86:setDefaultValue("true");
    obj.dataLink86:setName("dataLink86");

    obj.radioButton30 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton30:setParent(obj.layout91);
    obj.radioButton30:setTop(250);
    obj.radioButton30:setLeft(00);
    obj.radioButton30:setWidth(20);
    obj.radioButton30:setHeight(20);
    obj.radioButton30:setGroupName("singleGA");
    obj.radioButton30:setField("singleGB");
    obj.radioButton30:setFieldValue("10");
    obj.radioButton30:setName("radioButton30");

    obj.checkBox479 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox479:setParent(obj.layout91);
    obj.checkBox479:setTop(250);
    obj.checkBox479:setLeft(25);
    obj.checkBox479:setWidth(20);
    obj.checkBox479:setHeight(20);
    obj.checkBox479:setField("ValidTarget10");
    obj.checkBox479:setName("checkBox479");

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout91);
    obj.edit278:setTop(250);
    obj.edit278:setLeft(50);
    obj.edit278:setWidth(150);
    obj.edit278:setHeight(20);
    obj.edit278:setField("nameEnemy10");
    obj.edit278:setName("edit278");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout91);
    obj.dataLink87:setField("singleGB");
    obj.dataLink87:setDefaultValue("1");
    obj.dataLink87:setName("dataLink87");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout91);
    obj.dataLink88:setField("ValidTarget10");
    obj.dataLink88:setDefaultValue("true");
    obj.dataLink88:setName("dataLink88");

    obj.radioButton31 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton31:setParent(obj.layout91);
    obj.radioButton31:setTop(275);
    obj.radioButton31:setLeft(00);
    obj.radioButton31:setWidth(20);
    obj.radioButton31:setHeight(20);
    obj.radioButton31:setGroupName("singleGA");
    obj.radioButton31:setField("singleGB");
    obj.radioButton31:setFieldValue("11");
    obj.radioButton31:setName("radioButton31");

    obj.checkBox480 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox480:setParent(obj.layout91);
    obj.checkBox480:setTop(275);
    obj.checkBox480:setLeft(25);
    obj.checkBox480:setWidth(20);
    obj.checkBox480:setHeight(20);
    obj.checkBox480:setField("ValidTarget11");
    obj.checkBox480:setName("checkBox480");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout91);
    obj.edit279:setTop(275);
    obj.edit279:setLeft(50);
    obj.edit279:setWidth(150);
    obj.edit279:setHeight(20);
    obj.edit279:setField("nameEnemy11");
    obj.edit279:setName("edit279");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout91);
    obj.dataLink89:setField("singleGB");
    obj.dataLink89:setDefaultValue("1");
    obj.dataLink89:setName("dataLink89");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout91);
    obj.dataLink90:setField("ValidTarget11");
    obj.dataLink90:setDefaultValue("true");
    obj.dataLink90:setName("dataLink90");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.scrollBox11);
    obj.layout92:setLeft(855);
    obj.layout92:setTop(250);
    obj.layout92:setWidth(225);
    obj.layout92:setHeight(300);
    obj.layout92:setName("layout92");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout92);
    obj.label248:setLeft(50);
    obj.label248:setTop(00);
    obj.label248:setWidth(150);
    obj.label248:setHeight(20);
    obj.label248:setText("Aliados");
    obj.label248:setHorzTextAlign("center");
    obj.label248:setAutoSize(true);
    lfm_setPropAsString(obj.label248, "fontStyle",  "bold");
    obj.label248:setName("label248");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout92);
    obj.label249:setLeft(0);
    obj.label249:setTop(00);
    obj.label249:setWidth(20);
    obj.label249:setHeight(20);
    obj.label249:setText("S");
    obj.label249:setHorzTextAlign("center");
    obj.label249:setAutoSize(true);
    lfm_setPropAsString(obj.label249, "fontStyle",  "bold");
    obj.label249:setName("label249");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout92);
    obj.label250:setLeft(25);
    obj.label250:setTop(00);
    obj.label250:setWidth(20);
    obj.label250:setHeight(20);
    obj.label250:setText("G");
    obj.label250:setHorzTextAlign("center");
    obj.label250:setAutoSize(true);
    lfm_setPropAsString(obj.label250, "fontStyle",  "bold");
    obj.label250:setName("label250");

    obj.radioButton32 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton32:setParent(obj.layout92);
    obj.radioButton32:setTop(025);
    obj.radioButton32:setLeft(00);
    obj.radioButton32:setWidth(20);
    obj.radioButton32:setHeight(20);
    obj.radioButton32:setGroupName("singleAllyA");
    obj.radioButton32:setField("singleAllyB");
    obj.radioButton32:setFieldValue("1");
    obj.radioButton32:setName("radioButton32");

    obj.checkBox481 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox481:setParent(obj.layout92);
    obj.checkBox481:setTop(025);
    obj.checkBox481:setLeft(25);
    obj.checkBox481:setWidth(20);
    obj.checkBox481:setHeight(20);
    obj.checkBox481:setField("ValidAllyG1");
    obj.checkBox481:setName("checkBox481");

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout92);
    obj.edit280:setTop(025);
    obj.edit280:setLeft(50);
    obj.edit280:setWidth(150);
    obj.edit280:setHeight(20);
    obj.edit280:setField("nameAlly1");
    obj.edit280:setName("edit280");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout92);
    obj.dataLink91:setField("singleAllyB");
    obj.dataLink91:setDefaultValue("1");
    obj.dataLink91:setName("dataLink91");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout92);
    obj.dataLink92:setField("ValidAllyG1");
    obj.dataLink92:setDefaultValue("true");
    obj.dataLink92:setName("dataLink92");

    obj.radioButton33 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton33:setParent(obj.layout92);
    obj.radioButton33:setTop(050);
    obj.radioButton33:setLeft(00);
    obj.radioButton33:setWidth(20);
    obj.radioButton33:setHeight(20);
    obj.radioButton33:setGroupName("singleAllyA");
    obj.radioButton33:setField("singleAllyB");
    obj.radioButton33:setFieldValue("2");
    obj.radioButton33:setName("radioButton33");

    obj.checkBox482 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox482:setParent(obj.layout92);
    obj.checkBox482:setTop(050);
    obj.checkBox482:setLeft(25);
    obj.checkBox482:setWidth(20);
    obj.checkBox482:setHeight(20);
    obj.checkBox482:setField("ValidAllyG2");
    obj.checkBox482:setName("checkBox482");

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout92);
    obj.edit281:setTop(050);
    obj.edit281:setLeft(50);
    obj.edit281:setWidth(150);
    obj.edit281:setHeight(20);
    obj.edit281:setField("nameAlly2");
    obj.edit281:setName("edit281");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout92);
    obj.dataLink93:setField("singleAllyB");
    obj.dataLink93:setDefaultValue("1");
    obj.dataLink93:setName("dataLink93");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout92);
    obj.dataLink94:setField("ValidAllyG2");
    obj.dataLink94:setDefaultValue("true");
    obj.dataLink94:setName("dataLink94");

    obj.radioButton34 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton34:setParent(obj.layout92);
    obj.radioButton34:setTop(075);
    obj.radioButton34:setLeft(00);
    obj.radioButton34:setWidth(20);
    obj.radioButton34:setHeight(20);
    obj.radioButton34:setGroupName("singleAllyA");
    obj.radioButton34:setField("singleAllyB");
    obj.radioButton34:setFieldValue("3");
    obj.radioButton34:setName("radioButton34");

    obj.checkBox483 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox483:setParent(obj.layout92);
    obj.checkBox483:setTop(075);
    obj.checkBox483:setLeft(25);
    obj.checkBox483:setWidth(20);
    obj.checkBox483:setHeight(20);
    obj.checkBox483:setField("ValidAllyG3");
    obj.checkBox483:setName("checkBox483");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout92);
    obj.edit282:setTop(075);
    obj.edit282:setLeft(50);
    obj.edit282:setWidth(150);
    obj.edit282:setHeight(20);
    obj.edit282:setField("nameAlly3");
    obj.edit282:setName("edit282");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout92);
    obj.dataLink95:setField("singleAllyB");
    obj.dataLink95:setDefaultValue("1");
    obj.dataLink95:setName("dataLink95");

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout92);
    obj.dataLink96:setField("ValidAllyG3");
    obj.dataLink96:setDefaultValue("true");
    obj.dataLink96:setName("dataLink96");

    obj.radioButton35 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton35:setParent(obj.layout92);
    obj.radioButton35:setTop(100);
    obj.radioButton35:setLeft(00);
    obj.radioButton35:setWidth(20);
    obj.radioButton35:setHeight(20);
    obj.radioButton35:setGroupName("singleAllyA");
    obj.radioButton35:setField("singleAllyB");
    obj.radioButton35:setFieldValue("4");
    obj.radioButton35:setName("radioButton35");

    obj.checkBox484 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox484:setParent(obj.layout92);
    obj.checkBox484:setTop(100);
    obj.checkBox484:setLeft(25);
    obj.checkBox484:setWidth(20);
    obj.checkBox484:setHeight(20);
    obj.checkBox484:setField("ValidAllyG4");
    obj.checkBox484:setName("checkBox484");

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout92);
    obj.edit283:setTop(100);
    obj.edit283:setLeft(50);
    obj.edit283:setWidth(150);
    obj.edit283:setHeight(20);
    obj.edit283:setField("nameAlly4");
    obj.edit283:setName("edit283");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout92);
    obj.dataLink97:setField("singleAllyB");
    obj.dataLink97:setDefaultValue("1");
    obj.dataLink97:setName("dataLink97");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout92);
    obj.dataLink98:setField("ValidAllyG4");
    obj.dataLink98:setDefaultValue("true");
    obj.dataLink98:setName("dataLink98");

    obj.radioButton36 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton36:setParent(obj.layout92);
    obj.radioButton36:setTop(125);
    obj.radioButton36:setLeft(00);
    obj.radioButton36:setWidth(20);
    obj.radioButton36:setHeight(20);
    obj.radioButton36:setGroupName("singleAllyA");
    obj.radioButton36:setField("singleAllyB");
    obj.radioButton36:setFieldValue("5");
    obj.radioButton36:setName("radioButton36");

    obj.checkBox485 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox485:setParent(obj.layout92);
    obj.checkBox485:setTop(125);
    obj.checkBox485:setLeft(25);
    obj.checkBox485:setWidth(20);
    obj.checkBox485:setHeight(20);
    obj.checkBox485:setField("ValidAllyG5");
    obj.checkBox485:setName("checkBox485");

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout92);
    obj.edit284:setTop(125);
    obj.edit284:setLeft(50);
    obj.edit284:setWidth(150);
    obj.edit284:setHeight(20);
    obj.edit284:setField("nameAlly5");
    obj.edit284:setName("edit284");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout92);
    obj.dataLink99:setField("singleAllyB");
    obj.dataLink99:setDefaultValue("1");
    obj.dataLink99:setName("dataLink99");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout92);
    obj.dataLink100:setField("ValidAllyG5");
    obj.dataLink100:setDefaultValue("true");
    obj.dataLink100:setName("dataLink100");

    obj.radioButton37 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton37:setParent(obj.layout92);
    obj.radioButton37:setTop(150);
    obj.radioButton37:setLeft(00);
    obj.radioButton37:setWidth(20);
    obj.radioButton37:setHeight(20);
    obj.radioButton37:setGroupName("singleAllyA");
    obj.radioButton37:setField("singleAllyB");
    obj.radioButton37:setFieldValue("6");
    obj.radioButton37:setName("radioButton37");

    obj.checkBox486 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox486:setParent(obj.layout92);
    obj.checkBox486:setTop(150);
    obj.checkBox486:setLeft(25);
    obj.checkBox486:setWidth(20);
    obj.checkBox486:setHeight(20);
    obj.checkBox486:setField("ValidAllyG6");
    obj.checkBox486:setName("checkBox486");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout92);
    obj.edit285:setTop(150);
    obj.edit285:setLeft(50);
    obj.edit285:setWidth(150);
    obj.edit285:setHeight(20);
    obj.edit285:setField("nameAlly6");
    obj.edit285:setName("edit285");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout92);
    obj.dataLink101:setField("singleAllyB");
    obj.dataLink101:setDefaultValue("1");
    obj.dataLink101:setName("dataLink101");

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout92);
    obj.dataLink102:setField("ValidAllyG6");
    obj.dataLink102:setDefaultValue("true");
    obj.dataLink102:setName("dataLink102");

    obj.radioButton38 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton38:setParent(obj.layout92);
    obj.radioButton38:setTop(175);
    obj.radioButton38:setLeft(00);
    obj.radioButton38:setWidth(20);
    obj.radioButton38:setHeight(20);
    obj.radioButton38:setGroupName("singleAllyA");
    obj.radioButton38:setField("singleAllyB");
    obj.radioButton38:setFieldValue("7");
    obj.radioButton38:setName("radioButton38");

    obj.checkBox487 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox487:setParent(obj.layout92);
    obj.checkBox487:setTop(175);
    obj.checkBox487:setLeft(25);
    obj.checkBox487:setWidth(20);
    obj.checkBox487:setHeight(20);
    obj.checkBox487:setField("ValidAllyG7");
    obj.checkBox487:setName("checkBox487");

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout92);
    obj.edit286:setTop(175);
    obj.edit286:setLeft(50);
    obj.edit286:setWidth(150);
    obj.edit286:setHeight(20);
    obj.edit286:setField("nameAlly7");
    obj.edit286:setName("edit286");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout92);
    obj.dataLink103:setField("singleAllyB");
    obj.dataLink103:setDefaultValue("1");
    obj.dataLink103:setName("dataLink103");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout92);
    obj.dataLink104:setField("ValidAllyG7");
    obj.dataLink104:setDefaultValue("true");
    obj.dataLink104:setName("dataLink104");

    obj.radioButton39 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton39:setParent(obj.layout92);
    obj.radioButton39:setTop(200);
    obj.radioButton39:setLeft(00);
    obj.radioButton39:setWidth(20);
    obj.radioButton39:setHeight(20);
    obj.radioButton39:setGroupName("singleAllyA");
    obj.radioButton39:setField("singleAllyB");
    obj.radioButton39:setFieldValue("8");
    obj.radioButton39:setName("radioButton39");

    obj.checkBox488 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox488:setParent(obj.layout92);
    obj.checkBox488:setTop(200);
    obj.checkBox488:setLeft(25);
    obj.checkBox488:setWidth(20);
    obj.checkBox488:setHeight(20);
    obj.checkBox488:setField("ValidAllyG8");
    obj.checkBox488:setName("checkBox488");

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout92);
    obj.edit287:setTop(200);
    obj.edit287:setLeft(50);
    obj.edit287:setWidth(150);
    obj.edit287:setHeight(20);
    obj.edit287:setField("nameAlly8");
    obj.edit287:setName("edit287");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout92);
    obj.dataLink105:setField("singleAllyB");
    obj.dataLink105:setDefaultValue("1");
    obj.dataLink105:setName("dataLink105");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout92);
    obj.dataLink106:setField("ValidAllyG8");
    obj.dataLink106:setDefaultValue("true");
    obj.dataLink106:setName("dataLink106");

    obj.radioButton40 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton40:setParent(obj.layout92);
    obj.radioButton40:setTop(225);
    obj.radioButton40:setLeft(00);
    obj.radioButton40:setWidth(20);
    obj.radioButton40:setHeight(20);
    obj.radioButton40:setGroupName("singleAllyA");
    obj.radioButton40:setField("singleAllyB");
    obj.radioButton40:setFieldValue("9");
    obj.radioButton40:setName("radioButton40");

    obj.checkBox489 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox489:setParent(obj.layout92);
    obj.checkBox489:setTop(225);
    obj.checkBox489:setLeft(25);
    obj.checkBox489:setWidth(20);
    obj.checkBox489:setHeight(20);
    obj.checkBox489:setField("ValidAllyG9");
    obj.checkBox489:setName("checkBox489");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout92);
    obj.edit288:setTop(225);
    obj.edit288:setLeft(50);
    obj.edit288:setWidth(150);
    obj.edit288:setHeight(20);
    obj.edit288:setField("nameAlly9");
    obj.edit288:setName("edit288");

    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout92);
    obj.dataLink107:setField("singleAllyB");
    obj.dataLink107:setDefaultValue("1");
    obj.dataLink107:setName("dataLink107");

    obj.dataLink108 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout92);
    obj.dataLink108:setField("ValidAllyG9");
    obj.dataLink108:setDefaultValue("true");
    obj.dataLink108:setName("dataLink108");

    obj.radioButton41 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton41:setParent(obj.layout92);
    obj.radioButton41:setTop(250);
    obj.radioButton41:setLeft(00);
    obj.radioButton41:setWidth(20);
    obj.radioButton41:setHeight(20);
    obj.radioButton41:setGroupName("singleAllyA");
    obj.radioButton41:setField("singleAllyB");
    obj.radioButton41:setFieldValue("10");
    obj.radioButton41:setName("radioButton41");

    obj.checkBox490 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox490:setParent(obj.layout92);
    obj.checkBox490:setTop(250);
    obj.checkBox490:setLeft(25);
    obj.checkBox490:setWidth(20);
    obj.checkBox490:setHeight(20);
    obj.checkBox490:setField("ValidAllyG10");
    obj.checkBox490:setName("checkBox490");

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout92);
    obj.edit289:setTop(250);
    obj.edit289:setLeft(50);
    obj.edit289:setWidth(150);
    obj.edit289:setHeight(20);
    obj.edit289:setField("nameAlly10");
    obj.edit289:setName("edit289");

    obj.dataLink109 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout92);
    obj.dataLink109:setField("singleAllyB");
    obj.dataLink109:setDefaultValue("1");
    obj.dataLink109:setName("dataLink109");

    obj.dataLink110 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout92);
    obj.dataLink110:setField("ValidAllyG10");
    obj.dataLink110:setDefaultValue("true");
    obj.dataLink110:setName("dataLink110");

    obj.radioButton42 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton42:setParent(obj.layout92);
    obj.radioButton42:setTop(275);
    obj.radioButton42:setLeft(00);
    obj.radioButton42:setWidth(20);
    obj.radioButton42:setHeight(20);
    obj.radioButton42:setGroupName("singleAllyA");
    obj.radioButton42:setField("singleAllyB");
    obj.radioButton42:setFieldValue("11");
    obj.radioButton42:setName("radioButton42");

    obj.checkBox491 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox491:setParent(obj.layout92);
    obj.checkBox491:setTop(275);
    obj.checkBox491:setLeft(25);
    obj.checkBox491:setWidth(20);
    obj.checkBox491:setHeight(20);
    obj.checkBox491:setField("ValidAllyG11");
    obj.checkBox491:setName("checkBox491");

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout92);
    obj.edit290:setTop(275);
    obj.edit290:setLeft(50);
    obj.edit290:setWidth(150);
    obj.edit290:setHeight(20);
    obj.edit290:setField("nameAlly11");
    obj.edit290:setName("edit290");

    obj.dataLink111 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout92);
    obj.dataLink111:setField("singleAllyB");
    obj.dataLink111:setDefaultValue("1");
    obj.dataLink111:setName("dataLink111");

    obj.dataLink112 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout92);
    obj.dataLink112:setField("ValidAllyG11");
    obj.dataLink112:setDefaultValue("true");
    obj.dataLink112:setName("dataLink112");


		local function setEG1(addEXP, addGIL)
			local BaEXP = tonumber(sheet.baseEXP) or 0
			local BoEXP = tonumber(addEXP) or 0
			local BaGIL = tonumber(sheet.baseGIL) or 0
			local BoGIL = tonumber(addGIL) or 0
			
			sheet.baseEXP = BaEXP + BoEXP;
			sheet.baseGIL = BaGIL + BoGIL;		
			end;
		


    obj.dataLink113 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj);
    obj.dataLink113:setFields({'baseTIPO', 'valSTR', 'valVIT', 'valAGI', 'valSPD', 'valMAG', 'valSPR', 'valLV', 'baseArmor', 'baseMArmor', 'baseHP', 'baseMP','statBLINK', 'statIMM',
        'supEva10', 'supEva25', 'supEva50', 'supEva75', 'supMEva10', 'supMEva25', 'supMEva50', 'supMEva75', 'supLEva', 'supLMEva', 'statAGIUP', 'statAGIDOWN', 'statAGIBREAK', 
		'statSPIUP', 'statSPIDOWN', 'statSPIBREAK', 'statARMUP', 'statARMDOWN', 'statARMBREAK', 'statMENUP', 'statMENDOWN', 'statMENBREAK', 'statTOAD', 'statMINI','statBLIND'});
    obj.dataLink113:setName("dataLink113");

    obj.dataLink114 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj);
    obj.dataLink114:setFields({'baseTIPO', 'valLV', 'baseArmor', 'baseMArmor', 'baseHP', 'baseMP', 'bonusEXP', 'bonusGIL', 'NPlayers', 
						'addFloat', 'addAgiUP', 'addSpiUP', 'addGNDSpikes', 'addFIRSpikes', 'addWATSpikes', 'addWINSpikes', 'addICESpikes', 'addELESpikes', 'addHOLSpikes', 'addSHASpikes','addBIOSpikes',
						'addProtect', 'addShell', 'addARMUP', 'addMENUP', 'addHaste', 'addReflect', 'addPOWUP', 'addMAGUP', 'addRegen', 'addAura', 'addVanish', 'aaAlarm',
						'canFloat', 'canAgiUP', 'canSpiUP', 'canGNDSpikes', 'canFIRSpikes', 'canWATSpikes', 'canWINSpikes', 'canICESpikes', 'canELESpikes', 'canHOLSpikes', 'canSHASpikes','canBIOSpikes',
						'canProtect', 'canShell', 'canARMUP', 'canMENUP', 'canHaste', 'canReflect', 'canPOWUP', 'canMAGUP', 'canRegen', 'canAura', 'canVanish', 'canHealHP',
						'aaAlarm', 'aaClone', 'aaEscape', 'aaImprison', 'aaBPrison', 'aaIPrison', 'aaSPrison', 'aaDPrison', 'aaVPrison', 'aaItemUse', 'aaRestore25',
						'aaRestore50', 'aaRestore75', 'aaSSPO', 'aaSSPN', 'SpellsTIPO1', 'SpellsTIPO2', 'SpellsTIPO3', 'SpellsTIPO4', 'SpellsTIPO5', 'SpellsTIPO6',
						'SpellsTIPO7', 'SpellsTIPO8', 'SpellsTIPO9', 'SpellsTIPO10', 'SpellsTIPO11', 'SpellsTIPO12', 'JSTipo1', 'JSTipo2', 'JSTipo3', 'weakBIO', 'resBIO', 'immBIO', 'absBIO','potBIO',
						'JSTipo4', 'JSTipo5', 'JSTipo6', 'JSTipo7', 'JSTipo8', 'JSTipo9', 'JSTipo10', 'JSTipo11', 'JSTipo12', 'maBurrow', 'maBurrowMP',
						'maBurrowSOSG', 'maBurrowSOSL', 'maFlight', 'maFlightMP', 'maFlightSOSG', 'maFlightSOSL', 'maFloat', 'maFloatMP', 'maFloatSOSG',
						'maFloatSOSL', 'maTeleport', 'maTeleportMP', 'maTeleportSOSG', 'maTeleportSOSL', 'autoFloat', 'autoAgiUP', 'autoSpiUP', 'autoGNDSpikes', 'autoFIRSpikes', 'autoBIOSpikes',
						'autoWATSpikes', 'autoWINSpikes', 'autoICESpikes', 'autoELESpikes', 'autoHOLSpikes', 'autoSHASpikes','autoProtect', 'autoShell', 'autoARMUP', 'autoMENUP', 'autoHaste', 
						'autoReflect', 'autoPOWUP', 'autoMAGUP', 'autoRegen', 'autoAura', 'autoVanish', 'autoBerserk', 'autoBlind', 'autoPoison', 'autoSleep', 'autoSlow', 'autoZombie',
						'autoConfuse', 'autoSap', 'autoUnaware', 'autoMini', 'autoToad', 'autoVenom', 'autoCondemn', 'autoPetrify', 'sosFloat', 'sosAgiUP', 'sosSpiUP', 'sosGNDSpikes', 'sosFIRSpikes', 'sosBIOSpikes',
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
						'reRotateLose', 'reRotateUns', 'recCSGain', 'recCSLose', 'recCSUns', 'recCSFloat', 'recCSAgiUP', 'recCSSpiUP', 'recCSGNDSpikes', 'recCSFIRSpikes', 'recCSWATSpikes', 'recCSWINSpikes','recCSBIOSpikes',
						'recCSICESpikes', 'recCSELESpikes', 'recCSHOLSpikes', 'recCSSHASpikes', 'recCSProtect', 'recCSShell', 'recCSARMUP', 'recCSMENUP', 'recCSHaste', 'recCSReflect', 'recCSPOWUP',
						'Atk1ExpF', 'Atk2ExpF', 'Atk3ExpF', 'Atk4ExpF', 'Atk1GilF', 'Atk2GilF', 'Atk3GilF', 'Atk4GilF', 'Special1Exp', 'Special2Exp', 'Special3Exp', 'Special1Gil', 'Special2Gil', 'Special3Gil',
						'speBadScan', 'speNoScan', 'supEvader', 'supEva10', 'supEva25', 'supEva50', 'supEva75', 'supHArm', 'supLEva', 'supLMEva', 'supMEva10', 'supMEva25', 'supMEva50', 'supMEva75',
						'supMBound', 'supMinion', 'supNDrain', 'supRDrain', 'supXFight','Atk5ExpF', 'Atk5ExpF', 'Atk6ExpF', 'Atk6ExpF','bossSlaveN2','bossSlaveN','bossSlaveS'});
    obj.dataLink114:setName("dataLink114");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            					mesa.activeChat:enviarMensagem("[§B]Scan[§B]");
            					mesa.activeChat:enviarMensagem("[§B]Nome: [§B]" .. (sheet.baseName or ""));
            					mesa.activeChat:enviarMensagem("[§B]Level: [§B]" .. (sheet.valLV or ""));
            					mesa.activeChat:enviarMensagem("[§B]HP: [§B]" .. (sheet.valAtHP or 0) .. "/" .. (sheet.valMaxHP or 0));
            					mesa.activeChat:enviarMensagem("[§B]MP: [§B]" .. (sheet.valAtMP or 0) .. "/" .. (sheet.valMaxMP or 0));
            					mesa.activeChat:enviarMensagem("[§B]Absorções Elementais: [§B]".. (sheet.MSGabsELE or "") .. (sheet.MSGabsFIR or "") .. (sheet.MSGabsGND or "") .. 
            					(sheet.MSGabsHOL or "") .. (sheet.MSGabsICE or "") .. (sheet.MSGabsSHA or "") .. (sheet.MSGabsWAT or "") .. (sheet.MSGabsWIN or "") .. (sheet.MSGabsBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Imunidades Elementais: [§B]" .. (sheet.MSGimmELE or "") .. (sheet.MSGimmFIR or "") .. (sheet.MSGimmGND or "") .. 
            					(sheet.MSGimmHOL or "") .. (sheet.MSGimmICE or "") .. (sheet.MSGimmSHA or "") .. (sheet.MSGimmWAT or "") .. (sheet.MSGimmWIN or "") .. (sheet.MSGimmBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Resistências Elementais: [§B]" .. (sheet.MSGresELE or "") .. (sheet.MSGresFIR or "") .. (sheet.MSGresGND or "") .. 
            					(sheet.MSGresHOL or "") .. (sheet.MSGresICE or "") .. (sheet.MSGresSHA or "") .. (sheet.MSGresWAT or "").. (sheet.MSGresWIN or "") .. (sheet.MSGresBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Fraquezas Elementais: [§B]" .. (sheet.MSGweakELE or "") .. (sheet.MSGweakFIR or "") .. (sheet.MSGweakGND or "") .. 
            					(sheet.MSGweakHOL or "") .. (sheet.MSGweakICE or "") .. (sheet.MSGweakSHA or "") .. (sheet.MSGweakWAT or "").. (sheet.MSGweakWIN or "") .. (sheet.MSGweakBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Resistências a Status: [§B]" .. (sheet.MSG_resFatal or "") .. (sheet.MSG_resMystify or "") .. (sheet.MSG_resToxin or "") .. 
            					(sheet.MSG_resSeal or "") .. (sheet.MSG_resTime or "") .. (sheet.MSG_resTransform or "") .. (sheet.MSG_resWeaken or "") .. (sheet.MSGresBerserk or "") .. 
            					(sheet.MSGresBlind or "") .. (sheet.MSGresImmobilize or "") .. (sheet.MSGresPoison or "") .. (sheet.MSGresSleep or "") .. (sheet.MSGresSlow or "") .. 
            					(sheet.MSGresZombie or "") .. (sheet.MSGresLock or "") .. (sheet.MSGresCondemn or "") .. (sheet.MSGresConfuse or "") .. (sheet.MSGresCurse or "") .. 
            					(sheet.MSGresDisable or "") .. (sheet.MSGresPetrify or "") .. (sheet.MSGresSilence or "") .. (sheet.MSGresSap or "") .. (sheet.MSGresUnaware or "") .. 
            					(sheet.MSGresEject or "") .. (sheet.MSGresMini or "") .. (sheet.MSGresSTRDown or "") .. (sheet.MSGresAGIDown or "") .. (sheet.MSGresMAGDown or "") .. 
            					(sheet.MSGresMENDown or "") .. (sheet.MSGresARMDown or "") .. (sheet.MSGresSPIDown or "") .. (sheet.MSGresSTRBrk or "") .. (sheet.MSGresAGIBrk or "") .. 
            					(sheet.MSGresMAGBrk or "") .. (sheet.MSGresMENBrk or "") .. (sheet.MSGresARMBrk or "") .. (sheet.MSGresSPIBrk or "") .. (sheet.MSGresStop or "") .. 
            					(sheet.MSGresToad or "") .. (sheet.MSGresVenom or "") .. (sheet.MSGresElemWeak or "") .. (sheet.MSGresCharm or "") .. (sheet.MSGresDeath or "") .. 
            					(sheet.MSGresFrozen or "") .. (sheet.MSGresGravity or "") .. (sheet.MSGresHeat or "") .. (sheet.MSGresMeltdown or "") .. (sheet.MSGresStone or ""));
            					mesa.activeChat:enviarMensagem("[§B]Imunidades a Status: [§B]" .. (sheet.MSG_immAll or "") .. (sheet.MSG_immFatal or "") .. (sheet.MSG_immMystify or "") .. 
            					(sheet.MSG_immToxin or "") .. (sheet.MSG_immSeal or "") .. (sheet.MSG_immTime or "") .. (sheet.MSG_immTransform or "") .. (sheet.MSG_immWeaken or "").. 
            					(sheet.MSGimmBerserk or "") .. (sheet.MSGimmBlind or "") .. (sheet.MSGimmImmobilize or "") .. (sheet.MSGimmPoison or "") .. (sheet.MSGimmSleep or "") .. 
            					(sheet.MSGimmSlow or "") .. (sheet.MSGimmZombie or "") .. (sheet.MSGimmLock or "") .. (sheet.MSGimmCondemn or "") .. (sheet.MSGimmConfuse or "") .. 
            					(sheet.MSGimmCurse or "") .. (sheet.MSGimmDisable or "") .. (sheet.MSGimmPetrify or "") .. (sheet.MSGimmSilence or "") .. (sheet.MSGimmSap or "") .. 
            					(sheet.MSGimmUnaware or "") .. (sheet.MSGimmEject or "") .. (sheet.MSGimmMini or "") .. (sheet.MSGimmSTRDown or "") .. (sheet.MSGimmAGIDown or "") .. 
            					(sheet.MSGimmMAGDown or "") .. (sheet.MSGimmMENDown or "") .. (sheet.MSGimmARMDown or "") .. (sheet.MSGimmSPIDown or "") .. (sheet.MSGimmSTRBrk or "") .. 
            					(sheet.MSGimmAGIBrk or "") .. (sheet.MSGimmMAGBrk or "") .. (sheet.MSGimmMENBrk or "") .. (sheet.MSGimmARMBrk or "") .. (sheet.MSGimmSPIBrk or "") .. 
            					(sheet.MSGimmStop or "") .. (sheet.MSGimmToad or "") .. (sheet.MSGimmVenom or "") .. (sheet.MSGimmElemWeak or "") .. (sheet.MSGimmCharm or "") .. 
            					(sheet.MSGimmDeath or "") .. (sheet.MSGimmFrozen or "") .. (sheet.MSGimmGravity or "") .. (sheet.MSGimmHeat or "") .. (sheet.MSGimmMeltdown or "") .. (sheet.MSGimmStone or ""));
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            					mesa.activeChat:enviarMensagem("[§B]Sensor[§B]");
            					mesa.activeChat:enviarMensagem("[§B]Nome: [§B]" .. (sheet.baseName or ""));
            					mesa.activeChat:enviarMensagem("[§B]HP: [§B]" .. (sheet.valAtHP or 0) .. "/" .. (sheet.valMaxHP or 0));
            					mesa.activeChat:enviarMensagem("[§B]Absorções Elementais: [§B]".. (sheet.MSGabsELE or "") .. (sheet.MSGabsFIR or "") .. (sheet.MSGabsGND or "") .. 
            					(sheet.MSGabsHOL or "") .. (sheet.MSGabsICE or "") .. (sheet.MSGabsSHA or "") .. (sheet.MSGabsWAT or "") .. (sheet.MSGabsWIN or "") .. (sheet.MSGabsBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Imunidades Elementais: [§B]" .. (sheet.MSGimmELE or "") .. (sheet.MSGimmFIR or "") .. (sheet.MSGimmGND or "") .. 
            					(sheet.MSGimmHOL or "") .. (sheet.MSGimmICE or "") .. (sheet.MSGimmSHA or "") .. (sheet.MSGimmWAT or "") .. (sheet.MSGimmWIN or "") .. (sheet.MSGimmBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Resistências Elementais: [§B]" .. (sheet.MSGresELE or "") .. (sheet.MSGresFIR or "") .. (sheet.MSGresGND or "") .. 
            					(sheet.MSGresHOL or "") .. (sheet.MSGresICE or "") .. (sheet.MSGresSHA or "") .. (sheet.MSGresWAT or "").. (sheet.MSGresWIN or "") .. (sheet.MSGresBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Fraquezas Elementais: [§B]" .. (sheet.MSGweakELE or "") .. (sheet.MSGweakFIR or "") .. (sheet.MSGweakGND or "") .. 
            					(sheet.MSGweakHOL or "") .. (sheet.MSGweakICE or "") .. (sheet.MSGweakSHA or "") .. (sheet.MSGweakWAT or "").. (sheet.MSGweakWIN or "") .. (sheet.MSGweakBIO or ""));
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            					mesa.activeChat:enviarMensagem("[§B]Peep[§B]");
            					mesa.activeChat:enviarMensagem("[§B]Nome: [§B]" .. (sheet.baseName or ""));
            					mesa.activeChat:enviarMensagem("[§B]Level: [§B]" .. (sheet.valLV or ""));
            					mesa.activeChat:enviarMensagem("[§B]HP: [§B]" .. (sheet.valAtHP or 0) .. "/" .. (sheet.valMaxHP or 0));
            					mesa.activeChat:enviarMensagem("[§B]MP: [§B]" .. (sheet.valAtMP or 0) .. "/" .. (sheet.valMaxMP or 0));
            					mesa.activeChat:enviarMensagem("[§B]Absorções Elementais: [§B]".. (sheet.MSGabsELE or "") .. (sheet.MSGabsFIR or "") .. (sheet.MSGabsGND or "") .. 
            					(sheet.MSGabsHOL or "") .. (sheet.MSGabsICE or "") .. (sheet.MSGabsSHA or "") .. (sheet.MSGabsWAT or "") .. (sheet.MSGabsWIN or "") .. (sheet.MSGabsBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Imunidades Elementais: [§B]" .. (sheet.MSGimmELE or "") .. (sheet.MSGimmFIR or "") .. (sheet.MSGimmGND or "") .. 
            					(sheet.MSGimmHOL or "") .. (sheet.MSGimmICE or "") .. (sheet.MSGimmSHA or "") .. (sheet.MSGimmWAT or "") .. (sheet.MSGimmWIN or "") .. (sheet.MSGimmBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Resistências Elementais: [§B]" .. (sheet.MSGresELE or "") .. (sheet.MSGresFIR or "") .. (sheet.MSGresGND or "") .. 
            					(sheet.MSGresHOL or "") .. (sheet.MSGresICE or "") .. (sheet.MSGresSHA or "") .. (sheet.MSGresWAT or "").. (sheet.MSGresWIN or "") .. (sheet.MSGresBIO or ""));
            					mesa.activeChat:enviarMensagem("[§B]Fraquezas Elementais: [§B]" .. (sheet.MSGweakELE or "") .. (sheet.MSGweakFIR or "") .. (sheet.MSGweakGND or "") .. 
            					(sheet.MSGweakHOL or "") .. (sheet.MSGweakICE or "") .. (sheet.MSGweakSHA or "") .. (sheet.MSGweakWAT or "").. (sheet.MSGweakWIN or "") .. (sheet.MSGweakBIO or ""));
        end, obj);

    obj._e_event3 = obj.BotaonameAddstatus:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynameAddstatus");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonameAddstatus);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event4 = obj.BotaonameCannibalize:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynameCannibalize");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonameCannibalize);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event5 = obj.BotaoaaAlarm:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaAlarm");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaAlarm);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event6 = obj.BotaoaaClone:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaClone");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaClone);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event7 = obj.BotaoaaEscape:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaEscape");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaEscape);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event8 = obj.BotaoaaImprison:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaImprison");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaImprison);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event9 = obj.BotaoaaBPrison:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaBPrison");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaBPrison);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event10 = obj.BotaoaaIPrison:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaIPrison");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaIPrison);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event11 = obj.BotaoaaSPrison:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaSPrison");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaSPrison);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event12 = obj.BotaoaaDPrison:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaDPrison");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaDPrison);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event13 = obj.BotaoaaVPrison:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaVPrison");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaVPrison);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event14 = obj.BotaoaaItemUse:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaItemUse");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaItemUse);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event15 = obj.BotaoaaRestore:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaRestore");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaRestore);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event16 = obj.BotaoaaSealStat:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityaaSealStat");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoaaSealStat);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event17 = obj.BotaomaBurrow:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitymaBurrow");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaomaBurrow);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event18 = obj.BotaomaFlight:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitymaFlight");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaomaFlight);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event19 = obj.BotaomaGround:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitymaGround");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaomaGround);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event20 = obj.BotaomaFloat:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitymaFloat");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaomaFloat);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event21 = obj.BotaomaTeleport:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitymaTeleport");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaomaTeleport);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event22 = obj.BotaomaWater:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitymaWater");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaomaWater);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event23 = obj.BotaonameAutoStat:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynameAutoStat");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonameAutoStat);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event24 = obj.BotaonameSOSStat:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynameSOSStat");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonameSOSStat);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event25 = obj.BotaonamComeback:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamComeback");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamComeback);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event26 = obj.BotaonamCritical:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamCritical");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamCritical);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event27 = obj.BotaosupLEva:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupLEva");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupLEva);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event28 = obj.BotaosupLMEva:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupLMEva");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupLMEva);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event29 = obj.BotaonamEvader:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamEvader");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamEvader);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event30 = obj.BotaonamEvasion:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamEvasion");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamEvasion);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event31 = obj.BotaonamMEvasion:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamMEvasion");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamMEvasion);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event32 = obj.BotaonamElemPot:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamElemPot");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamElemPot);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event33 = obj.BotaonamElemAbs:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamElemAbs");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamElemAbs);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event34 = obj.BotaonamElemImm:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamElemImm");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamElemImm);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event35 = obj.BotaonamElemRes:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamElemRes");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamElemRes);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event36 = obj.BotaonamElemWk:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamElemWk");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamElemWk);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event37 = obj.BotaospeBadScan:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityspeBadScan");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaospeBadScan);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event38 = obj.BotaospeNoScan:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityspeNoScan");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaospeNoScan);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event39 = obj.BotaosupHArm:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupHArm");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupHArm);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event40 = obj.BotaosupMBound:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupMBound");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupMBound);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event41 = obj.BotaosupMinion:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupMinion");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupMinion);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event42 = obj.BotaosupMRes:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupMRes");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupMRes);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event43 = obj.BotaosupNDrain:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupNDrain");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupNDrain);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event44 = obj.BotaosupRDrain:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupRDrain");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupRDrain);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event45 = obj.BotaosupXFight:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitysupXFight");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaosupXFight);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event46 = obj.BotaonamStatweak:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamStatweak");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamStatweak);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event47 = obj.BotaonamStatRes:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamStatRes");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamStatRes);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event48 = obj.BotaonamStatimm:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamStatimm");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamStatimm);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event49 = obj.BotaonamStatresC:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamStatresC");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamStatresC);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event50 = obj.BotaonamStatimmC:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynamStatimmC");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonamStatimmC);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event51 = obj.BotaoreaCounterP:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreaCounterP");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreaCounterP);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event52 = obj.BotaoreaCounterM:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreaCounterM");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreaCounterM);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event53 = obj.BotaoreaCounterS:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreaCounterS");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreaCounterS);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event54 = obj.BotaoreaCounterRD:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreaCounterRD");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreaCounterRD);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event55 = obj.BotaonameCounterStat:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitynameCounterStat");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaonameCounterStat);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event56 = obj.BotaoreCFin:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreCFin");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreCFin);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event57 = obj.BotaoreCFissUns:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreCFissUns");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreCFissUns);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event58 = obj.BotaoreRotate:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityreRotate");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoreRotate);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event59 = obj.BotaobossField:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitybossField");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaobossField);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event60 = obj.BotaofieldAttack:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldAttack");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldAttack);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event61 = obj.BotaofieldSap:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldSap");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldSap);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event62 = obj.BotaofieldItem:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldItem");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldItem);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event63 = obj.BotaofieldMagic:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldMagic");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldMagic);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event64 = obj.BotaofieldMagnetic:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldMagnetic");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldMagnetic);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event65 = obj.BotaofieldSpell:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldSpell");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldSpell);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event66 = obj.BotaofieldTech:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityfieldTech");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaofieldTech);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event67 = obj.BotaobossDecoy:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitybossDecoy");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaobossDecoy);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event68 = obj.BotaoimmStatus:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilityimmStatus");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaoimmStatus);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event69 = obj.BotaobossSlave:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitybossSlave");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaobossSlave);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event70 = obj.BotaobossSlaveN:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitybossSlaveN");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaobossSlaveN);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event71 = obj.BotaobossSlaveS:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitybossSlaveS");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaobossSlaveS);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event72 = obj.BotaobossSlaveAR:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAbilitybossSlaveAR");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.boxDetalhesDoItem.node);
            					pop:showPopupEx("right", self.BotaobossSlaveAR);
            				else
            					showMessage("Ops, erro");
            				end;
        end, obj);

    obj._e_event73 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event74 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:sort();
        end, obj);

    obj._e_event75 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode;
                        self.boxDetalhesDoItem.node = node;                    
                        self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event76 = obj.rclListaDosItens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.active and not nodeB.active) then
            				return -1;
            			elseif (not nodeA.active and nodeB.active) then
            				return 1;
            			else
            				return Utils.compareStringPtBr(nodeA.campoNome, nodeB.campoNome);
            			end;
        end, obj);

    obj._e_event77 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet== nil then 
            								return 
            								end;
            							local CustoMP = self.boxDetalhesDoItem.node.campoCustoMP or "0"
            							local mesa = Firecast.getMesaDe(sheet);
            							if (CustoMP >= 1) then
            								mesa.activeChat:enviarMensagem("/MP -" .. CustoMP);
            								end
        end, obj);

    obj._e_event78 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet== nil then return end;
            							local NomeP = sheet.baseName or "???"
            							local NomeG = self.boxDetalhesDoItem.node.campoNome or "???";
            							local TempoCarga = self.boxDetalhesDoItem.node.campoTC or 0;
            							local mesa = Firecast.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("[§B]" .. NomeP .. "[§B]" .. " carrega o golpe [§B]" .. NomeG .. "[§B] (TC " .. TempoCarga .. " )");
        end, obj);

    obj._e_event79 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet== nil then return end;
            						local mesa = Firecast.getMesaDe(sheet);
            
            						local CMP = tonumber(self.boxDetalhesDoItem.node.campoCustoMP) or 0;
            						local NOME =""	
            						if (CMP >= 0) then
            							NOME = "[§B]" .. self.boxDetalhesDoItem.node.campoNome .. "[§B] " or "[§B]Golpe[§B]";
            							end
            						if (CMP == 0) then
            							NOME = "[§B]" .. self.boxDetalhesDoItem.node.campoNome .. "[§B][§K14]; " or "[§B]Golpe[§B][§K14]; ";
            							end
            						local REPEAT = tonumber(self.boxDetalhesDoItem.node.campoRepeat) or 1
            						local STR = tonumber(sheet.valSTR) or 1;
            						local MAG = tonumber(sheet.valMAG) or 1;
            						local AGI = tonumber(sheet.valAGI) or 1;
            						local PRECP = sheet.valACC or 0;
            						local PRECM = sheet.valMACC or 0;
            						local DEXTE = sheet.valDEX or 0;
            						local MIND = sheet.valMND or 0;
            						local EXPER = sheet.valEXPERT or 0;
            						local DADOARMD = sheet.eqARMDdado or "1d1"
            						local ARMDATRIB = tonumber(sheet.eqARMDatrib) or 1;		
            						local ARMDMULT = tonumber(sheet.eqARMDmult) or 1;			
            						local MultD = 0;
            						local DADOARME = sheet.eqARMEdado or "1d1"
            						local ARMEATRIB = tonumber(sheet.eqARMEatrib) or 1;		
            						local ARMEMULT = tonumber(sheet.eqARMEmult) or 1;	
            						local MultE = 0;
            						local DADOGOLPE = self.boxDetalhesDoItem.node.dadoGolpe or "1d1"
            						local GOLPEATRIB = tonumber(self.boxDetalhesDoItem.node.atribGolpe) or 0;
            						local GOLPEMULT = tonumber(self.boxDetalhesDoItem.node.multGolpe) or 1
            						local MultG = 0;
            						local DAMAGELIM = self.boxDetalhesDoItem.node.activeBDM or false			
            						if (ARMDATRIB == 1) then			
            							MultD = (ARMDMULT)*(STR) or 0	
            							elseif (ARMDATRIB == 2) then	
            								MultD = (ARMDMULT)*(AGI) or 0	
            							elseif (ARMDATRIB == 3) then	
            								MultD = (ARMDMULT)*(MAG) or 0	
            							end			
            						if (ARMEATRIB == 1) then			
            							MultE = (ARMEMULT)*(STR) or 0	
            							elseif (ARMEATRIB == 2) then	
            								MultE = (ARMEMULT)*(AGI) or 0	
            							elseif (ARMEATRIB == 3) then	
            								MultE = (ARMEMULT)*(MAG) or 0	
            							end			
            						if (GOLPEATRIB == 1) then			
            							MultG = (GOLPEMULT)*(STR) or 1	
            							elseif (GOLPEATRIB == 2) then	
            								MultG = (GOLPEMULT)*(AGI) or 1	
            							elseif (GOLPEATRIB == 3) then	
            								MultG = (GOLPEMULT)*(MAG) or 1	
            							end	
            						local ARMA1 = Firecast.interpretarRolagem(DADOARMD);
            							  ARMA1:concatenar(MultD);
            						local ARMA2 = Firecast.interpretarRolagem(DADOARME);
            							  ARMA2:concatenar(MultE);
            						local DANOG = Firecast.interpretarRolagem(DADOGOLPE);
            							  DANOG:concatenar(MultG);
            						local enemies = {};
            						setTarget(enemies, 11, "nameEnemy");
            						local alliesA = {};
            						setTarget(alliesA, 11, "nameAlly");	
            						local selectEnemy = {};
            						setSelect(selectEnemy, 11, "ValidTarget");
            						local selectAllyG = {};
            						setSelect(selectAllyG, 11, "ValidAllyG");		
            						
            						local mobs = {};
            						for i = 1, 11, 1 do
            							if (i == 1 and enemies[1] ~= "" and selectEnemy[1] == true) then 
            								table.insert(mobs, enemies[1]); 
            								end;
            							if (i == 2 and enemies[2] ~= "" and selectEnemy[2] == true) then 
            								table.insert(mobs, enemies[2]); 
            								end;
            							if (i == 3 and enemies[3] ~= "" and selectEnemy[3] == true) then 
            								table.insert(mobs, enemies[3]); 
            								end;
            							if (i == 4 and enemies[4] ~= "" and selectEnemy[4] == true) then 
            								table.insert(mobs, enemies[4]); 
            								end;
            							if (i == 5 and enemies[5] ~= "" and selectEnemy[5] == true) then 
            								table.insert(mobs, enemies[5]); 
            								end;
            							if (i == 6 and enemies[6] ~= "" and selectEnemy[6] == true) then 
            								table.insert(mobs, enemies[6]); 
            								end;
            							if (i == 7 and enemies[7] ~= "" and selectEnemy[7] == true) then 
            								table.insert(mobs, enemies[7]); 
            								end;
            							if (i == 8 and enemies[8] ~= "" and selectEnemy[8] == true) then 
            								table.insert(mobs, enemies[8]); 
            								end;
            							if (i == 9 and enemies[9] ~= "" and selectEnemy[9] == true) then 
            								table.insert(mobs, enemies[9]); 
            								end;
            							if (i == 10 and enemies[10] ~= "" and selectEnemy[10] == true) then 
            								table.insert(mobs, enemies[10]); 
            								end;
            							if (i == 11 and enemies[11] ~= "" and selectEnemy[11] == true) then 
            								table.insert(mobs, enemies[11]); 
            								end;
            							end;
            						local allies = {};
            						for i = 1, 11, 1 do
            							if (i == 1 and alliesA[1] ~= "" and selectAllyG[1] == true) then 
            								table.insert(allies, alliesA[1]); 
            								end;
            							if (i == 2 and alliesA[2] ~= "" and selectAllyG[2] == true) then 
            								table.insert(allies, alliesA[2]); 
            								end;
            							if (i == 3 and alliesA[3] ~= "" and selectAllyG[3] == true) then 
            								table.insert(allies, alliesA[3]); 
            								end;
            							if (i == 4 and alliesA[4] ~= "" and selectAllyG[4] == true) then 
            								table.insert(allies, alliesA[4]); 
            								end;
            							if (i == 5 and alliesA[5] ~= "" and selectAllyG[5] == true) then 
            								table.insert(allies, alliesA[5]); 
            								end;
            							if (i == 6 and alliesA[6] ~= "" and selectAllyG[6] == true) then 
            								table.insert(allies, alliesA[6]); 
            								end;
            							if (i == 7 and alliesA[7] ~= "" and selectAllyG[7] == true) then 
            								table.insert(allies, alliesA[7]); 
            								end;
            							if (i == 8 and alliesA[8] ~= "" and selectAllyG[8] == true) then 
            								table.insert(allies, alliesA[8]); 
            								end;
            							if (i == 9 and alliesA[9] ~= "" and selectAllyG[9] == true) then 
            								table.insert(allies, alliesA[9]); 
            								end;
            							if (i == 10 and alliesA[10] ~= "" and selectAllyG[10] == true) then 
            								table.insert(allies, alliesA[10]); 
            								end;
            							if (i == 11 and alliesA[11] ~= "" and selectAllyG[11] == true) then 
            								table.insert(allies, alliesA[11]); 
            								end;
            						end;
            						local all = {};
            						for i = 1, 22, 1 do
            							if (i == 1 and enemies[1] ~= "") then 
            								table.insert(all, enemies[1]); 
            								end;
            							if (i == 2 and enemies[2] ~= "") then 
            								table.insert(all, enemies[2]); 
            								end;
            							if (i == 3 and enemies[3] ~= "") then 
            								table.insert(all, enemies[3]); 
            								end;
            							if (i == 4 and enemies[4] ~= "") then 
            								table.insert(all, enemies[4]); 
            								end;
            							if (i == 5 and enemies[5] ~= "") then 
            								table.insert(all, enemies[5]); 
            								end;
            							if (i == 6 and enemies[6] ~= "") then 
            								table.insert(all, enemies[6]); 
            								end;
            							if (i == 7 and enemies[7] ~= "") then 
            								table.insert(all, enemies[7]); 
            								end;
            							if (i == 8 and enemies[8] ~= "") then 
            								table.insert(all, enemies[8]); 
            								end;
            							if (i == 9 and enemies[9] ~= "") then 
            								table.insert(all, enemies[9]); 
            								end;
            							if (i == 10 and enemies[10] ~= "") then 
            								table.insert(all, enemies[10]); 
            								end;
            							if (i == 11 and enemies[11] ~= "") then 
            								table.insert(all, enemies[11]); 
            								end;
            							if (i == 12 and alliesA[1] ~= "") then 
            								table.insert(all, alliesA[1]); 
            								end;
            							if (i == 13 and alliesA[2] ~= "") then 
            								table.insert(all, alliesA[2]); 
            								end;
            							if (i == 14 and alliesA[3] ~= "") then 
            								table.insert(all, alliesA[3]); 
            								end;
            							if (i == 15 and alliesA[4] ~= "") then 
            								table.insert(all, alliesA[4]); 
            								end;
            							if (i == 16 and alliesA[5] ~= "") then 
            								table.insert(all, alliesA[5]); 
            								end;
            							if (i == 17 and alliesA[6] ~= "") then 
            								table.insert(all, alliesA[6]); 
            								end;
            							if (i == 18 and alliesA[7] ~= "") then 
            								table.insert(all, alliesA[7]); 
            								end;
            							if (i == 19 and alliesA[8] ~= "") then 
            								table.insert(all, alliesA[8]); 
            								end;
            							if (i == 20 and alliesA[9] ~= "") then 
            								table.insert(all, alliesA[9]); 
            								end;
            							if (i == 21 and alliesA[10] ~= "") then 
            								table.insert(all, alliesA[10]); 
            								end;
            							if (i == 22 and alliesA[11] ~= "") then 
            								table.insert(all, alliesA[11]); 
            								end;
            							end;
            						local SUBEVA = tonumber(self.boxDetalhesDoItem.node.fieldSubEVA) or 1
            						local MSG_SubEVA = ""
            							if (SUBEVA == 1) then 
            								MSG_SubEVA = "[-EVA]"
            								elseif (SUBEVA == 2) then 
            									MSG_SubEVA = "[-EVAM]"
            								elseif (SUBEVA == 3) then 
            									MSG_SubEVA = "[-EVA/2]"	
            								end
            						local SUBDEF = tonumber(self.boxDetalhesDoItem.node.fieldSubDEF) or 1
            						local MSG_SubDEF = ""
            							if (SUBDEF == 1) then 
            								MSG_SubDEF = "[-ARM]"
            								elseif (SUBDEF == 2) then 
            									MSG_SubDEF = "[-ARMM]"
            								elseif (SUBDEF == 3) then 
            									MSG_SubDEF = "[-ARM/2]"
            								elseif (SUBDEF == 4) then 
            									MSG_SubDEF = "[-ARM/2]"	
            								end
            						local ELDANO = tonumber(self.boxDetalhesDoItem.node.catTipo) or 1
            						MSG_DanType ="";
            						MSG_corGolpe ="";
            						if (ELDANO == 1) then 
            							MSG_DanType = " Não-Elemental";
            							MSG_corGolpe ="[§K14]";	
            							elseif (ELDANO == 2) then 
            								MSG_DanType = " Arcano";		
            								MSG_corGolpe ="[§K14]";	
            							elseif (ELDANO == 3) then 
            								MSG_DanType = " Fogo";			
            								MSG_corGolpe ="[§K4]";	
            							elseif (ELDANO == 4) then 
            								MSG_DanType = " Gelo";				
            								MSG_corGolpe ="[§K10]";	
            							elseif (ELDANO == 5) then 
            								MSG_DanType = " Água";			
            								MSG_corGolpe ="[§K12]";	
            							elseif (ELDANO == 6) then 
            								MSG_DanType = " Eletricidade"		
            								MSG_corGolpe ="[§K8]";
            							elseif (ELDANO == 7) then 
            								MSG_DanType = " Terra"			
            								MSG_corGolpe ="[§K7]";
            							elseif (ELDANO == 8) then 
            								MSG_DanType = " Vento"	
            								MSG_corGolpe ="[§K9]";
            							elseif (ELDANO == 9) then 
            								MSG_DanType = " Bio"				
            								MSG_corGolpe ="[§K13]";
            							elseif (ELDANO == 10) then 
            								MSG_DanType = " Trevas"			
            								MSG_corGolpe ="[§K14]";	
            							elseif (ELDANO == 11) then 
            								MSG_DanType = " Sagrado"			
            								MSG_corGolpe ="[§K1]";
            							elseif (ELDANO == 12) then 
            								MSG_DanType = " Recuperação"		
            								MSG_corGolpe ="[§K3]";	
            							end
            						MSG_CMP = "";
            						if (CMP > 0) then 
            							MSG_CMP = "(" .. CMP .. " MP)[§K14]; "	
            							end
            						local DANMULT = tonumber(self.boxDetalhesDoItem.node.PAtkField) or 1;
            						if (DANMULT == 0.25) then 
            							MSG_DM = "(25%)"
            							elseif (DANMULT == 0.50) then 
            								MSG_DM = "(50%)"
            							elseif (DANMULT == 0.75) then 
            								MSG_DM = "(75%)"
            							elseif (DANMULT == 1) then 
            								MSG_DM = "(100%)"
            							elseif (DANMULT == 1.25) then 
            								MSG_DM = "(125%)"
            							elseif (DANMULT == 1.50) then 
            								MSG_DM = "(150%)"
            							elseif (DANMULT == 1.75) then 
            								MSG_DM = "(175%)"
            							elseif (DANMULT == 2.00) then 
            								MSG_DM = "(200%)"
            							elseif (DANMULT == 2.25) then 
            								MSG_DM = "(225%)"
            							elseif (DANMULT == 2.50) then 
            								MSG_DM = "(250%)"
            							elseif (DANMULT == 2.75) then 
            								MSG_DM = "(275%)"
            							elseif (DANMULT == 3.00) then 
            								MSG_DM = "(300%)"
            							elseif (DANMULT == 3.25) then 
            								MSG_DM = "(325%)"
            							elseif (DANMULT == 3.50) then 
            								MSG_DM = "(350%)"
            							elseif (DANMULT == 3.75) then 
            								MSG_DM = "(375%)"
            							elseif (DANMULT == 4.00) then 
            								MSG_DM = "(400%)"
            							elseif (DANMULT == 4.25) then 
            								MSG_DM = "(425%)"
            							elseif (DANMULT == 4.50) then 
            								MSG_DM = "(450%)"	
            							end
            						local MarCRIT = tonumber(self.boxDetalhesDoItem.node.campoMargem) or 0;
            						local TriplCRIT = self.boxDetalhesDoItem.node.activeTripleCrit or false
            						local AmmoON = self.boxDetalhesDoItem.node.checkAmmo or false
            						local NOME_Ammo = self.boxDetalhesDoItem.node.campoAmmo or ""
            						MSG_Ammo = ""
            						if (AmmoON == true) then 
            							MSG_Ammo = ("([§B]Munição Especial:[§B] " .. NOME_Ammo .. "); ")	
            							end
            						local actStatus1 = self.boxDetalhesDoItem.node.activeStatus1 or false
            						local actStatus2 = self.boxDetalhesDoItem.node.activeStatus2 or false
            						local actStatus3 = self.boxDetalhesDoItem.node.activeStatus3 or false
            						local actStatus4 = self.boxDetalhesDoItem.node.activeStatus4 or false
            						local actStatus5 = self.boxDetalhesDoItem.node.activeStatus5 or false
            						local actStatus6 = self.boxDetalhesDoItem.node.activeStatus6 or false
            						local MSG_Status1="";
            						local MSG_Status2="";
            						local MSG_Status3="";
            						local MSG_Status4="";
            						local MSG_Status5="";
            						local MSG_Status6="";
            						local Status1 = tonumber(self.boxDetalhesDoItem.node.sourceStatus1) or 1
            						local rolagemStatus1;
            						local NomeStatus1 = self.boxDetalhesDoItem.node.nameStatus1 or "Status"
            						local SubStatus1 = tonumber(self.boxDetalhesDoItem.node.reduceStatus1) or 3
            						MSG_SubStatus1 = "";
            						if SubStatus1 == 1 then 
            							MSG_SubStatus1 = "[-EVA]" 
            							end
            						if SubStatus1 == 2 then 
            							MSG_SubStatus1 = "[-EVAM]" 
            							end			
            						local Status2 = tonumber(self.boxDetalhesDoItem.node.sourceStatus2) or 1
            						local rolagemStatus2;
            						local NomeStatus2 = self.boxDetalhesDoItem.node.nameStatus2 or "Status"
            						local SubStatus2 = tonumber(self.boxDetalhesDoItem.node.reduceStatus2) or 3
            						MSG_SubStatus2 = "";
            						if SubStatus2 == 1 then 
            							MSG_SubStatus2 = "[-EVA]" 
            							end
            						if SubStatus2 == 2 then 
            							MSG_SubStatus2 = "[-EVAM]" 
            							end
            						local Status3 = tonumber(self.boxDetalhesDoItem.node.sourceStatus3) or 1
            						local rolagemStatus3;
            						local NomeStatus3 = self.boxDetalhesDoItem.node.nameStatus3 or "Status"
            						local SubStatus3 = tonumber(self.boxDetalhesDoItem.node.reduceStatus3) or 3
            						MSG_SubStatus3 = "";
            						if SubStatus3 == 1 then 
            							MSG_SubStatus3 = "[-EVA]" 
            							end
            						if SubStatus3 == 2 then 
            							MSG_SubStatus3 = "[-EVAM]" 
            							end			
            						local Status4 = tonumber(self.boxDetalhesDoItem.node.sourceStatus4) or 1
            						local rolagemStatus4;
            						local NomeStatus4 = self.boxDetalhesDoItem.node.nameStatus4 or "Status"
            						local SubStatus4 = tonumber(self.boxDetalhesDoItem.node.reduceStatus4) or 3
            						MSG_SubStatus4 = "";
            						if SubStatus4 == 1 then 
            							MSG_SubStatus4 = "[-EVA]" 
            							end
            						if SubStatus4 == 2 then 
            							MSG_SubStatus4 = "[-EVAM]" 
            							end		
            						local Status5 = tonumber(self.boxDetalhesDoItem.node.sourceStatus5) or 1
            						local rolagemStatus5;
            						local NomeStatus5 = self.boxDetalhesDoItem.node.nameStatus5 or "Status"
            						local SubStatus5 = tonumber(self.boxDetalhesDoItem.node.reduceStatus5) or 3
            						MSG_SubStatus5 = "";
            						if SubStatus5 == 1 then 
            							MSG_SubStatus5 = "[-EVA]" 
            							end
            						if SubStatus5 == 2 then 
            							MSG_SubStatus5 = "[-EVAM]" 
            							end		
            						local Status6 = tonumber(self.boxDetalhesDoItem.node.sourceStatus6) or 1
            						local rolagemStatus6;
            						local NomeStatus6 = self.boxDetalhesDoItem.node.nameStatus6 or "Status"
            						local SubStatus6 = tonumber(self.boxDetalhesDoItem.node.reduceStatus6) or 3
            						MSG_SubStatus6 = "";
            						if SubStatus6 == 1 then 
            							MSG_SubStatus6 = "[-EVA]" 
            							end
            						if SubStatus6 == 2 then 
            							MSG_SubStatus6 = "[-EVAM]" 
            							end
            						local Rstatus = {};
            						local STATRANDOM = self.boxDetalhesDoItem.node.activeSRANDOM or false
            						for i = 1, 6, 1 do
            							if (i == 1 and NomeStatus1 ~= "" and actStatus1 == true) then 
            								table.insert(Rstatus, NomeStatus1); 
            								end;
            							if (i == 2 and NomeStatus2 ~= "" and actStatus2 == true) then 
            								table.insert(Rstatus, NomeStatus2); 
            								end;
            							if (i == 3 and NomeStatus3 ~= "" and actStatus3 == true) then 
            								table.insert(Rstatus, NomeStatus3); 
            								end;
            							if (i == 4 and NomeStatus4 ~= "" and actStatus4 == true) then 
            								table.insert(Rstatus, NomeStatus4); 
            								end;
            							if (i == 5 and NomeStatus5 ~= "" and actStatus5 == true) then 
            								table.insert(Rstatus, NomeStatus5); 
            								end;
            							if (i == 6 and NomeStatus6 ~= "" and actStatus6 == true) then 
            								table.insert(Rstatus, NomeStatus6); 
            								end;
            						end;
            							
            						ALVO = tonumber(self.boxDetalhesDoItem.node.catAlvo) or 1;
            						if (ALVO == 1) then
            							local MSG_TARGET = "";
            							local AlvoSelect = tonumber(sheet.singleGB) or 1;
            							if (AlvoSelect == 1) then 
            								MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[1] .. "; ")
            								elseif (AlvoSelect == 2) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[2] .. "; ")
            								elseif (AlvoSelect == 3) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[3] .. "; ")
            								elseif (AlvoSelect == 4) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[4] .. "; ")
            								elseif (AlvoSelect == 5) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[5] .. "; ")
            								elseif (AlvoSelect == 6) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[6] .. "; ")
            								elseif (AlvoSelect == 7) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[7] .. "; ")
            								elseif (AlvoSelect == 8) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[8] .. "; ")
            								elseif (AlvoSelect == 9) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[9] .. "; ")
            								elseif (AlvoSelect == 10) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[10] .. "; ")
            								elseif (AlvoSelect == 11) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. enemies[11] .. "; ")	
            								end
            							if (REPEAT >= 2) then	
            								mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET)
            								end
            							for i = 1, REPEAT, 1 do
            								bonCRIT = 0;
            								MSG_CRIT= "";											
            								if ((STATRANDOM) == true) and (#Rstatus > 0) then
            									local ACTIVESTAT = tonumber(math.random(1,#Rstatus));	
            									MSG_Status1=""		
            									MSG_Status2=""	
            									MSG_Status3=""	
            									MSG_Status4=""	
            									MSG_Status5=""	
            									MSG_Status6=""						
            									actStatus1 = false;
            									actStatus2 = false;
            									actStatus3 = false;
            									actStatus4 = false;
            									actStatus5 = false;
            									actStatus6 = false;									
            									if tonumber(ACTIVESTAT) == 1 then 
            										actStatus1 = true;
            									elseif tonumber(ACTIVESTAT) == 2 then 
            										actStatus2 = true;
            									elseif tonumber(ACTIVESTAT) == 3 then 
            										actStatus3 = true;
            									elseif tonumber(ACTIVESTAT) == 4 then 
            										actStatus4 = true;
            									elseif tonumber(ACTIVESTAT) == 5 then 
            										actStatus5 = true;
            									elseif tonumber(ACTIVESTAT) == 6 then 
            										actStatus6 = true;
            										end	
            									end	
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            										bonCRIT=1;	
            										MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            										end
            									if (TriplCRIT == true) then 
            										bonCRIT=2; 
            										MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)
            										end
            									end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end				
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then 
            									MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	
            									end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            									if (DANFINAL >= 999 and DAMAGELIM == false) then 
            										DANFINAL = 999 	
            										end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            								if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            								if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            								if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end	
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            								if (actStatus1 == true) then
            									local DadoStatus1 = math.random(1,100);
            									rolagemStatus1 = getRollStatus(Status1, DadoStatus1, PRECM, DEXTE, MIND, EXPER);				
            									if (5 >= Status1) then 					
            										MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. MSG_SubStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 >= 6 and 8 >= Status1) then 
            											MSG_Status1 = "CdS% de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 == 9) then 					
            											MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: Auto (" .. DadoStatus1 .. "); ";
            										end	
            									end							
            								if (actStatus2 == true) then
            									local DadoStatus2 = math.random(1,100);
            									rolagemStatus2 = getRollStatus(Status2, DadoStatus2, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status2) then 					
            										MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. MSG_SubStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 >= 6 and 8 >= Status2) then 
            											MSG_Status2 = "CdS% de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 == 9) then 					
            											MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: Auto (" .. DadoStatus2 .. "); ";
            										end
            									end		
            								if (actStatus3 == true) then
            									local DadoStatus3 = math.random(1,100);
            									rolagemStatus3 = getRollStatus(Status3, DadoStatus3, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status3) then 					
            										MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. MSG_SubStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 >= 6 and 8 >= Status3) then 
            											MSG_Status3 = "CdS% de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 == 9) then 					
            											MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: Auto (" .. DadoStatus3 .. "); ";
            										end
            									end	
            								if (actStatus4 == true) then
            									local DadoStatus4 = math.random(1,100);
            									rolagemStatus4 = getRollStatus(Status4, DadoStatus4, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status4) then 					
            										MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. MSG_SubStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 >= 6 and 8 >= Status4) then 
            											MSG_Status4 = "CdS% de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 == 9) then 					
            											MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: Auto (" .. DadoStatus4 .. ");";
            										end
            									end		
            								if (actStatus5 == true) then
            									local DadoStatus5 = math.random(1,100);
            									rolagemStatus5 = getRollStatus(Status5, DadoStatus5, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status5) then 					
            										MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. MSG_SubStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 >= 6 and 8 >= Status5) then 
            											MSG_Status5 = "CdS% de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 == 9) then 					
            											MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: Auto (" .. DadoStatus5 .. ");";
            										end
            									end		
            								if (actStatus6 == true) then
            									local DadoStatus6 = math.random(1,100);
            									rolagemStatus6 = getRollStatus(Status6, DadoStatus6, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status6) then 					
            										MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. MSG_SubStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 >= 6 and 8 >= Status6) then 
            											MSG_Status6 = "CdS% de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 == 9) then 					
            											MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: Auto (" .. DadoStatus6 .. ");";
            										end
            									end		
            								if (REPEAT == 1) then
            									mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end
            								if (REPEAT >= 2) then	
            									mesa.activeChat:enviarMensagem("[§K14]#" .. i .. "; " .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end	
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end									
            								end
            							end
            
            						if (ALVO == 2) then
            							local MSG_TARGET = ""
            							local AlvoSelect = tonumber(self.boxDetalhesDoItem.node.singleAllyB) or 1;
            							if (AlvoSelect == 1) then 
            								MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[1] .. "; ")
            								elseif (AlvoSelect == 2) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[2] .. "; ")	
            								elseif (AlvoSelect == 3) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[3] .. "; ")	
            								elseif (AlvoSelect == 4) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[4] .. "; ")	
            								elseif (AlvoSelect == 5) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[5] .. "; ")	
            								elseif (AlvoSelect == 6) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[6] .. "; ")	
            								elseif (AlvoSelect == 7) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[7] .. "; ")	
            								elseif (AlvoSelect == 8) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[8] .. "; ")	
            								elseif (AlvoSelect == 9) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[9] .. "; ")	
            								elseif (AlvoSelect == 10) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[10] .. "; ")	
            								elseif (AlvoSelect == 11) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. alliesA[11] .. "; ")	
            								end
            							if (REPEAT >= 2) then	
            								mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET)
            								end
            							for i = 1, REPEAT, 1 do
            								bonCRIT = 0;
            								MSG_CRIT= "";	
            								if ((STATRANDOM) == true) and (#Rstatus > 0) then
            									local ACTIVESTAT = tonumber(math.random(1,#Rstatus));	
            									MSG_Status1=""		
            									MSG_Status2=""	
            									MSG_Status3=""	
            									MSG_Status4=""	
            									MSG_Status5=""	
            									MSG_Status6=""						
            									actStatus1 = false;
            									actStatus2 = false;
            									actStatus3 = false;
            									actStatus4 = false;
            									actStatus5 = false;
            									actStatus6 = false;									
            									if tonumber(ACTIVESTAT) == 1 then 
            										actStatus1 = true;
            									elseif tonumber(ACTIVESTAT) == 2 then 
            										actStatus2 = true;
            									elseif tonumber(ACTIVESTAT) == 3 then 
            										actStatus3 = true;
            									elseif tonumber(ACTIVESTAT) == 4 then 
            										actStatus4 = true;
            									elseif tonumber(ACTIVESTAT) == 5 then 
            										actStatus5 = true;
            									elseif tonumber(ACTIVESTAT) == 6 then 
            										actStatus6 = true;
            										end	
            									end									
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            										bonCRIT=1;	
            										MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            										end
            									if (TriplCRIT == true) then 
            										bonCRIT=2; 
            										MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)end
            										end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end				
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then 
            									MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	
            									end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            								if (DANFINAL >= 999 and DAMAGELIM == false) then 
            									DANFINAL = 999 	
            									end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            									if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            									if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            									if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end					
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            								if (actStatus1 == true) then
            									MSG_Status1 = ("Recebe [§B]" .. NomeStatus1 .. "[§B]; ");
            									end							
            								if (actStatus2 == true) then
            									MSG_Status2 = ("Recebe [§B]" .. NomeStatus2 .. "[§B]; ");
            									end	
            								if (actStatus3 == true) then
            									MSG_Status3 = ("Recebe [§B]" .. NomeStatus3 .. "[§B]; ");
            									end	
            								if (actStatus4 == true) then
            									MSG_Status4 = ("Recebe [§B]" .. NomeStatus4 .. "[§B]; ");
            									end	
            								if (actStatus5 == true) then
            									MSG_Status5 = ("Recebe [§B]" .. NomeStatus5 .. "[§B]; ");
            									end	
            								if (actStatus6 == true) then
            									MSG_Status6 = ("Recebe [§B]" .. NomeStatus6 .. "[§B]; ");
            									end		
            								if (REPEAT == 1) then
            									mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									elseif (REPEAT >= 2) then	
            										mesa.activeChat:enviarMensagem("[§K14]#" .. i .. "; " .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end		
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end	
            								end
            							end
            
            						if (ALVO == 3) then
            							local MSG_TARGET = ""
            							if (REPEAT >= 2) then	
            								mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET)
            								end
            							for i = 1, REPEAT, 1 do
            								local bonCRIT = 0;
            								local MSG_CRIT = "";
            								local m = math.random(1,#mobs);
            								if (m == 1) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 2) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 3) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 4) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 5) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 6) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 7) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 8) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 9) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 10) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									elseif (m == 11) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[m] .. "; ")	
            									end
            								if ((STATRANDOM) == true) and (#Rstatus > 0) then
            									local ACTIVESTAT = tonumber(math.random(1,#Rstatus));	
            									MSG_Status1=""		
            									MSG_Status2=""	
            									MSG_Status3=""	
            									MSG_Status4=""	
            									MSG_Status5=""	
            									MSG_Status6=""						
            									actStatus1 = false;
            									actStatus2 = false;
            									actStatus3 = false;
            									actStatus4 = false;
            									actStatus5 = false;
            									actStatus6 = false;									
            									if tonumber(ACTIVESTAT) == 1 then 
            										actStatus1 = true;
            									elseif tonumber(ACTIVESTAT) == 2 then 
            										actStatus2 = true;
            									elseif tonumber(ACTIVESTAT) == 3 then 
            										actStatus3 = true;
            									elseif tonumber(ACTIVESTAT) == 4 then 
            										actStatus4 = true;
            									elseif tonumber(ACTIVESTAT) == 5 then 
            										actStatus5 = true;
            									elseif tonumber(ACTIVESTAT) == 6 then 
            										actStatus6 = true;
            										end	
            									end											
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            									bonCRIT=1;	
            									MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            									end
            								if (TriplCRIT == true) then bonCRIT=2; 
            									MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)end
            									end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end	
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then 
            									MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	
            									end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado	
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            								if (DANFINAL >= 999 and DAMAGELIM == false) then 
            									DANFINAL = 999 	
            									end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            								if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            								if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            								if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end	
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            								if (actStatus1 == true) then
            									local DadoStatus1 = math.random(1,100);
            									rolagemStatus1 = getRollStatus(Status1, DadoStatus1, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status1) then 					
            										MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. MSG_SubStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 >= 6 and 8 >= Status1) then 
            											MSG_Status1 = "CdS% de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 == 9) then 					
            											MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: Auto (" .. DadoStatus1 .. "); ";
            										end
            									end	
            										
            								if (actStatus2 == true) then
            									local DadoStatus2 = math.random(1,100);
            									rolagemStatus2 = getRollStatus(Status2, DadoStatus2, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status2) then 					
            										MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. MSG_SubStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 >= 6 and 8 >= Status2) then 
            											MSG_Status2 = "CdS% de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 == 9) then 					
            											MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: Auto (" .. DadoStatus2 .. "); ";
            										end
            									end		
            								if (actStatus3 == true) then
            									local DadoStatus3 = math.random(1,100);
            									rolagemStatus3 = getRollStatus(Status3, DadoStatus3, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status3) then 					
            										MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. MSG_SubStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 >= 6 and 8 >= Status3) then 
            											MSG_Status3 = "CdS% de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 == 9) then 					
            											MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: Auto (" .. DadoStatus3 .. "); ";
            										end
            									end	
            								if (actStatus4 == true) then
            									local DadoStatus4 = math.random(1,100);
            									rolagemStatus4 = getRollStatus(Status4, DadoStatus4, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status4) then 					
            										MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. MSG_SubStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 >= 6 and 8 >= Status4) then 
            											MSG_Status4 = "CdS% de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 == 9) then 					
            											MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: Auto (" .. DadoStatus4 .. ");";
            										end
            									end		
            								if (actStatus5 == true) then
            									local DadoStatus5 = math.random(1,100);
            									rolagemStatus5 = getRollStatus(Status5, DadoStatus5, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status5) then 					
            										MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. MSG_SubStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 >= 6 and 8 >= Status5) then 
            											MSG_Status5 = "CdS% de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 == 9) then 					
            											MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: Auto (" .. DadoStatus5 .. ");";
            										end
            									end		
            								if (actStatus6 == true) then
            									local DadoStatus6 = math.random(1,100);
            									rolagemStatus6 = getRollStatus(Status6, DadoStatus6, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status6) then 					
            										MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. MSG_SubStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 >= 6 and 8 >= Status6) then 
            											MSG_Status6 = "CdS% de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 == 9) then 					
            											MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: Auto (" .. DadoStatus6 .. ");";
            										end
            									end		
            								if (REPEAT == 1) then
            									mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									elseif (REPEAT >= 2) then	
            										mesa.activeChat:enviarMensagem("[§K14]#" .. i .. "; " .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end		
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end	
            								end
            							end
            				
            						if (ALVO == 4) then
            							local MSG_TARGET = ""
            							mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP)
            							for j = 1, #mobs do
            								local bonCRIT = 0;
            								local MSG_CRIT = "";
            								if (j == 1) then 
            								MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 2) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 3) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 4) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 5) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 6) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 7) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 8) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 9) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 10) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									elseif (j == 11) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. mobs[j] .. "; ")	
            									end	
            								if ((STATRANDOM) == true) and (#Rstatus > 0) then
            									local ACTIVESTAT = tonumber(math.random(1,#Rstatus));	
            									MSG_Status1=""		
            									MSG_Status2=""	
            									MSG_Status3=""	
            									MSG_Status4=""	
            									MSG_Status5=""	
            									MSG_Status6=""						
            									actStatus1 = false;
            									actStatus2 = false;
            									actStatus3 = false;
            									actStatus4 = false;
            									actStatus5 = false;
            									actStatus6 = false;									
            									if tonumber(ACTIVESTAT) == 1 then 
            										actStatus1 = true;
            									elseif tonumber(ACTIVESTAT) == 2 then 
            										actStatus2 = true;
            									elseif tonumber(ACTIVESTAT) == 3 then 
            										actStatus3 = true;
            									elseif tonumber(ACTIVESTAT) == 4 then 
            										actStatus4 = true;
            									elseif tonumber(ACTIVESTAT) == 5 then 
            										actStatus5 = true;
            									elseif tonumber(ACTIVESTAT) == 6 then 
            										actStatus6 = true;
            										end	
            									end							
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								bonCRIT = 0;
            								MSG_CRIT ="";
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            										bonCRIT=1;	
            										MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            										end
            									if (TriplCRIT == true) then 
            										bonCRIT=2; 
            										MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)
            										end
            									end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end			
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado	
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            								if (DANFINAL >= 999 and DAMAGELIM == false) then 
            									DANFINAL = 999 	
            									end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            								if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            								if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            								if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end	
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            
            								if (actStatus1 == true) then
            									local DadoStatus1 = math.random(1,100);
            									rolagemStatus1 = getRollStatus(Status1, DadoStatus1, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status1) then 					
            										MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. MSG_SubStatus1 .. " (" .. DadoStatus1 .. "); ";
            									elseif (Status1 >= 6 and 8 >= Status1) then 
            										MSG_Status1 = "CdS% de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. " (" .. DadoStatus1 .. "); ";
            									elseif (Status1 == 9) then 					
            										MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: Auto (" .. DadoStatus1 .. "); ";
            										end
            								end	
            										
            								if (actStatus2 == true) then
            									local DadoStatus2 = math.random(1,100);
            									rolagemStatus2 = getRollStatus(Status2, DadoStatus2, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status2) then 					
            										MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. MSG_SubStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 >= 6 and 8 >= Status2) then 
            											MSG_Status2 = "CdS% de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 == 9) then 					
            											MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: Auto (" .. DadoStatus2 .. "); ";
            										end
            									end		
            								if (actStatus3 == true) then
            									local DadoStatus3 = math.random(1,100);
            									rolagemStatus3 = getRollStatus(Status3, DadoStatus3, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status3) then 					
            										MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. MSG_SubStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 >= 6 and 8 >= Status3) then 
            											MSG_Status3 = "CdS% de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 == 9) then 					
            											MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: Auto (" .. DadoStatus3 .. "); ";
            										end
            									end	
            								if (actStatus4 == true) then
            									local DadoStatus4 = math.random(1,100);
            									rolagemStatus4 = getRollStatus(Status4, DadoStatus4, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status4) then 					
            										MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. MSG_SubStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 >= 6 and 8 >= Status4) then 
            											MSG_Status4 = "CdS% de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 == 9) then 					
            											MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: Auto (" .. DadoStatus4 .. ");";
            										end
            									end		
            								if (actStatus5 == true) then
            									local DadoStatus5 = math.random(1,100);
            									rolagemStatus5 = getRollStatus(Status5, DadoStatus5, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status5) then 					
            										MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. MSG_SubStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 >= 6 and 8 >= Status5) then 
            											MSG_Status5 = "CdS% de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 == 9) then 					
            											MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: Auto (" .. DadoStatus5 .. ");";
            										end
            									end		
            								if (actStatus6 == true) then
            									local DadoStatus6 = math.random(1,100);
            									rolagemStatus6 = getRollStatus(Status6, DadoStatus6, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status6) then 					
            										MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. MSG_SubStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 >= 6 and 8 >= Status6) then 
            											MSG_Status6 = "CdS% de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 == 9) then 					
            											MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: Auto (" .. DadoStatus6 .. ");";
            										end
            									end		
            								mesa.activeChat:enviarMensagem("[§K14]" .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end	
            								end
            							end
            
            						if (ALVO == 5) then
            							local MSG_TARGET = ""
            							mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET)
            							for k = 1, #allies do
            							local bonCRIT = 0;
            							local MSG_CRIT = "";
            								if (k == 1) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 2) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 3) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 4) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 5) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 6) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 7) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 8) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 9) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 10) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									elseif (k == 11) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. allies[k] .. "; ")	
            									end					
            								if ((STATRANDOM) == true) and (#Rstatus > 0) then
            									local ACTIVESTAT = tonumber(math.random(1,#Rstatus));	
            									MSG_Status1=""		
            									MSG_Status2=""	
            									MSG_Status3=""	
            									MSG_Status4=""	
            									MSG_Status5=""	
            									MSG_Status6=""						
            									actStatus1 = false;
            									actStatus2 = false;
            									actStatus3 = false;
            									actStatus4 = false;
            									actStatus5 = false;
            									actStatus6 = false;									
            									if tonumber(ACTIVESTAT) == 1 then 
            										actStatus1 = true;
            									elseif tonumber(ACTIVESTAT) == 2 then 
            										actStatus2 = true;
            									elseif tonumber(ACTIVESTAT) == 3 then 
            										actStatus3 = true;
            									elseif tonumber(ACTIVESTAT) == 4 then 
            										actStatus4 = true;
            									elseif tonumber(ACTIVESTAT) == 5 then 
            										actStatus5 = true;
            									elseif tonumber(ACTIVESTAT) == 6 then 
            										actStatus6 = true;
            										end	
            									end	
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            										bonCRIT=1;	
            										MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            										end
            									if (TriplCRIT == true) then 
            										bonCRIT=2; 
            										MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)
            										end
            									end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end			
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado	
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            								if (DANFINAL >= 999 and DAMAGELIM == false) then 
            									DANFINAL = 999 	
            									end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            								if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            								if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            								if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end		
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            								if (actStatus1 == true) then
            									MSG_Status1 = ("Recebe [§B]" .. NomeStatus1 .. "[§B]; ");
            									end	
            								if (actStatus2 == true) then
            									MSG_Status2 = ("Recebe [§B]" .. NomeStatus2 .. "[§B]; ");
            									end	
            								if (actStatus3 == true) then
            									MSG_Status3 = ("Recebe [§B]" .. NomeStatus3 .. "[§B]; ");
            									end	
            								if (actStatus4 == true) then
            									MSG_Status4 = ("Recebe [§B]" .. NomeStatus4 .. "[§B]; ");
            									end	
            								if (actStatus5 == true) then
            									MSG_Status5 = ("Recebe [§B]" .. NomeStatus5 .. "[§B]; ");
            									end	
            								if (actStatus6 == true) then
            									MSG_Status6 = ("Recebe [§B]" .. NomeStatus6 .. "[§B]; ");
            									end		
            							
            								if (ELDANO ~= 12) then
            									mesa.activeChat:enviarMensagem("[§K14]" .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end
            								if (ELDANO == 12) then 
            									mesa.activeChat:enviarMensagem("[§K14]" .. MSG_TARGET .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end	
            								end
            							end
            
            						if (ALVO == 6) then
            							local MSG_TARGET = ""
            							mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP)
            							for j = 1, #all  do
            								local bonCRIT = 0;
            								local MSG_CRIT = "";
            								if (j == 1) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 2) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 3) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 4) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 5) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 6) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 7) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 8) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 9) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 10) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 11) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 12) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 13) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 14) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 15) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 16) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 17) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 18) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 19) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 20) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 21) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									elseif (j == 22) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[j] .. "; ")	
            									end		
            								if ((STATRANDOM) == true) and (#Rstatus > 0) then
            									local ACTIVESTAT = tonumber(math.random(1,#Rstatus));	
            									MSG_Status1=""		
            									MSG_Status2=""	
            									MSG_Status3=""	
            									MSG_Status4=""	
            									MSG_Status5=""	
            									MSG_Status6=""						
            									actStatus1 = false;
            									actStatus2 = false;
            									actStatus3 = false;
            									actStatus4 = false;
            									actStatus5 = false;
            									actStatus6 = false;									
            									if tonumber(ACTIVESTAT) == 1 then 
            										actStatus1 = true;
            									elseif tonumber(ACTIVESTAT) == 2 then 
            										actStatus2 = true;
            									elseif tonumber(ACTIVESTAT) == 3 then 
            										actStatus3 = true;
            									elseif tonumber(ACTIVESTAT) == 4 then 
            										actStatus4 = true;
            									elseif tonumber(ACTIVESTAT) == 5 then 
            										actStatus5 = true;
            									elseif tonumber(ACTIVESTAT) == 6 then 
            										actStatus6 = true;
            										end	
            									end	
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            										bonCRIT=1;	
            										MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            										end
            									if (TriplCRIT == true) then 
            										bonCRIT=2; 
            										MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)
            										end
            									end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end			
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado	
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            								if (DANFINAL >= 999 and DAMAGELIM == false) then 
            									DANFINAL = 999 	
            									end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            								if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            								if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            								if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end	
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            								if (actStatus1 == true) then
            									local DadoStatus1 = math.random(1,100);
            									rolagemStatus1 = getRollStatus(Status1, DadoStatus1, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status1) then 					
            										MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. MSG_SubStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 >= 6 and 8 >= Status1) then 
            											MSG_Status1 = "CdS% de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 == 9) then 					
            											MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: Auto (" .. DadoStatus1 .. "); ";
            										end
            									end	
            										
            								if (actStatus2 == true) then
            									local DadoStatus2 = math.random(1,100);
            										if SubStatus2 == 2 then MSG_SubStatus2 = "[-EVAM]" end
            									rolagemStatus2 = getRollStatus(Status2, DadoStatus2, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status2) then 					
            										MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. MSG_SubStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 >= 6 and 8 >= Status2) then 
            											MSG_Status2 = "CdS% de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 == 9) then 					
            											MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: Auto (" .. DadoStatus2 .. "); ";
            										end
            									end		
            								if (actStatus3 == true) then
            									local DadoStatus3 = math.random(1,100);
            									rolagemStatus3 = getRollStatus(Status3, DadoStatus3, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status3) then 					
            										MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. MSG_SubStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 >= 6 and 8 >= Status3) then 
            											MSG_Status3 = "CdS% de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 == 9) then 					
            											MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: Auto (" .. DadoStatus3 .. "); ";
            										end
            									end	
            								if (actStatus4 == true) then
            									local DadoStatus4 = math.random(1,100);
            									rolagemStatus4 = getRollStatus(Status4, DadoStatus4, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status4) then 					
            										MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. MSG_SubStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 >= 6 and 8 >= Status4) then 
            											MSG_Status4 = "CdS% de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 == 9) then 					
            											MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: Auto (" .. DadoStatus4 .. ");";
            										end
            									end		
            								if (actStatus5 == true) then
            									local DadoStatus5 = math.random(1,100);
            									rolagemStatus5 = getRollStatus(Status5, DadoStatus5, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status5) then 					
            										MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. MSG_SubStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 >= 6 and 8 >= Status5) then 
            											MSG_Status5 = "CdS% de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 == 9) then 					
            											MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: Auto (" .. DadoStatus5 .. ");";
            										end
            									end		
            								if (actStatus6 == true) then
            									local DadoStatus6 = math.random(1,100);
            									rolagemStatus6 = getRollStatus(Status6, DadoStatus6, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status6) then 					
            										MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. MSG_SubStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 >= 6 and 8 >= Status6) then 
            											MSG_Status6 = "CdS% de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 == 9) then 					
            											MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: Auto (" .. DadoStatus6 .. ");";
            										end
            									end		
            								mesa.activeChat:enviarMensagem("[§K14]" .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end	
            								end
            							end
            
            						if (ALVO == 7) then
            							local MSG_TARGET = ""
            							if (REPEAT >= 2) then	
            								mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET)
            								end
            							for i = 1, REPEAT, 1 do
            							local m = math.random(1,#all);
            								if (m == 1) then 
            									MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 2) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 3) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 4) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 5) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 6) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 7) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 8) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 9) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 10) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 11) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 12) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 13) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 14) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 15) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 16) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 17) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 18) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 19) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 20) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 21) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									elseif (m == 22) then 
            										MSG_TARGET = ("[§B]Alvo:[§B] " .. all[m] .. "; ")	
            									end				
            								bonCRIT = 0;
            								MSG_CRIT= "";			
            								local ACERTO = tonumber(self.boxDetalhesDoItem.node.catAcerto) or 1;
            								local DadoAcerto = math.random(1,100);
            								if (MarCRIT >= 1) then
            									if (MarCRIT >= DadoAcerto) then 
            										bonCRIT=1;	
            										MSG_CRIT = ("[§K9](CRIT)" .. MSG_corGolpe)	
            										end
            									if (TriplCRIT == true) then 
            										bonCRIT=2; 
            										MSG_CRIT = ("[§K9](3xCRIT)" .. MSG_corGolpe)
            										end
            									end
            								local rolagemAcerto = 0;
            								if (ACERTO == 1) then	
            									rolagemAcerto = PRECP - DadoAcerto;		
            									elseif (ACERTO == 2) then	
            										rolagemAcerto = PRECM - DadoAcerto;
            									elseif (ACERTO == 4) then	
            										rolagemAcerto = math.floor((PRECP - DadoAcerto)/2);	
            									end			
            								MSG_ACERTO = "[§B]Acerto:[§B] " .. rolagemAcerto .. MSG_SubEVA .. "[" .. DadoAcerto .. "]; "
            								if (ACERTO == 3) then 
            									MSG_ACERTO = "[§B]Acerto:[§B] Auto [" .. DadoAcerto .. "]; "	
            									end
            								local TIPODANO = tonumber(self.boxDetalhesDoItem.node.AtkTypeF or 1)
            								local DanoCALC = 0;
            								if (TIPODANO == 3) then
            									ARMA1:rolarLocalmente()		
            									DanoCALC = ARMA1.resultado	
            									elseif (TIPODANO == 4) then
            										ARMA2:rolarLocalmente()		
            										DanoCALC = ARMA2.resultado	
            									elseif (TIPODANO == 2) then
            										DANOG:rolarLocalmente()		
            										DanoCALC = DANOG.resultado	
            									end
            								DANFINAL = math.floor((DANMULT+bonCRIT)*DanoCALC)
            								if (DANFINAL >= 999 and DAMAGELIM == false) then 
            									DANFINAL = 999 	
            									end;
            								DANWEAK = math.floor((DANMULT+bonCRIT+0.5)*DanoCALC)
            								if (DANWEAK >= 999 and DAMAGELIM == false) then 
            									DANWEAK = 999 	
            									end;
            								DAN75 = math.floor((DANMULT+bonCRIT-0.25)*DanoCALC)
            								if (DAN75 >= 999 and DAMAGELIM == false) then 
            									DAN75 = 999 	
            									end;
            								DAN125 = math.floor((DANMULT+bonCRIT+0.25)*DanoCALC)
            								if (DAN125 >= 999 and DAMAGELIM == false) then 
            									DAN125 = 999 	
            									end;
            								if (2 >= ELDANO) then
            									MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; ")
            									elseif (ELDANO >= 3 and 11 >= ELDANO) then
            										MSG_DANO = ("[§B]Dano: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_CRIT .. MSG_DM .. MSG_SubDEF .. MSG_DanType .. "[§K14]; [§B]Vs Weak: [§B]" .. MSG_corGolpe .. DANWEAK .. "[§K14]; ")
            									elseif (ELDANO == 12) then
            										MSG_DANO = ("[§B]Restaura: [§B]" .. MSG_corGolpe .. DANFINAL .. MSG_DM .. "[§K14]; [§B][§K4]-25%:[§K14] " .. DAN75 .. "[§K14]; [§B][§K9]+25%:[§K14] " .. DAN125 )
            									end	
            								if (TIPODANO == 1) then
            									MSG_DANO ="";
            									end
            								if (actStatus1 == true) then
            									local DadoStatus1 = math.random(1,100);
            									rolagemStatus1 = getRollStatus(Status1, DadoStatus1, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status1) then 					
            										MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. MSG_SubStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 >= 6 and 8 >= Status1) then 
            											MSG_Status1 = "CdS% de [§B]" .. NomeStatus1 .. "[§B]: " .. rolagemStatus1 .. " (" .. DadoStatus1 .. "); ";
            										elseif (Status1 == 9) then 					
            											MSG_Status1 = "CdS de [§B]" .. NomeStatus1 .. "[§B]: Auto (" .. DadoStatus1 .. "); ";
            										end
            									end	
            										
            								if (actStatus2 == true) then
            									local DadoStatus2 = math.random(1,100);
            										if SubStatus2 == 2 then MSG_SubStatus2 = "[-EVAM]" end
            									rolagemStatus2 = getRollStatus(Status2, DadoStatus2, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status2) then 					
            										MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. MSG_SubStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 >= 6 and 8 >= Status2) then 
            											MSG_Status2 = "CdS% de [§B]" .. NomeStatus2 .. "[§B]: " .. rolagemStatus2 .. " (" .. DadoStatus2 .. "); ";
            										elseif (Status2 == 9) then 					
            											MSG_Status2 = "CdS de [§B]" .. NomeStatus2 .. "[§B]: Auto (" .. DadoStatus2 .. "); ";
            										end
            									end		
            								if (actStatus3 == true) then
            									local DadoStatus3 = math.random(1,100);
            									rolagemStatus3 = getRollStatus(Status3, DadoStatus3, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status3) then 					
            										MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. MSG_SubStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 >= 6 and 8 >= Status3) then 
            											MSG_Status3 = "CdS% de [§B]" .. NomeStatus3 .. "[§B]: " .. rolagemStatus3 .. " (" .. DadoStatus3 .. "); ";
            										elseif (Status3 == 9) then 					
            											MSG_Status3 = "CdS de [§B]" .. NomeStatus3 .. "[§B]: Auto (" .. DadoStatus3 .. "); ";
            										end
            									end	
            								if (actStatus4 == true) then
            									local DadoStatus4 = math.random(1,100);
            									rolagemStatus4 = getRollStatus(Status4, DadoStatus4, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status4) then 					
            										MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. MSG_SubStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 >= 6 and 8 >= Status4) then 
            											MSG_Status4 = "CdS% de [§B]" .. NomeStatus4 .. "[§B]: " .. rolagemStatus4 .. " (" .. DadoStatus4 .. ");";
            										elseif (Status4 == 9) then 					
            											MSG_Status4 = "CdS de [§B]" .. NomeStatus4 .. "[§B]: Auto (" .. DadoStatus4 .. ");";
            										end
            									end		
            								if (actStatus5 == true) then
            									local DadoStatus5 = math.random(1,100);
            									rolagemStatus5 = getRollStatus(Status5, DadoStatus5, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status5) then 					
            										MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. MSG_SubStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 >= 6 and 8 >= Status5) then 
            											MSG_Status5 = "CdS% de [§B]" .. NomeStatus5 .. "[§B]: " .. rolagemStatus5 .. " (" .. DadoStatus5 .. ");";
            										elseif (Status5 == 9) then 					
            											MSG_Status5 = "CdS de [§B]" .. NomeStatus5 .. "[§B]: Auto (" .. DadoStatus5 .. ");";
            										end
            									end		
            								if (actStatus6 == true) then
            									local DadoStatus6 = math.random(1,100);
            									rolagemStatus6 = getRollStatus(Status6, DadoStatus6, PRECM, DEXTE, MIND, EXPER);
            									if (5 >= Status6) then 					
            										MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. MSG_SubStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 >= 6 and 8 >= Status6) then 
            											MSG_Status6 = "CdS% de [§B]" .. NomeStatus6 .. "[§B]: " .. rolagemStatus6 .. " (" .. DadoStatus6 .. ");";
            										elseif (Status6 == 9) then 					
            											MSG_Status6 = "CdS de [§B]" .. NomeStatus6 .. "[§B]: Auto (" .. DadoStatus6 .. ");";
            										end
            									end	
            								if (REPEAT == 1) then
            									mesa.activeChat:enviarMensagem(MSG_corGolpe .. NOME .. MSG_Ammo .. MSG_CMP .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									elseif (REPEAT >= 2) then	
            										mesa.activeChat:enviarMensagem("[§K14]#" .. i .. "; " .. MSG_TARGET .. MSG_ACERTO .. MSG_DANO .. MSG_Status1 .. MSG_Status2 .. MSG_Status3 .. MSG_Status4 .. MSG_Status5 .. MSG_Status6)
            									end		
            								if (MarCRIT >= 1) then
            									bonCRIT=0;	
            									MSG_CRIT = "";	
            									end	
            								end		
            							end
            
            					GastarMP = self.boxDetalhesDoItem.node.activeConsMP or false
            					if (CMP >= 1 and GastarMP == true) then
            						mesa.activeChat:enviarMensagem("/MP -" .. CMP);
            						end
            						
            					GastarHP = self.boxDetalhesDoItem.node.activeConsHP or false
            					CHP = self.boxDetalhesDoItem.node.campoCustoHP or 0
            					if (CHP >= 1 and GastarHP == true) then
            						mesa.activeChat:enviarMensagem("/HP -" .. CHP);
            						end
            
            					ExaurirON = self.boxDetalhesDoItem.node.activeSamCur or false
            					Samurai = self.boxDetalhesDoItem.node.campoCurse or 0;
            					NIVEL = sheet.basLV or 1;
            					MSG_Exaurir =""
            					if (Samurai >= 1 and ExaurirON == true) then
            						ChanceEX = math.random(1,100);
            						Modificador = Samurai-NIVEL;
            						if (10 > Modificador) then 
            							Modificador = 10;	
            							end
            						if (ChanceEX > Modificador) then 
            							MSG_Exaurir = "A lâmina não exauriu"	
            							end
            						if (Modificador >= ChanceEX) then 
            							MSG_Exaurir = "A lâmina exauriu, recebe Curse ( 4 )"	
            							end
            						mesa.activeChat:enviarMensagem(MSG_Exaurir .. "[" .. ChanceEX .. "(" .. Modificador .. "%)]");
            						end
        end, obj);

    obj._e_event80 = obj.edit269:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event81 = obj.edit270:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event82 = obj.edit271:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event83 = obj.edit272:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event84 = obj.edit273:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event85 = obj.edit274:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event86 = obj.edit275:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event87 = obj.edit276:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event88 = obj.edit277:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event89 = obj.edit278:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event90 = obj.edit279:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event91 = obj.edit280:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event92 = obj.edit281:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event93 = obj.edit282:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event94 = obj.edit283:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event95 = obj.edit284:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event96 = obj.edit285:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event97 = obj.edit286:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event98 = obj.edit287:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event99 = obj.edit288:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event100 = obj.edit289:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event101 = obj.edit290:addEventListener("onChange",
        function (_)
            if sheet== nil then return end;
        end, obj);

    obj._e_event102 = obj.dataLink113:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local bLV = sheet.valLV or 1;
            			local bTIPO = sheet.baseTIPO or "Regular";
            			local bSTR = sheet.valSTR or 0;
            			local bVIT = sheet.valVIT or 0;
            			local bAGI = sheet.valAGI or 0;
            			local bSPD = sheet.valSPD or 0;
            			local bMAG = sheet.valMAG or 0;
            			local bSPR = sheet.valSPR or 0;
            			local bArmor = sheet.baseArmor or 0.5;
            			local bMArmor = sheet.baseMArmor or 0.5;
            			local bHP = tonumber(sheet.baseHP) or 0;
            			local bMP = tonumber(sheet.baseMP) or 0;
            			local sAGIUP = sheet.statAGIUP or false;
            			local sAGIDOWN = sheet.statAGIDOWN or false;
            			local sAGIBREAK = sheet.statAGIBREAK or false;
            			local sBLIND = sheet.statBLIND or false;
            			local sSPIUP = sheet.statSPIUP or false;
            			local sSPIDOWN = sheet.statSPIDOWN or false;
            			local sSPIBREAK = sheet.statSPIBREAK or false;
            			local loEVA = sheet.supLEva or false;			
            			local EVA10 = sheet.supEva10 or false;			
            			local EVA25 = sheet.supEva25 or false;			
            			local EVA50 = sheet.supEva50 or false;			
            			local EVA75 = sheet.supEva75 or false;
            			local loMEVA = sheet.supLMEva or false;			
            			local MEVA10 = sheet.supMEva10 or false;			
            			local MEVA25 = sheet.supMEva25 or false;			
            			local MEVA50 = sheet.supMEva50 or false;			
            			local MEVA75 = sheet.supMEva75 or false;
            			local sIMM = sheet.statIMMOBILIZE or false;
            			local sBLINK = sheet.statBLINK or false;
            			local sARMUP = sheet.statARMUP or false;
            			local sARMDO = sheet.statARMDOWN or false;
            			local sARMBR = sheet.statARMBREAK or false;
            			local sMENUP = sheet.statMENUP or false;
            			local sMENDO = sheet.statMENDOWN or false;
            			local sMENBR = sheet.statMENBREAK or false;
            			local sTOAD = sheet.statTOAD or false;
            			local sMINI = sheet.statMINI or false;
            				
            			sheet.TeoricoATT = bLV + 35;				
            			sheet.SomaATT = bSTR + bVIT  + bAGI  + bSPD  + bMAG  + bSPR;
            			
            			local ACC_MOD = 1;
            			local MACC_MOD = 1;
            			local EVA_MOD = 1;
            			local MEVA_MOD = 1;
            			local bEVA = 0;
            			local bMEVA = 0;
            			local ARM_MOD = 1;
            			local MARM_MOD = 1;
            			if (sAGIUP) then
            				ACC_MOD = ACC_MOD +0.25;
            				EVA_MOD = EVA_MOD +0.25;
            				end
            			if (sAGIDOWN) then
            				ACC_MOD = ACC_MOD -0.25;
            				EVA_MOD = EVA_MOD -0.25;
            				end
            			if (sAGIBREAK) then
            				ACC_MOD = ACC_MOD -0.5;
            				EVA_MOD = EVA_MOD -0.5;
            				end
            			if (sBLIND) then
            				ACC_MOD = ACC_MOD -0.5;
            				end
            			if (sSPIUP) then
            				MACC_MOD = MACC_MOD +0.25;
            				MEVA_MOD = MEVA_MOD +0.25;
            				end
            			if (sSPIDOWN) then
            				MACC_MOD = MACC_MOD -0.25;
            				MEVA_MOD = MEVA_MOD -0.25;
            				end
            			if (sSPIBREAK) then
            				MACC_MOD = MACC_MOD -0.5;
            				MEVA_MOD = MEVA_MOD -0.5;
            				end
            			if (loEVA) then
            				EVA_MOD = EVA_MOD -0.5;
            				end
            			if (EVA10) then
            				EVA_MOD = EVA_MOD +0.1;
            				end
            			if (EVA25) then
            				EVA_MOD = EVA_MOD +0.25;
            				end
            			if (EVA50) then
            				EVA_MOD = EVA_MOD +0.50;
            				end
            			if (EVA75) then
            				EVA_MOD = EVA_MOD +0.75;
            				end	
            			if (sIMM) then
            				EVA_MOD = EVA_MOD -0.5;
            				end	
            			if (sBLINK) then
            				bEVA = bEVA + 20;
            				end	
            			if (loMEVA) then
            				MEVA_MOD = MEVA_MOD -0.5;
            				end
            			if (MEVA10) then
            				MEVA_MOD = MEVA_MOD +0.1;
            				end
            			if (MEVA25) then
            				MEVA_MOD = MEVA_MOD +0.25;
            				end
            			if (MEVA50) then
            				MEVA_MOD = MEVA_MOD +0.50;
            				end
            			if (MEVA75) then
            				MEVA_MOD = MEVA_MOD +0.75;
            				end	
            			if (sARMUP) then
            				ARM_MOD = ARM_MOD +0.25;
            				end
            			if (sARMDO) then
            				ARM_MOD = ARM_MOD -0.25;
            				end
            			if (sARMBR) then
            				ARM_MOD = ARM_MOD -0.5;
            				end
            			if (sMENUP) then
            				MARM_MOD = MARM_MOD +0.25;
            				end
            			if (sMENDO) then
            				MARM_MOD = MARM_MOD -0.25;
            				end
            			if (sMENBR) then
            				MARM_MOD = MARM_MOD -0.5;
            				end
            			if (sTOAD) then
            				ARM_MOD = ARM_MOD -0.5;
            				MARM_MOD = MARM_MOD -0.5;
            				end
            			if (sMINI) then
            				ARM_MOD = ARM_MOD -0.5;
            				MARM_MOD = MARM_MOD -0.5;
            				end
            			if (0 > ACC_MOD) then
            				ACC_MOD = 0;
            				end	
            			if (0 > MACC_MOD) then
            				MACC_MOD = 0;
            				end	
            			if (0 > EVA_MOD) then
            				EVA_MOD = 0;
            				end	
            			if (0 > MEVA_MOD) then
            				MEVA_MOD = 0;
            				end	
            			if (0 > ARM_MOD) then
            				ARM_MOD = 0;
            				end	
            			if (0 > MARM_MOD) then
            				MARM_MOD = 0;
            				end	
            			sheet.valACC 	= math.floor((80 + bLV + bAGI*2)*ACC_MOD);
            			sheet.valMACC 	= math.floor((100 + bLV + bMAG*2)*MACC_MOD);
            			sheet.valDEX 	= 50 + bLV + bAGI*2;
            			sheet.valMND 	= 50 + bLV + bMAG*2;
            			sheet.valEVA 	= math.floor((bLV+bAGI+bSPD+bEVA)*EVA_MOD);
            			sheet.valMEVA 	= math.floor((bLV+bMAG+bSPR+bMEVA)*MEVA_MOD);
            			sheet.valARM 	= math.floor((bArmor*bLV +(bVIT/2))*ARM_MOD);
            			sheet.valMARM 	= math.floor((bMArmor*bLV +(bSPR/2))*MARM_MOD);
            			sheet.valMaxHP 	= math.floor(bHP*bVIT*bLV);
            			sheet.valMaxMP 	= math.floor(bMP*bSPR*bLV);									
            			if (bTIPO == "Notorious") then	
            				sheet.valMaxHP = math.floor((sheet.valMaxHP)*2);
            				sheet.valMaxMP = math.floor((sheet.valMaxMP)*1.5);
            				sheet.immDeath = true;				
            				sheet.immCondemn = true;						
            				end
            			if (bTIPO == "Boss") then	
            				sheet.valMaxHP = math.floor((sheet.valMaxHP)*4);
            				sheet.valMaxMP = math.floor((sheet.valMaxMP)*2);
            				sheet.immFatal = true;
            				end
            			if (bTIPO == "End Boss") then	
            				sheet.valMaxHP = math.floor((sheet.valMaxHP)*6);
            				sheet.valMaxMP = math.floor((sheet.valMaxMP)*3);
            				sheet.immFatal = true;
            				end
        end, obj);

    obj._e_event103 = obj.dataLink114:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.baseEXP = 0;
            			sheet.baseGIL = 0;
            			
            			bLV = sheet.valLV or 1;
            			bTIPO = sheet.baseTIPO or "Regular"
            			if (bTIPO == "Regular") then		
            				setEG1(40,15)				
            				end;
            			if (bTIPO == "Notorious") then
            				setEG1(100,25)				
            				end;
            			if (bTIPO == "Boss") then
            				setEG1(225,55)				
            				end;
            			if (bTIPO == "End Boss") then
            				setEG1(350,90)				
            				end;
            				
            			bHP = tonumber(sheet.baseHP) or 1
            			if (bHP == 1) then	
            				setEG1(-16,-6)				
            				end;
            			if (bHP == 1.5) then	
            				setEG1(-8,-3)				
            				end;
            			if (bHP == 4) then	
            				setEG1(18,8)				
            				end;
            			if (bHP == 6) then	
            				setEG1(40,19)				
            				end;
            			if (bHP == 8) then	
            				setEG1(60,30)				
            				end;
            				
            			bMP = tonumber(sheet.baseMP) or 0
            			if (bMP == 0.5) then	
            				setEG1(8,3)				
            				end;
            			if (bMP == 1) then	
            				setEG1(15,7)				
            				end;
            			if (bMP == 1.5) then	
            				setEG1(22,10)				
            				end;
            			if (bMP == 2) then	
            				setEG1(35,16)				
            				end;
            			if (bMP == 4) then	
            				setEG1(50,28)				
            				end;		
            
            			bARM = tonumber(sheet.baseArmor) or 0.5
            			if (bARM == 0.5) then	
            				setEG1(-5,-2)				
            				end;
            			if (bARM == 2) then	
            				setEG1(10,5)				
            				end;
            			if (bARM == 4) then	
            				setEG1(19,9)				
            				end;
            			if (bARM == 6) then	
            				setEG1(26,18)				
            				end;
            				
            			bMARM = tonumber(sheet.baseMArmor) or 0.5
            			if (bMARM == 0.5) then	
            				setEG1(-5,-2)				
            				end;
            			if (bMARM == 2) then	
            				setEG1(10,5)				
            				end;
            			if (bMARM == 4) then	
            				setEG1(19,9)				
            				end;
            			if (bMARM == 6) then	
            				setEG1(26,18)				
            				end;
            				
            			local addBlock1 = {}	
            			addBlock1.var1 = sheet.addFloat or false;
            			addBlock1.var2 = sheet.addAgiUP or false;
            			addBlock1.var3  = sheet.addSpiUP or false;
            			addBlock1.var4  = sheet.addBIOSpikes or false;
            			addBlock1.var5  = sheet.addGNDSpikes or false;	
            			addBlock1.var6  = sheet.addFIRSpikes or false;	
            			addBlock1.var7  = sheet.addWATSpikes or false;	
            			addBlock1.var8  = sheet.addWINSpikes or false;	
            			addBlock1.var9  = sheet.addICESpikes or false;	
            			addBlock1.var10  = sheet.addELESpikes or false;	
            			addBlock1.var11  = sheet.addHOLSpikes or false;	
            			addBlock1.var12  = sheet.addSHASpikes or false;
            			for i=1,12,1 do
            				if (addBlock1["var" .. i]) then
            					setEG1(14,4)
            					end
            				end
            			local addBlock2 = {}	
            			addBlock2.var1 = sheet.addProtect or false;				
            			addBlock2.var2 = sheet.addShell or false;
            			addBlock2.var3 = sheet.addARMUP or false;
            			addBlock2.var4 = sheet.addMENUP or false;
            			for i=1,4,1 do
            				if (addBlock2["var" .. i]) then
            					setEG1(18,6)
            					end
            				end
            			local addBlock3 = {}	
            			addBlock3.var1 = sheet.addHaste or false;	
            			addBlock3.var2 = sheet.addReflect or false;
            			addBlock3.var3 = sheet.addPOWUP or false;
            			addBlock3.var4 = sheet.addMAGUP or false;
            			for i=1,4,1 do
            				if (addBlock3["var" .. i]) then
            					setEG1(26,9)
            					end
            				end
            			local addBlock4 = {}	
            			addBlock4.var1 = sheet.addRegen or false;
            			addBlock4.var2 = sheet.addAura or false;
            			addBlock4.var3 = sheet.addVanish or false;
            			for i=1,3,1 do
            				if (addBlock4["var".. i]) then
            					setEG1(38,12)
            					end
            				end
            				
            			local canBlock1 = {}	
            			canBlock1.var1 = sheet.canFloat or false;
            			canBlock1.var2 = sheet.canAgiUP or false;
            			canBlock1.var3 = sheet.canSpiUP or false;
            			canBlock1.var4 = sheet.canBIOSpikes or false;
            			canBlock1.var5 = sheet.canGNDSpikes or false;	
            			canBlock1.var6 = sheet.canFIRSpikes or false;	
            			canBlock1.var7 = sheet.canWATSpikes or false;	
            			canBlock1.var8 = sheet.canWINSpikes or false;	
            			canBlock1.var9 = sheet.canICESpikes or false;	
            			canBlock1.var10 = sheet.canELESpikes or false;	
            			canBlock1.var11 = sheet.canHOLSpikes or false;	
            			canBlock1.var12 = sheet.canSHASpikes or false;
            			for i=1,12,1 do
            				if (canBlock1["var" .. i]) then
            					setEG1(10,3)
            					end
            				end
            			local canBlock2 = {}	
            			canBlock2.var1 = sheet.canProtect or false;				
            			canBlock2.var2 = sheet.canShell or false;
            			canBlock2.var3 = sheet.canARMUP or false;
            			canBlock2.var4 = sheet.canMENUP or false;
            			for i=1,4,1 do
            				if (canBlock2["var" .. i]) then
            					setEG1(15,5)
            					end
            				end
            			local canBlock3 = {}	
            			canBlock3.var1 = sheet.canHaste or false;	
            			canBlock3.var2 = sheet.canReflect or false;
            			canBlock3.var3 = sheet.canPOWUP or false;
            			canBlock3.var4 = sheet.canMAGUP or false;
            			for i=1,4,1 do
            				if (canBlock3["var" .. i]) then
            					setEG1(22,8)
            					end
            				end
            			local canBlock4 = {}	
            			canBlock4.var1 = sheet.canRegen or false;
            			canBlock4.var2 = sheet.canAura or false;
            			canBlock4.var3 = sheet.canVanish or false;
            			canBlock4.var4 = sheet.canHealHP or false;
            			for i=1,4,1 do
            				if (canBlock4["var" .. i]) then
            					setEG1(32,11)
            					end
            				end
            	
            
            			local aALARM = sheet.aaAlarm or false;
            			if aALARM then		
            				setEG1(32,18)
            				end
            			local aCLONE = sheet.aaClone or false;
            			if aCLONE then		
            				setEG1(64,32)
            				end		
            			local aESCAPE = sheet.aaEscape or false;
            			if aESCAPE then		
            				setEG1(5,2)
            				end						
            			local aIMPRISON = {}
            			aIMPRISON.var1 = sheet.aaImprison or false;
            			aIMPRISON.var2 = sheet.aaBPrison or false;
            			aIMPRISON.var3 = sheet.aaIPrison or false;
            			aIMPRISON.var4 = sheet.aaSPrison or false;
            			aIMPRISON.var5 = sheet.aaDPrison or false;
            			aIMPRISON.var6 = sheet.aaVPrison or false;
            			if aIMPRISON.var1 then
            				setEG1(36,12)
            				if aIMPRISON.var2 then
            					setEG1(12,4)
            					end
            				if aIMPRISON.var3 then
            					setEG1(12,4)
            					end
            				if aIMPRISON.var4 then
            					setEG1(-9,-3)
            					end
            				if aIMPRISON.var5 then
            					setEG1(9,3)
            					end
            				if aIMPRISON.var6 then
            					setEG1(-12,-4)
            					end
            				end		
            			local aITEMUSE = sheet.aaItemUse or false;
            			if aITEMUSE then		
            				setEG1(15,0)
            				end		
            			local aRES25 = sheet.aaRestore25 or false;
            			if aRES25 then		
            				setEG1(20,13)
            				end	
            			local aRES50 = sheet.aaRestore50 or false;
            			if aRES50 then		
            				setEG1(60,40)
            				end	
            			local aRES75 = sheet.aaRestore75 or false;
            			if aRES75 then		
            				setEG1(100,75)
            				end					
            			local aSSPO = sheet.aaSSPO or false;
            			if aSSPO then		
            				setEG1(12,4)
            				end					
            			local aSSPN = sheet.aaSSPN or false;
            			if aSSPN then		
            				setEG1(9,3)
            				end	
            			
            			obj={}
            			obj.SpT1 = sheet.SpellsTIPO1 or "None"
            			obj.SpT2 = sheet.SpellsTIPO2 or "None"
            			obj.SpT3 = sheet.SpellsTIPO3 or "None"
            			obj.SpT4 = sheet.SpellsTIPO4 or "None"
            			obj.SpT5 = sheet.SpellsTIPO5 or "None"
            			obj.SpT6 = sheet.SpellsTIPO6 or "None"
            			obj.SpT7 = sheet.SpellsTIPO7 or "None"
            			obj.SpT8 = sheet.SpellsTIPO8 or "None"
            			obj.SpT9 = sheet.SpellsTIPO9 or "None"
            			obj.SpT10 = sheet.SpellsTIPO10 or "None"
            			obj.SpT11 = sheet.SpellsTIPO11 or "None"
            			obj.SpT12 = sheet.SpellsTIPO12 or "None"
            			for i=1,12,1 do
            				if (obj["SpT" .. i] == "Spell1" or obj["SpT" .. i] == "Blue1") then
            					setEG1(8,5)
            					end
            				if (obj["SpT" .. i] == "Spell2" or obj["SpT" .. i] == "Blue2") then
            					setEG1(15,9)
            					end
            				if (obj["SpT" .. i] == "Spell3" or obj["SpT" .. i] == "Blue3") then
            					setEG1(25,14)
            					end
            				if (obj["SpT" .. i] == "Spell4" or obj["SpT" .. i] == "Blue4") then
            					setEG1(33,21)
            					end
            				if (obj["SpT" .. i] == "Spell5" or obj["SpT" .. i] == "Blue5") then
            					setEG1(45,30)
            					end
            				if (obj["SpT" .. i] == "Spell6" or obj["SpT" .. i] == "Blue6") then
            					setEG1(55,37)
            					end				
            				if (obj["SpT" .. i] == "Spell7" or obj["SpT" .. i] == "Blue7") then
            					setEG1(64,44)
            					end				
            				if (obj["SpT" .. i] == "Spell8" or obj["SpT" .. i] == "Blue8") then
            					setEG1(80,55)
            					end	
            				if (obj["SpT" .. i] == "Call1") then
            					setEG1(27,14)
            					end	
            				if (obj["SpT" .. i] == "Call2") then
            					setEG1(42,29)
            					end	
            				if (obj["SpT" .. i] == "Call3") then
            					setEG1(64,44)
            					end	
            				if (obj["SpT" .. i] == "Call4") then
            					setEG1(88,59)
            					end	
            				end
            
            			job={}
            			job.JST1 = sheet.JSTipo1 or "None"
            			job.JST2 = sheet.JSTipo2 or "None"
            			job.JST3 = sheet.JSTipo3 or "None"
            			job.JST4 = sheet.JSTipo4 or "None"
            			job.JST5 = sheet.JSTipo5 or "None"
            			job.JST6 = sheet.JSTipo6 or "None"
            			job.JST7 = sheet.JSTipo7 or "None"
            			job.JST8 = sheet.JSTipo8 or "None"
            			job.JST9 = sheet.JSTipo9 or "None"
            			job.JST10 = sheet.JSTipo10 or "None"
            			job.JST11 = sheet.JSTipo11 or "None"
            			job.JST12 = sheet.JSTipo12 or "None"
            			for i=1,12,1 do
            				if (job["JST" .. i] == "JSNv1") then
            					setEG1(10,3)
            					end		
            				if (job["JST" .. i] == "JSNv2") then
            					setEG1(18,7)
            					end	
            				if (job["JST" .. i] == "JSNv3") then
            					setEG1(26,9)
            					end	
            				if (job["JST" .. i] == "JSNv4") then
            					setEG1(32,12)
            					end	
            				if (job["JST" .. i] == "JSNv5") then
            					setEG1(44,16)
            					end	
            				if (job["JST" .. i] == "JSNv6") then
            					setEG1(53,19)
            					end	
            				if (job["JST" .. i] == "JSNv7") then
            					setEG1(61,22)
            					end	
            				if (job["JST" .. i] == "JSNv8") then
            					setEG1(70,25)
            					end		
            				if (job["JST" .. i] == "JSNv9") then
            					setEG1(78,28)
            					end	
            				if (job["JST" .. i] == "JSNv10") then
            					setEG1(86,31)
            					end		
            				end
            
            			local dBURROW = {}
            			dBURROW.var1 = sheet.maBurrow or false		
            			if dBURROW.var1 then
            				dBURROW.var2 = 60;
            				dBURROW.var3 = 20;
            				dBURROW.var4 = 1;
            				dBURROW.var5 = sheet.maBurrowSOSG or false
            				dBURROW.var6 = sheet.maBurrowSOSL or false
            				dBURROW.var7 = sheet.maBurrowMP or false
            				if dBURROW.var5 then		
            					dBURROW.var4 = dBURROW.var4 - 0.25;	
            					end
            				if dBURROW.var6 then		
            					dBURROW.var4 = dBURROW.var4 - 0.25;	
            					end
            				if dBURROW.var7 then			
            					dBURROW.var4 = dBURROW.var4 - 0.25;			
            					sheet.maBurrowMPCost = math.floor(dBURROW.var2*dBURROW.var4) + bLV;
            					end
            				dBURROW.var8 = math.floor(dBURROW.var2*dBURROW.var4);
            				dBURROW.var9 = math.floor(dBURROW.var3*dBURROW.var4);
            				setEG1(dBURROW.var8,dBURROW.var9)
            				end
            
            			local dFLIGHT = {}
            			dFLIGHT.var1 = sheet.maFlight or false		
            			if dFLIGHT.var1 then
            				dFLIGHT.var2 = 20;
            				dFLIGHT.var3 = 9;
            				dFLIGHT.var4 = 1;
            				dFLIGHT.var5 = sheet.maFlightSOSG or false
            				dFLIGHT.var6 = sheet.maFlightSOSL or false
            				dFLIGHT.var7 = sheet.maFlightMP or false
            				if dFLIGHT.var5 then		
            					dFLIGHT.var4 = dFLIGHT.var4 - 0.25;	
            					end
            				if dFLIGHT.var6 then		
            					dFLIGHT.var4 = dFLIGHT.var4 - 0.25;	
            					end
            				if dFLIGHT.var7 then			
            					dFLIGHT.var4 = dFLIGHT.var4 - 0.25;			
            					sheet.maBurrowMPCost = math.floor(dFLIGHT.var2*dFLIGHT.var4) + bLV;
            					end
            				dFLIGHT.var8 = math.floor(dFLIGHT.var2*dFLIGHT.var4);
            				dFLIGHT.var9 = math.floor(dFLIGHT.var3*dFLIGHT.var4);
            				setEG1(dFLIGHT.var8,dFLIGHT.var9)
            				end
            				
            			local dFLOAT = {}
            			dFLOAT.var1 = sheet.maFloat or false		
            			if dFLOAT.var1 then
            				dFLOAT.var2 = 19;
            				dFLOAT.var3 = 6;
            				dFLOAT.var4 = 1;
            				dFLOAT.var5 = sheet.maFloatSOSG or false
            				dFLOAT.var6 = sheet.maFloatSOSL or false
            				dFLOAT.var7 = sheet.maFloatMP or false
            				if dFLOAT.var5 then		
            					dFLOAT.var4 = dFLOAT.var4 - 0.25;	
            					end
            				if dFLOAT.var6 then		
            					dFLOAT.var4 = dFLOAT.var4 - 0.25;	
            					end
            				if dFLOAT.var7 then			
            					dFLOAT.var4 = dFLOAT.var4 - 0.25;			
            					sheet.maBurrowMPCost = math.floor(dFLOAT.var2*dFLOAT.var4) + bLV;
            					end
            				dFLOAT.var8 = math.floor(dFLOAT.var2*dFLOAT.var4);
            				dFLOAT.var9 = math.floor(dFLOAT.var3*dFLOAT.var4);
            				setEG1(dFLOAT.var8,dFLOAT.var9)
            				end
            
            			local dTELEPORT = {}
            			dTELEPORT.var1 = sheet.maTeleport or false		
            			if dTELEPORT.var1 then
            				dTELEPORT.var2 = 60;
            				dTELEPORT.var3 = 40;
            				dTELEPORT.var4 = 1;
            				dTELEPORT.var5 = sheet.maTeleportSOSG or false
            				dTELEPORT.var6 = sheet.maTeleportSOSL or false
            				dTELEPORT.var7 = sheet.maTeleportMP or false
            				if dTELEPORT.var5 then		
            					dTELEPORT.var4 = dTELEPORT.var4 - 0.25;	
            					end
            				if dTELEPORT.var6 then		
            					dTELEPORT.var4 = dTELEPORT.var4 - 0.25;	
            					end
            				if dTELEPORT.var7 then			
            					dTELEPORT.var4 = dTELEPORT.var4 - 0.25;			
            					sheet.maBurrowMPCost = math.floor(dTELEPORT.var2*dTELEPORT.var4) + bLV;
            					end
            				dTELEPORT.var8 = math.floor(dTELEPORT.var2*dTELEPORT.var4);
            				dTELEPORT.var9 = math.floor(dTELEPORT.var3*dTELEPORT.var4);
            				setEG1(dTELEPORT.var8,dTELEPORT.var9)
            				end
            
            			local dGROUND = sheet.maGround or false
            			if dGROUND then
            				local MPGround = sheet.maGroundMP or false;
            				if MPGround then
            					sheet.maGroundMP = bLV;
            					end
            				end
            				
            			local auBlock1 = {}	
            			auBlock1.var1 = sheet.autoFloat or false;
            			auBlock1.var2 = sheet.autoAgiUP or false;
            			auBlock1.var3 = sheet.autoSpiUP or false;
            			auBlock1.var4 = sheet.autoBIOSpikes or false;
            			auBlock1.var5 = sheet.autoGNDSpikes or false;		
            			auBlock1.var6  = sheet.autoFIRSpikes or false;		
            			auBlock1.var7  = sheet.autoWATSpikes or false;		
            			auBlock1.var8  = sheet.autoWINSpikes or false;		
            			auBlock1.var9  = sheet.autoICESpikes or false;		
            			auBlock1.var10  = sheet.autoELESpikes or false;		
            			auBlock1.var11  = sheet.autoHOLSpikes or false;		
            			auBlock1.var12  = sheet.autoSHASpikes or false;			
            			for i=1,12,1 do
            				if (auBlock1["var" .. i]) then
            					setEG1(19,6)
            					end
            				end
            			local auBlock2 = {}	
            			auBlock2.var1 = sheet.autoProtect or false;				
            			auBlock2.var2 = sheet.autoShell or false;
            			auBlock2.var3 = sheet.autoARMUP or false;
            			auBlock2.var4 = sheet.autoMENUP or false;
            			for i=1,4,1 do
            				if (auBlock2["var" .. i]) then
            					setEG1(30,10)
            					end
            				end
            			local auBlock3 = {}	
            			auBlock3.var1 = sheet.autoHaste or false;	
            			auBlock3.var2 = sheet.autoReflect or false;
            			auBlock3.var3 = sheet.autoPOWUP or false;
            			auBlock3.var4 = sheet.autoMAGUP or false;
            			for i=1,4,1 do
            				if (auBlock3["var" .. i]) then
            					setEG1(44,15)
            					end
            				end
            			local auBlock4 = {}	
            			auBlock4.var1 = sheet.autoRegen or false;
            			auBlock4.var2  = sheet.autoAura or false;
            			auBlock4.var3  = sheet.autoVanish or false;
            			for i=1,3,1 do
            				if (auBlock4["var" .. i]) then
            					setEG1(64,21)
            					end
            				end
            			local auBlock5 = {}	
            			auBlock5.var1 = sheet.autoBerserk or false;
            			auBlock5.var2 = sheet.autoBlind or false;
            			auBlock5.var3 = sheet.autoPoison or false;
            			auBlock5.var4 = sheet.autoSleep or false;
            			auBlock5.var5 = sheet.autoSlow or false;
            			auBlock5.var6 = sheet.autoZombie or false;
            			for i=1,6,1 do
            				if (auBlock5["var" .. i]) then
            					setEG1(-19,-6)
            					end
            				end
            			local auBlock6 = {}	
            			auBlock6.var1 = sheet.autoConfuse or false;
            			auBlock6.var2 = sheet.autoSap or false;
            			auBlock6.var3 = sheet.autoUnaware or false;	
            			for i=1,3,1 do
            				if (auBlock6["var" .. i]) then
            					setEG1(-30,-10)
            					end
            				end
            			local auBlock7 = {}
            			auBlock7.var1 = sheet.autoMini or false;	
            			auBlock7.var2 = sheet.autoToad or false;	
            			auBlock7.var3 = sheet.autoVenom or false;			
            			for i=1,3,1 do
            				if (auBlock7["var" .. i]) then
            					setEG1(-44,-15)
            					end
            				end
            			local auBlock8 = {}	
            			auBlock8.var1 = sheet.autoCondemn or false;		
            			auBlock8.var2 = sheet.autoPetrify or false;	
            			for i=1,2,1 do
            				if (auBlock8["var" .. i]) then
            					setEG1(-64,-21)
            					end
            				end
            				
            			local soBlock1 = {}	
            			soBlock1.var1 = sheet.sosFloat or false;
            			soBlock1.var2 = sheet.sosAgiUP or false;
            			soBlock1.var3 = sheet.sosSpiUP or false;
            			soBlock1.var4 = sheet.sosBIOSpikes or false;
            			soBlock1.var5 = sheet.sosGNDSpikes or false;		
            			soBlock1.var6  = sheet.sosFIRSpikes or false;		
            			soBlock1.var7  = sheet.sosWATSpikes or false;		
            			soBlock1.var8  = sheet.sosWINSpikes or false;		
            			soBlock1.var9  = sheet.sosICESpikes or false;		
            			soBlock1.var10  = sheet.sosELESpikes or false;		
            			soBlock1.var11  = sheet.sosHOLSpikes or false;		
            			soBlock1.var12  = sheet.sosSHASpikes or false;			
            			for i=1,12,1 do
            				if ((soBlock1["var" .. i]) and (not auBlock1["var" .. i])) then
            					setEG1(7,3)
            					end
            				end
            			local soBlock2 = {}	
            			soBlock2.var1 = sheet.sosProtect or false;				
            			soBlock2.var2 = sheet.sosShell or false;
            			soBlock2.var3 = sheet.sosARMUP or false;
            			soBlock2.var4 = sheet.sosMENUP or false;
            			for i=1,4,1 do
            				if ((soBlock2["var" .. i]) and (not auBlock2["var" .. i])) then
            					setEG1(12,4)
            					end
            				end
            			local soBlock3 = {}	
            			soBlock3.var1 = sheet.sosHaste or false;	
            			soBlock3.var2 = sheet.sosReflect or false;
            			soBlock3.var3 = sheet.sosPOWUP or false;
            			soBlock3.var4 = sheet.sosMAGUP or false;
            			for i=1,4,1 do
            				if ((soBlock3["var" .. i]) and (not auBlock3["var" .. i])) then
            					setEG1(20,8)
            					end
            				end
            			local soBlock4 = {}	
            			soBlock4.var1 = sheet.sosRegen or false;
            			soBlock4.var2  = sheet.sosAura or false;
            			soBlock4.var3  = sheet.sosVanish or false;
            			for i=1,3,1 do
            				if ((soBlock4["var" .. i]) and (not auBlock4["var" .. i])) then
            					setEG1(36,12)
            					end
            				end
            			local soBlock5 = {}	
            			soBlock5.var1 = sheet.sosBerserk or false;
            			soBlock5.var2 = sheet.sosBlind or false;
            			soBlock5.var3 = sheet.sosPoison or false;
            			soBlock5.var4 = sheet.sosSleep or false;
            			soBlock5.var5 = sheet.sosSlow or false;
            			soBlock5.var6 = sheet.sosZombie or false;
            			for i=1,6,1 do
            				if ((soBlock5["var" .. i]) and (not auBlock5["var" .. i])) then
            					setEG1(-7,-2)
            					end
            				end
            			local soBlock6 = {}	
            			soBlock6.var1 = sheet.sosConfuse or false;
            			soBlock6.var2 = sheet.sosSap or false;
            			soBlock6.var3 = sheet.sosUnaware or false;	
            			for i=1,3,1 do
            				if ((soBlock6["var" .. i]) and (not auBlock6["var" .. i])) then
            					setEG1(-12,-4)
            					end
            				end
            			local soBlock7 = {}
            			soBlock7.var1 = sheet.sosMini or false;	
            			soBlock7.var2 = sheet.sosToad or false;	
            			soBlock7.var3 = sheet.sosVenom or false;			
            			for i=1,3,1 do
            				if ((soBlock7["var" .. i]) and (not auBlock7["var" .. i])) then
            					setEG1(-20,-8)
            					end
            				end
            			local soBlock8 = {}	
            			soBlock8.var1 = sheet.sosCondemn or false;		
            			soBlock8.var2 = sheet.sosPetrify or false;	
            			for i=1,2,1 do
            				if ((soBlock8["var" .. i]) and (not auBlock8["var" .. i])) then
            					setEG1(-36,-12)
            					end
            				end
            
            			local Comeback = {}
            			Comeback.var1 = sheet.Comeback2 or false;
            			Comeback.var2 = sheet.Comeback4 or false;
            			Comeback.var3 = sheet.Comeback6 or false;
            			if (Comeback.var3) and (not Comeback.var2) and (not Comeback.var1) then
            				setEG1(25,9)
            				end
            			if (Comeback.var2) and (not Comeback.var1) then
            				setEG1(37,14)
            				end
            			if (Comeback.var1) then
            				setEG1(50,18)
            				end		
            
            			local Critical = {}
            			Critical.var1 = sheet.supCrit1 or false;
            			Critical.var2 = sheet.supCrit2 or false;
            			Critical.var3 = sheet.supCrit3 or false;
            			if (Critical.var1) and (not Critical.var2) and (not Critical.var3) then
            				setEG1(8,3)
            				end
            			if (Critical.var2) and (not Critical.var3) then
            				setEG1(13,5)
            				end
            			if (Critical.var3) then
            				setEG1(18,7)
            				end					
            					
            			local poBlock = {}	
            			poBlock.var1 = sheet.potFIR or false
            			poBlock.var2 = sheet.potICE or false
            			poBlock.var3 = sheet.potWAT or false
            			poBlock.var4 = sheet.potELE or false
            			poBlock.var5 = sheet.potGND or false
            			poBlock.var6 = sheet.potWIN or false
            			poBlock.var7 = sheet.potBIO or false
            			poBlock.var8 = sheet.potSHA or false
            			poBlock.var9 = sheet.potHOL or false			
            			for i=1,9,1 do
            				if (poBlock["var" .. i]) then
            					setEG1(60,41)
            					end
            				end
            		
            			local wkBlock = {}	
            			wkBlock.var1 = sheet.weakFIR or false
            			wkBlock.var2 = sheet.weakICE or false
            			wkBlock.var3 = sheet.weakWAT or false
            			wkBlock.var4 = sheet.weakELE or false
            			wkBlock.var5 = sheet.weakGND or false
            			wkBlock.var6 = sheet.weakWIN or false
            			wkBlock.var7 = sheet.weakBIO or false
            			wkBlock.var8 = sheet.weakSHA or false
            			wkBlock.var9 = sheet.weakHOL or false	
            			
            			local reBlock = {}	
            			reBlock.var1 = sheet.resFIR or false
            			reBlock.var2 = sheet.resICE or false
            			reBlock.var3 = sheet.resWAT or false
            			reBlock.var4 = sheet.resELE or false
            			reBlock.var5 = sheet.resGND or false
            			reBlock.var6 = sheet.resWIN or false
            			reBlock.var7 = sheet.resBIO or false
            			reBlock.var8 = sheet.resSHA or false
            			reBlock.var9 = sheet.resHOL or false				
            
            			local imBlock = {}	
            			imBlock.var1 = sheet.immFIR or false
            			imBlock.var2 = sheet.immICE or false
            			imBlock.var3 = sheet.immWAT or false
            			imBlock.var4 = sheet.immELE or false
            			imBlock.var5 = sheet.immGND or false
            			imBlock.var6 = sheet.immWIN or false
            			imBlock.var7 = sheet.immBIO or false
            			imBlock.var8 = sheet.immSHA or false
            			imBlock.var9 = sheet.immHOL or false	
            			
            			local abBlock = {}	
            			abBlock.var1 = sheet.absFIR or false
            			abBlock.var2 = sheet.absICE or false
            			abBlock.var3 = sheet.absWAT or false
            			abBlock.var4 = sheet.absELE or false
            			abBlock.var5 = sheet.absGND or false
            			abBlock.var6 = sheet.absWIN or false
            			abBlock.var7 = sheet.absBIO or false
            			abBlock.var8 = sheet.absSHA or false
            			abBlock.var9 = sheet.absHOL or false	
            			
            			for i=1,9,1 do
            				if ((wkBlock["var" .. i]) and (not reBlock["var" .. i]) and (not imBlock["var" .. i]) and (not abBlock["var" .. i])) then
            					setEG1(-9,-4)
            					end
            				end	
            				
            			for i=1,9,1 do
            				if ((reBlock["var" .. i]) and (not imBlock["var" .. i]) and (not abBlock["var" .. i])) then
            					setEG1(7,3)
            					end
            				end	
            				
            			for i=1,9,1 do
            				if ((imBlock["var" .. i]) and (not abBlock["var" .. i])) then
            					setEG1(15,7)
            					end
            				end	
            			for i=1,9,1 do
            				if (abBlock["var" .. i]) then
            					setEG1(33,15)
            					end
            				end	
            
            		local Scan = {}
            		Scan.var1 = sheet.speBadScan or false;
            		Scan.var2 = sheet.speNoScan or false;
            		if (Scan.var1) then
            			setEG1(14,7)
            			end
            		if (Scan.var2) then
            			setEG1(10,4)
            			end
            	
            		local Heavy = sheet.supHArm or false;
            		if Heavy then
            			setEG1(10,3)
            			end
            		local Mystic = sheet.supMRes or false;
            		if Mystic then
            			setEG1(10,3)
            			end	
            	
            		local Evasion = {}
            		Evasion.var1 = sheet.supEvader or false;
            		Evasion.var2 = sheet.supEva10 or false;
            		Evasion.var3 = sheet.supEva25 or false;
            		Evasion.var4 = sheet.supEva50 or false;
            		Evasion.var5 = sheet.supEva75 or false;
            		Evasion.var6 = sheet.supLEva or false;
            		if (Evasion.var1) then
            			setEG1(35,25)
            			end
            		if (Evasion.var2) then
            			setEG1(10,3)
            			end
            		if (Evasion.var3) then
            			setEG1(19,6)
            			end
            		if (Evasion.var4) then
            			setEG1(35,25)
            			end
            		if (Evasion.var5) then
            			setEG1(60,25)
            			end
            		if (Evasion.var6) then
            			setEG1(-33,-11)
            			end
            			
            		local MEvasion = {}
            		MEvasion.var1 = sheet.supLMEva or false;
            		MEvasion.var2 = sheet.supMEva10 or false;
            		MEvasion.var3 = sheet.supMEva25 or false;
            		MEvasion.var4 = sheet.supMEva50 or false;
            		MEvasion.var5 = sheet.supMEva75 or false;
            		if (MEvasion.var1) then
            			setEG1(-33,-11)
            			end
            		if (MEvasion.var2) then
            			setEG1(10,3)
            			end
            		if (MEvasion.var3) then
            			setEG1(19,6)
            			end
            		if (MEvasion.var4) then
            			setEG1(35,25)
            			end
            		if (MEvasion.var5) then
            			setEG1(60,25)
            			end
            
            		local wkStat = {}
            		wkStat.var1 = sheet.weakBerserk or false;
            		wkStat.var2 = sheet.weakBlind or false;
            		wkStat.var3 = sheet.weakCurse or false;
            		wkStat.var4 = sheet.weakDisable or false;
            		wkStat.var5 = sheet.weakImmobilize or false;
            		wkStat.var6 = sheet.weakPoison or false;
            		wkStat.var7 = sheet.weakSilence or false;
            		wkStat.var8 = sheet.weakSleep or false;
            		wkStat.var9 = sheet.weakSlow or false;
            		for i=1,9,1 do
            			if (wkStat["var" .. i]) then
            				setEG1(-10,-3)
            				end
            			end		
            		wkStat.var10 = sheet.weakCondemn or false;
            		wkStat.var11 = sheet.weakConfuse or false;
            		wkStat.var12 = sheet.weakPetrify or false;
            		wkStat.var13 = sheet.weakSTRDown or false;
            		wkStat.var14 = sheet.weakAGIDown or false;
            		wkStat.var15 = sheet.weakMAGDown or false;
            		wkStat.var16 = sheet.weakMENDown or false;
            		wkStat.var17 = sheet.weakARMDown or false;
            		wkStat.var18 = sheet.weakSPIDown or false;
            		wkStat.var19 = sheet.weakSap or false;
            		wkStat.var20 = sheet.weakUnaware or false;
            		for i=10,20,1 do
            			if (wkStat["var" .. i]) then
            				setEG1(-19,-6)
            				end
            			end		
            		wkStat.var21 = sheet.weakEject or false;
            		wkStat.var22 = sheet.weakMini or false;
            		wkStat.var23 = sheet.weakToad or false;
            		wkStat.var24 = sheet.weakSTRBrk or false;
            		wkStat.var25 = sheet.weakAGIBrk or false;
            		wkStat.var26 = sheet.weakMAGBrk or false;
            		wkStat.var27 = sheet.weakMENBrk or false;
            		wkStat.var28 = sheet.weakARMBrk or false;
            		wkStat.var29 = sheet.weakSPIBrk or false;
            		wkStat.var30 = sheet.weakStop or false;
            		wkStat.var31 = sheet.weakVenom or false;
            		wkStat.var32 = sheet.weakZombie or false;
            		for i=21,32,1 do
            			if (wkStat["var" .. i]) then
            				setEG1(-30,-10)
            				end
            			end						
            		wkStat.var33 = sheet.weakCharm or false;
            		wkStat.var34 = sheet.weakDeath or false;
            		wkStat.var35 = sheet.weakFrozen or false;
            		wkStat.var36 = sheet.weakHeat or false;
            		wkStat.var37 = sheet.weakMeltdown or false;
            		wkStat.var38 = sheet.weakStone or false;
            		for i=33,38,1 do
            			if (wkStat["var" .. i]) then
            				setEG1(-44,-15)
            				end
            			end	
            			
            		local reStat = {}
            		reStat.var1 = sheet.resBerserk or false;
            		reStat.var2 = sheet.resBlind or false;
            		reStat.var3 = sheet.resImmobilize or false;
            		reStat.var4 = sheet.resPoison or false;
            		reStat.var5 = sheet.resSleep or false;
            		reStat.var6 = sheet.resSlow or false;
            		reStat.var7 = sheet.resZombie or false;
            		reStat.var8 = sheet.resLock or false;
            		reStat.var9 = sheet.resCondemn or false;
            		reStat.var10 = sheet.resConfuse or false;
            		reStat.var11 = sheet.resCurse or false;
            		reStat.var12 = sheet.resDisable or false;
            		reStat.var13 = sheet.resPetrify or false;
            		reStat.var14 = sheet.resSilence or false;
            		reStat.var15 = sheet.resSap or false;
            		reStat.var16 = sheet.resUnaware or false;
            		reStat.var17 = sheet.resEject or false;
            		reStat.var18 = sheet.resMini or false;
            		reStat.var19 = sheet.resSTRDown or false;
            		reStat.var20 = sheet.resAGIDown or false;
            		reStat.var21 = sheet.resMAGDown or false;
            		reStat.var22 = sheet.resMENDown or false;
            		reStat.var23 = sheet.resARMDown or false;
            		reStat.var24 = sheet.resSPIDown or false;
            		reStat.var25 = sheet.resSTRBrk or false;
            		reStat.var26 = sheet.resAGIBrk or false;
            		reStat.var27 = sheet.resMAGBrk or false;
            		reStat.var28 = sheet.resMENBrk or false;
            		reStat.var29 = sheet.resARMBrk or false;
            		reStat.var30 = sheet.resSPIBrk or false;
            		reStat.var31 = sheet.resStop or false;
            		reStat.var32 = sheet.resToad or false;
            		reStat.var33 = sheet.resVenom or false;
            		reStat.var34 = sheet.resElemWeak or false;
            		reStat.var35 = sheet.resCharm or false;
            		reStat.var36 = sheet.resDeath or false;
            		reStat.var37 = sheet.resFrozen or false;
            		reStat.var38 = sheet.resGravity or false;
            		reStat.var39 = sheet.resHeat or false;
            		reStat.var40 = sheet.resMeltdown or false;
            		reStat.var41 = sheet.resStone or false;
            
            		local imStat = {}
            		imStat.var1 = sheet.immBerserk or false;
            		imStat.var2 = sheet.immBlind or false;
            		imStat.var3 = sheet.immImmobilize or false;
            		imStat.var4 = sheet.immPoison or false;
            		imStat.var5 = sheet.immSleep or false;
            		imStat.var6 = sheet.immSlow or false;
            		imStat.var7 = sheet.immZombie or false;
            		imStat.var8 = sheet.immLock or false;
            		imStat.var9 = sheet.immCondemn or false;
            		imStat.var10 = sheet.immConfuse or false;
            		imStat.var11 = sheet.immCurse or false;
            		imStat.var12 = sheet.immDisable or false;
            		imStat.var13 = sheet.immPetrify or false;
            		imStat.var14 = sheet.immSilence or false;
            		imStat.var15 = sheet.immSap or false;
            		imStat.var16 = sheet.immUnaware or false;
            		imStat.var17 = sheet.immEject or false;
            		imStat.var18 = sheet.immMini or false;
            		imStat.var19 = sheet.immSTRDown or false;
            		imStat.var20 = sheet.immAGIDown or false;
            		imStat.var21 = sheet.immMAGDown or false;
            		imStat.var22 = sheet.immMENDown or false;
            		imStat.var23 = sheet.immARMDown or false;
            		imStat.var24 = sheet.immSPIDown or false;
            		imStat.var25 = sheet.immSTRBrk or false;
            		imStat.var26 = sheet.immAGIBrk or false;
            		imStat.var27 = sheet.immMAGBrk or false;
            		imStat.var28 = sheet.immMENBrk or false;
            		imStat.var29 = sheet.immARMBrk or false;
            		imStat.var30 = sheet.immSPIBrk or false;
            		imStat.var31 = sheet.immStop or false;
            		imStat.var32 = sheet.immToad or false;
            		imStat.var33 = sheet.immVenom or false;
            		imStat.var34 = sheet.immElemWeak or false;
            		imStat.var35 = sheet.immCharm or false;
            		imStat.var36 = sheet.immDeath or false;
            		imStat.var37 = sheet.immFrozen or false;
            		imStat.var38 = sheet.immGravity or false;
            		imStat.var39 = sheet.immHeat or false;
            		imStat.var40 = sheet.immMeltdown or false;
            		imStat.var41 = sheet.immStone or false;
            
            		local imCAT = {}
            		local ReCAT = {}
            		ReCAT.var1 = sheet.resFatal or false;
            		ReCAT.var2 = sheet.resMystify or false;
            		ReCAT.var3 = sheet.resSeal or false;
            		ReCAT.var4 = sheet.resTime or false;
            		ReCAT.var5 = sheet.resToxin or false;
            		ReCAT.var6 = sheet.resTransform or false;
            		ReCAT.var7 = sheet.resWeaken or false;
            		imCAT.var1 = sheet.immFatal or false;		
            		imCAT.var2 = sheet.immMystify or false;
            		imCAT.var3 = sheet.immSeal or false;
            		imCAT.var4 = sheet.immTime or false;
            		imCAT.var5 = sheet.immToxin or false;
            		imCAT.var6 = sheet.immTransform or false;
            		imCAT.var7 = sheet.immWeaken or false;
            
            		local immALL = sheet.immStatus or false;
            			if immALL then
            				for i=1,41,1 do
            					reStat["var" .. i] = false;
            					imStat["var" .. i] = false;
            					end
            				for i=1,7,1 do
            					ReCAT["var" .. i] = false;
            					imCAT["var" .. i] = false;
            					end
            				setEG1(80,30)
            				end
            		
            		if (imCAT.var1) then
            			ReCAT.var1 = false;
            			reStat.var9 = false;
            			reStat.var17 = false;
            			reStat.var36 = false;
            			reStat.var37 = false;
            			reStat.var38 = false;
            			reStat.var39 = false;	
            			imStat.var9 = false;
            			imStat.var17 = false;
            			imStat.var36 = false;
            			imStat.var37 = false;
            			imStat.var38 = false;
            			imStat.var39 = false;
            			if ((bTIPO ~= "Boss") and (bTIPO ~= "End Boss")) then
            				setEG1(25,10)
            				end
            			end			
            		if (imCAT.var2) then
            			ReCAT.var2 = false
            			reStat.var1 = false;
            			reStat.var10 = false;
            			reStat.var16 = false;
            			reStat.var35 = false;
            			imStat.var1 = false;
            			imStat.var10 = false;
            			imStat.var16 = false;
            			imStat.var35 = false;
            			setEG1(18,8)
            			end
            		if (imCAT.var3) then
            			ReCAT.var3 = false;
            			reStat.var2 = false;
            			reStat.var5 = false;
            			reStat.var11 = false;
            			reStat.var13 = false;
            			reStat.var14 = false;
            			reStat.var41 = false;
            			imStat.var2 = false;
            			imStat.var5 = false;
            			imStat.var11 = false;
            			imStat.var13 = false;
            			imStat.var14 = false;
            			imStat.var41 = false;
            			setEG1(22,9)
            			end
            		if (imCAT.var4) then
            			ReCAT.var4 = false;
            			reStat.var3 = false;
            			reStat.var6 = false;
            			reStat.var12 = false;
            			reStat.var15 = false;
            			reStat.var31 = false;
            			imStat.var3 = false;
            			imStat.var6 = false;
            			imStat.var12 = false;
            			imStat.var15 = false;
            			imStat.var31 = false;
            			setEG1(12,5)
            			end
            		if (imCAT.var5) then
            			ReCAT.var5 = false;
            			reStat.var4 = false;
            			reStat.var33 = false;
            			imStat.var4 = false;
            			imStat.var33 = false;
            			setEG1(13,5)
            			end
            		if (imCAT.var6) then
            			ReCAT.var6 = false;
            			reStat.var7 = false;
            			reStat.var18 = false;
            			reStat.var32 = false;	
            			imStat.var7 = false;
            			imStat.var18 = false;
            			imStat.var32 = false;	
            			setEG1(18,7)	
            			end
            		if (imCAT.var7) then
            			ReCAT.var7 = false;
            			reStat.var8 = false;
            			reStat.var19 = false;
            			reStat.var20 = false;
            			reStat.var21 = false;
            			reStat.var22 = false;
            			reStat.var23 = false;
            			reStat.var24 = false;
            			reStat.var25 = false;
            			reStat.var26 = false;
            			reStat.var27 = false;
            			reStat.var28 = false;
            			reStat.var29 = false;
            			reStat.var30 = false;
            			reStat.var34 = false;
            			reStat.var40 = false;	
            			imStat.var8 = false;
            			imStat.var19 = false;
            			imStat.var20 = false;
            			imStat.var21 = false;
            			imStat.var22 = false;
            			imStat.var23 = false;
            			imStat.var24 = false;
            			imStat.var25 = false;
            			imStat.var26 = false;
            			imStat.var27 = false;
            			imStat.var28 = false;
            			imStat.var29 = false;
            			imStat.var30 = false;
            			imStat.var34 = false;
            			imStat.var40 = false;		
            			setEG1(19,8)			
            			end
            		if (ReCAT.var1) then
            			reStat.var9 = false;
            			reStat.var17 = false;
            			reStat.var36 = false;
            			reStat.var37 = false;
            			reStat.var38 = false;
            			reStat.var39 = false;			
            			setEG1(13,5)			
            			end			
            		if (ReCAT.var2) then
            			reStat.var1 = false;
            			reStat.var10 = false;
            			reStat.var16 = false;
            			reStat.var35 = false;		
            			setEG1(9,4)		
            			end
            		if (ReCAT.var3) then
            			reStat.var2 = false;
            			reStat.var5 = false;
            			reStat.var11 = false;
            			reStat.var13 = false;
            			reStat.var14 = false;
            			reStat.var41 = false;		
            			setEG1(11,4)		
            			end
            		if (ReCAT.var4) then
            			reStat.var3 = false;
            			reStat.var6 = false;
            			reStat.var12 = false;
            			reStat.var15 = false;
            			reStat.var31 = false;		
            			setEG1(6,2)		
            			end
            		if (ReCAT.var5) then
            			reStat.var4 = false;
            			reStat.var33 = false;		
            			setEG1(6,2)		
            			end
            		if (ReCAT.var6) then
            			reStat.var7 = false;
            			reStat.var18 = false;
            			reStat.var32 = false;			
            			setEG1(9,3)			
            			end
            		if (ReCAT.var7) then
            			reStat.var8 = false;
            			reStat.var19 = false;
            			reStat.var20 = false;
            			reStat.var21 = false;
            			reStat.var22 = false;
            			reStat.var23 = false;
            			reStat.var24 = false;
            			reStat.var25 = false;
            			reStat.var26 = false;
            			reStat.var27 = false;
            			reStat.var28 = false;
            			reStat.var29 = false;
            			reStat.var30 = false;
            			reStat.var34 = false;
            			reStat.var40 = false;		
            			setEG1(9,4)					
            			end
            		
            		
            		for i=1,8,1 do
            			if ((reStat["var" .. i]) and (not imStat["var" .. i])) then
            				setEG1(2,1)
            				end
            			end
            		for i=9,16,1 do
            			if ((reStat["var" .. i]) and (not imStat["var" .. i])) then
            				setEG1(4,1)
            				end
            			end
            		for i=17,34,1 do
            			if ((reStat["var" .. i]) and (not imStat["var" .. i])) then
            				setEG1(6,2)
            				end
            			end
            		for i=35,41,1 do
            			if ((reStat["var" .. i]) and (not imStat["var" .. i])) then
            				setEG1(8,3)
            				end
            			end
            			
            		for i=1,8,1 do
            			if (imStat["var" .. i])  then
            				setEG1(5,2)
            				end
            			end
            		for i=9,16,1 do
            			if (imStat["var" .. i]) then
            				setEG1(9,3)
            				end
            			end
            		for i=17,34,1 do
            			if (imStat["var" .. i]) then
            				setEG1(12,5)
            				end
            			end
            		for i=35,41,1 do
            			if (imStat["var" .. i]) then
            				setEG1(16,6)
            				end
            			if ((i== 36) and (bTIPO ~= "Notorious")) then
            				setEG1(-16,-6)
            				end
            			end
            
            		local ManaBound = sheet.supMBound or false;
            		if ManaBound then
            			setEG1(-30,-10)
            			end
            		local Minion = sheet.supMinion or false;
            		if Minion then
            			setEG1(-20,-7)
            			end		
            		
            		local Drain = {}
            		Drain.var1 = sheet.supNDrain or false;
            		Drain.var2 = sheet.supRDrain or false;
            		if ((Drain.var2) and (not Drain.var1)) then
            			setEG1(7,3)
            			end	
            		if (Drain.var1) then
            			setEG1(15,7)
            			end				
            
            		local XFight = sheet.supXFight or false;
            		if (XFight) then
            			setEG1(50,18)
            			end	
            
            		local FIELD = {}
            		FIELD.var1 = sheet.fieldAttack or false;
            		if (FIELD.var1) then
            			setEG1(22,7)
            			end				
            		FIELD.var2 = sheet.fieldSap or false;
            		if (FIELD.var2) then
            			setEG1(48,16)
            			end	
            		FIELD.var3 = sheet.fieldItem or false;
            		if (FIELD.var3) then
            			setEG1(33,11)
            			end	
            		FIELD.var4 = sheet.fieldMagic or false;
            		if (FIELD.var4) then
            			setEG1(48,16)
            			end	
            		FIELD.var5 = sheet.fieldMagnetic or false;
            		if (FIELD.var5) then
            			setEG1(48,16)
            			end	
            		FIELD.var6 = sheet.fieldMPSap or false;
            		if (FIELD.var6) then
            			setEG1(48,16)
            			end	
            		FIELD.var7 = sheet.fieldSpell or false;
            		if (FIELD.var7) then
            			setEG1(33,11)
            			end	
            		FIELD.var8 = sheet.fieldTech or false;
            		if (FIELD.var8) then
            			setEG1(48,16)
            			end
            
            		local BOSS = {}
            		BOSS.var1 = sheet.bossDecoy or false
            		BOSS.var2 = sheet.bossDecoyNum or 1;
            		BOSS.var3 = 20*BOSS.var2;
            		BOSS.var4 = 25*BOSS.var2;
            		if (BOSS.var1) then
            			setEG1(BOSS.var3,BOSS.var4)
            			end		
            		BOSS.var5 = sheet.bossSlave or false
            		BOSS.var6 = sheet.bossSlaveN or false
            		BOSS.var7 = sheet.bossSlaveS or false
            		BOSS.var8 = sheet.bossSlaveN1 or 1;
            		BOSS.var9 = sheet.bossSlaveN2 or 1;
            		BOSS.var10 = -30 * BOSS.var8;
            		BOSS.var11 = -10 * BOSS.var8;
            		BOSS.var12 = -10 * BOSS.var9;
            		BOSS.var13 = -5 * BOSS.var9;
            		if (BOSS.var5) then
            			if (BOSS.var6) then
            				setEG1(BOSS.var10,BOSS.var11)
            				end
            			if (BOSS.var7) then
            				setEG1(BOSS.var12,BOSS.var13)
            				end
            			end			
            		BOSS.var14 = sheet.bossXACtion or false
            		if (BOSS.var14) then
            			setEG1(80,30)
            			end		
            		
            		COUNTER = {}
            		COUNTER.var1 = sheet.reCAtk50;
            		COUNTER.var2 = sheet.reCAtk75;
            		COUNTER.var3 = sheet.reCAtk100;
            		COUNTER.var4 = sheet.reCAtkSOSL;
            		COUNTER.var5 = sheet.reCAtkSOSG;
            		COUNTER.var6 = sheet.reCAtkUns;
            		COUNTER.var7 = 1;
            		if (COUNTER.var4) then
            			COUNTER.var7 = COUNTER.var7 -0.25;
            			end
            		if (COUNTER.var5) then
            			COUNTER.var7 = COUNTER.var7 -0.25;
            			end
            		if (COUNTER.var6) then
            			COUNTER.var7 = COUNTER.var7 +1;
            			end
            		COUNTER.var8 = 0;
            		COUNTER.var9 = 0;	
            		if ((COUNTER.var1) and (not COUNTER.var2) and (not COUNTER.var3)) then
            			COUNTER.var8 = math.floor(14*COUNTER.var7)
            			COUNTER.var9 = math.floor(7*COUNTER.var7)
            			setEG1(COUNTER.var8,COUNTER.var9)
            			end
            		if ((COUNTER.var2) and (not COUNTER.var3)) then
            			COUNTER.var8 = math.floor(22*COUNTER.var7)
            			COUNTER.var9 = math.floor(11*COUNTER.var7)
            			setEG1(COUNTER.var8,COUNTER.var9)
            			end
            		if (COUNTER.var3) then
            			COUNTER.var8 = math.floor(44*COUNTER.var7)
            			COUNTER.var9 = math.floor(22*COUNTER.var7)
            			setEG1(COUNTER.var8,COUNTER.var9)
            			end
            			
            		MCOUNTER = {}
            		MCOUNTER.var1 = sheet.reCMag50;
            		MCOUNTER.var2 = sheet.reCMag75;
            		MCOUNTER.var3 = sheet.reCMag100;
            		MCOUNTER.var4 = sheet.reCMagSOSL;
            		MCOUNTER.var5 = sheet.reCMagSOSG;
            		MCOUNTER.var6 = sheet.reCMagUns;
            		MCOUNTER.var7 = 1;
            		if (MCOUNTER.var4) then
            			MCOUNTER.var7 = MCOUNTER.var7 -0.25;
            			end
            		if (MCOUNTER.var5) then
            			MCOUNTER.var7 = MCOUNTER.var7 -0.25;
            			end
            		if (MCOUNTER.var6) then
            			MCOUNTER.var7 = MCOUNTER.var7 +1;
            			end
            		MCOUNTER.var8 = 0;
            		MCOUNTER.var9 = 0;
            		if ((MCOUNTER.var1) and (not MCOUNTER.var2) and (not MCOUNTER.var3)) then
            			MCOUNTER.var8 = math.floor(15*MCOUNTER.var7)
            			MCOUNTER.var9 = math.floor(7*MCOUNTER.var7)
            			setEG1(MCOUNTER.var8,MCOUNTER.var9)
            			end
            		if ((MCOUNTER.var2) and (not MCOUNTER.var3)) then
            			MCOUNTER.var8 = math.floor(24*MCOUNTER.var7)
            			MCOUNTER.var9 = math.floor(12*MCOUNTER.var7)
            			setEG1(MCOUNTER.var8,MCOUNTER.var9)
            			end
            		if (MCOUNTER.var3) then
            			MCOUNTER.var8 = math.floor(48*MCOUNTER.var7)
            			MCOUNTER.var9 = math.floor(24*MCOUNTER.var7)
            			setEG1(MCOUNTER.var8,MCOUNTER.var9)
            			end
            			
            		CSTANCE = {}
            		CSTANCE.var1 = sheet.reCStanPhys;
            		CSTANCE.var2 = sheet.reCStanSOSL;
            		CSTANCE.var3 = sheet.reCStanSOSG;
            		CSTANCE.var4 = sheet.reCStanUns;
            		CSTANCE.var5 = 1;
            		if (CSTANCE.var2) then
            			CSTANCE.var5 = CSTANCE.var5 -0.25;
            			end
            		if (CSTANCE.var3) then
            			CSTANCE.var5 = CSTANCE.var5 -0.25;
            			end
            		if (CSTANCE.var4) then
            			CSTANCE.var5 = CSTANCE.var5 +1;
            			end
            		CSTANCE.var6 = 0;
            		CSTANCE.var7 = 0;
            		if (CSTANCE.var1) then
            			CSTANCE.var6 = math.floor(15*CSTANCE.var5)
            			CSTANCE.var7 = math.floor(7*CSTANCE.var5)
            			setEG1(CSTANCE.var6,CSTANCE.var7)
            			end
            			
            		CSTANCE2 = {}
            		CSTANCE2.var1 = sheet.reCStanMag;
            		CSTANCE2.var2 = sheet.reCStanSOSL;
            		CSTANCE2.var3 = sheet.reCStanSOSG;
            		CSTANCE2.var4 = sheet.reCStanUns;
            		CSTANCE2.var5 = 1;
            		if (CSTANCE2.var2) then
            			CSTANCE2.var5 = CSTANCE2.var5 -0.25;
            			end
            		if (CSTANCE2.var3) then
            			CSTANCE2.var5 = CSTANCE2.var5 -0.25;
            			end
            		if (CSTANCE2.var4) then
            			CSTANCE2.var5 = CSTANCE2.var5 +1;
            			end
            		CSTANCE2.var6 = 0;
            		CSTANCE2.var7 = 0;
            		if (CSTANCE2.var1) then
            			CSTANCE2.var6 = math.floor(15*CSTANCE2.var5)
            			CSTANCE2.var7 = math.floor(7*CSTANCE2.var5)
            			setEG1(CSTANCE2.var6,CSTANCE2.var7)
            			end
            			
            		REFLECTD = {}
            		REFLECTD.var1 = sheet.reRD5;
            		REFLECTD.var2 = sheet.reRD10;
            		REFLECTD.var3 = sheet.reRD25;
            		REFLECTD.var4 = sheet.reRDSOSL;
            		REFLECTD.var5 = sheet.reRDSOSG;
            		REFLECTD.var6 = sheet.reRDUns;
            		REFLECTD.var7 = 1;
            		if (REFLECTD.var4) then
            			REFLECTD.var7 = REFLECTD.var7 -0.25;
            			end
            		if (REFLECTD.var5) then
            			REFLECTD.var7 = REFLECTD.var7 -0.25;
            			end
            		if (REFLECTD.var6) then
            			REFLECTD.var7 = REFLECTD.var7 +1;
            			end
            		REFLECTD.var8 = 0;
            		REFLECTD.var9 = 0;
            		if ((REFLECTD.var1) and (not REFLECTD.var2) and (not REFLECTD.var3)) then
            			REFLECTD.var8 = math.floor(25*REFLECTD.var7)
            			REFLECTD.var9 = math.floor(7*REFLECTD.var7)
            			setEG1(REFLECTD.var8,REFLECTD.var9)
            			end
            		if ((REFLECTD.var2) and (not REFLECTD.var3)) then
            			REFLECTD.var8 = math.floor(30*REFLECTD.var7)
            			REFLECTD.var9 = math.floor(10*REFLECTD.var7)
            			setEG1(REFLECTD.var8,REFLECTD.var9)
            			end
            		if (REFLECTD.var3) then
            			REFLECTD.var8 = math.floor(50*REFLECTD.var7)
            			REFLECTD.var9 = math.floor(17*REFLECTD.var7)
            			setEG1(REFLECTD.var8,REFLECTD.var9)
            			end
            
            
            		local FinAtk = {}
            		FinAtk.var1 = sheet.reCFin or false;
            		FinAtk.var2 = sheet.reCFinUns or false;
            		FinAtk.var3 = 1;
            		if (FinAtk.var2) then
            			FinAtk.var3 = FinAtk.var3+1;
            			end
            		FinAtk.var4 = math.floor(20*FinAtk.var3)
            		FinAtk.var5 = math.floor(10*FinAtk.var3)
            		if (FinAtk.var1) then
            			setEG1(FinAtk.var4,FinAtk.var5)		
            			end
            			
            		local Fission = {}
            		Fission.var1 = sheet.reCFiss or false;
            		Fission.var2 = sheet.reCFissUns or false;
            		Fission.var3 = 1;
            		if (Fission.var2) then
            			Fission.var3 = Fission.var3+1;
            			end
            		Fission.var4 = math.floor(10*Fission.var3)
            		Fission.var5 = math.floor(3*Fission.var3)
            		if (Fission.var1) then
            			setEG1(Fission.var4,Fission.var5)		
            			end
            			
            		ROTATE = {}
            		ROTATE.var1 = sheet.reRotate;
            		ROTATE.var2 = sheet.reRotateGain;
            		ROTATE.var3 = sheet.reRotateLose;
            		ROTATE.var4 = sheet.reRotateUns;
            		ROTATE.var5 = 1;
            		if (ROTATE.var2) then
            			ROTATE.var5 = ROTATE.var5 -0.25;
            			end
            		if (ROTATE.var3) then
            			ROTATE.var5 = ROTATE.var5 -0.25;
            			end
            		if (ROTATE.var4) then
            			ROTATE.var5 = ROTATE.var5 +1;
            			end
            		ROTATE.var6 = 0;
            		ROTATE.var7 = 0;
            		if (ROTATE.var1) then
            			ROTATE.var6 = math.floor(21*ROTATE.var5)
            			ROTATE.var7 = math.floor(7*ROTATE.var5)
            			setEG1(ROTATE.var6,ROTATE.var7)
            			end
            
            		recSTAT = {}
            		recSTAT.var1 = sheet.recCSFloat or false;
            		recSTAT.var2 = sheet.recCSAgiUP or false;
            		recSTAT.var3 = sheet.recCSSpiUP or false;
            		recSTAT.var4 = sheet.recCSBIOSpikes or false;
            		recSTAT.var5 = sheet.recCSGNDSpikes or false;
            		recSTAT.var6 = sheet.recCSFIRSpikes or false;
            		recSTAT.var7 = sheet.recCSWATSpikes or false;
            		recSTAT.var8 = sheet.recCSWINSpikes or false;
            		recSTAT.var9 = sheet.recCSICESpikes or false;
            		recSTAT.var10 = sheet.recCSELESpikes or false;
            		recSTAT.var11 = sheet.recCSHOLSpikes or false;
            		recSTAT.var12 = sheet.recCSSHASpikes or false;
            		recSTAT.var13 = sheet.recCSProtect or false;
            		recSTAT.var14 = sheet.recCSShell or false;
            		recSTAT.var15 = sheet.recCSARMUP or false;
            		recSTAT.var16 = sheet.recCSMENUP or false;
            		recSTAT.var17 = sheet.recCSHaste or false;
            		recSTAT.var19 = sheet.recCSReflect or false;
            		recSTAT.var20 = sheet.recCSPOWUP or false;
            		recSTAT.var21 = sheet.recCSMAGUP or false;
            		recSTAT.var22 = sheet.recCSRegen or false;
            		recSTAT.var23 = sheet.recCSAura or false;
            		recSTAT.var24 = sheet.recCSVanish or false;
            		recSTAT.var25 = sheet.recCSGain or false;
            		recSTAT.var26 = sheet.recCSLose or false;
            		recSTAT.var27 = sheet.recCSUns or false;
            		recSTAT.var28 = 1;
            		if (recSTAT.var25) then
            			recSTAT.var28 = recSTAT.var28 -0.25;
            			end
            		if (recSTAT.var26) then
            			recSTAT.var28 = recSTAT.var28 -0.25;
            			end
            		if (recSTAT.var27) then
            			recSTAT.var28 = recSTAT.var28 +1;
            			end
            		recSTAT.var29 = 0;
            		recSTAT.var30 = 0;
            		for i=1,12,1 do
            			recSTAT.var29 = math.floor(30*recSTAT.var28);
            			recSTAT.var30 = math.floor(14*recSTAT.var28);
            			setEG1(ROTATE.var29,ROTATE.var30)
            			end
            		for i=13,16,1 do
            			recSTAT.var29 = math.floor(35*recSTAT.var28);
            			recSTAT.var30 = math.floor(16*recSTAT.var28);
            			setEG1(ROTATE.var29,ROTATE.var30)
            			end
            		for i=17,21,1 do
            			recSTAT.var29 = math.floor(43*recSTAT.var28);
            			recSTAT.var30 = math.floor(20*recSTAT.var28);
            			setEG1(ROTATE.var29,ROTATE.var30)
            			end
            		for i=22,24,1 do
            			recSTAT.var29 = math.floor(59*recSTAT.var28);
            			recSTAT.var30 = math.floor(24*recSTAT.var28);
            			setEG1(ROTATE.var29,ROTATE.var30)
            			end
            		
            		local Ataque1 = {}
            		Ataque1.var1 = tonumber(sheet.Atk1ExpF) or 0;
            		Ataque1.var2 = tonumber(sheet.Atk1GilF) or 0;
            		if ((Ataque1.var1 > 0) and (Ataque1.var2 >0)) then
            			setEG1(Ataque1.var1,Ataque1.var2)
            			end
            
            		local Ataque2 = {}
            		Ataque2.var1 = tonumber(sheet.Atk2ExpF) or 0;
            		Ataque2.var2 = tonumber(sheet.Atk2GilF) or 0;
            		if ((Ataque2.var1 > 0) and (Ataque2.var2 >0)) then
            			setEG1(Ataque2.var1,Ataque2.var2)
            			end
            
            		local Ataque3 = {}
            		Ataque3.var1 = tonumber(sheet.Atk3ExpF) or 0;
            		Ataque3.var2 = tonumber(sheet.Atk3GilF) or 0;
            		if ((Ataque3.var1 > 0) and (Ataque3.var2 >0)) then
            			setEG1(Ataque3.var1,Ataque3.var2)
            			end
            
            		local Ataque4 = {}
            		Ataque4.var1 = tonumber(sheet.Atk4ExpF) or 0;
            		Ataque4.var2 = tonumber(sheet.Atk4GilF) or 0;
            		if ((Ataque4.var1 > 0) or (Ataque4.var2 >0)) then
            			setEG1(Ataque4.var1,Ataque4.var2)
            			end	
            
            		local Ataque5 = {}
            		Ataque5.var1 = tonumber(sheet.Atk5ExpF) or 0;
            		Ataque5.var2 = tonumber(sheet.Atk5GilF) or 0;
            		if ((Ataque5.var1 > 0) or (Ataque5.var2 >0)) then
            			setEG1(Ataque5.var1,Ataque5.var2)
            			end	
            			
            		local Ataque6 = {}
            		Ataque6.var1 = tonumber(sheet.Atk6ExpF) or 0;
            		Ataque6.var2 = tonumber(sheet.Atk6GilF) or 0;
            		if ((Ataque6.var1 > 0) or (Ataque6.var2 >0)) then
            			setEG1(Ataque6.var1,Ataque6.var2)
            			end		
            			
            		local Special1 = {}
            		Special1.var1 = tonumber(sheet.Special1Exp) or 0;
            		Special1.var2 = tonumber(sheet.Special1Gil) or 0;
            		if ((Special1.var1 > 0) or (Special1.var2 >0)) then
            			setEG1(Special1.var1,Special1.var2)
            			end	
            		
            		local Special2 = {}
            		Special2.var1 = tonumber(sheet.Special2Exp) or 0;
            		Special2.var2 = tonumber(sheet.Special2Gil) or 0;
            		if ((Special2.var1 > 0) or (Special2.var2 >0)) then
            			setEG1(Special2.var1,Special2.var2)
            			end	
            			
            		local Special3 = {}
            		Special3.var1 = tonumber(sheet.Special3Exp) or 0;
            		Special3.var2 = tonumber(sheet.Special3Gil) or 0;
            		if ((Special3.var1 > 0) or (Special3.var2 >0)) then
            			setEG1(Special3.var1,Special3.var2)
            			end	
            			
            		local EXPVAR = {}
            		EXPVAR.var1 = sheet.baseEXP or 0;
            		EXPVAR.var2 = sheet.bonusEXP or 0;
            		
            		local GILVAR = {}
            		GILVAR.var1 = sheet.baseGIL or 0;
            		GILVAR.var2 = sheet.bonusGIL or 0;	
            		
            		sheet.ExpFinal = math.floor((EXPVAR.var1+EXPVAR.var2)*bLV);
            		sheet.GilFinal = math.floor((GILVAR.var1+GILVAR.var2)*bLV);
            		EXPVAR.var3 = sheet.ExpFinal or 0;
            		GILVAR.var3 = sheet.GilFinal or 0;
            		local NPLAYER = sheet.NPlayers or 1;
            		sheet.ExpEach = math.floor(EXPVAR.var3/NPLAYER);
            		sheet.GilEach = math.floor(GILVAR.var3/NPLAYER);
        end, obj);

    function obj:_releaseEvents()
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
        if self.popAbilitynameCannibalize ~= nil then self.popAbilitynameCannibalize:destroy(); self.popAbilitynameCannibalize = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.frmNotes ~= nil then self.frmNotes:destroy(); self.frmNotes = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.checkBox285 ~= nil then self.checkBox285:destroy(); self.checkBox285 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.BotaosupMinion ~= nil then self.BotaosupMinion:destroy(); self.BotaosupMinion = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.checkBox180 ~= nil then self.checkBox180:destroy(); self.checkBox180 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.checkBox378 ~= nil then self.checkBox378:destroy(); self.checkBox378 = nil; end;
        if self.popAbilitysupMBound ~= nil then self.popAbilitysupMBound:destroy(); self.popAbilitysupMBound = nil; end;
        if self.checkBox251 ~= nil then self.checkBox251:destroy(); self.checkBox251 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.checkBox484 ~= nil then self.checkBox484:destroy(); self.checkBox484 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.BotaofieldSpell ~= nil then self.BotaofieldSpell:destroy(); self.BotaofieldSpell = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.checkBox445 ~= nil then self.checkBox445:destroy(); self.checkBox445 = nil; end;
        if self.checkBox329 ~= nil then self.checkBox329:destroy(); self.checkBox329 = nil; end;
        if self.checkBox465 ~= nil then self.checkBox465:destroy(); self.checkBox465 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.BotaosupLMEva ~= nil then self.BotaosupLMEva:destroy(); self.BotaosupLMEva = nil; end;
        if self.checkBox475 ~= nil then self.checkBox475:destroy(); self.checkBox475 = nil; end;
        if self.BotaoaaSealStat ~= nil then self.BotaoaaSealStat:destroy(); self.BotaoaaSealStat = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.checkBox197 ~= nil then self.checkBox197:destroy(); self.checkBox197 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.frmAction ~= nil then self.frmAction:destroy(); self.frmAction = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.checkBox293 ~= nil then self.checkBox293:destroy(); self.checkBox293 = nil; end;
        if self.checkBox202 ~= nil then self.checkBox202:destroy(); self.checkBox202 = nil; end;
        if self.radioButton29 ~= nil then self.radioButton29:destroy(); self.radioButton29 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.checkBox288 ~= nil then self.checkBox288:destroy(); self.checkBox288 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.BotaonameAutoStat ~= nil then self.BotaonameAutoStat:destroy(); self.BotaonameAutoStat = nil; end;
        if self.checkBox311 ~= nil then self.checkBox311:destroy(); self.checkBox311 = nil; end;
        if self.BotaonameSOSStat ~= nil then self.BotaonameSOSStat:destroy(); self.BotaonameSOSStat = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.radioButton26 ~= nil then self.radioButton26:destroy(); self.radioButton26 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.checkBox254 ~= nil then self.checkBox254:destroy(); self.checkBox254 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.checkBox211 ~= nil then self.checkBox211:destroy(); self.checkBox211 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.checkBox176 ~= nil then self.checkBox176:destroy(); self.checkBox176 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.popAbilityaaEscape ~= nil then self.popAbilityaaEscape:destroy(); self.popAbilityaaEscape = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.radioButton23 ~= nil then self.radioButton23:destroy(); self.radioButton23 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.checkBox307 ~= nil then self.checkBox307:destroy(); self.checkBox307 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.popAbilitynamElemImm ~= nil then self.popAbilitynamElemImm:destroy(); self.popAbilitynamElemImm = nil; end;
        if self.textEditor54 ~= nil then self.textEditor54:destroy(); self.textEditor54 = nil; end;
        if self.textEditor43 ~= nil then self.textEditor43:destroy(); self.textEditor43 = nil; end;
        if self.radioButton39 ~= nil then self.radioButton39:destroy(); self.radioButton39 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.BotaonamElemPot ~= nil then self.BotaonamElemPot:destroy(); self.BotaonamElemPot = nil; end;
        if self.checkBox487 ~= nil then self.checkBox487:destroy(); self.checkBox487 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.popAbilitybossSlave ~= nil then self.popAbilitybossSlave:destroy(); self.popAbilitybossSlave = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.BotaonamElemRes ~= nil then self.BotaonamElemRes:destroy(); self.BotaonamElemRes = nil; end;
        if self.checkBox145 ~= nil then self.checkBox145:destroy(); self.checkBox145 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.popAbilitynamMEvasion ~= nil then self.popAbilitynamMEvasion:destroy(); self.popAbilitynamMEvasion = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.checkBox223 ~= nil then self.checkBox223:destroy(); self.checkBox223 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.textEditor40 ~= nil then self.textEditor40:destroy(); self.textEditor40 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.checkBox410 ~= nil then self.checkBox410:destroy(); self.checkBox410 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.checkBox479 ~= nil then self.checkBox479:destroy(); self.checkBox479 = nil; end;
        if self.popAbilityaaClone ~= nil then self.popAbilityaaClone:destroy(); self.popAbilityaaClone = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.checkBox464 ~= nil then self.checkBox464:destroy(); self.checkBox464 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.checkBox355 ~= nil then self.checkBox355:destroy(); self.checkBox355 = nil; end;
        if self.checkBox433 ~= nil then self.checkBox433:destroy(); self.checkBox433 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox199 ~= nil then self.checkBox199:destroy(); self.checkBox199 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.checkBox412 ~= nil then self.checkBox412:destroy(); self.checkBox412 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.checkBox237 ~= nil then self.checkBox237:destroy(); self.checkBox237 = nil; end;
        if self.BotaoaaItemUse ~= nil then self.BotaoaaItemUse:destroy(); self.BotaoaaItemUse = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.checkBox153 ~= nil then self.checkBox153:destroy(); self.checkBox153 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox458 ~= nil then self.checkBox458:destroy(); self.checkBox458 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.checkBox159 ~= nil then self.checkBox159:destroy(); self.checkBox159 = nil; end;
        if self.checkBox319 ~= nil then self.checkBox319:destroy(); self.checkBox319 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox473 ~= nil then self.checkBox473:destroy(); self.checkBox473 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.popAbilityreCFissUns ~= nil then self.popAbilityreCFissUns:destroy(); self.popAbilityreCFissUns = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.checkBox239 ~= nil then self.checkBox239:destroy(); self.checkBox239 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.popAbilitysupLMEva ~= nil then self.popAbilitysupLMEva:destroy(); self.popAbilitysupLMEva = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.checkBox382 ~= nil then self.checkBox382:destroy(); self.checkBox382 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.textEditor66 ~= nil then self.textEditor66:destroy(); self.textEditor66 = nil; end;
        if self.checkBox174 ~= nil then self.checkBox174:destroy(); self.checkBox174 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.frmSupportC ~= nil then self.frmSupportC:destroy(); self.frmSupportC = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.BotaonamStatRes ~= nil then self.BotaonamStatRes:destroy(); self.BotaonamStatRes = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.textEditor46 ~= nil then self.textEditor46:destroy(); self.textEditor46 = nil; end;
        if self.checkBox240 ~= nil then self.checkBox240:destroy(); self.checkBox240 = nil; end;
        if self.popAbilityreaCounterRD ~= nil then self.popAbilityreaCounterRD:destroy(); self.popAbilityreaCounterRD = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.BotaomaFloat ~= nil then self.BotaomaFloat:destroy(); self.BotaomaFloat = nil; end;
        if self.BotaospeBadScan ~= nil then self.BotaospeBadScan:destroy(); self.BotaospeBadScan = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.checkBox192 ~= nil then self.checkBox192:destroy(); self.checkBox192 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.BotaoreaCounterM ~= nil then self.BotaoreaCounterM:destroy(); self.BotaoreaCounterM = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.checkBox413 ~= nil then self.checkBox413:destroy(); self.checkBox413 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.comboBox45 ~= nil then self.comboBox45:destroy(); self.comboBox45 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.checkBox173 ~= nil then self.checkBox173:destroy(); self.checkBox173 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.BotaoreaCounterS ~= nil then self.BotaoreaCounterS:destroy(); self.BotaoreaCounterS = nil; end;
        if self.checkBox420 ~= nil then self.checkBox420:destroy(); self.checkBox420 = nil; end;
        if self.checkBox227 ~= nil then self.checkBox227:destroy(); self.checkBox227 = nil; end;
        if self.checkBox373 ~= nil then self.checkBox373:destroy(); self.checkBox373 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.checkBox344 ~= nil then self.checkBox344:destroy(); self.checkBox344 = nil; end;
        if self.checkBox429 ~= nil then self.checkBox429:destroy(); self.checkBox429 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.checkBox336 ~= nil then self.checkBox336:destroy(); self.checkBox336 = nil; end;
        if self.checkBox422 ~= nil then self.checkBox422:destroy(); self.checkBox422 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor35 ~= nil then self.textEditor35:destroy(); self.textEditor35 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.checkBox151 ~= nil then self.checkBox151:destroy(); self.checkBox151 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.textEditor52 ~= nil then self.textEditor52:destroy(); self.textEditor52 = nil; end;
        if self.popAbilityfieldTech ~= nil then self.popAbilityfieldTech:destroy(); self.popAbilityfieldTech = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.BotaoreaCounterRD ~= nil then self.BotaoreaCounterRD:destroy(); self.BotaoreaCounterRD = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.checkBox418 ~= nil then self.checkBox418:destroy(); self.checkBox418 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.BotaoreCFissUns ~= nil then self.BotaoreCFissUns:destroy(); self.BotaoreCFissUns = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.checkBox316 ~= nil then self.checkBox316:destroy(); self.checkBox316 = nil; end;
        if self.checkBox403 ~= nil then self.checkBox403:destroy(); self.checkBox403 = nil; end;
        if self.checkBox460 ~= nil then self.checkBox460:destroy(); self.checkBox460 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox294 ~= nil then self.checkBox294:destroy(); self.checkBox294 = nil; end;
        if self.checkBox273 ~= nil then self.checkBox273:destroy(); self.checkBox273 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.popAbilityfieldAttack ~= nil then self.popAbilityfieldAttack:destroy(); self.popAbilityfieldAttack = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.popAbilitysupMinion ~= nil then self.popAbilitysupMinion:destroy(); self.popAbilitysupMinion = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.checkBox485 ~= nil then self.checkBox485:destroy(); self.checkBox485 = nil; end;
        if self.textEditor45 ~= nil then self.textEditor45:destroy(); self.textEditor45 = nil; end;
        if self.checkBox322 ~= nil then self.checkBox322:destroy(); self.checkBox322 = nil; end;
        if self.checkBox436 ~= nil then self.checkBox436:destroy(); self.checkBox436 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.popAbilitynameAutoStat ~= nil then self.popAbilitynameAutoStat:destroy(); self.popAbilitynameAutoStat = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.textEditor63 ~= nil then self.textEditor63:destroy(); self.textEditor63 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.checkBox155 ~= nil then self.checkBox155:destroy(); self.checkBox155 = nil; end;
        if self.checkBox190 ~= nil then self.checkBox190:destroy(); self.checkBox190 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.checkBox469 ~= nil then self.checkBox469:destroy(); self.checkBox469 = nil; end;
        if self.popAbilitysupRDrain ~= nil then self.popAbilitysupRDrain:destroy(); self.popAbilitysupRDrain = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.checkBox440 ~= nil then self.checkBox440:destroy(); self.checkBox440 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.checkBox430 ~= nil then self.checkBox430:destroy(); self.checkBox430 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.checkBox326 ~= nil then self.checkBox326:destroy(); self.checkBox326 = nil; end;
        if self.checkBox438 ~= nil then self.checkBox438:destroy(); self.checkBox438 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.checkBox357 ~= nil then self.checkBox357:destroy(); self.checkBox357 = nil; end;
        if self.checkBox423 ~= nil then self.checkBox423:destroy(); self.checkBox423 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.BotaoaaIPrison ~= nil then self.BotaoaaIPrison:destroy(); self.BotaoaaIPrison = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.checkBox241 ~= nil then self.checkBox241:destroy(); self.checkBox241 = nil; end;
        if self.popAbilityreaCounterS ~= nil then self.popAbilityreaCounterS:destroy(); self.popAbilityreaCounterS = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.popAbilitynamElemPot ~= nil then self.popAbilitynamElemPot:destroy(); self.popAbilitynamElemPot = nil; end;
        if self.checkBox390 ~= nil then self.checkBox390:destroy(); self.checkBox390 = nil; end;
        if self.checkBox236 ~= nil then self.checkBox236:destroy(); self.checkBox236 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.popAbilityreRotate ~= nil then self.popAbilityreRotate:destroy(); self.popAbilityreRotate = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.checkBox385 ~= nil then self.checkBox385:destroy(); self.checkBox385 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.checkBox456 ~= nil then self.checkBox456:destroy(); self.checkBox456 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.checkBox169 ~= nil then self.checkBox169:destroy(); self.checkBox169 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.checkBox263 ~= nil then self.checkBox263:destroy(); self.checkBox263 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.popAbilitynamElemRes ~= nil then self.popAbilitynamElemRes:destroy(); self.popAbilitynamElemRes = nil; end;
        if self.checkBox255 ~= nil then self.checkBox255:destroy(); self.checkBox255 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.checkBox480 ~= nil then self.checkBox480:destroy(); self.checkBox480 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox219 ~= nil then self.checkBox219:destroy(); self.checkBox219 = nil; end;
        if self.checkBox305 ~= nil then self.checkBox305:destroy(); self.checkBox305 = nil; end;
        if self.checkBox341 ~= nil then self.checkBox341:destroy(); self.checkBox341 = nil; end;
        if self.checkBox448 ~= nil then self.checkBox448:destroy(); self.checkBox448 = nil; end;
        if self.popAbilitynameAddstatus ~= nil then self.popAbilitynameAddstatus:destroy(); self.popAbilitynameAddstatus = nil; end;
        if self.checkBox281 ~= nil then self.checkBox281:destroy(); self.checkBox281 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.checkBox455 ~= nil then self.checkBox455:destroy(); self.checkBox455 = nil; end;
        if self.textEditor69 ~= nil then self.textEditor69:destroy(); self.textEditor69 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.checkBox212 ~= nil then self.checkBox212:destroy(); self.checkBox212 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.popAbilityimmStatus ~= nil then self.popAbilityimmStatus:destroy(); self.popAbilityimmStatus = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.checkBox369 ~= nil then self.checkBox369:destroy(); self.checkBox369 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.BotaosupLEva ~= nil then self.BotaosupLEva:destroy(); self.BotaosupLEva = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.checkBox246 ~= nil then self.checkBox246:destroy(); self.checkBox246 = nil; end;
        if self.textEditor61 ~= nil then self.textEditor61:destroy(); self.textEditor61 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.checkBox383 ~= nil then self.checkBox383:destroy(); self.checkBox383 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.BotaonamEvasion ~= nil then self.BotaonamEvasion:destroy(); self.BotaonamEvasion = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.checkBox380 ~= nil then self.checkBox380:destroy(); self.checkBox380 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.checkBox467 ~= nil then self.checkBox467:destroy(); self.checkBox467 = nil; end;
        if self.popAbilityaaSealStat ~= nil then self.popAbilityaaSealStat:destroy(); self.popAbilityaaSealStat = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.checkBox238 ~= nil then self.checkBox238:destroy(); self.checkBox238 = nil; end;
        if self.checkBox330 ~= nil then self.checkBox330:destroy(); self.checkBox330 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.checkBox324 ~= nil then self.checkBox324:destroy(); self.checkBox324 = nil; end;
        if self.checkBox411 ~= nil then self.checkBox411:destroy(); self.checkBox411 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox275 ~= nil then self.checkBox275:destroy(); self.checkBox275 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.checkBox170 ~= nil then self.checkBox170:destroy(); self.checkBox170 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.checkBox214 ~= nil then self.checkBox214:destroy(); self.checkBox214 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.checkBox394 ~= nil then self.checkBox394:destroy(); self.checkBox394 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.checkBox234 ~= nil then self.checkBox234:destroy(); self.checkBox234 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.textEditor36 ~= nil then self.textEditor36:destroy(); self.textEditor36 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.popAbilitynamElemWk ~= nil then self.popAbilitynamElemWk:destroy(); self.popAbilitynamElemWk = nil; end;
        if self.BotaonamComeback ~= nil then self.BotaonamComeback:destroy(); self.BotaonamComeback = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.popAbilitymaWater ~= nil then self.popAbilitymaWater:destroy(); self.popAbilitymaWater = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.checkBox466 ~= nil then self.checkBox466:destroy(); self.checkBox466 = nil; end;
        if self.checkBox210 ~= nil then self.checkBox210:destroy(); self.checkBox210 = nil; end;
        if self.popAbilitymaGround ~= nil then self.popAbilitymaGround:destroy(); self.popAbilitymaGround = nil; end;
        if self.checkBox290 ~= nil then self.checkBox290:destroy(); self.checkBox290 = nil; end;
        if self.checkBox308 ~= nil then self.checkBox308:destroy(); self.checkBox308 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.popAbilityspeNoScan ~= nil then self.popAbilityspeNoScan:destroy(); self.popAbilityspeNoScan = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.checkBox342 ~= nil then self.checkBox342:destroy(); self.checkBox342 = nil; end;
        if self.checkBox457 ~= nil then self.checkBox457:destroy(); self.checkBox457 = nil; end;
        if self.checkBox332 ~= nil then self.checkBox332:destroy(); self.checkBox332 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.BotaobossSlaveAR ~= nil then self.BotaobossSlaveAR:destroy(); self.BotaobossSlaveAR = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.popAbilityaaItemUse ~= nil then self.popAbilityaaItemUse:destroy(); self.popAbilityaaItemUse = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.BotaomaBurrow ~= nil then self.BotaomaBurrow:destroy(); self.BotaomaBurrow = nil; end;
        if self.radioButton19 ~= nil then self.radioButton19:destroy(); self.radioButton19 = nil; end;
        if self.popAbilityaaImprison ~= nil then self.popAbilityaaImprison:destroy(); self.popAbilityaaImprison = nil; end;
        if self.checkBox149 ~= nil then self.checkBox149:destroy(); self.checkBox149 = nil; end;
        if self.popAbilitysupLEva ~= nil then self.popAbilitysupLEva:destroy(); self.popAbilitysupLEva = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.checkBox345 ~= nil then self.checkBox345:destroy(); self.checkBox345 = nil; end;
        if self.checkBox193 ~= nil then self.checkBox193:destroy(); self.checkBox193 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.popAbilityreaCounterP ~= nil then self.popAbilityreaCounterP:destroy(); self.popAbilityreaCounterP = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.checkBox147 ~= nil then self.checkBox147:destroy(); self.checkBox147 = nil; end;
        if self.checkBox339 ~= nil then self.checkBox339:destroy(); self.checkBox339 = nil; end;
        if self.checkBox231 ~= nil then self.checkBox231:destroy(); self.checkBox231 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.checkBox337 ~= nil then self.checkBox337:destroy(); self.checkBox337 = nil; end;
        if self.checkBox482 ~= nil then self.checkBox482:destroy(); self.checkBox482 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.BotaofieldItem ~= nil then self.BotaofieldItem:destroy(); self.BotaofieldItem = nil; end;
        if self.checkBox230 ~= nil then self.checkBox230:destroy(); self.checkBox230 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.checkBox462 ~= nil then self.checkBox462:destroy(); self.checkBox462 = nil; end;
        if self.checkBox401 ~= nil then self.checkBox401:destroy(); self.checkBox401 = nil; end;
        if self.checkBox459 ~= nil then self.checkBox459:destroy(); self.checkBox459 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.checkBox381 ~= nil then self.checkBox381:destroy(); self.checkBox381 = nil; end;
        if self.popAbilityfieldSpell ~= nil then self.popAbilityfieldSpell:destroy(); self.popAbilityfieldSpell = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.checkBox249 ~= nil then self.checkBox249:destroy(); self.checkBox249 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.BotaofieldMagic ~= nil then self.BotaofieldMagic:destroy(); self.BotaofieldMagic = nil; end;
        if self.checkBox182 ~= nil then self.checkBox182:destroy(); self.checkBox182 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.radioButton21 ~= nil then self.radioButton21:destroy(); self.radioButton21 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.checkBox185 ~= nil then self.checkBox185:destroy(); self.checkBox185 = nil; end;
        if self.checkBox321 ~= nil then self.checkBox321:destroy(); self.checkBox321 = nil; end;
        if self.checkBox229 ~= nil then self.checkBox229:destroy(); self.checkBox229 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.checkBox156 ~= nil then self.checkBox156:destroy(); self.checkBox156 = nil; end;
        if self.textEditor59 ~= nil then self.textEditor59:destroy(); self.textEditor59 = nil; end;
        if self.BotaonamElemAbs ~= nil then self.BotaonamElemAbs:destroy(); self.BotaonamElemAbs = nil; end;
        if self.BotaoreaCounterP ~= nil then self.BotaoreaCounterP:destroy(); self.BotaoreaCounterP = nil; end;
        if self.radioButton31 ~= nil then self.radioButton31:destroy(); self.radioButton31 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.comboBox48 ~= nil then self.comboBox48:destroy(); self.comboBox48 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox163 ~= nil then self.checkBox163:destroy(); self.checkBox163 = nil; end;
        if self.textEditor62 ~= nil then self.textEditor62:destroy(); self.textEditor62 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.checkBox194 ~= nil then self.checkBox194:destroy(); self.checkBox194 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.popAbilitynamEvasion ~= nil then self.popAbilitynamEvasion:destroy(); self.popAbilitynamEvasion = nil; end;
        if self.checkBox320 ~= nil then self.checkBox320:destroy(); self.checkBox320 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.popAbilitynamElemAbs ~= nil then self.popAbilitynamElemAbs:destroy(); self.popAbilitynamElemAbs = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.comboBox44 ~= nil then self.comboBox44:destroy(); self.comboBox44 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.checkBox235 ~= nil then self.checkBox235:destroy(); self.checkBox235 = nil; end;
        if self.checkBox276 ~= nil then self.checkBox276:destroy(); self.checkBox276 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.popAbilityaaRestore ~= nil then self.popAbilityaaRestore:destroy(); self.popAbilityaaRestore = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.textEditor60 ~= nil then self.textEditor60:destroy(); self.textEditor60 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.checkBox205 ~= nil then self.checkBox205:destroy(); self.checkBox205 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.checkBox389 ~= nil then self.checkBox389:destroy(); self.checkBox389 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.BotaobossSlaveS ~= nil then self.BotaobossSlaveS:destroy(); self.BotaobossSlaveS = nil; end;
        if self.checkBox415 ~= nil then self.checkBox415:destroy(); self.checkBox415 = nil; end;
        if self.checkBox379 ~= nil then self.checkBox379:destroy(); self.checkBox379 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.frmSupportB ~= nil then self.frmSupportB:destroy(); self.frmSupportB = nil; end;
        if self.checkBox186 ~= nil then self.checkBox186:destroy(); self.checkBox186 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.comboBox46 ~= nil then self.comboBox46:destroy(); self.comboBox46 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.checkBox250 ~= nil then self.checkBox250:destroy(); self.checkBox250 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.BotaofieldMagnetic ~= nil then self.BotaofieldMagnetic:destroy(); self.BotaofieldMagnetic = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.checkBox295 ~= nil then self.checkBox295:destroy(); self.checkBox295 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor41 ~= nil then self.textEditor41:destroy(); self.textEditor41 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.checkBox318 ~= nil then self.checkBox318:destroy(); self.checkBox318 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.checkBox248 ~= nil then self.checkBox248:destroy(); self.checkBox248 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.checkBox417 ~= nil then self.checkBox417:destroy(); self.checkBox417 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.textEditor33 ~= nil then self.textEditor33:destroy(); self.textEditor33 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.checkBox282 ~= nil then self.checkBox282:destroy(); self.checkBox282 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.textEditor71 ~= nil then self.textEditor71:destroy(); self.textEditor71 = nil; end;
        if self.checkBox356 ~= nil then self.checkBox356:destroy(); self.checkBox356 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.textEditor70 ~= nil then self.textEditor70:destroy(); self.textEditor70 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.checkBox490 ~= nil then self.checkBox490:destroy(); self.checkBox490 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.popAbilityspeBadScan ~= nil then self.popAbilityspeBadScan:destroy(); self.popAbilityspeBadScan = nil; end;
        if self.BotaoimmStatus ~= nil then self.BotaoimmStatus:destroy(); self.BotaoimmStatus = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.checkBox270 ~= nil then self.checkBox270:destroy(); self.checkBox270 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.checkBox348 ~= nil then self.checkBox348:destroy(); self.checkBox348 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox172 ~= nil then self.checkBox172:destroy(); self.checkBox172 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.BotaoaaBPrison ~= nil then self.BotaoaaBPrison:destroy(); self.BotaoaaBPrison = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.checkBox483 ~= nil then self.checkBox483:destroy(); self.checkBox483 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.popAbilityaaVPrison ~= nil then self.popAbilityaaVPrison:destroy(); self.popAbilityaaVPrison = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.checkBox213 ~= nil then self.checkBox213:destroy(); self.checkBox213 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.popAbilityreCFin ~= nil then self.popAbilityreCFin:destroy(); self.popAbilityreCFin = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.checkBox441 ~= nil then self.checkBox441:destroy(); self.checkBox441 = nil; end;
        if self.textEditor44 ~= nil then self.textEditor44:destroy(); self.textEditor44 = nil; end;
        if self.checkBox160 ~= nil then self.checkBox160:destroy(); self.checkBox160 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.popAbilitymaBurrow ~= nil then self.popAbilitymaBurrow:destroy(); self.popAbilitymaBurrow = nil; end;
        if self.checkBox477 ~= nil then self.checkBox477:destroy(); self.checkBox477 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.BotaonamCritical ~= nil then self.BotaonamCritical:destroy(); self.BotaonamCritical = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.checkBox209 ~= nil then self.checkBox209:destroy(); self.checkBox209 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.checkBox474 ~= nil then self.checkBox474:destroy(); self.checkBox474 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.checkBox221 ~= nil then self.checkBox221:destroy(); self.checkBox221 = nil; end;
        if self.BotaofieldSap ~= nil then self.BotaofieldSap:destroy(); self.BotaofieldSap = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.checkBox481 ~= nil then self.checkBox481:destroy(); self.checkBox481 = nil; end;
        if self.checkBox284 ~= nil then self.checkBox284:destroy(); self.checkBox284 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.checkBox262 ~= nil then self.checkBox262:destroy(); self.checkBox262 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.radioButton28 ~= nil then self.radioButton28:destroy(); self.radioButton28 = nil; end;
        if self.radioButton42 ~= nil then self.radioButton42:destroy(); self.radioButton42 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.checkBox421 ~= nil then self.checkBox421:destroy(); self.checkBox421 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.checkBox396 ~= nil then self.checkBox396:destroy(); self.checkBox396 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.checkBox161 ~= nil then self.checkBox161:destroy(); self.checkBox161 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.checkBox278 ~= nil then self.checkBox278:destroy(); self.checkBox278 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.checkBox375 ~= nil then self.checkBox375:destroy(); self.checkBox375 = nil; end;
        if self.checkBox184 ~= nil then self.checkBox184:destroy(); self.checkBox184 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.checkBox292 ~= nil then self.checkBox292:destroy(); self.checkBox292 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.popAbilitymaFloat ~= nil then self.popAbilitymaFloat:destroy(); self.popAbilitymaFloat = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.checkBox257 ~= nil then self.checkBox257:destroy(); self.checkBox257 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.popAbilityaaAlarm ~= nil then self.popAbilityaaAlarm:destroy(); self.popAbilityaaAlarm = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.checkBox283 ~= nil then self.checkBox283:destroy(); self.checkBox283 = nil; end;
        if self.textEditor53 ~= nil then self.textEditor53:destroy(); self.textEditor53 = nil; end;
        if self.comboBox40 ~= nil then self.comboBox40:destroy(); self.comboBox40 = nil; end;
        if self.checkBox443 ~= nil then self.checkBox443:destroy(); self.checkBox443 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.checkBox206 ~= nil then self.checkBox206:destroy(); self.checkBox206 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.checkBox442 ~= nil then self.checkBox442:destroy(); self.checkBox442 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.checkBox427 ~= nil then self.checkBox427:destroy(); self.checkBox427 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.checkBox304 ~= nil then self.checkBox304:destroy(); self.checkBox304 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.checkBox317 ~= nil then self.checkBox317:destroy(); self.checkBox317 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox306 ~= nil then self.checkBox306:destroy(); self.checkBox306 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.frmBossField ~= nil then self.frmBossField:destroy(); self.frmBossField = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.radioButton35 ~= nil then self.radioButton35:destroy(); self.radioButton35 = nil; end;
        if self.checkBox360 ~= nil then self.checkBox360:destroy(); self.checkBox360 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.checkBox347 ~= nil then self.checkBox347:destroy(); self.checkBox347 = nil; end;
        if self.checkBox177 ~= nil then self.checkBox177:destroy(); self.checkBox177 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.textEditor38 ~= nil then self.textEditor38:destroy(); self.textEditor38 = nil; end;
        if self.checkBox391 ~= nil then self.checkBox391:destroy(); self.checkBox391 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.checkBox167 ~= nil then self.checkBox167:destroy(); self.checkBox167 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.BotaonamStatimm ~= nil then self.BotaonamStatimm:destroy(); self.BotaonamStatimm = nil; end;
        if self.checkBox454 ~= nil then self.checkBox454:destroy(); self.checkBox454 = nil; end;
        if self.checkBox350 ~= nil then self.checkBox350:destroy(); self.checkBox350 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.checkBox359 ~= nil then self.checkBox359:destroy(); self.checkBox359 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.radioButton41 ~= nil then self.radioButton41:destroy(); self.radioButton41 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.checkBox204 ~= nil then self.checkBox204:destroy(); self.checkBox204 = nil; end;
        if self.popAbilitynamStatweak ~= nil then self.popAbilitynamStatweak:destroy(); self.popAbilitynamStatweak = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.BotaoaaDPrison ~= nil then self.BotaoaaDPrison:destroy(); self.BotaoaaDPrison = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.checkBox333 ~= nil then self.checkBox333:destroy(); self.checkBox333 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.popAbilitysupMRes ~= nil then self.popAbilitysupMRes:destroy(); self.popAbilitysupMRes = nil; end;
        if self.checkBox244 ~= nil then self.checkBox244:destroy(); self.checkBox244 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.checkBox491 ~= nil then self.checkBox491:destroy(); self.checkBox491 = nil; end;
        if self.checkBox175 ~= nil then self.checkBox175:destroy(); self.checkBox175 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.textEditor48 ~= nil then self.textEditor48:destroy(); self.textEditor48 = nil; end;
        if self.popAbilityfieldMagnetic ~= nil then self.popAbilityfieldMagnetic:destroy(); self.popAbilityfieldMagnetic = nil; end;
        if self.checkBox222 ~= nil then self.checkBox222:destroy(); self.checkBox222 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox409 ~= nil then self.checkBox409:destroy(); self.checkBox409 = nil; end;
        if self.checkBox425 ~= nil then self.checkBox425:destroy(); self.checkBox425 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkBox162 ~= nil then self.checkBox162:destroy(); self.checkBox162 = nil; end;
        if self.comboBox38 ~= nil then self.comboBox38:destroy(); self.comboBox38 = nil; end;
        if self.radioButton22 ~= nil then self.radioButton22:destroy(); self.radioButton22 = nil; end;
        if self.checkBox144 ~= nil then self.checkBox144:destroy(); self.checkBox144 = nil; end;
        if self.BotaoaaImprison ~= nil then self.BotaoaaImprison:destroy(); self.BotaoaaImprison = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.checkBox370 ~= nil then self.checkBox370:destroy(); self.checkBox370 = nil; end;
        if self.checkBox452 ~= nil then self.checkBox452:destroy(); self.checkBox452 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.checkBox195 ~= nil then self.checkBox195:destroy(); self.checkBox195 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.checkBox266 ~= nil then self.checkBox266:destroy(); self.checkBox266 = nil; end;
        if self.checkBox362 ~= nil then self.checkBox362:destroy(); self.checkBox362 = nil; end;
        if self.popAbilitynamComeback ~= nil then self.popAbilitynamComeback:destroy(); self.popAbilitynamComeback = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.textEditor58 ~= nil then self.textEditor58:destroy(); self.textEditor58 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox361 ~= nil then self.checkBox361:destroy(); self.checkBox361 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.checkBox189 ~= nil then self.checkBox189:destroy(); self.checkBox189 = nil; end;
        if self.frmSupportA ~= nil then self.frmSupportA:destroy(); self.frmSupportA = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.checkBox201 ~= nil then self.checkBox201:destroy(); self.checkBox201 = nil; end;
        if self.checkBox365 ~= nil then self.checkBox365:destroy(); self.checkBox365 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.BotaosupNDrain ~= nil then self.BotaosupNDrain:destroy(); self.BotaosupNDrain = nil; end;
        if self.checkBox271 ~= nil then self.checkBox271:destroy(); self.checkBox271 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.checkBox478 ~= nil then self.checkBox478:destroy(); self.checkBox478 = nil; end;
        if self.frmAttack ~= nil then self.frmAttack:destroy(); self.frmAttack = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.checkBox371 ~= nil then self.checkBox371:destroy(); self.checkBox371 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.checkBox338 ~= nil then self.checkBox338:destroy(); self.checkBox338 = nil; end;
        if self.checkBox405 ~= nil then self.checkBox405:destroy(); self.checkBox405 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.checkBox217 ~= nil then self.checkBox217:destroy(); self.checkBox217 = nil; end;
        if self.checkBox178 ~= nil then self.checkBox178:destroy(); self.checkBox178 = nil; end;
        if self.checkBox272 ~= nil then self.checkBox272:destroy(); self.checkBox272 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.popAbilitysupNDrain ~= nil then self.popAbilitysupNDrain:destroy(); self.popAbilitysupNDrain = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.checkBox233 ~= nil then self.checkBox233:destroy(); self.checkBox233 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.textEditor55 ~= nil then self.textEditor55:destroy(); self.textEditor55 = nil; end;
        if self.checkBox327 ~= nil then self.checkBox327:destroy(); self.checkBox327 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.BotaofieldTech ~= nil then self.BotaofieldTech:destroy(); self.BotaofieldTech = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.checkBox247 ~= nil then self.checkBox247:destroy(); self.checkBox247 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.checkBox226 ~= nil then self.checkBox226:destroy(); self.checkBox226 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.checkBox364 ~= nil then self.checkBox364:destroy(); self.checkBox364 = nil; end;
        if self.checkBox402 ~= nil then self.checkBox402:destroy(); self.checkBox402 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.textEditor47 ~= nil then self.textEditor47:destroy(); self.textEditor47 = nil; end;
        if self.checkBox268 ~= nil then self.checkBox268:destroy(); self.checkBox268 = nil; end;
        if self.checkBox228 ~= nil then self.checkBox228:destroy(); self.checkBox228 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.radioButton38 ~= nil then self.radioButton38:destroy(); self.radioButton38 = nil; end;
        if self.checkBox428 ~= nil then self.checkBox428:destroy(); self.checkBox428 = nil; end;
        if self.textEditor67 ~= nil then self.textEditor67:destroy(); self.textEditor67 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.checkBox300 ~= nil then self.checkBox300:destroy(); self.checkBox300 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.popAbilityfieldMagic ~= nil then self.popAbilityfieldMagic:destroy(); self.popAbilityfieldMagic = nil; end;
        if self.popAbilityfieldSap ~= nil then self.popAbilityfieldSap:destroy(); self.popAbilityfieldSap = nil; end;
        if self.checkBox218 ~= nil then self.checkBox218:destroy(); self.checkBox218 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.checkBox264 ~= nil then self.checkBox264:destroy(); self.checkBox264 = nil; end;
        if self.checkBox384 ~= nil then self.checkBox384:destroy(); self.checkBox384 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.comboBox39 ~= nil then self.comboBox39:destroy(); self.comboBox39 = nil; end;
        if self.checkBox312 ~= nil then self.checkBox312:destroy(); self.checkBox312 = nil; end;
        if self.checkBox325 ~= nil then self.checkBox325:destroy(); self.checkBox325 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.checkBox406 ~= nil then self.checkBox406:destroy(); self.checkBox406 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.checkBox280 ~= nil then self.checkBox280:destroy(); self.checkBox280 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.checkBox444 ~= nil then self.checkBox444:destroy(); self.checkBox444 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.BotaonameAddstatus ~= nil then self.BotaonameAddstatus:destroy(); self.BotaonameAddstatus = nil; end;
        if self.checkBox208 ~= nil then self.checkBox208:destroy(); self.checkBox208 = nil; end;
        if self.checkBox157 ~= nil then self.checkBox157:destroy(); self.checkBox157 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.textEditor51 ~= nil then self.textEditor51:destroy(); self.textEditor51 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.checkBox392 ~= nil then self.checkBox392:destroy(); self.checkBox392 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.checkBox404 ~= nil then self.checkBox404:destroy(); self.checkBox404 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.popAbilitynamStatRes ~= nil then self.popAbilitynamStatRes:destroy(); self.popAbilitynamStatRes = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.checkBox245 ~= nil then self.checkBox245:destroy(); self.checkBox245 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.checkBox191 ~= nil then self.checkBox191:destroy(); self.checkBox191 = nil; end;
        if self.checkBox424 ~= nil then self.checkBox424:destroy(); self.checkBox424 = nil; end;
        if self.checkBox183 ~= nil then self.checkBox183:destroy(); self.checkBox183 = nil; end;
        if self.checkBox414 ~= nil then self.checkBox414:destroy(); self.checkBox414 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.checkBox372 ~= nil then self.checkBox372:destroy(); self.checkBox372 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.checkBox188 ~= nil then self.checkBox188:destroy(); self.checkBox188 = nil; end;
        if self.checkBox463 ~= nil then self.checkBox463:destroy(); self.checkBox463 = nil; end;
        if self.checkBox376 ~= nil then self.checkBox376:destroy(); self.checkBox376 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox446 ~= nil then self.checkBox446:destroy(); self.checkBox446 = nil; end;
        if self.textEditor32 ~= nil then self.textEditor32:destroy(); self.textEditor32 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.popAbilityaaIPrison ~= nil then self.popAbilityaaIPrison:destroy(); self.popAbilityaaIPrison = nil; end;
        if self.checkBox243 ~= nil then self.checkBox243:destroy(); self.checkBox243 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.textEditor42 ~= nil then self.textEditor42:destroy(); self.textEditor42 = nil; end;
        if self.checkBox358 ~= nil then self.checkBox358:destroy(); self.checkBox358 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.checkBox259 ~= nil then self.checkBox259:destroy(); self.checkBox259 = nil; end;
        if self.checkBox225 ~= nil then self.checkBox225:destroy(); self.checkBox225 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.checkBox286 ~= nil then self.checkBox286:destroy(); self.checkBox286 = nil; end;
        if self.textEditor49 ~= nil then self.textEditor49:destroy(); self.textEditor49 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.checkBox166 ~= nil then self.checkBox166:destroy(); self.checkBox166 = nil; end;
        if self.checkBox472 ~= nil then self.checkBox472:destroy(); self.checkBox472 = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.popAbilitynamStatimmC ~= nil then self.popAbilitynamStatimmC:destroy(); self.popAbilitynamStatimmC = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.checkBox435 ~= nil then self.checkBox435:destroy(); self.checkBox435 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.checkBox386 ~= nil then self.checkBox386:destroy(); self.checkBox386 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.BotaonamStatimmC ~= nil then self.BotaonamStatimmC:destroy(); self.BotaonamStatimmC = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.checkBox486 ~= nil then self.checkBox486:destroy(); self.checkBox486 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.checkBox363 ~= nil then self.checkBox363:destroy(); self.checkBox363 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox187 ~= nil then self.checkBox187:destroy(); self.checkBox187 = nil; end;
        if self.popAbilityaaDPrison ~= nil then self.popAbilityaaDPrison:destroy(); self.popAbilityaaDPrison = nil; end;
        if self.textEditor34 ~= nil then self.textEditor34:destroy(); self.textEditor34 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.checkBox258 ~= nil then self.checkBox258:destroy(); self.checkBox258 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.checkBox297 ~= nil then self.checkBox297:destroy(); self.checkBox297 = nil; end;
        if self.popAbilitybossSlaveS ~= nil then self.popAbilitybossSlaveS:destroy(); self.popAbilitybossSlaveS = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.checkBox200 ~= nil then self.checkBox200:destroy(); self.checkBox200 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.checkBox154 ~= nil then self.checkBox154:destroy(); self.checkBox154 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.popAbilitysupHArm ~= nil then self.popAbilitysupHArm:destroy(); self.popAbilitysupHArm = nil; end;
        if self.checkBox334 ~= nil then self.checkBox334:destroy(); self.checkBox334 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.checkBox453 ~= nil then self.checkBox453:destroy(); self.checkBox453 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.checkBox471 ~= nil then self.checkBox471:destroy(); self.checkBox471 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.BotaonamEvader ~= nil then self.BotaonamEvader:destroy(); self.BotaonamEvader = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.BotaonamMEvasion ~= nil then self.BotaonamMEvasion:destroy(); self.BotaonamMEvasion = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.checkBox314 ~= nil then self.checkBox314:destroy(); self.checkBox314 = nil; end;
        if self.BotaospeNoScan ~= nil then self.BotaospeNoScan:destroy(); self.BotaospeNoScan = nil; end;
        if self.checkBox165 ~= nil then self.checkBox165:destroy(); self.checkBox165 = nil; end;
        if self.BotaoaaVPrison ~= nil then self.BotaoaaVPrison:destroy(); self.BotaoaaVPrison = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox302 ~= nil then self.checkBox302:destroy(); self.checkBox302 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.checkBox158 ~= nil then self.checkBox158:destroy(); self.checkBox158 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.checkBox298 ~= nil then self.checkBox298:destroy(); self.checkBox298 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.popAbilitynamStatresC ~= nil then self.popAbilitynamStatresC:destroy(); self.popAbilitynamStatresC = nil; end;
        if self.checkBox398 ~= nil then self.checkBox398:destroy(); self.checkBox398 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.checkBox432 ~= nil then self.checkBox432:destroy(); self.checkBox432 = nil; end;
        if self.checkBox232 ~= nil then self.checkBox232:destroy(); self.checkBox232 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.BotaonameCounterStat ~= nil then self.BotaonameCounterStat:destroy(); self.BotaonameCounterStat = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.checkBox224 ~= nil then self.checkBox224:destroy(); self.checkBox224 = nil; end;
        if self.checkBox395 ~= nil then self.checkBox395:destroy(); self.checkBox395 = nil; end;
        if self.BotaomaGround ~= nil then self.BotaomaGround:destroy(); self.BotaomaGround = nil; end;
        if self.popAbilitybossField ~= nil then self.popAbilitybossField:destroy(); self.popAbilitybossField = nil; end;
        if self.checkBox353 ~= nil then self.checkBox353:destroy(); self.checkBox353 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.checkBox407 ~= nil then self.checkBox407:destroy(); self.checkBox407 = nil; end;
        if self.BotaoreCFin ~= nil then self.BotaoreCFin:destroy(); self.BotaoreCFin = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.checkBox267 ~= nil then self.checkBox267:destroy(); self.checkBox267 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.BotaosupMRes ~= nil then self.BotaosupMRes:destroy(); self.BotaosupMRes = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.checkBox366 ~= nil then self.checkBox366:destroy(); self.checkBox366 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.textEditor57 ~= nil then self.textEditor57:destroy(); self.textEditor57 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.checkBox450 ~= nil then self.checkBox450:destroy(); self.checkBox450 = nil; end;
        if self.BotaomaTeleport ~= nil then self.BotaomaTeleport:destroy(); self.BotaomaTeleport = nil; end;
        if self.popAbilityfieldItem ~= nil then self.popAbilityfieldItem:destroy(); self.popAbilityfieldItem = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.checkBox315 ~= nil then self.checkBox315:destroy(); self.checkBox315 = nil; end;
        if self.radioButton37 ~= nil then self.radioButton37:destroy(); self.radioButton37 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.popAbilitymaTeleport ~= nil then self.popAbilitymaTeleport:destroy(); self.popAbilitymaTeleport = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.checkBox215 ~= nil then self.checkBox215:destroy(); self.checkBox215 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.checkBox439 ~= nil then self.checkBox439:destroy(); self.checkBox439 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.checkBox488 ~= nil then self.checkBox488:destroy(); self.checkBox488 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.checkBox343 ~= nil then self.checkBox343:destroy(); self.checkBox343 = nil; end;
        if self.BotaoaaClone ~= nil then self.BotaoaaClone:destroy(); self.BotaoaaClone = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.checkBox198 ~= nil then self.checkBox198:destroy(); self.checkBox198 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.BotaobossField ~= nil then self.BotaobossField:destroy(); self.BotaobossField = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.popAbilitynameCounterStat ~= nil then self.popAbilitynameCounterStat:destroy(); self.popAbilitynameCounterStat = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox388 ~= nil then self.checkBox388:destroy(); self.checkBox388 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.checkBox470 ~= nil then self.checkBox470:destroy(); self.checkBox470 = nil; end;
        if self.frmReaction ~= nil then self.frmReaction:destroy(); self.frmReaction = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.BotaosupRDrain ~= nil then self.BotaosupRDrain:destroy(); self.BotaosupRDrain = nil; end;
        if self.popAbilityreaCounterM ~= nil then self.popAbilityreaCounterM:destroy(); self.popAbilityreaCounterM = nil; end;
        if self.checkBox203 ~= nil then self.checkBox203:destroy(); self.checkBox203 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.BotaonamStatresC ~= nil then self.BotaonamStatresC:destroy(); self.BotaonamStatresC = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.radioButton24 ~= nil then self.radioButton24:destroy(); self.radioButton24 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.BotaosupMBound ~= nil then self.BotaosupMBound:destroy(); self.BotaosupMBound = nil; end;
        if self.checkBox216 ~= nil then self.checkBox216:destroy(); self.checkBox216 = nil; end;
        if self.checkBox146 ~= nil then self.checkBox146:destroy(); self.checkBox146 = nil; end;
        if self.checkBox279 ~= nil then self.checkBox279:destroy(); self.checkBox279 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor56 ~= nil then self.textEditor56:destroy(); self.textEditor56 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.checkBox152 ~= nil then self.checkBox152:destroy(); self.checkBox152 = nil; end;
        if self.BotaobossSlave ~= nil then self.BotaobossSlave:destroy(); self.BotaobossSlave = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.radioButton18 ~= nil then self.radioButton18:destroy(); self.radioButton18 = nil; end;
        if self.checkBox260 ~= nil then self.checkBox260:destroy(); self.checkBox260 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.checkBox296 ~= nil then self.checkBox296:destroy(); self.checkBox296 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.BotaonamElemImm ~= nil then self.BotaonamElemImm:destroy(); self.BotaonamElemImm = nil; end;
        if self.radioButton34 ~= nil then self.radioButton34:destroy(); self.radioButton34 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.checkBox349 ~= nil then self.checkBox349:destroy(); self.checkBox349 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.BotaoaaAlarm ~= nil then self.BotaoaaAlarm:destroy(); self.BotaoaaAlarm = nil; end;
        if self.checkBox416 ~= nil then self.checkBox416:destroy(); self.checkBox416 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.checkBox377 ~= nil then self.checkBox377:destroy(); self.checkBox377 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.checkBox313 ~= nil then self.checkBox313:destroy(); self.checkBox313 = nil; end;
        if self.checkBox256 ~= nil then self.checkBox256:destroy(); self.checkBox256 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.checkBox346 ~= nil then self.checkBox346:destroy(); self.checkBox346 = nil; end;
        if self.BotaonamStatweak ~= nil then self.BotaonamStatweak:destroy(); self.BotaonamStatweak = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.comboBox47 ~= nil then self.comboBox47:destroy(); self.comboBox47 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox196 ~= nil then self.checkBox196:destroy(); self.checkBox196 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox277 ~= nil then self.checkBox277:destroy(); self.checkBox277 = nil; end;
        if self.checkBox303 ~= nil then self.checkBox303:destroy(); self.checkBox303 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.popAbilitymaFlight ~= nil then self.popAbilitymaFlight:destroy(); self.popAbilitymaFlight = nil; end;
        if self.textEditor68 ~= nil then self.textEditor68:destroy(); self.textEditor68 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.checkBox287 ~= nil then self.checkBox287:destroy(); self.checkBox287 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.checkBox323 ~= nil then self.checkBox323:destroy(); self.checkBox323 = nil; end;
        if self.popAbilityaaBPrison ~= nil then self.popAbilityaaBPrison:destroy(); self.popAbilityaaBPrison = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkBox299 ~= nil then self.checkBox299:destroy(); self.checkBox299 = nil; end;
        if self.checkBox164 ~= nil then self.checkBox164:destroy(); self.checkBox164 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.popAbilitynameSOSStat ~= nil then self.popAbilitynameSOSStat:destroy(); self.popAbilitynameSOSStat = nil; end;
        if self.checkBox393 ~= nil then self.checkBox393:destroy(); self.checkBox393 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.checkBox220 ~= nil then self.checkBox220:destroy(); self.checkBox220 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.textEditor50 ~= nil then self.textEditor50:destroy(); self.textEditor50 = nil; end;
        if self.checkBox397 ~= nil then self.checkBox397:destroy(); self.checkBox397 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.popAbilitybossSlaveAR ~= nil then self.popAbilitybossSlaveAR:destroy(); self.popAbilitybossSlaveAR = nil; end;
        if self.checkBox489 ~= nil then self.checkBox489:destroy(); self.checkBox489 = nil; end;
        if self.BotaofieldAttack ~= nil then self.BotaofieldAttack:destroy(); self.BotaofieldAttack = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.textEditor65 ~= nil then self.textEditor65:destroy(); self.textEditor65 = nil; end;
        if self.checkBox451 ~= nil then self.checkBox451:destroy(); self.checkBox451 = nil; end;
        if self.BotaoaaRestore ~= nil then self.BotaoaaRestore:destroy(); self.BotaoaaRestore = nil; end;
        if self.checkBox150 ~= nil then self.checkBox150:destroy(); self.checkBox150 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.popAbilitysupXFight ~= nil then self.popAbilitysupXFight:destroy(); self.popAbilitysupXFight = nil; end;
        if self.checkBox449 ~= nil then self.checkBox449:destroy(); self.checkBox449 = nil; end;
        if self.checkBox142 ~= nil then self.checkBox142:destroy(); self.checkBox142 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.popAbilitybossDecoy ~= nil then self.popAbilitybossDecoy:destroy(); self.popAbilitybossDecoy = nil; end;
        if self.checkBox179 ~= nil then self.checkBox179:destroy(); self.checkBox179 = nil; end;
        if self.checkBox261 ~= nil then self.checkBox261:destroy(); self.checkBox261 = nil; end;
        if self.radioButton40 ~= nil then self.radioButton40:destroy(); self.radioButton40 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.checkBox367 ~= nil then self.checkBox367:destroy(); self.checkBox367 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.checkBox301 ~= nil then self.checkBox301:destroy(); self.checkBox301 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.checkBox309 ~= nil then self.checkBox309:destroy(); self.checkBox309 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.checkBox399 ~= nil then self.checkBox399:destroy(); self.checkBox399 = nil; end;
        if self.BotaobossDecoy ~= nil then self.BotaobossDecoy:destroy(); self.BotaobossDecoy = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.popAbilitynamStatimm ~= nil then self.popAbilitynamStatimm:destroy(); self.popAbilitynamStatimm = nil; end;
        if self.radioButton30 ~= nil then self.radioButton30:destroy(); self.radioButton30 = nil; end;
        if self.checkBox387 ~= nil then self.checkBox387:destroy(); self.checkBox387 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.BotaomaFlight ~= nil then self.BotaomaFlight:destroy(); self.BotaomaFlight = nil; end;
        if self.checkBox252 ~= nil then self.checkBox252:destroy(); self.checkBox252 = nil; end;
        if self.radioButton25 ~= nil then self.radioButton25:destroy(); self.radioButton25 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.popAbilitynamEvader ~= nil then self.popAbilitynamEvader:destroy(); self.popAbilitynamEvader = nil; end;
        if self.checkBox408 ~= nil then self.checkBox408:destroy(); self.checkBox408 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.checkBox265 ~= nil then self.checkBox265:destroy(); self.checkBox265 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.textEditor72 ~= nil then self.textEditor72:destroy(); self.textEditor72 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.checkBox437 ~= nil then self.checkBox437:destroy(); self.checkBox437 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.checkBox419 ~= nil then self.checkBox419:destroy(); self.checkBox419 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.BotaosupXFight ~= nil then self.BotaosupXFight:destroy(); self.BotaosupXFight = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.radioButton36 ~= nil then self.radioButton36:destroy(); self.radioButton36 = nil; end;
        if self.radioButton32 ~= nil then self.radioButton32:destroy(); self.radioButton32 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.popAbilityaaSPrison ~= nil then self.popAbilityaaSPrison:destroy(); self.popAbilityaaSPrison = nil; end;
        if self.BotaobossSlaveN ~= nil then self.BotaobossSlaveN:destroy(); self.BotaobossSlaveN = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.comboBox42 ~= nil then self.comboBox42:destroy(); self.comboBox42 = nil; end;
        if self.BotaoreRotate ~= nil then self.BotaoreRotate:destroy(); self.BotaoreRotate = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.checkBox468 ~= nil then self.checkBox468:destroy(); self.checkBox468 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.checkBox374 ~= nil then self.checkBox374:destroy(); self.checkBox374 = nil; end;
        if self.comboBox41 ~= nil then self.comboBox41:destroy(); self.comboBox41 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.BotaosupHArm ~= nil then self.BotaosupHArm:destroy(); self.BotaosupHArm = nil; end;
        if self.textEditor39 ~= nil then self.textEditor39:destroy(); self.textEditor39 = nil; end;
        if self.checkBox400 ~= nil then self.checkBox400:destroy(); self.checkBox400 = nil; end;
        if self.checkBox171 ~= nil then self.checkBox171:destroy(); self.checkBox171 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.checkBox328 ~= nil then self.checkBox328:destroy(); self.checkBox328 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.checkBox431 ~= nil then self.checkBox431:destroy(); self.checkBox431 = nil; end;
        if self.textEditor64 ~= nil then self.textEditor64:destroy(); self.textEditor64 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.checkBox242 ~= nil then self.checkBox242:destroy(); self.checkBox242 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.checkBox291 ~= nil then self.checkBox291:destroy(); self.checkBox291 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkBox148 ~= nil then self.checkBox148:destroy(); self.checkBox148 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.comboBox43 ~= nil then self.comboBox43:destroy(); self.comboBox43 = nil; end;
        if self.checkBox447 ~= nil then self.checkBox447:destroy(); self.checkBox447 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.checkBox461 ~= nil then self.checkBox461:destroy(); self.checkBox461 = nil; end;
        if self.checkBox274 ~= nil then self.checkBox274:destroy(); self.checkBox274 = nil; end;
        if self.frmMacros ~= nil then self.frmMacros:destroy(); self.frmMacros = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.checkBox352 ~= nil then self.checkBox352:destroy(); self.checkBox352 = nil; end;
        if self.checkBox168 ~= nil then self.checkBox168:destroy(); self.checkBox168 = nil; end;
        if self.checkBox340 ~= nil then self.checkBox340:destroy(); self.checkBox340 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.textEditor37 ~= nil then self.textEditor37:destroy(); self.textEditor37 = nil; end;
        if self.checkBox354 ~= nil then self.checkBox354:destroy(); self.checkBox354 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.popAbilitynamCritical ~= nil then self.popAbilitynamCritical:destroy(); self.popAbilitynamCritical = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.checkBox434 ~= nil then self.checkBox434:destroy(); self.checkBox434 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.BotaomaWater ~= nil then self.BotaomaWater:destroy(); self.BotaomaWater = nil; end;
        if self.checkBox331 ~= nil then self.checkBox331:destroy(); self.checkBox331 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.radioButton27 ~= nil then self.radioButton27:destroy(); self.radioButton27 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.checkBox289 ~= nil then self.checkBox289:destroy(); self.checkBox289 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.radioButton33 ~= nil then self.radioButton33:destroy(); self.radioButton33 = nil; end;
        if self.checkBox181 ~= nil then self.checkBox181:destroy(); self.checkBox181 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox426 ~= nil then self.checkBox426:destroy(); self.checkBox426 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.checkBox143 ~= nil then self.checkBox143:destroy(); self.checkBox143 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.radioButton20 ~= nil then self.radioButton20:destroy(); self.radioButton20 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.checkBox269 ~= nil then self.checkBox269:destroy(); self.checkBox269 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.checkBox253 ~= nil then self.checkBox253:destroy(); self.checkBox253 = nil; end;
        if self.BotaonameCannibalize ~= nil then self.BotaonameCannibalize:destroy(); self.BotaonameCannibalize = nil; end;
        if self.checkBox351 ~= nil then self.checkBox351:destroy(); self.checkBox351 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.checkBox335 ~= nil then self.checkBox335:destroy(); self.checkBox335 = nil; end;
        if self.checkBox310 ~= nil then self.checkBox310:destroy(); self.checkBox310 = nil; end;
        if self.BotaonamElemWk ~= nil then self.BotaonamElemWk:destroy(); self.BotaonamElemWk = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.checkBox476 ~= nil then self.checkBox476:destroy(); self.checkBox476 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.BotaoaaSPrison ~= nil then self.BotaoaaSPrison:destroy(); self.BotaoaaSPrison = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.checkBox368 ~= nil then self.checkBox368:destroy(); self.checkBox368 = nil; end;
        if self.BotaoaaEscape ~= nil then self.BotaoaaEscape:destroy(); self.BotaoaaEscape = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.frmSpellsJobs ~= nil then self.frmSpellsJobs:destroy(); self.frmSpellsJobs = nil; end;
        if self.checkBox207 ~= nil then self.checkBox207:destroy(); self.checkBox207 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.popAbilitybossSlaveN ~= nil then self.popAbilitybossSlaveN:destroy(); self.popAbilitybossSlaveN = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMOBFFRPG()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMOBFFRPG();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
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
Firecast.registrarForm(_frmMOBFFRPG);
Firecast.registrarDataType(_frmMOBFFRPG);

return _frmMOBFFRPG;
