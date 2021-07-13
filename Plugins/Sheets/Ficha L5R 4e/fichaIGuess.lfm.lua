require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmOurFichaL5R4e()
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
    obj:setDataType("L5R_4e_Otimizado");
    obj:setTitle("L5R 4e (Otimizado)");
    obj:setName("frmOurFichaL5R4e");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'lastroTerra', 'BHealth', 'earth', 'PWound'});
    obj.dataLink1:setDefaultValue("2");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'QHealer', 'nivelSb', 'stamina'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'ferimentos', 'earth', 'PWound', 'BHealth', 'lastroTerra', 'LEsco'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'maisSab', 'earth', 'air', 'water', 'fire', 'void', 'countSum'});
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("sabedoria");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'Escoriado', 'Machucado', 'Ferido', 'SerFerido', 'Incapacitado', 'Abatido', 'LPThold', 'SotEarth'});
    obj.dataLink6:setDefaultValues({'+3', '+5', '+10', '+15', '+20', '+40'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'willpower', 'stamina'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'strength', 'perception'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'agility', 'intelligence'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'awareness', 'reflexes'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'addRolaIni', 'addMantemIni', 'reflexes', 'nivelSb'});
    obj.dataLink11:setDefaultValues({'0', '0'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'bonusNA', 'reflexes'});
    obj.dataLink12:setDefaultValue("0");
    obj.dataLink12:setName("dataLink12");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(80);
    obj.rectangle1:setTop(30);
    obj.rectangle1:setWidth(100);
    obj.rectangle1:setHeight(24);
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(90);
    obj.label1:setTop(30);
    obj.label1:setText("PERSONAGEM");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(35);
    obj.label2:setTop(90);
    obj.label2:setFontSize(20.0);
    obj.label2:setText("緑");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(35);
    obj.label3:setTop(110);
    obj.label3:setFontSize(20.0);
    obj.label3:setText("緒");
    obj.label3:setName("label3");

    obj.fan = GUI.fromHandle(_obj_newObject("image"));
    obj.fan:setParent(obj.scrollBox1);
    obj.fan:setLeft(20);
    obj.fan:setTop(20);
    obj.fan:setScale(0.7);
    obj.fan:setSRC("/Frames/frameFrenteDnD/upperEsq2.png");
    obj.fan:setName("fan");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(60);
    obj.layout1:setTop(50);
    obj.layout1:setWidth(560);
    obj.layout1:setHeight(100);
    obj.layout1:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout1:setName("layout1");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setLeft(-55);
    obj.label4:setTop(20);
    obj.label4:setText("Nome: ");
    obj.label4:setName("label4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("nomeChar");
    obj.edit1:setLeft(68);
    obj.edit1:setTop(14);
    obj.edit1:setWidth(170);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout1);
    obj.horzLine1:setLeft(68);
    obj.horzLine1:setTop(39);
    obj.horzLine1:setWidth(170);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setLeft(-55);
    obj.label5:setTop(40);
    obj.label5:setText("Clã: ");
    obj.label5:setName("label5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("claChar");
    obj.edit2:setLeft(68);
    obj.edit2:setTop(34);
    obj.edit2:setWidth(170);
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout1);
    obj.horzLine2:setLeft(68);
    obj.horzLine2:setTop(59);
    obj.horzLine2:setWidth(170);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setLeft(-55);
    obj.label6:setTop(60);
    obj.label6:setText("Escola: ");
    obj.label6:setName("label6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setField("escolaChar");
    obj.edit3:setLeft(68);
    obj.edit3:setTop(54);
    obj.edit3:setWidth(170);
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout1);
    obj.horzLine3:setLeft(68);
    obj.horzLine3:setTop(79);
    obj.horzLine3:setWidth(170);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(264);
    obj.rectangle2:setTop(20);
    obj.rectangle2:setWidth(1);
    obj.rectangle2:setHeight(70);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setLeft(229);
    obj.label7:setTop(20);
    obj.label7:setText("Nível: ");
    obj.label7:setName("label7");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(354);
    obj.rectangle3:setTop(16);
    obj.rectangle3:setWidth(25);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setXradius(20);
    obj.rectangle3:setYradius(20);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setColor("#212121");
    obj.rectangle3:setName("rectangle3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setField("nivelSb");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setLeft(351);
    obj.label8:setTop(19);
    obj.label8:setWidth(30);
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setLeft(229);
    obj.label9:setTop(72);
    obj.label9:setText("Experiência: ");
    obj.label9:setName("label9");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setField("xpGastar");
    obj.edit4:setLeft(352);
    obj.edit4:setTop(65);
    obj.edit4:setWidth(30);
    obj.edit4:setTransparent(true);
    obj.edit4:setKeyboardType("numberPad");
    obj.edit4:setName("edit4");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout1);
    obj.horzLine4:setLeft(352);
    obj.horzLine4:setTop(90);
    obj.horzLine4:setWidth(30);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setName("horzLine4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setHorzTextAlign("trailing");
    obj.label10:setLeft(229);
    obj.label10:setTop(40);
    obj.label10:setText("Sabedoria: ");
    obj.label10:setName("label10");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setLeft(354);
    obj.rectangle4:setTop(40);
    obj.rectangle4:setWidth(25);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setXradius(15);
    obj.rectangle4:setYradius(20);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setColor("#212121");
    obj.rectangle4:setName("rectangle4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setField("sabedoria");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setLeft(351);
    obj.label11:setTop(43);
    obj.label11:setWidth(30);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout1);
    obj.label12:setHorzTextAlign("trailing");
    obj.label12:setLeft(270);
    obj.label12:setTop(43);
    obj.label12:setFontSize(10.0);
    obj.label12:setText("+ ");
    obj.label12:setName("label12");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setText("0");
    obj.edit5:setFontSize(10.0);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(380);
    obj.edit5:setTop(45);
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(15);
    obj.edit5:setKeyboardType("numberPad");
    obj.edit5:setTransparent(true);
    obj.edit5:setField("maisSab");
    obj.edit5:setName("edit5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setLeft(424);
    obj.rectangle5:setTop(20);
    obj.rectangle5:setWidth(1);
    obj.rectangle5:setHeight(70);
    obj.rectangle5:setColor("white");
    obj.rectangle5:setName("rectangle5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout1);
    obj.label13:setHorzTextAlign("trailing");
    obj.label13:setLeft(369);
    obj.label13:setTop(12);
    obj.label13:setFontSize(12.0);
    obj.label13:setText("Honra: ");
    obj.label13:setName("label13");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setField("honra");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(492);
    obj.edit6:setTop(10);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(20);
    obj.edit6:setKeyboardType("numberPad");
    obj.edit6:setTransparent(true);
    obj.edit6:setName("edit6");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout1);
    obj.horzLine5:setLeft(492);
    obj.horzLine5:setTop(28);
    obj.horzLine5:setWidth(30);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setName("horzLine5");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setLeft(369);
    obj.label14:setTop(30);
    obj.label14:setFontSize(12.0);
    obj.label14:setText("Glória: ");
    obj.label14:setName("label14");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setField("gloria");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setLeft(492);
    obj.edit7:setTop(28);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(20);
    obj.edit7:setTransparent(true);
    obj.edit7:setKeyboardType("numberPad");
    obj.edit7:setName("edit7");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout1);
    obj.horzLine6:setLeft(492);
    obj.horzLine6:setTop(46);
    obj.horzLine6:setWidth(30);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setName("horzLine6");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setHorzTextAlign("trailing");
    obj.label15:setLeft(369);
    obj.label15:setTop(48);
    obj.label15:setFontSize(12.0);
    obj.label15:setText("Status: ");
    obj.label15:setName("label15");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setField("status");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(492);
    obj.edit8:setTop(46);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(20);
    obj.edit8:setTransparent(true);
    obj.edit8:setKeyboardType("numberPad");
    obj.edit8:setName("edit8");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout1);
    obj.horzLine7:setLeft(492);
    obj.horzLine7:setTop(64);
    obj.horzLine7:setWidth(30);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setName("horzLine7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout1);
    obj.label16:setHorzTextAlign("trailing");
    obj.label16:setLeft(369);
    obj.label16:setTop(66);
    obj.label16:setFontSize(12.0);
    obj.label16:setText("Mácula: ");
    obj.label16:setName("label16");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setField("macula");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(492);
    obj.edit9:setTop(64);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(20);
    obj.edit9:setTransparent(true);
    obj.edit9:setKeyboardType("numberPad");
    obj.edit9:setName("edit9");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout1);
    obj.horzLine8:setLeft(492);
    obj.horzLine8:setTop(82);
    obj.horzLine8:setWidth(30);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setName("horzLine8");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.scrollBox1);
    obj.label17:setFontSize(16.0);
    obj.label17:setHeight(50);
    obj.label17:setLeft(30);
    obj.label17:setTop(365);
    obj.label17:setText("Perception");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.scrollBox1);
    obj.label18:setFontSize(16.0);
    obj.label18:setHeight(50);
    obj.label18:setLeft(555);
    obj.label18:setTop(365);
    obj.label18:setText("Intelligence");
    obj.label18:setName("label18");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(115);
    obj.layout2:setTop(200);
    obj.layout2:setWidth(430);
    obj.layout2:setHeight(300);
    obj.layout2:setName("layout2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setAlign("client");
    obj.image1:setSRC("/Frames/aneis.png");
    obj.image1:setName("image1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(60);
    obj.layout3:setTop(200);
    obj.layout3:setWidth(540);
    obj.layout3:setHeight(300);
    obj.layout3:setName("layout3");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setFontSize(16.0);
    obj.label19:setLeft(40);
    obj.label19:setTop(22);
    obj.label19:setText("Stamina");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setFontSize(16.0);
    obj.label20:setHeight(50);
    obj.label20:setLeft(10);
    obj.label20:setTop(52);
    obj.label20:setText("Willpower");
    obj.label20:setName("label20");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setLeft(118);
    obj.edit10:setTransparent(true);
    obj.edit10:setTop(17);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(30);
    obj.edit10:setFontSize(20.0);
    obj.edit10:setText("2");
    obj.edit10:setField("stamina");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setLeft(102);
    obj.edit11:setTransparent(true);
    obj.edit11:setTop(63);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setWidth(30);
    obj.edit11:setFontSize(20.0);
    obj.edit11:setText("2");
    obj.edit11:setField("willpower");
    obj.edit11:setName("edit11");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setFontSize(16.0);
    obj.label21:setLeft(0);
    obj.label21:setTop(120);
    obj.label21:setHeight(50);
    obj.label21:setText("Strength");
    obj.label21:setName("label21");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setLeft(80);
    obj.edit12:setTransparent(true);
    obj.edit12:setTop(132);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setWidth(30);
    obj.edit12:setFontSize(20.0);
    obj.edit12:setText("2");
    obj.edit12:setField("strength");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setLeft(63);
    obj.edit13:setTransparent(true);
    obj.edit13:setTop(179);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setWidth(30);
    obj.edit13:setFontSize(20.0);
    obj.edit13:setText("2");
    obj.edit13:setField("perception");
    obj.edit13:setName("edit13");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setFontSize(16.0);
    obj.label22:setLeft(440);
    obj.label22:setTop(15);
    obj.label22:setHeight(30);
    obj.label22:setText("Reflexes");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setFontSize(16.0);
    obj.label23:setHeight(50);
    obj.label23:setLeft(458);
    obj.label23:setTop(50);
    obj.label23:setText("Awareness");
    obj.label23:setName("label23");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setLeft(393);
    obj.edit14:setTransparent(true);
    obj.edit14:setTop(17);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(30);
    obj.edit14:setFontSize(20.0);
    obj.edit14:setText("2");
    obj.edit14:setField("reflexes");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setLeft(410);
    obj.edit15:setTransparent(true);
    obj.edit15:setTop(63);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(30);
    obj.edit15:setFontSize(20.0);
    obj.edit15:setText("2");
    obj.edit15:setField("awareness");
    obj.edit15:setName("edit15");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setFontSize(16.0);
    obj.label24:setLeft(480);
    obj.label24:setTop(130);
    obj.label24:setHeight(30);
    obj.label24:setText("Agility");
    obj.label24:setName("label24");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setLeft(430);
    obj.edit16:setTransparent(true);
    obj.edit16:setTop(132);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(30);
    obj.edit16:setFontSize(20.0);
    obj.edit16:setText("2");
    obj.edit16:setField("agility");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout3);
    obj.edit17:setLeft(447);
    obj.edit17:setTransparent(true);
    obj.edit17:setTop(179);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(30);
    obj.edit17:setFontSize(20.0);
    obj.edit17:setText("2");
    obj.edit17:setField("intelligence");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setLeft(256);
    obj.edit18:setTransparent(true);
    obj.edit18:setTop(164);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(30);
    obj.edit18:setFontSize(20.0);
    obj.edit18:setText("2");
    obj.edit18:setField("void");
    obj.edit18:setName("edit18");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout3);
    obj.label25:setFontSize(20.0);
    obj.label25:setLeft(227);
    obj.label25:setTop(137);
    obj.label25:setHeight(30);
    obj.label25:setField("water");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setFontSize(20.0);
    obj.label26:setLeft(304);
    obj.label26:setTop(135);
    obj.label26:setHeight(30);
    obj.label26:setField("fire");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setFontSize(20.0);
    obj.label27:setLeft(290);
    obj.label27:setTop(90);
    obj.label27:setHeight(30);
    obj.label27:setField("air");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setFontSize(20.0);
    obj.label28:setLeft(240);
    obj.label28:setTop(90);
    obj.label28:setHeight(30);
    obj.label28:setField("earth");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.scrollBox1);
    obj.label29:setTop(520);
    obj.label29:setLeft(255);
    obj.label29:setText("0");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.scrollBox1);
    obj.label30:setTop(520);
    obj.label30:setLeft(275);
    obj.label30:setText("1");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.scrollBox1);
    obj.label31:setTop(520);
    obj.label31:setLeft(295);
    obj.label31:setText("2");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.scrollBox1);
    obj.label32:setTop(520);
    obj.label32:setLeft(315);
    obj.label32:setText("3");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.scrollBox1);
    obj.label33:setTop(520);
    obj.label33:setLeft(335);
    obj.label33:setText("4");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.scrollBox1);
    obj.label34:setTop(520);
    obj.label34:setLeft(355);
    obj.label34:setText("5");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.scrollBox1);
    obj.label35:setTop(520);
    obj.label35:setLeft(375);
    obj.label35:setText("6");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.scrollBox1);
    obj.label36:setTop(520);
    obj.label36:setLeft(395);
    obj.label36:setText("7");
    obj.label36:setName("label36");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.scrollBox1);
    obj.radioButton1:setField("VOIDescala");
    obj.radioButton1:setFieldValue("0void");
    obj.radioButton1:setGroupName("VOIDGrupo");
    obj.radioButton1:setTop(500);
    obj.radioButton1:setLeft(250);
    obj.radioButton1:setChecked(true);
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.scrollBox1);
    obj.radioButton2:setField("VOIDescala");
    obj.radioButton2:setFieldValue("1void");
    obj.radioButton2:setGroupName("VOIDGrupo");
    obj.radioButton2:setTop(500);
    obj.radioButton2:setLeft(270);
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.scrollBox1);
    obj.radioButton3:setField("VOIDescala");
    obj.radioButton3:setFieldValue("2void");
    obj.radioButton3:setGroupName("VOIDGrupo");
    obj.radioButton3:setTop(500);
    obj.radioButton3:setLeft(290);
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.scrollBox1);
    obj.radioButton4:setField("VOIDescala");
    obj.radioButton4:setFieldValue("3void");
    obj.radioButton4:setGroupName("VOIDGrupo");
    obj.radioButton4:setTop(500);
    obj.radioButton4:setLeft(310);
    obj.radioButton4:setName("radioButton4");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.scrollBox1);
    obj.radioButton5:setField("VOIDescala");
    obj.radioButton5:setFieldValue("4void");
    obj.radioButton5:setGroupName("VOIDGrupo");
    obj.radioButton5:setTop(500);
    obj.radioButton5:setLeft(330);
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.scrollBox1);
    obj.radioButton6:setField("VOIDescala");
    obj.radioButton6:setFieldValue("5void");
    obj.radioButton6:setGroupName("VOIDGrupo");
    obj.radioButton6:setTop(500);
    obj.radioButton6:setLeft(350);
    obj.radioButton6:setName("radioButton6");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.scrollBox1);
    obj.radioButton7:setField("VOIDescala");
    obj.radioButton7:setFieldValue("6void");
    obj.radioButton7:setGroupName("VOIDGrupo");
    obj.radioButton7:setTop(500);
    obj.radioButton7:setLeft(370);
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.scrollBox1);
    obj.radioButton8:setField("VOIDescala");
    obj.radioButton8:setFieldValue("7void");
    obj.radioButton8:setGroupName("VOIDGrupo");
    obj.radioButton8:setTop(500);
    obj.radioButton8:setLeft(390);
    obj.radioButton8:setName("radioButton8");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox1);
    obj.rectangle6:setLeft(660);
    obj.rectangle6:setTop(30);
    obj.rectangle6:setWidth(100);
    obj.rectangle6:setHeight(24);
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setColor("#212121");
    obj.rectangle6:setName("rectangle6");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.scrollBox1);
    obj.label37:setLeft(670);
    obj.label37:setTop(30);
    obj.label37:setText("INICIATIVA");
    obj.label37:setName("label37");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(650);
    obj.layout4:setTop(50);
    obj.layout4:setWidth(190);
    obj.layout4:setHeight(100);
    obj.layout4:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout4:setName("layout4");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setLeft(20);
    obj.label38:setTop(15);
    obj.label38:setText("Nível: ");
    obj.label38:setName("label38");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout4);
    obj.rectangle7:setLeft(57);
    obj.rectangle7:setTop(12);
    obj.rectangle7:setWidth(25);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setXradius(20);
    obj.rectangle7:setYradius(20);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setColor("#212121");
    obj.rectangle7:setName("rectangle7");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout4);
    obj.label39:setField("nivelSb");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setLeft(54);
    obj.label39:setTop(15);
    obj.label39:setWidth(30);
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout4);
    obj.label40:setLeft(90);
    obj.label40:setTop(15);
    obj.label40:setText("Reflexes: ");
    obj.label40:setName("label40");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout4);
    obj.rectangle8:setLeft(145);
    obj.rectangle8:setTop(12);
    obj.rectangle8:setWidth(25);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setXradius(20);
    obj.rectangle8:setYradius(20);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setColor("#212121");
    obj.rectangle8:setName("rectangle8");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout4);
    obj.label41:setField("reflexes");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setLeft(142);
    obj.label41:setTop(15);
    obj.label41:setWidth(30);
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout4);
    obj.label42:setLeft(20);
    obj.label42:setTop(40);
    obj.label42:setText("Modificadores: +    k");
    obj.label42:setName("label42");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setText("0");
    obj.edit19:setLeft(110);
    obj.edit19:setTop(39);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(20);
    obj.edit19:setTransparent(true);
    obj.edit19:setKeyboardType("numberPad");
    obj.edit19:setField("addRolaIni");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setText("0");
    obj.edit20:setLeft(129);
    obj.edit20:setTop(39);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(20);
    obj.edit20:setTransparent(true);
    obj.edit20:setKeyboardType("numberPad");
    obj.edit20:setField("addMantemIni");
    obj.edit20:setName("edit20");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout4);
    obj.horzLine9:setLeft(120);
    obj.horzLine9:setTop(55);
    obj.horzLine9:setWidth(10);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setName("horzLine9");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout4);
    obj.horzLine10:setLeft(139);
    obj.horzLine10:setTop(55);
    obj.horzLine10:setWidth(10);
    obj.horzLine10:setStrokeColor("white");
    obj.horzLine10:setName("horzLine10");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout4);
    obj.label43:setLeft(20);
    obj.label43:setTop(60);
    obj.label43:setText("Iniciativa Atual:       k");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout4);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setLeft(110);
    obj.label44:setTop(59);
    obj.label44:setWidth(30);
    obj.label44:setHeight(20);
    obj.label44:setField("rolaIni");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout4);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setLeft(129);
    obj.label45:setTop(59);
    obj.label45:setWidth(30);
    obj.label45:setHeight(20);
    obj.label45:setField("mantemIni");
    obj.label45:setName("label45");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox1);
    obj.rectangle9:setLeft(870);
    obj.rectangle9:setTop(30);
    obj.rectangle9:setWidth(100);
    obj.rectangle9:setHeight(24);
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setColor("#212121");
    obj.rectangle9:setName("rectangle9");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.scrollBox1);
    obj.label46:setLeft(880);
    obj.label46:setTop(30);
    obj.label46:setText("ARMADURA");
    obj.label46:setName("label46");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(860);
    obj.layout5:setTop(50);
    obj.layout5:setWidth(205);
    obj.layout5:setHeight(100);
    obj.layout5:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout5:setName("layout5");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setLeft(20);
    obj.label47:setTop(15);
    obj.label47:setText("Tipo: ");
    obj.label47:setName("label47");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout5);
    obj.edit21:setField("tipoArmadura");
    obj.edit21:setLeft(50);
    obj.edit21:setTop(13);
    obj.edit21:setWidth(125);
    obj.edit21:setHeight(22);
    obj.edit21:setTransparent(true);
    obj.edit21:setName("edit21");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout5);
    obj.horzLine11:setLeft(50);
    obj.horzLine11:setTop(33);
    obj.horzLine11:setWidth(125);
    obj.horzLine11:setStrokeColor("white");
    obj.horzLine11:setName("horzLine11");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setLeft(20);
    obj.label48:setTop(35);
    obj.label48:setText("Bônus: ");
    obj.label48:setName("label48");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout5);
    obj.edit22:setLeft(60);
    obj.edit22:setTop(35);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(20);
    obj.edit22:setTransparent(true);
    obj.edit22:setText("0");
    obj.edit22:setField("bonusNA");
    obj.edit22:setName("edit22");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout5);
    obj.horzLine12:setLeft(60);
    obj.horzLine12:setTop(53);
    obj.horzLine12:setWidth(30);
    obj.horzLine12:setStrokeColor("white");
    obj.horzLine12:setName("horzLine12");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout5);
    obj.label49:setLeft(100);
    obj.label49:setTop(35);
    obj.label49:setText("Redução: ");
    obj.label49:setName("label49");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout5);
    obj.edit23:setField("Reducao");
    obj.edit23:setLeft(150);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setTop(35);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(20);
    obj.edit23:setTransparent(true);
    obj.edit23:setName("edit23");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout5);
    obj.horzLine13:setLeft(155);
    obj.horzLine13:setTop(53);
    obj.horzLine13:setWidth(20);
    obj.horzLine13:setStrokeColor("white");
    obj.horzLine13:setName("horzLine13");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout5);
    obj.label50:setLeft(20);
    obj.label50:setTop(65);
    obj.label50:setText("NA Atual: ");
    obj.label50:setName("label50");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout5);
    obj.rectangle10:setLeft(78);
    obj.rectangle10:setTop(64);
    obj.rectangle10:setWidth(25);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setXradius(20);
    obj.rectangle10:setYradius(20);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setColor("#212121");
    obj.rectangle10:setName("rectangle10");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout5);
    obj.label51:setLeft(84);
    obj.label51:setTop(67);
    obj.label51:setField("NA");
    obj.label51:setName("label51");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox1);
    obj.rectangle11:setLeft(710);
    obj.rectangle11:setTop(180);
    obj.rectangle11:setWidth(120);
    obj.rectangle11:setHeight(24);
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(5);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setColor("#212121");
    obj.rectangle11:setName("rectangle11");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.scrollBox1);
    obj.label52:setLeft(720);
    obj.label52:setTop(180);
    obj.label52:setText("FERIMENTOS:");
    obj.label52:setName("label52");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.scrollBox1);
    obj.edit24:setLeft(800);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setTop(180);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(20);
    obj.edit24:setTransparent(false);
    obj.edit24:setField("ferimentos");
    obj.edit24:setName("edit24");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox1);
    obj.rectangle12:setLeft(700);
    obj.rectangle12:setTop(200);
    obj.rectangle12:setWidth(300);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setXradius(25);
    obj.rectangle12:setYradius(25);
    obj.rectangle12:setCornerType("bevel");
    obj.rectangle12:setColor("#212121");
    obj.rectangle12:setName("rectangle12");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(990);
    obj.rectangle13:setTop(213);
    obj.rectangle13:setWidth(180);
    obj.rectangle13:setHeight(174);
    obj.rectangle13:setColor("#212121");
    obj.rectangle13:setName("rectangle13");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox1);
    obj.checkBox1:setLeft(1010);
    obj.checkBox1:setTop(220);
    obj.checkBox1:setText("Permanent Wound");
    obj.checkBox1:setField("PWound");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.scrollBox1);
    obj.checkBox2:setLeft(1010);
    obj.checkBox2:setTop(240);
    obj.checkBox2:setText("Bad Health");
    obj.checkBox2:setField("BHealth");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.scrollBox1);
    obj.checkBox3:setLeft(1010);
    obj.checkBox3:setTop(260);
    obj.checkBox3:setText("Low Pain Threshold");
    obj.checkBox3:setField("LPThold");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.scrollBox1);
    obj.checkBox4:setLeft(1010);
    obj.checkBox4:setTop(280);
    obj.checkBox4:setText("Strength of the Earth");
    obj.checkBox4:setField("SotEarth");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.scrollBox1);
    obj.checkBox5:setLeft(1010);
    obj.checkBox5:setTop(300);
    obj.checkBox5:setText("Quick Healer");
    obj.checkBox5:setField("QHealer");
    obj.checkBox5:setName("checkBox5");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.scrollBox1);
    obj.label53:setLeft(1010);
    obj.label53:setTop(325);
    obj.label53:setText("Recuperação de");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.scrollBox1);
    obj.label54:setLeft(1010);
    obj.label54:setTop(340);
    obj.label54:setText("Ferimentos:");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.scrollBox1);
    obj.label55:setLeft(1040);
    obj.label55:setTop(340);
    obj.label55:setFontSize(15.0);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setField("RecuFerimento");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.scrollBox1);
    obj.label56:setLeft(1115);
    obj.label56:setTop(340);
    obj.label56:setFontSize(15.0);
    obj.label56:setText("/  dia");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.scrollBox1);
    obj.label57:setLeft(1010);
    obj.label57:setFontSize(10.0);
    obj.label57:setTop(365);
    obj.label57:setText("Cálculos com Terra *");
    obj.label57:setName("label57");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.scrollBox1);
    obj.edit25:setField("lastroTerra");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setLeft(1100);
    obj.edit25:setTop(365);
    obj.edit25:setWidth(20);
    obj.edit25:setHeight(20);
    obj.edit25:setTransparent(false);
    obj.edit25:setName("edit25");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(700);
    obj.layout6:setTop(200);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(200);
    obj.layout6:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout6:setName("layout6");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout6);
    obj.label58:setLeft(25);
    obj.label58:setTop(10);
    obj.label58:setFontSize(12.0);
    obj.label58:setText("Nível");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout6);
    obj.label59:setLeft(105);
    obj.label59:setTop(10);
    obj.label59:setFontSize(12.0);
    obj.label59:setText("Pen.            Atual");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout6);
    obj.label60:setLeft(210);
    obj.label60:setTop(10);
    obj.label60:setFontSize(12.0);
    obj.label60:setText("       Total");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout6);
    obj.label61:setLeft(20);
    obj.label61:setTop(30);
    obj.label61:setText("Saudável");
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout6);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setLeft(55);
    obj.label62:setTop(30);
    obj.label62:setText("+0");
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout6);
    obj.label63:setLeft(20);
    obj.label63:setTop(50);
    obj.label63:setText("Escoriado");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout6);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setLeft(55);
    obj.label64:setTop(50);
    obj.label64:setField("Escoriado");
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout6);
    obj.label65:setLeft(20);
    obj.label65:setTop(70);
    obj.label65:setText("Machucado");
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout6);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setLeft(55);
    obj.label66:setTop(70);
    obj.label66:setField("Machucado");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout6);
    obj.label67:setLeft(20);
    obj.label67:setTop(90);
    obj.label67:setText("Ferido");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout6);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setLeft(55);
    obj.label68:setTop(90);
    obj.label68:setField("Ferido");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout6);
    obj.label69:setLeft(20);
    obj.label69:setTop(110);
    obj.label69:setText("Ser. Ferido");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout6);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setLeft(55);
    obj.label70:setTop(110);
    obj.label70:setField("SerFerido");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout6);
    obj.label71:setLeft(20);
    obj.label71:setTop(130);
    obj.label71:setText("Incapacitado");
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout6);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setLeft(55);
    obj.label72:setTop(130);
    obj.label72:setField("Incapacitado");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout6);
    obj.label73:setLeft(20);
    obj.label73:setTop(150);
    obj.label73:setText("Abatido");
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout6);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setLeft(55);
    obj.label74:setTop(150);
    obj.label74:setField("Abatido");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout6);
    obj.label75:setLeft(20);
    obj.label75:setTop(170);
    obj.label75:setText("Inconsciente");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout6);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setLeft(55);
    obj.label76:setTop(170);
    obj.label76:setText("X");
    obj.label76:setName("label76");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout6);
    obj.rectangle14:setLeft(100);
    obj.rectangle14:setTop(30);
    obj.rectangle14:setWidth(1);
    obj.rectangle14:setHeight(170);
    obj.rectangle14:setColor("white");
    obj.rectangle14:setName("rectangle14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout6);
    obj.rectangle15:setLeft(130);
    obj.rectangle15:setTop(30);
    obj.rectangle15:setWidth(1);
    obj.rectangle15:setHeight(170);
    obj.rectangle15:setColor("white");
    obj.rectangle15:setName("rectangle15");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout6);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setLeft(152);
    obj.label77:setTop(30);
    obj.label77:setText("de");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout6);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setLeft(152);
    obj.label78:setTop(50);
    obj.label78:setText("de");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout6);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setLeft(152);
    obj.label79:setTop(70);
    obj.label79:setText("de");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout6);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setLeft(152);
    obj.label80:setTop(90);
    obj.label80:setText("de");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout6);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setLeft(152);
    obj.label81:setTop(110);
    obj.label81:setText("de");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout6);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setLeft(152);
    obj.label82:setTop(130);
    obj.label82:setText("de");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout6);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setLeft(152);
    obj.label83:setTop(150);
    obj.label83:setText("de");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout6);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setLeft(152);
    obj.label84:setTop(170);
    obj.label84:setText("de");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout6);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setFontSize(16.0);
    obj.label85:setLeft(185);
    obj.label85:setTop(30);
    obj.label85:setField("Saud");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout6);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setFontSize(16.0);
    obj.label86:setLeft(185);
    obj.label86:setTop(50);
    obj.label86:setField("Esco");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout6);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setFontSize(16.0);
    obj.label87:setLeft(185);
    obj.label87:setTop(70);
    obj.label87:setField("Mach");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout6);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setFontSize(16.0);
    obj.label88:setLeft(185);
    obj.label88:setTop(90);
    obj.label88:setField("Feri");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout6);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setFontSize(16.0);
    obj.label89:setLeft(185);
    obj.label89:setTop(110);
    obj.label89:setField("Seri");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout6);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setFontSize(16.0);
    obj.label90:setLeft(185);
    obj.label90:setTop(130);
    obj.label90:setField("Inca");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout6);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setFontSize(16.0);
    obj.label91:setLeft(185);
    obj.label91:setTop(150);
    obj.label91:setField("Abat");
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout6);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setFontSize(16.0);
    obj.label92:setLeft(185);
    obj.label92:setTop(170);
    obj.label92:setField("Inco");
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout6);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setFontSize(12.0);
    obj.label93:setLeft(210);
    obj.label93:setTop(30);
    obj.label93:setField("LSaud");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout6);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setFontSize(12.0);
    obj.label94:setLeft(210);
    obj.label94:setTop(30);
    obj.label94:setText("(    )");
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout6);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setFontSize(12.0);
    obj.label95:setLeft(210);
    obj.label95:setTop(50);
    obj.label95:setField("LEsco");
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout6);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setFontSize(12.0);
    obj.label96:setLeft(210);
    obj.label96:setTop(50);
    obj.label96:setText("(    )");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout6);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setFontSize(12.0);
    obj.label97:setLeft(210);
    obj.label97:setTop(70);
    obj.label97:setField("LMach");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout6);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setFontSize(12.0);
    obj.label98:setLeft(210);
    obj.label98:setTop(70);
    obj.label98:setText("(    )");
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout6);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setFontSize(12.0);
    obj.label99:setLeft(210);
    obj.label99:setTop(90);
    obj.label99:setField("LFeri");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout6);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setFontSize(12.0);
    obj.label100:setLeft(210);
    obj.label100:setTop(90);
    obj.label100:setText("(    )");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout6);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setFontSize(12.0);
    obj.label101:setLeft(210);
    obj.label101:setTop(110);
    obj.label101:setField("LSeri");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout6);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setFontSize(12.0);
    obj.label102:setLeft(210);
    obj.label102:setTop(110);
    obj.label102:setText("(    )");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout6);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setFontSize(12.0);
    obj.label103:setLeft(210);
    obj.label103:setTop(130);
    obj.label103:setField("LInca");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout6);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setFontSize(12.0);
    obj.label104:setLeft(210);
    obj.label104:setTop(130);
    obj.label104:setText("(    )");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout6);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setFontSize(12.0);
    obj.label105:setLeft(210);
    obj.label105:setTop(150);
    obj.label105:setField("LAbat");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout6);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setFontSize(12.0);
    obj.label106:setLeft(210);
    obj.label106:setTop(150);
    obj.label106:setText("(    )");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout6);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setFontSize(12.0);
    obj.label107:setLeft(210);
    obj.label107:setTop(170);
    obj.label107:setField("LInco");
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout6);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setFontSize(12.0);
    obj.label108:setLeft(210);
    obj.label108:setTop(170);
    obj.label108:setText("(    )");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout6);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setFontSize(16.0);
    obj.label109:setLeft(120);
    obj.label109:setTop(30);
    obj.label109:setField("FSaud");
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout6);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setFontSize(16.0);
    obj.label110:setLeft(120);
    obj.label110:setTop(50);
    obj.label110:setField("FEsco");
    obj.label110:setName("label110");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout6);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setFontSize(16.0);
    obj.label111:setLeft(120);
    obj.label111:setTop(70);
    obj.label111:setField("FMach");
    obj.label111:setName("label111");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout6);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setFontSize(16.0);
    obj.label112:setLeft(120);
    obj.label112:setTop(90);
    obj.label112:setField("FFeri");
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout6);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setFontSize(16.0);
    obj.label113:setLeft(120);
    obj.label113:setTop(110);
    obj.label113:setField("FSeri");
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout6);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setFontSize(16.0);
    obj.label114:setLeft(120);
    obj.label114:setTop(130);
    obj.label114:setField("FInca");
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout6);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setFontSize(16.0);
    obj.label115:setLeft(120);
    obj.label115:setTop(150);
    obj.label115:setField("FAbat");
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout6);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setFontSize(16.0);
    obj.label116:setLeft(120);
    obj.label116:setTop(170);
    obj.label116:setField("FInco");
    obj.label116:setName("label116");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox1);
    obj.rectangle16:setLeft(30);
    obj.rectangle16:setTop(600);
    obj.rectangle16:setWidth(695);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setColor("#212121");
    obj.rectangle16:setName("rectangle16");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.scrollBox1);
    obj.label117:setLeft(100);
    obj.label117:setTop(603);
    obj.label117:setText("PERÍCIAS");
    obj.label117:setName("label117");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.scrollBox1);
    obj.label118:setLeft(260);
    obj.label118:setTop(603);
    obj.label118:setText("TIPOS");
    obj.label118:setName("label118");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.scrollBox1);
    obj.label119:setLeft(327);
    obj.label119:setTop(603);
    obj.label119:setText("RANK");
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.scrollBox1);
    obj.label120:setLeft(380);
    obj.label120:setTop(603);
    obj.label120:setText("ATRIBUTO");
    obj.label120:setName("label120");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.scrollBox1);
    obj.label121:setLeft(475);
    obj.label121:setTop(603);
    obj.label121:setText("ROLAGEM");
    obj.label121:setName("label121");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.scrollBox1);
    obj.label122:setLeft(580);
    obj.label122:setTop(603);
    obj.label122:setText("ÊNFASES");
    obj.label122:setName("label122");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(665);
    obj.button1:setTop(600);
    obj.button1:setHeight(25);
    obj.button1:setText("Nova Perícia");
    obj.button1:setWidth(90);
    obj.button1:setName("button1");

    obj.rclSkills = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSkills:setParent(obj.scrollBox1);
    obj.rclSkills:setName("rclSkills");
    obj.rclSkills:setField("pericias");
    obj.rclSkills:setTemplateForm("templateSkills");
    obj.rclSkills:setLeft(5);
    obj.rclSkills:setTop(630);
    obj.rclSkills:setWidth(1080);
    obj.rclSkills:setAutoHeight(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.rclSkills);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setWidth(1800);
    obj.boxDetalhesDoItem:setHeight(600);
    obj.boxDetalhesDoItem:setTop(-20);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.boxDetalhesDoItem);
    obj.rectangle17:setColor("#212121");
    obj.rectangle17:setXradius(10);
    obj.rectangle17:setYradius(10);
    obj.rectangle17:setLeft(760);
    obj.rectangle17:setWidth(160);
    obj.rectangle17:setTop(20);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle17:setName("rectangle17");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle17);
    obj.label123:setLeft(10);
    obj.label123:setText("Habilidades de Maestria");
    obj.label123:setWidth(150);
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle17);
    obj.label124:setLeft(10);
    obj.label124:setTop(20);
    obj.label124:setText("Nível 3:");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle17);
    obj.label125:setLeft(10);
    obj.label125:setTop(90);
    obj.label125:setText("Nível 5:");
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle17);
    obj.label126:setLeft(10);
    obj.label126:setTop(160);
    obj.label126:setText("Nível 7:");
    obj.label126:setName("label126");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle17);
    obj.textEditor1:setField("maestria3Skill");
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(40);
    obj.textEditor1:setHeight(50);
    obj.textEditor1:setWidth(300);
    obj.textEditor1:setVisible(true);
    obj.textEditor1:setMargins({right=2});
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle17);
    obj.textEditor2:setField("maestria5Skill");
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(110);
    obj.textEditor2:setHeight(50);
    obj.textEditor2:setWidth(300);
    obj.textEditor2:setVisible(true);
    obj.textEditor2:setMargins({right=2});
    obj.textEditor2:setName("textEditor2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle17);
    obj.textEditor3:setField("maestria7Skill");
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(180);
    obj.textEditor3:setHeight(50);
    obj.textEditor3:setWidth(300);
    obj.textEditor3:setVisible(true);
    obj.textEditor3:setMargins({right=2});
    obj.textEditor3:setName("textEditor3");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Mecânicas");
    obj.tab2:setName("tab2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox2);
    obj.rectangle18:setLeft(15);
    obj.rectangle18:setTop(10);
    obj.rectangle18:setWidth(380);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setColor("#212121");
    obj.rectangle18:setName("rectangle18");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.scrollBox2);
    obj.label127:setLeft(20);
    obj.label127:setTop(15);
    obj.label127:setText("VANTAGENS");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.scrollBox2);
    obj.label128:setLeft(255);
    obj.label128:setTop(15);
    obj.label128:setText("TIPO");
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.scrollBox2);
    obj.label129:setLeft(330);
    obj.label129:setTop(15);
    obj.label129:setText("CUSTO");
    obj.label129:setName("label129");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox2);
    obj.button2:setLeft(375);
    obj.button2:setTop(10);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setWidth(25);
    obj.button2:setName("button2");

    obj.rclVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantagens:setParent(obj.scrollBox2);
    obj.rclVantagens:setName("rclVantagens");
    obj.rclVantagens:setField("vantagens");
    obj.rclVantagens:setTemplateForm("templateVantagens");
    obj.rclVantagens:setLeft(10);
    obj.rclVantagens:setTop(35);
    obj.rclVantagens:setWidth(410);
    obj.rclVantagens:setHeight(150);

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.scrollBox2);
    obj.rectangle19:setLeft(435);
    obj.rectangle19:setTop(10);
    obj.rectangle19:setWidth(380);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(5);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setColor("#212121");
    obj.rectangle19:setName("rectangle19");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.scrollBox2);
    obj.label130:setLeft(440);
    obj.label130:setTop(15);
    obj.label130:setText("DESVANTAGENS");
    obj.label130:setName("label130");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.scrollBox2);
    obj.label131:setLeft(675);
    obj.label131:setTop(15);
    obj.label131:setText("TIPO");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.scrollBox2);
    obj.label132:setLeft(750);
    obj.label132:setTop(15);
    obj.label132:setText("CUSTO");
    obj.label132:setName("label132");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox2);
    obj.button3:setLeft(795);
    obj.button3:setTop(10);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setWidth(25);
    obj.button3:setName("button3");

    obj.rclDesVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDesVantagens:setParent(obj.scrollBox2);
    obj.rclDesVantagens:setName("rclDesVantagens");
    obj.rclDesVantagens:setField("desvantagens");
    obj.rclDesVantagens:setTemplateForm("templateDesVantagens");
    obj.rclDesVantagens:setLeft(430);
    obj.rclDesVantagens:setTop(35);
    obj.rclDesVantagens:setWidth(410);
    obj.rclDesVantagens:setHeight(150);

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.scrollBox2);
    obj.rectangle20:setLeft(850);
    obj.rectangle20:setTop(10);
    obj.rectangle20:setWidth(340);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setColor("#212121");
    obj.rectangle20:setName("rectangle20");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle20);
    obj.label133:setLeft(5);
    obj.label133:setTop(5);
    obj.label133:setText("KATA/KIHO");
    obj.label133:setName("label133");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox2);
    obj.button4:setLeft(1170);
    obj.button4:setTop(10);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setWidth(25);
    obj.button4:setName("button4");

    obj.rclKata = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclKata:setParent(obj.scrollBox2);
    obj.rclKata:setName("rclKata");
    obj.rclKata:setField("kata");
    obj.rclKata:setTemplateForm("templateKata");
    obj.rclKata:setLeft(850);
    obj.rclKata:setTop(35);
    obj.rclKata:setWidth(410);
    obj.rclKata:setHeight(150);

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.scrollBox2);
    obj.rectangle21:setLeft(15);
    obj.rectangle21:setTop(200);
    obj.rectangle21:setWidth(800);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setXradius(5);
    obj.rectangle21:setYradius(5);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setColor("#212121");
    obj.rectangle21:setName("rectangle21");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.scrollBox2);
    obj.label134:setLeft(20);
    obj.label134:setTop(205);
    obj.label134:setText("TÉCNICAS");
    obj.label134:setName("label134");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox2);
    obj.button5:setLeft(720);
    obj.button5:setTop(200);
    obj.button5:setHeight(25);
    obj.button5:setText("Nova Técnica");
    obj.button5:setWidth(100);
    obj.button5:setName("button5");

    obj.rclTecnicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTecnicas:setParent(obj.scrollBox2);
    obj.rclTecnicas:setName("rclTecnicas");
    obj.rclTecnicas:setField("tecnicas");
    obj.rclTecnicas:setTemplateForm("templateTecnicas");
    obj.rclTecnicas:setMinQt(1);
    obj.rclTecnicas:setLeft(10);
    obj.rclTecnicas:setTop(230);
    obj.rclTecnicas:setWidth(830);
    obj.rclTecnicas:setAutoHeight(true);

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.scrollBox2);
    obj.rectangle22:setLeft(850);
    obj.rectangle22:setTop(200);
    obj.rectangle22:setWidth(340);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setXradius(5);
    obj.rectangle22:setYradius(5);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setColor("#212121");
    obj.rectangle22:setName("rectangle22");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle22);
    obj.label135:setLeft(5);
    obj.label135:setTop(5);
    obj.label135:setText("ARMAS");
    obj.label135:setName("label135");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox2);
    obj.button6:setLeft(1170);
    obj.button6:setTop(200);
    obj.button6:setHeight(25);
    obj.button6:setText("+");
    obj.button6:setWidth(25);
    obj.button6:setName("button6");

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.scrollBox2);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("armas");
    obj.rclArmas:setTemplateForm("templateArmas");
    obj.rclArmas:setLeft(850);
    obj.rclArmas:setTop(225);
    obj.rclArmas:setWidth(410);
    obj.rclArmas:setHeight(200);

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.scrollBox2);
    obj.rectangle23:setLeft(850);
    obj.rectangle23:setTop(430);
    obj.rectangle23:setWidth(340);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(5);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setColor("#212121");
    obj.rectangle23:setName("rectangle23");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.rectangle23);
    obj.label136:setLeft(5);
    obj.label136:setTop(5);
    obj.label136:setText("ITEMS E POSSES");
    obj.label136:setName("label136");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setLeft(110);
    obj.rectangle24:setTop(3);
    obj.rectangle24:setWidth(1);
    obj.rectangle24:setHeight(20);
    obj.rectangle24:setColor("white");
    obj.rectangle24:setName("rectangle24");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle23);
    obj.label137:setLeft(120);
    obj.label137:setTop(3);
    obj.label137:setText("Koku:");
    obj.label137:setName("label137");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle23);
    obj.edit26:setLeft(155);
    obj.edit26:setField("koku");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setTop(2);
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(35);
    obj.edit26:setName("edit26");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.rectangle23);
    obj.label138:setLeft(200);
    obj.label138:setTop(3);
    obj.label138:setText("Bu:");
    obj.label138:setName("label138");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle23);
    obj.edit27:setLeft(220);
    obj.edit27:setField("bu");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setTop(2);
    obj.edit27:setHeight(20);
    obj.edit27:setWidth(35);
    obj.edit27:setName("edit27");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.rectangle23);
    obj.label139:setLeft(260);
    obj.label139:setTop(3);
    obj.label139:setText("Zeni:");
    obj.label139:setName("label139");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle23);
    obj.edit28:setLeft(290);
    obj.edit28:setField("zeni");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setTop(2);
    obj.edit28:setHeight(20);
    obj.edit28:setWidth(35);
    obj.edit28:setName("edit28");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.scrollBox2);
    obj.textEditor4:setLeft(850);
    obj.textEditor4:setTop(460);
    obj.textEditor4:setWidth(340);
    obj.textEditor4:setField("inventario");
    obj.textEditor4:setHeight(200);
    obj.textEditor4:setName("textEditor4");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Magias");
    obj.tab3:setName("tab3");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.scrollBox3);
    obj.rectangle25:setLeft(25);
    obj.rectangle25:setTop(10);
    obj.rectangle25:setWidth(127);
    obj.rectangle25:setHeight(24);
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(5);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setColor("#212121");
    obj.rectangle25:setName("rectangle25");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.scrollBox3);
    obj.label140:setLeft(30);
    obj.label140:setTop(12);
    obj.label140:setText("ESPAÇOS DE MAGIA");
    obj.label140:setName("label140");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox3);
    obj.layout7:setLeft(10);
    obj.layout7:setTop(30);
    obj.layout7:setWidth(850);
    obj.layout7:setHeight(40);
    obj.layout7:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout7:setName("layout7");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout7);
    obj.image2:setLeft(25);
    obj.image2:setTop(7);
    obj.image2:setScale(0.25);
    obj.image2:setSRC("/Frames/miniar.png");
    obj.image2:setName("image2");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout7);
    obj.label141:setLeft(55);
    obj.label141:setFontSize(20.0);
    obj.label141:setTop(10);
    obj.label141:setText("Ar:");
    obj.label141:setName("label141");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout7);
    obj.edit29:setField("slotAr");
    obj.edit29:setLeft(85);
    obj.edit29:setTop(5);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setWidth(25);
    obj.edit29:setTransparent(true);
    obj.edit29:setHeight(25);
    obj.edit29:setFontSize(23.0);
    obj.edit29:setName("edit29");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout7);
    obj.horzLine14:setLeft(85);
    obj.horzLine14:setTop(28);
    obj.horzLine14:setWidth(25);
    obj.horzLine14:setStrokeColor("white");
    obj.horzLine14:setName("horzLine14");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout7);
    obj.label142:setLeft(115);
    obj.label142:setFontSize(20.0);
    obj.label142:setTop(10);
    obj.label142:setText("de");
    obj.label142:setName("label142");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout7);
    obj.label143:setLeft(145);
    obj.label143:setTop(5);
    obj.label143:setWidth(25);
    obj.label143:setHeight(25);
    obj.label143:setFontSize(23.0);
    obj.label143:setField("air");
    obj.label143:setName("label143");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout7);
    obj.image3:setLeft(170);
    obj.image3:setTop(7);
    obj.image3:setScale(0.25);
    obj.image3:setSRC("/Frames/miniterra.png");
    obj.image3:setName("image3");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout7);
    obj.label144:setLeft(200);
    obj.label144:setFontSize(20.0);
    obj.label144:setTop(10);
    obj.label144:setText("Terra:");
    obj.label144:setName("label144");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout7);
    obj.edit30:setField("slotTerra");
    obj.edit30:setLeft(252);
    obj.edit30:setTop(5);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setWidth(25);
    obj.edit30:setTransparent(true);
    obj.edit30:setHeight(25);
    obj.edit30:setFontSize(23.0);
    obj.edit30:setName("edit30");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout7);
    obj.horzLine15:setLeft(252);
    obj.horzLine15:setTop(28);
    obj.horzLine15:setWidth(25);
    obj.horzLine15:setStrokeColor("white");
    obj.horzLine15:setName("horzLine15");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout7);
    obj.label145:setLeft(282);
    obj.label145:setFontSize(20.0);
    obj.label145:setTop(10);
    obj.label145:setText("de");
    obj.label145:setName("label145");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout7);
    obj.label146:setLeft(312);
    obj.label146:setTop(5);
    obj.label146:setWidth(25);
    obj.label146:setHeight(25);
    obj.label146:setFontSize(23.0);
    obj.label146:setField("earth");
    obj.label146:setName("label146");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout7);
    obj.image4:setLeft(337);
    obj.image4:setTop(7);
    obj.image4:setScale(0.25);
    obj.image4:setSRC("/Frames/minifogo.png");
    obj.image4:setName("image4");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout7);
    obj.label147:setLeft(367);
    obj.label147:setAutoSize(true);
    obj.label147:setFontSize(20.0);
    obj.label147:setTop(5);
    obj.label147:setText("Fogo:");
    obj.label147:setName("label147");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout7);
    obj.edit31:setField("slotFogo");
    obj.edit31:setLeft(421);
    obj.edit31:setTop(5);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setWidth(25);
    obj.edit31:setTransparent(true);
    obj.edit31:setHeight(25);
    obj.edit31:setFontSize(23.0);
    obj.edit31:setName("edit31");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout7);
    obj.horzLine16:setLeft(421);
    obj.horzLine16:setTop(28);
    obj.horzLine16:setWidth(25);
    obj.horzLine16:setStrokeColor("white");
    obj.horzLine16:setName("horzLine16");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout7);
    obj.label148:setLeft(451);
    obj.label148:setFontSize(20.0);
    obj.label148:setTop(10);
    obj.label148:setText("de");
    obj.label148:setName("label148");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout7);
    obj.label149:setLeft(481);
    obj.label149:setTop(5);
    obj.label149:setWidth(25);
    obj.label149:setHeight(25);
    obj.label149:setFontSize(23.0);
    obj.label149:setField("fire");
    obj.label149:setName("label149");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout7);
    obj.image5:setLeft(505);
    obj.image5:setTop(7);
    obj.image5:setScale(0.25);
    obj.image5:setSRC("/Frames/miniagua.png");
    obj.image5:setName("image5");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout7);
    obj.label150:setLeft(535);
    obj.label150:setAutoSize(true);
    obj.label150:setFontSize(20.0);
    obj.label150:setTop(5);
    obj.label150:setText("Água:");
    obj.label150:setName("label150");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout7);
    obj.edit32:setField("slotAgua");
    obj.edit32:setLeft(589);
    obj.edit32:setTop(5);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setWidth(25);
    obj.edit32:setTransparent(true);
    obj.edit32:setHeight(25);
    obj.edit32:setFontSize(23.0);
    obj.edit32:setName("edit32");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout7);
    obj.horzLine17:setLeft(589);
    obj.horzLine17:setTop(28);
    obj.horzLine17:setWidth(25);
    obj.horzLine17:setStrokeColor("white");
    obj.horzLine17:setName("horzLine17");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout7);
    obj.label151:setLeft(619);
    obj.label151:setFontSize(20.0);
    obj.label151:setTop(10);
    obj.label151:setText("de");
    obj.label151:setName("label151");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout7);
    obj.label152:setLeft(649);
    obj.label152:setTop(5);
    obj.label152:setWidth(25);
    obj.label152:setHeight(25);
    obj.label152:setFontSize(23.0);
    obj.label152:setField("water");
    obj.label152:setName("label152");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout7);
    obj.image6:setLeft(675);
    obj.image6:setTop(7);
    obj.image6:setScale(0.25);
    obj.image6:setSRC("/Frames/minivazio.png");
    obj.image6:setName("image6");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout7);
    obj.label153:setLeft(705);
    obj.label153:setAutoSize(true);
    obj.label153:setFontSize(20.0);
    obj.label153:setTop(5);
    obj.label153:setText("Vazio:");
    obj.label153:setName("label153");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout7);
    obj.edit33:setField("slotVazio");
    obj.edit33:setLeft(760);
    obj.edit33:setTop(5);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setTransparent(true);
    obj.edit33:setWidth(25);
    obj.edit33:setHeight(25);
    obj.edit33:setFontSize(23.0);
    obj.edit33:setName("edit33");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout7);
    obj.horzLine18:setLeft(760);
    obj.horzLine18:setTop(28);
    obj.horzLine18:setWidth(25);
    obj.horzLine18:setStrokeColor("white");
    obj.horzLine18:setName("horzLine18");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout7);
    obj.label154:setLeft(790);
    obj.label154:setFontSize(20.0);
    obj.label154:setTop(10);
    obj.label154:setText("de");
    obj.label154:setName("label154");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout7);
    obj.label155:setLeft(820);
    obj.label155:setTop(5);
    obj.label155:setWidth(25);
    obj.label155:setHeight(25);
    obj.label155:setFontSize(23.0);
    obj.label155:setField("void");
    obj.label155:setName("label155");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.scrollBox3);
    obj.rectangle26:setLeft(25);
    obj.rectangle26:setTop(100);
    obj.rectangle26:setWidth(60);
    obj.rectangle26:setHeight(20);
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(5);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setColor("#212121");
    obj.rectangle26:setName("rectangle26");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.scrollBox3);
    obj.label156:setLeft(30);
    obj.label156:setTop(100);
    obj.label156:setText("MAGIAS");
    obj.label156:setName("label156");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox3);
    obj.button7:setLeft(100);
    obj.button7:setTop(95);
    obj.button7:setHeight(25);
    obj.button7:setText("Nova Magia");
    obj.button7:setWidth(100);
    obj.button7:setName("button7");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.scrollBox3);
    obj.rclMagias:setAlign("client");
    obj.rclMagias:setLayout("horizontalTiles");
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("templateMagias");
    obj.rclMagias:setMargins({left = 20, right = 5, top = 130, bottom = 5});

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Características");
    obj.tab4:setName("tab4");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox4);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(5);
    obj.layout8:setWidth(400);
    obj.layout8:setHeight(400);
    obj.layout8:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout8:setName("layout8");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout8);
    obj.image7:setWidth(370);
    obj.image7:setLeft(15);
    obj.image7:setTop(15);
    obj.image7:setHeight(370);
    obj.image7:setStyle("proportional");
    obj.image7:setField("imgChar");
    lfm_setPropAsString(obj.image7, "animate",  "true");
    obj.image7:setEditable(true);
    obj.image7:setName("image7");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.scrollBox4);
    obj.rectangle27:setLeft(430);
    obj.rectangle27:setTop(5);
    obj.rectangle27:setWidth(80);
    obj.rectangle27:setHeight(20);
    obj.rectangle27:setXradius(5);
    obj.rectangle27:setYradius(5);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setColor("#212121");
    obj.rectangle27:setName("rectangle27");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.scrollBox4);
    obj.label157:setLeft(435);
    obj.label157:setTop(5);
    obj.label157:setText("APARÊNCIA");
    obj.label157:setName("label157");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox4);
    obj.layout9:setLeft(415);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(400);
    obj.layout9:setHeight(170);
    obj.layout9:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout9:setName("layout9");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout9);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("aparencia");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox4);
    obj.rectangle28:setLeft(430);
    obj.rectangle28:setTop(200);
    obj.rectangle28:setWidth(110);
    obj.rectangle28:setHeight(20);
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setColor("#212121");
    obj.rectangle28:setName("rectangle28");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.scrollBox4);
    obj.label158:setLeft(434);
    obj.label158:setTop(200);
    obj.label158:setText("PERSONALIDADE");
    obj.label158:setName("label158");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox4);
    obj.layout10:setLeft(414);
    obj.layout10:setTop(220);
    obj.layout10:setWidth(400);
    obj.layout10:setHeight(185);
    obj.layout10:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout10:setName("layout10");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout10);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("personalidade");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.scrollBox4);
    obj.rectangle29:setLeft(841);
    obj.rectangle29:setTop(5);
    obj.rectangle29:setWidth(95);
    obj.rectangle29:setHeight(20);
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(5);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setColor("#212121");
    obj.rectangle29:setName("rectangle29");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.scrollBox4);
    obj.label159:setLeft(846);
    obj.label159:setTop(5);
    obj.label159:setText("20 QUESTÕES");
    obj.label159:setName("label159");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox4);
    obj.layout11:setLeft(825);
    obj.layout11:setTop(25);
    obj.layout11:setWidth(450);
    obj.layout11:setHeight(380);
    obj.layout11:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout11:setName("layout11");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout11);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("20questoes");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.scrollBox4);
    obj.rectangle30:setLeft(17);
    obj.rectangle30:setTop(410);
    obj.rectangle30:setWidth(70);
    obj.rectangle30:setHeight(20);
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(5);
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setColor("#212121");
    obj.rectangle30:setName("rectangle30");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.scrollBox4);
    obj.label160:setLeft(22);
    obj.label160:setTop(410);
    obj.label160:setText("HISTÓRIA");
    obj.label160:setName("label160");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox4);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(430);
    obj.layout12:setWidth(1270);
    obj.layout12:setHeight(380);
    obj.layout12:setFrameStyle("/Frames/frameFrenteDnD/frameFrente.xml");
    obj.layout12:setName("layout12");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout12);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#404040");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab5);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("anotacao");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#404040");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setLeft(10);
    obj.richEdit2:setTop(10);
    obj.richEdit2:setName("richEdit2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.earth ~= nil) then
                                    local terr = sheet.earth;
                                    local lastro = sheet.lastroTerra;
            
                                    if (sheet.BHealth == true) then
                                            terr = terr - 1;
                                    end;
            
                                    local terra = (terr) * (lastro);
            
                                    sheet.Saud = terr*5;
                                    sheet.Esco = terra;
                                    sheet.Mach = terra;
                                    sheet.Feri = terra;
                                    sheet.Seri = terra;
                                    sheet.Inca = terra;
                                    sheet.Abat = terra;
                                    sheet.Inco = terra;
            
                                    sheet.LSaud = terr*5;
            
                                    if (sheet.PWound == true) then
                                            sheet.LSaud = 0;
                                    end;
            
                                    sheet.LEsco = sheet.LSaud+terra;
                                    sheet.LMach = sheet.LEsco+terra;
                                    sheet.LFeri = sheet.LMach+terra;
                                    sheet.LSeri = sheet.LFeri+terra;
                                    sheet.LInca = sheet.LSeri+terra;
                                    sheet.LAbat = sheet.LInca+terra;
                                    sheet.LInco = sheet.LAbat+terra;
                                    
                            end
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.stamina ~= nil) and (sheet.nivelSb ~= nil) then
                            local RecuFerimento = (tonumber(sheet.RecuFerimento) or 0);
            
                            RecuFerimento = sheet.stamina * 2 + sheet.nivelSb;
                                    if (sheet.QHealer == true) then
                                    RecuFerimento = (sheet.stamina + 2) * 2 + sheet.nivelSb;
                                    end;
            
                            sheet.RecuFerimento = RecuFerimento;
                            end
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.earth ~= nil) then
                                    local ferimentos = (tonumber(sheet.ferimentos) or 0);
                                    local lastro = sheet.lastroTerra;
            
                                    if sheet.PWound == true then
                                            ferimentos = ferimentos + sheet.Saud;
                                    end;
            
                                    local terr = sheet.earth;
            
                                    if (sheet.BHealth == true) then
                                            terr = terr - 1;
                                    end;
            
                                    local terra = (terr) * (lastro);
            
                                    local FSaud = ferimentos;
            
                                    if FSaud >= sheet.Saud then
                                            sheet.FSaud = sheet.Saud;
                                    else
                                            sheet.FSaud = FSaud;
                                    end;
            
                                    local FEsco = FSaud - terr*5;
            
                                    if FEsco >= sheet.Esco then
                                            sheet.FEsco = sheet.Esco;
                                    else
                                            sheet.FEsco = FEsco;
                                    end;
            
                                    local FMach = FEsco - terra;
            
                                    if FMach >= sheet.Mach then
                                            sheet.FMach = sheet.Mach;
                                    else
                                            sheet.FMach = FMach;
                                    end;
            
                                    local FFeri = FMach - terra;
            
                                    if FFeri >= sheet.Feri then
                                            sheet.FFeri = sheet.Feri;
                                    else
                                            sheet.FFeri = FFeri;
                                    end;
            
                                    local FSeri = FFeri - terra;
            
                                    if FSeri >= sheet.Seri then
                                            sheet.FSeri = sheet.Seri;
                                    else
                                            sheet.FSeri = FSeri;
                                    end;
            
                                    local FInca = FSeri - terra;
            
                                    if FInca >= sheet.Inca then
                                            sheet.FInca = sheet.Inca;
                                    else
                                            sheet.FInca = FInca;
                                    end;
            
                                    local FAbat = FInca - terra;
            
                                    if FAbat >= sheet.Abat then
                                            sheet.FAbat = sheet.Abat;
                                    else
                                            sheet.FAbat = FAbat;
                                    end;
            
                                    local FInco = FAbat - terra;
                                            sheet.FInco = FInco;
            
                                    if FSaud < 0 then
                                            sheet.FSaud = 0;
                                            FSaud = 0;
                                    end;
            
                                    if (FEsco < 0) then
                                            sheet.FEsco = 0;
                                            FSaud = 0;
                                    end;
            
                                    if (ferimentos < sheet.Saud) then
                                            sheet.FEsco = 0;
                                            FEsco = 0;
                                    end;
            
                                    if (FMach < 0) or (ferimentos < sheet.Esco) then
                                            sheet.FMach = 0;
                                    end;
            
                                    if (FFeri < 0) or (ferimentos < sheet.Mach) then
                                            sheet.FFeri = 0;
                                    end;
            
                                    if (FSeri < 0) or (ferimentos < sheet.Feri) then
                                            sheet.FSeri = 0;
                                    end;
            
                                    if (FInca < 0) or (ferimentos < sheet.Seri) then
                                            sheet.FInca = 0;
                                    end;
            
                                    if (FAbat < 0) or (ferimentos < sheet.Inca) then
                                            sheet.FAbat = 0;
                                    end;
            
                                    if (FInco < 0) or (ferimentos < sheet.Abat) then
                                            sheet.FInco = 0;
                                    end
            
                            end
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.earth ~= nil and sheet.air ~= nil and sheet.water ~= nil and sheet.fire ~= nil and sheet.void ~= nil and sheet.maisSab ~= nil) then
                            local countSum = (tonumber(sheet.countSum) or 0);
            
            
                                    sheet.sabedoria = math.floor(sheet.earth + sheet.air + sheet.water + sheet.fire + sheet.void)*10 + sheet.maisSab + countSum;
                            end
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.sabedoria ~= nil) then
                                    local sabedoria = tonumber(sheet.sabedoria);                      
                                    local uwu;          
            
                                    uwu = math.floor((sabedoria - 150) / 25);
                                    
                                            if 0 > uwu then
                                                    uwu = -1;
                                            end;
            
                                    sheet.nivelSb = uwu + 2;
                            end
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local Escoriado = 3;
                            local Machucado = 5;
                            local Ferido = 10;
                            local SerFerido = 15;
                            local Incapacitado = 20;
                            local Abatido = 40;
                            
                            if (sheet.LPThold == true) then    
                                    Escoriado = Escoriado + 5;
                                    Machucado = Machucado + 5;
                                    Ferido = Ferido + 5;
                                    SerFerido = SerFerido + 5;
                                    Incapacitado = Incapacitado + 5;
                                    Abatido = Abatido + 5;
                            end
            
                            if (sheet.SotEarth == true) then    
                                    Escoriado = Escoriado - 3;
                                    Machucado = Machucado - 3;
                                    Ferido = Ferido - 3;
                                    SerFerido = SerFerido - 3;
                                    Incapacitado = Incapacitado - 3;
                                    Abatido = Abatido - 3;
                            end
            
                            sheet.Escoriado = "+" .. tostring(Escoriado);
                            sheet.Machucado = "+" .. tostring(Machucado);
                            sheet.Ferido = "+" .. tostring(Ferido);
                            sheet.SerFerido = "+" .. tostring(SerFerido);
                            sheet.Incapacitado = "+" .. tostring(Incapacitado);
                            sheet.Abatido = "+" .. tostring(Abatido);
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.willpower and sheet.stamina ~= nil) then
                                    local willpower = tonumber(sheet.willpower);                      
                                    local stamina = tonumber(sheet.stamina);    
            
                                    if willpower < stamina then
                                            sheet.earth = willpower;
                                    else
                                            sheet.earth = stamina;
                                    end;
            
                            end
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.strength and sheet.perception ~= nil) then
                                    local strength = tonumber(sheet.strength);                      
                                    local perception = tonumber(sheet.perception);    
            
                                    if strength < perception then
                                            sheet.water = strength;
                                    else
                                            sheet.water = perception;
                                    end;
            
                            end
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.agility and sheet.intelligence ~= nil) then
                                    local agility = tonumber(sheet.agility);                      
                                    local intelligence = tonumber(sheet.intelligence);    
            
                                    if agility < intelligence then
                                            sheet.fire = agility;
                                    else
                                            sheet.fire = intelligence;
                                    end;
            
                            end
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.reflexes and sheet.awareness ~= nil) then
                                    local reflexes = tonumber(sheet.reflexes);                      
                                    local awareness = tonumber(sheet.awareness);    
            
                                    if reflexes < awareness then
                                            sheet.air = reflexes;
                                    else
                                            sheet.air = awareness;
                                    end;
            
                            end
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.nivelSb and sheet.addRolaIni ~= nil and sheet.addMantemIni ~= nil) then
                                    local reflexes = tonumber(sheet.reflexes);                      
                                    local nivelSb = tonumber(sheet.nivelSb);  
                                    local addMantemIni = tonumber(sheet.addMantemIni);
                                    local addRolaIni = tonumber(sheet.addRolaIni);
            
                                    sheet.RolaIni = math.floor(reflexes+nivelSb+addRolaIni);
                                    sheet.MantemIni = math.floor(reflexes+addMantemIni);
            
                            end
        end, obj);

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.bonusNA and sheet.reflexes ~= nil) then
                                    sheet.NA = math.floor(5*sheet.reflexes)+5+sheet.bonusNA;
                            end
        end, obj);

    obj._e_event12 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclSkills:append();
        end, obj);

    obj._e_event13 = obj.rclSkills:addEventListener("onSelect",
        function (_)
            local node = self.rclSkills.selectedNode; 
                            self.boxDetalhesDoItem.node = node;                       
                            self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event14 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclVantagens:append();
        end, obj);

    obj._e_event15 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclDesVantagens:append();
        end, obj);

    obj._e_event16 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclKata:append();
        end, obj);

    obj._e_event17 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclTecnicas:append();
        end, obj);

    obj._e_event18 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclArmas:append();
        end, obj);

    obj._e_event19 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.rclDesVantagens ~= nil then self.rclDesVantagens:destroy(); self.rclDesVantagens = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.fan ~= nil then self.fan:destroy(); self.fan = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rclTecnicas ~= nil then self.rclTecnicas:destroy(); self.rclTecnicas = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rclKata ~= nil then self.rclKata:destroy(); self.rclKata = nil; end;
        if self.rclSkills ~= nil then self.rclSkills:destroy(); self.rclSkills = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmOurFichaL5R4e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmOurFichaL5R4e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmOurFichaL5R4e = {
    newEditor = newfrmOurFichaL5R4e, 
    new = newfrmOurFichaL5R4e, 
    name = "frmOurFichaL5R4e", 
    dataType = "L5R_4e_Otimizado", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "L5R 4e (Otimizado)", 
    description=""};

frmOurFichaL5R4e = _frmOurFichaL5R4e;
Firecast.registrarForm(_frmOurFichaL5R4e);
Firecast.registrarDataType(_frmOurFichaL5R4e);

return _frmOurFichaL5R4e;
