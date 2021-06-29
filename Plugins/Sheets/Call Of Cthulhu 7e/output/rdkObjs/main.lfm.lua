require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_CthulhuSheet7e_byHelldemos()
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
    obj:setDataType("CthulhuSheet7e_byHelldemos");
    obj:setTitle("Ficha de Call of Cthulhu 7e");
    obj:setName("CthulhuSheet7e_byHelldemos");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setLeft(5);
    obj.tabControl1:setTop(5);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("none");
    obj.layout1:setHeight(255);
    obj.layout1:setWidth(400);
    obj.layout1:setTop(15);
    obj.layout1:setLeft(5);
    obj.layout1:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout1:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Identidade");
    obj.label1:setLeft(175);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold italic");
    obj.label1:setTop(9);
    obj.label1:setName("label1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(600);
    obj.layout2:setHeight(250);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setName("layout3");
    obj.layout3:setWidth(15);
    obj.layout3:setTop(25);
    obj.layout3:setHeight(25);
    obj.layout3:setAlign("top");
    obj.layout3:setMargins({left=2, right=2, top=5});

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setText("     Nome:");
    obj.label2:setName("label2");
    obj.label2:setAlign("left");
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setVertTextAlign("leading");
    obj.label2:setAutoSize(true);
    obj.label2:setTop(30);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setField("identidade.nome");
    obj.edit1:setName("edit1");
    obj.edit1:setHeight(5);
    obj.edit1:setWidth(250);
    obj.edit1:setFontSize(15);
    obj.edit1:setAlign("left");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setName("layout4");
    obj.layout4:setWidth(15);
    obj.layout4:setTop(25);
    obj.layout4:setHeight(25);
    obj.layout4:setAlign("top");
    obj.layout4:setMargins({left=2, right=2, top=5});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setText("     Ocupação:");
    obj.label3:setName("label3");
    obj.label3:setAlign("left");
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setVertTextAlign("leading");
    obj.label3:setAutoSize(true);
    obj.label3:setTop(30);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setField("identidade.ocupacao");
    obj.edit2:setName("edit2");
    obj.edit2:setHeight(5);
    obj.edit2:setWidth(250);
    obj.edit2:setFontSize(15);
    obj.edit2:setAlign("left");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setName("layout5");
    obj.layout5:setWidth(15);
    obj.layout5:setTop(25);
    obj.layout5:setHeight(25);
    obj.layout5:setAlign("top");
    obj.layout5:setMargins({left=2, right=2, top=5});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setText("     Emprego:");
    obj.label4:setName("label4");
    obj.label4:setAlign("left");
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setVertTextAlign("leading");
    obj.label4:setAutoSize(true);
    obj.label4:setTop(30);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setField("identidade.emprego");
    obj.edit3:setName("edit3");
    obj.edit3:setHeight(5);
    obj.edit3:setWidth(250);
    obj.edit3:setFontSize(15);
    obj.edit3:setAlign("left");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setName("layout6");
    obj.layout6:setWidth(15);
    obj.layout6:setTop(25);
    obj.layout6:setHeight(25);
    obj.layout6:setAlign("top");
    obj.layout6:setMargins({left=2, right=2, top=5});

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setText("     Nacionalidade:");
    obj.label5:setName("label5");
    obj.label5:setAlign("left");
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setVertTextAlign("leading");
    obj.label5:setAutoSize(true);
    obj.label5:setTop(30);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setField("identidade.nacionalidade");
    obj.edit4:setName("edit4");
    obj.edit4:setHeight(5);
    obj.edit4:setWidth(250);
    obj.edit4:setFontSize(15);
    obj.edit4:setAlign("left");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setName("layout7");
    obj.layout7:setWidth(15);
    obj.layout7:setTop(25);
    obj.layout7:setHeight(25);
    obj.layout7:setAlign("top");
    obj.layout7:setMargins({left=2, right=2, top=5});

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setText("     Sexo:");
    obj.label6:setName("label6");
    obj.label6:setAlign("left");
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setVertTextAlign("leading");
    obj.label6:setAutoSize(true);
    obj.label6:setTop(30);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setField("identidade.sexo");
    obj.edit5:setName("edit5");
    obj.edit5:setHeight(5);
    obj.edit5:setWidth(250);
    obj.edit5:setFontSize(15);
    obj.edit5:setAlign("left");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setName("layout8");
    obj.layout8:setWidth(15);
    obj.layout8:setTop(25);
    obj.layout8:setHeight(25);
    obj.layout8:setAlign("top");
    obj.layout8:setMargins({left=2, right=2, top=5});

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setText("     Residencia:");
    obj.label7:setName("label7");
    obj.label7:setAlign("left");
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setVertTextAlign("leading");
    obj.label7:setAutoSize(true);
    obj.label7:setTop(30);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setField("identidade.residencia");
    obj.edit6:setName("edit6");
    obj.edit6:setHeight(5);
    obj.edit6:setWidth(250);
    obj.edit6:setFontSize(15);
    obj.edit6:setAlign("left");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setName("layout9");
    obj.layout9:setWidth(15);
    obj.layout9:setTop(25);
    obj.layout9:setHeight(25);
    obj.layout9:setAlign("top");
    obj.layout9:setMargins({left=2, right=2, top=5});

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setText("     Idade:");
    obj.label8:setName("label8");
    obj.label8:setAlign("left");
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setVertTextAlign("leading");
    obj.label8:setAutoSize(true);
    obj.label8:setTop(30);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setField("identidade.idade");
    obj.edit7:setName("edit7");
    obj.edit7:setHeight(5);
    obj.edit7:setWidth(250);
    obj.edit7:setFontSize(15);
    obj.edit7:setAlign("left");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setAlign("none");
    obj.layout10:setLeft(423);
    obj.layout10:setHeight(130);
    obj.layout10:setWidth(665);
    obj.layout10:setTop(15);
    obj.layout10:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout10:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout10:setName("layout10");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setText("Atributos");
    obj.label9:setLeft(300);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold italic");
    obj.label9:setTop(15);
    obj.label9:setName("label9");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setLeft(20);
    obj.layout11:setTop(42);
    obj.layout11:setWidth(700);
    obj.layout11:setHeight(250);
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setName("layout12");
    obj.layout12:setWidth(74);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=2, right=2});

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8:setType("number");
    obj.edit8:setField("atributo.forca");
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(30);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(20);
    obj.edit8:setAlign("top");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout12);
    obj.label10:setText("Força");
    obj.label10:setName("label10");
    obj.label10:setAlign("top");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("leading");
    obj.label10:setAutoSize(true);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout12);
    obj.button1:setAlign("top");
    obj.button1:setTop(2);
    obj.button1:setText("Rolar");
    obj.button1:setName("button1");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setName("layout13");
    obj.layout13:setWidth(74);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=2, right=2});

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9:setType("number");
    obj.edit9:setField("atributo.destreza");
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(30);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(20);
    obj.edit9:setAlign("top");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout13);
    obj.label11:setText("Destreza");
    obj.label11:setName("label11");
    obj.label11:setAlign("top");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setVertTextAlign("leading");
    obj.label11:setAutoSize(true);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout13);
    obj.button2:setAlign("top");
    obj.button2:setTop(2);
    obj.button2:setText("Rolar");
    obj.button2:setName("button2");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setName("layout14");
    obj.layout14:setWidth(74);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=2, right=2});

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout14);
    obj.edit10:setType("number");
    obj.edit10:setField("atributo.poder");
    obj.edit10:setName("edit10");
    obj.edit10:setHeight(30);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(20);
    obj.edit10:setAlign("top");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout14);
    obj.label12:setText("Poder");
    obj.label12:setName("label12");
    obj.label12:setAlign("top");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("leading");
    obj.label12:setAutoSize(true);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout14);
    obj.button3:setAlign("top");
    obj.button3:setTop(2);
    obj.button3:setText("Rolar");
    obj.button3:setName("button3");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setName("layout15");
    obj.layout15:setWidth(74);
    obj.layout15:setAlign("left");
    obj.layout15:setMargins({left=2, right=2});

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11:setType("number");
    obj.edit11:setField("atributo.constituicao");
    obj.edit11:setName("edit11");
    obj.edit11:setHeight(30);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(20);
    obj.edit11:setAlign("top");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout15);
    obj.label13:setText("Constituição");
    obj.label13:setName("label13");
    obj.label13:setAlign("top");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setVertTextAlign("leading");
    obj.label13:setAutoSize(true);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout15);
    obj.button4:setAlign("top");
    obj.button4:setTop(2);
    obj.button4:setText("Rolar");
    obj.button4:setName("button4");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setName("layout16");
    obj.layout16:setWidth(74);
    obj.layout16:setAlign("left");
    obj.layout16:setMargins({left=2, right=2});

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout16);
    obj.edit12:setType("number");
    obj.edit12:setField("atributo.aparencia");
    obj.edit12:setName("edit12");
    obj.edit12:setHeight(30);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(20);
    obj.edit12:setAlign("top");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout16);
    obj.label14:setText("Aparencia");
    obj.label14:setName("label14");
    obj.label14:setAlign("top");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("leading");
    obj.label14:setAutoSize(true);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout16);
    obj.button5:setAlign("top");
    obj.button5:setTop(2);
    obj.button5:setText("Rolar");
    obj.button5:setName("button5");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout11);
    obj.layout17:setName("layout17");
    obj.layout17:setWidth(74);
    obj.layout17:setAlign("left");
    obj.layout17:setMargins({left=2, right=2});

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout17);
    obj.edit13:setType("number");
    obj.edit13:setField("atributo.educacao");
    obj.edit13:setName("edit13");
    obj.edit13:setHeight(30);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(20);
    obj.edit13:setAlign("top");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout17);
    obj.label15:setText("Educação");
    obj.label15:setName("label15");
    obj.label15:setAlign("top");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setVertTextAlign("leading");
    obj.label15:setAutoSize(true);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout17);
    obj.button6:setAlign("top");
    obj.button6:setTop(2);
    obj.button6:setText("Rolar");
    obj.button6:setName("button6");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout11);
    obj.layout18:setName("layout18");
    obj.layout18:setWidth(74);
    obj.layout18:setAlign("left");
    obj.layout18:setMargins({left=2, right=2});

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout18);
    obj.edit14:setType("number");
    obj.edit14:setField("atributo.tamanho");
    obj.edit14:setName("edit14");
    obj.edit14:setHeight(30);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(20);
    obj.edit14:setAlign("top");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout18);
    obj.label16:setText("Tamanho");
    obj.label16:setName("label16");
    obj.label16:setAlign("top");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setVertTextAlign("leading");
    obj.label16:setAutoSize(true);

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout18);
    obj.button7:setAlign("top");
    obj.button7:setTop(2);
    obj.button7:setText("Rolar");
    obj.button7:setName("button7");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout11);
    obj.layout19:setName("layout19");
    obj.layout19:setWidth(74);
    obj.layout19:setAlign("left");
    obj.layout19:setMargins({left=2, right=2});

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout19);
    obj.edit15:setType("number");
    obj.edit15:setField("atributo.inteligencia");
    obj.edit15:setName("edit15");
    obj.edit15:setHeight(30);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(20);
    obj.edit15:setAlign("top");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout19);
    obj.label17:setText("Inteligencia");
    obj.label17:setName("label17");
    obj.label17:setAlign("top");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setVertTextAlign("leading");
    obj.label17:setAutoSize(true);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout19);
    obj.button8:setAlign("top");
    obj.button8:setTop(2);
    obj.button8:setText("Rolar");
    obj.button8:setName("button8");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setAlign("none");
    obj.layout20:setLeft(423);
    obj.layout20:setHeight(130);
    obj.layout20:setWidth(665);
    obj.layout20:setTop(138);
    obj.layout20:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout20:setMargins({left=30, right=10, bottom=10});
    obj.layout20:setName("layout20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(20);
    obj.layout21:setTop(20);
    obj.layout21:setWidth(700);
    obj.layout21:setHeight(250);
    obj.layout21:setName("layout21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setName("layout22");
    obj.layout22:setWidth(74);
    obj.layout22:setAlign("left");
    obj.layout22:setMargins({left=2, right=2});

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout22);
    obj.edit16:setField("atributo.hp");
    obj.edit16:setName("edit16");
    obj.edit16:setHeight(30);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(20);
    obj.edit16:setAlign("top");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout22);
    obj.label18:setText("Pontos De Vida");
    obj.label18:setName("label18");
    obj.label18:setAlign("top");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("leading");
    obj.label18:setAutoSize(true);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setName("layout23");
    obj.layout23:setWidth(74);
    obj.layout23:setAlign("left");
    obj.layout23:setMargins({left=2, right=2});

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout23);
    obj.edit17:setField("atributo.mp");
    obj.edit17:setName("edit17");
    obj.edit17:setHeight(30);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(20);
    obj.edit17:setAlign("top");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout23);
    obj.label19:setText("Pontos De Magia");
    obj.label19:setName("label19");
    obj.label19:setAlign("top");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setVertTextAlign("leading");
    obj.label19:setAutoSize(true);

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setName("layout24");
    obj.layout24:setWidth(74);
    obj.layout24:setAlign("left");
    obj.layout24:setMargins({left=2, right=2});

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout24);
    obj.edit18:setType("number");
    obj.edit18:setField("atributo.sorte");
    obj.edit18:setName("edit18");
    obj.edit18:setHeight(30);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(20);
    obj.edit18:setAlign("top");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout24);
    obj.label20:setText("Sorte");
    obj.label20:setName("label20");
    obj.label20:setAlign("top");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("leading");
    obj.label20:setAutoSize(true);

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout24);
    obj.button9:setAlign("top");
    obj.button9:setTop(2);
    obj.button9:setText("Rolar");
    obj.button9:setName("button9");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setName("layout25");
    obj.layout25:setWidth(74);
    obj.layout25:setAlign("left");
    obj.layout25:setMargins({left=2, right=2});

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout25);
    obj.edit19:setType("number");
    obj.edit19:setField("atributo.movimento");
    obj.edit19:setName("edit19");
    obj.edit19:setHeight(30);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(20);
    obj.edit19:setAlign("top");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout25);
    obj.label21:setText("Taxa de Movimento");
    obj.label21:setName("label21");
    obj.label21:setAlign("top");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setVertTextAlign("leading");
    obj.label21:setAutoSize(true);

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setName("layout26");
    obj.layout26:setWidth(74);
    obj.layout26:setAlign("left");
    obj.layout26:setMargins({left=2, right=2});

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout26);
    obj.checkBox1:setTop(5);
    obj.checkBox1:setText("G. Ferido");
    obj.checkBox1:setField("estados.gravferido");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout26);
    obj.checkBox2:setTop(25);
    obj.checkBox2:setText("T. Insano");
    obj.checkBox2:setField("estados.tempinsano");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout26);
    obj.checkBox3:setTop(45);
    obj.checkBox3:setText("I. Insano");
    obj.checkBox3:setField("estados.indinsano");
    obj.checkBox3:setName("checkBox3");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout21);
    obj.layout27:setName("layout27");
    obj.layout27:setWidth(74);
    obj.layout27:setAlign("left");
    obj.layout27:setMargins({left=2, right=2});

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout27);
    obj.edit20:setType("number");
    obj.edit20:setField("atributo.sanidadeatual");
    obj.edit20:setName("edit20");
    obj.edit20:setHeight(30);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(20);
    obj.edit20:setAlign("top");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout27);
    obj.label22:setText("Sanidade Atual");
    obj.label22:setName("label22");
    obj.label22:setAlign("top");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setVertTextAlign("leading");
    obj.label22:setAutoSize(true);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout27);
    obj.button10:setAlign("top");
    obj.button10:setTop(2);
    obj.button10:setText("Rolar");
    obj.button10:setName("button10");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout21);
    obj.layout28:setName("layout28");
    obj.layout28:setWidth(74);
    obj.layout28:setAlign("left");
    obj.layout28:setMargins({left=2, right=2});

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout28);
    obj.edit21:setType("number");
    obj.edit21:setField("atributo.sanidademaxima");
    obj.edit21:setName("edit21");
    obj.edit21:setHeight(30);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(20);
    obj.edit21:setAlign("top");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout28);
    obj.label23:setText("Sanidade Maxima");
    obj.label23:setName("label23");
    obj.label23:setAlign("top");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setVertTextAlign("leading");
    obj.label23:setAutoSize(true);

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout21);
    obj.layout29:setName("layout29");
    obj.layout29:setWidth(74);
    obj.layout29:setAlign("left");
    obj.layout29:setMargins({left=2, right=2});

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout29);
    obj.edit22:setType("number");
    obj.edit22:setField("atributo.sanidadeinicial");
    obj.edit22:setName("edit22");
    obj.edit22:setHeight(30);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(20);
    obj.edit22:setAlign("top");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout29);
    obj.label24:setText("Sanidade Inicial");
    obj.label24:setName("label24");
    obj.label24:setAlign("top");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setVertTextAlign("leading");
    obj.label24:setAutoSize(true);

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox1);
    obj.layout30:setAlign("none");
    obj.layout30:setLeft(1103);
    obj.layout30:setHeight(255);
    obj.layout30:setWidth(230);
    obj.layout30:setTop(15);
    obj.layout30:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout30:setMargins({left=30, right=10, bottom=10});
    obj.layout30:setName("layout30");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout30);
    obj.label25:setText("Escolha Uma Imagem");
    obj.label25:setLeft(55);
    obj.label25:setTop(19);
    obj.label25:setWidth(200);
    obj.label25:setHeight(215);
    obj.label25:setName("label25");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout30);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(15);
    obj.image1:setTop(19);
    obj.image1:setWidth(200);
    obj.image1:setHeight(215);
    obj.image1:setName("image1");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox1);
    obj.layout31:setAlign("none");
    obj.layout31:setLeft(5);
    obj.layout31:setHeight(35);
    obj.layout31:setWidth(1329);
    obj.layout31:setTop(290);
    obj.layout31:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout31:setMargins({left=30, right=10, bottom=10});
    obj.layout31:setName("layout31");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout31);
    obj.label26:setText("Perícias do Investigador");
    obj.label26:setLeft(625);
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold italic");
    obj.label26:setTop(9);
    obj.label26:setWidth(1343);
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout31);
    obj.label27:setText("*Insira o valor 1 em todas as caixas de texto abaixo para carregar o valor minimo.");
    obj.label27:setFontSize(12);
    obj.label27:setFontColor("Yellow");
    obj.label27:setHorzTextAlign("trailing");
    obj.label27:setLeft(-50);
    lfm_setPropAsString(obj.label27, "fontStyle",  "italic");
    obj.label27:setTop(9);
    obj.label27:setWidth(1343);
    obj.label27:setName("label27");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox1);
    obj.layout32:setAlign("none");
    obj.layout32:setLeft(5);
    obj.layout32:setHeight(984);
    obj.layout32:setWidth(332);
    obj.layout32:setTop(325);
    obj.layout32:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout32:setMargins({left=30, right=10, bottom=10});
    obj.layout32:setName("layout32");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout32);
    obj.label28:setText("Perícias Gerais");
    obj.label28:setLeft(115);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold italic");
    obj.label28:setTop(9);
    obj.label28:setWidth(1343);
    obj.label28:setName("label28");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setLeft(20);
    obj.layout33:setTop(25);
    obj.layout33:setWidth(270);
    obj.layout33:setHeight(984);
    obj.layout33:setName("layout33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(20);
    obj.layout34:setMargins({bottom=2, top=15});
    obj.layout34:setName("layout34");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout34);
    obj.label29:setAlign("left");
    obj.label29:setWidth(14);
    obj.label29:setText(" ");
    obj.label29:setHorzTextAlign("trailing");
    obj.label29:setMargins({right=5});
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout34);
    obj.label30:setAlign("left");
    obj.label30:setWidth(120);
    obj.label30:setText("Mitos de Cthulhu:");
    obj.label30:setHorzTextAlign("trailing");
    obj.label30:setMargins({right=5});
    obj.label30:setName("label30");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout34);
    obj.edit23:setType("number");
    obj.edit23:setMin(00);
    obj.edit23:setAlign("left");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(14);
    obj.edit23:setWidth(50);
    obj.edit23:setField("pericia.Mythos");
    obj.edit23:setName("edit23");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout34);
    obj.label31:setAlign("left");
    obj.label31:setWidth(5);
    obj.label31:setText("");
    obj.label31:setHorzTextAlign("trailing");
    obj.label31:setMargins({right=5});
    obj.label31:setName("label31");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout34);
    obj.button11:setAlign("left");
    obj.button11:setLeft(5);
    obj.button11:setText("Rolar");
    obj.button11:setWidth(50);
    obj.button11:setName("button11");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(20);
    obj.layout35:setMargins({bottom=2, top=15});
    obj.layout35:setName("layout35");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout35);
    obj.label32:setAlign("left");
    obj.label32:setWidth(14);
    obj.label32:setText(" ");
    obj.label32:setHorzTextAlign("trailing");
    obj.label32:setMargins({right=5});
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout35);
    obj.label33:setAlign("left");
    obj.label33:setWidth(120);
    obj.label33:setText("Nivel de Credito:");
    obj.label33:setHorzTextAlign("trailing");
    obj.label33:setMargins({right=5});
    obj.label33:setName("label33");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout35);
    obj.edit24:setType("number");
    obj.edit24:setAlign("left");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(14);
    obj.edit24:setWidth(50);
    obj.edit24:setField("pericia.credito");
    obj.edit24:setName("edit24");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout35);
    obj.label34:setAlign("left");
    obj.label34:setWidth(5);
    obj.label34:setText("");
    obj.label34:setHorzTextAlign("trailing");
    obj.label34:setMargins({right=5});
    obj.label34:setName("label34");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout35);
    obj.button12:setAlign("left");
    obj.button12:setLeft(5);
    obj.button12:setText("Rolar");
    obj.button12:setWidth(50);
    obj.button12:setName("button12");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout33);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(20);
    obj.layout36:setMargins({bottom=2, top=15});
    obj.layout36:setName("layout36");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout36);
    obj.checkBox4:setWidth(17);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setMargins({right=2});
    obj.checkBox4:setField("periciacheck.avaliacao");
    obj.checkBox4:setName("checkBox4");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout36);
    obj.label35:setAlign("left");
    obj.label35:setWidth(120);
    obj.label35:setText("Avaliação:");
    obj.label35:setHorzTextAlign("trailing");
    obj.label35:setMargins({right=5});
    obj.label35:setName("label35");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout36);
    obj.edit25:setType("number");
    obj.edit25:setMin(05);
    obj.edit25:setAlign("left");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(14);
    obj.edit25:setWidth(50);
    obj.edit25:setField("pericia.avaliacao");
    obj.edit25:setName("edit25");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout36);
    obj.label36:setAlign("left");
    obj.label36:setWidth(5);
    obj.label36:setText("");
    obj.label36:setHorzTextAlign("trailing");
    obj.label36:setMargins({right=5});
    obj.label36:setName("label36");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout36);
    obj.button13:setAlign("left");
    obj.button13:setLeft(5);
    obj.button13:setText("Rolar");
    obj.button13:setWidth(50);
    obj.button13:setName("button13");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(20);
    obj.layout37:setMargins({bottom=2, top=15});
    obj.layout37:setName("layout37");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout37);
    obj.checkBox5:setWidth(17);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setMargins({right=2});
    obj.checkBox5:setField("periciacheck.chaveiro");
    obj.checkBox5:setName("checkBox5");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout37);
    obj.label37:setAlign("left");
    obj.label37:setWidth(120);
    obj.label37:setText("Chaveiro:");
    obj.label37:setHorzTextAlign("trailing");
    obj.label37:setMargins({right=5});
    obj.label37:setName("label37");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout37);
    obj.edit26:setType("number");
    obj.edit26:setMin(01);
    obj.edit26:setAlign("left");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(14);
    obj.edit26:setWidth(50);
    obj.edit26:setField("pericia.chaveiro");
    obj.edit26:setName("edit26");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout37);
    obj.label38:setAlign("left");
    obj.label38:setWidth(5);
    obj.label38:setText("");
    obj.label38:setHorzTextAlign("trailing");
    obj.label38:setMargins({right=5});
    obj.label38:setName("label38");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout37);
    obj.button14:setAlign("left");
    obj.button14:setLeft(5);
    obj.button14:setText("Rolar");
    obj.button14:setWidth(50);
    obj.button14:setName("button14");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout33);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(20);
    obj.layout38:setMargins({bottom=2, top=15});
    obj.layout38:setName("layout38");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout38);
    obj.checkBox6:setWidth(17);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setMargins({right=2});
    obj.checkBox6:setField("periciacheck.conEletrico");
    obj.checkBox6:setName("checkBox6");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout38);
    obj.label39:setAlign("left");
    obj.label39:setWidth(120);
    obj.label39:setText("Consertos Eletricos:");
    obj.label39:setHorzTextAlign("trailing");
    obj.label39:setMargins({right=5});
    obj.label39:setName("label39");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout38);
    obj.edit27:setType("number");
    obj.edit27:setMin(10);
    obj.edit27:setAlign("left");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(14);
    obj.edit27:setWidth(50);
    obj.edit27:setField("pericia.conEletrico");
    obj.edit27:setName("edit27");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout38);
    obj.label40:setAlign("left");
    obj.label40:setWidth(5);
    obj.label40:setText("");
    obj.label40:setHorzTextAlign("trailing");
    obj.label40:setMargins({right=5});
    obj.label40:setName("label40");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout38);
    obj.button15:setAlign("left");
    obj.button15:setLeft(5);
    obj.button15:setText("Rolar");
    obj.button15:setWidth(50);
    obj.button15:setName("button15");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout33);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(20);
    obj.layout39:setMargins({bottom=2, top=15});
    obj.layout39:setName("layout39");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout39);
    obj.checkBox7:setWidth(17);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setMargins({right=2});
    obj.checkBox7:setField("periciacheck.conMecanico");
    obj.checkBox7:setName("checkBox7");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout39);
    obj.label41:setAlign("left");
    obj.label41:setWidth(120);
    obj.label41:setText("Consertos Mecanico:");
    obj.label41:setHorzTextAlign("trailing");
    obj.label41:setMargins({right=5});
    obj.label41:setName("label41");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout39);
    obj.edit28:setType("number");
    obj.edit28:setMin(10);
    obj.edit28:setAlign("left");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(14);
    obj.edit28:setWidth(50);
    obj.edit28:setField("pericia.conMecanico");
    obj.edit28:setName("edit28");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout39);
    obj.label42:setAlign("left");
    obj.label42:setWidth(5);
    obj.label42:setText("");
    obj.label42:setHorzTextAlign("trailing");
    obj.label42:setMargins({right=5});
    obj.label42:setName("label42");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout39);
    obj.button16:setAlign("left");
    obj.button16:setLeft(5);
    obj.button16:setText("Rolar");
    obj.button16:setWidth(50);
    obj.button16:setName("button16");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout33);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(20);
    obj.layout40:setMargins({bottom=2, top=15});
    obj.layout40:setName("layout40");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout40);
    obj.checkBox8:setWidth(17);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setMargins({right=2});
    obj.checkBox8:setField("periciacheck.dirigir");
    obj.checkBox8:setName("checkBox8");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout40);
    obj.label43:setAlign("left");
    obj.label43:setWidth(120);
    obj.label43:setText("Dirigir Auto:");
    obj.label43:setHorzTextAlign("trailing");
    obj.label43:setMargins({right=5});
    obj.label43:setName("label43");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout40);
    obj.edit29:setType("number");
    obj.edit29:setMin(20);
    obj.edit29:setAlign("left");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(14);
    obj.edit29:setWidth(50);
    obj.edit29:setField("pericia.dirigir");
    obj.edit29:setName("edit29");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout40);
    obj.label44:setAlign("left");
    obj.label44:setWidth(5);
    obj.label44:setText("");
    obj.label44:setHorzTextAlign("trailing");
    obj.label44:setMargins({right=5});
    obj.label44:setName("label44");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout40);
    obj.button17:setAlign("left");
    obj.button17:setLeft(5);
    obj.button17:setText("Rolar");
    obj.button17:setWidth(50);
    obj.button17:setName("button17");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout33);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(20);
    obj.layout41:setMargins({bottom=2, top=15});
    obj.layout41:setName("layout41");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout41);
    obj.checkBox9:setWidth(17);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setMargins({right=2});
    obj.checkBox9:setField("periciacheck.disfarces");
    obj.checkBox9:setName("checkBox9");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout41);
    obj.label45:setAlign("left");
    obj.label45:setWidth(120);
    obj.label45:setText("Disfarces:");
    obj.label45:setHorzTextAlign("trailing");
    obj.label45:setMargins({right=5});
    obj.label45:setName("label45");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout41);
    obj.edit30:setType("number");
    obj.edit30:setMin(05);
    obj.edit30:setAlign("left");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(14);
    obj.edit30:setWidth(50);
    obj.edit30:setField("pericia.disfarces");
    obj.edit30:setName("edit30");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout41);
    obj.label46:setAlign("left");
    obj.label46:setWidth(5);
    obj.label46:setText("");
    obj.label46:setHorzTextAlign("trailing");
    obj.label46:setMargins({right=5});
    obj.label46:setName("label46");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout41);
    obj.button18:setAlign("left");
    obj.button18:setLeft(5);
    obj.button18:setText("Rolar");
    obj.button18:setWidth(50);
    obj.button18:setName("button18");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout33);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(20);
    obj.layout42:setMargins({bottom=2, top=15});
    obj.layout42:setName("layout42");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout42);
    obj.checkBox10:setWidth(17);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setMargins({right=2});
    obj.checkBox10:setField("periciacheck.navegacao");
    obj.checkBox10:setName("checkBox10");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout42);
    obj.label47:setAlign("left");
    obj.label47:setWidth(120);
    obj.label47:setText("Navegação:");
    obj.label47:setHorzTextAlign("trailing");
    obj.label47:setMargins({right=5});
    obj.label47:setName("label47");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout42);
    obj.edit31:setType("number");
    obj.edit31:setMin(10);
    obj.edit31:setAlign("left");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(14);
    obj.edit31:setWidth(50);
    obj.edit31:setField("pericia.navegacao");
    obj.edit31:setName("edit31");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout42);
    obj.label48:setAlign("left");
    obj.label48:setWidth(5);
    obj.label48:setText("");
    obj.label48:setHorzTextAlign("trailing");
    obj.label48:setMargins({right=5});
    obj.label48:setName("label48");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout42);
    obj.button19:setAlign("left");
    obj.button19:setLeft(5);
    obj.button19:setText("Rolar");
    obj.button19:setWidth(50);
    obj.button19:setName("button19");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout33);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(20);
    obj.layout43:setMargins({bottom=2, top=15});
    obj.layout43:setName("layout43");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout43);
    obj.checkBox11:setWidth(17);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setMargins({right=2});
    obj.checkBox11:setField("periciacheck.ocultismo");
    obj.checkBox11:setName("checkBox11");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout43);
    obj.label49:setAlign("left");
    obj.label49:setWidth(120);
    obj.label49:setText("Ocultismo :");
    obj.label49:setHorzTextAlign("trailing");
    obj.label49:setMargins({right=5});
    obj.label49:setName("label49");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout43);
    obj.edit32:setType("number");
    obj.edit32:setMin(05);
    obj.edit32:setAlign("left");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(14);
    obj.edit32:setWidth(50);
    obj.edit32:setField("pericia.ocultismo");
    obj.edit32:setName("edit32");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout43);
    obj.label50:setAlign("left");
    obj.label50:setWidth(5);
    obj.label50:setText("");
    obj.label50:setHorzTextAlign("trailing");
    obj.label50:setMargins({right=5});
    obj.label50:setName("label50");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout43);
    obj.button20:setAlign("left");
    obj.button20:setLeft(5);
    obj.button20:setText("Rolar");
    obj.button20:setWidth(50);
    obj.button20:setName("button20");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout33);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(20);
    obj.layout44:setMargins({bottom=2, top=15});
    obj.layout44:setName("layout44");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout44);
    obj.checkBox12:setWidth(17);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setMargins({right=2});
    obj.checkBox12:setField("periciacheck.opMaquinario");
    obj.checkBox12:setName("checkBox12");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout44);
    obj.label51:setAlign("left");
    obj.label51:setWidth(120);
    obj.label51:setText("Op. Maquinario:");
    obj.label51:setHorzTextAlign("trailing");
    obj.label51:setMargins({right=5});
    obj.label51:setName("label51");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout44);
    obj.edit33:setType("number");
    obj.edit33:setMin(10);
    obj.edit33:setAlign("left");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(14);
    obj.edit33:setWidth(50);
    obj.edit33:setField("pericia.opMaquinario");
    obj.edit33:setName("edit33");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout44);
    obj.label52:setAlign("left");
    obj.label52:setWidth(5);
    obj.label52:setText("");
    obj.label52:setHorzTextAlign("trailing");
    obj.label52:setMargins({right=5});
    obj.label52:setName("label52");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout44);
    obj.button21:setAlign("left");
    obj.button21:setLeft(5);
    obj.button21:setText("Rolar");
    obj.button21:setWidth(50);
    obj.button21:setName("button21");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout33);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(20);
    obj.layout45:setMargins({bottom=2, top=15});
    obj.layout45:setName("layout45");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout45);
    obj.checkBox13:setWidth(17);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setMargins({right=2});
    obj.checkBox13:setField("periciacheck.prestidigitacao");
    obj.checkBox13:setName("checkBox13");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout45);
    obj.label53:setAlign("left");
    obj.label53:setWidth(120);
    obj.label53:setText("Prestidigitação:");
    obj.label53:setHorzTextAlign("trailing");
    obj.label53:setMargins({right=5});
    obj.label53:setName("label53");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout45);
    obj.edit34:setType("number");
    obj.edit34:setMin(10);
    obj.edit34:setAlign("left");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(14);
    obj.edit34:setWidth(50);
    obj.edit34:setField("pericia.prestidigitacao");
    obj.edit34:setName("edit34");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout45);
    obj.label54:setAlign("left");
    obj.label54:setWidth(5);
    obj.label54:setText("");
    obj.label54:setHorzTextAlign("trailing");
    obj.label54:setMargins({right=5});
    obj.label54:setName("label54");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout45);
    obj.button22:setAlign("left");
    obj.button22:setLeft(5);
    obj.button22:setText("Rolar");
    obj.button22:setWidth(50);
    obj.button22:setName("button22");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout33);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(20);
    obj.layout46:setMargins({bottom=2, top=15});
    obj.layout46:setName("layout46");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout46);
    obj.checkBox14:setWidth(17);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setMargins({right=2});
    obj.checkBox14:setField("periciacheck.rastrear");
    obj.checkBox14:setName("checkBox14");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout46);
    obj.label55:setAlign("left");
    obj.label55:setWidth(120);
    obj.label55:setText("Rastrear:");
    obj.label55:setHorzTextAlign("trailing");
    obj.label55:setMargins({right=5});
    obj.label55:setName("label55");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout46);
    obj.edit35:setType("number");
    obj.edit35:setMin(10);
    obj.edit35:setAlign("left");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(14);
    obj.edit35:setWidth(50);
    obj.edit35:setField("pericia.rastrear");
    obj.edit35:setName("edit35");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout46);
    obj.label56:setAlign("left");
    obj.label56:setWidth(5);
    obj.label56:setText("");
    obj.label56:setHorzTextAlign("trailing");
    obj.label56:setMargins({right=5});
    obj.label56:setName("label56");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout46);
    obj.button23:setAlign("left");
    obj.button23:setLeft(5);
    obj.button23:setText("Rolar");
    obj.button23:setWidth(50);
    obj.button23:setName("button23");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout33);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(20);
    obj.layout47:setMargins({bottom=2, top=15});
    obj.layout47:setName("layout47");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout47);
    obj.checkBox15:setWidth(17);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setMargins({right=2});
    obj.checkBox15:setField("periciacheck.priSocorros");
    obj.checkBox15:setName("checkBox15");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout47);
    obj.label57:setAlign("left");
    obj.label57:setWidth(120);
    obj.label57:setText("Primeiros Socorros:");
    obj.label57:setHorzTextAlign("trailing");
    obj.label57:setMargins({right=5});
    obj.label57:setName("label57");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout47);
    obj.edit36:setType("number");
    obj.edit36:setMin(30);
    obj.edit36:setAlign("left");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(14);
    obj.edit36:setWidth(50);
    obj.edit36:setField("pericia.priSocorros");
    obj.edit36:setName("edit36");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout47);
    obj.label58:setAlign("left");
    obj.label58:setWidth(5);
    obj.label58:setText("");
    obj.label58:setHorzTextAlign("trailing");
    obj.label58:setMargins({right=5});
    obj.label58:setName("label58");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout47);
    obj.button24:setAlign("left");
    obj.button24:setLeft(5);
    obj.button24:setText("Rolar");
    obj.button24:setWidth(50);
    obj.button24:setName("button24");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout33);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(20);
    obj.layout48:setMargins({bottom=2, top=15});
    obj.layout48:setName("layout48");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout48);
    obj.label59:setAlign("left");
    obj.label59:setWidth(14);
    obj.label59:setText(" ");
    obj.label59:setHorzTextAlign("trailing");
    obj.label59:setMargins({right=5});
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout48);
    obj.label60:setAlign("left");
    obj.label60:setWidth(120);
    obj.label60:setText("Sobrevivência:");
    obj.label60:setHorzTextAlign("trailing");
    obj.label60:setMargins({right=5});
    obj.label60:setName("label60");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout48);
    obj.edit37:setType("number");
    obj.edit37:setAsNumber(10);
    obj.edit37:setAlign("left");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(14);
    obj.edit37:setWidth(50);
    obj.edit37:setReadOnly(true);
    obj.edit37:setName("edit37");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout48);
    obj.label61:setAlign("left");
    obj.label61:setWidth(5);
    obj.label61:setText("");
    obj.label61:setHorzTextAlign("trailing");
    obj.label61:setMargins({right=5});
    obj.label61:setName("label61");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout33);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(20);
    obj.layout49:setMargins({bottom=2, top=15});
    obj.layout49:setName("layout49");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout49);
    obj.checkBox16:setWidth(17);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setMargins({right=2});
    obj.checkBox16:setField("periciacheck.sobre1");
    obj.checkBox16:setName("checkBox16");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout49);
    obj.edit38:setAlign("left");
    obj.edit38:setHorzTextAlign("trailing");
    obj.edit38:setFontSize(14);
    obj.edit38:setWidth(120);
    obj.edit38:setField("pericia.nome.sobre1");
    obj.edit38:setMargins({right=5});
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout49);
    obj.edit39:setType("number");
    obj.edit39:setMin(10);
    obj.edit39:setAlign("left");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(14);
    obj.edit39:setWidth(50);
    obj.edit39:setField("pericia.sobre1");
    obj.edit39:setName("edit39");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout49);
    obj.label62:setAlign("left");
    obj.label62:setWidth(5);
    obj.label62:setText("");
    obj.label62:setHorzTextAlign("trailing");
    obj.label62:setMargins({right=5});
    obj.label62:setName("label62");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout49);
    obj.button25:setAlign("left");
    obj.button25:setLeft(5);
    obj.button25:setText("Rolar");
    obj.button25:setWidth(50);
    obj.button25:setName("button25");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout33);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(20);
    obj.layout50:setMargins({bottom=2, top=15});
    obj.layout50:setName("layout50");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout50);
    obj.checkBox17:setWidth(17);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setMargins({right=2});
    obj.checkBox17:setField("periciacheck.sobre2");
    obj.checkBox17:setName("checkBox17");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout50);
    obj.edit40:setAlign("left");
    obj.edit40:setHorzTextAlign("trailing");
    obj.edit40:setFontSize(14);
    obj.edit40:setWidth(120);
    obj.edit40:setField("pericia.nome.sobre2");
    obj.edit40:setMargins({right=5});
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout50);
    obj.edit41:setType("number");
    obj.edit41:setMin(10);
    obj.edit41:setAlign("left");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(14);
    obj.edit41:setWidth(50);
    obj.edit41:setField("pericia.sobre2");
    obj.edit41:setName("edit41");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout50);
    obj.label63:setAlign("left");
    obj.label63:setWidth(5);
    obj.label63:setText("");
    obj.label63:setHorzTextAlign("trailing");
    obj.label63:setMargins({right=5});
    obj.label63:setName("label63");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout50);
    obj.button26:setAlign("left");
    obj.button26:setLeft(5);
    obj.button26:setText("Rolar");
    obj.button26:setWidth(50);
    obj.button26:setName("button26");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout33);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(20);
    obj.layout51:setMargins({bottom=2, top=15});
    obj.layout51:setName("layout51");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout51);
    obj.checkBox18:setWidth(17);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setMargins({right=2});
    obj.checkBox18:setField("periciacheck.sobre3");
    obj.checkBox18:setName("checkBox18");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout51);
    obj.edit42:setAlign("left");
    obj.edit42:setHorzTextAlign("trailing");
    obj.edit42:setFontSize(14);
    obj.edit42:setWidth(120);
    obj.edit42:setField("pericia.nome.sobre3");
    obj.edit42:setMargins({right=5});
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout51);
    obj.edit43:setType("number");
    obj.edit43:setMin(10);
    obj.edit43:setAlign("left");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(14);
    obj.edit43:setWidth(50);
    obj.edit43:setField("pericia.sobre3");
    obj.edit43:setName("edit43");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout51);
    obj.label64:setAlign("left");
    obj.label64:setWidth(5);
    obj.label64:setText("");
    obj.label64:setHorzTextAlign("trailing");
    obj.label64:setMargins({right=5});
    obj.label64:setName("label64");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout51);
    obj.button27:setAlign("left");
    obj.button27:setLeft(5);
    obj.button27:setText("Rolar");
    obj.button27:setWidth(50);
    obj.button27:setName("button27");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout33);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(20);
    obj.layout52:setMargins({bottom=2, top=15});
    obj.layout52:setName("layout52");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout52);
    obj.checkBox19:setWidth(17);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setMargins({right=2});
    obj.checkBox19:setField("periciacheck.usaBiblioteca");
    obj.checkBox19:setName("checkBox19");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout52);
    obj.label65:setAlign("left");
    obj.label65:setWidth(120);
    obj.label65:setText("Usar Bibliotecas:");
    obj.label65:setHorzTextAlign("trailing");
    obj.label65:setMargins({right=5});
    obj.label65:setName("label65");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout52);
    obj.edit44:setType("number");
    obj.edit44:setMin(20);
    obj.edit44:setAlign("left");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(14);
    obj.edit44:setWidth(50);
    obj.edit44:setField("pericia.usaBiblioteca");
    obj.edit44:setName("edit44");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout52);
    obj.label66:setAlign("left");
    obj.label66:setWidth(5);
    obj.label66:setText("");
    obj.label66:setHorzTextAlign("trailing");
    obj.label66:setMargins({right=5});
    obj.label66:setName("label66");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout52);
    obj.button28:setAlign("left");
    obj.button28:setLeft(5);
    obj.button28:setText("Rolar");
    obj.button28:setWidth(50);
    obj.button28:setName("button28");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout33);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(20);
    obj.layout53:setMargins({bottom=2, top=15});
    obj.layout53:setName("layout53");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout53);
    obj.checkBox20:setWidth(17);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setMargins({right=2});
    obj.checkBox20:setField("periciacheck.usarComputadores");
    obj.checkBox20:setName("checkBox20");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout53);
    obj.label67:setAlign("left");
    obj.label67:setWidth(120);
    obj.label67:setText("Usar Computadores:");
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setMargins({right=5});
    obj.label67:setName("label67");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout53);
    obj.edit45:setType("number");
    obj.edit45:setMin(05);
    obj.edit45:setAlign("left");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(14);
    obj.edit45:setWidth(50);
    obj.edit45:setField("pericia.usarComputadores");
    obj.edit45:setName("edit45");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout53);
    obj.label68:setAlign("left");
    obj.label68:setWidth(5);
    obj.label68:setText("");
    obj.label68:setHorzTextAlign("trailing");
    obj.label68:setMargins({right=5});
    obj.label68:setName("label68");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout53);
    obj.button29:setAlign("left");
    obj.button29:setLeft(5);
    obj.button29:setText("Rolar");
    obj.button29:setWidth(50);
    obj.button29:setName("button29");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout33);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(20);
    obj.layout54:setMargins({bottom=2, top=15});
    obj.layout54:setName("layout54");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout54);
    obj.label69:setAlign("left");
    obj.label69:setWidth(14);
    obj.label69:setText(" ");
    obj.label69:setHorzTextAlign("trailing");
    obj.label69:setMargins({right=5});
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout54);
    obj.label70:setAlign("left");
    obj.label70:setWidth(120);
    obj.label70:setText("Outros:");
    obj.label70:setHorzTextAlign("trailing");
    obj.label70:setMargins({right=5});
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout54);
    obj.label71:setAlign("left");
    obj.label71:setWidth(5);
    obj.label71:setText("");
    obj.label71:setHorzTextAlign("trailing");
    obj.label71:setMargins({right=5});
    obj.label71:setName("label71");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout33);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(20);
    obj.layout55:setMargins({bottom=2, top=15});
    obj.layout55:setName("layout55");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout55);
    obj.checkBox21:setWidth(17);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setMargins({right=2});
    obj.checkBox21:setField("periciacheck.outro4");
    obj.checkBox21:setName("checkBox21");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout55);
    obj.edit46:setAlign("left");
    obj.edit46:setHorzTextAlign("trailing");
    obj.edit46:setFontSize(14);
    obj.edit46:setWidth(120);
    obj.edit46:setField("pericia.nome.outro4");
    obj.edit46:setMargins({right=5});
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout55);
    obj.edit47:setType("number");
    obj.edit47:setMin(00);
    obj.edit47:setAlign("left");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(14);
    obj.edit47:setWidth(50);
    obj.edit47:setField("pericia.outro4");
    obj.edit47:setName("edit47");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout55);
    obj.label72:setAlign("left");
    obj.label72:setWidth(5);
    obj.label72:setText("");
    obj.label72:setHorzTextAlign("trailing");
    obj.label72:setMargins({right=5});
    obj.label72:setName("label72");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout55);
    obj.button30:setAlign("left");
    obj.button30:setLeft(5);
    obj.button30:setText("Rolar");
    obj.button30:setWidth(50);
    obj.button30:setName("button30");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout33);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(20);
    obj.layout56:setMargins({bottom=2, top=15});
    obj.layout56:setName("layout56");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout56);
    obj.checkBox22:setWidth(17);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setMargins({right=2});
    obj.checkBox22:setField("periciacheck.outro5");
    obj.checkBox22:setName("checkBox22");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout56);
    obj.edit48:setAlign("left");
    obj.edit48:setHorzTextAlign("trailing");
    obj.edit48:setFontSize(14);
    obj.edit48:setWidth(120);
    obj.edit48:setField("pericia.nome.outro5");
    obj.edit48:setMargins({right=5});
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout56);
    obj.edit49:setType("number");
    obj.edit49:setMin(00);
    obj.edit49:setAlign("left");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(14);
    obj.edit49:setWidth(50);
    obj.edit49:setField("pericia.outro5");
    obj.edit49:setName("edit49");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout56);
    obj.label73:setAlign("left");
    obj.label73:setWidth(5);
    obj.label73:setText("");
    obj.label73:setHorzTextAlign("trailing");
    obj.label73:setMargins({right=5});
    obj.label73:setName("label73");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout56);
    obj.button31:setAlign("left");
    obj.button31:setLeft(5);
    obj.button31:setText("Rolar");
    obj.button31:setWidth(50);
    obj.button31:setName("button31");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout33);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(20);
    obj.layout57:setMargins({bottom=2, top=15});
    obj.layout57:setName("layout57");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout57);
    obj.checkBox23:setWidth(17);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setMargins({right=2});
    obj.checkBox23:setField("periciacheck.outro6");
    obj.checkBox23:setName("checkBox23");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout57);
    obj.edit50:setAlign("left");
    obj.edit50:setHorzTextAlign("trailing");
    obj.edit50:setFontSize(14);
    obj.edit50:setWidth(120);
    obj.edit50:setField("pericia.nome.outro6");
    obj.edit50:setMargins({right=5});
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout57);
    obj.edit51:setType("number");
    obj.edit51:setMin(00);
    obj.edit51:setAlign("left");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontSize(14);
    obj.edit51:setWidth(50);
    obj.edit51:setField("pericia.outro6");
    obj.edit51:setName("edit51");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout57);
    obj.label74:setAlign("left");
    obj.label74:setWidth(5);
    obj.label74:setText("");
    obj.label74:setHorzTextAlign("trailing");
    obj.label74:setMargins({right=5});
    obj.label74:setName("label74");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout57);
    obj.button32:setAlign("left");
    obj.button32:setLeft(5);
    obj.button32:setText("Rolar");
    obj.button32:setWidth(50);
    obj.button32:setName("button32");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout33);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(20);
    obj.layout58:setMargins({bottom=2, top=15});
    obj.layout58:setName("layout58");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout58);
    obj.checkBox24:setWidth(17);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setMargins({right=2});
    obj.checkBox24:setField("periciacheck.outro7");
    obj.checkBox24:setName("checkBox24");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout58);
    obj.edit52:setAlign("left");
    obj.edit52:setHorzTextAlign("trailing");
    obj.edit52:setFontSize(14);
    obj.edit52:setWidth(120);
    obj.edit52:setField("pericia.nome.outro7");
    obj.edit52:setMargins({right=5});
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout58);
    obj.edit53:setType("number");
    obj.edit53:setMin(00);
    obj.edit53:setAlign("left");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontSize(14);
    obj.edit53:setWidth(50);
    obj.edit53:setField("pericia.outro7");
    obj.edit53:setName("edit53");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout58);
    obj.label75:setAlign("left");
    obj.label75:setWidth(5);
    obj.label75:setText("");
    obj.label75:setHorzTextAlign("trailing");
    obj.label75:setMargins({right=5});
    obj.label75:setName("label75");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout58);
    obj.button33:setAlign("left");
    obj.button33:setLeft(5);
    obj.button33:setText("Rolar");
    obj.button33:setWidth(50);
    obj.button33:setName("button33");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox1);
    obj.layout59:setAlign("none");
    obj.layout59:setLeft(337);
    obj.layout59:setHeight(984);
    obj.layout59:setWidth(332);
    obj.layout59:setTop(325);
    obj.layout59:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout59:setMargins({left=30, right=10, bottom=10});
    obj.layout59:setName("layout59");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout59);
    obj.label76:setText("Arte/Oficios/Idioma/Pilotar/Incomuns");
    obj.label76:setLeft(45);
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold italic");
    obj.label76:setTop(9);
    obj.label76:setWidth(1343);
    obj.label76:setName("label76");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setLeft(20);
    obj.layout60:setTop(25);
    obj.layout60:setWidth(270);
    obj.layout60:setHeight(984);
    obj.layout60:setName("layout60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(20);
    obj.layout61:setMargins({bottom=2, top=15});
    obj.layout61:setName("layout61");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout61);
    obj.label77:setAlign("left");
    obj.label77:setWidth(14);
    obj.label77:setText(" ");
    obj.label77:setHorzTextAlign("trailing");
    obj.label77:setMargins({right=5});
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout61);
    obj.label78:setAlign("left");
    obj.label78:setWidth(120);
    obj.label78:setText("Arte/Oficio:");
    obj.label78:setHorzTextAlign("trailing");
    obj.label78:setMargins({right=5});
    obj.label78:setName("label78");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout61);
    obj.edit54:setType("number");
    obj.edit54:setAsNumber(05);
    obj.edit54:setAlign("left");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(14);
    obj.edit54:setWidth(50);
    obj.edit54:setReadOnly(true);
    obj.edit54:setName("edit54");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout61);
    obj.label79:setAlign("left");
    obj.label79:setWidth(5);
    obj.label79:setText("");
    obj.label79:setHorzTextAlign("trailing");
    obj.label79:setMargins({right=5});
    obj.label79:setName("label79");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout60);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(20);
    obj.layout62:setMargins({bottom=2, top=15});
    obj.layout62:setName("layout62");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout62);
    obj.checkBox25:setWidth(17);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setMargins({right=2});
    obj.checkBox25:setField("periciacheck.arteO1");
    obj.checkBox25:setName("checkBox25");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout62);
    obj.edit55:setAlign("left");
    obj.edit55:setHorzTextAlign("trailing");
    obj.edit55:setFontSize(14);
    obj.edit55:setWidth(120);
    obj.edit55:setField("pericia.nome.arteO1");
    obj.edit55:setMargins({right=5});
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout62);
    obj.edit56:setType("number");
    obj.edit56:setMin(05);
    obj.edit56:setAlign("left");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(14);
    obj.edit56:setWidth(50);
    obj.edit56:setField("pericia.arteO1");
    obj.edit56:setName("edit56");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout62);
    obj.label80:setAlign("left");
    obj.label80:setWidth(5);
    obj.label80:setText("");
    obj.label80:setHorzTextAlign("trailing");
    obj.label80:setMargins({right=5});
    obj.label80:setName("label80");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout62);
    obj.button34:setAlign("left");
    obj.button34:setLeft(5);
    obj.button34:setText("Rolar");
    obj.button34:setWidth(50);
    obj.button34:setName("button34");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout60);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(20);
    obj.layout63:setMargins({bottom=2, top=15});
    obj.layout63:setName("layout63");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout63);
    obj.checkBox26:setWidth(17);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setMargins({right=2});
    obj.checkBox26:setField("periciacheck.arteO2");
    obj.checkBox26:setName("checkBox26");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout63);
    obj.edit57:setAlign("left");
    obj.edit57:setHorzTextAlign("trailing");
    obj.edit57:setFontSize(14);
    obj.edit57:setWidth(120);
    obj.edit57:setField("pericia.nome.arteO2");
    obj.edit57:setMargins({right=5});
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout63);
    obj.edit58:setType("number");
    obj.edit58:setMin(05);
    obj.edit58:setAlign("left");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(14);
    obj.edit58:setWidth(50);
    obj.edit58:setField("pericia.arteO2");
    obj.edit58:setName("edit58");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout63);
    obj.label81:setAlign("left");
    obj.label81:setWidth(5);
    obj.label81:setText("");
    obj.label81:setHorzTextAlign("trailing");
    obj.label81:setMargins({right=5});
    obj.label81:setName("label81");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout63);
    obj.button35:setAlign("left");
    obj.button35:setLeft(5);
    obj.button35:setText("Rolar");
    obj.button35:setWidth(50);
    obj.button35:setName("button35");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout60);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(20);
    obj.layout64:setMargins({bottom=2, top=15});
    obj.layout64:setName("layout64");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout64);
    obj.checkBox27:setWidth(17);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setMargins({right=2});
    obj.checkBox27:setField("periciacheck.arteO3");
    obj.checkBox27:setName("checkBox27");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout64);
    obj.edit59:setAlign("left");
    obj.edit59:setHorzTextAlign("trailing");
    obj.edit59:setFontSize(14);
    obj.edit59:setWidth(120);
    obj.edit59:setField("pericia.nome.arteO3");
    obj.edit59:setMargins({right=5});
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout64);
    obj.edit60:setType("number");
    obj.edit60:setMin(05);
    obj.edit60:setAlign("left");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(14);
    obj.edit60:setWidth(50);
    obj.edit60:setField("pericia.arteO3");
    obj.edit60:setName("edit60");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout64);
    obj.label82:setAlign("left");
    obj.label82:setWidth(5);
    obj.label82:setText("");
    obj.label82:setHorzTextAlign("trailing");
    obj.label82:setMargins({right=5});
    obj.label82:setName("label82");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout64);
    obj.button36:setAlign("left");
    obj.button36:setLeft(5);
    obj.button36:setText("Rolar");
    obj.button36:setWidth(50);
    obj.button36:setName("button36");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout60);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(20);
    obj.layout65:setMargins({bottom=2, top=15});
    obj.layout65:setName("layout65");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout65);
    obj.checkBox28:setWidth(17);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setMargins({right=2});
    obj.checkBox28:setField("periciacheck.arteO4");
    obj.checkBox28:setName("checkBox28");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout65);
    obj.edit61:setAlign("left");
    obj.edit61:setHorzTextAlign("trailing");
    obj.edit61:setFontSize(14);
    obj.edit61:setWidth(120);
    obj.edit61:setField("pericia.nome.arteO4");
    obj.edit61:setMargins({right=5});
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout65);
    obj.edit62:setType("number");
    obj.edit62:setMin(05);
    obj.edit62:setAlign("left");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(14);
    obj.edit62:setWidth(50);
    obj.edit62:setField("pericia.arteO4");
    obj.edit62:setName("edit62");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout65);
    obj.label83:setAlign("left");
    obj.label83:setWidth(5);
    obj.label83:setText("");
    obj.label83:setHorzTextAlign("trailing");
    obj.label83:setMargins({right=5});
    obj.label83:setName("label83");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout65);
    obj.button37:setAlign("left");
    obj.button37:setLeft(5);
    obj.button37:setText("Rolar");
    obj.button37:setWidth(50);
    obj.button37:setName("button37");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout60);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(20);
    obj.layout66:setMargins({bottom=2, top=15});
    obj.layout66:setName("layout66");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout66);
    obj.checkBox29:setWidth(17);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setMargins({right=2});
    obj.checkBox29:setField("periciacheck.idioma1");
    obj.checkBox29:setName("checkBox29");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout66);
    obj.label84:setAlign("left");
    obj.label84:setWidth(120);
    obj.label84:setText("Idioma (NAT) EDU:");
    obj.label84:setHorzTextAlign("trailing");
    obj.label84:setMargins({right=5});
    obj.label84:setName("label84");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout66);
    obj.edit63:setType("number");
    obj.edit63:setMin(00);
    obj.edit63:setAlign("left");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(14);
    obj.edit63:setWidth(50);
    obj.edit63:setField("pericia.idioma1");
    obj.edit63:setName("edit63");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout66);
    obj.label85:setAlign("left");
    obj.label85:setWidth(5);
    obj.label85:setText("");
    obj.label85:setHorzTextAlign("trailing");
    obj.label85:setMargins({right=5});
    obj.label85:setName("label85");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout66);
    obj.button38:setAlign("left");
    obj.button38:setLeft(5);
    obj.button38:setText("Rolar");
    obj.button38:setWidth(50);
    obj.button38:setName("button38");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout60);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(20);
    obj.layout67:setMargins({bottom=2, top=15});
    obj.layout67:setName("layout67");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout67);
    obj.checkBox30:setWidth(17);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setMargins({right=2});
    obj.checkBox30:setField("periciacheck.idioma2");
    obj.checkBox30:setName("checkBox30");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout67);
    obj.edit64:setAlign("left");
    obj.edit64:setHorzTextAlign("trailing");
    obj.edit64:setFontSize(14);
    obj.edit64:setWidth(120);
    obj.edit64:setField("pericia.nome.idioma2");
    obj.edit64:setMargins({right=5});
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout67);
    obj.edit65:setType("number");
    obj.edit65:setMin(01);
    obj.edit65:setAlign("left");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(14);
    obj.edit65:setWidth(50);
    obj.edit65:setField("pericia.idioma2");
    obj.edit65:setName("edit65");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout67);
    obj.label86:setAlign("left");
    obj.label86:setWidth(5);
    obj.label86:setText("");
    obj.label86:setHorzTextAlign("trailing");
    obj.label86:setMargins({right=5});
    obj.label86:setName("label86");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout67);
    obj.button39:setAlign("left");
    obj.button39:setLeft(5);
    obj.button39:setText("Rolar");
    obj.button39:setWidth(50);
    obj.button39:setName("button39");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout60);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(20);
    obj.layout68:setMargins({bottom=2, top=15});
    obj.layout68:setName("layout68");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout68);
    obj.checkBox31:setWidth(17);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setMargins({right=2});
    obj.checkBox31:setField("periciacheck.idioma3");
    obj.checkBox31:setName("checkBox31");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout68);
    obj.edit66:setAlign("left");
    obj.edit66:setHorzTextAlign("trailing");
    obj.edit66:setFontSize(14);
    obj.edit66:setWidth(120);
    obj.edit66:setField("pericia.nome.idioma3");
    obj.edit66:setMargins({right=5});
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout68);
    obj.edit67:setType("number");
    obj.edit67:setMin(01);
    obj.edit67:setAlign("left");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(14);
    obj.edit67:setWidth(50);
    obj.edit67:setField("pericia.idioma3");
    obj.edit67:setName("edit67");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout68);
    obj.label87:setAlign("left");
    obj.label87:setWidth(5);
    obj.label87:setText("");
    obj.label87:setHorzTextAlign("trailing");
    obj.label87:setMargins({right=5});
    obj.label87:setName("label87");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout68);
    obj.button40:setAlign("left");
    obj.button40:setLeft(5);
    obj.button40:setText("Rolar");
    obj.button40:setWidth(50);
    obj.button40:setName("button40");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout60);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(20);
    obj.layout69:setMargins({bottom=2, top=15});
    obj.layout69:setName("layout69");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout69);
    obj.checkBox32:setWidth(17);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setMargins({right=2});
    obj.checkBox32:setField("periciacheck.idioma4");
    obj.checkBox32:setName("checkBox32");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout69);
    obj.edit68:setAlign("left");
    obj.edit68:setHorzTextAlign("trailing");
    obj.edit68:setFontSize(14);
    obj.edit68:setWidth(120);
    obj.edit68:setField("pericia.nome.idioma4");
    obj.edit68:setMargins({right=5});
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout69);
    obj.edit69:setType("number");
    obj.edit69:setMin(01);
    obj.edit69:setAlign("left");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(14);
    obj.edit69:setWidth(50);
    obj.edit69:setField("pericia.idioma4");
    obj.edit69:setName("edit69");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout69);
    obj.label88:setAlign("left");
    obj.label88:setWidth(5);
    obj.label88:setText("");
    obj.label88:setHorzTextAlign("trailing");
    obj.label88:setMargins({right=5});
    obj.label88:setName("label88");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout69);
    obj.button41:setAlign("left");
    obj.button41:setLeft(5);
    obj.button41:setText("Rolar");
    obj.button41:setWidth(50);
    obj.button41:setName("button41");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout60);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(20);
    obj.layout70:setMargins({bottom=2, top=15});
    obj.layout70:setName("layout70");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout70);
    obj.checkBox33:setWidth(17);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setMargins({right=2});
    obj.checkBox33:setField("periciacheck.idioma5");
    obj.checkBox33:setName("checkBox33");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout70);
    obj.edit70:setAlign("left");
    obj.edit70:setHorzTextAlign("trailing");
    obj.edit70:setFontSize(14);
    obj.edit70:setWidth(120);
    obj.edit70:setField("pericia.nome.idioma5");
    obj.edit70:setMargins({right=5});
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout70);
    obj.edit71:setType("number");
    obj.edit71:setMin(01);
    obj.edit71:setAlign("left");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(14);
    obj.edit71:setWidth(50);
    obj.edit71:setField("pericia.idioma5");
    obj.edit71:setName("edit71");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout70);
    obj.label89:setAlign("left");
    obj.label89:setWidth(5);
    obj.label89:setText("");
    obj.label89:setHorzTextAlign("trailing");
    obj.label89:setMargins({right=5});
    obj.label89:setName("label89");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout70);
    obj.button42:setAlign("left");
    obj.button42:setLeft(5);
    obj.button42:setText("Rolar");
    obj.button42:setWidth(50);
    obj.button42:setName("button42");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout60);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(20);
    obj.layout71:setMargins({bottom=2, top=15});
    obj.layout71:setName("layout71");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout71);
    obj.label90:setAlign("left");
    obj.label90:setWidth(14);
    obj.label90:setText(" ");
    obj.label90:setHorzTextAlign("trailing");
    obj.label90:setMargins({right=5});
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout71);
    obj.label91:setAlign("left");
    obj.label91:setWidth(120);
    obj.label91:setText("Pilotar:");
    obj.label91:setHorzTextAlign("trailing");
    obj.label91:setMargins({right=5});
    obj.label91:setName("label91");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout71);
    obj.edit72:setType("number");
    obj.edit72:setAsNumber(01);
    obj.edit72:setAlign("left");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(14);
    obj.edit72:setWidth(50);
    obj.edit72:setReadOnly(true);
    obj.edit72:setName("edit72");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout71);
    obj.label92:setAlign("left");
    obj.label92:setWidth(5);
    obj.label92:setText("");
    obj.label92:setHorzTextAlign("trailing");
    obj.label92:setMargins({right=5});
    obj.label92:setName("label92");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout60);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(20);
    obj.layout72:setMargins({bottom=2, top=15});
    obj.layout72:setName("layout72");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout72);
    obj.checkBox34:setWidth(17);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setMargins({right=2});
    obj.checkBox34:setField("periciacheck.pilotar1");
    obj.checkBox34:setName("checkBox34");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout72);
    obj.edit73:setAlign("left");
    obj.edit73:setHorzTextAlign("trailing");
    obj.edit73:setFontSize(14);
    obj.edit73:setWidth(120);
    obj.edit73:setField("pericia.nome.pilotar1");
    obj.edit73:setMargins({right=5});
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout72);
    obj.edit74:setType("number");
    obj.edit74:setMin(01);
    obj.edit74:setAlign("left");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontSize(14);
    obj.edit74:setWidth(50);
    obj.edit74:setField("pericia.pilotar1");
    obj.edit74:setName("edit74");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout72);
    obj.label93:setAlign("left");
    obj.label93:setWidth(5);
    obj.label93:setText("");
    obj.label93:setHorzTextAlign("trailing");
    obj.label93:setMargins({right=5});
    obj.label93:setName("label93");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout72);
    obj.button43:setAlign("left");
    obj.button43:setLeft(5);
    obj.button43:setText("Rolar");
    obj.button43:setWidth(50);
    obj.button43:setName("button43");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout60);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(20);
    obj.layout73:setMargins({bottom=2, top=15});
    obj.layout73:setName("layout73");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout73);
    obj.checkBox35:setWidth(17);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setMargins({right=2});
    obj.checkBox35:setField("periciacheck.pilotar2");
    obj.checkBox35:setName("checkBox35");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout73);
    obj.edit75:setAlign("left");
    obj.edit75:setHorzTextAlign("trailing");
    obj.edit75:setFontSize(14);
    obj.edit75:setWidth(120);
    obj.edit75:setField("pericia.nome.pilotar2");
    obj.edit75:setMargins({right=5});
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout73);
    obj.edit76:setType("number");
    obj.edit76:setMin(01);
    obj.edit76:setAlign("left");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(14);
    obj.edit76:setWidth(50);
    obj.edit76:setField("pericia.pilotar2");
    obj.edit76:setName("edit76");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout73);
    obj.label94:setAlign("left");
    obj.label94:setWidth(5);
    obj.label94:setText("");
    obj.label94:setHorzTextAlign("trailing");
    obj.label94:setMargins({right=5});
    obj.label94:setName("label94");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout73);
    obj.button44:setAlign("left");
    obj.button44:setLeft(5);
    obj.button44:setText("Rolar");
    obj.button44:setWidth(50);
    obj.button44:setName("button44");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout60);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(20);
    obj.layout74:setMargins({bottom=2, top=15});
    obj.layout74:setName("layout74");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout74);
    obj.checkBox36:setWidth(17);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setMargins({right=2});
    obj.checkBox36:setField("periciacheck.pilotar3");
    obj.checkBox36:setName("checkBox36");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout74);
    obj.edit77:setAlign("left");
    obj.edit77:setHorzTextAlign("trailing");
    obj.edit77:setFontSize(14);
    obj.edit77:setWidth(120);
    obj.edit77:setField("pericia.nome.pilotar3");
    obj.edit77:setMargins({right=5});
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout74);
    obj.edit78:setType("number");
    obj.edit78:setMin(01);
    obj.edit78:setAlign("left");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setFontSize(14);
    obj.edit78:setWidth(50);
    obj.edit78:setField("pericia.pilotar3");
    obj.edit78:setName("edit78");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout74);
    obj.label95:setAlign("left");
    obj.label95:setWidth(5);
    obj.label95:setText("");
    obj.label95:setHorzTextAlign("trailing");
    obj.label95:setMargins({right=5});
    obj.label95:setName("label95");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout74);
    obj.button45:setAlign("left");
    obj.button45:setLeft(5);
    obj.button45:setText("Rolar");
    obj.button45:setWidth(50);
    obj.button45:setName("button45");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout60);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(20);
    obj.layout75:setMargins({bottom=2, top=15});
    obj.layout75:setName("layout75");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout75);
    obj.label96:setAlign("left");
    obj.label96:setWidth(14);
    obj.label96:setText(" ");
    obj.label96:setHorzTextAlign("trailing");
    obj.label96:setMargins({right=5});
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout75);
    obj.label97:setAlign("left");
    obj.label97:setWidth(120);
    obj.label97:setText("Incomums:");
    obj.label97:setHorzTextAlign("trailing");
    obj.label97:setMargins({right=5});
    obj.label97:setName("label97");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout75);
    obj.edit79:setType("number");
    obj.edit79:setAsNumber(1);
    obj.edit79:setAlign("left");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(14);
    obj.edit79:setWidth(50);
    obj.edit79:setReadOnly(true);
    obj.edit79:setName("edit79");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout75);
    obj.label98:setAlign("left");
    obj.label98:setWidth(5);
    obj.label98:setText("");
    obj.label98:setHorzTextAlign("trailing");
    obj.label98:setMargins({right=5});
    obj.label98:setName("label98");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout60);
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(20);
    obj.layout76:setMargins({bottom=2, top=15});
    obj.layout76:setName("layout76");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout76);
    obj.checkBox37:setWidth(17);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setMargins({right=2});
    obj.checkBox37:setField("periciacheck.incomum1");
    obj.checkBox37:setName("checkBox37");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout76);
    obj.edit80:setAlign("left");
    obj.edit80:setHorzTextAlign("trailing");
    obj.edit80:setFontSize(14);
    obj.edit80:setWidth(120);
    obj.edit80:setField("pericia.nome.incomum1");
    obj.edit80:setMargins({right=5});
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout76);
    obj.edit81:setType("number");
    obj.edit81:setMin(1);
    obj.edit81:setAlign("left");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(14);
    obj.edit81:setWidth(50);
    obj.edit81:setField("pericia.incomum1");
    obj.edit81:setName("edit81");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout76);
    obj.label99:setAlign("left");
    obj.label99:setWidth(5);
    obj.label99:setText("");
    obj.label99:setHorzTextAlign("trailing");
    obj.label99:setMargins({right=5});
    obj.label99:setName("label99");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout76);
    obj.button46:setAlign("left");
    obj.button46:setLeft(5);
    obj.button46:setText("Rolar");
    obj.button46:setWidth(50);
    obj.button46:setName("button46");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout60);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(20);
    obj.layout77:setMargins({bottom=2, top=15});
    obj.layout77:setName("layout77");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout77);
    obj.checkBox38:setWidth(17);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setMargins({right=2});
    obj.checkBox38:setField("periciacheck.incomum2");
    obj.checkBox38:setName("checkBox38");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout77);
    obj.edit82:setAlign("left");
    obj.edit82:setHorzTextAlign("trailing");
    obj.edit82:setFontSize(14);
    obj.edit82:setWidth(120);
    obj.edit82:setField("pericia.nome.incomum2");
    obj.edit82:setMargins({right=5});
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout77);
    obj.edit83:setType("number");
    obj.edit83:setMin(1);
    obj.edit83:setAlign("left");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setFontSize(14);
    obj.edit83:setWidth(50);
    obj.edit83:setField("pericia.incomum2");
    obj.edit83:setName("edit83");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout77);
    obj.label100:setAlign("left");
    obj.label100:setWidth(5);
    obj.label100:setText("");
    obj.label100:setHorzTextAlign("trailing");
    obj.label100:setMargins({right=5});
    obj.label100:setName("label100");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout77);
    obj.button47:setAlign("left");
    obj.button47:setLeft(5);
    obj.button47:setText("Rolar");
    obj.button47:setWidth(50);
    obj.button47:setName("button47");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout60);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(20);
    obj.layout78:setMargins({bottom=2, top=15});
    obj.layout78:setName("layout78");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout78);
    obj.checkBox39:setWidth(17);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setMargins({right=2});
    obj.checkBox39:setField("periciacheck.incomum3");
    obj.checkBox39:setName("checkBox39");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout78);
    obj.edit84:setAlign("left");
    obj.edit84:setHorzTextAlign("trailing");
    obj.edit84:setFontSize(14);
    obj.edit84:setWidth(120);
    obj.edit84:setField("pericia.nome.incomum3");
    obj.edit84:setMargins({right=5});
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout78);
    obj.edit85:setType("number");
    obj.edit85:setMin(1);
    obj.edit85:setAlign("left");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setFontSize(14);
    obj.edit85:setWidth(50);
    obj.edit85:setField("pericia.incomum3");
    obj.edit85:setName("edit85");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout78);
    obj.label101:setAlign("left");
    obj.label101:setWidth(5);
    obj.label101:setText("");
    obj.label101:setHorzTextAlign("trailing");
    obj.label101:setMargins({right=5});
    obj.label101:setName("label101");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout78);
    obj.button48:setAlign("left");
    obj.button48:setLeft(5);
    obj.button48:setText("Rolar");
    obj.button48:setWidth(50);
    obj.button48:setName("button48");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout60);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(20);
    obj.layout79:setMargins({bottom=2, top=15});
    obj.layout79:setName("layout79");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout79);
    obj.label102:setAlign("left");
    obj.label102:setWidth(14);
    obj.label102:setText(" ");
    obj.label102:setHorzTextAlign("trailing");
    obj.label102:setMargins({right=5});
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout79);
    obj.label103:setAlign("left");
    obj.label103:setWidth(120);
    obj.label103:setText("Conhecimentos:");
    obj.label103:setHorzTextAlign("trailing");
    obj.label103:setMargins({right=5});
    obj.label103:setName("label103");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout79);
    obj.edit86:setType("number");
    obj.edit86:setAsNumber(1);
    obj.edit86:setAlign("left");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setFontSize(14);
    obj.edit86:setWidth(50);
    obj.edit86:setReadOnly(true);
    obj.edit86:setName("edit86");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout79);
    obj.label104:setAlign("left");
    obj.label104:setWidth(5);
    obj.label104:setText("");
    obj.label104:setHorzTextAlign("trailing");
    obj.label104:setMargins({right=5});
    obj.label104:setName("label104");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout60);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(20);
    obj.layout80:setMargins({bottom=2, top=15});
    obj.layout80:setName("layout80");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout80);
    obj.checkBox40:setWidth(17);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setMargins({right=2});
    obj.checkBox40:setField("periciacheck.outro8");
    obj.checkBox40:setName("checkBox40");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout80);
    obj.edit87:setAlign("left");
    obj.edit87:setHorzTextAlign("trailing");
    obj.edit87:setFontSize(14);
    obj.edit87:setWidth(120);
    obj.edit87:setField("pericia.nome.outro8");
    obj.edit87:setMargins({right=5});
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout80);
    obj.edit88:setType("number");
    obj.edit88:setMin(1);
    obj.edit88:setAlign("left");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(14);
    obj.edit88:setWidth(50);
    obj.edit88:setField("pericia.outro8");
    obj.edit88:setName("edit88");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout80);
    obj.label105:setAlign("left");
    obj.label105:setWidth(5);
    obj.label105:setText("");
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setMargins({right=5});
    obj.label105:setName("label105");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout80);
    obj.button49:setAlign("left");
    obj.button49:setLeft(5);
    obj.button49:setText("Rolar");
    obj.button49:setWidth(50);
    obj.button49:setName("button49");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout60);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(20);
    obj.layout81:setMargins({bottom=2, top=15});
    obj.layout81:setName("layout81");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout81);
    obj.checkBox41:setWidth(17);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setMargins({right=2});
    obj.checkBox41:setField("periciacheck.outro9");
    obj.checkBox41:setName("checkBox41");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout81);
    obj.edit89:setAlign("left");
    obj.edit89:setHorzTextAlign("trailing");
    obj.edit89:setFontSize(14);
    obj.edit89:setWidth(120);
    obj.edit89:setField("pericia.nome.outro9");
    obj.edit89:setMargins({right=5});
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout81);
    obj.edit90:setType("number");
    obj.edit90:setMin(1);
    obj.edit90:setAlign("left");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setFontSize(14);
    obj.edit90:setWidth(50);
    obj.edit90:setField("pericia.outro9");
    obj.edit90:setName("edit90");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout81);
    obj.label106:setAlign("left");
    obj.label106:setWidth(5);
    obj.label106:setText("");
    obj.label106:setHorzTextAlign("trailing");
    obj.label106:setMargins({right=5});
    obj.label106:setName("label106");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout81);
    obj.button50:setAlign("left");
    obj.button50:setLeft(5);
    obj.button50:setText("Rolar");
    obj.button50:setWidth(50);
    obj.button50:setName("button50");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout60);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(20);
    obj.layout82:setMargins({bottom=2, top=15});
    obj.layout82:setName("layout82");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout82);
    obj.checkBox42:setWidth(17);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setMargins({right=2});
    obj.checkBox42:setField("periciacheck.outro10");
    obj.checkBox42:setName("checkBox42");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout82);
    obj.edit91:setAlign("left");
    obj.edit91:setHorzTextAlign("trailing");
    obj.edit91:setFontSize(14);
    obj.edit91:setWidth(120);
    obj.edit91:setField("pericia.nome.outro10");
    obj.edit91:setMargins({right=5});
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout82);
    obj.edit92:setType("number");
    obj.edit92:setMin(1);
    obj.edit92:setAlign("left");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setFontSize(14);
    obj.edit92:setWidth(50);
    obj.edit92:setField("pericia.outro10");
    obj.edit92:setName("edit92");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout82);
    obj.label107:setAlign("left");
    obj.label107:setWidth(5);
    obj.label107:setText("");
    obj.label107:setHorzTextAlign("trailing");
    obj.label107:setMargins({right=5});
    obj.label107:setName("label107");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout82);
    obj.button51:setAlign("left");
    obj.button51:setLeft(5);
    obj.button51:setText("Rolar");
    obj.button51:setWidth(50);
    obj.button51:setName("button51");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout60);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(20);
    obj.layout83:setMargins({bottom=2, top=15});
    obj.layout83:setName("layout83");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout83);
    obj.label108:setAlign("left");
    obj.label108:setWidth(14);
    obj.label108:setText(" ");
    obj.label108:setHorzTextAlign("trailing");
    obj.label108:setMargins({right=5});
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout83);
    obj.label109:setAlign("left");
    obj.label109:setWidth(120);
    obj.label109:setText("Outros:");
    obj.label109:setHorzTextAlign("trailing");
    obj.label109:setMargins({right=5});
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout83);
    obj.label110:setAlign("left");
    obj.label110:setWidth(5);
    obj.label110:setText("");
    obj.label110:setHorzTextAlign("trailing");
    obj.label110:setMargins({right=5});
    obj.label110:setName("label110");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout60);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(20);
    obj.layout84:setMargins({bottom=2, top=15});
    obj.layout84:setName("layout84");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout84);
    obj.checkBox43:setWidth(17);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setMargins({right=2});
    obj.checkBox43:setField("periciacheck.outro12");
    obj.checkBox43:setName("checkBox43");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout84);
    obj.edit93:setAlign("left");
    obj.edit93:setHorzTextAlign("trailing");
    obj.edit93:setFontSize(14);
    obj.edit93:setWidth(120);
    obj.edit93:setField("pericia.nome.outro12");
    obj.edit93:setMargins({right=5});
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout84);
    obj.edit94:setType("number");
    obj.edit94:setMin(00);
    obj.edit94:setAlign("left");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(14);
    obj.edit94:setWidth(50);
    obj.edit94:setField("pericia.outro12");
    obj.edit94:setName("edit94");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout84);
    obj.label111:setAlign("left");
    obj.label111:setWidth(5);
    obj.label111:setText("");
    obj.label111:setHorzTextAlign("trailing");
    obj.label111:setMargins({right=5});
    obj.label111:setName("label111");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout84);
    obj.button52:setAlign("left");
    obj.button52:setLeft(5);
    obj.button52:setText("Rolar");
    obj.button52:setWidth(50);
    obj.button52:setName("button52");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout60);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(20);
    obj.layout85:setMargins({bottom=2, top=15});
    obj.layout85:setName("layout85");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout85);
    obj.checkBox44:setWidth(17);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setMargins({right=2});
    obj.checkBox44:setField("periciacheck.outro13");
    obj.checkBox44:setName("checkBox44");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout85);
    obj.edit95:setAlign("left");
    obj.edit95:setHorzTextAlign("trailing");
    obj.edit95:setFontSize(14);
    obj.edit95:setWidth(120);
    obj.edit95:setField("pericia.nome.outro13");
    obj.edit95:setMargins({right=5});
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout85);
    obj.edit96:setType("number");
    obj.edit96:setMin(00);
    obj.edit96:setAlign("left");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setFontSize(14);
    obj.edit96:setWidth(50);
    obj.edit96:setField("pericia.outro13");
    obj.edit96:setName("edit96");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout85);
    obj.label112:setAlign("left");
    obj.label112:setWidth(5);
    obj.label112:setText("");
    obj.label112:setHorzTextAlign("trailing");
    obj.label112:setMargins({right=5});
    obj.label112:setName("label112");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout85);
    obj.button53:setAlign("left");
    obj.button53:setLeft(5);
    obj.button53:setText("Rolar");
    obj.button53:setWidth(50);
    obj.button53:setName("button53");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.scrollBox1);
    obj.layout86:setAlign("none");
    obj.layout86:setLeft(670);
    obj.layout86:setHeight(984);
    obj.layout86:setWidth(332);
    obj.layout86:setTop(325);
    obj.layout86:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout86:setMargins({left=30, right=10, bottom=10});
    obj.layout86:setName("layout86");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout86);
    obj.label113:setText("Percepção/Habilidades Sociais e Fisicas");
    obj.label113:setLeft(40);
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold italic");
    obj.label113:setTop(9);
    obj.label113:setWidth(1343);
    obj.label113:setName("label113");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setLeft(20);
    obj.layout87:setTop(25);
    obj.layout87:setWidth(270);
    obj.layout87:setHeight(984);
    obj.layout87:setName("layout87");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout87);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(20);
    obj.layout88:setMargins({bottom=2, top=15});
    obj.layout88:setName("layout88");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout88);
    obj.checkBox45:setWidth(17);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setMargins({right=2});
    obj.checkBox45:setField("periciacheck.encontrar");
    obj.checkBox45:setName("checkBox45");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout88);
    obj.label114:setAlign("left");
    obj.label114:setWidth(120);
    obj.label114:setText("Encontrar:");
    obj.label114:setHorzTextAlign("trailing");
    obj.label114:setMargins({right=5});
    obj.label114:setName("label114");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout88);
    obj.edit97:setType("number");
    obj.edit97:setMin(25);
    obj.edit97:setAlign("left");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setFontSize(14);
    obj.edit97:setWidth(50);
    obj.edit97:setField("pericia.encontrar");
    obj.edit97:setName("edit97");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout88);
    obj.label115:setAlign("left");
    obj.label115:setWidth(5);
    obj.label115:setText("");
    obj.label115:setHorzTextAlign("trailing");
    obj.label115:setMargins({right=5});
    obj.label115:setName("label115");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout88);
    obj.button54:setAlign("left");
    obj.button54:setLeft(5);
    obj.button54:setText("Rolar");
    obj.button54:setWidth(50);
    obj.button54:setName("button54");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout87);
    obj.layout89:setAlign("top");
    obj.layout89:setHeight(20);
    obj.layout89:setMargins({bottom=2, top=15});
    obj.layout89:setName("layout89");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout89);
    obj.checkBox46:setWidth(17);
    obj.checkBox46:setAlign("left");
    obj.checkBox46:setMargins({right=2});
    obj.checkBox46:setField("periciacheck.escutar");
    obj.checkBox46:setName("checkBox46");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout89);
    obj.label116:setAlign("left");
    obj.label116:setWidth(120);
    obj.label116:setText("Escutar:");
    obj.label116:setHorzTextAlign("trailing");
    obj.label116:setMargins({right=5});
    obj.label116:setName("label116");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout89);
    obj.edit98:setType("number");
    obj.edit98:setMin(20);
    obj.edit98:setAlign("left");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setFontSize(14);
    obj.edit98:setWidth(50);
    obj.edit98:setField("pericia.escutar");
    obj.edit98:setName("edit98");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout89);
    obj.label117:setAlign("left");
    obj.label117:setWidth(5);
    obj.label117:setText("");
    obj.label117:setHorzTextAlign("trailing");
    obj.label117:setMargins({right=5});
    obj.label117:setName("label117");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout89);
    obj.button55:setAlign("left");
    obj.button55:setLeft(5);
    obj.button55:setText("Rolar");
    obj.button55:setWidth(50);
    obj.button55:setName("button55");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout87);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(20);
    obj.layout90:setMargins({bottom=2, top=15});
    obj.layout90:setName("layout90");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout90);
    obj.checkBox47:setWidth(17);
    obj.checkBox47:setAlign("left");
    obj.checkBox47:setMargins({right=2});
    obj.checkBox47:setField("periciacheck.charme");
    obj.checkBox47:setName("checkBox47");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout90);
    obj.label118:setAlign("left");
    obj.label118:setWidth(120);
    obj.label118:setText("Charme:");
    obj.label118:setHorzTextAlign("trailing");
    obj.label118:setMargins({right=5});
    obj.label118:setName("label118");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout90);
    obj.edit99:setType("number");
    obj.edit99:setMin(15);
    obj.edit99:setAlign("left");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setFontSize(14);
    obj.edit99:setWidth(50);
    obj.edit99:setField("pericia.charme");
    obj.edit99:setName("edit99");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout90);
    obj.label119:setAlign("left");
    obj.label119:setWidth(5);
    obj.label119:setText("");
    obj.label119:setHorzTextAlign("trailing");
    obj.label119:setMargins({right=5});
    obj.label119:setName("label119");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout90);
    obj.button56:setAlign("left");
    obj.button56:setLeft(5);
    obj.button56:setText("Rolar");
    obj.button56:setWidth(50);
    obj.button56:setName("button56");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout87);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(20);
    obj.layout91:setMargins({bottom=2, top=15});
    obj.layout91:setName("layout91");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout91);
    obj.checkBox48:setWidth(17);
    obj.checkBox48:setAlign("left");
    obj.checkBox48:setMargins({right=2});
    obj.checkBox48:setField("periciacheck.labia");
    obj.checkBox48:setName("checkBox48");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout91);
    obj.label120:setAlign("left");
    obj.label120:setWidth(120);
    obj.label120:setText("Lábia:");
    obj.label120:setHorzTextAlign("trailing");
    obj.label120:setMargins({right=5});
    obj.label120:setName("label120");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout91);
    obj.edit100:setType("number");
    obj.edit100:setMin(05);
    obj.edit100:setAlign("left");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setFontSize(14);
    obj.edit100:setWidth(50);
    obj.edit100:setField("pericia.labia");
    obj.edit100:setName("edit100");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout91);
    obj.label121:setAlign("left");
    obj.label121:setWidth(5);
    obj.label121:setText("");
    obj.label121:setHorzTextAlign("trailing");
    obj.label121:setMargins({right=5});
    obj.label121:setName("label121");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout91);
    obj.button57:setAlign("left");
    obj.button57:setLeft(5);
    obj.button57:setText("Rolar");
    obj.button57:setWidth(50);
    obj.button57:setName("button57");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout87);
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(20);
    obj.layout92:setMargins({bottom=2, top=15});
    obj.layout92:setName("layout92");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout92);
    obj.checkBox49:setWidth(17);
    obj.checkBox49:setAlign("left");
    obj.checkBox49:setMargins({right=2});
    obj.checkBox49:setField("periciacheck.intimidacao");
    obj.checkBox49:setName("checkBox49");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout92);
    obj.label122:setAlign("left");
    obj.label122:setWidth(120);
    obj.label122:setText("Intimidação:");
    obj.label122:setHorzTextAlign("trailing");
    obj.label122:setMargins({right=5});
    obj.label122:setName("label122");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout92);
    obj.edit101:setType("number");
    obj.edit101:setMin(15);
    obj.edit101:setAlign("left");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setFontSize(14);
    obj.edit101:setWidth(50);
    obj.edit101:setField("pericia.intimidacao");
    obj.edit101:setName("edit101");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout92);
    obj.label123:setAlign("left");
    obj.label123:setWidth(5);
    obj.label123:setText("");
    obj.label123:setHorzTextAlign("trailing");
    obj.label123:setMargins({right=5});
    obj.label123:setName("label123");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout92);
    obj.button58:setAlign("left");
    obj.button58:setLeft(5);
    obj.button58:setText("Rolar");
    obj.button58:setWidth(50);
    obj.button58:setName("button58");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout87);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(20);
    obj.layout93:setMargins({bottom=2, top=15});
    obj.layout93:setName("layout93");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout93);
    obj.checkBox50:setWidth(17);
    obj.checkBox50:setAlign("left");
    obj.checkBox50:setMargins({right=2});
    obj.checkBox50:setField("periciacheck.persuasao");
    obj.checkBox50:setName("checkBox50");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout93);
    obj.label124:setAlign("left");
    obj.label124:setWidth(120);
    obj.label124:setText("Persuasão:");
    obj.label124:setHorzTextAlign("trailing");
    obj.label124:setMargins({right=5});
    obj.label124:setName("label124");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout93);
    obj.edit102:setType("number");
    obj.edit102:setMin(15);
    obj.edit102:setAlign("left");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setFontSize(14);
    obj.edit102:setWidth(50);
    obj.edit102:setField("pericia.persuasao");
    obj.edit102:setName("edit102");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout93);
    obj.label125:setAlign("left");
    obj.label125:setWidth(5);
    obj.label125:setText("");
    obj.label125:setHorzTextAlign("trailing");
    obj.label125:setMargins({right=5});
    obj.label125:setName("label125");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout93);
    obj.button59:setAlign("left");
    obj.button59:setLeft(5);
    obj.button59:setText("Rolar");
    obj.button59:setWidth(50);
    obj.button59:setName("button59");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout87);
    obj.layout94:setAlign("top");
    obj.layout94:setHeight(20);
    obj.layout94:setMargins({bottom=2, top=15});
    obj.layout94:setName("layout94");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout94);
    obj.checkBox51:setWidth(17);
    obj.checkBox51:setAlign("left");
    obj.checkBox51:setMargins({right=2});
    obj.checkBox51:setField("periciacheck.psicanalise");
    obj.checkBox51:setName("checkBox51");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout94);
    obj.label126:setAlign("left");
    obj.label126:setWidth(120);
    obj.label126:setText("Psicanálise:");
    obj.label126:setHorzTextAlign("trailing");
    obj.label126:setMargins({right=5});
    obj.label126:setName("label126");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout94);
    obj.edit103:setType("number");
    obj.edit103:setMin(01);
    obj.edit103:setAlign("left");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setFontSize(14);
    obj.edit103:setWidth(50);
    obj.edit103:setField("pericia.psicanalise");
    obj.edit103:setName("edit103");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout94);
    obj.label127:setAlign("left");
    obj.label127:setWidth(5);
    obj.label127:setText("");
    obj.label127:setHorzTextAlign("trailing");
    obj.label127:setMargins({right=5});
    obj.label127:setName("label127");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout94);
    obj.button60:setAlign("left");
    obj.button60:setLeft(5);
    obj.button60:setText("Rolar");
    obj.button60:setWidth(50);
    obj.button60:setName("button60");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout87);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(20);
    obj.layout95:setMargins({bottom=2, top=15});
    obj.layout95:setName("layout95");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout95);
    obj.checkBox52:setWidth(17);
    obj.checkBox52:setAlign("left");
    obj.checkBox52:setMargins({right=2});
    obj.checkBox52:setField("periciacheck.psicologia");
    obj.checkBox52:setName("checkBox52");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout95);
    obj.label128:setAlign("left");
    obj.label128:setWidth(120);
    obj.label128:setText("Psicologia:");
    obj.label128:setHorzTextAlign("trailing");
    obj.label128:setMargins({right=5});
    obj.label128:setName("label128");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout95);
    obj.edit104:setType("number");
    obj.edit104:setMin(10);
    obj.edit104:setAlign("left");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setFontSize(14);
    obj.edit104:setWidth(50);
    obj.edit104:setField("pericia.psicologia");
    obj.edit104:setName("edit104");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout95);
    obj.label129:setAlign("left");
    obj.label129:setWidth(5);
    obj.label129:setText("");
    obj.label129:setHorzTextAlign("trailing");
    obj.label129:setMargins({right=5});
    obj.label129:setName("label129");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout95);
    obj.button61:setAlign("left");
    obj.button61:setLeft(5);
    obj.button61:setText("Rolar");
    obj.button61:setWidth(50);
    obj.button61:setName("button61");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout87);
    obj.layout96:setAlign("top");
    obj.layout96:setHeight(20);
    obj.layout96:setMargins({bottom=2, top=15});
    obj.layout96:setName("layout96");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout96);
    obj.checkBox53:setWidth(17);
    obj.checkBox53:setAlign("left");
    obj.checkBox53:setMargins({right=2});
    obj.checkBox53:setField("periciacheck.arremessar");
    obj.checkBox53:setName("checkBox53");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout96);
    obj.label130:setAlign("left");
    obj.label130:setWidth(120);
    obj.label130:setText("Arremessar:");
    obj.label130:setHorzTextAlign("trailing");
    obj.label130:setMargins({right=5});
    obj.label130:setName("label130");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout96);
    obj.edit105:setType("number");
    obj.edit105:setMin(20);
    obj.edit105:setAlign("left");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setFontSize(14);
    obj.edit105:setWidth(50);
    obj.edit105:setField("pericia.arremessar");
    obj.edit105:setName("edit105");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout96);
    obj.label131:setAlign("left");
    obj.label131:setWidth(5);
    obj.label131:setText("");
    obj.label131:setHorzTextAlign("trailing");
    obj.label131:setMargins({right=5});
    obj.label131:setName("label131");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout96);
    obj.button62:setAlign("left");
    obj.button62:setLeft(5);
    obj.button62:setText("Rolar");
    obj.button62:setWidth(50);
    obj.button62:setName("button62");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout87);
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(20);
    obj.layout97:setMargins({bottom=2, top=15});
    obj.layout97:setName("layout97");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout97);
    obj.checkBox54:setWidth(17);
    obj.checkBox54:setAlign("left");
    obj.checkBox54:setMargins({right=2});
    obj.checkBox54:setField("periciacheck.cavalgar");
    obj.checkBox54:setName("checkBox54");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout97);
    obj.label132:setAlign("left");
    obj.label132:setWidth(120);
    obj.label132:setText("Cavalgar:");
    obj.label132:setHorzTextAlign("trailing");
    obj.label132:setMargins({right=5});
    obj.label132:setName("label132");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout97);
    obj.edit106:setType("number");
    obj.edit106:setMin(05);
    obj.edit106:setAlign("left");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setFontSize(14);
    obj.edit106:setWidth(50);
    obj.edit106:setField("pericia.cavalgar");
    obj.edit106:setName("edit106");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout97);
    obj.label133:setAlign("left");
    obj.label133:setWidth(5);
    obj.label133:setText("");
    obj.label133:setHorzTextAlign("trailing");
    obj.label133:setMargins({right=5});
    obj.label133:setName("label133");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout97);
    obj.button63:setAlign("left");
    obj.button63:setLeft(5);
    obj.button63:setText("Rolar");
    obj.button63:setWidth(50);
    obj.button63:setName("button63");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout87);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(20);
    obj.layout98:setMargins({bottom=2, top=15});
    obj.layout98:setName("layout98");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout98);
    obj.checkBox55:setWidth(17);
    obj.checkBox55:setAlign("left");
    obj.checkBox55:setMargins({right=2});
    obj.checkBox55:setField("periciacheck.escalar");
    obj.checkBox55:setName("checkBox55");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout98);
    obj.label134:setAlign("left");
    obj.label134:setWidth(120);
    obj.label134:setText("Escalar:");
    obj.label134:setHorzTextAlign("trailing");
    obj.label134:setMargins({right=5});
    obj.label134:setName("label134");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout98);
    obj.edit107:setType("number");
    obj.edit107:setMin(20);
    obj.edit107:setAlign("left");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setFontSize(14);
    obj.edit107:setWidth(50);
    obj.edit107:setField("pericia.escalar");
    obj.edit107:setName("edit107");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout98);
    obj.label135:setAlign("left");
    obj.label135:setWidth(5);
    obj.label135:setText("");
    obj.label135:setHorzTextAlign("trailing");
    obj.label135:setMargins({right=5});
    obj.label135:setName("label135");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout98);
    obj.button64:setAlign("left");
    obj.button64:setLeft(5);
    obj.button64:setText("Rolar");
    obj.button64:setWidth(50);
    obj.button64:setName("button64");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout87);
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(20);
    obj.layout99:setMargins({bottom=2, top=15});
    obj.layout99:setName("layout99");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout99);
    obj.checkBox56:setWidth(17);
    obj.checkBox56:setAlign("left");
    obj.checkBox56:setMargins({right=2});
    obj.checkBox56:setField("periciacheck.furtividade");
    obj.checkBox56:setName("checkBox56");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout99);
    obj.label136:setAlign("left");
    obj.label136:setWidth(120);
    obj.label136:setText("Furtividade:");
    obj.label136:setHorzTextAlign("trailing");
    obj.label136:setMargins({right=5});
    obj.label136:setName("label136");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout99);
    obj.edit108:setType("number");
    obj.edit108:setMin(05);
    obj.edit108:setAlign("left");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setFontSize(14);
    obj.edit108:setWidth(50);
    obj.edit108:setField("pericia.furtividade");
    obj.edit108:setName("edit108");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout99);
    obj.label137:setAlign("left");
    obj.label137:setWidth(5);
    obj.label137:setText("");
    obj.label137:setHorzTextAlign("trailing");
    obj.label137:setMargins({right=5});
    obj.label137:setName("label137");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout99);
    obj.button65:setAlign("left");
    obj.button65:setLeft(5);
    obj.button65:setText("Rolar");
    obj.button65:setWidth(50);
    obj.button65:setName("button65");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout87);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(20);
    obj.layout100:setMargins({bottom=2, top=15});
    obj.layout100:setName("layout100");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout100);
    obj.checkBox57:setWidth(17);
    obj.checkBox57:setAlign("left");
    obj.checkBox57:setMargins({right=2});
    obj.checkBox57:setField("periciacheck.natacao");
    obj.checkBox57:setName("checkBox57");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout100);
    obj.label138:setAlign("left");
    obj.label138:setWidth(120);
    obj.label138:setText("Natação:");
    obj.label138:setHorzTextAlign("trailing");
    obj.label138:setMargins({right=5});
    obj.label138:setName("label138");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout100);
    obj.edit109:setType("number");
    obj.edit109:setMin(20);
    obj.edit109:setAlign("left");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setFontSize(14);
    obj.edit109:setWidth(50);
    obj.edit109:setField("pericia.natacao");
    obj.edit109:setName("edit109");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout100);
    obj.label139:setAlign("left");
    obj.label139:setWidth(5);
    obj.label139:setText("");
    obj.label139:setHorzTextAlign("trailing");
    obj.label139:setMargins({right=5});
    obj.label139:setName("label139");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout100);
    obj.button66:setAlign("left");
    obj.button66:setLeft(5);
    obj.button66:setText("Rolar");
    obj.button66:setWidth(50);
    obj.button66:setName("button66");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout87);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(20);
    obj.layout101:setMargins({bottom=2, top=15});
    obj.layout101:setName("layout101");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout101);
    obj.checkBox58:setWidth(17);
    obj.checkBox58:setAlign("left");
    obj.checkBox58:setMargins({right=2});
    obj.checkBox58:setField("periciacheck.saltar");
    obj.checkBox58:setName("checkBox58");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout101);
    obj.label140:setAlign("left");
    obj.label140:setWidth(120);
    obj.label140:setText("Saltar:");
    obj.label140:setHorzTextAlign("trailing");
    obj.label140:setMargins({right=5});
    obj.label140:setName("label140");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout101);
    obj.edit110:setType("number");
    obj.edit110:setMin(20);
    obj.edit110:setAlign("left");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setFontSize(14);
    obj.edit110:setWidth(50);
    obj.edit110:setField("pericia.saltar");
    obj.edit110:setName("edit110");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout101);
    obj.label141:setAlign("left");
    obj.label141:setWidth(5);
    obj.label141:setText("");
    obj.label141:setHorzTextAlign("trailing");
    obj.label141:setMargins({right=5});
    obj.label141:setName("label141");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout101);
    obj.button67:setAlign("left");
    obj.button67:setLeft(5);
    obj.button67:setText("Rolar");
    obj.button67:setWidth(50);
    obj.button67:setName("button67");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout87);
    obj.layout102:setAlign("top");
    obj.layout102:setHeight(20);
    obj.layout102:setMargins({bottom=2, top=15});
    obj.layout102:setName("layout102");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout102);
    obj.checkBox59:setWidth(17);
    obj.checkBox59:setAlign("left");
    obj.checkBox59:setMargins({right=2});
    obj.checkBox59:setField("periciacheck.esquiva");
    obj.checkBox59:setName("checkBox59");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout102);
    obj.label142:setAlign("left");
    obj.label142:setWidth(120);
    obj.label142:setText("Esquiva (Des/2):");
    obj.label142:setHorzTextAlign("trailing");
    obj.label142:setMargins({right=5});
    obj.label142:setName("label142");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout102);
    obj.edit111:setType("number");
    obj.edit111:setMin(00);
    obj.edit111:setAlign("left");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setFontSize(14);
    obj.edit111:setWidth(50);
    obj.edit111:setField("pericia.esquiva");
    obj.edit111:setName("edit111");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout102);
    obj.label143:setAlign("left");
    obj.label143:setWidth(5);
    obj.label143:setText("");
    obj.label143:setHorzTextAlign("trailing");
    obj.label143:setMargins({right=5});
    obj.label143:setName("label143");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout102);
    obj.button68:setAlign("left");
    obj.button68:setLeft(5);
    obj.button68:setText("Rolar");
    obj.button68:setWidth(50);
    obj.button68:setName("button68");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout87);
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(20);
    obj.layout103:setMargins({bottom=2, top=15});
    obj.layout103:setName("layout103");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout103);
    obj.checkBox60:setWidth(17);
    obj.checkBox60:setAlign("left");
    obj.checkBox60:setMargins({right=2});
    obj.checkBox60:setField("periciacheck.lutarB");
    obj.checkBox60:setName("checkBox60");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout103);
    obj.label144:setAlign("left");
    obj.label144:setWidth(120);
    obj.label144:setText("Lutar(Briga):");
    obj.label144:setHorzTextAlign("trailing");
    obj.label144:setMargins({right=5});
    obj.label144:setName("label144");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout103);
    obj.edit112:setType("number");
    obj.edit112:setMin(25);
    obj.edit112:setAlign("left");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setFontSize(14);
    obj.edit112:setWidth(50);
    obj.edit112:setField("pericia.lutarB");
    obj.edit112:setName("edit112");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout103);
    obj.label145:setAlign("left");
    obj.label145:setWidth(5);
    obj.label145:setText("");
    obj.label145:setHorzTextAlign("trailing");
    obj.label145:setMargins({right=5});
    obj.label145:setName("label145");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout103);
    obj.button69:setAlign("left");
    obj.button69:setLeft(5);
    obj.button69:setText("Rolar");
    obj.button69:setWidth(50);
    obj.button69:setName("button69");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout87);
    obj.layout104:setAlign("top");
    obj.layout104:setHeight(20);
    obj.layout104:setMargins({bottom=2, top=15});
    obj.layout104:setName("layout104");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout104);
    obj.checkBox61:setWidth(17);
    obj.checkBox61:setAlign("left");
    obj.checkBox61:setMargins({right=2});
    obj.checkBox61:setField("periciacheck.lutar1");
    obj.checkBox61:setName("checkBox61");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout104);
    obj.edit113:setAlign("left");
    obj.edit113:setHorzTextAlign("trailing");
    obj.edit113:setFontSize(14);
    obj.edit113:setWidth(120);
    obj.edit113:setField("pericia.nome.lutar1");
    obj.edit113:setMargins({right=5});
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout104);
    obj.edit114:setType("number");
    obj.edit114:setMin(00);
    obj.edit114:setAlign("left");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setFontSize(14);
    obj.edit114:setWidth(50);
    obj.edit114:setField("pericia.lutar1");
    obj.edit114:setName("edit114");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout104);
    obj.label146:setAlign("left");
    obj.label146:setWidth(5);
    obj.label146:setText("");
    obj.label146:setHorzTextAlign("trailing");
    obj.label146:setMargins({right=5});
    obj.label146:setName("label146");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout104);
    obj.button70:setAlign("left");
    obj.button70:setLeft(5);
    obj.button70:setText("Rolar");
    obj.button70:setWidth(50);
    obj.button70:setName("button70");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout87);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(20);
    obj.layout105:setMargins({bottom=2, top=15});
    obj.layout105:setName("layout105");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout105);
    obj.checkBox62:setWidth(17);
    obj.checkBox62:setAlign("left");
    obj.checkBox62:setMargins({right=2});
    obj.checkBox62:setField("periciacheck.lutar2");
    obj.checkBox62:setName("checkBox62");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout105);
    obj.edit115:setAlign("left");
    obj.edit115:setHorzTextAlign("trailing");
    obj.edit115:setFontSize(14);
    obj.edit115:setWidth(120);
    obj.edit115:setField("pericia.nome.lutar2");
    obj.edit115:setMargins({right=5});
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout105);
    obj.edit116:setType("number");
    obj.edit116:setMin(00);
    obj.edit116:setAlign("left");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setFontSize(14);
    obj.edit116:setWidth(50);
    obj.edit116:setField("pericia.lutar2");
    obj.edit116:setName("edit116");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout105);
    obj.label147:setAlign("left");
    obj.label147:setWidth(5);
    obj.label147:setText("");
    obj.label147:setHorzTextAlign("trailing");
    obj.label147:setMargins({right=5});
    obj.label147:setName("label147");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout105);
    obj.button71:setAlign("left");
    obj.button71:setLeft(5);
    obj.button71:setText("Rolar");
    obj.button71:setWidth(50);
    obj.button71:setName("button71");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout87);
    obj.layout106:setAlign("top");
    obj.layout106:setHeight(20);
    obj.layout106:setMargins({bottom=2, top=15});
    obj.layout106:setName("layout106");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout106);
    obj.checkBox63:setWidth(17);
    obj.checkBox63:setAlign("left");
    obj.checkBox63:setMargins({right=2});
    obj.checkBox63:setField("periciacheck.lutar3");
    obj.checkBox63:setName("checkBox63");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout106);
    obj.edit117:setAlign("left");
    obj.edit117:setHorzTextAlign("trailing");
    obj.edit117:setFontSize(14);
    obj.edit117:setWidth(120);
    obj.edit117:setField("pericia.nome.lutar3");
    obj.edit117:setMargins({right=5});
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout106);
    obj.edit118:setType("number");
    obj.edit118:setMin(00);
    obj.edit118:setAlign("left");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setFontSize(14);
    obj.edit118:setWidth(50);
    obj.edit118:setField("pericia.lutar3");
    obj.edit118:setName("edit118");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout106);
    obj.label148:setAlign("left");
    obj.label148:setWidth(5);
    obj.label148:setText("");
    obj.label148:setHorzTextAlign("trailing");
    obj.label148:setMargins({right=5});
    obj.label148:setName("label148");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout106);
    obj.button72:setAlign("left");
    obj.button72:setLeft(5);
    obj.button72:setText("Rolar");
    obj.button72:setWidth(50);
    obj.button72:setName("button72");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout87);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(20);
    obj.layout107:setMargins({bottom=2, top=15});
    obj.layout107:setName("layout107");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout107);
    obj.label149:setAlign("left");
    obj.label149:setWidth(14);
    obj.label149:setText(" ");
    obj.label149:setHorzTextAlign("trailing");
    obj.label149:setMargins({right=5});
    obj.label149:setName("label149");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout107);
    obj.label150:setAlign("left");
    obj.label150:setWidth(120);
    obj.label150:setText("Outros:");
    obj.label150:setHorzTextAlign("trailing");
    obj.label150:setMargins({right=5});
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout107);
    obj.label151:setAlign("left");
    obj.label151:setWidth(5);
    obj.label151:setText("");
    obj.label151:setHorzTextAlign("trailing");
    obj.label151:setMargins({right=5});
    obj.label151:setName("label151");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout87);
    obj.layout108:setAlign("top");
    obj.layout108:setHeight(20);
    obj.layout108:setMargins({bottom=2, top=15});
    obj.layout108:setName("layout108");

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout108);
    obj.checkBox64:setWidth(17);
    obj.checkBox64:setAlign("left");
    obj.checkBox64:setMargins({right=2});
    obj.checkBox64:setField("periciacheck.outro14");
    obj.checkBox64:setName("checkBox64");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout108);
    obj.edit119:setAlign("left");
    obj.edit119:setHorzTextAlign("trailing");
    obj.edit119:setFontSize(14);
    obj.edit119:setWidth(120);
    obj.edit119:setField("pericia.nome.outro14");
    obj.edit119:setMargins({right=5});
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout108);
    obj.edit120:setType("number");
    obj.edit120:setMin(00);
    obj.edit120:setAlign("left");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setFontSize(14);
    obj.edit120:setWidth(50);
    obj.edit120:setField("pericia.outro14");
    obj.edit120:setName("edit120");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout108);
    obj.label152:setAlign("left");
    obj.label152:setWidth(5);
    obj.label152:setText("");
    obj.label152:setHorzTextAlign("trailing");
    obj.label152:setMargins({right=5});
    obj.label152:setName("label152");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout108);
    obj.button73:setAlign("left");
    obj.button73:setLeft(5);
    obj.button73:setText("Rolar");
    obj.button73:setWidth(50);
    obj.button73:setName("button73");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout87);
    obj.layout109:setAlign("top");
    obj.layout109:setHeight(20);
    obj.layout109:setMargins({bottom=2, top=15});
    obj.layout109:setName("layout109");

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout109);
    obj.checkBox65:setWidth(17);
    obj.checkBox65:setAlign("left");
    obj.checkBox65:setMargins({right=2});
    obj.checkBox65:setField("periciacheck.outro15");
    obj.checkBox65:setName("checkBox65");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout109);
    obj.edit121:setAlign("left");
    obj.edit121:setHorzTextAlign("trailing");
    obj.edit121:setFontSize(14);
    obj.edit121:setWidth(120);
    obj.edit121:setField("pericia.nome.outro15");
    obj.edit121:setMargins({right=5});
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout109);
    obj.edit122:setType("number");
    obj.edit122:setMin(00);
    obj.edit122:setAlign("left");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setFontSize(14);
    obj.edit122:setWidth(50);
    obj.edit122:setField("pericia.outro15");
    obj.edit122:setName("edit122");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout109);
    obj.label153:setAlign("left");
    obj.label153:setWidth(5);
    obj.label153:setText("");
    obj.label153:setHorzTextAlign("trailing");
    obj.label153:setMargins({right=5});
    obj.label153:setName("label153");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout109);
    obj.button74:setAlign("left");
    obj.button74:setLeft(5);
    obj.button74:setText("Rolar");
    obj.button74:setWidth(50);
    obj.button74:setName("button74");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout87);
    obj.layout110:setAlign("top");
    obj.layout110:setHeight(20);
    obj.layout110:setMargins({bottom=2, top=15});
    obj.layout110:setName("layout110");

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout110);
    obj.checkBox66:setWidth(17);
    obj.checkBox66:setAlign("left");
    obj.checkBox66:setMargins({right=2});
    obj.checkBox66:setField("periciacheck.outro16");
    obj.checkBox66:setName("checkBox66");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout110);
    obj.edit123:setAlign("left");
    obj.edit123:setHorzTextAlign("trailing");
    obj.edit123:setFontSize(14);
    obj.edit123:setWidth(120);
    obj.edit123:setField("pericia.nome.outro16");
    obj.edit123:setMargins({right=5});
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout110);
    obj.edit124:setType("number");
    obj.edit124:setMin(00);
    obj.edit124:setAlign("left");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setFontSize(14);
    obj.edit124:setWidth(50);
    obj.edit124:setField("pericia.outro16");
    obj.edit124:setName("edit124");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout110);
    obj.label154:setAlign("left");
    obj.label154:setWidth(5);
    obj.label154:setText("");
    obj.label154:setHorzTextAlign("trailing");
    obj.label154:setMargins({right=5});
    obj.label154:setName("label154");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout110);
    obj.button75:setAlign("left");
    obj.button75:setLeft(5);
    obj.button75:setText("Rolar");
    obj.button75:setWidth(50);
    obj.button75:setName("button75");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout87);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(20);
    obj.layout111:setMargins({bottom=2, top=15});
    obj.layout111:setName("layout111");

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout111);
    obj.checkBox67:setWidth(17);
    obj.checkBox67:setAlign("left");
    obj.checkBox67:setMargins({right=2});
    obj.checkBox67:setField("periciacheck.outro17");
    obj.checkBox67:setName("checkBox67");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout111);
    obj.edit125:setAlign("left");
    obj.edit125:setHorzTextAlign("trailing");
    obj.edit125:setFontSize(14);
    obj.edit125:setWidth(120);
    obj.edit125:setField("pericia.nome.outro17");
    obj.edit125:setMargins({right=5});
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout111);
    obj.edit126:setType("number");
    obj.edit126:setMin(00);
    obj.edit126:setAlign("left");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setFontSize(14);
    obj.edit126:setWidth(50);
    obj.edit126:setField("pericia.outro17");
    obj.edit126:setName("edit126");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout111);
    obj.label155:setAlign("left");
    obj.label155:setWidth(5);
    obj.label155:setText("");
    obj.label155:setHorzTextAlign("trailing");
    obj.label155:setMargins({right=5});
    obj.label155:setName("label155");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout111);
    obj.button76:setAlign("left");
    obj.button76:setLeft(5);
    obj.button76:setText("Rolar");
    obj.button76:setWidth(50);
    obj.button76:setName("button76");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout87);
    obj.layout112:setAlign("top");
    obj.layout112:setHeight(20);
    obj.layout112:setMargins({bottom=2, top=15});
    obj.layout112:setName("layout112");

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout112);
    obj.checkBox68:setWidth(17);
    obj.checkBox68:setAlign("left");
    obj.checkBox68:setMargins({right=2});
    obj.checkBox68:setField("periciacheck.outro18");
    obj.checkBox68:setName("checkBox68");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout112);
    obj.edit127:setAlign("left");
    obj.edit127:setHorzTextAlign("trailing");
    obj.edit127:setFontSize(14);
    obj.edit127:setWidth(120);
    obj.edit127:setField("pericia.nome.outro18");
    obj.edit127:setMargins({right=5});
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout112);
    obj.edit128:setType("number");
    obj.edit128:setMin(00);
    obj.edit128:setAlign("left");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setFontSize(14);
    obj.edit128:setWidth(50);
    obj.edit128:setField("pericia.outro18");
    obj.edit128:setName("edit128");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout112);
    obj.label156:setAlign("left");
    obj.label156:setWidth(5);
    obj.label156:setText("");
    obj.label156:setHorzTextAlign("trailing");
    obj.label156:setMargins({right=5});
    obj.label156:setName("label156");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout112);
    obj.button77:setAlign("left");
    obj.button77:setLeft(5);
    obj.button77:setText("Rolar");
    obj.button77:setWidth(50);
    obj.button77:setName("button77");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.scrollBox1);
    obj.layout113:setAlign("none");
    obj.layout113:setLeft(1002);
    obj.layout113:setHeight(984);
    obj.layout113:setWidth(332);
    obj.layout113:setTop(325);
    obj.layout113:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout113:setMargins({left=30, right=10, bottom=10});
    obj.layout113:setName("layout113");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout113);
    obj.label157:setText("Habilidades Acadêmicas e Armas de Fogo");
    obj.label157:setLeft(40);
    lfm_setPropAsString(obj.label157, "fontStyle",  "bold italic");
    obj.label157:setTop(9);
    obj.label157:setWidth(1343);
    obj.label157:setName("label157");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout113);
    obj.layout114:setLeft(20);
    obj.layout114:setTop(25);
    obj.layout114:setWidth(270);
    obj.layout114:setHeight(984);
    obj.layout114:setName("layout114");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout114);
    obj.layout115:setAlign("top");
    obj.layout115:setHeight(20);
    obj.layout115:setMargins({bottom=2, top=15});
    obj.layout115:setName("layout115");

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout115);
    obj.checkBox69:setWidth(17);
    obj.checkBox69:setAlign("left");
    obj.checkBox69:setMargins({right=2});
    obj.checkBox69:setField("periciacheck.antropologia");
    obj.checkBox69:setName("checkBox69");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout115);
    obj.label158:setAlign("left");
    obj.label158:setWidth(120);
    obj.label158:setText("Antropologia:");
    obj.label158:setHorzTextAlign("trailing");
    obj.label158:setMargins({right=5});
    obj.label158:setName("label158");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout115);
    obj.edit129:setType("number");
    obj.edit129:setMin(01);
    obj.edit129:setAlign("left");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setFontSize(14);
    obj.edit129:setWidth(50);
    obj.edit129:setField("pericia.antropologia");
    obj.edit129:setName("edit129");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout115);
    obj.label159:setAlign("left");
    obj.label159:setWidth(5);
    obj.label159:setText("");
    obj.label159:setHorzTextAlign("trailing");
    obj.label159:setMargins({right=5});
    obj.label159:setName("label159");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout115);
    obj.button78:setAlign("left");
    obj.button78:setLeft(5);
    obj.button78:setText("Rolar");
    obj.button78:setWidth(50);
    obj.button78:setName("button78");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout114);
    obj.layout116:setAlign("top");
    obj.layout116:setHeight(20);
    obj.layout116:setMargins({bottom=2, top=15});
    obj.layout116:setName("layout116");

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout116);
    obj.checkBox70:setWidth(17);
    obj.checkBox70:setAlign("left");
    obj.checkBox70:setMargins({right=2});
    obj.checkBox70:setField("periciacheck.arqueologia");
    obj.checkBox70:setName("checkBox70");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout116);
    obj.label160:setAlign("left");
    obj.label160:setWidth(120);
    obj.label160:setText("Arqueologia:");
    obj.label160:setHorzTextAlign("trailing");
    obj.label160:setMargins({right=5});
    obj.label160:setName("label160");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout116);
    obj.edit130:setType("number");
    obj.edit130:setMin(01);
    obj.edit130:setAlign("left");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setFontSize(14);
    obj.edit130:setWidth(50);
    obj.edit130:setField("pericia.arqueologia");
    obj.edit130:setName("edit130");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout116);
    obj.label161:setAlign("left");
    obj.label161:setWidth(5);
    obj.label161:setText("");
    obj.label161:setHorzTextAlign("trailing");
    obj.label161:setMargins({right=5});
    obj.label161:setName("label161");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout116);
    obj.button79:setAlign("left");
    obj.button79:setLeft(5);
    obj.button79:setText("Rolar");
    obj.button79:setWidth(50);
    obj.button79:setName("button79");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout114);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(20);
    obj.layout117:setMargins({bottom=2, top=15});
    obj.layout117:setName("layout117");

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout117);
    obj.checkBox71:setWidth(17);
    obj.checkBox71:setAlign("left");
    obj.checkBox71:setMargins({right=2});
    obj.checkBox71:setField("periciacheck.contabilidade");
    obj.checkBox71:setName("checkBox71");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout117);
    obj.label162:setAlign("left");
    obj.label162:setWidth(120);
    obj.label162:setText("Contabilidade:");
    obj.label162:setHorzTextAlign("trailing");
    obj.label162:setMargins({right=5});
    obj.label162:setName("label162");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout117);
    obj.edit131:setType("number");
    obj.edit131:setMin(05);
    obj.edit131:setAlign("left");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setFontSize(14);
    obj.edit131:setWidth(50);
    obj.edit131:setField("pericia.contabilidade");
    obj.edit131:setName("edit131");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout117);
    obj.label163:setAlign("left");
    obj.label163:setWidth(5);
    obj.label163:setText("");
    obj.label163:setHorzTextAlign("trailing");
    obj.label163:setMargins({right=5});
    obj.label163:setName("label163");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout117);
    obj.button80:setAlign("left");
    obj.button80:setLeft(5);
    obj.button80:setText("Rolar");
    obj.button80:setWidth(50);
    obj.button80:setName("button80");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout114);
    obj.layout118:setAlign("top");
    obj.layout118:setHeight(20);
    obj.layout118:setMargins({bottom=2, top=15});
    obj.layout118:setName("layout118");

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout118);
    obj.checkBox72:setWidth(17);
    obj.checkBox72:setAlign("left");
    obj.checkBox72:setMargins({right=2});
    obj.checkBox72:setField("periciacheck.direito");
    obj.checkBox72:setName("checkBox72");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout118);
    obj.label164:setAlign("left");
    obj.label164:setWidth(120);
    obj.label164:setText("Direito:");
    obj.label164:setHorzTextAlign("trailing");
    obj.label164:setMargins({right=5});
    obj.label164:setName("label164");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout118);
    obj.edit132:setType("number");
    obj.edit132:setMin(1);
    obj.edit132:setAlign("left");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setFontSize(14);
    obj.edit132:setWidth(50);
    obj.edit132:setField("pericia.direito");
    obj.edit132:setName("edit132");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout118);
    obj.label165:setAlign("left");
    obj.label165:setWidth(5);
    obj.label165:setText("");
    obj.label165:setHorzTextAlign("trailing");
    obj.label165:setMargins({right=5});
    obj.label165:setName("label165");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout118);
    obj.button81:setAlign("left");
    obj.button81:setLeft(5);
    obj.button81:setText("Rolar");
    obj.button81:setWidth(50);
    obj.button81:setName("button81");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout114);
    obj.layout119:setAlign("top");
    obj.layout119:setHeight(20);
    obj.layout119:setMargins({bottom=2, top=15});
    obj.layout119:setName("layout119");

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout119);
    obj.checkBox73:setWidth(17);
    obj.checkBox73:setAlign("left");
    obj.checkBox73:setMargins({right=2});
    obj.checkBox73:setField("periciacheck.eletronica");
    obj.checkBox73:setName("checkBox73");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout119);
    obj.label166:setAlign("left");
    obj.label166:setWidth(120);
    obj.label166:setText("Eletronica:");
    obj.label166:setHorzTextAlign("trailing");
    obj.label166:setMargins({right=5});
    obj.label166:setName("label166");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout119);
    obj.edit133:setType("number");
    obj.edit133:setMin(01);
    obj.edit133:setAlign("left");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setFontSize(14);
    obj.edit133:setWidth(50);
    obj.edit133:setField("pericia.eletronica");
    obj.edit133:setName("edit133");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout119);
    obj.label167:setAlign("left");
    obj.label167:setWidth(5);
    obj.label167:setText("");
    obj.label167:setHorzTextAlign("trailing");
    obj.label167:setMargins({right=5});
    obj.label167:setName("label167");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout119);
    obj.button82:setAlign("left");
    obj.button82:setLeft(5);
    obj.button82:setText("Rolar");
    obj.button82:setWidth(50);
    obj.button82:setName("button82");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout114);
    obj.layout120:setAlign("top");
    obj.layout120:setHeight(20);
    obj.layout120:setMargins({bottom=2, top=15});
    obj.layout120:setName("layout120");

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout120);
    obj.checkBox74:setWidth(17);
    obj.checkBox74:setAlign("left");
    obj.checkBox74:setMargins({right=2});
    obj.checkBox74:setField("periciacheck.historia");
    obj.checkBox74:setName("checkBox74");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout120);
    obj.label168:setAlign("left");
    obj.label168:setWidth(120);
    obj.label168:setText("História:");
    obj.label168:setHorzTextAlign("trailing");
    obj.label168:setMargins({right=5});
    obj.label168:setName("label168");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout120);
    obj.edit134:setType("number");
    obj.edit134:setMin(05);
    obj.edit134:setAlign("left");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setFontSize(14);
    obj.edit134:setWidth(50);
    obj.edit134:setField("pericia.historia");
    obj.edit134:setName("edit134");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout120);
    obj.label169:setAlign("left");
    obj.label169:setWidth(5);
    obj.label169:setText("");
    obj.label169:setHorzTextAlign("trailing");
    obj.label169:setMargins({right=5});
    obj.label169:setName("label169");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout120);
    obj.button83:setAlign("left");
    obj.button83:setLeft(5);
    obj.button83:setText("Rolar");
    obj.button83:setWidth(50);
    obj.button83:setName("button83");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout114);
    obj.layout121:setAlign("top");
    obj.layout121:setHeight(20);
    obj.layout121:setMargins({bottom=2, top=15});
    obj.layout121:setName("layout121");

    obj.checkBox75 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout121);
    obj.checkBox75:setWidth(17);
    obj.checkBox75:setAlign("left");
    obj.checkBox75:setMargins({right=2});
    obj.checkBox75:setField("periciacheck.medicina");
    obj.checkBox75:setName("checkBox75");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout121);
    obj.label170:setAlign("left");
    obj.label170:setWidth(120);
    obj.label170:setText("Medicina:");
    obj.label170:setHorzTextAlign("trailing");
    obj.label170:setMargins({right=5});
    obj.label170:setName("label170");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout121);
    obj.edit135:setType("number");
    obj.edit135:setMin(1);
    obj.edit135:setAlign("left");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setFontSize(14);
    obj.edit135:setWidth(50);
    obj.edit135:setField("pericia.medicina");
    obj.edit135:setName("edit135");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout121);
    obj.label171:setAlign("left");
    obj.label171:setWidth(5);
    obj.label171:setText("");
    obj.label171:setHorzTextAlign("trailing");
    obj.label171:setMargins({right=5});
    obj.label171:setName("label171");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout121);
    obj.button84:setAlign("left");
    obj.button84:setLeft(5);
    obj.button84:setText("Rolar");
    obj.button84:setWidth(50);
    obj.button84:setName("button84");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout114);
    obj.layout122:setAlign("top");
    obj.layout122:setHeight(20);
    obj.layout122:setMargins({bottom=2, top=15});
    obj.layout122:setName("layout122");

    obj.checkBox76 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout122);
    obj.checkBox76:setWidth(17);
    obj.checkBox76:setAlign("left");
    obj.checkBox76:setMargins({right=2});
    obj.checkBox76:setField("periciacheck.mundoN");
    obj.checkBox76:setName("checkBox76");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout122);
    obj.label172:setAlign("left");
    obj.label172:setWidth(120);
    obj.label172:setText("Mundo Natural:");
    obj.label172:setHorzTextAlign("trailing");
    obj.label172:setMargins({right=5});
    obj.label172:setName("label172");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout122);
    obj.edit136:setType("number");
    obj.edit136:setMin(10);
    obj.edit136:setAlign("left");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setFontSize(14);
    obj.edit136:setWidth(50);
    obj.edit136:setField("pericia.mundoN");
    obj.edit136:setName("edit136");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout122);
    obj.label173:setAlign("left");
    obj.label173:setWidth(5);
    obj.label173:setText("");
    obj.label173:setHorzTextAlign("trailing");
    obj.label173:setMargins({right=5});
    obj.label173:setName("label173");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout122);
    obj.button85:setAlign("left");
    obj.button85:setLeft(5);
    obj.button85:setText("Rolar");
    obj.button85:setWidth(50);
    obj.button85:setName("button85");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout114);
    obj.layout123:setAlign("top");
    obj.layout123:setHeight(20);
    obj.layout123:setMargins({bottom=2, top=15});
    obj.layout123:setName("layout123");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout123);
    obj.label174:setAlign("left");
    obj.label174:setWidth(14);
    obj.label174:setText(" ");
    obj.label174:setHorzTextAlign("trailing");
    obj.label174:setMargins({right=5});
    obj.label174:setName("label174");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout123);
    obj.label175:setAlign("left");
    obj.label175:setWidth(120);
    obj.label175:setText("Ciências:");
    obj.label175:setHorzTextAlign("trailing");
    obj.label175:setMargins({right=5});
    obj.label175:setName("label175");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout123);
    obj.edit137:setType("number");
    obj.edit137:setAsNumber(1);
    obj.edit137:setAlign("left");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setFontSize(14);
    obj.edit137:setWidth(50);
    obj.edit137:setReadOnly(true);
    obj.edit137:setName("edit137");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout123);
    obj.label176:setAlign("left");
    obj.label176:setWidth(5);
    obj.label176:setText("");
    obj.label176:setHorzTextAlign("trailing");
    obj.label176:setMargins({right=5});
    obj.label176:setName("label176");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout114);
    obj.layout124:setAlign("top");
    obj.layout124:setHeight(20);
    obj.layout124:setMargins({bottom=2, top=15});
    obj.layout124:setName("layout124");

    obj.checkBox77 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout124);
    obj.checkBox77:setWidth(17);
    obj.checkBox77:setAlign("left");
    obj.checkBox77:setMargins({right=2});
    obj.checkBox77:setField("periciacheck.ciee1");
    obj.checkBox77:setName("checkBox77");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout124);
    obj.edit138:setAlign("left");
    obj.edit138:setHorzTextAlign("trailing");
    obj.edit138:setFontSize(14);
    obj.edit138:setWidth(120);
    obj.edit138:setField("pericia.nome.ciee1");
    obj.edit138:setMargins({right=5});
    obj.edit138:setName("edit138");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout124);
    obj.edit139:setType("number");
    obj.edit139:setMin(1);
    obj.edit139:setAlign("left");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setFontSize(14);
    obj.edit139:setWidth(50);
    obj.edit139:setField("pericia.ciee1");
    obj.edit139:setName("edit139");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout124);
    obj.label177:setAlign("left");
    obj.label177:setWidth(5);
    obj.label177:setText("");
    obj.label177:setHorzTextAlign("trailing");
    obj.label177:setMargins({right=5});
    obj.label177:setName("label177");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout124);
    obj.button86:setAlign("left");
    obj.button86:setLeft(5);
    obj.button86:setText("Rolar");
    obj.button86:setWidth(50);
    obj.button86:setName("button86");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout114);
    obj.layout125:setAlign("top");
    obj.layout125:setHeight(20);
    obj.layout125:setMargins({bottom=2, top=15});
    obj.layout125:setName("layout125");

    obj.checkBox78 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout125);
    obj.checkBox78:setWidth(17);
    obj.checkBox78:setAlign("left");
    obj.checkBox78:setMargins({right=2});
    obj.checkBox78:setField("periciacheck.ciee2");
    obj.checkBox78:setName("checkBox78");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout125);
    obj.edit140:setAlign("left");
    obj.edit140:setHorzTextAlign("trailing");
    obj.edit140:setFontSize(14);
    obj.edit140:setWidth(120);
    obj.edit140:setField("pericia.nome.ciee2");
    obj.edit140:setMargins({right=5});
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout125);
    obj.edit141:setType("number");
    obj.edit141:setMin(1);
    obj.edit141:setAlign("left");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setFontSize(14);
    obj.edit141:setWidth(50);
    obj.edit141:setField("pericia.ciee2");
    obj.edit141:setName("edit141");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout125);
    obj.label178:setAlign("left");
    obj.label178:setWidth(5);
    obj.label178:setText("");
    obj.label178:setHorzTextAlign("trailing");
    obj.label178:setMargins({right=5});
    obj.label178:setName("label178");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.layout125);
    obj.button87:setAlign("left");
    obj.button87:setLeft(5);
    obj.button87:setText("Rolar");
    obj.button87:setWidth(50);
    obj.button87:setName("button87");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout114);
    obj.layout126:setAlign("top");
    obj.layout126:setHeight(20);
    obj.layout126:setMargins({bottom=2, top=15});
    obj.layout126:setName("layout126");

    obj.checkBox79 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout126);
    obj.checkBox79:setWidth(17);
    obj.checkBox79:setAlign("left");
    obj.checkBox79:setMargins({right=2});
    obj.checkBox79:setField("periciacheck.ciee3");
    obj.checkBox79:setName("checkBox79");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout126);
    obj.edit142:setAlign("left");
    obj.edit142:setHorzTextAlign("trailing");
    obj.edit142:setFontSize(14);
    obj.edit142:setWidth(120);
    obj.edit142:setField("pericia.nome.ciee3");
    obj.edit142:setMargins({right=5});
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout126);
    obj.edit143:setType("number");
    obj.edit143:setMin(1);
    obj.edit143:setAlign("left");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setFontSize(14);
    obj.edit143:setWidth(50);
    obj.edit143:setField("pericia.ciee3");
    obj.edit143:setName("edit143");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout126);
    obj.label179:setAlign("left");
    obj.label179:setWidth(5);
    obj.label179:setText("");
    obj.label179:setHorzTextAlign("trailing");
    obj.label179:setMargins({right=5});
    obj.label179:setName("label179");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout126);
    obj.button88:setAlign("left");
    obj.button88:setLeft(5);
    obj.button88:setText("Rolar");
    obj.button88:setWidth(50);
    obj.button88:setName("button88");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout114);
    obj.layout127:setAlign("top");
    obj.layout127:setHeight(20);
    obj.layout127:setMargins({bottom=2, top=15});
    obj.layout127:setName("layout127");

    obj.checkBox80 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout127);
    obj.checkBox80:setWidth(17);
    obj.checkBox80:setAlign("left");
    obj.checkBox80:setMargins({right=2});
    obj.checkBox80:setField("periciacheck.arcos");
    obj.checkBox80:setName("checkBox80");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout127);
    obj.label180:setAlign("left");
    obj.label180:setWidth(120);
    obj.label180:setText("Arcos:");
    obj.label180:setHorzTextAlign("trailing");
    obj.label180:setMargins({right=5});
    obj.label180:setName("label180");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout127);
    obj.edit144:setType("number");
    obj.edit144:setMin(15);
    obj.edit144:setAlign("left");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setFontSize(14);
    obj.edit144:setWidth(50);
    obj.edit144:setField("pericia.arcos");
    obj.edit144:setName("edit144");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout127);
    obj.label181:setAlign("left");
    obj.label181:setWidth(5);
    obj.label181:setText("");
    obj.label181:setHorzTextAlign("trailing");
    obj.label181:setMargins({right=5});
    obj.label181:setName("label181");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout127);
    obj.button89:setAlign("left");
    obj.button89:setLeft(5);
    obj.button89:setText("Rolar");
    obj.button89:setWidth(50);
    obj.button89:setName("button89");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout114);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(20);
    obj.layout128:setMargins({bottom=2, top=15});
    obj.layout128:setName("layout128");

    obj.checkBox81 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout128);
    obj.checkBox81:setWidth(17);
    obj.checkBox81:setAlign("left");
    obj.checkBox81:setMargins({right=2});
    obj.checkBox81:setField("periciacheck.armasP");
    obj.checkBox81:setName("checkBox81");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout128);
    obj.label182:setAlign("left");
    obj.label182:setWidth(120);
    obj.label182:setText("Armas Pesadas:");
    obj.label182:setHorzTextAlign("trailing");
    obj.label182:setMargins({right=5});
    obj.label182:setName("label182");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout128);
    obj.edit145:setType("number");
    obj.edit145:setMin(10);
    obj.edit145:setAlign("left");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setFontSize(14);
    obj.edit145:setWidth(50);
    obj.edit145:setField("pericia.armasP");
    obj.edit145:setName("edit145");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout128);
    obj.label183:setAlign("left");
    obj.label183:setWidth(5);
    obj.label183:setText("");
    obj.label183:setHorzTextAlign("trailing");
    obj.label183:setMargins({right=5});
    obj.label183:setName("label183");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout128);
    obj.button90:setAlign("left");
    obj.button90:setLeft(5);
    obj.button90:setText("Rolar");
    obj.button90:setWidth(50);
    obj.button90:setName("button90");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout114);
    obj.layout129:setAlign("top");
    obj.layout129:setHeight(20);
    obj.layout129:setMargins({bottom=2, top=15});
    obj.layout129:setName("layout129");

    obj.checkBox82 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout129);
    obj.checkBox82:setWidth(17);
    obj.checkBox82:setAlign("left");
    obj.checkBox82:setMargins({right=2});
    obj.checkBox82:setField("periciacheck.lancaC");
    obj.checkBox82:setName("checkBox82");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout129);
    obj.label184:setAlign("left");
    obj.label184:setWidth(120);
    obj.label184:setText("Lança-Chamas:");
    obj.label184:setHorzTextAlign("trailing");
    obj.label184:setMargins({right=5});
    obj.label184:setName("label184");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout129);
    obj.edit146:setType("number");
    obj.edit146:setMin(10);
    obj.edit146:setAlign("left");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setFontSize(14);
    obj.edit146:setWidth(50);
    obj.edit146:setField("pericia.lancaC");
    obj.edit146:setName("edit146");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout129);
    obj.label185:setAlign("left");
    obj.label185:setWidth(5);
    obj.label185:setText("");
    obj.label185:setHorzTextAlign("trailing");
    obj.label185:setMargins({right=5});
    obj.label185:setName("label185");

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.layout129);
    obj.button91:setAlign("left");
    obj.button91:setLeft(5);
    obj.button91:setText("Rolar");
    obj.button91:setWidth(50);
    obj.button91:setName("button91");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout114);
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(20);
    obj.layout130:setMargins({bottom=2, top=15});
    obj.layout130:setName("layout130");

    obj.checkBox83 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout130);
    obj.checkBox83:setWidth(17);
    obj.checkBox83:setAlign("left");
    obj.checkBox83:setMargins({right=2});
    obj.checkBox83:setField("periciacheck.metralhadora");
    obj.checkBox83:setName("checkBox83");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout130);
    obj.label186:setAlign("left");
    obj.label186:setWidth(120);
    obj.label186:setText("Metralhadoras:");
    obj.label186:setHorzTextAlign("trailing");
    obj.label186:setMargins({right=5});
    obj.label186:setName("label186");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout130);
    obj.edit147:setType("number");
    obj.edit147:setMin(10);
    obj.edit147:setAlign("left");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setFontSize(14);
    obj.edit147:setWidth(50);
    obj.edit147:setField("pericia.metralhadora");
    obj.edit147:setName("edit147");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout130);
    obj.label187:setAlign("left");
    obj.label187:setWidth(5);
    obj.label187:setText("");
    obj.label187:setHorzTextAlign("trailing");
    obj.label187:setMargins({right=5});
    obj.label187:setName("label187");

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.layout130);
    obj.button92:setAlign("left");
    obj.button92:setLeft(5);
    obj.button92:setText("Rolar");
    obj.button92:setWidth(50);
    obj.button92:setName("button92");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout114);
    obj.layout131:setAlign("top");
    obj.layout131:setHeight(20);
    obj.layout131:setMargins({bottom=2, top=15});
    obj.layout131:setName("layout131");

    obj.checkBox84 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout131);
    obj.checkBox84:setWidth(17);
    obj.checkBox84:setAlign("left");
    obj.checkBox84:setMargins({right=2});
    obj.checkBox84:setField("periciacheck.pistolas");
    obj.checkBox84:setName("checkBox84");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout131);
    obj.label188:setAlign("left");
    obj.label188:setWidth(120);
    obj.label188:setText("Pistolas:");
    obj.label188:setHorzTextAlign("trailing");
    obj.label188:setMargins({right=5});
    obj.label188:setName("label188");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout131);
    obj.edit148:setType("number");
    obj.edit148:setMin(20);
    obj.edit148:setAlign("left");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setFontSize(14);
    obj.edit148:setWidth(50);
    obj.edit148:setField("pericia.pistolas");
    obj.edit148:setName("edit148");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout131);
    obj.label189:setAlign("left");
    obj.label189:setWidth(5);
    obj.label189:setText("");
    obj.label189:setHorzTextAlign("trailing");
    obj.label189:setMargins({right=5});
    obj.label189:setName("label189");

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.layout131);
    obj.button93:setAlign("left");
    obj.button93:setLeft(5);
    obj.button93:setText("Rolar");
    obj.button93:setWidth(50);
    obj.button93:setName("button93");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout114);
    obj.layout132:setAlign("top");
    obj.layout132:setHeight(20);
    obj.layout132:setMargins({bottom=2, top=15});
    obj.layout132:setName("layout132");

    obj.checkBox85 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout132);
    obj.checkBox85:setWidth(17);
    obj.checkBox85:setAlign("left");
    obj.checkBox85:setMargins({right=2});
    obj.checkBox85:setField("periciacheck.riflesE");
    obj.checkBox85:setName("checkBox85");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout132);
    obj.label190:setAlign("left");
    obj.label190:setWidth(120);
    obj.label190:setText("Rifles/Espingardas:");
    obj.label190:setHorzTextAlign("trailing");
    obj.label190:setMargins({right=5});
    obj.label190:setName("label190");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout132);
    obj.edit149:setType("number");
    obj.edit149:setMin(25);
    obj.edit149:setAlign("left");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setFontSize(14);
    obj.edit149:setWidth(50);
    obj.edit149:setField("pericia.riflesE");
    obj.edit149:setName("edit149");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout132);
    obj.label191:setAlign("left");
    obj.label191:setWidth(5);
    obj.label191:setText("");
    obj.label191:setHorzTextAlign("trailing");
    obj.label191:setMargins({right=5});
    obj.label191:setName("label191");

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.layout132);
    obj.button94:setAlign("left");
    obj.button94:setLeft(5);
    obj.button94:setText("Rolar");
    obj.button94:setWidth(50);
    obj.button94:setName("button94");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout114);
    obj.layout133:setAlign("top");
    obj.layout133:setHeight(20);
    obj.layout133:setMargins({bottom=2, top=15});
    obj.layout133:setName("layout133");

    obj.checkBox86 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout133);
    obj.checkBox86:setWidth(17);
    obj.checkBox86:setAlign("left");
    obj.checkBox86:setMargins({right=2});
    obj.checkBox86:setField("periciacheck.submetralhadoras");
    obj.checkBox86:setName("checkBox86");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout133);
    obj.label192:setAlign("left");
    obj.label192:setWidth(120);
    obj.label192:setText("Submetralhadoras:");
    obj.label192:setHorzTextAlign("trailing");
    obj.label192:setMargins({right=5});
    obj.label192:setName("label192");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout133);
    obj.edit150:setType("number");
    obj.edit150:setMin(15);
    obj.edit150:setAlign("left");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setFontSize(14);
    obj.edit150:setWidth(50);
    obj.edit150:setField("pericia.submetralhadoras");
    obj.edit150:setName("edit150");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout133);
    obj.label193:setAlign("left");
    obj.label193:setWidth(5);
    obj.label193:setText("");
    obj.label193:setHorzTextAlign("trailing");
    obj.label193:setMargins({right=5});
    obj.label193:setName("label193");

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.layout133);
    obj.button95:setAlign("left");
    obj.button95:setLeft(5);
    obj.button95:setText("Rolar");
    obj.button95:setWidth(50);
    obj.button95:setName("button95");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout114);
    obj.layout134:setAlign("top");
    obj.layout134:setHeight(20);
    obj.layout134:setMargins({bottom=2, top=15});
    obj.layout134:setName("layout134");

    obj.checkBox87 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout134);
    obj.checkBox87:setWidth(17);
    obj.checkBox87:setAlign("left");
    obj.checkBox87:setMargins({right=2});
    obj.checkBox87:setField("periciacheck.arma1");
    obj.checkBox87:setName("checkBox87");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout134);
    obj.edit151:setAlign("left");
    obj.edit151:setHorzTextAlign("trailing");
    obj.edit151:setFontSize(14);
    obj.edit151:setWidth(120);
    obj.edit151:setField("pericia.nome.arma1");
    obj.edit151:setMargins({right=5});
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout134);
    obj.edit152:setType("number");
    obj.edit152:setMin(00);
    obj.edit152:setAlign("left");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setFontSize(14);
    obj.edit152:setWidth(50);
    obj.edit152:setField("pericia.arma1");
    obj.edit152:setName("edit152");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout134);
    obj.label194:setAlign("left");
    obj.label194:setWidth(5);
    obj.label194:setText("");
    obj.label194:setHorzTextAlign("trailing");
    obj.label194:setMargins({right=5});
    obj.label194:setName("label194");

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.layout134);
    obj.button96:setAlign("left");
    obj.button96:setLeft(5);
    obj.button96:setText("Rolar");
    obj.button96:setWidth(50);
    obj.button96:setName("button96");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout114);
    obj.layout135:setAlign("top");
    obj.layout135:setHeight(20);
    obj.layout135:setMargins({bottom=2, top=15});
    obj.layout135:setName("layout135");

    obj.checkBox88 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout135);
    obj.checkBox88:setWidth(17);
    obj.checkBox88:setAlign("left");
    obj.checkBox88:setMargins({right=2});
    obj.checkBox88:setField("periciacheck.arma2");
    obj.checkBox88:setName("checkBox88");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout135);
    obj.edit153:setAlign("left");
    obj.edit153:setHorzTextAlign("trailing");
    obj.edit153:setFontSize(14);
    obj.edit153:setWidth(120);
    obj.edit153:setField("pericia.nome.arma2");
    obj.edit153:setMargins({right=5});
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout135);
    obj.edit154:setType("number");
    obj.edit154:setMin(00);
    obj.edit154:setAlign("left");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setFontSize(14);
    obj.edit154:setWidth(50);
    obj.edit154:setField("pericia.arma2");
    obj.edit154:setName("edit154");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout135);
    obj.label195:setAlign("left");
    obj.label195:setWidth(5);
    obj.label195:setText("");
    obj.label195:setHorzTextAlign("trailing");
    obj.label195:setMargins({right=5});
    obj.label195:setName("label195");

    obj.button97 = GUI.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.layout135);
    obj.button97:setAlign("left");
    obj.button97:setLeft(5);
    obj.button97:setText("Rolar");
    obj.button97:setWidth(50);
    obj.button97:setName("button97");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout114);
    obj.layout136:setAlign("top");
    obj.layout136:setHeight(20);
    obj.layout136:setMargins({bottom=2, top=15});
    obj.layout136:setName("layout136");

    obj.checkBox89 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout136);
    obj.checkBox89:setWidth(17);
    obj.checkBox89:setAlign("left");
    obj.checkBox89:setMargins({right=2});
    obj.checkBox89:setField("periciacheck.arma3");
    obj.checkBox89:setName("checkBox89");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout136);
    obj.edit155:setAlign("left");
    obj.edit155:setHorzTextAlign("trailing");
    obj.edit155:setFontSize(14);
    obj.edit155:setWidth(120);
    obj.edit155:setField("pericia.nome.arma3");
    obj.edit155:setMargins({right=5});
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout136);
    obj.edit156:setType("number");
    obj.edit156:setMin(00);
    obj.edit156:setAlign("left");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setFontSize(14);
    obj.edit156:setWidth(50);
    obj.edit156:setField("pericia.arma3");
    obj.edit156:setName("edit156");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout136);
    obj.label196:setAlign("left");
    obj.label196:setWidth(5);
    obj.label196:setText("");
    obj.label196:setHorzTextAlign("trailing");
    obj.label196:setMargins({right=5});
    obj.label196:setName("label196");

    obj.button98 = GUI.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.layout136);
    obj.button98:setAlign("left");
    obj.button98:setLeft(5);
    obj.button98:setText("Rolar");
    obj.button98:setWidth(50);
    obj.button98:setName("button98");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout114);
    obj.layout137:setAlign("top");
    obj.layout137:setHeight(20);
    obj.layout137:setMargins({bottom=2, top=15});
    obj.layout137:setName("layout137");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout137);
    obj.label197:setAlign("left");
    obj.label197:setWidth(14);
    obj.label197:setText(" ");
    obj.label197:setHorzTextAlign("trailing");
    obj.label197:setMargins({right=5});
    obj.label197:setName("label197");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout137);
    obj.label198:setAlign("left");
    obj.label198:setWidth(120);
    obj.label198:setText("Outros:");
    obj.label198:setHorzTextAlign("trailing");
    obj.label198:setMargins({right=5});
    obj.label198:setName("label198");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout137);
    obj.label199:setAlign("left");
    obj.label199:setWidth(5);
    obj.label199:setText("");
    obj.label199:setHorzTextAlign("trailing");
    obj.label199:setMargins({right=5});
    obj.label199:setName("label199");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout114);
    obj.layout138:setAlign("top");
    obj.layout138:setHeight(20);
    obj.layout138:setMargins({bottom=2, top=15});
    obj.layout138:setName("layout138");

    obj.checkBox90 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout138);
    obj.checkBox90:setWidth(17);
    obj.checkBox90:setAlign("left");
    obj.checkBox90:setMargins({right=2});
    obj.checkBox90:setField("periciacheck.outro23");
    obj.checkBox90:setName("checkBox90");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout138);
    obj.edit157:setAlign("left");
    obj.edit157:setHorzTextAlign("trailing");
    obj.edit157:setFontSize(14);
    obj.edit157:setWidth(120);
    obj.edit157:setField("pericia.nome.outro23");
    obj.edit157:setMargins({right=5});
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout138);
    obj.edit158:setType("number");
    obj.edit158:setMin(00);
    obj.edit158:setAlign("left");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setFontSize(14);
    obj.edit158:setWidth(50);
    obj.edit158:setField("pericia.outro23");
    obj.edit158:setName("edit158");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout138);
    obj.label200:setAlign("left");
    obj.label200:setWidth(5);
    obj.label200:setText("");
    obj.label200:setHorzTextAlign("trailing");
    obj.label200:setMargins({right=5});
    obj.label200:setName("label200");

    obj.button99 = GUI.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.layout138);
    obj.button99:setAlign("left");
    obj.button99:setLeft(5);
    obj.button99:setText("Rolar");
    obj.button99:setWidth(50);
    obj.button99:setName("button99");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout114);
    obj.layout139:setAlign("top");
    obj.layout139:setHeight(20);
    obj.layout139:setMargins({bottom=2, top=15});
    obj.layout139:setName("layout139");

    obj.checkBox91 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout139);
    obj.checkBox91:setWidth(17);
    obj.checkBox91:setAlign("left");
    obj.checkBox91:setMargins({right=2});
    obj.checkBox91:setField("periciacheck.outro24");
    obj.checkBox91:setName("checkBox91");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout139);
    obj.edit159:setAlign("left");
    obj.edit159:setHorzTextAlign("trailing");
    obj.edit159:setFontSize(14);
    obj.edit159:setWidth(120);
    obj.edit159:setField("pericia.nome.outro24");
    obj.edit159:setMargins({right=5});
    obj.edit159:setName("edit159");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout139);
    obj.edit160:setType("number");
    obj.edit160:setMin(00);
    obj.edit160:setAlign("left");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setFontSize(14);
    obj.edit160:setWidth(50);
    obj.edit160:setField("pericia.outro24");
    obj.edit160:setName("edit160");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout139);
    obj.label201:setAlign("left");
    obj.label201:setWidth(5);
    obj.label201:setText("");
    obj.label201:setHorzTextAlign("trailing");
    obj.label201:setMargins({right=5});
    obj.label201:setName("label201");

    obj.button100 = GUI.fromHandle(_obj_newObject("button"));
    obj.button100:setParent(obj.layout139);
    obj.button100:setAlign("left");
    obj.button100:setLeft(5);
    obj.button100:setText("Rolar");
    obj.button100:setWidth(50);
    obj.button100:setName("button100");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.scrollBox1);
    obj.layout140:setAlign("none");
    obj.layout140:setLeft(5);
    obj.layout140:setHeight(332);
    obj.layout140:setWidth(996);
    obj.layout140:setTop(1310);
    obj.layout140:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout140:setMargins({left=30, right=10, bottom=10});
    obj.layout140:setName("layout140");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout140);
    obj.label202:setText("Ataques");
    obj.label202:setLeft(491);
    lfm_setPropAsString(obj.label202, "fontStyle",  "bold italic");
    obj.label202:setTop(9);
    obj.label202:setWidth(996);
    obj.label202:setName("label202");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout140);
    obj.label203:setText("*Todas as caixas de texto devem estar prenchidas antes de rolar o ataque. Use o valor -1 na munição para armas que não utilizam munição e DEF 101 para armas que não possuem Defeito.");
    obj.label203:setFontSize(10);
    obj.label203:setFontColor("Yellow");
    obj.label203:setHorzTextAlign("trailing");
    obj.label203:setLeft(-25);
    lfm_setPropAsString(obj.label203, "fontStyle",  "italic");
    obj.label203:setTop(22);
    obj.label203:setWidth(996);
    obj.label203:setName("label203");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout140);
    obj.layout141:setLeft(20);
    obj.layout141:setTop(25);
    obj.layout141:setWidth(996);
    obj.layout141:setHeight(332);
    obj.layout141:setName("layout141");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout141);
    obj.layout142:setAlign("top");
    obj.layout142:setHeight(20);
    obj.layout142:setMargins({bottom=2, top=15});
    obj.layout142:setName("layout142");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout142);
    obj.label204:setAlign("left");
    obj.label204:setWidth(5);
    obj.label204:setText("");
    obj.label204:setHorzTextAlign("trailing");
    obj.label204:setMargins({right=5});
    obj.label204:setName("label204");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout142);
    obj.edit161:setAlign("left");
    obj.edit161:setHorzTextAlign("leading");
    obj.edit161:setFontSize(14);
    obj.edit161:setWidth(120);
    obj.edit161:setField("ataque.nome.a1");
    obj.edit161:setMargins({right=5});
    obj.edit161:setName("edit161");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout142);
    obj.label205:setAlign("left");
    obj.label205:setWidth(50);
    obj.label205:setText("Tipo: ");
    obj.label205:setHorzTextAlign("trailing");
    obj.label205:setMargins({right=5});
    obj.label205:setName("label205");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout142);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox1:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setField("ataque.tipo.a1");
    obj.comboBox1:setName("comboBox1");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout142);
    obj.label206:setAlign("left");
    obj.label206:setWidth(55);
    obj.label206:setText("Ataques: ");
    obj.label206:setHorzTextAlign("trailing");
    obj.label206:setMargins({right=5});
    obj.label206:setName("label206");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout142);
    obj.edit162:setAlign("left");
    obj.edit162:setHorzTextAlign("leading");
    obj.edit162:setFontSize(14);
    obj.edit162:setWidth(30);
    obj.edit162:setField("ataque.quantidade.a1");
    obj.edit162:setMargins({right=5});
    obj.edit162:setName("edit162");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout142);
    obj.label207:setAlign("left");
    obj.label207:setWidth(60);
    obj.label207:setText("Alcance: ");
    obj.label207:setHorzTextAlign("trailing");
    obj.label207:setMargins({right=5});
    obj.label207:setName("label207");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout142);
    obj.edit163:setAlign("left");
    obj.edit163:setHorzTextAlign("leading");
    obj.edit163:setFontSize(14);
    obj.edit163:setWidth(30);
    obj.edit163:setField("ataque.alcance.a1");
    obj.edit163:setMargins({right=5});
    obj.edit163:setName("edit163");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout142);
    obj.label208:setAlign("left");
    obj.label208:setWidth(110);
    obj.label208:setText("Munição na arma: ");
    obj.label208:setHorzTextAlign("trailing");
    obj.label208:setMargins({right=5});
    obj.label208:setName("label208");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout142);
    obj.edit164:setAlign("left");
    obj.edit164:setHorzTextAlign("leading");
    obj.edit164:setFontSize(14);
    obj.edit164:setWidth(30);
    obj.edit164:setField("ataque.municao.a1");
    obj.edit164:setMargins({right=5});
    obj.edit164:setName("edit164");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout142);
    obj.label209:setAlign("left");
    obj.label209:setWidth(30);
    obj.label209:setText("DEF: ");
    obj.label209:setHorzTextAlign("trailing");
    obj.label209:setMargins({right=5});
    obj.label209:setName("label209");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout142);
    obj.edit165:setType("number");
    obj.edit165:setAlign("left");
    obj.edit165:setHorzTextAlign("leading");
    obj.edit165:setFontSize(14);
    obj.edit165:setWidth(25);
    obj.edit165:setField("ataque.defeito.a1");
    obj.edit165:setMargins({right=5});
    obj.edit165:setName("edit165");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout142);
    obj.label210:setAlign("left");
    obj.label210:setWidth(50);
    obj.label210:setText("Dano: ");
    obj.label210:setHorzTextAlign("trailing");
    obj.label210:setMargins({right=5});
    obj.label210:setName("label210");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout142);
    obj.edit166:setAlign("left");
    obj.edit166:setHorzTextAlign("leading");
    obj.edit166:setFontSize(14);
    obj.edit166:setWidth(55);
    obj.edit166:setField("ataque.dano.a1");
    obj.edit166:setMargins({right=5});
    obj.edit166:setName("edit166");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout142);
    obj.label211:setAlign("left");
    obj.label211:setWidth(5);
    obj.label211:setText("");
    obj.label211:setHorzTextAlign("trailing");
    obj.label211:setMargins({right=5});
    obj.label211:setName("label211");

    obj.button101 = GUI.fromHandle(_obj_newObject("button"));
    obj.button101:setParent(obj.layout142);
    obj.button101:setAlign("left");
    obj.button101:setLeft(5);
    obj.button101:setText("Rolar");
    obj.button101:setWidth(40);
    obj.button101:setName("button101");

    obj.button102 = GUI.fromHandle(_obj_newObject("button"));
    obj.button102:setParent(obj.layout142);
    obj.button102:setAlign("left");
    obj.button102:setLeft(15);
    obj.button102:setText("van/des");
    obj.button102:setWidth(45);
    obj.button102:setFontSize(9);
    obj.button102:setName("button102");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout141);
    obj.layout143:setAlign("top");
    obj.layout143:setHeight(20);
    obj.layout143:setMargins({bottom=2, top=15});
    obj.layout143:setName("layout143");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout143);
    obj.label212:setAlign("left");
    obj.label212:setWidth(5);
    obj.label212:setText("");
    obj.label212:setHorzTextAlign("trailing");
    obj.label212:setMargins({right=5});
    obj.label212:setName("label212");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout143);
    obj.edit167:setAlign("left");
    obj.edit167:setHorzTextAlign("leading");
    obj.edit167:setFontSize(14);
    obj.edit167:setWidth(120);
    obj.edit167:setField("ataque.nome.a2");
    obj.edit167:setMargins({right=5});
    obj.edit167:setName("edit167");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout143);
    obj.label213:setAlign("left");
    obj.label213:setWidth(50);
    obj.label213:setText("Tipo: ");
    obj.label213:setHorzTextAlign("trailing");
    obj.label213:setMargins({right=5});
    obj.label213:setName("label213");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout143);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox2:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox2:setWidth(150);
    obj.comboBox2:setField("ataque.tipo.a2");
    obj.comboBox2:setName("comboBox2");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout143);
    obj.label214:setAlign("left");
    obj.label214:setWidth(55);
    obj.label214:setText("Ataques: ");
    obj.label214:setHorzTextAlign("trailing");
    obj.label214:setMargins({right=5});
    obj.label214:setName("label214");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout143);
    obj.edit168:setAlign("left");
    obj.edit168:setHorzTextAlign("leading");
    obj.edit168:setFontSize(14);
    obj.edit168:setWidth(30);
    obj.edit168:setField("ataque.quantidade.a2");
    obj.edit168:setMargins({right=5});
    obj.edit168:setName("edit168");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout143);
    obj.label215:setAlign("left");
    obj.label215:setWidth(60);
    obj.label215:setText("Alcance: ");
    obj.label215:setHorzTextAlign("trailing");
    obj.label215:setMargins({right=5});
    obj.label215:setName("label215");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout143);
    obj.edit169:setAlign("left");
    obj.edit169:setHorzTextAlign("leading");
    obj.edit169:setFontSize(14);
    obj.edit169:setWidth(30);
    obj.edit169:setField("ataque.alcance.a2");
    obj.edit169:setMargins({right=5});
    obj.edit169:setName("edit169");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout143);
    obj.label216:setAlign("left");
    obj.label216:setWidth(110);
    obj.label216:setText("Munição na arma: ");
    obj.label216:setHorzTextAlign("trailing");
    obj.label216:setMargins({right=5});
    obj.label216:setName("label216");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout143);
    obj.edit170:setAlign("left");
    obj.edit170:setHorzTextAlign("leading");
    obj.edit170:setFontSize(14);
    obj.edit170:setWidth(30);
    obj.edit170:setField("ataque.municao.a2");
    obj.edit170:setMargins({right=5});
    obj.edit170:setName("edit170");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout143);
    obj.label217:setAlign("left");
    obj.label217:setWidth(30);
    obj.label217:setText("DEF: ");
    obj.label217:setHorzTextAlign("trailing");
    obj.label217:setMargins({right=5});
    obj.label217:setName("label217");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout143);
    obj.edit171:setType("number");
    obj.edit171:setAlign("left");
    obj.edit171:setHorzTextAlign("leading");
    obj.edit171:setFontSize(14);
    obj.edit171:setWidth(25);
    obj.edit171:setField("ataque.defeito.a2");
    obj.edit171:setMargins({right=5});
    obj.edit171:setName("edit171");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout143);
    obj.label218:setAlign("left");
    obj.label218:setWidth(50);
    obj.label218:setText("Dano: ");
    obj.label218:setHorzTextAlign("trailing");
    obj.label218:setMargins({right=5});
    obj.label218:setName("label218");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout143);
    obj.edit172:setAlign("left");
    obj.edit172:setHorzTextAlign("leading");
    obj.edit172:setFontSize(14);
    obj.edit172:setWidth(55);
    obj.edit172:setField("ataque.dano.a2");
    obj.edit172:setMargins({right=5});
    obj.edit172:setName("edit172");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout143);
    obj.label219:setAlign("left");
    obj.label219:setWidth(5);
    obj.label219:setText("");
    obj.label219:setHorzTextAlign("trailing");
    obj.label219:setMargins({right=5});
    obj.label219:setName("label219");

    obj.button103 = GUI.fromHandle(_obj_newObject("button"));
    obj.button103:setParent(obj.layout143);
    obj.button103:setAlign("left");
    obj.button103:setLeft(5);
    obj.button103:setText("Rolar");
    obj.button103:setWidth(40);
    obj.button103:setName("button103");

    obj.button104 = GUI.fromHandle(_obj_newObject("button"));
    obj.button104:setParent(obj.layout143);
    obj.button104:setAlign("left");
    obj.button104:setLeft(15);
    obj.button104:setText("van/des");
    obj.button104:setWidth(45);
    obj.button104:setFontSize(9);
    obj.button104:setName("button104");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout141);
    obj.layout144:setAlign("top");
    obj.layout144:setHeight(20);
    obj.layout144:setMargins({bottom=2, top=15});
    obj.layout144:setName("layout144");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout144);
    obj.label220:setAlign("left");
    obj.label220:setWidth(5);
    obj.label220:setText("");
    obj.label220:setHorzTextAlign("trailing");
    obj.label220:setMargins({right=5});
    obj.label220:setName("label220");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout144);
    obj.edit173:setAlign("left");
    obj.edit173:setHorzTextAlign("leading");
    obj.edit173:setFontSize(14);
    obj.edit173:setWidth(120);
    obj.edit173:setField("ataque.nome.a3");
    obj.edit173:setMargins({right=5});
    obj.edit173:setName("edit173");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout144);
    obj.label221:setAlign("left");
    obj.label221:setWidth(50);
    obj.label221:setText("Tipo: ");
    obj.label221:setHorzTextAlign("trailing");
    obj.label221:setMargins({right=5});
    obj.label221:setName("label221");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout144);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox3:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox3:setWidth(150);
    obj.comboBox3:setField("ataque.tipo.a3");
    obj.comboBox3:setName("comboBox3");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout144);
    obj.label222:setAlign("left");
    obj.label222:setWidth(55);
    obj.label222:setText("Ataques: ");
    obj.label222:setHorzTextAlign("trailing");
    obj.label222:setMargins({right=5});
    obj.label222:setName("label222");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout144);
    obj.edit174:setAlign("left");
    obj.edit174:setHorzTextAlign("leading");
    obj.edit174:setFontSize(14);
    obj.edit174:setWidth(30);
    obj.edit174:setField("ataque.quantidade.a3");
    obj.edit174:setMargins({right=5});
    obj.edit174:setName("edit174");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout144);
    obj.label223:setAlign("left");
    obj.label223:setWidth(60);
    obj.label223:setText("Alcance: ");
    obj.label223:setHorzTextAlign("trailing");
    obj.label223:setMargins({right=5});
    obj.label223:setName("label223");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout144);
    obj.edit175:setAlign("left");
    obj.edit175:setHorzTextAlign("leading");
    obj.edit175:setFontSize(14);
    obj.edit175:setWidth(30);
    obj.edit175:setField("ataque.alcance.a3");
    obj.edit175:setMargins({right=5});
    obj.edit175:setName("edit175");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout144);
    obj.label224:setAlign("left");
    obj.label224:setWidth(110);
    obj.label224:setText("Munição na arma: ");
    obj.label224:setHorzTextAlign("trailing");
    obj.label224:setMargins({right=5});
    obj.label224:setName("label224");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout144);
    obj.edit176:setAlign("left");
    obj.edit176:setHorzTextAlign("leading");
    obj.edit176:setFontSize(14);
    obj.edit176:setWidth(30);
    obj.edit176:setField("ataque.municao.a3");
    obj.edit176:setMargins({right=5});
    obj.edit176:setName("edit176");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout144);
    obj.label225:setAlign("left");
    obj.label225:setWidth(30);
    obj.label225:setText("DEF: ");
    obj.label225:setHorzTextAlign("trailing");
    obj.label225:setMargins({right=5});
    obj.label225:setName("label225");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout144);
    obj.edit177:setType("number");
    obj.edit177:setAlign("left");
    obj.edit177:setHorzTextAlign("leading");
    obj.edit177:setFontSize(14);
    obj.edit177:setWidth(25);
    obj.edit177:setField("ataque.defeito.a3");
    obj.edit177:setMargins({right=5});
    obj.edit177:setName("edit177");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout144);
    obj.label226:setAlign("left");
    obj.label226:setWidth(50);
    obj.label226:setText("Dano: ");
    obj.label226:setHorzTextAlign("trailing");
    obj.label226:setMargins({right=5});
    obj.label226:setName("label226");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout144);
    obj.edit178:setAlign("left");
    obj.edit178:setHorzTextAlign("leading");
    obj.edit178:setFontSize(14);
    obj.edit178:setWidth(55);
    obj.edit178:setField("ataque.dano.a3");
    obj.edit178:setMargins({right=5});
    obj.edit178:setName("edit178");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout144);
    obj.label227:setAlign("left");
    obj.label227:setWidth(5);
    obj.label227:setText("");
    obj.label227:setHorzTextAlign("trailing");
    obj.label227:setMargins({right=5});
    obj.label227:setName("label227");

    obj.button105 = GUI.fromHandle(_obj_newObject("button"));
    obj.button105:setParent(obj.layout144);
    obj.button105:setAlign("left");
    obj.button105:setLeft(5);
    obj.button105:setText("Rolar");
    obj.button105:setWidth(40);
    obj.button105:setName("button105");

    obj.button106 = GUI.fromHandle(_obj_newObject("button"));
    obj.button106:setParent(obj.layout144);
    obj.button106:setAlign("left");
    obj.button106:setLeft(15);
    obj.button106:setText("van/des");
    obj.button106:setWidth(45);
    obj.button106:setFontSize(9);
    obj.button106:setName("button106");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout141);
    obj.layout145:setAlign("top");
    obj.layout145:setHeight(20);
    obj.layout145:setMargins({bottom=2, top=15});
    obj.layout145:setName("layout145");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout145);
    obj.label228:setAlign("left");
    obj.label228:setWidth(5);
    obj.label228:setText("");
    obj.label228:setHorzTextAlign("trailing");
    obj.label228:setMargins({right=5});
    obj.label228:setName("label228");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout145);
    obj.edit179:setAlign("left");
    obj.edit179:setHorzTextAlign("leading");
    obj.edit179:setFontSize(14);
    obj.edit179:setWidth(120);
    obj.edit179:setField("ataque.nome.a4");
    obj.edit179:setMargins({right=5});
    obj.edit179:setName("edit179");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout145);
    obj.label229:setAlign("left");
    obj.label229:setWidth(50);
    obj.label229:setText("Tipo: ");
    obj.label229:setHorzTextAlign("trailing");
    obj.label229:setMargins({right=5});
    obj.label229:setName("label229");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout145);
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox4:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox4:setWidth(150);
    obj.comboBox4:setField("ataque.tipo.a4");
    obj.comboBox4:setName("comboBox4");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout145);
    obj.label230:setAlign("left");
    obj.label230:setWidth(55);
    obj.label230:setText("Ataques: ");
    obj.label230:setHorzTextAlign("trailing");
    obj.label230:setMargins({right=5});
    obj.label230:setName("label230");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout145);
    obj.edit180:setAlign("left");
    obj.edit180:setHorzTextAlign("leading");
    obj.edit180:setFontSize(14);
    obj.edit180:setWidth(30);
    obj.edit180:setField("ataque.quantidade.a4");
    obj.edit180:setMargins({right=5});
    obj.edit180:setName("edit180");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout145);
    obj.label231:setAlign("left");
    obj.label231:setWidth(60);
    obj.label231:setText("Alcance: ");
    obj.label231:setHorzTextAlign("trailing");
    obj.label231:setMargins({right=5});
    obj.label231:setName("label231");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout145);
    obj.edit181:setAlign("left");
    obj.edit181:setHorzTextAlign("leading");
    obj.edit181:setFontSize(14);
    obj.edit181:setWidth(30);
    obj.edit181:setField("ataque.alcance.a4");
    obj.edit181:setMargins({right=5});
    obj.edit181:setName("edit181");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout145);
    obj.label232:setAlign("left");
    obj.label232:setWidth(110);
    obj.label232:setText("Munição na arma: ");
    obj.label232:setHorzTextAlign("trailing");
    obj.label232:setMargins({right=5});
    obj.label232:setName("label232");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout145);
    obj.edit182:setAlign("left");
    obj.edit182:setHorzTextAlign("leading");
    obj.edit182:setFontSize(14);
    obj.edit182:setWidth(30);
    obj.edit182:setField("ataque.municao.a4");
    obj.edit182:setMargins({right=5});
    obj.edit182:setName("edit182");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout145);
    obj.label233:setAlign("left");
    obj.label233:setWidth(30);
    obj.label233:setText("DEF: ");
    obj.label233:setHorzTextAlign("trailing");
    obj.label233:setMargins({right=5});
    obj.label233:setName("label233");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout145);
    obj.edit183:setType("number");
    obj.edit183:setAlign("left");
    obj.edit183:setHorzTextAlign("leading");
    obj.edit183:setFontSize(14);
    obj.edit183:setWidth(25);
    obj.edit183:setField("ataque.defeito.a4");
    obj.edit183:setMargins({right=5});
    obj.edit183:setName("edit183");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout145);
    obj.label234:setAlign("left");
    obj.label234:setWidth(50);
    obj.label234:setText("Dano: ");
    obj.label234:setHorzTextAlign("trailing");
    obj.label234:setMargins({right=5});
    obj.label234:setName("label234");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout145);
    obj.edit184:setAlign("left");
    obj.edit184:setHorzTextAlign("leading");
    obj.edit184:setFontSize(14);
    obj.edit184:setWidth(55);
    obj.edit184:setField("ataque.dano.a4");
    obj.edit184:setMargins({right=5});
    obj.edit184:setName("edit184");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout145);
    obj.label235:setAlign("left");
    obj.label235:setWidth(5);
    obj.label235:setText("");
    obj.label235:setHorzTextAlign("trailing");
    obj.label235:setMargins({right=5});
    obj.label235:setName("label235");

    obj.button107 = GUI.fromHandle(_obj_newObject("button"));
    obj.button107:setParent(obj.layout145);
    obj.button107:setAlign("left");
    obj.button107:setLeft(5);
    obj.button107:setText("Rolar");
    obj.button107:setWidth(40);
    obj.button107:setName("button107");

    obj.button108 = GUI.fromHandle(_obj_newObject("button"));
    obj.button108:setParent(obj.layout145);
    obj.button108:setAlign("left");
    obj.button108:setLeft(15);
    obj.button108:setText("van/des");
    obj.button108:setWidth(45);
    obj.button108:setFontSize(9);
    obj.button108:setName("button108");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout141);
    obj.layout146:setAlign("top");
    obj.layout146:setHeight(20);
    obj.layout146:setMargins({bottom=2, top=15});
    obj.layout146:setName("layout146");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout146);
    obj.label236:setAlign("left");
    obj.label236:setWidth(5);
    obj.label236:setText("");
    obj.label236:setHorzTextAlign("trailing");
    obj.label236:setMargins({right=5});
    obj.label236:setName("label236");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout146);
    obj.edit185:setAlign("left");
    obj.edit185:setHorzTextAlign("leading");
    obj.edit185:setFontSize(14);
    obj.edit185:setWidth(120);
    obj.edit185:setField("ataque.nome.a5");
    obj.edit185:setMargins({right=5});
    obj.edit185:setName("edit185");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout146);
    obj.label237:setAlign("left");
    obj.label237:setWidth(50);
    obj.label237:setText("Tipo: ");
    obj.label237:setHorzTextAlign("trailing");
    obj.label237:setMargins({right=5});
    obj.label237:setName("label237");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout146);
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox5:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox5:setWidth(150);
    obj.comboBox5:setField("ataque.tipo.a5");
    obj.comboBox5:setName("comboBox5");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout146);
    obj.label238:setAlign("left");
    obj.label238:setWidth(55);
    obj.label238:setText("Ataques: ");
    obj.label238:setHorzTextAlign("trailing");
    obj.label238:setMargins({right=5});
    obj.label238:setName("label238");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout146);
    obj.edit186:setAlign("left");
    obj.edit186:setHorzTextAlign("leading");
    obj.edit186:setFontSize(14);
    obj.edit186:setWidth(30);
    obj.edit186:setField("ataque.quantidade.a5");
    obj.edit186:setMargins({right=5});
    obj.edit186:setName("edit186");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout146);
    obj.label239:setAlign("left");
    obj.label239:setWidth(60);
    obj.label239:setText("Alcance: ");
    obj.label239:setHorzTextAlign("trailing");
    obj.label239:setMargins({right=5});
    obj.label239:setName("label239");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout146);
    obj.edit187:setAlign("left");
    obj.edit187:setHorzTextAlign("leading");
    obj.edit187:setFontSize(14);
    obj.edit187:setWidth(30);
    obj.edit187:setField("ataque.alcance.a5");
    obj.edit187:setMargins({right=5});
    obj.edit187:setName("edit187");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout146);
    obj.label240:setAlign("left");
    obj.label240:setWidth(110);
    obj.label240:setText("Munição na arma: ");
    obj.label240:setHorzTextAlign("trailing");
    obj.label240:setMargins({right=5});
    obj.label240:setName("label240");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout146);
    obj.edit188:setAlign("left");
    obj.edit188:setHorzTextAlign("leading");
    obj.edit188:setFontSize(14);
    obj.edit188:setWidth(30);
    obj.edit188:setField("ataque.municao.a5");
    obj.edit188:setMargins({right=5});
    obj.edit188:setName("edit188");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout146);
    obj.label241:setAlign("left");
    obj.label241:setWidth(30);
    obj.label241:setText("DEF: ");
    obj.label241:setHorzTextAlign("trailing");
    obj.label241:setMargins({right=5});
    obj.label241:setName("label241");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout146);
    obj.edit189:setType("number");
    obj.edit189:setAlign("left");
    obj.edit189:setHorzTextAlign("leading");
    obj.edit189:setFontSize(14);
    obj.edit189:setWidth(25);
    obj.edit189:setField("ataque.defeito.a5");
    obj.edit189:setMargins({right=5});
    obj.edit189:setName("edit189");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout146);
    obj.label242:setAlign("left");
    obj.label242:setWidth(50);
    obj.label242:setText("Dano: ");
    obj.label242:setHorzTextAlign("trailing");
    obj.label242:setMargins({right=5});
    obj.label242:setName("label242");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout146);
    obj.edit190:setAlign("left");
    obj.edit190:setHorzTextAlign("leading");
    obj.edit190:setFontSize(14);
    obj.edit190:setWidth(55);
    obj.edit190:setField("ataque.dano.a5");
    obj.edit190:setMargins({right=5});
    obj.edit190:setName("edit190");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout146);
    obj.label243:setAlign("left");
    obj.label243:setWidth(5);
    obj.label243:setText("");
    obj.label243:setHorzTextAlign("trailing");
    obj.label243:setMargins({right=5});
    obj.label243:setName("label243");

    obj.button109 = GUI.fromHandle(_obj_newObject("button"));
    obj.button109:setParent(obj.layout146);
    obj.button109:setAlign("left");
    obj.button109:setLeft(5);
    obj.button109:setText("Rolar");
    obj.button109:setWidth(40);
    obj.button109:setName("button109");

    obj.button110 = GUI.fromHandle(_obj_newObject("button"));
    obj.button110:setParent(obj.layout146);
    obj.button110:setAlign("left");
    obj.button110:setLeft(15);
    obj.button110:setText("van/des");
    obj.button110:setWidth(45);
    obj.button110:setFontSize(9);
    obj.button110:setName("button110");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout141);
    obj.layout147:setAlign("top");
    obj.layout147:setHeight(20);
    obj.layout147:setMargins({bottom=2, top=15});
    obj.layout147:setName("layout147");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout147);
    obj.label244:setAlign("left");
    obj.label244:setWidth(5);
    obj.label244:setText("");
    obj.label244:setHorzTextAlign("trailing");
    obj.label244:setMargins({right=5});
    obj.label244:setName("label244");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout147);
    obj.edit191:setAlign("left");
    obj.edit191:setHorzTextAlign("leading");
    obj.edit191:setFontSize(14);
    obj.edit191:setWidth(120);
    obj.edit191:setField("ataque.nome.a6");
    obj.edit191:setMargins({right=5});
    obj.edit191:setName("edit191");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout147);
    obj.label245:setAlign("left");
    obj.label245:setWidth(50);
    obj.label245:setText("Tipo: ");
    obj.label245:setHorzTextAlign("trailing");
    obj.label245:setMargins({right=5});
    obj.label245:setName("label245");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout147);
    obj.comboBox6:setAlign("left");
    obj.comboBox6:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox6:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox6:setWidth(150);
    obj.comboBox6:setField("ataque.tipo.a6");
    obj.comboBox6:setName("comboBox6");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout147);
    obj.label246:setAlign("left");
    obj.label246:setWidth(55);
    obj.label246:setText("Ataques: ");
    obj.label246:setHorzTextAlign("trailing");
    obj.label246:setMargins({right=5});
    obj.label246:setName("label246");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout147);
    obj.edit192:setAlign("left");
    obj.edit192:setHorzTextAlign("leading");
    obj.edit192:setFontSize(14);
    obj.edit192:setWidth(30);
    obj.edit192:setField("ataque.quantidade.a6");
    obj.edit192:setMargins({right=5});
    obj.edit192:setName("edit192");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout147);
    obj.label247:setAlign("left");
    obj.label247:setWidth(60);
    obj.label247:setText("Alcance: ");
    obj.label247:setHorzTextAlign("trailing");
    obj.label247:setMargins({right=5});
    obj.label247:setName("label247");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout147);
    obj.edit193:setAlign("left");
    obj.edit193:setHorzTextAlign("leading");
    obj.edit193:setFontSize(14);
    obj.edit193:setWidth(30);
    obj.edit193:setField("ataque.alcance.a6");
    obj.edit193:setMargins({right=5});
    obj.edit193:setName("edit193");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout147);
    obj.label248:setAlign("left");
    obj.label248:setWidth(110);
    obj.label248:setText("Munição na arma: ");
    obj.label248:setHorzTextAlign("trailing");
    obj.label248:setMargins({right=5});
    obj.label248:setName("label248");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout147);
    obj.edit194:setAlign("left");
    obj.edit194:setHorzTextAlign("leading");
    obj.edit194:setFontSize(14);
    obj.edit194:setWidth(30);
    obj.edit194:setField("ataque.municao.a6");
    obj.edit194:setMargins({right=5});
    obj.edit194:setName("edit194");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout147);
    obj.label249:setAlign("left");
    obj.label249:setWidth(30);
    obj.label249:setText("DEF: ");
    obj.label249:setHorzTextAlign("trailing");
    obj.label249:setMargins({right=5});
    obj.label249:setName("label249");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout147);
    obj.edit195:setType("number");
    obj.edit195:setAlign("left");
    obj.edit195:setHorzTextAlign("leading");
    obj.edit195:setFontSize(14);
    obj.edit195:setWidth(25);
    obj.edit195:setField("ataque.defeito.a6");
    obj.edit195:setMargins({right=5});
    obj.edit195:setName("edit195");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout147);
    obj.label250:setAlign("left");
    obj.label250:setWidth(50);
    obj.label250:setText("Dano: ");
    obj.label250:setHorzTextAlign("trailing");
    obj.label250:setMargins({right=5});
    obj.label250:setName("label250");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout147);
    obj.edit196:setAlign("left");
    obj.edit196:setHorzTextAlign("leading");
    obj.edit196:setFontSize(14);
    obj.edit196:setWidth(55);
    obj.edit196:setField("ataque.dano.a6");
    obj.edit196:setMargins({right=5});
    obj.edit196:setName("edit196");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout147);
    obj.label251:setAlign("left");
    obj.label251:setWidth(5);
    obj.label251:setText("");
    obj.label251:setHorzTextAlign("trailing");
    obj.label251:setMargins({right=5});
    obj.label251:setName("label251");

    obj.button111 = GUI.fromHandle(_obj_newObject("button"));
    obj.button111:setParent(obj.layout147);
    obj.button111:setAlign("left");
    obj.button111:setLeft(5);
    obj.button111:setText("Rolar");
    obj.button111:setWidth(40);
    obj.button111:setName("button111");

    obj.button112 = GUI.fromHandle(_obj_newObject("button"));
    obj.button112:setParent(obj.layout147);
    obj.button112:setAlign("left");
    obj.button112:setLeft(15);
    obj.button112:setText("van/des");
    obj.button112:setWidth(45);
    obj.button112:setFontSize(9);
    obj.button112:setName("button112");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout141);
    obj.layout148:setAlign("top");
    obj.layout148:setHeight(20);
    obj.layout148:setMargins({bottom=2, top=15});
    obj.layout148:setName("layout148");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout148);
    obj.label252:setAlign("left");
    obj.label252:setWidth(5);
    obj.label252:setText("");
    obj.label252:setHorzTextAlign("trailing");
    obj.label252:setMargins({right=5});
    obj.label252:setName("label252");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout148);
    obj.edit197:setAlign("left");
    obj.edit197:setHorzTextAlign("leading");
    obj.edit197:setFontSize(14);
    obj.edit197:setWidth(120);
    obj.edit197:setField("ataque.nome.a7");
    obj.edit197:setMargins({right=5});
    obj.edit197:setName("edit197");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout148);
    obj.label253:setAlign("left");
    obj.label253:setWidth(50);
    obj.label253:setText("Tipo: ");
    obj.label253:setHorzTextAlign("trailing");
    obj.label253:setMargins({right=5});
    obj.label253:setName("label253");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout148);
    obj.comboBox7:setAlign("left");
    obj.comboBox7:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox7:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox7:setWidth(150);
    obj.comboBox7:setField("ataque.tipo.a7");
    obj.comboBox7:setName("comboBox7");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout148);
    obj.label254:setAlign("left");
    obj.label254:setWidth(55);
    obj.label254:setText("Ataques: ");
    obj.label254:setHorzTextAlign("trailing");
    obj.label254:setMargins({right=5});
    obj.label254:setName("label254");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout148);
    obj.edit198:setAlign("left");
    obj.edit198:setHorzTextAlign("leading");
    obj.edit198:setFontSize(14);
    obj.edit198:setWidth(30);
    obj.edit198:setField("ataque.quantidade.a7");
    obj.edit198:setMargins({right=5});
    obj.edit198:setName("edit198");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout148);
    obj.label255:setAlign("left");
    obj.label255:setWidth(60);
    obj.label255:setText("Alcance: ");
    obj.label255:setHorzTextAlign("trailing");
    obj.label255:setMargins({right=5});
    obj.label255:setName("label255");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout148);
    obj.edit199:setAlign("left");
    obj.edit199:setHorzTextAlign("leading");
    obj.edit199:setFontSize(14);
    obj.edit199:setWidth(30);
    obj.edit199:setField("ataque.alcance.a7");
    obj.edit199:setMargins({right=5});
    obj.edit199:setName("edit199");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout148);
    obj.label256:setAlign("left");
    obj.label256:setWidth(110);
    obj.label256:setText("Munição na arma: ");
    obj.label256:setHorzTextAlign("trailing");
    obj.label256:setMargins({right=5});
    obj.label256:setName("label256");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout148);
    obj.edit200:setAlign("left");
    obj.edit200:setHorzTextAlign("leading");
    obj.edit200:setFontSize(14);
    obj.edit200:setWidth(30);
    obj.edit200:setField("ataque.municao.a7");
    obj.edit200:setMargins({right=5});
    obj.edit200:setName("edit200");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.layout148);
    obj.label257:setAlign("left");
    obj.label257:setWidth(30);
    obj.label257:setText("DEF: ");
    obj.label257:setHorzTextAlign("trailing");
    obj.label257:setMargins({right=5});
    obj.label257:setName("label257");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout148);
    obj.edit201:setType("number");
    obj.edit201:setAlign("left");
    obj.edit201:setHorzTextAlign("leading");
    obj.edit201:setFontSize(14);
    obj.edit201:setWidth(25);
    obj.edit201:setField("ataque.defeito.a7");
    obj.edit201:setMargins({right=5});
    obj.edit201:setName("edit201");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout148);
    obj.label258:setAlign("left");
    obj.label258:setWidth(50);
    obj.label258:setText("Dano: ");
    obj.label258:setHorzTextAlign("trailing");
    obj.label258:setMargins({right=5});
    obj.label258:setName("label258");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout148);
    obj.edit202:setAlign("left");
    obj.edit202:setHorzTextAlign("leading");
    obj.edit202:setFontSize(14);
    obj.edit202:setWidth(55);
    obj.edit202:setField("ataque.dano.a7");
    obj.edit202:setMargins({right=5});
    obj.edit202:setName("edit202");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.layout148);
    obj.label259:setAlign("left");
    obj.label259:setWidth(5);
    obj.label259:setText("");
    obj.label259:setHorzTextAlign("trailing");
    obj.label259:setMargins({right=5});
    obj.label259:setName("label259");

    obj.button113 = GUI.fromHandle(_obj_newObject("button"));
    obj.button113:setParent(obj.layout148);
    obj.button113:setAlign("left");
    obj.button113:setLeft(5);
    obj.button113:setText("Rolar");
    obj.button113:setWidth(40);
    obj.button113:setName("button113");

    obj.button114 = GUI.fromHandle(_obj_newObject("button"));
    obj.button114:setParent(obj.layout148);
    obj.button114:setAlign("left");
    obj.button114:setLeft(15);
    obj.button114:setText("van/des");
    obj.button114:setWidth(45);
    obj.button114:setFontSize(9);
    obj.button114:setName("button114");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout141);
    obj.layout149:setAlign("top");
    obj.layout149:setHeight(20);
    obj.layout149:setMargins({bottom=2, top=15});
    obj.layout149:setName("layout149");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.layout149);
    obj.label260:setAlign("left");
    obj.label260:setWidth(5);
    obj.label260:setText("");
    obj.label260:setHorzTextAlign("trailing");
    obj.label260:setMargins({right=5});
    obj.label260:setName("label260");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout149);
    obj.edit203:setAlign("left");
    obj.edit203:setHorzTextAlign("leading");
    obj.edit203:setFontSize(14);
    obj.edit203:setWidth(120);
    obj.edit203:setField("ataque.nome.a8");
    obj.edit203:setMargins({right=5});
    obj.edit203:setName("edit203");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.layout149);
    obj.label261:setAlign("left");
    obj.label261:setWidth(50);
    obj.label261:setText("Tipo: ");
    obj.label261:setHorzTextAlign("trailing");
    obj.label261:setMargins({right=5});
    obj.label261:setName("label261");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout149);
    obj.comboBox8:setAlign("left");
    obj.comboBox8:setItems({'Lutar(Briga)', 'Lutar(Campo 1)', 'Lutar(Campo2)', 'Lutar(Campo3)', 'Arcos', 'Armas Pesadas', 'Lança-Chamass', 'Metralhadoras', 'Pistolas', 'Rifles/Espingardas', 'Submetralhadoras', 'Armas 1', 'Armas 2', 'Armas 3'});
    obj.comboBox8:setValues({'LB', 'L1', 'L2', 'L3', 'Arc', 'AP', 'Lc', 'M', 'P', 'RE', 'S', 'A1', 'A2', 'A3'});
    obj.comboBox8:setWidth(150);
    obj.comboBox8:setField("ataque.tipo.a8");
    obj.comboBox8:setName("comboBox8");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout149);
    obj.label262:setAlign("left");
    obj.label262:setWidth(55);
    obj.label262:setText("Ataques: ");
    obj.label262:setHorzTextAlign("trailing");
    obj.label262:setMargins({right=5});
    obj.label262:setName("label262");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout149);
    obj.edit204:setAlign("left");
    obj.edit204:setHorzTextAlign("leading");
    obj.edit204:setFontSize(14);
    obj.edit204:setWidth(30);
    obj.edit204:setField("ataque.quantidade.a8");
    obj.edit204:setMargins({right=5});
    obj.edit204:setName("edit204");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.layout149);
    obj.label263:setAlign("left");
    obj.label263:setWidth(60);
    obj.label263:setText("Alcance: ");
    obj.label263:setHorzTextAlign("trailing");
    obj.label263:setMargins({right=5});
    obj.label263:setName("label263");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout149);
    obj.edit205:setAlign("left");
    obj.edit205:setHorzTextAlign("leading");
    obj.edit205:setFontSize(14);
    obj.edit205:setWidth(30);
    obj.edit205:setField("ataque.alcance.a8");
    obj.edit205:setMargins({right=5});
    obj.edit205:setName("edit205");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.layout149);
    obj.label264:setAlign("left");
    obj.label264:setWidth(110);
    obj.label264:setText("Munição na arma: ");
    obj.label264:setHorzTextAlign("trailing");
    obj.label264:setMargins({right=5});
    obj.label264:setName("label264");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout149);
    obj.edit206:setAlign("left");
    obj.edit206:setHorzTextAlign("leading");
    obj.edit206:setFontSize(14);
    obj.edit206:setWidth(30);
    obj.edit206:setField("ataque.municao.a8");
    obj.edit206:setMargins({right=5});
    obj.edit206:setName("edit206");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.layout149);
    obj.label265:setAlign("left");
    obj.label265:setWidth(30);
    obj.label265:setText("DEF: ");
    obj.label265:setHorzTextAlign("trailing");
    obj.label265:setMargins({right=5});
    obj.label265:setName("label265");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout149);
    obj.edit207:setType("number");
    obj.edit207:setAlign("left");
    obj.edit207:setHorzTextAlign("leading");
    obj.edit207:setFontSize(14);
    obj.edit207:setWidth(25);
    obj.edit207:setField("ataque.defeito.a8");
    obj.edit207:setMargins({right=5});
    obj.edit207:setName("edit207");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout149);
    obj.label266:setAlign("left");
    obj.label266:setWidth(50);
    obj.label266:setText("Dano: ");
    obj.label266:setHorzTextAlign("trailing");
    obj.label266:setMargins({right=5});
    obj.label266:setName("label266");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout149);
    obj.edit208:setAlign("left");
    obj.edit208:setHorzTextAlign("leading");
    obj.edit208:setFontSize(14);
    obj.edit208:setWidth(55);
    obj.edit208:setField("ataque.dano.a8");
    obj.edit208:setMargins({right=5});
    obj.edit208:setName("edit208");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout149);
    obj.label267:setAlign("left");
    obj.label267:setWidth(5);
    obj.label267:setText("");
    obj.label267:setHorzTextAlign("trailing");
    obj.label267:setMargins({right=5});
    obj.label267:setName("label267");

    obj.button115 = GUI.fromHandle(_obj_newObject("button"));
    obj.button115:setParent(obj.layout149);
    obj.button115:setAlign("left");
    obj.button115:setLeft(5);
    obj.button115:setText("Rolar");
    obj.button115:setWidth(40);
    obj.button115:setName("button115");

    obj.button116 = GUI.fromHandle(_obj_newObject("button"));
    obj.button116:setParent(obj.layout149);
    obj.button116:setAlign("left");
    obj.button116:setLeft(15);
    obj.button116:setText("van/des");
    obj.button116:setWidth(45);
    obj.button116:setFontSize(9);
    obj.button116:setName("button116");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.scrollBox1);
    obj.layout150:setAlign("none");
    obj.layout150:setLeft(1002);
    obj.layout150:setHeight(332);
    obj.layout150:setWidth(332);
    obj.layout150:setTop(1310);
    obj.layout150:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout150:setMargins({left=30, right=10, bottom=10});
    obj.layout150:setName("layout150");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.layout150);
    obj.label268:setText("Combate");
    obj.label268:setLeft(132);
    lfm_setPropAsString(obj.label268, "fontStyle",  "bold italic");
    obj.label268:setTop(9);
    obj.label268:setWidth(1343);
    obj.label268:setName("label268");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout150);
    obj.layout151:setLeft(20);
    obj.layout151:setTop(25);
    obj.layout151:setWidth(270);
    obj.layout151:setHeight(984);
    obj.layout151:setName("layout151");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout151);
    obj.layout152:setAlign("top");
    obj.layout152:setHeight(50);
    obj.layout152:setMargins({bottom=2, top=15});
    obj.layout152:setName("layout152");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.layout152);
    obj.label269:setAlign("left");
    obj.label269:setWidth(120);
    obj.label269:setText("Bonus de Dano:");
    obj.label269:setHorzTextAlign("trailing");
    obj.label269:setMargins({right=5});
    obj.label269:setName("label269");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout152);
    obj.edit209:setAlign("left");
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setFontSize(20);
    obj.edit209:setHeight(30);
    obj.edit209:setField("bonus.dano");
    obj.edit209:setName("edit209");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout151);
    obj.layout153:setAlign("top");
    obj.layout153:setHeight(50);
    obj.layout153:setMargins({bottom=2, top=15});
    obj.layout153:setName("layout153");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.layout153);
    obj.label270:setAlign("left");
    obj.label270:setWidth(120);
    obj.label270:setText("Corpo:");
    obj.label270:setHorzTextAlign("trailing");
    obj.label270:setMargins({right=5});
    obj.label270:setName("label270");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout153);
    obj.edit210:setAlign("left");
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setFontSize(20);
    obj.edit210:setHeight(30);
    obj.edit210:setField("bonus.corpo");
    obj.edit210:setName("edit210");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout151);
    obj.layout154:setAlign("top");
    obj.layout154:setHeight(50);
    obj.layout154:setMargins({bottom=2, top=15});
    obj.layout154:setName("layout154");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout154);
    obj.label271:setAlign("left");
    obj.label271:setWidth(120);
    obj.label271:setText("Armadura:");
    obj.label271:setHorzTextAlign("trailing");
    obj.label271:setMargins({right=5});
    obj.label271:setName("label271");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout154);
    obj.edit211:setAlign("left");
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setFontSize(20);
    obj.edit211:setHeight(30);
    obj.edit211:setField("bonus.armadura");
    obj.edit211:setName("edit211");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout151);
    obj.layout155:setAlign("top");
    obj.layout155:setHeight(50);
    obj.layout155:setMargins({bottom=2, top=15});
    obj.layout155:setName("layout155");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.layout155);
    obj.label272:setAlign("left");
    obj.label272:setWidth(120);
    obj.label272:setText("Esquiva:");
    obj.label272:setHorzTextAlign("trailing");
    obj.label272:setMargins({right=5});
    obj.label272:setName("label272");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout155);
    obj.edit212:setType("number");
    obj.edit212:setMin(00);
    obj.edit212:setAlign("left");
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setFontSize(20);
    obj.edit212:setHeight(30);
    obj.edit212:setField("pericia.esquiva");
    obj.edit212:setName("edit212");

    obj.button117 = GUI.fromHandle(_obj_newObject("button"));
    obj.button117:setParent(obj.layout155);
    obj.button117:setAlign("left");
    obj.button117:setLeft(5);
    obj.button117:setText("Rolar");
    obj.button117:setWidth(40);
    obj.button117:setName("button117");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Antecedentes");
    obj.tab2:setName("tab2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.scrollBox2);
    obj.layout156:setAlign("none");
    obj.layout156:setHeight(35);
    obj.layout156:setWidth(1329);
    obj.layout156:setTop(15);
    obj.layout156:setLeft(5);
    obj.layout156:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout156:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout156:setName("layout156");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.layout156);
    obj.label273:setText("Antecedentes");
    obj.label273:setLeft(625);
    lfm_setPropAsString(obj.label273, "fontStyle",  "bold italic");
    obj.label273:setTop(9);
    obj.label273:setName("label273");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.scrollBox2);
    obj.layout157:setAlign("none");
    obj.layout157:setHeight(332);
    obj.layout157:setWidth(664);
    obj.layout157:setTop(52);
    obj.layout157:setLeft(5);
    obj.layout157:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout157:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout157:setName("layout157");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout157);
    obj.textEditor1:setLeft(20);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(624);
    obj.textEditor1:setHeight(292);
    obj.textEditor1:setField("textEditor.desPessoal");
    obj.textEditor1:setName("textEditor1");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.layout157);
    obj.label274:setText("Descrição Pessoal");
    obj.label274:setLeft(280);
    lfm_setPropAsString(obj.label274, "fontStyle",  "bold italic");
    obj.label274:setTop(9);
    obj.label274:setName("label274");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.scrollBox2);
    obj.layout158:setAlign("none");
    obj.layout158:setHeight(332);
    obj.layout158:setWidth(664);
    obj.layout158:setTop(52);
    obj.layout158:setLeft(669);
    obj.layout158:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout158:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout158:setName("layout158");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout158);
    obj.textEditor2:setLeft(20);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(624);
    obj.textEditor2:setHeight(292);
    obj.textEditor2:setField("textEditor.caracteristicas");
    obj.textEditor2:setName("textEditor2");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout158);
    obj.label275:setText("Características");
    obj.label275:setLeft(290);
    lfm_setPropAsString(obj.label275, "fontStyle",  "bold italic");
    obj.label275:setTop(9);
    obj.label275:setName("label275");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.scrollBox2);
    obj.layout159:setAlign("none");
    obj.layout159:setHeight(332);
    obj.layout159:setWidth(664);
    obj.layout159:setTop(386);
    obj.layout159:setLeft(5);
    obj.layout159:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout159:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout159:setName("layout159");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout159);
    obj.textEditor3:setLeft(20);
    obj.textEditor3:setTop(30);
    obj.textEditor3:setWidth(624);
    obj.textEditor3:setHeight(292);
    obj.textEditor3:setField("textEditor.ideologiasC");
    obj.textEditor3:setName("textEditor3");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.layout159);
    obj.label276:setText("Ideologias/Crenças");
    obj.label276:setLeft(280);
    lfm_setPropAsString(obj.label276, "fontStyle",  "bold italic");
    obj.label276:setTop(9);
    obj.label276:setName("label276");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.scrollBox2);
    obj.layout160:setAlign("none");
    obj.layout160:setHeight(332);
    obj.layout160:setWidth(664);
    obj.layout160:setTop(386);
    obj.layout160:setLeft(669);
    obj.layout160:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout160:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout160:setName("layout160");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout160);
    obj.textEditor4:setLeft(20);
    obj.textEditor4:setTop(30);
    obj.textEditor4:setWidth(624);
    obj.textEditor4:setHeight(292);
    obj.textEditor4:setField("textEditor.ferimentosC");
    obj.textEditor4:setName("textEditor4");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.layout160);
    obj.label277:setText("Ferimentos e Cicatrizes");
    obj.label277:setLeft(280);
    obj.label277:setWidth(292);
    lfm_setPropAsString(obj.label277, "fontStyle",  "bold italic");
    obj.label277:setTop(9);
    obj.label277:setName("label277");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.scrollBox2);
    obj.layout161:setAlign("none");
    obj.layout161:setHeight(332);
    obj.layout161:setWidth(664);
    obj.layout161:setTop(720);
    obj.layout161:setLeft(5);
    obj.layout161:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout161:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout161:setName("layout161");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout161);
    obj.textEditor5:setLeft(20);
    obj.textEditor5:setTop(30);
    obj.textEditor5:setWidth(624);
    obj.textEditor5:setHeight(292);
    obj.textEditor5:setField("textEditor.pessoasS");
    obj.textEditor5:setName("textEditor5");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.layout161);
    obj.label278:setText("Pessosa Significativas");
    obj.label278:setLeft(280);
    obj.label278:setWidth(292);
    lfm_setPropAsString(obj.label278, "fontStyle",  "bold italic");
    obj.label278:setTop(9);
    obj.label278:setName("label278");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.scrollBox2);
    obj.layout162:setAlign("none");
    obj.layout162:setHeight(332);
    obj.layout162:setWidth(664);
    obj.layout162:setTop(720);
    obj.layout162:setLeft(669);
    obj.layout162:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout162:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout162:setName("layout162");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout162);
    obj.textEditor6:setLeft(20);
    obj.textEditor6:setTop(30);
    obj.textEditor6:setWidth(624);
    obj.textEditor6:setHeight(292);
    obj.textEditor6:setField("textEditor.fobiasM");
    obj.textEditor6:setName("textEditor6");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.layout162);
    obj.label279:setText("Fobias/Manias");
    obj.label279:setLeft(280);
    obj.label279:setWidth(292);
    lfm_setPropAsString(obj.label279, "fontStyle",  "bold italic");
    obj.label279:setTop(9);
    obj.label279:setName("label279");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.scrollBox2);
    obj.layout163:setAlign("none");
    obj.layout163:setHeight(332);
    obj.layout163:setWidth(664);
    obj.layout163:setTop(1053);
    obj.layout163:setLeft(5);
    obj.layout163:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout163:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout163:setName("layout163");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout163);
    obj.textEditor7:setLeft(20);
    obj.textEditor7:setTop(30);
    obj.textEditor7:setWidth(624);
    obj.textEditor7:setHeight(292);
    obj.textEditor7:setField("textEditor.locaisIn");
    obj.textEditor7:setName("textEditor7");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.layout163);
    obj.label280:setText("Locais Importantes");
    obj.label280:setLeft(280);
    obj.label280:setWidth(292);
    lfm_setPropAsString(obj.label280, "fontStyle",  "bold italic");
    obj.label280:setTop(9);
    obj.label280:setName("label280");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.scrollBox2);
    obj.layout164:setAlign("none");
    obj.layout164:setHeight(332);
    obj.layout164:setWidth(664);
    obj.layout164:setTop(1053);
    obj.layout164:setLeft(669);
    obj.layout164:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout164:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout164:setName("layout164");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout164);
    obj.textEditor8:setLeft(20);
    obj.textEditor8:setTop(30);
    obj.textEditor8:setWidth(624);
    obj.textEditor8:setHeight(292);
    obj.textEditor8:setField("textEditor.tomosFei");
    obj.textEditor8:setName("textEditor8");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.layout164);
    obj.label281:setText("Tomos Arcanos/Feitiços e Artefatos");
    obj.label281:setLeft(220);
    obj.label281:setWidth(292);
    lfm_setPropAsString(obj.label281, "fontStyle",  "bold italic");
    obj.label281:setTop(9);
    obj.label281:setName("label281");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.scrollBox2);
    obj.layout165:setAlign("none");
    obj.layout165:setHeight(332);
    obj.layout165:setWidth(664);
    obj.layout165:setTop(1386);
    obj.layout165:setLeft(5);
    obj.layout165:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout165:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout165:setName("layout165");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout165);
    obj.textEditor9:setLeft(20);
    obj.textEditor9:setTop(30);
    obj.textEditor9:setWidth(624);
    obj.textEditor9:setHeight(292);
    obj.textEditor9:setField("textEditor.pertencesQue");
    obj.textEditor9:setName("textEditor9");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.layout165);
    obj.label282:setText("Pertences Queridos");
    obj.label282:setLeft(280);
    obj.label282:setWidth(292);
    lfm_setPropAsString(obj.label282, "fontStyle",  "bold italic");
    obj.label282:setTop(9);
    obj.label282:setName("label282");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.scrollBox2);
    obj.layout166:setAlign("none");
    obj.layout166:setHeight(332);
    obj.layout166:setWidth(664);
    obj.layout166:setTop(1386);
    obj.layout166:setLeft(669);
    obj.layout166:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout166:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout166:setName("layout166");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout166);
    obj.textEditor10:setLeft(20);
    obj.textEditor10:setTop(30);
    obj.textEditor10:setWidth(624);
    obj.textEditor10:setHeight(292);
    obj.textEditor10:setField("textEditor.entidades");
    obj.textEditor10:setName("textEditor10");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.layout166);
    obj.label283:setText("Encontros com Entidades Estranhas");
    obj.label283:setLeft(220);
    obj.label283:setWidth(292);
    lfm_setPropAsString(obj.label283, "fontStyle",  "bold italic");
    obj.label283:setTop(9);
    obj.label283:setName("label283");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Recursos");
    obj.tab3:setName("tab3");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.scrollBox3);
    obj.layout167:setAlign("none");
    obj.layout167:setHeight(35);
    obj.layout167:setWidth(1329);
    obj.layout167:setTop(15);
    obj.layout167:setLeft(5);
    obj.layout167:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout167:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout167:setName("layout167");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.layout167);
    obj.label284:setText("Equipamentos e pertences / Dinheiro e Recursos");
    obj.label284:setLeft(525);
    obj.label284:setWidth(1329);
    lfm_setPropAsString(obj.label284, "fontStyle",  "bold italic");
    obj.label284:setTop(9);
    obj.label284:setName("label284");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.scrollBox3);
    obj.layout168:setAlign("none");
    obj.layout168:setHeight(1660);
    obj.layout168:setWidth(664);
    obj.layout168:setTop(52);
    obj.layout168:setLeft(5);
    obj.layout168:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout168:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout168:setName("layout168");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.layout168);
    obj.label285:setText("Equipamentos e pertences");
    obj.label285:setWidth(624);
    obj.label285:setLeft(260);
    lfm_setPropAsString(obj.label285, "fontStyle",  "bold italic");
    obj.label285:setTop(9);
    obj.label285:setName("label285");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout168);
    obj.layout169:setAlign("top");
    obj.layout169:setHeight(30);
    obj.layout169:setTop(25);
    obj.layout169:setMargins({bottom=4});
    obj.layout169:setName("layout169");

    obj.button118 = GUI.fromHandle(_obj_newObject("button"));
    obj.button118:setParent(obj.layout169);
    obj.button118:setText("Adicionar Novo Item");
    obj.button118:setWidth(150);
    obj.button118:setTop(45);
    obj.button118:setAlign("left");
    obj.button118:setName("button118");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout168);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("left");
    obj.rclListaDosItens:setSelectable(true);
    obj.rclListaDosItens:setLayout("vertical");
    obj.rclListaDosItens:setTop(40);
    obj.rclListaDosItens:setHeight(80);
    obj.rclListaDosItens:setWidth(150);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout168);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("client");
    obj.boxDetalhesDoItem:setMargins({left=4, right=4, top=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.boxDetalhesDoItem);
    obj.rectangle1:setAlign("none");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(180);
    obj.rectangle1:setWidth(480);
    obj.rectangle1:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle1:setName("rectangle1");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle1);
    obj.layout170:setAlign("top");
    obj.layout170:setTop(15);
    obj.layout170:setHeight(30);
    obj.layout170:setMargins({bottom=4});
    obj.layout170:setName("layout170");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout170);
    obj.label286:setAlign("left");
    obj.label286:setText("Titulo do Item:");
    obj.label286:setAutoSize(true);
    obj.label286:setName("label286");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout170);
    obj.edit213:setAlign("client");
    obj.edit213:setField("campoTitulo");
    obj.edit213:setName("edit213");

    obj.button119 = GUI.fromHandle(_obj_newObject("button"));
    obj.button119:setParent(obj.layout170);
    obj.button119:setAlign("right");
    obj.button119:setText("Apagar!");
    obj.button119:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button119:setWidth(150);
    obj.button119:setName("button119");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle1);
    obj.layout171:setAlign("top");
    obj.layout171:setTop(15);
    obj.layout171:setHeight(130);
    obj.layout171:setName("layout171");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout171);
    obj.image2:setAlign("left");
    obj.image2:setEditable(true);
    obj.image2:setField("campoURLImagem");
    obj.image2:setWidth(130);
    obj.image2:setName("image2");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.layout171);
    obj.layout172:setAlign("client");
    obj.layout172:setMargins({left=2});
    obj.layout172:setName("layout172");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout172);
    obj.edit214:setAlign("top");
    obj.edit214:setField("campoSubTitulo");
    obj.edit214:setHeight(30);
    obj.edit214:setName("edit214");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout172);
    obj.textEditor11:setAlign("top");
    obj.textEditor11:setField("campoTextoGrande");
    obj.textEditor11:setHeight(100);
    obj.textEditor11:setName("textEditor11");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.scrollBox3);
    obj.layout173:setAlign("none");
    obj.layout173:setHeight(1660);
    obj.layout173:setWidth(664);
    obj.layout173:setTop(52);
    obj.layout173:setLeft(669);
    obj.layout173:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout173:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout173:setName("layout173");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout173);
    obj.label287:setText("Dinheiro e Recursos");
    obj.label287:setWidth(624);
    obj.label287:setLeft(270);
    lfm_setPropAsString(obj.label287, "fontStyle",  "bold italic");
    obj.label287:setTop(9);
    obj.label287:setName("label287");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout173);
    obj.layout174:setLeft(5);
    obj.layout174:setTop(25);
    obj.layout174:setWidth(664);
    obj.layout174:setHeight(1660);
    obj.layout174:setName("layout174");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout174);
    obj.layout175:setName("layout175");
    obj.layout175:setWidth(15);
    obj.layout175:setTop(25);
    obj.layout175:setHeight(25);
    obj.layout175:setAlign("top");
    obj.layout175:setMargins({left=2, right=2, top=5});

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout175);
    obj.label288:setText("     Nivel de gastos:");
    obj.label288:setName("label288");
    obj.label288:setAlign("left");
    obj.label288:setHorzTextAlign("leading");
    obj.label288:setVertTextAlign("leading");
    obj.label288:setAutoSize(true);
    obj.label288:setTop(30);

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout175);
    obj.edit215:setField("dinheiro.ng");
    obj.edit215:setName("edit215");
    obj.edit215:setHeight(5);
    obj.edit215:setWidth(250);
    obj.edit215:setFontSize(15);
    obj.edit215:setAlign("left");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout174);
    obj.layout176:setName("layout176");
    obj.layout176:setWidth(15);
    obj.layout176:setTop(25);
    obj.layout176:setHeight(25);
    obj.layout176:setAlign("top");
    obj.layout176:setMargins({left=2, right=2, top=5});

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout176);
    obj.label289:setText("     Dinheiro:");
    obj.label289:setName("label289");
    obj.label289:setAlign("left");
    obj.label289:setHorzTextAlign("leading");
    obj.label289:setVertTextAlign("leading");
    obj.label289:setAutoSize(true);
    obj.label289:setTop(30);

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout176);
    obj.edit216:setField("dinheiro.dinheiro");
    obj.edit216:setName("edit216");
    obj.edit216:setHeight(5);
    obj.edit216:setWidth(250);
    obj.edit216:setFontSize(15);
    obj.edit216:setAlign("left");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout174);
    obj.layout177:setName("layout177");
    obj.layout177:setWidth(15);
    obj.layout177:setTop(25);
    obj.layout177:setHeight(25);
    obj.layout177:setAlign("top");
    obj.layout177:setMargins({left=2, right=2, top=5});

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout177);
    obj.label290:setText("     Patrimônio:");
    obj.label290:setName("label290");
    obj.label290:setAlign("left");
    obj.label290:setHorzTextAlign("leading");
    obj.label290:setVertTextAlign("leading");
    obj.label290:setAutoSize(true);
    obj.label290:setTop(30);

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout177);
    obj.edit217:setField("dinheiro.patrimonio");
    obj.edit217:setName("edit217");
    obj.edit217:setHeight(5);
    obj.edit217:setWidth(250);
    obj.edit217:setFontSize(15);
    obj.edit217:setAlign("left");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout173);
    obj.textEditor12:setLeft(20);
    obj.textEditor12:setTop(125);
    obj.textEditor12:setWidth(624);
    obj.textEditor12:setHeight(1521);
    obj.textEditor12:setField("textEditor.patrimonio");
    obj.textEditor12:setName("textEditor12");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.scrollBox4);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("txt");
    obj.richEdit1:setName("richEdit1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.forca
                                                    chat:enviarMensagem("[§K3]Força: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.destreza
                                                    chat:enviarMensagem("[§K3]Destreza: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.poder
                                                    chat:enviarMensagem("[§K3]Poder: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.constituicao
                                                    chat:enviarMensagem("[§K3]Constituição: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.aparencia
                                                    chat:enviarMensagem("[§K3]Aparencia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.educacao
                                                    chat:enviarMensagem("[§K3]Educação: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.tamanho
                                                    chat:enviarMensagem("[§K3]Tamanho: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.atributo.inteligencia
                                                    chat:enviarMensagem("[§K3]Inteligencia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.atributo.sorte
                                            chat:enviarMensagem("[§K3]Sorte: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.atributo.sanidadeatual
                                            chat:enviarMensagem("[§K3]Sanidade: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.Mythos
                                                            chat:enviarMensagem("[§K3]Mitos de Cthulhu: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.credito
                                                            chat:enviarMensagem("[§K3]Nivel De Credito: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.avaliacao
                                                            chat:enviarMensagem("[§K3]Avaliação: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.chaveiro
                                                            chat:enviarMensagem("[§K3]Chaveiro: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.conEletrico
                                                            chat:enviarMensagem("[§K3]Consertos Eletricos: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.conMecanico
                                                            chat:enviarMensagem("[§K3]Consertos Mecanico: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.dirigir
                                                            chat:enviarMensagem("[§K3]Dirigir Auto: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.disfarces
                                                            chat:enviarMensagem("[§K3]Disfarces: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.navegacao
                                                            chat:enviarMensagem("[§K3]Navegação: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.ocultismo
                                                            chat:enviarMensagem("[§K3]Ocultismo: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.opMaquinario
                                                            chat:enviarMensagem("[§K3]Op. Maquinario: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.prestidigitacao
                                                            chat:enviarMensagem("[§K3]Prestidigitação: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.rastrear
                                                            chat:enviarMensagem("[§K3]Rastrear: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.priSocorros
                                                            chat:enviarMensagem("[§K3]Primeiros Socorros: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.sobre1
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.sobre1 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.sobre2
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.sobre2 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.sobre3
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.sobre3 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.usaBiblioteca
                                                            chat:enviarMensagem("[§K3]Usar Bibliotecas: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.usarComputadores
                                                            chat:enviarMensagem("[§K3]Usar Computadores: [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.outro4
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro4 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event30 = obj.button31:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.outro5
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro5 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.outro6
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro6 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                            local chat = minhaMesa.chat; 
                                                            local parameter = sheet.pericia.outro7
                                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro7 .. " [§B][§K1]" .. parameter);
                                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                    function (rolado)
                                                             
                                                            if rolado.resultado == 1 then
                                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            elseif parameter/5 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            elseif parameter/2 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            elseif parameter+0 >= rolado.resultado then
                                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            elseif rolado.resultado >= 96 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                            elseif rolado.resultado > parameter+0 then
                                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                            else
                                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                            end;                                       
                    
                                                    end);
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.arteO1
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arteO1 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event34 = obj.button35:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.arteO2
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arteO2 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event35 = obj.button36:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.arteO3
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arteO3 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event36 = obj.button37:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.arteO4
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arteO4 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event37 = obj.button38:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                          local chat = minhaMesa.chat; 
                                                          local parameter = sheet.pericia.idioma1
                                                          chat:enviarMensagem("[§K3]Idioma Nativo: [§B][§K1]" .. parameter);
                                                          minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                                  function (rolado)
                                                           
                                                          if rolado.resultado == 1 then
                                                                  chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                          elseif parameter/5 >= rolado.resultado then
                                                                  chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                          elseif parameter/2 >= rolado.resultado then
                                                                  chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                          elseif parameter+0 >= rolado.resultado then
                                                                  chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                          elseif rolado.resultado >= 96 then
                                                                  chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                          elseif rolado.resultado > parameter+0 then
                                                                  chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                          else
                                                                  chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                          end;                                       
                  
                                                  end);
        end, obj);

    obj._e_event38 = obj.button39:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.idioma2
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.idioma2 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event39 = obj.button40:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.idioma3
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.idioma3 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event40 = obj.button41:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.idioma4
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.idioma4 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event41 = obj.button42:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.idioma5
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.idioma5 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event42 = obj.button43:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.pilotar1
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.pilotar1 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event43 = obj.button44:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.pilotar2
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.pilotar2 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event44 = obj.button45:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.pilotar3
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.pilotar3 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event45 = obj.button46:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.incomum1
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.incomum1 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event46 = obj.button47:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.incomum2
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.incomum2 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event47 = obj.button48:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.incomum3
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.incomum3 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event48 = obj.button49:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro8
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro8 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event49 = obj.button50:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro9
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro9 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event50 = obj.button51:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro10
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro10 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event51 = obj.button52:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro12
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro12 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event52 = obj.button53:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro13
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro13 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event53 = obj.button54:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.encontrar
                                                    chat:enviarMensagem("[§K3]Encontrar: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event54 = obj.button55:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.escutar
                                                    chat:enviarMensagem("[§K3]Escutar: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event55 = obj.button56:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.charme
                                                    chat:enviarMensagem("[§K3]Charme: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event56 = obj.button57:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.labia
                                                    chat:enviarMensagem("[§K3]Labia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event57 = obj.button58:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.intimidacao
                                                    chat:enviarMensagem("[§K3]Intimidação: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event58 = obj.button59:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.persuasao
                                                    chat:enviarMensagem("[§K3]Persuasão: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event59 = obj.button60:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.psicanalise
                                                    chat:enviarMensagem("[§K3]Psicanálise: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event60 = obj.button61:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.psicologia
                                                    chat:enviarMensagem("[§K3]Psicologia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event61 = obj.button62:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.arremessar
                                                    chat:enviarMensagem("[§K3]Arremessar: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event62 = obj.button63:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.cavalgar
                                                    chat:enviarMensagem("[§K3]Cavalgar: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event63 = obj.button64:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.escalar
                                                    chat:enviarMensagem("[§K3]Escalar: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event64 = obj.button65:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.furtividade
                                                    chat:enviarMensagem("[§K3]Furtividade: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event65 = obj.button66:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.natacao
                                                    chat:enviarMensagem("[§K3]Natação: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event66 = obj.button67:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.saltar
                                                    chat:enviarMensagem("[§K3]Saltar: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event67 = obj.button68:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.esquiva
                                                    chat:enviarMensagem("[§K3]Esquiva: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event68 = obj.button69:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.lutarB
                                                    chat:enviarMensagem("[§K3]Lutar (Briga): [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event69 = obj.button70:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.lutar1
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.lutar1 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event70 = obj.button71:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.lutar2
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.lutar2 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event71 = obj.button72:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.lutar3
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.lutar3 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event72 = obj.button73:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro14
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro14 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event73 = obj.button74:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro15
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro15 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event74 = obj.button75:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro16
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro16 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event75 = obj.button76:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro17
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro17 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event76 = obj.button77:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.outro18
                                                    chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro18 .. " [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event77 = obj.button78:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.antropologia
                                            chat:enviarMensagem("[§K3]Antropologia: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event78 = obj.button79:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.arqueologia
                                            chat:enviarMensagem("[§K3]Arqueologia: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event79 = obj.button80:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.contabilidade
                                            chat:enviarMensagem("[§K3]Contabilidade: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event80 = obj.button81:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.direito
                                            chat:enviarMensagem("[§K3]Direito: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event81 = obj.button82:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.eletronica
                                            chat:enviarMensagem("[§K3]Eletronica: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event82 = obj.button83:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.historia
                                            chat:enviarMensagem("[§K3]História: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event83 = obj.button84:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.medicina
                                            chat:enviarMensagem("[§K3]Medicina: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event84 = obj.button85:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.mundoN
                                            chat:enviarMensagem("[§K3]Mundo Natural: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event85 = obj.button86:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.ciee1
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.ciee1 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event86 = obj.button87:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.ciee2
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.ciee2 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event87 = obj.button88:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.ciee3
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.ciee3 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event88 = obj.button89:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.arcos
                                            chat:enviarMensagem("[§K3]Arcos: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event89 = obj.button90:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.armasP
                                            chat:enviarMensagem("[§K3]Armas Pesadas: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event90 = obj.button91:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.lancaC
                                            chat:enviarMensagem("[§K3]Lança-Chamas: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event91 = obj.button92:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.metralhadora
                                            chat:enviarMensagem("[§K3]Metralhadora: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event92 = obj.button93:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.pistolas
                                            chat:enviarMensagem("[§K3]Pistolas: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event93 = obj.button94:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.riflesE
                                            chat:enviarMensagem("[§K3]Rifles/Espingardas: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event94 = obj.button95:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.submetralhadoras
                                            chat:enviarMensagem("[§K3]Submatralhadoras: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event95 = obj.button96:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.arma1
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arma1 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event96 = obj.button97:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.arma2
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arma2 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event97 = obj.button98:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.arma3
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.arma3 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event98 = obj.button99:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.outro23
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro23 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event99 = obj.button100:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = sheet.pericia.outro24
                                            chat:enviarMensagem("[§K3]" .. sheet.pericia.nome.outro24 .. " [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
                                             
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event100 = obj.button101:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a1;
                                                    
                                                    if sheet.ataque.municao.a1+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
            
                                                    if sheet.ataque.municao.a1+0 >= 1 then
                                                            sheet.ataque.municao.a1 = (sheet.ataque.municao.a1+0)-1;
                                                    end; 
                                                    
            
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a1 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a1 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a1 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a1 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
            
                                                    if rolado.resultado >= sheet.ataque.defeito.a1+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
            
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a1 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!");
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a1 .. ":Dano");  
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a1  .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r " .. sheet.ataque.dano.a1 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                    
                                            end);
        end, obj);

    obj._e_event101 = obj.button102:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                            local chat = minhaMesa.chat; 
                                            local parameter = 0;
                                            local tipoDeAtaque = sheet.ataque.tipo.a1;
                                            
                                            if sheet.ataque.municao.a1+0 == 0 then
                                                    chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                            end; 
            
                                            if sheet.ataque.municao.a1+0 >= 1 then
                                                    sheet.ataque.municao.a1 = (sheet.ataque.municao.a1+0)-1;
                                            end; 
                                            
            
                                            if tipoDeAtaque == "LB" then
                                                    parameter = sheet.pericia.lutarB;
                                            elseif tipoDeAtaque == "L1" then
                                                    parameter = sheet.pericia.Lutar1;
                                            elseif tipoDeAtaque == "L2" then
                                                    parameter = sheet.pericia.Lutar2;
                                            elseif tipoDeAtaque == "L3" then
                                                    parameter = sheet.pericia.Lutar3;
                                            elseif tipoDeAtaque == "Arc" then
                                                    parameter = sheet.pericia.arcos;
                                            elseif tipoDeAtaque == "AP" then
                                                    parameter = sheet.pericia.armasP;
                                            elseif tipoDeAtaque == "Lc" then
                                                    parameter = sheet.pericia.lancaC;
                                            elseif tipoDeAtaque == "M" then
                                                    parameter = sheet.pericia.metralhadora;
                                            elseif tipoDeAtaque == "P" then
                                                    parameter = sheet.pericia.pistolas;
                                            elseif tipoDeAtaque == "RE" then
                                                    parameter = sheet.pericia.riflesE;
                                            elseif tipoDeAtaque == "S" then
                                                    parameter = sheet.pericia.submetralhadoras;
                                            elseif tipoDeAtaque == "A1" then
                                                    parameter = sheet.pericia.arma1;
                                            elseif tipoDeAtaque == "A2" then
                                                    parameter = sheet.pericia.arma2;
                                            elseif tipoDeAtaque == "A3" then
                                                    parameter = sheet.pericia.arma3;
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;
                                                
                                            chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a1 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a1 .. 
                                                    "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a1 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a1 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                            minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                    function (rolado)
            
                                            if rolado.resultado >= sheet.ataque.defeito.a1+0 then
                                                    chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                            end; 
            
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    chat:enviarMensagem("/r ".. sheet.ataque.dano.a1 .. ":Dano"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!");
                                                    chat:enviarMensagem("/r ".. sheet.ataque.dano.a1 .. ":Dano");  
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    chat:enviarMensagem("/r ".. sheet.ataque.dano.a1  .. ":Dano"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    chat:enviarMensagem("/r " .. sheet.ataque.dano.a1 .. ":Dano"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end); 
                                            minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                    function (rolado)
            
                                            if rolado.resultado >= sheet.ataque.defeito.a1+0 then
                                                    chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                            end; 
            
                                            if rolado.resultado == 1 then
                                                    chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    chat:enviarMensagem("/r ".. sheet.ataque.dano.a1 .. ":Dano"); 
                                            elseif parameter/5 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Extremo!");
                                                    chat:enviarMensagem("/r ".. sheet.ataque.dano.a1 .. ":Dano");  
                                            elseif parameter/2 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    chat:enviarMensagem("/r ".. sheet.ataque.dano.a1  .. ":Dano"); 
                                            elseif parameter+0 >= rolado.resultado then
                                                    chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    chat:enviarMensagem("/r " .. sheet.ataque.dano.a1 .. ":Dano"); 
                                            elseif rolado.resultado >= 96 then
                                                    chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                            elseif rolado.resultado > parameter+0 then
                                                    chat:enviarMensagem("[§B][§K4]Falha!"); 
                                            else
                                                    chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                            end;                                       
            
                                    end);
        end, obj);

    obj._e_event102 = obj.button103:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a2;
                                                    
                                                    if sheet.ataque.municao.a2+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
            
                                                    if sheet.ataque.municao.a2+0 >= 1 then
                                                            sheet.ataque.municao.a2 = (sheet.ataque.municao.a2+0)-1;
                                                    end; 
                                                    
            
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a2 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a2 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a2 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a2 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
            
                                                    if rolado.resultado >= sheet.ataque.defeito.a2+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
            
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!");
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano");  
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                    
                                            end);
        end, obj);

    obj._e_event103 = obj.button104:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a2;
                                                    
                                                    if sheet.ataque.municao.a2+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
            
                                                    if sheet.ataque.municao.a2+0 >= 1 then
                                                            sheet.ataque.municao.a2 = (sheet.ataque.municao.a2+0)-1;
                                                    end; 
                                                    
            
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a2 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a2 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a2 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a2 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
            
                                                    if rolado.resultado >= sheet.ataque.defeito.a2+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
            
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!");
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano");  
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                    
                                            end);
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
            
                                                    if rolado.resultado >= sheet.ataque.defeito.a2+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
            
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!");
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano");  
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a2 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                    
                                            end);
        end, obj);

    obj._e_event104 = obj.button105:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a3;
                                                    
                                                    if sheet.ataque.municao.a3+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a3+0 >= 1 then
                                                            sheet.ataque.municao.a3 = (sheet.ataque.municao.a3+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a3 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a3 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a3 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a3 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a3+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event105 = obj.button106:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a3;
                                                    
                                                    if sheet.ataque.municao.a3+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a3+0 >= 1 then
                                                            sheet.ataque.municao.a3 = (sheet.ataque.municao.a3+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a3 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a3 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a3 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a3 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a3+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end); 
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a3+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a3 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event106 = obj.button107:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a4;
                                                    
                                                    if sheet.ataque.municao.a4+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a4+0 >= 1 then
                                                            sheet.ataque.municao.a4 = (sheet.ataque.municao.a4+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a4 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a4 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a4 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a4 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a4+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event107 = obj.button108:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a4;
                                                    
                                                    if sheet.ataque.municao.a4+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a4+0 >= 1 then
                                                            sheet.ataque.municao.a4 = (sheet.ataque.municao.a4+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a4 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a4 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a4 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a4 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a4+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end); 
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a4+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a4 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event108 = obj.button109:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a5;
                                                    
                                                    if sheet.ataque.municao.a5+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a5+0 >= 1 then
                                                            sheet.ataque.municao.a5 = (sheet.ataque.municao.a5+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a5 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a5 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a5 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a5 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a5+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event109 = obj.button110:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a5;
                                                    
                                                    if sheet.ataque.municao.a5+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a5+0 >= 1 then
                                                            sheet.ataque.municao.a5 = (sheet.ataque.municao.a5+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a5 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a5 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a5 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a5 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a5+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end); 
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a5+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a5 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event110 = obj.button111:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a6;
                                                    
                                                    if sheet.ataque.municao.a6+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a6+0 >= 1 then
                                                            sheet.ataque.municao.a6 = (sheet.ataque.municao.a6+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a6 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a6 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a6 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a6 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a6+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event111 = obj.button112:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a6;
                                                    
                                                    if sheet.ataque.municao.a6+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a6+0 >= 1 then
                                                            sheet.ataque.municao.a6 = (sheet.ataque.municao.a6+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a6 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a6 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a6 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a6 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a6+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end); 
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a6+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a6 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event112 = obj.button113:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a7;
                                                    
                                                    if sheet.ataque.municao.a7+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a7+0 >= 1 then
                                                            sheet.ataque.municao.a7 = (sheet.ataque.municao.a7+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a7 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a7 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a7 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a7 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a7+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event113 = obj.button114:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a7;
                                                    
                                                    if sheet.ataque.municao.a7+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a7+0 >= 1 then
                                                            sheet.ataque.municao.a7 = (sheet.ataque.municao.a7+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a7 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a7 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a7 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a7 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a7+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end); 
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a7+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a7 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event114 = obj.button115:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a8;
                                                    
                                                    if sheet.ataque.municao.a8+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a8+0 >= 1 then
                                                            sheet.ataque.municao.a8 = (sheet.ataque.municao.a8+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a8 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a8 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a8 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a8 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a8+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event115 = obj.button116:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = 0;
                                                    local tipoDeAtaque = sheet.ataque.tipo.a8;
                                                    
                                                    if sheet.ataque.municao.a8+0 == 0 then
                                                            chat:enviarMensagem("[§B][§K4]!!!Essa arma está sem munição!!!"); 
                                                    end; 
                        
                                                    if sheet.ataque.municao.a8+0 >= 1 then
                                                            sheet.ataque.municao.a8 = (sheet.ataque.municao.a8+0)-1;
                                                    end; 
                                                    
                        
                                                    if tipoDeAtaque == "LB" then
                                                            parameter = sheet.pericia.lutarB;
                                                    elseif tipoDeAtaque == "L1" then
                                                            parameter = sheet.pericia.Lutar1;
                                                    elseif tipoDeAtaque == "L2" then
                                                            parameter = sheet.pericia.Lutar2;
                                                    elseif tipoDeAtaque == "L3" then
                                                            parameter = sheet.pericia.Lutar3;
                                                    elseif tipoDeAtaque == "Arc" then
                                                            parameter = sheet.pericia.arcos;
                                                    elseif tipoDeAtaque == "AP" then
                                                            parameter = sheet.pericia.armasP;
                                                    elseif tipoDeAtaque == "Lc" then
                                                            parameter = sheet.pericia.lancaC;
                                                    elseif tipoDeAtaque == "M" then
                                                            parameter = sheet.pericia.metralhadora;
                                                    elseif tipoDeAtaque == "P" then
                                                            parameter = sheet.pericia.pistolas;
                                                    elseif tipoDeAtaque == "RE" then
                                                            parameter = sheet.pericia.riflesE;
                                                    elseif tipoDeAtaque == "S" then
                                                            parameter = sheet.pericia.submetralhadoras;
                                                    elseif tipoDeAtaque == "A1" then
                                                            parameter = sheet.pericia.arma1;
                                                    elseif tipoDeAtaque == "A2" then
                                                            parameter = sheet.pericia.arma2;
                                                    elseif tipoDeAtaque == "A3" then
                                                            parameter = sheet.pericia.arma3;
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;
                                                        
                                                    chat:enviarMensagem("[§K11]" .. sheet.ataque.nome.a8 .. " |[§K3] Alcance: [§K1]" .. sheet.ataque.alcance.a8 .. 
                                                            "[§K3] | Munição Restante: [§K1]" .. sheet.ataque.municao.a8 .. " |[§K3] Quantidade de ataques: [§K1]" .. sheet.ataque.quantidade.a8 .. " |[§K3] Pericia: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a8+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end); 
                                                    minhaMesa.chat:rolarDados("1d100", "Vantagem/Desvantagem",
                                            function (rolado)
                        
                                                    if rolado.resultado >= sheet.ataque.defeito.a8+0 then
                                                            chat:enviarMensagem("[§B][§K4]Essa arma apresentou defeito!!!"); 
                                                    end; 
                        
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                            chat:enviarMensagem("/r ".. sheet.ataque.dano.a8 .. ":Dano"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
                        
                                            end);
        end, obj);

    obj._e_event116 = obj.button117:addEventListener("onClick",
        function (_)
            local minhaMesa = Firecast.getMesaDe(sheet);
                                                    local chat = minhaMesa.chat; 
                                                    local parameter = sheet.pericia.esquiva
                                                    chat:enviarMensagem("[§K3]Esquiva: [§B][§K1]" .. parameter);
                                                    minhaMesa.chat:rolarDados("1d100", "Rolagem",
                                            function (rolado)
                                                     
                                                    if rolado.resultado == 1 then
                                                            chat:enviarMensagem("[§B][§K4]Acerto Critico!"); 
                                                    elseif parameter/5 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Extremo!"); 
                                                    elseif parameter/2 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K8]Acerto Dificil!"); 
                                                    elseif parameter+0 >= rolado.resultado then
                                                            chat:enviarMensagem("[§B][§K9]Acerto Normal!"); 
                                                    elseif rolado.resultado >= 96 then
                                                            chat:enviarMensagem("[§B][§K4]Falha Critica!!!"); 
                                                    elseif rolado.resultado > parameter+0 then
                                                            chat:enviarMensagem("[§B][§K4]Falha!"); 
                                                    else
                                                            chat:enviarMensagem("[§B][§K4]Algo Errado não Está Certo!"); 
                                                    end;                                       
            
                                            end);
        end, obj);

    obj._e_event117 = obj.button118:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens:append();
        end, obj);

    obj._e_event118 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                              --]]                      
                              local node = self.rclListaDosItens.selectedNode; 
                                     self.boxDetalhesDoItem.node = node;                       
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event119 = obj.button119:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.boxDetalhesDoItem.node);
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.button110 ~= nil then self.button110:destroy(); self.button110 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.button115 ~= nil then self.button115:destroy(); self.button115 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.button106 ~= nil then self.button106:destroy(); self.button106 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button108 ~= nil then self.button108:destroy(); self.button108 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.button118 ~= nil then self.button118:destroy(); self.button118 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.button105 ~= nil then self.button105:destroy(); self.button105 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.button109 ~= nil then self.button109:destroy(); self.button109 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.button102 ~= nil then self.button102:destroy(); self.button102 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.button104 ~= nil then self.button104:destroy(); self.button104 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.button116 ~= nil then self.button116:destroy(); self.button116 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.button107 ~= nil then self.button107:destroy(); self.button107 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.button111 ~= nil then self.button111:destroy(); self.button111 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.button100 ~= nil then self.button100:destroy(); self.button100 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button112 ~= nil then self.button112:destroy(); self.button112 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button113 ~= nil then self.button113:destroy(); self.button113 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.button117 ~= nil then self.button117:destroy(); self.button117 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button119 ~= nil then self.button119:destroy(); self.button119 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.button103 ~= nil then self.button103:destroy(); self.button103 = nil; end;
        if self.button101 ~= nil then self.button101:destroy(); self.button101 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.button114 ~= nil then self.button114:destroy(); self.button114 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newCthulhuSheet7e_byHelldemos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_CthulhuSheet7e_byHelldemos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _CthulhuSheet7e_byHelldemos = {
    newEditor = newCthulhuSheet7e_byHelldemos, 
    new = newCthulhuSheet7e_byHelldemos, 
    name = "CthulhuSheet7e_byHelldemos", 
    dataType = "CthulhuSheet7e_byHelldemos", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha de Call of Cthulhu 7e", 
    description=""};

CthulhuSheet7e_byHelldemos = _CthulhuSheet7e_byHelldemos;
Firecast.registrarForm(_CthulhuSheet7e_byHelldemos);
Firecast.registrarDataType(_CthulhuSheet7e_byHelldemos);

return _CthulhuSheet7e_byHelldemos;
