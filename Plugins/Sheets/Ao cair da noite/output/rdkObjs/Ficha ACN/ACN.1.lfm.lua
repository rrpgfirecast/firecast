require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmACN1()
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
    obj:setName("frmACN1");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.popOther = GUI.fromHandle(_obj_newObject("popup"));
    obj.popOther:setParent(obj);
    obj.popOther:setName("popOther");
    obj.popOther:setWidth(200);
    obj.popOther:setHeight(150);
    obj.popOther:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popOther, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popOther);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Inicial");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicial");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(30);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Apr.");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("aprimoramento");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(30);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("xp");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(30);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Custo Apr.");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("multApr");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(30);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Custo XP");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("client");
    obj.edit5:setField("multXp");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popOther);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
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

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Nome");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("nome");
    obj.edit6:setName("edit6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(320);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7:setText("Conceito");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("conceito");
    obj.edit7:setName("edit7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(585);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8:setText("Facção");
    obj.label8:setHorzTextAlign("trailing");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("faccao");
    obj.edit8:setName("edit8");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(100);
    obj.label9:setHeight(20);
    obj.label9:setText("Ímpeto");
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(110);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("impeto");
    obj.edit9:setName("edit9");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(320);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("Comportamento");
    obj.label10:setHorzTextAlign("trailing");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(110);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("comportamento");
    obj.edit10:setName("edit10");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(585);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("Direção");
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setLeft(110);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(200);
    obj.edit11:setHeight(25);
    obj.edit11:setField("direcao");
    obj.edit11:setName("edit11");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(75);
    obj.layout8:setWidth(315);
    obj.layout8:setHeight(245);
    obj.layout8:setName("layout8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(5);
    obj.label12:setTop(0);
    obj.label12:setWidth(315);
    obj.label12:setHeight(20);
    obj.label12:setText("ATRIBUTOS");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setLeft(250);
    obj.label13:setTop(80);
    obj.label13:setWidth(100);
    obj.label13:setHeight(20);
    obj.label13:setText("Físicos");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setRotationAngle(90);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setLeft(250);
    obj.label14:setTop(175);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setText("Mentais");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setRotationAngle(90);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout8);
    obj.label15:setLeft(105);
    obj.label15:setTop(25);
    obj.label15:setWidth(315);
    obj.label15:setHeight(20);
    obj.label15:setText(" Total");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout8);
    obj.label16:setLeft(150);
    obj.label16:setTop(25);
    obj.label16:setWidth(315);
    obj.label16:setHeight(20);
    obj.label16:setText("Base");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout8);
    obj.label17:setLeft(185);
    obj.label17:setTop(25);
    obj.label17:setWidth(315);
    obj.label17:setHeight(20);
    obj.label17:setText(" Inic");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout8);
    obj.label18:setLeft(220);
    obj.label18:setTop(25);
    obj.label18:setWidth(315);
    obj.label18:setHeight(20);
    obj.label18:setText(" Apr.");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout8);
    obj.label19:setLeft(255);
    obj.label19:setTop(25);
    obj.label19:setWidth(315);
    obj.label19:setHeight(20);
    obj.label19:setText("  XP");
    obj.label19:setName("label19");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(315);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setHeight(15);
    obj.button1:setWidth(15);
    obj.button1:setText("1");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout9);
    obj.button2:setLeft(0);
    obj.button2:setTop(13);
    obj.button2:setHeight(15);
    obj.button2:setWidth(15);
    obj.button2:setText("2");
    obj.button2:setName("button2");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout9);
    obj.label20:setLeft(20);
    obj.label20:setTop(5);
    obj.label20:setWidth(85);
    obj.label20:setHeight(20);
    obj.label20:setText("Força");
    obj.label20:setName("label20");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setLeft(100);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(40);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout9);
    obj.label21:setLeft(100);
    obj.label21:setTop(3);
    obj.label21:setWidth(40);
    obj.label21:setHeight(20);
    obj.label21:setField("totalforca");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout9);
    obj.rectangle4:setLeft(145);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout9);
    obj.label22:setLeft(145);
    obj.label22:setTop(0);
    obj.label22:setWidth(30);
    obj.label22:setHeight(25);
    obj.label22:setField("baseforca");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setVertTextAlign("center");
    obj.label22:setName("label22");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout9);
    obj.dataLink1:setField("baseforca");
    obj.dataLink1:setDefaultValue("3");
    obj.dataLink1:setName("dataLink1");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout9);
    obj.edit12:setLeft(180);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setField("inicialforca");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout9);
    obj.edit13:setLeft(215);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setField("bonusforca");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout9);
    obj.edit14:setLeft(250);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setField("xpforca");
    obj.edit14:setName("edit14");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout9);
    obj.dataLink2:setFields({'baseforca', 'inicialforca', 'bonusforca', 'xpforca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink2:setName("dataLink2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(80);
    obj.layout10:setWidth(315);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout10);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setHeight(15);
    obj.button3:setWidth(15);
    obj.button3:setText("1");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setLeft(0);
    obj.button4:setTop(13);
    obj.button4:setHeight(15);
    obj.button4:setWidth(15);
    obj.button4:setText("2");
    obj.button4:setName("button4");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout10);
    obj.label23:setLeft(20);
    obj.label23:setTop(5);
    obj.label23:setWidth(85);
    obj.label23:setHeight(20);
    obj.label23:setText("Agilidade");
    obj.label23:setName("label23");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setLeft(100);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout10);
    obj.label24:setLeft(100);
    obj.label24:setTop(3);
    obj.label24:setWidth(40);
    obj.label24:setHeight(20);
    obj.label24:setField("totalagilidade");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout10);
    obj.rectangle6:setLeft(145);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout10);
    obj.label25:setLeft(145);
    obj.label25:setTop(0);
    obj.label25:setWidth(30);
    obj.label25:setHeight(25);
    obj.label25:setField("baseagilidade");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setVertTextAlign("center");
    obj.label25:setName("label25");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setField("baseagilidade");
    obj.dataLink3:setDefaultValue("3");
    obj.dataLink3:setName("dataLink3");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout10);
    obj.edit15:setLeft(180);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setField("inicialagilidade");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout10);
    obj.edit16:setLeft(215);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setField("bonusagilidade");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout10);
    obj.edit17:setLeft(250);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setField("xpagilidade");
    obj.edit17:setName("edit17");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setFields({'baseagilidade', 'inicialagilidade', 'bonusagilidade', 'xpagilidade', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink4:setName("dataLink4");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(110);
    obj.layout11:setWidth(315);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout11);
    obj.button5:setLeft(0);
    obj.button5:setTop(0);
    obj.button5:setHeight(15);
    obj.button5:setWidth(15);
    obj.button5:setText("1");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout11);
    obj.button6:setLeft(0);
    obj.button6:setTop(13);
    obj.button6:setHeight(15);
    obj.button6:setWidth(15);
    obj.button6:setText("2");
    obj.button6:setName("button6");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout11);
    obj.label26:setLeft(20);
    obj.label26:setTop(5);
    obj.label26:setWidth(85);
    obj.label26:setHeight(20);
    obj.label26:setText("Resiliência");
    obj.label26:setName("label26");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout11);
    obj.rectangle7:setLeft(100);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout11);
    obj.label27:setLeft(100);
    obj.label27:setTop(3);
    obj.label27:setWidth(40);
    obj.label27:setHeight(20);
    obj.label27:setField("totalresiliencia");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout11);
    obj.rectangle8:setLeft(145);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout11);
    obj.label28:setLeft(145);
    obj.label28:setTop(0);
    obj.label28:setWidth(30);
    obj.label28:setHeight(25);
    obj.label28:setField("baseresiliencia");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setVertTextAlign("center");
    obj.label28:setName("label28");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout11);
    obj.dataLink5:setField("baseresiliencia");
    obj.dataLink5:setDefaultValue("3");
    obj.dataLink5:setName("dataLink5");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout11);
    obj.edit18:setLeft(180);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setField("inicialresiliencia");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout11);
    obj.edit19:setLeft(215);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setField("bonusresiliencia");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout11);
    obj.edit20:setLeft(250);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setField("xpresiliencia");
    obj.edit20:setName("edit20");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout11);
    obj.dataLink6:setFields({'baseresiliencia', 'inicialresiliencia', 'bonusresiliencia', 'xpresiliencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink6:setName("dataLink6");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(145);
    obj.horzLine1:setWidth(315);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(150);
    obj.layout12:setWidth(315);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout12);
    obj.button7:setLeft(0);
    obj.button7:setTop(0);
    obj.button7:setHeight(15);
    obj.button7:setWidth(15);
    obj.button7:setText("1");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout12);
    obj.button8:setLeft(0);
    obj.button8:setTop(13);
    obj.button8:setHeight(15);
    obj.button8:setWidth(15);
    obj.button8:setText("2");
    obj.button8:setName("button8");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout12);
    obj.label29:setLeft(20);
    obj.label29:setTop(5);
    obj.label29:setWidth(85);
    obj.label29:setHeight(20);
    obj.label29:setText("Carisma");
    obj.label29:setName("label29");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout12);
    obj.rectangle9:setLeft(100);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout12);
    obj.label30:setLeft(100);
    obj.label30:setTop(3);
    obj.label30:setWidth(40);
    obj.label30:setHeight(20);
    obj.label30:setField("totalcarisma");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout12);
    obj.rectangle10:setLeft(145);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout12);
    obj.label31:setLeft(145);
    obj.label31:setTop(0);
    obj.label31:setWidth(30);
    obj.label31:setHeight(25);
    obj.label31:setField("basecarisma");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setVertTextAlign("center");
    obj.label31:setName("label31");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout12);
    obj.dataLink7:setField("basecarisma");
    obj.dataLink7:setDefaultValue("3");
    obj.dataLink7:setName("dataLink7");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout12);
    obj.edit21:setLeft(180);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setField("inicialcarisma");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout12);
    obj.edit22:setLeft(215);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setField("bonuscarisma");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout12);
    obj.edit23:setLeft(250);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setField("xpcarisma");
    obj.edit23:setName("edit23");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout12);
    obj.dataLink8:setFields({'basecarisma', 'inicialcarisma', 'bonuscarisma', 'xpcarisma', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink8:setName("dataLink8");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(180);
    obj.layout13:setWidth(315);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout13);
    obj.button9:setLeft(0);
    obj.button9:setTop(0);
    obj.button9:setHeight(15);
    obj.button9:setWidth(15);
    obj.button9:setText("1");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout13);
    obj.button10:setLeft(0);
    obj.button10:setTop(13);
    obj.button10:setHeight(15);
    obj.button10:setWidth(15);
    obj.button10:setText("2");
    obj.button10:setName("button10");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setLeft(20);
    obj.label32:setTop(5);
    obj.label32:setWidth(85);
    obj.label32:setHeight(20);
    obj.label32:setText("Percepção");
    obj.label32:setName("label32");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout13);
    obj.rectangle11:setLeft(100);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout13);
    obj.label33:setLeft(100);
    obj.label33:setTop(3);
    obj.label33:setWidth(40);
    obj.label33:setHeight(20);
    obj.label33:setField("totalpercepcao");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout13);
    obj.rectangle12:setLeft(145);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout13);
    obj.label34:setLeft(145);
    obj.label34:setTop(0);
    obj.label34:setWidth(30);
    obj.label34:setHeight(25);
    obj.label34:setField("basepercepcao");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("center");
    obj.label34:setName("label34");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout13);
    obj.dataLink9:setField("basepercepcao");
    obj.dataLink9:setDefaultValue("3");
    obj.dataLink9:setName("dataLink9");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout13);
    obj.edit24:setLeft(180);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setField("inicialpercepcao");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout13);
    obj.edit25:setLeft(215);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setType("number");
    obj.edit25:setField("bonuspercepcao");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout13);
    obj.edit26:setLeft(250);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setField("xppercepcao");
    obj.edit26:setName("edit26");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout13);
    obj.dataLink10:setFields({'basepercepcao', 'inicialpercepcao', 'bonuspercepcao', 'xppercepcao', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink10:setName("dataLink10");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(210);
    obj.layout14:setWidth(315);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout14);
    obj.button11:setLeft(0);
    obj.button11:setTop(0);
    obj.button11:setHeight(15);
    obj.button11:setWidth(15);
    obj.button11:setText("1");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout14);
    obj.button12:setLeft(0);
    obj.button12:setTop(13);
    obj.button12:setHeight(15);
    obj.button12:setWidth(15);
    obj.button12:setText("2");
    obj.button12:setName("button12");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout14);
    obj.label35:setLeft(20);
    obj.label35:setTop(5);
    obj.label35:setWidth(85);
    obj.label35:setHeight(20);
    obj.label35:setText("Perspicácia");
    obj.label35:setName("label35");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout14);
    obj.rectangle13:setLeft(100);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout14);
    obj.label36:setLeft(100);
    obj.label36:setTop(3);
    obj.label36:setWidth(40);
    obj.label36:setHeight(20);
    obj.label36:setField("totalperspicacia");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout14);
    obj.rectangle14:setLeft(145);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout14);
    obj.label37:setLeft(145);
    obj.label37:setTop(0);
    obj.label37:setWidth(30);
    obj.label37:setHeight(25);
    obj.label37:setField("baseperspicacia");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("center");
    obj.label37:setName("label37");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout14);
    obj.dataLink11:setField("baseperspicacia");
    obj.dataLink11:setDefaultValue("3");
    obj.dataLink11:setName("dataLink11");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout14);
    obj.edit27:setLeft(180);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setField("inicialperspicacia");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout14);
    obj.edit28:setLeft(215);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setField("bonusperspicacia");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout14);
    obj.edit29:setLeft(250);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setField("xpperspicacia");
    obj.edit29:setName("edit29");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout14);
    obj.dataLink12:setFields({'baseperspicacia', 'inicialperspicacia', 'bonusperspicacia', 'xpperspicacia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink12:setName("dataLink12");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(325);
    obj.layout15:setWidth(315);
    obj.layout15:setHeight(185);
    obj.layout15:setName("layout15");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout15);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(15);
    obj.rectangle15:setYradius(15);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout15);
    obj.label38:setLeft(5);
    obj.label38:setTop(0);
    obj.label38:setWidth(315);
    obj.label38:setHeight(20);
    obj.label38:setText("EIDOLON");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout15);
    obj.label39:setLeft(105);
    obj.label39:setTop(25);
    obj.label39:setWidth(315);
    obj.label39:setHeight(20);
    obj.label39:setText(" Total");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout15);
    obj.label40:setLeft(150);
    obj.label40:setTop(25);
    obj.label40:setWidth(315);
    obj.label40:setHeight(20);
    obj.label40:setText("Base");
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout15);
    obj.label41:setLeft(185);
    obj.label41:setTop(25);
    obj.label41:setWidth(315);
    obj.label41:setHeight(20);
    obj.label41:setText(" Inic");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout15);
    obj.label42:setLeft(220);
    obj.label42:setTop(25);
    obj.label42:setWidth(315);
    obj.label42:setHeight(20);
    obj.label42:setText(" Apr.");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout15);
    obj.label43:setLeft(255);
    obj.label43:setTop(25);
    obj.label43:setWidth(315);
    obj.label43:setHeight(20);
    obj.label43:setText("  XP");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout15);
    obj.label44:setLeft(250);
    obj.label44:setTop(80);
    obj.label44:setWidth(100);
    obj.label44:setHeight(20);
    obj.label44:setText("Aegis");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setRotationAngle(90);
    obj.label44:setName("label44");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(50);
    obj.layout16:setWidth(315);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout16);
    obj.button13:setLeft(0);
    obj.button13:setTop(0);
    obj.button13:setHeight(15);
    obj.button13:setWidth(15);
    obj.button13:setText("1");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout16);
    obj.button14:setLeft(0);
    obj.button14:setTop(13);
    obj.button14:setHeight(15);
    obj.button14:setWidth(15);
    obj.button14:setText("2");
    obj.button14:setName("button14");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout16);
    obj.label45:setLeft(20);
    obj.label45:setTop(5);
    obj.label45:setWidth(85);
    obj.label45:setHeight(20);
    obj.label45:setText("Consciência");
    obj.label45:setName("label45");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout16);
    obj.rectangle16:setLeft(100);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout16);
    obj.label46:setLeft(100);
    obj.label46:setTop(3);
    obj.label46:setWidth(40);
    obj.label46:setHeight(20);
    obj.label46:setField("totalconsciencia");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout16);
    obj.rectangle17:setLeft(145);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout16);
    obj.label47:setLeft(145);
    obj.label47:setTop(0);
    obj.label47:setWidth(30);
    obj.label47:setHeight(25);
    obj.label47:setField("baseconsciencia");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setName("label47");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout16);
    obj.dataLink13:setField("baseconsciencia");
    obj.dataLink13:setDefaultValue("1");
    obj.dataLink13:setName("dataLink13");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout16);
    obj.edit30:setLeft(180);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setField("inicialconsciencia");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout16);
    obj.edit31:setLeft(215);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(30);
    obj.edit31:setHeight(25);
    obj.edit31:setType("number");
    obj.edit31:setField("bonusconsciencia");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout16);
    obj.edit32:setLeft(250);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setField("xpconsciencia");
    obj.edit32:setName("edit32");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout16);
    obj.dataLink14:setFields({'baseconsciencia', 'inicialconsciencia', 'bonusconsciencia', 'xpconsciencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink14:setName("dataLink14");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(80);
    obj.layout17:setWidth(315);
    obj.layout17:setHeight(30);
    obj.layout17:setName("layout17");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout17);
    obj.button15:setLeft(0);
    obj.button15:setTop(0);
    obj.button15:setHeight(15);
    obj.button15:setWidth(15);
    obj.button15:setText("1");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout17);
    obj.button16:setLeft(0);
    obj.button16:setTop(13);
    obj.button16:setHeight(15);
    obj.button16:setWidth(15);
    obj.button16:setText("2");
    obj.button16:setName("button16");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout17);
    obj.label48:setLeft(20);
    obj.label48:setTop(5);
    obj.label48:setWidth(85);
    obj.label48:setHeight(20);
    obj.label48:setText("Espírito");
    obj.label48:setName("label48");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout17);
    obj.rectangle18:setLeft(100);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout17);
    obj.label49:setLeft(100);
    obj.label49:setTop(3);
    obj.label49:setWidth(40);
    obj.label49:setHeight(20);
    obj.label49:setField("totalespirito");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout17);
    obj.rectangle19:setLeft(145);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout17);
    obj.label50:setLeft(145);
    obj.label50:setTop(0);
    obj.label50:setWidth(30);
    obj.label50:setHeight(25);
    obj.label50:setField("baseespirito");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setName("label50");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout17);
    obj.dataLink15:setField("baseespirito");
    obj.dataLink15:setDefaultValue("1");
    obj.dataLink15:setName("dataLink15");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout17);
    obj.edit33:setLeft(180);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setField("inicialespirito");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout17);
    obj.edit34:setLeft(215);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setField("bonusespirito");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout17);
    obj.edit35:setLeft(250);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setType("number");
    obj.edit35:setField("xpespirito");
    obj.edit35:setName("edit35");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout17);
    obj.dataLink16:setFields({'baseespirito', 'inicialespirito', 'bonusespirito', 'xpespirito', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink16:setName("dataLink16");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(110);
    obj.layout18:setWidth(315);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout18);
    obj.button17:setLeft(0);
    obj.button17:setTop(0);
    obj.button17:setHeight(15);
    obj.button17:setWidth(15);
    obj.button17:setText("1");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout18);
    obj.button18:setLeft(0);
    obj.button18:setTop(13);
    obj.button18:setHeight(15);
    obj.button18:setWidth(15);
    obj.button18:setText("2");
    obj.button18:setName("button18");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout18);
    obj.label51:setLeft(20);
    obj.label51:setTop(5);
    obj.label51:setWidth(85);
    obj.label51:setHeight(20);
    obj.label51:setText("Perseverança");
    obj.label51:setName("label51");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout18);
    obj.rectangle20:setLeft(100);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout18);
    obj.label52:setLeft(100);
    obj.label52:setTop(3);
    obj.label52:setWidth(40);
    obj.label52:setHeight(20);
    obj.label52:setField("totalperseveranca");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout18);
    obj.rectangle21:setLeft(145);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout18);
    obj.label53:setLeft(145);
    obj.label53:setTop(0);
    obj.label53:setWidth(30);
    obj.label53:setHeight(25);
    obj.label53:setField("baseperseveranca");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setName("label53");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout18);
    obj.dataLink17:setField("baseperseveranca");
    obj.dataLink17:setDefaultValue("1");
    obj.dataLink17:setName("dataLink17");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout18);
    obj.edit36:setLeft(180);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setField("inicialperseveranca");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout18);
    obj.edit37:setLeft(215);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(25);
    obj.edit37:setType("number");
    obj.edit37:setField("bonusperseveranca");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout18);
    obj.edit38:setLeft(250);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setField("xpperseveranca");
    obj.edit38:setName("edit38");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout18);
    obj.dataLink18:setFields({'baseperseveranca', 'inicialperseveranca', 'bonusperseveranca', 'xpperseveranca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink18:setName("dataLink18");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout15);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(145);
    obj.horzLine2:setWidth(315);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(150);
    obj.layout19:setWidth(315);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout19);
    obj.label54:setLeft(30);
    obj.label54:setTop(0);
    obj.label54:setWidth(85);
    obj.label54:setHeight(20);
    obj.label54:setText("Gladius");
    obj.label54:setName("label54");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout19);
    obj.edit39:setLeft(175);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(30);
    obj.edit39:setHeight(25);
    obj.edit39:setType("number");
    obj.edit39:setField("gladiusMin");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout19);
    obj.edit40:setLeft(210);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(30);
    obj.edit40:setHeight(25);
    obj.edit40:setType("number");
    obj.edit40:setField("gladiusMax");
    obj.edit40:setName("edit40");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
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

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(320);
    obj.layout20:setTop(75);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(320);
    obj.layout20:setName("layout20");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout20);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setXradius(15);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout20);
    obj.label55:setLeft(0);
    obj.label55:setTop(0);
    obj.label55:setWidth(300);
    obj.label55:setHeight(20);
    obj.label55:setText("HISTORICOS");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout20);
    obj.label56:setLeft(25);
    obj.label56:setTop(20);
    obj.label56:setWidth(315);
    obj.label56:setHeight(20);
    obj.label56:setText(" Nome");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout20);
    obj.label57:setLeft(135);
    obj.label57:setTop(20);
    obj.label57:setWidth(315);
    obj.label57:setHeight(20);
    obj.label57:setText("Total");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout20);
    obj.label58:setLeft(170);
    obj.label58:setTop(20);
    obj.label58:setWidth(315);
    obj.label58:setHeight(20);
    obj.label58:setText(" Inic");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout20);
    obj.label59:setLeft(202);
    obj.label59:setTop(20);
    obj.label59:setWidth(315);
    obj.label59:setHeight(20);
    obj.label59:setText(" Apr.");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout20);
    obj.label60:setLeft(235);
    obj.label60:setTop(20);
    obj.label60:setWidth(315);
    obj.label60:setHeight(20);
    obj.label60:setText("  XP");
    obj.label60:setName("label60");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout20);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(40);
    obj.scrollBox2:setWidth(295);
    obj.scrollBox2:setHeight(260);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox2);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(0);
    obj.layout21:setWidth(270);
    obj.layout21:setHeight(35);
    obj.layout21:setName("layout21");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout21);
    obj.button19:setLeft(0);
    obj.button19:setTop(0);
    obj.button19:setHeight(15);
    obj.button19:setWidth(15);
    obj.button19:setText("1");
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout21);
    obj.button20:setLeft(0);
    obj.button20:setTop(15);
    obj.button20:setHeight(15);
    obj.button20:setWidth(15);
    obj.button20:setText("2");
    obj.button20:setName("button20");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout21);
    obj.edit41:setLeft(20);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(100);
    obj.edit41:setHeight(25);
    obj.edit41:setField("historicoNome1_1");
    obj.edit41:setName("edit41");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout21);
    obj.rectangle23:setLeft(125);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout21);
    obj.label61:setLeft(135);
    obj.label61:setTop(3);
    obj.label61:setWidth(30);
    obj.label61:setHeight(20);
    obj.label61:setField("historicoTotal1_1");
    obj.label61:setName("label61");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout21);
    obj.edit42:setLeft(165);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setType("number");
    obj.edit42:setMin(0);
    obj.edit42:setField("historicoValor1_1");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout21);
    obj.edit43:setLeft(200);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setMin(0);
    obj.edit43:setField("historicoBonus1_1");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout21);
    obj.edit44:setLeft(235);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setType("number");
    obj.edit44:setMin(0);
    obj.edit44:setField("historicoXp1_1");
    obj.edit44:setName("edit44");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox2);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(35);
    obj.layout22:setWidth(270);
    obj.layout22:setHeight(35);
    obj.layout22:setName("layout22");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout22);
    obj.button21:setLeft(0);
    obj.button21:setTop(0);
    obj.button21:setHeight(15);
    obj.button21:setWidth(15);
    obj.button21:setText("1");
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout22);
    obj.button22:setLeft(0);
    obj.button22:setTop(15);
    obj.button22:setHeight(15);
    obj.button22:setWidth(15);
    obj.button22:setText("2");
    obj.button22:setName("button22");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout22);
    obj.edit45:setLeft(20);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(100);
    obj.edit45:setHeight(25);
    obj.edit45:setField("historicoNome1_2");
    obj.edit45:setName("edit45");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout22);
    obj.rectangle24:setLeft(125);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout22);
    obj.label62:setLeft(135);
    obj.label62:setTop(3);
    obj.label62:setWidth(30);
    obj.label62:setHeight(20);
    obj.label62:setField("historicoTotal1_2");
    obj.label62:setName("label62");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout22);
    obj.edit46:setLeft(165);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(30);
    obj.edit46:setHeight(25);
    obj.edit46:setType("number");
    obj.edit46:setMin(0);
    obj.edit46:setField("historicoValor1_2");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout22);
    obj.edit47:setLeft(200);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setType("number");
    obj.edit47:setMin(0);
    obj.edit47:setField("historicoBonus1_2");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout22);
    obj.edit48:setLeft(235);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setType("number");
    obj.edit48:setMin(0);
    obj.edit48:setField("historicoXp1_2");
    obj.edit48:setName("edit48");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox2);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(70);
    obj.layout23:setWidth(270);
    obj.layout23:setHeight(35);
    obj.layout23:setName("layout23");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout23);
    obj.button23:setLeft(0);
    obj.button23:setTop(0);
    obj.button23:setHeight(15);
    obj.button23:setWidth(15);
    obj.button23:setText("1");
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout23);
    obj.button24:setLeft(0);
    obj.button24:setTop(15);
    obj.button24:setHeight(15);
    obj.button24:setWidth(15);
    obj.button24:setText("2");
    obj.button24:setName("button24");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout23);
    obj.edit49:setLeft(20);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(100);
    obj.edit49:setHeight(25);
    obj.edit49:setField("historicoNome1_3");
    obj.edit49:setName("edit49");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout23);
    obj.rectangle25:setLeft(125);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(35);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("Black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout23);
    obj.label63:setLeft(135);
    obj.label63:setTop(3);
    obj.label63:setWidth(30);
    obj.label63:setHeight(20);
    obj.label63:setField("historicoTotal1_3");
    obj.label63:setName("label63");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout23);
    obj.edit50:setLeft(165);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(30);
    obj.edit50:setHeight(25);
    obj.edit50:setType("number");
    obj.edit50:setMin(0);
    obj.edit50:setField("historicoValor1_3");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout23);
    obj.edit51:setLeft(200);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(30);
    obj.edit51:setHeight(25);
    obj.edit51:setType("number");
    obj.edit51:setMin(0);
    obj.edit51:setField("historicoBonus1_3");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout23);
    obj.edit52:setLeft(235);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setType("number");
    obj.edit52:setMin(0);
    obj.edit52:setField("historicoXp1_3");
    obj.edit52:setName("edit52");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox2);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(105);
    obj.layout24:setWidth(270);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout24);
    obj.button25:setLeft(0);
    obj.button25:setTop(0);
    obj.button25:setHeight(15);
    obj.button25:setWidth(15);
    obj.button25:setText("1");
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout24);
    obj.button26:setLeft(0);
    obj.button26:setTop(15);
    obj.button26:setHeight(15);
    obj.button26:setWidth(15);
    obj.button26:setText("2");
    obj.button26:setName("button26");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout24);
    obj.edit53:setLeft(20);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(100);
    obj.edit53:setHeight(25);
    obj.edit53:setField("historicoNome1_4");
    obj.edit53:setName("edit53");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout24);
    obj.rectangle26:setLeft(125);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout24);
    obj.label64:setLeft(135);
    obj.label64:setTop(3);
    obj.label64:setWidth(30);
    obj.label64:setHeight(20);
    obj.label64:setField("historicoTotal1_4");
    obj.label64:setName("label64");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout24);
    obj.edit54:setLeft(165);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setType("number");
    obj.edit54:setMin(0);
    obj.edit54:setField("historicoValor1_4");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout24);
    obj.edit55:setLeft(200);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(30);
    obj.edit55:setHeight(25);
    obj.edit55:setType("number");
    obj.edit55:setMin(0);
    obj.edit55:setField("historicoBonus1_4");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout24);
    obj.edit56:setLeft(235);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(30);
    obj.edit56:setHeight(25);
    obj.edit56:setType("number");
    obj.edit56:setMin(0);
    obj.edit56:setField("historicoXp1_4");
    obj.edit56:setName("edit56");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox2);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(140);
    obj.layout25:setWidth(270);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout25);
    obj.button27:setLeft(0);
    obj.button27:setTop(0);
    obj.button27:setHeight(15);
    obj.button27:setWidth(15);
    obj.button27:setText("1");
    obj.button27:setName("button27");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout25);
    obj.button28:setLeft(0);
    obj.button28:setTop(15);
    obj.button28:setHeight(15);
    obj.button28:setWidth(15);
    obj.button28:setText("2");
    obj.button28:setName("button28");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout25);
    obj.edit57:setLeft(20);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(100);
    obj.edit57:setHeight(25);
    obj.edit57:setField("historicoNome1_5");
    obj.edit57:setName("edit57");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout25);
    obj.rectangle27:setLeft(125);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("Black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout25);
    obj.label65:setLeft(135);
    obj.label65:setTop(3);
    obj.label65:setWidth(30);
    obj.label65:setHeight(20);
    obj.label65:setField("historicoTotal1_5");
    obj.label65:setName("label65");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout25);
    obj.edit58:setLeft(165);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(30);
    obj.edit58:setHeight(25);
    obj.edit58:setType("number");
    obj.edit58:setMin(0);
    obj.edit58:setField("historicoValor1_5");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout25);
    obj.edit59:setLeft(200);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(25);
    obj.edit59:setType("number");
    obj.edit59:setMin(0);
    obj.edit59:setField("historicoBonus1_5");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout25);
    obj.edit60:setLeft(235);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(25);
    obj.edit60:setType("number");
    obj.edit60:setMin(0);
    obj.edit60:setField("historicoXp1_5");
    obj.edit60:setName("edit60");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox2);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(175);
    obj.layout26:setWidth(270);
    obj.layout26:setHeight(35);
    obj.layout26:setName("layout26");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout26);
    obj.button29:setLeft(0);
    obj.button29:setTop(0);
    obj.button29:setHeight(15);
    obj.button29:setWidth(15);
    obj.button29:setText("1");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout26);
    obj.button30:setLeft(0);
    obj.button30:setTop(15);
    obj.button30:setHeight(15);
    obj.button30:setWidth(15);
    obj.button30:setText("2");
    obj.button30:setName("button30");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout26);
    obj.edit61:setLeft(20);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(100);
    obj.edit61:setHeight(25);
    obj.edit61:setField("historicoNome1_6");
    obj.edit61:setName("edit61");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout26);
    obj.rectangle28:setLeft(125);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout26);
    obj.label66:setLeft(135);
    obj.label66:setTop(3);
    obj.label66:setWidth(30);
    obj.label66:setHeight(20);
    obj.label66:setField("historicoTotal1_6");
    obj.label66:setName("label66");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout26);
    obj.edit62:setLeft(165);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setType("number");
    obj.edit62:setMin(0);
    obj.edit62:setField("historicoValor1_6");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout26);
    obj.edit63:setLeft(200);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setType("number");
    obj.edit63:setMin(0);
    obj.edit63:setField("historicoBonus1_6");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout26);
    obj.edit64:setLeft(235);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(30);
    obj.edit64:setHeight(25);
    obj.edit64:setType("number");
    obj.edit64:setMin(0);
    obj.edit64:setField("historicoXp1_6");
    obj.edit64:setName("edit64");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox2);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(210);
    obj.layout27:setWidth(270);
    obj.layout27:setHeight(35);
    obj.layout27:setName("layout27");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout27);
    obj.button31:setLeft(0);
    obj.button31:setTop(0);
    obj.button31:setHeight(15);
    obj.button31:setWidth(15);
    obj.button31:setText("1");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout27);
    obj.button32:setLeft(0);
    obj.button32:setTop(15);
    obj.button32:setHeight(15);
    obj.button32:setWidth(15);
    obj.button32:setText("2");
    obj.button32:setName("button32");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout27);
    obj.edit65:setLeft(20);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(100);
    obj.edit65:setHeight(25);
    obj.edit65:setField("historicoNome2_1");
    obj.edit65:setName("edit65");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout27);
    obj.rectangle29:setLeft(125);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout27);
    obj.label67:setLeft(135);
    obj.label67:setTop(3);
    obj.label67:setWidth(30);
    obj.label67:setHeight(20);
    obj.label67:setField("historicoTotal2_1");
    obj.label67:setName("label67");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout27);
    obj.edit66:setLeft(165);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(30);
    obj.edit66:setHeight(25);
    obj.edit66:setType("number");
    obj.edit66:setMin(0);
    obj.edit66:setField("historicoValor2_1");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout27);
    obj.edit67:setLeft(200);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(30);
    obj.edit67:setHeight(25);
    obj.edit67:setType("number");
    obj.edit67:setMin(0);
    obj.edit67:setField("historicoBonus2_1");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout27);
    obj.edit68:setLeft(235);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(30);
    obj.edit68:setHeight(25);
    obj.edit68:setType("number");
    obj.edit68:setMin(0);
    obj.edit68:setField("historicoXp2_1");
    obj.edit68:setName("edit68");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox2);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(245);
    obj.layout28:setWidth(270);
    obj.layout28:setHeight(35);
    obj.layout28:setName("layout28");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout28);
    obj.button33:setLeft(0);
    obj.button33:setTop(0);
    obj.button33:setHeight(15);
    obj.button33:setWidth(15);
    obj.button33:setText("1");
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout28);
    obj.button34:setLeft(0);
    obj.button34:setTop(15);
    obj.button34:setHeight(15);
    obj.button34:setWidth(15);
    obj.button34:setText("2");
    obj.button34:setName("button34");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout28);
    obj.edit69:setLeft(20);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(100);
    obj.edit69:setHeight(25);
    obj.edit69:setField("historicoNome2_2");
    obj.edit69:setName("edit69");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout28);
    obj.rectangle30:setLeft(125);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout28);
    obj.label68:setLeft(135);
    obj.label68:setTop(3);
    obj.label68:setWidth(30);
    obj.label68:setHeight(20);
    obj.label68:setField("historicoTotal2_2");
    obj.label68:setName("label68");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout28);
    obj.edit70:setLeft(165);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(30);
    obj.edit70:setHeight(25);
    obj.edit70:setType("number");
    obj.edit70:setMin(0);
    obj.edit70:setField("historicoValor2_2");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout28);
    obj.edit71:setLeft(200);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(30);
    obj.edit71:setHeight(25);
    obj.edit71:setType("number");
    obj.edit71:setMin(0);
    obj.edit71:setField("historicoBonus2_2");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout28);
    obj.edit72:setLeft(235);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(30);
    obj.edit72:setHeight(25);
    obj.edit72:setType("number");
    obj.edit72:setMin(0);
    obj.edit72:setField("historicoXp2_2");
    obj.edit72:setName("edit72");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox2);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(280);
    obj.layout29:setWidth(270);
    obj.layout29:setHeight(35);
    obj.layout29:setName("layout29");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout29);
    obj.button35:setLeft(0);
    obj.button35:setTop(0);
    obj.button35:setHeight(15);
    obj.button35:setWidth(15);
    obj.button35:setText("1");
    obj.button35:setName("button35");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout29);
    obj.button36:setLeft(0);
    obj.button36:setTop(15);
    obj.button36:setHeight(15);
    obj.button36:setWidth(15);
    obj.button36:setText("2");
    obj.button36:setName("button36");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout29);
    obj.edit73:setLeft(20);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(100);
    obj.edit73:setHeight(25);
    obj.edit73:setField("historicoNome2_3");
    obj.edit73:setName("edit73");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout29);
    obj.rectangle31:setLeft(125);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout29);
    obj.label69:setLeft(135);
    obj.label69:setTop(3);
    obj.label69:setWidth(30);
    obj.label69:setHeight(20);
    obj.label69:setField("historicoTotal2_3");
    obj.label69:setName("label69");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout29);
    obj.edit74:setLeft(165);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(30);
    obj.edit74:setHeight(25);
    obj.edit74:setType("number");
    obj.edit74:setMin(0);
    obj.edit74:setField("historicoValor2_3");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout29);
    obj.edit75:setLeft(200);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(30);
    obj.edit75:setHeight(25);
    obj.edit75:setType("number");
    obj.edit75:setMin(0);
    obj.edit75:setField("historicoBonus2_3");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout29);
    obj.edit76:setLeft(235);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(30);
    obj.edit76:setHeight(25);
    obj.edit76:setType("number");
    obj.edit76:setMin(0);
    obj.edit76:setField("historicoXp2_3");
    obj.edit76:setName("edit76");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(315);
    obj.layout30:setWidth(270);
    obj.layout30:setHeight(35);
    obj.layout30:setName("layout30");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout30);
    obj.button37:setLeft(0);
    obj.button37:setTop(0);
    obj.button37:setHeight(15);
    obj.button37:setWidth(15);
    obj.button37:setText("1");
    obj.button37:setName("button37");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout30);
    obj.button38:setLeft(0);
    obj.button38:setTop(15);
    obj.button38:setHeight(15);
    obj.button38:setWidth(15);
    obj.button38:setText("2");
    obj.button38:setName("button38");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout30);
    obj.edit77:setLeft(20);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(100);
    obj.edit77:setHeight(25);
    obj.edit77:setField("historicoNome2_4");
    obj.edit77:setName("edit77");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout30);
    obj.rectangle32:setLeft(125);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout30);
    obj.label70:setLeft(135);
    obj.label70:setTop(3);
    obj.label70:setWidth(30);
    obj.label70:setHeight(20);
    obj.label70:setField("historicoTotal2_4");
    obj.label70:setName("label70");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout30);
    obj.edit78:setLeft(165);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(30);
    obj.edit78:setHeight(25);
    obj.edit78:setType("number");
    obj.edit78:setMin(0);
    obj.edit78:setField("historicoValor2_4");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout30);
    obj.edit79:setLeft(200);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(30);
    obj.edit79:setHeight(25);
    obj.edit79:setType("number");
    obj.edit79:setMin(0);
    obj.edit79:setField("historicoBonus2_4");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout30);
    obj.edit80:setLeft(235);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(30);
    obj.edit80:setHeight(25);
    obj.edit80:setType("number");
    obj.edit80:setMin(0);
    obj.edit80:setField("historicoXp2_4");
    obj.edit80:setName("edit80");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox2);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(350);
    obj.layout31:setWidth(270);
    obj.layout31:setHeight(35);
    obj.layout31:setName("layout31");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout31);
    obj.button39:setLeft(0);
    obj.button39:setTop(0);
    obj.button39:setHeight(15);
    obj.button39:setWidth(15);
    obj.button39:setText("1");
    obj.button39:setName("button39");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout31);
    obj.button40:setLeft(0);
    obj.button40:setTop(15);
    obj.button40:setHeight(15);
    obj.button40:setWidth(15);
    obj.button40:setText("2");
    obj.button40:setName("button40");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout31);
    obj.edit81:setLeft(20);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(100);
    obj.edit81:setHeight(25);
    obj.edit81:setField("historicoNome2_5");
    obj.edit81:setName("edit81");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout31);
    obj.rectangle33:setLeft(125);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout31);
    obj.label71:setLeft(135);
    obj.label71:setTop(3);
    obj.label71:setWidth(30);
    obj.label71:setHeight(20);
    obj.label71:setField("historicoTotal2_5");
    obj.label71:setName("label71");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout31);
    obj.edit82:setLeft(165);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(30);
    obj.edit82:setHeight(25);
    obj.edit82:setType("number");
    obj.edit82:setMin(0);
    obj.edit82:setField("historicoValor2_5");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout31);
    obj.edit83:setLeft(200);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(30);
    obj.edit83:setHeight(25);
    obj.edit83:setType("number");
    obj.edit83:setMin(0);
    obj.edit83:setField("historicoBonus2_5");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout31);
    obj.edit84:setLeft(235);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(30);
    obj.edit84:setHeight(25);
    obj.edit84:setType("number");
    obj.edit84:setMin(0);
    obj.edit84:setField("historicoXp2_5");
    obj.edit84:setName("edit84");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox2);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(385);
    obj.layout32:setWidth(270);
    obj.layout32:setHeight(35);
    obj.layout32:setName("layout32");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout32);
    obj.button41:setLeft(0);
    obj.button41:setTop(0);
    obj.button41:setHeight(15);
    obj.button41:setWidth(15);
    obj.button41:setText("1");
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout32);
    obj.button42:setLeft(0);
    obj.button42:setTop(15);
    obj.button42:setHeight(15);
    obj.button42:setWidth(15);
    obj.button42:setText("2");
    obj.button42:setName("button42");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout32);
    obj.edit85:setLeft(20);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(100);
    obj.edit85:setHeight(25);
    obj.edit85:setField("historicoNome2_6");
    obj.edit85:setName("edit85");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout32);
    obj.rectangle34:setLeft(125);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout32);
    obj.label72:setLeft(135);
    obj.label72:setTop(3);
    obj.label72:setWidth(30);
    obj.label72:setHeight(20);
    obj.label72:setField("historicoTotal2_6");
    obj.label72:setName("label72");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout32);
    obj.edit86:setLeft(165);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(30);
    obj.edit86:setHeight(25);
    obj.edit86:setType("number");
    obj.edit86:setMin(0);
    obj.edit86:setField("historicoValor2_6");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout32);
    obj.edit87:setLeft(200);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(30);
    obj.edit87:setHeight(25);
    obj.edit87:setType("number");
    obj.edit87:setMin(0);
    obj.edit87:setField("historicoBonus2_6");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout32);
    obj.edit88:setLeft(235);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(30);
    obj.edit88:setHeight(25);
    obj.edit88:setType("number");
    obj.edit88:setMin(0);
    obj.edit88:setField("historicoXp2_6");
    obj.edit88:setName("edit88");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox2);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(420);
    obj.layout33:setWidth(270);
    obj.layout33:setHeight(35);
    obj.layout33:setName("layout33");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout33);
    obj.button43:setLeft(0);
    obj.button43:setTop(0);
    obj.button43:setHeight(15);
    obj.button43:setWidth(15);
    obj.button43:setText("1");
    obj.button43:setName("button43");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout33);
    obj.button44:setLeft(0);
    obj.button44:setTop(15);
    obj.button44:setHeight(15);
    obj.button44:setWidth(15);
    obj.button44:setText("2");
    obj.button44:setName("button44");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout33);
    obj.edit89:setLeft(20);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(100);
    obj.edit89:setHeight(25);
    obj.edit89:setField("historicoNome3_1");
    obj.edit89:setName("edit89");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout33);
    obj.rectangle35:setLeft(125);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout33);
    obj.label73:setLeft(135);
    obj.label73:setTop(3);
    obj.label73:setWidth(30);
    obj.label73:setHeight(20);
    obj.label73:setField("historicoTotal3_1");
    obj.label73:setName("label73");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout33);
    obj.edit90:setLeft(165);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(30);
    obj.edit90:setHeight(25);
    obj.edit90:setType("number");
    obj.edit90:setMin(0);
    obj.edit90:setField("historicoValor3_1");
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout33);
    obj.edit91:setLeft(200);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(30);
    obj.edit91:setHeight(25);
    obj.edit91:setType("number");
    obj.edit91:setMin(0);
    obj.edit91:setField("historicoBonus3_1");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout33);
    obj.edit92:setLeft(235);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(30);
    obj.edit92:setHeight(25);
    obj.edit92:setType("number");
    obj.edit92:setMin(0);
    obj.edit92:setField("historicoXp3_1");
    obj.edit92:setName("edit92");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox2);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(455);
    obj.layout34:setWidth(270);
    obj.layout34:setHeight(35);
    obj.layout34:setName("layout34");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout34);
    obj.button45:setLeft(0);
    obj.button45:setTop(0);
    obj.button45:setHeight(15);
    obj.button45:setWidth(15);
    obj.button45:setText("1");
    obj.button45:setName("button45");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout34);
    obj.button46:setLeft(0);
    obj.button46:setTop(15);
    obj.button46:setHeight(15);
    obj.button46:setWidth(15);
    obj.button46:setText("2");
    obj.button46:setName("button46");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout34);
    obj.edit93:setLeft(20);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(100);
    obj.edit93:setHeight(25);
    obj.edit93:setField("historicoNome3_2");
    obj.edit93:setName("edit93");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout34);
    obj.rectangle36:setLeft(125);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(35);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout34);
    obj.label74:setLeft(135);
    obj.label74:setTop(3);
    obj.label74:setWidth(30);
    obj.label74:setHeight(20);
    obj.label74:setField("historicoTotal3_2");
    obj.label74:setName("label74");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout34);
    obj.edit94:setLeft(165);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(30);
    obj.edit94:setHeight(25);
    obj.edit94:setType("number");
    obj.edit94:setMin(0);
    obj.edit94:setField("historicoValor3_2");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout34);
    obj.edit95:setLeft(200);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(30);
    obj.edit95:setHeight(25);
    obj.edit95:setType("number");
    obj.edit95:setMin(0);
    obj.edit95:setField("historicoBonus3_2");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout34);
    obj.edit96:setLeft(235);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(30);
    obj.edit96:setHeight(25);
    obj.edit96:setType("number");
    obj.edit96:setMin(0);
    obj.edit96:setField("historicoXp3_2");
    obj.edit96:setName("edit96");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox2);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(490);
    obj.layout35:setWidth(270);
    obj.layout35:setHeight(35);
    obj.layout35:setName("layout35");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout35);
    obj.button47:setLeft(0);
    obj.button47:setTop(0);
    obj.button47:setHeight(15);
    obj.button47:setWidth(15);
    obj.button47:setText("1");
    obj.button47:setName("button47");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout35);
    obj.button48:setLeft(0);
    obj.button48:setTop(15);
    obj.button48:setHeight(15);
    obj.button48:setWidth(15);
    obj.button48:setText("2");
    obj.button48:setName("button48");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout35);
    obj.edit97:setLeft(20);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(100);
    obj.edit97:setHeight(25);
    obj.edit97:setField("historicoNome3_3");
    obj.edit97:setName("edit97");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout35);
    obj.rectangle37:setLeft(125);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout35);
    obj.label75:setLeft(135);
    obj.label75:setTop(3);
    obj.label75:setWidth(30);
    obj.label75:setHeight(20);
    obj.label75:setField("historicoTotal3_3");
    obj.label75:setName("label75");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout35);
    obj.edit98:setLeft(165);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(30);
    obj.edit98:setHeight(25);
    obj.edit98:setType("number");
    obj.edit98:setMin(0);
    obj.edit98:setField("historicoValor3_3");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout35);
    obj.edit99:setLeft(200);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(30);
    obj.edit99:setHeight(25);
    obj.edit99:setType("number");
    obj.edit99:setMin(0);
    obj.edit99:setField("historicoBonus3_3");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout35);
    obj.edit100:setLeft(235);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(30);
    obj.edit100:setHeight(25);
    obj.edit100:setType("number");
    obj.edit100:setMin(0);
    obj.edit100:setField("historicoXp3_3");
    obj.edit100:setName("edit100");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox2);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(525);
    obj.layout36:setWidth(270);
    obj.layout36:setHeight(35);
    obj.layout36:setName("layout36");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout36);
    obj.button49:setLeft(0);
    obj.button49:setTop(0);
    obj.button49:setHeight(15);
    obj.button49:setWidth(15);
    obj.button49:setText("1");
    obj.button49:setName("button49");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout36);
    obj.button50:setLeft(0);
    obj.button50:setTop(15);
    obj.button50:setHeight(15);
    obj.button50:setWidth(15);
    obj.button50:setText("2");
    obj.button50:setName("button50");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout36);
    obj.edit101:setLeft(20);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(100);
    obj.edit101:setHeight(25);
    obj.edit101:setField("historicoNome3_4");
    obj.edit101:setName("edit101");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout36);
    obj.rectangle38:setLeft(125);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout36);
    obj.label76:setLeft(135);
    obj.label76:setTop(3);
    obj.label76:setWidth(30);
    obj.label76:setHeight(20);
    obj.label76:setField("historicoTotal3_4");
    obj.label76:setName("label76");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout36);
    obj.edit102:setLeft(165);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(30);
    obj.edit102:setHeight(25);
    obj.edit102:setType("number");
    obj.edit102:setMin(0);
    obj.edit102:setField("historicoValor3_4");
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout36);
    obj.edit103:setLeft(200);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(30);
    obj.edit103:setHeight(25);
    obj.edit103:setType("number");
    obj.edit103:setMin(0);
    obj.edit103:setField("historicoBonus3_4");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout36);
    obj.edit104:setLeft(235);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(30);
    obj.edit104:setHeight(25);
    obj.edit104:setType("number");
    obj.edit104:setMin(0);
    obj.edit104:setField("historicoXp3_4");
    obj.edit104:setName("edit104");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox2);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(560);
    obj.layout37:setWidth(270);
    obj.layout37:setHeight(35);
    obj.layout37:setName("layout37");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout37);
    obj.button51:setLeft(0);
    obj.button51:setTop(0);
    obj.button51:setHeight(15);
    obj.button51:setWidth(15);
    obj.button51:setText("1");
    obj.button51:setName("button51");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout37);
    obj.button52:setLeft(0);
    obj.button52:setTop(15);
    obj.button52:setHeight(15);
    obj.button52:setWidth(15);
    obj.button52:setText("2");
    obj.button52:setName("button52");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout37);
    obj.edit105:setLeft(20);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(100);
    obj.edit105:setHeight(25);
    obj.edit105:setField("historicoNome3_5");
    obj.edit105:setName("edit105");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout37);
    obj.rectangle39:setLeft(125);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout37);
    obj.label77:setLeft(135);
    obj.label77:setTop(3);
    obj.label77:setWidth(30);
    obj.label77:setHeight(20);
    obj.label77:setField("historicoTotal3_5");
    obj.label77:setName("label77");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout37);
    obj.edit106:setLeft(165);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(30);
    obj.edit106:setHeight(25);
    obj.edit106:setType("number");
    obj.edit106:setMin(0);
    obj.edit106:setField("historicoValor3_5");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout37);
    obj.edit107:setLeft(200);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(30);
    obj.edit107:setHeight(25);
    obj.edit107:setType("number");
    obj.edit107:setMin(0);
    obj.edit107:setField("historicoBonus3_5");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout37);
    obj.edit108:setLeft(235);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(30);
    obj.edit108:setHeight(25);
    obj.edit108:setType("number");
    obj.edit108:setMin(0);
    obj.edit108:setField("historicoXp3_5");
    obj.edit108:setName("edit108");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(595);
    obj.layout38:setWidth(270);
    obj.layout38:setHeight(35);
    obj.layout38:setName("layout38");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout38);
    obj.button53:setLeft(0);
    obj.button53:setTop(0);
    obj.button53:setHeight(15);
    obj.button53:setWidth(15);
    obj.button53:setText("1");
    obj.button53:setName("button53");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout38);
    obj.button54:setLeft(0);
    obj.button54:setTop(15);
    obj.button54:setHeight(15);
    obj.button54:setWidth(15);
    obj.button54:setText("2");
    obj.button54:setName("button54");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout38);
    obj.edit109:setLeft(20);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(100);
    obj.edit109:setHeight(25);
    obj.edit109:setField("historicoNome3_6");
    obj.edit109:setName("edit109");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout38);
    obj.rectangle40:setLeft(125);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout38);
    obj.label78:setLeft(135);
    obj.label78:setTop(3);
    obj.label78:setWidth(30);
    obj.label78:setHeight(20);
    obj.label78:setField("historicoTotal3_6");
    obj.label78:setName("label78");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout38);
    obj.edit110:setLeft(165);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(30);
    obj.edit110:setHeight(25);
    obj.edit110:setType("number");
    obj.edit110:setMin(0);
    obj.edit110:setField("historicoValor3_6");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout38);
    obj.edit111:setLeft(200);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(30);
    obj.edit111:setHeight(25);
    obj.edit111:setType("number");
    obj.edit111:setMin(0);
    obj.edit111:setField("historicoBonus3_6");
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout38);
    obj.edit112:setLeft(235);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(30);
    obj.edit112:setHeight(25);
    obj.edit112:setType("number");
    obj.edit112:setMin(0);
    obj.edit112:setField("historicoXp3_6");
    obj.edit112:setName("edit112");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox1);
    obj.layout39:setLeft(320);
    obj.layout39:setTop(400);
    obj.layout39:setWidth(300);
    obj.layout39:setHeight(180);
    obj.layout39:setName("layout39");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout39);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(15);
    obj.rectangle41:setYradius(15);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout39);
    obj.label79:setLeft(0);
    obj.label79:setTop(5);
    obj.label79:setWidth(300);
    obj.label79:setHeight(20);
    obj.label79:setText("OUTROS");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout39);
    obj.button55:setText("+");
    obj.button55:setLeft(100);
    obj.button55:setTop(5);
    obj.button55:setWidth(20);
    obj.button55:setHeight(20);
    obj.button55:setName("button55");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout39);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(20);
    obj.scrollBox3:setWidth(295);
    obj.scrollBox3:setHeight(160);
    obj.scrollBox3:setName("scrollBox3");

    obj.rclListaOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaOutros:setParent(obj.scrollBox3);
    obj.rclListaOutros:setName("rclListaOutros");
    obj.rclListaOutros:setField("campoDosOutros");
    obj.rclListaOutros:setTemplateForm("frmOther");
    obj.rclListaOutros:setAlign("client");
    obj.rclListaOutros:setMargins({left=5,right=5,top=5,bottom=5});
    obj.rclListaOutros:setLayout("vertical");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(625);
    obj.layout40:setTop(75);
    obj.layout40:setWidth(210);
    obj.layout40:setHeight(450);
    obj.layout40:setName("layout40");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout40);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(15);
    obj.rectangle42:setYradius(15);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout40);
    obj.label80:setLeft(5);
    obj.label80:setTop(0);
    obj.label80:setWidth(210);
    obj.label80:setHeight(20);
    obj.label80:setText("SAÚDE");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout40);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(25);
    obj.horzLine3:setWidth(210);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(30);
    obj.layout41:setWidth(210);
    obj.layout41:setHeight(60);
    obj.layout41:setName("layout41");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout41);
    obj.label81:setLeft(10);
    obj.label81:setTop(0);
    obj.label81:setWidth(95);
    obj.label81:setHeight(20);
    obj.label81:setText("LEVE");
    obj.label81:setName("label81");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layout41);
    obj.flowLayout2:setLeft(100);
    obj.flowLayout2:setTop(0);
    obj.flowLayout2:setHeight(100);
    obj.flowLayout2:setWidth(60);
    obj.flowLayout2:setName("flowLayout2");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout2);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("check1_1_1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout2);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setField("check2_1_1");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowLayout2);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setField("check3_1_1");
    obj.checkBox3:setName("checkBox3");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowLayout2);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("check1_2_1");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowLayout2);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("check2_2_1");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowLayout2);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("check3_2_1");
    obj.checkBox6:setName("checkBox6");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowLayout2);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("check1_3_1");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowLayout2);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("check2_3_1");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowLayout2);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setField("check3_3_1");
    obj.checkBox9:setName("checkBox9");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout2);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout41);
    obj.edit113:setLeft(170);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(30);
    obj.edit113:setHeight(25);
    obj.edit113:setField("penalidade1");
    obj.edit113:setName("edit113");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout41);
    obj.dataLink19:setField("penalidade1");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");


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
			


    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout40);
    obj.horzLine4:setLeft(0);
    obj.horzLine4:setTop(95);
    obj.horzLine4:setWidth(210);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setName("horzLine4");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(100);
    obj.layout42:setWidth(210);
    obj.layout42:setHeight(40);
    obj.layout42:setName("layout42");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout42);
    obj.label82:setLeft(10);
    obj.label82:setTop(0);
    obj.label82:setWidth(95);
    obj.label82:setHeight(20);
    obj.label82:setText("MEDIO");
    obj.label82:setName("label82");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.layout42);
    obj.flowLayout3:setLeft(100);
    obj.flowLayout3:setTop(0);
    obj.flowLayout3:setHeight(100);
    obj.flowLayout3:setWidth(60);
    obj.flowLayout3:setName("flowLayout3");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowLayout3);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setField("check1_1_2");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowLayout3);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setField("check2_1_2");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowLayout3);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setField("check3_1_2");
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout3);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowLayout3);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setField("check1_2_2");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowLayout3);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setField("check2_2_2");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowLayout3);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setField("check3_2_2");
    obj.checkBox15:setName("checkBox15");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout3);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout42);
    obj.edit114:setLeft(170);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(30);
    obj.edit114:setHeight(25);
    obj.edit114:setField("penalidade2");
    obj.edit114:setName("edit114");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout42);
    obj.dataLink20:setField("penalidade2");
    obj.dataLink20:setDefaultValue("0.5");
    obj.dataLink20:setName("dataLink20");


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
			


    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout40);
    obj.horzLine5:setLeft(0);
    obj.horzLine5:setTop(145);
    obj.horzLine5:setWidth(210);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setName("horzLine5");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(150);
    obj.layout43:setWidth(210);
    obj.layout43:setHeight(40);
    obj.layout43:setName("layout43");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout43);
    obj.label83:setLeft(10);
    obj.label83:setTop(0);
    obj.label83:setWidth(95);
    obj.label83:setHeight(20);
    obj.label83:setText("SERIO");
    obj.label83:setName("label83");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.layout43);
    obj.flowLayout4:setLeft(100);
    obj.flowLayout4:setTop(0);
    obj.flowLayout4:setHeight(100);
    obj.flowLayout4:setWidth(60);
    obj.flowLayout4:setName("flowLayout4");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowLayout4);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setField("check1_1_3");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowLayout4);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setField("check2_1_3");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowLayout4);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setField("check3_1_3");
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout4);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowLayout4);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setField("check1_2_3");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowLayout4);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setField("check2_2_3");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowLayout4);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setWidth(20);
    obj.checkBox21:setField("check3_2_3");
    obj.checkBox21:setName("checkBox21");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout4);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout43);
    obj.edit115:setLeft(170);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(30);
    obj.edit115:setHeight(25);
    obj.edit115:setField("penalidade3");
    obj.edit115:setName("edit115");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout43);
    obj.dataLink21:setField("penalidade3");
    obj.dataLink21:setDefaultValue("1");
    obj.dataLink21:setName("dataLink21");


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
			


    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout40);
    obj.horzLine6:setLeft(0);
    obj.horzLine6:setTop(195);
    obj.horzLine6:setWidth(210);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setName("horzLine6");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(200);
    obj.layout44:setWidth(210);
    obj.layout44:setHeight(40);
    obj.layout44:setName("layout44");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout44);
    obj.label84:setLeft(10);
    obj.label84:setTop(0);
    obj.label84:setWidth(95);
    obj.label84:setHeight(20);
    obj.label84:setText("GRAVE");
    obj.label84:setName("label84");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layout44);
    obj.flowLayout5:setLeft(100);
    obj.flowLayout5:setTop(0);
    obj.flowLayout5:setHeight(100);
    obj.flowLayout5:setWidth(60);
    obj.flowLayout5:setName("flowLayout5");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowLayout5);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setField("check1_1_4");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowLayout5);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setField("check2_1_4");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowLayout5);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setField("check3_1_4");
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout5);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowLayout5);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setWidth(20);
    obj.checkBox25:setField("check1_2_4");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowLayout5);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setWidth(20);
    obj.checkBox26:setField("check2_2_4");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.flowLayout5);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setWidth(20);
    obj.checkBox27:setField("check3_2_4");
    obj.checkBox27:setName("checkBox27");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout5);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout44);
    obj.edit116:setLeft(170);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(30);
    obj.edit116:setHeight(25);
    obj.edit116:setField("penalidade4");
    obj.edit116:setName("edit116");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout44);
    obj.dataLink22:setField("penalidade4");
    obj.dataLink22:setDefaultValue("2");
    obj.dataLink22:setName("dataLink22");


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
			


    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout40);
    obj.horzLine7:setLeft(0);
    obj.horzLine7:setTop(245);
    obj.horzLine7:setWidth(210);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setName("horzLine7");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(250);
    obj.layout45:setWidth(210);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout45);
    obj.label85:setLeft(10);
    obj.label85:setTop(0);
    obj.label85:setWidth(95);
    obj.label85:setHeight(20);
    obj.label85:setText("INCAPACITADO");
    obj.label85:setName("label85");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.layout45);
    obj.flowLayout6:setLeft(100);
    obj.flowLayout6:setTop(0);
    obj.flowLayout6:setHeight(100);
    obj.flowLayout6:setWidth(60);
    obj.flowLayout6:setName("flowLayout6");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.flowLayout6);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setWidth(20);
    obj.checkBox28:setField("check1_1_5");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.flowLayout6);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setField("check2_1_5");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.flowLayout6);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setWidth(20);
    obj.checkBox30:setField("check3_1_5");
    obj.checkBox30:setName("checkBox30");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout6);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout45);
    obj.edit117:setLeft(170);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(30);
    obj.edit117:setHeight(25);
    obj.edit117:setField("penalidade5");
    obj.edit117:setName("edit117");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout45);
    obj.dataLink23:setField("penalidade5");
    obj.dataLink23:setDefaultValue("4");
    obj.dataLink23:setName("dataLink23");


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
			


    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout40);
    obj.horzLine8:setLeft(0);
    obj.horzLine8:setTop(280);
    obj.horzLine8:setWidth(210);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setName("horzLine8");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout40);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(285);
    obj.layout46:setWidth(210);
    obj.layout46:setHeight(100);
    obj.layout46:setName("layout46");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout46);
    obj.label86:setLeft(10);
    obj.label86:setTop(0);
    obj.label86:setWidth(95);
    obj.label86:setHeight(20);
    obj.label86:setText("INCOSCIENTE");
    obj.label86:setName("label86");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.layout46);
    obj.flowLayout7:setLeft(100);
    obj.flowLayout7:setTop(0);
    obj.flowLayout7:setHeight(100);
    obj.flowLayout7:setWidth(60);
    obj.flowLayout7:setName("flowLayout7");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.flowLayout7);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setWidth(20);
    obj.checkBox31:setField("check1_1_6");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.flowLayout7);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setWidth(20);
    obj.checkBox32:setField("check2_1_6");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.flowLayout7);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setWidth(20);
    obj.checkBox33:setField("check3_1_6");
    obj.checkBox33:setName("checkBox33");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout7);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.flowLayout7);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setWidth(20);
    obj.checkBox34:setField("check1_2_6");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.flowLayout7);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setWidth(20);
    obj.checkBox35:setField("check2_2_6");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.flowLayout7);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setWidth(20);
    obj.checkBox36:setField("check3_2_6");
    obj.checkBox36:setName("checkBox36");

    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout7);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.flowLayout7);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setWidth(20);
    obj.checkBox37:setField("check1_3_6");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.flowLayout7);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setWidth(20);
    obj.checkBox38:setField("check2_3_6");
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.flowLayout7);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setWidth(20);
    obj.checkBox39:setField("check3_3_6");
    obj.checkBox39:setName("checkBox39");

    obj.flowLineBreak13 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout7);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.flowLayout7);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setWidth(20);
    obj.checkBox40:setField("check1_4_6");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.flowLayout7);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setWidth(20);
    obj.checkBox41:setField("check2_4_6");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.flowLayout7);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setWidth(20);
    obj.checkBox42:setField("check3_4_6");
    obj.checkBox42:setName("checkBox42");

    obj.flowLineBreak14 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout7);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.flowLayout7);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setWidth(20);
    obj.checkBox43:setField("check1_5_6");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.flowLayout7);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setWidth(20);
    obj.checkBox44:setField("check2_5_6");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.flowLayout7);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setWidth(20);
    obj.checkBox45:setField("check3_5_6");
    obj.checkBox45:setName("checkBox45");

    obj.flowLineBreak15 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout7);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout46);
    obj.edit118:setLeft(170);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(30);
    obj.edit118:setHeight(25);
    obj.edit118:setField("penalidade6");
    obj.edit118:setName("edit118");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout46);
    obj.dataLink24:setField("penalidade6");
    obj.dataLink24:setDefaultValue("0");
    obj.dataLink24:setName("dataLink24");


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
			


    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout40);
    obj.horzLine9:setLeft(0);
    obj.horzLine9:setTop(385);
    obj.horzLine9:setWidth(210);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setName("horzLine9");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout40);
    obj.label87:setLeft(5);
    obj.label87:setTop(415);
    obj.label87:setWidth(60);
    obj.label87:setHeight(20);
    obj.label87:setText("Absorção");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout40);
    obj.label88:setLeft(65);
    obj.label88:setTop(390);
    obj.label88:setWidth(30);
    obj.label88:setHeight(20);
    obj.label88:setText("Total");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout40);
    obj.rectangle43:setLeft(65);
    obj.rectangle43:setTop(415);
    obj.rectangle43:setWidth(30);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("Black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout40);
    obj.label89:setLeft(65);
    obj.label89:setTop(415);
    obj.label89:setWidth(30);
    obj.label89:setHeight(25);
    obj.label89:setField("absorcao");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout40);
    obj.label90:setLeft(100);
    obj.label90:setTop(390);
    obj.label90:setWidth(30);
    obj.label90:setHeight(20);
    obj.label90:setText(" Res.");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout40);
    obj.rectangle44:setLeft(100);
    obj.rectangle44:setTop(415);
    obj.rectangle44:setWidth(30);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("Black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout40);
    obj.label91:setLeft(100);
    obj.label91:setTop(415);
    obj.label91:setWidth(30);
    obj.label91:setHeight(25);
    obj.label91:setField("absRes");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout40);
    obj.dataLink25:setField("totalresiliencia");
    obj.dataLink25:setName("dataLink25");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout40);
    obj.label92:setLeft(135);
    obj.label92:setTop(390);
    obj.label92:setWidth(30);
    obj.label92:setHeight(20);
    obj.label92:setText("Arm");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout40);
    obj.rectangle45:setLeft(135);
    obj.rectangle45:setTop(415);
    obj.rectangle45:setWidth(30);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("Black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout40);
    obj.label93:setLeft(135);
    obj.label93:setTop(415);
    obj.label93:setWidth(30);
    obj.label93:setHeight(25);
    obj.label93:setField("indiceArmadura");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout40);
    obj.label94:setLeft(170);
    obj.label94:setTop(390);
    obj.label94:setWidth(30);
    obj.label94:setHeight(20);
    obj.label94:setText(" Out.");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout40);
    obj.edit119:setLeft(170);
    obj.edit119:setTop(415);
    obj.edit119:setWidth(30);
    obj.edit119:setHeight(25);
    obj.edit119:setType("number");
    obj.edit119:setField("absOutros");
    obj.edit119:setName("edit119");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout40);
    obj.dataLink26:setFields({'absRes', 'indiceArmadura', 'absOutros'});
    obj.dataLink26:setName("dataLink26");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox1);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(515);
    obj.layout47:setWidth(315);
    obj.layout47:setHeight(70);
    obj.layout47:setName("layout47");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout47);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(15);
    obj.rectangle46:setYradius(15);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout47);
    obj.button56:setLeft(10);
    obj.button56:setTop(10);
    obj.button56:setWidth(70);
    obj.button56:setHeight(20);
    obj.button56:setText("Iniciativa");
    obj.button56:setName("button56");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout47);
    obj.rectangle47:setLeft(90);
    obj.rectangle47:setTop(10);
    obj.rectangle47:setWidth(35);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("Black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout47);
    obj.label95:setLeft(100);
    obj.label95:setTop(10);
    obj.label95:setWidth(30);
    obj.label95:setHeight(20);
    obj.label95:setField("iniciativa");
    obj.label95:setName("label95");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout47);
    obj.edit120:setLeft(135);
    obj.edit120:setTop(10);
    obj.edit120:setWidth(30);
    obj.edit120:setHeight(25);
    obj.edit120:setType("number");
    obj.edit120:setField("iniciativaBonus");
    obj.edit120:setName("edit120");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout47);
    obj.label96:setLeft(190);
    obj.label96:setTop(10);
    obj.label96:setWidth(100);
    obj.label96:setHeight(20);
    obj.label96:setField("ms");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout47);
    obj.label97:setLeft(10);
    obj.label97:setTop(40);
    obj.label97:setWidth(90);
    obj.label97:setHeight(20);
    obj.label97:setText("Velocidade");
    obj.label97:setName("label97");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout47);
    obj.rectangle48:setLeft(90);
    obj.rectangle48:setTop(40);
    obj.rectangle48:setWidth(35);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout47);
    obj.label98:setLeft(100);
    obj.label98:setTop(40);
    obj.label98:setWidth(30);
    obj.label98:setHeight(20);
    obj.label98:setField("velocidade");
    obj.label98:setName("label98");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout47);
    obj.edit121:setLeft(135);
    obj.edit121:setTop(40);
    obj.edit121:setWidth(30);
    obj.edit121:setHeight(25);
    obj.edit121:setType("number");
    obj.edit121:setField("velocidadeBonus");
    obj.edit121:setName("edit121");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout47);
    obj.label99:setLeft(190);
    obj.label99:setTop(40);
    obj.label99:setWidth(100);
    obj.label99:setHeight(20);
    obj.label99:setField("kmh");
    obj.label99:setName("label99");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout47);
    obj.dataLink27:setFields({'totalforca', 'totalagilidade', 'totalperspicacia', 'iniciativaBonus', 'velocidadeBonus'});
    obj.dataLink27:setName("dataLink27");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox1);
    obj.layout48:setLeft(840);
    obj.layout48:setTop(445);
    obj.layout48:setWidth(300);
    obj.layout48:setHeight(80);
    obj.layout48:setName("layout48");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout48);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout48);
    obj.rectangle50:setLeft(10);
    obj.rectangle50:setTop(30);
    obj.rectangle50:setWidth(35);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("Black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout48);
    obj.label100:setLeft(5);
    obj.label100:setTop(10);
    obj.label100:setWidth(50);
    obj.label100:setHeight(20);
    obj.label100:setText("Dado 1");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout48);
    obj.label101:setLeft(20);
    obj.label101:setTop(32);
    obj.label101:setWidth(30);
    obj.label101:setHeight(20);
    obj.label101:setField("num1");
    obj.label101:setText("val");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout48);
    obj.label102:setLeft(46);
    obj.label102:setTop(32);
    obj.label102:setWidth(10);
    obj.label102:setHeight(20);
    obj.label102:setText("+");
    obj.label102:setName("label102");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout48);
    obj.rectangle51:setLeft(55);
    obj.rectangle51:setTop(30);
    obj.rectangle51:setWidth(35);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("Black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout48);
    obj.label103:setLeft(50);
    obj.label103:setTop(10);
    obj.label103:setWidth(50);
    obj.label103:setHeight(20);
    obj.label103:setText("Dado 2");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout48);
    obj.label104:setLeft(65);
    obj.label104:setTop(32);
    obj.label104:setWidth(30);
    obj.label104:setHeight(20);
    obj.label104:setField("num2");
    obj.label104:setText("val");
    obj.label104:setName("label104");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout48);
    obj.button57:setLeft(70);
    obj.button57:setTop(60);
    obj.button57:setWidth(15);
    obj.button57:setHeight(15);
    obj.button57:setText("x");
    obj.button57:setFontSize(10);
    obj.button57:setName("button57");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout48);
    obj.label105:setLeft(105);
    obj.label105:setTop(60);
    obj.label105:setWidth(80);
    obj.label105:setHeight(15);
    obj.label105:setField("rollnome1");
    obj.label105:setFontSize(11);
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout48);
    obj.label106:setLeft(185);
    obj.label106:setTop(60);
    obj.label106:setWidth(15);
    obj.label106:setHeight(15);
    obj.label106:setText("+");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout48);
    obj.label107:setLeft(200);
    obj.label107:setTop(60);
    obj.label107:setWidth(80);
    obj.label107:setHeight(15);
    obj.label107:setField("rollnome2");
    obj.label107:setFontSize(11);
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout48);
    obj.label108:setLeft(92);
    obj.label108:setTop(32);
    obj.label108:setWidth(10);
    obj.label108:setHeight(20);
    obj.label108:setText("+");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout48);
    obj.label109:setLeft(105);
    obj.label109:setTop(10);
    obj.label109:setWidth(40);
    obj.label109:setHeight(20);
    obj.label109:setText("Especs");
    obj.label109:setName("label109");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout48);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'0', '1,5', '3'});
    obj.comboBox1:setValues({'0', '1', '2'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setField("especBonus");
    obj.comboBox1:setName("comboBox1");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout48);
    obj.label110:setLeft(160);
    obj.label110:setTop(10);
    obj.label110:setWidth(40);
    obj.label110:setHeight(20);
    obj.label110:setText("Extra");
    obj.label110:setName("label110");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout48);
    obj.edit122:setLeft(160);
    obj.edit122:setTop(30);
    obj.edit122:setWidth(30);
    obj.edit122:setHeight(25);
    obj.edit122:setField("extra");
    obj.edit122:setName("edit122");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout48);
    obj.label111:setLeft(195);
    obj.label111:setTop(10);
    obj.label111:setWidth(40);
    obj.label111:setHeight(20);
    obj.label111:setText("Dific.");
    obj.label111:setName("label111");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout48);
    obj.edit123:setLeft(195);
    obj.edit123:setTop(30);
    obj.edit123:setWidth(30);
    obj.edit123:setHeight(25);
    obj.edit123:setField("dificuldade");
    obj.edit123:setType("number");
    obj.edit123:setName("edit123");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout48);
    obj.button58:setLeft(230);
    obj.button58:setTop(30);
    obj.button58:setWidth(50);
    obj.button58:setText("ROLAR");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.scrollBox1);
    obj.rectangle52:setLeft(840);
    obj.rectangle52:setTop(90);
    obj.rectangle52:setWidth(350);
    obj.rectangle52:setHeight(350);
    obj.rectangle52:setColor("DimGray");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("innerLine");
    obj.rectangle52:setName("rectangle52");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(840);
    obj.image1:setTop(90);
    obj.image1:setWidth(350);
    obj.image1:setHeight(350);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");



		local function rolar()
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);
			local num1 = (tonumber(sheet.num1) or 0);
			local num2 = (tonumber(sheet.num2) or 0);
            local parada = num1 + num2 + (tonumber(sheet.extra) or 0);
            if sheet.especBonus=='1' then
            	parada = parada + 1.5;
            elseif sheet.especBonus=='2' then
            	parada = parada + 3;
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
			parada = parada - math.abs(pen);
			
            parada = math.floor(parada);

           	local dificuldade = (tonumber(sheet.dificuldade) or 0);
           	dificuldade = dificuldade;

           	local nome = "";
           	if sheet.rollnome1 ~= nil then 
           		nome = sheet.rollnome1 .. " ";
           	end;
           	if sheet.rollnome2 ~= nil then
           		nome = nome .. "+ " .. sheet.rollnome2 .. " ";
           	end;

           	if parada < 1 then 
           		mesaDoPersonagem.activeChat:enviarMensagem("Sem dados suficientes para essa rolagem. ");
           		return;
           	end;

           	rolagem = rrpg.interpretarRolagem(parada .. "d10");
           	mesaDoPersonagem.activeChat:rolarDados(rolagem, nome .. "Dificuldade: " .. dificuldade  .. " (" .. num1 .. " + " .. num2 .. " + " .. (sheet.especBonus or 0) .. "x especializaçao + " .. (sheet.extra or 0) .. " - " .. pen .. " dano)", 
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
	


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome1 = "Força";
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome2 = "Força";
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome1 = "Agilidade";
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome2 = "Agilidade";
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome1 = "Resiliência";
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome2 = "Resiliência";
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event9 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome1 = "Carisma";
        end, obj);

    obj._e_event10 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome2 = "Carisma";
        end, obj);

    obj._e_event11 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event12 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome1 = "Percepção";
        end, obj);

    obj._e_event13 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome2 = "Percepção";
        end, obj);

    obj._e_event14 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event15 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome1 = "Perspicácia";
        end, obj);

    obj._e_event16 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome2 = "Perspicácia";
        end, obj);

    obj._e_event17 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event18 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome1 = "Consciência";
        end, obj);

    obj._e_event19 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome2 = "Consciência";
        end, obj);

    obj._e_event20 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event21 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome1 = "Espírito";
        end, obj);

    obj._e_event22 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome2 = "Espírito";
        end, obj);

    obj._e_event23 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event24 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome1 = "Perseverança";
        end, obj);

    obj._e_event25 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome2 = "Perseverança";
        end, obj);

    obj._e_event26 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
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
        end, obj);

    obj._e_event27 = obj.edit39:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event28 = obj.edit40:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event29 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event30 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event31 = obj.edit42:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event32 = obj.edit43:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event33 = obj.edit44:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event34 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event35 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event36 = obj.edit46:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event37 = obj.edit47:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event38 = obj.edit48:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event39 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event40 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event41 = obj.edit50:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event42 = obj.edit51:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event43 = obj.edit52:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event44 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event45 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event46 = obj.edit54:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event47 = obj.edit55:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event48 = obj.edit56:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event49 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event50 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event51 = obj.edit58:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event52 = obj.edit59:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event53 = obj.edit60:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event54 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event55 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event56 = obj.edit62:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event57 = obj.edit63:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event58 = obj.edit64:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event59 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event60 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event61 = obj.edit66:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event62 = obj.edit67:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event63 = obj.edit68:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event64 = obj.button33:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event65 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event66 = obj.edit70:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event67 = obj.edit71:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event68 = obj.edit72:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event69 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event70 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event71 = obj.edit74:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event72 = obj.edit75:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event73 = obj.edit76:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event74 = obj.button37:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event75 = obj.button38:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event76 = obj.edit78:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event77 = obj.edit79:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event78 = obj.edit80:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event79 = obj.button39:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event80 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event81 = obj.edit82:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event82 = obj.edit83:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event83 = obj.edit84:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event84 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event85 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event86 = obj.edit86:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event87 = obj.edit87:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event88 = obj.edit88:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event89 = obj.button43:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event90 = obj.button44:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event91 = obj.edit90:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event92 = obj.edit91:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event93 = obj.edit92:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event94 = obj.button45:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event95 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event96 = obj.edit94:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event97 = obj.edit95:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event98 = obj.edit96:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event99 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event100 = obj.button48:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event101 = obj.edit98:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event102 = obj.edit99:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event103 = obj.edit100:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event104 = obj.button49:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event105 = obj.button50:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event106 = obj.edit102:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event107 = obj.edit103:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event108 = obj.edit104:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event109 = obj.button51:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event110 = obj.button52:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event111 = obj.edit106:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event112 = obj.edit107:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event113 = obj.edit108:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event114 = obj.button53:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event115 = obj.button54:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event116 = obj.edit110:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event117 = obj.edit111:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event118 = obj.edit112:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event119 = obj.button55:addEventListener("onClick",
        function (_)
            local rcl = self.rclListaOutros:append();
            					if rcl~=nil then 
            						rcl.multXp = sheet.auditxpcost_out;
            						rcl.multApr = sheet.auditbonuscost_out;
            					end;
        end, obj);

    obj._e_event120 = obj.rclListaOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event121 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absRes = math.floor(tonumber(sheet.testeresiliencia) or 0);
            					end;
        end, obj);

    obj._e_event122 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absorcao = (tonumber(sheet.absRes) or 0) + (tonumber(sheet.absOutros) or 0) + (tonumber(sheet.indiceArmadura) or 0);
            					end;
        end, obj);

    obj._e_event123 = obj.button56:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            					rolagem = rrpg.interpretarRolagem("1d10 + " .. (sheet.iniciativa or 0));
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (sheet.nome or 0));
        end, obj);

    obj._e_event124 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.iniciativa = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeperspicacia) or 0)) * 2 + (tonumber(sheet.iniciativaBonus) or 0);
            						sheet.velocidade = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeforca) or 0) + 2) * 2 + (tonumber(sheet.velocidadeBonus) or 0);
            						local mod = math.floor(((tonumber(sheet.velocidade) or 0)/3) * 100);
            						mod = mod / 100;
            						sheet.ms = mod .. "m/s";
            						sheet.kmh = ((tonumber(sheet.velocidade) or 0)*1.2) .. "Km/h";
            					end;
        end, obj);

    obj._e_event125 = obj.button57:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            					sheet.field2 = nil;
            					sheet.num2 = nil;
            					sheet.rollnome2 = nil;
        end, obj);

    obj._e_event126 = obj.button58:addEventListener("onClick",
        function (_)
            rolar();
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rclListaOutros ~= nil then self.rclListaOutros:destroy(); self.rclListaOutros = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
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
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.popOther ~= nil then self.popOther:destroy(); self.popOther = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmACN1()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmACN1();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
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
Firecast.registrarForm(_frmACN1);

return _frmACN1;
